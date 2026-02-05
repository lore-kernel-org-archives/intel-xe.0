Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07FCECD986
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 16:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50D410E20D;
	Thu,  5 Feb 2026 16:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nkj9vK9G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0CA10E211
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 16:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770309044; x=1801845044;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vufy4dgLTMftlQVlBW3PAYdOu7jlYglucCx5MOrxHKg=;
 b=Nkj9vK9GidLobgs77briUlpJo6i2ajLKPXxJIJu2KEqB2xB78o4VQoYo
 0BzulvpqcbyiZWhxgS6HWEgZHBDDt97gAkGoGZiAQfulYT3YYEwpngrZD
 uEmy51HkW7BHrYFiuhEAvLnTMkBnAUwJQvrTEEGABgN/FBjIrR5lBmn/z
 ys4t7JlxDVwNJpNHE8EzJ0p1kb/GXSOR03mtaC0R7BmYv6vThPxJpJiMz
 Zm6KwgTN1UZcQqIP/+AyGad8WH4atFIJKmeIVl3KdxiCon4AngY38RhHy
 VrD8qvqG3M0mGIIlRwx4Y32FnNh+YD64cG/dOTKRpUDbZoFuqyIlto/V4 g==;
X-CSE-ConnectionGUID: ZCAMOfiaTLWV1gSs1FPvQA==
X-CSE-MsgGUID: qI9O9QB9TxqGW9kBnoNatw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82144763"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="82144763"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 08:30:43 -0800
X-CSE-ConnectionGUID: xtBIMBlVR3e8QXAmXdpaDw==
X-CSE-MsgGUID: nirSzZFvRYq+O5TPMCYmeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210385117"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.124])
 ([10.245.244.124])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 08:30:41 -0800
Message-ID: <2c1d5a59-9f1b-4263-b9cf-89b4c7eb59e5@intel.com>
Date: Thu, 5 Feb 2026 16:30:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Add bounds check on pat_index to prevent OOB
 kernel read in madvise
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260203172045.1154546-1-jia.yao@intel.com>
 <20260205161529.1819276-1-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260205161529.1819276-1-jia.yao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 05/02/2026 16:15, Jia Yao wrote:
> When user provides a bogus pat_index value through the madvise IOCTL, the
> xe_pat_index_get_coh_mode() function performs an array access without
> validating bounds. This allows a malicious user to trigger an out-of-bounds
> kernel read from the xe->pat.table array.
> 
> The vulnerability exists because the validation in madvise_args_are_sane()
> directly calls xe_pat_index_get_coh_mode(xe, args->pat_index.val) without
> first checking if pat_index is within [0, xe->pat.n_entries).
> 
> Although xe_pat_index_get_coh_mode() has a WARN_ON to catch this in debug
> builds, it still performs the unsafe array access in production kernels.
> 
> v2(Matthew Auld)
> - Using array_index_nospec() to mitigate spectre attacks when the value
> is used
> 
> v3(Matthew Auld)
> - Put the declarations at the start of the block
> 
> Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Cc: <stable@vger.kernel.org> # v6.18+
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm_madvise.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index add9a6ca2390..091e450b781c 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -246,6 +246,10 @@ static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
>   
>   static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madvise *args)
>   {
> +	s32 fd;
> +	u16 pat_index;
> +	u16 coh_mode;
> +
>   	if (XE_IOCTL_DBG(xe, !args))
>   		return false;
>   
> @@ -261,7 +265,7 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>   	switch (args->type) {
>   	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
>   	{
> -		s32 fd = (s32)args->preferred_mem_loc.devmem_fd;

Nit: This was fine. The {} is also a block.

> +		fd = (s32)args->preferred_mem_loc.devmem_fd;
>   
>   		if (XE_IOCTL_DBG(xe, fd < DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM))
>   			return false;
> @@ -291,8 +295,11 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>   		break;
>   	case DRM_XE_MEM_RANGE_ATTR_PAT:
>   	{
> -		u16 coh_mode = xe_pat_index_get_coh_mode(xe, args->pat_index.val);

Same here, we could just add pat_index here. Anyway, this can be fixed 
up when merging, no need to resend.

> +		if (XE_IOCTL_DBG(xe, args->pat_index.val >= xe->pat.n_entries))
> +			return false;
>   
> +		pat_index = array_index_nospec(args->pat_index.val, xe->pat.n_entries);
> +		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
>   		if (XE_IOCTL_DBG(xe, !coh_mode))
>   			return false;
>   

