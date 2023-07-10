Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87127EB64DA
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 16:59:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583B610E2AB;
	Mon, 10 Jul 2023 16:59:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4927A10E2AB
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 16:59:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 91BA761063;
 Mon, 10 Jul 2023 16:59:02 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id AADCEC433C8;
 Mon, 10 Jul 2023 16:58:59 +0000 (UTC)
Date: Mon, 10 Jul 2023 12:58:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Message-ID: <ZKw40ZEPac5HBC7o@rdvivi-mobl4>
References: <20230509082558.614913-1-himal.prasad.ghimiray@intel.com>
 <def394d8-f723-d036-d5c1-a249ede937d4@intel.com>
 <MW4PR11MB70569ED202909F1F60C3F578B3749@MW4PR11MB7056.namprd11.prod.outlook.com>
 <a5b88190-7bc1-70c0-b729-dd9cf3292c08@intel.com>
 <ZGLSsQjGdV7WmQ8i@rdvivi-mobl4>
 <MW4PR11MB7056BEA4EE6416780502E933B3799@MW4PR11MB7056.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW4PR11MB7056BEA4EE6416780502E933B3799@MW4PR11MB7056.namprd11.prod.outlook.com>
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
 engine/gt reset fails.
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Argenziano, Antonio" <antonio.argenziano@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 11:41:32AM +0000, Ghimiray, Himal Prasad wrote:
> 
> 
> > -----Original Message-----
> > From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> > Sent: 16 May 2023 06:18
> > To: Nilawar, Badal <badal.nilawar@intel.com>
> > Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> > xe@lists.freedesktop.org; Harrison, John C <john.c.harrison@intel.com>;
> > Argenziano, Antonio <antonio.argenziano@intel.com>
> > Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
> > engine/gt reset fails.
> > 
> > On Mon, May 15, 2023 at 09:46:47PM +0530, Nilawar, Badal wrote:
> > >
> > >
> > > On 11-05-2023 17:13, Ghimiray, Himal Prasad wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Nilawar, Badal <badal.nilawar@intel.com>
> > > > > Sent: 11 May 2023 10:07
> > > > > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>;
> > > > > intel- xe@lists.freedesktop.org
> > > > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > > > Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace
> > > > > when engine/gt reset fails.
> > > > >
> > > > > Hi Himal,
> > > > >
> > > > > On 09-05-2023 13:55, Himal Prasad Ghimiray wrote:
> > > > > > Send uevent in case of engine reset or gt reset failure.
> > > > > > This intimation can be used by userspace monitoring tool to do
> > > > > > the device level reset/reboot when GT reset fails. udevadm can
> > > > > > be used to monitor the uevents.
> > > > > >
> > > > > > v2:
> > > > > > -Add NULL check for xe_gt_hw_engine return(Aravind) -Arrange
> > > > > > variables in Christmas tree order(Tejas) -Check
> > > > > > GUC_GSC_OTHER_CLASS(Tejas)
> > > > > >
> > > > > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > > > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > > Signed-off-by: Himal Prasad Ghimiray
> > > > > > <himal.prasad.ghimiray@intel.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/xe/xe_gt.c         | 18 ++++++++++++++++++
> > > > > >    drivers/gpu/drm/xe/xe_guc.h        | 19 +++++++++++++++++++
> > > > > >    drivers/gpu/drm/xe/xe_guc_submit.c | 23
> > +++++++++++++++++++++++
> > > > > >    include/uapi/drm/xe_drm.h          |  8 ++++++++
> > > > > >    4 files changed, 68 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c
> > > > > > b/drivers/gpu/drm/xe/xe_gt.c index 3afca3dd9657..2c3ffa1db74e
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > > > @@ -8,6 +8,7 @@
> > > > > >    #include <linux/minmax.h>
> > > > > >
> > > > > >    #include <drm/drm_managed.h>
> > > > > > +#include <drm/xe_drm.h>
> > > > > >
> > > > > >    #include "regs/xe_gt_regs.h"
> > > > > >    #include "xe_bb.h"
> > > > > > @@ -590,6 +591,20 @@ static int do_gt_restart(struct xe_gt *gt)
> > > > > >    	return 0;
> > > > > >    }
> > > > > >
> > > > > > +static void xe_uevent_gt_reset_failure(struct xe_device *xe, u8 id)
> > {
> > > > > > +	char *reset_event[5];
> > > > > > +
> > > > > > +	reset_event[0] = XE_RESET_FAILED_UEVENT "=1";
> > > > > > +	reset_event[1] = "RESET_ENABLED=1";
> > > > > > +	reset_event[2] = "RESET_UNIT=gt";
> > > > > > +	reset_event[3] = kasprintf(GFP_KERNEL, "RESET_ID=%d",
> > id);
> > > > > > +	reset_event[4] = NULL;
> > > > > > +	kobject_uevent_env(&xe->drm.primary->kdev->kobj,
> > KOBJ_CHANGE,
> > > > > > +reset_event);
> > > > > > +
> > > > > > +	kfree(reset_event[3]);
> > > > > > +}
> > > > > > +
> > > > > >    static int gt_reset(struct xe_gt *gt)
> > > > > >    {
> > > > > >    	struct xe_device *xe = gt_to_xe(gt); @@ -639,6 +654,9 @@
> > > > > > static int gt_reset(struct xe_gt *gt)
> > > > > >    	xe_device_mem_access_put(gt_to_xe(gt));
> > > > > >    	drm_err(&xe->drm, "GT reset failed, err=%d\n", err);
> > > > > >
> > > > > > +	/* Notify userspace about gt reset failure */
> > > > > > +	xe_uevent_gt_reset_failure(xe, gt->info.id);
> > > > > > +
> > > > > >    	return err;
> > > > > >    }
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc.h
> > > > > > b/drivers/gpu/drm/xe/xe_guc.h index 74a74051f354..a3637eeaaa37
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_guc.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > > > > > @@ -56,4 +56,23 @@ static inline u16
> > > > > > xe_engine_class_to_guc_class(enum
> > > > > xe_engine_class class)
> > > > > >    	}
> > > > > >    }
> > > > > >
> > > > > > +static inline u16 xe_guc_class_to_engine_class(u8 guc_class) {
> > > > > > +	switch (guc_class) {
> > > > > > +	case GUC_RENDER_CLASS:
> > > > > > +		return XE_ENGINE_CLASS_RENDER;
> > > > > > +	case GUC_VIDEO_CLASS:
> > > > > > +		return XE_ENGINE_CLASS_VIDEO_DECODE;
> > > > > > +	case GUC_VIDEOENHANCE_CLASS:
> > > > > > +		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
> > > > > > +	case GUC_BLITTER_CLASS:
> > > > > > +		return XE_ENGINE_CLASS_COPY;
> > > > > > +	case GUC_COMPUTE_CLASS:
> > > > > > +		return XE_ENGINE_CLASS_COMPUTE;
> > > > > > +	case GUC_GSC_OTHER_CLASS:
> > > > > > +	default:
> > > > > > +		XE_WARN_ON(guc_class);
> > > > > > +		return -1;
> > > > > > +	}
> > > > > > +}
> > > > > >    #endif
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > index e857013070b9..d068af0ca7df 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > @@ -12,6 +12,7 @@
> > > > > >    #include <linux/dma-fence-array.h>
> > > > > >
> > > > > >    #include <drm/drm_managed.h>
> > > > > > +#include <drm/xe_drm.h>
> > > > > >
> > > > > >    #include "regs/xe_lrc_layout.h"
> > > > > >    #include "xe_device.h"
> > > > > > @@ -1589,10 +1590,26 @@ int
> > > > > xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32
> > > > > *msg,
> > > > > >    	return 0;
> > > > > >    }
> > > > > >
> > > > > > +static void xe_uevent_engine_reset_failure(struct xe_device
> > > > > > +*xe, const char *name) {
> > > > > > +	char *reset_event[5];
> > > > > > +
> > > > > > +	reset_event[0] = XE_RESET_FAILED_UEVENT "=1";
> > > > > > +	reset_event[1] = "RESET_ENABLED=1";
> > > > > > +	reset_event[2] = "RESET_UNIT=engine";
> > > > > > +	reset_event[3] = kasprintf(GFP_KERNEL, "RESET_ID=%s",
> > name);
> > > > > > +	reset_event[4] = NULL;
> > > > > > +	kobject_uevent_env(&xe->drm.primary->kdev->kobj,
> > KOBJ_CHANGE,
> > > > > > +reset_event);
> > > > > > +
> > > > > > +	kfree(reset_event[3]);
> > > > > > +}
> > > > > > +
> > > > > >    int xe_guc_engine_reset_failure_handler(struct xe_guc *guc,
> > > > > > u32 *msg,
> > > > > u32 len)
> > > > > >    {
> > > > > >    	struct xe_device *xe = guc_to_xe(guc);
> > > > > > +	struct xe_hw_engine *hwe;
> > > > > >    	u8 guc_class, instance;
> > > > > > +	u16 engine_class;
> > > > > >    	u32 reason;
> > > > > >
> > > > > >    	if (unlikely(len != 3)) {
> > > > > > @@ -1608,6 +1625,12 @@ int
> > > > > > xe_guc_engine_reset_failure_handler(struct
> > > > > xe_guc *guc, u32 *msg, u32 len)
> > > > > >    	drm_err(&xe->drm, "GuC engine reset request failed on
> > %d:%d
> > > > > because 0x%08X",
> > > > > >    		guc_class, instance, reason);
> > > > > >
> > > > > > +	/* Notify userspace about engine reset failure */
> > > > > > +	engine_class = xe_guc_class_to_engine_class(guc_class);
> > > > > > +	hwe = xe_gt_hw_engine(guc_to_gt(guc), engine_class,
> > instance,
> > > > > > +false);The The instance here is considered as physical instance
> > > > > > +of hwe but while
> > > > > submitting contexts kmd passes logical instance to guc. With that
> > > > > I assume guc might be passing logical instance or for this
> > > > > notification it is passing physical instance?
> > > > AFAIK for reset failure notification the instance passed by guc in g2h
> > payload is physical instance .
> > > > @Harrison, John C Can you please confirm ?
> > >
> > > Spoke to @Antonio, he confirmed that to notify engine reset failure
> > > guc is reporting physical instance to host.
> > >
> > > Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> > 
> > I don't believe this is what we want here still. At least not from the sysman
> > perspective.
> > 
> > After guc reset fails, we will try to reset the GT ourselves and if we succeed
> > we don't need to request user space interference.
> > 
> > That should only happen if we also fail our gt_reset after the guc_reset
> > failed.
> > 
> > That would be the similar point on when i915 gets wedged?
> > We probably also need the wedge point here before we can issue this
> > notification?
> 
> Hi Rodrigo,
> You are right, In case of engine reset failure the driver tries to do the  gt reset
> and if gt reset fails there are two notifications one for engine failure and another for gt
> reset failure. The changes to send uevent in case of gt failure are added in xe_uevent_gt_reset_failure.
> 
> Level0 UMD does sends the RESET_REQUIRED uevent in case of only gt reset failure. 
> Engine reset failure notification is not used for this purpose, it is to provide information that engine reset was required and it failed.

isn't a debug msg enough for this case then?
if the api is not used we should not add it.

> 
> > 
> > Anyway, we also need IGT for the uevent itself.
> The IGT for uevent listener will be helpful only if we can inject errors in such a way that they lead to engine/gt reset failure.
> I am unable to find a mechanism to do so. Can you provide some input on the same ?
> BR
> Himal 
> > 
> > Thanks,
> > Rodrigo.
> > 
> > >
> > > Regards,
> > > Badal
> > > >
> > > > >
> > > > > Regards,
> > > > > Badal
> > > > > > +	if (hwe)
> > > > > > +		xe_uevent_engine_reset_failure(xe, hwe->name);
> > > > > > +
> > > > > >    	xe_gt_reset_async(guc_to_gt(guc));
> > > > > >
> > > > > >    	return 0;
> > > > > > diff --git a/include/uapi/drm/xe_drm.h
> > > > > > b/include/uapi/drm/xe_drm.h index b0b80aae3ee8..79ef5947c172
> > > > > > 100644
> > > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > > @@ -36,6 +36,14 @@ extern "C" {
> > > > > >     * subject to backwards-compatibility constraints.
> > > > > >     */
> > > > > >
> > > > > > +/*
> > > > > > + * Uevents generated by xe on it's device node.
> > > > > > + *
> > > > > > + * XE_RESET_FAILED_UEVENT - Event is generated when attempt to
> > > > > > +reset
> > > > > engine
> > > > > > + *	or gt fails. The value supplied with the event is always 1.
> > > > > > + */
> > > > > > +#define XE_RESET_FAILED_UEVENT "RESET_FAILED"
> > > > > > +
> > > > > >    /**
> > > > > >     * struct xe_user_extension - Base class for defining a chain of
> > extensions
> > > > > >     *
