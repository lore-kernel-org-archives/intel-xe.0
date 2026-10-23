Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C2A606A31F
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 04:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gj5YFu1D
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E15010E528;
	Fri, 23 Oct 2026 04:30:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6B910E528
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 04:30:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7C396419EA;
 Fri, 23 Oct 2026 04:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F85A1F031E1;
 Fri, 23 Oct 2026 04:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792729808;
 bh=H+WrNe9WsiyKp0bSP7kWS24iJMoV1L4iiHau0tOrNrM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=gj5YFu1DtzkVWvLDtf65yvfhGfwrNKjCodAwY3OHvThDnfBNyz4q9ZFcZA9GsFm29
 TlIGeZmUaB4tfQpIjNt1ZRDwqxWPbvwsRdjKW8hNsmrd3K1TEB2HUgGZ4syvHK4WR0
 pBBcdgfutCaqhQobRth4/UDRIJicdSLzEA34VeuQLPKUswvuQwPISBtwtFIbeiq1+B
 dun6l5kFsL5UfUlNpFfdNocZuc2k8I0vUWASEXNI5USPgxnmyvwFq2ocpkAzU9z1/3
 em4NoaNKwc8uZbdbvfoIc8uCQlwZl8Vp6bxEYtboamNICRql02uMcyIhAyRg7YAhfj
 JVqNw/pISjFhQ==
Message-ID: <sashiko-outbox-182289@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/13] drm/xe/cper: Initialize Intel-specific section
 header
To: "Badal Nilawar" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261023043422.681260-18-badal.nilawar@intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
 <20261023043422.681260-18-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 04:30:07 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe/cper: cper_init_intel_hdr() never sets unknown sig_id to =
U32_MAX
--

commit 1eb07867e667177c6634aadbe7bf46699728e40f
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cper: Initialize Intel-specific section header

This commit defines struct xe_cper_intel_hdr for the Intel GPU error
section of a CPER record and adds helpers in drivers/gpu/drm/xe/xe_cper.c
to initialize it from a RAS error counter response.

> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index a9044e708caca..3d7657517223a 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c

[ ... ]

> +static bool is_valid_sigid(u32 sigid)
> +{
> +	return sigid !=3D U32_MAX;
> +}
> +
>  static bool is_hw_sigid(enum xe_sigid sigid)
>  {
>  	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_B=
ATCH);
>  }
> =20
> +static void cper_init_intel_hdr(struct xe_device *xe,
> +				const struct xe_ras_error_class *counter,
> +				u64 first_timestamp, u32 sig_id, u32 error_count,
> +				struct xe_cper_intel_hdr *ihdr)
> +{
> +	ihdr->counter =3D *counter;
> +	ihdr->validation_bits |=3D XE_CPER_VALID_LOCATION;
> +
> +	if (first_timestamp) {
> +		ihdr->first_timestamp =3D first_timestamp;
> +		ihdr->validation_bits |=3D XE_CPER_VALID_FIRST_TIMESTAMP;
> +	}
> +
> +	if (is_valid_sigid(sig_id)) {
> +		ihdr->sig_id =3D sig_id;
> +		ihdr->validation_bits |=3D XE_CPER_VALID_SIG_ID;
> +	}

[Severity: Medium]
In drivers/gpu/drm/xe/xe_cper_types.h, struct xe_cper_intel_hdr documents
sig_id as:

	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
	u32 sig_id;

However, cper_emit_counter() zero-initializes struct xe_cper_intel_hdr ihdr
before calling cper_init_intel_hdr(). When sig_id is U32_MAX,
is_valid_sigid(sig_id) returns false and skips the assignment, leaving
ihdr->sig_id as 0 instead of U32_MAX.

Conversely, if INTEL_SIGID_INVALID (0) is passed, is_valid_sigid(sig_id)
returns true, leaving ihdr->sig_id as 0 while also setting
XE_CPER_VALID_SIG_ID in ihdr->validation_bits.

Should cper_init_intel_hdr() explicitly set ihdr->sig_id to U32_MAX when
sig_id is unknown, and should is_valid_sigid() also reject
INTEL_SIGID_INVALID?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023043422.6812=
60-15-badal.nilawar@intel.com?part=3D3
