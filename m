Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C9AC77B75
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 01:37:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C356B10E44F;
	Wed, 10 May 2023 01:37:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E085210E44F
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 01:37:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA03F60AEA;
 Wed, 10 May 2023 01:37:36 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id F2D18C433D2;
 Wed, 10 May 2023 01:37:33 +0000 (UTC)
Date: Tue, 9 May 2023 21:37:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFr1USkgEp/ffBqP@rdvivi-mobl4>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-9-matthew.brost@intel.com>
 <ZFlsAMZ7Zfwf97K/@intel.com>
 <ZFrEtWAm5jZwcH0t@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFrEtWAm5jZwcH0t@DUT025-TGLU.fm.intel.com>
Subject: Re: [Intel-xe] [PATCH v2 08/31] drm/xe: VM LRU bulk move
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 09, 2023 at 10:09:57PM +0000, Matthew Brost wrote:
> On Mon, May 08, 2023 at 05:39:12PM -0400, Rodrigo Vivi wrote:
> > On Mon, May 01, 2023 at 05:17:04PM -0700, Matthew Brost wrote:
> > > Use the TTM LRU bulk move for BOs tied to a VM. Update the bulk moves
> > > LRU position on every exec.
> > >
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c       | 32 ++++++++++++++++++++++++++++----
> > >  drivers/gpu/drm/xe/xe_bo.h       |  4 ++--
> > >  drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
> > >  drivers/gpu/drm/xe/xe_exec.c     |  6 ++++++
> > >  drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
> > >  5 files changed, 40 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 3ab404e33fae..da99ee53e7d7 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -985,6 +985,23 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
> > >  	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
> > >  }
> > >
> > > +static void xe_gem_object_close(struct drm_gem_object *obj,
> > > +				struct drm_file *file_priv)
> > > +{
> > > +	struct xe_bo *bo = gem_to_xe_bo(obj);
> > > +
> > > +	if (bo->vm && !xe_vm_no_dma_fences(bo->vm)) {
> > > +		struct ww_acquire_ctx ww;
> > > +
> > > +		XE_BUG_ON(!xe_bo_is_user(bo));
> >
> > We need to really stop using BUG_ON and move towards the usage of more WARNs.
> >
>
> If that is the direction, sure I'll change this but personally I BUG_ON
> for things that should be impossible with a correct KMD.

This is the current trend and official Kernel recommendation. Part of
checkpatch:

# do not use BUG() or variants
                if ($line =~ /\b(?!AA_|BUILD_|DCCP_|IDA_|KVM_|RWLOCK_|snd_|SPIN_)(?:[a-zA-Z_]*_)?BUG(?:_ON)?(?:_[A-Z_]+)?\s*\(/) {
                        my $msg_level = \&WARN;
                        $msg_level = \&CHK if ($file);
                        &{$msg_level}("AVOID_BUG",
                                      "Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants\n" . $herecurr);
                }

>
> Matt
>
> > But the rest of the patch looks good to me... I just believe it would be
> > good to get Thomas' review here.
> >
> > > +
> > > +		xe_bo_lock(bo, &ww, 0, false);
> > > +		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> > > +		xe_bo_unlock(bo, &ww);
> > > +	}
> > > +}
> > > +
> > > +
> > >  static bool should_migrate_to_system(struct xe_bo *bo)
> > >  {
> > >  	struct xe_device *xe = xe_bo_device(bo);
> > > @@ -1040,6 +1057,7 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
> > >
> > >  static const struct drm_gem_object_funcs xe_gem_object_funcs = {
> > >  	.free = xe_gem_object_free,
> > > +	.close = xe_gem_object_close,
> > >  	.mmap = drm_gem_ttm_mmap,
> > >  	.export = xe_gem_prime_export,
> > >  	.vm_ops = &xe_gem_vm_ops,
> > > @@ -1081,8 +1099,8 @@ void xe_bo_free(struct xe_bo *bo)
> > >
> > >  struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > >  				    struct xe_gt *gt, struct dma_resv *resv,
> > > -				    size_t size, enum ttm_bo_type type,
> > > -				    u32 flags)
> > > +				    struct ttm_lru_bulk_move *bulk, size_t size,
> > > +				    enum ttm_bo_type type, u32 flags)
> > >  {
> > >  	struct ttm_operation_ctx ctx = {
> > >  		.interruptible = true,
> > > @@ -1149,7 +1167,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > >  		return ERR_PTR(err);
> > >
> > >  	bo->created = true;
> > > -	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > > +	if (bulk)
> > > +		ttm_bo_set_bulk_move(&bo->ttm, bulk);
> > > +	else
> > > +		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > >
> > >  	return bo;
> > >  }
> > > @@ -1219,7 +1240,10 @@ xe_bo_create_locked_range(struct xe_device *xe,
> > >  		}
> > >  	}
> > >
> > > -	bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL, size,
> > > +	bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL,
> > > +				   vm && !xe_vm_no_dma_fences(vm) &&
> > > +				   flags & XE_BO_CREATE_USER_BIT ?
> > > +				   &vm->lru_bulk_move : NULL, size,
> > >  				   type, flags);
> > >  	if (IS_ERR(bo))
> > >  		return bo;
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > > index 8354d05ccdf3..25457b3c757b 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > @@ -81,8 +81,8 @@ void xe_bo_free(struct xe_bo *bo);
> > >
> > >  struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > >  				    struct xe_gt *gt, struct dma_resv *resv,
> > > -				    size_t size, enum ttm_bo_type type,
> > > -				    u32 flags);
> > > +				    struct ttm_lru_bulk_move *bulk, size_t size,
> > > +				    enum ttm_bo_type type, u32 flags);
> > >  struct xe_bo *
> > >  xe_bo_create_locked_range(struct xe_device *xe,
> > >  			  struct xe_gt *gt, struct xe_vm *vm,
> > > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > index 9b252cc782b7..975dee1f770f 100644
> > > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > @@ -199,7 +199,7 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
> > >  	int ret;
> > >
> > >  	dma_resv_lock(resv, NULL);
> > > -	bo = __xe_bo_create_locked(xe, storage, NULL, resv, dma_buf->size,
> > > +	bo = __xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
> > >  				   ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
> > >  	if (IS_ERR(bo)) {
> > >  		ret = PTR_ERR(bo);
> > > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > > index 44ea9bcd0066..21a9c2fddf86 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > @@ -374,6 +374,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >  	xe_sched_job_push(job);
> > >  	xe_vm_reactivate_rebind(vm);
> > >
> > > +	if (!err && !xe_vm_no_dma_fences(vm)) {
> > > +		spin_lock(&xe->ttm.lru_lock);
> > > +		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> > > +		spin_unlock(&xe->ttm.lru_lock);
> > > +	}
> > > +
> > >  err_repin:
> > >  	if (!xe_vm_no_dma_fences(vm))
> > >  		up_read(&vm->userptr.notifier_lock);
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index fada7896867f..d3e99f22510d 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -164,6 +164,9 @@ struct xe_vm {
> > >  	/** Protects @rebind_list and the page-table structures */
> > >  	struct dma_resv resv;
> > >
> > > +	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
> > > +	struct ttm_lru_bulk_move lru_bulk_move;
> > > +
> > >  	u64 size;
> > >  	struct rb_root vmas;
> > >
> > > --
> > > 2.34.1
> > >
