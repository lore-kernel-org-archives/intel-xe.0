Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8742E606A326
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ifrdxa7I
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4997A112AD7;
	Fri, 20 Nov 2026 14:32:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBC810E904;
 Fri, 20 Nov 2026 14:32:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6541960A05;
 Fri, 20 Nov 2026 14:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7445F1F000D2;
 Fri, 20 Nov 2026 14:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795185140;
 bh=acTG5+NGt1dqFk/pmnL80AfSzHSFyZkp1skjFLlmNkI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Ifrdxa7IIPTLrKXW1s8/aGhpz8V9deIzJ2peQp/zFgZAJgaMCUNbz17W4wxYWVlLw
 Qx471uJavyIAHUBbU8ufBd7RHeFGoyMF7fvMFtt7sWP5DFeJn3oLGGJ6aEyDJ1Ydoo
 F+30ttlpPeyWA4cKY/1T6hCnJT3v70gUAVJvN5CweLb2vAAsawyHvdyEC0AUFr0YPG
 569zQq/IEq2sZa88UjshZ6mEgbwSytXCkIyf1fvFLCqoze4yJNP0w2iMF2ld9i1kh+
 AYAohnoZhXDZmzin188RD/XxbcPyks/Q5BQl6DQS9Va3dHPdm0bxvy+o77ijw2NJv6
 ooISffCOtnUFA==
Message-ID: <sashiko-outbox-225381@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/29] drm/i915/hdmi: Split the intel_hdmi_dsc_get_bpp()
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261120140729.466177-2-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
 <20261120140729.466177-2-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 14:32:19 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/i915/hdmi: misleading loop comment left in
  get_dsc_min_max_bpp()
--

commit 4124d2f34b7c42a6bd777db7dfc5a6ab748c239c
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/hdmi: Split the intel_hdmi_dsc_get_bpp()

This commit splits intel_hdmi_dsc_get_bpp() into get_dsc_min_max_bpp() and
get_dsc_compressed_bpp() and updates the comments inside the helpers.

> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/=
i915/display/intel_hdmi.c
> index b6fa1a1558b82..205c55522bca7 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3325,61 +3325,49 @@ intel_hdmi_dsc_get_num_slices(const struct drm_di=
splay_mode *mode,
>  	return target_slices;
>  }
> =20
> -/*
> - * intel_hdmi_dsc_get_bpp - get the appropriate compressed bits_per_pixe=
l based on
> - * source and sink capabilities.
> - *
> - * @src_fraction_bpp: fractional bpp supported by the source
> - * @slice_width: dsc slice width supported by the source and sink
> - * @num_slices: num of slices supported by the source and sink
> - * @output_format: video output format
> - * @bpc: bits per color
> - * @hdmi_all_bpp: sink supports decoding of 1/16th bpp setting
> - * @hdmi_max_chunk_bytes: max bytes in a line of chunks supported by sink
> - *
> - * @return: compressed bits_per_pixel in step of 1/16 of bits_per_pixel
> - */
> -int
> -intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_=
slices,
> -		       enum intel_output_format output_format, int bpc,
> -		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes)
> +static void
> +get_dsc_min_max_bpp(enum intel_output_format output_format, u8 bpc,
> +		    bool hdmi_all_bpp, int *min_dsc_bpp, int *max_dsc_bpp)
>  {
> -	int max_dsc_bpp, min_dsc_bpp;
> -	int target_bytes;
> -	bool bpp_found =3D false;
> -	int bpp_decrement_x16;
> -	int bpp_target;
> -	int bpp_target_x16;
> -
>  	/*
> -	 * Get min bpp and max bpp as per Table 7.23, in HDMI2.1 spec
> +	 * Get min bpp and max bpp that can be supported for a
> +	 * given bpc and output format.
>  	 * Start with the max bpp and keep on decrementing with
> -	 * fractional bpp, if supported by PCON DSC encoder
> +	 * fractional bpp, if supported by the DSC encoder
>  	 *
>  	 * for each bpp we check if no of bytes can be supported by HDMI sink
>  	 */

[Severity: Low]
This isn't a bug, but the second part of this comment describes the
fractional bpp decrement and sink chunk-byte check loop that was moved into
get_dsc_compressed_bpp() below, while get_dsc_min_max_bpp() only computes
the min and max bpp bounds.  The edits to the comments in
get_dsc_min_max_bpp() also drop the HDMI 2.1 Table 7.23 and Section 7.7.34
references that documented where these limits come from.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120140729.4661=
77-1-ankit.k.nautiyal@intel.com?part=3D1
