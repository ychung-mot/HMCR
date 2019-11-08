﻿using AutoMapper;
using Hmcr.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Hmcr.Data.Database.Entities;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace Hmcr.Data.Repositories.Base
{
    public interface IHmcrRepositoryBase<TDto, TEntity>
        where TDto : class
        where TEntity : class
    {
        void Add(TDto dto);
        void Update(long id, TDto dto);
        void Update(string id, TDto dto);
        void Delete(TDto dto);
        void Delete(Expression<Func<TEntity, bool>> where);
        TDto GetById(long id);
        TDto GetById(string id);
        IEnumerable<TDto> GetAll();
        IEnumerable<TDto> GetAll(Expression<Func<TEntity, bool>> where);
        Task<IEnumerable<TDto>> GetAllAsync();
        Task<IEnumerable<TDto>> GetAllAsync(Expression<Func<TEntity, bool>> where);
        Task<TDto> GetFirstOrDefaultAsync(Expression<Func<TEntity, bool>> where);
        PagedDto<TOutput> Page<TInput, TOutput>(IQueryable<TInput> list, int pageSize, int pageNumber, string orderBy);
    }

    public class HmcrRepositoryBase<TDto, TEntity> : IHmcrRepositoryBase<TDto, TEntity>
        where TDto : class
        where TEntity : class
    {
        #region Properties

        protected DbSet<TEntity> DbSet { get; private set; }

        protected AppDbContext DbContext { get; private set; }

        protected IMapper Mapper { get; private set; }

        #endregion

        public HmcrRepositoryBase(AppDbContext dbContext, IMapper mapper)
        {
            Mapper = mapper;
            DbContext = dbContext;
            DbSet = DbContext.Set<TEntity>();
        }

        #region Implementation
        public virtual void Add(TDto dto)
        {
            var result = Mapper.Map<TEntity>(dto);
            DbSet.Add(result);
        }

        public virtual void Update(long id, TDto dto)
        {
            var oldEntity = DbSet.Find(id);
            var newObject = Mapper.Map<TEntity>(dto);

            if (oldEntity != null)
            {
                DbContext.Entry(oldEntity).CurrentValues.SetValues(newObject);
                DbContext.Entry(oldEntity).State = EntityState.Modified;
            }
        }

        public virtual void Update(string id, TDto dto)
        {
            var oldEntity = DbSet.Find(id);
            var newObject = Mapper.Map<TEntity>(dto);

            if (oldEntity != null)
            {
                DbContext.Entry(oldEntity).CurrentValues.SetValues(newObject);
                DbContext.Entry(oldEntity).State = EntityState.Modified;
            }
        }

        public virtual void Delete(TDto dto)
        {
            var result = Mapper.Map<TEntity>(dto);
            DbSet.Remove(result);
        }

        public virtual void Delete(Expression<Func<TEntity, bool>> where)
        {
            IEnumerable<TEntity> objects = DbSet.Where<TEntity>(where).AsEnumerable();
            foreach (TEntity obj in objects)
                DbSet.Remove(obj);
        }

        public virtual TDto GetById(long id)
        {
            return Mapper.Map<TDto>(DbSet.Find(id));
        }

        public virtual TDto GetById(string id)
        {
            return Mapper.Map<TDto>(DbSet.Find(id));
        }

        public virtual IEnumerable<TDto> GetAll()
        {
            return Mapper.Map<IEnumerable<TDto>>(DbSet.ToList());
        }

        public virtual IEnumerable<TDto> GetAll(Expression<Func<TEntity, bool>> where)
        {
            return Mapper.Map<IEnumerable<TDto>>(DbSet.Where(where).ToList());
        }

        public virtual async Task<IEnumerable<TDto>> GetAllAsync()
        {
            return Mapper.Map<IEnumerable<TDto>>(await DbSet.ToListAsync());
        }

        public virtual async Task<IEnumerable<TDto>> GetAllAsync(Expression<Func<TEntity, bool>> where)
        {
            return Mapper.Map<IEnumerable<TDto>>(await DbSet.Where(where).ToListAsync());
        }

        public async Task<TDto> GetFirstOrDefaultAsync(Expression<Func<TEntity, bool>> where)
        {
            return Mapper.Map<TDto>(await DbSet.Where(where).FirstOrDefaultAsync<TEntity>());
        }

        public PagedDto<TOutput> Page<TInput, TOutput>(IQueryable<TInput> list, int pageSize, int pageNumber, string orderBy)
        {
            var totalRecords = list.Count();

            var pagedList = list.DynamicOrderBy(orderBy) as IQueryable<TInput>;

            if (pageSize > 0)
            {
                var skipRecordCount = (pageNumber - 1) * pageSize;
                pagedList = pagedList.Skip(skipRecordCount)
                    .Take(pageSize);
            }

            IEnumerable<TOutput> outputList;
            if (typeof(TOutput) == typeof(TInput))
                outputList = (IEnumerable<TOutput>)pagedList.AsEnumerable();
            else
                outputList = Mapper.Map<IEnumerable<TInput>, IEnumerable<TOutput>>(pagedList.AsEnumerable());

            var pagedDTO = new PagedDto<TOutput>
            {
                PageNumber = pageNumber,
                PageSize = pageSize,
                TotalCount = totalRecords,
                SourceList = outputList
            };

            return pagedDTO;
        }

        #endregion
    }
}