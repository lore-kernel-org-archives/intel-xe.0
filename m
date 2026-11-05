Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B53606A929
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 16:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5M/VDzv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBE010E314;
	Thu,  5 Nov 2026 16:41:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F341E10E314
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 16:40:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8FD5143F07;
 Thu,  5 Nov 2026 16:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6F61F00A02;
 Thu,  5 Nov 2026 16:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793896855;
 bh=5mnfyAdF6/GabY1phOqb1+3YVoac+LpXPKPXBQk1+nc=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=O5M/VDzvg3SlNTNZFRzvu30F3xsjuTbAP6G4+eHJ/0UXKB+3eEX3NZZyld0IE9t1C
 kyI7ho/jWexXW4YBQqsPj9FN5hyWCUZcx4QGAKkrunpmMPTAjfZ7F9uUo0ivRPP1gd
 YoIoCEdwJEldJQKdEwf6uVlKkwuKjua27Nnz5AC4O3sPkDk6Ss/tZnM85k92x64GcI
 b0IvR5E5TlWeJC7oz48Y64fvhhFhkn52ywvUFE8no1jVTQdayYQjWJINRgmCvz1UXr
 dYjdtcWiqhXNXxGTXMt0Ud19DhGX9yJPV8SbN9fvbqgB60hSKWjY//CuoSJ+4LFFYP
 naHS/PUJlsVrg==
Message-ID: <sashiko-outbox-199515@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] HACK: Always fallback
To: "Maarten Lankhorst" <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261105161444.593259-11-dev@lankhorst.se>
References: <20261105161444.593259-7-dev@lankhorst.se>
 <20261105161444.593259-11-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:40:54 +0000
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
- [Medium] drm/xe/display: debug return false in xe_display_bo_fbdev_prefer=
_stolen()
--

commit 6c3a580cc3d1b156a2c5d921989c5c7a936adda3
Author: Maarten Lankhorst <dev@lankhorst.se>

HACK: Always fallback

This commit adds an unconditional return false to
xe_display_bo_fbdev_prefer_stolen() in the xe display driver.

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

[Severity: Medium]
As reported by Sashiko on v2 [1], is this temporary debugging commit
intended to be dropped before merging?

Adding an unconditional return false in xe_display_bo_fbdev_prefer_stolen()
in drivers/gpu/drm/xe/display/xe_display_bo.c makes the subsequent stolen
memory size check unreachable dead code and renders all earlier checks and
the size parameter unused:

drivers/gpu/drm/xe/display/xe_display_bo.c:xe_display_bo_fbdev_prefer_stole=
n() {
    ...
	if (XE_DEVICE_WA(xe, 22019338487_display))
		return false;

	return false;

	/*
	 * If the FB is too big, just don't use it since fbdev is not very
	 * important and we should probably use that space with FBC or other
	 * features.
	 */
	return stolen->size >=3D (size * 2) >> PAGE_SHIFT;
}

During display initialization on integrated platforms with
CONFIG_FRAMEBUFFER_CONSOLE and CONFIG_DRM_FBDEV_EMULATION enabled,
initial_plane_bo() in drivers/gpu/drm/xe/display/xe_initial_plane.c calls
xe_display_bo_fbdev_prefer_stolen():

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

Because xe_display_bo_fbdev_prefer_stolen() now unconditionally returns
false, initial_plane_bo() always discards the initial BIOS framebuffer with
a misleading log message, and even with the subsequent takeover helper
xe_display_bo_fbdev_bios_fb_takeover() it will always fall back to
allocating a new system memory BO and blit-copying the BIOS framebuffer
instead of keeping it in stolen memory when eligible.

[1] https://lore.kernel.org/r/20260721142610.93804-11-dev@lankhorst.se

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105161444.5932=
59-7-dev@lankhorst.se?part=3D4
