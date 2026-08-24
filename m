Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D98C5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 16:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7004610E158;
	Mon, 24 Aug 2026 16:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eyBBwINV";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB9010E158
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 16:36:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C78A741858;
 Mon, 24 Aug 2026 16:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9634C1F00A3A;
 Mon, 24 Aug 2026 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787589359;
 bh=Rl8ePP4BGkBGGVsx1FI3apKu8ibL/ppZSnnfteKfb7Y=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=eyBBwINVwiWjiVinuNDZxIYnSfNWfb+ktW7z06nV3pXKea4FJzNzWZPI8UeSTTS+d
 P5W+N+7akQ4uRbEKMTRygRfDk4wmF4HRcqaiYEuNY6U+PSqTmqJJ4qgqGW8dmno1gY
 dpO4/uVJL7CjeKJAtsQJkYG8zktaVhsfQjyP+tM4hske64LQSLvzkMYEphyFGygNvS
 CMWLqj1HDZIT9N6grtwPr7EsNicRYREinEKmiGWFlqJQ4ezSVwScJ/DN+XZcXGFXLZ
 1qk2NvVKqFSUTwSQENLDiQEL897KTJL8RHSjny9eepbVz9kuzTZp9/D3RsmfsEQ5a6
 htpiB91ZE+M5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/10] drm/xe/vsec: Crescent Island PMT decode
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824162317.2450380-19-michael.j.ruhl@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-19-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 16:35:59 +0000
Message-Id: <20260824163559.9634C1F00A3A@smtp.kernel.org>
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
- [Low] Incorrect index assignment for PUNIT WATCHER in cri_guid_decode().
--

--- Patch [7]: [PATCH v3 07/10] drm/xe/vsec: Crescent Island PMT decode ---
commit 1a9376fa8378b9795de36421250f5e1e1308ede7
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Crescent Island PMT decode

Crescent Island (CRI) has different index and offset values for
accessing the PMT data area. This updates the decode path and data read
callbacks to support the CRI device usage.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 6345b0b4b26b8..dc42b9492428a 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c

[ ... ]

> +static int cri_guid_decode(u32 guid, int *index, u32 *offset)
> +{
> +	u32 record_id =3D FIELD_GET(GUID_RECORD_ID, guid);
> +	u32 cap_type  =3D FIELD_GET(GUID_CAP_TYPE, guid);
> +	u32 instance  =3D FIELD_GET(CRI_GUID_INSTANCE, guid);
> +
> +	*offset =3D 0;

[ ... ]

> +	switch (record_id) {
> +	case PUNIT:
> +		*index =3D CRI_IDX_TELEM_PUNIT;
> +		if (cap_type =3D=3D TELEMETRY)
> +			*offset =3D CRI_PUNIT_TELEMETRY_OFFSET;
> +		else
> +			*offset =3D CRI_PUNIT_WATCHER_OFFSET;

[Severity: Low]
Does this code assign the correct index for the PUNIT WATCHER capability?

Earlier in the patch, a macro is defined explicitly noting that PUNIT and
OOBMSM share the WATCHER index:

#define CRI_IDX_WATCHER_OOBMSM          0x03  /* PUNIT and OOBMSM share thi=
s index */

However, the switch statement for PUNIT unconditionally assigns the index
to CRI_IDX_TELEM_PUNIT (0x01) without updating it to CRI_IDX_WATCHER_OOBMSM
when cap_type is WATCHER.

While xe_pmt_telem_read() currently returns -EINVAL for the WATCHER
capability (which prevents any immediate io failures), does this decode log=
ic
contradict the documented hardware index sharing?

> +		break;
> +
> +	case OOBMSM_0:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824162317.2450=
380-12-michael.j.ruhl@intel.com?part=3D7
