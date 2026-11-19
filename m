Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FFB606A332
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 23:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Aha9u9i1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7AC10E0F8;
	Thu, 19 Nov 2026 23:15:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F3C10E0F8
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 23:15:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A2E0B442DA;
 Thu, 19 Nov 2026 23:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB6D1F000C6;
 Thu, 19 Nov 2026 23:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795130102;
 bh=XsUiVXSu4vAUQuJ1hLTJS+MQcBwz6kAYDkXNwb0gVwc=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Aha9u9i1zAzqM6A8p6Sy023V7UGLMq4A2Z4qnt+Siq26TxS22eKtsvEuTBYJgq0Up
 WcSNLwyGRpT2IuCOgcmN8vgM7DD+KUi2smBjxlpvd3DTyXOO+xcl/y7lbfoboayoPL
 NJLSXQFHnBlooX0H5rSeVD0mwLEzB2UNywRwOWR7K8JiOT+PE7ZBqBHc0fIYPL+NlE
 HPVF+s/t6EuffQuHjzlsWiDE7k54NTvZ0rTZv+48jE+Q765q41r7M/8Ir7oF+QSc1V
 xKWxAZmC8I7FYw7kb5z8rGxkEL3wYI8wBiZ+5cUyKjE4DKbigSUm1Ad9JtbDO7y3TK
 D/e6A6hkWl+8g==
Message-ID: <sashiko-outbox-224176@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] drm/xe/wopcm: Simplify GuC WOPCM programming
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261119230423.322057-4-daniele.ceraolospurio@intel.com>
References: <20261119230423.322057-3-daniele.ceraolospurio@intel.com>
 <20261119230423.322057-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 23:15:01 +0000
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
- [Medium] drm/xe: u32 underflow of guc_wopcm_size in uc_program_wopcm()
--

commit 2876ad005940248a7d3945230ac1cf31aa3198e3
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

drm/xe/wopcm: Simplify GuC WOPCM programming

This commit removes the separate WOPCM module and layout checks, moving
GuC WOPCM register programming into xe_uc.c.

> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index b32ba504041c5..ff13f6e6ccb66 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c

[ ... ]

> @@ -52,6 +55,126 @@ int xe_uc_init_noalloc(struct xe_uc *uc)
>  	return ret;
>  }
> =20
> +static bool __wopcm_regs_locked(struct xe_gt *gt,
> +				u32 *guc_wopcm_base, u32 *guc_wopcm_size)
> +{
> +	u32 reg_base =3D xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET);
> +	u32 reg_size =3D xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE);
> +
> +	if (!(reg_size & GUC_WOPCM_SIZE_LOCKED) ||
> +	    !(reg_base & GUC_WOPCM_OFFSET_VALID))
> +		return false;
> +
> +	*guc_wopcm_base =3D reg_base & GUC_WOPCM_OFFSET_MASK;
> +	*guc_wopcm_size =3D reg_size & GUC_WOPCM_SIZE_MASK;
> +	return true;
> +}
> +
> +static int __wopcm_init_regs(struct xe_gt *gt, u32 base, u32 size)
> +{
> +	u32 huc_agent =3D xe_uc_fw_is_available(&gt->uc.huc.fw) ? HUC_LOADING_A=
GENT_GUC : 0;
> +	u32 mask;
> +	int err;
> +
> +	xe_gt_assert(gt, !(base & ~GUC_WOPCM_OFFSET_MASK));
> +	xe_gt_assert(gt, !(size & ~GUC_WOPCM_SIZE_MASK));
> +
> +	mask =3D GUC_WOPCM_SIZE_MASK | GUC_WOPCM_SIZE_LOCKED;
> +	err =3D xe_mmio_write32_and_verify(&gt->mmio, GUC_WOPCM_SIZE, size, mas=
k,
> +					 size | GUC_WOPCM_SIZE_LOCKED);
> +	if (err)
> +		goto err_out;
> +
> +	mask =3D GUC_WOPCM_OFFSET_MASK | GUC_WOPCM_OFFSET_VALID | huc_agent;
> +	err =3D xe_mmio_write32_and_verify(&gt->mmio, DMA_GUC_WOPCM_OFFSET,
> +					 base | huc_agent, mask,
> +					 base | huc_agent |
> +					 GUC_WOPCM_OFFSET_VALID);
> +	if (err)
> +		goto err_out;
> +
> +	xe_gt_dbg(gt, "Programmed GuC WOPCM [b=3D%uK, s=3D%uK]\n", base / SZ_1K=
, size / SZ_1K);
> +
> +	return 0;
> +
> +err_out:
> +	xe_gt_notice(gt, "Failed to init uC WOPCM registers to [b=3D%uK, s=3D%u=
K]!\n",
> +		     base / SZ_1K, size / SZ_1K);
> +	xe_gt_notice(gt, "%s(%#x)=3D%#x\n", "DMA_GUC_WOPCM_OFFSET",
> +		     DMA_GUC_WOPCM_OFFSET.addr,
> +		     xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET));
> +	xe_gt_notice(gt, "%s(%#x)=3D%#x\n", "GUC_WOPCM_SIZE",
> +		     GUC_WOPCM_SIZE.addr,
> +		     xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE));
> +
> +	return err;
> +}
> +
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
Can guc_wopcm_size underflow u32 here when a modified or oversized HuC
firmware blob is supplied?

Firmware header parsing in parse_headers() only checks that ucode_size and
rsa_size fit within the loaded file, not within the tile's WOPCM size.  If
guc_wopcm_base exceeds wopcm_size (or equals it), wopcm_size -
guc_wopcm_base wraps around (or becomes 0) while remaining 4KB-aligned, so
it passes the GUC_WOPCM_SIZE_MASK check in __wopcm_init_regs() and locks
the write-once GUC_WOPCM_SIZE and DMA_GUC_WOPCM_OFFSET hardware registers
with corrupt values before firmware load runs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119230423.3220=
57-3-daniele.ceraolospurio@intel.com?part=3D2
