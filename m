Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF40C61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787F189CCE;
	Tue, 25 Aug 2026 17:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F74Rbz4F";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2683C89CCE
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:51:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D05A740B86;
 Tue, 25 Aug 2026 17:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D371F000E9;
 Tue, 25 Aug 2026 17:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787680267;
 bh=0eYwYnsFgwc6s+dGiBShVGAaitR3Xd8gJO54wNhQ73U=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=F74Rbz4F5EcSWpytjwKxxHp96PtP2PBxsm77iNUMEbOB5nTRUJK3Nq1uC4AR3Kg7e
 eWE0epFEOUOlvQemAKWgxL6pB7ro2VVK781H/0EhvGMrpXPdWDirqJonHh9AkJGG+e
 JjR316puzwNLurfYaYYHzLZOjynyB0pjtDDskULkkR4nfW/DJN+xWasByaBFywmMze
 pW9HZM1mUrB077DjvaKb045NJbAGFlL827IsXXXEBJm5awoPCUgDi/0QKKk7xooVVV
 0Ovhzx/2onXXx/xpjF631WfUBAw/WwpyTHhaN9F9bgfsVF61Y9IvJgzvfDeSELI3sy
 sfY554ye18i/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/11] drm/xe/cper: Add CPER structures and trace event
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825175916.1103841-16-badal.nilawar@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-16-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:51:07 +0000
Message-Id: <20260825175107.93D371F000E9@smtp.kernel.org>
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
- [Medium] CPER structures use native integer types and C bitfields for a s=
tandardized external binary format, causing ABI corruption on non-little-en=
dian architectures.
- [Medium] Tracepoint uses `%pU` to print `guid_t` fields, incorrectly form=
atting them as big-endian.
--

commit ad510a6c4b7008ac7d33a168936259e5f8400da7
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cper: Add CPER structures and trace event

Define packed data structures and Intel-specific GUID macros needed
to build Intel GPU CPER (Common Platform Error Record) non-standard
records.

> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_c=
per_types.h
> new file mode 100644
> index 0000000000000..82167ea4eb161
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
[ ... ]
> +struct xe_cper_sec_intel_err_hdr {
> +	/** @error_class: Error classification (type, component, location, caus=
e) */
> +	union {
> +		struct {
> +			/** @error_class.error_type: RAS error severity */
> +			u8  error_type;
> +			/** @error_class.error_component: IP block that raised the error */
> +			u8  error_component;
> +			/** @error_class.tile: Tile number */
> +			u8  tile;
> +			/** @error_class.instance: Instance within the tile */
> +			u32 instance;
> +			/** @error_class.cause: Error cause code */
> +			u32 cause;
> +			/** @error_class.reserved: Reserved, must be zero */
> +			u8  reserved;
> +		} error_class;
> +		/** @class: Raw byte view of the error class */
> +		u8 class[12];
> +	};
> +	/** @first_timestamp: Timestamp of the first occurrence of this error c=
lass */
> +	u64 first_timestamp;

[Severity: Medium]
Can this native u64 type break the CPER binary layout on big-endian=20
architectures?

The CPER standard dictates a strict binary layout and requires multi-byte f=
ields
to be little-endian. Using architecture-dependent native integer types like=
 u64
causes the struct's binary representation to vary based on host endianness,
which can produce corrupted CPER records on big-endian architectures.

Should this use explicitly sized and endian-specific types like __le64?

> +	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
> +	u32 sig_id;
> +	/** @error_count: Number of times this error has been observed */
> +	u32 error_count;
> +	/** @valid_bits: Bitmask indicating which header fields are populated */
> +	union {
> +		struct {
> +			/** @valid_bits.location: @error_class field is valid */
> +			u16 location		: 1;

[Severity: Medium]
Will this compiler-dependent bitfield cause ABI corruption?

Since bitfield layout is compiler- and architecture-dependent, it breaks the
exact bit-level binary layout required for the CPER standard.=20

Should this be handled with standard bitwise operations instead?

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_trace_cper.h b/drivers/gpu/drm/xe/xe_t=
race_cper.h
> new file mode 100644
> index 0000000000000..6d2dbf5048884
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_trace_cper.h
[ ... ]
> +	TP_printk("dev=3D%s severity=3D%d platform_id=3D%pU fru_id=3D%pU "

[Severity: Medium]
Does this tracepoint format guid_t fields incorrectly?

The printk format specifier %pU defaults to %pUb, which formats UUIDs in
big-endian byte order (RFC 4122). However, guid_t represents little-endian
UUIDs.

Using %pU instead of %pUl causes the first three components of the GUID to =
be
incorrectly byte-swapped in the trace output, presenting a corrupted GUID to
userspace consumers.

> +		"intel_err_hdr_raw=3D%s cper_len=3D%u cper_raw=3D%s",
> +		__get_str(dev), __entry->sev,
> +		__entry->platform_id, __entry->fru_id,
> +		__print_hex(__entry->ihdr_raw,
> +		    sizeof(struct xe_cper_sec_intel_err_hdr)),
> +		__entry->cper_len,
> +		__print_hex(__get_dynamic_array(cper),
> +		    __entry->cper_len))
> +);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825175916.1103=
841-13-badal.nilawar@intel.com?part=3D3
