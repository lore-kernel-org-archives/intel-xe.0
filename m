Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A52C001B0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 16:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D683210E70C;
	Thu, 13 Jul 2023 16:11:30 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6B610E70C
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 16:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689264689; x=1720800689;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=5ZLideLnIJFlhUzFy9PtWqChxT9JlVrSgzw6jOwQpRk=;
 b=h/b0l1cpv+AVyJSZl4wl6Fq0NPCb8nQ61jamxfzoAAjoNR8e4LopKVUv
 xR75gd8w9KuyNY6eFcT5kAWk2K1XrEciCBKRtQNo3gbTD3J96wu7C3DGb
 edrsG4I41+w+k++LZoYALWxg9sy5KcJASBBuu47Vg4uP5mGjZ3NuPX5na
 9zmnwj0zkJ1WWKscSajvULQTDK+YBQdu6S9ctuEx/LGU6TEN60k3EIClO
 1BL6cPtkAmOUeda9MwUbQA21Q5ypFON0w7osSwNMeV6k/kz9aUNhcWk+t
 ij1A2zHbZyo0Z5WWL6/pBE76aHOighRfTUcQ4gLYai4C7t6MKrh0uid1t g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="367877841"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="367877841"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 09:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="699304762"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="699304762"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.53.19])
 ([10.252.53.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 09:05:04 -0700
Message-ID: <bc7b9c55-0726-0406-4e32-a9c7cd1d031a@linux.intel.com>
Date: Thu, 13 Jul 2023 18:05:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230713094125.326709-5-matthew.auld@intel.com>
 <20230713094125.326709-8-matthew.auld@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230713094125.326709-8-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe: add missing bulk_move reset
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

Hi Matt,

On 7/13/2023 11:41 AM, Matthew Auld wrote:
> It looks like bulk_move is set during object construction, but is only
> removed on object close, however in various places we might not yet have
> an actual fd to close, like on the error paths for the gem_create ioctl,
> and also one internal user for the evict_test_run_gt() selftest. Try to
> handle those cases by manually resetting the bulk_move. This should
> prevent triggering:
>
> WARNING: CPU: 7 PID: 8252 at drivers/gpu/drm/ttm/ttm_bo.c:327
> ttm_bo_release+0x25e/0x2a0 [ttm]
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_bo.c |  7 +++++++
>   drivers/gpu/drm/xe/xe_bo.c       | 27 ++++++++++++++++++---------
>   drivers/gpu/drm/xe/xe_bo.h       |  6 ++++++
>   3 files changed, 31 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 21c6dfef8dc7..1a5b48d60c80 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -285,6 +285,10 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>   		xe_bo_unlock(external, &ww);
>   
>   		xe_bo_put(external);
> +
> +		xe_bo_lock(bo, &ww, 0, false);
> +		__xe_bo_unset_bulk_move(bo);
> +		xe_bo_unlock(bo, &ww);
>   		xe_bo_put(bo);
>   		continue;
>   
> @@ -295,6 +299,9 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>   cleanup_external:
>   		xe_bo_put(external);
>   cleanup_bo:
> +		xe_bo_lock(bo, &ww, 0, false);
> +		__xe_bo_unset_bulk_move(bo);
> +		xe_bo_unlock(bo, &ww);
>   		xe_bo_put(bo);
>   		break;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6353afa8d846..2ce09ae1d614 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1317,6 +1317,8 @@ xe_bo_create_locked_range(struct xe_device *xe,
>   	return bo;
>   
>   err_unlock_put_bo:
> +	if (vm)

We create bulk  move obj when "vm && !xe_vm_in_fault_mode(vm) && flags & 
XE_BO_CREATE_USER_BIT"

So I think we should rather check for the above condition or 
bo->ttm.bulk_move or even just call __xe_bo_unset_bulk_move().

Otherwise Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Regards,

Nirmoy

> +		__xe_bo_unset_bulk_move(bo);
>   	xe_bo_unlock_vm_held(bo);
>   	xe_bo_put(bo);
>   	return ERR_PTR(err);
> @@ -1760,22 +1762,29 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   	bo_flags |= args->flags << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
>   	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
>   			  bo_flags);
> -	if (vm) {
> -		xe_vm_unlock(vm, &ww);
> -		xe_vm_put(vm);
> +	if (IS_ERR(bo)) {
> +		err = PTR_ERR(bo);
> +		goto out_vm;
>   	}
>   
> -	if (IS_ERR(bo))
> -		return PTR_ERR(bo);
> -
>   	err = drm_gem_handle_create(file, &bo->ttm.base, &handle);
> -	xe_bo_put(bo);
>   	if (err)
> -		return err;
> +		goto out_bulk;
>   
>   	args->handle = handle;
> +	goto out_put;
>   
> -	return 0;
> +out_bulk:
> +	if (vm)
> +		__xe_bo_unset_bulk_move(bo);
> +out_put:
> +	xe_bo_put(bo);
> +out_vm:
> +	if (vm) {
> +		xe_vm_unlock(vm, &ww);
> +		xe_vm_put(vm);
> +	}
> +	return err;
>   }
>   
>   int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 08ca1d06bf77..72c68facd481 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -135,6 +135,12 @@ static inline void xe_bo_put(struct xe_bo *bo)
>   		drm_gem_object_put(&bo->ttm.base);
>   }
>   
> +static inline void __xe_bo_unset_bulk_move(struct xe_bo *bo)
> +{
> +	if (bo)
> +		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> +}
> +
>   static inline void xe_bo_assert_held(struct xe_bo *bo)
>   {
>   	if (bo)
