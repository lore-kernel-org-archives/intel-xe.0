Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B24606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 15:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bQm7q6QV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D594810E9EC;
	Tue, 17 Nov 2026 15:49:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFED010E9EC;
 Tue, 17 Nov 2026 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794930564; x=1826466564;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=64jzBWOoQ2TegFn1wmGlMYnPp09auZjOB5AMLqJb+qw=;
 b=bQm7q6QVbyDqP3w0bxuPV29X6oEnKSvqDLWZc5P3z4jiQD7jUZ9XFXfZ
 DeEaOpcRV/E6qFhqK+c5ZfiLwRCBbYsWcXmku8b96RNF4al2YS9KXxCQu
 34116kv9HgZMckdc+j4/1H0h+5U82+cjZEaMHtRZ2ezAokKmbDW3I24rC
 YFK5CDWxwDU8LxaB7tEDzAr80YxP/x/fIgeM2OTYYj+rA56Z1P+glg74n
 pgEE8moeRq1ZOyYECqm3ZlPdkyoJ3/+FIJDCY93J48C51CGA0hRfilDQs
 mKLajal7cz6FvAwddUfniw8P7gIlyIX8jqjLnO63H5VsMkDMHozM0yTKV g==;
X-CSE-ConnectionGUID: QqyeeLz9T22/AsqLIfHw8Q==
X-CSE-MsgGUID: 2EHz/OZjSgeonFbz32Ev/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3699592"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3699592"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:47:24 -0800
X-CSE-ConnectionGUID: exDvlrwXSV+j63oCeIqmTA==
X-CSE-MsgGUID: bHiy6aNbTMm4HhhJnvHGog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9719490"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.94])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:47:23 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/7] drm/i915/dsb: Carve up
 intel_dsb_prev_ins_is_indexed_write()
In-Reply-To: <20261116081041.6519-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261116081041.6519-1-ville.syrjala@linux.intel.com>
 <20261116081041.6519-4-ville.syrjala@linux.intel.com>
Date: Tue, 17 Nov 2026 17:47:20 +0200
Message-ID: <de9948c3347d9370e83f26e98c0f133b90dc0cca@intel.com>
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

On Mon, 16 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Currently intel_dsb_prev_ins_is_indexed_write() checks both the
> opcode and the register offset. I'll be needing the opcode
> only part for a second use, so carve the function up into
> two parts:
> - intel_dsb_prev_ins_is_indexed_write() which just checks
>   the opcode
> - intel_dsb_prev_ins_is_indexed_write_to_reg() which checks
>   both the opcode and the register offset
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsb.c | 29 ++++++++++++++++--------
>  1 file changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i=
915/display/intel_dsb.c
> index 8357c712a20e..fa4964c17163 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -310,6 +310,20 @@ static unsigned int intel_dsb_tail(struct intel_dsb =
*dsb)
>  	return dsb_buffer_ggtt_offset(dsb) + intel_dsb_size(dsb);
>  }
>=20=20
> +static bool intel_dsb_prev_ins_is_indexed_write(struct intel_dsb *dsb)
> +{
> +	u32 opcode =3D DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT;
> +	u32 prev_opcode;
> +
> +	/* Nothing emitted yet? */
> +	if (dsb->free_pos =3D=3D 0)
> +		return false;
> +
> +	prev_opcode =3D dsb->ins[1] & ~DSB_REG_VALUE_MASK;
> +
> +	return prev_opcode =3D=3D opcode;
> +}
> +

Surprising location far away from the "to_reg" counterpart, but okay.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>  static void intel_dsb_ins_align(struct intel_dsb *dsb)
>  {
>  	/*
> @@ -338,20 +352,17 @@ static void intel_dsb_emit(struct intel_dsb *dsb, u=
32 ldw, u32 udw)
>  	dsb_buffer_write(dsb, dsb->free_pos++, dsb->ins[1]);
>  }
>=20=20
> -static bool intel_dsb_prev_ins_is_indexed_write(struct intel_dsb *dsb,
> -						intel_reg_t reg)
> +static bool intel_dsb_prev_ins_is_indexed_write_to_reg(struct intel_dsb =
*dsb,
> +						       intel_reg_t reg)
>  {
> -	u32 opcode =3D DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT;
> -	u32 prev_opcode, prev_reg;
> +	u32 prev_reg;
>=20=20
> -	/* Nothing emitted yet? */
> -	if (dsb->free_pos =3D=3D 0)
> +	if (!intel_dsb_prev_ins_is_indexed_write(dsb))
>  		return false;
>=20=20
> -	prev_opcode =3D dsb->ins[1] & ~DSB_REG_VALUE_MASK;
>  	prev_reg =3D  dsb->ins[1] & DSB_REG_VALUE_MASK;
>=20=20
> -	return prev_opcode =3D=3D opcode && prev_reg =3D=3D intel_reg_offset(re=
g);
> +	return prev_reg =3D=3D intel_reg_offset(reg);
>  }
>=20=20
>  /**
> @@ -386,7 +397,7 @@ void intel_dsb_reg_write_indexed(struct intel_dsb *ds=
b,
>  	 * we are writing odd no of dwords, Zeros will be added in the end for
>  	 * padding.
>  	 */
> -	if (!intel_dsb_prev_ins_is_indexed_write(dsb, reg))
> +	if (!intel_dsb_prev_ins_is_indexed_write_to_reg(dsb, reg))
>  		intel_dsb_emit(dsb, 0, /* count */
>  			       (DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT) |
>  			       intel_reg_offset(reg));

--=20
Jani Nikula, Intel
