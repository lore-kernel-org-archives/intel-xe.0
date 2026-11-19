Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486CF606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 00:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=On50cq4E
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EAC10ECF9;
	Thu, 19 Nov 2026 00:09:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A53210ECF9
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 00:09:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 31F6843269;
 Thu, 19 Nov 2026 00:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20F91F000C4;
 Thu, 19 Nov 2026 00:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795046963;
 bh=dXWPAd34kgxbyGowuwR2K6K9x5gIy8WAMudygfgqw5I=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=On50cq4EQg2XuJ/k/TfG9lAUXvmXHBUBuSa4qvdIHxVQH+dXD5QYecZ4OrMs8+AFA
 MLccB8B5Zd5Hwf/WlxxA+DGTgW98S3cx0KvCBR7r4p4956XtNj89Ae/e9i+HPPA0iG
 ygs6ThB8PkNEF7pBSU8uAunpDTjAqnCWVxCE/WTy0TcPdeydG1jTy/Reh9iFqk3Uaq
 tsALcxR0oCAGosPJ3NP3WD5OrPaCurq37BgI7/abVym8J742TN3JL9xVov4SRnz4b7
 uAjlCvTMupkO2AsvqPvePBO8Q6hrweKuTTCTJhz6VwxdXWwAMC62ZZwYnvQ+bGivxQ
 zMsPuc4+TBo1A==
Message-ID: <sashiko-outbox-222233@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] vfio: Allow untainted use of driver_override
To: "Alex Williamson" <alex@shazbot.org>
Cc: linux-trace-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, kvm@vger.kernel.org, "Michael
 S. Tsirkin" <mst@redhat.com>, "Eugenio Perez" <eperezma@redhat.com>
In-Reply-To: <20261118235645.2907908-2-alex@shazbot.org>
References: <DMYH4ED3GWDO.29DGXPK4M82VR@kernel.org>
 <20261118235645.2907908-2-alex@shazbot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 00:09:22 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] vfio: build failure due to missing support_driver_override in
  device_driver
- [Medium] vfio: missing support_driver_override on s390 vfio_ccw and
  vfio_ap drivers
--

commit e1a4bdaaf4e34e9a150096261c67507d2bd63625
Author: Alex Williamson <alex@shazbot.org>

vfio: Allow untainted use of driver_override

This commit sets the support_driver_override flag on the embedded device
driver structures across vfio drivers so that binding devices via
driver_override continues to work without tainting the kernel.

> Set the support_driver_override flag on the driver struct across all
> vfio drivers.

[Severity: Medium]
Should the s390 vfio drivers outside drivers/vfio/ also set
support_driver_override?

Both vfio_ccw_sch_driver in drivers/s390/cio/vfio_ccw_drv.c and
vfio_ap_drv in drivers/s390/crypto/vfio_ap_drv.c bind to devices via
device_match_driver_override() on css_bus_type and ap_bus_type, so
omitting them will deny or taint driver_override bindings for vfio_ccw
subchannels and vfio_ap queues.

> diff --git a/drivers/vfio/cdx/main.c b/drivers/vfio/cdx/main.c
> index 28dc8c8256006..fb7679bf92fd3 100644
> --- a/drivers/vfio/cdx/main.c
> +++ b/drivers/vfio/cdx/main.c
> @@ -358,6 +358,7 @@ static struct cdx_driver vfio_cdx_driver =3D {
>  	.match_id_table	=3D vfio_cdx_table,
>  	.driver	=3D {
>  		.name	=3D "vfio-cdx",
> +		.support_driver_override =3D true,
>  	},
>  	.driver_managed_dma =3D true,
>  };

[Severity: High]
Is this missing the prerequisite driver-core patch that adds
support_driver_override to struct device_driver?  In this tree, struct
device_driver in include/linux/device/driver.h has no
support_driver_override member, so building any of the 13 modified vfio
drivers fails with an unknown field in initializer error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118235645.2907=
908-2-alex@shazbot.org?part=3D1
