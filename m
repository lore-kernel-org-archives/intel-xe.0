Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D83C4332F
	for <intel-xe@archiver.kernel.org>; Sat,  4 Nov 2023 22:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D6410E0FF;
	Sat,  4 Nov 2023 22:48:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB0B10E0FF
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Nov 2023 22:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699138105; x=1730674105;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=sA7xymjQe8qCoXmF733Q2Y1qWe8uygRu4YZXQmWWlpY=;
 b=gVUSv6UdbsptSbOzmYPRkxqKlXaHb/rIS2JWSKo3xEdJJihg3uYQXIbI
 btuPbAsoWK9IGOC/J0NiAgE1boM5c0nrxVKxmVj2cua8AgNf5alWQ2JtI
 vE4WzlHUGnlZn++LGJsj8TBqTxiKi8sMedkCMjju8DAFoMEmdcKUVlh9J
 GfvKqyruUw+lt4qMHKMxCZi/LzKJ+zd+c1ckhfEXXI3Y3W93J14wBrlRi
 t5g1eYz/sDXmWkrdW0iDDeAusg7tRJIf4xdQek4hwSZhIqqztXVP6Iunn
 XvKzSWE9imTaJMZ/TwfFadCc6dZguMdGyCKdFplFnTovrZSpQcwl6jZK4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="379505062"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; d="scan'208";a="379505062"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2023 15:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="1093412063"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; d="scan'208";a="1093412063"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2023 15:48:22 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qzPRE-0004lQ-2H;
 Sat, 04 Nov 2023 22:48:20 +0000
Date: Sun, 5 Nov 2023 06:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
Message-ID: <202311050645.WvEUKJyQ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Intel-xe] [drm-xe:oak/drm-evictable-lru 10/11]
 drivers/gpu/drm/ttm/ttm_bo.c:765:13: error: initializing 'void *' with an
 expression of type 'const struct ttm_place *' discards qualifiers
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: llvm@lists.linux.dev, intel-xe@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git oak/drm-evictable-lru
head:   d1f59526925ae851c6abf77af8ae6f8c3cffeebd
commit: 9ef8c2b94a5e7ebe14e15e03c67628289fab5c20 [10/11] drm/ttm: Implement ttm memory evict functions
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231105/202311050645.WvEUKJyQ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311050645.WvEUKJyQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311050645.WvEUKJyQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/ttm/ttm_bo.c:626:21: warning: variable 'bdev' set but not used [-Wunused-but-set-variable]
           struct ttm_device *bdev;
                              ^
