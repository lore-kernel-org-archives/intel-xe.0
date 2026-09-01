Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03E8C61DD3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 16:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E52E10E417;
	Tue,  1 Sep 2026 16:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N7IsdiYZ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD3510E417
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 16:53:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5A12C4132E;
 Tue,  1 Sep 2026 16:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B451F00A3A;
 Tue,  1 Sep 2026 16:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788281614;
 bh=DQ2ba3brHUdJ6EjRtv7sEkdwAyh8OT+O3v7oTij26Rg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=N7IsdiYZ91pyOhD/mLRgW60Z4nfw+dSP4HTEelI0hvW1dGQIQPdsqpc2kFZ1ZNhfC
 BTcE6MMRvNdpacaf31pytAaXeV3DW5MoX3kmo/VDyI2jPggzHZPU2NlbH8v+BSIcWv
 V0303tq2pYQhoreKvJuMQLTPZI1SWVcsZoQXCp9fk2t2slcvWnAyNNGgvjE3mZVBAY
 l4vG2az/uWSWdFV8dL/SdUicyI2DZCSa/AJTfgdw6ihPQWkkWD8ZPl7LLyxrFb4l4+
 WtkMpKm6lUA+tQbfY8EhicTMGOpVah/flYb8sNWUyjTY6PpylEijs0YReoqM7llyKp
 9yNHyFoh3BVng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260901164435.1395260-3-piotr.piorkowski@intel.com>
References: <20260901164435.1395260-1-piotr.piorkowski@intel.com>
 <20260901164435.1395260-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 16:53:33 +0000
Message-Id: <20260901165334.10B451F00A3A@smtp.kernel.org>
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
- [High] Integer overflow in GGTT bounds check enables out-of-bounds memory=
 access.
--

commit f9f8d4706aa1161e82f40e54588776b342483570
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode

This commit separates GGTT range discovery from pool setup and initializes
the usable and shareable pools based on the SR-IOV mode.

> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index fa77abbb3cd5a..7d22b0cbcaec6 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
[ ... ]
> +static int ggtt_get_range_from_guc(struct xe_ggtt *ggtt, u64 *start, u64=
 *size)
> +{
> +	struct xe_device *xe =3D tile_to_xe(ggtt->tile);
> +	u64 wopcm =3D xe_wopcm_size(xe);
> +
> +	*start =3D xe_tile_sriov_vf_ggtt_base(ggtt->tile);
> +	*size =3D xe_tile_sriov_vf_ggtt(ggtt->tile);
> +
> +	if (*start < wopcm || *start + *size > GUC_GGTT_TOP) {

[Severity: High]
This isn't a bug introduced by this patch, but is there a risk of an integer
overflow occurring in this bounds check?

If a compromised PF or malicious GuC firmware provides extremely large valu=
es
for the start and size parameters via GUC_KLV_VF_CFG_GGTT_START_KEY, could
*start + *size wrap around to a small value? If this happens, the sum might
evaluate to less than GUC_GGTT_TOP, which would successfully bypass this
boundary check despite being invalid.

If bypassed, the overflowed start address would later be applied as an
offset during operations like xe_ggtt_insert_node(). This could result in
indexing out-of-bounds into the ggtt->gsm array, leading to kernel memory
corruption or a kernel panic. In Confidential Compute environments, this
might provide a host-to-guest escalation vector.

> +		xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
> +			    *start, *start + *size - 1);
> +		return -ERANGE;
> +	}
> +
> +	return 0;
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901164435.1395=
260-1-piotr.piorkowski@intel.com?part=3D2
