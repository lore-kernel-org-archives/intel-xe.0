Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CE0C88E50
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 12:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB11210F580;
	Fri, 11 Sep 2026 12:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIP1EUP5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C31A10F580
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 12:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789128758; x=1820664758;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iOcGIQui1Ohh5WxOQ5Jqhc/JiKZJwJKwTNQXhT7mtO0=;
 b=QIP1EUP5MPp0BaSRxe7oYVzTlHVmb+O2RGmE7gFL0CjCsQlidVPh/NWB
 LSODglKWhKXGaTjOmEGa9o89nN9BjpSpOhqU/VPSHGoVklymiRB9yXXme
 BWz+a+ARtuA3A6SLskxVuC3flkd8tNxxTm5mpgMZmincCzDksXXq3yrvV
 c0Ahs7PvhnLSgpKRcLdfL7nLRhSwfa9lMv09KsEuICRmFNpEeu6MQyTgc
 USjoCL7zq5nPEs8weBf6JyCCzBezJxXhDVdMCso5qjj+VGNkj0TeHJGaC
 Ch2qc7pDaM7mv5OKLNKjbM92NtWRMaykvHOQnVLqFc4N6AC7hJt61rAeP Q==;
X-CSE-ConnectionGUID: KimJ1o37RD2fcthQTa3hpA==
X-CSE-MsgGUID: lFSxH6GdRYGlbgcA0kjdLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="115130026"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="115130026"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 05:12:38 -0700
X-CSE-ConnectionGUID: u4BUUJWDRDiBiI5Rwv139Q==
X-CSE-MsgGUID: CrvET1RsRQey83bAiwNiVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="295390657"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 05:12:37 -0700
Date: Fri, 11 Sep 2026 14:12:34 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, badal.nilawar@intel.com
Subject: Re: [PATCH v1] drm/xe/i2c: Disable IRQ on unbind
Message-ID: <aqPwMmbvsY0_-37n@black.igk.intel.com>
References: <20260911044021.2393342-1-raag.jadav@intel.com>
 <aqPjOgEgFG04B_ef@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqPjOgEgFG04B_ef@black.igk.intel.com>
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

On Fri, Sep 11, 2026 at 01:17:14PM +0200, Heikki Krogerus wrote:
> On Fri, Sep 11, 2026 at 10:10:21AM +0530, Raag Jadav wrote:
> > Currently, struct xe_i2c is freed before SGUnit IRQ is disabled, leaving
> > a potential UAF in case the IRQ is hit in that small window. Explicitly
> > disable I2C IRQ as part of xe_i2c_remove() and fix this.
> > 
> > Fixes: 0bb78ce09926 ("drm/xe/i2c: Wire up reset/postinstall for I2C IRQ")
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> FWIW:
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks Heikki. I think I missed cleaning up the i2c dangling pointer here,
let me send out a v2.

Raag

> > ---
> >  drivers/gpu/drm/xe/xe_i2c.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > index d8fa68206f41..82b22c5412ba 100644
> > --- a/drivers/gpu/drm/xe/xe_i2c.c
> > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > @@ -324,8 +324,10 @@ void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
> >  static void xe_i2c_remove(void *data)
> >  {
> >  	struct xe_i2c *i2c = data;
> > +	struct xe_device *xe = tile_to_xe(i2c->mmio->tile);
> >  	unsigned int i;
> >  
> > +	xe_i2c_irq_reset(xe);
> >  	xe_amc_exit(i2c);
> >  
> >  	for (i = 0; i < XE_I2C_MAX_CLIENTS; i++) {
> > -- 
> > 2.43.0
> 
> -- 
> heikki
