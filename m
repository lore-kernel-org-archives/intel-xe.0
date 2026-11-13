Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A728606A88B
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 19:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVlnuCnU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C697310E037;
	Fri, 13 Nov 2026 19:30:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5060C10E0F1
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 19:30:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C583D41AA6;
 Fri, 13 Nov 2026 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B351F000C4;
 Fri, 13 Nov 2026 19:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794598230;
 bh=Si4NVkOE0psc260L3Rot72WlWHqHK3qGFf8fAYjo/aY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=YVlnuCnUlITarSljCoFKLiRHFkYJUYgNR5VdPfd9znAU4BbTBKWbvPEiTOlcvkMfR
 0SnwxCWSU47U2Ire9wMN6DruMub7uc+HSFu2NKe4dirLB/cnZ66Jcw9EtV66/CxbFe
 0FVxcn6p3JAKrl8zBW7/Gz62kEm57sRgF+iuH+InTge5EBfOTerdO1u3KdQ8Nj73Fw
 92zQEqcFfnsUzWh+MtMbo0VejFXhyNIOIlT1TA4bh+SuIXSQ3OG2pC698LTqVFmET5
 n9KjiVYjZEejYCVB1CQaoXmEGIT9MoruQ7pUOX6j/+iREOuCiH9r2lBSdsa2Mp4/Zo
 2muWi6A6kX3uQ==
Message-ID: <sashiko-outbox-213552@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [CI] drm/xe/gsc: Test NVL GSC 108.0.0.1242
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261113192311.1455041-2-daniele.ceraolospurio@intel.com>
References: <20261113192311.1455041-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:30:30 +0000
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
- [High] drm/xe/gsc: hardcoded CI test path in uc_fw_auto_select()
  breaks NVL GSC load
--

commit cc86bf7c798618eb51dc746674edd3c06bb1359c
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

drm/xe/gsc: Test NVL GSC 108.0.0.1242

This commit adds a path_ver macro to XE_GSC_FIRMWARE_DEFS to hardcode the
NOVALAKE_S GSC firmware path to xe/nvl_gsc_108.0.0.1242.bin for CI
testing.

> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 02aa97de6d3a7..c59a0bc9fd346 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -142,8 +142,8 @@ struct fw_blobs_by_type {
>  	fw_def(TIGERLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))
> =20
>  /* for the GSC FW we match the compatibility version and not the release=
 one */
> -#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
> -	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	gsc,	nvl,	108, 1, 0))	\
> +#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver, path_ver)		\
> +	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	path_ver(xe,	gsc,	nvl,	108, 1, 0, "xe/n=
vl_gsc_108.0.0.1242.bin"))	\
>  	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
>  	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
>  	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))

[Severity: High]
Will replacing the compatibility-versioned xe/nvl_gsc_1.bin entry with a
hardcoded CI release filename break GSC firmware loading on NOVALAKE_S?

On systems with standard linux-firmware packages, MODULE_FIRMWARE() no
longer advertises xe/nvl_gsc_1.bin for initramfs generation, and
uc_fw_auto_select() requests xe/nvl_gsc_108.0.0.1242.bin without falling
back to xe/nvl_gsc_1.bin.  The firmware request fails with -ENOENT, leaving
gt->uc.gsc.fw unloadable and causing xe_pxp_init() to skip PXP
initialization.

Candidate GSC firmware binaries can be tested at runtime via the existing
xe.gsc_firmware_path module parameter in uc_fw_override() without
replacing the entry in XE_GSC_FIRMWARE_DEFS.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113192311.1455=
041-2-daniele.ceraolospurio@intel.com?part=3D1
