Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3D4C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 20:24:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32C510E17E;
	Fri, 21 Aug 2026 20:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h8LP96FD";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B6810E17E
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 20:24:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 24093409F7;
 Fri, 21 Aug 2026 20:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA94F1F000E9;
 Fri, 21 Aug 2026 20:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787343860;
 bh=KDg+kHDBw9U69hYBODXSoce662ZpnTL/9hgVAwRaF50=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=h8LP96FDrxlkQWk0HDZ5f7XVh4yjTu57elZAkXpAfqvymN3MT7oOh6Aw2ZG9fUIGt
 hqZ3Ttx+TxWOOiLE6qqVIEYl43jZbvW4rVdFNme2kywVNrBUHROhaWTlF3gC0Pu+/s
 JQ25MD1fkU/dg9X98xtbmOggPNecQGKfoRwD93KxIljHwdgal0nG657h0flrq1tsgx
 nvzQcu06kWMm1XaZgH82jE7IbST2c+DOaR3+1WQuAFYN8DU2zq59PuAOHRZIqcyJHC
 GJCSuF/uHomx7rG4DclmlHSS5GGcY3AfDVLiOTadSZ6Lli4+XbVAiUy9wWG2AvvYaE
 TjGTJbvx7yZbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] drm/xe/xe_oa: Avoid checking and setting fields in
 the OA report
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260821200728.1048699-7-umesh.nerlige.ramappa@intel.com>
References: <20260821200728.1048699-5-umesh.nerlige.ramappa@intel.com>
 <20260821200728.1048699-7-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 20:24:19 +0000
Message-Id: <20260821202419.DA94F1F000E9@smtp.kernel.org>
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
- [Low] The macro `oa_report_header_64bit` becomes unused and is left as de=
ad code.
--

--- Patch [2]: [PATCH 2/3] drm/xe/xe_oa: Avoid checking and setting fields =
in the OA report ---
commit 834ec77b5bb816bced6887fd353db954dc30486c
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/xe_oa: Avoid checking and setting fields in the OA report

This commit removes the workaround that checked and cleared specific fields
in the OA report buffer, as reports can now land out of order. Future patch=
es
will introduce new logic to handle updated reports.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 2e4a89ebf737a..020b27c642268 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -216,42 +216,6 @@ static u32 xe_oa_hw_tail_read(struct xe_oa_stream *s=
tream)
>  #define oa_report_header_64bit(__s) \
>  	((__s)->oa_buffer.format->header =3D=3D HDR_64_BIT)

[Severity: Low]
This isn't a bug, but since oa_report_id(), oa_report_id_clear(),
oa_timestamp(), and oa_timestamp_clear() were removed by this patch, does
this leave the oa_report_header_64bit() macro unused?

> -static u64 oa_report_id(struct xe_oa_stream *stream, u32 report_offset)
> -{
> -	struct iosys_map *map =3D &stream->oa_buffer.bo->vmap;
> -
> -	return oa_report_header_64bit(stream) ?
> -		xe_map_rd(stream->oa->xe, map, report_offset, u64) :
> -		xe_map_rd(stream->oa->xe, map, report_offset, u32);
> -}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821200728.1048=
699-5-umesh.nerlige.ramappa@intel.com?part=3D2
