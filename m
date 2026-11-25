Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E538606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XEZCwwzY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F7810FC9C;
	Wed, 25 Nov 2026 14:30:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC48810FC9C
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795617042; x=1827153042;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hAAXYX3kEP991CuQDt7BKCX5zVgaUKltr/j5k4GpCF4=;
 b=XEZCwwzY9msuQ53tkSbQILzCSQAyxwVMlUFrmRi7hJFugUtv/d+8XwYU
 hYE0pR62OS5YN/SN4W73nDHuIMTdU0Oty1rSpVn9o8a0VIGV4IpAn0ynX
 dtSRstRDXAKUuqmq2BB3r1Wn1mJDd2qs5vNgmPI5hdkPtHBdxepVv1R5/
 8cs+pcJUisciy//+P3RNX/t6qRxl2OjIfjoiUtCU5T4n3BoDGwhlb2cB0
 eEFHIX0Xgwb60GuwmbpuL7nRevWWqWxMr103/yRqHNQgN8sg7AWrIoRlT
 w9Yn27tHglzh1kavR0kOoB6aIEqT56mORV8PcMdI6hqr53iAXXQmV6fyQ A==;
X-CSE-ConnectionGUID: IdH7yN8SQBOXzaLLX7FH/Q==
X-CSE-MsgGUID: 2+xFUAC7Sdi7RU3oAIa8Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4356713"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4356713"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 06:30:41 -0800
X-CSE-ConnectionGUID: TkjS19qkSC2QoovSLMVDUw==
X-CSE-MsgGUID: U0GBm73dSXmf5UfOOvQhOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="11777238"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.52])
 ([10.245.244.52])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 06:30:40 -0800
Message-ID: <cd218231-993f-4661-adf6-38d771f58d90@intel.com>
Date: Wed, 25 Nov 2026 14:30:17 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/xe: Define partitioned VRAM manager types
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
 <20261116094523.2484301-2-piotr.piorkowski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20261116094523.2484301-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/11/2026 09:45, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> A VRAM region may need to be split into hard partitions, e.g. to keep
> kernel allocations in a dedicated low range of VRAM. Expressing such a
> split purely as a placement range would turn every VRAM allocation into
> a %GPU_BUDDY_RANGE_ALLOCATION, which constrains the buddy algorithm for
> what is really a hard, statically known split.
> 
> Describe the types needed to manage each partition with a buddy
> allocator of its own instead. struct xe_ttm_vram_mgr_part ties a buddy
> allocator to the VRAM pool it backs, the manager holds up to
> XE_TTM_VRAM_MGR_MAX_PARTS of them, and resources and offlined pages
> record the partition their blocks were allocated from, as buddy offsets
> become partition relative.
> 
> Each partition also tracks the CPU visible memory allocated from it, so
> that usage can be reported per pool purpose, and the alignment a
> partition base must honour is defined next to the partition itself.

What about calling it "zone/zones" ? That feels more natural IMO and 
would then match what core kernel names this IIRC.

struct xe_ttm_vram_mgr_zone {

}

struct xe_ttm_vram_mgr_zone zones[XE_TTM_VRAM_MGR_MAX_ZONES];

I explored something very similar to this in the past for visible vs 
non-visible VRAM, where you model it by having an array of zones in the 
mgr. So zone-0 is the visible part and zone-1 is the non-visible. From 
allocator pov you then also don't need to mess with bias range stuff, 
and rather just have two separate allocators, but there are ofc other 
complications with that.

> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 46 ++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index 4a2cd27a5b617..1da3c82b28585 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -7,8 +7,46 @@
>   #define _XE_TTM_VRAM_MGR_TYPES_H_
>   
>   #include <linux/gpu_buddy.h>
> +#include <linux/sizes.h>
>   #include <drm/ttm/ttm_device.h>
>   
> +struct xe_vram_pool;
> +
> +/**
> + * struct xe_ttm_vram_mgr_part - Partition of a VRAM region
> + *
> + * A VRAM region may be split into disjoint partitions, each managed by its
> + * own buddy allocator. An allocation belongs to exactly one partition and
> + * cannot span partition boundaries. This lets the manager allocate directly
> + * from the requested partition without resorting to
> + * %GPU_BUDDY_RANGE_ALLOCATION, which constrains the buddy allocation
> + * algorithm.
> + */
> +struct xe_ttm_vram_mgr_part {
> +	/**
> +	 * @pool: VRAM pool backed by this partition
> +	 *
> +	 * Once the manager is initialized, pool->part points back here.
> +	 */
> +	struct xe_vram_pool *pool;
> +	/** @mm: DRM buddy allocator which manages this partition */
> +	struct gpu_buddy mm;
> +	/** @used_visible: CPU visible bytes allocated from this partition */
> +	u64 used_visible;
> +};
> +
> +/** XE_TTM_VRAM_MGR_MAX_PARTS - Max partitions of a single VRAM region */
> +#define XE_TTM_VRAM_MGR_MAX_PARTS	2
> +
> +/**
> + * XE_TTM_VRAM_MGR_PART_ALIGN - Required alignment of a partition base
> + *
> + * Buddy offsets are partition relative, so a partition base has to be
> + * aligned to the largest VRAM page size in regular use, otherwise an aligned
> + * buddy allocation is not aligned in the region.
> + */
> +#define XE_TTM_VRAM_MGR_PART_ALIGN	SZ_2M
> +
>   /**
>    * struct xe_ttm_vram_mgr - Xe TTM VRAM manager
>    *
> @@ -19,6 +57,10 @@ struct xe_ttm_vram_mgr {
>   	struct ttm_resource_manager manager;
>   	/** @mm: DRM buddy allocator which manages the VRAM */
>   	struct gpu_buddy mm;
> +	/** @parts: Partitions this VRAM region is split into */
> +	struct xe_ttm_vram_mgr_part parts[XE_TTM_VRAM_MGR_MAX_PARTS];
> +	/** @num_parts: Number of initialized entries in @parts */
> +	unsigned int num_parts;
>   	/** @offlined_pages: List of offlined pages */
>   	struct list_head offlined_pages;
>   	/** @n_offlined_pages: Number of offlined pages */
> @@ -47,6 +89,8 @@ struct xe_ttm_vram_mgr_resource {
>   	struct ttm_resource base;
>   	/** @blocks: list of DRM buddy blocks */
>   	struct list_head blocks;
> +	/** @part: Partition owning @blocks, set on successful allocation */
> +	struct xe_ttm_vram_mgr_part *part;
>   	/** @used_visible_size: How many CPU visible bytes this resource is using */
>   	u64 used_visible_size;
>   	/** @flags: flags associated with the resource */
> @@ -73,6 +117,8 @@ struct xe_ttm_vram_offline_resource {
>   	struct list_head queued_link;
>   	/** @blocks: Buddy blocks reserved for this page */
>   	struct list_head blocks;
> +	/** @part: Partition owning @blocks, set on successful reservation */
> +	struct xe_ttm_vram_mgr_part *part;
>   	/** @used_visible_size: CPU-visible bytes consumed */
>   	u64 used_visible_size;
>   	/** @addr: Faulty DPA reported by HW */

