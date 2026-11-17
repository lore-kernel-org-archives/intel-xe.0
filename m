Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7757606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 15:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bFminNKV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F63010E8AF;
	Tue, 17 Nov 2026 15:44:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3FF10E8AF;
 Tue, 17 Nov 2026 15:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794930288; x=1826466288;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=VlG+9Ej58u4HQK2HbdiQsDlUo1y2zNW7/AKwvQSdPmI=;
 b=bFminNKVZr35HifJGRNkhFJsdw47nJIKs3UXfSM+OhA6YdAq3sjZ1ML0
 w8lIOgdykY0R1Va53+1wkMDwjCeKYUbnyeJeuKNgr9dfBJJBlQh54AUWN
 hHYDK6eLlUNopvtOwGa/vcC7zsjMk79EcFqzkhDB5IHBjbOmlryD9p0CN
 xuaiZRIsn73jD29naFXZzfIih+IG70hgk4QIMDtlqG+k4RnEMtLxja2+v
 9iPdEh4F7GXgaKQ2zyx1+ZFHZldXM9FyBEvzKEd9SnYYDo92mDC1cu8eY
 t+HP1mBamtVVapslb3KYMA7zrkfyFOISI+amZYKYStJ7wdxcmjjbh/iw7 Q==;
X-CSE-ConnectionGUID: SgEy3wIBS8SdkIAcqdSlVQ==
X-CSE-MsgGUID: CBBAO2VkRM6ErQ0U2hruXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3698423"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3698423"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:44:48 -0800
X-CSE-ConnectionGUID: O0X6igbESBOWqyfYj8QXIg==
X-CSE-MsgGUID: S2hEELZoQ9K0MvcAz4ywkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9718712"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.94])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:44:46 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/7] drm/i915/dsb: Eliminate intel_dsb_prev_ins_is_write()
In-Reply-To: <20261116081041.6519-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261116081041.6519-1-ville.syrjala@linux.intel.com>
 <20261116081041.6519-3-ville.syrjala@linux.intel.com>
Date: Tue, 17 Nov 2026 17:44:44 +0200
Message-ID: <75dcaead324aa22019c5c529c765af4b8f9b0068@intel.com>
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
> We no longer care about anything but indexed register writes,
> so remove the pointless intel_dsb_prev_ins_is_write() middle
> man.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dsb.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i=
915/display/intel_dsb.c
> index c15d4db5a3ee..8357c712a20e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -338,9 +338,10 @@ static void intel_dsb_emit(struct intel_dsb *dsb, u3=
2 ldw, u32 udw)
>  	dsb_buffer_write(dsb, dsb->free_pos++, dsb->ins[1]);
>  }
>=20=20
> -static bool intel_dsb_prev_ins_is_write(struct intel_dsb *dsb,
> -					u32 opcode, intel_reg_t reg)
> +static bool intel_dsb_prev_ins_is_indexed_write(struct intel_dsb *dsb,
> +						intel_reg_t reg)
>  {
> +	u32 opcode =3D DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT;
>  	u32 prev_opcode, prev_reg;
>=20=20
>  	/* Nothing emitted yet? */
> @@ -353,13 +354,6 @@ static bool intel_dsb_prev_ins_is_write(struct intel=
_dsb *dsb,
>  	return prev_opcode =3D=3D opcode && prev_reg =3D=3D intel_reg_offset(re=
g);
>  }
>=20=20
> -static bool intel_dsb_prev_ins_is_indexed_write(struct intel_dsb *dsb, i=
ntel_reg_t reg)
> -{
> -	return intel_dsb_prev_ins_is_write(dsb,
> -					   DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT,
> -					   reg);
> -}
> -
>  /**
>   * intel_dsb_reg_write_indexed() - Emit indexed register write to the DS=
B context
>   * @dsb: DSB context

--=20
Jani Nikula, Intel
