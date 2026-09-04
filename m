Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C44C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153F810E580;
	Fri,  4 Sep 2026 21:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BV3Zck2r";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528DB10E580
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:34:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 46B8F60209;
 Fri,  4 Sep 2026 21:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53C61F00A3D;
 Fri,  4 Sep 2026 21:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788557640;
 bh=2uor7C2Kr/92I1DjXg+yxehp8+I4ZoyJ9wZujodHoq8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=BV3Zck2rL9PaTbf0oOE4Qy8+zvLQrMpEWC2/q6lV5nMdo9+jg62MJs3ZIM31g3UZ2
 +yoJmUoIyoZD+w3KCQfXA2+DlnMr2kYlAgVAGX8DAdyAb1rkK6WtWsT1C985OFysnf
 Iw1vtF0AdFXgXQtIN/d8QIjlApb87zdL0eVU9wGHbaguaE8Pdf69pzQmxNB9fthcwg
 AecEbo+bGio1ss6Znv2nnGPtfT2jDo+3jD+uM9V+XnCEeOAMeSkNPWxZ2gwvFzaIfJ
 3Vjg7xLiWqe3WPSHsbnuFmN+NNzo0jbfbd6mQnKMS5aSxbSyOG7ZwMsTR0RQtlmIPh
 DeTSKQ2w6B+7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/24] drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904211613.3934307-7-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-7-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 21:33:59 +0000
Message-Id: <20260904213359.C53C61F00A3D@smtp.kernel.org>
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
- [High] Premature drop of VM reference in xe_bo_put_commit() allows the VM=
 and its shared dma-resv to be freed while the BO is still alive in TTM, le=
ading to a use-after-free on the resv.
--

commit b2fad1ac33df0229950ed8b4d71c885827c4b7e3
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC

This commit adds a new flag, XE_BO_FLAG_PUT_VM_ASYNC, which indicates that =
an
asynchronous BO put should also drop an additional reference to the BO's VM=
 to
prevent the shared dma-resv from disappearing before the BO.

Link: https://patch.msgid.link/20260228013501.106680-7-matthew.brost@intel.=
com

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index b162753cebb70..aea4b0fee8e33 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3998,8 +3998,14 @@ void xe_bo_put_commit(struct llist_head *deferred)
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
Does this sequence drop the VM reference prematurely and risk a use-after-f=
ree
on the VM's dma_resv?

Looking at xe_bo_put_commit(), we call drm_gem_object_free(), which can
trigger ttm_bo_release(). If ttm_bo_individualize_resv() fails due to
memory pressure while the VM's shared dma_resv is concurrently locked by
another thread, TTM handles this by queuing the BO for delayed deletion
via ttm_bo_delayed_delete() and returning early.

If TTM returns early keeping the BO alive, and we immediately proceed
to drop the VM reference here:

    drm_gem_object_free(&bo->ttm.base.refcount);
    if (async)
        xe_vm_put(vm);

could this free the VM and its embedded dma_resv if it was the last
reference? Later, when ttm_bo_delayed_delete() executes, it would
attempt to call dma_resv_lock(bo->base.resv) on the freed VM resv,
causing a regression.

Is there a mechanism to ensure the VM stays alive as long as TTM delays the
BO deletion?

> +	}
>  }

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904211613.3934=
307-1-matthew.brost@intel.com?part=3D6
