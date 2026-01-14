Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086E5D31A15
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 07:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBC410E5BA;
	Wed, 14 Jan 2026 07:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MF+L3DRZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC2710E5BA
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 07:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768375863; x=1799911863;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sgsUNkALw7bNXDpPqyECl6Ljz/nldGq/CaRsdZ5FEps=;
 b=MF+L3DRZmwFb/EIiXEqomnquJsZba8rNB+sLdzVyjNUwad0J7Cfl74Y5
 0rRQv0dXoea+UZ2+4pwHoMlGwFBKN24zGFSyzrJ447rXzI6/uixrLPzcv
 bdiAanNephz/4w0CgQOIBQ317RedyZI//PcqYxr7po1ezAPazKNbvo3ME
 dqjXOrkFxUGCU0W3LhzeWtkyp8q1aVvnmus/yB6ZlZV8GBGnB5HsFh994
 sMS7wbObcjBoKN2PIYQZf9qssfTofH8Dj9MUY10vjkVBGcbEQrnNpiYgz
 h0PVUSqIEbA2l7wwDUQ1Y1f/plkCjWEpaibQIukA7nnMoVF+1oCkAKaq5 A==;
X-CSE-ConnectionGUID: 2wy4lcolRienS7AAufrF2Q==
X-CSE-MsgGUID: 57rGC/hkSaO6kxgJfUSSiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80780195"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="80780195"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 23:31:02 -0800
X-CSE-ConnectionGUID: SEQ6f7lhQHOnEfXpsIRHTA==
X-CSE-MsgGUID: 1rn+Uih0R++ImUF2b6E4Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="227752936"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 23:31:00 -0800
Date: Wed, 14 Jan 2026 08:30:58 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH v7 4/4] drm/xe/hwmon: Expose individual VRAM channel
 temperature
Message-ID: <aWdGMjPTy3WnoejI@black.igk.intel.com>
References: <20260112203521.1014388-1-karthik.poosa@intel.com>
 <20260112203521.1014388-5-karthik.poosa@intel.com>
 <aWYAewvdkrS_WSZx@black.igk.intel.com>
 <e0e82ba8-e277-47c0-8003-d07628e5552a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0e82ba8-e277-47c0-8003-d07628e5552a@intel.com>
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

On Tue, Jan 13, 2026 at 03:28:51PM +0530, Poosa, Karthik wrote:
> On 13-01-2026 13:51, Raag Jadav wrote:
> > On Tue, Jan 13, 2026 at 02:05:21AM +0530, Karthik Poosa wrote:
> > > Expose individual VRAM temperature attributes.
> > > Update Xe hwmon documentation for this entry.
> > ...
> > 
> > > @@ -255,6 +264,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
> > >   				return BMG_PACKAGE_TEMPERATURE;
> > >   			else if (channel == CHANNEL_VRAM)
> > >   				return BMG_VRAM_TEMPERATURE;
> > > +			else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
> > I think this should be
> > 
> > 	if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> > 
> > or did I miss something?
> I’ve ran IGT hwmon test and lm-sensors and didn't see any discrepancies
> there, all available channels are seen.

Sure, but shouldn't we fix the buggy logic?

Raag

> > > +				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
> > >   		} else if (xe->info.platform == XE_DG2) {
> > >   			if (channel == CHANNEL_PKG)
> > >   				return PCU_CR_PACKAGE_TEMPERATURE;
> > ...
> > 
> > > @@ -1353,6 +1415,8 @@ static int xe_hwmon_read_label(struct device *dev,
> > >   			       enum hwmon_sensor_types type,
> > >   			       u32 attr, int channel, const char **str)
> > >   {
> > > +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> > > +
> > >   	switch (type) {
> > >   	case hwmon_temp:
> > >   		if (channel == CHANNEL_PKG)
> > > @@ -1363,6 +1427,8 @@ static int xe_hwmon_read_label(struct device *dev,
> > >   			*str = "mctrl";
> > >   		else if (channel == CHANNEL_PCIE)
> > >   			*str = "pcie";
> > > +		else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
> > Ditto.
> > 
> > Raag
> > 
> > > +			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
> > >   		return 0;
> > >   	case hwmon_power:
> > >   	case hwmon_energy:
> > > -- 
> > > 2.25.1
> > > 
