Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B28C606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 09:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k561AyiU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C337A112C93;
	Fri,  6 Nov 2026 09:25:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAE4112C93;
 Fri,  6 Nov 2026 09:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793957129; x=1825493129;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=fPK0d4cBHbBIAttRrzE/uN4UjYYDPXT/uYNgwm3dTPM=;
 b=k561AyiU4bNuiYPh69aClnNPY79uTXBpHa8tLdiiJ4rr/e4k6Nk530yl
 FrSH9D8ZxWpnLdPzWwcVWmap8awaAj+wV0XvtXx+Jw15wgNua/pR67Dua
 FF5JU5fk+OJGXV062ARgwcNgk+kzWylkFcW3Yb4DGV4Qgh4/tJ3F7oCJ3
 mNYrpOgXgiIV2OS/mv++Ya5q8IC7RhppVFyq4B0cKzbLDJ9dkAah2Z4Eo
 IJjPtYuyBL3szqfLPtFCrZl1FqJaCd0GEpcNbsb5nFS4AhC7UxyX0W8WQ
 WeYs6XxD73ABIX3uPSghJtO1j5sjZ1w4Gsn8g4TtE1TcuF2HH61DD1+z8 Q==;
X-CSE-ConnectionGUID: 8PjAJZ7ESrO/5BfG2SICPg==
X-CSE-MsgGUID: Od8LkAyoRwOcYBkSEmerhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2758022"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2758022"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 01:25:29 -0800
X-CSE-ConnectionGUID: J9pXK7NRTTC42iHPejgPuw==
X-CSE-MsgGUID: glqaVz8EQFaoaqwFvRdp0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8983940"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 01:25:27 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 5/5] drm/i915/irq: Reorder GU_MISC vs. display in
 gen11_irq_postinstall()
In-Reply-To: <20261105203427.8696-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261105203427.8696-1-ville.syrjala@linux.intel.com>
 <20261105203427.8696-6-ville.syrjala@linux.intel.com>
Date: Fri, 06 Nov 2026 11:25:24 +0200
Message-ID: <9b2b19ef78aacf4b31c0548a969a5a16906aab55@intel.com>
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
> gen11_irq_postinstall() and dg1_irq_postinstall() call
> intel_display_irq_postinstall() and gen11_gu_misc_irq_postinstall()
> in the opposite order, presumably for no real reason. Reorder the
> gen11 part to match the dg1 part for consistency.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_irq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_=
irq.c
> index 5476472d33bd..8ff2dd74b301 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -747,10 +747,10 @@ static void gen11_irq_postinstall(struct drm_i915_p=
rivate *dev_priv)
>=20=20
>  	gen11_gt_irq_postinstall(gt);
>=20=20
> -	intel_display_irq_postinstall(display);
> -
>  	gen11_gu_misc_irq_postinstall(dev_priv);
>=20=20
> +	intel_display_irq_postinstall(display);
> +
>  	gen11_master_intr_enable(intel_uncore_regs(uncore));
>  	intel_uncore_posting_read(&dev_priv->uncore, GEN11_GFX_MSTR_IRQ);
>  }

--=20
Jani Nikula, Intel
