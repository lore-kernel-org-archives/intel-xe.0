Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7658606A32C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 18:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H7+CYC26
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920D310FEF5;
	Wed, 25 Nov 2026 18:18:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680DB10FEF5
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 18:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795630717; x=1827166717;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kq6v1PVWWc4xdnFv7iA59fiLa9zo1p8IQALcXHY2W2c=;
 b=H7+CYC26/z0MoQ8VrPBpEyRQEWgOTjN2Jn1sL2BeQ/0AGbhVYKg2cAJA
 yeBvuH5XNGVgSgn62gKMLx75dvzoXC6uwU3VmkfbZhyTbvyHn+Sr75RZ/
 Zn38/J3S0ouuVd6sfbVhp2vAH4TuFauQ6tIe4ncNul1AclAqXH7HxX28q
 PAK6ueOGpSq3cTpKc5chdpKMWULqjBVTCGHZcbAqXRg4droLZZVaoHWOF
 Esk9vwIYjuzJWgVJAHgvU7i9y2XPwuaUrass7w2RxGCJkMH8AwJdF4FIB
 KWN9uOVsMQvCsgfO64QhHStv0e04o88tmFIE121dLig260UVCkj0Eu3xj w==;
X-CSE-ConnectionGUID: tPzwAVp8R2q43k4XzlSeYg==
X-CSE-MsgGUID: Pi1xnpJqSMSpyJyEwgzhsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4522854"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4522854"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 09:41:16 -0800
X-CSE-ConnectionGUID: G7Z78DMoT5SVOETHs9+yaw==
X-CSE-MsgGUID: ruTNqF38QwGcQE/Yac6Jjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="11959904"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.52])
 ([10.245.244.52])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 09:38:09 -0800
Message-ID: <ba79e8af-c172-4ae6-83cd-d6964f2af3ab@intel.com>
Date: Wed, 25 Nov 2026 17:38:07 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] drm/xe: Define VRAM regions and pools
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
 <20261116094523.2484301-3-piotr.piorkowski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20261116094523.2484301-3-piotr.piorkowski@intel.com>
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
> Allocation paths place memory through a struct xe_vram_region, which is
> both the physical carrier of a VRAM range (BAR mapping, DPA range, TTM
> manager) and the only handle for the purpose an allocation serves. That
> makes it impossible to dedicate part of a region to a given purpose,
> e.g. to keep kernel allocations such as LRCs and page tables in a range
> of their own, away from VRAM that may be reachable by other agents.

"other agents", what is meant by that?

