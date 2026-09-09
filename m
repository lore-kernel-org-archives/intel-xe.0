Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37AFC79F82
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 01:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBCA10E02D;
	Wed,  9 Sep 2026 01:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TM4X3b0V";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6549E10E02D
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 01:53:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 13F61439BB;
 Wed,  9 Sep 2026 01:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE12A1F00A3A;
 Wed,  9 Sep 2026 01:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788918824;
 bh=PwbKLW603RAXyKeehxBncVsv69cYSC5yG0ChyPcjeJc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=TM4X3b0VxVm26NMJyRWFkX6MmMAUi2D0vQk0dxBKp503j0YR/ynJnBxn8IOrs9Qjo
 +O4YfYdFDPHhfgXP694FsDaDeiqFyw9BDzcAqk760eNWaxi/2VXzIHZbVp9eh2lqN0
 FN7ac2zIr1hMNRs/TV2+5DNv98481PIQURPKhYj0rln+97HU+0+POyIuV330FZCQOM
 1Vbm60thyuA8GJBrqAnci2EkTcdj41MzAtMo+TAP75TD39s/3WTBCnN3Kg79Jm8Zb0
 w306T67gKeKlv2if+q5Zd9bLsLL+VmkG76xGCuJBwnKKJ5zeWv0p0XA7kKTVNWyG0f
 JM03+sE1aekew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/xe: Poll GT for C6 before D3
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909013712.1962521-2-vinay.belgaumkar@intel.com>
References: <20260909013712.1962521-1-vinay.belgaumkar@intel.com>
 <20260909013712.1962521-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 01:53:43 +0000
Message-Id: <20260909015343.CE12A1F00A3A@smtp.kernel.org>
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
- [High] Returning -EAGAIN from xe_pci_runtime_suspend() without rolling ba=
ck the successful xe_pm_runtime_suspend() call leaves the hardware permanen=
tly suspended while the PM core believes the device is active.
- [High] wait_for_gt_c6_state() dereferences a NULL idle_status pointer whe=
n executed on SR-IOV Virtual Functions.
--

commit 5290095cf4ef101ed42731b369d55f98f9bbeaa1
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Poll GT for C6 before D3

This commit adds a check before transitioning to D3 to ensure GTs are in the
C6 state. If the GT is not in C6, it returns -EAGAIN to allow the PM
subsystem to retry, preventing component access during forced D3 state.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
[ ... ]
> @@ -1377,10 +1378,25 @@ static int xe_pci_resume(struct device *dev)
>  	return 0;
>  }
> =20
> +static int wait_for_gt_c6_state(struct xe_gt *gt,
> +				int timeout_ms)
> +{
> +	struct xe_guc_pc *pc =3D &gt->uc.guc.pc;
> +	enum xe_gt_idle_state state;
> +
> +	return poll_timeout_us(state =3D gt->gtidle.idle_status(pc),

[Severity: High]
Is it possible for this to dereference a NULL pointer for SR-IOV Virtual
Functions?

If IS_SRIOV_VF(xe) is true, initialization is skipped in xe_gt_idle_init(),
leaving the gtidle->idle_status function pointer NULL. The
xe_assert(xe, !IS_SRIOV_VF(xe)) in xe_pci_runtime_suspend() only emits a
warning in debug builds (or acts as a no-op in production builds) and does
not halt execution, allowing a VF to reach this unconditional dereference
in wait_for_gt_c6_state().

> +			       state =3D=3D GT_IDLE_C6,
> +			       20,
> +			       timeout_ms * USEC_PER_MSEC,
> +			       false);
> +}
> +
>  static int xe_pci_runtime_suspend(struct device *dev)
>  {
[ ... ]
> @@ -1396,6 +1412,14 @@ static int xe_pci_runtime_suspend(struct device *d=
ev)
>  	if (err)
>  		return err;
> =20
> +	/* Poll and retry if we don't enter C6 on any GT */
> +	for_each_gt(gt, xe, id) {
> +		if (wait_for_gt_c6_state(gt, 200)) {
> +			xe_gt_info(gt, "GT is not in C6\n");
> +			return -EAGAIN;

[Severity: High]
Could returning -EAGAIN here leave the hardware permanently suspended while
the PM core believes the device is active?

The driver successfully suspends multiple hardware components (display, GTs,
IRQs) earlier in xe_pci_runtime_suspend() via xe_pm_runtime_suspend().
However, returning -EAGAIN here aborts the PM core transition, leaving the
device status as RPM_ACTIVE.

The PM core will not invoke the resume callback, and subsequent driver
operations will attempt to access powered-down hardware. Should this call
xe_pm_runtime_resume() to roll back the successful suspend operations before
returning?

> +		}
> +	}
> +
>  	pci_save_state(pdev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909013712.1962=
521-1-vinay.belgaumkar@intel.com?part=3D2
