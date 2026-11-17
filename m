Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97BD606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 15:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OdeK1Bus
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11C210E9EC;
	Tue, 17 Nov 2026 15:48:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5D710E9EC;
 Tue, 17 Nov 2026 15:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794930494; x=1826466494;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=8rgvOg1U8EJeEf7YmOiX59D9R3gdnmZlNvLZHCI6x3I=;
 b=OdeK1BusKFUjIwRqh19bRWq9BhBLCZYOrnyL4ia6KUA0Fc0mr+pVa9wu
 MFOE7TWwxeLSEvQkiRWe3Zj1UxyrxqIGe69soc1d5isvcQ4UtAl6KDMLg
 eWg/RS3mGpk9g8GErM97AYjTI2K9qpZvGnVKmZGHZAAywpdr5TZzea5B6
 U8tDOzcLgu9JiCd3Y8bVpOmqrSpJAhozg9tlE8C7TklrENgkW/jk8hBaV
 5rD1QncoG2QuLiqJSzpJL03+TzHAIFyuaK8pUZug/P+va3nvpzc95dslN
 EOVak3s3ao2Zt4dzG+iiDa2ZDCeYFXdEaEHqFBpGAL5LBqtP0kyIb0aCH g==;
X-CSE-ConnectionGUID: rdiIMTX6RFWsBTMguCKpPg==
X-CSE-MsgGUID: PJGRL76gT2G5rxk2Ptu5JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3696451"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3696451"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:48:14 -0800
X-CSE-ConnectionGUID: axvTAejXSxS6+W2HvTrYIw==
X-CSE-MsgGUID: JuyJzi4yT7aK9XSezveSRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9944418"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.94])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:48:12 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/7] drm/i915/dsb: Extract intel_dsb_set_ins()
In-Reply-To: <20261116081041.6519-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261116081041.6519-1-ville.syrjala@linux.intel.com>
 <20261116081041.6519-5-ville.syrjala@linux.intel.com>
Date: Tue, 17 Nov 2026 17:48:09 +0200
Message-ID: <72a8a263d785c3f85a92691e3d8f7ddf39507153@intel.com>
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
> We're adjusting the previous instruction tracking data in
> a few places. Extract that to a helper. I'll be adding a
> few other uses soon.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dsb.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i=
915/display/intel_dsb.c
> index fa4964c17163..75f98b31c780 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -310,6 +310,15 @@ static unsigned int intel_dsb_tail(struct intel_dsb =
*dsb)
>  	return dsb_buffer_ggtt_offset(dsb) + intel_dsb_size(dsb);
>  }
>=20=20
> +static void intel_dsb_set_ins(struct intel_dsb *dsb,
> +			      unsigned int ins_start_offset,
> +			      u32 ldw, u32 udw)
> +{
> +	dsb->ins_start_offset =3D ins_start_offset;
> +	dsb->ins[0] =3D ldw;
> +	dsb->ins[1] =3D udw;
> +}
> +
>  static bool intel_dsb_prev_ins_is_indexed_write(struct intel_dsb *dsb)
>  {
>  	u32 opcode =3D DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT;
> @@ -344,9 +353,7 @@ static void intel_dsb_emit(struct intel_dsb *dsb, u32=
 ldw, u32 udw)
>=20=20
>  	intel_dsb_ins_align(dsb);
>=20=20
> -	dsb->ins_start_offset =3D dsb->free_pos;
> -	dsb->ins[0] =3D ldw;
> -	dsb->ins[1] =3D udw;
> +	intel_dsb_set_ins(dsb, dsb->free_pos, ldw, udw);
>=20=20
>  	dsb_buffer_write(dsb, dsb->free_pos++, dsb->ins[0]);
>  	dsb_buffer_write(dsb, dsb->free_pos++, dsb->ins[1]);
> @@ -1023,9 +1030,7 @@ void intel_dsb_wait(struct intel_dsb *dsb)
>=20=20
>  	/* Attempt to reset it */
>  	dsb->free_pos =3D 0;
> -	dsb->ins_start_offset =3D 0;
> -	dsb->ins[0] =3D 0;
> -	dsb->ins[1] =3D 0;
> +	intel_dsb_set_ins(dsb, 0, 0, 0);
>=20=20
>  	intel_de_write_fw(display, DSB_CTRL(pipe, dsb->id), 0);

--=20
Jani Nikula, Intel
