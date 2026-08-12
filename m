Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F8DC5DF6A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 22:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F083010F14A;
	Wed, 12 Aug 2026 22:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UV5JCjZL";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A253A10E44A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:51:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 72C1842E33;
 Wed, 12 Aug 2026 19:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359891F000E9;
 Wed, 12 Aug 2026 19:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786564289;
 bh=NNsD7SpPAj/P4wUCK8EyCGd+KDJ5amSUawh7ch3GorI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=UV5JCjZLgFZFxQogSREcvUM74s4J6USn3jz0EBpY8ywwQ6yPffm7iAXmHL1g0qEQg
 Hqj/ahLk2Xj9f84bSorx+eccbMIHCFB1zQxSlHFhZsPX8GUSiDNjM3ELX1o5MrY9Yd
 /p/RA5KJstBTcnBGJ/xqIXgqSgGGlAggzQ3ubMSeqFKvCSt8Y8idw/g0djcnqRcb5D
 nWbZsyVfLy+dIf+zWOtLvlRTd+BZL4bQNaYBjWHRhblEl0lr5WOteFjQhfGxIbnlNK
 XQkhQMbZ6TsFx8uG+jjfbhgeovhmGJYLSAsfWY+P0s4o9GmDiliKmUIPmWjMjD5RG+
 IKy5zk8rnXePw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/10] drm/xe/vsec: Crescent Island PMT decode
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260812193742.2170188-19-michael.j.ruhl@intel.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
 <20260812193742.2170188-19-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 19:51:28 +0000
Message-Id: <20260812195129.359891F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 22:17:09 +0000
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

New issues:
- [Medium] The Crescent Island (CRI) PMT initialization is inaccessible due=
 to missing platform integration in the initialization path, rendering the =
new decode logic dead code.

Pre-existing issues:
- [High] Unhandled cap_type and instance combinations in guid_decode functi=
ons silently return success with a 0 offset, leading to incorrect base regi=
ster reads.
--

--- Patch [7]: [PATCH v2 07/10] drm/xe/vsec: Crescent Island PMT decode ---
commit 8ae722df1dc1347897983eec5f487f23bc897a93
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Crescent Island PMT decode

This commit adds support for decoding the PMT data area on Crescent
Island (CRI) devices. It introduces new magic numbers, a new decode
function for CRI, and updates the telemetry read callback to use a
device-specific base offset.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 6345b0b4b26b8..dc42b9492428a 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -138,45 +162,92 @@ enum capability {
>  	WATCHER,
>  };
> =20
> -static int xe_guid_decode(u32 guid, int *index, u32 *offset)
> +static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
>  {
>  	u32 record_id =3D FIELD_GET(GUID_RECORD_ID, guid);
>  	u32 cap_type  =3D FIELD_GET(GUID_CAP_TYPE, guid);
[ ... ]
>  	switch (record_id) {
>  	case PUNIT:
> -		*index =3D 0;
> +		*index =3D BMG_IDX_TELEM_PUNIT;
>  		if (cap_type =3D=3D TELEMETRY)
> -			*offset =3D PUNIT_TELEMETRY_OFFSET;
> +			*offset =3D BMG_PUNIT_TELEMETRY_OFFSET;
>  		else
> -			*offset =3D PUNIT_WATCHER_OFFSET;
> +			*offset =3D BMG_PUNIT_WATCHER_OFFSET;
>  		break;
> =20
>  	case OOBMSM_0:
> -		*index =3D 1;
> +		*index =3D BMG_IDX_TELEM_OOBMSM;
>  		if (cap_type =3D=3D WATCHER)
> -			*offset =3D OOBMSM_0_WATCHER_OFFSET;
> +			*offset =3D BMG_OOBMSM_0_WATCHER_OFFSET;
>  		break;

[Severity: High]
This is a pre-existing issue, but if cap_type is not WATCHER here, this
case silently falls through, leaves offset as 0, and returns 0 indicating
success.

Will this misdirect reads to the base PMT offset since offset remains 0,
potentially leaking data or causing hardware hangs?

> +static int cri_guid_decode(u32 guid, int *index, u32 *offset)
> +{
[ ... ]
> +	case OOBMSM_0:
> +		*index =3D CRI_IDX_TELEM_OOBMSM;
> +		switch (instance) {
> +		case 0:
> +			if (cap_type =3D=3D WATCHER) {
> +				*index =3D CRI_IDX_WATCHER_OOBMSM;
> +				*offset =3D CRI_OOBMSM_WATCHER_OFFSET;
> +			}
> +			break;

[Severity: High]
Similarly, in this newly added function, if cap_type is not WATCHER for
instance 0, it silently breaks and returns 0.

Should this code return an error code like -EINVAL instead of falling
through to a success return with an offset of 0?

[ ... ]
> @@ -286,6 +374,7 @@ void xe_vsec_init(struct xe_device *xe)
>  	case XE_VSEC_BMG:
>  		if (!xe->soc_remapper.set_telem_region)
>  			return;
> +		xe->pmt.base_offset =3D BMG_TELEMETRY_OFFSET;
>  		info->priv_data =3D &xe_pmt_cb;
>  		break;
>  	default:

[Severity: Medium]
Is the XE_VSEC_CRI case missing from this switch statement?

If get_platform_info() correctly returns XE_VSEC_CRI, there appears to be
no case here to handle it, meaning base_offset and the pmt callbacks will
remain uninitialized.

Additionally, if get_platform_info() still filters out platforms greater
than XE_BATTLEMAGE, does it also need to be updated to allow the CRI
platform to be returned so this initialization path can be reached?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812193742.2170=
188-12-michael.j.ruhl@intel.com?part=3D7
