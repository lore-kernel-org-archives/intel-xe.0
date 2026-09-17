Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEC4C88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 19:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B75510F05F;
	Thu, 17 Sep 2026 19:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fz3IAmQR";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC74310F05F
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 19:39:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F3BE1601EF;
 Thu, 17 Sep 2026 19:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED321F000FF;
 Thu, 17 Sep 2026 19:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789673982;
 bh=DbdfUXUgjuRvEBaMknXBqvlpFRISNbP3ljZOQuoDqvk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=fz3IAmQR1r58gETqLmF+NcankE6M9cXeJJnasfARIlbkkApNVP7iFsOgvkWUuXDkj
 643DU7FHd5FKYs7M1L0MXFDX2aoMt9SGN/oRN/+U7GTQaTFKZA7610pbHrp3pa5XWZ
 sTqKcKmUIk0xP2/4Kkraw2j8Yw7qWfoz6S0unvnjfdtXc59vxxlIQQaqYpL5pt7H1l
 vWm39aH8P3ZWTX0zRYZMrXvxp1hoiFQFQ/WZYdf4BMyCmCCWw3HV7bc54e/UKyqEBt
 ql4MzltCC/LMc8DFmBx0D7HsXD/2ecMDzC8WC6XBP70X9Z9mC5LqZaS5i/L5yk+hQb
 6qZplyX4CRxJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] drm/xe/sysctrl: Add RAS error injection debugfs
 interface
To: =?utf-8?b?QW5vb3AsIFZpamF5?= <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260917193026.3234636-7-anoop.c.vijay@intel.com>
References: <20260917193026.3234636-5-anoop.c.vijay@intel.com>
 <20260917193026.3234636-7-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 19:39:42 +0000
Message-Id: <20260917193942.8ED321F000FF@smtp.kernel.org>
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
- [Medium] xe: missing little-endian conversion for RAS error injection pay=
load
--

commit 7903eaec1791648b7046d617e95443efac765053
Author: Anoop Vijay <anoop.c.vijay@intel.com>

    drm/xe/sysctrl: Add RAS error injection debugfs interface
   =20
    Add debugfs interface for exercising System Controller's RAS error
    injection command, used to validate RAS error detection and recovery
    paths.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe=
/xe_sysctrl_debugfs.c
> index 6e96b1190e268..272e51f24f7bc 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c

[ ... ]

> +static int sysctrl_parse_ras_error_inject(struct xe_device *xe, char *tm=
p,
> +					  struct xe_sysctrl_diag_ras_err_inj_req *req)
> +{
> +	unsigned int nfields =3D 0;
> +	char *token;
> +	unsigned long val;
> +
> +	while ((token =3D strsep(&tmp, " \t\n")) !=3D NULL) {
> +		if (*token =3D=3D '\0')
> +			continue;
> +
> +		if (kstrtoul(token, 0, &val))
> +			goto inval;
> +
> +		switch (nfields) {
> +		case 0:
> +			if (val > U16_MAX)
> +				goto inval;
> +			req->ras_block_id =3D val;
> +			break;
> +		case 1:
> +			if (val > U16_MAX)
> +				goto inval;
> +			req->ras_sub_block_id =3D val;
> +			break;
> +		case 2:
> +			if (val > U16_MAX)
> +				goto inval;
> +			req->err_type =3D val;
> +			break;
> +		case 3:
> +			if (val > U32_MAX)
> +				goto inval;
> +			req->params =3D val;
> +			break;

[Severity: Medium]
Do these assignments need cpu_to_le16() and cpu_to_le32() conversions?

In sysctrl_parse_ras_error_inject(), host-native values are assigned
directly to the payload struct. When writing to the ras_error_inject
debugfs file on big-endian architectures, the RAS error injection payload
is sent to the firmware with swapped bytes. This would cause the firmware
to receive incorrect block IDs and parameters.

> +		default:
> +			xe_err(xe, "sysctrl: too many ras_error_inject arguments\n");
> +			return -EINVAL;
> +		}
> +		nfields++;
> +	}

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/=
drm/xe/xe_sysctrl_mailbox_types.h
> index 691a699667788..f658c9c54b49f 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h

[ ... ]

> +/**
> + * struct xe_sysctrl_diag_ras_err_inj_req - DIAG_RAS_ERR_INJECT request =
payload
> + *
> + * Request payload for XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT. The mailbox l=
ayer
> + * prepends the application message header before sending.
> + *
> + * @ras_block_id: RAS block (subsystem) to inject the error into
> + * @ras_sub_block_id: RAS sub-block (IP) within @ras_block_id
> + * @err_type: Type of test error to inject
> + * @reserved: Must be zero
> + * @params: Optional injection parameters (default 0)
> + */
> +struct xe_sysctrl_diag_ras_err_inj_req {
> +	u16 ras_block_id;
> +	u16 ras_sub_block_id;
> +	u16 err_type;
> +	u16 reserved;
> +	u32 params;
> +} __packed;

[Severity: Medium]
Should these fields use __le16 and __le32 instead of u16 and u32?

The sysctrl mailbox interface expects little-endian data, but these hardware
payload fields are declared with host-native types in
struct xe_sysctrl_diag_ras_err_inj_req.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917193026.3234=
636-5-anoop.c.vijay@intel.com?part=3D2
