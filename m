Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A57CA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 21:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41F810F0DB;
	Tue, 29 Sep 2026 21:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DGxSy6l1";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBC810F0DB
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 21:18:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D93936022B;
 Tue, 29 Sep 2026 21:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E1C1F000FF;
 Tue, 29 Sep 2026 21:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790716735;
 bh=bPYMgwGjso49vEAxVAluybURkfpYgFMnofxpiPGKOqw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=DGxSy6l1uFGU9dQBGJdVpF1pgxv1dXH+qd23D99g4Ksj9HyrRC0M6Ckw8uDrtk1pE
 EkeeBZbk3/rJ1oTJXbaOykk1TuzrJ+Ve5NPauP3RpF2DN7Yr5sNTlspBeEK3WaLokT
 oY8bPCdU8v92mSEBT8IkNKHMA53hHy/X9NvVtHHt3EXvZoK5waDUkztqvs5ouIW/Wp
 QkdULoDuPmyTRhnO0OYHoKzNwRQmE4lImOpEG568ojUINqXVlgUEa5F6LzdeCsENIX
 4QIonrK2TwKrTIAby3yslDptsxcdMnyv57gdRFwF49YhinQfSawVVpYLgh6wmw6R/J
 Y5xQAVYIDZY2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/xe3p: Read resource copy presence from fuse
 register
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260929-res_copy_fuse-v1-1-80876dba05db@intel.com>
References: <20260929-res_copy_fuse-v1-1-80876dba05db@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 21:18:55 +0000
Message-Id: <20260929211855.70E1C1F000FF@smtp.kernel.org>
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
- [High] xe: VF incorrectly disables BCS0 engine due to missing PF runtime =
register
--

commit 096730b165de364d3c436c33d0f5b812ac0baee5
Author: Matt Roper <matthew.d.roper@intel.com>

drm/xe/xe3p: Read resource copy presence from fuse register
   =20
This commit reads the resource copy presence from the fuse register on Xe3p
platforms. The register field is used to determine if the primary resource
copy engine (BCS0) is enabled.

> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index 010499766fce2..519f48d7eca14 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -801,23 +801,42 @@ static u32 read_svccopy_fuses(struct xe_gt *gt)
>  			     xe_mmio_read32(&gt->mmio, SERVICE_COPY_ENABLE));
>  }
> =20
> +static u32 read_rescopy_fuses(struct xe_gt *gt)
> +{
> +	u32 fuse =3D REG_FIELD_GET(FUSE_RESOURCE_COPY_ENABLE_MASK,
> +				 xe_mmio_read32(&gt->mmio, RESOURCE_COPY_ENABLE));

[Severity: High]
Does this MMIO read fail in SR-IOV VF environments?

Looking at read_rescopy_fuses() in drivers/gpu/drm/xe/xe_hw_engine.c, since
RESOURCE_COPY_ENABLE (0x9174) was not added to the ver_35_runtime_regs array
in drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c, xe_mmio_read32() will fail
to find the register in the PF's shared list.

This causes the VF lookup path via xe_gt_sriov_vf_read32() to return 0,
which would lead to read_copy_fuses() receiving a 0 mask for res_copy_mask
and erroneously disabling the primary resource copy engine (BCS0) for all
Xe3p VFs.

Should RESOURCE_COPY_ENABLE be added to ver_35_runtime_regs to fix this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-res_copy_f=
use-v1-1-80876dba05db@intel.com?part=3D1
