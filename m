Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2467AC88E7D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 18:00:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF71C10E440;
	Tue, 15 Sep 2026 18:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="irgpWzA3";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D2610E440
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 18:00:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0C6CA438BA;
 Tue, 15 Sep 2026 18:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37081F000FF;
 Tue, 15 Sep 2026 18:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789495227;
 bh=nuSeET/u8GaT7MEbkhGRFrjSUb2wzaXwSRYmhZMWHG0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=irgpWzA3UJEFMnGcxGgZC0DuQC/rML7LinV7oD1zhmrQMGwhsexxbKq5Wpbs361Nh
 q66yy/GNEz9V/e9EfW1F5HlINWCc0eQ94Sk8WyVrf2hfs1BT54OOe0uYil0CPuYaw6
 ZA8K3Npa5I9c6XlhvlAYhr16JpstmNACzcX/8vf2Endfe/M640TCcmuNzl/ML70Ogp
 F1isaNRMPGpun8/S2mgU05486DdZhBe2JP8fGmj35CxFsdCiszA2govY6CqRhnqwbu
 n7p0Nx2XBMwdh/CFmD1SIszaJ5KdA6Ii3+w8i1TTHDB6lfkAx1Pny7pDdOHP0Ws+Zr
 nZhhrtkLdt3Bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260915174840.531473-6-alan.previn.teres.alexis@intel.com>
References: <20260915174840.531473-4-alan.previn.teres.alexis@intel.com>
 <20260915174840.531473-6-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 18:00:27 +0000
Message-Id: <20260915180027.C37081F000FF@smtp.kernel.org>
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
- [High] drm/xe: infinite loop in zstd_compress_stream if output buffer fil=
ls
- [Medium] drm/xe: KASAN out-of-bounds read in xe_print_blob_ascii85 due to=
 unaligned buffer size
--

commit c797cc861f3e71f2974f41eee132c8271bc241da
Author: Zhanjun Dong <zhanjun.dong@intel.com>

drm/xe/guc: Compress GuC log and CTB dump with zstd

This commit replaces the raw ascii85 dumps of GuC log and CTB snapshots with
a zstd-compressed ascii85 stream. It adds the DRM_XE_COMPRESS_DUMP Kconfig
option to control this behavior, aiming to significantly reduce the size of
error dumps.

> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_=
log.c
> index 538d4df0f7aa7..aaeb0f76af305 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
[ ... ]
> @@ -225,16 +228,148 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_ca=
pture(struct xe_guc_log *log,
>  	return snapshot;
>  }
> =20
> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> +static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_pr=
inter *p,
> +					 const char *length_label, const char *data_label,
> +					 void **chunks, int num_chunks,
> +					 size_t chunk_size, size_t total_size)
> +{
[ ... ]
> +	dst_size =3D zstd_compress_bound(total_size);
> +	dst =3D kvzalloc(dst_size, GFP_KERNEL);

[Severity: Medium]
Will this allocate a buffer that is not 4-byte aligned? It appears dst_size
is determined by zstd_compress_bound(total_size) which is not guaranteed to
be a multiple of 4. When xe_print_blob_ascii85 is later called with a size
rounded up to 4 bytes, this can cause a KASAN out-of-bounds read.

> +	if (!dst)
> +		goto err;
[ ... ]
> +	remain =3D total_size;
> +	for (i =3D 0; i < num_chunks && remain; i++) {
> +		size_t size =3D min(chunk_size, remain);
> +		zstd_in_buffer inbuf =3D { .src =3D chunks[i], .size =3D size, .pos =
=3D 0 };
> +
> +		while (inbuf.pos < inbuf.size) {
> +			ret =3D zstd_compress_stream(cstream, &outbuf, &inbuf);
> +			if (ZSTD_isError(ret)) {

[Severity: High]
Can this loop spin infinitely if the output buffer fills up? The while loop
relies entirely on input consumption (inbuf.pos < inbuf.size) but lacks a
bailout condition or error check for when the output buffer (outbuf) is
full.=20

ZSTD explicitly documents that zstd_compress_bound() is not guaranteed to be
sufficient for streaming compression. If the output buffer fills and
zstd_compress_stream() consumes no input, would this cause a hard lockup?

> +				xe_gt_err(gt, "zstd_compress_stream failed: %s\n",
> +					  ZSTD_getErrorName(ret));
> +				goto err;
> +			}
> +		}
> +		remain -=3D size;
> +	}
> +
> +	do {
> +		ret =3D zstd_end_stream(cstream, &outbuf);
> +		if (ZSTD_isError(ret)) {
> +			xe_gt_err(gt, "zstd_end_stream failed: %s\n",
> +				  ZSTD_getErrorName(ret));
> +			goto err;
> +		}
> +	} while (ret > 0 && outbuf.pos < outbuf.size);
> +
> +	drm_printf(p, "%s.length: 0x%zx -> 0x%zx Algo: ZSTD\n",
> +		   length_label, total_size, outbuf.pos);
> +	xe_print_blob_ascii85(p, data_label, '\n', dst, 0,
> +			      DIV_ROUND_UP(outbuf.pos, sizeof(u32)) * sizeof(u32));

[Severity: Medium]
If outbuf.pos is close to dst_size and not a multiple of 4, will this
rounded-up size cause xe_print_blob_ascii85 to read beyond the KASAN
boundaries of the allocated buffer?

> +	goto out;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915174840.5314=
73-4-alan.previn.teres.alexis@intel.com?part=3D2
