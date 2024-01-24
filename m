Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D2DC48260
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 16:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9A910E7B8;
	Thu, 25 Jan 2024 16:01:17 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD00D10E0A9
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 14:21:55 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20240124141155euoutp01b468f9ecff0cc056752e24317f3cd0b2~tTe06JK9k1322413224euoutp01c;
 Wed, 24 Jan 2024 14:11:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20240124141155euoutp01b468f9ecff0cc056752e24317f3cd0b2~tTe06JK9k1322413224euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1706105515;
 bh=rq9B2MmFywGMdYeq0U61x4iI8FGznT8zDRuWcqrSdjY=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=LN0E6Fa2P1CvzfLsesKl/Lo0Qk8AbVfTPmEmmnxvnpwuflhO4qzFGPeJJO0aslr4E
 9rO1wIirC6V421IrJEVW0mmOyl7/tRiLcHHFetriq9Rqy2oIo3728o4MqG2wc/6gGr
 C5On7HPk3cwO7WUbERCLcUSdl3rbP62LoMaUOdUY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20240124141154eucas1p2f775656f11a6d5164d45c3f240915c6e~tTe0o1TAl1358513585eucas1p2P;
 Wed, 24 Jan 2024 14:11:54 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id DD.88.09539.AAA11B56; Wed, 24
 Jan 2024 14:11:54 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240124141154eucas1p260dc39467189e97abcca2efe7f50b598~tTe0Xx5Nf3122531225eucas1p2J;
 Wed, 24 Jan 2024 14:11:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240124141154eusmtrp155f8ba07a4019dc9cdd5dd1c39927b6b~tTe0XQOwL2686826868eusmtrp11;
 Wed, 24 Jan 2024 14:11:54 +0000 (GMT)
X-AuditID: cbfec7f2-515ff70000002543-34-65b11aaa6d6c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 34.8E.09146.AAA11B56; Wed, 24
 Jan 2024 14:11:54 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240124141154eusmtip2a24bae47c26dde4efab3c233ff65a916~tTe0NjEOj0086300863eusmtip2R;
 Wed, 24 Jan 2024 14:11:54 +0000 (GMT)
