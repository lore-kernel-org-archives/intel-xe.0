Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BB2C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 04:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC8210E5D2;
	Mon, 31 Aug 2026 04:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XEXHdGQs";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD61010E5D2
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 04:40:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C921B60120;
 Mon, 31 Aug 2026 04:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5620E1F000E9;
 Mon, 31 Aug 2026 04:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788151256;
 bh=r6TCJHr2ef8CcaEFvvFPZCEClWzUkiQA4uLZswru0KY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=XEXHdGQsnMH1UGXlouxu7xmABEaO3dJNhugQFmUALeAFadKq5VVs05HaHjSlpqeei
 FldeoPy//PNt0BamG2WTXD3wwTLlED3b9Qe+DKYInoIcxfwuBTZe4WdNUqdtFnuiYZ
 iIVhnU3rKfTvx4QLRNmfCJH0p6jmuSOs+Em3PXcyfuYkn4eL2aAaq7Fqkufa6g3eZ3
 zCxklxUe5UOvd2tyxY/Bo2vdnkrIzTsEoWa6xYWr84X54qTv++1ehtzvwEp8ITHzCx
 aY1ZDtv0Cu3SJJurcNtlfJxc8BxhVl+w4nBZKR4ZKxpE76fuOFSqMWFKgSEOmInwKB
 6wp1fbAKEgZWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] drm/xe: Make xe_device_declare_wedged() IRQ safe
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831042633.1760474-3-raag.jadav@intel.com>
References: <20260831042633.1760474-1-raag.jadav@intel.com>
 <20260831042633.1760474-3-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 04:40:55 +0000
Message-Id: <20260831044056.5620E1F000E9@smtp.kernel.org>
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
- [High] Uninitialized work_struct leads to list corruption and kernel pani=
c if an IRQ triggers during device probe.
--

commit 7cfc61b6d67f6291a4e51db20047caa91bfb3397
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe: Make xe_device_declare_wedged() IRQ safe

This commit defers wedge handling into a dedicated worker so that
xe_device_declare_wedged() can be called in IRQ context. This is required
for declaring the device as wedged on catastrophic errors received via IRQs.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 396d02eb2af83..150629ee4ad13 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
[ ... ]
> @@ -1148,7 +1159,7 @@ int xe_device_probe(struct xe_device *xe)
> =20
>  	detect_preproduction_hw(xe);
> =20
> -	err =3D drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +	err =3D xe_device_wedged_init(xe);

[Severity: High]
Does this initialize the work_struct too late in the probe sequence?

If a hardware error interrupt (like a MERT CAT error) fires during the wind=
ow
after interrupts are enabled (via xe_irq_install() called earlier in
xe_device_probe()) but before this initialization completes, the interrupt
handler will call xe_device_declare_wedged().

This would attempt to schedule the uninitialized xe->wedged.work structure,
potentially leading to list corruption and a kernel panic in the workqueue
core.

>  	if (err)
>  		goto err_unregister_display;
[ ... ]
> @@ -1483,26 +1514,11 @@ void xe_device_declare_wedged(struct xe_device *x=
e)
>  			    "For recovery procedure, refer to %s\n"
>  			    "Please file a _new_ bug report at %s\n",
>  			    WEDGED_URL, XE_BUG_URL);
> =20
> -		for_each_gt(gt, xe, id)
> -			xe_gt_declare_wedged(gt);
> =20
> -	if (xe_device_wedged(xe)) {
> -		/*
> -		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> -		 * hangs, so wedge the device with 'none' recovery method and have
> -		 * it available to the user for debugging.
> -		 */
> -		if (xe->wedged.mode =3D=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> -		/* If no wedge recovery method is set, use default */
> -		else if (!xe->wedged.method)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> -						    DRM_WEDGE_RECOVERY_BUS_RESET);
> -
> -		/* Notify userspace of wedged device */
> -		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> +		schedule_work(&xe->wedged.work);

[Severity: High]
Could this schedule an uninitialized work_struct?

If xe_device_declare_wedged() is invoked from an early interrupt handler
before xe_device_wedged_init() completes, this will attempt to queue
xe->wedged.work.=20

Additionally, the loop right before this calls xe_gt_declare_wedged(gt),
which could queue an uninitialized gt->wedge.worker if xe_gt_init() hasn't
completed for that GT yet.

>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831042633.1760=
474-1-raag.jadav@intel.com?part=3D2
