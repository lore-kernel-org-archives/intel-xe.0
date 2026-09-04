Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378DFC624D6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 00:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E7B10E4BC;
	Fri,  4 Sep 2026 00:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jgUAPFis";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0257A10E4BC
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 00:18:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B254C423C3;
 Fri,  4 Sep 2026 00:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0BD1F00A3E;
 Fri,  4 Sep 2026 00:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788481107;
 bh=upkad+VMvJATbxFQtzBObF8wuurXvx9eHVGnFCyPrls=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jgUAPFisPWC2N7Uz3O4FTa72+TlEmmQIFQpx9iP9QoGvdYF83wUDc+DdaBQRu53l0
 ANKQC+ZXRM/ktXIXkuHfmnuBHojrkbzqXO2d49bzvdJj4MiTyVd19+9U1KRIup43cW
 PvOT0YCR1Rz/TTHllCN/ELUoIKLlCzklAY0ip43QVNxU9WTEtYwNViAepkBSMn5A4d
 3p1UA+t5sG2gIi1BuE1m/P1sRVfd4tOj5dM7Sbpnf5se4uHPYGOdot5USl7SHntgqQ
 pMbiWFgZ/aHi5/jHk6EUXhaGWDj6Dgj2XSBm+S2eRkpPwKlrkNzKNTlfplGS3STvi9
 59uI+YlZJLu5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/25] drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903235842.3401722-7-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-7-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 00:18:26 +0000
Message-Id: <20260904001827.6B0BD1F00A3E@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The XE_BO_FLAG_PUT_VM_ASYNC mechanism causes VM reference leaks if=
 xe_bo_put_async() is called when the BO's refcount is greater than 1.
- [High] Dropping the VM reference synchronously in xe_bo_put_commit causes=
 a Use-After-Free of the shared dma_resv object if TTM defers destruction.
--

commit 73ce65401a8053bf565b7b064086594d1dafb49a
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC

This commit introduces XE_BO_FLAG_PUT_VM_ASYNC, which indicates that an
async BO put must also drop an additional reference to the BO's VM. This
ensures the shared dma-resv object does not disappear before the BO when
a kernel BO is put asynchronously.

Link: https://patch.msgid.link/20260228013501.106680-7-matthew.brost@intel.=
com

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index dde309821237b..5cde5dff2d481 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3989,8 +3989,14 @@ void xe_bo_put_commit(struct llist_head *deferred)
>  	if (!freed)
>  		return;
> =20
> -	llist_for_each_entry_safe(bo, next, freed, freed)
> +	llist_for_each_entry_safe(bo, next, freed, freed) {
> +		struct xe_vm *vm =3D bo->vm;
> +		bool async =3D bo->flags & XE_BO_FLAG_PUT_VM_ASYNC;
> +
>  		drm_gem_object_free(&bo->ttm.base.refcount);
> +		if (async)
> +			xe_vm_put(vm);

[Severity: High]
Does this code leak the VM reference if xe_bo_put_async() is called when the
BO's refcount is greater than 1?

If xe_bo_put_async() is called while concurrent paths (like show_meminfo or
xe_bo_evict_all) hold a temporary reference, the BO won't be added to the
async_list.

Later, when the temporary reference is dropped via a synchronous xe_bo_put(=
),
the BO is destroyed by xe_ttm_bo_destroy(), which only drops bo->vm if
xe_bo_is_user(bo) is true (which is false for kernel PT BOs). Thus, the VM
reference could be permanently leaked.

[Severity: High]
Can dropping the VM reference synchronously here cause a use-after-free of
the shared dma_resv object if TTM defers destruction?

In xe_bo_put_commit(), drm_gem_object_free() drops the GEM reference. If TTM
concurrently holds an extra reference to the BO (e.g., via
ttm_bo_get_unless_zero() during an LRU walk), the BO will not be immediately
destroyed.

However, xe_bo_put_commit() continues and calls xe_vm_put(vm). If this drops
the last reference to the VM, the VM and its embedded resv are freed.
Because the BO is still alive and bo->ttm.base.resv points to the freed
vm->resv, TTM might later attempt to use the freed reservation object.

> +	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903235842.3401=
722-1-matthew.brost@intel.com?part=3D6
