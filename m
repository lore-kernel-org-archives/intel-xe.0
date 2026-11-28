Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6300D606A31C
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 06:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aG6/DDr+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FB710E17F;
	Sat, 28 Nov 2026 06:15:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FDC10E17F
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 06:15:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 71DD244371;
 Sat, 28 Nov 2026 06:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF231F00897;
 Sat, 28 Nov 2026 06:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795846522;
 bh=ydZvn54GkQVbX+vnVwg5vNa/eGTG5cyuezEazxpsGUU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=aG6/DDr+vKR6gFH+4v5p9EKPP/2fa/Sd+SGwGTUR+wrpBNctNvG7O2AFrXzc/7cgs
 erHW1Etph1sLXmsFbFNLHi0RuMALD+tqMvNFsE/dvqcX6a+h2jyUV4DH8oFuxsmg3n
 qaAUrfzgpNCPU7ZW0p3o3UyMYauLsgDctca+r6Kp67AZjz2ZNaRWFgwMy3mec0YhAi
 0WyEHiPs5/FMd4MRJa8iNnuafX14RVOUe5gn2djsZHDeJhTXqvh8vvqhyC5tIrC1Bo
 ct3twr1qWAUPd4KRttH65xsWaexkRRDHkdN1YD0kt8zYuGbEBUvytA8Tw8fjIZ3Sok
 Be7IDBIntkTqA==
Message-ID: <sashiko-outbox-238489@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/10] drm/xe/hwmon: Restore fan user tables after
 resume
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261128055923.3316956-8-karthik.poosa@intel.com>
References: <20261128055923.3316956-1-karthik.poosa@intel.com>
 <20261128055923.3316956-8-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 06:15:21 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] drm/xe: synchronous flush_work() in xe_late_bind_pm_resume()
  deadlocks resume
- [Medium] drm/xe/hwmon: xe_hwmon_resume() clears staged fan curve
  points on resume
- [Low] drm/xe/hwmon: duplicate xe_hwmon_fan_set_auto() fallback in
  xe_hwmon_resume()
--

commit 487a525936d402c4983c294401d28e7b960944fa
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Restore fan user tables after resume

This commit saves active manual and full-speed fan tables before system
suspend, runtime D3cold suspend, and FLR, and restores them on resume
after waiting for late-bound fan-control firmware to reload.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 4d6eb6f6fbc2f..76c2b519a21f7 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c

[ ... ]

