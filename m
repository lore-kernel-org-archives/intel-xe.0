Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF25C77B73
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 12:46:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDDD10E152;
	Tue, 30 May 2023 12:46:42 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A8910E152
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 12:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685450801; x=1716986801;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=g7vqLbNttUCMzZJwHvmiXBTjO1KWL/WxhL3Wi4Rwlgs=;
 b=gqleanUJUSD6QSJJVgVuWhyGBFArda6JdUyqa5bGxLXOOVjlEfmLFY/M
 h31CL5M7KWVKx67f87UjQXhWOg2IWR1ivPvoWmawSNKQk8FZR0clwkVuO
 PpKmy19wgi0P/5QcRRPYWzpap1R7DOnVZWcFlAPMugiHCKjDLEPx7cgUp
 MM82lLgOFAk1j55B9qd+mA1HlFQNjjj9ppLaGcx3GSbMuSk7dkyl7dwtS
 p4T/jGNdBteX/p2miM2nws5I9ebxnZMVfW/bwIOaLx8btMwPIN5ybUKRe
 pHv0BQbWy8twVOLxuZxzU0NensdsF4SP6o/n5/8SSJWsTC+2wiMsXNz1d g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="353743161"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="353743161"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 05:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="683948416"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="683948416"
Received: from jhogberg-mobl1.ger.corp.intel.com (HELO [10.249.254.79])
 ([10.249.254.79])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 05:46:39 -0700
Message-ID: <f6d3b687-6139-9b3e-1212-17ff2718b9d9@linux.intel.com>
Date: Tue, 30 May 2023 14:46:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230530103421.2824622-1-sujaritha.sundaresan@intel.com>
 <20230530103421.2824622-2-sujaritha.sundaresan@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230530103421.2824622-2-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

Some style comments:

On 5/30/23 12:34, Sujaritha Sundaresan wrote:
> Adding throttle reasons sysfs attributes.

Please use imperative language as per the linux patch submission 
guidelines: "Add throttle..."

Also please add a message explaining why / for what these sysfs 
attributes are needed.


>
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 12 +++++
>   drivers/gpu/drm/xe/xe_guc_pc.c       | 67 ++++++++++++++++++++++++++++
>   2 files changed, 79 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index e64e5c0733d6..e7fe8a3e348e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -374,4 +374,16 @@
>   #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>   #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>   
> +#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
> +#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> +#define   PROCHOT_MASK				REG_BIT(0)
> +#define   THERMAL_LIMIT_MASK			REG_BIT(1)
> +#define   RATL_MASK				REG_BIT(5)
> +#define   VR_THERMALERT_MASK			REG_BIT(6)
> +#define   VR_TDC_MASK				REG_BIT(7)
> +#define   POWER_LIMIT_4_MASK			REG_BIT(8)
> +#define   POWER_LIMIT_1_MASK			REG_BIT(10)
> +#define   POWER_LIMIT_2_MASK			REG_BIT(11)
> +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
> +

Documentation, please.


>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e799faa1c6b8..363332881e4d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -638,6 +638,73 @@ static const struct attribute *pc_attrs[] = {
>   	NULL
>   };
>   
> +static inline
> +xe_reg_t xe_gt_perf_limit_reasons_reg(struct xe_gt *gt)
> +{
> +        if (xe_gt_is_media_type(gt))
> +                return MTL_MEDIA_PERF_LIMIT_REASONS;
> +
> +        return GT0_PERF_LIMIT_REASONS;
> +}
> +

Only use "static inline" in headers. Otherwise let the compiler decide 
what to inline.

> +struct xe_gt_bool_throttle_attr {
> +	struct attribute attr;
> +	ssize_t (*show)(struct device *dev, struct device_attribute *attr,
> +			char *buf);
> +	xe_reg_t (*reg32)(struct xe_gt *gt);
> +	u32 mask;
> +};
> +

Struct needs kerneldoc.


> +bool xe_mmio_mask_read(struct xe_gt *gt,
> +			xe_reg_t reg32, u32 mask)
> +{
> +	return xe_mmio_read32(gt, reg32) & mask;
> +}
> +

Extern function needs kerneldoc, but does it need to be extern?

> +static ssize_t throttle_reason_bool_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	struct xe_gt_bool_throttle_attr *t_attr =
> +			(struct xe_gt_bool_throttle_attr *) attr;
> +	bool val = xe_mmio_mask_read(&gt->rps, t_attr->reg32(gt), t_attr->mask);
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +
> +#define XE_GT_BOOL_ATTR_RO(sysfs_func__, mask__) \
> +struct xe_gt_bool_throttle_attr attr_##sysfs_func__ = { \
> +	.attr = { .name = __stringify(sysfs_func__), .mode = 0444 }, \
> +	.show = throttle_reason_bool_show, \
> +	.reg32 = xe_gt_perf_limit_reasons_reg, \
> +	.mask = mask__, \
> +}
> +
> +static XE_GT_BOOL_ATTR_RO(throttle_reason_status, GT0_PERF_LIMIT_REASONS_MASK);
> +static XE_GT_BOOL_ATTR_RO(throttle_reason_pl1, POWER_LIMIT_1_MASK);
> +static XE_GT_BOOL_ATTR_RO(throttle_reason_pl2, POWER_LIMIT_2_MASK);
> +static XE_GT_BOOL_ATTR_RO(throttle_reason_pl4, POWER_LIMIT_4_MASK);
> +static XE_GT_BOOL_ATTR_RO(throttle_reason_thermal, THERMAL_LIMIT_MASK);
> +static XE_GT_BOOL_ATTR_RO(throttle_reason_prochot, PROCHOT_MASK);
> +static XE_GT_BOOL_ATTR_RO(throttle_reason_ratl, RATL_MASK);
> +static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_thermalert, VR_THERMALERT_MASK);
> +static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_tdc, VR_TDC_MASK);
> +
> +static const struct attribute *throttle_reason_attrs[] = {
> +	&dev_attr_throttle_reason_status.attr,
> +	&dev_attr_throttle_reason_pl1.attr,
> +	&dev_attr_throttle_reason_pl2.attr,
> +	&dev_attr_throttle_reason_pl4.attr,
> +	&dev_attr_throttle_reason_thermal.attr,
> +	&dev_attr_throttle_reason_prochot.attr,
> +	&dev_attr_throttle_reason_ratl.attr,
> +	&dev_attr_throttle_reason_vr_thermalert.attr,
> +	&dev_attr_throttle_reason_vr_tdc.attr,
> +	NULL
> +};
> +
>   static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
>   {
>   	struct xe_gt *gt = pc_to_gt(pc);
