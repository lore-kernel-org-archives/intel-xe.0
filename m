Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E7AFD5F87
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 08:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C75410E593;
	Wed,  8 Apr 2026 08:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVFy429T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F44E10E593;
 Wed,  8 Apr 2026 08:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775637914; x=1807173914;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=4N0cIiV5dBiY33G9IrD4V06nYiW1FKYnGXY16WECwc8=;
 b=IVFy429TTrfNAU5xjYt0vD5o4qQJhdIGn6c2CvRxhfmyKZW2RblslZsZ
 CBLF3gCyYRyBizZ/zRFToo2ES+nQHhQ4d2R1euT3xV8yxlX2xm0rRcwKc
 /opxdPArkwTc8F+6CwunDivHHr/cGlJUfnfPuFk6xCJOVCUzLPC1Kc97Z
 1YFhMhbc3LK3R7lYvOkaLVYOtF/OHCBNwsE3xzS78MJFqGUhRdAi85mgu
 ybATH49Rjien8BSnN3J43tLtKjeKjqTwqOeJYZRPEfoIqx7X9Ykkjp+7i
 QeeC3tr0ruYIgCwd7m9aUgOk7WBC2/yS2BIDLnmLnkTRj2B4zpON9loQy Q==;
X-CSE-ConnectionGUID: GhnHzMiaTDebVQSQZjiR4A==
X-CSE-MsgGUID: BVfMlaSPRaSP8vslFzrT9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="94003700"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="94003700"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 01:45:13 -0700
X-CSE-ConnectionGUID: 32Y1b13mR0uzFmwHx4onYA==
X-CSE-MsgGUID: z0qxalAgSp+du/L7wnk7eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="251742095"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 01:45:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 05/12] drm/xe/fb: Remove weird VMA end alignemnt
In-Reply-To: <20260407155053.32156-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
 <20260407155053.32156-6-ville.syrjala@linux.intel.com>
Date: Wed, 08 Apr 2026 11:45:09 +0300
Message-ID: <20c7f2ca2733c75065296c7e797d5d9124d39ea4@intel.com>
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
> For some reason xe is also alining the end of the vma. That
> should not be necessary, so don't.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Cc: Maarten, does it look sane to you too?

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index 35e5c322f8b0..72efafb189f7 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -307,8 +307,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_fr=
amebuffer *fb,
>  		size =3D intel_rotation_info_size(&view->rotated) * XE_PAGE_SIZE;
>=20=20
>  	pte =3D xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.idx[XE_CACHE_NONE]);
> -	vma->node =3D xe_ggtt_insert_node_transform(ggtt, bo, pte,
> -						  ALIGN(size, align), align,
> +	vma->node =3D xe_ggtt_insert_node_transform(ggtt, bo, pte, size, align,
>  						  view->type =3D=3D I915_GTT_VIEW_NORMAL ?
>  						  NULL : write_ggtt_rotated_node,
>  						  &(struct fb_rotate_args){view, bo});

--=20
Jani Nikula, Intel
