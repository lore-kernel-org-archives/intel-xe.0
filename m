Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCA5606A326
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 04:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bt+eOnv6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E14510E114;
	Wed, 11 Nov 2026 04:38:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AFA10E114
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 04:38:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F15686142B;
 Wed, 11 Nov 2026 04:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C1651F0093C;
 Wed, 11 Nov 2026 04:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794371929;
 bh=AlliTxJZEAWWia5t7lJIehKvXb0HiWbRjAsMyd4214o=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=bt+eOnv6tkalb/8Ma7f0LdzFOH8BzECj4I5pmGFdlWPNwCxWe2mGzoaGNwBgTvyjE
 MQbjdguxuU+yamBLXrPa8T2eYjlEfy7kvgo+OW4aOtiZ7WnQa+NgT8JYtOHXJ2h/3c
 2FArWAc5l4fGqHZNdzxUo6jqW6bponBH8nkfcIRp25uko9C/xFA+0VkEO8kX87fW3O
 TF8yPR3gLnk6G7wpUOqiqKJMwlU/BK+dRLxIGWw98aqbwkK4Q2lWZR3R/OBo/HfAyd
 cR5GOf3BkPX9viVfxaqHrPVZiR69/Jwtk0wWn6kpRxXKJTVwqR39BKPXrVuuBPIaZk
 eqM36RyfBaDaQ==
Message-ID: <sashiko-outbox-208305@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/11] drm/xe: Require a fully visible VRAM BAR without
 a primary GT
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261110231442.218721-23-stuart.summers@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
 <20261110231442.218721-23-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 04:38:49 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/xe: NULL deref of tile->primary_gt in tile_vram_size() in
  xe_vram_probe()
--

commit 5c01d4a69cb121bc624de632e7f741dd67a3eabc
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe: Require a fully visible VRAM BAR without a primary GT

This commit rejects device probe in xe_vram_probe() if a tile has no
primary GT and its VRAM BAR is smaller than the tile's usable VRAM size.

> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 1c02889ba29b2..4d399a83479ef 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
[ ... ]
> @@ -346,6 +347,20 @@ int xe_vram_probe(struct xe_device *xe)
>  		if (err)
>  			return err;
> =20
> +		/*
> +		 * Without a primary GT there is no copy engine, so VRAM is
> +		 * moved with the CPU through the BAR.  That only works if the
> +		 * BAR covers all of it.
> +		 */
> +		if (!tile->primary_gt &&
> +		    tile->mem.vram->io_size < tile->mem.vram->usable_size) {
> +			xe_tile_err(tile,
> +				    "VRAM is not fully CPU visible (%pa of %pa); a resizable BAR is =
required without a primary GT\n",
> +				    &tile->mem.vram->io_size,
> +				    &tile->mem.vram->usable_size);
> +			return -ENODEV;
> +		}
> +
>  		if (total_size > lmem_bar.io_size) {
>  			xe_log_info(xe, VRAM,
>  				    "Total size %#llx is larger than resource %#llx\n",

[Severity: High]
Can xe_vram_probe() reach this !tile->primary_gt check when
xe->info.has_flat_ccs is set, or does tile_vram_size() dereference a NULL
tile->primary_gt first?

Earlier in the same loop, xe_vram_probe() calls tile_vram_size(), which
passes tile->primary_gt to get_flat_ccs_offset():

drivers/gpu/drm/xe/xe_vram.c:tile_vram_size() {
	struct xe_device *xe =3D tile_to_xe(tile);
	struct xe_gt *gt =3D tile->primary_gt;
...
	if (xe->info.has_flat_ccs) {
		int ret =3D get_flat_ccs_offset(gt, *tile_size, &offset);
}

When a discrete GPU with Flat-CCS (such as Battlemage) is probed with
gt_types_allowed=3Dmedia via configfs, xe->info.has_flat_ccs remains set
while tile->primary_gt is NULL, and get_flat_ccs_offset() immediately
dereferences gt via gt_to_xe(gt) and gt_to_fw(gt).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110231442.2187=
21-13-stuart.summers@intel.com?part=3D10
