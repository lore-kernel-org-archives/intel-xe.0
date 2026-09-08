Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF3AC79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 22:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A9410EDD7;
	Tue,  8 Sep 2026 22:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZQZXcpWK";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AD010EDD7
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 22:33:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A783641962;
 Tue,  8 Sep 2026 22:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7C81F00A3A;
 Tue,  8 Sep 2026 22:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788906821;
 bh=+tWZzZ1DZ/W5GbTxSuyQ+cLt/WKDg2O0xXjG0w1QKqg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ZQZXcpWKuHHiOtrP7tEvuJxdrzNRxBpvWu5+s/7Jviq6STm31FUFCGAJI3nRrwe3f
 uZ3l7U3NrBEsm1BuVab+xkkSuYbh/G4zXcFvWVOcBqWMrSba4//PPuK7wUjWyGXeGR
 /fij9e0QHlKcgc5VJoknjsXHOVQyUPiIJYWIzUlDOZURpkwd9PScL5yL1BgMBAtJ7Z
 Ybp9M7y7+EKqkRR5NxkfrMke1PFPfzf+3YR7chercvTtIKU89EHdZGJ93hUDafQiej
 eZcjM05iK228EXYMHsyLNQ8+MY+BQr48qCrYS9gFmNTNiZERPLh1MWXcMgNwbZyPY8
 DCigZ7bq59PxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] drm/xe/xe_oa: Avoid checking and setting fields in
 the OA report
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908222356.1210175-7-umesh.nerlige.ramappa@intel.com>
References: <20260908222356.1210175-5-umesh.nerlige.ramappa@intel.com>
 <20260908222356.1210175-7-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 22:33:40 +0000
Message-Id: <20260908223341.6B7C81F00A3A@smtp.kernel.org>
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
- [Low] The `oa_report_header_64bit` macro is left as dead code after all o=
f its usages are removed.
--

commit 5d5bed5887d7f8c23553a4f7f71318408e15027b
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/xe_oa: Avoid checking and setting fields in the OA report

This commit removes the workaround of checking and clearing OA report fields
to verify if reports have fully landed in memory. It drops helpers like
oa_report_id() and oa_timestamp() since reports may land out of order.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 2353a8c0e6c11..08d6e94f5fcee 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -216,42 +216,6 @@ static u32 xe_oa_hw_tail_read(struct xe_oa_stream *s=
tream)
>  #define oa_report_header_64bit(__s) \
>  	((__s)->oa_buffer.format->header =3D=3D HDR_64_BIT)
> =20

[Severity: Low]
Since all callers of oa_report_header_64bit() (such as oa_report_id() and
oa_timestamp()) are removed in this patch, should the macro definition
itself be removed as well to avoid leaving unused code behind?

> -static u64 oa_report_id(struct xe_oa_stream *stream, u32 report_offset)
> -{
> -	struct iosys_map *map =3D &stream->oa_buffer.bo->vmap;
> -

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908222356.1210=
175-5-umesh.nerlige.ramappa@intel.com?part=3D2
