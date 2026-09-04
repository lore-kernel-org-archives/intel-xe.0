Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5B2C624D4
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 00:38:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7341A10E1C3;
	Fri,  4 Sep 2026 00:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ngmrNXE1";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2275D10E4BC
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 00:38:39 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3A62A60546;
 Fri,  4 Sep 2026 00:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1D71F000E9;
 Fri,  4 Sep 2026 00:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788482317;
 bh=KQaAn7kyzQl/dmmaB/xc7viGv6wVeUGI3WZxePZt2bg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ngmrNXE1OCymtCMf93y6sxeBlmtP42RNgyALNZxB9LmxBJc6D7xxCh4V8nDvtf+1O
 4oHp2uKRzc/B2toqUaMXa1mEDLqU2KNkh7LYNObrhag6scCDk8U+aXO5Wv1/AlZsEl
 yVkhASVyqvks9k2RTQ8ondbWIYjNTGcgTl0QcION4M7xqjOVfIPMZbz9oCOIi+3oAx
 Oxbclf3DEdYZhlvQ2RBhrgqPFfcA6LcMGeYY//pGo+NkKCn6LtG5tXqqVQPxxXly+J
 1ycqXryVaNJnBDbQU5EXOSf1jORLfMKJlvYrR8GghvDiPl5kpCsjVwEACLQ7aB+fvx
 KcFCnyorUp4gQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 22/25] drm/xe: Add ULLS migration job support to GuC
 submission
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903235842.3401722-23-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-23-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 00:38:37 +0000
Message-Id: <20260904003837.BD1D71F000E9@smtp.kernel.org>
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
- [Critical] Direct MMIO write to the physical engine's RING_TAIL for GuC-s=
cheduled ULLS jobs causes hardware state corruption if the context is preem=
pted or evicted.
--

commit f60d4c34d363517fe528679e6ff3d059b7861099
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add ULLS migration job support to GuC submission

This commit adds ULLS migration job support to the GuC submission backend.
It modifies the migration queue job limits and introduces direct hardware
engine tail writes for subsequent ULLS jobs.

Link: https://patch.msgid.link/20260228013501.106680-24-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index dcb4b8a4f3b78..1578d80b01b82 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1207,6 +1207,11 @@ static void submit_exec_queue(struct xe_exec_queue=
 *q, struct xe_sched_job *job)
>  	if (exec_queue_suspended(q))
>  		return;
> =20
> +	if (job->is_ulls && !job->is_ulls_first) {
> +		xe_hw_engine_write_ring_tail(q->hwe, lrc->ring.tail);

[Severity: Critical]
Can this direct MMIO write to the engine's RING_TAIL cause hardware state
corruption if the ULLS context is preempted or evicted?

The driver bypasses the GuC submission interface (H2G) for ULLS jobs and
directly writes to the engine's MMIO RING_TAIL register. If the ULLS
migration context is not actively resident on the hardware engine at the ex=
act
moment of the write, the write will advance the ring tail of whichever cont=
ext
is currently resident on that engine (e.g., VM bind contexts sharing the sa=
me
USM engine).

Since the GuC scheduler fundamentally owns engine context switching, it can
preempt or evict the ULLS context for internal tasks or schedule other queu=
es
that explicitly share the USM engine. If the CPU submits a ULLS job while t=
he
ULLS context is swapped out, would the direct MMIO tail write hit the
currently running context instead?

> +		xe_lrc_set_ulls_semaphore(lrc, xe_sched_job_lrc_seqno(job));
> +	}
> +
>  	if (!exec_queue_enabled(q)) {
>  		action[len++] =3D XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
>  		action[len++] =3D q->guc->id;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903235842.3401=
722-1-matthew.brost@intel.com?part=3D22
