Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F13C02182
	for <intel-xe@archiver.kernel.org>; Sat, 25 Jan 2025 07:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A4710E2C5;
	Sat, 25 Jan 2025 07:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JlFg6wcz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D66910E2C5
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Jan 2025 07:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737789282; x=1769325282;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ehgDmFROYIzxe7pX6zeVgpQW74TDDei6uMPdJFI1kSY=;
 b=JlFg6wczgRnx3g0rfYbCwYXMfvNuUiVhZXYs4/7SCYuqE56F2q8zKRqK
 Jc+rguDyD3h9UuWeSbIqiOHQTctxnJ96VQY8gaHz3AgIQhjo+l/NchF9x
 he0ACXsldff6KmHdM+L+3BDD573p6iq748Oay9Ya9cziHnZST113tFPvU
 RxkVO71/otCJUj9AYmHhpuHjqr9FC497w1vYn6+8A8E0s/+NJHBOPaLqX
 Qu8uOCR3Wb1ikku1ssPp3okqYooGrfwfl2A0LlxHs9kEP3ew546WN6gtE
 +qOoICw3i0i+APsvDdfo3I7exEHB5PXjC0gv4HcvIK1tpDAw9ZOfUZ/t8 A==;
X-CSE-ConnectionGUID: GApAzC7MRcuDdbXvWDFhig==
X-CSE-MsgGUID: CTNaq+9gTKWSXAvXA2znlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="48914078"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; d="scan'208";a="48914078"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 23:14:41 -0800
X-CSE-ConnectionGUID: 5bnbELLsQouyz0QwiOm2ng==
X-CSE-MsgGUID: 8C63rLy4SBCYCnANuXaadA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="138830115"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 23:14:38 -0800
Date: Sat, 25 Jan 2025 09:14:35 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com,
 andi.shyti@linux.intel.com, Karthik Poosa <karthik.poosa@intel.com>,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 anvesh.bakwad@intel.com, saikishore.konda@intel.com
Subject: Re: [PATCH v1] drm/xe/hwmon: expose package and vram temperature
Message-ID: <Z5SPWwiB15ptK4hR@black.fi.intel.com>
References: <20250108092415.289551-1-raag.jadav@intel.com>
 <94e0bc3e-897c-48e2-950d-777d40519ab7@intel.com>
 <Z5GuzT7R0WZTr3r3@black.fi.intel.com>
 <bc971c1c-bcf1-40f4-a7fd-52107ebec05b@intel.com>
 <a79e18b1-49da-4f14-bd7d-06bc497fa004@intel.com>
 <Z5OImvYNno8VDci5@black.fi.intel.com>
 <fba28165-eea6-41dd-938d-9db749eb9f60@intel.com>
 <Z5OvwSv5OykmbTNK@black.fi.intel.com>
 <d9ba4385-ec55-4f16-b0c1-9a493c9319a8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9ba4385-ec55-4f16-b0c1-9a493c9319a8@intel.com>
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

