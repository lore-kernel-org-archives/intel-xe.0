Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23AFC61DFD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 01:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4E910E01F;
	Tue,  1 Sep 2026 01:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aBSqpQkz";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3FA10E01F
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 01:36:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F1C30601DE;
 Tue,  1 Sep 2026 01:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886601F00A3D;
 Tue,  1 Sep 2026 01:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788226611;
 bh=i18teffgxpv9nw6eiUIyPr7cxYlkLZzuxOC7iS/J4Ac=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=aBSqpQkzVobfCcFzQvlxM0iiqNHQZz2B84nPc4eCdoKXByL1Qo7aIOZwlWujpRkPs
 oWPPMs0dwtSFlXJP76WyvfUpcvykizse4fys8JXP7IS8ouwS0F2S6UQrH2MA9dCSZ2
 JxoWl0qR67mJsgaZEASDpfNhQpSCRpHqx8+HNzL91Wu0jZFhUMoEWKwzrCvirU1nb+
 iRlvtVjG+AbfGKlpUUjihXv+HPYrd0GMNHNfxbYCKSKtmK+wXJNYSRkRdbMbVMerBE
 lHep6/xj9hu4U/gMg250XBhhg9TADIb9sv2SNkm3RwGSe5ytoUxkyZ8NWfNgDNAeCQ
 NRiklPPenxbyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/xe: Read scheduler message opcode under lock
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260901011712.2617466-1-matthew.brost@intel.com>
References: <20260901011712.2617466-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 01:36:51 +0000
Message-Id: <20260901013651.886601F00A3D@smtp.kernel.org>
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
- [High] Unprocessed STATIC_MSG_CLEANUP messages leak the entire xe_exec_qu=
eue and drm_device reference when the device is wedged.
--

commit 1cf668d3355bee8d104370398164a7bf010492ee
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Read scheduler message opcode under lock

This commit modifies the DRM Xe scheduler to read the message opcode
under the message lock, as the opcode is only guaranteed to remain
stable while the message is on the pending list for static messages.

> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/x=
e_gpu_scheduler.c
> index 9c8004d5dd915..d656db758cb3c 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
[ ... ]
> @@ -42,13 +46,14 @@ static void xe_sched_process_msg_work(struct work_str=
uct *w)
>  	struct xe_gpu_scheduler *sched =3D
>  		container_of(w, struct xe_gpu_scheduler, work_process_msg);
>  	struct xe_sched_msg *msg;
> +	unsigned int opcode;
> =20
>  	if (drm_sched_is_stopped(&sched->base))
>  		return;

[Severity: High]
This isn't a bug introduced by this patch, but this early return appears
to leak the xe_exec_queue memory and a reference to drm_device when the
device is wedged.

When the device is wedged, xe_sched_submission_stop() sets sched->pause_sub=
mit
to true and cancels the message processing worker.=20

Later, when queues are destroyed (for example via FD close or
guc_submit_fini()), guc_exec_queue_destroy() adds a STATIC_MSG_CLEANUP mess=
age
to the scheduler's message list:

drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_destroy() {
    ...
    struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_CLEANUP;

    guc_exec_queue_add_msg(q, msg, CLEANUP);
    ...
}

Because the scheduler is stopped, xe_sched_process_msg_work() immediately
returns without processing the cleanup message.

As a result, the queue's async destruction
(__guc_exec_queue_process_msg_cleanup() -> guc_exec_queue_do_destroy()) is
never invoked.

This can be reached by any user that opens the DRM FD, runs a workload that
causes a GPU hang (triggering a wedge), and then closes the FD.

Could this be modified to allow processing of cleanup messages even when the
scheduler is stopped, or handled in an alternate teardown path, so we don't
permanently leak the xe_exec_queue and prevent the DRM module from being
cleanly unloaded?

> =20
> -	msg =3D xe_sched_get_msg(sched);
> +	msg =3D xe_sched_get_msg(sched, &opcode);
>  	if (msg) {
> -		sched->ops->process_msg(msg);
> +		sched->ops->process_msg(msg, opcode);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901011712.2617=
466-1-matthew.brost@intel.com?part=3D1
