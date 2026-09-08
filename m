Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BD8C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 17:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1C510E07A;
	Tue,  8 Sep 2026 17:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SBdvZ2KV";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543D410E07A
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 17:12:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 57DE9601F6;
 Tue,  8 Sep 2026 17:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE84B1F00A3F;
 Tue,  8 Sep 2026 17:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788887562;
 bh=+rGiBpLyJlXUNz87OKKG56V0UdX/oAx2i9SyFq8kprM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=SBdvZ2KVRf0eQI3Oautk3sYXxa1RZBZWckacciODodAvRlFtz97yB4EoO5OxLO/es
 y8RycqaVDCGrz22IEndX8nMLFS6IblM3b3LxVAxUCkFJm5ZF+Katz2LjWqAgJBhPRp
 Wr0Gsy1i0zeh+VZvGy9A0gm2HdEVkiJwipCv4jVmPcj/aYwYCNVUhp6FOnNB5WPEpZ
 5IBY+AY7vEEeCVCAg4TFYP0rGsR8Ju8RhtQpCyEl2C6LwnJw4r3uw3VfLqiy0sJuFX
 Y0+uOtN6ydOA6B9PasZH8UksP8sp44VHxhDXKRetooEfekwHthraANtOZJ7myE/Kfi
 3EnZ8YSLokLQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/8] drm/xe/mmio_gem: fix destroy flow
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908165046.1393557-16-matthew.auld@intel.com>
References: <20260908165046.1393557-10-matthew.auld@intel.com>
 <20260908165046.1393557-16-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 17:12:41 +0000
Message-Id: <20260908171241.EE84B1F00A3F@smtp.kernel.org>
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
- [High] GFP_KERNEL allocation under dma_resv lock triggers lockdep splat a=
nd potential deadlock
--

commit 6f195ca9ff5839faa94b4a50effe5cb10176e87b
Author: Ilia Levi <ilia.levi@intel.com>
Subject: drm/xe/mmio_gem: fix destroy flow

This commit fixes a use-after-free in the gem object destroy flow by
introducing proper synchronization and refcounting. It uses the dma_resv lo=
ck
to serialize the fault handler with the destroy operation and unmaps existi=
ng
pages to cut off access to the real mmio after destruction.

> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmi=
o_gem.c
> index 970b1e2f49815..5ffe03d361902 100644
> --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
[ ... ]
> @@ -176,10 +189,9 @@ static int alloc_dummy_page_if_needed(struct drm_gem=
_object *base)
>  {
>  	struct xe_mmio_gem *obj =3D to_xe_mmio_gem(base);
> =20
> -	dma_resv_lock(base->resv, NULL);
> +	dma_resv_assert_held(base->resv);
>  	if (!obj->dummy_page)
>  		obj->dummy_page =3D alloc_page(GFP_KERNEL | __GFP_ZERO);

[Severity: High]
This isn't a bug introduced by this patch, but does this allocation context
create a lockdep violation or potential deadlock?

The vma fault handler calls xe_mmio_gem_vm_fault, which takes the
dma_resv_lock. If the device is unplugged, it eventually calls
alloc_dummy_page_if_needed, executing alloc_page(GFP_KERNEL | __GFP_ZERO)
while holding base->resv. Since dma_resv locks are taken by shrinkers during
memory reclaim, holding it while doing a GFP_KERNEL allocation creates a
circular dependency.

This can be reached by any unprivileged userspace process that mmaps the mm=
io
gem object and triggers a page fault while the device is in an unplugged
state.

> -	dma_resv_unlock(base->resv);
> =20
>  	return obj->dummy_page ? 0 : -ENOMEM;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908165046.1393=
557-10-matthew.auld@intel.com?part=3D6
