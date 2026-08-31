Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99E2C624C2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 07:42:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CB310E266;
	Mon, 31 Aug 2026 07:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nykacAW/";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B062A10E266
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 07:42:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 96F2F43847;
 Mon, 31 Aug 2026 07:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599E91F00A3D;
 Mon, 31 Aug 2026 07:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788162165;
 bh=i+eirGPC23DsLX/vlzRHzPtHI+wc2TX2vQp47f0Vqu0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nykacAW/MeGm6t+6KV53O7f5/QgdfGji89bQd8EoIDZ1vuGc3gm4Y0Zt1jk90hrG5
 DXzCfc85CkqM6xya5xItF2ux/zxkjlK8BYEPUS4NZ3Q+gkwDKSz5Z/ZdJVkj6xx+d5
 5crlpNXPg1pWiHfdV1imRMk6lEoGDcW+tXK5+jQlw4RKWzm/0joZFg1U46jw724wMO
 GMt9eEutysLL4BXZrn3wZ9WFcGQEr2WrlOO8ZZNJgL/Pu81C1UllnQW0RQD+PYffLG
 n9n/RfjkSuGoWIocrZSZLIdrMbELZ2VGFBxg/+vk0ipxsromY46JphfmKX3tojAx1C
 /N9D/5gmtIVbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V19 04/15] drm/xe: Handle NULL resource and allow
 purging of VRAM pages
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831064942.315720-21-tejas.upadhyay@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-21-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 07:42:44 +0000
Message-Id: <20260831074245.599E91F00A3D@smtp.kernel.org>
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
- [High] Kernel crash in xe_vm_snapshot_capture() when capturing a VM conta=
ining a purged BO.
--

commit 695b3991e4560b777497e2ae90e478f459a620d0
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe: Handle NULL resource and allow purging of VRAM pages

This commit adds NULL checks for the buffer object's resource pointer in
xe_bo_is_vram() and xe_bo_is_stolen(). It also removes the check that
prevented purging when ttm_bo->ttm is NULL from xe_ttm_bo_purge(),
explicitly allowing VRAM pages to be purged during memory page offlining.

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
This is a pre-existing issue, but now that this patch series enables purging
for VRAM BOs, does this expose a kernel panic during devcoredump capture?

When a BO is marked DONTNEED and purged, its ttm.resource is freed and set
to NULL. If a GPU hang later occurs in the VM where this purged BO is still
mapped, the devcoredump handler in xe_vm_snapshot_capture() iterates over
the VM's VMAs and accesses the memory type unconditionally:

drivers/gpu/drm/xe/xe_vm.c:xe_vm_snapshot_capture() {
    ...
            switch (bo->ttm.resource->mem_type) {
            case XE_PL_SYSTEM:
    ...
}

Because bo->ttm.resource is NULL for purged BOs, this causes a NULL pointer
dereference and crashes the kernel. This can potentially be triggered by
unprivileged userspace to cause a Denial of Service.=20

Could we add a NULL check in xe_vm_snapshot_capture() before attempting to
access mem_type, similar to the defensive checks added to xe_bo_is_vram()
in this patch?

>  	if (!xe_bo_madv_is_dontneed(bo))
>  		return 0;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831064942.3157=
20-17-tejas.upadhyay@intel.com?part=3D4
