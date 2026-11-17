Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDD7606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 16:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q4yBPYo3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF8C10ED65;
	Tue, 17 Nov 2026 16:05:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B1F10EBB4;
 Tue, 17 Nov 2026 16:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794931546; x=1826467546;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=xNrSOHouOhTLKZH08SGcyxHl0rgZo5jFNWUPd1rj748=;
 b=Q4yBPYo3NWQLhOnHZhhOxT5J+00Bnyoxg1S4/xxftDpj178UEFYuEykE
 v7cI2gA+lEQStzsfbC1fIZMPfXkMIgX2MaDRbp1RTs6ajdlXzUpGC5KDa
 GtRGcymPN4Jp45hDVADkun7aIcM1fwBDgFqCiQ9xeEGKDGM09C+aA6FEY
 vTdWa2RU98VhttAqb6+L6GqFAQ8ElkfX1sbynfn58i83gz/fJ0coslm7n
 B2b6YqQBYlPZp0fKhf+/c/hXfWWgtlhMhYLylR9FmLtwaM1nPVATHWlro
 M6GjrzVg83QOGhxo5fcJq7AmgZDQMj3+tvI8NoeJqMkYB2qJG0yat6SXF Q==;
X-CSE-ConnectionGUID: ugUyqUkdS2e/6Lq66eiPTw==
X-CSE-MsgGUID: 9EiZcqGXSa2i79T1U4zKHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3575112"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3575112"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 08:05:20 -0800
X-CSE-ConnectionGUID: S4bi7E/aRsGlSa5u101oTQ==
X-CSE-MsgGUID: v85NA9rQRiKiEL7tKt/jog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9780780"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.94])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 08:05:11 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 7/7] drm/i915/dsb: Avoid redundant writes to the DSB
 buffer for indexed register writes
In-Reply-To: <20261116081041.6519-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261116081041.6519-1-ville.syrjala@linux.intel.com>
 <20261116081041.6519-8-ville.syrjala@linux.intel.com>
Date: Tue, 17 Nov 2026 18:05:08 +0200
Message-ID: <a2cdb4b3495a62ecbfd8a9d3261c499098a60d38@intel.com>
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
> Currently each and every intel_dsb_reg_write_indexed() call
> will store the new register count into the actual DSB buffer,
> overwriting the previous count. Considering the LUT has
> perhaps 1024 or more entries, that is a lot of redundant
> writes into a buffer that may live in the local memory of a
> discrete GPU.
>
> Defer storing the count until the final value is known,
> that is when a completely new instruction is about to
> be emitted.

Please remind me what guarantees there will be a new instruction, so
that an unfinished buffer never gets to the DSB.

Maybe a word or two about that here, or in a comment near
intel_dsb_ins_align() would be helpful for the more casual DSB folks...

Other than that,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> Eliminating these and other redundant writes speeds up the
> DSB buffer writes for a 1024 entry LUT update from ~75 usec
> to ~45 usec on my DG2.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsb.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i=
915/display/intel_dsb.c
> index f7a54dc44894..057f0545bace 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -335,6 +335,10 @@ static bool intel_dsb_prev_ins_is_indexed_write(stru=
ct intel_dsb *dsb)
>=20=20
>  static void intel_dsb_ins_align(struct intel_dsb *dsb)
>  {
> +	/* Store the final indexed register write count */
> +	if (intel_dsb_prev_ins_is_indexed_write(dsb))
> +		dsb_buffer_write(dsb, dsb->ins_start_offset + 0, dsb->ins[0]);
> +
>  	/*
>  	 * Every instruction must be 8 byte aligned.
>  	 * Indexed register writes may leave free_pos misaligned.
> @@ -409,9 +413,12 @@ void intel_dsb_reg_write_indexed(struct intel_dsb *d=
sb,
>  	if (!assert_dsb_has_room(dsb))
>  		return;
>=20=20
> -	/* Update the count */
> +	/*
> +	 * Update the count. The actual dsb_buffer_write()
> +	 * is done from intel_dsb_ins_align() once the final
> +	 * count is known.
> +	 */
>  	dsb->ins[0]++;
> -	dsb_buffer_write(dsb, dsb->ins_start_offset + 0, dsb->ins[0]);
>=20=20
>  	dsb_buffer_write(dsb, dsb->free_pos++, val);
>  }

--=20
Jani Nikula, Intel
