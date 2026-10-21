Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19C6606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 15:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlPoZuoS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7190610E18E;
	Wed, 21 Oct 2026 15:12:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD8810F4E3
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 15:12:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8EF9B4116E;
 Wed, 21 Oct 2026 15:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426F41F000C2;
 Wed, 21 Oct 2026 15:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792595534;
 bh=JaGYXKtJ9sF/iOmJzbPO3KcWaX2pFrVC8N4BWdHH6xg=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=mlPoZuoSzjBXEn66M0u3Bwyvu3n41UiuHfIADUDv2ANkbCtD8dp1/UPQojPuJs6HF
 w8xqe8rn1qT++hXyrGI0SfVVulgj7AXO8DSKxZA9mf+1zlS5wE1mr+AKzEQNDNuH3f
 9DiKUBJVHjXh0xau3RrHtna+WLfFIOGZtlc7hGQOb3IcPmBZ+rr3HdfWfY71ce0vO3
 pAqdDdFkpdM06kTEkW6dLGMQpmi7O5jfLAc86/34ITdNkuwzSEvqI6YsCM57/eFCNL
 9UF+uqZ1B2W9PrzC/DRUGnAvqRjfHxQS2ZXqaJX3CxkB5z8p+qSeQ631cO7+1p4iiS
 kn8q4W9lwsj5A==
Message-ID: <sashiko-outbox-180419@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: Patch "drm/xe: Don't transfer shrinker pages for pinned bos on
 purgeable state change" has been added to the 7.2-stable tree
To: gregkh@linuxfoundation.org, intel-xe@lists.freedesktop.org
In-Reply-To: <2026102151-compound-fondness-145b@gregkh>
References: <2026102151-compound-fondness-145b@gregkh>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 15:12:13 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/xe: shrinker page accounting corruption in xe_bo_set_purgeable=
_shrinker()
--

commit 38fe9b0b7cfb46e5ebc7efb56c8bdf33363c1017
Author: gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>

Patch "drm/xe: Don't transfer shrinker pages for pinned bos on purgeable st=
ate change" has been added to the 7.2-stable tree

