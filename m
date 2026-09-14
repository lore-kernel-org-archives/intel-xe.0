Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174BBC88E73
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 20:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB12E10F1F0;
	Mon, 14 Sep 2026 20:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hYhd7jiZ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C04C10F1EE;
 Mon, 14 Sep 2026 20:00:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D442143D9F;
 Mon, 14 Sep 2026 20:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F791F000FF;
 Mon, 14 Sep 2026 20:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789416026;
 bh=YzsiqzSZP+SP+3943/WkajB++6zhFPCyNImXsB2KN+k=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=hYhd7jiZ96bsRJe6QjE66fwQPyaY0xoNwq3QuWeNZMA957HE4rP/i+eivwqvMt481
 MSg/BqI6gy/xNgC0MixF6thRICiHGkHUuR7yAZ8j79kpfzOBq2KrCl48sBiQpFZZG1
 rFHmG+x/OzTUq5KmbydPoD2YOKlkXjLq0LRwYzJwURlc/N4mwCRTmXHg7AA+rvO4BM
 G6c86bq4kMVfgJ+Li7ORmuf2zLXhIkkmc5X5bdyggLeFYfm9pqPPWQJaO1jy97NQEi
 PIyBy8OGI3S/X3TmdM+Q8hceyIue6iCRnaJCynNXKz3Dt9WnhZDJvCia39A2E0EVDr
 lCQYQmo93d4uA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/7] drm/xe/pm: initialize the device's system wakeup
 capabilities
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260914194737.272679-2-vinod.govindapillai@intel.com>
References: <20260914194737.272679-1-vinod.govindapillai@intel.com>
 <20260914194737.272679-2-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 20:00:26 +0000
Message-Id: <20260914200026.90F791F000FF@smtp.kernel.org>
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
- [High] Using devm_device_init_wakeup() on a PCI device corrupts bus-manag=
ed can_wakeup state on unbind.
- [Medium] Unconditional execution of devm_device_init_wakeup() forcefully =
overrides PCI PME capabilities and violates SR-IOV VF constraints.
--

commit df4a3e5da10819a464844de67d48ba7d13070965
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>

drm/xe/pm: initialize the device's system wakeup capabilities

This commit enables the device as a wakeup device so display hotplugs can
generate PM PME events. This enables invoking the PM runtime resume routine
for NVL+ XE devices.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 5f2a0b19839d1..32e10e1a26eff 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1200,6 +1200,10 @@ static int xe_pci_probe(struct pci_dev *pdev, cons=
t struct pci_device_id *ent)
> =20
>  	pci_set_master(pdev);
> =20
> +	err =3D devm_device_init_wakeup(&pdev->dev);

[Severity: High]
Does calling devm_device_init_wakeup() on a PCI device corrupt the
bus-managed can_wakeup state on unbind?

When the driver is unbound, the devres cleanup triggers
device_disable_wakeup(), which explicitly calls
device_set_wakeup_capable(dev, false). This causes the device to permanently
lose its can_wakeup capability in the driver model, breaking PME capabiliti=
es
and userspace sysfs interfaces after a driver unbind/rebind cycle.

Should the driver use device_wakeup_enable() to toggle only the
should_wakeup state, rather than overriding the bus-owned capability flag s=
et
during bus enumeration?

[Severity: Medium]
Does this unconditional execution of devm_device_init_wakeup() forcefully
override PCI PME capabilities and violate SR-IOV VF constraints?

The driver forcefully sets can_wakeup =3D true on devices that physically do
not support PME (like Virtual Functions or older hardware), leading to
invalid sysfs attributes and potential power management misbehavior.

This happens before xe_probe_info_early() determines the hardware generation
and without checking IS_SRIOV_VF() to ensure this PF-only power management
configuration is not executed on VFs. Should this initialization be
conditionally guarded based on the hardware capabilities and virtual functi=
on
constraints?

> +	if (err)
> +		return err;
> +
>  	err =3D xe_probe_info_early(xe, desc, &probed_info);
>  	if (err)
>  		return err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914194737.2726=
79-1-vinod.govindapillai@intel.com?part=3D1
