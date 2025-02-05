Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2C9C02198
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 17:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127E210E1F4;
	Wed,  5 Feb 2025 17:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mgDwf1b+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318E110E1F4
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 17:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738776556; x=1770312556;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HWvNKFdtlTLJb5wuF39UlsueQ+K+RMsSIHJiGVP/VLU=;
 b=mgDwf1b+6hJbz4a9Mpq8U1ol/1NVOwlUCrQAv9h2f5asqYbBFI9M4wMk
 7NJv5FDCXhhWhf8x+v5sCl4bJLAcWiRWipu4K39TyQCDmQY7VqKBAL5Cl
 cXgVgl63B9woNM46NzZIZZ+vfvt48dFABnHp/k/w9wCGEisexBMzCaf9H
 ItPLO/PAvqorr+PDj0JiIVnVriOz24+CXYhL43zmCZaQ1t/tZ7aVFmyo6
 wBmAHIVEl+qU3XFn84rRsVrDRTYp9Q7Crxpi9CCX2xlKAuwdShHyOY01g
 D1hseIHJroQSc8pAoPLPG2Lp1VtBm7eE9APzjX9a9/kSYvyuhu7ynx7CV g==;
X-CSE-ConnectionGUID: 5KsWUUbLQN6ebO/Kn2nqYA==
X-CSE-MsgGUID: 0fxtJNl8SQ+Gg28hGK1ifg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42190479"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="42190479"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 09:29:16 -0800
X-CSE-ConnectionGUID: HaKmNf1tR6+m0KqTI+tBMQ==
X-CSE-MsgGUID: U3DdsR/VRwi7hFuLcwOTTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115585853"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 09:29:13 -0800
Date: Wed, 5 Feb 2025 19:29:10 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 "Poosa, Karthik" <karthik.poosa@intel.com>,
 matthew.d.roper@intel.com, andi.shyti@linux.intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com
Subject: Re: [PATCH v2] drm/xe/hwmon: expose package and vram temperature
Message-ID: <Z6Of5vNfg0yDiK3u@black.fi.intel.com>
References: <20250131054502.1528555-1-raag.jadav@intel.com>
 <2c9ce022-56a6-4d25-a274-32d9013f8c49@intel.com>
 <Z53BOTXFSsZ5WKFs@black.fi.intel.com>
 <cce1eb5a-b738-4283-8d3d-e782da14067a@intel.com>
 <Z6Kms_pJxvKJpoL5@intel.com>
 <0551646d-4e57-409c-b416-1a7108a2f4d9@intel.com>
 <Z6NTZ0KrdkSnLCFJ@black.fi.intel.com> <Z6Ns0iN4WYB8pxfs@intel.com>
 <eqk6tkzwgsd7xat4yrl5aevpc6mgymque7fenbgeqhmr7yc67p@ltcbreooa7qx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eqk6tkzwgsd7xat4yrl5aevpc6mgymque7fenbgeqhmr7yc67p@ltcbreooa7qx>
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

