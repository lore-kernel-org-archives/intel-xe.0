Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085E2F46453
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 11:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C067610E26C;
	Mon, 16 Mar 2026 11:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wn5G6pff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4347B10E256
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 11:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773661230; x=1805197230;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QtdLGzEgYjjY0r5MVIbMvUXsQfAXquKsNJdipJSCY6E=;
 b=Wn5G6pffHbxy+1VWnexZSWK3QyBqywFPh8TaSAaPAkKVxbYT+rP6f5EB
 HJrzJMj6Tmb+A/RXfNTXgCjOweUVlM+TlVBAbPMG/iKMMsH/G0J76hVYw
 2EjUgZipgOQp4+XLPZ1pY3jYPB9PDYasJXVk2Ux97SjZLAEcxBUnCtuSh
 Pgbpafhow4hUBaloW+UbHq6uz20JpwF210w5c2ghUz7z4Tn+nPvcbDtbG
 MrX1wFEX2aSkopIP3iw6t3i3qnKjfssiP9itcM+CRo5Iy+n3W8+rgJRAq
 xyTu/ZA4lkiyn/UHc6GVQ6/lAs4r6Y/mc6Whk0RzDqa+OY3zH1lNI8KUH Q==;
X-CSE-ConnectionGUID: S+wbkPjvQ1OpOiHr2tKq/g==
X-CSE-MsgGUID: 2aRsOwpoQ2mLibiSTqk+3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="92056730"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="92056730"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:40:30 -0700
X-CSE-ConnectionGUID: WAa+yDxLQJ290BJg9DSemg==
X-CSE-MsgGUID: NJqI9ZK2Qoy7oqNTyHMzCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226349347"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.244.246])
 ([10.245.244.246])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:40:27 -0700
Message-ID: <20732332-b75f-43e0-a244-210b47b44dc5@intel.com>
Date: Mon, 16 Mar 2026 11:40:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe: Reject coh_none PAT index for
 CPU_ADDR_MIRROR
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org, Shuicheng Lin <shuicheng.lin@intel.com>,
 Mathew Alwin <alwin.mathew@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20260129000147.339361-1-jia.yao@intel.com>
 <20260316072257.255372-1-jia.yao@intel.com>
 <20260316072257.255372-3-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260316072257.255372-3-jia.yao@intel.com>
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

On 16/03/2026 07:22, Jia Yao wrote:
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
> Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")

Is this the right fixes tag?

> Cc: stable@vger.kernel.org # v6.18
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Mathew Alwin <alwin.mathew@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>

As discussed offline, I think this is needed. My understanding is that 
when binding an svm range we use the parent vma pat index, and without 
using the madvise pat control, the default pat index is whatever the 
user selects here, which could be incoherent, and on least igpu that 
will be problematic when accessing CPU cached system memory.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

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

