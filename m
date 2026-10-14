Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3163CCC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 14:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08DF10E152;
	Wed, 14 Oct 2026 14:47:15 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA5910E152
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 14:47:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0113B600DA;
 Wed, 14 Oct 2026 14:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977F31F000C4;
 Wed, 14 Oct 2026 14:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791989228;
 bh=criKJCZpmes6c7YgqZqJVc+eccKVnkmAkKDu2pJbanQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=cFXTfny3IQGl9UP12IoOf5WLMUA4KRV6en564/+FdqnZP4IRO8OBcmCNv5EuspoZi
 VdIi2igRnqLbhhBF1GgOgVLyJ6myNi5TlBJXWJKAvhdU8h8LFaSqFWDzQPEDNWb6Gs
 ex0fFwsxKXFrZBcXIfxHE2yWFxNPNHFTcWlIcvm61+DDo3w0I4ZdT8ezkZyjd2XYpi
 1t5Z9T/5oRo3zayI1ioafyLGxeYN6nQUuR3vm6os0368MBjHrJd3u2HRuWPDPjsvge
 QN4Csh62Om0vUUMoBehgqLx39Jl8bIqclL009xTt9Msiiei+XDNmehn9evVbmJkVjJ
 Yqyq7aafx32AQ==
Message-ID: <sashiko-outbox-171444@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] drm/xe/xe_migrate: Fix page tracking in
 access_memory
To: "Jan Maslak" <jan.maslak@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261014142706.598490-2-jan.maslak@intel.com>
References: <20261014142706.598490-1-jan.maslak@intel.com>
 <20261014142706.598490-2-jan.maslak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 14:47:08 +0000
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
- [High] drm/xe: DMA mapping leak due to unsafe 0 address check
--

commit fb4208eca07c762dce441a27786ec36c6738057d
Author: Christoph Manszewski <c.manszewski@gmail.com>

drm/xe/xe_migrate: Fix page tracking in access_memory

xe_migrate_access_memory() advances the pagemap cursor based on the current
page in the CPU buffer. Include the initial page offset when recalculating
current_page so subsequent iterations continue to index the mapped pages
correctly.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index fffb3eb6c76eb..3711d4542ad3d 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -2563,7 +2563,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, =
struct xe_bo *bo,
> =20
>  		buf +=3D current_bytes;
>  		offset +=3D current_bytes;
> -		current_page =3D (int)(buf - orig_buf) / PAGE_SIZE;
> +		current_page =3D (int)(buf - orig_buf + page_offset) / PAGE_SIZE;

[Severity: High]
Does this code leak DMA mappings when the DMA subsystem returns 0 as a valid
DMA address?

In the out_err block of xe_migrate_access_memory() in
drivers/gpu/drm/xe/xe_migrate.c, we unconditionally call
xe_migrate_dma_unmap():

out_err:
	xe_migrate_dma_unmap(xe, pagemap_addr, len + page_offset, write);

However, if xe_migrate_dma_unmap() encounters an IOVA of 0, it stops unmapp=
ing
early:

	if (!pagemap_addr[i].addr)
		break;

Since 0 is explicitly allowed as a valid DMA address by the DMA API (errors
are handled via dma_mapping_error()), this early break can cause the unmap
loop to terminate incorrectly. This would permanently leak the mapping for 0
and all subsequent valid mapped pages in the array. Can this eventually
exhaust IOMMU or DMA space?

>  		bytes_left -=3D current_bytes;
>  		if (bytes_left)
>  			xe_res_next(&cursor, current_bytes);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014142706.5984=
90-1-jan.maslak@intel.com?part=3D1
