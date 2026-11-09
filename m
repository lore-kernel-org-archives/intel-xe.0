Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A68606A326
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 12:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fQJtJr+P
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B72A10F1B7;
	Mon,  9 Nov 2026 12:00:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DB210F1B7
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 12:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794225623; x=1825761623;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=SFBRcL1DYLj1ZvWrqKT99OpolrOD2CDVWJNM3lnQTaw=;
 b=fQJtJr+P2O0TWYeXEwFJROSmXtTMl2H0Z9sr00HAJirX+yuod59W0b/Y
 KkwBxWs4K+c5F1nczEDxDuxCfuAHpHLLMmn2xZAjP4GxoGe+PaqsZtKxS
 wTc/+/laxqOd5tjc/zE0tj+aHXC0Uc9myIB9SAQ1iUqaAE+jjheA9oUdU
 gyq7sm7HXCr2et0O/2Usr7fpBa/SjAlgcXN5b2Z/uhuFq3fAOBWBNcvRo
 kXMBEbf7N1hMDOO/l11VJhua0YWQGLkbwso5tcyeobff5jWyJL9d1DHfb
 OtFfRrBYR5wC1QKzWV6EWRw4P+1FIRyQzseByeoozIA3tdOJ0SNuDDwnq g==;
X-CSE-ConnectionGUID: UCQQn1K3TJ+65cnLtFj3Cg==
X-CSE-MsgGUID: s2Xfmal6SlyWZdcNXUK6Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2934646"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2934646"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:00:22 -0800
X-CSE-ConnectionGUID: 5DmQfEOxQya8sHzlk+nl3g==
X-CSE-MsgGUID: RgyZe2R7T1WejNCtK3m3mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7883799"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:00:20 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/4] drm/xe: Extract xe_gu_misc_irq_{postinstall,reset}()
In-Reply-To: <20261109114554.19597-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261109114554.19597-1-ville.syrjala@linux.intel.com>
 <20261109114554.19597-3-ville.syrjala@linux.intel.com>
Date: Mon, 09 Nov 2026 14:00:16 +0200
Message-ID: <724fccfff0c8aa0f4b2146a9a3ef25656f10ca4c@intel.com>
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
> Make the GU_MISC interrupt setup a bit nicer by extracting
> it to its own functions.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_irq.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 320fc64e7d4f..7c39d7a3cf8a 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -645,6 +645,12 @@ static void vf_irq_reset(struct xe_device *xe)
>  	}
>  }
>=20=20
> +static void xe_gu_misc_irq_reset(struct xe_device *xe)
> +{
> +	mask_and_disable(xe_device_get_root_tile(xe),
> +			 GU_MISC_IRQ_OFFSET);
> +}
> +
>  static void xe_irq_reset(struct xe_device *xe)
>  {
>  	struct xe_tile *tile;
> @@ -665,8 +671,7 @@ static void xe_irq_reset(struct xe_device *xe)
>  			xelp_irq_reset(tile);
>  	}
>=20=20
> -	tile =3D xe_device_get_root_tile(xe);
> -	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
> +	xe_gu_misc_irq_reset(xe);
>  	xe_display_irq_reset(xe);
>  	xe_i2c_irq_reset(xe);
>=20=20
> @@ -696,6 +701,16 @@ static void vf_irq_postinstall(struct xe_device *xe)
>  		xe_assert(xe, xe_device_has_memirq(xe));
>  }
>=20=20
> +static void xe_gu_misc_irq_postinstall(struct xe_device *xe)
> +{
> +	/*
> +	 * ASLE backlight operations are reported via GUnit GSE interrupts
> +	 * on the root tile.
> +	 */
> +	unmask_and_enable(xe_device_get_root_tile(xe),
> +			  GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
> +}
> +
>  static void xe_irq_postinstall(struct xe_device *xe)
>  {
>  	if (IS_SRIOV_VF(xe))
> @@ -711,13 +726,7 @@ static void xe_irq_postinstall(struct xe_device *xe)
>=20=20
>  	xe_display_irq_postinstall(xe);
>  	xe_i2c_irq_postinstall(xe);
> -
> -	/*
> -	 * ASLE backlight operations are reported via GUnit GSE interrupts
> -	 * on the root tile.
> -	 */
> -	unmask_and_enable(xe_device_get_root_tile(xe),
> -			  GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
> +	xe_gu_misc_irq_postinstall(xe);
>=20=20
>  	/* Enable top-level interrupts */
>  	if (GRAPHICS_VERx100(xe) >=3D 1210)

--=20
Jani Nikula, Intel
