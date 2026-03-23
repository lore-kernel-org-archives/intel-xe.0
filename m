Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACC8EC01A0
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 07:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B56910E3FC;
	Mon, 23 Mar 2026 07:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7XuwOjy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B17210E3FC
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 07:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774252598; x=1805788598;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZuigYFuMr9mXDDf4TQnLkwI3TsR2fzIvYXmN3XHkUtw=;
 b=l7XuwOjyljs+Cqu+ynqfHdT3X4lfg1ODQz0AQRq8Phm0sC9xEqYOOe+P
 EDEoi3DMhIEnIU9Lm4JUvPzjVmixq3BhsPdM++Fp6TyjlDB72FHsgne6S
 w59Rn/McD+ur1ln7FtvMpmf2hpjwpyhEKy14So+Cd/uDXBS06Fx52pKp6
 oL8WMjRJFD3NLbPj2HwXLiNDFp45qqmDzKvbCBo5EnqFn1y5Z5RJ0vUT+
 Y9bJKF/hD7IU+EptjMiMQaplG9yJkt7Srt6P2P227YLtohVpqn1tEgos1
 AInhlF72a21TzmJEG9x0up8H5akhxT0HQwjtGtbdXfppBHIz3iIXo6n5e w==;
X-CSE-ConnectionGUID: stFwXUj+TdC8G0LEk4GE5w==
X-CSE-MsgGUID: 4mCOvNTbR0mOQzcqDKs4eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75214530"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="75214530"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 00:56:37 -0700
X-CSE-ConnectionGUID: doANhY4SRd2Q5llQ7lR7Og==
X-CSE-MsgGUID: AfTk6NbNRFamJVuZmmh/AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="219605689"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 00:56:35 -0700
Date: Mon, 23 Mar 2026 08:56:32 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, andi.shyti@linux.intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v1] drm/xe/i2c: Assert/Deassert I2C IRQ
Message-ID: <acDyMPkqPA_8UvFh@black.igk.intel.com>
References: <20260313080438.4166251-1-raag.jadav@intel.com>
 <abqM1X6B4blCKukO@kuha>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abqM1X6B4blCKukO@kuha>
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

On Wed, Mar 18, 2026 at 01:30:29PM +0200, Heikki Krogerus wrote:
> Fri, Mar 13, 2026 at 01:34:38PM +0530, Raag Jadav wrote:
> > I2C IRQ is triggered using virtual wire. Assert/Deassert it in IRQ
> > handler to allow subsequent interrupt generation.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_i2c.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > index 1deb812fe01d..706783863d07 100644
> > --- a/drivers/gpu/drm/xe/xe_i2c.c
> > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > @@ -176,11 +176,18 @@ static bool xe_i2c_irq_present(struct xe_device *xe)
> >   */
> >  void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
> >  {
> > -	if (!xe_i2c_irq_present(xe))
> > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > +
> > +	if (!(master_ctl & I2C_IRQ) || !xe_i2c_irq_present(xe))
> >  		return;
> >  
> > -	if (master_ctl & I2C_IRQ)
> > -		generic_handle_irq_safe(xe->i2c->adapter_irq);
> > +	/* Forward interrupt to I2C adapter */
> > +	generic_handle_irq_safe(xe->i2c->adapter_irq);
> > +
> > +	/* Deassert after I2C adapter clears the interrupt */
> > +	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_INTX_DISABLE);
> > +	/* Reassert to allow subsequent interrupt generation */
> > +	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE, 0);
> 
> Do we need to do this always, or only with the SMBus Alerts?

For now this is to handle whatever INTR_MASK we're setting in designware
driver, so we atleast have baseline IRQ support until we have smbus ready
(which is essentially a separate discussion).

Raag