Received: from localhost (106.110.32.133) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 24 Jan 2024 14:11:53 +0000
Date: Wed, 24 Jan 2024 15:11:53 +0100
From: Joel Granados <j.granados@samsung.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 03/17] drm/xe/oa/uapi: Add oa_max_sample_rate sysctl
Message-ID: <20240124141153.tv6q4jnulu6jlaox@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="i5db3hhvr4ojnve4"
Content-Disposition: inline
In-Reply-To: <20231208064329.2387604-4-ashutosh.dixit@intel.com>
X-Originating-IP: [106.110.32.133]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsWy7djP87qrpDamGsxdpmexom8Nq8WPzS+Y
 HJg8Fu95yeRxv/s4UwBTFJdNSmpOZllqkb5dAlfGmhXLmAtmaFf87TjG0sD4S7mLkZNDQsBE
 Yu3OR6xdjFwcQgIrGCWan65lg3C+MErMP9jGClIlJPCZUeLUX3WYjjcLO1kgipYzSkzcPB2q
 A6jo3+71zBDOFkaJda8XMYG0sAioSmzZ2c4MYrMJ6Eicf3MHzBYR0JV4f6kVqIaDg1lAReLk
 dCuQsLCAh8SfL8fYQGxeAXOJpY1fWCBsQYmTM5+A2cwCFRI7HjVAtUpLLP/HARLmFHCQWP3z
 BDvEoUoSX9/0skLYtRKnttxigrDvcEjsnpEDYbtITL74ggXCFpZ4dXwLVK+MxOnJPWBPSghM
 ZpTY/+8DO4SzmlFiWeNXqEnWEi1XnkB1OEo8PXSZHeQgCQE+iRtvBSHu5JOYtG06M0SYV6Kj
 TQiiWk1i9b03LBMYlWch+WwWks9mIXwGEdaTuDF1ChuGsLbEsoWvmSFsW4l1696zLGBkX8Uo
 nlpanJueWmyYl1quV5yYW1yal66XnJ+7iRGYek7/O/5pB+PcVx/1DjEycTAeYlQBan60YfUF
 RimWvPy8VCUR3huS61KFeFMSK6tSi/Lji0pzUosPMUpzsCiJ86qmyKcKCaQnlqRmp6YWpBbB
 ZJk4OKUamHTiF1/hvLjVRuTYBXPtN+6PQk9x7FQSKz4Q69k6Y3+7ashr/gcbaqa+37rN7OTW
 Qn1Bz8hwyWYHpbu8igwvH58tXZLzucx06t1JF1M3K+4SNKudG2Aer/LFwfDpqRAGsyrts4Ul
 t60e3l24X47HtTh1+jajjX/0GPXdAgIc53q1r1y40Vf+58Ynew9qapZx5hgHfTtaMOuHf49h
 2c3G3IuPDe5ZugYaHft0Wrpts1ebi8n/3M3zXMvZGPcIFhq5qMydO/tOxpLTqW62hw+z5mfe
 7JTZXL18qebCYs3WV1yr83olXkz7si/m2qOrPdOT2tNVgv1ScnMskzsWyOx70L63Skn/X4Rx
 UNqtuZvPKbEUZyQaajEXFScCAF8T16y4AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xe7qrpDamGnybKWuxom8Nq8WPzS+Y
 HJg8Fu95yeRxv/s4UwBTlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1N
 SmpOZllqkb5dgl7GulMX2QqmaVcs/PuTqYHxh3IXIyeHhICJxJuFnSxdjFwcQgJLGSUWz/jG
 CJGQkdj45SorhC0s8edaFxtE0UdGialXr0J1bGGUeLZ2BVgHi4CqxJad7cwgNpuAjsT5N3fA
 bBEBXYn3l1qZuhg5OJgFVCROTrcCCQsLeEj8+XKMDcTmFTCXWNr4hQXEFhIolbjxbSUrRFxQ
 4uTMJ2BxZoEyib+3LkCNkZZY/o8DJMwp4CCx+ucJdog7lSS+vumFurlW4vPfZ4wTGIVnIZk0
 C8mkWQiTIMI6Eju33mHDENaWWLbwNTOEbSuxbt17lgWM7KsYRVJLi3PTc4sN9YoTc4tL89L1
 kvNzNzECI3DbsZ+bdzDOe/VR7xAjEwfjIUYVoM5HG1ZfYJRiycvPS1US4b0huS5ViDclsbIq
 tSg/vqg0J7X4EKMpMAwnMkuJJucDU0NeSbyhmYGpoYmZpYGppZmxkjivZ0FHopBAemJJanZq
 akFqEUwfEwenVAPT0jfRlUdK22dO+pJ8e3voybvtads8Dk81Mc99sus7W8yrU98n8Jxcw3TM
 ubCgZmf5yqA070POnBo7pwhuMk17JKg1a1my6Zvb8ZVGLAL9h1dmeOf8DTwg5zHxorau8vbY
 BT5tYX67/s6Vtd8epPZDpkFAVuTFraKn0mkPXwkempDo6RfGO7mi7kn/au/e6TmxUuErba+t
 /blNccnJH33cF8OTfr/bGr7qfFrT9AkLOM4wCTl6+f2J+/zPjctzgcf0aQ6v+ZbtbLDh27Rf
 a3nljfSFAdOKTCu9GXYYvylws5T0yI2pfvDqnv72ugtrnrVb2P0S3rfXvzdiPcf/k78r+s0z
 0p3LZ+Uw9+zTruRVYinOSDTUYi4qTgQAnqCLvFUDAAA=
X-CMS-MailID: 20240124141154eucas1p260dc39467189e97abcca2efe7f50b598
X-Msg-Generator: CA
X-RootMTR: 20240124141154eucas1p260dc39467189e97abcca2efe7f50b598
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240124141154eucas1p260dc39467189e97abcca2efe7f50b598
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-4-ashutosh.dixit@intel.com>
 <CGME20240124141154eucas1p260dc39467189e97abcca2efe7f50b598@eucas1p2.samsung.com>
