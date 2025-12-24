Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3893FE7491E
	for <intel-xe@archiver.kernel.org>; Wed, 24 Dec 2025 08:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA9610E22F;
	Wed, 24 Dec 2025 08:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCh4iXAu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDD110E22F
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Dec 2025 08:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766565993; x=1798101993;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FUdX12ukvms92Kun3S3iDxJXJYcTpghJyq6BSIKm4/A=;
 b=iCh4iXAuw1+7m9ireDM43nKLbVt+IvZInzqz/DcrQgdhVB1hpsLrdsBb
 BPcuYuBGL9IDAwHcSDOYK2OjbiJEDoXqbHFUyL9F6fsG8Cz9Qv8m635Pu
 Y4fzR/wFl+tNZ+C5lUERwyeKbrtIgQWyt0/HxMX0YWQ+DfSSwnLtM5pfF
 svShKkGjXYma7/L4fB0WuprD943rAsD6cJfU+WAjhh/RWbm+3GWqa7n1A
 1deKuVwpRdKvzk/qeIIG6OHzPkFDtIaSH0Y68+HMV/WScgZoQQK7OyE0c
 SWLkog3RsJXQNyL87pFuLf14kOc6DXZXPPouXqhsOJBnirDAqWKD0Qhly A==;
X-CSE-ConnectionGUID: YtKC7gtuTK+FBEP13rnRGQ==
X-CSE-MsgGUID: bBvWt1hnSgWyE8Z7k92GUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68452307"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; d="scan'208";a="68452307"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 00:46:31 -0800
X-CSE-ConnectionGUID: PRdK4oIhRVGExPvP34qaXw==
X-CSE-MsgGUID: yOPTdS/xRAmtYKc+7FuqYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; d="scan'208";a="200877517"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 00:46:30 -0800
Date: Wed, 24 Dec 2025 09:46:26 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 andi.shyti@linux.intel.com, riana.tauro@intel.com
Subject: Re: [PATCH v1] drm/xe/i2c: Force polling mode in survivability
Message-ID: <aUuoYtWvglZ4a3n6@black.igk.intel.com>
References: <20251211182353.1149481-1-raag.jadav@intel.com>
 <aUFLysxZvs_C24T8@kuha>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUFLysxZvs_C24T8@kuha>
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

On Tue, Dec 16, 2025 at 02:08:42PM +0200, Heikki Krogerus wrote:
> Thu, Dec 11, 2025 at 11:53:53PM +0530, Raag Jadav kirjoitti:
> > SGUnit interrupts are not initialized in survivability. Force I2C
> > controller to polling mode while in survivability.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> Like Mika said, polling should always work. This should be fine
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks Heikki.

Anything else I can do here?

Raag

> > ---
> >  drivers/gpu/drm/xe/xe_i2c.c                | 8 +++++---
> >  drivers/gpu/drm/xe/xe_survivability_mode.c | 2 +-
> >  2 files changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > index 8eccbae05705..6f14ba1e5217 100644
> > --- a/drivers/gpu/drm/xe/xe_i2c.c
> > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > @@ -213,11 +213,13 @@ static const struct irq_domain_ops xe_i2c_irq_ops = {
> >  	.map = xe_i2c_irq_map,
> >  };
> >  
> > -static int xe_i2c_create_irq(struct xe_i2c *i2c)
> > +static int xe_i2c_create_irq(struct xe_device *xe)
> >  {
> > +	struct xe_survivability *survivability = &xe->survivability;
> > +	struct xe_i2c *i2c = xe->i2c;
> >  	struct irq_domain *domain;
> >  
> > -	if (!(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ))
> > +	if (survivability->mode || !(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ))
> >  		return 0;
> >  
> >  	domain = irq_domain_create_linear(dev_fwnode(i2c->drm_dev), 1, &xe_i2c_irq_ops, NULL);
> > @@ -351,7 +353,7 @@ int xe_i2c_probe(struct xe_device *xe)
> >  	if (ret)
> >  		return ret;
> >  
> > -	ret = xe_i2c_create_irq(i2c);
> > +	ret = xe_i2c_create_irq(xe);
> >  	if (ret)
> >  		goto err_unregister_notifier;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > index 7520d7b7f9b8..a34a638bfb76 100644
> > --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > @@ -324,7 +324,7 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
> >  	if (ret)
> >  		return ret;
> >  
> > -	/* Make sure xe_heci_gsc_init() knows about survivability mode */
> > +	/* Make sure xe_heci_gsc_init() and xe_i2c_probe() are aware of survivability */
> >  	survivability->mode = true;
> >  
> >  	xe_heci_gsc_init(xe);
> > -- 
> > 2.43.0
> 
> -- 
> heikki
