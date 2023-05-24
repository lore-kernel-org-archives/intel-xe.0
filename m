Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFC8C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 19:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739DD10E605;
	Wed, 24 May 2023 19:30:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF02410E60B
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 19:30:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E08161993;
 Wed, 24 May 2023 19:30:50 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 57571C433D2;
 Wed, 24 May 2023 19:30:47 +0000 (UTC)
Date: Wed, 24 May 2023 15:30:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZG5l5IVjdY51dJPK@rdvivi-mobl4>
References: <20230524175701.320653-1-matthew.auld@intel.com>
 <20230524175701.320653-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230524175701.320653-7-matthew.auld@intel.com>
Subject: Re: [Intel-xe] [PATCH v10 7/9] drm/xe/vm: tidy up xe_runtime_pm
 usage
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

On Wed, May 24, 2023 at 06:56:59PM +0100, Matthew Auld wrote:
> The xe_device_mem_access_get() should be all that's needed here and
> should now work as expected, without any strange races. In theory should
> be no functional changes here.
> 
> Reported-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a0306526b269..8d14ee7bf70f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1145,11 +1145,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  	INIT_LIST_HEAD(&vm->extobj.list);
>  
> -	if (!(flags & XE_VM_FLAG_MIGRATION)) {
> -		/* We need to immeditatelly exit from any D3 state */
> -		xe_pm_runtime_get(xe);
> +	if (!(flags & XE_VM_FLAG_MIGRATION))
>  		xe_device_mem_access_get(xe);
> -	}
>  
>  	err = dma_resv_lock_interruptible(&vm->resv, NULL);
>  	if (err)
> @@ -1263,10 +1260,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  err_put:
>  	dma_resv_fini(&vm->resv);
>  	kfree(vm);
> -	if (!(flags & XE_VM_FLAG_MIGRATION)) {
> +	if (!(flags & XE_VM_FLAG_MIGRATION))
>  		xe_device_mem_access_put(xe);
> -		xe_pm_runtime_put(xe);
> -	}
>  	return ERR_PTR(err);
>  }
>  
> @@ -1419,7 +1414,6 @@ static void vm_destroy_work_func(struct work_struct *w)
>  
>  	if (!(vm->flags & XE_VM_FLAG_MIGRATION)) {
>  		xe_device_mem_access_put(xe);
> -		xe_pm_runtime_put(xe);
>  
>  		if (xe->info.has_asid) {
>  			mutex_lock(&xe->usm.lock);
> -- 
> 2.40.1
> 
