Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C131C5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 17:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424E510E800;
	Mon, 24 Aug 2026 17:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UEWx9B24";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9A710E800
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 17:03:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A647240BE0;
 Mon, 24 Aug 2026 17:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCAA1F00A3A;
 Mon, 24 Aug 2026 17:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787591008;
 bh=l4uR4+kGMKC+Z0mF+yYIqmwHg9fa7Q2IMvOd6EOogwQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=UEWx9B24CQ4yTip+EVNd+EKiDS5LNlntc2RFSNr5d924c8SD3+7B1H4J2IRNhj9rA
 7LFf6GW+npuPiVnSdrXx9vjFGy/rj5zc1YJoSbJMiAv9c4JvfzBO59o41lTXZBGjml
 rnjDkhCKDXqROdeCps0rcdDGwO+WWv3h86ET3TtxUEsxvLlppJ9Lfgs48JtHOpy6sr
 jQassqvh70nALTm9qRF2D6ok9uAV91uBGJk1hy6FS4D8WvZuYGbmTbAkV7iOaE04CP
 u8ZRrhqTxWf4V4ofl7hi4b+CurAlwBigVQgiGJ92SJxL6Y3yIEaZPWFrbAVRia32Qh
 FJgIVCo1biREA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] drm/xe/ras: Enable SGUnit PCIe error reporting
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824164850.607937-1-raag.jadav@intel.com>
References: <20260824164850.607937-1-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 17:03:27 +0000
Message-Id: <20260824170328.5FCAA1F00A3A@smtp.kernel.org>
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
- [Medium] The driver improperly imports the 'CXL' module namespace to bypa=
ss symbol export restrictions for pcie_aer_is_native().

Pre-existing issues:
- [High] The driver directly modifies the PCI configuration space of an uno=
wned upstream switch port (USP) and calls pci_save_state() on it without sy=
nchronization.
--

--- Patch [1]: [PATCH v1] drm/xe/ras: Enable SGUnit PCIe error reporting ---
commit e3840dec09cb480f65642a26c3093d383b1db319
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/ras: Enable SGUnit PCIe error reporting

Enable SGUnit PCIe error reporting by programming its config space for
upstream error propagation. Adds a native AER sanity check for the upstream
port before programming SGUnit registers.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index d25d25f775310..9979fe5b4ceb0 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c

[ ... ]

> @@ -279,6 +292,7 @@ static void ras_usp_aer_init(struct xe_device *xe)
>  	/* Unmask Uncorrectable Internal Error */
>  	pci_clear_and_set_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, PCI_E=
RR_UNC_INTN, 0);
> =20
>  	pci_save_state(usp);

[Severity: High]
This isn't a bug introduced by this patch, but does modifying the PCI
configuration space of an unowned upstream switch port (USP) and saving
its state here in ras_usp_aer_init() cause data races?

If multiple GPU endpoints are probed concurrently on the same upstream
port, bypassing the core PCI layer to modify an unowned bridge and calling
pci_save_state(usp) without first acquiring pci_dev_lock(usp) could blindly
overwrite the saved state array and corrupt PM state restorations managed
by the PCI core.

>  	dev_dbg(&usp->dev, "Uncorrectable Internal Errors downgraded and unmask=
ed\n");
>  }
> +MODULE_IMPORT_NS("CXL");

[Severity: Medium]
Is it appropriate to spoof the CXL namespace here to access
pcie_aer_is_native()?

Since pcie_aer_is_native() is explicitly exported to the CXL namespace to
restrict its use to Compute Express Link drivers, masquerading as a CXL
driver to circumvent this boundary seems to violate kernel namespace
protection principles.

If non-CXL endpoint drivers legitimately require generic access to AER
native status, could the PCI core API be made generic instead?

> =20
>  static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 c=
omponent)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824164850.6079=
37-1-raag.jadav@intel.com?part=3D1
