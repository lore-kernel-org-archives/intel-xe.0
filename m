Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D462EB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 20:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC4610E056;
	Fri, 14 Jul 2023 20:25:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C6210E056
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 20:25:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8416B61DE3;
 Fri, 14 Jul 2023 20:25:12 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 4909CC433C8;
 Fri, 14 Jul 2023 20:25:10 +0000 (UTC)
Date: Fri, 14 Jul 2023 16:25:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Message-ID: <ZLGvJPFl9+O3G5Of@rdvivi-mobl4>
References: <20230530103421.2824622-1-sujaritha.sundaresan@intel.com>
 <20230530103421.2824622-2-sujaritha.sundaresan@intel.com>
 <87a5xlhxq1.wl-ashutosh.dixit@intel.com>
 <f752470d-2c71-9545-7805-0d3128c3b04d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f752470d-2c71-9545-7805-0d3128c3b04d@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/1] [RFC]drm/xe: Adding throttle reasons
 sysfs attributes
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jul 10, 2023 at 03:20:41PM +0530, Sundaresan, Sujaritha wrote:
> 
> On 5/31/2023 11:02 AM, Dixit, Ashutosh wrote:
> > On Tue, 30 May 2023 03:34:21 -0700, Sujaritha Sundaresan wrote:
> > Hi Suja,
> > 
> > > Adding throttle reasons sysfs attributes.
> > I am not sure about the location for these sysfs files. And whether or not
> > these are being exposed using hwmon or not in xe. I believe the patch will
> > have to wait for someone like Rodrigo to look at (unless another xe
> > developer knows) but we can fix other things meanwhile.
> > 
> > Also one more comment: didn't we want to expose the upper 16 bits too (the
> > log bits) or only the lower 16 bits (status bits)? Though the log bits can
> > be a separate patch too.
> > 
> > > Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 12 +++++
> > >   drivers/gpu/drm/xe/xe_guc_pc.c       | 67 ++++++++++++++++++++++++++++
> > >   2 files changed, 79 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index e64e5c0733d6..e7fe8a3e348e 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -374,4 +374,16 @@
> > >   #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
> > >   #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
> > > 
> > > +#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
> > > +#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> > > +#define   PROCHOT_MASK				REG_BIT(0)
> > > +#define   THERMAL_LIMIT_MASK			REG_BIT(1)
> > > +#define   RATL_MASK				REG_BIT(5)
> > > +#define   VR_THERMALERT_MASK			REG_BIT(6)
> > > +#define   VR_TDC_MASK				REG_BIT(7)
> > > +#define   POWER_LIMIT_4_MASK			REG_BIT(8)
> > > +#define   POWER_LIMIT_1_MASK			REG_BIT(10)
> > > +#define   POWER_LIMIT_2_MASK			REG_BIT(11)
> > > +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
> > > +
> > >   #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > index e799faa1c6b8..363332881e4d 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > @@ -638,6 +638,73 @@ static const struct attribute *pc_attrs[] = {
> > > 	NULL
> > >   };
> > > 
> > > +static inline
> > > +xe_reg_t xe_gt_perf_limit_reasons_reg(struct xe_gt *gt)
> > I don't see xe_reg_t being typedef'd anywhere, only 'struct xe_reg'?
> > 
> > > +{
> > > +        if (xe_gt_is_media_type(gt))
> > > +                return MTL_MEDIA_PERF_LIMIT_REASONS;
> > > +
> > > +        return GT0_PERF_LIMIT_REASONS;
> > > +}
> > > +
> > > +struct xe_gt_bool_throttle_attr {
> > > +	struct attribute attr;
> > > +	ssize_t (*show)(struct device *dev, struct device_attribute *attr,
> > > +			char *buf);
> > > +	xe_reg_t (*reg32)(struct xe_gt *gt);
> > > +	u32 mask;
> > > +};
> > > +
> > > +bool xe_mmio_mask_read(struct xe_gt *gt,
> > > +			xe_reg_t reg32, u32 mask)
> > > +{
> > > +	return xe_mmio_read32(gt, reg32) & mask;
> > > +}
> > > +
> > > +static ssize_t throttle_reason_bool_show(struct device *dev,
> > > +					 struct device_attribute *attr,
> > > +					 char *buff)
> > > +{
> > > +	struct kobject *kobj = &dev->kobj;
> > > +	struct xe_gt *gt = kobj_to_gt(kobj);
> > > +	struct xe_gt_bool_throttle_attr *t_attr =
> > > +			(struct xe_gt_bool_throttle_attr *) attr;
> > > +	bool val = xe_mmio_mask_read(&gt->rps, t_attr->reg32(gt), t_attr->mask);
> > > +
> > > +	return sysfs_emit(buff, "%u\n", val);
> > > +}
> > > +
> > > +#define XE_GT_BOOL_ATTR_RO(sysfs_func__, mask__) \
> > > +struct xe_gt_bool_throttle_attr attr_##sysfs_func__ = { \
> > > +	.attr = { .name = __stringify(sysfs_func__), .mode = 0444 }, \
> > > +	.show = throttle_reason_bool_show, \
> > > +	.reg32 = xe_gt_perf_limit_reasons_reg, \
> > > +	.mask = mask__, \
> > > +}
> > > +
> > > +static XE_GT_BOOL_ATTR_RO(throttle_reason_status, GT0_PERF_LIMIT_REASONS_MASK);
> > > +static XE_GT_BOOL_ATTR_RO(throttle_reason_pl1, POWER_LIMIT_1_MASK);
> > > +static XE_GT_BOOL_ATTR_RO(throttle_reason_pl2, POWER_LIMIT_2_MASK);
> > > +static XE_GT_BOOL_ATTR_RO(throttle_reason_pl4, POWER_LIMIT_4_MASK);
> > > +static XE_GT_BOOL_ATTR_RO(throttle_reason_thermal, THERMAL_LIMIT_MASK);
> > > +static XE_GT_BOOL_ATTR_RO(throttle_reason_prochot, PROCHOT_MASK);
> > > +static XE_GT_BOOL_ATTR_RO(throttle_reason_ratl, RATL_MASK);
> > > +static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_thermalert, VR_THERMALERT_MASK);
> > > +static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_tdc, VR_TDC_MASK);
> > > +
> > > +static const struct attribute *throttle_reason_attrs[] = {
> > > +	&dev_attr_throttle_reason_status.attr,
> > > +	&dev_attr_throttle_reason_pl1.attr,
> > > +	&dev_attr_throttle_reason_pl2.attr,
> > > +	&dev_attr_throttle_reason_pl4.attr,
> > > +	&dev_attr_throttle_reason_thermal.attr,
> > > +	&dev_attr_throttle_reason_prochot.attr,
> > > +	&dev_attr_throttle_reason_ratl.attr,
> > > +	&dev_attr_throttle_reason_vr_thermalert.attr,
> > > +	&dev_attr_throttle_reason_vr_tdc.attr,
> > > +	NULL
> > > +};
> > Also don't see these attributes actually being created, using
> > sysfs_create_files etc. So has this patch been compiled/tested?
> > 
> > > +
> > >   static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
> > >   {
> > > 	struct xe_gt *gt = pc_to_gt(pc);
> > > --
> > > 2.25.1
> > > 
> > Thanks.
> > --
> > Ashutosh
> 
> 
> Hi Ashutosh,
> 
> This was just a very basic non functional RFC patch meant to clarify the
> path/location of these sysfs attributes.
> 
> It's not a usable patch.
> 
> Rodrigo, could you help clarify whether we are intending to expose throttle
> reasons via hwmon in Xe ?

The current trend is to not use hwmon for frequency like we are not using for
i915. So the throttle wouldn't make sense there.

For now let's move ahead with throttle near our freq setting sysfs. Then,
if we end up moving freq towards hwmon (or something else) then we move
throttle along.

Sorry for the delay in responding here.

Thanks,
Rodrigo.

> 
> Regards,
> 
> Suja
> 
