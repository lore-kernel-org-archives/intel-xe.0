Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770AAF8A14A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 09:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F68010E84B;
	Thu, 16 Apr 2026 09:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fX/fSD8n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDAA10E84B
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776330676; x=1807866676;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RtibpALEXn08ivA4S1NSxloelocNX2yk0NnMCkkgPPQ=;
 b=fX/fSD8nCEagGV/rCrc2XwOniR4dwwwX/3NOn55Sg58KMj6H9Bp6HbzJ
 3KYBtj/KpR8U4ZM9JKgxtm5vcupSBZMH3aZ4WSEbQ6VtoGqgSEerZ9rr3
 WcZPbSQLAAWee643zB1IYQx8dGoBt8qvAMe63dj/XNusRvLbOMe/aIDnk
 gDkgNPM8yOWYbaNdGWSU6HwLyVv/16RG6h7PmgVGIhp7IQy8bPTndAf82
 0gWZQ+y1cdaHb1r2oi+JJGmFGtLPOPIYSgg0ly3BOhmjJFJhzq+dWUJvu
 pa0nKpiV8gYRg3IXlZRAyeFd+uSOwuWxhW+qToAe2mbuNJ6eh9RNiAyF0 g==;
X-CSE-ConnectionGUID: fbC/gdCGTuCNHBRu04rIbg==
X-CSE-MsgGUID: muOe5a8cTpiEboY3ssb8nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77506679"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77506679"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:11:15 -0700
X-CSE-ConnectionGUID: aHTwOwBuSfeTE2pCFfuS8g==
X-CSE-MsgGUID: svS2aVecQVe1sQ8B22gkjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="253923678"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.235])
 ([10.245.244.235])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:11:12 -0700
Message-ID: <221abf47-70dd-4c47-b48f-09697d3db172@intel.com>
Date: Thu, 16 Apr 2026 10:11:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] drm/xe: Reject coh_none PAT index for
 CPU_ADDR_MIRROR
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org, Shuicheng Lin <shuicheng.lin@intel.com>,
 Mathew Alwin <alwin.mathew@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20260416051957.651337-1-jia.yao@intel.com>
 <20260416051957.651337-3-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260416051957.651337-3-jia.yao@intel.com>
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

On 16/04/2026 06:19, Jia Yao wrote:
> Add validation in xe_vm_bind_ioctl() to reject PAT indices
> with XE_COH_NONE coherency mode when used with
> DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR.
> 
> CPU address mirror mappings use system memory that is CPU
> cached, which makes them incompatible with COH_NONE PAT
> indices. Allowing COH_NONE with CPU cached buffers is a
> security risk, as the GPU may bypass CPU caches and read
> stale sensitive data from DRAM.
> 
> Although CPU_ADDR_MIRROR does not create an immediate
> mapping, the backing system memory is still CPU cached.
> Apply the same PAT coherency restrictions as
> DRM_XE_VM_BIND_OP_MAP_USERPTR.
> 
> v2:
> - Correct fix tag
> 
> v6:
> - No change
> 
> v7:
> - Correct fix tag
> 
> v8:
> - Rebase
> 
> v9:
> - Limit the restrictions to iGPU
> 
> Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
> Cc: stable@vger.kernel.org # v6.18
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Mathew Alwin <alwin.mathew@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2408b547ca3d..f2e733c7ddab 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3656,8 +3656,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>   				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL) ||
>   		    XE_IOCTL_DBG(xe, obj &&
>   				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
> -		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
> -				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
> +		    XE_IOCTL_DBG(xe, !IS_DGFX(xe) && coh_mode == XE_COH_NONE &&
> +				 (op == DRM_XE_VM_BIND_OP_MAP_USERPTR || is_cpu_addr_mirror)) ||

Not sure if we want to change the existing behaviour for userptr. At the 
very least would need some IGT updates. I think maybe just limit to 
cpu_addr?

>   		    XE_IOCTL_DBG(xe, xe_device_is_l2_flush_optimized(xe) &&
>   				 (op == DRM_XE_VM_BIND_OP_MAP_USERPTR ||
>   				  is_cpu_addr_mirror) &&

