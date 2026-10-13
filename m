Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28055CC6B1C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 20:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEE110E958;
	Tue, 13 Oct 2026 20:32:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8189310E958
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 20:32:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4C5BF43F49;
 Tue, 13 Oct 2026 20:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055E61F00898;
 Tue, 13 Oct 2026 20:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791923546;
 bh=CR8L1/1RGnXEQZPsJqdMzunn6hW+0ZRSRdrlq1RsKtI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=RfzhsJIUZDZg9nQROrcKyFQiKTR6+w5V57L/08BkBJJtzPFGyIBenjnaBKiote8jj
 th+8la4NGaFZVQC62cPmQeCV7fvNuZO6b3SEq0E05y9IC3Wpnwf45wlWMW8Mi7pU/7
 y2xLMeZyGpTJI7qi0Scgbrrj6W+v3HU1qq8ay1YGdvT/czxjlXJLsLjlmzfzhVIEPR
 WNdnVpjfzGQhQYyXgllwU3sdvsh/QOHBknr/9DbynSUe0G+ItNCkuY4chbmO4GUWfU
 WV/M1gmM7qfhpHnB2+xa6poOePb2rZIgWfXzkPkgkfUIgp6956NA2XsyFJDu9m4QKc
 5dT5UU+ccSwWg==
Message-ID: <sashiko-outbox-170465@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] drm/xe: Read scheduler message opcode under lock
To: "Daniel Charles" <daniel.charles@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013201508.514480-2-daniel.charles@intel.com>
References: <20261013201508.514480-1-daniel.charles@intel.com>
 <20261013201508.514480-2-daniel.charles@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 20:32:25 +0000
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
- [Medium] drm/xe: Data race and incorrect logging of msg->opcode in tracep=
oint
--

commit f517649f63cf100c02e712b78a83d6be3724e252
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Read scheduler message opcode under lock

For static scheduler messages, the opcode is only guaranteed to remain
stable while the message is on the pending message list. Read the opcode
under the message lock before removing the message from the pending list,
and pass it through the processing pipeline.

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
Since the commit stabilizes the opcode under the message lock and passes it
in as the opcode parameter, does calling trace_xe_sched_msg_recv() outside
the lock still risk a data race?

Looking at drivers/gpu/drm/xe/xe_trace.h:

DECLARE_EVENT_CLASS(xe_sched_msg,
    ...
    TP_fast_assign(
           __assign_str(dev);
           __entry->opcode =3D msg->opcode;
           ...

It appears the trace macro dereferences msg->opcode unprotected, which
could log the opcode of a re-enqueued message rather than the opcode
currently being processed. Should the trace event be updated to accept the
stabilized opcode parameter instead?

> =20
> -	switch (msg->opcode & OPCODE_MASK) {
> +	switch (opcode & OPCODE_MASK) {
>  	case CLEANUP:
>  		__guc_exec_queue_process_msg_cleanup(msg, bound);
>  		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013201508.5144=
80-1-daniel.charles@intel.com?part=3D1
