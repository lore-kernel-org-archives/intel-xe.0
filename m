Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D56BC87FCB
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 09:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138DC10E739;
	Wed,  6 Aug 2025 09:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n6KgTCAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284F110E738
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 09:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754471566; x=1786007566;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9buzJm7fVKUjVDjM3UvLV0wvbsy9ZAzJWh34oAQWQ4A=;
 b=n6KgTCAvt5AKDtAENf8iEBLhzJ4DB4ht1qWnX6/TxID89vHrgOcmT+d+
 Rd7MuEAjYV8LR5WnZcqLgrK2zKzCShIagxGws951leDJ26JfssS25IMWu
 Wj6Yw6uqVX5j1XBQO+fDQTnvHiaapVU4CtcmxFBZj1RA/pQiE82DmUjsN
 eyj6wfORz0wOFMZbbEb5bYmHEHf701/UUX9Bd0R4u/+Uku9/fImoLcSqJ
 m9LV5SO58prLBPe/Oup+ecxOwX9j21vcbMEhJBW5fJ0h6ztZ0Js2+t5QY
 T5oPaot/NBIpvpoJ6hXx2icN0FtoC/59oMijLSiMHIz0I+GOCuzLWqa4L Q==;
X-CSE-ConnectionGUID: Di5tRoMmSISVOBFIasEHAg==
X-CSE-MsgGUID: W6MkWlfsSCiccrpkgK+X4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="79331340"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="79331340"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 02:12:46 -0700
X-CSE-ConnectionGUID: afvL9XSjTrmsNGBBpRevEA==
X-CSE-MsgGUID: CfPFA9lzRxSyAOnBzWwxjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="195563278"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.172])
 ([10.245.244.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 02:12:44 -0700
Message-ID: <965adc2e-1d2d-44de-b1c2-96ed8af76052@intel.com>
Date: Wed, 6 Aug 2025 10:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe: Disable compression on SVM
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com
References: <20250805220653.745400-1-matthew.brost@intel.com>
 <20250805220653.745400-2-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250805220653.745400-2-matthew.brost@intel.com>
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

On 05/08/2025 23:06, Matthew Brost wrote:
> This is not yet supported, forcefully disable by setting pat_index to
> zero for CPU address mirror VMAs.
> 
> v2:
>   - Use XE_CACHE_WB (Auld)
>   - Only modify pat_index if compressed (Himal)
> 
> Cc: stable@vger.kernel.org
> Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pat.c | 10 ++++++++++
>   drivers/gpu/drm/xe/xe_pat.h | 10 ++++++++++
>   drivers/gpu/drm/xe/xe_vm.c  |  7 ++++++-
>   3 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 2e7cb99ae87a..ac1767c812aa 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -154,6 +154,16 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
>   static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
>   static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
>   
> +bool xe_pat_index_get_comp_mode(struct xe_device *xe, u16 pat_index)
> +{
> +	WARN_ON(pat_index >= xe->pat.n_entries);
> +
> +	if (xe->pat.table != xe2_pat_table)
> +		return false;
> +
> +	return xe->pat.table[pat_index].value & XE2_COMP_EN;
> +}
> +
>   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>   {
>   	WARN_ON(pat_index >= xe->pat.n_entries);
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index fa0dfbe525cd..8be2856a73af 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -58,4 +58,14 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
>    */
>   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
>   
> +/**
> + * xe_pat_index_get_comp_mode() = Extract the compression mode for the given
> + * pat_index.
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + *
> + * Return: True if pat_index is compressed, False otherwise
> + */
> +bool xe_pat_index_get_comp_mode(struct xe_device *xe, u16 pat_index);
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 432ea325677d..83f507ea7f30 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2362,7 +2362,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>   			op->map.is_cpu_addr_mirror = flags &
>   				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
>   			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> -			op->map.pat_index = pat_index;
> +			/* XXX: We don't support SVM + compression yet */
> +			if (op->map.is_cpu_addr_mirror &&
> +			    xe_pat_index_get_comp_mode(vm->xe, pat_index))
> +				op->map.pat_index = vm->xe->pat.idx[XE_CACHE_WB];
> +			else
> +				op->map.pat_index = pat_index;

Just to double check here, there is nothing scary with coh_none here on 
igpu + svm? It gets rejected somewhere or somehow there is no way to 
bypass CPU clearing on host side?

>   			op->map.invalidate_on_bind =
>   				__xe_vm_needs_clear_scratch_pages(vm, flags);
>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {

