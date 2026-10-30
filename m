Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE95A606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 07:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PCxh1Rpm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3395112673;
	Fri, 30 Oct 2026 07:29:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A2010E224;
 Fri, 30 Oct 2026 07:29:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A2E0E43631;
 Fri, 30 Oct 2026 07:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3C51F000C1;
 Fri, 30 Oct 2026 07:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793345363;
 bh=Ka4P//efFfNsqRsPE3g6tPA0wgR9sW8OtgjMU1d9D/w=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=PCxh1RpmXFM+ARL3G0eC5MkELsb+nStjwZxsI7LorvUPrlXomGClEhXk/tFM48Uxu
 mUgy4KeEcPC5QIZXhD2NsYae34Ep0Ba9WfpCdMQk7aogRpXoYOIWnTPZtp1Mw3xShZ
 3in4h4ZfDfSZp36rMkxrTM9IbYTuxr1F66DH1lnR/Y8A2vFIsXX0M0S0qfoLAA6rqv
 y44D5ZYw6k/OFA7hTa7VMKgWhghdentWoczIa0mM60Eg7T706nlkDX3Bxx1QjeH9ou
 7TeehXIHp1erwsYucxtX4tRKAN21961bg/P6dF22v8Rf/8pd1xdsXyGWl+dSdNjT4c
 zXRYPgE+KFmqw==
Message-ID: <sashiko-outbox-190645@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/i915/psr: Re-arm PSR after flush
To: =?utf-8?b?Sm91bmkgSMO2Z2FuZGVy?= <jouni.hogander@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261030070613.181026-2-jouni.hogander@intel.com>
References: <20261030070613.181026-1-jouni.hogander@intel.com>
 <20261030070613.181026-2-jouni.hogander@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 07:29:22 +0000
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
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_PDS_OTHER_BAD_TLD autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/i915/psr: intel_psr_flush() skips clearing CFF mode on goto =
rearm
--

commit 20b1d38e0909a20d9dfca4fb8669f52c75597fb1
Author: Jouni H=C3=B6gander <jouni.hogander@intel.com>

drm/i915/psr: Re-arm PSR after flush

This commit moves the PSR work queuing check from _psr_flush_handle() to a
new rearm label in intel_psr_flush() so that an ORIGIN_FLIP flush clearing
the last busy frontbuffer bits still re-arms PSR when it is inactive.

> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i=
915/display/intel_psr.c
> index 00d0146b26002..7083be05b6299 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -3679,9 +3679,6 @@ static void _psr_flush_handle(struct intel_dp *inte=
l_dp)
>  		 */
>  		intel_psr_force_update(intel_dp);
>  	}
> -
> -	if (!intel_dp->psr.active && !intel_dp->psr.busy_frontbuffer_bits)
> -		queue_work(display->wq.unordered, &intel_dp->psr.work);
>  }
> =20
>  /**
> @@ -3728,14 +3725,18 @@ void intel_psr_flush(struct intel_display *displa=
y,
>  		    (origin =3D=3D ORIGIN_CURSOR_UPDATE &&
>  		     !intel_dp->psr.psr2_sel_fetch_enabled)) {
>  			psr2_dc3co_flush_locked(intel_dp, frontbuffer_bits);
> -			goto unlock;
> +			goto rearm;
>  		}
> =20
>  		if (pipe_frontbuffer_bits =3D=3D 0)
> -			goto unlock;
> +			goto rearm;
> =20
>  		/* By definition flush =3D invalidate + flush */
>  		_psr_flush_handle(intel_dp);
> +
> +rearm:
> +		if (!intel_dp->psr.active && !intel_dp->psr.busy_frontbuffer_bits)
> +			queue_work(display->wq.unordered, &intel_dp->psr.work);

[Severity: Medium]
On platforms with DISPLAY_VER(display) < 20 and psr2_sel_fetch_enabled, can
jumping to rearm on ORIGIN_FLIP leave intel_dp->psr.psr2_sel_fetch_cff_enab=
led
stuck at true after busy_frontbuffer_bits reaches zero?

When a frontbuffer is invalidated on those platforms, _psr_invalidate_handl=
e()
does not call intel_psr_exit() (so intel_dp->psr.active remains true) and
instead enables Continuous Full Frame mode:

drivers/gpu/drm/i915/display/intel_psr.c:_psr_invalidate_handle() {
	if (DISPLAY_VER(display) < 20 && intel_dp->psr.psr2_sel_fetch_enabled) {
		if (!intel_dp->psr.psr2_sel_fetch_cff_enabled) {
			intel_dp->psr.psr2_sel_fetch_cff_enabled =3D true;
			intel_psr_configure_full_frame_update(intel_dp);
		}

		intel_psr_force_update(intel_dp);
	} else {
		intel_psr_exit(intel_dp);
	}
}

If an ORIGIN_FLIP flush in intel_psr_flush() then clears the last bit in
intel_dp->psr.busy_frontbuffer_bits and jumps to rearm, _psr_flush_handle()=
 is
skipped. Because clearing psr2_sel_fetch_cff_enabled remains inside
_psr_flush_handle():

drivers/gpu/drm/i915/display/intel_psr.c:_psr_flush_handle() {
	...
	} else if (intel_dp->psr.psr2_sel_fetch_enabled) {
		/* Selective fetch prior LNL */
		if (intel_dp->psr.psr2_sel_fetch_cff_enabled) {
			/* can we turn CFF off? */
			if (intel_dp->psr.busy_frontbuffer_bits =3D=3D 0)
				intel_dp->psr.psr2_sel_fetch_cff_enabled =3D false;
		}
	...
}

and rearm only queues intel_dp->psr.work when !intel_dp->psr.active,
psr2_sel_fetch_cff_enabled stays true. While it remains true,
intel_psr2_program_trans_man_trk_ctl() returns early on subsequent atomic
commits:

drivers/gpu/drm/i915/display/intel_psr.c:intel_psr2_program_trans_man_trk_c=
tl() {
	...
		if (DISPLAY_VER(display) < 20 && intel_dp->psr.psr2_sel_fetch_cff_enabled)
			return;
	...
}

Should intel_psr_flush() also clear psr2_sel_fetch_cff_enabled (or exit CFF
mode) when busy_frontbuffer_bits becomes 0 on the ORIGIN_FLIP path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030070613.1810=
26-1-jouni.hogander@intel.com?part=3D1
