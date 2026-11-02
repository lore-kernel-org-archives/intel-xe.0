Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8737C606A32C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 22:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XMNIaP4K
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5032310E599;
	Mon,  2 Nov 2026 22:35:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4B010E599
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 22:35:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 437084363E;
 Mon,  2 Nov 2026 22:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B82E1F00A17;
 Mon,  2 Nov 2026 22:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793658917;
 bh=329DmGFey9bGvCwGuYGR6cuHsWrgnVMEgvsfqFP6g5g=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=XMNIaP4KjhB/lIYx4rAZVyZupoqM7Bfb5ICouSWZtSMxGFbUOhthRf5Y6ktuZ6lGY
 rBUhq5sHiJuIPLAjH9ZHgjR1lCVgFf0BS1LXkpcYq/UKAq2nW+3MnzyPKB6bJ+Wfqf
 Jm8zQ3MsOxJ1t11+m7edkw/QnfVdVPHCndjMKWP+9OzVO9tsr733PkXSyHEYh43o8d
 H2AV4Wi904Uhlu+M02RPhnYs8swxmx1R38sGGijvz+30pCnPlYKBHLmgvjAjYWfUBu
 pI6uHZiaQrfG/42gx9jR68CigikGYRBiATfuS9butIXafIn1lrHEkDdXayQc6DcZxF
 Gw9oE+dvf8hPQ==
Message-ID: <sashiko-outbox-194292@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 14/16] drm/xe/vsec: Update PMT internal access
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261102221314.119028-32-michael.j.ruhl@intel.com>
References: <20261102221314.119028-18-michael.j.ruhl@intel.com>
 <20261102221314.119028-32-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 22:35:16 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe/vsec: missing wait_for_fw() and invalid caching in xe_vse=
c_get_guid()
--

commit ff1f060a60a0a4bf5c3f7818992f8347fb84bca2
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Update PMT internal access

This commit updates read_residency_counter(), xe_hwmon_energy_get(), and
xe_get_pcode_version() to retrieve the device-specific PMT telemetry GUID v=
ia
xe_vsec_get_guid() instead of reading BMG_PUNIT_TELEMETRY_GUID directly.

> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 8c901e54f3847..fa9f45d565cb9 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -365,11 +365,17 @@ ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO);=
 /* See xe_pci_probe */
>  int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *=
version)
>  {
>  	int ret =3D 0;
> +	u32 guid;
> =20
>  	guard(xe_pm_runtime)(xe);
> =20
> -	ret =3D xe_pmt_telem_read(xe->drm.dev,
> -				xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PUNIT_TELEMETRY_GUID),
> +	ret =3D xe_vsec_get_guid(xe, &guid);
> +	if (ret) {
> +		xe_warn(xe, "PMT device is not available: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D xe_pmt_telem_read(xe->drm.dev, guid,
>  				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));

[Severity: Medium]
On XE_CRESCENTISLAND, can calling xe_vsec_get_guid() before xe_pmt_telem_re=
ad()
access the CRI PMT discovery window before OOBMSM firmware is ready and
corrupt punit_guid_cache?

In xe_debugfs_register(), pcode_info is registered on both XE_BATTLEMAGE and
XE_CRESCENTISLAND, and reading it invokes:

  pcode_info() -> xe_get_pcode_version() -> xe_vsec_get_guid()

Unlike xe_pmt_telem_read(), xe_pmt_read_reg(), and xe_pmt_write_reg(),
xe_vsec_get_guid() in drivers/gpu/drm/xe/xe_vsec.c does not call wait_for_f=
w()
before programming the SoC remapper and reading CRI_PUNIT_TELEMETRY_GUID:

drivers/gpu/drm/xe/xe_vsec.c:xe_vsec_get_guid() {
	...
	case XE_CRESCENTISLAND:
		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
		*guid =3D xe_mmio_read32(mmio, CRI_PUNIT_TELEMETRY_GUID);
		break;
	...
	/* the GUID is static, read once and cache for all requests */
	if (*guid)
		xe->pmt.punit_guid_cache =3D *guid;
}

If pcode_info (or read_residency_counter()) is read while late-bound OOBMSM
firmware is not yet ready (for example during initial probe while
cri_late_bind_probe_work is polling, or after runtime resume from D3cold),
reading CRI_PUNIT_TELEMETRY_GUID before wait_for_fw() has two failure modes:

1. If the premature read returns 0, xe_vsec_get_guid() still returns 0 with
   *guid =3D=3D 0, and xe_pmt_telem_read() then fails immediately in
   xe_guid_decode() with -ENODEV before reaching its own wait_for_fw() chec=
k:

drivers/gpu/drm/xe/xe_vsec.c:xe_pmt_telem_read() {
	...
	ret =3D xe_guid_decode(guid, &mem_region, &offset);
	if (ret)
		goto dev_exit;
	...
	if (!wait_for_fw(xe)) {
		ret =3D -ENODATA;
		goto runtime_exit;
	}
}

2. If the premature read returns a non-zero uninitialized or all-ones value
   (such as 0xffffffff), xe_vsec_get_guid() caches it in
   xe->pmt.punit_guid_cache permanently, causing all subsequent calls to
   xe_vsec_get_guid(), xe_get_pcode_version(), and read_residency_counter()=
 to
   fail even after OOBMSM firmware becomes ready.

Should xe_vsec_get_guid() call wait_for_fw(xe) before reading the GUID (and
validate the GUID before caching it)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102221314.1190=
28-18-michael.j.ruhl@intel.com?part=3D14
