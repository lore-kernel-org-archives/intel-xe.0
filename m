Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DBCC77B7D
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 17:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234BB10E3AA;
	Thu, 18 May 2023 17:35:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC3E10E36A
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 17:35:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 850D0601D7;
 Thu, 18 May 2023 17:35:54 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 1D03EC433EF;
 Thu, 18 May 2023 17:35:50 +0000 (UTC)
Date: Thu, 18 May 2023 13:35:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZGZh8wRDebcvlEUu@rdvivi-mobl4>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-3-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-3-matthew.d.roper@intel.com>
Subject: Re: [Intel-xe] [PATCH 02/26] drm/xe: Introduce xe_tile
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 08:46:58PM -0700, Matt Roper wrote:
> Create a new xe_tile structure to begin separating the concept of "tile"
> from "GT."  A tile is effectively a complete GPU, and a GT is just one
> part of that.  On platforms like MTL, there's only a single full GPU
> (tile) which has its IP blocks provided by two GTs.  In contrast, a
> "multi-tile" platform like PVC is basically multiple complete GPUs
> packed behind a single PCI device.
> 
> For now, just create xe_tile as a simple wrapper around xe_gt.  The
> items in xe_gt that are truly tied to the tile rather than the GT will
> be moved in future patches.  Support for multiple GTs per tile (i.e.,
> the MTL standalone media case) will also be re-introduced in a future
> patch.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.h       | 11 +++++---
>  drivers/gpu/drm/xe/xe_device_types.h | 40 +++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_gt_types.h     | 15 +++++++----
>  drivers/gpu/drm/xe/xe_mmio.c         | 13 ++++-----
>  drivers/gpu/drm/xe/xe_pci.c          |  5 +++-
>  drivers/gpu/drm/xe/xe_vm.c           |  2 +-
>  drivers/gpu/drm/xe/xe_vm_types.h     |  8 +++---
>  7 files changed, 71 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index cbae480a2092..f7acaf51a1fc 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -48,12 +48,17 @@ static inline struct xe_file *to_xe_file(const struct drm_file *file)
>  	return file->driver_priv;
>  }
>  
> +static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
> +{
> +	return &xe->tiles[0];
> +}
> +
>  static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
>  {
>  	struct xe_gt *gt;
>  
> -	XE_BUG_ON(gt_id > XE_MAX_GT);
> -	gt = xe->gt + gt_id;
> +	XE_BUG_ON(gt_id > XE_MAX_TILES_PER_DEVICE);
> +	gt = &xe->tiles[gt_id].primary_gt;
>  	XE_BUG_ON(gt->info.id != gt_id);
>  	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
>  
> @@ -65,7 +70,7 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
>   */
>  static inline struct xe_gt *to_gt(struct xe_device *xe)
>  {
> -	return xe->gt;
> +	return &xe_device_get_root_tile(xe)->primary_gt;
>  }
>  
>  static inline bool xe_device_guc_submission_enabled(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6490a04614ce..5dcf1695925f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -34,7 +34,7 @@
>  
>  #define XE_GT0		0
>  #define XE_GT1		1
> -#define XE_MAX_GT	(XE_GT1 + 1)
> +#define XE_MAX_TILES_PER_DEVICE	(XE_GT1 + 1)
>  
>  #define XE_MAX_ASID	(BIT(20))
>  
> @@ -48,6 +48,40 @@
>  	 (_xe)->info.step.graphics >= (min_step) &&			\
>  	 (_xe)->info.step.graphics < (max_step))
>  
> +#define tile_to_xe(tile__)								\
> +	_Generic(tile__,								\
> +		 const struct xe_tile *: (const struct xe_device *)((tile__)->xe),	\
> +		 struct xe_tile *: (tile__)->xe)
> +
> +/**
> + * struct xe_tile - hardware tile structure
> + *
> + * From a driver perspective, a "tile" is effectively a complete GPU, containing
> + * an SGunit, 1-2 GTs, and (for discrete platforms) VRAM.
> + *
> + * Multi-tile platforms effectively bundle multiple GPUs behind a single PCI
> + * device and designate one "root" tile as being responsible for external PCI
> + * communication.  PCI BAR0 exposes the GGTT and MMIO register space for each
> + * tile in a stacked layout, and PCI BAR2 exposes the local memory associated
> + * with each tile similarly.  Device-wide interrupts can be enabled/disabled
> + * at the root tile, and the MSTR_TILE_INTR register will report which tiles
> + * have interrupts that need servicing.
> + */
> +struct xe_tile {
> +	/** @xe: Backpointer to tile's PCI device */
> +	struct xe_device *xe;
> +
> +	/** @id: ID of the tile */
> +	u8 id;
> +
> +	/**
> +	 * @primary_gt: Primary GT
> +	 */
> +	struct xe_gt primary_gt;
> +
> +	/* TODO: Add media GT here */
> +};
> +
>  /**
>   * struct xe_device - Top level struct of XE device
>   */
> @@ -248,8 +282,8 @@ struct xe_device {
>  	/** @ordered_wq: used to serialize compute mode resume */
>  	struct workqueue_struct *ordered_wq;
>  
> -	/** @gt: graphics tile */
> -	struct xe_gt gt[XE_MAX_GT];
> +	/** @tiles: device tiles */
> +	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
>  
>  	/**
>  	 * @mem_access: keep track of memory access in the device, possibly
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 7c47d67aa8be..e0ed4508269b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -77,12 +77,17 @@ enum xe_steering_type {
>  };
>  
>  /**
> - * struct xe_gt - Top level struct of a graphics tile
> + * struct xe_gt - A "Graphics Technology" unit of the GPU
>   *
> - * A graphics tile may be a physical split (duplicate pieces of silicon,
> - * different GGTT + VRAM) or a virtual split (shared GGTT + VRAM). Either way
> - * this structure encapsulates of everything a GT is (MMIO, VRAM, memory
> - * management, microcontrols, and a hardware set of engines).
> + * A GT ("Graphics Technology") is the subset of a GPU primarily responsible
> + * for implementing the graphics and/or media IP.  It encapsulates the hardware

"what about compute?" we will hear this a lot

I know, the graphics portion is the one for 3D + compute, but we probably
need to be very clear in the documentation here.

> + * engines, programmable execution units, and GuC.   Each GT has its own
> + * handling of power management (RC6+forcewake) and multicast register
> + * steering.
> + *
> + * A GPU/tile may have a single GT that supplies all graphics and media
> + * functionality, or the graphics and media may be split into separate GTs
> + * within a tile.
>   */
>  struct xe_gt {
>  	/** @xe: backpointer to XE device */
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 4804616a3c44..254b4a63d901 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -399,6 +399,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  		  struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>  	struct drm_xe_mmio *args = data;
>  	unsigned int bits_flag, bytes;
>  	struct xe_reg reg;
> @@ -440,7 +441,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  	 */
>  	reg = XE_REG(args->addr);
>  
> -	xe_force_wake_get(gt_to_fw(&xe->gt[0]), XE_FORCEWAKE_ALL);
> +	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  
>  	if (args->flags & DRM_XE_MMIO_WRITE) {
>  		switch (bits_flag) {
> @@ -449,10 +450,10 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  				ret = -EINVAL;
>  				goto exit;
>  			}
> -			xe_mmio_write32(to_gt(xe), reg, args->value);
> +			xe_mmio_write32(gt, reg, args->value);
>  			break;
>  		case DRM_XE_MMIO_64BIT:
> -			xe_mmio_write64(to_gt(xe), reg, args->value);
> +			xe_mmio_write64(gt, reg, args->value);
>  			break;
>  		default:
>  			drm_dbg(&xe->drm, "Invalid MMIO bit size");
> @@ -467,10 +468,10 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  	if (args->flags & DRM_XE_MMIO_READ) {
>  		switch (bits_flag) {
>  		case DRM_XE_MMIO_32BIT:
> -			args->value = xe_mmio_read32(to_gt(xe), reg);
> +			args->value = xe_mmio_read32(gt, reg);
>  			break;
>  		case DRM_XE_MMIO_64BIT:
> -			args->value = xe_mmio_read64(to_gt(xe), reg);
> +			args->value = xe_mmio_read64(gt, reg);
>  			break;
>  		default:
>  			drm_dbg(&xe->drm, "Invalid MMIO bit size");
> @@ -482,7 +483,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  	}
>  
>  exit:
> -	xe_force_wake_put(gt_to_fw(&xe->gt[0]), XE_FORCEWAKE_ALL);
> +	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index bf2c234c4f6e..e79b16d8bf7f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -525,7 +525,10 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.step = xe_step_get(xe);
>  
>  	for (id = 0; id < xe->info.tile_count; ++id) {
> -		gt = xe->gt + id;
> +		xe->tiles[id].xe = xe;
> +		xe->tiles[id].id = id;
> +
> +		gt = &xe->tiles[id].primary_gt;
>  		gt->info.id = id;
>  		gt->xe = xe;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0a4becdf4675..fe6abb6ed6ca 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3347,7 +3347,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  	struct xe_device *xe = vma->vm->xe;
>  	struct xe_gt *gt;
>  	u32 gt_needs_invalidate = 0;
> -	int seqno[XE_MAX_GT];
> +	int seqno[XE_MAX_TILES_PER_DEVICE];
>  	u8 id;
>  	int ret;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index fada7896867f..203ba9d946b8 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -159,7 +159,7 @@ struct xe_vm {
>  	struct kref refcount;
>  
>  	/* engine used for (un)binding vma's */
> -	struct xe_engine *eng[XE_MAX_GT];
> +	struct xe_engine *eng[XE_MAX_TILES_PER_DEVICE];
>  
>  	/** Protects @rebind_list and the page-table structures */
>  	struct dma_resv resv;
> @@ -167,9 +167,9 @@ struct xe_vm {
>  	u64 size;
>  	struct rb_root vmas;
>  
> -	struct xe_pt *pt_root[XE_MAX_GT];
> -	struct xe_bo *scratch_bo[XE_MAX_GT];
> -	struct xe_pt *scratch_pt[XE_MAX_GT][XE_VM_MAX_LEVEL];
> +	struct xe_pt *pt_root[XE_MAX_TILES_PER_DEVICE];
> +	struct xe_bo *scratch_bo[XE_MAX_TILES_PER_DEVICE];
> +	struct xe_pt *scratch_pt[XE_MAX_TILES_PER_DEVICE][XE_VM_MAX_LEVEL];
>  
>  	/** @flags: flags for this VM, statically setup a creation time */
>  #define XE_VM_FLAGS_64K			BIT(0)
> -- 
> 2.40.0
> 
