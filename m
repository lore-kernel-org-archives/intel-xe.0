Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84416C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 23:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249EB10ECCD;
	Tue,  8 Sep 2026 23:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="omIkE4aj";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3863C10ECCD
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 23:32:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6694D601DE;
 Tue,  8 Sep 2026 23:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BB71F00A3A;
 Tue,  8 Sep 2026 23:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788910366;
 bh=Yo4N2rzHzbmAw3DCfB1P2sI5jDii0vHctZTw2m8acTw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=omIkE4ajNHW7vL8HAtGK0/Rbefwyvtw0SlWSo8KmO9LBi9TaNCkdnTKEHWys0CdYf
 o0nTv4iXy29moFtfmqTb3v3vuqq7UeRsNf4yuDl2kAFqCyLK9pZurwamB+OqUB9FTx
 FdXSHpPSiG7OvKsUxe6tsSSSV8JnHCrv/jN9oinZ/nO4cO79DJRxkp/kBidakMFn0O
 sv5eTXIRxgASd8/VLVbqB9sbR+apiA+jgF8SeIhj2wYM4yQIvXWRQJvRt9fNKJTtAG
 ffkoGrh+w2p/KG7L9yDW3BENch4OHLfZEszJ9Eb6EpUQyalvkvxUkHP0nOfzNDsp5+
 ejM9+IKnmZnfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/xe/guc: Reject a duplicate deregister-done G2H
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908231854.1218934-5-umesh.nerlige.ramappa@intel.com>
References: <20260908231854.1218934-4-umesh.nerlige.ramappa@intel.com>
 <20260908231854.1218934-5-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 23:32:45 +0000
Message-Id: <20260908233245.E6BB71F00A3A@smtp.kernel.org>
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
- [High] Preexisting TOCTOU Use-After-Free race in G2H handlers due to lock=
less XArray lookup and immediate kfree() of xe_exec_queue.
--

commit 7071b18636a4e1a16b055aa587e7944a18af7e7e
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/guc: Reject a duplicate deregister-done G2H

This commit adds a check to reject duplicate deregister-done G2H messages
during the window where the registered bit is cleared but the guc_id is not
yet freed.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 99d8c807ff056..e90304e5b9554 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3323,8 +3323,15 @@ int xe_guc_deregister_done_handler(struct xe_guc *=
guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
> =20
> -	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
> -	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
> +	/*
> +	 * The registered bit is cleared by the first deregister-done, but the
> +	 * guc_id is only freed once the deferred destroy work has run, so the
> +	 * lookup above still resolves in between. Checking it here makes a
> +	 * duplicate notification an error rather than a second destroy.
> +	 */
> +	if (!exec_queue_registered(q) || !exec_queue_destroyed(q) ||

[Severity: High]
This isn't a bug introduced by this patch, but this added check may trigger
a use-after-free in certain timing conditions.

The queue is loaded from the XArray locklessly and without taking a referen=
ce
count in drivers/gpu/drm/xe/xe_guc_submit.c:g2h_exec_queue_lookup:

drivers/gpu/drm/xe/xe_guc_submit.c:g2h_exec_queue_lookup() {
    ...
    q =3D xa_load(&guc->submission_state.exec_queue_lookup, guc_id);
    ...
}

If a duplicate DEREGISTER_DONE G2H message arrives just as the asynchronous
destroy worker (__guc_exec_queue_destroy_async) is tearing down the
xe_exec_queue, the G2H worker can grab a pointer to q just before the destr=
oy
worker calls xa_erase.

Because the lookup does not increment a reference count, and the object is
freed via kfree in __xe_exec_queue_free without waiting for RCU grace perio=
ds,
could exec_queue_registered(q) end up dereferencing a freed pointer?

> +	    exec_queue_pending_disable(q) || exec_queue_pending_enable(q) ||
> +	    exec_queue_enabled(q)) {
>  		xe_gt_err(guc_to_gt(guc),
>  			  "DEREGISTER_DONE: Unexpected engine state 0x%04x, guc_id=3D%d",
>  			  atomic_read(&q->guc->state), q->guc->id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908231854.1218=
934-4-umesh.nerlige.ramappa@intel.com?part=3D1
