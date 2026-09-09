Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CC2C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD29410F1E4;
	Wed,  9 Sep 2026 16:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jm4VPKxF";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58BD10F1E4
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 16:08:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DB65460204;
 Wed,  9 Sep 2026 16:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60CE71F00A3A;
 Wed,  9 Sep 2026 16:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788970081;
 bh=8V2iKdsyWGrnm1wJ8nhLIi1GioBZQaiKPE071SbRuAM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Jm4VPKxFZ2lQ4UYkSipKaXXVelW8CDpI+hZhn1HY9wQkNeUkLgY2wcOd9dLgsaoUm
 BUAgKsWFx6lQgrQ7mpWG7817bolK+x2KYCTvtVrWTpHp+9sgmblyNrwTjYUgNto38Z
 otmLlSFq8SifVVG1IP05RhkZKbC5joQ9IBxH/esJ3HYV5VImOVcxiRA78GzckxyFct
 WbqugfYo/sKdotheQems3QA5PuNjkvYOo9LYzmyTleX5UYkT954LS0d1WdwDDl7sI+
 g6+laFqC3MEmdKRdaWBZvZtyCzAeEH2p11YGM0Evb01J91ZMzM7hdfXUb0ckARzTAw
 D5C8hOwCOoz1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 17/20] drm/xe/vsec: Support late bind fw information
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909154739.1515514-39-michael.j.ruhl@intel.com>
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
 <20260909154739.1515514-39-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 16:08:00 +0000
Message-Id: <20260909160801.60CE71F00A3A@smtp.kernel.org>
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
- [High] Use-After-Free and Resource Leak due to devres addition race durin=
g teardown.
- [Low] Build Error: The function `xe_is_oobmsm_fw_ready` is called but nei=
ther declared nor defined anywhere in the kernel tree.
--

commit b7956351d5d5da18fd9bd94f1d6cfe8332cfde1f
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support late bind fw information

This patch adds support for late bind firmware information for CRI FW, which
is loaded on power on. It updates the XE PMT probe and access routines to
check for late bind devices, and uses a delayed workqueue to wait for the
FW state before probing or accessing PMT telemetry.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 58421e3157a8f..bf75adb73f27e 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c

[ ... ]

> @@ -281,6 +291,48 @@ static int xe_guid_decode(u32 guid, int *index, u32 =
*offset)
>  	return -ENODEV;
>  }
> =20
> +static void cri_late_bind_probe_work(struct work_struct *work)
> +{
> +	struct xe_device *xe =3D container_of(work, struct xe_device, pmt.work.=
work);
> +
> +	if (xe_is_oobmsm_fw_ready(xe)) {

[Severity: Low]
Does this code compile successfully? It appears xe_is_oobmsm_fw_ready() is
called here (and in wait_for_fw() and xe_vsec_init()) but it does not seem
to be declared or defined anywhere in the kernel tree.

> +		cri_late_bind_probe(xe);
> +		xe_pm_runtime_put(xe);
> +		return;
> +	}

[ ... ]

> +static void vsec_disable_late_bind_work(void *arg)
> +{
> +	struct xe_device *xe =3D arg;
> +
> +	/*
> +	 * If the queued work is canceled, the runtime reference needs to be
> +	 * released here.
> +	 */
> +	if (disable_delayed_work_sync(&xe->pmt.work))
> +		xe_pm_runtime_put(xe);
> +}
> +
>  /**
>   * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>   * interface
>   * @xe: valid xe instance
>   */
> -void xe_vsec_init(struct xe_device *xe)
> +int xe_vsec_init(struct xe_device *xe)
>  {

[ ... ]

>  	case XE_VSEC_CRI:
>  		if (IS_SRIOV_VF(xe))
> -			return;
> +			return 0;
> +
>  		xe->pmt.base_offset =3D CRI_PMT_OFFSET;
> +
> +		xe->pmt.retry_count =3D 0;
> +		INIT_DELAYED_WORK(&xe->pmt.work, cri_late_bind_probe_work);
> +
> +		xe_pm_runtime_get_noresume(xe);
> +		if (!xe_is_oobmsm_fw_ready(xe)) {
> +			schedule_delayed_work(&xe->pmt.work,
> +					      msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
> +			return devm_add_action_or_reset(xe->drm.dev,
> +							vsec_disable_late_bind_work,
> +							xe);
> +		}

[Severity: High]
Can this lead to a devres leak and use-after-free during driver teardown?

If the driver teardown is initiated concurrently, devres_release_all() will
splice the devres list to a local todo list before executing the cleanup
actions.=20

When vsec_disable_late_bind_work() executes from that local list, it blocks
on the delayed work using disable_delayed_work_sync(). If the worker thread
(cri_late_bind_probe_work) is already executing, it proceeds to call
intel_vsec_register(), which adds new devm actions to the parent device.

Since the parent devres list was already spliced, these newly added devm
actions sit on the empty devres_head and are never processed. Could this
cause the auxiliary device to be leaked and accessed after the parent
device is freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909154739.1515=
514-22-michael.j.ruhl@intel.com?part=3D17
