Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7425C83038
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 13:50:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875CD10E5B4;
	Tue,  1 Jul 2025 13:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R1DiBEn6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11F910E5B4
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 13:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751377821; x=1782913821;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RFvF9KCP9IGby3aofIlAsOtLhVx+o/OGg9eljFscdY8=;
 b=R1DiBEn6WmgR2W8dQw8Aaho2wHlXWuvqjcvniez4JpZixLKrTkQbNfI4
 PaajzCWtuoXwWGA5/kI6uqRWCUUuD/95vIe3AUF+/penPp8QbLgaB5SmX
 ZCsx/XdKNoJODHpz6s7cPcYVrgeBHbNcS5naVv8Q7hU1kMWg6pVg7nLxz
 w7auC4VYqezVjNwyzZV72sYQ3OF8LNwDvCTodIaUxtJWsGjkS73JLxqks
 3Un3hJEJmGl2XeBGp1NYNNv2Fz+iCgXtYmWWVFCJhZ4Z8d9fpNa7mtUm6
 wcpceUHahJYQ7WIQS1g5pEBkrpYMmSmKxmVWqfrdBJW0+Tcuat0mmU/3p Q==;
X-CSE-ConnectionGUID: 7z9VJHn1R/aCTP9PPB4ZMg==
X-CSE-MsgGUID: 46LwyiX+QLKQO9Y8QojjmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53580111"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53580111"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 06:50:21 -0700
X-CSE-ConnectionGUID: WK+qwPOzTcaVSaXuAyLtSQ==
X-CSE-MsgGUID: h5jLGJhYQ3SqfnGfjSzXIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153187653"
Received: from smile.fi.intel.com ([10.237.72.52])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 06:50:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1uWbNG-0000000Bby5-05AH; Tue, 01 Jul 2025 16:50:14 +0300
Date: Tue, 1 Jul 2025 16:50:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] i2c: designware: Use polling by default when
 there is no irq resource
Message-ID: <aGPnlWbWn8NyTNFM@smile.fi.intel.com>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
 <20250701122252.2590230-2-heikki.krogerus@linux.intel.com>
 <aGPXwll6Hh2cZfnp@smile.fi.intel.com>
 <aGParHQ3GSdAA8rL@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGParHQ3GSdAA8rL@kuha.fi.intel.com>
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

On Tue, Jul 01, 2025 at 03:55:08PM +0300, Heikki Krogerus wrote:
> On Tue, Jul 01, 2025 at 03:42:42PM +0300, Andy Shevchenko wrote:
> > On Tue, Jul 01, 2025 at 03:22:48PM +0300, Heikki Krogerus wrote:

...

> > > +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> > 
> > > +	irq = platform_get_irq_optional(pdev, 0);
> > > +	if (irq == -ENXIO)
> > > +		flags |= ACCESS_POLLING;
> > > +	else if (irq < 0)
> > >  		return irq;
> > 
> > >  	if (device_property_present(device, "wx,i2c-snps-model"))
> > > +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > 
> > Now I'm a bit puzzled why do we need to add this flag explicitly here?
> > Does Wnagxun provides an IRQ and chooses at the same time to poll?
> > Shouldn't this patch rather fix that?
> 
> No. I do not want to touch the behavior here. The flags were
> overwritten and continue to be overwritten.
> 
> I will propose an improvement for that together with some other
> modifications to this file later, but those are out side the scope of
> this series.

Sure.

-- 
With Best Regards,
Andy Shevchenko


