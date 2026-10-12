Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05F2CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 15:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E5B10E22E;
	Mon, 12 Oct 2026 15:53:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC71310E1B1
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 15:53:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9AB1F4186A;
 Mon, 12 Oct 2026 15:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5433B1F0089C;
 Mon, 12 Oct 2026 15:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791820406;
 bh=oH8HcdvZzGQP9Ta5yjykBHJX7zjnnEfOO/b5UcmHHas=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=WXp44ZZcqJPsa9MSKuXl6+2FgiLLjxuoXAs4shJ4Lm9qDRMus6KEm/uc4eNwzSY+k
 7tkvUsV5ZIsUCaYrF6tvzyiugA1xRN/gYa/MFehaBNBTRaXXFbliBDQ0gDVhp7Mnr3
 iuCopB7YWYwhB0LU7fR/eUJiTKCrhuL8ETetYEGS0mOiZFkrGBv2x9fo4qzqoLxXWk
 MaqVvspvUdzgVy2FE4hTDrs5jt3gq8fcsMJiDxcp2/1uIIZ0L4JNWQ0Vcwjn+/We9u
 1Hb5QjbSvBiFYOwPST9fzl52GGEvSrRXwq9KdjkA+FumK9JaZ/+V2IGqMmQtefwUKM
 mZnMvXP0mvedA==
Message-ID: <sashiko-outbox-168365@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: Patch "drm/xe: Fix shrinker accounting double-subtraction on
 nested external pins" has been added to the 6.18-stable tree
To: gregkh@linuxfoundation.org
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <2026101225-abacus-errand-7132@gregkh>
References: <2026101225-abacus-errand-7132@gregkh>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 15:53:25 +0000
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
- [High] drm/xe: list corruption and UAF on fb unpin of externally pinned B=
Os
--

commit 877c19cc3340fbb074cda1d52d8508b429d1bf00
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/xe: Fix shrinker accounting double-subtraction on nested external pins

This patch centralizes shrinker accounting into xe_bo_account_pin() and
xe_bo_account_unpin(). It ensures accounting is only updated on the outermo=
st
pin and the final unpin, addressing a double-subtraction issue on nested
external pins.

Link: https://patch.msgid.link/20261002100830.12297-2-thomas.hellstrom@linu=
x.intel.com

> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index 1fd4a815e784b..7e2b4dbef4d76 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
[ ... ]
> @@ -362,7 +362,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
>  		xe_ggtt_node_remove(vma->node, false);
> =20
>  	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
> -	ttm_bo_unpin(&vma->bo->ttm);
> +	xe_bo_unpin_account(vma->bo);
>  	ttm_bo_unreserve(&vma->bo->ttm);
>  	kfree(vma);
>  }

[Severity: High]
Does this code leave a stale pinned_link entry if a BO is pinned both exter=
nally
and as a framebuffer?

If a BO has a pin_count of 2 from being pinned both externally and as a
framebuffer, xe_bo_unpin_external() in drivers/gpu/drm/xe/xe_bo.c will redu=
ce
the count to 1 and skip list removal because of its bo->ttm.pin_count =3D=
=3D 1
check.

When __xe_unpin_fb_vma() in drivers/gpu/drm/xe/display/xe_fb_pin.c is later
called for the final unpin (dropping pin_count to 0), it only calls
xe_bo_unpin_account(). It lacks the logic to acquire xe->pinned.lock and ca=
ll
list_del_init(&bo->pinned_link).

Could this result in the BO being freed while its pinned_link remains in
xe->pinned.late.external, leading to list corruption and a Use-After-Free
if the list is iterated later? I note the commit message mentions this was
addressed in a separate follow-up patch, but I am including it here as it
was flagged during review.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026101225-abacus-e=
rrand-7132@gregkh?part=3D1
