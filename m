Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94718C5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 05:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237EE10E011;
	Tue, 25 Aug 2026 05:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hXa+bo9Z";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7A210E011
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 05:58:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8263140176;
 Tue, 25 Aug 2026 05:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302681F000E9;
 Tue, 25 Aug 2026 05:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787637489;
 bh=FkPkgLm7MyhPLhskopghZwRJYH+/CYQvaDqt+64HpJQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=hXa+bo9Zw1Zc0ymFr6XbTURzvfKlKy8SjO7c9fIPBYO3H4ar6Y/NWo2ObjCOf1TLg
 nudtCKqii9OqCV2UExxpbs8FZ0csThicOoXpopQ4idrvN4JCzs07dXmVx3sCzkh1Ww
 TgpF/pCndjK8mXIe572GGLzyF5Suma0ZzTEua85PZ2tEEdgW6Z0rKzlDcjxhMrnDxI
 uLbBllaF2uCmSigiueSPV4np0Zh/5UZGOCyoopowunKiuZbGI8UxlA2EIbXmiXppsA
 NTvK1IoPw0Vht8o+7x1KsF+IToP9pWZoz1PVqus6H4+MQ1dmVFuNUsu07+6IKFk19Y
 WT9gJJ/LGIIOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/xe/ras: Enable SGUnit PCIe error reporting
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20260825054312.1319951-3-raag.jadav@intel.com>
References: <20260825054312.1319951-1-raag.jadav@intel.com>
 <20260825054312.1319951-3-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 05:58:08 +0000
Message-Id: <20260825055809.302681F000E9@smtp.kernel.org>
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
- [High] Unprotected call to pci_save_state() on a shared upstream device c=
an cause a data race.
--

--- Patch [2]: [PATCH v2 2/2] drm/xe/ras: Enable SGUnit PCIe error reportin=
g ---
commit 4e1cc07b97a799fd7dc8e01bed43ae859ed4cc97
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/ras: Enable SGUnit PCIe error reporting

This commit hacks the SGUnit config space to program error reporting bits
in the DevCtl register since it is not AER capable. It also adds a native
AER sanity check for the upstream port.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index d25d25f775310..3118c713c1186 100644
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
This isn't a bug introduced by this patch, but is it safe to call
pci_save_state(usp) on a shared upstream device without locking?

Looking at ras_usp_aer_init() in drivers/gpu/drm/xe/xe_ras.c, if multiple
SGUnits (endpoints) under the same upstream switch port are probed or
initialized concurrently (for example, via async probe of multiple GPU tiles
or functions), they will concurrently execute pci_save_state(usp) on the sa=
me
shared upstream port without acquiring the device lock.

Could this lead to a data race, writing directly to usp->saved_config_space
and other PM state arrays simultaneously, and corrupt the PCI PM state for =
the
upstream switch port?

>  	dev_dbg(&usp->dev, "Uncorrectable Internal Errors downgraded and unmask=
ed\n");
>  }
> +MODULE_IMPORT_NS("AER");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825054312.1319=
951-1-raag.jadav@intel.com?part=3D2
