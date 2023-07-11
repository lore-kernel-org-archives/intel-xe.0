Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4A6EB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 13:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E847910E392;
	Tue, 11 Jul 2023 13:40:41 +0000 (UTC)
X-Greylist: delayed 797 seconds by postgrey-1.36 at gabe;
 Tue, 11 Jul 2023 13:40:38 UTC
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C163910E392
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jul 2023 13:40:38 +0000 (UTC)
Message-ID: <bf91ed1d-dd49-1500-69f3-32d24a343db1@linux.intel.com>
Date: Tue, 11 Jul 2023 15:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230630175804.1096370-1-matthew.brost@intel.com>
 <20230630175804.1096370-2-matthew.brost@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230630175804.1096370-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v4 1/9] drm/xe: Ban a VM if rebind worker
 hits an error
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

Hey,

Just a nitpick, but ECANCELED seems to mean

"An asynchronous operation was canceled before it completed."

Could we still use -EIO instead?

On 2023-06-30 19:57, Matthew Brost wrote:
> We cannot recover a VM if a rebind worker hits an error, ban the VM if
> happens to ensure we do not attempt to place this VM on the hardware
> again.
>
> A follow up will inform the user if this happens.
>
> v2: Return -ECANCELED in exec VM closed or banned, check for closed or
> banned within VM lock.
> v3: Fix lockdep splat by looking engine outside of vm->lock
> v4: Fix error path when engine lookup fails
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_engine.c     | 13 +++++
>   drivers/gpu/drm/xe/xe_exec.c       |  6 +-
>   drivers/gpu/drm/xe/xe_trace.h      |  5 ++
>   drivers/gpu/drm/xe/xe_vm.c         | 92 ++++++++++++++++++------------
>   drivers/gpu/drm/xe/xe_vm.h         | 11 ++++
>   drivers/gpu/drm/xe/xe_vm_madvise.c |  2 +-
>   drivers/gpu/drm/xe/xe_vm_types.h   |  5 +-
>   7 files changed, 92 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 6e6b2913f766..ada2986c33a2 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -597,10 +597,23 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>   		if (XE_IOCTL_ERR(xe, !vm))
>   			return -ENOENT;
>   
> +		err = down_read_interruptible(&vm->lock);
> +		if (err) {
> +			xe_vm_put(vm);
> +			return err;
> +		}
> +
> +		if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
> +			up_read(&vm->lock);
> +			xe_vm_put(vm);
> +			return -ENOENT;
> +		}

We're returning -ENOENT if !vm is true, I think this should be the case 
for vm_is_closed too.

For banned, we should probably return ECANCELED to be consistent with 
the other callers.

> +
>   		e = xe_engine_create(xe, vm, logical_mask,
>   				     args->width, hwe,
>   				     xe_vm_no_dma_fences(vm) ? 0 :
>   				     ENGINE_FLAG_PERSISTENT);
> +		up_read(&vm->lock);
>   		xe_vm_put(vm);
>   		if (IS_ERR(e))
>   			return PTR_ERR(e);

.


> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index c52edff9a358..bdf00e59e7a4 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -297,9 +297,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	if (err)
>   		goto err_unlock_list;
>   
> -	if (xe_vm_is_closed(engine->vm)) {
> -		drm_warn(&xe->drm, "Trying to schedule after vm is closed\n");
> -		err = -EIO;
> +	if (xe_vm_is_closed_or_banned(engine->vm)) {
> +		drm_warn(&xe->drm, "Trying to schedule after vm is closed or banned\n");
> +		err = -ECANCELED;
>   		goto err_engine_end;
>   	}

Same here..

Because of this, I don't know if in the current form, a 
is_closed_or_banned adds much compared to checking separately.

Otherwise looks good. Hoping for a new revision soon. :)


