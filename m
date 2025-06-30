Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E2BC8302F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 13:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18F010E459;
	Mon, 30 Jun 2025 13:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="asF9A2tG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C153F10E451
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751289425; x=1782825425;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=C4G61X+GZRiY0wySqD/8oZ9zCG/EbzIivgQZ9FfrQkI=;
 b=asF9A2tGaoO6DE9xza2uV6RRKDQEjl+gG4q6IpOah7reWRx1yLf0F9CW
 3RjshF++xJZyilWT3vJSvQZ+m2EXhpGSZO0fFxJYu/s56IEzfn2rsUx5e
 oH3fMF2oF/YP365qm/jjBGWW/btrvaH5aCBk0k3Liu7XxRZqdEimVxtYd
 vRbjS3w+eJzQQdgC8HB4UtWFU83PFBeRRYruanJOgoQZreFQyv/MWz9JO
 JoderwPeLUaiuP7n62M5gfBDBh5WZ8lgx0jRGSUcRnDX6ZSwrpewEmQuP
 b5lA1spzxb2kGJhsRr0hq5eeCoUhddaiFhUBv0e4g9PmdRw/gF0fAJAES Q==;
X-CSE-ConnectionGUID: Ez29uiVNQ7azzo5gCeQV+A==
X-CSE-MsgGUID: 8m6np5J4S82DtmQqIusxAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57320133"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="57320133"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 06:17:04 -0700
X-CSE-ConnectionGUID: 11SXBEQeR8GzYBlWXx7EDw==
X-CSE-MsgGUID: ZP+cpgEURHOK7ryIU+BFBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="153088137"
Received: from smile.fi.intel.com ([10.237.72.52])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 06:16:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1uWENU-0000000BJat-1ySr; Mon, 30 Jun 2025 16:16:56 +0300
Date: Mon, 30 Jun 2025 16:16:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] i2c: designware: Add quirk for Intel Xe
Message-ID: <aGKOSIfS2kTqeHLt@smile.fi.intel.com>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
 <aF6nEOVhLURyf616@smile.fi.intel.com> <aF8N0dYk_WAJjvVu@intel.com>
 <aGI9C6MR8qhe0MHR@smile.fi.intel.com>
 <aGJGWFOpccaNzpni@kuha.fi.intel.com>
 <aGJg0FZK__xYGP7C@smile.fi.intel.com>
 <aGJ8GZXEzJo1IVXM@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGJ8GZXEzJo1IVXM@kuha.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Mon, Jun 30, 2025 at 02:59:21PM +0300, Heikki Krogerus wrote:
> On Mon, Jun 30, 2025 at 01:02:56PM +0300, Andy Shevchenko wrote:
> > On Mon, Jun 30, 2025 at 11:10:00AM +0300, Heikki Krogerus wrote:
> > > On Mon, Jun 30, 2025 at 10:30:19AM +0300, Andy Shevchenko wrote:
> > > > On Fri, Jun 27, 2025 at 05:32:01PM -0400, Rodrigo Vivi wrote:
> > > > > On Fri, Jun 27, 2025 at 05:13:36PM +0300, Andy Shevchenko wrote:
> > > > > > On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:

...

> > > > > > >  static int dw_i2c_plat_probe(struct platform_device *pdev)
> > > > > > >  {
> > > > > > > +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> > > > > > 
> > > > > > > -	dev->flags = (uintptr_t)device_get_match_data(device);
> > > > > > >  	if (device_property_present(device, "wx,i2c-snps-model"))
> > > > > > > -		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > > > > +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > > > >  
> > > > > > >  	dev->dev = device;
> > > > > > >  	dev->irq = irq;
> > > > > > > +	dev->flags = flags;
> > > > > > 
> > > > > > Maybe I'm missing something, but why do we need these (above) changes?
> > > > > 
> > > > > in between, it is introduced a new one:
> > > > > flags |= ACCESS_POLLING;
> > > > > 
> > > > > So, the initialization moved up, before the ACCESS_POLLING, and
> > > > > it let the assignment to the last, along with the group.
> > > > 
> > > > I still don't get. The cited code is complete equivalent.
> > > 
> > > This was requested by Jarkko.
> > 
> > Okay, but why? Sounds to me like unneeded churn. Can't we do this later when
> > required?
> 
> You need to ask why from Jarkko - I did not really question him on
> this one. Unfortunately his on vacation at the moment.

Yeah :-(

> I can drop this, but then I'll have to drop also Jarkko's ACK.

I can give mine if it helps. The code as far as I can see is 100% equivalent.

> I think we already agreed that this function, and probable the entire
> file, need to be refactored a bit, so would you mind much if we just
> went ahead with this as it is?
> 
> I'm asking that also because I don't have means or time to test this
> anymore before I start my vacation.

I see, then we may ask Andi and Wolfram on this. I slightly prefer to have
no additional churn added without a good reason.

-- 
With Best Regards,
Andy Shevchenko


