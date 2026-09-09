Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4420C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7827510F1ED;
	Wed,  9 Sep 2026 16:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y1ZGHOnX";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECDE10F1ED
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 16:01:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A72C8417D7;
 Wed,  9 Sep 2026 16:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4721F00A3D;
 Wed,  9 Sep 2026 16:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788969662;
 bh=OfqfAD+TRWh5DgUj0/pFScQrYle8zW3a2OPhzBKBqdM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Y1ZGHOnXcebmPjJyaFQN4JPKjY+goM1uFaA43+2keyvAN/eDLLdwevTAjzSIUhRd8
 dQu/AkFsOiGZSUYR+sqeLfpBxKTSoF5WQPtAZYuaVa0P+90VjqJ9IyTPpIxo+LkntD
 v4aVO5qgGcdXO3PFKI8M4Uqb3ZMhhiJa7NeyIgyv6XY8Hkww/drNY9hBYuOoT6eXaL
 dT55Tzs/CxXL3tTZaxUc9rtdwCWa3bHj/1/5m+x+Si2rATyaYJvOPTMXAh/rGKiHGc
 y3EKWl3nsYdiG2VdwWticXC5akcfWDvzam29EBxm6DaT2cRaTG7tr92fLD8T3/6mJQ
 tIx+lx2M+rpoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/20] platform/x86/intel/pmt: complete pcidev to
 device update
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909154739.1515514-23-michael.j.ruhl@intel.com>
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
 <20260909154739.1515514-23-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 16:01:01 +0000
Message-Id: <20260909160102.5F4721F00A3D@smtp.kernel.org>
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
- [Critical] Missing teardown of exported telemetry endpoint causes use-aft=
er-free when device is removed.
--

commit 12593ebacfae833dd29f4f9c8c3591c03eda34a2
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

platform/x86/intel/pmt: complete pcidev to device update

This commit replaces the pci_dev pointer with a standard device pointer
in struct intel_pmt_entry to complete the transition to the device
struct. It also updates the callback mechanisms to use the updated entry
rather than the telemetry endpoint.

> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x8=
6/intel/pmt/class.h
> index a0ece4fc3837d..258cb460e61c2 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -42,7 +41,7 @@ struct intel_pmt_header {
> =20
>  struct intel_pmt_entry {
>  	struct telem_endpoint	*ep;
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Critical]
This is a pre-existing issue and was not introduced by this patch, but does
the teardown of this telemetry endpoint in=20
drivers/platform/x86/intel/pmt/telemetry.c lack a mechanism to safely fence
off clients that still hold an active reference?

When a device is removed, pmt_telem_remove() is called:

drivers/platform/x86/intel/pmt/telemetry.c:pmt_telem_remove() {
	for (i =3D 0; i < priv->num_entries; i++) {
		struct intel_pmt_entry *entry =3D &priv->entry[i];

		kref_put(&entry->ep->kref, pmt_telem_ep_release);
		intel_pmt_dev_destroy(entry, &pmt_telem_ns);
	}
}

This unregisters the PMT device, which frees the devm-managed ep->base memo=
ry
map, but fails to set ep->present =3D false.

Because a client may still hold a kref, the ep object is not freed.

If the client then attempts a telemetry read, it will pass the !ep->present
check in pmt_telem_read():

drivers/platform/x86/intel/pmt/telemetry.c:pmt_telem_read() {
	if (!ep->present)
		return -ENODEV;
...
	pmt_telem_read_mmio(ep->dev, ep->cb, ep->header.guid, data, ep->base,
			    offset, NUM_BYTES_QWORD(count));
}

Could this result in an unsafe memory access to the unmapped ep->base,
leading to an MMIO fault and a kernel panic?

> -	struct pci_dev		*pcidev;
> +	struct device		*dev;
>  	struct intel_pmt_header	header;
>  	u32			disc_header[PMT_DISC_DWORDS];
>  	struct bin_attribute	pmt_bin_attr;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909154739.1515=
514-22-michael.j.ruhl@intel.com?part=3D1
