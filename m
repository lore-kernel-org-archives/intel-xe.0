Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F782606A332
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 16:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sh4OtYTu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372EC10EB97;
	Tue, 17 Nov 2026 16:07:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75DF10EB97;
 Tue, 17 Nov 2026 16:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794931640; x=1826467640;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=9WBl97ox45VwdJud2Nt486jdjH9XjODUFDGoT9sLQTs=;
 b=Sh4OtYTuWWqSIbnJQVoldKWGypAvQNMw6nKmVECRaWP7kJ74fNoGeQL2
 IDkekLSMM6P5Tn2i5YRfx9j0yunqWtEtFgAZVre/So1XYVxmd+Mdtsbp7
 YO/Z5EcyKSRUmUcCvO7LJpdWvE0BzlKo/KcXGPnXBM9PAi48C+qkRVd9I
 23RQ0ohQ7my2pWZdRQgWbMrGH1SMOdPIA7qyqrYwuIKDbof9Jzk/nZIp+
 HwtPFu3EhV55q7E1Z1GAuj7a/f5y7joqUvZviUCHi3lHX1xdP3ZL6gEti
 6srRljmlTOIhKm1VBVc1TlKOxi2r8k1MmjEB6OOkVmIeAADpmiqzL2ZAc Q==;
X-CSE-ConnectionGUID: Phc8aKNXQgmVVRqQQN8Q2w==
X-CSE-MsgGUID: uLAStSg6SGqXI9miMXL2/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3560056"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3560056"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 08:07:19 -0800
X-CSE-ConnectionGUID: EYqedJK5TI2lXI+6+rKu/g==
X-CSE-MsgGUID: dDUCnr2hQ6WyuM93BaA8Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="10401808"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.94])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 08:07:18 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 5/7] drm/i915/dsb: Update previous instruction tracking
 in intel_dsb_align_tail() & co.
In-Reply-To: <20261116081041.6519-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261116081041.6519-1-ville.syrjala@linux.intel.com>
 <20261116081041.6519-6-ville.syrjala@linux.intel.com>
Date: Tue, 17 Nov 2026 18:07:15 +0200
Message-ID: <7d90df4bf575d83be6b34824d3a40d07fa5d10d2@intel.com>
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
> intel_dsb_align_tail() and intel_dsb_gosub_align() simply memset
> a bunch of QWs to 0. What that actually does is emit a bunch of
> NOOP instructions. For complete correctness let's keep the
> previous instruction tracking up to date, instead of leaving
> it pointing at whatever instruction preceded the alignment
> NOOPs.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsb.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i=
915/display/intel_dsb.c
> index 75f98b31c780..f8ca64a3c076 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -601,6 +601,8 @@ static void intel_dsb_align_tail(struct intel_dsb *ds=
b)
>  	if (aligned_tail > tail) {
>  		dsb_buffer_fill(dsb, dsb->free_pos, 0, aligned_tail - tail);
>  		dsb->free_pos =3D aligned_tail / 4;
> +
> +		intel_dsb_set_ins(dsb, dsb->free_pos - 2, 0, 0);

So is this just the last two NOOPs?

BR,
Jani.

>  	}
>  }
>=20=20
> @@ -624,6 +626,8 @@ static void intel_dsb_gosub_align(struct intel_dsb *d=
sb)
>  	if (aligned_tail - tail <=3D 2 * 8) {
>  		dsb_buffer_fill(dsb, dsb->free_pos, 0, aligned_tail - tail);
>  		dsb->free_pos =3D aligned_tail / 4;
> +
> +		intel_dsb_set_ins(dsb, dsb->free_pos - 2, 0, 0);
>  	}
>  }

--=20
Jani Nikula, Intel
