Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD589CCA464
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 09:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838D1112719;
	Fri, 16 Oct 2026 09:49:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57774112719
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 09:49:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 87EE2601F0;
 Fri, 16 Oct 2026 09:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153FE1F000C4;
 Fri, 16 Oct 2026 09:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792144188;
 bh=Cq8qVLJEJr/pAGjSobZvSzeVUdr9atfaPjM23bhY5CA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=djovaSrHeIddmFQrVnyUi70dNs4siriEdQMeQ6C7nvbL18QWS0F9kYIe8owgaVVUz
 /xhHp0HGoewkL/L1DtNK8noKrlYaEdukY+LONtwv3r9RUKbRDJgyuN6gP/HaBOVxwO
 HnoUm1EjCRPKesS1IileSvFNM7Iu7DCzNzMaaf26+2fWjz+lbbnq7hQSX+acSLw5Qh
 Pv+NwSLHvEih7/tM1t+0k4nWQ3XodcEi48gGJGtqqPqcbmJSCnZrTzZismoC5YVmYX
 x5LbpByZAH9y6l/TKJZZOeCckOgzmn7YoKEb7/JwBueedhYprE8M2cBUnN+jPGE7bq
 BlS56tDZ66pow==
Message-ID: <sashiko-outbox-174102@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [CI-only] drm/xe: Isolate permanently wedged devices
To: "Arvind Yadav" <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261016093237.340525-1-arvind.yadav@intel.com>
References: <20261016093237.340525-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 09:49:47 +0000
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
- [High] drm/xe: CPU mmaps to VRAM are not invalidated during PCI error rec=
overy
- [High] drm/xe: MMIO write to disabled PCI device during AER recovery
- [Medium] drm/xe: Leak of drm_exec lockdep context when xe_device_io_get()=
 fails in preempt_rebind_work_func()
--

commit 757d33b97cc3a56989d49ecaab9b08dca7015ebb
Author: Arvind Yadav <arvind.yadav@intel.com>

drm/xe: Isolate permanently wedged devices

This commit isolates permanently wedged devices by shutting down display,
suspending IRQs, invalidating CPU mmaps, and blocking IOCTLs. It also
introduces AER error handling that temporarily blocks device access during
PCI reset.

> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 9ef2ce743770f..5a17cfe8f883f 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c

[ ... ]

> @@ -496,6 +497,27 @@ static void ggtt_node_remove(struct xe_ggtt_node *no=
de)
>  	ggtt_node_fini(node);
>  }
> =20
> +static void ggtt_node_remove(struct xe_ggtt_node *node)
> +{
> +	struct xe_device *xe =3D tile_to_xe(node->ggtt->tile);
> +	int idx;
> +
> +	/*
> +	 * GGTT updates write page table entries through the BAR and request a
> +	 * TLB invalidation. Skip them after unplug, where the BAR is gone.
> +	 * Keep them during PCI error recovery so a recovered device does not
> +	 * inherit stale GGTT entries.
> +	 */
> +	if (!drm_dev_enter(&xe->drm, &idx)) {
> +		__ggtt_node_remove(node, false);
> +		return;
> +	}
> +
> +	__ggtt_node_remove(node, !xe_device_wedged(xe));

[Severity: High]
Does this code allow MMIO writes to a disabled PCI device during AER
recovery?

During AER recovery, prepare_device_for_reset() disables the PCI device
using pci_disable_device(). However, ggtt_node_remove() does not use
xe_device_io_get() to check if IO is blocked. Instead, it checks
!xe_device_wedged(xe), which evaluates to true because the device is in
reset, not wedged.

Consequently, concurrent BO destruction or the delayed removal workqueue
can call __ggtt_node_remove(node, true) asynchronously, which performs MMIO
writes to the GGTT and TLB registers while the PCI device memory decoding is
disabled. This could cause PCIe Unsupported Requests (UR), leading to system
crashes or secondary AER cascades.

> +
> +	drm_dev_exit(idx);
> +}
> +
>  static void ggtt_node_remove_work_func(struct work_struct *work)
>  {

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pc=
i_error.c
> index 79ce0c671549a..3dfcef03850e4 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c

[ ... ]

> @@ -20,19 +19,19 @@ static void prepare_device_for_reset(struct pci_dev *=
pdev)
>  	struct xe_gt *gt;
>  	u8 id;
> =20
> -	/*
> -	 * Wedge the device to prevent userspace access but do not send the uev=
ent.
> -	 * xe_device_wedged_fini() releases runtime pm if wedged flag is set, s=
o acquire a runtime
> -	 * pm reference to avoid underflow.
> -	 */
> -	if (!atomic_xchg(&xe->wedged.flag, 1))
> -		xe_pm_runtime_get_noresume(xe);
> -
> +	/* Block device access until PCI error recovery completes. */
>  	xe_device_set_in_reset(xe);
> +	wake_up_all(&xe->ufence_wq);
> =20
>  	for_each_gt(gt, xe, id)
>  		xe_gt_declare_wedged(gt);
> =20
> +	/*
> +	 * GT wedging signals pending fences. Existing hardware users can now
> +	 * finish without blocking reset.
> +	 */
> +	xe_device_io_drain(xe);
> +
>  	pci_disable_device(pdev);

[Severity: High]
Are CPU mmaps to VRAM invalidated during the PCI error recovery path?

Unlike the permanent wedge path, which explicitly calls
xe_bo_wedged_invalidate_mmaps(), the PCI reset path does not tear down
existing userspace CPU mappings pointing to VRAM before calling
pci_disable_device().

Any userspace process actively reading or writing to these mappings will
generate PCIe memory transactions to a disabled BAR. This causes Unsupported
Request (UR) or Master Abort errors, which might trigger secondary AER
faults and interfere with the ongoing PCI reset.

>  }
> =20
>  static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b98f2e56bf6f4..c003ba90f27c9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c

[ ... ]

> @@ -546,6 +547,12 @@ static void preempt_rebind_work_func(struct work_str=
uct *w)
>  	if (err)
>  		goto out_unlock_outer;
> =20
> +	if (xe_device_io_get(vm->xe, &io_idx)) {
> +		xe_validation_ctx_fini(&ctx);
> +		err =3D 0;
> +		goto out_unlock_outer;
> +	}
> +

[Severity: Medium]
Can this early exit leak the drm_exec lockdep context?

xe_validation_ctx_init() initializes the validation context along with the
provided drm_exec structure, which internally establishes a ww_acquire_ctx
for lockdep.

Jumping directly to out_unlock_outer bypasses the
drm_exec_until_all_locked() macro loop entirely. Because the loop is skippe=
d,
drm_exec_fini() is never called by the macro's cleanup condition.

Since xe_validation_ctx_fini() does not finalize the drm_exec context, the
ww_acquire_ctx on the stack remains registered as held in lockdep, which
would cause a lockdep splat when the function returns.

>  	drm_exec_until_all_locked(&exec) {
>  		bool done =3D false;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016093237.3405=
25-1-arvind.yadav@intel.com?part=3D1
