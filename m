Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CF5606A321
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 12:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gFWLd0Pb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D0F10E89E;
	Mon,  9 Nov 2026 12:03:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0889010F1C9
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 12:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794225808; x=1825761808;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=yUZrdF9B/dHcQm6OZxMZ3q1g+1TOO7LPcBV1sx9vd8E=;
 b=gFWLd0PbbW6DUNOkZdVLBje+rbLnoiYRX7tZwTErkRpQ6OWgq6YJp7GV
 XbqVUnoLcePvj0QkZjgZb6u88MoBCOjSDS5IChGzKfmZ2qyYshPycvNuE
 qIwJfYG3DpGuyzPoXDECOULNCQzQApOQv9+Rj6j6HKvZm4R4fjteenWs3
 V0YHDeLTmGaUYV2yoAsP4s0HkNstz3/6one1sEtpuL5vYtH5Bcs32bkSn
 eQm8iL/YhRx0O4iuzslJnZc15+vOgO2Eugii8NrRKP7iK2mO3wkjzQ3Yy
 cnCIT4bx3v0vTx5Kqi0XoUl2obSAI+pNtrnTkBvybL3qmK3IFBV/j5Bon Q==;
X-CSE-ConnectionGUID: aHLq8k47Svym0uZpNOMxEg==
X-CSE-MsgGUID: mhW9hueiS4ytxWjX3iB8+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="3047417"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="3047417"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:03:28 -0800
X-CSE-ConnectionGUID: 2/vCPKmVQ0Kzkw35UwDnEg==
X-CSE-MsgGUID: 63nY/9wvR9C/CjMIg0wMRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="9707681"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:03:26 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/xe: Only enable the GSE interrupt when display
 needs it
In-Reply-To: <20261109114554.19597-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261109114554.19597-1-ville.syrjala@linux.intel.com>
 <20261109114554.19597-4-ville.syrjala@linux.intel.com>
Date: Mon, 09 Nov 2026 14:03:24 +0200
Message-ID: <a51a9183d1a2435106d5b2d60c9907379b355176@intel.com>
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

On Mon, 09 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Display is the only user of the GSE interrupt. Only enable
> it when the display needs it.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/display/xe_display.h |  2 ++
>  drivers/gpu/drm/xe/xe_irq.c             |  7 ++-----
>  3 files changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe=
/display/xe_display.c
> index f5538e450e3e..21692408f9be 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -195,6 +195,23 @@ void xe_display_irq_handler(struct xe_device *xe, u3=
2 master_ctl)
>  		intel_display_irq_handler(display, NULL);
>  }
>=20=20
> +u32 xe_display_gse_irq_bit(struct xe_device *xe)
> +{
> +	struct intel_display *display =3D xe->display;
> +
> +	if (!xe->info.probe_display)
> +		return 0;
> +
> +	if (!intel_display_device_present(display))
> +		return 0;
> +
> +	/*
> +	 * ASLE backlight operations are reported via GUnit GSE interrupts
> +	 * on the root tile.
> +	 */
> +	return GU_MISC_GSE;
> +}
> +
>  void xe_display_gse_irq_handler(struct xe_device *xe, u32 gu_misc_iir)
>  {
>  	struct intel_display *display =3D xe->display;
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe=
/display/xe_display.h
> index 370be8ec1044..6c580d9593b0 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -33,6 +33,7 @@ void xe_display_shutdown(struct xe_device *xe);
>  void xe_display_shutdown_late(struct xe_device *xe);
>=20=20
>  void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl);
> +u32 xe_display_gse_irq_bit(struct xe_device *xe);
>  void xe_display_gse_irq_handler(struct xe_device *xe, u32 gu_misc_iir);
>  void xe_display_irq_reset(struct xe_device *xe);
>  void xe_display_irq_postinstall(struct xe_device *xe);
> @@ -71,6 +72,7 @@ static inline void xe_display_shutdown(struct xe_device=
 *xe) {}
>  static inline void xe_display_shutdown_late(struct xe_device *xe) {}
>=20=20
>  static inline void xe_display_irq_handler(struct xe_device *xe, u32 mast=
er_ctl) {}
> +static inline u32 xe_display_gse_irq_bit(struct xe_device *xe) { return =
0; }
>  static inline void xe_display_gse_irq_handler(struct xe_device *xe, u32 =
gu_misc_iir) {}
>  static inline void xe_display_irq_reset(struct xe_device *xe) {}
>  static inline void xe_display_irq_postinstall(struct xe_device *xe) {}
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 7c39d7a3cf8a..050c73283bbd 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -703,12 +703,9 @@ static void vf_irq_postinstall(struct xe_device *xe)
>=20=20
>  static void xe_gu_misc_irq_postinstall(struct xe_device *xe)
>  {
> -	/*
> -	 * ASLE backlight operations are reported via GUnit GSE interrupts
> -	 * on the root tile.
> -	 */
>  	unmask_and_enable(xe_device_get_root_tile(xe),
> -			  GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
> +			  GU_MISC_IRQ_OFFSET,
> +			  xe_display_gse_irq_bit(xe));
>  }
>=20=20
>  static void xe_irq_postinstall(struct xe_device *xe)

--=20
Jani Nikula, Intel
