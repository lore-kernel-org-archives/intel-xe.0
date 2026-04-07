Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F2AEDB7ED
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 10:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B13810E3C8;
	Tue,  7 Apr 2026 10:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TF4Ei2qB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C64210E3C3;
 Tue,  7 Apr 2026 10:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775557686; x=1807093686;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DGIlOO8ZKgXqETeltwi1RRtRLizUC7vcKL8YcbEZKtg=;
 b=TF4Ei2qB9atWDCSjZo0YXDNytXu5ndfuo9bKCFWl5lkdJmBWV+wpPVWM
 9Q2DT/gVrvvrr005zyZ+fBuUgCcahSFOrjnPu7MeTQ57ID7EkpqJ+50Dv
 8JjLSAe40enBljSXHg99lXaH99jBQl9WXxx+9b/06k63a/KUtnCloFGOO
 Qaoq9MkDusxF3A36KweluCagbQvR8nc/Ac9pSiHCgSA5RQ7MiIthg4758
 LLH/wb4jzuCvWXbkHTF/Tc/4Zi8qljuqtLyoiT3SCY+5kTwmIo2Jc0RLU
 dJm2zm2/q7e3C8LKUOSqFAj5bJewXm4m6L/oNaN4VVVAnRbcbkaHKf9Yj Q==;
X-CSE-ConnectionGUID: p7EwsvyCR/KIlR4QPxs70A==
X-CSE-MsgGUID: ntU0aMAQSZ+P4g2AHkhBuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87143532"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="87143532"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:28:06 -0700
X-CSE-ConnectionGUID: aXMhGs1OTmegzI3QGufQ8w==
X-CSE-MsgGUID: TOEyxwAVSgOQPiQnKoTp4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="233006327"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.84])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:28:04 -0700
Date: Tue, 7 Apr 2026 13:28:01 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 0/3] drm/i915/pin: refactor to i915 core
Message-ID: <adTcMdEqCRyjTPzK@intel.com>
References: <cover.1775556190.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1775556190.git.jani.nikula@intel.com>
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

On Tue, Apr 07, 2026 at 01:04:34PM +0300, Jani Nikula wrote:
> Something I started last week before Ville said he'd look into the whole
> pin stuff. If this is helpful, let's merge, but if it's in the way, it
> was pretty quick and can be thrown away.

Looks all right to me. I have the same file rename somewhere in my
current branch, and I think eg. the runtime pm thing I still have
mixed in with some other changes. So I can rebase easily on top of
these and shrink my branch a little bit.

Series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>


And speaking of my branch, I think it should be fairly close to
being done. I still need to think what to do about
restore.pending_fb_pin, and some commits may still need further
splitting. And proper commit messages need to be written of
course.

That said, the whole thing is rather big and I've not smoke tested
it even once, so I might still need to fix a boatload of bugs...

> 
> BR,
> Jani.
> 
> Jani Nikula (3):
>   drm/i915: move intel_fb_pin.c to i915_fb_pin.c
>   drm/i915/pin: s/dev_priv/i915/ and drop struct drm_device usage
>   drm/i915/pin: switch to i915 core runtime pm
> 
>  drivers/gpu/drm/i915/Makefile                 |  2 +-
>  .../{display/intel_fb_pin.c => i915_fb_pin.c} | 44 +++++++++----------
>  2 files changed, 22 insertions(+), 24 deletions(-)
>  rename drivers/gpu/drm/i915/{display/intel_fb_pin.c => i915_fb_pin.c} (90%)
> 
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
