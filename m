Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A87CC7EE22
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 17:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A31710E3B4;
	Tue,  9 May 2023 17:25:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4AD10E3B4
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 17:25:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 459EA62B5D;
 Tue,  9 May 2023 17:25:41 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 8AD75C433EF;
 Tue,  9 May 2023 17:25:38 +0000 (UTC)
Date: Tue, 9 May 2023 13:25:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Message-ID: <ZFqCEBcGqDFxTN/F@rdvivi-mobl4>
References: <20230508134823.585186-1-himal.prasad.ghimiray@intel.com>
 <22d0494f-0db8-01b2-7611-8d43b2d79e2b@intel.com>
 <MW4PR11MB705692159947D102BB4E3F0BB3769@MW4PR11MB7056.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW4PR11MB705692159947D102BB4E3F0BB3769@MW4PR11MB7056.namprd11.prod.outlook.com>
Subject: Re: [Intel-xe] [RFC 1/1] drm/xe: Notify Userspace when engine/gt
 reset fails.
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

On Tue, May 09, 2023 at 06:28:07AM +0000, Ghimiray, Himal Prasad wrote:
> 
> 
> > -----Original Message-----
> > From: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>
> > Sent: 09 May 2023 10:42
> > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> > xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Subject: Re: [RFC 1/1] drm/xe: Notify Userspace when engine/gt reset fails.
> > 
> > 
> > 
> > On 08-05-2023 19:18, Himal Prasad Ghimiray wrote:
> > > Send uevent in case of engine reset or gt reset failure.
> > > L0 sysman would like to generate device reset needed event when gt
> > > reset fails
> > > https://one-api.gitlab-pages.devtools.intel.com/level_zero/sysman/api.
> > > html#_CPPv441ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIRED
> > This could rather be an intimation to userpace monitoring tool to do the
> > device level reset/reboot when GT reset fails. udevadm can be used to
> > monitor the uevents.
> Hmm. Makes sense. 
> > 
> > @rodrigo, your thoughts?

It would be awesome if this is an indication that user space needs to call
FLR/SBR... so we would do this when we are unable to reset ("wedged")

but let's get some confirmation on the true meaning before moving on...

