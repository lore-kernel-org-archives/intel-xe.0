Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B801C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 07:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D323410E61A;
	Mon, 31 Aug 2026 07:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KGPRVCvu";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E2410E61A
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 07:24:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1BB9860120;
 Mon, 31 Aug 2026 07:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994EB1F000E9;
 Mon, 31 Aug 2026 07:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788161049;
 bh=C66H1SRtfx/UUepsCPo+Lejrup/A6fnOA1CdNHS2yfU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=KGPRVCvuTC8NyvWlvoaOrRZdiULHJulVTHwxutbjT0oRSaiuNhyIx63BTGcBShPrl
 mAZ6jKbXeJccue7aGX34KP0qfjjLHaM+NtEZq1pvDDt8e3cAXWsEDYm0VBns2mOy7t
 0dk3pa89wnbDV4HKpx1KgauG/QexkUtIiJ44sugl/AaVKhZ8hOBuycrB7LclisA554
 B1FvZ/ZGoNHPFTU6zYCBFdjY0Z2BqAj7G1A5hMcIdZohM5Itb3r5tg75ai1/mh02K/
 ZFnOOA+gzDfj+ilmVN1SHO64B6H76ZAWPRkJpIB86lEMYUl9DqGX/31KYHudqAX2Pu
 1hpoIquaS/doQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V19 02/15] drm/xe: Link LRC BO and its execution Queue
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831064942.315720-19-tejas.upadhyay@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-19-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 07:24:09 +0000
Message-Id: <20260831072409.994EB1F000E9@smtp.kernel.org>
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
- [High] Flawed synchronization design between LRC BO queue back-pointer re=
ader and queue teardown, potentially leading to use-after-free of queue int=
ernals and queue memory.
--

commit 533bbdfdba916103ef324691d9fb513031965dd4
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe: Link LRC BO and its execution Queue

To establish a link between an LRC BO and its corresponding execution
Queue, a back-pointer is stored within the BO's private data structure.
This allows the driver to identify and take corrective action on the
specific queue if the LRC BO encounters an error.

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index c4213bb9c137f..91ed6c0fac84e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -387,6 +387,12 @@ static int __xe_exec_queue_init(struct xe_exec_queue=
 *q, u32 exec_queue_flags)
>  				goto err_lrc;
>  			}
> =20
> +			/*
> +			 * The queue ref counts the LRCs, thus it safe for the LRC BO to hold=
 a
> +			 * pointer to queue without reference.  The reader holds dma_resv (
> +			 * xe_bo_lock) which serializes with xe_lrc_finish().
> +			 */
> +			WRITE_ONCE(lrc->bo->q, xe_exec_queue_multi_queue_primary(q));

[Severity: High]
Does this code introduce a flawed synchronization design between the LRC BO
queue back-pointer reader and queue teardown, potentially leading to a
use-after-free of queue internals and queue memory?

If a multi-LRC queue creation succeeds for the first LRC (i=3D0) but fails =
for a
subsequent one, the error path calls __xe_exec_queue_fini(q) while the queu=
e's
refcount is still 1.=20

__xe_exec_queue_fini(q) destroys backend structures before dropping LRC
references (which would clear bo->q via xe_lrc_finish()):

drivers/gpu/drm/xe/xe_exec_queue.c:__xe_exec_queue_fini() {
	...
	q->ops->fini(q);

	for (i =3D 0; i < q->width; ++i)
		xe_lrc_put(q->lrc[i]);
	...
}

Because the backend structures are destroyed before the back-pointer is cle=
ared,
there is a window where bo->q points to a partially destroyed queue.

Concurrently, if a VRAM page offline or memory shrinker (in xe_ttm_vram_mgr=
.c)
locks the first LRC's BO, reads bo->q, and successfully takes a reference
(xe_exec_queue_get_unless_zero(q) succeeds because refcount=3D1), the reader
could then call xe_exec_queue_kill(q). This would access already-freed
backend structures (e.g., q->guc->sched).

Additionally, looking at the error path for xe_exec_queue_create(), the code
forcefully frees the queue memory without checking if a concurrent reader v=
ia
bo->q has elevated the refcount:

drivers/gpu/drm/xe/xe_exec_queue.c:xe_exec_queue_create() {
	...
err_post_init:
	__xe_exec_queue_fini(q);
err_post_alloc:
	__xe_exec_queue_free(q);
	return ERR_PTR(err);
}

Can this lead to a use-after-free of the queue memory itself when the
concurrent reader later uses or puts the queue?

>  			xe_exec_queue_set_lrc(q, lrc, i);
> =20
>  			if (__lrc)
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831064942.3157=
20-17-tejas.upadhyay@intel.com?part=3D2
