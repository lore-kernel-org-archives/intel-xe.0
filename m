Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1657606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 12:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hvChZamG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4B911253E;
	Thu, 22 Oct 2026 12:15:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBC711252D;
 Thu, 22 Oct 2026 12:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792671330; x=1824207330;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=WKYDXC4uGkIbZC1rfWqpej08HxIh1UGsd3o0zbMFWcg=;
 b=hvChZamGbKzZeOVaYfWwX/zZLrrP9zwZsmNnygOTOvB6K4bo+r8xTGzJ
 6M0j+A0odsM54vP6gvcLGKE9qVFBY0dOwYUFSbPhmsskEIhN7aJMPXXZc
 AkqLwDs+qrTiKKeeRIXsOSJRhE6VrsfmuEPu3NecyycOIOvBluZtWgLAa
 jPy7VZ0TmNn5VwaKYUCzJiuu8vXfT01ls+7tvUQv6x6MGuD9bL2PDS76i
 zTUP36fyH1MM1+qN55wkSDJv7axnfhJiM4v65DJJCP64Gfey0R8L8s5EC
 /99+YQG47suVMWr6SijB9yPyUcI3+jz5ix8ULAE+qHgxAO9gEID+Lchsh w==;
X-CSE-ConnectionGUID: Ai3RF91pTZmCyBHEALEgPA==
X-CSE-MsgGUID: yRf3NYVGQoO1bokq6H/MuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1425654"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1425654"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:15:30 -0700
X-CSE-ConnectionGUID: wQf7CfB5R7CM6q/j2DXU3A==
X-CSE-MsgGUID: oq75o138QWacTxAHGqqR2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3711428"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.5])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:15:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm/i915: Skip redundant frame/scanline/time reads
 for async flips
In-Reply-To: <20261022115548.32678-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261022115548.32678-1-ville.syrjala@linux.intel.com>
 <20261022115548.32678-5-ville.syrjala@linux.intel.com>
Date: Thu, 22 Oct 2026 15:15:23 +0300
Message-ID: <0646efa4828b0e9308cc0ef869c786ac2cda7a06@intel.com>
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

On Thu, 22 Oct 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The frame/scanline/time information we read out at the
> start of intel_pipe_update_end() is never used if we
> we are performing an async flip. Skip the redundant work.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_crtc.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/=
i915/display/intel_crtc.c
> index 829ff2a2c025..139c9dae536e 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -732,15 +732,19 @@ void intel_pipe_update_end(struct intel_atomic_stat=
e *state,
>  	struct intel_crtc_state *new_crtc_state =3D
>  		intel_atomic_get_new_crtc_state(state, crtc);
>  	enum pipe pipe =3D crtc->pipe;
> -	int scanline_end =3D intel_get_crtc_scanline(crtc);
> -	u32 end_vbl_count =3D intel_crtc_get_vblank_counter(crtc);
> -	ktime_t end_vbl_time =3D ktime_get();
> +	ktime_t end_vbl_time;
> +	u32 end_vbl_count;
> +	int scanline_end;
>=20=20
>  	drm_WARN_ON(display->drm, new_crtc_state->commit_type !=3D INTEL_COMMIT=
_MMIO);
>=20=20
>  	if (new_crtc_state->do_async_flip)
>  		goto out;
>=20=20
> +	scanline_end =3D intel_get_crtc_scanline(crtc);
> +	end_vbl_count =3D intel_crtc_get_vblank_counter(crtc);
> +	end_vbl_time =3D ktime_get();
> +
>  	trace_intel_pipe_update_end(crtc, end_vbl_count, scanline_end);
>=20=20
>  	/*

--=20
Jani Nikula, Intel
