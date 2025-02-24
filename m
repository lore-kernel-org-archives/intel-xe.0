Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05132C021B5
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 13:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9660A10E562;
	Mon, 24 Feb 2025 13:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Brk7gn4R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D52510E07A
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 07:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740383193; x=1771919193;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=M2yScV3GG4ONwzjQjVGsusfcFblsbBT/tChANAkzI94=;
 b=Brk7gn4RF9GwZ/10ZnSLRU8pqjN6MhT5IPiTLGqDCtz3QED20YSq+ZzC
 u4lLligP9ywB+1kC5jl3O3wkeIv60XMOKfMGFO4QnEYYhvwNyjPGI2vxv
 Ta0QYG2HbXm360jIIJlA9R54tufiDxttXHkFR3HQTz4QkkN/P+CXKHwIN
 q4pAZiR5QBAVXkN5dNIwF2l1YU9fVneBL6N6N11mp/5YnpuiHYfXeLdmD
 wvX617tShj6ET4gpiKPAqt8yCUPVxT/yM/mPLDUAzVy7A2TFlwehsmXl3
 MuMc/ornO9xAw070GJxYu+G4W4SOgiu+nD7XWcdcj8ZYogW7ktaCQ0djw w==;
X-CSE-ConnectionGUID: sL8kBlsqT56TH13c5EytHw==
X-CSE-MsgGUID: i4/bqIV1SCCdU5kmeSNrbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="40314723"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="40314723"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 23:46:32 -0800
X-CSE-ConnectionGUID: 9q9RgEaOThK5aF5oS22Tcg==
X-CSE-MsgGUID: d85W1EnmRoubd2G5lBAIHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="120899415"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 23:46:26 -0800
Date: Mon, 24 Feb 2025 09:46:20 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, andi.shyti@linux.intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 riana.tauro@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v1] drm/xe/hwmon: expose fan speed
Message-ID: <Z7wjzKB1yF9AV5PA@black.fi.intel.com>
References: <20250210100515.2205584-1-raag.jadav@intel.com>
 <bbda9792-7126-4961-8767-b435780f0cff@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbda9792-7126-4961-8767-b435780f0cff@intel.com>
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

On Fri, Feb 21, 2025 at 08:32:01PM +0530, Poosa, Karthik wrote:
> On 10-02-2025 15:35, Raag Jadav wrote:
> > Add hwmon support for fan1_input, fan2_input and fan3_input attributes,
> > which will expose fan speed of respective channels in RPM when supported
> > by hardware. With this in place we can monitor fan speed using lm-sensors
> > tool.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  24 ++++
> >   drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   3 +
> >   drivers/gpu/drm/xe/xe_hwmon.c                 | 124 +++++++++++++++++-
> >   drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
> >   4 files changed, 153 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > index 9bce281314df..adbb9bce15a5 100644
> > --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > @@ -124,3 +124,27 @@ Contact:	intel-xe@lists.freedesktop.org
> >   Description:	RO. VRAM temperature in millidegree Celsius.
> >   		Only supported for particular Intel Xe graphics platforms.
> > +
> > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan1_input
> > +Date:		March 2025
> > +KernelVersion:	6.14
> > +Contact:	intel-xe@lists.freedesktop.org
> > +Description:	RO. Fan 1 speed in RPM.
> > +
> > +		Only supported for particular Intel Xe graphics platforms.
> > +
> > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan2_input
> > +Date:		March 2025
> > +KernelVersion:	6.14
> > +Contact:	intel-xe@lists.freedesktop.org
> > +Description:	RO. Fan 2 speed in RPM.
> > +
> > +		Only supported for particular Intel Xe graphics platforms.
> > +
> > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan3_input
> > +Date:		March 2025
> > +KernelVersion:	6.14
> > +Contact:	intel-xe@lists.freedesktop.org
> > +Description:	RO. Fan 3 speed in RPM.
> > +
> > +		Only supported for particular Intel Xe graphics platforms.
> > diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > index 8846eb9ce2a4..c7d5d782e3f9 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > @@ -21,6 +21,9 @@
> >   #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
> >   #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
> >   #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> > +#define BMG_FAN_1_SPEED				XE_REG(0x138140)
> > +#define BMG_FAN_2_SPEED				XE_REG(0x138170)
> > +#define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
> 
> Can you rename macros without having platform names, as this register is
> available for both DG2 and BMG, like FAN_1_SPEED.

