Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14842606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hgfojh1J
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10F710E7A4;
	Tue,  3 Nov 2026 06:44:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794A410E7A4
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:44:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3C55E40A12;
 Tue,  3 Nov 2026 06:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C7F1F000C1;
 Tue,  3 Nov 2026 06:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793688255;
 bh=8Bi3Bh6Xiijmsmh0knrPoiEmHmyhYF/Dru7FRcJrnIk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=hgfojh1J+tRQPuvMizvUYNrMmauzl9kvo80eXOPNSjA7z2G6HzEaPKby+NLB5mMdX
 qN4pKlRi69JZ7mhcZ+A+F2ZjsZOMwhpYtsey0sUo7P7Vq7qc2XdHZTzyB5n+X2cVNq
 BN2BcEGFRi2zBj6aMNso9WelBXbBenF5JTa283gkZiC/nzgvSiZj+6GEmhHQgWw+F6
 KXRLLlCwNihd9AYz3jdPTVwfN8mHc7T+IOAzf50iD78vystPcZxaXv5Kz97fqh/9Rd
 D7/Qrfoh4xhMiFRZLo4wHP9WRq4NXOkXeHmuuV+Yg42u8zH6kj+WQGLXdcsJDP8kDM
 6adqQKEtBp+7g==
Message-ID: <sashiko-outbox-194662@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 08/10] drm/xe: Introduce temporary device wedging
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261103060649.1015468-9-raag.jadav@intel.com>
References: <20261103060649.1015468-1-raag.jadav@intel.com>
 <20261103060649.1015468-9-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:44:14 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] drm/xe: unmatched xe_wedge_put() in xe_pci_error_resume()
- [High] drm/xe: leaked wedge and runtime PM ref after xe_pci_error_slot_re=
set()
- [Medium] drm/xe: premature wedged.perm set before PCI reset suppresses xe=
_wedge_declare()
--

commit 9aa7e09375e91e8cc39d736cc124e54fea45236b
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe: Introduce temporary device wedging

This commit converts xe->wedged.flag into a reference count (xe->wedged.ref)
for temporary device wedging and adds xe->wedged.perm to track permanent
device wedging.

> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pc=
i_error.c
> index 9bf0da3a3d152..6a942cb6f69d9 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -21,13 +21,8 @@ static void prepare_device_for_reset(struct pci_dev *p=
dev)
>  	struct xe_gt *gt;
>  	u8 id;
> =20
> -	/*
> -	 * Wedge the device to prevent userspace access but do not send the uev=
ent.
> -	 * xe_wedge_fini() releases runtime pm if wedged flag is set, so acquir=
e a runtime
> -	 * pm reference to avoid underflow.
> -	 */
> -	if (!atomic_xchg(&xe->wedged.flag, 1))
> -		xe_pm_runtime_get_noresume(xe);
> +	/* Wedge the device to prevent userspace access but do not send the uev=
ent. */
> +	xe_wedge_get(xe);
> =20
>  	xe_device_set_in_reset(xe);
> =20
> @@ -41,10 +36,16 @@ static void prepare_device_for_reset(struct pci_dev *=
pdev)
> =20
>  static pci_ers_result_t ras_action_to_pci_result(struct pci_dev *pdev, u=
8 action)
>  {
> +	struct xe_device *xe =3D xe_any_to_xe(pdev);
> +
>  	switch (action) {
>  	case XE_RAS_RECOVERY_ACTION_RECOVERED:
>  		return PCI_ERS_RESULT_RECOVERED;
>  	case XE_RAS_RECOVERY_ACTION_RESET:
> +		/* We should not be doing such ugly hacks, reuse FLR callbacks and dro=
p this. */
> +		if (atomic_xchg(&xe->wedged.perm, 1))
> +			return PCI_ERS_RESULT_DISCONNECT;
> +
>  		prepare_device_for_reset(pdev);
>  		return PCI_ERS_RESULT_NEED_RESET;
>  	case XE_RAS_RECOVERY_ACTION_DISCONNECT:
> @@ -71,6 +72,10 @@ static pci_ers_result_t xe_pci_error_detected(struct p=
ci_dev *pdev, pci_channel_
>  	case pci_channel_io_normal:
>  		return PCI_ERS_RESULT_CAN_RECOVER;
>  	case pci_channel_io_frozen:
> +		/* We should not be doing such ugly hacks, reuse FLR callbacks and dro=
p this. */
> +		if (atomic_xchg(&xe->wedged.perm, 1))
> +			return PCI_ERS_RESULT_DISCONNECT;
> +
>  		prepare_device_for_reset(pdev);
>  		return PCI_ERS_RESULT_NEED_RESET;

[Severity: Medium]
What happens if the PCI reset fails before xe_pci_error_slot_reset() removes
the old driver instance?

Both ras_action_to_pci_result() and xe_pci_error_detected() set
xe->wedged.perm to 1 via atomic_xchg() before calling
prepare_device_for_reset() -> xe_wedge_get().

If reset_subordinates() fails in pcie_do_recovery(), or if pci_enable_devic=
e()
fails in xe_pci_error_slot_reset():

drivers/gpu/drm/xe/xe_pci_error.c:xe_pci_error_slot_reset() {
	...
	err =3D pci_enable_device(pdev);
	if (err) {
		xe_log_err_fatal(xe, PCI, err, "Cannot re-enable PCI device after reset\n=
");
		return PCI_ERS_RESULT_DISCONNECT;
	}

	xe_device_clear_in_reset(xe);
	pdev->driver->remove(pdev);
	...
}

the old xe_device remains bound with xe->wedged.perm =3D=3D 1 and
xe->wedged.ref =3D=3D 1.

Because xe->wedged.perm is already set to 1, xe_wedge_declare() was never
called and any subsequent call to xe_wedge_declare() will return early:

drivers/gpu/drm/xe/xe_wedge.c:xe_wedge_declare() {
	...
	if (atomic_xchg(&xe->wedged.perm, 1))
		return;

	xe_wedge_get(xe);
	xe->needs_flr_on_fini =3D true;
	...
	schedule_work(&xe->wedged.work);
}

Wouldn't this leave the device permanently blocking IOCTLs and GuC CT
communication with -ENOTRECOVERABLE while suppressing the drm_dev_wedged_ev=
ent
uevent to userspace and leaving xe->needs_flr_on_fini unset?

[ ... ]

> @@ -129,7 +134,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struc=
t pci_dev *pdev)
>  	xe =3D pdev_to_xe_device(pdev);
> =20
>  	/* Wedge the device to prevent I/O operations till the resume callback =
*/
> -	atomic_set(&xe->wedged.flag, 1);
> +	xe_wedge_get(xe);
> =20
>  	return PCI_ERS_RESULT_RECOVERED;
>  }

[Severity: High]
As reported by Sashiko on v10 [1], does xe_pci_error_slot_reset() leak the
wedge reference and runtime PM reference if pcie_do_recovery() aborts before
calling xe_pci_error_resume()?

In xe_pci_error_slot_reset(), after removing the old device and probing a n=
ew
xe_device via pdev->driver->probe(), xe_wedge_get(xe) increments
xe->wedged.ref to 1 and acquires a runtime PM reference while xe->wedged.pe=
rm
remains 0.

In pcie_do_recovery(), pci_walk_bridge(bridge, report_slot_reset, &status)
walks all subordinate devices under the upstream bridge and merges their
results. If a sibling PCI device returns failure from slot_reset,
pcie_do_recovery() jumps to its failed path and broadcasts
report_perm_failure_detected() -> xe_pci_error_detected(pdev,
pci_channel_io_perm_failure) without calling report_resume(). Likewise,
report_slot_reset() releases device_lock(&pdev->dev) before report_resume()
re-acquires it, allowing driver unbind in between.

When the newly probed xe_device is later torn down, xe_wedge_fini() only pu=
ts
a reference if xe->wedged.perm is set:

drivers/gpu/drm/xe/xe_wedge.c:xe_wedge_fini() {
	...
	if (atomic_read(&xe->wedged.perm))
		xe_wedge_put(xe);

	xe_assert(xe, !xe_wedged(xe));
}

Wouldn't this leave the temporary reference from xe_pci_error_slot_reset()
unreleased, leaking the runtime PM reference and triggering the
xe_assert(xe, !xe_wedged(xe)) assertion on teardown?

Additionally, if pdev->driver->probe() in xe_pci_error_slot_reset() succeeds
by entering boot survivability mode in __xe_pci_probe(), it returns 0 before
xe_wedge_init() or xe_pm_init() are called, yet xe_pci_error_slot_reset()
unconditionally calls xe_wedge_get(xe).

> @@ -140,7 +145,8 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
> =20
>  	xe_info(xe, "PCI error: resume\n");
> =20
> -	atomic_set(&xe->wedged.flag, 0);
> +	if (xe_wedged(xe))
> +		xe_wedge_put(xe);
>  }

[Severity: High]
Can xe_pci_error_resume() drop a wedge reference and runtime PM reference t=
hat
the PCI error recovery path never acquired?

When a non-fatal PCIe error occurs (state =3D=3D pci_channel_io_normal),
pcie_do_recovery() runs:

  report_normal_detected()
    -> xe_pci_error_detected(pdev, pci_channel_io_normal)
         returns PCI_ERS_RESULT_CAN_RECOVER (without calling xe_wedge_get())
  report_mmio_enabled()
    -> xe_pci_error_mmio_enabled()
      -> xe_ras_process_errors()
        -> ras_action_to_pci_result(pdev, XE_RAS_RECOVERY_ACTION_RECOVERED)
             returns PCI_ERS_RESULT_RECOVERED (without calling xe_wedge_get=
())
  report_resume()
    -> xe_pci_error_resume()

Because xe_pci_error_detected() does not wedge the device or stop driver wo=
rk
for pci_channel_io_normal, normal driver activity continues between
xe_pci_error_detected() and xe_pci_error_resume(). If a concurrent GT reset
failure, job timeout, or hardware error handler calls xe_wedge_declare() in
that window (or if xe_wedge_declare() was between atomic_xchg(&xe->wedged.p=
erm,
1) and xe_wedge_get(xe) when xe_pci_error_detected() checked xe_wedged(xe)),
xe->wedged.ref becomes 1.

When xe_pci_error_resume() then checks xe_wedged(xe), it sees the global
xe->wedged.ref > 0 and calls xe_wedge_put(xe).

Wouldn't that consume the reference owned by xe_wedge_declare(), dropping
xe->wedged.ref back to 0 (unblocking IOCTLs on a permanently wedged device)
and later causing xe_wedge_fini() to underflow xe->wedged.ref to -1 and
underflow runtime PM when it sees xe->wedged.perm =3D=3D 1?

[1] https://lore.kernel.org/r/20260821113758.006681F000E9@smtp.kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103060649.1015=
468-1-raag.jadav@intel.com?part=3D8
