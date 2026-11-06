Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC33606A32D
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 15:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V9e1Dgay
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6EE112E8D;
	Fri,  6 Nov 2026 15:38:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF632112E4F;
 Fri,  6 Nov 2026 15:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793979507; x=1825515507;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=vTqJ3K2cGBgHk+zqYr+sci5bpzPuRYBLdtzMZzet590=;
 b=V9e1Dgay8266rryh9lFG6uirgpfIaX5SmcG6QsFlofp3TItOdyPiWMOn
 oNzou7syQC8Q3nKUmWskpAR0cMFAKJ3VD+fNe6JiOZ0r3Uh7E9hTp/llZ
 uI2pAx9Fk88Pnf0U1jnTZpYpE/phWUSXe+q7yWw/nAlnTFi88kMRS4+z2
 k2IVVXoJan0N1fBUSCQG2qooABPt37UimnlxPSQ7hyUXly+SxPmVBLZqm
 DKMf5MdW/LTRhMsVx+m/0Hw9WQkbdM3K6c6lZx7TfmF0vSgFaCOXHqp1I
 DdT0vm0lJRQ46xbH016xvGjc1vXSctbdwA0V+LpebHRK6xb4OW9idccFd Q==;
X-CSE-ConnectionGUID: zqMVOBjJS5WGqt0PCkjynA==
X-CSE-MsgGUID: UHasje14SSmJMrjisG9fYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2815611"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2815611"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:38:27 -0800
X-CSE-ConnectionGUID: EDNQlOwxSyepUxmbFHZldQ==
X-CSE-MsgGUID: DWzOUmdiQp+uIfOZRcUezg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7467054"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:38:25 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 9/9] drm/xe: Nuke the intel_uncore_{read, write}() wrappers
In-Reply-To: <20261104221842.18799-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-10-ville.syrjala@linux.intel.com>
Date: Fri, 06 Nov 2026 17:38:23 +0200
Message-ID: <a892902195af77b510176c2b78e8d5cf6016c85b@intel.com>
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
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> intel_uncore_{read,write}() are no longer needed by the
> display code. Remove them.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Yay.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  .../drm/xe/compat-i915-headers/intel_uncore.h    | 16 ----------------
>  1 file changed, 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/driv=
ers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> index 2f198e2e2fec..238addc1e5fc 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> @@ -23,14 +23,6 @@ static inline struct xe_mmio *__compat_uncore_to_mmio(=
struct intel_uncore *uncor
>  	return xe_root_tile_mmio(xe);
>  }
>=20=20
> -static inline u32 intel_uncore_read(struct intel_uncore *uncore,
> -				    i915_reg_t i915_reg)
> -{
> -	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> -
> -	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
> -}
> -
>  static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
>  				    i915_reg_t i915_reg)
>  {
> @@ -55,14 +47,6 @@ static inline u16 intel_uncore_read16(struct intel_unc=
ore *uncore,
>  	return xe_mmio_read16(__compat_uncore_to_mmio(uncore), reg);
>  }
>=20=20
> -static inline void intel_uncore_write(struct intel_uncore *uncore,
> -				      i915_reg_t i915_reg, u32 val)
> -{
> -	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> -
> -	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
> -}
> -
>  static inline u32 intel_uncore_read_fw(struct intel_uncore *uncore,
>  				       i915_reg_t i915_reg)
>  {

--=20
Jani Nikula, Intel
