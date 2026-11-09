Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D9B606A323
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NoHxVciW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E88510F1B7;
	Mon,  9 Nov 2026 11:59:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC1710F1B7
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 11:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794225552; x=1825761552;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=F8hxeSJO384T7H99NhmtKMEWPHZ9yMgXss99tHmrNLo=;
 b=NoHxVciWXK51MCmi9epyxjOWnbgZm+No60S6/opxtKVz0eAK+tNxPHQ4
 1yOD/Kw1unmpWSO3/yU6iMCl/8yAHkDHKD2bp7K/vfMab7vbJYV20ML/W
 mLgMeV8TVYBc0l0RBMB/SHXUJ+PXy9nkUDC7gL+pw0BO7LSOk3sUrfngZ
 CHbVDluKMeAaDCrIy1k8jyaO1hM9VmvP08q8nxkhzvjycturtcWZNunt+
 LtwtSDsBbmYZjt2auMvABFbtKXxDJ9gC4hRN1WSYB2eTDGXQdoxYC3VbO
 kTsFjhjSpKcUknoeLPCOq/iLa7h/FMBULDaX6/4mZ21p5A5KweBZMzLH2 Q==;
X-CSE-ConnectionGUID: 5KHP5wzQQj+uPGLOF9wQnA==
X-CSE-MsgGUID: en/A2JGXQvOGHxEcWuNETQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="3046976"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="3046976"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:59:12 -0800
X-CSE-ConnectionGUID: QBZcpviYTZCTK0UoXzQeiw==
X-CSE-MsgGUID: N81CpDdDTqGBHf2ygWRcpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="9706731"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:59:11 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/xe:
 s/xe_display_irq_enable()/xe_display_gse_irq_handler()/
In-Reply-To: <20261109114554.19597-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261109114554.19597-1-ville.syrjala@linux.intel.com>
 <20261109114554.19597-2-ville.syrjala@linux.intel.com>
Date: Mon, 09 Nov 2026 13:59:08 +0200
Message-ID: <9a85df445910c4485b29db9b3f3e01eee819be8b@intel.com>
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
> xe_display_irq_enable() is actually the GSE interrupt *handler*,
> not some irq enable function. Rename it accordingly.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 2 +-
>  drivers/gpu/drm/xe/display/xe_display.h | 4 ++--
>  drivers/gpu/drm/xe/xe_irq.c             | 5 +++--
>  3 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe=
/display/xe_display.c
> index aab416485e3e..f5538e450e3e 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -195,7 +195,7 @@ void xe_display_irq_handler(struct xe_device *xe, u32=
 master_ctl)
>  		intel_display_irq_handler(display, NULL);
>  }
>=20=20
> -void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
> +void xe_display_gse_irq_handler(struct xe_device *xe, u32 gu_misc_iir)
>  {
>  	struct intel_display *display =3D xe->display;
>=20=20
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe=
/display/xe_display.h
> index 0babb50bfc77..370be8ec1044 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -33,7 +33,7 @@ void xe_display_shutdown(struct xe_device *xe);
>  void xe_display_shutdown_late(struct xe_device *xe);
>=20=20
>  void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl);
> -void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
> +void xe_display_gse_irq_handler(struct xe_device *xe, u32 gu_misc_iir);
>  void xe_display_irq_reset(struct xe_device *xe);
>  void xe_display_irq_postinstall(struct xe_device *xe);
>=20=20
> @@ -71,7 +71,7 @@ static inline void xe_display_shutdown(struct xe_device=
 *xe) {}
>  static inline void xe_display_shutdown_late(struct xe_device *xe) {}
>=20=20
>  static inline void xe_display_irq_handler(struct xe_device *xe, u32 mast=
er_ctl) {}
> -static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_mi=
sc_iir) {}
> +static inline void xe_display_gse_irq_handler(struct xe_device *xe, u32 =
gu_misc_iir) {}
>  static inline void xe_display_irq_reset(struct xe_device *xe) {}
>  static inline void xe_display_irq_postinstall(struct xe_device *xe) {}
>=20=20
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index b394c8edf89c..320fc64e7d4f 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -435,7 +435,7 @@ static irqreturn_t xelp_irq_handler(int irq, void *ar=
g)
>=20=20
>  	xelp_intr_enable(xe, false);
>=20=20
> -	xe_display_irq_enable(xe, gu_misc_iir);
> +	xe_display_gse_irq_handler(xe, gu_misc_iir);
>=20=20
>  	return IRQ_HANDLED;
>  }
> @@ -533,7 +533,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  	}
>=20=20
>  	dg1_intr_enable(xe, false);
> -	xe_display_irq_enable(xe, gu_misc_iir);
> +
> +	xe_display_gse_irq_handler(xe, gu_misc_iir);
>=20=20
>  	return IRQ_HANDLED;
>  }

--=20
Jani Nikula, Intel
