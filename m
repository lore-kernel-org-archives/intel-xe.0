Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754B5C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 10:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D9A10E2B3;
	Fri, 21 Aug 2026 10:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPinQBlV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098F210E2B3
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 10:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787307416; x=1818843416;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=oAM5WdeUceryzynugDTvPRG3XM5PBns+RyxXU/q4LDo=;
 b=DPinQBlV5gK3ldhhDCPC8E7ZHWe028rR40capibtOM42sSgquy05IeSv
 UbBLXEtu1izG/bwM8KJFXR41PY+wPO6LywcOz3zrVjGSH6jL32A3H4A/F
 sJNHosXnncits1wRUSlSo2Y3N+wfIKLuZw9L1WOYIfLYtdlzjgBBnXYX0
 TRG6nvMI4SPQQlelOqGBkM9XuYJZnBOTyfbOEmP4hGyN3DiXp/YIg4Phk
 PxPmOmvSoEmspMkIFPA5a9NHQS51DEwCdyHUFabL8afhx+kmF1G/YYV33
 Hn4De5PRBT0T8DyOy7CM55R59nWQEnE3AP/AGsolS9ec/d25I4FvVtJmk g==;
X-CSE-ConnectionGUID: FHmv3h6WS86aZpsvi5tOhw==
X-CSE-MsgGUID: M+aWJ31uS2OVfO6woMmSkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="98449183"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="98449183"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 03:16:55 -0700
X-CSE-ConnectionGUID: +GuuWwtkSQG1y6jdmLqMjg==
X-CSE-MsgGUID: C+EiDeGiTB2CifmG0NDdYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="262026098"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.237])
 ([10.245.245.237])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 03:16:54 -0700
Message-ID: <424ed868-d0af-4593-9c93-53cbe5ac1be6@intel.com>
Date: Fri, 21 Aug 2026 11:16:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Introduce PF-mem VRAM regions
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260821094601.607060-1-piotr.piorkowski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260821094601.607060-1-piotr.piorkowski@intel.com>
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

On 21/08/2026 10:45, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> This series lays the groundwork for PF-mem regions: VRAM regions
> dedicated to kernel-only allocations, where buffers are allocated
> exclusively by the kernel driver and are never exposed to userspace
> workloads.
> 
> Today a tile exposes a single VRAM region shared by both kernel and
> userspace allocations. Some use cases need a separate VRAM region
> carved out of a tile and reserved for the kernel driver only. For

Do you have a sketch in mind for how this will look? Do you take the 
normal VRAM region and reserve a contig piece of it using the allocator, 
forming your kernel-only region? Or do you partition VRAM into two 
different regions?  How do you choose the offset and size? Does this 
come from the KMD or is this fw/hw?

> example, on an SR-IOV PF most of the tile VRAM is provisioned to VFs;
> the kernel driver still needs its own allocations, which must come from
> a region reserved for the kernel and kept apart from the VRAM handed
> out to VFs. That reserved kernel region is what PF-mem provides.
> 
> To support this, the VRAM region abstraction needs a way to distinguish
> regions by purpose, dedicated TTM placements so the BO paths can route
> and evict such buffers correctly, and helpers to create a region from a
> caller-provided parent, offset, and size.
> 
> v1 -> v2:
>   - Add comments explaining why PF-mem is excluded from user BO eviction
>     (Sashiko).
>   - Resolve xe_ttm_vram_mgr_alloc_sgt() physical address via
>     xe_map_resource_to_region() instead of the tile's
>     VRAM region (Sashiko).
>   - Enforce page alignment on offset/size and guard against a NULL
>     parent BAR mapping (Sashiko)
> 
> Piotr Piórkowski (4):
>    drm/xe/vram: Add binding information to VRAM regions
>    drm/xe/ttm: Add PF-mem VRAM placement types for TTM
>    drm/xe/vram: Add initial support for PF-mem regions
>    drm/xe/kunit: Add tests for PF-mem regions
> 
>   drivers/gpu/drm/xe/tests/xe_vram.c   | 115 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_bo.c           |  16 +++-
>   drivers/gpu/drm/xe/xe_bo.h           |  17 ++++
>   drivers/gpu/drm/xe/xe_bo_evict.c     |   7 +-
>   drivers/gpu/drm/xe/xe_pm.c           |   4 +-
>   drivers/gpu/drm/xe/xe_res_cursor.h   |   9 ++-
>   drivers/gpu/drm/xe/xe_tile.c         |  10 ++-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |   9 +--
>   drivers/gpu/drm/xe/xe_vram.c         |  90 +++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_vram.h         |  10 ++-
>   drivers/gpu/drm/xe/xe_vram_types.h   |  14 +++-
>   11 files changed, 275 insertions(+), 26 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/tests/xe_vram.c
> 

