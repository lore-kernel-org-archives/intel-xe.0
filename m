Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090C7C61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 14:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AE710E2AE;
	Wed, 26 Aug 2026 14:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l58fNuI3";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034DD10E2C3
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 14:08:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DFDFE40988;
 Wed, 26 Aug 2026 14:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF041F000E9;
 Wed, 26 Aug 2026 14:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787753310;
 bh=rFqeWEAbNmhcWxkKzmn4pRrcc4RqBggBrwn2CNNDtT0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=l58fNuI3cz9NRu++t49Ls/Kb3QLkPgoMbe0Fx/pPQiZtkzXNg19JvLmfHxcH3hwTq
 JI89bTbvq37ldKHO0SYzOqlxD6Fg5axEwqsCXyxYCOsgozpxzj4UkQ8I6iJg3RvWkO
 SJx3EVblk1j5lmCuarMAvev7FjiQM9C+ZCJ9Cy53S/g83rVBw7MhueiCb+zSd2vUMh
 HXrjSYe7L7GNiyJPud183gtD1ayh+OBSZUF2QqhQUo4xVuyehCNazVWw0iuWGKU6n8
 7P4+x/Y+jjWmkkoVtgnGtfVjUwNM5bKo1UjwuwBamx8/h44Km6XxjA62NoqujWD+HE
 tgIqgmDQeVHmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V18 11/14] drm/xe/vram: Check bad_page_reservation
 policy in fault handler
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260826135136.204044-27-tejas.upadhyay@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-27-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 14:08:30 +0000
Message-Id: <20260826140830.9FF041F000E9@smtp.kernel.org>
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
- [High] Page reservation is unconditionally disabled on non-Crescent Islan=
d platforms (like PVC), silently ignoring configfs settings.
--

commit e2ecbfdccfac5cd8843020d324241d927ec0f055
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/vram: Check bad_page_reservation policy in fault handler

This commit adds a check for the cached bad_page_reservation policy in the
VRAM address fault handler. If the policy is disabled, it logs the corrupted
address and returns -EOPNOTSUPP instead of offlining the page.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index b2b6c1bd2c555..24d1347542651 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -864,6 +864,12 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *=
xe, u64 addr)
>  	vram_mgr =3D &vr->ttm;
>  	mm =3D &vram_mgr->mm;
> =20
> +	if (!xe->ras.bad_page_reservation) {
        ^^^^

[Severity: High]
Does this unintentionally disable page reservation on non-Crescent Island
platforms that support RAS?

Because xe_ras_init() only populates xe->ras.bad_page_reservation on
XE_CRESCENTISLAND, the cached value remains false (0) on other platforms li=
ke
PVC. As a result, this check will unconditionally evaluate to true on those
platforms, skipping page reservation and silently ignoring the configfs set=
ting.

> +		drm_err(&xe->drm, "0x%llx is reported as corrupted address by HW\n",
> +			addr);
> +		return -EOPNOTSUPP;
> +	}
> +
>  	/* Reserve page at address */
>  	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_m=
gr, mm);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826135136.2040=
44-16-tejas.upadhyay@intel.com?part=3D11
