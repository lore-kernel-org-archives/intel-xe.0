Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8C0606A330
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n/mcAwLJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B1D10E1E0;
	Fri, 27 Nov 2026 15:15:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7278112B34;
 Fri, 27 Nov 2026 15:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795792511; x=1827328511;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=FijKkDnDw+PddQbRP38OqnEcaf+vFkBviAQSdXcb/9k=;
 b=n/mcAwLJnogXh3f46HTHZ2yhDQ7v4180XQexDXzTXm/yPJ2gv7F9Nf5L
 wpLxh3TkIJztdQCyRaRf9mAShLqbXnP3V9rKAMVQOdRFfCdXdp7N5jOjL
 KcpBQn4LIY80ddQnjMNkfa0GQHx0v1ygHkJxDbR/YY1qfKxvoHTmKAqjs
 Jx4/PEvusckVZarMyn/Rz1W1Cqv+7YHCphbYss0GzN1FMh9l5JEiYtkl2
 3Sn2h0zQbsp2YIDr9XqZdoLkIS+307u8jAOsg+7g9IR+E5neVnI1z1iKf
 ukh3OLgRxXJmf3y9ShwHm6ty24YK1ocTpe32CdcURqXLG8f9Xqn1RJm1F g==;
X-CSE-ConnectionGUID: kb9jXdRCRy2fuTL6Yk+AVA==
X-CSE-MsgGUID: Hmexn8RYTryG2CnCooTdSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4634866"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4634866"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 07:15:10 -0800
X-CSE-ConnectionGUID: qP4XTt/YQyawYvejV3d5VQ==
X-CSE-MsgGUID: sJEk3YB3TXWDU1gsxM5qpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12708241"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 07:15:10 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 7/7] drm/i915/de: Document intel_de_write8()'s usage
 restrictions
In-Reply-To: <20261126212728.9034-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
 <20261126212728.9034-8-ville.syrjala@linux.intel.com>
Date: Fri, 27 Nov 2026 17:15:07 +0200
Message-ID: <aab1920692a355e21084feeaa4d6e85a33aad06f@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 26 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> intel_de_read8() has a comment explaining the WARN and why the
> function doesn't need to do anything exotic beyond the raw
> readb(). Add a similar comment to intel_de_write8().
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_de.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index 6d34a03d243a..fb86abe0301d 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -165,6 +165,7 @@ u8 intel_de_read8(struct intel_display *display, inte=
l_reg_t reg)
>=20=20
>  void intel_de_write8(struct intel_display *display, intel_reg_t reg, u8 =
val)
>  {
> +	/* this is only used on VGA registers (possible on pre-g4x) */
>  	drm_WARN_ON(display->drm, DISPLAY_VER(display) >=3D 5 || display->platf=
orm.g4x);
>=20=20
>  	trace_intel_reg_rw(true, reg, val, sizeof(val));

--=20
Jani Nikula, Intel
