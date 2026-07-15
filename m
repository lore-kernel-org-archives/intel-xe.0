Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E4FC44507
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 09:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7439B10E166;
	Wed, 15 Jul 2026 09:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mODl7tcW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A14B10E166
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 09:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784108722; x=1815644722;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e9EVrjo4je06jJvzKOXmUSY/lYq5x3Z/o92jN55pK0M=;
 b=mODl7tcW/eFTW7WyWNqN3f2WZJ2Y1fWEt/jCHWWCERQoElm3lk/Dpqdh
 VoERQEH1RwVD7wihVgGyOi9oY8iNMse493vWwk+f/C4D1ALw8ln1FkPeU
 hwzzSsT/Oc0RzXKNzPnts4Ew7hMSkFEDh4ssLFyd8bwbBP1sQ596iCxSW
 Wvm3zqRLg4Ltl14YI0j48NeBnHxm+cjC1afl+Z1rJ+g78PRijPMFrP98m
 ppcq/apqKlmZ8lvz3BnUbksaIvbUDHOKv75rnLZOvb8wzfcqmnlRfecWM
 5rsgt8CUQnU6y3k0ljsVyLI/kjfj6zcSMGGjTGZkmSmqZ4VQ3Cs5YaHY+ g==;
X-CSE-ConnectionGUID: T72SaezMSvaAebvQ8aO9mg==
X-CSE-MsgGUID: HXOnbzcvRAOCtuGPHEyEtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96257148"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="96257148"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 02:45:21 -0700
X-CSE-ConnectionGUID: bS6xCzrUSFq3jpUdTo3EPQ==
X-CSE-MsgGUID: 76+3OtpmRq6zXHTmIOx6xQ==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa003.fm.intel.com with ESMTP; 15 Jul 2026 02:45:18 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
 id 747CB95; Wed, 15 Jul 2026 11:45:17 +0200 (CEST)
Date: Wed, 15 Jul 2026 12:45:15 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Ramesh Babu B <ramesh.babu.b@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v4 3/3] drm/xe/i2c: Keep the i2c controller always enabled
Message-ID: <aldWqyg_bnt5KsGT@kuha>
References: <20260713155601.711389-1-heikki.krogerus@linux.intel.com>
 <20260713155601.711389-4-heikki.krogerus@linux.intel.com>
 <alcpuxJktaVwrIaa@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alcpuxJktaVwrIaa@black.igk.intel.com>
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

On Wed, Jul 15, 2026 at 08:33:31AM +0200, Raag Jadav wrote:
> > +/* See "Disabling DW_apb_i2c" in the DesignWare DW_abp_i2c databook. */
> > +static void xe_i2c_disable(struct xe_i2c *i2c)
> > +{
> > +	int timeout = 100;
> > +	u32 status;
> > +
> > +	xe_mmio_rmw32(i2c->mmio, I2C_REG(DW_IC_ENABLE), 1, 0);
> 
> Can we use DW_IC_ENABLE_* defines?
> 
> > +	do {
> > +		status = xe_mmio_read32(i2c->mmio, I2C_REG(DW_IC_ENABLE_STATUS));
> > +		if (!(status & 1))
> 
> Ditto for DW_IC_STATUS_*.
> 
> > +			return;
> > +		/* Can't sleep here. */
> > +		udelay(25);
> > +	} while (timeout--);
> > +
> > +	dev_warn(&i2c->adapter->dev, "timeout in disabling adapter\n");
> > +}
> 
> ...
> 
> > @@ -230,7 +260,28 @@ static int xe_i2c_write(void *context, unsigned int reg, unsigned int val)
> >  {
> >  	struct xe_i2c *i2c = context;
> >  
> > -	xe_mmio_write32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET), val);
> > +	switch (reg) {
> > +	case DW_IC_CON:
> > +	case DW_IC_TAR:
> > +	case DW_IC_SAR:
> > +		/* Disable the controller. */
> > +		xe_i2c_disable(i2c);
> > +
> > +		/* Write the register. */
> > +		xe_mmio_write32(i2c->mmio, I2C_REG(reg), val);
> > +
> > +		/* Enable the controller. */
> > +		xe_mmio_rmw32(i2c->mmio, I2C_REG(DW_IC_ENABLE), 0, 1);
> 
> Ditto.

Yes to all three. I'll fix these.

Thanks,

-- 
heikki
