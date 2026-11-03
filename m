Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD88360A2636
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 10:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QxxIuVgo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1E610E4BC;
	Tue,  3 Nov 2026 10:23:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD7C10E4BC;
 Tue,  3 Nov 2026 10:23:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A3FF9601EF;
 Tue,  3 Nov 2026 10:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC751F000C1;
 Tue,  3 Nov 2026 10:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793701391;
 bh=QOL9AbqE5wHUM5+w/xDt9ZDW3SVJ6w7gGUgGy25dvpo=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=QxxIuVgoI7eUymnryxeMDsLG9jhrieN6FWuUz+mRHN7nhWxhdlLHExU4/5JXluySk
 0OPHDo4BV3Lg/7ufLim6jPfZamRT//lQ0/cuQYwpkRL6QmYtYL8rRuW5521/8eEgfP
 ouCRuHEzZbuVnQMZOpdEuJOacl2Ptxm/PdHNIrvMEp+BcYRLSuCo5+CKirNrF9JwuM
 ddwdULQD/mQQCpC+0dz24giyKPjXJ5GYcK0G+nOpKzowIn3KZOFjRGwTafTmRnOIP6
 XgyoN5Bwmhv8XVgWRfFovwQOFQLyYds+Zu4wCIAvp0xtwMi4nKKAFdO1kjOdDmb2Wz
 I5fxHPzvrsoFg==
Message-ID: <sashiko-outbox-195038@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/7] drm/i915/display: Program and enable the DP
 symbol based timing generator
To: "Arun R Murthy" <arun.r.murthy@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261103-vlk-64036-dp-symbol-tg-v4-6-6cf8a588b54c@intel.com>
References: <20261103-vlk-64036-dp-symbol-tg-v4-0-6cf8a588b54c@intel.com>
 <20261103-vlk-64036-dp-symbol-tg-v4-6-6cf8a588b54c@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 10:23:10 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/i915/display: invalid CMTG MMIO write in intel_set_transcode=
r_timings()
--

commit d5e98872efc6064e978436ee34bbcfdf86c29006
Author: Arun R Murthy <arun.r.murthy@intel.com>

drm/i915/display: Program and enable the DP symbol based timing generator

This commit programs and enables the DP link layer symbol based timing
generator, including the 128-bit Data M/N registers, HACT/HTOTAL/CHUNK_SIZE
timing registers, and TRANSCONF configuration and state readout.

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 15117b715e1d5..d450b34b8035a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c

[ ... ]

> @@ -2936,6 +2996,17 @@ void intel_set_transcoder_timings(const struct int=
el_crtc_state *crtc_state,
>  		intel_de_write(display, DP_MIN_HBLANK_CTL(transcoder),
>  			       crtc_state->min_hblank);
>  	}
> +
> +	if (crtc_state->dp_symbol_tg.enable) {
> +		const struct intel_dp_symbol_tg *tg =3D &crtc_state->dp_symbol_tg;
> +
> +		intel_de_write(display, TRANS_LLSYM_HACT(display, transcoder),
> +			       TRANS_LLSYM_HACT_VAL(tg->hactive - 1));
> +		intel_de_write(display, TRANS_LLSYM_HTOTAL(display, transcoder),
> +			       TRANS_LLSYM_HTOTAL_VAL(tg->htotal - 1));
> +		intel_de_write(display, TRANS_LLSYM_CHUNK_SIZE(display, transcoder),
> +			       TRANS_LLSYM_CHUNK_SIZE_VAL(tg->chunk_size));
> +	}
>  }

[Severity: Medium]
Can this write to non-existent CMTG MMIO registers when
intel_set_transcoder_timings() is called for TRANSCODER_CMTG0 or
TRANSCODER_CMTG1?

During modeset and DC state restore on display version 35,
hsw_configure_cpu_transcoder() and intel_cmtg_restore() call
intel_cmtg_set_timings() -> intel_set_transcoder_timings(crtc_state,
cmtg_transcoder) when cpu_transcoder is TRANSCODER_A or TRANSCODER_B on an
eDP output:

drivers/gpu/drm/i915/display/intel_cmtg.c:intel_cmtg_set_timings() {
	enum transcoder cmtg_transcoder =3D to_cmtg_transcoder(crtc_state->cpu_tra=
nscoder);
	...
	if (type =3D=3D LRR)
		intel_set_transcoder_timings_lrr(crtc_state, cmtg_transcoder);
	else
		intel_set_transcoder_timings(crtc_state, cmtg_transcoder);
}

When an eDP panel operates at a 128b/132b UHBR link rate without MSO
splitter, intel_dp_compute_symbol_tg() sets crtc_state->dp_symbol_tg.enable
to true.

Just above this block in intel_set_transcoder_timings(), the
DP_MIN_HBLANK_CTL write checks that transcoder is not a CMTG transcoder:

	if (DISPLAY_VER(display) >=3D 30 &&
	    transcoder !=3D TRANSCODER_CMTG0 &&
	    transcoder !=3D TRANSCODER_CMTG1) {
		intel_de_write(display, DP_MIN_HBLANK_CTL(transcoder),
			       crtc_state->min_hblank);
	}

Without a similar check on transcoder here, _MMIO_TRANS2() translates
TRANS_LLSYM_HACT, TRANS_LLSYM_HTOTAL, and TRANS_LLSYM_CHUNK_SIZE using the
CMTG base offset and writes to unclaimed register offsets 0x6f0dc..0x6f0e4
(or 0x6f1dc..0x6f1e4).

Should this block also check transcoder !=3D TRANSCODER_CMTG0 &&
transcoder !=3D TRANSCODER_CMTG1 before writing the TRANS_LLSYM_* registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-vlk-64036-=
dp-symbol-tg-v4-0-6cf8a588b54c@intel.com?part=3D6
