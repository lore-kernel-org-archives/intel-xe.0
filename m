Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C495F606A335
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 13:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RbjkjsoY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C22110F14E;
	Mon, 16 Nov 2026 13:25:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C171C10F024;
 Mon, 16 Nov 2026 13:25:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7CCB4456B1;
 Mon, 16 Nov 2026 13:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360F21F000C6;
 Mon, 16 Nov 2026 13:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794835546;
 bh=5ups8s5rmjRuTFmOxHQ9nlSUJ3Ow8SObGZ09q76jlGw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=RbjkjsoYCCJP/AX0V3DzVx97NA7C2B2kh7N1/EnVAc9kElhHnPMk7a+JJ7xQonJZh
 UXsEh6/O3WeMhUdMcLCpQCYn0XbWlg7bhwjgBghd1C1DvsD/0pqrL2GtMnbrayOXBw
 bdHvegReGdg59WcTwa1EmaZiQgB0t+CRPFVmzLI1+fUCsYv2P6VGqTC40Kib8pzRk5
 /BRjaAGtoJX2B1vZSmwaip9XekAGtx91VOiZtYdgTYIi7Fh+3RYKk7J59wjRTXs5lv
 9jF7H4D332AanRwQDkk6mhoe1M590Az+q1f06iFCnXH0WtNu95palD3lXLwHV+PjRD
 NYCRS5D1GraPg==
Message-ID: <sashiko-outbox-217070@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/5] HACK: Always fallback
To: "Maarten Lankhorst" <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20261116131349.333818-11-dev@lankhorst.se>
References: <20261116131349.333818-7-dev@lankhorst.se>
 <20261116131349.333818-11-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 13:25:45 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/xe/display: debug return false in
  xe_display_bo_fbdev_prefer_stolen()
--

commit a1da7ff8add8fa250f010995ce2e3a96fd7d5b05
Author: Maarten Lankhorst <dev@lankhorst.se>

HACK: Always fallback

This commit adds an unconditional return false to
xe_display_bo_fbdev_prefer_stolen().

> diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c b/drivers/gpu/drm=
/xe/display/xe_display_bo.c
> index 9385026a80b97..d78d893210c4f 100644
> --- a/drivers/gpu/drm/xe/display/xe_display_bo.c
> +++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
> @@ -142,6 +142,8 @@ bool xe_display_bo_fbdev_prefer_stolen(struct xe_devi=
ce *xe, unsigned int size)
>  	if (XE_DEVICE_WA(xe, 22019338487_display))
>  		return false;
> =20
> +	return false;
> +
>  	/*
>  	 * If the FB is too big, just don't use it since fbdev is not very
>  	 * important and we should probably use that space with FBC or other

[Severity: Medium]
Was this temporary debug patch left in the series by mistake?

Returning false unconditionally makes the remaining stolen memory size
check unreachable and causes initial_plane_bo() to always discard the
BIOS framebuffer from stolen memory on integrated GPUs when
CONFIG_FRAMEBUFFER_CONSOLE and CONFIG_DRM_FBDEV_EMULATION are enabled,
while logging a misleading message:

drivers/gpu/drm/xe/display/xe_initial_plane.c:initial_plane_bo() {
    ...
		if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
		    IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION) &&
		    !xe_display_bo_fbdev_prefer_stolen(xe, plane_config->size)) {
			drm_info(&xe->drm, "Initial FB size exceeds half of stolen, discarding\n=
");
			return NULL;
		}
    ...
}

After commit "drm/i915: Introduce intel_bo_fbdev_bios_fb_takeover()",
this also forces xe_display_bo_fbdev_bios_fb_takeover() to always
allocate a new system memory BO and copy the BIOS framebuffer instead of
keeping eligible framebuffers in stolen memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116131349.3338=
18-7-dev@lankhorst.se?part=3D4
