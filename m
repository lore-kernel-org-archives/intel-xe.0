Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA8DC982D0
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 20:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760F310E3C2;
	Wed, 16 Sep 2026 20:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UBvsZtvN";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC19E10E3C2
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 20:29:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B3CA0437B0;
 Wed, 16 Sep 2026 20:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9A41F000FF;
 Wed, 16 Sep 2026 20:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789590583;
 bh=tDgiw+JTefePFHDubHgwxbPovcO1vOt4TWQJdOl8a2o=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=UBvsZtvNpv8qaHjJblVOXFYfUYqU9iePAY1Qr/8G2GCvr6S7jc7nBTKooggyqLBRQ
 dlBdmRga+UD1USaCHGHk/56cfuwueEkTSDwHgg0Vop39zhZnq90nY3NAPIaVwpoYnZ
 z1oNBiDD0Nfw0vx6NIMEVwGFagStAOg4Qgs2BpnwqOD+BUKAHAA97Z9DI3hUjwjmke
 ve77ZHC35X8ipO8UxCDMEQjpPWWdJkQZivqDloGZAgbaDUI2KQRn/0LopGOKgL5NzR
 EYxx2sl/aOBswH4Bb6TpaHdy3VY2CJM071ST4Hvc28kSpQUCwCiEldeVikXR0W2N7A
 pYdUAV/RjFzbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 09/20] drm/xe/vsec: Add DOC text for VSEC
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260916201139.2374531-31-michael.j.ruhl@intel.com>
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
 <20260916201139.2374531-31-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 20:29:43 +0000
Message-Id: <20260916202943.6C9A41F000FF@smtp.kernel.org>
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
- [Low] drm/xe: documentation mismatch in xe_pmt_telem_read() returns
- [Low] drm/xe: typo 'setup up' in VSEC DOC text
--

commit 736841e08f59ea271b755582813f79005c246879
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Add DOC text for VSEC

Add the necessary files and text to use the DOC system.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 1cb9a78ee0efd..ca5d02dce8189 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -19,6 +19,17 @@
> =20
>  #include "regs/xe_pmt.h"
> =20
> +/**
> + * DOC: VSEC
> + *
> + * Some GPUs support the PMT feature.  For those that do, this API provi=
des
> + * probe, discovery and usage (control and access) for GPUs that have PM=
T.
> + *
> + * PMT is usually accessed through a PCI function.  However, that is not=
 always
> + * available, so the PMT intel_vsec_register() function can be used to s=
etup up
                                                                         ^^=
^^^^^^

[Severity: Low]
This isn't a bug, but there is a typo (setup up) in the newly added VSEC
documentation header.

> + * PMT usage.
> + */
> +

[ ... ]

> @@ -140,6 +151,18 @@ static int xe_guid_decode(u32 guid, int *index, u32 =
*offset)
>  	return 0;
>  }
> =20
> +/**
> + * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a b=
uffer
> + * @dev: valid Xe device
> + * @guid: PMT GUID (from the PMT discovery struct)
> + * @data: buffer to place data in
> + * @user_offset: a user offset relative to the beginning of the data to =
read
> + * @count: bytes to read
> + *
> + * Return:
> + * * -EINVAL for VF and PMT WATCHER requests
> + * * count   number of bytes read on success
> + */

[Severity: Low]
Is this documentation entirely accurate?

It claims to return -EINVAL for VF requests, but xe_pmt_telem_read() actual=
ly
uses an assertion (xe_assert) instead.

Additionally, the documentation completely omits the -ENODEV (from invalid
device IDs) and -ENODATA (from xe_pm_runtime_get_if_active failures) return
values.

>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t us=
er_offset,
>  		      u32 count)
>  {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916201139.2374=
531-22-michael.j.ruhl@intel.com?part=3D9
