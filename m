Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59F5C369CB
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 05:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B3910E0AA;
	Tue, 29 Apr 2025 05:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XFIQfxJd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BFD10E0AA
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 05:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745905129; x=1777441129;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vPS53YTsCCnFy/SLYoUHIi9hkTOGoHLknFVLlgL0NDw=;
 b=XFIQfxJdTOQtYI4pWzLKtWsimj3kdGs0bdfbh+AP+A7bhs/8ahwhS6KS
 sXdke9caFwngjhSvy2e7A6DGMWIGtZ4crUOmHcT5aMMmWa0+mH2CFtTf6
 BYl+Vs6XyQUsFyISKCdC41aRcMjoL7peZlCtTiKuuA5XDzjY172OFGwEB
 SRSKTSfPQ/nnJWR4XfQhSLXbjXzoWR2ED79u0YY/mAZMHtxiATHFnDL3t
 XvkXuqTrQagEAqN8FUSeelAY5hV8saR6+I+gZd/howyAMEo+RQLK3BKAP
 Fb3qfA3xbVk4nUUBwmVlSYzmuQZz5hMwH8Gc2Ky13I2UWFnNSYnxm1buy Q==;
X-CSE-ConnectionGUID: d21QOiXQQOqt9jSltibeYg==
X-CSE-MsgGUID: 5Tq/ZpQXQvu2cJa/MV7wFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="50173995"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="50173995"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 22:38:48 -0700
X-CSE-ConnectionGUID: 6RQHCfMmSiG3aQFGEQ0xsg==
X-CSE-MsgGUID: 1KoQpEmDT+6kGIo9W7q2cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="138715733"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 22:38:46 -0700
Date: Tue, 29 Apr 2025 08:38:42 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH v4 0/3] BMG PCIe Gen5 downgrade attributes and usage
Message-ID: <aBBl4ukmZJ0b72dN@black.fi.intel.com>
References: <20250425140626.3082588-1-raag.jadav@intel.com>
 <aA9UlvQfo5-6-CtB@black.fi.intel.com> <aA_ebBh6mxsEJi1w@intel.com>
 <aA_gYVCQe1JEY_xB@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA_gYVCQe1JEY_xB@intel.com>
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

On Mon, Apr 28, 2025 at 04:09:05PM -0400, Rodrigo Vivi wrote:
> On Mon, Apr 28, 2025 at 04:00:44PM -0400, Rodrigo Vivi wrote:
> > On Mon, Apr 28, 2025 at 01:12:38PM +0300, Raag Jadav wrote:
> > > On Fri, Apr 25, 2025 at 07:36:23PM +0530, Raag Jadav wrote:
> > > > This series exposes sysfs attributes for BMG PCIe Gen5 downgrade and
> > > > documents their usage.
> > > 
> > > Anything I can do to move this forward?
> > 
> > I almost push it here, but then I noticed that it is gen5_downgrade.
> > Hadn't we agreed to follow what spec says so?
> > 
> > "to then automatically persist the Gen4 downgrade flag in Flash"
> > "Write Gen4 Downgrade bit to MRC Flash File"
> > 
> > == Applying  PCIe Gen4 Downgrade ==
> > 
> > Although I see that there are some mentions calling "Gen5 downgrade", "Gen4 downgrade" seems to be the most used term in the specs, specially when calling bits and
> > sections names...

Which is what I followed until we had a change of preference over gen definition.
https://lore.kernel.org/intel-xe/34b33d3135fc24302db2764ce86a641e7c49054f.camel@intel.com/

> Because of the inconsistencies and our back and forth here and to get prepared
> for future cases where we might need to downgrade from gen6 to gen5, the current
> Architecture recommendation is to simply go with
> 
> so /sys/bus/pci/devices/<bdf>/pcie_gen_downgrade_{status,capable}

I really like Lucas' proposal, which is also consistent with similar existing
attributes.

/sys/bus/pci/devices/<bdf>/auto_link_downgrade_capable

Think we should give it a try?

Raag
