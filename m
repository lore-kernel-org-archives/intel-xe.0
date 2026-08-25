Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1C5C61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 18:02:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B5410E0DB;
	Tue, 25 Aug 2026 18:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="azTuVWzd";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3749010E0DB
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 18:02:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 814BC60053;
 Tue, 25 Aug 2026 18:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB5A1F000E9;
 Tue, 25 Aug 2026 18:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787680939;
 bh=0K15S1trHVxam5HcdTPRK9YbygopRvxHW9dFCNSwChM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=azTuVWzdHGZA0RdupytrJqbYk9GsnfW9a1yw3RbU3tZa7xUgqGuFm3//lcPv4fYG2
 o2iSHr3fx9xGeJNJI7JvBmwsTyISvkSXQQWyMzFF82zRHZtoFVbBL92NF0a4kBBaAs
 /lJFUkb1EDafdm8Fe714sbwg7wudGDPAHJGz/NQQECwzmX0VapSkwFUHEKOZ7mnZwh
 saEpfcC8Iaox2/2G/KpbUnTh3VTaVkNHAYirU4MN0I0FHM6uhxVMH99f/oySm9p7lE
 /FO4sve9LYTexbiwTC60/YdieKwC9hGlP6ghBZ/WZ+9Ae16LyfjyIJNN9oZYgmroU7
 CNrhbdtZze7Ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/11] drm/xe/cper: APIs to prepare and log CPER record
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825175916.1103841-17-badal.nilawar@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-17-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 18:02:18 +0000
Message-Id: <20260825180219.0EB5A1F000E9@smtp.kernel.org>
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
- [High] Unconditional dereference of potentially NULL `THIS_MODULE->srcver=
sion` causes kernel panic.
- [Medium] Assigning `ktime_get_real_seconds()` to `rhdr->timestamp` violat=
es the UEFI CPER standard, which requires a BCD timestamp.
--

commit 1a8a9f568395a2ce2ede1bcececcf688f5a25b63
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cper: APIs to prepare and log CPER record

Add APIs to initialize Intel-specific CPER metadata, build a non-standard
CPER record, and emit it via the xe_error_cper tracepoint.

> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> new file mode 100644
> index 0000000000000..371537052de35
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cper.c
[ ... ]
> +void xe_cper_init_intel_err_hdr(struct xe_device *xe, const u8 location[=
12],
> +				u64 first_timestamp, u32 sig_id,
> +				u32 error_count, struct xe_cper_sec_intel_err_hdr *ihdr)
> +{
[ ... ]
> +	strscpy(ihdr->pci_bdf, pci_name(to_pci_dev(xe->drm.dev)), sizeof(ihdr->=
pci_bdf));
> +	ihdr->valid_bits.pci_bdf =3D 1;
> +
> +#ifdef MODULE
> +	strscpy(ihdr->drv_version, THIS_MODULE->srcversion, sizeof(ihdr->drv_ve=
rsion));

[Severity: High]
Can this cause a kernel panic if the module's source version is not populat=
ed?

When the kernel is compiled without CONFIG_MODULE_SRCVERSION_ALL and the
module lacks an explicit MODULE_VERSION macro, the build system does not
generate the srcversion modinfo attribute. In this case,
THIS_MODULE->srcversion is left as NULL during module load.

Since strscpy() does not handle NULL source pointers gracefully, this
unconditional dereference of THIS_MODULE->srcversion in
xe_cper_init_intel_err_hdr() could lead to a kernel panic when hardware
error reporting is triggered.

> +	ihdr->valid_bits.drv_version =3D 1;
> +#else
> +	ihdr->valid_bits.drv_version =3D 0;
> +#endif
> +
> +	fill_fw_id(xe, ihdr);
> +}
[ ... ]
> +void xe_cper_record_emit(struct xe_device *xe, u8 severity,
> +			 guid_t *notification_type,
> +			 struct xe_cper_sec_intel_err_hdr *ihdr,
> +			 const void *einfo, u32 einfo_len)
> +{
[ ... ]
> +	/* Assemble the CPER record header (UEFI Appendix N.2.1) */
> +	memcpy(rhdr->signature, CPER_SIG_RECORD, CPER_SIG_SIZE);
> +	rhdr->revision          =3D CPER_RECORD_REV;
> +	rhdr->signature_end     =3D CPER_SIG_END;
> +	rhdr->section_count     =3D 1;
> +	rhdr->error_severity    =3D severity;
> +	rhdr->validation_bits   =3D CPER_VALID_TIMESTAMP;
> +	rhdr->record_length     =3D total_len;
> +	rhdr->timestamp         =3D ktime_get_real_seconds();

[Severity: Medium]
Does this assign a raw binary Unix timestamp to a field that requires a BCD
format?

ktime_get_real_seconds() returns a 64-bit binary integer representing
seconds since the Unix epoch. However, the UEFI standard (UEFI 2.8+
Appendix N.2.1) mandates that the timestamp field in a struct
cper_record_header is a 64-bit BCD-encoded date and time value (Century,
Year, Month, Day, Hours, Minutes, Seconds).

Assigning a raw binary Unix timestamp to rhdr->timestamp in
xe_cper_record_emit() could cause standard CPER parsers to read invalid
BCD characters or absurd dates.

> +	if (platform_id) {
> +		rhdr->platform_id      =3D *platform_id;
> +		rhdr->validation_bits |=3D CPER_VALID_PLATFORM_ID;
> +	}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825175916.1103=
841-13-badal.nilawar@intel.com?part=3D4
