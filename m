Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3FEF8A14D
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 08:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB81B10E1AB;
	Thu, 16 Apr 2026 08:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O9GTkmKO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF7610E1AB
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 08:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776329724; x=1807865724;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TLQ8KA9z8v9WW0AMxjUq2OQwPr0/u4OovV6fsEdolQE=;
 b=O9GTkmKOHH8+/4LrrONy1roTOIeZUq++MgNKYA+u47/oDbv2hUNnexQN
 zD9qL+a9a+muY0BArRiR6yR0ZWjxxLl+AoxtuYqV88/gsAK0dDFJeeZk7
 uoDQltYcmI4rQGPydeAdNVqJrGrSdCcK1l9SvBq0puMBXcLE4atH2bMnY
 UhEUL+DKpVgd3AuRX3u+uSBf9VVKe74hoFCZHPQqtSxakED5iLCkXQnm+
 k/KuZG/xsdbUg7Wdk7+DdKxSQnouc4yPONiECe+9GdblGXLPT1iwRHi1M
 JmAM5XafTdLmw6n+uunnuWpGhKCagBlTkKbfJNov8GOLvUKqydmMUKzbX A==;
X-CSE-ConnectionGUID: lUWgorxATyyh2Lp9VgDe4g==
X-CSE-MsgGUID: zqmq9aJZQgCAlGxrEND9HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="81205022"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="81205022"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 01:55:24 -0700
X-CSE-ConnectionGUID: IDnZN9U1QlqkbwYbH754/g==
X-CSE-MsgGUID: IJWLydJ9R/6q8WiEz5dq1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235055672"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.235])
 ([10.245.244.235])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 01:55:22 -0700
Message-ID: <f10e051c-781e-4f1e-9dc9-73b040a9ea6d@intel.com>
Date: Thu, 16 Apr 2026 09:55:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V7 02/10] gpu/buddy: Integrate lockdep for gpu buddy
 manager
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
References: <20260416074958.3722666-12-tejas.upadhyay@intel.com>
 <20260416074958.3722666-14-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260416074958.3722666-14-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 16/04/2026 08:49, Tejas Upadhyay wrote:
