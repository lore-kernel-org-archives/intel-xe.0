Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97367C79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC9A10F1F7;
	Wed,  9 Sep 2026 16:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A7oKMpnE";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DC010F1F7
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 16:01:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8AD30600CB;
 Wed,  9 Sep 2026 16:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CDF1F00A3A;
 Wed,  9 Sep 2026 16:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788969678;
 bh=IGkEvSYk6cta+zv4C2Y0RP9WzqaabaaC+66g32cUSEI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=A7oKMpnEzX80w5KhfveA05Rwa3TEPEK7MapxybqfXC+wJYBKKmP9Z2xSe7umQYnX9
 mk8/EeoYyukddzV2JAe1hQdPfhojH/TvPyleUBk1mO/uTTt1EtN1fOKSXf/zdvBRNS
 iU6P3GVO8m25K+ZIE0y3FgXg2e0kfzVXIiW7XbjgQ8paTnt2vajlXfUSetCAYKuHIV
 A6QzK9hSmSnIncd0QLe+AlHRgofbBKchp2jVg+Lc6TWI6d603/Abijqustjt5+qQcH
 Z44dOh5zFHTF1rfLMeONNPhDO5b9yufVTgFHq95GGVK6Wl+EKRiKv3tCqdjeVPB+9p
 7Er+ymEYoCqUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 12/20] drm/xe/vsec: Support EAGAIN return value
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909154739.1515514-34-michael.j.ruhl@intel.com>
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
 <20260909154739.1515514-34-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 16:01:17 +0000
Message-Id: <20260909160118.17CDF1F00A3A@smtp.kernel.org>
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

Pre-existing issues:
- [Medium] xe_hwmon_energy_get() incorrectly masks the -EAGAIN error by ret=
urning 0, which corrupts power calculations and permanently hides sysfs att=
ributes.
--

commit 99e578f62cb6212c825a10a5de5875717c46d4a9
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support EAGAIN return value

This commit updates call locations of xe_pmt_telem_read() to explicitly
ignore the -EAGAIN return value and prevent it from logging warnings.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5284cab6703d8..ecd52a04175d0 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -522,7 +522,9 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int chann=
el, long *energy)
>  					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
>  					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));
>  		if (ret !=3D sizeof(pmt_val)) {
> -			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", re=
t);
> +			if (ret !=3D -EAGAIN)
> +				drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n",
> +					 ret);

[Severity: Medium]
This isn't a bug introduced by this patch, but since we are modifying the
error handling here, does swallowing -EAGAIN break sysfs attribute
registration and runtime energy reporting?

During device initialization, xe_hwmon_register() evaluates sysfs attribute
visibility by calling xe_hwmon_energy_get():

xe_hwmon_energy_is_visible() {
    ...
    if (hwmon->xe->info.platform =3D=3D XE_BATTLEMAGE) {
        xe_hwmon_energy_get(hwmon, channel, &energy);
        return energy ? 0444 : 0;
    }
    ...
}

Because xe_vsec_init() (which sets PMT base_offset) is called after
xe_hwmon_register() in xe_device.c, the PMT read deterministically returns
-EAGAIN during probe.

By swallowing the error here and resetting the output to 0:

>  			*energy =3D 0;
>  			return;
>  		}

The visibility check sees energy=3D0 and permanently hides the sysfs attrib=
utes
(e.g., energy1_input) for Battlemage GPUs.

Additionally, if -EAGAIN occurs during a later runtime read in
xe_hwmon_energy_read(), returning 0 microjoules instead of propagating the
error code corrupts power monitoring tools that compute power from this
monotonic accumulator.

Could we change xe_hwmon_energy_get() to return an error code instead of
void so callers can distinguish between an actual 0 value and a failure?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909154739.1515=
514-22-michael.j.ruhl@intel.com?part=3D12
