Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4FC606A321
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 12:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QfVRf+ro
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414AF10F206;
	Mon,  9 Nov 2026 12:15:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF7B10F206
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 12:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794226538; x=1825762538;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Zu7u+ItJ+8UI7nP7Az1JQk58nEIgoV45BT73Qxxafyg=;
 b=QfVRf+ropfmVLYb0CuI6GejlvSC4ptX67E5BM5gVZdj0mHXQ67841bQW
 C1x4pEpupEMRXBIk7NZS7wrqPGJ9vAAVO1Tjn5eaq873KaoL8QBK2YujT
 WMXy/7j+qKslzfCnxb6f5WLDXA00PfEog5Ni2BGzlxbjJ2AW28SzvDnqM
 rhn4ydCkquXk1hHQFoa9OY0+oFelfJu89X8b2eNz0d1hi1CzkZubAm05I
 Al38bMzMdy6oDXTZP+qUX9dyJO0uNDWgVc5LcQ+Nk8Vn/V8dwDolwuV6q
 54Vje5ghRV2Q5KA+DC9vwEM+nbNJAFlEUoYDscQmOMHTjdZvphq+zwu6Q A==;
X-CSE-ConnectionGUID: HsAJq/T9QPaM3mJzvqXoqg==
X-CSE-MsgGUID: jHYfe8R4RG6Ft6rkEZ550A==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2845850"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2845850"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:15:38 -0800
X-CSE-ConnectionGUID: 5cxFb/6eQ/WjRrEWEWhZvA==
X-CSE-MsgGUID: LWp28G6TQi+XePmHA2m3bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8183172"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:15:37 -0800
Date: Mon, 9 Nov 2026 14:15:34 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm/xe: Use intel_display_gse_irq_handler()
Message-ID: <avG5Zm_5f_q8Kdgk@intel.com>
References: <20261109114554.19597-1-ville.syrjala@linux.intel.com>
 <20261109114554.19597-5-ville.syrjala@linux.intel.com>
 <07539696cef399115faedc5d3f84439e7d22207a@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07539696cef399115faedc5d3f84439e7d22207a@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 02:05:08PM +0200, Jani Nikula wrote:
> On Mon, 09 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Replace the direct intel_opregion_asle_intr() call with the
> > new intel_display_gse_irq_handler() abstraction. We don't
> > want to leak random opregion symbols out from the display
> > code.
> 
> This depends on [1] which I don't think is merged yet?

It's in drm-intel-next. Need to remember to postpone this
one when pushing the rest to drm-xe-next.

> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> 
> [1] https://lore.kernel.org/r/20261105203427.8696-3-ville.syrjala@linux.intel.com
> 
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/display/xe_display.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> > index 21692408f9be..0236f69a0f88 100644
> > --- a/drivers/gpu/drm/xe/display/xe_display.c
> > +++ b/drivers/gpu/drm/xe/display/xe_display.c
> > @@ -220,7 +220,7 @@ void xe_display_gse_irq_handler(struct xe_device *xe, u32 gu_misc_iir)
> >  		return;
> >  
> >  	if (gu_misc_iir & GU_MISC_GSE)
> > -		intel_opregion_asle_intr(display);
> > +		intel_display_gse_irq_handler(display);
> >  }
> >  
> >  void xe_display_irq_reset(struct xe_device *xe)
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
