Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACE6C5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 11:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592D210E278;
	Fri, 21 Aug 2026 11:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LbqZfp8y";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A008910E278
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 11:37:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D28A418D8;
 Fri, 21 Aug 2026 11:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006681F000E9;
 Fri, 21 Aug 2026 11:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787312278;
 bh=4dauV08QLrpa8Q71cqGVVq0V6B1FpJcf/uY4apQ0TzI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=LbqZfp8yeSiTMHodFg8Dv+fp3kxRfZ7XwrOyofWJr2vdpHWgIBoccm3ZDJC9Vanw0
 UHv2OV4zMEyHe8GkF/8olOOvUrwRm9yDJKVcTl557Is1DDJEJaf1fGYvAE9eX63jjD
 lHdgnhV3PwW+N6ArfcW84iI8zOSZNLigMO5z2ATzt/h2E2zhkH+pMoGd/T3XFBVXJ5
 lpNIit0QgwHtVYgzX2ZI1TCqk3V+a8ICuHHW04pTgUxDwC3Vj7XPAbbQIHkOSeC+c8
 BKYiUxO4iwSC/AGT0rMpL6jgBvnsL6jLQcnBIPYMNyw5CaES811/oUQQbp7mOUEADE
 FgMP1RBosxFtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 08/10] drm/xe: Introduce temporary device wedging
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260821112436.545405-9-raag.jadav@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-9-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 11:37:57 +0000
Message-Id: <20260821113758.006681F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Sleeping in atomic context due to `mutex_lock()` in `xe_device=
_declare_wedged()`.
- [High] Unprotected state modification and double-increment of `wedged.ref=
` in `prepare_device_for_reset()`.
- [High] Temporary wedged state from PCI error recovery leaks PM reference =
and triggers teardown assert if recovery aborts.
--

--- Patch [8]: [PATCH v10 08/10] drm/xe: Introduce temporary device wedging=
 ---
commit 102094142d418b8de53397ac8e1fbe1c7ca46ae9
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe: Introduce temporary device wedging

This commit converts the boolean wedged flag to a reference count to allow
temporary wedged states. It also introduces a perm flag for permanent
wedging and a mutex to protect the wedged state transitions.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
[ ... ]
> @@ -1476,36 +1526,40 @@ void xe_device_declare_wedged(struct xe_device *x=
e)
>  		return;
>  	}
> =20
> -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> -		xe->needs_flr_on_fini =3D true;
> -		xe_pm_runtime_get_noresume(xe);
> +	mutex_lock(&xe->wedged.lock);

[Severity: Critical]
Can this cause a sleeping in atomic context panic?

xe_device_declare_wedged() can be called from hard IRQ contexts, for
example:

xe_mert_irq_handler()
  mert_handle_cat_error()
    xe_device_declare_wedged()

Since mutex_lock() can sleep, taking it here from an interrupt handler
would lead to a scheduling while atomic regression.

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pc=
i_error.c
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -25,8 +25,10 @@ static void prepare_device_for_reset(struct pci_dev *p=
dev)
>  	 * xe_device_wedged_fini() releases runtime pm if wedged flag is set, s=
o acquire a runtime
>  	 * pm reference to avoid underflow.
>  	 */
> -	if (!atomic_xchg(&xe->wedged.flag, 1))
> -		xe_pm_runtime_get_noresume(xe);
> +	xe_device_wedged_get(xe);
> +
> +	/* TODO: We shouldn't be doing such ugly hacks, reuse FLR helpers and d=
rop this. */
> +	xe->wedged.perm =3D true;

[Severity: High]
Could this leak a reference and cause an assertion failure during device
teardown if the device is already wedged?

Unlike the old atomic_xchg code which checked if the device was already
wedged, xe_device_wedged_get() increments the reference count unconditional=
ly.
If the device is already wedged from a previous event, the reference count
will be incremented twice.

During teardown, xe_device_wedged_fini() only drops a single reference
when wedged.perm is true:

drivers/gpu/drm/xe/xe_device.c:xe_device_wedged_fini() {
    if (xe->wedged.perm)
        xe_device_wedged_put(xe);

    xe_assert(xe, !xe_device_wedged(xe));
}

Will the second reference be left behind and trip the xe_assert() check?
Also, should the state modification here be protected by xe->wedged.lock?

[ ... ]
> @@ -126,7 +128,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struc=
t pci_dev *pdev)
>  	xe =3D pdev_to_xe_device(pdev);
> =20
>  	/* Wedge the device to prevent I/O operations till the resume callback =
*/
> -	atomic_set(&xe->wedged.flag, 1);
> +	xe_device_wedged_get(xe);

[Severity: High]
If the PCI error recovery aborts or fails here, and the device is subsequen=
tly
unbound, will this leak the runtime PM reference?

This code acquires a temporary wedged reference but does not set
xe->wedged.perm to true. If the expected xe_pci_error_resume() is never
called due to a recovery failure, xe_device_wedged_fini() will see
xe->wedged.perm as false and skip dropping the reference, which would
ultimately trigger the xe_assert(xe, !xe_device_wedged(xe)) on teardown.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821112436.5454=
05-1-raag.jadav@intel.com?part=3D8
