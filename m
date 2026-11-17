Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12720606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PfCHvOG1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C1710E1D8;
	Tue, 17 Nov 2026 15:09:25 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E84889BE8;
 Tue, 17 Nov 2026 15:09:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 378C643C40;
 Tue, 17 Nov 2026 15:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5BEF1F000C6;
 Tue, 17 Nov 2026 15:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794928159;
 bh=MbRPfuQhmJBtJ3xls+7kZycnTp4jpYyXnuMa2kgefOw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=PfCHvOG18E49luQSwWSw7mE4gUXkMMB09053tn8rODlxUdEE1HuLb+PB68f77f0Vy
 +jqrq7qrp/5FQUd9P/n3aMBnkiYbdPbMMjFpM5wLs+o+VWXCTpWrfr843gVnka6DSM
 MmxGkEbt4svRbq8vmpcApBn8BF4+XBbdFFffZaYBB/IM3bxZeS3vAToOrSn5JFyLyK
 wMq+/c7IFy11leOsrNxJ0yQQ3ebJc9eGm5gqs7B/O2PnhXGxATS/uZoVq8DYwwzrm5
 Nt5AD+MMfxxZG7n9gnJaXJat/6qHXvPZnJ/C+sZkdLY7tyvgeCrW+sd120MtLSn5gD
 DnuzIug41WIcA==
Message-ID: <sashiko-outbox-219022@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] HACK: Always fallback
To: "Maarten Lankhorst" <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20261117143038.479557-11-dev@lankhorst.se>
References: <20261117143038.479557-7-dev@lankhorst.se>
 <20261117143038.479557-11-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 15:09:18 +0000
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

commit 8d3266f209006e137bb998d9c4625324bf01b453
Author: Maarten Lankhorst <dev@lankhorst.se>

HACK: Always fallback

This commit adds an unconditional false return in
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
Was this temporary debugging patch meant to be dropped before submission?

Returning false unconditionally leaves the stolen->size check below as
unreachable code and causes initial_plane_bo() to always discard the BIOS
initial framebuffer in stolen memory on integrated platforms when
CONFIG_FRAMEBUFFER_CONSOLE and CONFIG_DRM_FBDEV_EMULATION are enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117143038.4795=
57-7-dev@lankhorst.se?part=3D4
