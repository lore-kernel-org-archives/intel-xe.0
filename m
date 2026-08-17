Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CCCC5DF70
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 09:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6579610E6FD;
	Mon, 17 Aug 2026 09:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AjIMaiZk";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1607110E18A;
 Mon, 17 Aug 2026 09:49:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 72C83410B6;
 Mon, 17 Aug 2026 09:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD271F000E9;
 Mon, 17 Aug 2026 09:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786960148;
 bh=F6mQKUcnNC5REDC2YDt7brh+DZi+LT2h+3Sxlcw48u0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=AjIMaiZkg3iPPRpDMA+3DC8JkwKCHfNjpzA4J9C8tRu0wvb0kIQJRFdaBpIE0luia
 Wk/5cowMM27VQlyzU5tldCvYqoopJg0e0iLA1jbw/wbhM+KOIEMbAvwYQCDCyGRfFH
 nG/aY/rU8dD5FAqhRsCnULiq131r2qY26cNd4dMVasG0dKmoKpMaT5sfxLzidBTNUT
 VG9XbEMUYlCZtZJeJsOSiSdb1HWJU8572S7xUezIhHDWiR5pgduV6MHVI9ocItsOK4
 8kkm84zzbBh5iHuQGSmA/lBHmh6zHPWRrXZr+Vol44UaxpFLYk1choYznarOnExBW4
 CYIjCbKOZ8Pjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] drm/i915/display: add a way to restore only
 display/pch registers in clock_gating
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260817092911.342072-5-luciano.coelho@intel.com>
References: <20260817092911.342072-1-luciano.coelho@intel.com>
 <20260817092911.342072-5-luciano.coelho@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 09:49:07 +0000
Message-Id: <20260817094908.1FD271F000E9@smtp.kernel.org>
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
- [High] Replacing `intel_clock_gating_init()` with `intel_display_restore_=
clock_gating()` in `hsw_disable_pc8()` causes GT and uncore clock gating wo=
rkarounds to be permanently lost after runtime suspend on Haswell and Broad=
well.
--

--- Patch [4]: [PATCH v3 4/5] drm/i915/display: add a way to restore only d=
isplay/pch registers in clock_gating ---
commit d0464f11c51adf2ddadf337dda54d674de543139
Author: Luca Coelho <luciano.coelho@intel.com>
drm/i915/display: add a way to restore only display/pch registers in clock_=
gating

This commit introduces intel_display_restore_clock_gating() to isolate disp=
lay
and PCH register restoration from core i915 clock gating initialization. It
updates hsw_disable_pc8() to use this new function instead of the broader
intel_clock_gating_init().

> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers=
/gpu/drm/i915/display/intel_display_power.c
> index 0ebec6e0c2400..aab934f435308 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c

[ ... ]

> @@ -1588,7 +1588,7 @@ static void hsw_disable_pc8(struct intel_display *d=
isplay)
>  	intel_init_pch_refclk(display);
> =20
>  	/* Many display registers don't survive PC8+ */
> -	intel_clock_gating_init(display->drm);
> +	intel_display_restore_clock_gating(display);
>  }

[Severity: High]
Does replacing intel_clock_gating_init() with
intel_display_restore_clock_gating() here cause GT and uncore clock gating
workarounds to be permanently lost after runtime suspend on Haswell and
Broadwell?

When the hardware enters PC8 during runtime suspend, it loses uncore and GT
register state. Upon system wake, hsw_disable_pc8() is called in the resume
path. Bypassing the core intel_clock_gating_init() seems to leave the GT
workarounds unrestored.

Could this lead to subsequent GPU workloads executing with missing
workarounds, potentially causing GPU hangs or system instability under load?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817092911.3420=
72-1-luciano.coelho@intel.com?part=3D4
