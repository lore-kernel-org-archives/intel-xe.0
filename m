Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B82CE7B1C
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 14:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F107E10E081;
	Fri,  6 Sep 2024 14:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1X/ZXXf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B47310E081
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 14:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725632122; x=1757168122;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=LVwb8tj/752VK8+/MFDoDXf6+E8yC7Qw/BYJDk/sw0w=;
 b=e1X/ZXXf7PUTnPb40Xj53Czxb/P6dst5Ul3MJIJOv+q2EVg8gam70vua
 MNNteMZH9uGhJPNekeWgG7Hf1ue6bF/rO4FpzSImdiNDsxxpGTxn+8UQC
 fZpMJmI2N0SHojSILY1SMdnhp3Vid2PeZMQd0dy7P2/mDPlPGtu3ANM7c
 h1Rx6MMOSp6d5bTOvnTfXYz5ndxeD4LIC6cfYjUNPniP5FVs65+9kaWhr
 EsaAOifgOLcBIooWSLFSOKKn0QnbCAXAiHlB3NA/YIiZGMQ9SVLh+N+Nk
 t98CE+wIkBwrdak68Iw1oM6t+yB4L6+ol3ucxCzKhfB0qsU0FqdjMAhR+ Q==;
X-CSE-ConnectionGUID: g4jt00Z2TxOuYxsaMSV82g==
X-CSE-MsgGUID: nzpuLkwERYa/KTgBf6h2QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="41900718"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="41900718"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 07:15:22 -0700
X-CSE-ConnectionGUID: BZxJ7hNERNCLDX5ZykcC8w==
X-CSE-MsgGUID: MEwGR0P4Ro+YRrSTC3GMUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="70909245"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 06 Sep 2024 07:15:21 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id EBC212FC41;
 Fri,  6 Sep 2024 15:15:19 +0100 (IST)
Message-ID: <96ec8d98-cd67-4c1d-a770-f7c199d7edec@intel.com>
Date: Fri, 6 Sep 2024 16:15:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/43] drm/xe: Add xe_device backpointer to xe_mmio
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-52-matthew.d.roper@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240904002100.2023834-52-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 04.09.2024 02:21, Matt Roper wrote:
> Once MMIO operations stop being (incorrectly) tied to a GT, we'll still
> need a device backpointer for feature checks, message logging, and
> tracepoints.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 3 +++
>  drivers/gpu/drm/xe/xe_mmio.c         | 3 +++
>  drivers/gpu/drm/xe/xe_pci.c          | 2 ++
>  3 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 75490753feda..19c21e55e153 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -115,6 +115,9 @@ struct xe_mem_region {
>   * subregions of the overall IO space).
>   */
>  struct xe_mmio {
> +	/** @xe: Backpointer to Xe device, used for tracing */
> +	struct xe_device *xe;

since all MMIO register regions are still more/less tile-based, then
maybe it would be better to have backpointer to the xe_tile, where this
MMIO region belongs, rather than xe_device?

we can always use tile->xe if needed

> +
>  	/** @regs: Map used to access registers. */
>  	void __iomem *regs;
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 4c7215ed3954..dd2076b9003e 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -98,6 +98,7 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>  	for_each_tile(tile, xe, id) {
>  		tile->mmio.regs_length = SZ_4M;
>  		tile->mmio.regs = regs;
> +		tile->mmio.xe = xe;
>  		regs += tile_mmio_size;
>  	}
>  }
> @@ -134,6 +135,7 @@ static void mmio_extension_setup(struct xe_device *xe, size_t tile_mmio_size,
>  	for_each_tile(tile, xe, id) {
>  		tile->mmio_ext.regs_length = tile_mmio_ext_size;
>  		tile->mmio_ext.regs = regs;
> +		tile->mmio_ext.xe = xe;
>  		regs += tile_mmio_ext_size;
>  	}
>  }
> @@ -180,6 +182,7 @@ int xe_mmio_init(struct xe_device *xe)
>  	/* Setup first tile; other tiles (if present) will be setup later. */
>  	root_tile->mmio.regs_length = SZ_4M;
>  	root_tile->mmio.regs = xe->mmio.regs;
> +	root_tile->mmio.xe = xe;
>  
>  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 5b09a1cbd821..e222539022d5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -714,6 +714,7 @@ static int xe_info_init(struct xe_device *xe,
>  		gt->info.engine_mask = graphics_desc->hw_engine_mask;
>  		gt->mmio.regs = tile->mmio.regs;
>  		gt->mmio.regs_length = tile->mmio.regs_length;
> +		gt->mmio.xe = xe;
>  		if (MEDIA_VER(xe) < 13 && media_desc)
>  			gt->info.engine_mask |= media_desc->hw_engine_mask;
>  
> @@ -736,6 +737,7 @@ static int xe_info_init(struct xe_device *xe,
>  		gt->mmio.regs_length = tile->mmio.regs_length;
>  		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
>  		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
> +		gt->mmio.xe = xe;
>  
>  		/*
>  		 * FIXME: At the moment multi-tile and standalone media are
