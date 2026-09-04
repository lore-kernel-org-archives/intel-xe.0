Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE74C61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 02:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990FE10F808;
	Fri,  4 Sep 2026 02:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HlxKqrZg";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D092810F808
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 02:44:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AF7F9435BA;
 Fri,  4 Sep 2026 02:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685431F000E9;
 Fri,  4 Sep 2026 02:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788489864;
 bh=GY4kRBW3CHFLWtX7J0nUUf4DJl9LrF65CPXdnjBximA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=HlxKqrZg7/uA205K6eKLCU4EN7yhoS0vYJ2SQ4uAC5H4zoqFAKDTXErDAX4qMuQx5
 RPGM6Wib1BCnPRQ+mvrvr2BXc3PVXp8KnU7ND2haH9KVD9ds26ySWFZ88Bspg6kaXk
 WVyVnRD9ccNnhwjQTgJVDDQPvqUdTubsvpJEG5gf+a01k8FIhp3Pxs1wRj/cxkc48v
 n03sljN6q6LNHAIu8jj59tyUO7mPPQVg6p5yI5HJ9Bn026Dv7h/rdRKwbIEkH7LWTk
 gBT5wa7qfoXDLp0f/TXArhMs05oQz5vCTtYs3A2PznE+Y7+MkW0Vi/cQbeSoVrd4/o
 N0EIcrFZSfWZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/25] drm/xe: Update xe_bo_put_deferred arguments to
 include writeback flag
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904022207.3490018-6-matthew.brost@intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
 <20260904022207.3490018-6-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 02:44:24 +0000
Message-Id: <20260904024424.685431F000E9@smtp.kernel.org>
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
- [Medium] Use-After-Free of VM dma_resv during synchronous page table BO d=
estruction if memory allocation fails in TTM.
--

commit 2f5d2b6c59ef0884eb9c59daf808b992d5dbb2ec
Author: Matthew Brost <matthew.brost@intel.com>
Subject: drm/xe: Update xe_bo_put_deferred arguments to include writeback f=
lag

Updates xe_bo_put_deferred() to accept an 'added' pointer which indicates
whether the buffer object was successfully added to the deferred list. This
enables callers to take specific actions if the BO is queued for deferred
release.

Link: https://patch.msgid.link/20260228013501.106680-6-matthew.brost@intel.=
com

> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index e8081af5bfc18..6092f305ea8e5 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
[ ... ]
> @@ -514,7 +516,8 @@ void __xe_bo_release_dummy(struct kref *kref);
>   * false otherwise.
>   */
>  static inline bool
> -xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
> +xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred,
> +		   bool *added)
>  {
>  	if (!deferred) {
>  		xe_bo_put(bo);
>  		return false;
>  	}
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 854c0a59af719..3170df1f3fbf6 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -213,7 +213,7 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struc=
t llist_head *deferred)
> =20
>  	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
>  	xe_bo_unpin(pt->bo);
> -	xe_bo_put_deferred(pt->bo, deferred);
> +	xe_bo_put_deferred(pt->bo, deferred, NULL);

[Severity: Medium]
This is a pre-existing issue, but could xe_pt_destroy() in
drivers/gpu/drm/xe/xe_pt.c trigger a Use-After-Free of the VM's dma_resv
during synchronous page table BO destruction?

During VM teardown, deferred can be NULL. In this case, xe_bo_put_deferred()
in drivers/gpu/drm/xe/xe_bo.h calls xe_bo_put() synchronously. If
ttm_bo_individualize_resv() fails due to memory pressure (-ENOMEM) in
ttm_bo_release(), TTM's fallback path leaves the BO sharing the VM's resv
but still queues VRAM BOs for delayed deletion.

Since deferred is NULL, any xe_vm_get() mitigation (which relies on the BO
being added to the deferred list) is bypassed. This allows the VM to be fre=
ed
concurrently. When the delayed delete worker runs, would it call
dma_resv_lock() on the freed VM's resv, causing a UAF?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904022207.3490=
018-1-matthew.brost@intel.com?part=3D5
