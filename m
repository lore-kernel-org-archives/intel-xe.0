Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD08C61DFD
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 22:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5762A10E32B;
	Mon, 31 Aug 2026 22:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Efw5YXP+";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF3910E2B2;
 Mon, 31 Aug 2026 22:28:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id CAF9840325;
 Mon, 31 Aug 2026 22:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F45F1F000E9;
 Mon, 31 Aug 2026 22:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788215285;
 bh=GVQ71hd9ADIylzmj4ommajoL9UHG4dCqRUQ37VecFlU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Efw5YXP+ozDvo+5IJIRon+NrjxWuHXB6KPkmtGm7rfRyW73FrAErOOvxqYls2i3Fh
 8AVr+zUHB1oiMleRaMtV8IQsadPHTqiG8bk41KiG/TFQzrjebIC+cYbvS9rP9eJNeJ
 Yl/mj92f/LCH/gmW3S5kpO5jiqquncD0NLexIhR1Ir0/6w5I7mLrVWmLa7V9hXvQCQ
 fTZs50wcD9U1CfqLiQxX3sBUr7HFYF/IGcgOnbZjkkpBmDBgCwg87flmsoPxv75MEE
 aqEniZwHtRYDX15ox1fXs9EXJjCEWv6S+0OXts0xN8GPeyM93vb/WW6WYKf3X65gwG
 +wr4jEmd2d+yA==
From: sashiko-bot@kernel.org
Subject: Re: [v4 4/4] drm/i915/display: Gate periodic AS SDP skip frames
 behind a module parameter
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260831213421.1804635-5-uma.shankar@intel.com>
References: <20260831213421.1804635-1-uma.shankar@intel.com>
 <20260831213421.1804635-5-uma.shankar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 22:28:05 +0000
Message-Id: <20260831222805.8F45F1F000E9@smtp.kernel.org>
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
- [Medium] The 'periodic_assdp_enable' module parameter is defined with a w=
ritable sysfs permission (0600) instead of the required read-only permissio=
n (0400), creating a broken runtime interface.
--

commit 717499623e1a0ce1f0b28267e96deb4b7a335eaf
Author: Uma Shankar <uma.shankar@intel.com>

drm/i915/display: Gate periodic AS SDP skip frames behind a module parameter

This commit introduces a new module parameter, periodic_assdp_enable, to
control periodic Adaptive-Sync SDP skip frames for Panel Replay. The
parameter defaults to false and uses the intel_display_params
infrastructure.

> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/driver=
s/gpu/drm/i915/display/intel_display_params.c
> index 2aed110c5b090..a845d29610cf1 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
[ ... ]
> @@ -139,6 +139,12 @@ intel_display_param_named_unsafe(enable_dmc_wl, int,=
 0400,
>  	"(-1=3Duse per-chip default, 0=3Ddisabled, 1=3Denabled, 2=3Dmatch any r=
egister, 3=3Dalways locked) "
>  	"Default: -1");
> =20
> +intel_display_param_named_unsafe(periodic_assdp_enable, bool, 0600,

[Severity: Medium]
Does this parameter need to be writable (0600) at runtime?

Since global module parameters are copied to display->params during driver
initialization, changing this value via sysfs at runtime doesn't appear to
take effect on active displays.

Should this be read-only (0400) like the other intel_display_params to
prevent creating a misleading sysfs interface?

> +	"Enable periodic Adaptive-Sync SDP (AS SDP skip frames) for Panel Repla=
y "
> +	"to drive the panel down to its minimum refresh rate "
> +	"(0=3Ddisabled, 1=3Denabled) "
> +	"Default: 0");
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831213421.1804=
635-1-uma.shankar@intel.com?part=3D4
