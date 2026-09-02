Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77CCC624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 16:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D91E10E035;
	Wed,  2 Sep 2026 16:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KvdMOJfY";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8940810E035
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 16:48:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 267C9409C6;
 Wed,  2 Sep 2026 16:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9C51F000E9;
 Wed,  2 Sep 2026 16:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788367704;
 bh=aoBU6bKXIEYqDj7ESzpH1r+U6Q56ky6fFcL/XOfg1GE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=KvdMOJfYL9j0xOgDd8E8R8YbiRqg1cpgkHOE2gDi4nz883rgn+v6D81lhbVdajaCe
 1gOvyMj/G7+29isbWVFoAFkgUAY38t04OU7/WX4Wa0oC3Fm701yhbBW2CD9lJ0u/Ef
 W9gK8Qu+d5mov2ARPx5oJySB8HZm2lPQ1iZLVZAITyAJUlsqJPapMQMhzgPeK0N9Iw
 MPLHulOo+nJQDbMpCYXokDMW/VfHv7gMxV3DDP2i9xnjCEvlfMk7Ww5wwoa2Ff3KZr
 b36kueiFEOdZy9vnvwPPpSn7UfZxJ5zoxXEsTbAKSkvxI9MRAYNhJxiaQeEIWHPffG
 iyRT5NHbJrG0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V20 12/15] drm/xe/vram: Check disable_vram_page_offline
 policy in fault handler
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260902145343.465686-29-tejas.upadhyay@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-29-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 16:48:23 +0000
Message-Id: <20260902164823.DD9C51F000E9@smtp.kernel.org>
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
- [Medium] Unratelimited error logging in the VRAM address fault handler ca=
n cause dmesg flooding and DoS.
--

commit 5bfee849427fab2b54c95eec2934afe083fd4e87
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/vram: Check disable_vram_page_offline policy in fault handler

This commit introduces a check in the VRAM address fault handler to verify =
the
disable_vram_page_offline policy. If enabled, it logs the corrupted address
and returns -EOPNOTSUPP so that RAS can report it without attempting to off=
line
the page.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index 0ab92bc3c6998..00569c5279a83 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
[ ... ]
> @@ -906,6 +907,12 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *=
xe, u64 addr)
>  	vram_mgr =3D &vr->ttm;
>  	mm =3D &vram_mgr->mm;
> =20
> +	if (xe->ras.disable_vram_page_offline) {
> +		xe_err(xe, "0x%llx is reported as corrupted address by HW\n",
> +		       addr);

[Severity: Medium]
Since this page is intentionally kept online and not offlined, can a corrup=
ted
VRAM page accessed in a tight loop by a userspace application, or polled
continuously by the hardware, cause a log flood here?

Could this use a rate-limited logging function to prevent a potential local
Denial of Service (DoS) from continuous dmesg writes, especially on systems
with serial consoles?

> +		return -EOPNOTSUPP;
> +	}
> +
>  	/* Reserve page at address */
>  	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_m=
gr, mm);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902145343.4656=
86-17-tejas.upadhyay@intel.com?part=3D12
