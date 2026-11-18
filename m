Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941D7606A331
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 22:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ULKJbnGf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54ED2112075;
	Wed, 18 Nov 2026 22:10:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C9211207E
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 22:10:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7B57363FA3;
 Wed, 18 Nov 2026 22:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169021F000C4;
 Wed, 18 Nov 2026 22:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795039806;
 bh=Rf7xoqG8pwx4W+tbpJOnFbN0bAA8n/aHbewSBkVvL5o=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ULKJbnGfyo9XmXugAvICn98/im3OjEUJop9O65KvLt5oz/x8m5e3NPNPRx+jyhMnR
 SPu5HbGzMK4D+RaF9sRq6GgeU661oATdOuPZjcOPD07bW+ttR/M0Qq990dpjlHkTk4
 M+McY0S32Yv45mbl5NqqX4LbNO7ZmmXc4RNNZXiqdPQ0i103+p/neRSVabrcSflhCM
 soKpFPh/Z04JnEMS9wlnPUFXS26/Bv7/3vUEzxAFv9HJ2IzI/e1Ztr09F+xq8mPktE
 6Z2sMh0OSSVVmYGqtwRHXx6jZt8UvIXq9gQs0KocV5yw/ufLRkjwLj9gEwzGTGU9RY
 HqGuGdq+a34kA==
Message-ID: <sashiko-outbox-222088@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] drm/xe/wopcm: Use the size from HW when
 excluding the wopcm range from GGTT
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261118220120.109186-3-daniele.ceraolospurio@intel.com>
References: <20261118220120.109186-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 22:10:05 +0000
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
- [Medium] drm/xe/ggtt: missing start offset in
  ggtt_get_range_from_guc() range check
--

commit 87d7496d04ac1372f5227944d418e464c057bf0e
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

drm/xe/wopcm: Use the size from HW when excluding the wopcm range from GGTT

This commit reads the per-tile WOPCM size from hardware into struct xe_tile
and uses it for both GGTT and stolen memory setup instead of a hardcoded
value, while dropping the WOPCM lower-bound check on SR-IOV VFs.

> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 44480fad27679..1bc5b8c0f2b9e 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
[ ... ]
> @@ -422,13 +422,11 @@ static int ggtt_probe(struct xe_ggtt *ggtt, u64 *st=
art, u64 *size)
> =20
>  static int ggtt_get_range_from_guc(struct xe_ggtt *ggtt, u64 *start, u64=
 *size)
>  {
> -	struct xe_device *xe =3D tile_to_xe(ggtt->tile);
> -	u64 wopcm =3D xe_wopcm_size(xe);
> -
>  	*start =3D xe_tile_sriov_vf_ggtt_base(ggtt->tile);
>  	*size =3D xe_tile_sriov_vf_ggtt(ggtt->tile);
> =20
> -	if (*start < wopcm || *start + *size > GUC_GGTT_TOP) {
> +	/* We can't check start against WOPCM as VF doesn't have access to the =
WOPCM size */
> +	if (*size > GUC_GGTT_TOP) {
>  		xe_log_err_fatal(ggtt->tile, GGTT, -ERANGE,
>  				 "Invalid GGTT configuration: %#llx-%#llx\n",
>  				 *start, *start + *size - 1);

[Severity: Medium]
Should this upper-bound check remain *start + *size > GUC_GGTT_TOP?
Dropping *start + allows a VF GGTT range with *size <=3D GUC_GGTT_TOP but
*start + *size > GUC_GGTT_TOP to pass validation, and since
ggtt_read_available_range() only clamps *size on !IS_SRIOV_VF(xe), the VF
GGTT will be initialized with addresses extending past GUC_GGTT_TOP.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118220120.1091=
86-3-daniele.ceraolospurio@intel.com?part=3D1