>> drivers/gpu/drm/ttm/ttm_bo.c:620:6: warning: no previous prototype for function 'ttm_mem_evict_allowable' [-Wmissing-prototypes]
   bool ttm_mem_evict_allowable(struct drm_lru_entity *lru_entity,
        ^
   drivers/gpu/drm/ttm/ttm_bo.c:620:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool ttm_mem_evict_allowable(struct drm_lru_entity *lru_entity,
   ^
   static 
>> drivers/gpu/drm/ttm/ttm_bo.c:668:5: warning: no previous prototype for function 'ttm_mem_evict_busy_entity' [-Wmissing-prototypes]
   int ttm_mem_evict_busy_entity(struct drm_lru_entity *lru_entity,
       ^
   drivers/gpu/drm/ttm/ttm_bo.c:668:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ttm_mem_evict_busy_entity(struct drm_lru_entity *lru_entity,
   ^
   static 
>> drivers/gpu/drm/ttm/ttm_bo.c:715:5: warning: no previous prototype for function 'ttm_mem_evict_entity' [-Wmissing-prototypes]
   int ttm_mem_evict_entity(struct drm_lru_entity *lru_entity,
       ^
   drivers/gpu/drm/ttm/ttm_bo.c:715:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ttm_mem_evict_entity(struct drm_lru_entity *lru_entity,
   ^
   static 
>> drivers/gpu/drm/ttm/ttm_bo.c:765:13: error: initializing 'void *' with an expression of type 'const struct ttm_place *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                           .data1 = place,
                                    ^~~~~
   4 warnings and 1 error generated.


vim +765 drivers/gpu/drm/ttm/ttm_bo.c

   595	
   596	/**
   597	 * ttm_mem_evict_allowable
   598	 *
   599	 * @lru_entity: The struct ttm_resource::lru_entity when this resource is
   600	 * added to drm lru list.
   601	 * @place: The preferred ttm placement where we want to evict memory for
   602	 * more memory space. If the current ttm_resource doesn't match the preferred
   603	 * placement, then there is no need to evict the current resource.
   604	 * @ctx: ttm operation context
   605	 * @ticket: dma reservation's context used to lock resource
   606	 * @busy: used to return whether the current resource is busy (i.e., locked
   607	 * by other clients)
   608	 * @locked: used to return whether this resource is locked during this check,
   609	 * i.e., successfully trylocked bo's dma reservation object
   610	 *
   611	 * Check whether we are allowed to evict a memory resource. Return true if we
   612	 * are allowed to evict resource; otherwise false.
   613	 *
   614	 * When this function returns true, a resource reference counter (bo's reference)
   615	 * is hold. This reference counter need to be released after evict operation later
   616	 * on.
   617	 *
   618	 * This function should be called with lru_lock hold.
   619	 */
 > 620	bool ttm_mem_evict_allowable(struct drm_lru_entity *lru_entity,
   621				const struct drm_lru_evict_ctx *lru_evict_ctx,
   622				bool *busy, bool *locked)
   623	{
   624		struct ttm_resource *res;
   625		struct ttm_buffer_object *bo = NULL;
   626		struct ttm_device *bdev;
   627		const struct ttm_place *place;
   628		struct ttm_operation_ctx *ctx;
   629		struct ww_acquire_ctx *ticket;
   630		struct ttm_mem_evict_ctx *evict_ctx;
   631	
   632		evict_ctx = (struct ttm_mem_evict_ctx *)lru_evict_ctx;
   633		place = evict_ctx->place;
   634		ctx = evict_ctx->ctx;
   635		ticket = evict_ctx->ticket;
   636	
   637		res = container_of(lru_entity, struct ttm_resource, lru_entity);
   638		bo = res->bo;
   639		bdev = bo->bdev;
   640	
   641		if (!ttm_bo_evict_swapout_allowable(bo, ctx, place, locked, busy)) {
   642			if (busy && ticket != dma_resv_locking_ctx(bo->base.resv))
   643				*busy = true;
   644	
   645			return false;
   646		}
   647	
   648		if (ttm_bo_get_unless_zero(bo))
   649			return true;
   650	
   651		if (locked)
   652			dma_resv_unlock(bo->base.resv);
   653	
   654		return false;
   655	}
   656	
   657	/**
   658	 * ttm_mem_evict_busy_entity
   659	 *
   660	 * @lru_entity: The struct ttm_resource::lru_entity when this resource is
   661	 * added to drm lru list.
   662	 * @ctx: ttm operation context
   663	 * @ticket: dma reservation's context used to lock resource
   664	 *
   665	 * Evict a busy memory resource.
   666	 * This function should be called with lru_lock hold.
   667	 */
 > 668	int ttm_mem_evict_busy_entity(struct drm_lru_entity *lru_entity,
   669				const struct drm_lru_evict_ctx *lru_evict_ctx)
   670	{
   671		struct ttm_resource *res;
   672		struct ttm_buffer_object *bo = NULL;
   673		struct ttm_device *bdev;
   674		int ret;
   675		struct ttm_operation_ctx *ctx;
   676		struct ww_acquire_ctx *ticket;
   677		struct ttm_mem_evict_ctx *evict_ctx;
   678	
   679		evict_ctx = (struct ttm_mem_evict_ctx *)lru_evict_ctx;
   680		ctx = evict_ctx->ctx;
   681		ticket = evict_ctx->ticket;
   682	
   683		res = container_of(lru_entity, struct ttm_resource, lru_entity);
   684		bo = res->bo;
   685		bdev = bo->bdev;
   686	
   687		if (bo && !ttm_bo_get_unless_zero(bo))
   688			bo = NULL;
   689		spin_unlock(bdev->lru_lock);
   690		ret = ttm_mem_evict_wait_busy(bo, ctx, ticket);
   691		/* FIXME: this is code copied originally from ttm_mem_evict_first.
   692		 * 1) Shouldn't we ttm_bo_evict this bo also? Otherwise how can we
   693		 * make any memory space?
   694		 * 2) We also need to check whether this busy entity is in the same
   695		 * ttm_place as specified in lru_evict_ctx::place; if not, there is
   696		 * no help to wait this busy entity.
   697	     */
   698		if (bo)
   699			ttm_bo_put(bo);
   700	
   701		return ret;
   702	}
   703	
   704	/**
   705	 * @lru_entity: The struct ttm_resource::lru_entity when this resource is
   706	 * added to drm lru list.
   707	 * @ctx: ttm operation context
   708	 * @locked: whether this resource is dma-reserved (if reserved, we need to
   709	 * unreserve it in this function)
   710	 *
   711	 * Evict a memory resource corresponding to a lru_entity. This should be
   712	 * called holding lru_lock
   713	 *
   714	 */
 > 715	int ttm_mem_evict_entity(struct drm_lru_entity *lru_entity,
   716				const struct drm_lru_evict_ctx *lru_evict_ctx, bool locked)
   717	{
   718		struct ttm_resource *res;
   719		struct ttm_buffer_object *bo = NULL;
   720		struct ttm_device *bdev;
   721		int ret;
   722		struct ttm_operation_ctx *ctx;
   723		struct ttm_mem_evict_ctx *evict_ctx;
   724	
   725		evict_ctx = (struct ttm_mem_evict_ctx *)lru_evict_ctx;
   726		ctx = evict_ctx->ctx;
   727	
   728		res = container_of(lru_entity, struct ttm_resource, lru_entity);
   729		bo = res->bo;
   730		bdev = bo->bdev;
   731	
   732		if (bo->deleted) {
   733			ret = ttm_bo_cleanup_refs(bo, ctx->interruptible,
   734						  ctx->no_wait_gpu, locked);
   735			ttm_bo_put(bo);
   736			return ret;
   737		}
   738	
   739		spin_unlock(bdev->lru_lock);
   740	
   741		ret = ttm_bo_evict(bo, ctx);
   742		if (locked)
   743			ttm_bo_unreserve(bo);
   744		else
   745			ttm_bo_move_to_lru_tail_unlocked(bo);
   746	
   747		ttm_bo_put(bo);
   748		return ret;
   749	}
   750	
   751	struct drm_lru_evict_func ttm_evict_func = {
   752		.evict_allowable = ttm_mem_evict_allowable,
   753		.evict_busy_entity = ttm_mem_evict_busy_entity,
   754		.evict_entity = ttm_mem_evict_entity
   755	};
   756	EXPORT_SYMBOL(ttm_evict_func);
   757	
   758	int ttm_mem_evict_first(struct ttm_device *bdev,
   759				struct ttm_resource_manager *man,
   760				const struct ttm_place *place,
   761				struct ttm_operation_ctx *ctx,
   762				struct ww_acquire_ctx *ticket)
   763	{
   764		struct drm_lru_evict_ctx evict_ctx = {
 > 765				.data1 = place,
   766				.data2 = ctx,
   767				.data3 = ticket
   768		};
   769	
   770		return drm_lru_evict_first(man->lru_mgr, &evict_ctx);
   771	}
   772	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
