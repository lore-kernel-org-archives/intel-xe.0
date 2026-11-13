Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA40E606A32E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFK+fvIG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F30112487;
	Fri, 13 Nov 2026 12:50:57 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77BA1124A7;
 Fri, 13 Nov 2026 12:50:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6D3BE43C4E;
 Fri, 13 Nov 2026 12:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272A91F000C4;
 Fri, 13 Nov 2026 12:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794574250;
 bh=0NFqKVZiDt+VV7E1ZFWnr6ru6mVckrzTxZFUyCmj2/o=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=XFK+fvIGZTcBx4ikRku1nuOQmeddISbJzfWEgBxsXi2AZf/RIe2/OlzZAD0uVKEzF
 GFwH+i43aM83kmFvCS096Tu2fzXpK3vtck0Y74v9NN4iwqZhMxextfGcOsTblRoifG
 kI5WBQ9AUv4Lf5jNfe6GjRVvzoDIFq484Hgv4JctcHDMKaTfN3VxFgPIx9UoHMHAsj
 jDRV/O3v5JYCHnpL8znNvEGsge1Y1CcVx95jNzKuaoO8yga2d1Ml5yY4TVnuU1fGSX
 YcEAqJ/IB3+PO4Wmh9RsOGxPu0+Dv4R7xYxI6qbKEhzfZQHzB3ah0eYJMcbsGPNHp8
 s6Thj5fA93Llw==
Message-ID: <sashiko-outbox-212788@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/5] HACK: Always fallback
To: "Maarten Lankhorst" <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20261113124453.144408-11-dev@lankhorst.se>
References: <20261113124453.144408-7-dev@lankhorst.se>
 <20261113124453.144408-11-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 12:50:49 +0000
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

commit 197e9b8f5e53e32742d9ef6f6fe6fad7574e57e8
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

[Severity: Medium]
Was this temporary debugging change left in the series by mistake?

Returning false unconditionally here makes the stolen->size check below
unreachable, renders the preceding platform and workaround checks
redundant, and causes initial_plane_bo() to always discard the initial
BIOS framebuffer on integrated platforms when CONFIG_FRAMEBUFFER_CONSOLE
and CONFIG_DRM_FBDEV_EMULATION are enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113124453.1444=
08-7-dev@lankhorst.se?part=3D4
