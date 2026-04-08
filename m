Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D129CFD5F87
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 08:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9472110E4A6;
	Wed,  8 Apr 2026 08:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="G/+kj7mT";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF8C10E4A6;
 Wed,  8 Apr 2026 08:47:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1775638033; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IH5ImjUBZ/W+d482NCi8wus4ECVlXW8/YjqxIRft86+/NdCMxPdytrAD5nzcVLyPMeoiD+M+CdyUkXCONtLiKSlkqwSl7iO6liyjfUASpqHNIRM9Qd5ZHsbheLBrBJpFa/z6J+kDCX9kYwed2LJnZ0oMDWQlfa7Q3g7WvyYAU0Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1775638033;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6+n5MQ/KFQxYt6sVxxnlGjfQ2OKFG8y00oDJJAKLlZY=; 
 b=daACXmGzqcUNMhbWhZqIHjBk56KsJcerfOr6P4zME5IIRj/9zlLrke1fuTk11lW9uVEVx4GHWLhkHEon2q6WYBCre1hv9TApkB2XAlcSl/i7Jnlk08tOE6LIyRJAHuJmg6u0DRH+1DFEqfVVhX2Tfng2ZQvhjEXCQLVVUxyDGS8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775638033; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=6+n5MQ/KFQxYt6sVxxnlGjfQ2OKFG8y00oDJJAKLlZY=;
 b=G/+kj7mTNrqbV3XebLUiTQHQyBQdm0ihGfV8CUmlERbLHSei0A4ZyzZUWHcl3mal
 RA2ATvDjIuo2sofnjic32wgBqqchWz90eDmr6AVBPlH0JzpTyCuPtl22gi6tncdoq+/
 1lcoFm9nU+5O77uTaISss1Esftk1m6SjvAEJgSSg=
Received: by mx.zohomail.com with SMTPS id 1775638030680963.1479540774822;
 Wed, 8 Apr 2026 01:47:10 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: intel-gfx@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH] drm/i915/dp: Don't use DP link min bpp for the FRL link
 bandwidth check
Date: Wed, 08 Apr 2026 10:47:06 +0200
Message-ID: <14398087.O9o76ZdvQC@workhorse>
In-Reply-To: <20260407183015.16256-1-ville.syrjala@linux.intel.com>
References: <20260407183015.16256-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

On Tuesday, 7 April 2026 20:30:15 Central European Summer Time Ville Syrjal=
a wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> intel_dp_mode_min_link_bpp_x16() gives us the min bpp for the
> DP link before the PCON, however intel_dp_mode_valid_downstream()
> is trying to check for sufficient bandwidth on the HDMI FRL link
> after the PCON. So the use of intel_dp_mode_min_link_bpp_x16() here
> is incorrect.
>=20
> Presumably even with FRL HDMI still can't go below 8bpc, so we should
> just use that to give us the minimum required FRL bandwidth. And this
> needs to account for the sink format (for 4:2:0 sub-sampling) since
> that is what will be flowing over the HDMI link.
>=20
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 4955bd8b11d7..31e9b2758499 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1317,6 +1317,15 @@ intel_dp_tmds_clock_valid(struct intel_dp *intel_d=
p,
>  	return MODE_OK;
>  }
> =20
> +static int frl_required_bw(int clock, int bpc,
> +			   enum intel_output_format sink_format)
> +{
> +	if (sink_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR420)
> +		clock /=3D 2;
> +
> +	return clock * bpc * 3;
> +}
> +
>  static enum drm_mode_status
>  intel_dp_mode_valid_downstream(struct intel_connector *connector,
>  			       const struct drm_display_mode *mode,
> @@ -1327,13 +1336,14 @@ intel_dp_mode_valid_downstream(struct intel_conne=
ctor *connector,
>  	enum drm_mode_status status;
>  	enum intel_output_format sink_format;
> =20
> +	sink_format =3D intel_dp_sink_format(connector, mode);
> +
>  	/* If PCON supports FRL MODE, check FRL bandwidth constraints */
>  	if (intel_dp->dfp.pcon_max_frl_bw) {
> -		int link_bpp_x16 =3D intel_dp_mode_min_link_bpp_x16(connector, mode);
> -		int target_bw;
> -		int max_frl_bw;
> +		int target_bw, max_frl_bw;
> =20
> -		target_bw =3D fxp_q4_to_int_roundup(link_bpp_x16) * target_clock;
> +		/* Assume 8bpc for the FRL bandwidth check */
> +		target_bw =3D frl_required_bw(target_clock, 8, sink_format);
> =20
>  		max_frl_bw =3D intel_dp->dfp.pcon_max_frl_bw;
> =20
> @@ -1350,8 +1360,6 @@ intel_dp_mode_valid_downstream(struct intel_connect=
or *connector,
>  	    target_clock > intel_dp->dfp.max_dotclock)
>  		return MODE_CLOCK_HIGH;
> =20
> -	sink_format =3D intel_dp_sink_format(connector, mode);
> -
>  	/* Assume 8bpc for the DP++/HDMI/DVI TMDS clock check */
>  	status =3D intel_dp_tmds_clock_valid(intel_dp, target_clock,
>  					   8, sink_format, true);
>=20

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

At first I was worried we'd run into integer size issues, but as it
turns out the clock here is in kHz, so there's no physical way to
produce an overflow.

Thanks for the quick turnaround on the patch!

Kind regards,
Nicolas Frattaroli


