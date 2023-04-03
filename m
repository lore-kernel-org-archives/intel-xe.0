Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D44C76188
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 16:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EC810E527;
	Mon,  3 Apr 2023 16:48:15 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1B410E51D
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 16:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680540493; x=1712076493;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BSmcAor54px/wZK6x8uJWbiFX1SgtW4Yz7zImGhFBlM=;
 b=F/dQdWnE3Ht+9+dvI3KBt7TuKUMtyDFd9i5nF1fQoi18s5VJUrVudAw0
 ZUEPNgSMvzSQllVOMMhLGSXCdpAdjYBJaG3RAzIoQgVeIF2EVWlQMqyW1
 nC4J5aNQ02uFF8b+t2sVr0264nsDk6eNAjnSgtmR63jrCMByrZw9OM+O1
 LS+iJCUPj5OK106NEHKqNUmQO5tKgV/YemwHLhJ3QjzK5DMI9yLgkMrYI
 b/HCxIiIHM8nxoXnRdFGA0asb89AVPYY8x+jk/UooN4liRsPtkgBln5/N
 j25qSzDEOyJPGK7dMs1hpapf15LGH47Ik1JCIfs/EOhi0Mtw3I3ayqE9+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="330524921"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="330524921"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 09:48:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="932118033"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="932118033"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 03 Apr 2023 09:48:11 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.28.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2AEA75804D9;
 Mon,  3 Apr 2023 09:48:09 -0700 (PDT)
Date: Mon, 3 Apr 2023 18:48:07 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230403184807.177d7ef5@maurocar-mobl2>
In-Reply-To: <20230328130826.61029-1-zbigniew.kempczynski@intel.com>
References: <20230328130826.61029-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] drm/xe/bo: Return object bo size on create
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 28 Mar 2023 15:08:26 +0200
Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> wrote:

> Driver may alter bo size requested by the user. Return real object
> size to make userspace aware how to arrange vm bindings.
>=20
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e4d079b61d52..410e797931ac 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1564,6 +1564,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, voi=
d *data,
>  		return err;
> =20
>  	args->handle =3D handle;
> +	args->size =3D bo->size;
> =20
>  	return 0;
>  }

An alternative approach would be instead to return -EINVAL if the
buffers aren't aligned. Something like this (untested) patch.

Regards,
Mauro

[PATCH] xe/xe_bo: Don't allow creating unaligned buffers

Ensure that bo will always be properly aligned.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index f25257bbfc65..ecc04b887790 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -985,6 +985,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *x=
e, struct xe_bo *bo,
 	};
 	struct ttm_placement *placement;
 	uint32_t alignment;
+	size_t aligned_size;
 	int err;
=20
 	/* Only kernel objects should set GT */
@@ -993,24 +994,28 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device =
*xe, struct xe_bo *bo,
 	if (XE_WARN_ON(!size))
 		return ERR_PTR(-EINVAL);
=20
-	if (!bo) {
-		bo =3D xe_bo_alloc();
-		if (IS_ERR(bo))
-			return bo;
-	}
-
-	bo->requested_size =3D size;
 	if (flags & (XE_BO_CREATE_VRAM0_BIT | XE_BO_CREATE_VRAM1_BIT |
 		     XE_BO_CREATE_STOLEN_BIT) &&
 	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
 	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
-		size =3D ALIGN(size, SZ_64K);
+		aligned_size =3D ALIGN(size, SZ_64K);
 		flags |=3D XE_BO_INTERNAL_64K;
 		alignment =3D SZ_64K >> PAGE_SHIFT;
 	} else {
+		aligned_size =3D ALIGN(size, SZ_4K);
+		flags &=3D ~XE_BO_INTERNAL_64K;
 		alignment =3D SZ_4K >> PAGE_SHIFT;
 	}
=20
+	if (aligned_size !=3D size)
+		return ERR_PTR(-EINVAL);
+
+	if (!bo) {
+		bo =3D xe_bo_alloc();
+		if (IS_ERR(bo))
+			return bo;
+	}
+
 	bo->gt =3D gt;
 	bo->size =3D size;
 	bo->flags =3D flags;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index a430d1568890..f8a55ef9e789 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -273,10 +273,8 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo=
 *bo)
 		xe_ggtt_set_pte(ggtt, start + offset, pte);
 	}
=20
-	if (bo->size =3D=3D bo->requested_size) {
-		pte =3D xe_ggtt_pte_encode(ggtt->scratch ?: bo, 0);
-		xe_ggtt_set_pte(ggtt, start + bo->size, pte);
-	}
+	pte =3D xe_ggtt_pte_encode(ggtt->scratch ?: bo, 0);
+	xe_ggtt_set_pte(ggtt, start + bo->size, pte);
=20
 	if (ggtt->invalidate) {
 		xe_ggtt_invalidate(ggtt->gt);
@@ -309,11 +307,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt=
, struct xe_bo *bo,
 	 * fact we have programmed this GGTT entry to a valid entry. BO aligned
 	 * to 64k already have padding so no need to add an extra page.
 	 */
-	if (bo->size =3D=3D bo->requested_size) {
-		size +=3D SZ_4K;
-		if (end !=3D U64_MAX)
-			end +=3D SZ_4K;
-	}
+        size +=3D alignment;
+        if (end !=3D U64_MAX)
+                end +=3D alignment;
=20
 	mutex_lock(&ggtt->lock);
 	err =3D drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, size,
