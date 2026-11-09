Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BD3606A323
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 12:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cR/yr5wK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5716610F1D9;
	Mon,  9 Nov 2026 12:05:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BCE10F1C9
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 12:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794225912; x=1825761912;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=JRFG/mMPPn62VrkHW128xji8GiAWO8W4/ErX20li19Y=;
 b=cR/yr5wKW+SFhrKWk0wz9/RULH5abdu1TNxshmiDYzhASE+7JQwU5KGI
 nuNRzzlDASb23iEyFjF63JOpy59afD8vnSBEPxRbJrfXg8VgT6d7jjqv9
 c9mGwcHOBieaSSaJtw8sxXtKSHvY+0PCRufcbn54BnVCClMug8I3fat3U
 /Bz1hnNbjI9ryIDX+2NQkSAu9igbqlFodeeobv3NScdQmizi25kxnbohG
 JpGBqZ++Xxt3L0kva0QEiCPIFoS6K2yra98+6lKDINcxMUZnOkMG8nBi2
 ztZpWn8o25+IHoQVBLm09WeiaMQ6bNTDUrxAeQL9mTRoF7tjGswq2VmZO w==;
X-CSE-ConnectionGUID: DJVfte/ZSIqWZFgnYAuLUg==
X-CSE-MsgGUID: qbsSGHu2QIeLzmChaMMf7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2822644"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2822644"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:05:11 -0800
X-CSE-ConnectionGUID: oLWKu8AcTR2cb2hk2HIZbQ==
X-CSE-MsgGUID: lqxpEuykRIK2ATUUEwQCgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7975558"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:05:10 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm/xe: Use intel_display_gse_irq_handler()
In-Reply-To: <20261109114554.19597-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261109114554.19597-1-ville.syrjala@linux.intel.com>
 <20261109114554.19597-5-ville.syrjala@linux.intel.com>
Date: Mon, 09 Nov 2026 14:05:08 +0200
Message-ID: <07539696cef399115faedc5d3f84439e7d22207a@intel.com>
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
> Replace the direct intel_opregion_asle_intr() call with the
> new intel_display_gse_irq_handler() abstraction. We don't
> want to leak random opregion symbols out from the display
> code.

This depends on [1] which I don't think is merged yet?

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


[1] https://lore.kernel.org/r/20261105203427.8696-3-ville.syrjala@linux.int=
el.com

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe=
/display/xe_display.c
> index 21692408f9be..0236f69a0f88 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -220,7 +220,7 @@ void xe_display_gse_irq_handler(struct xe_device *xe,=
 u32 gu_misc_iir)
>  		return;
>=20=20
>  	if (gu_misc_iir & GU_MISC_GSE)
> -		intel_opregion_asle_intr(display);
> +		intel_display_gse_irq_handler(display);
>  }
>=20=20
>  void xe_display_irq_reset(struct xe_device *xe)

--=20
Jani Nikula, Intel
