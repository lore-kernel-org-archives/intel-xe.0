Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69EFCA9EDE
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 03:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677E110E6FF;
	Tue, 13 Oct 2026 03:00:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7015410E6FF
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 03:00:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 58D28408D7;
 Tue, 13 Oct 2026 03:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1681F000FF;
 Tue, 13 Oct 2026 03:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791860434;
 bh=VvKG1u2QJco2RJlHsDRb5hxaZSQJr0av8KF38efY57c=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=fS2s3SABbZgTq8AJAE0jqeCrwcmSC8Pzcex2isTp/XICp9Lg1BQ/6Bxv7wYxd03+U
 DJlFXqi2/sFbpdn3GM1M84SmS/9QAkYILvLsHDj8hbD7xwldBDlBsGi6VfGra1H9as
 1RGEKCB17my72687tA/jgdtI353lLnFsQQrGPyMDKH2OCD9GqxX7hKEbaSA6+ley7l
 oxpx3ZUC2j8arqjm86omiWdKIILe3dV0XrZ02BJ5Qco0snhjnRfEsbRSX4DLTtdqIO
 5NrZuGKWiWYo4qheTYwdYLqnLJTzo6cN09sQ1PcHBL59cUirBo8nI2zaDf7fRhDjcX
 bsrIqYujMoAcQ==
Message-ID: <sashiko-outbox-168882@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] drm/xe: Read scheduler message opcode under lock
To: "Daniel Charles" <daniel.charles@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013023442.206915-2-daniel.charles@intel.com>
References: <20261013023442.206915-1-daniel.charles@intel.com>
 <20261013023442.206915-2-daniel.charles@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 03:00:33 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] drm/xe: data race on msg->opcode in tracepoint
- [Medium] drm/xe: memory leak of dynamically allocated scheduler messages
--

commit f8887f43a6b200067866b162e2ad500eb6e16175
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Read scheduler message opcode under lock

For static scheduler messages, the opcode is only guaranteed to remain
stable while the message is on the pending message list. Read the opcode
under the message lock before removing the message from the pending list,
and pass it through the processing pipeline.

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

[Severity: Medium]
When the scheduler is stopped, does this early return leak dynamically
allocated messages?

If untrusted userspace triggers an error path by queuing property change
messages (like SET_SCHED_PROPS) and then causes the queue to hang, wedge, or
close during teardown, this worker exits without draining or freeing pending
dynamically allocated messages.

During queue teardown, xe_sched_fini() and other cleanup paths fail to
traverse sched->msgs and kfree() dynamically allocated messages before the
list and lock are destroyed.

> -	msg =3D xe_sched_get_msg(sched);
> +	msg =3D xe_sched_get_msg(sched, &opcode);
>  	if (msg) {
> -		sched->ops->process_msg(msg);
> +		sched->ops->process_msg(msg, opcode);
> =20
>  		xe_sched_process_msg_queue_if_ready(sched);
>  	}

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 7ce73489c35fc..c4ef3e9bf7a18 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2056,16 +2056,17 @@ static void __guc_exec_queue_process_msg_cgp_sync=
(struct xe_sched_msg *msg,
>  #define MSG_HEAD	BIT(9)
>  #define MSG_PM_REF	BIT(10)
> =20
> -static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
> +static void guc_exec_queue_process_msg(struct xe_sched_msg *msg,
> +				       unsigned int opcode)
>  {
>  	struct xe_device *xe =3D guc_to_xe(exec_queue_to_guc(msg->private_data)=
);
>  	int idx;
> -	bool pm_ref =3D !!(msg->opcode & MSG_PM_REF);
> +	bool pm_ref =3D !!(opcode & MSG_PM_REF);
>  	bool bound =3D drm_dev_enter(&xe->drm, &idx);
> =20
>  	trace_xe_sched_msg_recv(msg);

[Severity: Medium]
Does this tracepoint still contain a data race by reading the unstable
msg->opcode?

The patch addresses a data race by extracting msg->opcode into a local
variable under msg_lock, because static messages can be concurrently
re-enqueued modifying their opcode outside the lock. However,
trace_xe_sched_msg_recv(msg) continues to read msg->opcode directly via the
xe_sched_msg event class:

drivers/gpu/drm/xe/xe_trace.h:DECLARE_EVENT_CLASS(xe_sched_msg) {
    ...
    __entry->opcode =3D msg->opcode;
    ...
}

Because trace_xe_sched_msg_recv() is called here with the message pointer,
rather than the stable extracted opcode, this leaves a data race where the
tracepoint may log an incorrect opcode or trigger KCSAN warnings.

> -	switch (msg->opcode & OPCODE_MASK) {
> +	switch (opcode & OPCODE_MASK) {
>  	case CLEANUP:
>  		__guc_exec_queue_process_msg_cleanup(msg, bound);
>  		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013023442.2069=
15-1-daniel.charles@intel.com?part=3D1
