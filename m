Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68E7C7EE39
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 08:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E70410E209;
	Mon, 30 Jun 2025 08:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdM0l3c7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE0E10E209
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 08:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751271007; x=1782807007;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XjCziwLh/M47LtkXzPuWSgze06sAN1CpF/QSDZYoe5E=;
 b=ZdM0l3c7CZC8IVZ4tInrTB2UDJBU7QDW8V2qpRwj7muoF9ReGrfTGmod
 D1Q6PBdT2vZdPNMKbLDU0YCrNq2aZZeHa14NBwVglEfPoE4oTkmcQNtZ1
 KYGbDAUvUJ+SIcR3aIEaMak4gfemEafiLS4sunLzUTaYmnVP6xlC5qfk6
 Te/xJ24F+FInDA9ZpO0yl70p/dpf3KBdKTa+7pRpRYFcH4lw7D9tyLY6a
 tTBb/bkQv9uiKALrXfexssSuXSRb82Wy1opg92d4nDWAOHMm7V8LUQ1GU
 4CLSKfK6Kz3VFxbGFT+MrJA9xu3xDkdXuXjRFjx7U1/Ze1zZzF/Snuh21 w==;
X-CSE-ConnectionGUID: lBtMvXlJTDOlrjFMOyBYgQ==
X-CSE-MsgGUID: F+gNEslzT2uo387Oeq2LJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53428434"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="53428434"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 01:10:06 -0700
X-CSE-ConnectionGUID: 61uZ8m06SIqRVWaWZKuwlQ==
X-CSE-MsgGUID: 83P5icZhS9S+Njg8Af8XmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="153935577"
Received: from kuha.fi.intel.com ([10.237.72.152])
 by fmviesa008.fm.intel.com with SMTP; 30 Jun 2025 01:10:01 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Mon, 30 Jun 2025 11:10:00 +0300
Date: Mon, 30 Jun 2025 11:10:00 +0300
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
Message-ID: <aGJGWFOpccaNzpni@kuha.fi.intel.com>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
 <aF6nEOVhLURyf616@smile.fi.intel.com> <aF8N0dYk_WAJjvVu@intel.com>
 <aGI9C6MR8qhe0MHR@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGI9C6MR8qhe0MHR@smile.fi.intel.com>
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

On Mon, Jun 30, 2025 at 10:30:19AM +0300, Andy Shevchenko wrote:
> On Fri, Jun 27, 2025 at 05:32:01PM -0400, Rodrigo Vivi wrote:
> > On Fri, Jun 27, 2025 at 05:13:36PM +0300, Andy Shevchenko wrote:
> > > On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:
> 
> ...
> 
> > > >  static int dw_i2c_plat_probe(struct platform_device *pdev)
> > > >  {
> > > > +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> > > 
> > > > -	dev->flags = (uintptr_t)device_get_match_data(device);
> > > >  	if (device_property_present(device, "wx,i2c-snps-model"))
> > > > -		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > >  
> > > >  	dev->dev = device;
> > > >  	dev->irq = irq;
> > > > +	dev->flags = flags;
> > > 
> > > Maybe I'm missing something, but why do we need these (above) changes?
> > 
> > in between, it is introduced a new one:
> > flags |= ACCESS_POLLING;
> > 
> > So, the initialization moved up, before the ACCESS_POLLING, and
> > it let the assignment to the last, along with the group.
> 
> I still don't get. The cited code is complete equivalent.

This was requested by Jarkko.

thanks,

-- 
heikki
