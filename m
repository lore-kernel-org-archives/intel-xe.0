Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC4C606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 02:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h/RiZKGV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EC610E0DD;
	Wed, 11 Nov 2026 02:59:44 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B1E10E0DD
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 02:59:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 58CDE40E2A;
 Wed, 11 Nov 2026 02:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132391F0089F;
 Wed, 11 Nov 2026 02:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794365977;
 bh=55EWacHJua0hwOHioYXU6yaDvEUFURCOdo22Fz+3scA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=h/RiZKGV60a77TECJ2jvU5S00xGeya25+aohKsOtvBK2Iy/oteeMF3VUy6/5e5xsT
 e6X6BcApSg5YxvkpoHibBe/xsdrQm51vejNxiEk8BzsXEIe+I85QItgVBC46Y2xtc2
 L4EQ0pJqyeA6LJDCmdTytDX5TAiLeamEMpN7qp9sN1KOzGlYYgAzFCX3Jkbjr55e45
 +IN9Bl+BhpV77wAA2wUhpfsV4+yzhdYJXTCn1hd9dCHwAyscQx2Y4cGDKG5m5UKm+5
 Clxki6Ejb8M+5vgXi2SvDGqoNc95853IKLGK16njpgDl+qEpSDgii0eP+DzNRL8H7r
 mOiDJJJ63U3ww==
Message-ID: <sashiko-outbox-208142@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/11] drm/xe: Stop assuming the root tile has a primary GT
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261110231442.218721-18-stuart.summers@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
 <20261110231442.218721-18-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 02:59:36 +0000
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

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] drm/xe/oa: incorrect GRAPHICS_VER check in
  xe_oa_enable_metric_set() [1]
--

commit 60c4b3494beccd5ac07590503398e4dda529a384
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe: Stop assuming the root tile has a primary GT

This commit introduces xe_device_any_gt() and xe_oa_first_unit() so that
device-level consumers and OA stream open do not assume the root tile has
a primary GT.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 838802482adaf..05beb156c941a 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -2041,6 +2041,23 @@ static int xe_oa_assign_hwe(struct xe_oa *oa, stru=
ct xe_oa_open_param *param)
>  	return ret;
>  }
> =20
> +/*
> + * OA unit IDs are handed out in GT iteration order, so the first unit o=
f the
> + * first GT that has one is OA unit 0. The primary GT may be absent, in =
which
> + * case unit 0 lives on the media GT.
> + */
> +static struct xe_oa_unit *xe_oa_first_unit(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id)
> +		if (gt->oa.num_oa_units)
> +			return &gt->oa.oa_unit[0];
> +
> +	return NULL;
> +}
> +
>  /**
>   * xe_oa_stream_open_ioctl - Opens an OA stream
>   * @dev: @drm_device
> @@ -2073,8 +2090,11 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev=
, u64 data, struct drm_file *f
>  		return ret;
> =20
>  	/* If not provided, OA unit defaults to OA unit 0 as per uapi */
> -	if (!param.oa_unit)
> -		param.oa_unit =3D &xe_root_mmio_gt(oa->xe)->oa.oa_unit[0];
> +	if (!param.oa_unit) {
> +		param.oa_unit =3D xe_oa_first_unit(oa->xe);
> +		if (XE_IOCTL_DBG(xe, !param.oa_unit))
> +			return -ENODEV;
> +	}

[Severity: Medium]
This problem wasn't introduced by this patch, but should
xe_oa_enable_metric_set() and xe_oa_disable_metric_set() check MEDIA_VER()
instead of GRAPHICS_VER() [1] when programming
OAM_COMPRESSION_T3_CONTROL?

drivers/gpu/drm/xe/xe_oa.c:xe_oa_enable_metric_set() {
    ...
	if ((stream->oa_unit->type =3D=3D DRM_XE_OA_UNIT_TYPE_OAM ||
	     stream->oa_unit->type =3D=3D DRM_XE_OA_UNIT_TYPE_OAM_SAG) &&
	    GRAPHICS_VER(stream->oa->xe) >=3D 30)
		xe_mmio_rmw32(mmio, OAM_COMPRESSION_T3_CONTROL, 0, OAM_LAT_MEASURE_ENABLE=
);
    ...
}

OAM units belong to the media IP block, so checking GRAPHICS_VER() skips
enabling latency measurement when the graphics IP is absent or older than
version 30 while media IP is >=3D 30, and issues unsupported MMIO writes to
OAM_COMPRESSION_T3_CONTROL when graphics IP is >=3D 30 but media IP is < 30.

[1] https://sashiko.dev/#/bug/linux-23224ef1-a940-4408-9697-0c35c66f6046

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110231442.2187=
21-13-stuart.summers@intel.com?part=3D5
