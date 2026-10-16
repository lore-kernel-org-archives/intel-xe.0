Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F21ACC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6585E112661;
	Fri, 16 Oct 2026 07:52:54 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9BB112667
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:52:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D4B3560008;
 Fri, 16 Oct 2026 07:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D321F000C4;
 Fri, 16 Oct 2026 07:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792137166;
 bh=Z+AdWF26mYqKFYRvaC5SPHbvjuGBCNKt6ERwXMZUQFk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=HIs6egRrc0rkJ3mNOnnZ1QpnPI60mTkecIwCBtW5QNswrDad0zAIhtMi2ckW8xw8x
 PLTeHTDVthXRFRrVF6inOVT4GKAwB9TDgBKmFIQkgBNZIWoAvXSDESSJUkrQE9SDwb
 o7ADg9fiQaheNKU6QBwfuUw1JMDWF1IKbCD/2GSBn/TvGNW/d4RGMhCtNRScG3DjKD
 JYmaMik8H7gJ4S7Z3xQPJ2HAsp9JMd8KOawus9kNrb1nPnH570WldS8RstpMOTtxgD
 2gYd/H6UoEu05KSCU8WWu64SdYSL2WvOwAdPnAwlCs+DdzIdGJBygYO7yi3BShySl9
 NcbS87wBU8A2g==
Message-ID: <sashiko-outbox-173977@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 9/9] drm/xe/ras: Move xe_ras_process_errors() to xe_ras
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261016072623.457392-10-raag.jadav@intel.com>
References: <20261016072623.457392-1-raag.jadav@intel.com>
 <20261016072623.457392-10-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 07:52:46 +0000
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
- [High] drm/xe: probe fails on boot-time RAS wedge instead of entering wed=
ged state
- [High] xe: xe_gt_init() fails on early wedging aborting probe
- [Medium] drm/xe/ras: uevent lost when wedged before device_add()
--

commit e35d015152f1c4af5404ff382d3fce57a98e3c04
Author: Raag Jadav <raag.jadav@intel.com>
drm/xe/ras: Move xe_ras_process_errors() to xe_ras

This commit moves xe_ras_process_errors() back to xe_ras_init() during the
early probe sequence. This reverts a previous change to prevent PM reference
leaks in case of early wedging.

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 0072bb4cc5dfe..db3cbc186a514 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -1212,6 +1212,13 @@ int xe_ras_init(struct xe_device *xe)
>  	get_offline_list(xe);
>  	get_offline_queue(xe);
> =20
> +	/*
> +	 * During probe, process and log any errors detected by firmware while =
the driver was not
> +	 * loaded. Critical errors such as Punit and CSC are reported through P=
code init failure,
> +	 * causing the driver to enter survivability mode.
> +	 */
> +	xe_ras_process_errors(xe);
> +

[Severity: Medium]
Will this cause the wedge uevent to be lost?

Because xe_ras_init() executes early in the probe sequence, before
drm_dev_register() is called, declaring the device as wedged here will
schedule the wedge_work asynchronously. When the worker runs, it calls
drm_dev_wedged_event(), emitting a KOBJ_CHANGE uevent on the DRM kobject.

Since device_add() has not yet created the sysfs directory for the DRM
device, will userspace daemons silently drop this uevent?

[Severity: High]
Does wedging the device this early cause the driver probe to abort entirely
instead of entering survivability mode?

When xe_ras_process_errors() detects an error and wedges the device here, t=
he
local GTs are skipped in xe_wedge_declare() because they are not yet
initialized. Later in xe_device_probe(), the driver will continue to GT
initialization:

xe_device_probe() {
    ...
    for_each_gt(gt, xe, id) {
        err =3D xe_gt_init(gt);
        if (err)
            return err;
    }
    ...
}

During this GT initialization, the driver will attempt to communicate with =
the
GuC hardware. For example, the call chain into GuC CT communication checks =
the
global wedged flag:

xe_guc_ct_send() / __guc_ct_send_locked() {
    if (xe_wedged(ct_to_xe(ct))) {
        ret =3D -ENOTRECOVERABLE;
        goto out;
    }
    ...
}

Since the device was globally marked as wedged by xe_ras_init(), this retur=
ns
an error that propagates up, causing xe_gt_init() and xe_device_probe() to
fail. Could this prevent the device from successfully binding and exposing
survivability mode to userspace?

>  	ret =3D devm_device_add_group(xe->drm.dev, &gpu_health_group);
>  	if (ret)
>  		xe_err(xe, "Failed to create GPU health sysfs, err=3D%d\n", ret);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016072623.4573=
92-1-raag.jadav@intel.com?part=3D9
