Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126C5FD7077
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 10:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23E910E1ED;
	Tue, 17 Mar 2026 10:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lcrdKgLX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B929A10E1ED
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 10:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773744327; x=1805280327;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rchWW5a+2wWcJZRD+Xz4sWsrBBSKlG/inHusim50V38=;
 b=lcrdKgLXH7pOR9cgtPBAeGfRr1WdxtYBAglR2zKkDtC0U9HjxiFQgnr8
 q9KBZhLoHX1Il2B7fPYjn6V7h+eRvue7StqxlbeXFm38NG8Boyc8B/7TQ
 Q1byn6QhCVNZzOd06PDhITLB6+kOBk651zbbJsQZHEy5Bq129GqIEVHsa
 UwqT6/L5BjeoqeIWkfdXjjV3xpJsLMa3Su6VJy6ySWXX4ycs0j73i44YS
 lQNzCPpYKCihrhzXxUYFldQUseyCY7zFVgKb4NuHhhbhRWYBVxZRGjJcb
 x04bWUOTJ5yTx/+DDKs+jQ/qZr+vJDEY08R1dVmvp8da62KFawpdLhM7s A==;
X-CSE-ConnectionGUID: QrFo0zQTSaOmnMY2xaXCFA==
X-CSE-MsgGUID: clBRXLYBSWuntlnVCcAf4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="77382228"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="77382228"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 03:45:27 -0700
X-CSE-ConnectionGUID: WYVWxBfCSA6YeL3Kf3CIeg==
X-CSE-MsgGUID: i/7bohZxQvGFo5MugMrFhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221456845"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.147])
 ([10.245.245.147])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 03:45:24 -0700
Message-ID: <80b5e2f3-88e4-44c6-84b2-1fae9444467e@intel.com>
Date: Tue, 17 Mar 2026 10:45:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/xe: Reject coh_none PAT index for
 CPU_ADDR_MIRROR
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org, Shuicheng Lin <shuicheng.lin@intel.com>,
 Mathew Alwin <alwin.mathew@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20260129000147.339361-1-jia.yao@intel.com>
 <20260316164253.262406-1-jia.yao@intel.com>
 <20260316164253.262406-3-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260316164253.262406-3-jia.yao@intel.com>
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

On 16/03/2026 16:42, Jia Yao wrote:
> Add validation in xe_vm_bind_ioctl() to reject PAT indices with
> XE_COH_NONE coherency mode when used with
> DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, consistent with the existing
> validation for DRM_XE_VM_BIND_OP_MAP_USERPTR.
> 
> CPU address mirror mappings use system memory which is CPU cached,
> making them incompatible with COH_NONE PAT index. Using COH_NONE with
> CPU cached buffers is a security issue: GPU can bypass CPU caches and
> directly read stale sensitive data from DRAM, potentially leaking data
> from previously freed pages.
> 
> Although CPU_ADDR_MIRROR mappings don't create actual memory mappings
> (the range is reserved for dynamic mapping on GPU page faults), the
> underlying system memory is still CPU cached, so the same PAT coherency
> restrictions as MAP_USERPTR should apply.
> 
> v2:
> - Correct fix tag
> 
> Fixes: e1fbc4f18d5b ("drm/xe/uapi: support pat_index selection with vm_bind")

I don't think addr_mirror existed yet?

Maybe:
Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
Cc: <stable@vger.kernel.org> # v6.15+

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
> index 5572e12c2a7e..1c4b4a5eeadb 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3491,7 +3491,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>   		    XE_IOCTL_DBG(xe, obj &&
>   				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>   		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
> -				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
> +				 (op == DRM_XE_VM_BIND_OP_MAP_USERPTR || is_cpu_addr_mirror)) ||
>   		    XE_IOCTL_DBG(xe, comp_en &&
>   				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>   		    XE_IOCTL_DBG(xe, op == DRM_XE_VM_BIND_OP_MAP_USERPTR &&

