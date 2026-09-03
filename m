Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45319C624D7
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 20:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE93310E464;
	Thu,  3 Sep 2026 20:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lxe27TB/";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F346810E464
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 20:27:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0885A60546;
 Thu,  3 Sep 2026 20:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7691F000E9;
 Thu,  3 Sep 2026 20:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788467262;
 bh=KVMwU4vJdM2lzzUj5LBwRivpHhY03ACVgOyEsrcMleU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=lxe27TB/gxNncHGobRxaLE900PXq0vXUBwpG9BxpV69TEEc82CK6lN/c2IUox4776
 1uxu2+nplU7tvYR/6dvJ7QpjD3/BrRsTSxiyE8HyBiTMJZoXv8vr687y1BHqVwBHD+
 K0XcP78FvmbCwZCpY1bAvGriL8UnX2we8PjeMXEhr70ryk7/ldk8bz5Z4dqVVYwHpM
 LLvwZNVpbn4dxkmVy6qj5LgdUAcrEbWpB9tzvoltCsvIPDW0wDdqZk5WEI6Pb89fzv
 tj3OS9dhjWfyW1YcxPLbB7UTSAqoXNRUedPwVlnAAPzewNlaU5zRjdy4Tk2x7nAHVK
 1DTqYkqrnDgbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/18] platform/x86/intel/pmt: complete pcidev to
 device update
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903201002.1064889-21-michael.j.ruhl@intel.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
 <20260903201002.1064889-21-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 20:27:42 +0000
Message-Id: <20260903202742.8A7691F000E9@smtp.kernel.org>
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
- [High] Type confusion in `pmt_copy_region` when casting an ACPI device to=
 `struct pci_dev`.
--

commit db191f282e57b915c53aca0bc92d3bca969e1af4
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

platform/x86/intel/pmt: complete pcidev to device update

The update that moved struct pci_dev usage to struct device is
incomplete. Only telemetry endpoints are covered. This patch changes
the struct intel_pmt_entry pci_dev member to device, and updates
callback usage to use the intel_pmt_entry rather than the telemetry
endpoint.

> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x8=
6/intel/pmt/class.h
> index a0ece4fc3837d..258cb460e61c2 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
[ ... ]
> @@ -42,7 +41,7 @@ struct intel_pmt_header {
> =20
>  struct intel_pmt_entry {
>  	struct telem_endpoint	*ep;

[Severity: High]
This is a pre-existing issue, but does this lead to type confusion in
pmt_copy_region() when an ACPI device has registered telemetry?

In drivers/platform/x86/intel/pmt/telemetry.c:pmt_copy_region(), there is an
unconditional cast of this device (accessed via entry->ep->dev) to a PCI
device:

	struct pci_dev *pdev =3D to_pci_dev(entry->ep->dev);
	struct oobmsm_plat_info *plat_info;

	plat_info =3D intel_vsec_get_mapping(pdev);

If the generic struct device is actually an ACPI device (as during runtime
hardware enumeration of ACPI devices that expose PMT telemetry), can
intel_vsec_get_mapping() calling pci_match_id() end up dereferencing
PCI-specific fields (like vendor and device ID) at invalid memory offsets
and cause an out-of-bounds memory read?

This issue appears to have been introduced in commit 353042d54d82 and does
not appear to be resolved by this patch.

> -	struct pci_dev		*pcidev;
> +	struct device		*dev;
>  	struct intel_pmt_header	header;
>  	u32			disc_header[PMT_DISC_DWORDS];
>  	struct bin_attribute	pmt_bin_attr;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903201002.1064=
889-20-michael.j.ruhl@intel.com?part=3D1
