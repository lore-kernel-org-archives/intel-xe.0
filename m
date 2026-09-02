Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312D5C624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 15:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D841610F26D;
	Wed,  2 Sep 2026 15:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fWAyZ6WC";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A6110F26D
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 15:28:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A966241FFF;
 Wed,  2 Sep 2026 15:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF841F000E9;
 Wed,  2 Sep 2026 15:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788362914;
 bh=5qYSE35XzK++DDzcyycFUd8oaM61JKYlDkJW5PGN8ZA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=fWAyZ6WCffz9MQ7ZHzd3dUYEezNRRLDY/uY3e1eoL85oBxYO7DQAd9RfCeZNLR1/p
 FzhXJhJDeLlbDRGit8RLjxBjWTLBPSRFzdikRO+CaSMeT/83TSnnRcGAx9pKHU7WMV
 x3g+2Ml2z9zXWjSEMDRwI1Bc6p6t1jn/eDwbZQ/W/iO4m8LRDW9vJ5j/VKIvYiDyuE
 AiAVYka/QhmTNWFH9tLW7cF6nPV6E7awk1GzkdrOV6KZHCgb/MGJxS6uXCU5aN5JXd
 W0/+vFrtKSgWipfIWWK9igIYcQLbtIgnprK5rBSHI7P4kmS/hFICgnN4Yf3zAayEnF
 8eMXc2HipDttQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V20 04/15] drm/xe: Handle NULL resource and allow
 purging of VRAM pages
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260902145343.465686-21-tejas.upadhyay@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-21-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 15:28:33 +0000
Message-Id: <20260902152834.6DF841F000E9@smtp.kernel.org>
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

Pre-existing issues:
- [High] Null pointer dereference in `xe_vm_snapshot_capture` when capturin=
g a VM containing a purged BO.
--

commit f809a0c4f30d1158f4546c8b29fd7d07fc7912ae
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe: Handle NULL resource and allow purging of VRAM pages

This patch adds NULL checks for the buffer object's resource pointer in
xe_bo_is_vram() and xe_bo_is_stolen() to prevent potential NULL pointer
dereferences. It also removes the restriction in xe_ttm_bo_purge() to
explicitly allow the driver to purge VRAM pages.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8f93e09e51bb8..d30a8411d2a33 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
[ ... ]
> @@ -929,9 +932,6 @@ int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo,=
 struct ttm_operation_ctx *
> =20
>  	xe_bo_assert_held(bo);
> =20
> -	if (!ttm_bo->ttm)
> -		return 0;
> -

[Severity: High]
This is a pre-existing issue, but by removing this check to allow VRAM pages
to be purged, does it expose a NULL pointer dereference in
xe_vm_snapshot_capture()?

If a BO mapped in a VM with the XE_VMA_DUMPABLE flag is purged (e.g., via
VRAM page offlining or memory pressure after being marked DONTNEED), its
backing store is freed and bo->ttm.resource is set to NULL.

If a GPU hang subsequently triggers a devcoredump, xe_vm_snapshot_capture()
iterates over the VMAs and unconditionally dereferences bo->ttm.resource
without holding the BO's dma-resv lock or checking for NULL:

drivers/gpu/drm/xe/xe_vm.c:xe_vm_snapshot_capture() {
    ...
    if (bo) {
        snap->snap[i].cpu_caching =3D bo->cpu_caching;
        snap->snap[i].bo =3D xe_bo_get(bo);
        snap->snap[i].bo_ofs =3D xe_vma_bo_offset(vma);
        switch (bo->ttm.resource->mem_type) {
    ...
}

Could this cause a kernel panic if a local user marks a dumpable BO as
DONTNEED, waits for it to be purged, and then intentionally hangs the GPU?

>  	if (!xe_bo_madv_is_dontneed(bo))
>  		return 0;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902145343.4656=
86-17-tejas.upadhyay@intel.com?part=3D4
