Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947D1C79F8C
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:27:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2BC10E0BD;
	Sun,  6 Sep 2026 17:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ADTOVtCX";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A762610E0BD
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:27:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C12BD601DE;
 Sun,  6 Sep 2026 17:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3CC1F00A3A;
 Sun,  6 Sep 2026 17:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788715673;
 bh=DJCJ4UZBoIZ/qiTyMnZAkMVC8wfPzHTfmAuy4szGRug=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ADTOVtCXgy7rbNuyVjLYVC7UtMM72HCcUCBXItWyxyodMbeKXtCiuOwyDFMkPFELV
 K++Vnj+FuWJkLV3A1y9d1eqK3KKKA52kP6v5l1ml7JE6vuprizt0hzCAH6OIWw2DOn
 F27y0G1rECkX7UU8mjwliFJOn0LrimYbWX8MBMxe4iYDlPtxgAztqn4EN2byeGbhFz
 SRsYUQHE/tZO2zzlX2NbiKZcrah8HA95Ab9k1jD1uAORedtb8peqPFR86RRh4H15U3
 HLGnTlwBepffPLsV/B9nFI+kxEWoaAalPaDou4QYGGcYECTA0iJqZCnymkXujD90vM
 xSRG48FijVzsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/12] drm/xe/cper: Prepare CPER record
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260906172604.2215987-18-badal.nilawar@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-18-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 17:27:52 +0000
Message-Id: <20260906172753.4C3CC1F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Reading the PF-only CRI_FRU_ID SOC_BASE MMIO resource from a Virtu=
al Function (VF) context will cause a hardware timeout.

Pre-existing issues:
- [High] Logic inversion in `xe_emit_hardware_error_cper` prevents emitting=
 CPER records for hardware errors.
--

commit 9f7667556e38b9fe8c03f7e28c7370b664d666ce
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Sun Sep 6 17:26:09 2026 +0000

    drm/xe/cper: Prepare CPER record
   =20
    Initialize Intel-specific CPER metadata and construct
    CPER record for Intel GPU hardware errors.

> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index f04a91223a43c..31ca53ce1aa75 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
[ ... ]
> +static guid_t read_fru_id(struct xe_device *xe)
> +{
> +	struct xe_mmio *mmio =3D xe_root_tile_mmio(xe);
> +	guid_t guid =3D GUID_INIT(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
> +	u64 val;
> +
> +	val =3D xe_mmio_read64_2x32(mmio, CRI_FRU_ID);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does this code execute safely on Virtual Functions?

Accessing PF-only SOC_BASE registers from a VF causes hardware failures or
MMIO timeouts. The CRI_FRU_ID register is in the SOC_BASE region.

When a hardware error is logged from a Virtual Function,
xe_emit_hardware_error_cper() calls xe_cper_record_emit() which
unconditionally calls read_fru_id(). Shouldn't this read be guarded with an
IS_SRIOV_VF(xe) check to prevent a driver crash or wedged device?

> +
> +	memcpy(&guid, &val, sizeof(val));
> +
> +	return guid;
> +}
[ ... ]
> @@ -48,5 +209,15 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev=
, int cper_sev, enum xe_sig
>  		}
>  	}
> =20
> +	xe_cper_init_intel_err_hdr(xe,
> +				   (const u8 *)counter,
> +				   counter_response->timestamp,
> +				   sigid,
> +				   counter_response->value,
> +				   &ihdr);
> +
> +	xe_cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR,
> +			    &ihdr, NULL, 0);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^

[Severity: High]
This isn't a bug introduced by this patch, but will this code ever execute
for hardware errors?

Earlier in xe_emit_hardware_error_cper(), there is a pre-existing check:

	if ((int)sigid >=3D INTEL_SIGID_GPU_XE_HARDWARE_START)
		return;

This appears to abort execution for all valid hardware SIGIDs, meaning the
new CPER record generation will act as dead code and fail to emit records
for genuine hardware errors. Could we fix that logic inversion?

> +
>  	/* TODO */
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906172604.2215=
987-14-badal.nilawar@intel.com?part=3D4