> 
> Separate the two concepts. A struct xe_vram_pool represents an allocation
> domain: it identifies the purpose served by a range within a VRAM region,
> whether that range is available for general use or dedicated to
> a particular purpose. A struct xe_vram_region owns the physical resources
> and embeds its pools as partitions, keeping pool pointers published during
> initialization stable when the region is later split. The region also
> records its binding, distinguishing a device-wide aggregate from a tile
> region, since both may use ID 0 for the first tile.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vram_types.h | 159 ++++++++++++++++++++++++++++-
>   1 file changed, 158 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
> index 646e3c12ae9f7..a3e421f2f32d4 100644
> --- a/drivers/gpu/drm/xe/xe_vram_types.h
> +++ b/drivers/gpu/drm/xe/xe_vram_types.h
> @@ -15,6 +15,142 @@
>   struct xe_device;
>   struct xe_migrate;
>   
> +/**
> + * enum xe_vram_binding - VRAM region binding types
> + * @XE_VRAM_BINDING_NONE: no binding assigned, default value of a zeroed region
> + * @XE_VRAM_BINDING_DEVICE: device-level region aggregating all tile VRAM regions
> + * @XE_VRAM_BINDING_TILE: VRAM region bound to a tile
> + */
> +enum xe_vram_binding {
> +	XE_VRAM_BINDING_NONE = 0,
> +	XE_VRAM_BINDING_DEVICE,
> +	XE_VRAM_BINDING_TILE,
> +};
> +
> +/**
> + * enum xe_vram_pool_purpose - What a VRAM pool serves
> + * @XE_VRAM_POOL_GENERAL: general-purpose memory, available to userspace
> + * @XE_VRAM_POOL_KERNEL: kernel-only memory, never exposed to userspace
> + */
> +enum xe_vram_pool_purpose {
> +	XE_VRAM_POOL_GENERAL = 0,
> +	XE_VRAM_POOL_KERNEL,
> +};
> +
> +/**
> + * XE_VRAM_MAX_PARTITIONS - Max partitions a single VRAM region can be split into
> + *
> + * A region currently holds its default pool and at most one pool dedicated
> + * to another purpose. The TTM manager mirrors the partitions of a region one
> + * by one, so a region cannot hold more of them than the manager can back.
> + */
> +#define XE_VRAM_MAX_PARTITIONS	XE_TTM_VRAM_MGR_MAX_PARTS
> +
> +/**
> + * DOC: VRAM pools, regions and partitions
> + *
> + * Allocation paths place memory through a struct xe_vram_pool. A pool names
> + * a purpose (general-purpose, kernel-only ...) and resolves to a TTM
> + * placement plus the address range serving it, see xe_vram_pool_place().
> + * Whether that range is the whole region, or one of several partitions
> + * sharing a region, is a backend detail pool consumers do not need to know.
> + *
> + * A struct xe_vram_region is the physical carrier: it owns the BAR mapping,
> + * the DPA range and the TTM resource manager. A non-aggregate region
> + * initially contains one partition spanning its whole usable range. That
> + * partition is the region's default, general-purpose pool. It always
> + * occupies partitions[0].
> + *
> + * Each partition is described by a struct xe_vram_pool embedded in the
> + * region, so a pointer published during initialization remains valid if a
> + * later split changes the pool's offset and size. A split never changes a
> + * pool's purpose and may only happen before the region's TTM manager is
> + * initialized.
> + *
> + * The device aggregate described below is the only region type that has no
> + * manager and no partitions.
> + *
> + * The id shown below is the VRAM region instance id. For a tile region it
> + * is the id of the tile, which the uAPI relies on. The pair (binding, id)
> + * must uniquely identify a region.
> + *
> + * Partitioned region:
> + * A tile's VRAM region can be split so that a pool dedicated to some purpose,
> + * e.g. kernel-only, gets a range of its own and the default pool keeps the
> + * rest. The dedicated partition is carved out at the start of the region, at
> + * the lowest addresses, and takes the next free index. The default partition
> + * keeps index 0 and is moved above the dedicated range. A tile without such
> + * a reservation keeps one partition spanning the whole usable range::
> + *
> + *         xe_vram_region "tile0" (VRAM region id 0, binding TILE)
> + *         ,-------------------------------------------------------------.
> + *         | ttm: struct xe_ttm_vram_mgr (one manager, shared)           |
> + *         | .---------------------------------------------------------. |
> + *         | |  partitions[1]            |  partitions[0]              | |
> + *         | |  offset 0                 |  offset pool_size           | |
> + *         | |  size   pool_size         |  size   usable - pool_size  | |
> + *         | `---------------------------------------------------------' |
> + *         `-------------------------------------------------------------'
> + *                  ^                               ^
> + *                  |                               |
> + *             dedicated pool                  general-purpose pool
> + *
> + *         xe_vram_region "tile1" (VRAM region id 1, binding TILE)
> + *         ,-------------------------------------------------------------.
> + *         | ttm: struct xe_ttm_vram_mgr (one manager)                   |
> + *         | .---------------------------------------------------------. |
> + *         | |  partitions[0]                                          | |
> + *         | |  offset 0                                               | |
> + *         | |  size   whole usable range                              | |
> + *         | `---------------------------------------------------------' |
> + *         `-------------------------------------------------------------'
> + *                                     ^
> + *                                     |
> + *                            general-purpose pool
> + *
> + * Device aggregate:
> + * A device-level aggregate region is unrelated to the tile regions. It is
> + * never backed by a resource manager and has no partitions. It only
> + * aggregates the sizes and DPA ranges of every tile for reporting purposes.
> + * Nothing is ever allocated from it::
> + *
> + *         xe_vram_region "device" (VRAM region id 0, binding DEVICE)
> + *         ,-------------------------------------------------------------.
> + *         | ttm:        unused, not backed by any resource manager      |
> + *         | partitions: none, this region is never allocated from       |
> + *         | size:       total VRAM summed across all tiles              |
> + *         `-------------------------------------------------------------'
> + */
> +
> +/**
> + * struct xe_vram_pool - VRAM range used for a given allocation purpose
> + *
> + * VRAM allocations are placed through this frontend. It identifies an
> + * allocation purpose and resolves it to a TTM placement and the address
> + * range serving it. Whether that range is a whole region of its own - and
> + * thus has its own placement, mapping and address range - or one of several
> + * partitions of a region is a backend detail the allocation paths do not
> + * need to know, see xe_vram_pool_place().
> + *
> + * A pool stays valid for the lifetime of its region and its purpose is fixed
> + * once published.
> + */
> +struct xe_vram_pool {
> +	/** @region: region this pool belongs to */
> +	struct xe_vram_region *region;
> +	/**
> +	 * @part: TTM partition backing this pool, or NULL until the manager
> +	 * is initialized
> +	 */
> +	struct xe_ttm_vram_mgr_part *part;
> +	/** @offset: byte offset of the pool from the start of @region */
> +	u64 offset;
> +	/** @size: size of the pool in bytes */
> +	u64 size;
> +	/** @purpose: allocation purpose served by this pool */
> +	enum xe_vram_pool_purpose purpose;
> +};

Can this not somehow be merged with the zone? Or why does this need to 
be a separate layer on top?

> +
>   /**
>    * struct xe_vram_region - memory region structure
>    * This is used to describe a memory region in xe
> @@ -26,9 +162,11 @@ struct xe_vram_region {
>   	/**
>   	 * @id: VRAM region instance id
>   	 *
> -	 * The value should be unique for VRAM region.
> +	 * The pair (@binding, @id) must uniquely identify a VRAM region.
>   	 */
>   	u8 id;
> +	/** @binding: VRAM region instance binding */
> +	enum xe_vram_binding binding;
>   	/** @io_start: IO start address of this VRAM instance */
>   	resource_size_t io_start;
>   	/**
> @@ -57,6 +195,25 @@ struct xe_vram_region {
>   	 * (e.g stolen mem)
>   	 */
>   	resource_size_t actual_physical_size;
> +	/**
> +	 * @partitions: partitions this region is split into
> +	 *
> +	 * A non-aggregate region initially has @partitions[0] spanning its
> +	 * whole usable range. It is the region's default, general-purpose
> +	 * pool. An optional split may adjust its range and create another
> +	 * partition before the TTM resource manager is initialized.
> +	 *
> +	 * A device aggregate region has no partitions. Allocation paths do
> +	 * not take a region pointer, they take a &xe_vram_pool pointing into
> +	 * this array, see the DOC above.
> +	 */
> +	struct xe_vram_pool partitions[XE_VRAM_MAX_PARTITIONS];
> +	/**
> +	 * @num_partitions: number of valid entries in @partitions
> +	 *
> +	 * Zero for a device aggregate region.
> +	 */
> +	unsigned int num_partitions;
>   	/** @mapping: pointer to VRAM mappable space */
>   	void __iomem *mapping;
>   	/** @ttm: VRAM TTM manager */

