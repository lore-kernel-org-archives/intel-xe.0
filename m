Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB84C5DF85
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:22:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A4210EEA1;
	Wed, 19 Aug 2026 19:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J9hAx7jT";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7727310EEA1
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:22:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 603B24180D;
 Wed, 19 Aug 2026 19:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CAD1F000E9;
 Wed, 19 Aug 2026 19:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787167342;
 bh=mE8J7tr54574ftGCu27JwuNfZrTu8oUZcpE1R1MHSeE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=J9hAx7jTWh2yJX2wD1Xfv88uuO9hzSPeE7jvIM4ZbM1ZFz/mBNZcfvbz5E35pTyfM
 TGZa4WcE6dFhf4rDFBrUoSHK7xwHL7HS/IqbsskQe1Iz/CCAF5skHaZNprdjA+kpjA
 JIkkwMwp0xkfE31IgvgvNUqUqWSMwDNVijn/sZq8NwiFYammn4xaZ6nA6Zq78rgHVN
 wLEhBDf14lzMpAFDnhssxCrYLLmISXzlrFCVzmPHFE67O4zvQct0nq/UBG0Tsdhk7h
 7ONMYsOoyj9j6u4p0p2s+5t7knREK2AaNlJCA4b5d9VDMZtXAnJlP2IdiEMsIVAQto
 FYPYfoE7yYYeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/12] drm/xe/pat: Assert pat.ops before dereferencing
 members
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260819191442.1957986-9-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-9-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 19:22:21 +0000
Message-Id: <20260819192222.25CAD1F000E9@smtp.kernel.org>
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
- [High] Ineffective bug fix / Unhandled NULL pointer dereference: The newl=
y added `xe_assert(xe, xe->pat.ops)` does not halt execution, failing to pr=
event the subsequent NULL pointer dereference on `xe->pat.ops`.
--

--- Patch [8]: [PATCH 08/12] drm/xe/pat: Assert pat.ops before dereferencin=
g members ---
commit 621e2fef21f2cbefa89f2639ce18871bffca6aa2
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/pat: Assert pat.ops before dereferencing members

This commit attempts to catch missing PAT tables early by adding an
assertion for xe->pat.ops.

> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index a5fe1beec652d..4331ef097ba0c 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -690,6 +690,7 @@ void xe_pat_init_early(struct xe_device *xe)
>  			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>  	}
> =20
> +	xe_assert(xe, xe->pat.ops);

[Severity: High]
This is a pre-existing issue, but does this xe_assert() actually prevent
the subsequent NULL pointer dereference in xe_pat_init_early()?

The commit message states the assert is meant to catch a missing PAT table
"rather than faulting on the subsequent ops member checks". However,
xe_assert() wraps drm_WARN and does not return or halt execution.

If the driver is booted on an unsupported platform where the table is
missing, the preceding else branch emits an error log but leaves
xe->pat.ops as NULL. The newly added assert will emit a warning on
debug builds, but control flow will immediately fall through to the
next line and still cause a kernel panic by dereferencing the NULL pointer.

Could this function return an error code or bail out early when xe->pat.ops
is missing, instead of relying on an assertion that allows execution
to continue?

>  	xe_assert(xe, xe->pat.ops->dump);
>  	xe_assert(xe, xe->pat.ops->program_graphics);
>  	xe_assert(xe, MEDIA_VER(xe) < 13 || xe->pat.ops->program_media);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819191442.1957=
986-1-dnyaneshwar.bhadane@intel.com?part=3D8
