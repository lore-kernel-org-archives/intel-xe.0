Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA88606A323
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 19:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WTe86Zld
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652D410E1B7;
	Fri, 13 Nov 2026 19:33:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F0310E1B7
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 19:33:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 962F345797;
 Fri, 13 Nov 2026 19:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52AB81F000C4;
 Fri, 13 Nov 2026 19:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794598383;
 bh=qeSCTWn78Q18JjaF8xFC7CsluYUqkSccMXstor6koAI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=WTe86Zld0yQZh6pMk97mngZ8Ny7MWypYteqb5uW9NmqJLGFw8abZWvDKXpxCYEO1Z
 qTz1VPL1m4pIIbl1vz28CiOkulsMHFsmyt5DEVz5nGcbMdCFh13QCCG5r/Sp0Q4AsN
 cZRgJrFCralgPXUEIdPXskTCqTYP5GvXzWmAXNvxzCH651BeFqhoCI11TuB0rT7+Xt
 Zau0I5l+EvP0MyMyPZBZklMq7P20XcM6DS0X8MmJFsS1AqaewmEIVlI79zKK4IE1uD
 GYRtKXQ/8iu144E6afGczUnwpjkTEmPZThudIRGCyb7+6JmHBcgh2ACBnlWDOYBL8L
 hUXEXctk6sfmw==
Message-ID: <sashiko-outbox-213554@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [CI 2/2] drm/xe/wopcm: Simplify GuC WOPCM programming
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261113191739.1447747-4-daniele.ceraolospurio@intel.com>
References: <20261113191739.1447747-3-daniele.ceraolospurio@intel.com>
 <20261113191739.1447747-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:33:02 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] drm/xe: call to undefined xe_tile_wopcm_size() breaks
  compilation
- [High] drm/xe: deleting xe_wopcm.h and xe_wopcm_size() breaks
  xe_ggtt.c build
- [Medium] drm/xe: u32 underflow in uc_program_wopcm() locks invalid
  WOPCM regs
--

commit 9298b958426645b9eb36c22dda929d9b3a5d552b
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

drm/xe/wopcm: Simplify GuC WOPCM programming

This commit simplifies GuC WOPCM register programming by returning early
when WOPCM registers are already locked, dropping layout validation checks,
and moving the remaining WOPCM setup into xe_uc.c while removing the
separate xe_wopcm files.

> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index c4fb34e64cd6d..e7e818897bf50 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -47,15 +47,16 @@
>  #include "xe_sleep.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_migration.h"
> +#include "xe_tile.h"
>  #include "xe_uc.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wa.h"
> -#include "xe_wopcm.h"
> =20
>  static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>  			    struct xe_bo *bo)
>  {
> -	struct xe_device *xe =3D guc_to_xe(guc);
> +	struct xe_tile *tile =3D gt_to_tile(guc_to_gt(guc));
> +	struct xe_device *xe =3D tile_to_xe(tile);
>  	u32 addr;
> =20
>  	/*
> @@ -64,10 +65,12 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>  	 * might be different for each tile. So, just always ask for the address
>  	 * on the target GuC.
>  	 */
> -	addr =3D __xe_bo_ggtt_addr(bo, gt_to_tile(guc_to_gt(guc))->id);
> +	addr =3D __xe_bo_ggtt_addr(bo, tile->id);
> +
> +	if (!IS_SRIOV_VF(xe))
> +		xe_assert(xe, addr >=3D xe_tile_wopcm_size(tile));

[Severity: High]
Does calling xe_tile_wopcm_size() here and in uc_program_wopcm() break the
build?  xe_tile_wopcm_size() is neither declared in xe_tile.h nor defined
anywhere in the tree.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index b32ba504041c5..501961c2cc8f9 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -52,6 +55,126 @@ int xe_uc_init_noalloc(struct xe_uc *uc)

[ ... ]

> +static int uc_program_wopcm(struct xe_uc *uc)
> +{
> +	struct xe_gt *gt =3D uc_to_gt(uc);
> +	struct xe_tile *tile =3D gt_to_tile(gt);
> +	u32 huc_fw_size =3D xe_uc_fw_get_upload_size(&gt->uc.huc.fw);
> +	u32 wopcm_size =3D xe_tile_wopcm_size(tile);
> +	u32 guc_wopcm_base;
> +	u32 guc_wopcm_size;
> +	bool locked;

[ ... ]

> +	/*
> +	 * On legacy HW (pre-PVC) where the driver is responsible for
> +	 * programming the WOPCM registers, the WOPCM is divided into three
> +	 * regions, in order from bottom to top:
> +	 * 1 - The HuC region, which contains the HuC firmware + a 16KB reserved
> +	 *     section.
> +	 * 2 - The GuC region, which contains the GuC firmware + a reserved
> +	 *     section for GuC's usage.
> +	 * 3 - A reserved region for HW contexts, which is 36KB in size.
> +	 *
> +	 * To keep the math simple, we remove the HW context region from the
> +	 * WOPCM size, calculate the size of region 1 and then leave the
> +	 * remaining area for region 2. The official binaries are guaranteed to
> +	 * fit in the WOPCM, so the math below can only go wrong if a user is
> +	 * manipulating the blobs. In such a scenario, we'll catch the error at
> +	 * FW load time, so no need to double verify it here.
> +	 */
> +	wopcm_size -=3D (SZ_32K + SZ_4K);
> +
> +	guc_wopcm_base =3D huc_fw_size + SZ_16K;
> +	guc_wopcm_base =3D ALIGN(guc_wopcm_base, 1UL << GUC_WOPCM_OFFSET_SHIFT);
> +
> +	guc_wopcm_size =3D wopcm_size - guc_wopcm_base; /* already 4KB aligned =
*/
> +
> +	return __wopcm_init_regs(gt, guc_wopcm_base, guc_wopcm_size);
> +}

[Severity: Medium]
Can wopcm_size and guc_wopcm_size underflow here and lock bogus values into
the write-once WOPCM registers before firmware load?

The firmware header parser in parse_css_header() and parse_cpd_header() only
verifies that the buffer is large enough for the headers, uCode, and RSA
data, without checking ucode_size against WOPCM size, and xe_uc_init() calls
uc_program_wopcm() before any firmware upload happens.  On pre-PVC hardware,
if an overridden HuC blob causes guc_wopcm_base >=3D wopcm_size (or if
wopcm_size is smaller than 36KB), the u32 subtractions underflow or yield 0.
Because the low 12 bits remain clear, __wopcm_init_regs() passes its mask
assertions and locks the corrupted values into GUC_WOPCM_SIZE and
DMA_GUC_WOPCM_OFFSET, which then cannot be cleared by a GT reset.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_wopcm.h b/drivers/gpu/drm/xe/xe_wopcm.h
> deleted file mode 100644
> index 0197a282460be..0000000000000
> --- a/drivers/gpu/drm/xe/xe_wopcm.h
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright =C2=A9 2022 Intel Corporation
> - */
> -
> -#ifndef _XE_WOPCM_H_
> -#define _XE_WOPCM_H_
> -
> -#include "xe_wopcm_types.h"
> -
> -struct xe_device;
> -
> -int xe_wopcm_init(struct xe_wopcm *wopcm);
> -u32 xe_wopcm_size(struct xe_device *xe);
> -
> -#endif

[Severity: High]
Does deleting xe_wopcm.h and xe_wopcm_size() break compiling xe_ggtt.c?
drivers/gpu/drm/xe/xe_ggtt.c still includes xe_wopcm.h and calls
xe_wopcm_size() in xe_ggtt_init_early() and xe_ggtt_shift_nodes().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113191739.1447=
747-4-daniele.ceraolospurio@intel.com?part=3D1
