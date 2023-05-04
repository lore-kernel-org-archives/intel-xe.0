Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563C7C77B78
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 15:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F1910E4A5;
	Thu,  4 May 2023 15:57:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E39510E4A5
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 15:57:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 95CC560BDC;
 Thu,  4 May 2023 15:57:42 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 2DD4EC433D2;
 Thu,  4 May 2023 15:57:40 +0000 (UTC)
Date: Thu, 4 May 2023 11:57:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Message-ID: <ZFPV8jPCfSio2+Zu@rdvivi-mobl4>
References: <20230503064252.830641-1-riana.tauro@intel.com>
 <20230503064252.830641-3-riana.tauro@intel.com>
 <CY5PR11MB62114419BC5C8ED03B7FAAF1956D9@CY5PR11MB6211.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB62114419BC5C8ED03B7FAAF1956D9@CY5PR11MB6211.namprd11.prod.outlook.com>
Subject: Re: [Intel-xe] [RFC PATCH 2/3] drm/xe : add rc6_residency in ms
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

On Thu, May 04, 2023 at 06:55:48AM -0400, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Tauro, Riana <riana.tauro@intel.com>
> > Sent: Wednesday, May 3, 2023 12:13 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dixit,
> > Ashutosh <ashutosh.dixit@intel.com>; Nilawar, Badal
> > <badal.nilawar@intel.com>
> > Subject: [RFC PATCH 2/3] drm/xe : add rc6_residency in ms
> > 
> > add rc6_residency in ms instead of rc6 residency counter.
> > Handle wrap around for the counter
> > The counter can still wrap as it relies on the frequency of counter being read
> > 
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_idle.c | 46 +++++++++++++++++++++++++++++----
> > ---
> >  1 file changed, 37 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_idle.c b/drivers/gpu/drm/xe/xe_idle.c
> > index 231bdb45a6b7..a7e97ddd7253 100644
> > --- a/drivers/gpu/drm/xe/xe_idle.c
> > +++ b/drivers/gpu/drm/xe/xe_idle.c
> > @@ -11,6 +11,8 @@
> >  #include "xe_idle.h"
> >  #include "xe_mmio.h"
> > 
> > +#define XE_RC6_MULTIPLIER      1280
> > +
> >  /*
> >   * Render-C States:
> >   * ================
> > @@ -27,8 +29,7 @@
> >   *
> >   * device/gt#/gpu_idle/rc* *read-only* files:
> >   * - rc_status: Provide the actual immediate status of Render-C: (rc0 or rc6)
> > - * - rc6_residency: Provide the rc6_residency in units of 1.28 uSec
> > - *		    Prone to overflows.
> > + * - rc6_residency_ms: Provide the rc6_residency in ms
> >   */
> > 
> >  static struct xe_gt *idle_to_gt(struct xe_idle *idle) @@ -51,6 +52,35 @@
> > static struct kobj_type xe_idle_kobj_type = {
> >  	.sysfs_ops = &kobj_sysfs_ops,
> >  };
> > 
> > +static u64 rc6_residency_us(struct xe_idle *idle) {
> > +	struct xe_gt *gt = idle_to_gt(idle);
> > +	u64 cur_residency, delta, overflow_residency, prev_residency;
> > +
> > +	overflow_residency = BIT_ULL(32);
> > +	cur_residency = xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
> We shall use function pointer here to get the residency, so underlying function can read from
> appropriate counter and  abstract it from sysfs show function, same comment for converting to 
> ms as well.

Yes, please!

Leave this new component as clean and free from the 'RC' stuff as possible.
Leave all RC stuff inside xe_guc_pc and then this new infra is specific for
the report and control so you can make this as generic as possible and likely
extend to other stuff.
And contain the platform stuff to the lower level.

> Br,
> Anshuman Gupta.
> > +
> > +	/*
> > +	 * Counter wrap handling
> > +	 * Store previous hw counter values for counter wrap-around
> > handling
> > +	 * Relying on sufficient frequency of queries otherwise counters can
> > still wrap.
> > +	 */
> > +	prev_residency = idle->prev_rc6_residency;
> > +	idle->prev_rc6_residency = cur_residency;
> > +
> > +	/* RC6 delta */
> > +	if (cur_residency >= prev_residency)
> > +		delta = cur_residency - prev_residency;
> > +	else
> > +		delta = cur_residency + (overflow_residency -
> > prev_residency);
> > +
> > +	/* Add delta to RC6 extended raw driver copy. */
> > +	cur_residency = idle->cur_rc6_residency + delta;
> > +	idle->cur_rc6_residency = cur_residency;
> > +
> > +	return mul_u64_u32_div(cur_residency, XE_RC6_MULTIPLIER, 1000);
> > }
> > +
> >  static ssize_t
> >  rc_status_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> > { @@ -76,11 +106,10 @@ static const struct kobj_attribute rc_status =
> > __ATTR(rc_status, 0444, rc_status_show, NULL);
> > 
> >  static ssize_t
> > -rc6_residency_show(struct kobject *kobj, struct kobj_attribute *attr, char
> > *buf)
> > +rc6_residency_ms_show(struct kobject *kobj, struct kobj_attribute
> > +*attr, char *buf)
> >  {
> >  	struct xe_idle *idle = kobj_to_idle(kobj);
> >  	struct xe_gt *gt = idle_to_gt(idle);
> > -	u32 reg;
> >  	ssize_t ret;
> > 
> >  	xe_device_mem_access_get(gt_to_xe(gt));
> > @@ -88,8 +117,7 @@ rc6_residency_show(struct kobject *kobj, struct
> > kobj_attribute *attr, char *buf)
> >  	if (ret)
> >  		goto out;
> > 
> > -	reg = xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
> > -	ret = sysfs_emit(buf, "%u\n", reg);
> > +	ret = sysfs_emit(buf, "%llu\n",
> > +DIV_ROUND_UP_ULL(rc6_residency_us(&gt->idle), 1000));
> > 
> >  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt),
> > XE_FORCEWAKE_ALL));
> >  out:
> > @@ -97,12 +125,12 @@ rc6_residency_show(struct kobject *kobj, struct
> > kobj_attribute *attr, char *buf)
> >  	return ret;
> >  }
> > 
> > -static const struct kobj_attribute rc6_residency = -__ATTR(rc6_residency,
> > 0444, rc6_residency_show, NULL);
> > +static const struct kobj_attribute rc6_residency_ms =
> > +__ATTR(rc6_residency_ms, 0444, rc6_residency_ms_show, NULL);
> > 
> >  static const struct attribute *idle_attrs[] = {
> >  	&rc_status.attr,
> > -	&rc6_residency.attr,
> > +	&rc6_residency_ms.attr,
> >  	NULL,
> >  };
> > 
> > --
> > 2.40.0
> 
