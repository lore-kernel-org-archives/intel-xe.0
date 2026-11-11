Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C25606A324
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 02:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BEQtYykK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20C410E233;
	Wed, 11 Nov 2026 02:15:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F87810E233
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 02:15:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1038763812;
 Wed, 11 Nov 2026 02:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621261F0093C;
 Wed, 11 Nov 2026 02:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794363349;
 bh=LuPKzbM4JaRpxuXsDwecBYxgSTYgg2jiBS5EpDw10x4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=BEQtYykKV3orakx4r7tRFP851PBRMybcwo1VV3vusT0mrNw/8PxYttNDR6RSWY/fr
 /DuhqTesG97Ctw00lIqaretfLLQ12OUkIDb5fdkyVH61XSmDanjaqcGqN3k1Nz5q0h
 Ori1yit8Ql3dz7xdk1deu1G5PimU6bTnkkYik8jROrg5LJBgMyb8wR1ws8CgeglD5Q
 oi/hd6d+lK9iUdCuaMQgJxh4TJStyjGHECCX6GNGIbKdjRCJwkOCYLTFas+EZZfNkN
 P3XJZgUpXOjP36+HiiDyT6FVUUuF61F2dtkfsbKPYzxwHTJ4O/IzAwpntXQxScEZ4Q
 OdnqV7fXh1a6w==
Message-ID: <sashiko-outbox-208074@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/nvlp: Drop force_probe requirement
To: "Gustavo Sousa" <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261110-nvlp-drop-force_probe-requirement-v1-1-3dd6aeac38fc@intel.com>
References: <20261110-nvlp-drop-force_probe-requirement-v1-1-3dd6aeac38fc@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 02:15:49 +0000
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
- [High] drm/xe/nvlp: probe fails in uc_fw_request() without NOVALAKE_P
  GuC fw entry
--

commit c151d6764202cd346fba551210a9c14bc69923c5
Author: Gustavo Sousa <gustavo.sousa@intel.com>

drm/xe/nvlp: Drop force_probe requirement

This commit removes the force_probe requirement from nvlp_desc so the xe
driver binds automatically to NVL-P devices.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 8d8f00d5dcc48..ce9bae3495b8b 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -504,7 +504,6 @@ static const struct xe_device_desc nvlp_desc =3D {
>  	.has_sriov =3D true,
>  	.max_gt_per_tile =3D 2,
>  	MULTI_LRC_MASK,
> -	.require_force_probe =3D true,
>  	.va_bits =3D 48,
>  	.vm_max_level =3D 4,
>  };

[Severity: High]
Does automatic probing on NVL-P fail in uc_fw_request() with -ENOENT
because XE_GUC_FIRMWARE_DEFS has no entry for NOVALAKE_P?

XE_GUC_FIRMWARE_DEFS only lists entries up to NOVALAKE_S, and since
XE_NOVALAKE_P is ordered after XE_NOVALAKE_S in enum xe_platform,
uc_fw_auto_select() terminates at the first entry and leaves uc_fw->path
NULL.  Without a manual xe.guc_firmware_path override, uc_fw_request()
marks GuC firmware as XE_UC_FIRMWARE_NOT_SUPPORTED and fails driver probe
with -ENOENT (and on SR-IOV VFs, uc_fw_vf_override() marks GuC firmware
unsupported before checking module parameter overrides, leaving guc->ct
uninitialized).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-nvlp-drop-=
force_probe-requirement-v1-1-3dd6aeac38fc@intel.com?part=3D1
