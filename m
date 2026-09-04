Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18B0C79F87
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A67510F8FC;
	Fri,  4 Sep 2026 12:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nKDevA31";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDCB10F90D;
 Fri,  4 Sep 2026 12:50:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B2446600C8;
 Fri,  4 Sep 2026 12:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DE21F00A3D;
 Fri,  4 Sep 2026 12:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788526201;
 bh=Jo8HkHaDNjQh/w2L4Oy1GnfvBmvteA2/pKOdf35PM7w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nKDevA31g9Um1wu88T81m8V6qXAd1zxsr0tqzHxbR3/n5ZfNZOO//3PTCKz05Ng4t
 JAxM+iwGHs83uMxGmVnxwPmLpundQGTkzbQxZo2t02xXG8dHTo6KhcDUiGds7FsxDK
 fK0YtXOVtphcRHrx5YQ0Bd3/FuPCQ/beo55Z8Dz7pXixPCBVcTfPxC3SGnu6tkSfTN
 a3KoN4mfV7taA7x2U/+f7sbII1zz2YIhqk3coRstDuYovH/wTWcu3iLhjybWJajmKI
 JBISbFIpuaBxkNqClaxNaXt7jdB+HIFPeNY6z9JUWrfNCirUnHD1hLOI8MQzX1dNu9
 fnp/jb8uq/j2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 3/8] drm/i915/bios: print VS/PE-O port info
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260904123148.2165596-4-michal.grzelak@intel.com>
References: <20260904123148.2165596-1-michal.grzelak@intel.com>
 <20260904123148.2165596-4-michal.grzelak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 12:50:00 +0000
Message-Id: <20260904125001.41DE21F00A3D@smtp.kernel.org>
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

Pre-existing issues:
- [High] Missing validation of VBT block size for flexible array `tables`.
--

commit 5baf963f5f945def9cd11d658adeeb946a342be0
Author: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
Date:   Fri Sep 4 12:31:43 2026 +0000

    drm/i915/bios: print VS/PE-O port info
   =20
    Issue a debug message when port asks to override default Vswing /
    Preemphasis tables. Add helper intel_bios_encoder_requests_vspeo()
    to check if port requests for overriding default VS/PE tables.

> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> index 06a8dd7581bb8..9610b794bc147 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -2801,6 +2801,11 @@ static void print_ddi_port(const struct intel_bios=
_encoder_data *devdata)
>  			    "Port %c supports dynamic DDI allocation in TCSS\n",
>  			    port_name(port));
> =20
> +	if (intel_bios_encoder_requests_vspeo(devdata))
> +		drm_dbg_kms(display->drm,
> +			    "Port %c requests vswing/pre-emphasis override\n",
> +			    port_name(port));
> +

[Severity: High]
This isn't a bug introduced by this patch, but since this patch and the
overall series rely on the VS/PE-O tables, I noticed a pre-existing issue in
parse_vswing_preemph_override() where we assign the tables array without
validating the VBT block size:

drivers/gpu/drm/i915/display/intel_bios.c:parse_vswing_preemph_override() {
    ...
    block =3D bdb_find_section(display, BDB_VSWING_PREEMPH);
    if (!block)
        return;

    display->vbt.vspeo.tables =3D block->tables;
    display->vbt.vspeo.num_tables =3D block->num_tables;
    display->vbt.vspeo.num_columns =3D block->num_columns;
    ...
}

Does this code need to call get_blocksize(block) and verify that the block
size is large enough to contain the tables flexible array based on
num_tables, num_rows, and num_columns?

Without this check, if a malformed VBT specifies a small block size (e.g.
num_tables is 0), subsequent patches in this series that access hardcoded
table indices (like idx =3D 5 for C20 DP 2.0 in intel_bios_get_c20_vspeo)
could perform an out-of-bounds read of the VBT allocation buffer.

Could this out-of-bounds read hit an unmapped page and cause a kernel panic
during boot, or silently corrupt the PHY configuration by reading garbage
memory? This latent issue appears to stem from the earlier patch
drm/i915/bios: store VBT #57's metadata in intel_vbt_data in this series.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904123148.2165=
596-1-michal.grzelak@intel.com?part=3D3
