Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74776C02192
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 12:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E7310E791;
	Wed,  5 Feb 2025 12:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWRamuLA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8938810E792
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 12:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738756973; x=1770292973;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=K118pt47EP0sq2CcXkBhYOcbopHFLcTJ2nRhTrs1qVw=;
 b=VWRamuLAH8S1tzAqLwpp+f0T4rcKB4TMVF1H1uanppyZtuGpmH2KC2tu
 0ziSH2pMbdTs4wAMFn5rk0E3c201XfTRWJM6TEVqi3vFi+/q3ASul5v7f
 xzFWz3uaHvA5Bb60+qqbYrXLMYyFRhAPZzE97EqlT0zGUd/aJTdzWt8iH
 R4Kuy6zrr7UXwza3xdnsnI5wXvODh3bG3WiQWPVL9uYuiM9jX8ODjuB38
 I6ymcXtqWTv47KDF+ddZtLbx0tzZgk8OBBHg+Bst+w0ZGrDg20eY4ByDZ
 Lurb9sdwWXnUnxUmkr3n0NqFgCFY0kRLtuhvHNabFU9vUuNeJaDsXKzyR A==;
X-CSE-ConnectionGUID: mTaeZz5aT1qf1PvB+TJKNQ==
X-CSE-MsgGUID: UBCd6ZWQQ4mu63dUurG+YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50709723"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="50709723"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 04:02:53 -0800
X-CSE-ConnectionGUID: T0xArwRLSh2I77h7hr1yWg==
X-CSE-MsgGUID: oTOQ7ZtHSwWwhj3MFDfFwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111770859"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 04:02:50 -0800
Date: Wed, 5 Feb 2025 14:02:47 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Poosa, Karthik" <karthik.poosa@intel.com>,
 lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 andi.shyti@linux.intel.com, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v2] drm/xe/hwmon: expose package and vram temperature
Message-ID: <Z6NTZ0KrdkSnLCFJ@black.fi.intel.com>
References: <20250131054502.1528555-1-raag.jadav@intel.com>
 <2c9ce022-56a6-4d25-a274-32d9013f8c49@intel.com>
 <Z53BOTXFSsZ5WKFs@black.fi.intel.com>
 <cce1eb5a-b738-4283-8d3d-e782da14067a@intel.com>
 <Z6Kms_pJxvKJpoL5@intel.com>
 <0551646d-4e57-409c-b416-1a7108a2f4d9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0551646d-4e57-409c-b416-1a7108a2f4d9@intel.com>
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

