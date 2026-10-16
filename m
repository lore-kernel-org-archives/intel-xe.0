Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4EACC6B2D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 03:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3313B10E2E4;
	Fri, 16 Oct 2026 03:28:34 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD6010E2E4
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 03:28:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5B734413A0;
 Fri, 16 Oct 2026 03:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117F31F000C4;
 Fri, 16 Oct 2026 03:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792121307;
 bh=ollyiL4fGpPNgSuZSjFS0hVdMvAWlMNeCra0lsCfIkM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=CpwaxDkgFZL2NAbNVH5g/l7BpN96/NnclaZRQglOLZX3crxCuihKaccEHeYruf0DY
 Hj7UNhHP11PmKsTdJGmGNW4ZbuyUQDvh5pNigGKBexma0ulEPU8m5UZXnSKdBaQecy
 6Y/PKw8HyhU5pKlGPS+uGnGFUe2DHOXHjURi8bNtZWBklOzkDGCd2prh3/9scLPiUR
 eH9UncUvJxH+GXb4Y8d7H/p9AkIjrmltIILZT8QUYyeS7+5xaFDUguUVXmL41VLrJy
 wPRGkn+BoDIdcaXpyNMIHfTZoX4ElktA3lIN9ReE/+B4D96C5z6OTheQ9TGWdPeIg+
 uWyfBcf+rKEWQ==
Message-ID: <sashiko-outbox-173668@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/7] drm/xe: Make xe_device_declare_wedged() IRQ safe
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261016031559.427941-5-raag.jadav@intel.com>
References: <20261016031559.427941-1-raag.jadav@intel.com>
 <20261016031559.427941-5-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 03:28:26 +0000
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
- [High] drm/xe: PM runtime ref leak and state corruption due to unconditio=
nal wedge clear in PCI resume
--

commit 0cb34bdb3568638428842c0f75e51ddb9f3b4928
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe: Make xe_device_declare_wedged() IRQ safe

This commit makes xe_device_declare_wedged() safe to call in IRQ context
by deferring the uevent emission and other blocking calls to a dedicated
workqueue. This allows the device to be declared wedged on catastrophic
errors received via IRQ.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 8abe42aa7cb5d..4205cfee68a76 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c

[ ... ]

> @@ -1423,22 +1439,21 @@ void xe_device_declare_wedged(struct xe_device *x=
e, unsigned long method)
>  			    "For recovery procedure, refer to %s\n"
>  			    "Please file a _new_ bug report at %s\n",
>  			    WEDGED_URL, XE_BUG_URL);
> -	}
> =20
> -	for_each_initialized_gt(gt, xe, id)
> -		xe_gt_declare_wedged(gt);
> +		for_each_initialized_gt(gt, xe, id)
> +			xe_gt_declare_wedged(gt);
> =20
> -	if (xe_device_wedged(xe)) {
>  		/*
>  		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
>  		 * hangs, so wedge the device with 'none' recovery method and have
>  		 * it available to the user for debugging.
>  		 */
>  		if (xe->wedged.mode =3D=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> -			method =3D DRM_WEDGE_RECOVERY_NONE;
> +			xe->wedged.method =3D DRM_WEDGE_RECOVERY_NONE;
> +		else
> +			xe->wedged.method =3D method;
> =20
> -		/* Notify userspace of wedged device */
> -		drm_dev_wedged_event(&xe->drm, method, NULL);
> +		schedule_work(&xe->wedged.work);

[Severity: High]
Does this code leak the PM runtime reference and silently un-wedge the devi=
ce
if a concurrent PCI error recovery happens?

Because this patch makes xe_device_declare_wedged() safe to call in IRQ
context, the race window with PCI error recovery is widened. When the device
is wedged, a PM reference is acquired at the start of this function:

drivers/gpu/drm/xe/xe_device.c:xe_device_declare_wedged() {
	if (!atomic_xchg(&xe->wedged.flag, 1)) {
		xe->needs_flr_on_fini =3D true;
		xe_pm_runtime_get_noresume(xe);
    ...

If xe_device_declare_wedged() is triggered by a fatal hardware error between
the PCI error recovery subsystem calling xe_pci_error_detected() and
xe_pci_error_resume(), the flag can be cleared unconditionally:

drivers/gpu/drm/xe/xe_pci_error.c:xe_pci_error_resume() {
    ...
    atomic_set(&xe->wedged.flag, 0);
    ...
}

This wipes out the concurrent wedging event without releasing the acquired
PM reference. Later, during device teardown, the cleanup function fails to
drop the leaked PM reference because the flag was incorrectly cleared:

drivers/gpu/drm/xe/xe_device.c:xe_device_wedged_fini() {
    ...
    if (atomic_read(&xe->wedged.flag))
        xe_pm_runtime_put(xe);
    ...
}

Can this lead to a permanent PM runtime reference leak and state corruption?

>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016031559.4279=
41-1-raag.jadav@intel.com?part=3D4
