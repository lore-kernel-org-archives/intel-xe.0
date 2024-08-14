Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6906FC3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 18:41:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B97C10E511;
	Wed, 14 Aug 2024 18:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eR5eLMDb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5875C10E511
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 18:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723660894; x=1755196894;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O/aHEkLNJilD3c9IPwuyc+N0ZIZA4Uevrm9gYgmpUhs=;
 b=eR5eLMDbrE0T/9Eq9ei9o0JRyXYNeBxlYJfECRMylvq05rJNzp/2WXzO
 qmQ2/GBDUwt1+gefSttwIor3Vh2HqQ5j/UJRGkVdPnmXCN3CDHGh3z8oH
 DkgUy38TahglnyW9p36GRSmVa3ukZJ9i7C1wnxjQeVMjRcRcrIh8RKjo+
 uPSUPVyG92NGz3X56oUlzwNB4xhYkpq34JaQe0n60nH9z687K0zb+YbQf
 Mtsf0JjUfySOeyRDx9jFuVW5igB8tU1pl0GJZ2NIKaBQ22i75uuL05NrB
 vlVYJQWLoe78Dq1kFJNX6O3/f2AnLJzsxBgrLSiAExQcIrszaVrTXNTuW Q==;
X-CSE-ConnectionGUID: FDd76yAZT0yWVm87v8rWAA==
X-CSE-MsgGUID: JBOQ8iz7Rw2cDS6N2l+hmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="25700073"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="25700073"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 11:41:33 -0700
X-CSE-ConnectionGUID: OxNrXsiMQwWHy8G0wRFg2g==
X-CSE-MsgGUID: evjWjApoTBeY+mU46rFG8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="59684910"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 11:41:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1seIw3-0000000FI1r-3Wdj; Wed, 14 Aug 2024 21:41:27 +0300
Date: Wed, 14 Aug 2024 21:41:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
 "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v11] drm/xe/vsec: Support BMG devices
Message-ID: <Zrz6V7iLFtnunMju@smile.fi.intel.com>
References: <20240812200422.444078-1-michael.j.ruhl@intel.com>
 <Zrtpd_WwougszltH@smile.fi.intel.com>
 <IA1PR11MB6418FAAD8AC5104D6F8FDE33C1862@IA1PR11MB6418.namprd11.prod.outlook.com>
 <Zry3hOBb_fHbvlIN@smile.fi.intel.com>
 <IA1PR11MB64182DD2B8D803A48D592D62C1872@IA1PR11MB6418.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR11MB64182DD2B8D803A48D592D62C1872@IA1PR11MB6418.namprd11.prod.outlook.com>
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

On Wed, Aug 14, 2024 at 04:49:05PM +0000, Ruhl, Michael J wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Wednesday, August 14, 2024 9:56 AM
> > On Tue, Aug 13, 2024 at 02:29:27PM +0000, Ruhl, Michael J wrote:
> > > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > Sent: Tuesday, August 13, 2024 10:11 AM On Mon, Aug 12, 2024 at
> > > > 04:04:22PM -0400, Michael J. Ruhl wrote:

...

> > > > > +#define BMG_DEVICE_ID 0xE2F8
> > > >
> > > > Is this defined in any specification? I mean is the format the same
> > > > as PCI device ID?
> > >
> > > I think that this is defined in BMG PMT yaml definition.  It is
> > > provide in the PMT discovery data, so it is defined by the specific device.
> > 
> > Is there any documentation / specification about this?
> > Can it be UUID or 64-bit number or other format?
> > _Where_ is this being specified?
> 
> The GUID is defined by the YAML file associated with the PMT device.  In this
> case 16 bits are a device ID.
> 
> From the cover letter of the PMT patch set (Intel Platform Monitoring Technology):
> 
> -
> The GUID uniquely identifies the register space of any monitor data exposed
> by the capability. The GUID is associated with an XML file from the vendor
> that describes the mapping of the register space along with properties of the
> monitor data.
> --
> 
> I was told that this was the value to use for this specific device/feature.
> 
> It is specified internally.  Not sure if there is any "documentation" available beyond
> that.

The YAML is *not* the specification. Do we have one that I can access to?
And I asked not about GUID, I asked about ID.

-- 
With Best Regards,
Andy Shevchenko


