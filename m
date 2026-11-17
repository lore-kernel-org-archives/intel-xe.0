Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D10606A329
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 10:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aRMUPK9f
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7473210E5B8;
	Tue, 17 Nov 2026 10:11:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B6910F602
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 10:11:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C61D404A1;
 Tue, 17 Nov 2026 10:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1632D1F000C5;
 Tue, 17 Nov 2026 10:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794910305;
 bh=wKZBv/0FkFSTWLf6gxkDnjm74+WfW3aKL5sDSEm5c+s=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=aRMUPK9fK0aVibwnIU02wVv4WAAzznt4fRRR2VM9rXotSUpxSMCWQkUifXUBQxUVG
 5414Ag04nJJGLcFxhqb5ZGLbb6jWOFfniDDjRgEKw2ubcsVzLjYwrma2BejwnU0YmC
 /1Wvs+w9NeMhTVL139MY20praUVdYxXT+HvoCSuxf0UnhXrRoGTUhyP177QNgyfWWY
 Hn+Jx8xgZH/RtwNdrJqDTBejOk3QZxDw4kx9SqMvzo3wnK4jQjQlb7njk9wMIPIYG5
 xjdWvH7lCSSmujLUvCNf2xlc/7IjvjLhwJoSKmsoqX3Vaxi2S26dK4mC0Sxjl7IUXc
 QYXEWWJCe7YUA==
Message-ID: <sashiko-outbox-218574@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/ras: Add RAS config command to downgrade AER
 uncorrectable internal error
To: "Riana Tauro" <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261117095701.404369-2-riana.tauro@intel.com>
References: <20261117095701.404369-2-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 10:11:41 +0000
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
- [Low] drm/xe/ras: pcie_aer_is_native() precedes aer_cap check in
  ras_usp_aer_init()
--

commit 023f37be15fd1e9b09b34f30302beed059ea93be
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/ras: Add RAS config command to downgrade AER uncorrectable internal =
error

This commit adds support for the XE_SYSCTRL_CMD_RAS_CONFIG mailbox command
and uses it in ras_usp_aer_init() to request firmware to downgrade the USP
AER uncorrectable internal error severity when the OS does not have native
control of AER.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 0fb891d00b36a..4f732e9723f9f 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -508,17 +509,80 @@ static void get_offline_list(struct xe_device *xe)
[ ... ]
>  static void ras_usp_aer_init(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> +	enum xe_ras_config config;
>  	struct pci_dev *usp;
>  	u16 aer_cap;
>  	u32 status;
> +	int ret;
> =20
>  	usp =3D xe_pci_get_usp_dev(pdev);
>  	if (!usp)
>  		return;
> =20
> +	if (!pcie_aer_is_native(usp)) {
> +		config =3D XE_RAS_CONFIG_USP_AER_UNCOR_INTERNAL_NONFATAL;
> +
> +		ret =3D ras_config(xe, config, XE_RAS_CONFIG_ACTION_SET);
> +		if (ret)
> +			return;
> +
> +		/* Read the configuration */
> +		ras_config(xe, config, XE_RAS_CONFIG_ACTION_GET);
> +		return;
> +	}
> +
>  	aer_cap =3D pci_find_ext_capability(usp, PCI_EXT_CAP_ID_ERR);
>  	if (!aer_cap) {
>  		dev_warn(&usp->dev, "AER capability unavailable\n");

[Severity: Low]
Should pci_find_ext_capability(usp, PCI_EXT_CAP_ID_ERR) be checked before
pcie_aer_is_native(usp)?

pcie_aer_is_native() returns 0 whenever usp->aer_cap is 0, before checking
host->native_aer.  If usp lacks the AER capability on a system with native
OS AER control, ras_usp_aer_init() sends the firmware RAS config command
instead of logging the warning and returning, and the !aer_cap check below
becomes unreachable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117095701.4043=
69-2-riana.tauro@intel.com?part=3D1
