Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6860BC982C1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 20:21:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EF610E061;
	Wed, 16 Sep 2026 20:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mS6JS53d";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E549E10E061
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 20:21:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id EB874601EF;
 Wed, 16 Sep 2026 20:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7842A1F000FF;
 Wed, 16 Sep 2026 20:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789590090;
 bh=bqnFd2N+GIGbB6aeCp6WS67ccUbLtsJ12FpCloxf0jY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=mS6JS53dB2EvAoqkwAhxieJ7vKjvS5wRQwxNir/2ydYfAv5FeWefeacDbvIXoTSR0
 CuDYyWuAPHbNt1au9GjbHB4oeUmfPcXeGiovktPSbbTjx8BpRVDCGAuY8YIlILAN29
 tq7EHl50mbWKoW9sjs7b1VYc9Q4yc4SBmJUeLmz50BWrxMQQAgrXco1T49Ulm78q6n
 EZt0hUCnVI4jzFCIOL0+m3DY5nxuwFbiDU9MIaz4H5EVed9gz0JCQAz44F32IdiF+s
 w8L76HujPqRQfzBQkUgkR+rq1401i86vw26Hclh5R4xDF+ReztRGns20UTeumlJB1+
 tPmP+myuzb/Ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 10/20] drm/xe/vsec: Support possible hotplug exit
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260916201139.2374531-32-michael.j.ruhl@intel.com>
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
 <20260916201139.2374531-32-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 20:21:30 +0000
Message-Id: <20260916202130.7842A1F000FF@smtp.kernel.org>
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
- [Low] cleanup: mix of goto and scoped_guard() in xe_pmt_telem_read()
--

commit 5940c0b6f7d9cab3fae443cef41e2d74cd3f39e9
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support possible hotplug exit

This commit introduces DRM hotplug verification to the VSEC callback API.
It verifies that the device is valid using drm_dev_enter() and handles
cleanup on exit with drm_dev_exit().

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index ca5d02dce8189..c20cad9a4f1f2 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -171,13 +178,17 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,=
 u64 *data, loff_t user_offse
>  	u32 cap_type =3D FIELD_GET(GUID_CAP_TYPE, guid);
>  	u32 mem_region;
>  	u32 offset;
> -	int ret;
> +	int ret =3D 0;
> +	int idx;
> =20
>  	xe_assert(xe, !IS_SRIOV_VF(xe));
> =20
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
>  	ret =3D xe_guid_decode(guid, &mem_region, &offset);
>  	if (ret)
> -		return ret;
> +		goto dev_exit;
> =20
>  	telem_addr +=3D offset + user_offset;
> =20
> @@ -187,11 +198,14 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,=
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
Does mixing goto-based error handling and scoped_guard() in the same
function create an issue with the cleanup guidelines?

According to include/linux/cleanup.h, the expectation is that usage of
goto and cleanup helpers should never be mixed in the same function, as it
creates confusing ownership semantics.=20

Since xe_pmt_telem_read() now uses both a dev_exit goto label and
scoped_guard() for mutex management, could the drm_dev_exit() sequence be=20
converted to use a scope-based cleanup instead, or could the locking avoid
using scoped_guard() to keep the paradigms consistent?

> @@ -203,7 +217,10 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, =
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916201139.2374=
531-22-michael.j.ruhl@intel.com?part=3D10
