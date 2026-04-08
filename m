Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452A1FD5F6A
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 08:44:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0284510E58D;
	Wed,  8 Apr 2026 08:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FfJe8Ia5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A53310E58D;
 Wed,  8 Apr 2026 08:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775637889; x=1807173889;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=P8jljPwaG8GavK6SRVy7sn0+FrZnxOL+qVaKI+4tO8E=;
 b=FfJe8Ia5FvwDWn3svQpUunX+A+1GWQ2kUyjINwB/7rkiIbe88p7rIB5l
 QEQmrbcGw9fLkNyj7HlvZag7ZH0Kg7ua2I82uaaW7x/RSkhJvq0b3ODyO
 2TJrN1xhyOhD+C6z2NoeoVL43cexvb5aWdXA8/iY8bMD4uBYdcG3uOcqO
 6EvoTlvndqaSIuLWp39tyyh6+5Yb7jUWRpdMMDgHBI+qvjr0fEZq+z9b9
 4+JfvBEE0cy4DF26bBqz/q9iqWnn9I43fSQtX4mA3tLlh7JRr3Gvdn797
 vRheVSstWRsoqd17urYfIz82ZB0zTot7Po64yt0iK45jIGqMmZZEvYWKy w==;
X-CSE-ConnectionGUID: OGoOvcarQvK1ScsvdCxmOA==
X-CSE-MsgGUID: r80G3/KLS+W9hXB2oXf2RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76578586"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="76578586"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 01:44:49 -0700
X-CSE-ConnectionGUID: noe21AIDRlG0c5mgP6ZeRA==
X-CSE-MsgGUID: R/3XPw0nSf2NSema6BmEsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="224117743"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 01:44:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 04/12] drm/xe/fb: Use the correct gtt view for remapped FBs
In-Reply-To: <20260407155053.32156-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
 <20260407155053.32156-5-ville.syrjala@linux.intel.com>
Date: Wed, 08 Apr 2026 11:44:44 +0300
Message-ID: <663f5d62e8ea6c38ee16ac952bcede56b1825cb2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 07 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Use the proper gtt view from the plane state rather than always
> assuming that it came directly from the FB. This is in the DPT
> codepath so the view should currently always come from the FB,
> but in the future we may also want per-plane remapping with DPT.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Cc: Maarten, does it look sane to you too?

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index e45a1e7a4670..35e5c322f8b0 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -154,7 +154,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_fra=
mebuffer *fb,
>  	if (view->type =3D=3D I915_GTT_VIEW_NORMAL)
>  		dpt_size =3D ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
>  	else if (view->type =3D=3D I915_GTT_VIEW_REMAPPED)
> -		dpt_size =3D ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.rem=
apped) * 8,
> +		dpt_size =3D ALIGN(intel_remapped_info_size(&view->remapped) * 8,
>  				 XE_PAGE_SIZE);
>  	else
>  		/* display uses 4K tiles instead of bytes here, convert to entries.. */

--=20
Jani Nikula, Intel