On Wed, Feb 05, 2025 at 12:40:46PM +0530, Riana Tauro wrote:
> On 2/5/2025 5:15 AM, Rodrigo Vivi wrote:
> > On Mon, Feb 03, 2025 at 11:57:20AM +0530, Riana Tauro wrote:
> > > On 2/1/2025 12:07 PM, Raag Jadav wrote:
> > > > On Fri, Jan 31, 2025 at 08:13:15PM +0530, Poosa, Karthik wrote:
> > > > > On 31-01-2025 11:15, Raag Jadav wrote:
> > > > > > Add hwmon support for temp2_input and temp3_input attributes, which will
> > > > > 
> > > > > Add hwmon support for temp2_input and temp3_input attributes for supported platforms
> > > > > 
> > > > > > expose package and vram temperature in millidegree Celsius. With this in
> > > > > > place we can monitor temperature using lm-sensors tool.
> > > > > 
> > > > > With these changes, package and vram temperatures can be monitored using lm-sensors tool.
> > > > 
> > > > That's pretty much what it already says, doesn't it?
> > > > 
> > > > > > v2: Reuse existing channels (Badal, Karthik)
> > > > > Add a new channel for VRAM temperature, channel 3.
> > > > > > 
> > > > > > Signed-off-by: Raag Jadav<raag.jadav@intel.com>
> > > > > > Reviewed-by: Andi Shyti<andi.shyti@linux.intel.com>
> > > > > > ---
> > > > > >     .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
> > > > > >     drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
> > > > > >     drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
> > > > > >     drivers/gpu/drm/xe/xe_hwmon.c                 | 60 +++++++++++++++++++
> > > > > >     4 files changed, 81 insertions(+)
> > > > > > 
> > > > > > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > > > index d792a56f59ac..9bce281314df 100644
> > > > > > --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > > > +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > > > @@ -108,3 +108,19 @@ Contact:	intel-xe@lists.freedesktop.org
> > > > > >     Description:	RO. Package current voltage in millivolt.
> > > > > >     		Only supported for particular Intel Xe graphics platforms.
> > > > > > +
> > > > > > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
> > > > > > +Date:		March 2025
> > > > > 
> > > > > January 2025,
> > > > > 
> > > > > February 2025, if there is a next revision after v2
> > > > > 
> > > > > > +KernelVersion:	6.14
> > > > > > +Contact:	intel-xe@lists.freedesktop.org
> > > > > > +Description:	RO. Package temperature in millidegree Celsius.
> > > > > > +
> > > > > > +		Only supported for particular Intel Xe graphics platforms.
> > > > > > +
> > > > > > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_input
> > > > > > +Date:		March 2025
> > > > > 
> > > > > January 2025
> > > > > 
> > > > > February 2025, if there is a next revision after v2
> > > > 
> > > > Something to follow: https://hansen.beer/~dave/phb/
> > > > 
> > > > > > +KernelVersion:	6.14
> > > > > > +Contact:	intel-xe@lists.freedesktop.org
> > > > > > +Description:	RO. VRAM temperature in millidegree Celsius.
> > > > > > +
> > > > > > +		Only supported for particular Intel Xe graphics platforms.
> > > > > > diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > > > index 519dd1067a19..f5e5234857c1 100644
> > > > > > --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > > > +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > > > @@ -34,6 +34,9 @@
> > > > > >     #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
> > > > > > +#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
> > > > > > +#define   TEMP_MASK				REG_GENMASK(7, 0)
> > > > > TEMP_MASK -> TEMPERATURE_MASK
> > > > 
> > > > This is consistent with other GENMASK() macros here.
> > > > 
> > > > > >     #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
> > > > > >     #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
> > > > > >     #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> > > > > > diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > > > index 0b0b49d850ae..8846eb9ce2a4 100644
> > > > > > --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > > > +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > > > @@ -21,6 +21,8 @@
> > > > > >     #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
> > > > > >     #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
> > > > > >     #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> > > > > > +#define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
> > > > > > +#define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
> > > > > >     #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
> > > > > >     #define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
> > > > > >     #define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> > > > > > index fde56dad3ab7..7f327e334212 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > > > > > @@ -6,6 +6,7 @@
> > > > > >     #include <linux/hwmon-sysfs.h>
> > > > > >     #include <linux/hwmon.h>
> > > > > >     #include <linux/types.h>
> > > > > > +#include <linux/units.h>
> > > > > >     #include <drm/drm_managed.h>
> > > > > >     #include "regs/xe_gt_regs.h"
> > > > > > @@ -20,6 +21,7 @@
> > > > > >     #include "xe_pm.h"
> > > > > >     enum xe_hwmon_reg {
> > > > > > +	REG_TEMP,
> > > > > 
> > > > > Any specific reason for adding this at the beginning of enum ?
> > > > 
> > > > This follows the ordering of enum hwmon_sensor_types (as the rest of the patch).
> > > > 
> > > > > Generally addition is at the end for any new enums.
> > > > > 
> > > > > >     	REG_PKG_RAPL_LIMIT,
> > > > > >     	REG_PKG_POWER_SKU,
> > > > > >     	REG_PKG_POWER_SKU_UNIT,
> > > > > > @@ -36,6 +38,7 @@ enum xe_hwmon_reg_operation {
> > > > > >     enum xe_hwmon_channel {
> > > > > >     	CHANNEL_CARD,
> > > > > >     	CHANNEL_PKG,
> > > > > > +	CHANNEL_VRAM,
> > > > > >     	CHANNEL_MAX,
> > > > > >     };
> > > > > > @@ -84,6 +87,19 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
> > > > > >     	struct xe_device *xe = hwmon->xe;
> > > > > >     	switch (hwmon_reg) {
> > > > > > +	case REG_TEMP:
> > > > > > +		if (xe->info.platform == XE_BATTLEMAGE) {
> > > > > > +			if (channel == CHANNEL_PKG)
> > > > > > +				return BMG_PACKAGE_TEMPERATURE;
> > > > > > +			else if (channel == CHANNEL_VRAM)
> > > > > > +				return BMG_VRAM_TEMPERATURE;
> > > > > > +		} else if (xe->info.platform == XE_DG2) {
> > > > > > +			if (channel == CHANNEL_PKG)
> > > > > > +				return PCU_CR_PACKAGE_TEMPERATURE;
> > > > > > +			else if (channel == CHANNEL_VRAM)
> > > > > > +				return BMG_VRAM_TEMPERATURE;
> > > > > 
> > > > > This doesn't look good.
> > > > > 
> > > > > Can you add PCU_CR_VRAM_TEMPERATURE with same offset in
> > > > > xe/regs/xe_mchbar_regs.h ?
> > > > 
> > > > It's not mchbar register.
> > > 
> > > add it under the same file without the bmg prefix.
> > > 
> > > The other registers are platform specific and have the prefix.
> > > This is common and can have the PCU prefix
> > 
> > No, but the point of the xe_mchbar_reg itself is to only
> > include registers that are from the mchbar.
> 
> Sorry for the misunderstanding.
> I meant under the existing pcode_regs file.
> 
> It should be okay to have a common prefix (like PCU) if register is common.

Although others are platform specific they are expected to be reused in
the future, aren't they?

Do we really want another group in the same range?

Raag
