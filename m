Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF07C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 11:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DA910F54A;
	Thu,  3 Sep 2026 11:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cctv+DSd";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965ED10F54A
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 11:50:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 828846022D;
 Thu,  3 Sep 2026 11:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4331F000E9;
 Thu,  3 Sep 2026 11:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788436239;
 bh=/HqkYKCpZGUmbn8nCElcTE4mUuMEe+Qxlgr1TPbydyU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Cctv+DSddsycEEX4D+vPQSk2QBBVxP6N/hVK8B3KPxUv3Gqv/9EX4VvRqbRCnNT6U
 WkA0RWdffE1c6R1kXPnq6txUyaXqmPAY3gaYMGDUkHaiKoSyJSM/S8Dyk03pHCoaCV
 7Sjp/ncQ2P3fxR6MHlsfgSXH+3RI4+DicFprtKzxHVqsUfFUotRF8UgUZTbY0IuZil
 EDsjX/QbkWhivWMYQ4JFUZxjvMCKY3Fpnz4X0riHFvANApjKgx2BnsaFqxEbLpOcAm
 lZIYlUf1v0wNAgDtDlurqnuA69r+LzLJOAndZRD6xHMnleL5lPVUMBbfER0tXbgzlr
 +P2Q4nJtfaaLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe: Flush LSC untyped L1 dataport cache after
 rcs/ccs batches
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903114552.48634-1-thomas.hellstrom@linux.intel.com>
References: <20260903114552.48634-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 11:50:38 +0000
Message-Id: <20260903115039.0D4331F000E9@smtp.kernel.org>
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

Pre-existing issues:
- [High] Unmitigated cross-process information leak via L1 dataport cache o=
n MTL platforms.
--

commit 9a1c38c27d115c29ae7f3e8c47d4fe8e892e8d64
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/xe: Flush LSC untyped L1 dataport cache after rcs/ccs batches

This commit introduces an explicit flush of the LSC untyped L1 dataport cac=
he
via PIPE_CONTROL in emit_render_cache_flush() for Xe2 and later platforms. =
It
addresses an issue where the L1 dataport cache was not reliably coupled to =
the
HDC Pipeline Flush starting from MTL. By explicitly setting this bit on
GRAPHICS_VERx100(xe) >=3D 2000, it aims to prevent stale data leaks when me=
mory
is reclaimed.

Link: https://gitlab.freedesktop.org/mesa/mesa/-/commit/7c2ff46a4fc3e537573=
ac9503057e0cd29b6fff3
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/8909

> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_rin=
g_ops.c
> index 39a670e91ba72..08b4a4283e96a 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
[ ... ]
> @@ -220,6 +221,16 @@ static int emit_render_cache_flush(struct xe_sched_j=
ob *job, u32 *dw, int i)
>  				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
> =20
>  	flags0 =3D PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
> +	/*
> +	 * Prior to MTL, HDC Pipeline Flush reliably also flushes the LSC
> +	 * untyped L1 dataport cache, provided HDC_CHICKEN0 is programmed
> +	 * correctly. Starting with MTL that coupling no longer holds
> +	 * regardless of how HDC_CHICKEN0 is programmed, but explicitly
> +	 * requesting the flush via PIPE_CONTROL is itself only reliable
> +	 * from Xe2 onward, so only gate it in on Xe2+.
> +	 */
> +	if (GRAPHICS_VERx100(xe) >=3D 2000)
> +		flags0 |=3D PIPE_CONTROL0_UNTYPED_DATAPORT_CACHE_FLUSH;

[Severity: High]
This isn't a bug introduced by this patch, but does this condition leave
MTL platforms vulnerable to a cross-process information leak?

Since GRAPHICS_VERx100(xe) < 2000 for MTL platforms, they will not receive
the L1 dataport cache flush here. If the command streamer (CS) flush is
unreliable on MTL, does this mean sensitive data can still be read from the=
 L1
cache by another process after memory is reclaimed or evicted?

If the PIPE_CONTROL method cannot be relied on for MTL, is an alternative
mitigation strategy, such as dummy shaders or MMIO-based flushes, needed to
fully resolve the vulnerability on those platforms?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903114552.4863=
4-1-thomas.hellstrom@linux.intel.com?part=3D1
