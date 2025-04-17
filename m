Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E76CC369B2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 07:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4271C10E18C;
	Thu, 17 Apr 2025 07:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8kdj11q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332ED10E18C
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 07:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744876095; x=1776412095;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wVziAHUufwH3iKMILOfKBxB+XPVOWl95IrItS/2AIvk=;
 b=n8kdj11qT6/3AysODkr6RnuEr54BEH8TRiQsTLY+Q14lKnYeQH++oEWd
 kJajlGwTdUXwLggdxa3A310/b8BrUZxepOHFsB8k9L2p6dJvoIYJBl7+N
 DcLaLePUx78SOd4payXCavTnl8kZTdfPJiPU+JZnt8NEXueR9CGqON3UW
 wE7Z8TIUh8f0VkgTHP4uXX6609IobqqGsx8YV+FplwUYAgdi3d9LaRDhv
 7z761q564LenerQRy+U11ywkA/os9DqTNVH5XbNj+WW7Vvw0uX/av4Vec
 t6V6XZHgvUULXYZR/LzG2UHLcpF5krYZkmeJTjk71RjTFQRCz3EceraMT Q==;
X-CSE-ConnectionGUID: WfAVUsTDQOC45UVJNyrLMg==
X-CSE-MsgGUID: qw0O7peVRwyNkieNZGMYeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46462091"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46462091"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 00:48:14 -0700
X-CSE-ConnectionGUID: MHm16eFwSOWkqSFVpFIhLg==
X-CSE-MsgGUID: 526c6M9vQZuISWSXMYMCGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="135541169"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 00:48:12 -0700
Date: Thu, 17 Apr 2025 10:48:09 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com
Subject: Re: [PATCH v2 2/3] drm/xe: Expose PCIe Gen4 downspeed attributes
Message-ID: <aACyOW5u9Hof1vaP@black.fi.intel.com>
References: <20250403174742.1294227-1-raag.jadav@intel.com>
 <20250403174742.1294227-3-raag.jadav@intel.com>
 <d98a6b4b-1b14-4dbc-8833-e39c846a3b12@intel.com>
 <Z_-NUpQjdXIqrP_9@black.fi.intel.com>
 <16165ccb-25f8-4cd1-9ac7-63496c965be4@intel.com>
 <Z__MHqrwNmXW8lmu@black.fi.intel.com>
 <6ef5b3b0-cf8c-4882-a686-9b9c7f6679c1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ef5b3b0-cf8c-4882-a686-9b9c7f6679c1@intel.com>
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

On Thu, Apr 17, 2025 at 10:47:19AM +0530, Riana Tauro wrote:
> On 4/16/2025 8:56 PM, Raag Jadav wrote:
> > On Wed, Apr 16, 2025 at 08:22:38PM +0530, Riana Tauro wrote:
> > > On 4/16/2025 4:28 PM, Raag Jadav wrote:
> > > > On Wed, Apr 16, 2025 at 03:36:55PM +0530, Riana Tauro wrote:
> > > > > Hi Raag
> > > > > 
> > > > > On 4/3/2025 11:17 PM, Raag Jadav wrote:
> > > > > > Expose sysfs attributes for PCIe Gen4 downspeed capability and status.
> > 
> > ...
> > 
> > > > > > +static ssize_t
> > > > > > +pcie_gen4_downspeed_status_show(struct device *dev, struct device_attribute *attr, char *buf)
> > > > > > +{
> > > > > > +	struct pci_dev *pdev = to_pci_dev(dev);
> > > > > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > > > > +	u32 val;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	xe_pm_runtime_get(xe);
> > > > > > +	ret = xe_pcode_read(xe_device_get_root_tile(xe), PCODE_MBOX(DGFX_PCODE_STATUS,
> > > > > > +			    DGFX_GET_INIT_STATUS, 0), &val, NULL);
> > > > > indentation
> > > > 
> > > > Can you please elaborate? Shouldn't it follow the parentheses?
> > > yeah it should. DGFX_GET_INIT_STATUS should follow PCODE_MBOX parenthesis
> > > 
> > > or align PCODE_MBOX instead
> > > 
> > > ret = xe_pcode_read(xe_device_get_root_tile(xe),
> > >                      PCODE_MBOX...

This'll warrant a third line which we can easily avoid here.

> > Which means we should change it in hwmon as well?
> Not sure about hwmon. checkpatch is also mentioning the same
> 
> -:89: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
> #89: FILE: drivers/gpu/drm/xe/xe_device_sysfs.c:130:
> 	ret = xe_pcode_read(xe_device_get_root_tile(xe),
> PCODE_MBOX(DGFX_PCODE_STATUS,
> 			    DGFX_GET_INIT_STATUS, 0), &val, NULL);

Yes, it complains about a lot of things but it's referred as a general
guidance than a hard rule.

https://lore.kernel.org/all/CAHk-=wgfzPOao+Rbq4aSitQ2gPaZ9PPGbR290X4BikD_W8ZcUg@mail.gmail.com/

Raag
