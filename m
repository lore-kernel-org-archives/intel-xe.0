Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A85F60A2616
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 02:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AgyEscN5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0F3112851;
	Fri, 20 Nov 2026 02:30:20 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3327B112851
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 02:30:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4BFEB60F48;
 Fri, 20 Nov 2026 02:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D067A1F000C4;
 Fri, 20 Nov 2026 02:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795141813;
 bh=CmBOtwUa9WCDBAAdftyiHm/8zc11FEJb6K2uh/nN4io=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=AgyEscN5Dz6kr/t+5j0THgMgvQe1IrOpMv21vb4WM3vOtRMAoPq1K8GEp9JYIvDZ6
 oiTgdWlGyZETffYHjp4TSIIQ64iyBdnsZwO+fMq5Yh3lZ1SDkwLVZoJYTHUQCSRG2q
 z5uhmtpQzwrWl2cKrtdS3VV2b3FWIai0XUhPk4IB66jihdYpTnNaMiR5i5DuP52p7R
 40SwWEI99/4AKdM3shoG5dGgGfLEFvkPBwNOXJ1x/jhkh8MH0tg42wVTSeyAz3XmIA
 o0Hq4pffu/hWHhbOQiA9BXPOT+suzV3YbLAO8Z/sKtOb5OnOKTRRpho49B3rBBoB0Q
 TKrNnZ4NG6k+w==
Message-ID: <sashiko-outbox-224365@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 08/19] drm/xe/vsec: Support possible hotplug exit
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261120021929.473553-29-michael.j.ruhl@intel.com>
References: <20261120021929.473553-21-michael.j.ruhl@intel.com>
 <20261120021929.473553-29-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 02:30:12 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/xe/vsec: xe_pmt_telem_read() returns count instead of
  -ENODEV on hotplug
--

commit 1b48141a6517afa4b3ba9a47a80f8aa9db62a6e9
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support possible hotplug exit

This commit adds drm_dev_enter() and drm_dev_exit() around the device
access in xe_pmt_telem_read() to guard against hotplug removal.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 082b25b017db6..6a28e58959be9 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -159,7 +161,12 @@ static int xe_guid_decode(u32 guid, int *index, u32 =
*offset)
>   * @user_offset: a user offset relative to the beginning of the data to =
read
>   * @count: bytes to read
>   *
> + * This is a callback API.  I.e this can be accessed external to the XE =
driver
> + * (PMT driver scope).  Because of this, DRM hotplug needs to be verified
> + * (drm_dev_enter()).
> + *
>   * Return:
> + * * -ENODEV device is not available (hotplug)
>   * * -ENODATA for incorrect power state
>   * * -EINVAL for unsupported PMT feature
>   * * count   number of bytes read on success
> @@ -172,13 +179,19 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,=
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
> +	if (!drm_dev_enter(&xe->drm, &idx)) {
> +		memset(data, 0, count);
> +		return count;
> +	}

[Severity: Medium]
Should this return -ENODEV instead of zeroing data and returning count when
drm_dev_enter() fails, as documented in the Return section above?

Returning count reports a successful read of all zeroes, so callers such as
xe_hwmon_energy_get() that check ret !=3D sizeof(pmt_val) treat the zeroed
buffer as a valid hardware reading and underflow the 32-bit unsigned delta
(reg_val - ei->reg_val_prev) when updating ei->accum_energy.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120021929.4735=
53-21-michael.j.ruhl@intel.com?part=3D8
