Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FA5C7EE39
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 07:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB57E10E3A6;
	Mon, 30 Jun 2025 07:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXlmBR6u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8002610E3A6
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 07:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751268629; x=1782804629;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UDxbpQ15IxVf+2wTqZbQJ3fTPgg8IaZ8MiQmaAHvyqc=;
 b=MXlmBR6urTT4oeEQMa6q+0NP3vUEJ55iaPEspAolBO53Ix57QXZnlnb3
 hchwFNzLiSijzlW14zcHNNh3icTTsGZOl/EnsqNNfeIswXeoyqCbnWiM3
 Qr/ShRQMS8yb+C/s+XNSJuNlpSaE0RT8JBxpj6npKJMR6iLFQBGdW1wcv
 9UxbqnrvoaTBkNr9/tYPZuOOBSHxklLxf20A08IOzACra4f6LhSz6fO5D
 GxGFm1EuIyDcgRofgZvxNNQjFol6tWf3O7LuWwtCra5IGow+l5GTJJ+jp
 xaA9wHRIghOsZkYIby5W4HbaETzUc41QmB8G6I+yRtihYEXMy91kSqjKk A==;
X-CSE-ConnectionGUID: eHxTLfwgRMO1Z86W+gGabg==
X-CSE-MsgGUID: vrItc4x3TCizClOyYSqZ1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="71053031"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="71053031"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 00:30:28 -0700
X-CSE-ConnectionGUID: kx5SBltdRq+aJvVD5fhRnQ==
X-CSE-MsgGUID: pr28x6e/Q8q298J8osKVhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="153479666"
Received: from smile.fi.intel.com ([10.237.72.52])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 00:30:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1uW8y3-0000000BEf9-2j4t; Mon, 30 Jun 2025 10:30:19 +0300
Date: Mon, 30 Jun 2025 10:30:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
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
Message-ID: <aGI9C6MR8qhe0MHR@smile.fi.intel.com>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
 <aF6nEOVhLURyf616@smile.fi.intel.com> <aF8N0dYk_WAJjvVu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF8N0dYk_WAJjvVu@intel.com>
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

On Fri, Jun 27, 2025 at 05:32:01PM -0400, Rodrigo Vivi wrote:
> On Fri, Jun 27, 2025 at 05:13:36PM +0300, Andy Shevchenko wrote:
> > On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:

...

> > >  static int dw_i2c_plat_probe(struct platform_device *pdev)
> > >  {
> > > +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> > 
> > > -	dev->flags = (uintptr_t)device_get_match_data(device);
> > >  	if (device_property_present(device, "wx,i2c-snps-model"))
> > > -		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > >  
> > >  	dev->dev = device;
> > >  	dev->irq = irq;
> > > +	dev->flags = flags;
> > 
> > Maybe I'm missing something, but why do we need these (above) changes?
> 
> in between, it is introduced a new one:
> flags |= ACCESS_POLLING;
> 
> So, the initialization moved up, before the ACCESS_POLLING, and
> it let the assignment to the last, along with the group.

I still don't get. The cited code is complete equivalent.

-- 
With Best Regards,
Andy Shevchenko


