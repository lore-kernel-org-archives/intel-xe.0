Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495E7CA9EC5
	for <intel-xe@archiver.kernel.org>; Sat, 10 Oct 2026 09:28:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D653210E23F;
	Sat, 10 Oct 2026 09:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bBztbDy9";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8291910E23F
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Oct 2026 09:28:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4F2D041B6F;
 Sat, 10 Oct 2026 09:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D6B1F000FF;
 Sat, 10 Oct 2026 09:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791624505;
 bh=ipBWLZNDedUqQ9VVh4HGS16FQfkhzIWsCEFVjBjWrpM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=bBztbDy9UQgqEZX9Ch1O1c9C+tJr8SMun70Rwq8TzYei1Nb4CLb6ZpORx5J7oFQMH
 N0XF/7z9seuTQUaN4KBS458DhAedKzkYMC7PtrbQ3hbv3G/3QrQwncIdjLL9HdRz8W
 2/KF7b08z+/gJ2wzW9NfLcTFpLXWGuI3rg8c6IB0qDJj7ikP6vn0q5CnLs5IBozoPj
 IUY/iaYWzl/AAARLQeqpQna6ir7KkcH9v4th+oKqu8Yyc8wdU7mkc40c6pDpoZIMz4
 6EPUO6uRFU0V8qMLFykljI39W3NxgsSDmERqyCKZ1H6slPJgsL+pkhDZAnwYLkhikA
 z+01GX9X1aosg==
Message-ID: <sashiko-outbox-166397@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] drm/xe/ras: Move xe_ras_process_errors() to xe_ras
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261010090718.68308-6-raag.jadav@intel.com>
References: <20261010090718.68308-1-raag.jadav@intel.com>
 <20261010090718.68308-6-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 09:28:24 +0000
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
- [High] xe: early wedging causes probe failure and dropped uevents
--

commit eda4360aefb71a5fa669e79a246b3deb2191fe3f
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/ras: Move xe_ras_process_errors() to xe_ras
   =20
This commit moves xe_ras_process_errors() from xe_device_probe() to
xe_ras_init() to process and log boot-time RAS errors earlier in the
probe sequence.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1087,13 +1087,6 @@ int xe_device_probe(struct xe_device *xe)
> =20
>  	detect_preproduction_hw(xe);
> =20
> -	/*
> -	 * Process and log any errors detected by hardware. Possible results can
> -	 * include declaring the device as wedged, which must be done only after
> -	 * xe_wedge_fini() is registered.
> -	 */
> -	xe_ras_process_errors(xe);
> -
>  	err =3D devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  	if (err)
>  		goto err_unregister_display;

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -933,6 +933,13 @@ void xe_ras_init(struct xe_device *xe)
>  	if (IS_ENABLED(CONFIG_PCIEAER))
>  		ras_usp_aer_init(xe);
> =20
> +	/*
> +	 * During probe, process and log any errors detected by firmware while =
the driver was not
> +	 * loaded. Critical errors such as Punit and CSC are reported through P=
code init failure,
> +	 * causing the driver to enter survivability mode.
> +	 */
> +	xe_ras_process_errors(xe);

[Severity: High]
Does moving xe_ras_process_errors() here cause the driver to fail probe ins=
tead
of remaining loaded in a wedged state?

If xe_ras_process_errors() encounters a fatal error, it sets the wedged fla=
g.
Because xe_ras_init() now runs before xe_gt_init(), subsequent GuC CT
operations during GT initialization will fail due to the wedged state:

drivers/gpu/drm/xe/xe_guc_ct.c:__guc_ct_send_locked() {
	if (xe_wedged(ct_to_xe(ct))) {
		ret =3D -ENOTRECOVERABLE;
		goto out;
	}
	...
}

This would cause xe_device_probe() to abort entirely.

Additionally, when the wedge worker calls drm_dev_wedged_event(), won't the
uevent be silently dropped?

drivers/gpu/drm/drm_drv.c:drm_dev_wedged_event() {
	...
	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
}

At this point in xe_ras_init(), drm_dev_register() hasn't been called yet, =
so
the DRM device kobject hasn't been added to sysfs. The original location in
xe_device_probe() was placed safely after GT initialization and DRM device
registration.

> +
>  	ret =3D devm_device_add_group(xe->drm.dev, &gpu_health_group);
>  	if (ret)
>  		xe_err(xe, "Failed to create GPU health sysfs, err=3D%d\n", ret);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010090718.6830=
8-1-raag.jadav@intel.com?part=3D5
