Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F815C0218A
	for <intel-xe@archiver.kernel.org>; Sat,  1 Feb 2025 06:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA23610E233;
	Sat,  1 Feb 2025 06:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jy/+d4YK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0A210E233
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Feb 2025 06:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738391873; x=1769927873;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pAKNo1zLA4jLyrqkvRikzd16gm5AaDZGVREg8CCX13w=;
 b=jy/+d4YKaSgwlleN30BEDsrk6sOEIEFbslcX/Y6gB2cx3w91Q7E3if4c
 pO3euMf9tpPx6R/w53oK77RI6l5fnhB5tDBXsfDE8KBU0fuYhS2uPkPY2
 UZn1y+jK4X81uV4aT1bHpMJxzTsE9n2BLfb6/uRCq+fmrOPUPqtO/XcNQ
 nbif3JFwyyikeRhklf2cc9ZZo/8oBme33mvavEdvQqkoViIjYdjrkFV7I
 IpzsI1oQEtvCmvYvaaq8GR53wsj5DGG77ZWuFDKCUZ/3r+LmsJgfeBcF+
 cvHr6Vch42Ul8uKFC9OtGf+IXuilB3I816ZxbAfDSHuyqkIpXN6G/08X4 g==;
X-CSE-ConnectionGUID: a6n4/nIZRQOfKIxmNCY9pA==
X-CSE-MsgGUID: Y3zUND7LRquJ1HQzKVnPOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="56386857"
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; d="scan'208";a="56386857"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 22:37:52 -0800
X-CSE-ConnectionGUID: PH1XlYapRq2IYPuksJpcqA==
X-CSE-MsgGUID: Zm1draMWRiSfcrwd0h33Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; d="scan'208";a="110388895"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 22:37:48 -0800
Date: Sat, 1 Feb 2025 08:37:45 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, andi.shyti@linux.intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 riana.tauro@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v2] drm/xe/hwmon: expose package and vram temperature
Message-ID: <Z53BOTXFSsZ5WKFs@black.fi.intel.com>
References: <20250131054502.1528555-1-raag.jadav@intel.com>
 <2c9ce022-56a6-4d25-a274-32d9013f8c49@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c9ce022-56a6-4d25-a274-32d9013f8c49@intel.com>
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

On Fri, Jan 31, 2025 at 08:13:15PM +0530, Poosa, Karthik wrote:
> On 31-01-2025 11:15, Raag Jadav wrote:
> > Add hwmon support for temp2_input and temp3_input attributes, which will
> 
> Add hwmon support for temp2_input and temp3_input attributes for supported platforms
> 
> > expose package and vram temperature in millidegree Celsius. With this in
> > place we can monitor temperature using lm-sensors tool.
> 
> With these changes, package and vram temperatures can be monitored using lm-sensors tool.

That's pretty much what it already says, doesn't it?

> > v2: Reuse existing channels (Badal, Karthik)
> Add a new channel for VRAM temperature, channel 3.
> > 
> > Signed-off-by: Raag Jadav<raag.jadav@intel.com>
> > Reviewed-by: Andi Shyti<andi.shyti@linux.intel.com>
> > ---
> >   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
> >   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
> >   drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
> >   drivers/gpu/drm/xe/xe_hwmon.c                 | 60 +++++++++++++++++++
> >   4 files changed, 81 insertions(+)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > index d792a56f59ac..9bce281314df 100644
> > --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > @@ -108,3 +108,19 @@ Contact:	intel-xe@lists.freedesktop.org
> >   Description:	RO. Package current voltage in millivolt.
> >   		Only supported for particular Intel Xe graphics platforms.
> > +
> > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
> > +Date:		March 2025
> 
> January 2025,
> 
> February 2025, if there is a next revision after v2
> 
> > +KernelVersion:	6.14
> > +Contact:	intel-xe@lists.freedesktop.org
> > +Description:	RO. Package temperature in millidegree Celsius.
> > +
> > +		Only supported for particular Intel Xe graphics platforms.
> > +
> > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_input
> > +Date:		March 2025
> 
> January 2025
> 
> February 2025, if there is a next revision after v2

Something to follow: https://hansen.beer/~dave/phb/

