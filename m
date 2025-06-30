Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23B3C8302D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 14:16:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B844610E444;
	Mon, 30 Jun 2025 14:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFMFuzaO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BC610E444
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751293011; x=1782829011;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OzPYGM4z9O73qf5/x0rNrOGtpP0MsiPbpJZyM0orLTE=;
 b=NFMFuzaOcrhWaK9s8IOKDOkIRE5uzWVcN/lo/dlEdoGkdik9SnW21Vw6
 /rCJ/hgubR0LVwoivhZzvRKx5Ud8dOchPLuupx0ea4gAJesxg4GeDGzo5
 lvYEQ9zxAGN27JSokyV4x2/NPzhWxe4RX3EMNjnwGgqgEoFLMCQmNdO9W
 xwKDrjBEnbrJ9ZIhCRVGzolCma2rertwmMN+rpOidGtmKIY0VGhuJ0afu
 9W8ndSKAEpJh8ova5waKAfBlgNCG5foRO5wURAaT8IqHlMEtSit6B0IA6
 THS9cryIx1F0fWn03KRoi2Zf2X0jLfp5zPe24CABWEnHmPJwCkRMBaxF2 Q==;
X-CSE-ConnectionGUID: r4xEqRIGQP2OWpUGHoM5cg==
X-CSE-MsgGUID: c5NHy0eORxeKt1yJmT5jlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="70953175"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="70953175"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 07:16:51 -0700
X-CSE-ConnectionGUID: 58+RhZqhRG+b0WD5ZFiBsw==
X-CSE-MsgGUID: YYmDo1P1T2mvWYNOXes65w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="184493720"
Received: from kuha.fi.intel.com ([10.237.72.152])
 by orviesa002.jf.intel.com with SMTP; 30 Jun 2025 07:16:45 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Mon, 30 Jun 2025 17:16:44 +0300
Date: Mon, 30 Jun 2025 17:16:44 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Message-ID: <aGKcTCSL4QMkx86I@kuha.fi.intel.com>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
 <aF6nEOVhLURyf616@smile.fi.intel.com> <aF8N0dYk_WAJjvVu@intel.com>
 <aGI9C6MR8qhe0MHR@smile.fi.intel.com>
 <aGJGWFOpccaNzpni@kuha.fi.intel.com>
 <aGJg0FZK__xYGP7C@smile.fi.intel.com>
 <aGJ8GZXEzJo1IVXM@kuha.fi.intel.com>
 <aGKOSIfS2kTqeHLt@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGKOSIfS2kTqeHLt@smile.fi.intel.com>
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

On Mon, Jun 30, 2025 at 04:16:56PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 30, 2025 at 02:59:21PM +0300, Heikki Krogerus wrote:
> > On Mon, Jun 30, 2025 at 01:02:56PM +0300, Andy Shevchenko wrote:
> > > On Mon, Jun 30, 2025 at 11:10:00AM +0300, Heikki Krogerus wrote:
> > > > On Mon, Jun 30, 2025 at 10:30:19AM +0300, Andy Shevchenko wrote:
> > > > > On Fri, Jun 27, 2025 at 05:32:01PM -0400, Rodrigo Vivi wrote:
> > > > > > On Fri, Jun 27, 2025 at 05:13:36PM +0300, Andy Shevchenko wrote:
> > > > > > > On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:
> 
> ...
> 
> > > > > > > >  static int dw_i2c_plat_probe(struct platform_device *pdev)
> > > > > > > >  {
> > > > > > > > +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> > > > > > > 
> > > > > > > > -	dev->flags = (uintptr_t)device_get_match_data(device);
> > > > > > > >  	if (device_property_present(device, "wx,i2c-snps-model"))
> > > > > > > > -		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > > > > > +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > > > > >  
> > > > > > > >  	dev->dev = device;
> > > > > > > >  	dev->irq = irq;
> > > > > > > > +	dev->flags = flags;
> > > > > > > 
> > > > > > > Maybe I'm missing something, but why do we need these (above) changes?
> > > > > > 
> > > > > > in between, it is introduced a new one:
> > > > > > flags |= ACCESS_POLLING;
> > > > > > 
> > > > > > So, the initialization moved up, before the ACCESS_POLLING, and
> > > > > > it let the assignment to the last, along with the group.
> > > > > 
> > > > > I still don't get. The cited code is complete equivalent.
> > > > 
> > > > This was requested by Jarkko.
> > > 
> > > Okay, but why? Sounds to me like unneeded churn. Can't we do this later when
> > > required?
> > 
> > You need to ask why from Jarkko - I did not really question him on
> > this one. Unfortunately his on vacation at the moment.
> 
> Yeah :-(
> 
> > I can drop this, but then I'll have to drop also Jarkko's ACK.
> 
> I can give mine if it helps. The code as far as I can see is 100% equivalent.
> 
> > I think we already agreed that this function, and probable the entire
> > file, need to be refactored a bit, so would you mind much if we just
> > went ahead with this as it is?
> > 
> > I'm asking that also because I don't have means or time to test this
> > anymore before I start my vacation.
> 
> I see, then we may ask Andi and Wolfram on this. I slightly prefer to have
> no additional churn added without a good reason.

OK. I'll fix this.

thanks,

-- 
heikki
