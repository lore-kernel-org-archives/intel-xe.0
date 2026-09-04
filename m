Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96377C61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 02:49:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB7710E0EC;
	Fri,  4 Sep 2026 02:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DQOk0Z0B";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488B910E0EC
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 02:49:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8F00660234;
 Fri,  4 Sep 2026 02:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7D71F000E9;
 Fri,  4 Sep 2026 02:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788490175;
 bh=d7bp45zcYB4+mXvuR3xw9xjE61QtMqrtdI1Su0UDPeI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=DQOk0Z0B7+543UR1ZeoZ53SyUzzvQHlC0jBT7t4Xr3ZODKdWn98Wk0v3XRsanLUMQ
 6R4Ojr2LW98Rm5j2zjEGI7ei2Y/lhMI94l7H3poXSOxUqzN8Ln+EyjHvAkivL4NcFC
 LRYff/VQEIz7y8JYRd3Qrk/xbIChueRlGH/RA7srzdYDb2bsN2wmXTqpMCNytqnaSa
 +ZJhrmRECMzff0m1FHK5yyRxWeOWobz3vsFBMYwkELbbkdI5Byyl7eqSwJJvvlGY6e
 3zgzPT99sztlXrSVY3Mr1hiZa/SrjTxtqrl0sku+2YkqXI4PVONbbgkFDVpWAx12zv
 4Aqex9jU5kjqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 22/25] drm/xe: Add ULLS migration job support to GuC
 submission
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904022207.3490018-23-matthew.brost@intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
 <20260904022207.3490018-23-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 02:49:34 +0000
Message-Id: <20260904024935.1A7D71F000E9@smtp.kernel.org>
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
- [High] Missing MMIO readback to flush the posted write to RING_TAIL befor=
e signaling the ULLS semaphore in memory.
--

commit 454390e5dedb020c4422d2a8b279ed19fa3eb789
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add ULLS migration job support to GuC submission

This commit adds ULLS migration job support to the GuC submission backend.
It updates the migration queue max jobs, directly sets the hardware engine
tail via a MMIO write for ULLS jobs, and sets the ULLS semaphore for the
current job releasing the last job.

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
> +		xe_lrc_set_ulls_semaphore(lrc, xe_sched_job_lrc_seqno(job));

[Severity: High]
Does this sequence miss an MMIO readback to flush the posted write?

A posted MMIO write is issued to the hardware engine's RING_TAIL via
xe_hw_engine_write_ring_tail(), and is immediately followed by a memory wri=
te
to signal the semaphore in xe_lrc_set_ulls_semaphore(). There is no
intermediate MMIO readback to flush the posted write.

If the CS wakes up from the semaphore wait before the MMIO RING_TAIL write
arrives, it can observe HEAD =3D=3D TAIL, assume the ring is empty, and go =
idle.
The context is then switched out. When the delayed MMIO write eventually
arrives, it hits an idle engine (or worse, a different context), failing to
execute the submitted ULLS job and hanging the migration queue.

Because xe_migrate_ulls_exit would then hang indefinitely waiting for the
unexecuted job's fence, and the migration queue handles GPU page faults and
SVM prefetches, this can hang workloads utilizing SVM.

Does this violate PCIe ordering requirements for flushing posted writes bef=
ore
dependent memory writes?

> +	}
> +
>  	if (!exec_queue_enabled(q)) {
>  		action[len++] =3D XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
>  		action[len++] =3D q->guc->id;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904022207.3490=
018-1-matthew.brost@intel.com?part=3D22
