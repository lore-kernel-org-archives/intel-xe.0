Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0990B606A324
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 10:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oDTAK6hL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A605410E595;
	Thu, 19 Nov 2026 10:47:57 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E670210E595
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 10:47:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 969F74662F;
 Thu, 19 Nov 2026 10:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506D11F000C4;
 Thu, 19 Nov 2026 10:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795085271;
 bh=H1v0nqci8q/GxDriGPoJCaLF3Md9rnPgS9Fb3UYkmPU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=oDTAK6hLyd1c6jh60oAgnGQWz3hd2u/NDOjz95qBaspd+4NhUc/mgG99CVwqQ1VDo
 jvIBumecZLbND6Xql0L+xwkETNG394v4hYl5w+EC1z9eyZ3w3f5w7OXslE2Q9ACzTN
 2tjIT0vvNOpDeudY9zhoTUm8BF9Dah1f6Sxs88akWHV6gVwh8KX5oqNtPZfSruiC4Z
 8adlz2YlARQQL4GnFTA7YXClUvUWswdaChvG2QfSvAW9p5FZbnnhcae/2Hdj7NjnCc
 ZaRR7M4PA61I6AkOLBQJHL1A9t2nNBLOoZfptwx33oBQudVdx7Q8uqJDzfBQI8MOAs
 t1MXUoaHFDTrA==
Message-ID: <sashiko-outbox-222985@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/hwmon: Expose powerX_cap_max
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261119104029.3066660-1-karthik.poosa@intel.com>
References: <20261119104029.3066660-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:47:50 +0000
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

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] drm/xe/hwmon: power limit clamped to 0 in
  xe_hwmon_power_max_write() [1]
--

commit 26f9457c44502cd969a84eaf5b2ee961f51b7a3e
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Expose powerX_cap_max

This commit adds a read-only power<i>_cap_max sysfs attribute on platforms
with mailbox power limits to report the default PL2 (burst) power limit
set by firmware at boot.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index defe8aaca7c11..8e0d295aabc88 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> @@ -1423,6 +1424,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u=
32 attr, int channel)
>  	struct xe_mmio *mmio =3D xe_root_tile_mmio(hwmon->xe);
> =20
>  	switch (attr) {
> +	case hwmon_power_cap_max:
> +		return hwmon->pl2_on_boot[channel] ? 0444 : 0;

[Severity: High]
This problem wasn't introduced by this patch, but can a pcode read failure
during probe cause xe_hwmon_power_max_write() to clamp user power limits
to 0 [1]?

If reading the initial power limits in xe_hwmon_get_preregistration_info()
fails, pl1_on_boot[] and pl2_on_boot[] remain zero while hwmon registration
still proceeds:

drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_get_preregistration_info() {
	if (hwmon->xe->info.has_mbx_power_limits) {
		if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
						    &hwmon->pl1_on_boot[CHANNEL_CARD]) |
		    ...
		    xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_PKG,
						    &hwmon->pl2_on_boot[CHANNEL_PKG])) {
			drm_warn(&hwmon->xe->drm,
				 "Failed to read power limits, check GPU firmware !\n");
		} else {
}

If the subsequent pcode read in xe_hwmon_power_is_visible() succeeds, the
writable powerX_max and powerX_cap attributes are exposed, and any value
userspace writes is clamped to the zeroed pl1_on_boot[] or pl2_on_boot[]
entry in xe_hwmon_power_max_write(), programming a 0W power limit into
firmware and severely throttling the GPU.

[1] https://sashiko.dev/#/bug/linux-9f11cfb5-f9c5-490e-879e-791ecaae33e5

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119104029.3066=
660-1-karthik.poosa@intel.com?part=3D1