> > +KernelVersion:	6.14
> > +Contact:	intel-xe@lists.freedesktop.org
> > +Description:	RO. VRAM temperature in millidegree Celsius.
> > +
> > +		Only supported for particular Intel Xe graphics platforms.
> > diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > index 519dd1067a19..f5e5234857c1 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > @@ -34,6 +34,9 @@
> >   #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
> > +#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
> > +#define   TEMP_MASK				REG_GENMASK(7, 0)
> TEMP_MASK -> TEMPERATURE_MASK

This is consistent with other GENMASK() macros here.

> >   #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
> >   #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
> >   #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> > diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > index 0b0b49d850ae..8846eb9ce2a4 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > @@ -21,6 +21,8 @@
> >   #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
> >   #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
> >   #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> > +#define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
> > +#define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
> >   #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
> >   #define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
> >   #define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
> > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> > index fde56dad3ab7..7f327e334212 100644
> > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > @@ -6,6 +6,7 @@
> >   #include <linux/hwmon-sysfs.h>
> >   #include <linux/hwmon.h>
> >   #include <linux/types.h>
> > +#include <linux/units.h>
> >   #include <drm/drm_managed.h>
> >   #include "regs/xe_gt_regs.h"
> > @@ -20,6 +21,7 @@
> >   #include "xe_pm.h"
> >   enum xe_hwmon_reg {
> > +	REG_TEMP,
> 
> Any specific reason for adding this at the beginning of enum ?

This follows the ordering of enum hwmon_sensor_types (as the rest of the patch).

> Generally addition is at the end for any new enums.
> 
> >   	REG_PKG_RAPL_LIMIT,
> >   	REG_PKG_POWER_SKU,
> >   	REG_PKG_POWER_SKU_UNIT,
> > @@ -36,6 +38,7 @@ enum xe_hwmon_reg_operation {
> >   enum xe_hwmon_channel {
> >   	CHANNEL_CARD,
> >   	CHANNEL_PKG,
> > +	CHANNEL_VRAM,
> >   	CHANNEL_MAX,
> >   };
> > @@ -84,6 +87,19 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
> >   	struct xe_device *xe = hwmon->xe;
> >   	switch (hwmon_reg) {
> > +	case REG_TEMP:
> > +		if (xe->info.platform == XE_BATTLEMAGE) {
> > +			if (channel == CHANNEL_PKG)
> > +				return BMG_PACKAGE_TEMPERATURE;
> > +			else if (channel == CHANNEL_VRAM)
> > +				return BMG_VRAM_TEMPERATURE;
> > +		} else if (xe->info.platform == XE_DG2) {
> > +			if (channel == CHANNEL_PKG)
> > +				return PCU_CR_PACKAGE_TEMPERATURE;
> > +			else if (channel == CHANNEL_VRAM)
> > +				return BMG_VRAM_TEMPERATURE;
> 
> This doesn't look good.
> 
> Can you add PCU_CR_VRAM_TEMPERATURE with same offset in
> xe/regs/xe_mchbar_regs.h ?

It's not mchbar register.

> > +		}
> > +		break;
> >   	case REG_PKG_RAPL_LIMIT:
> >   		if (xe->info.platform == XE_BATTLEMAGE) {
> >   			if (channel == CHANNEL_PKG)
> > @@ -431,6 +447,8 @@ static const struct attribute_group *hwmon_groups[] = {
> >   };
> >   static const struct hwmon_channel_info * const hwmon_info[] = {
> > +	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> > +			   HWMON_T_INPUT | HWMON_T_LABEL),
> >   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL,
> >   			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),
> >   	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
> > @@ -506,6 +524,36 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
> >   	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
> >   }
> > +static umode_t
> > +xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> > +{
> > +	switch (attr) {
> > +	case hwmon_temp_input:
> > +	case hwmon_temp_label:
> > +		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
> > +	default:
> > +		return 0;
> > +	}
> > +}
> > +
> > +static int
> > +xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> > +{
> > +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> > +	u64 reg_val;
> > +
> > +	switch (attr) {
> > +	case hwmon_temp_input:
> > +		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
> > +
> > +		/* HW register value is in degrees Celsius, convert to millidegrees. */
> > +		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> > +		return 0;
> > +	default:
> > +		return -EOPNOTSUPP;
> Can you add debug log, printing the unsupported attr ?

We don't have it for others, anything special about this one?

Raag
