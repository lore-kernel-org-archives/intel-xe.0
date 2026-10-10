Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1529FCA9EBE
	for <intel-xe@archiver.kernel.org>; Sat, 10 Oct 2026 09:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2C810E042;
	Sat, 10 Oct 2026 09:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UZkWLZ9z";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE8110E042
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Oct 2026 09:17:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CBA9B60052;
 Sat, 10 Oct 2026 09:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6D61F000FF;
 Sat, 10 Oct 2026 09:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791623832;
 bh=tTwfcrTbLxJE8U3RGdKOJwC4Lq5Ty+jEYxhuHd9Ry/0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=UZkWLZ9zzluk4adDo2VC8KAaKRqjTxXD5w9q4zejQf4Uuz/2JeZhjaHUD68R2bxKJ
 1eFptdpo4S4mupBgkQTfg5rYJ+tCpemLcRxC14+k4DAKjAHRBZGiWwVKXnxd1u21vb
 dww9aEsGhChYA7/JvzZRxM8LWhgqxKu8c3ux5P7PW+Z1vBLTTHfOftcDQRaoVVHWGM
 WYWCiUxJ3a1xHdqUmeUiIKYtAU91CBV8WiqipUcMEGmkO/m9kzLWCiefkzKbdIrpj1
 sWPgOVuTnRB+6HgFAu4O772HfZElhIioWGy6oJVL67W+/PWU9CTHTgIbFqodqZOmHL
 j9PY/EJilvTXw==
Message-ID: <sashiko-outbox-166391@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] drm/xe/gt: Use GT ordered workqueue for wedging
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261010090718.68308-2-raag.jadav@intel.com>
References: <20261010090718.68308-1-raag.jadav@intel.com>
 <20261010090718.68308-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 09:17:11 +0000
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
- [High] workqueue: uninitialized work_struct queued in PCI error handler
- [Medium] locking: Missing memory barriers for gt->initialized flag
--

commit f20d3458e3b35619236177bed70acaaa58c1bccf
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/gt: Use GT ordered workqueue for wedging

This commit introduces a worker for GT specific wedge handling and queues t=
he
teardown on the GT ordered workqueue to avoid disrupting the scheduler for
in-flight jobs. It also adds a for_each_initialized_gt() macro to prevent
wedging uninitialized GTs during early probe.

> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_devic=
e.h
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
[ ... ]
> @@ -139,6 +139,10 @@ static inline bool xe_device_uc_enabled(struct xe_de=
vice *xe)
>  	for_each_gt((gt__), (tile__)->xe, (id__)) \
>  		for_each_if((gt__)->tile =3D=3D (tile__))
> =20
> +#define for_each_initialized_gt(gt__, xe__, id__) \
> +	for_each_gt((gt__), (xe__), (id__)) \
> +		for_each_if((gt__)->initialized)

[Severity: Medium]
Does this lockless read require an acquire barrier, such as
smp_load_acquire(), to ensure prior GT initialization stores are visible?

Without an acquire barrier here and a corresponding release barrier in
xe_gt_init(), the CPU or compiler can reorder the store to gt->initialized
before preceding hardware initialization stores.

A concurrent caller of xe_device_declare_wedged() (e.g., from a timeout
handler) could observe gt->initialized =3D=3D true before the GT is fully
initialized, queueing the worker on a partially initialized GT.

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
[ ... ]
> @@ -769,6 +773,8 @@ int xe_gt_init(struct xe_gt *gt)
>  			return err;
>  	}
> =20
> +	/* Must be last */
> +	gt->initialized =3D true;

[Severity: Medium]
Does this plain store require a release barrier, such as smp_store_release(=
)?

This flag is read locklessly in for_each_initialized_gt(). Without a release
barrier, architectural or compiler reordering of the preceding GT
initialization sequence could occur, causing concurrent readers to see the
flag set before initialization is actually complete.

[ ... ]
> @@ -1200,6 +1214,5 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
>  {
>  	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
> =20
> -	xe_uc_declare_wedged(&gt->uc);
> -	xe_tlb_inval_reset(&gt->tlb_inval);
> +	queue_work(gt->ordered_wq, &gt->wedge.worker);
>  }

[Severity: High]
Does this change break the PCI error handler in xe_pci_error.c?

This patch changes xe_gt_declare_wedged() to execute asynchronously by
queueing gt->wedge.worker. To avoid crashes when wedging happens during
early probe, xe_device_declare_wedged() was updated to use
for_each_initialized_gt().

However, prepare_device_for_reset() in drivers/gpu/drm/xe/xe_pci_error.c
still uses for_each_gt() and manually calls xe_gt_declare_wedged().

If a PCIe AER event triggers during early probe before xe_gt_init() complet=
es,
it will pass an uninitialized GT to the wedge logic. This leads to
queue_work() acting on a zero-filled work_struct, causing list corruption
and a kernel panic.

Verification confirmed this bug remains unfixed at the end of the patch
series. Should prepare_device_for_reset() also be updated to use
for_each_initialized_gt()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010090718.6830=
8-1-raag.jadav@intel.com?part=3D1
