Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988DF606A32A
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 15:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=esy6TMkp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C2910EBA8;
	Tue, 17 Nov 2026 15:58:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACDD10EBA8;
 Tue, 17 Nov 2026 15:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794931075; x=1826467075;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=VgPr8M5BUfWfPVMnbWTDk0nsvrBkb4RvAPszVGJ6jyE=;
 b=esy6TMkpH9JlRBcXI6qyys8AwWjKcdTgvOhO8+rwzlBtOCYN5Cl/JdgR
 gEahorIUeux6rSoQp5sCF1azeS7Pexn6cvsUZnT/1dw0kuwoGUyDsW+kJ
 O24H1P17+7vh32GXvvmu/Ep0wIQvLWPGRnD3ZXbH1c50yQwfr7p6dl4Zk
 d9EtyxSqZg2WkPWhi32kMevy3D1zpCCJkicpzHMZSOqf3XA7fojn3xdWw
 DyOLyyyOxNVmhDl/7VOjQueZNqS7YGf90f5kzpWvEgyuCQKA6Lvw9YikK
 cXt76ho0pW1hrxjLUxuQBPhBAOQ91mjQ9p5Wq/njxJeO741mPHFM+rslA Q==;
X-CSE-ConnectionGUID: yHzZHXLCTXqdvpvJ92hYWg==
X-CSE-MsgGUID: ATwD8pibSo2FHPKoMhvtlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3743128"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3743128"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:57:55 -0800
X-CSE-ConnectionGUID: K+Pwcf+4TCSUh11YYCmJjg==
X-CSE-MsgGUID: anEm+CKdSommiahhpUJIGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="10190568"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.94])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:57:55 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 6/7] drm/i915/dsb: Skip redundant zeroing of every
 second indexed write DW
In-Reply-To: <20261116081041.6519-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261116081041.6519-1-ville.syrjala@linux.intel.com>
 <20261116081041.6519-7-ville.syrjala@linux.intel.com>
Date: Tue, 17 Nov 2026 17:57:52 +0200
Message-ID: <5db805a0f604db14d219c0fb43bd46d9f492590d@intel.com>
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
> Currently intel_dsb_reg_write_indexed() assumes that it may be
> the last register write into the same register, and proceeds
> to zero out the last misaligned DW. But if another indexed write
> to the same register follows (as it usually does) that zeroed DW
> will again be overwritten with the new register value.
>
> So every second indexed register write in a sequence will
> perform a completely redundant DW write. Considering that the
> DSB buffer will be in device memory on discrete GPUs we
> probably don't want to do these redundant writes.
>
> Defer the extra DW write to intel_dsb_ins_align() which gets
> called ahead of every new DSB instruction emitted. There we'll
> just have to write a single DW, if the previous indexed write
> left us with an odd number of DWs.
>
> Eliminating these and other redundant writes speeds up the
> DSB buffer writes for a 1024 entry LUT update from ~75 usec
> to ~45 usec on my DG2.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dsb.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i=
915/display/intel_dsb.c
> index f8ca64a3c076..f7a54dc44894 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -336,14 +336,11 @@ static bool intel_dsb_prev_ins_is_indexed_write(str=
uct intel_dsb *dsb)
>  static void intel_dsb_ins_align(struct intel_dsb *dsb)
>  {
>  	/*
> -	 * Every instruction should be 8 byte aligned.
> -	 *
> -	 * The only way to get unaligned free_pos is via
> -	 * intel_dsb_reg_write_indexed() which already
> -	 * makes sure the next dword is zeroed, so no need
> -	 * to clear it here.
> +	 * Every instruction must be 8 byte aligned.
> +	 * Indexed register writes may leave free_pos misaligned.
>  	 */
> -	dsb->free_pos =3D ALIGN(dsb->free_pos, 2);
> +	if (dsb->free_pos & 1)
> +		dsb_buffer_write(dsb, dsb->free_pos++, 0);
>  }
>=20=20
>  static void intel_dsb_emit(struct intel_dsb *dsb, u32 ldw, u32 udw)
> @@ -417,9 +414,6 @@ void intel_dsb_reg_write_indexed(struct intel_dsb *ds=
b,
>  	dsb_buffer_write(dsb, dsb->ins_start_offset + 0, dsb->ins[0]);
>=20=20
>  	dsb_buffer_write(dsb, dsb->free_pos++, val);
> -	/* if number of data words is odd, then the last dword should be 0.*/
> -	if (dsb->free_pos & 0x1)
> -		dsb_buffer_write(dsb, dsb->free_pos, 0);
>  }
>=20=20
>  void intel_dsb_reg_write(struct intel_dsb *dsb,

--=20
Jani Nikula, Intel
