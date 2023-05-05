Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A1CC77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 14:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F129310E025;
	Fri,  5 May 2023 14:40:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D67A10E624
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 14:40:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8E98663E6E;
 Fri,  5 May 2023 14:40:38 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 5B098C433EF;
 Fri,  5 May 2023 14:40:35 +0000 (UTC)
Date: Fri, 5 May 2023 10:40:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, ashutosh.dixit@intel.com
Message-ID: <ZFUVYY7vFBBsYDWr@rdvivi-mobl4>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
 <20230504112020.300498-4-tejas.upadhyay@intel.com>
 <7aa6147f-752b-27b1-9f4c-667a3d457b51@intel.com>
 <SJ1PR11MB6204AEC32DEE34A64BB33A7D816D9@SJ1PR11MB6204.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204AEC32DEE34A64BB33A7D816D9@SJ1PR11MB6204.namprd11.prod.outlook.com>
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per gt
 memory size
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 04, 2023 at 08:50:53AM -0400, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>
> > Sent: Thursday, May 4, 2023 6:14 PM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Subject: Re: [PATCH 3/3] drm/xe: Add sysfs entry to report per gt memory
> > size
> > 
> > 
> > 
> > On 04-05-2023 16:50, Tejas Upadhyay wrote:
> > > Add sysfs entry to read per gt physical memory in total including
> > > stolen memory.
> > >
> > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device_types.h |  2 +
> > >  drivers/gpu/drm/xe/xe_gt_sysfs.c     | 74 +++++++++++++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_gt_sysfs.h     |  1 -
> > >  drivers/gpu/drm/xe/xe_gt_types.h     |  7 +++
> > >  drivers/gpu/drm/xe/xe_mmio.c         |  1 +
> > >  5 files changed, 82 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 8898aea4bc2b..f6b68a3c6eeb 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -254,6 +254,8 @@ struct xe_device {
> > >  	/** @gt: graphics tile */
> > >  	struct xe_gt gt[XE_MAX_GT];
> > >
> > > +	struct kobject *sysfs_gt;
> > > +
> > >  	/**
> > >  	 * @mem_access: keep track of memory access in the device,
> > possibly
> > >  	 * triggering additional actions when they occur.
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > > b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > > index c01cc689058c..b133dd7b9d31 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > > @@ -29,12 +29,76 @@ static void gt_sysfs_fini(struct drm_device *drm,
> > void *arg)
> > >  	kobject_put(gt->sysfs);
> > >  }
> > >
> > > +typedef ssize_t (*show)(struct device *dev, struct device_attribute
> > > +*attr, char *buf);
> > > +
> > > +struct xe_ext_attr {
> > > +	struct device_attribute attr;
> > > +	show xe_show;
> > > +};
> > > +
> > > +static ssize_t
> > > +xe_sysfs_show(struct device *dev, struct device_attribute *attr, char
> > > +*buf) {
> > > +	ssize_t value;
> > > +	struct xe_ext_attr *ea = container_of(attr, struct xe_ext_attr,
> > > +attr);
> > > +
> > > +	/* FIXME: Wa_16015496043 Hold forcewake on GT0 & GT1 to
> > disallow rc6 */
> > > +	value = ea->xe_show(dev, attr, buf);
> > > +
> > > +	return value;
> > > +}
> > > +
> > > +static ssize_t
> > > +addr_range_show(struct device *kdev, struct device_attribute *attr,
> > > +char *buf) {
> > > +	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
> > > +
> > > +	return sysfs_emit(buf, "%pa\n", &gt->mem.actual_physical_mem); }
> > > +
> > > +#define XE_DEVICE_ATTR_RO(_name, _show) \
> > > +	struct xe_ext_attr dev_attr_##_name = \
> > > +	{ __ATTR(_name, 0444, xe_sysfs_show, NULL), _show}
> > 
> > i do not see the use of this.
> > > +
> > > +static XE_DEVICE_ATTR_RO(addr_range, addr_range_show);
> > > +
> > > +static const struct attribute *addr_range_attrs[] = {
> > > +	/* TODO: Report any other HBM Sparing sysfs per gt? */
> > > +	&dev_attr_addr_range.attr.attr,
> > > +	NULL
> > > +};
> > > +
> > > +void xe_gt_sysfs_register_mem(struct xe_gt *gt, struct kobject
> > > +*parent) {
> > > +	/* FIXME: Check has_mem_sparing here */
> > > +
> > > +	if (sysfs_create_files(parent, addr_range_attrs))
> > > +		drm_err(&gt_to_xe(gt)->drm,
> > > +			"Setting up sysfs to read total physical memory per
> > tile
> > > +failed\n"); }
> > > +
> > > +static struct kobject *xe_setup_gt_sysfs(struct kobject *parent) {
> > > +	return kobject_create_and_add("gt", parent); }
> > > +
> > >  int xe_gt_sysfs_init(struct xe_gt *gt)  {
> > > -	struct device *dev = gt_to_xe(gt)->drm.dev;
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	struct device *kdev = xe->drm.primary->kdev;
> > >  	struct kobj_gt *kg;
> > >  	int err;
> > >
> > > +	/* Create sysfs dir only for primary GT to avoid dup */
> > > +	if (!gt->info.id) {
> > > +		xe->sysfs_gt = xe_setup_gt_sysfs(&kdev->kobj);
> > 
> > i'm not sure if we ever wanted to create a top level GT folder
> > 
> > @rodrigo, any thoughts?
> > 
> > > +		if (!xe->sysfs_gt) {
> > > +			drm_err(&xe->drm,
> > > +				"failed to register GT sysfs directory\n");
> > > +			return 0;
> > > +		}
> > > +	}
> > > +
> > >  	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
> > >  	if (!kg)
> > >  		return -ENOMEM;
> > > @@ -42,7 +106,7 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
> > >  	kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
> > >  	kg->gt = gt;
> > >
> > > -	err = kobject_add(&kg->base, &dev->kobj, "gt%d", gt->info.id);
> > > +	err = kobject_add(&kg->base, xe->sysfs_gt, "gt%d", gt->info.id);
> > >  	if (err) {
> > >  		kobject_put(&kg->base);
> > >  		return err;
> > > @@ -50,9 +114,15 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
> > >
> > >  	gt->sysfs = &kg->base;
> > >
> > > +	gt->sysfs_defaults = kobject_create_and_add(".defaults", gt->sysfs);
> > 
> > what is the use of defaults??
> 
> No use. There is no use I saw in i915 as well. But may be for some future use it is kept. Or I missed something. If want to remove, can be removed on objections.

Cc: Ashutosh

The defaults is used in i915 so Level-0/Sysman can perform the restore_defaults operation.

I believe it is a useful feature...

> 
> Thanks,
> Tejas
> > 
> > Thanks,
> > Aravind.
> > > +	if (!gt->sysfs_defaults)
> > > +		drm_err(&xe->drm, "failed to create gt sysfs .defaults\n");
> > > +
> > >  	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_sysfs_fini,
> > gt);
> > >  	if (err)
> > >  		return err;
> > >
> > > +	xe_gt_sysfs_register_mem(gt, gt->sysfs);
> > > +
> > >  	return 0;
> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> > > b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> > > index ecbfcc5c7d42..a8078c5992bd 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> > > @@ -15,5 +15,4 @@ kobj_to_gt(struct kobject *kobj)  {
> > >  	return container_of(kobj, struct kobj_gt, base)->gt;  }
> > > -
> > >  #endif /* _XE_GT_SYSFS_H_ */
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> > > b/drivers/gpu/drm/xe/xe_gt_types.h
> > > index 47f059bb8c6d..5615f2d65996 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > @@ -138,6 +138,11 @@ struct xe_gt {
> > >  	 * objects (virtual split)
> > >  	 */
> > >  	struct {
> > > +		/**
> > > +		 * @actual_physical_mem: Track actual LMEM size
> > > +		 * including stolen mem
> > > +		 */
> > > +		resource_size_t actual_physical_mem;
> > >  		/**
> > >  		 * @vram: VRAM info for GT, multiple GTs can point to same
> > info
> > >  		 * (virtual split), can be subset of global device VRAM @@ -
> > 324,6
> > > +329,8 @@ struct xe_gt {
> > >
> > >  	/** @sysfs: sysfs' kobj used by xe_gt_sysfs */
> > >  	struct kobject *sysfs;
> > > +	/* sysfs defaults per gt */
> > > +	struct kobject *sysfs_defaults;
> > >
> > >  	/** @mocs: info */
> > >  	struct {
> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > > b/drivers/gpu/drm/xe/xe_mmio.c index 2c35a1b79be7..bc05b6c0cefb
> > 100644
> > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > @@ -296,6 +296,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> > >  		if (err)
> > >  			return err;
> > >
> > > +		gt->mem.actual_physical_mem = tile_size;
> > >  		gt->mem.vram.io_start = xe->mem.vram.io_start +
> > tile_offset;
> > >  		gt->mem.vram.io_size = min_t(u64, vram_size, io_size);
> > >