On Wed, Feb 05, 2025 at 09:31:02AM -0600, Lucas De Marchi wrote:
> On Wed, Feb 05, 2025 at 08:51:14AM -0500, Rodrigo Vivi wrote:
> > On Wed, Feb 05, 2025 at 02:02:47PM +0200, Raag Jadav wrote:
> > > On Wed, Feb 05, 2025 at 12:40:46PM +0530, Riana Tauro wrote:
> > > > On 2/5/2025 5:15 AM, Rodrigo Vivi wrote:
> > > > > On Mon, Feb 03, 2025 at 11:57:20AM +0530, Riana Tauro wrote:
> > > > > > On 2/1/2025 12:07 PM, Raag Jadav wrote:
> > > > > > > On Fri, Jan 31, 2025 at 08:13:15PM +0530, Poosa, Karthik wrote:
> > > > > > > > On 31-01-2025 11:15, Raag Jadav wrote:
> > > > > > > > > Add hwmon support for temp2_input and temp3_input attributes, which will
> > > > > > > >
> > > > > > > > Add hwmon support for temp2_input and temp3_input attributes for supported platforms
> > > > > > > >
> > > > > > > > > expose package and vram temperature in millidegree Celsius. With this in
> > > > > > > > > place we can monitor temperature using lm-sensors tool.
> > > > > > > >
> > > > > > > > With these changes, package and vram temperatures can be monitored using lm-sensors tool.
> > > > > > >
> > > > > > > That's pretty much what it already says, doesn't it?
> > > > > > >
> > > > > > > > > v2: Reuse existing channels (Badal, Karthik)
> > > > > > > > Add a new channel for VRAM temperature, channel 3.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Raag Jadav<raag.jadav@intel.com>
> > > > > > > > > Reviewed-by: Andi Shyti<andi.shyti@linux.intel.com>
> > > > > > > > > ---
> > > > > > > > >     .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
> > > > > > > > >     drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
> > > > > > > > >     drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
> > > > > > > > >     drivers/gpu/drm/xe/xe_hwmon.c                 | 60 +++++++++++++++++++
> > > > > > > > >     4 files changed, 81 insertions(+)
> > > > > > > > >
> > > > > > > > > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > > > > > > index d792a56f59ac..9bce281314df 100644
> > > > > > > > > --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > > > > > > +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > > > > > > @@ -108,3 +108,19 @@ Contact:	intel-xe@lists.freedesktop.org
> > > > > > > > >     Description:	RO. Package current voltage in millivolt.
> > > > > > > > >     		Only supported for particular Intel Xe graphics platforms.
> > > > > > > > > +
> > > > > > > > > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
> > > > > > > > > +Date:		March 2025
> > > > > > > >
> > > > > > > > January 2025,
> > > > > > > >
> > > > > > > > February 2025, if there is a next revision after v2
> > > > > > > >
> > > > > > > > > +KernelVersion:	6.14
> > > > > > > > > +Contact:	intel-xe@lists.freedesktop.org
> > > > > > > > > +Description:	RO. Package temperature in millidegree Celsius.
> > > > > > > > > +
> > > > > > > > > +		Only supported for particular Intel Xe graphics platforms.
> > > > > > > > > +
> > > > > > > > > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_input
> > > > > > > > > +Date:		March 2025
> > > > > > > >
> > > > > > > > January 2025
> > > > > > > >
> > > > > > > > February 2025, if there is a next revision after v2
> > > > > > >
> > > > > > > Something to follow: https://hansen.beer/~dave/phb/
> > > > > > >
> > > > > > > > > +KernelVersion:	6.14
> > > > > > > > > +Contact:	intel-xe@lists.freedesktop.org
> > > > > > > > > +Description:	RO. VRAM temperature in millidegree Celsius.
> > > > > > > > > +
> > > > > > > > > +		Only supported for particular Intel Xe graphics platforms.
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > > > > > > index 519dd1067a19..f5e5234857c1 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > > > > > > +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > > > > > > @@ -34,6 +34,9 @@
> > > > > > > > >     #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
> > > > > > > > > +#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
> > > > > > > > > +#define   TEMP_MASK				REG_GENMASK(7, 0)
> > > > > > > > TEMP_MASK -> TEMPERATURE_MASK
> > > > > > >
> > > > > > > This is consistent with other GENMASK() macros here.
> > > > > > >
> > > > > > > > >     #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
> > > > > > > > >     #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
> > > > > > > > >     #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > > > > > > index 0b0b49d850ae..8846eb9ce2a4 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > > > > > > +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > > > > > > @@ -21,6 +21,8 @@
> > > > > > > > >     #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
> > > > > > > > >     #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
> > > > > > > > >     #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> > > > > > > > > +#define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
> > > > > > > > > +#define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
> > > > > > > > >     #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
> > > > > > > > >     #define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
> > > > > > > > >     #define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> > > > > > > > > index fde56dad3ab7..7f327e334212 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > > > > > > > > @@ -6,6 +6,7 @@
> > > > > > > > >     #include <linux/hwmon-sysfs.h>
> > > > > > > > >     #include <linux/hwmon.h>
> > > > > > > > >     #include <linux/types.h>
> > > > > > > > > +#include <linux/units.h>
> > > > > > > > >     #include <drm/drm_managed.h>
> > > > > > > > >     #include "regs/xe_gt_regs.h"
> > > > > > > > > @@ -20,6 +21,7 @@
> > > > > > > > >     #include "xe_pm.h"
> > > > > > > > >     enum xe_hwmon_reg {
> > > > > > > > > +	REG_TEMP,
> > > > > > > >
> > > > > > > > Any specific reason for adding this at the beginning of enum ?
> > > > > > >
> > > > > > > This follows the ordering of enum hwmon_sensor_types (as the rest of the patch).
> > > > > > >
> > > > > > > > Generally addition is at the end for any new enums.
> > > > > > > >
> > > > > > > > >     	REG_PKG_RAPL_LIMIT,
> > > > > > > > >     	REG_PKG_POWER_SKU,
> > > > > > > > >     	REG_PKG_POWER_SKU_UNIT,
> > > > > > > > > @@ -36,6 +38,7 @@ enum xe_hwmon_reg_operation {
> > > > > > > > >     enum xe_hwmon_channel {
> > > > > > > > >     	CHANNEL_CARD,
> > > > > > > > >     	CHANNEL_PKG,
> > > > > > > > > +	CHANNEL_VRAM,
> > > > > > > > >     	CHANNEL_MAX,
> > > > > > > > >     };
> > > > > > > > > @@ -84,6 +87,19 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
> > > > > > > > >     	struct xe_device *xe = hwmon->xe;
> > > > > > > > >     	switch (hwmon_reg) {
> > > > > > > > > +	case REG_TEMP:
> > > > > > > > > +		if (xe->info.platform == XE_BATTLEMAGE) {
> > > > > > > > > +			if (channel == CHANNEL_PKG)
> > > > > > > > > +				return BMG_PACKAGE_TEMPERATURE;
> > > > > > > > > +			else if (channel == CHANNEL_VRAM)
> > > > > > > > > +				return BMG_VRAM_TEMPERATURE;
> > > > > > > > > +		} else if (xe->info.platform == XE_DG2) {
> > > > > > > > > +			if (channel == CHANNEL_PKG)
> > > > > > > > > +				return PCU_CR_PACKAGE_TEMPERATURE;
> > > > > > > > > +			else if (channel == CHANNEL_VRAM)
> > > > > > > > > +				return BMG_VRAM_TEMPERATURE;
> > > > > > > >
> > > > > > > > This doesn't look good.
> > > > > > > >
> > > > > > > > Can you add PCU_CR_VRAM_TEMPERATURE with same offset in
> > > > > > > > xe/regs/xe_mchbar_regs.h ?
> > > > > > >
> > > > > > > It's not mchbar register.
> > > > > >
> > > > > > add it under the same file without the bmg prefix.
> > > > > >
> > > > > > The other registers are platform specific and have the prefix.
> > > > > > This is common and can have the PCU prefix
> > > > >
> > > > > No, but the point of the xe_mchbar_reg itself is to only
> > > > > include registers that are from the mchbar.
> > > >
> > > > Sorry for the misunderstanding.
> > > > I meant under the existing pcode_regs file.
> > > >
> > > > It should be okay to have a common prefix (like PCU) if register is common.
> > > 
> > > Although others are platform specific they are expected to be reused in
> > > the future, aren't they?
> > 
> > This strategy of adding registers with the first platform acronym as register
> > prefix, then reusing later on the following platforms, was a strategy very
> > utilized in i915. However, when Lucas refactored the registers accesses here
> > in Xe, it started a trend of avoiding it, unless needed.
> 
> nothing changed much wrt strategy. Even if I dislike it.
> 
> Most of the changes I did was to start from scratch: <= gen12
> prefixes/suffixes got dropped and some platform prefixes replaced by the
> IP name.  Not having a prefix for the first platform is inline with the
> practice on the i915 side.  Then when a new platform comes up and decide
> to move the register, then the new one gains the platform/ip prefix
> where that started.

I'll take it as a confirmation that we're okay with PCU_CR_ prefix, atleast for
this register. If you'd rather prefer something else, please let me know.

Raag