> > 
> > 
> > >
> > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt.c         | 18 ++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_guc.h        | 18 ++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_guc_submit.c | 23 +++++++++++++++++++++++
> > >  include/uapi/drm/xe_drm.h          |  8 ++++++++
> > >  4 files changed, 67 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index 3afca3dd9657..2c3ffa1db74e 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -8,6 +8,7 @@
> > >  #include <linux/minmax.h>
> > >
> > >  #include <drm/drm_managed.h>
> > > +#include <drm/xe_drm.h>
> > >
> > >  #include "regs/xe_gt_regs.h"
> > >  #include "xe_bb.h"
> > > @@ -590,6 +591,20 @@ static int do_gt_restart(struct xe_gt *gt)
> > >  	return 0;
> > >  }
> > >
> > > +static void xe_uevent_gt_reset_failure(struct xe_device *xe, u8 id) {
> > > +	char *reset_event[5];
> > > +
> > > +	reset_event[0] = XE_RESET_FAILED_UEVENT "=1";
> > > +	reset_event[1] = "RESET_ENABLED=1";
> > > +	reset_event[2] = "RESET_UNIT=gt";
> > > +	reset_event[3] = kasprintf(GFP_KERNEL, "RESET_ID=%d", id);
> > > +	reset_event[4] = NULL;
> > > +	kobject_uevent_env(&xe->drm.primary->kdev->kobj,
> > KOBJ_CHANGE,
> > > +reset_event);
> > > +
> > > +	kfree(reset_event[3]);
> > > +}
> > > +
> > >  static int gt_reset(struct xe_gt *gt)  {
> > >  	struct xe_device *xe = gt_to_xe(gt); @@ -639,6 +654,9 @@ static int
> > > gt_reset(struct xe_gt *gt)
> > >  	xe_device_mem_access_put(gt_to_xe(gt));
> > >  	drm_err(&xe->drm, "GT reset failed, err=%d\n", err);
> > >
> > > +	/* Notify userspace about gt reset failure */
> > > +	xe_uevent_gt_reset_failure(xe, gt->info.id);
> > > +
> > >  	return err;
> > >  }
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> > > index 74a74051f354..845c57b95562 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > > @@ -56,4 +56,22 @@ static inline u16 xe_engine_class_to_guc_class(enum
> > xe_engine_class class)
> > >  	}
> > >  }
> > >
> > > +static inline u16 xe_guc_class_to_engine_class(u8 guc_class) {
> > > +	switch (guc_class) {
> > > +	case GUC_RENDER_CLASS:
> > > +		return XE_ENGINE_CLASS_RENDER;
> > > +	case GUC_VIDEO_CLASS:
> > > +		return XE_ENGINE_CLASS_VIDEO_DECODE;
> > > +	case GUC_VIDEOENHANCE_CLASS:
> > > +		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
> > > +	case GUC_BLITTER_CLASS:
> > > +		return XE_ENGINE_CLASS_COPY;
> > > +	case GUC_COMPUTE_CLASS:
> > > +		return XE_ENGINE_CLASS_COMPUTE;
> > > +	default:
> > > +		XE_WARN_ON(guc_class);
> > > +		return -1;
> > > +	}
> > > +}
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index e857013070b9..663908573d5c 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -12,6 +12,7 @@
> > >  #include <linux/dma-fence-array.h>
> > >
> > >  #include <drm/drm_managed.h>
> > > +#include <drm/xe_drm.h>
> > >
> > >  #include "regs/xe_lrc_layout.h"
> > >  #include "xe_device.h"
> > > @@ -1589,9 +1590,25 @@ int
> > xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> > >  	return 0;
> > >  }
> > >
> > > +static void xe_uevent_engine_reset_failure(struct xe_device *xe,
> > > +const char *name) {
> > > +	char *reset_event[5];
> > > +
> > > +	reset_event[0] = XE_RESET_FAILED_UEVENT "=1";
> > > +	reset_event[1] = "RESET_ENABLED=1";
> > > +	reset_event[2] = "RESET_UNIT=engine";
> > > +	reset_event[3] = kasprintf(GFP_KERNEL, "RESET_ID=%s", name);
> > > +	reset_event[4] = NULL;
> > > +	kobject_uevent_env(&xe->drm.primary->kdev->kobj,
> > KOBJ_CHANGE,
> > > +reset_event);
> > > +
> > > +	kfree(reset_event[3]);
> > > +}
> > > +
> > >  int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg,
> > > u32 len)  {
> > >  	struct xe_device *xe = guc_to_xe(guc);
> > > +	struct xe_hw_engine *hwe;
> > > +	u16 engine_class;
> > >  	u8 guc_class, instance;
> > >  	u32 reason;
> > >
> > > @@ -1608,6 +1625,12 @@ int xe_guc_engine_reset_failure_handler(struct
> > xe_guc *guc, u32 *msg, u32 len)
> > >  	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d
> > because 0x%08X",
> > >  		guc_class, instance, reason);
> > >
> > > +	engine_class = xe_guc_class_to_engine_class(guc_class);
> > > +	hwe = xe_gt_hw_engine(guc_to_gt(guc), engine_class, instance,
> > > +false);
> > 
> > this can return NULL, so a check is needed here.
> Will address in next patch.
> > 
> > Thanks,
> > Aravind.
> > > +
> > > +	/* Notify userspace about engine reset failure */
> > > +	xe_uevent_engine_reset_failure(xe, hwe->name);
> > > +
> > >  	xe_gt_reset_async(guc_to_gt(guc));
> > >
> > >  	return 0;
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index b0b80aae3ee8..79ef5947c172 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -36,6 +36,14 @@ extern "C" {
> > >   * subject to backwards-compatibility constraints.
> > >   */
> > >
> > > +/*
> > > + * Uevents generated by xe on it's device node.
> > > + *
> > > + * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset
> > engine
> > > + *	or gt fails. The value supplied with the event is always 1.
> > > + */
> > > +#define XE_RESET_FAILED_UEVENT "RESET_FAILED"
> > > +
> > >  /**
> > >   * struct xe_user_extension - Base class for defining a chain of extensions
> > >   *
