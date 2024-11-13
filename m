Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638A3D637A8
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 18:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B06710E277;
	Wed, 13 Nov 2024 18:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LS2DW1bZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40AA10E277
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 18:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731524351; x=1763060351;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2TCZS2kT/4xRMhlbLXb6MTvMySCGK/8FMg1LpclUHrc=;
 b=LS2DW1bZ5IC5Vbx1x2HfGswUBV3uGmPUWwSsTLGtwgyySls8cR58LJzk
 kz5SsC2+0XZV0qvhx3YRFLvNhRL2LTSJm9uzb69mnN3rF6ObuXkiL+ZaL
 8A/S422VbMCzc+XHOWqjNc0WPAetZU+cBwAE/3nsr9y1NaMYo2W2JP/jq
 kLDiq24sU6k8986G9Pg5C9gJBK8YElPKRZINJCsxj+DuAcWyqZGbbqI2V
 4y0JMPta3NTsa4g4Xd/AWvC+GqFRHlbK1KV0kIiqTEh37HnwgUFMmr2v6
 zExggewuF9nINUw6RvbGMif3+UxXFO9/cVsNGJupud9riaNgZqc5lMgfq A==;
X-CSE-ConnectionGUID: DRLROJ7iQ9Wenss5i73UPw==
X-CSE-MsgGUID: 8OHRTlK3SWifLALLjy0VTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="48940612"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="48940612"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 10:59:10 -0800
X-CSE-ConnectionGUID: Xre2VOCSQs6wmcbA+YeALg==
X-CSE-MsgGUID: 192EfGiBRV+rK3lQRvWQgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="88766710"
Received: from smile.fi.intel.com ([10.237.72.154])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 10:59:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tBIa1-0000000ERrU-1WMj; Wed, 13 Nov 2024 20:59:05 +0200
Date: Wed, 13 Nov 2024 20:59:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com
Subject: Re: [PATCH v2 0/2] Support BMG PMT features for Xe
Message-ID: <ZzT2-R2uiXn_cHRT@smile.fi.intel.com>
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
 <ZzSBpq2IakMrvV6h@smile.fi.intel.com>
 <23fe9eca-ebd3-4098-22ab-d21434026273@linux.intel.com>
 <7e22fc28bd8d81d42c75166b8792eaf0d856a413.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e22fc28bd8d81d42c75166b8792eaf0d856a413.camel@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Nov 13, 2024 at 10:40:42AM -0800, David E. Box wrote:
> On Wed, 2024-11-13 at 15:52 +0200, Ilpo Järvinen wrote:
> > On Wed, 13 Nov 2024, Andy Shevchenko wrote:
> > > On Tue, Nov 12, 2024 at 11:30:33AM -0500, Michael J. Ruhl wrote:
> > > > Updates for PMT to support user offsets from the sysfs API.
> > > > 
> > > > Addressed review comments for the Xe driver udpates.
> > > 
> > > FWIW,
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > 
> > > If you have wish and time, there are problems with the drivers of different
> > > severities (from "fine as is" to "good to be fixed, but okay as is") I have
> > > noticed so far:
> > > - it uses s*printf() instead of sysfs_emit*()
> > > - it most likely never tested the corner cases. e.g.,
> > > 
> > > 	if (disc_res->start >= pci_resource_start(pci_dev, i) &&
> > > 	    (disc_res->start <= pci_resource_end(pci_dev, i))) {
> > > 
> > >   what is this supposed to mean? Probably someone wanted resource_contains()
> > > or
> > >   alike to be called here.
> 
> This is a corner case that occurs for devices that are non-compliant, in this
> case meaning devices that don't follow our PMT spec convention of specifying
> which BAR an address belongs to. Without this information, we have to deduce the
> BAR manually to access other needed registers that are offset from the base of
> that BAR.

What I am pointing out is that we compare start address (and only start!) to
both, start _and_ end of the given resource. So currently the second check is
redundant and that looks suspicious. I believe one wanted to have

	if (disc_res->start >= pci_resource_start(pci_dev, i) &&
	    (disc_res->end <= pci_resource_end(pci_dev, i))) {

(note end!) and if using helpers, this would never happened :-)

> I can change this to use resource_contains().

Please, will clarify the above confusion..

> > > - slightly above the above piece the for-loop
> > > 
> > > 	for (i = 0; i < 6; i++)
> > > 
> > >   which probably want to use PCI_STD_RESOURCE_END)
> > 
> > While both work, in practice PCI_STD_NUM_BARS is way more common than 
> > PCI_STD_RESOURCE_END.
> 
> Will change this too. Thanks.

You are welcome!

-- 
With Best Regards,
Andy Shevchenko


