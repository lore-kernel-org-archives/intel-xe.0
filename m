Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27EA606A321
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 12:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YyeifZVe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A720F10F229;
	Mon,  9 Nov 2026 12:28:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29FA10F229
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 12:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794227312; x=1825763312;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LmETJpGMgjLjr8Im26YCx3N//D7EYImpYh6xeVHum14=;
 b=YyeifZVebAMUMHU/wVl5tolLjO3uGHF+wvioPf3J6NzK5wdDndsWCCzy
 JvyQsoWGILIJCjO3wDdwe7tVFDGHgdggGDsfy0hjv2dLx6IaKiVjBxof9
 1otXXZSy7t3gds9hYSzbJa61yFiv0mA26Bz4o+NJ89wgFNAGiYWzet5ws
 guSrjbxGVhpLCO9IC7maoUVdCF7wPB7KhY8BFb+xR5kwLdjSdajRTPbnL
 38exdY9zJMv4YVxqEApu9ol3Xc/RNFfTIP1hxvnh4wZ5XtYOE23eNWvcN
 YAt2ehXvAdSLuLU+8lQaH7yHGCgqzPfzMxo1WK5Nk1S3RKAXXIrRJ0Qxe A==;
X-CSE-ConnectionGUID: RJ2CXH7oQemTQ1VReXo6Vw==
X-CSE-MsgGUID: uekT7UtDRzq61Z6nv6pkCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2824467"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2824467"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:28:31 -0800
X-CSE-ConnectionGUID: 4s5bagvTQa6BAYW/kfDA1Q==
X-CSE-MsgGUID: Q7yj2/jkSrmsNHjTxqZhJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8178997"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:28:30 -0800
Date: Mon, 9 Nov 2026 14:28:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm/xe: Use intel_display_gse_irq_handler()
Message-ID: <avG8a-CkptBuzQir@intel.com>
References: <20261109114554.19597-1-ville.syrjala@linux.intel.com>
 <20261109114554.19597-5-ville.syrjala@linux.intel.com>
 <sashiko-outbox-204904@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-204904@kernel.org>
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 11:51:05AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] drm/xe: call to undeclared and undefined
>   intel_display_gse_irq_handler()
> --
> 
> commit da9b4f3b875bfbf33a72170de1fb2c018547566b
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/xe: Use intel_display_gse_irq_handler()
> 
> This commit replaces the direct call to intel_opregion_asle_intr() in
> xe_display_gse_irq_handler() with intel_display_gse_irq_handler().
> 
> > diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> > index 21692408f9be0..0236f69a0f883 100644
> > --- a/drivers/gpu/drm/xe/display/xe_display.c
> > +++ b/drivers/gpu/drm/xe/display/xe_display.c
> > @@ -220,7 +220,7 @@ void xe_display_gse_irq_handler(struct xe_device *xe, u32 gu_misc_iir)
> >  		return;
> >  
> >  	if (gu_misc_iir & GU_MISC_GSE)
> > -		intel_opregion_asle_intr(display);
> > +		intel_display_gse_irq_handler(display);
> >  }
> 
> [Severity: High]
> Does this break the build when CONFIG_DRM_XE_DISPLAY is enabled?
> intel_display_gse_irq_handler() is neither declared nor defined anywhere
> in the tree, causing an implicit function declaration error during
> compilation and an undefined symbol at link time.

Your baseline is too old.

-- 
Ville Syrjälä
Intel
