Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20402C61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 20:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42AC10E604;
	Tue, 25 Aug 2026 20:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dwy90mBx";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1FF10E604
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 20:29:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E2E9960053;
 Tue, 25 Aug 2026 20:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2271F000E9;
 Tue, 25 Aug 2026 20:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787689793;
 bh=phD5dq0xlYhNuQWCl832OctbXDwwHJV+XFNlM7xVAio=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=dwy90mBxNT+1KlVfsepN7okYS1VuTrvf/RgUUPnGYEjAAIYkDy0K50VKpYJDc3rVS
 5OgdQJe4iT/esQCE1BQ99lRY6HzK1UY95JQ2bSgyiyV+dY/Jl3uSh8U/BN7BHhZ1kA
 T8WILkq8Xvz6tzCNtiIX+w8T+lTEHXDNs9SCtIBFHoIKx+Vvoh7tcaOweDb6Y+QjA5
 dT2JRypCuBfLZk0KMbUwPfywmZPo1ONILDX7GZLEXtZnWESi5iqxAetcohALJHJzNf
 wmYoN+bIdu523Gi4YJohFf7UbVQu40m82ZVReLaDo3K+aFD4coFUCiDDIFx2xcfpTB
 lQBjCbRL8nGcg==
From: sashiko-bot@kernel.org
Subject: Re: [CI] drm/xe: Disable scheduling early on FD close to avoid CAT
 error cascade
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825201148.1780176-1-matthew.brost@intel.com>
References: <20260825201148.1780176-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 20:29:52 +0000
Message-Id: <20260825202953.6D2271F000E9@smtp.kernel.org>
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
- [High] The `KILL` message handler unconditionally accesses hardware witho=
ut checking if the device is physically present, which can lead to crashes =
on hot-unplug.
--

commit 6b34abf1203c0a3c2fe102d1601b9f19c5a65d6b
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Disable scheduling early on FD close to avoid CAT error cascade

This commit mitigates CAT error cascades by eagerly sending a self-message
to disable scheduling outside the serialized TDR path when an FD is closed.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 99d8c807ff056..8b8972b2ebea1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c

[ ... ]

> @@ -1969,12 +1969,22 @@ static void __guc_exec_queue_process_msg_cgp_sync=
(struct xe_sched_msg *msg,
>  		guc_exec_queue_send_cgp_sync(q, 0);
>  }
> =20
> +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg)
> +{
> +	struct xe_exec_queue *q =3D msg->private_data;
> +	struct xe_exec_queue *primary =3D xe_exec_queue_multi_queue_primary(q);
> +
> +	if (exec_queue_enabled(primary))
> +		disable_scheduling(primary, true);
> +}

[Severity: High]
Could this lead to an MMIO crash on device hot-unplug?

When a hot-unplug event occurs, the device is disconnected and
drm_dev_enter() will return false, indicating the hardware is gone.
If userspace then closes the file descriptor, guc_exec_queue_kill()
will send the KILL message.

Because disable_scheduling() eventually invokes xe_guc_ct_send(), which
performs an unconditional MMIO write (xe_mmio_write32()), calling it
without verifying if the device is still physically present might trigger
a fatal bus error (Machine Check Exception).

Should this handler accept and check the bound state before touching the
hardware, similar to how other message handlers like
__guc_exec_queue_process_msg_cgp_sync() handle it?

>  #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
>  #define SET_SCHED_PROPS			2
>  #define SUSPEND				3
>  #define RESUME				4
>  #define SET_MULTI_QUEUE_PRIORITY	5
>  #define CGP_SYNC_MSG			6
> +#define KILL				7
>  #define OPCODE_MASK	0xf
>  #define MSG_LOCKED	BIT(8)
>  #define MSG_HEAD	BIT(9)
> @@ -2008,6 +2018,9 @@ static void guc_exec_queue_process_msg(struct xe_sc=
hed_msg *msg)
>  	case CGP_SYNC_MSG:
>  		__guc_exec_queue_process_msg_cgp_sync(msg, bound);
>  		break;
> +	case KILL:
> +		__guc_exec_queue_process_msg_kill(msg);
> +		break;

[Severity: High]
Does this miss passing the bound state to the KILL handler?

At the start of guc_exec_queue_process_msg(), the bound state is acquired
via drm_dev_enter():

    bool bound =3D drm_dev_enter(&xe->drm, &idx);
   =20
Other handlers like __guc_exec_queue_process_msg_cgp_sync(msg, bound)
receive this state so they can avoid hardware access if the device is gone.
Since __guc_exec_queue_process_msg_kill() isn't receiving bound, it seems
to bypass this safety check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825201148.1780=
176-1-matthew.brost@intel.com?part=3D1
