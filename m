Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822EAC5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 14:46:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AE510E57C;
	Fri, 14 Aug 2026 14:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U3uvyxw2";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE72610F60E
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 14:46:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9AB104075C;
 Fri, 14 Aug 2026 14:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544A41F000E9;
 Fri, 14 Aug 2026 14:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786718782;
 bh=Cl7CjRP9heVtYKUkiEXj9yGu1wKXoLG1tyjqhXN46CA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=U3uvyxw2vKFyethkVc6zlGmZ6LU8UmJ/otoYrPBXVhYMln6h4QiD74Fu9BZjiXHr6
 2ONryppmRq1lomrVaJ4NEBQsovEz06yk3LDxjTuVx2ntlwqRHKeDr2ieiuyqoEChND
 iY50INox6UGTdVRJOK+mdy67kh6SmjXYktKn60SZ9cXAOxboAEB1+UXDxRqWziqBUE
 Cj4y6+PHt3sLPQkvwx2qTwlinA+hZShQsXCgr9HyrxqbbpPAIxVxxJeyyRcgmzg5Ds
 TBFZSIkw2+dYmgWXT95LAId4DKZkFK6o3/Sghuo27Q+U9KK76mA5/ZS5A4Uq+meugT
 w5pcWdIFU77/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] drm/xe/pci_error: Allow debugging PCI errors
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260814143121.390791-1-raag.jadav@intel.com>
References: <20260814143121.390791-1-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 14:46:21 +0000
Message-Id: <20260814144622.544A41F000E9@smtp.kernel.org>
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
- [High] Returning PCI_ERS_RESULT_DISCONNECT does not prevent bus reset on =
fatal AER errors and causes the PCI core to tear down the device, defeating=
 the patch's debugging goal.
--

--- Patch [1]: [PATCH v1] drm/xe/pci_error: Allow debugging PCI errors ---
commit bd082f56247e27f219ffa1505be8bdbb355ef59d
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/pci_error: Allow debugging PCI errors

XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs.
Disconnect the device on AER and prevent bus reset, so that it is available
to the user for debugging.

> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pc=
i_error.c
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -63,6 +63,12 @@ static pci_ers_result_t xe_pci_error_detected(struct p=
ci_dev *pdev, pci_channel_
>  	if (xe_survivability_mode_is_boot_enabled(xe) || xe_device_wedged(xe))
>  		return PCI_ERS_RESULT_DISCONNECT;
> =20
> +	/* User wants to debug the error, prevent reset */
> +	if (xe->wedged.mode =3D=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +		xe_device_declare_wedged(xe);
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +

[Severity: High]
Does returning PCI_ERS_RESULT_DISCONNECT actually prevent the bus reset
and keep the device available for debugging?

Looking at the PCI core in pcie_do_recovery(), if the error is fatal=20
(state =3D=3D pci_channel_io_frozen), a bus reset is issued unconditionally=
=20
regardless of the result returned by the driver's error_detected() callback:

drivers/pci/pcie/err.c:pcie_do_recovery() {
	...
	status =3D report_error_detected(dev, state, &pci_ers_result_none);

	if (status =3D=3D PCI_ERS_RESULT_NEED_RESET ||
	    state =3D=3D pci_channel_io_frozen) {
		if (reset_subordinates(bridge) !=3D PCI_ERS_RESULT_RECOVERED) {
	...
}

Furthermore, returning PCI_ERS_RESULT_DISCONNECT means the status is not
PCI_ERS_RESULT_RECOVERED. This forces the PCI core to jump to its failure
path, which notifies the driver with pci_channel_io_perm_failure and
subsequently tears down the device.

Will this unintentionally destroy the very state the user is trying
to debug, rather than keeping the device available?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814143121.3907=
91-1-raag.jadav@intel.com?part=3D1
