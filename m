Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953E2CA6004
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 21:19:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5DF10F813;
	Wed,  7 Oct 2026 21:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D9FnpQcO";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C09C10F7F9
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 21:19:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3933260A53;
 Wed,  7 Oct 2026 21:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A141F000FF;
 Wed,  7 Oct 2026 21:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791407967;
 bh=SJNpOaYYNEupsxDPeChhZ9MyR2l8WA1Pb1Ggt+VtBuw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=D9FnpQcOv/s0u8MB7JPUYEoTxFGY6Y3hmxUTFY3cpWXZ2Xi0/Pw/MmriV6QZGlo/p
 A8l03bT4j2Xc0gJ3kd9WjBdfyr8oSEPX8/b46bD/SSfNfyN+2v8JWfj8e+C5PTaTRX
 zFkJrhnTE1pKoqIKbFOhHvCsyyTeW/jBP9QHJkJfEOU13r3uYcUGkqxcQia0CvTmAV
 nwFE+4yjah2siBfmj/6kVbGZvImpb6rlrU+xnvxVWjvLBtnJ658y3/KfIK88i2i1oA
 h+9h67dVRIi0HN2zfllm/d9tmp991JOPTU7KQZ5NXXOwfF0PmpyNzWUTR1Bb+KRtit
 ZpY1O5n+88UMA==
Message-ID: <sashiko-outbox-163385@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/12] drm/xe/vram: Report VRAM errors using
 structured xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261007211417.2093611-13-dnyaneshwar.bhadane@intel.com>
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
 <20261007211417.2093611-13-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 21:19:27 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] xe: structured log location hardcoded to device instead of tile
--

commit 21686fbec5b38511b4c76320b0afbe7eefda858f
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/vram: Report VRAM errors using structured xe_log API

This commit replaces standard DRM log macros with structured xe_log API
functions in xe_vram.c. It intends to update the VRAM initialization path to
correctly report whether a "no CPU visible VRAM" error is at the tile or
device level depending on the caller's context.

> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 2441ffe77edb2..d44a92e97195d 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
[ ... ]
> @@ -254,8 +255,9 @@ static int vram_region_init(struct xe_device *xe, str=
uct xe_vram_region *vram,
>  	vram->io_size =3D min_t(u64, usable_size, remain_io_size);
> =20
>  	if (!vram->io_size) {
> -		drm_err(&xe->drm, "%s without any CPU visible VRAM. Aborting.\n",
> -			tile ? "Tile" : "Device");
> +		xe_log_err_fatal(xe, VRAM, -ENODEV,
> +				 "%s without any CPU visible VRAM. Aborting.\n",
> +				 tile ? "Tile" : "Device");

[Severity: Medium]
Is it possible that passing xe unconditionally here causes the telemetry
metadata to incorrectly tag tile-specific errors as device-level errors?

The xe_log API deduces the structured log location from the pointer type of=
 its
first argument. By passing the struct xe_device *xe pointer unconditionally,
the telemetry location appears to be permanently recorded as a device-level
error, while only the human-readable string receives the tile context.

Could the first argument conditionally pass the tile pointer when it is
non-NULL to fulfill the commit message's intent?

>  		return -ENODEV;
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007211417.2093=
611-1-dnyaneshwar.bhadane@intel.com?part=3D12
