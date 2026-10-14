Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBF7CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 06:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4759410FAFF;
	Wed, 14 Oct 2026 06:05:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD60910FAEF
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 06:05:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D96E660218;
 Wed, 14 Oct 2026 06:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739A71F000FF;
 Wed, 14 Oct 2026 06:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791957917;
 bh=lBOMl4EAZV5Y1b8qg9GuKOSaLHuRI+YY6KeauuM3XKc=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=WAuDndyLY6NJBkb7StH4R+liQFwIhwSMun4Ss5bmqKxiosg/8CZ3pMrf7RxPTms3X
 WcKpyX3ucKEiqNIqSv8+7YDMxCYwb6LQFBB6Vt1LmDiCVI8U8M1vVwo43SZuZlsUVr
 ob0hJYjNSwefJb2h7ZRu8KUqUmoXFpKawUGs6F3yDz33bFRCiGdDId+p7ulFS4z3pU
 o/EocDAhJ1ep7fKNg14QwD4sf1Mn5aKTrTAoDmr9w3MDrKK1eDDqbD6kIaC2+H2ph9
 RrCufrDXRNJm6SghQqOcNvLGea/wntlzJ/JT8/XdvitIM6k+QL95gSPH+RBrjfpxQl
 BzAj7uOpSORRA==
Message-ID: <sashiko-outbox-170850@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/7] drm/xe: Introduce xe_wedge
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261014055215.330408-7-raag.jadav@intel.com>
References: <20261014055215.330408-1-raag.jadav@intel.com>
 <20261014055215.330408-7-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 06:05:17 +0000
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
- [Medium] drm/xe: data race and inconsistent GT state in xe_wedge_set_mode=
()
- [Low] perf: xe_wedged() out-of-lining adds function call overhead in hot =
paths
--

commit 6fd8783d76a985325bbdd99f638c5f6528cd1918
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe: Introduce xe_wedge

This commit consolidates the wedging implementation into a dedicated xe_wed=
ge
component for better maintainability. It moves the wedged state tracking and
related helpers out of xe_device and renames them to match the new component
namespace.

> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge.c

[ ... ]

> +/**
> + * xe_wedged() - Check for wedged device
> + * @xe: xe device instance
> + *
> + * Returns: %true if device is wedged, %false otherwise.
> + */
> +bool xe_wedged(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->wedged.flag);
> +}

[Severity: Low]
Does moving this trivial atomic read out-of-line introduce unnecessary
overhead?

Hot paths like xe_bo_cpu_fault() and g2h_read() check xe_wedged() on every
invocation. Previously, xe_device_wedged() was a static inline function in
a header, allowing the compiler to optimize it. Moving it to xe_wedge.c
forces a function call for a single memory read. Should this be moved back
to a header file as a static inline?

[ ... ]

> +static int wedge_mode_set_reset_policy(struct xe_device *xe, enum xe_wed=
ged_mode mode)
> +{
> +	struct xe_gt *gt;
> +	int ret;
> +	u8 id;
> +
> +	guard(xe_pm_runtime)(xe);
> +	for_each_gt(gt, xe, id) {
> +		ret =3D __wedge_mode_set_reset_policy(gt, mode);
> +		if (ret) {
> +			if (id > 0) {
> +				xe->wedged.inconsistent_reset =3D true;
> +				xe_err(xe, "Inconsistent reset policy state between GTs\n");
> +			}
> +			return ret;
> +		}
> +	}
> +
> +	xe->wedged.inconsistent_reset =3D false;
> +
> +	return 0;
> +}

[Severity: Medium]
Is there a risk of concurrent writers leaving the GTs in an inconsistent
state here?

Multiple user-space threads could simultaneously write conflicting modes to
/sys/kernel/debug/dri/*/wedged_mode, as the fops->write handler for debugfs
does not serialize concurrent invocations. If their updates to
__wedge_mode_set_reset_policy() interleave, it could leave hardware in a
mixed state (e.g., one GT configured for engine resets and another not)
while still erroneously clearing the xe->wedged.inconsistent_reset flag.

[ ... ]

> +int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode)
> +{
> +	int ret;
> +
> +	ret =3D wedge_validate_mode(xe, mode);
> +	if (ret)
> +		return ret;
> +
> +	if (wedge_mode_needs_policy_update(xe, mode)) {
> +		ret =3D wedge_mode_set_reset_policy(xe, mode);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	xe->wedged.mode =3D mode;

[Severity: Medium]
Could this assignment cause a data race?

Without a lock protecting xe->wedged.mode, concurrent writes could result
in the stored mode no longer matching the actual hardware state set on the
GTs. Should these updates be synchronized to protect both the variable and
the GT policy updates?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014055215.3304=
08-1-raag.jadav@intel.com?part=3D6