X-Mailman-Approved-At: Thu, 25 Jan 2024 16:01:16 +0000
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--i5db3hhvr4ojnve4
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 10:43:15PM -0800, Ashutosh Dixit wrote:
> Introduce oa_max_sample_rate sysctl to set a max limit on the frequency of
> periodic OA reports.
>=20
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile    |  1 +
>  drivers/gpu/drm/xe/xe_device.c |  7 +++++
>  drivers/gpu/drm/xe/xe_module.c |  5 ++++
>  drivers/gpu/drm/xe/xe_oa.c     | 49 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_oa.h     | 16 +++++++++++
>  5 files changed, 78 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_oa.c
>  create mode 100644 drivers/gpu/drm/xe/xe_oa.h
>=20
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b719953d9d30f..cf7e0e5261f73 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -98,6 +98,7 @@ xe-y +=3D xe_bb.o \
>  	xe_mmio.o \
>  	xe_mocs.o \
>  	xe_module.o \
> +	xe_oa.o \
>  	xe_pat.o \
>  	xe_pci.o \
>  	xe_pcode.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 35616d1a81a31..744d573eb2720 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -29,6 +29,7 @@
>  #include "xe_irq.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_oa.h"
>  #include "xe_pat.h"
>  #include "xe_pcode.h"
>  #include "xe_perf.h"
> @@ -480,6 +481,10 @@ int xe_device_probe(struct xe_device *xe)
> =20
>  	xe_heci_gsc_init(xe);
> =20
> +	err =3D xe_oa_init(xe);
> +	if (err)
> +		goto err_irq_shutdown;
> +
>  	err =3D xe_display_init(xe);
>  	if (err)
>  		goto err_irq_shutdown;
> @@ -526,6 +531,8 @@ void xe_device_remove(struct xe_device *xe)
> =20
>  	xe_display_fini(xe);
> =20
> +	xe_oa_fini(xe);
> +
>  	xe_heci_gsc_fini(xe);
> =20
>  	xe_irq_shutdown(xe);
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_modul=
e.c
> index 8629330d928b0..176d3e6ec8464 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -10,6 +10,7 @@
> =20
>  #include "xe_drv.h"
>  #include "xe_hw_fence.h"
> +#include "xe_oa.h"
>  #include "xe_pci.h"
>  #include "xe_perf.h"
>  #include "xe_pmu.h"
> @@ -76,6 +77,10 @@ static const struct init_funcs init_funcs[] =3D {
>  		.init =3D xe_perf_sysctl_register,
>  		.exit =3D xe_perf_sysctl_unregister,
>  	},
> +	{
> +		.init =3D xe_oa_sysctl_register,
> +		.exit =3D xe_oa_sysctl_unregister,
> +	},
>  };
> =20
>  static int __init xe_init(void)
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> new file mode 100644
> index 0000000000000..f4cacb4af47c5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =A9 2023 Intel Corporation
> + */
> +
> +#include <linux/sysctl.h>
> +
> +#include "xe_device.h"
> +#include "xe_oa.h"
> +
> +static int xe_oa_sample_rate_hard_limit;
> +static u32 xe_oa_max_sample_rate =3D 100000;
> +
> +static struct ctl_table_header *sysctl_header;
> +
> +int xe_oa_init(struct xe_device *xe)
> +{
> +	/* Choose a representative limit */
> +	xe_oa_sample_rate_hard_limit =3D xe_root_mmio_gt(xe)->info.reference_cl=
ock / 2;
> +	return 0;
> +}
> +
> +void xe_oa_fini(struct xe_device *xe)
> +{
> +}
> +
> +static struct ctl_table oa_ctl_table[] =3D {
> +	{
> +	 .procname =3D "oa_max_sample_rate",
> +	 .data =3D &xe_oa_max_sample_rate,
> +	 .maxlen =3D sizeof(xe_oa_max_sample_rate),
> +	 .mode =3D 0644,
> +	 .proc_handler =3D proc_dointvec_minmax,
> +	 .extra1 =3D SYSCTL_ZERO,
> +	 .extra2 =3D &xe_oa_sample_rate_hard_limit,
> +	 },
> +	{}
Remove sentinel here as well.

> +};
> +
> +int xe_oa_sysctl_register(void)
> +{
> +	sysctl_header =3D register_sysctl("dev/xe", oa_ctl_table);
> +	return 0;
> +}
> +
> +void xe_oa_sysctl_unregister(void)
> +{
> +	unregister_sysctl_table(sysctl_header);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
> new file mode 100644
> index 0000000000000..1b81330c9708b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_oa.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =A9 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_OA_H_
> +#define _XE_OA_H_
> +
> +struct xe_device;
> +
> +int xe_oa_init(struct xe_device *xe);
> +void xe_oa_fini(struct xe_device *xe);
> +int xe_oa_sysctl_register(void);
> +void xe_oa_sysctl_unregister(void);
> +
> +#endif
> --=20
> 2.41.0
>=20

--=20

Joel Granados

--i5db3hhvr4ojnve4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmWxGqgACgkQupfNUreW
QU+MGwv+IXaNm9iZRA/TVMGLJNI1chbEfD7ztWw33LAfHI5og9i240e7c2dqo0gH
izf2KAAhK4BiS9N2N+zczS/RKiKk766d5tBjtoSmZ4UjDSTkFETb4Dy2orIsvS+1
GHahRb74oMfY3c0RWmPeHvyzARvESO9fU8/NiTnztE2QsAJF51hl4aVq4Iw5oR72
dNC1Q5F5DlhOL6pUWvkbCfdXM6zmUlS/q3x0Uk8Xwd7wJVRmKUICRj9tx1Ggwx8O
56M3eTaTQW4497irlEyqx65r+Htf2ZYa1xuPsb7f7X2CXdaRFv/cv35frhmNwOEu
GfyxIvZiFObTETMvE7ZO2jnDCEPdzLmhALOg6ykmCypp36nzqhkSwfTq0cr9ug54
7SUxy2NFZjjvgNZIGAhfuL3EL1U2RXvHtAL6hFbUxjSs/XJirQPVvkV019jsBEEm
fzPGusGMnGIt/8kXxRABDuLZ5cUvSnFyILxPz/0pHIZE02L8Fqzm7glOQU/IiLUj
WpghmvLs
=ugPJ
-----END PGP SIGNATURE-----

--i5db3hhvr4ojnve4--
