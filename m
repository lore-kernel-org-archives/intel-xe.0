Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FB6C61DBC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3AC10E205;
	Tue, 25 Aug 2026 17:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LbfRuGTZ";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFD810E205
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:53:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D746760053;
 Tue, 25 Aug 2026 17:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7271F000E9;
 Tue, 25 Aug 2026 17:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787680397;
 bh=GoifAGu6OXmSut9RFckKb9qZA+vVuni5DElK/Mbohzs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=LbfRuGTZpRmo2B339Q0hzH7vSSGSODKTk83euZ2J4B8bEO3iE6fvPS2LXEUcztK6g
 xNK8eRpk/uewwGn8fSSPGy37D6TEeU7cbH+eFKMEZVkn4iCZ0Bqz1T9Bkc5tpNL3dx
 101rdeV3BsQG1GiloT7sKa8S6lo/UQgkxlo/n2lGtsTuZdvcXKd335Rp73nhNaXOOa
 ALaiwRBaH/qJPtn8vS35oMQAb2H/KGbHTQfQJQ0Uixj3wwY8AZTZTXeddemXM0Y+m6
 wFR0SDYRBfPDRIZo8qdsznOZXssTvXyUcigz+bMmB7Hsetg+od5DU6inGlnNdmv0Xc
 mvSZzoJgnnzmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/11] drm/xe/xe_ras: Add support to retrieve info
 queue data for CRI
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825175916.1103841-14-badal.nilawar@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-14-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:53:16 +0000
Message-Id: <20260825175317.6C7271F000E9@smtp.kernel.org>
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
- [Medium] Unportable use of C bitfields inside a packed structure for a fi=
rmware message interface.
- [Low] The patch introduces a static function `get_info_queue_data` withou=
t any callers, causing a `-Wunused-function` compiler warning that breaks t=
he build.
--

commit 82a6804e91047f9e3f922cd878001d1bc3e9d8ed
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/xe_ras: Add support to retrieve info queue data for CRI

This commit adds support to retrieve info queue data. It introduces
various structures for the info queue data request and response, and adds
a function to send the command to the system controller.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index d25d25f775310..6830872354825 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -661,6 +661,40 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 se=
verity, u8 component)
>  	return 0;
>  }
> =20
> +static int get_info_queue_data(struct xe_device *xe,
> +			       const struct xe_ras_get_info_queue_data_request *req,
> +			       struct xe_ras_get_info_queue_data_response *out)

[Severity: Low]
Does this function have any callers in this patch?

Adding a static function without using it in the same patch will cause a
-Wunused-function compiler warning, which breaks the build when compiling
with -Werror. To maintain git bisect functionality, every intermediate patch
should compile independently.

Could get_info_queue_data() be introduced in the patch that first uses it,
or temporarily marked with __maybe_unused?

> +{
> +	struct xe_ras_get_info_queue_data_response response =3D {0};
> +	struct xe_sysctrl_mailbox_command command =3D {0};
> +	size_t rlen;
> +	int ret;
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ra=
s_types.h
> index 99b2466e2062c..d87db9f5174a2 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
[ ... ]
> @@ -95,6 +99,109 @@ struct xe_ras_threshold_crossed {
>  	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>  } __packed;
> =20
> +/**
> + * struct xe_ras_info_queue_header - Metadata for large info queue data =
transfers
> + *
> + * Provides chunk metadata for commands that support extended info queue
> + * functionality. Used when the total data exceeds a single mailbox resp=
onse.
> + */
> +struct xe_ras_info_queue_header {
> +	/** @total_size: Total size of the complete info queue data in bytes */
> +	u32 total_size;
> +	/** @chunk_offset: Offset of this chunk within the total data in bytes =
*/
> +	u32 chunk_offset;
> +	/** @chunk_size: Size of the data in this chunk in bytes */
> +	u32 chunk_size;
> +	/** @sequence_number: Sequence number for this chunk, starts at 0 */
> +	u32 sequence_number;
> +	/** @flags: Info queue control flags (RAS_INFO_QUEUE_FLAG_*) */
> +	u32 flags:8;
> +	/** @compression_type: Compression algorithm used; 0 =3D none */
> +	u32 compression_type:4;
> +	/** @num_headers: Number of detailed counter headers at start of queue_=
data */
> +	u32 num_headers:5;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:15;

[Severity: Medium]
Are these C bitfields safe to use for a firmware message interface?

When the driver communicates with the firmware on a big-endian architecture
or using a compiler with different bitfield ordering rules, the bitfields
in xe_ras_info_queue_header will map to the wrong bits in the underlying
32-bit word.

Using C bitfields inside a __packed struct for a hardware/firmware ABI is
generally avoided because their memory layout is compiler-dependent and
endian-dependent. Would it be safer to use fixed-width types like u32
along with FIELD_GET() and FIELD_PREP() macros?

> +	/** @checksum: CRC32 checksum of this chunk data */
> +	u32 checksum;
> +} __packed;
> +
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825175916.1103=
841-13-badal.nilawar@intel.com?part=3D1
