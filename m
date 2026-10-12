Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A26CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 15:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A615E10E055;
	Mon, 12 Oct 2026 15:58:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0D110E055
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 15:58:10 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3B1ED40DB9;
 Mon, 12 Oct 2026 15:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83C41F0089B;
 Mon, 12 Oct 2026 15:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791820690;
 bh=a5PpxtRQWffeuHsrJveRy0kURVDowyJhIPUFbkQKb7M=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=EMO3KlRR/6UGZk5Y8bkkUe/XJ9wd6M0XcjGp/j1PhI/HCXEsaKe3FjSPeSAAJt0x3
 23jqzsk4l7AW2HdipeWUaTCwsg1U9hAP/PUTaE6qujoNlrAg7RdpNUxea4H+/bTpET
 +5TwamEFKJYEUyjtI3iS1ppuTnOmS+bIAo6xKz65LjrU4tVtFWySg0Idqik6loiGiw
 /ixhgRYa32r3FTLrKXa9C7IOtfkBo96tMKJHYxve48bb8fzTvm5+hZAthMirVm0DGI
 keXtiVuZQDoxeZBfwEDe9qpgfmslFTSFbS311hUqVLCO4qJwkHo3ofwGNo2BsQ4Ssi
 qiFkQgeMQGItQ==
Message-ID: <sashiko-outbox-168370@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: Patch "drm/xe: Fix shrinker accounting double-subtraction on
 nested external pins" has been added to the 7.2-stable tree
To: gregkh@linuxfoundation.org
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <2026101238-calm-footing-389c@gregkh>
References: <2026101238-calm-footing-389c@gregkh>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 15:58:09 +0000
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
- [High] drm/xe: MADVISE on pinned FB double-subtracts shrinker pages
--

commit fd0d0cc5f1317ebe67563e2a71be658497f18472
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Subject: drm/xe: Fix shrinker accounting double-subtraction on nested exter=
nal pins

This commit introduces helpers to ensure shrinker accounting is only updated
on the outermost pin and final unpin transitions. It also excludes imported
dma-bufs from pin/unpin shrinker accounting and updates the framebuffer pin
paths to use these new helpers.

Link: https://patch.msgid.link/20261002100830.12297-2-thomas.hellstrom@linu=
x.intel.com

> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -356,7 +356,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct drm_ge=
m_object *obj, bool is_dpt,
>  		drm_exec_retry_on_contention(&exec);
>  		xe_validation_retry_on_oom(&ctx, &ret);
>  		if (!ret)
> -			ttm_bo_pin(&bo->ttm);
> +			xe_bo_pin_account(bo);

[Severity: High]
Can this new shrinker accounting for framebuffers lead to a
double-subtraction underflow?

When a user creates a BO, maps it (creating a VMA, willneed_count =3D 1), a=
nd
uses it as a display framebuffer, this path calls xe_bo_pin_account() which
subtracts the BO's pages from the shrinkable count. However, FB pinning does
not increment willneed_count to prevent MADVISE transitions while pinned.

If the user then invokes the DRM_IOCTL_XE_VM_MADVISE ioctl to set the BO to
DONTNEED, the willneed_count drops to 0 and xe_bo_set_purgeable_shrinker()
is called. xe_bo_set_purgeable_shrinker() will unconditionally transition
the state and subtract the pages from the shrinkable count again:

xe_bo_set_purgeable_shrinker() {
        /* Transfer pages from shrinkable to purgeable count */
        xe_shrinker_mod_pages(xe->mem.shrinker, -tt_pages, tt_pages);
}

Since the count is stored as a signed long but added to an unsigned long
total in xe_shrinker_count(), dropping below zero causes an enormous
positive value. Could this cause the kernel memory reclaimer to excessively
invoke the shrinker under memory pressure, leading to a system livelock
or severe performance degradation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026101238-calm-foo=
ting-389c@gregkh?part=3D1
