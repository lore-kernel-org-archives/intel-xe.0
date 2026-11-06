Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483E1606A32C
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 09:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DqT3NFoX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3590112C90;
	Fri,  6 Nov 2026 09:22:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2D7112C90;
 Fri,  6 Nov 2026 09:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793956946; x=1825492946;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=sl/vV/pXSzb15hfmzE1r6h+e+ndjcBgZjAmYHWM0Iao=;
 b=DqT3NFoXQrQGJ43WBaN6t05tRaMbVrYwvYvWgwsiJkpl4GLsZ1zKXt65
 CFts70SCFdw9EhSE8cGiEY23QoMuOhhva8ewkwv8rUFVTtuu9fmQPQbz4
 gKnA+3l+hjfZpIoetbrbUkOzx1I45rIK+NeucfKeJ0knSAfs32p5FaBeQ
 eLZeKX01n4i9cDx9XAbsBLMmO7WUcgiXrx5Pe8J/0WXWGOOKrQMnWLsD1
 OJ9HVnx3E3yfQYCcg5ndHN73vHLR5ERL00mFUcAJvDi2+PkjkGTEuFyqT
 xNeRb6NMjy7kEgDQL4FelE368hH7t6dZXspFUv7izHAM1CE+hmOlCOv93 g==;
X-CSE-ConnectionGUID: 3k2QARNFRbai2gFv3VLx4Q==
X-CSE-MsgGUID: ZYOjHVYtRt6NV+LERoiEUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2664674"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2664674"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 01:22:25 -0800
X-CSE-ConnectionGUID: nEr3UD4AQpebKxw3uCi2Tg==
X-CSE-MsgGUID: zoBXQUkuQN692mVEXmVW5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7585103"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 01:22:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/i915/irq: Extract gen11_gu_misc_irq_postinstall()
In-Reply-To: <20261105203427.8696-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261105203427.8696-1-ville.syrjala@linux.intel.com>
 <20261105203427.8696-4-ville.syrjala@linux.intel.com>
Date: Fri, 06 Nov 2026 11:22:22 +0200
Message-ID: <2d32f51366c0d790a1bbe31c3ca6d30a8e303e4e@intel.com>
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

On Thu, 05 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Both gen11 and dg1 duplicate the same code to set up the
> GEN11_GU_MISC interrupts. Extract it to a shared helper.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/i915_irq.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_=
irq.c
> index 12082167face..823d97284d78 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -725,17 +725,26 @@ static void gen8_irq_postinstall(struct drm_i915_pr=
ivate *dev_priv)
>  	gen8_master_intr_enable(intel_uncore_regs(&dev_priv->uncore));
>  }
>=20=20
> +static void gen11_gu_misc_irq_postinstall(struct drm_i915_private *dev_p=
riv)
> +{
> +	struct intel_gt *gt =3D to_gt(dev_priv);
> +	struct intel_uncore *uncore =3D gt->uncore;

That's a roundabout path to uncore, but *shrug*.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> +	u32 gu_misc_masked =3D GEN11_GU_MISC_GSE;
> +
> +	gen2_irq_init(uncore, GEN11_GU_MISC_IRQ_REGS, ~gu_misc_masked, gu_misc_=
masked);
> +}
> +
>  static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
>  {
>  	struct intel_display *display =3D dev_priv->display;
>  	struct intel_gt *gt =3D to_gt(dev_priv);
>  	struct intel_uncore *uncore =3D gt->uncore;
> -	u32 gu_misc_masked =3D GEN11_GU_MISC_GSE;
>=20=20
>  	gen11_gt_irq_postinstall(gt);
> +
>  	intel_display_irq_postinstall(display);
>=20=20
> -	gen2_irq_init(uncore, GEN11_GU_MISC_IRQ_REGS, ~gu_misc_masked, gu_misc_=
masked);
> +	gen11_gu_misc_irq_postinstall(dev_priv);
>=20=20
>  	gen11_master_intr_enable(intel_uncore_regs(uncore));
>  	intel_uncore_posting_read(&dev_priv->uncore, GEN11_GFX_MSTR_IRQ);
> @@ -745,14 +754,13 @@ static void dg1_irq_postinstall(struct drm_i915_pri=
vate *dev_priv)
>  {
>  	struct intel_display *display =3D dev_priv->display;
>  	struct intel_uncore *uncore =3D &dev_priv->uncore;
> -	u32 gu_misc_masked =3D GEN11_GU_MISC_GSE;
>  	struct intel_gt *gt;
>  	unsigned int i;
>=20=20
>  	for_each_gt(gt, dev_priv, i)
>  		gen11_gt_irq_postinstall(gt);
>=20=20
> -	gen2_irq_init(uncore, GEN11_GU_MISC_IRQ_REGS, ~gu_misc_masked, gu_misc_=
masked);
> +	gen11_gu_misc_irq_postinstall(dev_priv);
>=20=20
>  	intel_display_irq_postinstall(display);

--=20
Jani Nikula, Intel
