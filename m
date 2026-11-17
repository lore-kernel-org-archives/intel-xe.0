Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEFA606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 15:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mvLv0uns
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0281110E0A1;
	Tue, 17 Nov 2026 15:43:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BED210E04A;
 Tue, 17 Nov 2026 15:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794930204; x=1826466204;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=JI5+s36p9q8Vz+mPLt/IVA/nZmRRUqREq9oMP7z8UEQ=;
 b=mvLv0unsXDqJNMRd+iiNuRTbYjhUSMuRQgt538/HnepwsPheEAdR9mn0
 K5YwjJi7ABjI5+H0OB580wfffg5G+xTAYfn+ED1u5RaxeOcgFe091Q1cp
 aRw/9SqwJxWSbghoIcKUMY//gvQMaYFJmPkqxlhXVxxkEtCzXRYzLWgir
 5TCcAsewrAOELmRB7BtP4pvGuXdImNoZUQvfKZh1ejKNpBSwSIM2KdbTY
 1GUDBq+snP3OMwFuEUtq/1Kn8vrnvh12nILQSw5nUpSG7OknCK/8oAzrA
 9t8Ho0G9K5peadfc96+ZROkuUpd5ILcNZ+hDTFNhN+UcGo5HjDhF3sv7p w==;
X-CSE-ConnectionGUID: 0fuqsf8uSnae6HtvX4FXQQ==
X-CSE-MsgGUID: JhNKU6E8R0iDE60vi1KjXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3741542"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3741542"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:43:23 -0800
X-CSE-ConnectionGUID: g2raSNaFR8qwRiNhw9hSSg==
X-CSE-MsgGUID: +DZEKr/rQ6a7HpFkaC+tGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="10187747"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.94])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:43:21 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/7] drm/i915/dsb: Remove old comment about stale
 contents of the DSB buffer
In-Reply-To: <20261116081041.6519-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261116081041.6519-1-ville.syrjala@linux.intel.com>
 <20261116081041.6519-2-ville.syrjala@linux.intel.com>
Date: Tue, 17 Nov 2026 17:43:18 +0200
Message-ID: <942aff3cebadc74dcb47573c1b08a3e5678c4e1b@intel.com>
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 16 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Actual reads from the DSB buffer were eliminated in
> commit 0e94059113f6 ("drm/i915/dsb: Avoid reads of the DSB
> buffer for indexed register writes") so the old comment
> about the initial buffer contents being garbage are no
> longer relevant. Remove the outdated comment.
>
> Let's keep the "have we emitted anything yet?" check for
> 100% correctness. Otherwise the initial state ins[] =3D {0,0}
> would count as the previous instruction being a NOOP.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dsb.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i=
915/display/intel_dsb.c
> index 90401f0fc2b0..c15d4db5a3ee 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -343,11 +343,7 @@ static bool intel_dsb_prev_ins_is_write(struct intel=
_dsb *dsb,
>  {
>  	u32 prev_opcode, prev_reg;
>=20=20
> -	/*
> -	 * Nothing emitted yet? Must check before looking
> -	 * at the actual data since i915_gem_object_create_internal()
> -	 * does *not* give you zeroed memory!
> -	 */
> +	/* Nothing emitted yet? */
>  	if (dsb->free_pos =3D=3D 0)
>  		return false;

--=20
Jani Nikula, Intel
