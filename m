Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AB3C5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 19:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E4410E196;
	Mon, 24 Aug 2026 19:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="onFQRx/l";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B647410E196
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 19:35:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6B70F40E37;
 Mon, 24 Aug 2026 19:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C1C1F000E9;
 Mon, 24 Aug 2026 19:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787600116;
 bh=kXen7ULLF5S2W/qbCyHUNzOuMuseKVREtRng1a2nZgY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=onFQRx/lWYM7WhHB0JQi//d36RHanMJVXYj0pPlQpS2n3YQlYA7ypSsGw7Ou7N8l0
 sSirf7zkxfnF+CZ+mBDmrjEdi9YmQlQXC0ABcG08SQd66n+Y/Y5C/dMhxuxCtHxXfx
 qwBbz2wTfwpUMQ4l5vs4ZTum2a8QZH7IscShqZnpQw2ZwVQ/kbVQD+AsyHJpXuzD+B
 SxnBOTxjTnXzthMENv8CuBjSXYq1RVBTptrFDkIl3dWbIPW8thm7IqUC5e6/0bN1UJ
 0lyTMrwe3dC12bAcKDsapDlCzjd2uAC2+V3F+p+i/XqEgyMH20bngOIIJQMrKQYsl5
 zJiGriHQ0qeTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] drm/xe/guc: capture additional engine state
 registers
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824184356.1960708-8-naresh.kumar.g@intel.com>
References: <20260824184356.1960708-1-naresh.kumar.g@intel.com>
 <20260824184356.1960708-8-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 19:35:15 +0000
Message-Id: <20260824193516.23C1C1F000E9@smtp.kernel.org>
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
- [Medium] Engine-specific state registers (e.g., BCS_SWCTRL, FF_SLICE_CS_C=
HICKEN1) are incorrectly added to the `COMMON_BASE_ENGINE_INSTANCE` macro, =
causing GuC to attempt invalid MMIO reads on non-matching engine classes.
--

--- Patch [7]: [PATCH v2 7/7] drm/xe/guc: capture additional engine state r=
egisters ---
commit a1d512f9f15bd162d8a7f22264dfc3c44b0fa414
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

drm/xe/guc: capture additional engine state registers

This commit adds a wider set of engine state registers to GuC error capture
to improve post-mortem debugging of engine hangs and reset-related
failures. It defines the missing register offsets and includes them in the
GuC capture list.

> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_=
guc_capture.c
> index 62832bd4af78d..37e7e3d92bfcc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
[ ... ]
> @@ -131,7 +131,25 @@ struct __guc_capture_parsed_output {
>  	{ RING_EXECLIST_STATUS_LO(0),	REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
>  	{ RING_EXECLIST_STATUS_HI(0),	REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXECLIST_=
STATUS"}, \
>  	{ RING_EXECLIST_SQ_CONTENTS_LO(0), REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> -	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXEC=
LIST_SQ_CONTENTS"}
> +	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0, 0, 0, "RING_EXEC=
LIST_SQ_CONTENTS"}, \
> +	{ RESET_CTRL(0),	REG_32BIT, 0, 0, 0,	"RESET_CTRL"}, \
> +	{ RING_CSBEFSM3(0),	REG_32BIT,	0,	0,	0,	"RING_CSBEFSM3"}, \
> +	{ RING_CSFESM(0),	REG_32BIT,	0,	0,	0,	"RING_CSFESM"}, \
> +	{ RING_CSFESM2(0),	REG_32BIT,	0,	0,	0,	"RING_CSFESM2"}, \
> +	{ RING_CSFESM3(0),	REG_32BIT,	0,	0,	0,	"RING_CSFESM3"}, \
> +	{ RING_CSPWRFSM(0),	REG_32BIT,	0,	0,	0,	"RING_CSPWRFSM"}, \
> +	{ RING_CSBEFSM(0),	REG_32BIT,	0,	0,	0,	"RING_CSBEFSM1"}, \
> +	{ BCS_SWCTRL(0),	REG_32BIT,	0,	0,	0,	"BCS_SWCTRL"}, \
> +	{ RING_CSFE_GLB_CHICKEN3(0), REG_32BIT, 0, 0, 0, "RING_CSFE_GLB_CHICKEN=
3" }, \

[Severity: Medium]
Does adding class-specific state registers like BCS_SWCTRL to the
COMMON_BASE_ENGINE_INSTANCE macro cause the GuC to attempt invalid MMIO rea=
ds
on non-matching engine classes?

Reading class-specific registers on all hardware engines could lead to
unclaimed register errors during an error capture on a Video or GSC engine,
which may flood the system logs with warnings.

> +	{ RING_PSMI_CTL(0),	REG_32BIT,	0,	0,	0,	"RING_PSMI_CTL"}, \
> +	{ RING_INSTPS(0),	REG_32BIT,	0,	0,	0,	"RING_INSTPS"}, \
> +	{ RING_BB_ADDR_DIFF(0),	REG_32BIT,	0,	0,	0,	"RING_BB_ADDR_DIFF"}, \
> +	{ RING_BB_STATE(0),	REG_32BIT,	0,	0,	0,	"RING_BB_STATE"}, \
> +	{ FF_SLICE_CS_CHICKEN1(0), REG_32BIT, 0, 0, 0, "FF_SLICE_CS_CHICKEN1" }=
, \
> +	{ CS_DEBUG_MODE1(0),	REG_32BIT,	0,	0,	0,	"CS_DEBUG_MODE1"}, \
> +	{ CS_CHICKEN1(0),	REG_32BIT,	0,	0,	0,	"CS_CHICKEN1"}, \
> +	{ CS_PREEMPTION_STATUS(0), REG_32BIT, 0, 0, 0, "CS_PREEMPTION_STATUS" }=
, \
> +	{ FF_SLICE_CS_CHICKEN2(0), REG_32BIT, 0, 0, 0, "FF_SLICE_CS_CHICKEN2" }

[Severity: Medium]
Are these render-specific registers (FF_SLICE_*) being appended to the comm=
on
base macro?

This might pollute the register list for all engine classes. Should these be
placed in a class-specific list instead to avoid invalid hardware accesses
when non-matching engines hang?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824184356.1960=
708-1-naresh.kumar.g@intel.com?part=3D7
