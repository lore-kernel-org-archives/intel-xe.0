Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5931FD637A4
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 17:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239A110E05E;
	Wed, 13 Nov 2024 17:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f1xz0HiT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFC710E05E
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 17:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731520547; x=1763056547;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VqcHzMj7FGsDg+drn6MfdAVbHDBIT81BUUgNvJnmfoA=;
 b=f1xz0HiTk1S/lH/hqcNWbHjJflvos1HopVJyGTkEeqhoNxesxNaEid2K
 5fvnZqOq1sI1Em92vZkfUKR275vHXIMd0VIw3W4/D7/QMlT9ThIXimClI
 lmVP8voF28pBXzluFFJ2dO0uLZQibjCg/Nq6H+jfu6QKzibcD9UDXf338
 OHgf0jUVSw7d/ZN+EeAPX+VjZucK9A+CvmVgwHNar2qohQFCfPWJmSL2V
 Lwc2k614nh1omhQTVPzXZG7D6YZPQfudECQvpKSYisjdLsWl4Y9sMmX4n
 Z+WwCOxEjNZS1RRkLcO+ehkAKqgh+Q7PY2oZBdy4ULg+G2PncEgKuWJ7w Q==;
X-CSE-ConnectionGUID: 87bC/ZuoTm2WwrHzM2ONtw==
X-CSE-MsgGUID: 8YTZXSA8T+SZUNSN0qMJHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42543861"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="42543861"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 09:55:47 -0800
X-CSE-ConnectionGUID: OxnK64iJRUKcNcF6u4NlsQ==
X-CSE-MsgGUID: th3tA4NRSWSNxkWBAPdjCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="111253941"
Received: from smile.fi.intel.com ([10.237.72.154])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 09:55:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tBHag-0000000EQZv-1TZv; Wed, 13 Nov 2024 19:55:42 +0200
Date: Wed, 13 Nov 2024 19:55:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, Hans de Goede <hdegoede@redhat.com>,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Subject: Re: [PATCH v2 0/2] Support BMG PMT features for Xe
Message-ID: <ZzToHkaM3BhsSwe1@smile.fi.intel.com>
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
 <ZzSBpq2IakMrvV6h@smile.fi.intel.com>
 <23fe9eca-ebd3-4098-22ab-d21434026273@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23fe9eca-ebd3-4098-22ab-d21434026273@linux.intel.com>
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

On Wed, Nov 13, 2024 at 03:52:01PM +0200, Ilpo Järvinen wrote:
> On Wed, 13 Nov 2024, Andy Shevchenko wrote:
> > On Tue, Nov 12, 2024 at 11:30:33AM -0500, Michael J. Ruhl wrote:
> > > Updates for PMT to support user offsets from the sysfs API.
> > > 
> > > Addressed review comments for the Xe driver udpates.
> > 
> > FWIW,
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > If you have wish and time, there are problems with the drivers of different
> > severities (from "fine as is" to "good to be fixed, but okay as is") I have
> > noticed so far:
> > - it uses s*printf() instead of sysfs_emit*()
> > - it most likely never tested the corner cases. e.g.,
> > 
> > 	if (disc_res->start >= pci_resource_start(pci_dev, i) &&
> > 	    (disc_res->start <= pci_resource_end(pci_dev, i))) {
> > 
> >   what is this supposed to mean? Probably someone wanted resource_contains() or
> >   alike to be called here.
> > - slightly above the above piece the for-loop
> > 
> > 	for (i = 0; i < 6; i++)
> > 
> >   which probably want to use PCI_STD_RESOURCE_END)
> 
> While both work, in practice PCI_STD_NUM_BARS is way more common than 
> PCI_STD_RESOURCE_END.

Ah, indeed. I always forget that we have two.

-- 
With Best Regards,
Andy Shevchenko


