Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC36606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 04:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KObQT0Pa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB3010E26B;
	Wed, 21 Oct 2026 04:32:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6B710E26B
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 04:32:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D0C2F6021E;
 Wed, 21 Oct 2026 04:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724681F000C9;
 Wed, 21 Oct 2026 04:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792557150;
 bh=dAKqy8trlVm43Opc0XjoPKPpf9fIQVhJqwwBAA8fPlk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=KObQT0Pa8Jp53+eIoNSr4Dhet6xCieRFlcV6PP7qyT3jh7/wl6GEnGiM+RME8gGas
 J4q+RogzF6ZRZg9dpRs1gxVeJzXtIqPku9CbkstK5I2oMSFnK5dNvDE6DZx5Nv+UoS
 dgMFTrVbzI+HNPoj6OuL1wV0c3gsD2eJSsLD8gbP6eqzbIFjLRaOEkHoqvDtK0Od/E
 YXdFoUAJ3QtUC5ae75WW25Pb9hr/oj6rxAtPmniB27Q34GnBVviqvY24vu0+fNRuzF
 SxXTccZ91GGm7QZwURT+VR+sfWaqjreEBTdKRMeRjlngAWIEaSK3nv2SeKJg7pkblK
 O8J81QjFTrxqQ==
Message-ID: <sashiko-outbox-179784@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] drm/xe/pci: log ATS/PASID enablement state at probe
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261021041117.1774877-2-naresh.kumar.g@intel.com>
References: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
 <20261021041117.1774877-2-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 04:32:30 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] drm/xe/pci: xe_pci_ats_pasid_enabled() always returns false on S=
R-IOV VFs
- [Low] drm/xe/pci: build failure in __xe_pci_probe() without CONFIG_PCI_AT=
S/PASID
--

commit 9613705bbc43ffcbfae8d92b0e6cff920caffa87
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

drm/xe/pci: log ATS/PASID enablement state at probe

This commit logs ATS and PASID enablement states during __xe_pci_probe() wh=
en
their PCI capabilities are present, and introduces xe_pci_ats_pasid_enabled=
()
to check whether both features are enabled on a PCI device.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 44587b5f4df60..7c8a4286b657a 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1281,6 +1281,13 @@ static int __xe_pci_probe(struct pci_dev *pdev, co=
nst struct xe_device_desc *des
>  		xe_step_name(xe->info.step.media),
>  		xe_step_name(xe->info.step.basedie));
> =20
> +	if (pdev->ats_cap)
> +		drm_dbg(&xe->drm, "Arch ATS =3D %s",
> +			str_enabled_disabled(pdev->ats_enabled));
> +	if (pdev->pasid_cap)
> +		drm_dbg(&xe->drm, "Arch PASID =3D %s",
> +			str_enabled_disabled(pdev->pasid_enabled));

[Severity: Low]
Will __xe_pci_probe() in drivers/gpu/drm/xe/xe_pci.c fail to build when
CONFIG_PCI_ATS or CONFIG_PCI_PASID is disabled?

In include/linux/pci.h, struct pci_dev only defines ats_cap and pasid_cap
when their respective Kconfig options are enabled:

#ifdef CONFIG_PCI_ATS
	...
	u16		ats_cap;	/* ATS Capability offset */
	u8		ats_stu;	/* ATS Smallest Translation Unit */
#endif
...
#ifdef CONFIG_PCI_PASID
	u16		pasid_cap;	/* PASID Capability offset */
	u16		pasid_features;
#endif

Since CONFIG_DRM_XE in drivers/gpu/drm/xe/Kconfig only depends on DRM and
PCI without selecting or depending on PCI_ATS or PCI_PASID (for example, in
drivers/gpu/drm/xe/.kunitconfig), accessing pdev->ats_cap and pdev->pasid_c=
ap
directly without IS_ENABLED() guards breaks the build when either option is
not set.

> +
>  	drm_dbg(&xe->drm, "SR-IOV support: %s (mode: %s)\n",
>  		str_yes_no(xe_device_has_sriov(xe)),
>  		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> index 11bcc5fe2c5b9..5f784229a5ecf 100644
> --- a/drivers/gpu/drm/xe/xe_pci.h
> +++ b/drivers/gpu/drm/xe/xe_pci.h
> @@ -5,6 +5,7 @@
> =20
>  #ifndef _XE_PCI_H_
>  #define _XE_PCI_H_
> +#include <linux/pci.h>
> =20
>  struct pci_dev;
> =20
> @@ -12,4 +13,9 @@ int xe_register_pci_driver(void);
>  void xe_unregister_pci_driver(void);
>  struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
> =20
> +static inline bool xe_pci_ats_pasid_enabled(struct pci_dev *pdev)
> +{
> +	return pdev->ats_enabled && pdev->pasid_enabled;
> +}

[Severity: Medium]
How does xe_pci_ats_pasid_enabled() in drivers/gpu/drm/xe/xe_pci.h (as well
as the PASID check in __xe_pci_probe()) behave on SR-IOV Virtual Functions?

In drivers/pci/ats.c, pci_enable_pasid() notes that VFs do not implement
their own PASID capability (so pdev->pasid_cap is 0) and instead share the
PF's PASID configuration:

	if (pdev->is_virtfn) {
		if (pci_physfn(pdev)->pasid_enabled)
			return 0;
		return -EINVAL;
	}

When the IOMMU enables PASID on a VF via pci_enable_pasid(), it checks
pci_physfn(pdev)->pasid_enabled and returns 0 without setting
pdev->pasid_enabled on the VF's pci_dev (whereas pci_enable_ats() sets
pdev->ats_enabled on the VF).

Because xe_pci_ats_pasid_enabled() and __xe_pci_probe() inspect
pdev->pasid_enabled and pdev->pasid_cap directly instead of checking
pci_physfn(pdev) (or calling pci_pasid_status(pdev)), won't
xe_pci_ats_pasid_enabled() always return false on VFs and __xe_pci_probe()
always skip logging the PASID state on VFs?

> +
>  #endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021041117.1774=
877-1-naresh.kumar.g@intel.com?part=3D1
