Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6DF60A3838
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 06:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IRuidHMR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921B910E2FD;
	Wed, 11 Nov 2026 06:00:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F58010E36F
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 06:00:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6E49141E5D;
 Wed, 11 Nov 2026 06:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B451F00A08;
 Wed, 11 Nov 2026 06:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794376830;
 bh=S1n9FDPT2nwUPXSUYJG3pxCHS5BOCnZe2kfgaEwSXfA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=IRuidHMRC3OqAirYsxJwZ0H7vkuhT+2N5cGvk0/LRscql9WJEbrn27RG2J0wWdBXM
 CDnQ5v4e8HAcsxuxtpQkAyI3k5uFrRgVTnnENGQh3Q4KEfl9F+U/OwhHghkMXDWOGr
 /k2cO6ttmRSAiqvcb9FG2Ny+cll+1pZ4/9h4T5A0Jx+ENmxNrtUjdk2JaVyG8NFlSN
 /jp2pMPinmSSB3Rx2JcBzlKVnDqgXPjhIYgbZ7goRPKJ2RDQc4V13n+ZIisfMzJ3Fm
 9gr3FdvqjXidl6jbPXpNpM+vXj2qatPs6cR11TOQ+ea0wP93iicLNCg22bExOzdl+x
 Ai5cocWD7mT1w==
Message-ID: <sashiko-outbox-208375@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/cri: Add new PCI IDs
To: "Ranu Maurya" <ranu.maurya@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261111055020.866766-1-ranu.maurya@intel.com>
References: <20261111055020.866766-1-ranu.maurya@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 06:00:29 +0000
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
- [Medium] drm/xe/cper: missing xe_device_guids entries for new CRI PCI
  IDs
--

commit 61a3e0e92a66a1e015400ed3ae42a758a161459f
Author: Ranu Maurya <ranu.maurya@intel.com>

drm/xe/cri: Add new PCI IDs

This commit adds four new Crescent Island (CRI) PCI device IDs (0x6753,
0x6754, 0x6755, and 0x6756) to INTEL_CRI_IDS.

> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> index ac858ed26df2e..ab02bef262f14 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -906,7 +906,11 @@
>  	MACRO__(0x674F, ## __VA_ARGS__), \
>  	MACRO__(0x6750, ## __VA_ARGS__), \
>  	MACRO__(0x6751, ## __VA_ARGS__), \
> -	MACRO__(0x6752, ## __VA_ARGS__)
> +	MACRO__(0x6752, ## __VA_ARGS__), \
> +	MACRO__(0x6753, ## __VA_ARGS__), \
> +	MACRO__(0x6754, ## __VA_ARGS__), \
> +	MACRO__(0x6755, ## __VA_ARGS__), \
> +	MACRO__(0x6756, ## __VA_ARGS__)

[Severity: Medium]
Should xe_device_guids[] in drivers/gpu/drm/xe/xe_cper.c also be updated
with platform_id GUID entries for 0x6753, 0x6754, 0x6755, and 0x6756?

xe_device_guids[] only lists CRI device IDs 0x674C through 0x6752.  When
cper_init_record_hdr() calls lookup_device_guid() on a CRI device with one
of the new PCI IDs, the lookup fails, logs a warning ("CPER: no platform
GUID for device"), and leaves rhdr->platform_id unset in emitted CPER
records.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111055020.8667=
66-1-ranu.maurya@intel.com?part=3D1