Are you sure if we want to break the convention here?

> >   #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
> >   #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
> >   #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
> > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> > index 7f327e334212..f1f95655d9fb 100644
> > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > @@ -5,6 +5,7 @@
> >   #include <linux/hwmon-sysfs.h>
> >   #include <linux/hwmon.h>
> > +#include <linux/jiffies.h>
> >   #include <linux/types.h>
> >   #include <linux/units.h>
> > @@ -27,6 +28,7 @@ enum xe_hwmon_reg {
> >   	REG_PKG_POWER_SKU_UNIT,
> >   	REG_GT_PERF_STATUS,
> >   	REG_PKG_ENERGY_STATUS,
> > +	REG_FAN_SPEED,
> >   };
> >   enum xe_hwmon_reg_operation {
> > @@ -42,6 +44,13 @@ enum xe_hwmon_channel {
> >   	CHANNEL_MAX,
> >   };
> > +enum xe_fan_channel {
> > +	FAN_1,
> > +	FAN_2,
> > +	FAN_3,
> > +	FAN_MAX,
> > +};
> > +
> >   /*
> >    * SF_* - scale factors for particular quantities according to hwmon spec.
> >    */
> > @@ -61,6 +70,16 @@ struct xe_hwmon_energy_info {
> >   	long accum_energy;
> >   };
> > +/**
> > + * struct xe_hwmon_fan_info - to cache previous fan reading
> > + */
> > +struct xe_hwmon_fan_info {
> > +	/** @reg_val_prev: previous fan reg val */
> > +	u32 reg_val_prev;
> > +	/** @time_prev: previous timestamp */
> > +	u64 time_prev;
> > +};
> > +
> >   /**
> >    * struct xe_hwmon - xe hwmon data structure
> >    */
> > @@ -79,6 +98,8 @@ struct xe_hwmon {
> >   	int scl_shift_time;
> >   	/** @ei: Energy info for energyN_input */
> >   	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
> > +	/** @fi: Fan info for fanN_input */
> > +	struct xe_hwmon_fan_info fi[FAN_MAX];
> >   };
> >   static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
> > @@ -144,6 +165,16 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
> >   			return PCU_CR_PACKAGE_ENERGY_STATUS;
> >   		}
> >   		break;
> > +	case REG_FAN_SPEED:
> > +		if (xe->info.platform == XE_BATTLEMAGE || xe->info.platform == XE_DG2) {
> > +			if (channel == FAN_1)
> > +				return BMG_FAN_1_SPEED;
> > +			else if (channel == FAN_2)
> > +				return BMG_FAN_2_SPEED;
> > +			else if (channel == FAN_3)
> > +				return BMG_FAN_3_SPEED;
> > +		}
> > +		break;
> >   	default:
> >   		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
> >   		break;
> > @@ -454,6 +485,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
> >   	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
> >   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
> >   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> > +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
> >   	NULL
> >   };
> > @@ -480,6 +512,14 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
> >   			      (uval & POWER_SETUP_I1_DATA_MASK));
> >   }
> > +static int xe_hwmon_pcode_read_num_fans(const struct xe_hwmon *hwmon, u32 *uval)
> > +{
> > +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> > +
> > +	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
> > +			     FSC_READ_NUM_FANS, 0), uval, NULL);
> > +}
> > +
> >   static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
> >   					 long *value, u32 scale_factor)
> >   {
> > @@ -705,6 +745,77 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> >   	}
> >   }
> > +static umode_t
> > +xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> > +{
> > +	struct xe_device *xe = hwmon->xe;
> > +	u32 uval;
> > +
> > +	switch (attr) {
> > +	case hwmon_fan_input:
> > +		if (xe_hwmon_pcode_read_num_fans(hwmon, &uval))
> > +			return 0;
> > +
> > +		/* Platforms that don't return correct value */
> This can be rephrased to - "Platforms that don't support fan pcode mailbox
> cmds"

We wouldn't be at this point if it was not supported.

> > +		if (xe->info.platform == XE_DG2)
> > +			uval = 2;
> > +
> > +		return channel < uval ? 0444 : 0;
> > +	default:
> > +		return 0;
> > +	}
> > +}

Raag
