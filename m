Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C7CC79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 10:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C7810E487;
	Mon,  7 Sep 2026 10:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UnZMGW+l";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079A710E3F8;
 Mon,  7 Sep 2026 10:45:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 975994339E;
 Mon,  7 Sep 2026 10:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D541F00A3D;
 Mon,  7 Sep 2026 10:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788777925;
 bh=eSWtyIq3KleMlhPGThxF5FrbC67TZc69SWmeHzHzDRc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=UnZMGW+lPaKPEkp8ZY1e3KUjuLa9sqpornehOlwLSqp1LZ+jeT28g/SxjptX4/79a
 0BhhWDO5KGASpiCRP6JNkHmziF5UBGMtL1bkoETltLiv1+k7Ifa3M8UhWfQ1MGTLyj
 gBRD5BZ5QvI1j/qHay8P57Qg6rR2ik6D5J4Bmz1YGVeLjKvSHxcHZhBY6ZXRt+apvk
 HoYC6+bkaqtgiDjKF3rvroeeHSN0Pj1J14zIvUgz28gH7Mrd0+vO82b4lnc/bAczEK
 2UrPJDh7OQ9Jv0EgJEXo58PsDGdu0br3vJXvDhRf/J95KDPmbrIsCzCzNyCx0YRauD
 nfiap91qkkHwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/i915/dmc: Prevent fw_size multiplication
 overflow
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260907103731.1379922-6-dibin.moolakadan.subrahmanian@intel.com>
References: <20260907103731.1379922-4-dibin.moolakadan.subrahmanian@intel.com>
 <20260907103731.1379922-6-dibin.moolakadan.subrahmanian@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 10:45:24 +0000
Message-Id: <20260907104525.42D541F00A3D@smtp.kernel.org>
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
- [High] Allocating a 0-sized firmware payload results in a `ZERO_SIZE_PTR`=
 dereference, causing a kernel crash.
- [High] Integer underflow in MMIO count loop causes a massive out-of-bound=
s read and potential crash.
--

commit c888be66e6182bdd47cd31d900f609af76cef7a1
Author: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.=
com>

drm/i915/dmc: Prevent fw_size multiplication overflow

This commit validates the conversion of the DMC firmware size from dwords to
bytes using check_mul_overflow(). This prevents a potential integer overflow
when calculating the firmware payload size.

Fixes: eb805623d8b1 ("drm/i915/skl: Add support to load SKL CSR firmware.")
Cc: stable@vger.kernel.org
Assisted-by: Claude-Code:Sonnet-5
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian=
@intel.com>

> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i=
915/display/intel_dmc.c
> index 051b721a08959..228a1b2967336 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -1178,7 +1178,12 @@ static u32 parse_dmc_fw_header(struct intel_dmc *d=
mc,
>  	rem_size -=3D header_len_bytes;
> =20
>  	/* fw_size is in dwords, so multiplied by 4 to convert into bytes. */
> -	payload_size =3D dmc_header->fw_size * 4;
> +	if (check_mul_overflow(dmc_header->fw_size, 4u, &payload_size)) {
> +		drm_err(display->drm, "DMC fw_size too large (%u dwords)\n",
> +			dmc_header->fw_size);
> +		return 0;
> +	}
> +

[Severity: High]
This is a pre-existing issue, but does this code handle a payload_size of
0 safely?

If a firmware file has fw_size =3D=3D 0, payload_size will be 0. Later in
parse_dmc_fw_header() in drivers/gpu/drm/i915/display/intel_dmc.c, this
results in:

    dmc_info->payload =3D kmalloc(payload_size, GFP_KERNEL);

When payload_size is 0, kmalloc() returns ZERO_SIZE_PTR (address 16),
not NULL.=20

Then, assert_dmc_loaded() unconditionally reads from the payload pointer:

    expected =3D dmc->dmc_info[dmc_id].payload[0];

Can this cause a kernel crash when dereferencing the ZERO_SIZE_PTR?

[Severity: High]
This isn't a bug introduced by this patch, but does parse_dmc_fw_header()
safely handle an mmio_count of 0?

In parse_dmc_fw_header() in drivers/gpu/drm/i915/display/intel_dmc.c, the
loop for processing mmio entries looks like:

    for (i =3D 0; i < mmio_count - 1; i++) {
        u32 orig_mmiodata[2] =3D {
            dmc_info->mmiodata[i],
            dmc_info->mmiodata[i+1],
        };
        ...

If the parsed firmware header has mmio_count =3D=3D 0, the loop condition
underflows to UINT_MAX. Could this cause a massive out-of-bounds read
when accessing dmc_info->mmiodata[i]?

>  	if (rem_size < payload_size)
>  		goto error_truncated;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907103731.1379=
922-4-dibin.moolakadan.subrahmanian@intel.com?part=3D2
