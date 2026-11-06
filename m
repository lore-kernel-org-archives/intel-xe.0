Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E06B606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 09:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SNGldgHH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C59F10E363;
	Fri,  6 Nov 2026 09:25:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6164610E363;
 Fri,  6 Nov 2026 09:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793957113; x=1825493113;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=1VHE2TCeF/1Q2aS6kxdQ5RqOgRD6eBBLYfEcyTqY7oA=;
 b=SNGldgHHpt8j0HU/6UkZQQeHtBtH8pIchrqvaUrg3SfZIM4KjrCIZk+j
 cCPCXrtY4f51zmPywRbRKLQtgxZYyMpeFMaII+FifbIhRcdL8+qM7Jk/r
 rFf/ATjukqTInJipSQYGd/k+d/vmrmgP2fR9002ntxAZ9Auo/Q9QC8AQu
 9w2ISsvwu0Q0JcLvqjyhaACjiqZeK1COhIxqPRIElKPljjRS1mAG0yjRO
 l9p5+TqBkfSKs2Yl2ResckhCIjSisPPuN9ZtbveSSJAs4T7A5o7brtu6g
 XedbFY/4DEtrqf5Q+qF2xNmwrLi66MbndtoU/rgwk9GAcGyb96qwDIxnd A==;
X-CSE-ConnectionGUID: VOYNsN7ZQj2iXqSulnqNiQ==
X-CSE-MsgGUID: m8JbkJqVQA2KEn447fYmFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2643333"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2643333"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 01:25:13 -0800
X-CSE-ConnectionGUID: kDVBkYoxRu+aSgZ58DAp2A==
X-CSE-MsgGUID: ECdoUr0YTCyrUcc0/WEmTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7575074"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 01:25:12 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/5] drm/i915/irq: Keep GSE interrupts masked if display
 is not present
In-Reply-To: <20261105203427.8696-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261105203427.8696-1-ville.syrjala@linux.intel.com>
 <20261105203427.8696-5-ville.syrjala@linux.intel.com>
Date: Fri, 06 Nov 2026 11:25:09 +0200
Message-ID: <5f09f7ca44f89e67ec100eb4714f314c1da4eb4f@intel.com>
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
> Display is the only current user of GSE interrupts. Keep the
> GSE interrupt masked on icl+ if there is no display.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

xe could use the same treatment.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_irq.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_=
irq.c
> index 823d97284d78..5476472d33bd 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -36,6 +36,7 @@
>  #include <drm/intel/display_parent_interface.h>
>  #include <drm/intel/intel_gmd_interrupt_regs.h>
>=20=20
> +#include "display/intel_display_device.h"
>  #include "display/intel_display_irq.h"
>=20=20
>  #include "gt/intel_breadcrumbs.h"
> @@ -727,9 +728,13 @@ static void gen8_irq_postinstall(struct drm_i915_pri=
vate *dev_priv)
>=20=20
>  static void gen11_gu_misc_irq_postinstall(struct drm_i915_private *dev_p=
riv)
>  {
> +	struct intel_display *display =3D dev_priv->display;
>  	struct intel_gt *gt =3D to_gt(dev_priv);
>  	struct intel_uncore *uncore =3D gt->uncore;
> -	u32 gu_misc_masked =3D GEN11_GU_MISC_GSE;
> +	u32 gu_misc_masked =3D 0;
> +
> +	if (intel_display_device_present(display))
> +		gu_misc_masked |=3D GEN11_GU_MISC_GSE;
>=20=20
>  	gen2_irq_init(uncore, GEN11_GU_MISC_IRQ_REGS, ~gu_misc_masked, gu_misc_=
masked);
>  }

--=20
Jani Nikula, Intel
