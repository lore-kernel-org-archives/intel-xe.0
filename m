Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BABC98304
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 18:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D06510E15E;
	Wed, 23 Sep 2026 18:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bxbhedOz";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C732E10E15E
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 18:18:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B7CE8600AA;
 Wed, 23 Sep 2026 18:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEE71F000FF;
 Wed, 23 Sep 2026 18:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790187524;
 bh=yC2AG31lDys4HL0IeU6kfm4tGSdYLEW7aPmIAkdLCoE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=bxbhedOzblEwg+gGkPlV/t9IKyJjLD0+Tr4tnSAoUjP9hebT70gAwaiBlw0ixZ4cL
 5UVEVqSVjw3aj1LzNc+stpY9KnfRUyiEdRE9LUMhJphYcKl15w2EA578x56mKwR89m
 oWlVxtGoeDGO9YytTbF2OL8ZdX/mXBVX/KS0czAAQaCyRbUTj4tjPYcNT2I18lmswp
 lXIxZYMfrDt3/uTpU59LQc5cwKKcHuVbzzmH16lyQtJlqL/6ztNiVawZXbRqbK7qBz
 Ja7dyxxNgXNGQI8M9QbCubhlU8L+P83tx/R2g7CAjool6esZwlAZ9hqrDdj9PYdaxf
 D0J//6yMrhcVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 10/20] drm/xe/vsec: Support possible hotplug exit
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260923181115.2514193-32-michael.j.ruhl@intel.com>
References: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
 <20260923181115.2514193-32-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:18:43 +0000
Message-Id: <20260923181844.4AEE71F000FF@smtp.kernel.org>
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
- [Low] cleanup: mixing goto and scope-based cleanup in xe_pmt_telem_read
--

commit 56101e5a8aff0e2c0ff7ea54aedbab708db223de
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support possible hotplug exit

DRM has an API that will verify that a device is valid in the hotplug
context.

Verify device is valid before access in the VSEC callback API.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 082b25b017db6..c0e06b2aeca66 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -188,11 +199,14 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,=
 u64 *data, loff_t user_offse
>  		xe_pm_runtime_get(xe);
>  		break;
>  	case TELEMETRY:
> -		if (!xe_pm_runtime_get_if_active(xe))
> -			return -ENODATA;
> +		if (!xe_pm_runtime_get_if_active(xe)) {
> +			ret =3D -ENODATA;
> +			goto dev_exit;
> +		}
>  		break;
>  	case WATCHER:
> -		return -EINVAL;
> +		ret =3D -EINVAL;
> +		goto dev_exit;
>  	}
> =20
>  	scoped_guard(mutex, &xe->pmt.lock) {

[Severity: Low]
Does this code violate the kernel cleanup API guidelines by mixing goto-bas=
ed
error handling with scope-based cleanup in the same function?

The patch introduces goto statements to a dev_exit label in xe_pmt_telem_re=
ad
in drivers/gpu/drm/xe/xe_vsec.c, a function which already uses scoped_guard.
According to include/linux/cleanup.h, mixing goto and cleanup helpers in the
same function is discouraged because it can create confusing ownership
semantics and risk double-free or leak bugs.

Could a scope-based cleanup helper be created for the drm_dev_enter and
drm_dev_exit pair to avoid mixing paradigms here?

> @@ -204,7 +218,10 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, =
u64 *data, loff_t user_offse
> =20
>  	xe_pm_runtime_put(xe);
> =20
> -	return count;
> +dev_exit:
> +	drm_dev_exit(idx);
> +
> +	return ret =3D=3D 0 ? count : ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923181115.2514=
193-22-michael.j.ruhl@intel.com?part=3D10
