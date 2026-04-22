Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B0BF9EDD1
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 13:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E394C10EE46;
	Wed, 22 Apr 2026 13:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HW+Ne5bs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6203810EA33
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 13:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776865285; x=1808401285;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dYRLgDltm0lrHG0yfUXxgniWDnEzEzzyZFQS71Rh8Lg=;
 b=HW+Ne5bswRlhCaqMld7TRfZVVqn7Eo4sJuD/3qPTg8d+rs5+QQ2XcTD0
 Nn9EQgODzg8Mlulwm0xg6bDUsWTAcnZt4PtB2v2CSy4JjKtHgimIXT6LT
 AXMTYMdFTNP86FZLm6/6hIRjyfp8MuOnBKUGeNF4YfTKcU+ICS6DgItW1
 Nna88jdkcVRkqp2cjbQYDEq+g/RUg2R2c0VcKbFSHXcWIVsw5sX/N57H5
 hfxba1tDy5NjyTVoU7EomJHw7fFLLZlomc+ZTa17vNwsay0WHVTFr0HAf
 7921nqmGY126NiNJZbNYggdrQl6IwaEdR9kJSoLMRLXjfaWEPVc44H9gl Q==;
X-CSE-ConnectionGUID: 8Ipj7B9/Q46B6hq7g/6Gew==
X-CSE-MsgGUID: XBtVSynFTnKYczpIf1J3Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="78001242"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="78001242"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 06:41:24 -0700
X-CSE-ConnectionGUID: ek4ukmjATAyexPjzRs9OvQ==
X-CSE-MsgGUID: 2mVpI9UDQFOkgpq+tkKmHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="270457996"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.244.7])
 ([10.245.244.7])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 06:41:23 -0700
Message-ID: <4a44667f-d2f8-40af-a67f-12adb56ac8ad@intel.com>
Date: Wed, 22 Apr 2026 14:41:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe: Convert stolen memory over to ttm_range_manager
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
References: <20260422125502.3088222-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260422125502.3088222-2-sanjay.kumar.yadav@intel.com>
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

On 22/04/2026 13:55, Sanjay Yadav wrote:
> Stolen memory requires physically contiguous allocations for display
> scanout and compressed framebuffers. The stolen memory manager was
> sharing the gpu_buddy allocator backend with the VRAM manager, but
> buddy manages non-contiguous power-of-two blocks making it a poor fit.
> Stolen memory also has fundamentally different allocation patterns:
> 
> - Allocation sizes are not power-of-two. Since buddy rounds up to the
>    next power-of-two block size, a ~17MB request can fail even with
>    ~22MB free, because the free space is fragmented across non-fitting
>    power-of-two blocks.
> - Hardware restrictions prevent using the first 4K page of stolen for
>    certain allocations (e.g., FBC). The display code sets fpfn=1 to
>    enforce this, but when fpfn != 0, gpu_buddy enables
>    GPU_BUDDY_RANGE_ALLOCATION mode which disables the try_harder
>    coalescing path, further reducing allocation success.
> 
> This combination caused FBC compressed framebuffer (CFB) allocation
> failures on platforms like NVL/PTL. In case of NVL where stolen memory
> is ~56MB and the initial plane framebuffer consumes ~34MB at probe time,
> leaving ~22MB for subsequent allocations.
> 
> Use ttm_range_man_init_nocheck() to set up a drm_mm-backed TTM resource
> manager for stolen memory. This reuses the TTM core's ttm_range_manager
> callbacks, avoiding duplicate implementations.
> 
> Tested on NVL with a 4K DP display: stolen_mm shows a single ~22MB
> contiguous free hole after initial plane framebuffer allocation, and
> FBC successfully allocates its CFB from that region. The corresponding
> IGT was previously skipped and now passes.
> 
> v2:
> - Clarify that stolen memory requires contiguous allocations (Matt B)
> - Properly handle xe_ttm_resource_visible() for stolen instead of
>    unconditionally returning true (Matt A)
> 
> v3:
> - Rebase
> - Fix xe_display_bo_fbdev_prefer_stolen() to compare in pages, since
>    ttm_range_manager stores stolen->size in pages not bytes (Matt A)
> 
> v4:
> - Add kernel-doc for struct xe_ttm_stolen_mgr (Matt B)
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7631
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Acked-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
