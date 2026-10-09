Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16525CA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BB2112059;
	Fri,  9 Oct 2026 10:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JJeDeq16";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DA1112059
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 10:46:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3FC9860534;
 Fri,  9 Oct 2026 10:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3561F000FF;
 Fri,  9 Oct 2026 10:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791542764;
 bh=8zXHufskK4WF8DGArIw31j7LwgtNU8VLAdxsm6gYfJ0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JJeDeq16uK742w6/n9kQqzSMz9b22471lUefv9lG/mtVHOd5kP4ENh2PQk4N9f6Dx
 6gDujMIA/MDOCCfXMBHIo2zmfReRv/RB5ij0cLDuodLYvrCJD/e+tQf2C01FS/hFGY
 oekyKI5EGHse7i1wCWf3kCH+5iZKhGnHpnhGCWMFVOJP4C9Bfp1ElU/FUYWv6VqAdE
 +E0clcCgNS1kKkKYAuA3Zdk+YvAFimD9hX/sP1/MaVB5QhjQQdBY03e9r2zCcZykDJ
 nHi6tcaABRUmDtRXQ6l12fVpHE+0+TWPM8CNwaS92YLrs9mQliJkFIEpazVXOGwM7q
 6u/eJi1wogqKw==
Message-ID: <sashiko-outbox-165261@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/12] drm/xe/cper: Retrieve the error counter record
 for CPER reporting
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261009104602.1075405-16-badal.nilawar@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-16-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:46:03 +0000
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
- [High] drm/xe: out-of-bounds array access on informational or reserved RA=
S errors
--

commit 27317cc719f71d74be0f7fcd94c5a8fbf53f9e5e
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cper: Retrieve the error counter record for CPER reporting
   =20
Retrieve error counter record required to build a CPER record.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 7a85735c57d58..5cfc9beff8c13 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -284,21 +282,21 @@ static void ras_send_error_event(struct xe_device *=
xe, u8 severity, u8 component)
>  {
>  	struct xe_ras_error_class counter =3D {0};
> +	struct xe_ras_get_counter_response response =3D {0};
>  	u8 drm_severity, drm_component;
> -	u32 value;
>  	int ret;
> =20
>  	counter.common.severity =3D severity;
>  	counter.common.component =3D component;
> =20
> -	ret =3D get_counter(xe, &counter, &value);
> +	ret =3D xe_ras_get_counter_response(xe, &counter, &response);
>  	if (ret)
>  		return;
> =20
>  	drm_severity =3D xe_to_drm_ras_severity(severity);
>  	drm_component =3D xe_to_drm_ras_component(component);
> =20
> -	xe_drm_ras_event(xe, drm_component, drm_severity, value);
> +	xe_drm_ras_event(xe, drm_component, drm_severity, response.value);

[Severity: High]
When firmware returns valid but unmapped values, like=20
XE_RAS_SEV_INFORMATIONAL or XE_RAS_COMP_RESERVED, is it possible that=20
xe_to_drm_ras_severity() and xe_to_drm_ras_component() will map these to=20
their MAX values (DRM_XE_RAS_ERR_SEV_MAX and DRM_XE_RAS_ERR_COMP_MAX)?

If so, does this call to xe_drm_ras_event() cause out-of-bounds array
accesses?=20

In drivers/gpu/drm/xe/xe_drm_ras.c:xe_drm_ras_event():

    struct xe_drm_ras_counter *info =3D ras->info[severity];
    ...
    node =3D &ras->node[severity];

    if (!info || !info[component].name)
        return;

Since the arrays are sized for the valid drm enum mappings, using the MAX
values as indices would lead to wild pointer dereferences.

>  }
> =20
>  static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009104602.1075=
405-14-badal.nilawar@intel.com?part=3D2
