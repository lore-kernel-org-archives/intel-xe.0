Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A8C10ED655
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 10:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7193610ED50;
	Fri, 27 Mar 2026 10:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cI/AiZ3X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D302A10ED50;
 Fri, 27 Mar 2026 10:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774607503; x=1806143503;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4K0VZQfwacE33T/SGTOPxNt6h5ia+JQRbr4c78AAxdE=;
 b=cI/AiZ3Xk2XoQodCrIdvuamidebcoL6C7EO6lIl/dhDUam5ZLFOHuZu5
 mw/3GQ7MNm2TjKGXOygZZWzg686Fxofmq9Lb/TEmO6WBsXeOEX3rHeH2i
 NnX0+CKG8gF8a2Pg58f8opdnkRVUQP9NDHMq2AyTlIsKH6s/oRtgZK93G
 M6zqtsdQA05GdfhInSxD/9OJV8pXK+V+1xmxj13ZKkOjIdmrI15j3dlGL
 /GMAUSRK9bYNiEzgKe3xQCgq26BeTXaohzCSzMOCBwzDHNJeQ0pV3dF0H
 iX9sFZOdpBG+UAasDjRQ85ctLPMGDv+wR4A9b1FMNZ+6ITF9SSAkWmyBm g==;
X-CSE-ConnectionGUID: E1CGaswxTM2ofe5Ok/+bmw==
X-CSE-MsgGUID: J0FCLnwkRPunAO6R1vv2Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="87152540"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="87152540"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 03:31:43 -0700
X-CSE-ConnectionGUID: QNBNLs1/TluoQ+aCivckkw==
X-CSE-MsgGUID: +tCfwfVxSnCKWNPoLuTN/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="221950694"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.188])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 03:31:40 -0700
Date: Fri, 27 Mar 2026 12:31:38 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH 8/9] drm/i915/pfit: Call intel_pfit_compute_config()
 unconditionally on (e)DP/HDMI
Message-ID: <acZcioUAZLzavOwj@intel.com>
References: <20260326223139.19116-1-ville.syrjala@linux.intel.com>
 <20260326223139.19116-9-ville.syrjala@linux.intel.com>
 <c84bfc6d-628d-570c-501e-8237e9f80e3c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c84bfc6d-628d-570c-501e-8237e9f80e3c@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Fri, Mar 27, 2026 at 10:48:32AM +0100, Michał Grzelak wrote:
> On Thu, 26 Mar 2026, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > We now have three different reasons for calling
> > intel_pfit_compute_config():
> > - actual pfit scaling/centering
> > - YCbCr 4:2:0 output
> > - sharpness filter
> >
> > So let's just all the intel_pfit_compute_config()

"... unconditionally ..."

> from
> 
> typo: s/all/call/
> 
> > both the DP and HDMI code. Both gmch and ilk+ pfit code
> > should be capable of judging whether anything actually
> > needs the pfit.
> >
> > The only slightly questionable thing in the gmch code is
> > the dithering knob, but that's only a thing on gen2/3 which
> > don't even have HDMI/DP outputs, and so not an issue here.
> >
> > Cc: Nemesa Garg <nemesa.garg@intel.com>
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
> 
> BR,
> Michał


-- 
Ville Syrjälä
Intel
