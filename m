Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C775C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 12:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E63810E1D3;
	Fri, 26 May 2023 12:32:08 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DB310E7FA
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 12:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685104325; x=1716640325;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=vq+1ThQ6gF0ycGqdGXB6LQLmEHuJXkDIQS4VS3sPzeQ=;
 b=dkJolNl6HBH3EzFDvHu2UIJOyTnnNqPsgjUlWwDxYy82PfSbaLiG4Psd
 MMyP+DvNCyZnf7oEVYXWZ/W02fwfevcOwg5U8CLCmNDZg6pqhe51JT2G2
 LkpCABJHnd3wU8NkbWH1pLAOD60JS+hiZEUmhOYlJNUuZ5QA/Knrgh0pP
 bwbIaVMiG+jip8yF2fSe+fKJiZz84a+w8PqKfMa3+WetkuUNrn7agu7uh
 rVfcsf+V/tOB0c0WrwQz1IsNEBI8ToKVs4ptKoJBinKYW3hUlz8WTLApC
 NuMEDMxKH5yuOD/exLKkMvF9czqAUsByeEI+TpDW7ynFZoqdg5DvpDnso w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="343685435"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="343685435"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 05:31:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="817519337"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="817519337"
Received: from binis42x-mobl.gar.corp.intel.com (HELO [10.249.254.65])
 ([10.249.254.65])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 05:31:56 -0700
Message-ID: <16e34e17-bb8c-8fe7-a6b8-65c53dd0a068@linux.intel.com>
Date: Fri, 26 May 2023 14:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
 <20230526121101.1619278-4-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230526121101.1619278-4-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 3/5] drm/xe: Fix extobj dropping issue.
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


On 5/26/23 14:10, Maarten Lankhorst wrote:
> I believe originally we did the right thing, but now we hit an issue.
>
> Presumably, this was changed when converting from an array to a list
> in a squashed commit:
> "drm/xe: Use a list for the vm's external objects"
>
> When deleting a vma with an extobj in the list, ensure if it's freed
> but still listed on the vm, we take a different vma and add that to
> the extobj list instead.
>
> I'll add an igt, and make sure it doesn't happen again.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/194

Lgtm. Perhaps add a Fixes: or a !fixup to that broken commit?

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_vm.c | 95 +++++++++++++++++++++++---------------
>   1 file changed, 58 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f73e08b60670..dd1335e12d4c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -909,12 +909,14 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   	return vma;
>   }
>   
> -static void vm_remove_extobj(struct xe_vma *vma)
> +static bool vm_remove_extobj(struct xe_vma *vma)
>   {
>   	if (!list_empty(&vma->extobj.link)) {
>   		vma->vm->extobj.entries--;
>   		list_del_init(&vma->extobj.link);
> +		return true;
>   	}
> +	return false;
>   }
>   
>   static void xe_vma_destroy_late(struct xe_vma *vma)
> @@ -955,6 +957,51 @@ static void vma_destroy_work_func(struct work_struct *w)
>   	xe_vma_destroy_late(vma);
>   }
>   
> +static struct xe_vma *
> +bo_has_vm_references_locked(struct xe_bo *bo, struct xe_vm *vm,
> +			    struct xe_vma *ignore)
> +{
> +	struct xe_vma *vma;
> +
> +	list_for_each_entry(vma, &bo->vmas, bo_link) {
> +		if (vma != ignore && vma->vm == vm && !vma->destroyed)
> +			return vma;
> +	}
> +
> +	return NULL;
> +}
> +
> +static bool bo_has_vm_references(struct xe_bo *bo, struct xe_vm *vm,
> +				 struct xe_vma *ignore)
> +{
> +	struct ww_acquire_ctx ww;
> +	bool ret;
> +
> +	xe_bo_lock(bo, &ww, 0, false);
> +	ret = !!bo_has_vm_references_locked(bo, vm, ignore);
> +	xe_bo_unlock(bo, &ww);
> +
> +	return ret;
> +}
> +
> +static void __vm_insert_extobj(struct xe_vm *vm, struct xe_vma *vma)
> +{
> +	list_add(&vma->extobj.link, &vm->extobj.list);
> +	vm->extobj.entries++;
> +}
> +
> +static void vm_insert_extobj(struct xe_vm *vm, struct xe_vma *vma)
> +{
> +	struct xe_bo *bo = vma->bo;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	if (bo_has_vm_references(bo, vm, vma))
> +		return;
> +
> +	__vm_insert_extobj(vm, vma);
> +}
> +
>   static void vma_destroy_cb(struct dma_fence *fence,
>   			   struct dma_fence_cb *cb)
>   {
> @@ -980,11 +1027,19 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>   	} else {
>   		xe_bo_assert_held(vma->bo);
>   		list_del(&vma->bo_link);
> +
>   		spin_lock(&vm->notifier.list_lock);
>   		list_del(&vma->notifier.rebind_link);
>   		spin_unlock(&vm->notifier.list_lock);
> -		if (!vma->bo->vm)
> -			vm_remove_extobj(vma);
> +
> +		if (!vma->bo->vm && vm_remove_extobj(vma)) {
> +			struct xe_vma *other;
> +
> +			other = bo_has_vm_references_locked(vma->bo, vm, NULL);
> +
> +			if (other)
> +				__vm_insert_extobj(vm, other);
> +		}
>   	}
>   
>   	xe_vm_assert_held(vm);
> @@ -2481,40 +2536,6 @@ static int vm_bind_ioctl_async(struct xe_vm *vm, struct xe_vma *vma,
>   	return err;
>   }
>   
> -static bool bo_has_vm_references(struct xe_bo *bo, struct xe_vm *vm,
> -				 struct xe_vma *ignore)
> -{
> -	struct ww_acquire_ctx ww;
> -	struct xe_vma *vma;
> -	bool ret = false;
> -
> -	xe_bo_lock(bo, &ww, 0, false);
> -	list_for_each_entry(vma, &bo->vmas, bo_link) {
> -		if (vma != ignore && vma->vm == vm && !vma->destroyed) {
> -			ret = true;
> -			break;
> -		}
> -	}
> -	xe_bo_unlock(bo, &ww);
> -
> -	return ret;
> -}
> -
> -static int vm_insert_extobj(struct xe_vm *vm, struct xe_vma *vma)
> -{
> -	struct xe_bo *bo = vma->bo;
> -
> -	lockdep_assert_held_write(&vm->lock);
> -
> -	if (bo_has_vm_references(bo, vm, vma))
> -		return 0;
> -
> -	list_add(&vma->extobj.link, &vm->extobj.list);
> -	vm->extobj.entries++;
> -
> -	return 0;
> -}
> -
>   static int __vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
>   				      u64 addr, u64 range, u32 op)
>   {
