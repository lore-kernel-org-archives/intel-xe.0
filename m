Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E51CA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B181B10E9B4;
	Fri,  9 Oct 2026 10:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P9HBY454";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D955D10E9B4
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 10:50:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9F81443A08;
 Fri,  9 Oct 2026 10:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575671F000FF;
 Fri,  9 Oct 2026 10:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791543024;
 bh=um8WtzbBUgQ/GoCpCM5b+hAhWLGhsM4BBU/LgFJkq4s=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=P9HBY454lydpkSR4RlOogtWQIdNJ1sG4+KgCfccc4naLvHeXByDsx5NQiwplUcSho
 8BmTbeOROt9RlE3M9NRiBuL1bd220pUE/sWOU46/Ayq5bhPETEqbB7Rvrz7FPMjw6F
 q2vYVOciQIvkqKpEl4Vo7bMgaSf8uptFekzZm9m4aV5iJNUc4N89Sz1ZtYA0RI6Lm/
 ppXUN1+/SyKWbgboEnEZu6r+kuGyaPk4XpwLWpMvGUze2KQqg46dbgQ9s6OwWapTfk
 cfIlqn/lVWjL1jnFWgLzrQjlXtXmPtEy5drTgVtoK45zdPEm31g5cGl19PE+MlICU1
 xKG3FQ258brFQ==
Message-ID: <sashiko-outbox-165275@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/12] drm/xe/xe_ras: Report correctable errors using
 SIGID
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261009104602.1075405-26-badal.nilawar@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-26-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:50:23 +0000
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
- [Medium] xe_ras: WARN on valid XE_RAS_COMP_RESERVED telemetry
--

commit ce7ef0dce322046ec43ef7cd45243457eb7f0974
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/xe_ras: Report correctable errors using SIGID

This commit updates the reporting of correctable RAS errors to use the
xe_log_from helper instead of xe_warn. It introduces mapping functions to
convert RAS severity and components to the appropriate logging types and ID=
s.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -459,8 +467,11 @@ void xe_ras_counter_threshold_crossed(struct xe_devi=
ce *xe,
>  		if (!ras_counter_is_valid(xe, &errors[id]))
>  			continue;
> =20
> -		xe_warn(xe, "[RAS]: %s %s detected\n",
> -			comp_to_str(component), sev_to_str(severity));
> +		xe_log_from(xe, ras_sev_to_cper_sev(severity),
> +			    ras_comp_to_hw_sigid(component),
> +			    ras_comp_to_log_comp(component),
> +			    &errors[id], sizeof(errors[id]),
> +			    "error detected\n");

[Severity: Medium]
Could this trigger a WARN for the XE_RAS_COMP_RESERVED component ID?

Looking at ras_counter_is_valid(), it validates the component using:
in_range(component, XE_RAS_COMP_NOT_SUPPORTED + 1, XE_RAS_COMP_MAX - 1)

Since in_range(val, start, len) evaluates val >=3D start && val < start + l=
en,
passing in component 3 (XE_RAS_COMP_RESERVED) returns true, allowing it to
pass the validity check.

When this reserved component is passed to xe_log_from(), it triggers the
logging subsystem. Because the xe_log macro framework lacks a definition
for HARDWARE, 3, log_component_prefix() falls back to
log_unknown_component_prefix(), which triggers a kernel WARN().

This warning will crash systems configured with panic_on_warn when they
encounter expected or reserved hardware telemetry data. Should we explicitly
filter out reserved component IDs before passing them to the logging framew=
ork?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009104602.1075=
405-14-badal.nilawar@intel.com?part=3D12
