Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A21CA6017
	for <intel-xe@archiver.kernel.org>; Sat, 10 Oct 2026 09:19:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D9C10E042;
	Sat, 10 Oct 2026 09:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kQ+XBWGT";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A53A10E042
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Oct 2026 09:19:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2445042A37;
 Sat, 10 Oct 2026 09:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80961F000FF;
 Sat, 10 Oct 2026 09:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791623994;
 bh=8RQtEp/CEzS5289JDnul8bprin1z0OD8zlcuwsmovJQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=kQ+XBWGTCn4CRLa0NWfyFghMAgK8/CbNU39BViBrzuYqNBwaF6VJHmdJlgGcQ3KSN
 N/i9DI33rxBivsjnfZCUinO+e5fxXF5FCOXTPt7ihDD5kIk2n+/971ucPHQsQfB0V+
 a1HwzbeNCHjwyadh5uqgICTGBxe4O8L7UBuXMZS34cGUhpjJoZr7fPMBbWamTXvQBV
 O/563WMDy8KFIGJLec2sdps9FhUMMchWSu7wxO1zIA17ZE3yH7uQoZIsMguKJxq0uD
 IvigLSCN3JgAomI01YzVldmm1i0k2dNqBbVw9PefbgQLceoG0yepABxP/xVeOujuqx
 Yj7MCfeniuQDQ==
Message-ID: <sashiko-outbox-166393@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] drm/xe: Make xe_device_declare_wedged() IRQ safe
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261010090718.68308-4-raag.jadav@intel.com>
References: <20261010090718.68308-1-raag.jadav@intel.com>
 <20261010090718.68308-4-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 09:19:53 +0000
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
- [Medium] drm/xe: data race on xe->wedged.method due to wedged_work concur=
rent execution
--

commit 1b950e6e1cdfbf78ff8ea7b58f37f030e514ddf2
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe: Make xe_device_declare_wedged() IRQ safe

Currently, xe_device_declare_wedged() implementation wedges the GTs and
sends wedged uevent to userspace. This is problematic for usecases which
require declaring the device as wedged in IRQ context, as it allocates
memory for event buffer and acquires mutexes deep into it's call path.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 1c3281c8d2863..f4536583e57ce 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
[ ... ]
> @@ -1392,6 +1400,26 @@ void xe_device_set_wedged_method(struct xe_device =
*xe, unsigned long method)
>  	xe->wedged.method =3D method;
>  }

[Severity: Medium]
Could this cause a data race on xe->wedged.method?

Since xe_device_set_wedged_method() can be called from multiple RAS error
handlers in a loop while processing hardware errors, it might write to
xe->wedged.method while the newly added asynchronous worker is actively
reading or modifying it.

> +static void wedged_work(struct work_struct *work)
> +{
> +	struct xe_device *xe =3D container_of(work, struct xe_device, wedged.wo=
rk);
> +
> +	/*
> +	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> +	 * hangs, so wedge the device with 'none' recovery method and have
> +	 * it available to the user for debugging.
> +	 */
> +	if (xe->wedged.mode =3D=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> +	/* If no wedge recovery method is set, use default */
> +	else if (!xe->wedged.method)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> +					    DRM_WEDGE_RECOVERY_BUS_RESET);
> +
> +	/* Notify userspace of wedged device */
> +	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> +}

[Severity: Medium]
Is it possible for the wedged method to be corrupted here?

If xe_ras_process_errors() processes hardware errors, the first error might
set xe->wedged.method and call xe_device_declare_wedged() which schedules
wedged.work.

If the loop continues and a second error sets xe->wedged.method again, this
sequential write could race with this worker concurrently reading and
modifying xe->wedged.method on another CPU. This could lead to a corrupted
or incorrect recovery method being passed to drm_dev_wedged_event().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010090718.6830=
8-1-raag.jadav@intel.com?part=3D3
