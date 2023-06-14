Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52505EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 11:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC1510E0E7;
	Wed, 14 Jun 2023 11:50:38 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D68310E0E7
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 11:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686743415; x=1718279415;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=RUdR0SVTMCHebGUFGG6zygyOnoAw4JqNL5kBu8C3wp0=;
 b=gzs3XHY2WuqhbalzJHff1KJuP0xpuIrBkFOUkFqcqSUsG8YkPX6xuP18
 uJCWpSHmMnokeLALyz4mXEmaIgNuJ8mdZIsL/hy3F9jKAvhMfXqzBpc6Q
 AtypXEvXIg5hhi752U5N0TKmx9V0byGEUtN7mBVuHiKRO0JufgGNIF6ZD
 6hBYwndXH7HhiOatcXjVucypoPyjKYryQp10Gv+gdIxKOzdoJnnS3wrjK
 8suz1q5RHo8XjNw34ra2OVH6CwzcV63A8i+f2/mCHQl7vD6yUgqo/iUtM
 sTMJe2wrEVPQ3/yQU+qOkYTJ8gtDyIH/0aBZeN9m7GqIk6XB6tAwjijbQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="444961353"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="444961353"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 04:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="824787260"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="824787260"
Received: from aryba-mobl.ger.corp.intel.com (HELO [10.249.254.20])
 ([10.249.254.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 04:50:13 -0700
Message-ID: <b4615a33-6150-dccb-ecfb-0b5ab36a39d9@linux.intel.com>
Date: Wed, 14 Jun 2023 13:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230607160334.4111289-1-matthew.brost@intel.com>
 <20230607160334.4111289-9-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230607160334.4111289-9-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v3 8/8] drm/xe: VM LRU bulk move
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


On 6/7/23 18:03, Matthew Brost wrote:
> Use the TTM LRU bulk move for BOs tied to a VM. Update the bulk moves
> LRU position on every exec.
>
> v2: Bulk move for compute VMs, use WARN rather than BUG
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c       | 32 ++++++++++++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_bo.h       |  4 ++--
>   drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
>   drivers/gpu/drm/xe/xe_exec.c     |  6 ++++++
>   drivers/gpu/drm/xe/xe_vm.c       |  4 ++++
>   drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
>   6 files changed, 44 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index b94a80a32d86..c996a36e11e9 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -992,6 +992,23 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
>   	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
>   }
>   
> +static void xe_gem_object_close(struct drm_gem_object *obj,
> +				struct drm_file *file_priv)
> +{
> +	struct xe_bo *bo = gem_to_xe_bo(obj);
> +
> +	if (bo->vm && !xe_vm_in_fault_mode(bo->vm)) {
> +		struct ww_acquire_ctx ww;
> +
> +		XE_WARN_ON(!xe_bo_is_user(bo));
> +
> +		xe_bo_lock(bo, &ww, 0, false);
> +		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> +		xe_bo_unlock(bo, &ww);
> +	}
> +}
> +
> +
>   static bool should_migrate_to_system(struct xe_bo *bo)
>   {
>   	struct xe_device *xe = xe_bo_device(bo);
> @@ -1047,6 +1064,7 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
>   
>   static const struct drm_gem_object_funcs xe_gem_object_funcs = {
>   	.free = xe_gem_object_free,
> +	.close = xe_gem_object_close,
>   	.mmap = drm_gem_ttm_mmap,
>   	.export = xe_gem_prime_export,
>   	.vm_ops = &xe_gem_vm_ops,
> @@ -1088,8 +1106,8 @@ void xe_bo_free(struct xe_bo *bo)
>   
>   struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>   				    struct xe_tile *tile, struct dma_resv *resv,
> -				    size_t size, enum ttm_bo_type type,
> -				    u32 flags)
> +				    struct ttm_lru_bulk_move *bulk, size_t size,
> +				    enum ttm_bo_type type, u32 flags)
>   {
>   	struct ttm_operation_ctx ctx = {
>   		.interruptible = true,
> @@ -1156,7 +1174,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>   		return ERR_PTR(err);
>   
>   	bo->created = true;
> -	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> +	if (bulk)
> +		ttm_bo_set_bulk_move(&bo->ttm, bulk);
> +	else
> +		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
>   
>   	return bo;
>   }
> @@ -1226,7 +1247,10 @@ xe_bo_create_locked_range(struct xe_device *xe,
>   		}
>   	}
>   
> -	bo = __xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL, size,
> +	bo = __xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
> +				   vm && !xe_vm_in_fault_mode(vm) &&
> +				   flags & XE_BO_CREATE_USER_BIT ?
> +				   &vm->lru_bulk_move : NULL, size,
>   				   type, flags);
>   	if (IS_ERR(bo))
>   		return bo;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 29eb7474f018..98bea6a26347 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -82,8 +82,8 @@ void xe_bo_free(struct xe_bo *bo);
>   
>   struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>   				    struct xe_tile *tile, struct dma_resv *resv,
> -				    size_t size, enum ttm_bo_type type,
> -				    u32 flags);
> +				    struct ttm_lru_bulk_move *bulk, size_t size,
> +				    enum ttm_bo_type type, u32 flags);
>   struct xe_bo *
>   xe_bo_create_locked_range(struct xe_device *xe,
>   			  struct xe_tile *tile, struct xe_vm *vm,
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 9b252cc782b7..975dee1f770f 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -199,7 +199,7 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
>   	int ret;
>   
>   	dma_resv_lock(resv, NULL);
> -	bo = __xe_bo_create_locked(xe, storage, NULL, resv, dma_buf->size,
> +	bo = __xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
>   				   ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
>   	if (IS_ERR(bo)) {
>   		ret = PTR_ERR(bo);
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 9e9523939de8..88d2ceaa7316 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -397,6 +397,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	xe_sched_job_push(job);
>   	xe_vm_reactivate_rebind(vm);
>   
> +	if (!err && !xe_vm_no_dma_fences(vm)) {
> +		spin_lock(&xe->ttm.lru_lock);
> +		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> +		spin_unlock(&xe->ttm.lru_lock);
> +	}
> +
>   err_repin:
>   	if (!xe_vm_no_dma_fences(vm))
>   		up_read(&vm->userptr.notifier_lock);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2780f350ed33..d03c628d04b5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -632,6 +632,10 @@ static void preempt_rebind_work_func(struct work_struct *w)
>   
>   #undef retry_required
>   
> +	spin_lock(&vm->xe->ttm.lru_lock);
> +	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> +	spin_unlock(&vm->xe->ttm.lru_lock);
> +
>   	/* Point of no return. */
>   	arm_preempt_fences(vm, &preempt_fences);
>   	resume_and_reinstall_preempt_fences(vm);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 76af6ac0fa84..fe715bd1a20d 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -164,6 +164,9 @@ struct xe_vm {
>   	/** Protects @rebind_list and the page-table structures */
>   	struct dma_resv resv;
>   
> +	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
> +	struct ttm_lru_bulk_move lru_bulk_move;
> +
>   	u64 size;
>   	struct rb_root vmas;
>   
