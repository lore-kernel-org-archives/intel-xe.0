Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EDCF41994
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 12:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6020A10E05F;
	Wed, 15 Apr 2026 12:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QbRy8jZ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4075E10E05F
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 12:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776255307; x=1807791307;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XVwY6PmwvfRm+MrqjaTcSzgwzTO6ZRD5DBuaCXCbY0U=;
 b=QbRy8jZ5N0IsQEep54HEB53sA3NsxwT2R3o7BI584WeS83+0jMa/elbj
 Ac9R6ql0S2zB5hIMdh6b/mBdt6wRc/GAnvNqDIeQOLA/cL6Q9MFxY3Zg9
 gBtQMCvhZz98SG1/arI0u+GsclabDrtGrOhJxN9/jArecgy3s9WyC3OKm
 Zk19PRKqCvzUQ9WaqJLL6vj9dSHli27evBlVpHehXq/A8ook0bfUV+DaX
 NSDvvAB/G5lvKNB7AGSMjCXJZDes4wJHTdxbWaT4ewShP1NDC/K8/Xchy
 QUJWgBmTaEawasGiY7d951sTdKES3Ykjt/5GavTZyoSwycAEXpUephNZ0 g==;
X-CSE-ConnectionGUID: 671ojP0DSQWEILA5KV9nCg==
X-CSE-MsgGUID: uiJvGGNUR26kq94uQQi9fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="87853502"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="87853502"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 05:15:07 -0700
X-CSE-ConnectionGUID: vGuuNXZYQOW3P1xqpETZFA==
X-CSE-MsgGUID: GebHZkpnRJeQ8EBJw7nr6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="223902153"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.112])
 ([10.245.244.112])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 05:15:05 -0700
Message-ID: <c9962533-d9a4-40bb-b42a-7e7855c271d0@intel.com>
Date: Wed, 15 Apr 2026 13:15:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] drm/xe: Reject coh_none PAT index for
 CPU_ADDR_MIRROR
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org, Shuicheng Lin <shuicheng.lin@intel.com>,
 Mathew Alwin <alwin.mathew@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20260129000147.339361-1-jia.yao@intel.com>
 <20260415061951.427699-1-jia.yao@intel.com>
 <20260415061951.427699-3-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260415061951.427699-3-jia.yao@intel.com>
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

On 15/04/2026 07:19, Jia Yao wrote:
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
>   drivers/gpu/drm/xe/xe_vm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2408b547ca3d..619a22fa9abe 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3657,7 +3657,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>   		    XE_IOCTL_DBG(xe, obj &&
>   				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>   		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
> -				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
> +				 (op == DRM_XE_VM_BIND_OP_MAP_USERPTR || is_cpu_addr_mirror)) ||

Chatted to Michal, and it looks like on dgpu an incoherent index is 
being used with cpu_addr_mirror, so this will cause regressions. I think 
for both patches we need to limit this change to igpu, where coherent 
index is fortunately already being used.

>   		    XE_IOCTL_DBG(xe, xe_device_is_l2_flush_optimized(xe) &&
>   				 (op == DRM_XE_VM_BIND_OP_MAP_USERPTR ||
>   				  is_cpu_addr_mirror) &&