> Integrating lockdep into the gpu_buddy manager as standard practice for
> verifying that internal resources are correctly protected by their
> associated locks.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/buddy.c                  | 18 ++++++++++--
>   drivers/gpu/drm/drm_buddy.c          |  7 +++--
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  3 ++
>   include/linux/gpu_buddy.h            | 41 ++++++++++++++++++++++++++++
>   4 files changed, 65 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
> index 52686672e99f..53ff85ac2105 100644
> --- a/drivers/gpu/buddy.c
> +++ b/drivers/gpu/buddy.c
> @@ -437,6 +437,9 @@ int gpu_buddy_init(struct gpu_buddy *mm, u64 size, u64 chunk_size)
>   		root_count++;
>   	} while (size);
>   
> +#ifdef CONFIG_LOCKDEP
> +	mm->lock_dep_map = NULL;
> +#endif
>   	return 0;
>   
>   out_free_roots:
> @@ -464,6 +467,7 @@ void gpu_buddy_fini(struct gpu_buddy *mm)
>   	unsigned int order;
>   	int i;
>   
> +	gpu_buddy_driver_lock_held(mm);
>   	size = mm->size;
>   
>   	for (i = 0; i < mm->n_roots; ++i) {
> @@ -538,6 +542,7 @@ void gpu_buddy_reset_clear(struct gpu_buddy *mm, bool is_clear)
>   	unsigned int order;
>   	int i;
>   
> +	gpu_buddy_driver_lock_held(mm);
>   	size = mm->size;
>   	for (i = 0; i < mm->n_roots; ++i) {
>   		order = ilog2(size) - ilog2(mm->chunk_size);
> @@ -580,6 +585,7 @@ EXPORT_SYMBOL(gpu_buddy_reset_clear);
>   void gpu_buddy_free_block(struct gpu_buddy *mm,
>   			  struct gpu_buddy_block *block)
>   {
> +	gpu_buddy_driver_lock_held(mm);
>   	BUG_ON(!gpu_buddy_block_is_allocated(block));
>   	mm->avail += gpu_buddy_block_size(mm, block);
>   	if (gpu_buddy_block_is_clear(block))
> @@ -633,6 +639,7 @@ void gpu_buddy_free_list(struct gpu_buddy *mm,
>   {
>   	bool mark_clear = flags & GPU_BUDDY_CLEARED;
>   
> +	gpu_buddy_driver_lock_held(mm);
>   	__gpu_buddy_free_list(mm, objects, mark_clear, !mark_clear);
>   }
>   EXPORT_SYMBOL(gpu_buddy_free_list);
> @@ -1172,6 +1179,8 @@ int gpu_buddy_block_trim(struct gpu_buddy *mm,
>   	u64 new_start;
>   	int err;
>   
> +	gpu_buddy_driver_lock_held(mm);
> +
>   	if (!list_is_singular(blocks))
>   		return -EINVAL;
>   
> @@ -1287,6 +1296,8 @@ int gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
>   	unsigned long pages;
>   	int err;
>   
> +	gpu_buddy_driver_lock_held(mm);
> +
>   	if (size < mm->chunk_size)
>   		return -EINVAL;
>   
> @@ -1458,9 +1469,11 @@ EXPORT_SYMBOL(gpu_buddy_alloc_blocks);
>   void gpu_buddy_block_print(struct gpu_buddy *mm,
>   			   struct gpu_buddy_block *block)
>   {
> -	u64 start = gpu_buddy_block_offset(block);
> -	u64 size = gpu_buddy_block_size(mm, block);
> +	u64 start, size;
>   
> +	gpu_buddy_driver_lock_held(mm);

I don't think we want this one. The mm interaction is just for immutable 
state, and the block itself is essentially owned by the caller. Same 
reason why we don't want annotations for stuff like 
gpu_buddy_block_offset() etc.

> +	start = gpu_buddy_block_offset(block);
> +	size = gpu_buddy_block_size(mm, block);
>   	pr_info("%#018llx-%#018llx: %llu\n", start, start + size, size);
>   }
>   EXPORT_SYMBOL(gpu_buddy_block_print);
> @@ -1475,6 +1488,7 @@ void gpu_buddy_print(struct gpu_buddy *mm)
>   {
>   	int order;
>   
> +	gpu_buddy_driver_lock_held(mm);
>   	pr_info("chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB, clear_free: %lluMiB\n",
>   		mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20, mm->clear_avail >> 20);
>   
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 841f3de5f307..f4ad09b8a36e 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -25,9 +25,11 @@ void drm_buddy_block_print(struct gpu_buddy *mm,
>   			   struct gpu_buddy_block *block,
>   			   struct drm_printer *p)
>   {
> -	u64 start = gpu_buddy_block_offset(block);
> -	u64 size = gpu_buddy_block_size(mm, block);
> +	u64 start, size;
>   
> +	gpu_buddy_driver_lock_held(mm);
> +	start = gpu_buddy_block_offset(block);
> +	size = gpu_buddy_block_size(mm, block);

Same here.

>   	drm_printf(p, "%#018llx-%#018llx: %llu\n", start, start + size, size);
>   }
>   EXPORT_SYMBOL(drm_buddy_block_print);
> @@ -42,6 +44,7 @@ void drm_buddy_print(struct gpu_buddy *mm, struct drm_printer *p)
>   {
>   	int order;
>   
> +	gpu_buddy_driver_lock_held(mm);
>   	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB, clear_free: %lluMiB\n",
>   		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20, mm->clear_avail >> 20);
>   
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 01a9b92772f8..935e589dd4b0 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -293,7 +293,9 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>   
>   	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
>   
> +	mutex_lock(&mgr->lock);
>   	gpu_buddy_fini(&mgr->mm);
> +	mutex_unlock(&mgr->lock);

This shouldn't need a lock. Annotation for this one should also be dropped.

>   
>   	ttm_resource_manager_cleanup(&mgr->manager);
>   
> @@ -328,6 +330,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>   	if (err)
>   		return err;
>   
> +	gpu_buddy_driver_set_lock(&mgr->mm, &mgr->lock);
>   	ttm_set_driver_manager(&xe->ttm, mem_type, &mgr->manager);
>   	ttm_resource_manager_set_used(&mgr->manager, true);
>   
> diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
> index 5fa917ba5450..c174de80ad72 100644
> --- a/include/linux/gpu_buddy.h
> +++ b/include/linux/gpu_buddy.h
> @@ -154,6 +154,7 @@ struct gpu_buddy_block {
>    * @avail: Total free space currently available for allocation in bytes.
>    * @clear_avail: Free space available in the clear tree (zeroed memory) in bytes.
>    *               This is a subset of @avail.
> + * @lock_dep_map: Annotates gpu_buddy API with a driver provided lock.
>    */
>   struct gpu_buddy {
>   /* private: */
> @@ -179,8 +180,48 @@ struct gpu_buddy {
>   	u64 size;
>   	u64 avail;
>   	u64 clear_avail;
> +#ifdef CONFIG_LOCKDEP
> +	struct lockdep_map *lock_dep_map;
> +#endif
>   };
>   
> +#ifdef CONFIG_LOCKDEP
> +/**
> + * gpu_buddy_driver_set_lock() - Set the lock protecting accesses to GPU BUDDY
> + * @mm: Pointer to GPU buddy structure.
> + * @lock: the lock used to protect the gpu buddy. The locking primitive
> + * must contain a dep_map field.
> + *
> + * Call this to annotate gpu_buddy APIs which access/modify gpu_buddy manager
> + */
> +#define gpu_buddy_driver_set_lock(mm, lock) \
> +	do { \
> +		struct gpu_buddy *__mm = (mm); \
> +		if (!WARN(__mm->lock_dep_map, "GPU BUDDY MM lock should be set only once.")) \
> +			__mm->lock_dep_map = &(lock)->dep_map; \
> +	} while (0)
> +#else
> +#define gpu_buddy_driver_set_lock(mm, lock) do { (void)(mm); (void)(lock); } while (0)
> +#endif
> +
> +#ifdef CONFIG_LOCKDEP
> +/**
> + * gpu_buddy_driver_lock_held() - Assert GPU BUDDY manager lock is held
> + * @mm: Pointer to the GPU BUDDY structure.
> + *
> + * Ensure driver lock is held.
> + */
> +static inline void gpu_buddy_driver_lock_held(struct gpu_buddy *mm)
> +{
> +	if ((mm)->lock_dep_map)
> +		lockdep_assert(lock_is_held_type((mm)->lock_dep_map, 0));
> +}
> +#else
> +static inline gpu_buddy_driver_lock_held(struct gpu_buddy *mm)
> +{
> +}
> +#endif
> +
>   static inline u64
>   gpu_buddy_block_offset(const struct gpu_buddy_block *block)
>   {

