Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08E2C0218B
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 12:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2C910E06C;
	Fri, 24 Jan 2025 12:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJNWzmk+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826F910E06C
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jan 2025 12:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737723030; x=1769259030;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tPkXrc4waqbmD3lwvbmuyVqMG2nHHo36zSMBtmrDyTc=;
 b=ZJNWzmk+RXJknIy0fK9H+mvobEiO1Uqdfn2j6Pl2j/hrHBuaUH2KdXFO
 9ny7uJvbaP1oVT43IVvX+XNnNaczfxGwkIlxnSAx5d77gWMQ/S54NvsmI
 Qq5AuqOppyA1mJp92C/sTRYg1GjE/BKmRJWCRLYg/1TiH6NROn1+rgcB+
 iPRBUJozw7id8kiwi6Zz6R0RE79QMUyvaUNRilolVmbHtgu8FUl7UaPpC
 GhKpVhbrQsef/zwFGZuajaKsK5E6g/94hioZNuFWHjflgh2IfBh61Bojx
 /pNOPuyVl5MA4p9c+qxZC7zJg2NkC3ga7+Z1FoJ9bOJXxZY8aX2vv5avt w==;
X-CSE-ConnectionGUID: tYJVPjmxScqGmJ4gmYvjwA==
X-CSE-MsgGUID: OnGltMX8StqHIgyFDZMiPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38507806"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="38507806"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 04:50:30 -0800
X-CSE-ConnectionGUID: w6ZYPKx6QNusumgtnx8wyg==
X-CSE-MsgGUID: ZFeFag1fSDWYP0ogQHLz5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="107685024"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 04:50:28 -0800
Date: Fri, 24 Jan 2025 14:50:25 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com,
 andi.shyti@linux.intel.com, Karthik Poosa <karthik.poosa@intel.com>,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com
Subject: Re: [PATCH v1] drm/xe/hwmon: expose package and vram temperature
Message-ID: <Z5OMkeSZT5us_PM-@black.fi.intel.com>
References: <20250108092415.289551-1-raag.jadav@intel.com>
 <94e0bc3e-897c-48e2-950d-777d40519ab7@intel.com>
 <Z5GuzT7R0WZTr3r3@black.fi.intel.com>
 <bc971c1c-bcf1-40f4-a7fd-52107ebec05b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc971c1c-bcf1-40f4-a7fd-52107ebec05b@intel.com>
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

On Fri, Jan 24, 2025 at 11:46:05AM +0530, Riana Tauro wrote:
> Hi Raag
> 
> On 1/23/2025 8:21 AM, Raag Jadav wrote:
> > On Tue, Jan 21, 2025 at 01:56:05PM +0530, Riana Tauro wrote:
> > > Hi Raag
> > > 
> > > On 1/8/2025 2:54 PM, Raag Jadav wrote:
> > > > Add hwmon support for temp1_input and temp2_input attributes, which will
> > > > expose package and vram temperature in millidegree Celsius. With this in
> > > > place we can monitor temperature using lm-sensors tool.
> > > > 
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > ---
> > > >    .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
> > > >    drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
> > > >    drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
> > > >    drivers/gpu/drm/xe/xe_hwmon.c                 | 63 +++++++++++++++++++
> > > >    4 files changed, 84 insertions(+)
> > > > 
> > > > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > index d792a56f59ac..998cfb0ee1a6 100644
> > > > --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > @@ -108,3 +108,19 @@ Contact:	intel-xe@lists.freedesktop.org
> > > >    Description:	RO. Package current voltage in millivolt.
> > > >    		Only supported for particular Intel Xe graphics platforms.
> > > > +
> > > > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp1_input
> > > > +Date:		April 2025
> > > > +KernelVersion:	6.15
> > > > +Contact:	intel-xe@lists.freedesktop.org
> > > > +Description:	RO. Package temperature in millidegree Celsius.
> > > > +
> > > > +		Only supported for particular Intel Xe graphics platforms.
> > > > +
> > > > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
> > > > +Date:		April 2025
> > > > +KernelVersion:	6.15
> > > > +Contact:	intel-xe@lists.freedesktop.org
> > > > +Description:	RO. VRAM temperature in millidegree Celsius.
> > > > +
> > > > +		Only supported for particular Intel Xe graphics platforms.
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > index 519dd1067a19..f5e5234857c1 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > @@ -34,6 +34,9 @@
> > > >    #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
> > > > +#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
> > > > +#define   TEMP_MASK				REG_GENMASK(7, 0)
> > > > +
> > > >    #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
> > > >    #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
> > > >    #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > index 0b0b49d850ae..8846eb9ce2a4 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > @@ -21,6 +21,8 @@
> > > >    #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
> > > >    #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
> > > >    #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> > > > +#define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
> > > > +#define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
> > > indentation.
> > 
> > It's a git quirk, you won't see it in file.
> > 
> > > Also you are using the same for DG2. Should have a common name
> > 
> > Just following the conventions.
> Did not find this convention in the file.
> BMG_VRAM_TEMPERATURE is used in both dg2 and bmg and has a bmg prefix.
> Doesn't seem right		

That's what we use for pcode registers.

Raag