On Fri, Jan 24, 2025 at 09:37:55PM +0530, Nilawar, Badal wrote:
> On 24-01-2025 20:50, Raag Jadav wrote:
> > On Fri, Jan 24, 2025 at 08:27:14PM +0530, Nilawar, Badal wrote:
> > > On 24-01-2025 18:03, Raag Jadav wrote:
> > > > On Fri, Jan 24, 2025 at 05:29:16PM +0530, Nilawar, Badal wrote:
> > > > > On 24-01-2025 11:46, Riana Tauro wrote:
> > > > > > Hi Raag
> > > > > > 
> > > > > > On 1/23/2025 8:21 AM, Raag Jadav wrote:
> > > > > > > On Tue, Jan 21, 2025 at 01:56:05PM +0530, Riana Tauro wrote:
> > > > > > > > Hi Raag
> > > > > > > > 
> > > > > > > > On 1/8/2025 2:54 PM, Raag Jadav wrote:
> > > > > > > > > Add hwmon support for temp1_input and temp2_input
> > > > > > > > > attributes, which will
> > > > > > > > > expose package and vram temperature in millidegree Celsius.
> > > > > > > > > With this in
> > > > > > > > > place we can monitor temperature using lm-sensors tool.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > > > > > ---
> > > > > > > > >      .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
> > > > > > > > >      drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
> > > > > > > > >      drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
> > > > > > > > >      drivers/gpu/drm/xe/xe_hwmon.c                 | 63
> > > > > > > > > +++++++++++++++++++
> > > > > > > > >      4 files changed, 84 insertions(+)
> > > > > > > > > 
> > > > > > > > > diff --git
> > > > > > > > > a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > > > > > > b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > > > > > > index d792a56f59ac..998cfb0ee1a6 100644
> > > > > > > > > --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > > > > > > +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > > > > > > @@ -108,3 +108,19 @@ Contact: intel-xe@lists.freedesktop.org
> > > > > > > > >      Description:    RO. Package current voltage in millivolt.
> > > > > > > > >              Only supported for particular Intel Xe graphics platforms.
> > > > > > > > > +
> > > > > > > > > +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp1_input
> > > > > > > > > +Date:        April 2025
> > > > > > > > > +KernelVersion:    6.15
> > > > > > > > > +Contact:    intel-xe@lists.freedesktop.org
> > > > > > > > > +Description:    RO. Package temperature in millidegree Celsius.
> > > > > > > > > +
> > > > > > > > > +        Only supported for particular Intel Xe graphics platforms.
> > > > > > > > > +
> > > > > > > > > +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
> > > > > > > > > +Date:        April 2025
> > > > > > > > > +KernelVersion:    6.15
> > > > > > > > > +Contact:    intel-xe@lists.freedesktop.org
> > > > > > > > > +Description:    RO. VRAM temperature in millidegree Celsius.
> > > > > > > > > +
> > > > > > > > > +        Only supported for particular Intel Xe graphics platforms.
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > > > > > > b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > > > > > > index 519dd1067a19..f5e5234857c1 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > > > > > > +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > > > > > > @@ -34,6 +34,9 @@
> > > > > > > > >      #define PCU_CR_PACKAGE_ENERGY_STATUS
> > > > > > > > > XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
> > > > > > > > > +#define PCU_CR_PACKAGE_TEMPERATURE
> > > > > > > > > XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
> > > > > > > > > +#define   TEMP_MASK                REG_GENMASK(7, 0)
> > > > > > > > > +
> > > > > > > > >      #define PCU_CR_PACKAGE_RAPL_LIMIT
> > > > > > > > > XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
> > > > > > > > >      #define   PKG_PWR_LIM_1                REG_GENMASK(14, 0)
> > > > > > > > >      #define   PKG_PWR_LIM_1_EN            REG_BIT(15)
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > > > > > > b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > > > > > > index 0b0b49d850ae..8846eb9ce2a4 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > > > > > > +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > > > > > > @@ -21,6 +21,8 @@
> > > > > > > > >      #define BMG_PACKAGE_POWER_SKU            XE_REG(0x138098)
> > > > > > > > >      #define BMG_PACKAGE_POWER_SKU_UNIT XE_REG(0x1380dc)
> > > > > > > > >      #define BMG_PACKAGE_ENERGY_STATUS        XE_REG(0x138120)
> > > > > > > > > +#define BMG_VRAM_TEMPERATURE            XE_REG(0x1382c0)
> > > > > > > > > +#define BMG_PACKAGE_TEMPERATURE            XE_REG(0x138434)
> > > > > > > > indentation.
> > > > > > > It's a git quirk, you won't see it in file.
> > > > > > > 
> > > > > > > > Also you are using the same for DG2. Should have a common name
> > > > > > > Just following the conventions.
> > > > > > Did not find this convention in the file.
> > > > > > BMG_VRAM_TEMPERATURE is used in both dg2 and bmg and has a bmg prefix.
> > > > > > Doesn't seem right
> > > > > > > > >      #define BMG_PACKAGE_RAPL_LIMIT            XE_REG(0x138440)
> > > > > > > > >      #define BMG_PLATFORM_ENERGY_STATUS XE_REG(0x138458)
> > > > > > > > >      #define BMG_PLATFORM_POWER_LIMIT        XE_REG(0x138460)
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_hwmon.c
> > > > > > > > > index fde56dad3ab7..5b5c844adf4a 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > > > > > > > > @@ -6,6 +6,7 @@
> > > > > > > > >      #include <linux/hwmon-sysfs.h>
> > > > > > > > >      #include <linux/hwmon.h>
> > > > > > > > >      #include <linux/types.h>
> > > > > > > > > +#include <linux/units.h>
> > > > > > > > >      #include <drm/drm_managed.h>
> > > > > > > > >      #include "regs/xe_gt_regs.h"
> > > > > > > > > @@ -20,6 +21,7 @@
> > > > > > > > >      #include "xe_pm.h"
> > > > > > > > >      enum xe_hwmon_reg {
> > > > > > > > > +    REG_TEMP,
> > > > > > > > add to the end
> > > > > > > > >          REG_PKG_RAPL_LIMIT,
> > > > > > > > >          REG_PKG_POWER_SKU,
> > > > > > > > >          REG_PKG_POWER_SKU_UNIT,
> > > > > > > > > @@ -39,6 +41,11 @@ enum xe_hwmon_channel {
> > > > > > > > >          CHANNEL_MAX,
> > > > > > > > >      };
> > > > > > > > > +enum xe_hwmon_temp {
> > > > > > > > > +    TEMP_PKG,
> > > > > > > > > +    TEMP_VRAM,
> > > > > > > > > +};
> > > > > > > > Can't the existing channel enum be used here?
> > > > > > > Nope, that'd break the indexes.
> > > > > > @badal/@karthik Are multiple indexes for the same channel okay?
> > > > > > 
> > > > > > In the current code, for dg2 only channel 1 is exposed for power and
> > > > > > channel 0 skipped. Something like that needs to be done here too?
> > > > > Thanks for looping me in this. Yes, Channel 0 represent card specific
> > > > > attributes and Channel 1 represent package specific attributes. That's how
> > > > > it should be followed.
> > > > > With that BMG_PACKAGE_TEMPERATURE should go under CHANNEL_PKG. For
> > > > > BMG_VRAM_TEMPERATURE new channel (channel 3) should be added in enum
> > > > > xe_hwmon_channel.
> > > > And how does that work with hwmon_channel_info?
> > > Check curr_crit implementation.
> > > HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL)
> > Exactly, and hence the separate enums for temp channels.
> 
> 
> No, we want temp2_input for package (channel 2) temperature and temp3_input
> (Channel 3) for VRAM temperature.
> Just for information, in i915 we create separate hwmon node for each layer
> i.e. package, gt0 and gt1. During review of xe hwmon implementation upstream
> architect recommended that there should be single node for a device. So we
> are using channel based approach. So lets stick to that approach.

And what about fan channels? Are they to be indexed from 4 and on?
I'm not sure if we'd want to abuse hwmon_channel_info in such a way.

Raag
