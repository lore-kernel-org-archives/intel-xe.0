Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48892606A32E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 15:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TamKYrpU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCC710F640;
	Tue, 24 Nov 2026 15:15:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA1310F6F1
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 15:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795533312; x=1827069312;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=+BGB5ITR5ROIWH3W+Aj0DhuQRSnB4smwDZIa+wM+pvw=;
 b=TamKYrpUxgWclA48jnKUODmUtewvsuhxiaiF7pC5v+9N/Ptgpg42Dno5
 5Tyl19lpEICm9ccghytrZ/zO9xM8e8pEGVlzRGGG7l0CwPqmxXXSBi1PG
 BBvvIcFzE2ZYLhJEXHEiPXiM/O5QOo6bYifVRewKTmXi5UCeIBlwIfiT5
 rligZa1qe5lYRi7qmIBLYzat0GDpydqghIu4CS15AUJXAdC7IEvfqmmFN
 NeoNz7ZZAUzywcNJGseo1TfnwowyD0Wmb8YVhuIzM+3LECNTX0pbHwZuS
 svFHj85seAPp5R0l62C8sO8Ys2Jh91Mkfw9kVS0uGctnyO8mZ1342gFin Q==;
X-CSE-ConnectionGUID: NEiWqGh/RS2tMp9dsi1O8g==
X-CSE-MsgGUID: 7wOTlB19Rw+Fzs8aW62IeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4247700"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4247700"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 06:25:10 -0800
X-CSE-ConnectionGUID: h5SP8zB2Rq6v8TvWv0i0oA==
X-CSE-MsgGUID: 4T/zSBGLRJGno04QX/JvbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11484179"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 06:22:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Nov 2026 16:22:01 +0200 (EET)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
 anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: Re: [PATCH v23 01/19] platform/x86/intel/pmt: Introduce a callback
 for discovery data
In-Reply-To: <20261124020752.30551-22-michael.j.ruhl@intel.com>
Message-ID: <55354276-88be-32c4-15ba-f135ad17c7a6@linux.intel.com>
References: <20261124020752.30551-21-michael.j.ruhl@intel.com>
 <20261124020752.30551-22-michael.j.ruhl@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1909192265-1795530121=:1182"
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1909192265-1795530121=:1182
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 23 Nov 2026, Michael J. Ruhl wrote:

> Some devices require special handling to access discovery data.
>=20
> Crescent Island GPUs have a windowed access to discovery and data.
> Because of this, direct access to the devices MMIO space can be unsafe.
>=20
> A further difficulty is the read_data path requires a GUID which will
> not be known until after discovery, so the current read_data callback
> cannot be used.
>=20
> Provide a callback that uses the capability and discovery index, for
> reading discovery data.
>=20
> Reviewed-by: David E. Box <david.e.box@linux.intel.com>
> Suggested-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> ---
>  drivers/platform/x86/intel/pmt/class.c | 18 ++++++++++++------
>  include/linux/intel_vsec.h             | 10 ++++++++++
>  2 files changed, 22 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x8=
6/intel/pmt/class.c
> index 2b11c4012f6a..601cdf68f0bc 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -466,12 +466,17 @@ static int pmt_get_headers(struct intel_vsec_device=
 *ivdev, int idx,
>  =09switch (ivdev->src) {
>  =09case INTEL_VSEC_DISC_PCI: {
>  =09=09struct resource *disc_res =3D &ivdev->resource[idx];
> +=09=09struct pmt_callbacks *cb =3D ivdev->priv_data;
>  =09=09void __iomem *disc_table;
> +=09=09int ret =3D 0;
> =20
>  =09=09disc_table =3D devm_ioremap_resource(dev, disc_res);
>  =09=09if (IS_ERR(disc_table))
>  =09=09=09return PTR_ERR(disc_table);
> =20
> +=09=09/* Used by crashlog driver */
> +=09=09entry->disc_table =3D disc_table;
> +
>  =09=09/*
>  =09=09 * The mapped resource is sized by the namespace's DVSEC
>  =09=09 * entry_size (in dwords), which can be less than the default
> @@ -480,13 +485,14 @@ static int pmt_get_headers(struct intel_vsec_device=
 *ivdev, int idx,
>  =09=09 * region.
>  =09=09 */
>  =09=09memset(entry->disc_header, 0, header_bytes);
> -=09=09memcpy_fromio(entry->disc_header, disc_table,
> -=09=09=09      min(header_bytes, resource_size(disc_res)));
> -
> -=09=09/* Used by crashlog driver */
> -=09=09entry->disc_table =3D disc_table;
> =20
> -=09=09return 0;
> +=09=09if (cb && cb->read_discovery)
> +=09=09=09ret =3D cb->read_discovery(ivdev->dev, ivdev->cap_id, idx,
> +=09=09=09=09=09=09 entry->disc_header);
> +=09=09else
> +=09=09=09memcpy_fromio(entry->disc_header, disc_table,
> +=09=09=09=09      min(header_bytes, resource_size(disc_res)));
> +=09=09return ret;
>  =09}
>  =09case INTEL_VSEC_DISC_ACPI: {
>  =09=09memcpy(entry->disc_header, &ivdev->acpi_disc[idx][0], header_bytes=
);
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 8686e79c4f75..e4afdb6478e3 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -94,6 +94,11 @@ enum intel_vsec_quirks {
>   * * data:  buffer for the data to be copied
>   * * off:   offset into the requested buffer
>   * * count: size of buffer
> + * @read_discovery: when specified called by client driver to read PMT d=
iscovery structs
> + * * dev:       device reference for the callback's use
> + * * cap_id:    ilog2 of VSEC_CAP value
> + * * idx:       index to access based on the capability header enumerate=
d by intel_vsec_register()
> + * * disc_data: PMT_DISC_DWORDS dword sized buffer for the discovery dat=
a to be copied
>   * @read_reg: when specified called by client driver to read PMT state
>   * * dev:      device reference for the callback's use
>   * * guid:     ID of data to access
> @@ -104,9 +109,14 @@ enum intel_vsec_quirks {
>   * * guid:     ID of data to access
>   * * reg_data: register data
>   * * offset:   offset of register to write
> + *
> + * NOTE: Callbacks may be called from the client driver's probe and remo=
ve paths.
> + *       A parent MUST not hold a lock taken by the callbacks across the=
 registration
> + *       path or while its devices are being removed.
>   */
>  struct pmt_callbacks {
>  =09int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off=
, u32 count);
> +=09int (*read_discovery)(struct device *dev, unsigned long cap_id, u32 i=
dx, u32 *disc_data);
>  =09int (*read_reg)(struct device *dev, u32 guid, u32 *reg_data, u32 offs=
et);
>  =09int (*write_reg)(struct device *dev, u32 guid, u32 reg_data, u32 offs=
et);
>  };
>=20

--=20
 i.

--8323328-1909192265-1795530121=:1182--