> +void xe_hwmon_resume(struct xe_device *xe, bool runtime)
> +{
> +	struct xe_hwmon *hwmon =3D xe->hwmon;
> +	int fan;
> +
> +	if (!hwmon || !xe->info.has_fan_control)
> +		return;
> +
> +	if (runtime && !xe->d3cold.allowed) {
> +		xe_dbg(xe, "d3cold not allowed, skipping fan user-table restore\n");
> +		return;
> +	}
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	for (fan =3D 0; fan < FAN_MAX; fan++) {
> +		struct xe_hwmon_fan_info *fi =3D &hwmon->fi[fan];
> +		int ret;
> +
> +		if (!IS_FAN_ENABLED(hwmon, fan))
> +			continue;
> +
> +		if (!fi->restore_user_table) {
> +			xe_dbg(xe, "fan %d user table restore not required\n", fan);
> +			continue;
> +		}
> +
> +		/* Re-program cached user-table settings for fans active before suspen=
d. */
> +		ret =3D xe_hwmon_activate_user_fan_table(hwmon, fan,
> +						       fi->is_full_speed,
> +						       USER_FAN_TABLE);

[Severity: Medium]
Does calling xe_hwmon_activate_user_fan_table() here discard any
in-progress staged fan curve points across suspend and resume?

Each write to pwmN_auto_pointM_temp or pwmN_auto_pointM_pwm holds a
runtime PM reference only for that single sysfs write while recording
progress in temp_staged and speed_staged.  If the device enters runtime
D3cold (or system suspend) between sysfs writes while a user fan table is
already active, xe_hwmon_resume() calls xe_hwmon_activate_user_fan_table(),
which unconditionally clears both staged bitmasks:

drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_activate_user_fan_table() {
    ...
	fi->fan_table[USER_FAN_TABLE].temp_staged =3D 0;
	fi->fan_table[USER_FAN_TABLE].speed_staged =3D 0;
    ...
}

Later sysfs writes to finish the curve then see missing prefix bits in
xe_hwmon_update_user_fan_point() and silently fail to commit the new
curve.

> +		if (ret) {
> +			xe_warn(xe, "failed to restore fan %d user table after resume, ret=3D=
%d\n",
> +				fan, ret);
> +			fi->fan_table[USER_FAN_TABLE].point_count =3D 0;
> +			fi->restore_user_table =3D false;
> +			ret =3D xe_hwmon_fan_set_auto(hwmon, fan);
> +			if (ret) {
> +				xe_warn(xe, "fan %d stock fallback failed, state unconfirmed, ret=3D=
%d\n",
> +					fan, ret);
> +				continue;
> +			}
> +			continue;
> +		}

[Severity: Low]
Does this error path duplicate the stock fallback that
xe_hwmon_activate_user_fan_table() already performs?

xe_hwmon_suspend() only sets restore_user_table when point_count is
within bounds, so xe_hwmon_activate_user_fan_table() only fails here if
writing or verifying the table fails, in which case it has already cleared
point_count and called xe_hwmon_fan_set_auto(hwmon, fan) before returning.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe=
_late_bind_fw.c
> index ad39383a7e41f..c577e2d516200 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -517,10 +517,17 @@ void xe_late_bind_pm_suspend(struct xe_late_bind *l=
ate_bind)
>   */
>  void xe_late_bind_pm_resume(struct xe_late_bind *late_bind)
>  {
> +	struct xe_late_bind_fw *fan_control_fw;
> +	bool fan_control_fw_pending;
> +
>  	if (!late_bind->component_added || late_bind->disable)
>  		return;
> =20
> +	fan_control_fw =3D &late_bind->late_bind_fw[XE_LB_FW_FAN_CONTROL];
> +	fan_control_fw_pending =3D !!fan_control_fw->payload;
>  	xe_late_bind_fw_load(late_bind);
> +	if (fan_control_fw_pending)
> +		flush_work(&fan_control_fw->work);
>  }

[Severity: High]
Does flushing fan_control_fw->work inside xe_late_bind_pm_resume()
deadlock against the child MEI auxiliary device during both system resume
and runtime D3cold resume, ultimately timing out and freeing
fan_control_fw->payload?

On platforms such as Battlemage, heci_gsc_add_device() registers the
xe.mei-gscfi auxiliary device with aux_dev->dev.parent =3D &pdev->dev.
During system suspend, mei_gsc_pm_suspend() stops the MEI bus and unbinds
the late-bind component, clearing late_bind->component.ops =3D NULL.  During
system resume, the PM core runs the parent xe_device_resume() callback
before the child aux_dev->dev is allowed to resume:

PM resume context                 kworker (late_bind->wq)
xe_device_resume()
  xe_late_bind_pm_resume()
    xe_late_bind_fw_load()
      queue_work(..., &lbfw->work)
    flush_work(&fan_control_fw->work)
                                  xe_late_bind_work()
                                    /* waits up to 20s for component.ops */
                                    while (!late_bind->component.ops)
                                      msleep(100);
                                    /* mei_gsc_pm_resume() blocked on paren=
t */
                                    drmm_kfree(..., lbfw->payload);
                                    lbfw->payload =3D NULL;  <-- firmware l=
ost

Runtime resume from D3cold hits a similar dependency cycle:
xe_pm_runtime_resume() runs while pdev->dev.power.runtime_status is
RPM_RESUMING and blocks in flush_work(&fan_control_fw->work).
xe_late_bind_work() calls push_payload() -> mei_lb_push_payload() ->
mei_cldev_enable() -> mei_cl_connect(), which calls
pm_runtime_get(&aux_dev->dev) and waits 15 seconds for
mei_gsc_pm_runtime_resume(), while pm_wq cannot runtime-resume
aux_dev->dev until its parent pdev->dev finishes RPM_RESUMING.

In both paths, resume stalls for 15 to 20 seconds, xe_late_bind_work()
permanently frees fan_control_fw->payload until reboot, and
xe_hwmon_resume() runs without the fan-control firmware loaded.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128055923.3316=
956-1-karthik.poosa@intel.com?part=3D7
