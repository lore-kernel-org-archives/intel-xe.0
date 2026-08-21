Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81B3C5DF94
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 22:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6339110F3D6;
	Fri, 21 Aug 2026 22:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cKLHAyb1";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E204D10F3D6
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 22:34:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DE86F600E2;
 Fri, 21 Aug 2026 22:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429891F000E9;
 Fri, 21 Aug 2026 22:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787351642;
 bh=YazBSpVmmKIdVLc2FB+gsNHTr72qAK0Jg1h1MVNKnTE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=cKLHAyb1tmgxVHGatze9Q2vVdvIVhB8kMoiBSvqTmEFjBEFHGXvh+PWDRNgkeKIqe
 iqtskl3MG3W/PtvK+YmuDEZC9m4+4mBNlh8XSJpAPmTnQB0ou5ge+FEVdVE1Pi5mCe
 SDhloDQ/aTL7ifAonJgHy6/nx7LM8ZKN7jdM9EqEZVkfv3q+QaGAm5e1jJEPw97WTV
 YPwusnrN2hhTnBPgtjhivAFWM35ZLbVUnM7VX3ViNBcwiOFkEpNie5jtNAPhUO1phG
 ByUSKeMcRkRieLrjDmiGpdOEhj3zkHR8TqJE7VJ+9rCbJtxmNl9Yf9Smbvp3osFtzm
 0FnJtIAm6g0qQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] drm/xe/xe_oa: Avoid checking and setting fields in
 the OA report
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260821222338.1053887-7-umesh.nerlige.ramappa@intel.com>
References: <20260821222338.1053887-5-umesh.nerlige.ramappa@intel.com>
 <20260821222338.1053887-7-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 22:34:01 +0000
Message-Id: <20260821223402.429891F000E9@smtp.kernel.org>
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
- [Low] The macro `oa_report_header_64bit` is left defined but is completel=
y unused after its only callers were removed.
--

--- Patch [2]: [PATCH 2/3] drm/xe/xe_oa: Avoid checking and setting fields =
in the OA report ---
commit 9f3ae8f0c5df0b654cf91ffc53ef86db9e3704fb
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/xe_oa: Avoid checking and setting fields in the OA report

This commit removes the workarounds that check and set fields in the OA
report to determine if it has landed in memory. It removes several helper
functions that read and clear these fields because parts of the report may
land out of order under heavy workloads.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 2e4a89ebf737a..020b27c642268 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -216,42 +216,6 @@ static u32 xe_oa_hw_tail_read(struct xe_oa_stream *s=
tream)
>  #define oa_report_header_64bit(__s) \
>  	((__s)->oa_buffer.format->header =3D=3D HDR_64_BIT)
> =20

[Severity: Low]
Is this macro still needed? It looks like its only callers (oa_report_id,=20
oa_report_id_clear, oa_timestamp, and oa_timestamp_clear) were removed by=20
this patch, leaving this definition as dead code.

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821222338.1053=
887-5-umesh.nerlige.ramappa@intel.com?part=3D2
