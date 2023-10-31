Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0C1C4167D
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 06:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A7410E085;
	Tue, 31 Oct 2023 06:13:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCA910E085
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 06:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698732832; x=1730268832;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wBBqWn0UvUUIbqT2/n8aG3agoPKwJLfk+DU0Q9s7XE8=;
 b=knx99E0L3pTGt7uC5nAKU5thknXf1JBvWE2GVQNDgIK5bdM9Oq+JGjpw
 NuPm4AREs3FLPLAVQout7rZi0DLDYORz4Y9iidiydULRg6jGu4lOBg7a5
 PsXFuCPk9A95jgamrPzv/dZyRxyL4bHCcdSssQKBV+GBn/hM1NKSOIOk8
 XNA6+38KoqCOL6LFNpVoIBqQWVD9QfuH9l2ajTr651ZejpLZZke5i0G7p
 02jmAJtJTOW15KChOXvx22v4A68GuZnqCsyX3gHTFk3Jh05nx38a7uJni
 Cau5qoh34mj4MFqYdlWhcM9YYgA64zlBFXI/mPQ1O8rqzAn5qLYLQB8I0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="368431531"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="368431531"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 23:13:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="764143473"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="764143473"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmsmga007.fm.intel.com with SMTP; 30 Oct 2023 23:13:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 31 Oct 2023 08:13:47 +0200
Date: Tue, 31 Oct 2023 08:13:47 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dani Liberman <dliberman@habana.ai>
Message-ID: <ZUCbG8nOWUZ0e1w3@intel.com>
References: <20231030193850.560629-1-dliberman@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231030193850.560629-1-dliberman@habana.ai>
X-Patchwork-Hint: comment
Subject: Re: [Intel-xe] [PATCH] drm/xe: use variable instead of multiple
 function calls
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Oct 30, 2023 at 09:38:50PM +0200, Dani Liberman wrote:
> Also changed to positive logic which is more readable.

Please write proper commit messages.

> 
> Signed-off-by: Dani Liberman <dliberman@habana.ai>
> ---
>  drivers/gpu/drm/xe/xe_exec.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 28e84a0bbeb0..2de6c2c05078 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -145,7 +145,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	struct xe_sched_job *job;
>  	struct dma_fence *rebind_fence;
>  	struct xe_vm *vm;
> -	bool write_locked;
> +	bool write_locked, vm_with_dma_fences;
>  	ktime_t end = 0;
>  	int err = 0;
>  
> @@ -196,8 +196,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		}
>  	}
>  
> +	vm_with_dma_fences = !xe_vm_no_dma_fences(vm);
>  retry:
> -	if (!xe_vm_no_dma_fences(vm) && xe_vm_userptr_check_repin(vm)) {
> +	if (vm_with_dma_fences && xe_vm_userptr_check_repin(vm)) {
>  		err = down_write_killable(&vm->lock);
>  		write_locked = true;
>  	} else {
> @@ -279,7 +280,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	}
>  
>  	/* Wait behind munmap style rebinds */
> -	if (!xe_vm_no_dma_fences(vm)) {
> +	if (vm_with_dma_fences) {
>  		err = drm_sched_job_add_resv_dependencies(&job->drm,
>  							  &vm->resv,
>  							  DMA_RESV_USAGE_KERNEL);
> @@ -292,7 +293,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (err)
>  		goto err_put_job;
>  
> -	if (!xe_vm_no_dma_fences(vm)) {
> +	if (vm_with_dma_fences) {
>  		err = down_read_interruptible(&vm->userptr.notifier_lock);
>  		if (err)
>  			goto err_put_job;
> @@ -307,7 +308,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	 * the job and let the DRM scheduler / backend clean up the job.
>  	 */
>  	xe_sched_job_arm(job);
> -	if (!xe_vm_no_dma_fences(vm)) {
> +	if (vm_with_dma_fences) {
>  		/* Block userptr invalidations / BO eviction */
>  		dma_resv_add_fence(&vm->resv,
>  				   &job->drm.s_fence->finished,
> @@ -330,14 +331,14 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	xe_sched_job_push(job);
>  	xe_vm_reactivate_rebind(vm);
>  
> -	if (!err && !xe_vm_no_dma_fences(vm)) {
> +	if (!err && vm_with_dma_fences) {
>  		spin_lock(&xe->ttm.lru_lock);
>  		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
>  		spin_unlock(&xe->ttm.lru_lock);
>  	}
>  
>  err_repin:
> -	if (!xe_vm_no_dma_fences(vm))
> +	if (vm_with_dma_fences)
>  		up_read(&vm->userptr.notifier_lock);
>  err_put_job:
>  	if (err)
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
