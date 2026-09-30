Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B284CA5FC5
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 14:53:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8ED10F430;
	Wed, 30 Sep 2026 14:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAtoVakI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4A110E243;
 Wed, 30 Sep 2026 14:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790780017; x=1822316017;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=5h808ldt3UbTnhE+4b3L0Y8vC90hjPDMWb1Dy842PUA=;
 b=fAtoVakIYwEc3dUHfjWOBNzKvj5PwDf2OJp6aKgwdWSjow6PCSXp19R2
 PP+duHYsUjfymv64VpDOCJxDFqJ/JgiuqJmnPADVaWlb4hQIoTMQrZ2aO
 8NkpB7NoallKBo399OrAMCWtzoB0G2L4Hxiem42qaAFi33QmXqf6uvOtG
 tQ7k7wssKvucseFSZs3n9yaMJx1CB5wszzB15BdfVqmFsr8I4WGR0ndm2
 ommDvNBTz2GRZ0Blf2iUu50CxBFQ5+XRMAv/cOuvfiFezIv8GU8dGTQnz
 47ZcL+yNt9kZ8vULgSN+DKyBDn4Utk/q9YRJpFj01Y8NqHBmHgk7hmhLe Q==;
X-CSE-ConnectionGUID: 4Ygrd/x/QA62aoVazxkxaw==
X-CSE-MsgGUID: Q4Omij1GSd2qeMUXF1ybvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90649219"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="90649219"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 07:53:37 -0700
X-CSE-ConnectionGUID: 0q/1iBcxTwqPJU3VHvsVpw==
X-CSE-MsgGUID: COYvPbxxRGuEP+uKxmYmWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="274825882"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.107])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 07:53:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/i915/dp: Drop using intel_de_read_notrace()
In-Reply-To: <20260930115303.24285-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
 <20260930115303.24285-2-ville.syrjala@linux.intel.com>
Date: Wed, 30 Sep 2026 17:53:33 +0300
Message-ID: <971cd820abef78c947ee66a98b4c1a7a433ec361@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 30 Sep 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> I want to eliminate intel_de_read_notrace() to shrink the
> intel_de.h API a bit. That should help with the cleaning out
> the remaining uncore mess for xe vs. i915.
>
> Furthermore on xe intel_de_read_notrace() doesn't even do
> what it says on the tin, and instead all register accesses
> are traced anyway.
>
> Switch the last users of intel_de_read_notrace()
> (intel_dp_aux_wait_done() and intel_dp_aux_xfer())
> over to the normal intel_de_read().
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_aux.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/dr=
m/i915/display/intel_dp_aux.c
> index 3cb07b0a901c..cd361164ecb8 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> @@ -66,7 +66,7 @@ intel_dp_aux_wait_done(struct intel_dp *intel_dp)
>  	int ret;
>=20=20
>  	if (intel_parent_irq_enabled(display)) {
> -#define C (((status =3D intel_de_read_notrace(display, ch_ctl)) & DP_AUX=
_CH_CTL_SEND_BUSY) =3D=3D 0)
> +#define C (((status =3D intel_de_read(display, ch_ctl)) & DP_AUX_CH_CTL_=
SEND_BUSY) =3D=3D 0)
>  		done =3D wait_event_timeout(display->gmbus.wait_queue, C,
>  					  msecs_to_jiffies_timeout(timeout_ms));
>=20=20
> @@ -324,7 +324,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>=20=20
>  	/* Try to wait for any previous AUX channel activity */
>  	for (try =3D 0; try < 3; try++) {
> -		status =3D intel_de_read_notrace(display, ch_ctl);
> +		status =3D intel_de_read(display, ch_ctl);
>  		if ((status & DP_AUX_CH_CTL_SEND_BUSY) =3D=3D 0)
>  			break;
>  		msleep(1);

Sashiko has a point that there's now an extra trace call below this.

With that fixed,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>



--=20
Jani Nikula, Intel
