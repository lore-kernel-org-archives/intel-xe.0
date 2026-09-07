Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCA9C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 12:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B9210E233;
	Mon,  7 Sep 2026 12:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MnQ3l9n5";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A88510E233
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 12:17:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 12EA1402FA;
 Mon,  7 Sep 2026 12:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE58D1F00A3A;
 Mon,  7 Sep 2026 12:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788783442;
 bh=kF2r9OgfOhAuIEsoxhYBWhJH0GB3IGIxOf2gM1TucMA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=MnQ3l9n5KL27m8RfEdQKi1qzeVSpKSkg7S/Q+jGVIVF+vdgVG2RSvwWDj52JzBtIq
 LBH8fRviAHTrb1imcr3agA9ynXARJK/G3VxAupxzRM50YleIF6OsoQADYmRnW/4Uly
 a4VaECvbSArxM2N+pG4huLbKTQuzYEV3VMJ01F5bQx9TDBFjt0Dxo2dLBacJXn1Ivc
 6vwr7cyfOrQ6Ficfj1VxEji8XG9aexU6qTGNui4swm8u2yfDabylUcyiJs5opRoN+g
 P8j+HICO7yE40GJRZJyt49DlhEV+vnnrp4gF9kMBx1aC2AtK/fZcEz+AvKBkBM2j9N
 mDXHj1fs9Yktg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe: Add multi_queue_active_lrca debugfs
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260907120223.990784-2-varun.gupta@intel.com>
References: <20260907120223.990784-2-varun.gupta@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 12:17:21 +0000
Message-Id: <20260907121721.BE58D1F00A3A@smtp.kernel.org>
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
- [High] Lockless access to `q->lrc[0]` and `group->primary->lrc[0]` causes=
 a NULL pointer dereference if a multi-queue group is actively being create=
d.
--

commit 1227a012a132709dff00d20c63df261a7728bc7f
Author: Varun Gupta <varun.gupta@intel.com>

drm/xe: Add multi_queue_active_lrca debugfs

This commit adds a per-GT debugfs file to print the currently active queue =
ID
and LRCA of the exec queue occupying that slot in a running multi-queue
group. It resolves the active LRCA by matching the primary LRCA against each
queue's group and picking the queue at the reported active_id position.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
[ ... ]
> +u32 xe_guc_submit_active_multi_queue_lrca(struct xe_guc *guc,
> +					  struct xe_hw_engine *hwe,
> +					  u32 cur_lrca, u32 active_id)
> +{
[ ... ]
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		struct xe_exec_queue_group *group =3D q->multi_queue.group;
> +
> +		if (!q->multi_queue.valid || !group || !group->primary)
> +			continue;
[ ... ]
> +		/*
> +		 * LRCAs are page-aligned (4K) addresses in GGTT; the low
> +		 * bits reported by RING_CURRENT_LRCA are not meaningful, so
> +		 * only compare bits [31:12].
> +		 */
> +		if ((xe_lrc_ggtt_addr(group->primary->lrc[0]) ^ cur_lrca) & GENMASK(31=
, 12))
> +			continue;
> +
> +		lrca =3D xe_lrc_ggtt_addr(q->lrc[0]);

[Severity: High]
Can this sequence cause a NULL pointer dereference if a multi-queue group is
actively being created?

If another process creates a multi-queue exec queue concurrently,
__xe_exec_queue_init() calls guc_exec_queue_init() which inserts the
new queue into guc->submission_state.exec_queue_lookup and then drops the
submission lock.

The execution then returns to __xe_exec_queue_init() to allocate the LRCs
and assign them to q->lrc[i]. If the debugfs read iterates over
exec_queue_lookup in this exact window, it can find the partially
initialized queue.

If the queue's pos happens to match the active_id read from the hardware
(e.g. both are 0), it looks like it will unconditionally call
xe_lrc_ggtt_addr() on group->primary->lrc[0] and q->lrc[0] before they
are allocated, resulting in a crash.

Does this require taking q->lrc_lookup_lock or checking for NULL before
accessing the LRCs here?

> +		break;
> +	}
> +
> +	return lrca;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907120223.9907=
84-2-varun.gupta@intel.com?part=3D1
