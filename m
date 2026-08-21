Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6744C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 07:56:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9312D10E271;
	Fri, 21 Aug 2026 07:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z6USdpau";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1798C10E281
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 07:56:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D211960A73;
 Fri, 21 Aug 2026 07:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6218E1F00A3A;
 Fri, 21 Aug 2026 07:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787299007;
 bh=R19WEYDFX8pgLZYnUV7b6oYfra2OuYEvJvheKf+qbfw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Z6USdpaupWEk8ju5r5fkvK6SIIYrbCjppQG/QQTZHDNBph2N+yfxeD9CrrGvndI2W
 9pp8bZJoQMjbp6yRg/ediarGdWVzncKLLXLVbVZgAxAUDyVuLGhesxTszPVxwN6G1W
 Cc7GGZXt6djx6GwQAuE66V3NlxtZI4DkT5AA/0o7uBY/bTH4Q8zBBfxEZFi36lOTnd
 yZT0iUuWSUWKT+iqdj178GznFwZtDUf6czGG7oZzMY27r062LlW5vJzdRtSJTWQo4w
 O4pjAB2OirbyFvaaZ6QYw6OFaFrhJ+6PhZTEyZGeVGjldSD7g7c1TpTrFfFV6YNAOl
 okUVYLXTb100w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/xe/ggtt: invalidate engine GGTT TLBs for
 multi-queue GTs
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260821074238.3000501-4-tilak.tirumalesh.tangudu@intel.com>
References: <20260821074238.3000501-1-tilak.tirumalesh.tangudu@intel.com>
 <20260821074238.3000501-4-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 07:56:46 +0000
Message-Id: <20260821075647.6218E1F00A3A@smtp.kernel.org>
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
- [High] Engine TLB invalidation is incorrectly gated on a mutable software=
 configuration flag, leading to stale TLBs and memory corruption when multi=
-queue scheduling is disabled.
--

--- Patch [3]: [PATCH 3/3] drm/xe/ggtt: invalidate engine GGTT TLBs for mul=
ti-queue GTs ---
commit 1bb3febf0df767bbdf46eda5e034dfd13af1e727
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

drm/xe/ggtt: invalidate engine GGTT TLBs for multi-queue GTs

This commit introduces an engine TLB invalidation on GGTT unmap to ensure
that engines do not hit stale cached translations after the memory is freed.
The invalidation logic is gated on the GT having a multi-queue engine
class mask enabled.

> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 3564345fd7403..60eb9a3d29cc2 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c

[ ... ]

> @@ -603,6 +607,23 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
>  	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
>  }
> =20
> +/*
> + * Drain engine-side GGTT TLBs on teardown so a recycled range's next
> + * occupant can't hit a predecessor's cached translation.
> + */
> +static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
> +{
> +	struct xe_gt *gt =3D ggtt->tile->primary_gt;
> +	int err;
> +
> +	if (!gt || !gt->info.multi_queue_engine_class_mask)
> +		return;

[Severity: High]
Does this skip necessary hardware invalidation if the multi-queue scheduling
feature is disabled in software?

If a privileged user disables the multi-queue feature via configfs,
gt->info.multi_queue_engine_class_mask is cleared to 0. However, the hardwa=
re
physical capability of having independent engine TLBs does not disappear wh=
en
this software feature is disabled.

When the mask is cleared, xe_ggtt_invalidate_engine() will silently skip
the engine TLB invalidation on GGTT unmap, leaving the independent engine
TLBs unflushed and potentially causing data corruption or a use-after-free
when a recycled range is accessed. (Also note that in ggtt_node_remove(),
the unmap path falls back to writing a scratch PTE when this mask is 0,
which does not prevent engines from using their still-valid, stale TLB
entries.)

Should this check use an immutable hardware capability flag instead of the
active software configuration mask?

> +
> +	err =3D xe_tlb_inval_ggtt_full(&gt->tlb_inval);
> +	xe_gt_WARN(gt, err, "Failed to invalidate engine GGTT TLBs (%pe)",
> +		   ERR_PTR(err));
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821074238.3000=
501-1-tilak.tirumalesh.tangudu@intel.com?part=3D3
