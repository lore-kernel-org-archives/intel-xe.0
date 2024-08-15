Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2B0C3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 10:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A81110E0E1;
	Thu, 15 Aug 2024 10:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQK6GDSS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5325710E0E1
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 10:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723719327; x=1755255327;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2x6zBr5jJ3GyCSHraVXNQnEEAlh9ac9N4pdGaGsxLHA=;
 b=LQK6GDSSfijz9zdRoDpFlC46BNSTVMiS1jYc2r2Khp8HvVr3qAnTZhzf
 q/AqSwI4bWBz4TsiaGI4E1NXhlWvQevhCeyv3yX5IJnntR0QSSwzOyU7p
 9ZTgYlIL+iRdbODhf9nY8dFOHEMak4qOgy3umWol7TUQCwVcQgs9M7HwJ
 lpvivp835DB2J0lyaNL5ce522sdzKwTjh1oa/n+ND05+/JwRCqLUqPQol
 U1vouNhNJSLykVm5+1yiy1wn8hnfkErJBangJgSVUurfsKGdXO0W660nV
 RvFq5FAdiccMudF96gERPQWYVOaRhTVmzoYZRx+8nsQZ2LSnJx5VmNy6K w==;
X-CSE-ConnectionGUID: q9foqjj0SMSg/tMD94veew==
X-CSE-MsgGUID: kBdUsMHvRfWtCWrg1ZA8jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="33119778"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; d="scan'208";a="33119778"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 03:55:26 -0700
X-CSE-ConnectionGUID: IPjiwhZPTVKdPnUOxlYOhw==
X-CSE-MsgGUID: x1z5Y/AZTj2S/P0ZIjMueA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; d="scan'208";a="59345652"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 03:55:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1seY8X-0000000FWiW-1DYH; Thu, 15 Aug 2024 13:55:21 +0300
Date: Thu, 15 Aug 2024 13:55:20 +0300
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
Message-ID: <Zr3emGSJGy7Y2VAB@smile.fi.intel.com>
References: <20240812200422.444078-1-michael.j.ruhl@intel.com>
 <Zrtpd_WwougszltH@smile.fi.intel.com>
 <IA1PR11MB6418FAAD8AC5104D6F8FDE33C1862@IA1PR11MB6418.namprd11.prod.outlook.com>
 <Zry3hOBb_fHbvlIN@smile.fi.intel.com>
 <IA1PR11MB64182DD2B8D803A48D592D62C1872@IA1PR11MB6418.namprd11.prod.outlook.com>
 <Zrz6V7iLFtnunMju@smile.fi.intel.com>
 <IA1PR11MB641878A813B6D2EC044BD28FC1872@IA1PR11MB6418.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR11MB641878A813B6D2EC044BD28FC1872@IA1PR11MB6418.namprd11.prod.outlook.com>
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

On Wed, Aug 14, 2024 at 08:47:28PM +0000, Ruhl, Michael J wrote:
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Wednesday, August 14, 2024 2:41 PM
> > On Wed, Aug 14, 2024 at 04:49:05PM +0000, Ruhl, Michael J wrote:
> > > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > Sent: Wednesday, August 14, 2024 9:56 AM On Tue, Aug 13, 2024 at
> > > > 02:29:27PM +0000, Ruhl, Michael J wrote:
> > > > > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > > Sent: Tuesday, August 13, 2024 10:11 AM On Mon, Aug 12, 2024 at
> > > > > > 04:04:22PM -0400, Michael J. Ruhl wrote:

...

> > > > > > > +#define BMG_DEVICE_ID 0xE2F8
> > > > > >
> > > > > > Is this defined in any specification? I mean is the format the
> > > > > > same as PCI device ID?
> > > > >
> > > > > I think that this is defined in BMG PMT yaml definition.  It is
> > > > > provide in the PMT discovery data, so it is defined by the specific device.
> > > >
> > > > Is there any documentation / specification about this?
> > > > Can it be UUID or 64-bit number or other format?
> > > > _Where_ is this being specified?
> > >
> > > The GUID is defined by the YAML file associated with the PMT device.
> > > In this case 16 bits are a device ID.
> > >
> > > From the cover letter of the PMT patch set (Intel Platform Monitoring
> > Technology):
> > >
> > > -
> > > The GUID uniquely identifies the register space of any monitor data
> > > exposed by the capability. The GUID is associated with an XML file
> > > from the vendor that describes the mapping of the register space along
> > > with properties of the monitor data.
> > > --
> > >
> > > I was told that this was the value to use for this specific device/feature.
> > >
> > > It is specified internally.  Not sure if there is any "documentation"
> > > available beyond that.
> > 
> > The YAML is *not* the specification. Do we have one that I can access to?
> > And I asked not about GUID, I asked about ID.
> 
> Andy,
> 
> For the BMG device, the device ID is defined as part PMT GUID, and 
> will be defined by the BMG PMT YAML specification.
> 
> So this is a vendor defined value.

Okay, thank you for clarification.

> Need to do some testing, and then I will re-post the patch.

-- 
With Best Regards,
Andy Shevchenko


