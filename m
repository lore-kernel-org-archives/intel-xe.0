Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8128FCC6B03
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 11:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F2610E101;
	Tue, 13 Oct 2026 11:22:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7ED10E101
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 11:22:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E9131400DC;
 Tue, 13 Oct 2026 11:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB8D1F000FF;
 Tue, 13 Oct 2026 11:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791890541;
 bh=ilVXUBIBoeEUFqLY/kdwddjPv2IhimXi+scPaxtHAMM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=IyVWMpunKthlk2mIsKn93cDN1u4j8foA5Ozi0gnz0uHMDANZfOR8uAuSBY/mhMTwk
 XvQZWIYrtWSDIrJcJ0l3BIntDZ2bSTFlayehYHecHnZ4rlHPz+S8w6PZSfVL3MZozR
 ACTtFs0Dp8/N6T9kVeGIwdIU7BUof88jDnXyKxh6eOp1zhE/rtx3rFNGLVdq6xowWx
 GIYwb3USEwxq5/MKn//Yn7JpmfF9YGADJ53EtBxcuM3jhl6LYpR8vlnPMUk0dEDU+y
 qVm46kBwAbeXdWqUZkYOGdz1CNwnPQuBpweeJlEY8kL8Dt64HetIqFk8bKPyLHFAug
 N87F0Q1GiLHjA==
Message-ID: <sashiko-outbox-169612@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/5] drm/xe/ras: Move xe_ras_process_errors() to xe_ras
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013110439.181447-6-raag.jadav@intel.com>
References: <20261013110439.181447-1-raag.jadav@intel.com>
 <20261013110439.181447-6-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 11:22:21 +0000
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
- [Medium] xe_ras: boot-time wedge uevents are dropped before device regist=
ration
--

commit 7cc17054a629b3feb51763fdbe477fcbb6bc6ef3
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/ras: Move xe_ras_process_errors() to xe_ras

This commit moves xe_ras_process_errors() from the end of the probe
sequence back to xe_ras_init(). This was done to revert a previous change
and process hardware errors detected before the driver was loaded.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 23dfff89a4aa0..8d23e9cac3c67 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 922e5e793b135..8e399ffec9856 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -932,6 +932,13 @@ void xe_ras_init(struct xe_device *xe)
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
        ^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Medium]
Will this silently drop boot-time wedge uevents?

Moving xe_ras_process_errors() to xe_ras_init() causes it to execute before
drm_dev_register() is called in the probe sequence.

If a hardware error is detected during early probe, xe_wedge_declare() in
drivers/gpu/drm/xe/xe_wedge.c will broadcast a wedge event to userspace:

drivers/gpu/drm/xe/xe_wedge.c:xe_wedge_declare()
  drivers/gpu/drm/drm_drv.c:drm_dev_wedged_event()
    kobject_uevent_env()

Since the DRM device has not been added to sysfs yet, the KOBJ_CHANGE uevent
is silently dropped by the kobject core because dev->primary->kdev is not
fully registered. This means userspace automation will miss the WEDGED ueve=
nt.

> +
>  	ret =3D devm_device_add_group(xe->drm.dev, &gpu_health_group);
>  	if (ret)
>  		xe_err(xe, "Failed to create GPU health sysfs, err=3D%d\n", ret);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013110439.1814=
47-1-raag.jadav@intel.com?part=3D5
