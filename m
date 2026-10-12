Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAEBCA9EDE
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 19:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293BE10E63F;
	Mon, 12 Oct 2026 19:47:15 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AFA10E668
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 19:47:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 02C1760142;
 Mon, 12 Oct 2026 19:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825871F0089B;
 Mon, 12 Oct 2026 19:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791834427;
 bh=zbhHgu4t8ptVNiK845ekutYGumFwJUbXcLFykAzQOTY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=cEmrHrdddeR+iix0XgEcFKjl0GkfOOmSJ0x2LVSnuRrBb1Ohfc9Aq6OfWuCU57/Zi
 G1wXmoADHSYpRh853xVsMFP1wLgm9YWhHHFmT7ZgD9S4VZXn/j9cctfjP17PqYXUvC
 GlUZ8RQHQUTPfyfyn70ShIQM9W/60ojDzQjtH9hiAY+/z0wpYR2WLiidd99EAcblmV
 b8MwNkXPnfu6ME4q5YjSmzyAwXgJHdAu2kH+uMFjnBK2O8V1Xook6plN3fK7UJY2fi
 gZfKM0TjTpOcRPsRBzi4lvzsxyAOty6EvUny1Aenh+1wjP9kae3VJbB/32vHjQVlNa
 6Na6B4JQOeDSw==
Message-ID: <sashiko-outbox-168584@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/guc: Handle GuC semaphore instruction field
 check error
To: "Jesus Narvaez" <jesus.narvaez@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261012192828.226700-2-jesus.narvaez@intel.com>
References: <20261012192828.226700-2-jesus.narvaez@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 19:47:07 +0000
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
- [High] drm/xe/guc: UAF in invalid semaphore handler due to lockless g2h l=
ookup
--

commit cebb8bdaf89f1a8799fcb42b7d4d2d9171193941
Author: Jesus Narvaez <jesus.narvaez@intel.com>

drm/xe/guc: Handle GuC semaphore instruction field check error

Starting on NVL-P and newer platforms which support 64 bit semaphores,
this commit opts in to enable GuC to check semaphore instruction fields.
It adds a handler to deal with contexts marked as unrunnable if the
check fails.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3708,6 +3708,53 @@ int xe_guc_exec_queue_cgp_sync_done_handler(struct=
 xe_guc *guc, u32 *msg, u32 le
[ ... ]
> +int xe_guc_context_invalid_semaphore_instruction_field_handler(struct xe=
_guc *guc,
> +							       u32 *msg, u32 len)
> +{
[ ... ]
> +	q =3D g2h_exec_queue_lookup(guc, guc_id);
> +	if (unlikely(!q))
> +		return -EPROTO;
> +
> +	xe_gt_info(gt,
> +		   "GuC: invalid semaphore instruction field! guc_id=3D%d, type=3D%u l=
rca=3D0x%llx, token=3D0x%llx, data=3D0x%llx",
> +		   guc_id, type, lrc_address, token, data);
> +
> +	trace_xe_guc_invalid_semaphore_instruction_field(q);
> +
> +	/* Treat the same as engine reset */
> +	xe_guc_exec_queue_reset_trigger_cleanup(q);

[Severity: High]
Could this lead to a use-after-free during device unplug?

The handler looks up the execution queue using g2h_exec_queue_lookup(),
which fetches the pointer locklessly via xa_load() without acquiring a kref.

While the normal deregistration flow guarantees the queue exists until
processing DEREGISTER_CONTEXT_DONE, this is bypassed during device unplug
when drm_dev_enter() returns false. In the unplug scenario,
__guc_exec_queue_process_msg_cleanup directly queues asynchronous destructi=
on
which frees the queue via kfree().

Because device teardown does not immediately stop the CT worker, G2H messag=
es
can be processed concurrently with queue destruction. If the pointer is fet=
ched
by xa_load() just before it is removed and freed, the handler will derefere=
nce
freed memory when calling the tracepoint and triggering cleanup.

Is there a need to validate the queue lifetime or acquire a reference here?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012192828.2267=
00-2-jesus.narvaez@intel.com?part=3D1
