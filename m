Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B3360A262C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 00:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bslvit7h
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEC610ECE7;
	Thu, 19 Nov 2026 00:02:32 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C251210ECE7
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 00:02:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0E9536434B;
 Thu, 19 Nov 2026 00:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D1C1F000C4;
 Thu, 19 Nov 2026 00:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795046545;
 bh=iKw2SlE0Cg/Pv132PTTfgLeCiKwUhliA0/Wy3mUzAcw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=bslvit7hn/dDZHN6XeM1FC0mWvVT6U6C0uB8vW6Nqws6tNZwBQXS7g1iVV8++hShS
 FYt+t2VL/TaBvuiZB2wrunM4NIu0GMI1xPtFGo1S0kMv2vMYStHqwLl/bv0EtiQAHD
 9f9CICRe6p2EsWommJQH6WtvvTKUOTJrIs2Hv413pz2LCDYEqx0v8a3rlAccQMUrdb
 th4dspNSc3b7LYRpcO8tVT3VqbcHhKB0DbbYBK+BPP6f5JaCSqlno3C2LWwfXEeTAd
 OD9F2mcoM8AtnQhgrN5FxVdDtUjbf2ySvI9pLu3pSQ7RryUHEg797s8AE2zpxLzjKi
 Lc7XJTrmXE5fQ==
Message-ID: <sashiko-outbox-222221@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/pf: Restore PF config before resuming submission
 after GT reset
To: "FNU VISHWANATHA" <fnu.vishwanatha@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261118233946.275114-1-fnu.vishwanatha@intel.com>
References: <20261118233946.275114-1-fnu.vishwanatha@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 00:02:25 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] drm/xe/pf: dma_fence deadlock and reclaim hazard in
  do_gt_restart()
- [Medium] drm/xe/pf: do_gt_restart() restores PF/VF config before GuC
  VGT policies
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] drm/xe: loss of RING_IDLEDLY workarounds in adjust_idledly()
  across GT reset and resume [1]
--

commit 19aac698e33fa931358e6f2c835ac921dba22d3f
Author: FNU VISHWANATHA <fnu.vishwanatha@intel.com>

drm/xe/pf: Restore PF config before resuming submission after GT reset

This commit calls xe_gt_sriov_pf_config_restart() synchronously in
do_gt_restart() before xe_uc_start() resumes GuC submission after a GT
reset.

> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index b751b5044f3ca..f0539440e7702 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
[ ... ]
> @@ -891,6 +892,18 @@ static int do_gt_restart(struct xe_gt *gt)
>  	/* Get CCS mode in sync between sw/hw */
>  	xe_gt_apply_ccs_mode(gt);
> =20
> +	/*
> +	 * The GuC was reloaded and lost the PF configuration pushed to it,
> +	 * including the scheduling parameters. Restore it before
> +	 * xe_uc_start() resumes submission: exec queues re-registered with
> +	 * the GuC under its default configuration may be accepted but never
> +	 * dispatched, leaving their jobs unstarted and their fences unsignaled.
> +	 * The asynchronous PF restart below pushes the configuration again,
> +	 * which is harmless.
> +	 */
> +	if (IS_SRIOV_PF(gt_to_xe(gt)))
> +		xe_gt_sriov_pf_config_restart(gt);
> +
>  	err =3D xe_uc_start(&gt->uc);
>  	if (err)
>  		return err;

[Severity: High]
Can calling xe_gt_sriov_pf_config_restart() synchronously in do_gt_restart()
deadlock on xe->sriov.pf.master_lock and violate dma_fence reclaim rules?

Commit a4d1c5d0b99b ("drm/xe/pf: Move VFs reprovisioning to worker") moved
xe_gt_sriov_pf_config_restart() to an asynchronous worker because it takes
xe_gt_sriov_pf_master_mutex(gt), which is held across GFP_KERNEL allocations
and GPU migration dma_fence waits.  During a GT reset, xe_uc_stop() stops
GuC submission without signaling pending jobs on kernel or VM queues such as
tile->migrate->q; those jobs only complete after do_gt_restart() reaches
xe_uc_start().  Meanwhile, xe_gt_sriov_pf_stop_prepare() cancels only the PF
restart worker and leaves other master_lock holders running:

CPU0 (VF provisioning / FLR)      CPU1 (gt_reset_worker)
----------------------------      ----------------------
pf_provision_vf_lmem() /
xe_gt_sriov_pf_config_sanitize()
  mutex_lock(master_lock)
                                  gt_reset_worker()
                                    xe_uc_stop()
  xe_migrate_clear()
  dma_fence_wait(...)
                                    do_gt_restart()
                                      xe_gt_sriov_pf_config_restart()
                                        mutex_lock(master_lock)
                                      ...
                                      xe_uc_start()  <-- never reached

 *** DEADLOCK ***

In pf_provision_vf_lmem() (via TTM BO creation and drm_suballoc_new()) and
in pf_sanitize_lmem() when suballocating batch buffers for large VF LMEM
clears, the wait under master_lock is uninterruptible with
MAX_SCHEDULE_TIMEOUT, wedging gt_reset_worker() on gt->ordered_wq.

[Severity: Medium]
Does calling xe_gt_sriov_pf_config_restart() and xe_uc_start() here before
xe_gt_sriov_pf_policy_restart() runs in the async pf_restart() worker invert
the policy-before-config restore order?

When the GuC is reloaded in xe_uc_load_hw(), VGT policies reset to hardware
defaults (sched_if_idle disabled, default priority GUC_SCHED_PRIORITY_LOW,
and scheduler groups disabled).  However, encode_config_sched() consults the
software policy state when encoding PF and VF configs:

drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:custom_sched_priority() {
	return xe_gt_sriov_pf_policy_get_sched_if_idle_locked(gt) ?
		priority !=3D GUC_SCHED_PRIORITY_NORMAL :
		priority !=3D GUC_SCHED_PRIORITY_LOW;
}

If sched_if_idle is enabled in software and a function uses
GUC_SCHED_PRIORITY_NORMAL, custom_sched_priority() returns false and omits
GUC_KLV_VF_CFG_SCHED_PRIORITY_KEY, assuming GUC_KLV_VGT_POLICY_SCHED_IF_IDL=
E_KEY
was already sent to the GuC.  Conversely, if a function has a custom
priority while sched_if_idle is enabled, the later async
xe_gt_sriov_pf_policy_restart() sends SCHED_IF_IDLE=3D1 and resets the GuC's
priority back to GUC_SCHED_PRIORITY_NORMAL while submission is active.
In addition, xe_uc_start() re-registers contexts before
pf_reprovision_sched_groups() runs, and as noted in
pf_provision_sched_groups(), the GuC silently ignores scheduler group
provisioning if any MLRC contexts are already registered.

[Severity: High]
This problem wasn't introduced by this patch, but in do_gt_restart() the
engine register restoration loop just above only reapplies hwe->reg_sr via
xe_reg_sr_apply_mmio() and does not call adjust_idledly() [1].

During initial probe, hw_engine_init() calls adjust_idledly() to apply
Wa_16023105232 and Wa_14025941587 directly via xe_mmio_write32() on
RING_IDLEDLY without recording the change in hwe->reg_sr.  Across a full GT
reset or system resume, RING_IDLEDLY reverts to hardware defaults and the
GuC ADS save/restore list is repopulated in xe_uc_load_hw(), so the bounded
IDLE_DELAY and cleared INHIBIT_SWITCH_UNTIL_PREEMPTED bit are lost, which
can cause preemption failures or GPU hangs.

[1] https://sashiko.dev/#/bug/linux-4061257d-241c-4f91-b214-9c272d968ab3

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118233946.2751=
14-1-fnu.vishwanatha@intel.com?part=3D1
