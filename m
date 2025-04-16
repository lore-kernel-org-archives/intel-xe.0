Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293A9C369BD
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 15:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E286510E0F9;
	Wed, 16 Apr 2025 15:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vz11hE7y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD3B10E0F9
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 15:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744817187; x=1776353187;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Yac9G86MFFc4HisrsUUj0DNo8uUh0NWObun+KvOc4XY=;
 b=Vz11hE7yy2vP9wSyu9qKSXXRj5CI0YY+nL40a4JPEaTco8Qf0u9EAF9s
 87gVPPVxZsexao/K/Z/SNnWa8peDTOWPfA0dYWFo3Z+AJLe61aGSpJjFu
 CuDmJVuaHqJsA9YQgrD8YJunYcw+Edhmp19lLDEafyXsSy2jgbfftfj4g
 HaptW2g4plhOQ4xi5+Rud+J1Dqk9y6Dc+dXIOV3gI5A31I8JM64WnDRil
 GKMGbFZyqg3JrdleomiZ8paOyonR8Kct8Cvi74jG4iaCUnmmkZZibn6Zy
 YCGKrSNd2LhyyhE6NH81OpEzRpHOC53FZCmJqAPwnFQQCSQNrydlI4BYY g==;
X-CSE-ConnectionGUID: HpPQUxxFR9m1AwBbbU5YNQ==
X-CSE-MsgGUID: NKHfizT0TQy07J0WUFhpSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63909466"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="63909466"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 08:26:26 -0700
X-CSE-ConnectionGUID: bPHGbIfaQc2MXrCFMd7ZBg==
X-CSE-MsgGUID: rtcI9dX2RGOrReDtilT3WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="130515859"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 08:26:24 -0700
Date: Wed, 16 Apr 2025 18:26:22 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com
Subject: Re: [PATCH v2 2/3] drm/xe: Expose PCIe Gen4 downspeed attributes
Message-ID: <Z__MHqrwNmXW8lmu@black.fi.intel.com>
References: <20250403174742.1294227-1-raag.jadav@intel.com>
 <20250403174742.1294227-3-raag.jadav@intel.com>
 <d98a6b4b-1b14-4dbc-8833-e39c846a3b12@intel.com>
 <Z_-NUpQjdXIqrP_9@black.fi.intel.com>
 <16165ccb-25f8-4cd1-9ac7-63496c965be4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16165ccb-25f8-4cd1-9ac7-63496c965be4@intel.com>
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

On Wed, Apr 16, 2025 at 08:22:38PM +0530, Riana Tauro wrote:
> On 4/16/2025 4:28 PM, Raag Jadav wrote:
> > On Wed, Apr 16, 2025 at 03:36:55PM +0530, Riana Tauro wrote:
> > > Hi Raag
> > > 
> > > On 4/3/2025 11:17 PM, Raag Jadav wrote:
> > > > Expose sysfs attributes for PCIe Gen4 downspeed capability and status.

...

> > > > +static ssize_t
> > > > +pcie_gen4_downspeed_status_show(struct device *dev, struct device_attribute *attr, char *buf)
> > > > +{
> > > > +	struct pci_dev *pdev = to_pci_dev(dev);
> > > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > > +	u32 val;
> > > > +	int ret;
> > > > +
> > > > +	xe_pm_runtime_get(xe);
> > > > +	ret = xe_pcode_read(xe_device_get_root_tile(xe), PCODE_MBOX(DGFX_PCODE_STATUS,
> > > > +			    DGFX_GET_INIT_STATUS, 0), &val, NULL);
> > > indentation
> > 
> > Can you please elaborate? Shouldn't it follow the parentheses?
> yeah it should. DGFX_GET_INIT_STATUS should follow PCODE_MBOX parenthesis
> 
> or align PCODE_MBOX instead
> 
> ret = xe_pcode_read(xe_device_get_root_tile(xe),
>                     PCODE_MBOX...

Which means we should change it in hwmon as well?

Raag
