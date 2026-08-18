Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2484FC5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 10:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D674310EABA;
	Tue, 18 Aug 2026 10:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bG09jzxd";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143A410E4B7
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 10:51:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D8AE9435D9;
 Tue, 18 Aug 2026 10:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923E81F00A3A;
 Tue, 18 Aug 2026 10:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787050283;
 bh=MThht/6cEN3Aexy/VyKtJfjWajChr+dFbD7mcGhitk0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=bG09jzxd9QHPHsTGaFU+1aMrI9R1IKphDWJnV6IrcTUIsUjlWakB6+KpuEWC3Gnbd
 DiQJWCLGgFIGiq+Pi5k/HI7U4ADDaUI4wZ459hBnS3tMiUvWpqz9dgvdxvsw41PJsY
 3oDnPTXPTr/r8VMtKs15ITJmz0KOyFlFHsX9IQC4LpfEwI5/VjMkGl8elf0eDEq1ZV
 80lOaN32HiDKcrgQ1l94y0q92vE/yaEsgNsXBYHqR/xOc7WR2ig+Q9jpIke2I+Y92h
 DHU75Ix2mWMtLX0pIjXkZtmj67CTtMWN1W3JBaWANpUHyVjK+z3dkeZBHXF/mATfd8
 GOL8b0GMICwIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V17 07/12] drm/xe/vram: Add page offline data structures
 and lifecycle
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260818104055.3833974-21-tejas.upadhyay@intel.com>
References: <20260818104055.3833974-14-tejas.upadhyay@intel.com>
 <20260818104055.3833974-21-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:51:23 +0000
Message-Id: <20260818105123.923E81F00A3A@smtp.kernel.org>
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
- [Medium] RCU-001 Violation: Synchronous freeing of buddy blocks before li=
st removal.
--

--- Patch [7]: [PATCH V17 07/12] drm/xe/vram: Add page offline data structu=
res and lifecycle ---
commit f7feb662373b2ef4fb339b58b4b97a02acc79be4
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/vram: Add page offline data structures and lifecycle

This commit adds xe_ttm_vram_offline_resource to track individual offlined =
VRAM
pages, and extends xe_ttm_vram_mgr with offlined_pages/queued_pages lists a=
nd
their counters. It also initializes the lists and adds a teardown path to r=
elease
all tracked pages.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index 16ecea4977809..5513dc014f3e7 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
[ ... ]
> @@ -338,12 +338,35 @@ static void xe_ttm_vram_mgr_set_unused(struct drm_d=
evice *dev, void *arg)
>  	ttm_resource_manager_set_used(man, false);
>  }
> =20
> +static void xe_ttm_vram_free_bad_pages(struct xe_ttm_vram_mgr *mgr)
> +{
> +	struct xe_ttm_vram_offline_resource *pos, *n;
> +
> +	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
> +		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
> +		list_del_rcu(&pos->offlined_link);

[Severity: Medium]
Does this violate RCU removal ordering by freeing resources before unlinkin=
g?

The buddy blocks are freed synchronously before the object is unlinked from=
 the
RCU-protected offlined_pages list. While this is currently called during the
serialized teardown phase, freeing internal resources before unlinking the
object breaks RCU invariants. A concurrent reader could access pos->blocks
after it has been freed. Should list_del_rcu() happen before
xe_ttm_vram_buddy_free()?

> +		--mgr->n_offlined_pages;
> +		kfree_rcu(pos, rcu);
> +	}
> +	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
> +		/* queued entries have no buddy reservation yet */
> +		xe_ttm_vram_buddy_free(mgr, &pos->blocks, 0);
> +		list_del_rcu(&pos->queued_link);

[Severity: Medium]
Similarly, does this pose the same RCU removal ordering issue?

The buddy blocks are freed before unlinking the object from the RCU-protect=
ed
queued_pages list.

> +		--mgr->n_queued_pages;
> +		kfree_rcu(pos, rcu);
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818104055.3833=
974-14-tejas.upadhyay@intel.com?part=3D7
