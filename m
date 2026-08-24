Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D17FC5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 16:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282E110E161;
	Mon, 24 Aug 2026 16:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IP8ZON5z";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134CF10E161
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 16:47:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DC5C660120;
 Mon, 24 Aug 2026 16:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7471D1F000E9;
 Mon, 24 Aug 2026 16:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787590019;
 bh=CtbQhLDJdrXfqGSZiR/cw50KZcoQEdAWGikhzjn0kfY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=IP8ZON5zPzKsj+lRhA/ieaOuHguV5DQDylrYOxeTwhDy5PjC+qknzubHvY1565Z2I
 N4/mR509JQDqaD4j1WP3BCUnULLlUiTCViFmdaPKOAdK7k0kT2QIUyuz8D9qtmwKC3
 uCFJ05xfFXLVxoFIqdw8bn9SxsAXGGLOQH5iQb9h3GrC04lp0EguM8xsBf7+cChluu
 6B/o1HL/0lDlPTKktpxlw5mgg+h/mL7aNJ85RMozS/Jb7ey0irrQ79siQbnX54gGIK
 /AZSVeP1K/WqpKNJqJB9Bt1jFAl3gF73d15yQ/5Yxmq8PPTU1MMi2TxgVd5ialH7Qx
 mFlFuXtF1ZT9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] drm/xe/ggtt: stop mapping unmapped GGTT pages to
 scratch
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824163458.3129935-2-tilak.tirumalesh.tangudu@intel.com>
References: <20260824163458.3129935-1-tilak.tirumalesh.tangudu@intel.com>
 <20260824163458.3129935-2-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 16:46:59 +0000
Message-Id: <20260824164659.7471D1F000E9@smtp.kernel.org>
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
- [High] Writing faulting PTEs for recycled holes but scratch PTEs for virg=
in holes causes non-deterministic spurious hardware faults depending on mem=
ory allocation history.
--

--- Patch [1]: [PATCH 1/3] drm/xe/ggtt: stop mapping unmapped GGTT pages to=
 scratch ---
commit 240e3aa087f4e7c9c8232bdeba69ae3fe654d294
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

drm/xe/ggtt: stop mapping unmapped GGTT pages to scratch

This commit updates xe_ggtt_clear() to take a use_scratch parameter, leaving
the init-time clear to use scratch PTEs while forcing PTE=3D0 during node=20
removal on multi-queue platforms. This aims to expose stale hardware TLB=20
entries as observable faults.

> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 8ec23862477fc..4cddd69f0e992 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c

[ ... ]

> @@ -257,23 +258,36 @@ static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u6=
4 addr)
>  	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
>  }
> =20
> -static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
> +/**
> + * xe_ggtt_clear() - Clear a range of GGTT page-table entries
> + * @ggtt: the &xe_ggtt to clear
> + * @start: start of the range (GGTT address)
> + * @size: size of the range in bytes
> + * @use_scratch: true fills the range with the scratch PTE (init-time cl=
ear so
> + *		 engines walking free holes read zeros safely); false writes
> + *		 PTE=3D0 so a stale HW TLB entry faults instead of silently
> + *		 landing on scratch.
> + */

[Severity: High]
Does this explanation imply that hardware prefetchers speculatively walk
into unmapped ranges?

If engines legitimately walk free holes (as stated here for the init-time
clear), the hardware prefetcher cannot distinguish between virgin holes and
recycled holes.

[ ... ]

> @@ -473,12 +487,19 @@ static void ggtt_node_fini(struct xe_ggtt_node *nod=
e)
>  static void ggtt_node_remove(struct xe_ggtt_node *node)
>  {
>  	struct xe_ggtt *ggtt =3D node->ggtt;
> -	bool bound;
> +	bool use_scratch, bound;
> +
> +	/*
> +	 * Addition of a secondary queue while a multi-queue context is live on
> +	 * HW requires proper GGTT TLB clearing, so use faulting PTEs here.
> +	 */
> +	use_scratch =3D !xe_gt_has_multi_queue(ggtt->tile->primary_gt);
> =20
>  	mutex_lock(&ggtt->lock);
>  	bound =3D ggtt->flags & XE_GGTT_FLAGS_ONLINE;
>  	if (bound)
> -		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
> +		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node),
> +			      xe_ggtt_node_size(node), use_scratch);

[Severity: High]
Can writing PTE=3D0 here cause spurious GPU or IOMMU page faults on
multi-queue platforms?

Since a prefetching engine might speculatively read past its buffer boundary
into an adjacent recycled hole, stripping the scratch PTE protection for
recycled memory while keeping it for virgin memory creates a situation
where faults depend entirely on memory allocation history.

Could this lead to engine hangs or system instability when a prefetching
engine hits the PTE=3D0 in a recently freed node?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824163458.3129=
935-1-tilak.tirumalesh.tangudu@intel.com?part=3D1