This commit updates xe_bo_set_purgeable_shrinker() in
drivers/gpu/drm/xe/xe_bo.c to set tt_pages to 0 when xe_bo_is_pinned(bo) is
true, updating only xe_tt->purgeable without transferring pages between
shrinker buckets. However, 7.2-stable does not include upstream commit
6a117a2bb7ca65 ("drm/xe: Fix shrinker accounting double-subtraction on nest=
ed
external pins"), which changed scanout framebuffer pinning to use
xe_bo_pin_external().

Link: https://patch.msgid.link/20261009070053.7790-1-thomas.hellstrom@linux=
.intel.com

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7ed76349075fd..2d8283f6010a6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -838,6 +838,8 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>   *
>   * Transfers pages between shrinkable and purgeable buckets when the BO
>   * purgeable state changes. Called automatically from xe_bo_set_purgeabl=
e_state().
> + * For pinned BOs, whose pages are not accounted, only the purgeable fla=
g is
> + * updated, so that the correct bucket is used when the BO is unpinned.
>   */
>  static void xe_bo_set_purgeable_shrinker(struct xe_bo *bo,
>  					 enum xe_madv_purgeable_state new_state)
> @@ -854,7 +856,8 @@ static void xe_bo_set_purgeable_shrinker(struct xe_bo=
 *bo,
>  		return;
> =20
>  	xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
> -	tt_pages =3D tt->num_pages;
> +	/* Pinned bos are not accounted. Only update the purgeable flag. */
> +	tt_pages =3D xe_bo_is_pinned(bo) ? 0 : tt->num_pages;
> =20
>  	if (!xe_tt->purgeable && new_state =3D=3D XE_MADV_PURGEABLE_DONTNEED) {
>  		xe_tt->purgeable =3D true;

[Severity: High]
Does setting tt_pages =3D 0 when xe_bo_is_pinned(bo) is true in
xe_bo_set_purgeable_shrinker() in drivers/gpu/drm/xe/xe_bo.c introduce a
shrinker page accounting regression on 7.2-stable when a scanout framebuffer
buffer object changes purgeable state while pinned?

In 7.2-stable (which lacks upstream commit 6a117a2bb7ca65, "drm/xe: Fix
shrinker accounting double-subtraction on nested external pins"), scanout
framebuffers are pinned and unpinned directly via ttm_bo_pin() and
ttm_bo_unpin() without calling xe_ttm_tt_account_subtract() or
xe_ttm_tt_account_add():

drivers/gpu/drm/xe/display/xe_fb_pin.c:__xe_pin_fb_vma() {
	...
		if (IS_DGFX(xe))
			ret =3D xe_bo_migrate(bo, XE_PL_VRAM0, NULL, &exec);
		else
			ret =3D xe_bo_validate(bo, NULL, true, &exec);
		drm_exec_retry_on_contention(&exec);
		xe_validation_retry_on_oom(&ctx, &ret);
		if (!ret)
			ttm_bo_pin(&bo->ttm);
	...
}

drivers/gpu/drm/xe/display/xe_fb_pin.c:__xe_unpin_fb_vma() {
	...
	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
	ttm_bo_unpin(&vma->bo->ttm);
	ttm_bo_unreserve(&vma->bo->ttm);
	...
}

When a populated user buffer object has its pages accounted in
shrinker->shrinkable_pages via xe_ttm_tt_populate() ->
xe_ttm_tt_account_add() and is then pinned for scanout via
__xe_pin_fb_vma() -> ttm_bo_pin(&bo->ttm), its pages remain accounted in
shrinker->shrinkable_pages while bo->ttm.pin_count > 0.

If userspace then updates the purgeable state via madvise_purgeable() ->
xe_bo_willneed_put_locked() -> xe_bo_set_purgeable_state() ->
xe_bo_set_purgeable_shrinker(), xe_bo_is_pinned(bo) is true, so
xe_bo_set_purgeable_shrinker() sets tt_pages =3D 0 and updates
xe_tt->purgeable =3D true without moving tt->num_pages from
shrinker->shrinkable_pages to shrinker->purgeable_pages.

After __xe_unpin_fb_vma() -> ttm_bo_unpin(&vma->bo->ttm) drops
bo->ttm.pin_count to 0 without re-adding pages, subsequent unpopulation in
xe_ttm_tt_unpopulate(), purging in xe_bo_shrink_purge(), or another state
change while unpinned in xe_bo_set_purgeable_shrinker() subtracts from the
bucket selected by xe_tt->purgeable:

drivers/gpu/drm/xe/xe_bo.c:xe_ttm_tt_account_subtract() {
	struct xe_ttm_tt *xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);

	if (xe_tt->purgeable)
		xe_shrinker_mod_pages(xe->mem.shrinker, 0, -(long)tt->num_pages);
	else
		xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
}

Because xe_tt->purgeable was flipped while the pages stayed in
shrinker->shrinkable_pages, wouldn't this subtract tt->num_pages from
shrinker->purgeable_pages instead, underflowing shrinker->purgeable_pages to
a negative value, leaving shrinker->shrinkable_pages permanently inflated,
and causing unsigned long wrap-around in xe_shrinker_count() in
drivers/gpu/drm/xe/xe_shrinker.c:

drivers/gpu/drm/xe/xe_shrinker.c:xe_shrinker_count() {
	...
	if (can_backup)
		num_pages =3D min_t(unsigned long, num_pages, shrinker->shrinkable_pages);
	else
		num_pages =3D 0;

	num_pages +=3D shrinker->purgeable_pages;
	...
}

when shrinker->purgeable_pages is negative?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026102151-compound=
-fondness-145b@gregkh?part=3D1
