Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B808AC79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6865B10E55D;
	Fri,  4 Sep 2026 18:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z4XsDsnb";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D2E10E55D
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:45:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0027A600D4;
 Fri,  4 Sep 2026 18:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8809A1F00A3D;
 Fri,  4 Sep 2026 18:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788547558;
 bh=LHAYykgTSszZXuTR7mzCASy1ftggJFsGQ7aI28dCAg8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Z4XsDsnb1rA3wCmhxiBxgc43Hv02OF0BYfoIvKBMawHnWYe1C/U/uLG27JuncHgQS
 I8p6NiBKBV/dzhhBZp6hESQdjPsTzO16EAZkgeRakMy7Vj9vEwcgWZLxqbXOUFRr+8
 zsAk2QIgmv1WgAGKi8/qfTuPBgOKuUCWyqff6d0orcuCEKfnctH/BsAw05TTy5phho
 2Xi0zJWgIH9fykRV8NDcNRYGXRG74n8nlCyk+ZmMpdFh+DLWdLhyKrusFQoJ2UE/l1
 0eMvi1/6yYo2fd5ZAOxGAKV786wenVpMCUCunsyNDV/K/1V087gMxI30eo1wR41itJ
 hoLJS1ffunVkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/18] platform/x86/intel/pmt: complete pcidev to
 device update
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904182451.1164868-21-michael.j.ruhl@intel.com>
References: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
 <20260904182451.1164868-21-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 18:45:58 +0000
Message-Id: <20260904184558.8809A1F00A3D@smtp.kernel.org>
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

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the telemetry en=
dpoint struct (`ep`) can be accessed after its MMIO memory is unmapped beca=
use `ep->present` is not set to `false` during device removal.
- [High] This problem wasn't introduced by this patch, but there is an unco=
nditional bad cast of a generic device to a PCI device using `to_pci_dev()`=
, causing undefined behavior for ACPI-based PMT devices.
--

commit b960ebec46fe99a17e1ecbb42ea33da55296b489
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

    platform/x86/intel/pmt: complete pcidev to device update
   =20
    The update that moved struct pci_dev usage to struct device is
    incomplete. Only telemetry endpoints are covered.
   =20
    Other PMT features (crashlog) are now blocked from using the callback
    mechanism.
   =20
    Change struct intel_pmt_entry pci_dev member to device.
   =20
    Update callback usage to use the intel_pmt_entry rather than the
    telemetry endpoint.
   =20
    Fixes: 353042d54d82 ("platform/x86/intel/vsec: Switch exported helpers =
from pci_dev to device")

> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x8=
6/intel/pmt/class.h
> index a0ece4fc3837d..258cb460e61c2 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -42,7 +41,7 @@ struct intel_pmt_header {
> =20
>  struct intel_pmt_entry {
>  	struct telem_endpoint	*ep;
> -	struct pci_dev		*pcidev;
> +	struct device		*dev;

[Severity: High]
This problem wasn't introduced by this patch, but while reviewing the chang=
es
to struct intel_pmt_entry, I noticed a potential type confusion issue in
drivers/platform/x86/intel/pmt/telemetry.c:

drivers/platform/x86/intel/pmt/telemetry.c:pmt_copy_region() {
    struct pci_dev *pdev =3D to_pci_dev(entry->ep->dev);
    ...
}

Can this unconditional cast of a generic device to a PCI device cause
undefined behavior for ACPI-based PMT devices?

PMT telemetry devices can be discovered via ACPI (e.g., INTEL_VSEC_DISC_ACPI
used in pwrm_telemetry.c and ssram_telemetry.c). In this case, entry->ep->d=
ev
points to an ACPI platform device, not a PCI device.

When pmt_copy_region() blindly calls to_pci_dev(entry->ep->dev), it uses
container_of to subtract a large offset. The resulting garbage pointer is
passed to intel_vsec_get_mapping(), which passes it to pci_match_id(). This
causes a dereference of PCI-specific struct fields like vendor and device
from unmapped or unrelated memory, leading to an out-of-bounds read and
likely kernel panic.

This appears to be reachable unconditionally when consumers like resctrl
iterate over telemetry endpoints and call intel_pmt_get_regions_by_feature()
which in turn calls pmt_copy_region() on systems using ACPI-based PMT
devices.


[Severity: High]
This problem wasn't introduced by this patch, but the telemetry endpoint
struct (ep) can be accessed after its MMIO memory is unmapped because
ep->present is not set to false during device removal.

Looking at drivers/platform/x86/intel/pmt/telemetry.c:pmt_telem_remove():

    for (i =3D 0; i < priv->num_entries; i++) {
        struct intel_pmt_entry *entry =3D &priv->entry[i];

        kref_put(&entry->ep->kref, pmt_telem_ep_release);
        intel_pmt_dev_destroy(entry, &pmt_telem_ns);
    }

Can this lead to a use-after-free of MMIO memory?

A consumer (like resctrl or intel_pmc_core) requests a telemetry endpoint
via pmt_telem_find_and_register_endpoint(), holding a kref to the
endpoint.

If the PMT device is subsequently unbound or hot-removed,
pmt_telem_remove() drops the driver's reference. The devres framework then
unmaps entry->base (which aliases to ep->base).

Because ep->present is never set to false, the consumer will bypass the
if (!ep->present) safety checks and attempt to read from the now-unmapped
ep->base MMIO address.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904182451.1164=
868-20-michael.j.ruhl@intel.com?part=3D1
