Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C219CA5FED
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 21:36:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B8710E467;
	Tue,  6 Oct 2026 21:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NE6HV8DD";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A4010E3D4
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 21:36:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3F1F141205;
 Tue,  6 Oct 2026 21:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016B21F0089D;
 Tue,  6 Oct 2026 21:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791322609;
 bh=AV225Yas2r0yr0b7YpAkHECxEuUTCaDbgutAonRf8xw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=NE6HV8DDlX/z83JUPuyhy7da01eOMwFxIDsSvby0KrtSJdcJYFyRFXPcpLdxp2STC
 GB/zUfKGu1+DCuuEkb4/DMPcMuph/5DPPgX+edLYEfxbvDH0vtmuHuLd2BaMOiHP/V
 Z0LyZHRZXTzKhLnHBWP97iQ+2qcwcjJd3YtChonrm+C+H4EkbdblTBLEXDDugyu2iD
 KyoyZO6lyi33kn6QQdpM2xFj/hh4D7y0O2EqIWTM/c0I0wUZbiUCTHBNQaau+3cRJj
 XwA04YpSumuEtByYu6762DL+o7Qv2ddzA3sxEfbDJZ0SVb2SmfGJhuN0O5ExqdVYYD
 1s10NCK9qaUVw==
Message-ID: <sashiko-outbox-162462@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] drm/xe: fixing endless PF range response
To: fei.yang@intel.com
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261006213449.4027749-2-fei.yang@intel.com>
References: <20261006213449.4027749-1-fei.yang@intel.com>
 <20261006213449.4027749-2-fei.yang@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 21:36:48 +0000
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
- [Low] drm/xe: build failure due to hallucinated vma_info field
--

commit 634f5ddbb1931a170d6586933045107086b28191
Author: Fei Yang <fei.yang@intel.com>
Subject: drm/xe: fixing endless PF range response

This commit modifies the page fault queue worker to immediately update the
start and end addresses of a page fault. It also adds assignments to a new
vma_info structure inside the page fault consumer.

> diff --git a/drivers/gpu/drm/xe/xe_pagefault.h b/drivers/gpu/drm/xe/xe_pa=
gefault.h
> index 799c984dee84f..5ce2f6ed10c56 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault.h
> @@ -98,6 +98,7 @@ xe_pagefault_set_end_addr(struct xe_pagefault *pf, u64 =
end_addr)
>  {
>  	pf->consumer.end_addr &=3D ~XE_PAGEFAULT_END_ADDR_MASK;
>  	pf->consumer.end_addr |=3D end_addr;
> +	pf->consumer.vma_info.end_addr =3D end_addr;

[Severity: Low]
Does the consumer structure actually have a vma_info member?

Looking at the definition in drivers/gpu/drm/xe/xe_pagefault_types.h:

struct xe_pagefault {
...
	struct {
		u64 page_addr;
		union {
			struct {
				u8 alloc_state;
...
				u32 id;
			};
			u64 end_addr;
		};
		struct xe_pagefault *next;
	} consumer;
...
};

It appears consumer lacks a vma_info field. Will this code compile, or will
it result in a build error complaining about no member named vma_info?

[ ... ]

> @@ -137,6 +138,7 @@ xe_pagefault_set_start_addr(struct xe_pagefault *pf, =
u64 start_addr)
>  {
>  	pf->consumer.page_addr &=3D XE_PAGEFAULT_ERROR_MASK;
>  	pf->consumer.page_addr |=3D (start_addr & ~XE_PAGEFAULT_ERROR_MASK);
> +	pf->consumer.vma_info.start_addr =3D start_addr;

[Severity: Low]
Similarly, since vma_info doesn't exist in consumer, will this assignment a=
lso
cause a compiler error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006213449.4027=
749-1-fei.yang@intel.com?part=3D1
