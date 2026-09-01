Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B3BC61DD6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 20:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9E610E308;
	Tue,  1 Sep 2026 20:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AORQW27Q";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0106F10E308
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 20:20:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A3DB143B63;
 Tue,  1 Sep 2026 20:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2E81F000E9;
 Tue,  1 Sep 2026 20:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788294053;
 bh=NfWEtt0hsav6LjmdGR2tn2elZRY67l9NcMXp+DPy1lI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=AORQW27Qwwo2LgYJ3liWf3riRia81U2FxfKIP1ulFe/2hzr/437AYEqLcM7b44Qdq
 ESmRRCSjvDCu0W+/+KPIcJQYLib3wLm3RlasKap5iwgU3ywo4hUId7XEADT5n9lHW6
 eDHuB7x1qSvvFypZXgbqyorO7N/rNXjBtZazr1NKt0TzwcGlrgAFR6JAmMHqqGwIsC
 puDscQfdNKOHUleMUZEXuHHhP30sV/H5GSOYFuviWYQw/WFR2oCLysTB8bKSw1Wlok
 AeB2oRTkU/Ph1l733vFZjF8CPlzx4PepvjYKcjy1eJD46ZImU3dAAc1epXvjfddkis
 PWUA85esIDFrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 16/18] drm/xe/vsec: Add PMT GUID internal access
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260901192736.626777-36-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-36-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:20:52 +0000
Message-Id: <20260901202053.5D2E81F000E9@smtp.kernel.org>
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
- [Medium] `xe_vsec_get_guid()` returns 0 (success) instead of an error cod=
e for unsupported platforms.
--

commit 5ceb34095c8fcb408f81cf6301878d346676cb2c
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Add PMT GUID internal access

This commit adds platform ID usage for the PMT GUID register access. It
provides a new API to allow accessing the GUID based on the platform for
internal usage by Xe.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> +int xe_vsec_get_guid(struct xe_device *xe, u32 *guid)
> +{
[ ... ]
> +	switch (xe->info.platform) {
> +	case XE_BATTLEMAGE:
> +		*guid =3D xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID);
> +		break;
> +
> +	case XE_CRESCENTISLAND:
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		*guid =3D xe_mmio_read32(mmio, CRI_PUNIT_TELEMETRY_GUID);
> +		break;
> +
> +	default:
> +		*guid =3D 0;
> +		drm_err(&xe->drm, "Unsupported platform: %u\n", xe->info.platform);
> +		break;
> +	}
> +
> +	xe->pmt.punit_guid_cache =3D *guid;
> +
> +unlock:
> +	mutex_unlock(&xe->pmt.lock);
> +	xe_pm_runtime_put(xe);
> +
> +	return 0;

[Severity: Medium]
Should this return a negative error code (such as -ENODEV) when an unsuppor=
ted
platform is encountered?

Returning 0 (success) here means callers like read_residency_counter() will
proceed and call xe_pmt_telem_read() with an invalid GUID (0), which will f=
ail
downstream and trigger additional warnings.

Additionally, because *guid is 0, xe->pmt.punit_guid_cache is set to 0. Sin=
ce
0 evaluates to false in the cache check earlier in the function:

    if (xe->pmt.punit_guid_cache) {
        *guid =3D xe->pmt.punit_guid_cache;
        goto unlock;
    }

the cache will be bypassed on subsequent calls, causing the kernel to log t=
he
"Unsupported platform" error every time this is called (for example, when
userspace repeatedly reads from debugfs).

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901192736.6267=
77-20-michael.j.ruhl@intel.com?part=3D16
