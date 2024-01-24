Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2686C47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 16:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5FD10E2B4;
	Thu, 25 Jan 2024 16:01:16 +0000 (UTC)
X-Greylist: delayed 470 seconds by postgrey-1.36 at gabe;
 Wed, 24 Jan 2024 14:18:35 UTC
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148EB10EA2A
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 14:18:34 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20240124141038euoutp02e986985e4282b8f525659cb391521d3c~tTdtIYr3k2414524145euoutp02N;
 Wed, 24 Jan 2024 14:10:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20240124141038euoutp02e986985e4282b8f525659cb391521d3c~tTdtIYr3k2414524145euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1706105438;
 bh=zkEQ5uISMpJa7GnN14QnLY9o7S1m/eA6ORPUaYjIjb4=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=XzjU3NWwN0PGsUY6LoL65YqqKMRDJ2RRBJKD9ewBcqx5rJSBbwGGj7VIBwZAuAoT+
 s7DCmGWmcIffPR2bxo6UrZDZLa8s7AUIpuNI15Y1Cfb7dEOSWmZqM+VWS+Cg5jZHHY
 I2DHh4TX/zMoGwicl56/mzVzMbZrDN2ADf3YC9As=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240124141037eucas1p1a291017c9d5c466e44869b1c5fe1e43d~tTdtBUwTQ0297802978eucas1p1w;
 Wed, 24 Jan 2024 14:10:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id E1.48.09539.D5A11B56; Wed, 24
 Jan 2024 14:10:37 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240124141037eucas1p273082b3863f6e28c7ef2425fb8c6060c~tTdsfLTfB1657116571eucas1p2h;
 Wed, 24 Jan 2024 14:10:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240124141037eusmtrp17c2c2fafe89912c3a2f9349a5a1e7997~tTdsep5872624126241eusmtrp1t;
 Wed, 24 Jan 2024 14:10:37 +0000 (GMT)
X-AuditID: cbfec7f2-52bff70000002543-11-65b11a5def48
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A4.4E.09146.D5A11B56; Wed, 24
 Jan 2024 14:10:37 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240124141037eusmtip24432f5d87e21d30de562606d7644eb20~tTdsQ9OIL2519725197eusmtip2W;
 Wed, 24 Jan 2024 14:10:37 +0000 (GMT)
Received: from localhost (106.110.32.133) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 24 Jan 2024 14:10:36 +0000
Date: Wed, 24 Jan 2024 15:10:35 +0100
From: Joel Granados <j.granados@samsung.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 02/17] drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
Message-ID: <20240124141035.brlc2hajfrdafzjp@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="a6yyoh62nlplw5d7"
Content-Disposition: inline
In-Reply-To: <20231208064329.2387604-3-ashutosh.dixit@intel.com>
X-Originating-IP: [106.110.32.133]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2VSa1BMYRj2nT2dPcVy2sq+hTGzlVup1mSYlGvRD4MYMxiGnfZTqI3dSsJM
 JTKRKYu02kRbG6Wi1bibGsqWCoWkXAqjlC66iLXYPrcZ/573ubzzvDMvyxNmWziwW+ThWCGX
 hogZK7qkfKhm+gaHi9ijrdxjdu6RfIvZn4vfU/Mp/6wbbZT/y0MV1ApqnZW3DIdsicQK97mb
 rIKNdZnMdpVjVPONYjoGXZ+QiCxZ4DzhfkM2PxFZsUIuF4EmIYsxC0KuD8HreC8ifEJQl1qP
 fidSVPspIugQ6FPqqD+uUyfbaDLoEWTHlA7vojlnyL311MKMGc4VajuaeGZsy02HrkfmVSzL
 45zAkOplpm24pZBsrKPNWMDNgic3vzIEW4Mh7c0wz+Oi4HxjFY9Ex4HOxJppS24+9DTe55Oi
 YujvSLIgeC9U6huHewJXz4JRm4TMWeB8IW7fYuKxgfYK/a/seKhSHaaJX4XgtqmbT4Y8BDmx
 /RRxzYH4+je/EgugPKuHT5aOhoZOa9JzNBwtSeURWgAHDwiJexLkveigk5Gj+p/L1P9cpv57
 GaFdIfN6L/Mf7QI5Zz7wCPaBgoIuOhPxzyMRjlCGBmGlRI53uimlocoIeZBbYFjoJfTze6pM
 Fb1XkKa9x60MUSwqQ04/wy1FeQ+QAy0Pk2OxraDBvgALBTLprmisCNuoiAjByjI0jqXFIoGz
 bCIWckHScLwN4+1Y8VulWEuHGCr4TNEOw0LfQRf/aa3hi4eOGdVGbw9V9WpVk/Zsv3R3jsy5
 VGsIuCsas+ibdpLMrpk/d4kknK18eErEDa5vn9y9zjbBtniZe/7A8ugMZYLzx7X6lvQLhT7p
 I7Zavnw1UhezoChygiQp6H3gzqvGL8KRkwsf2UztDCxpDWiITDk5NWNV4Gm/S5Rd8tAdbLwH
 21zyb8vcFppcVzJNb5domaclhsf77lzwdDL1dQ8kd1Yu8nO816J7YqN+tUsy88QazZH6FYP7
 41NrfGNT7K8Vpl2+Ehe1fFRE4vM9odbd4s9M6YzagHdpOvWz70nzNMc3V3+YEn2uV6SpKXJ6
 PmWsa2t1nLb2rZhWBksl03gKpfQHJPCe17gDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsVy+t/xe7qxUhtTDU684bVY0beG1eLH5hdM
 Dkwei/e8ZPK4332cKYApSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384m
 JTUnsyy1SN8uQS/jyrRfLAUTlSuOrbnJ1MC4U7aLkZNDQsBEYuLkViYQW0hgKaPE7k0cEHEZ
 iY1frrJC2MISf651sXUxcgHVfGSU2P/4NSuEs4VRonn9R7AqFgFViRX7roPZbAI6Euff3GEG
 sUUEdCXeXwLZwMHBLKAicXK6FUhYWMBHYsKfyywgNq+AucS1vb/ZII4olXjecZEVIi4ocXLm
 E7AaZoEyiV8vp0CNkZZY/g/sTk4BB4mPt86wQ9ypJPH1TS/UzbUSn/8+Y5zAKDwLyaRZSCbN
 QpgEEdaSuPHvJaawtsSyha+ZIWxbiXXr3rMsYGRfxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJ
 ERh/24793LyDcd6rj3qHGJk4GA8xqgB1Ptqw+gKjFEtefl6qkgjvDcl1qUK8KYmVValF+fFF
 pTmpxYcYTYFhOJFZSjQ5H5gY8kriDc0MTA1NzCwNTC3NjJXEeT0LOhKFBNITS1KzU1MLUotg
 +pg4OKUamKo6voW46fD2htTbhLU72KeE7zXlt4/W0Tu+PM/LsWXaqsDV+lVvGH4eebZN69uX
 2I6FJZ2i81wiGu7949zGnaK2v+wI2662L9OOpj6slo6csPzZjeUXAgwUJwbPTf/W8WZCnUt0
 oGN7+PozyucdtN4Lmls/vPPnXPyu2dWlFyT1nkzpOrKB7922Le6Wv0Uuc11/3VJ/TWSzeYaM
 3TldT2+fVWctQ+zLvUKNJz0NnPtKJdXdcH5Gk8fRlsKwhO1i9+68SviqeXjJujkyQRmf+lT/
 LjyQEtgn/PuX7X/blljr8483ly9c9a/4e5R2/NpiY2fGBqbCTQ+c/pfwKX+dGvboIUfy5wvV
 T+UUVLZfUGIpzkg01GIuKk4EAL1bpg5UAwAA
X-CMS-MailID: 20240124141037eucas1p273082b3863f6e28c7ef2425fb8c6060c
X-Msg-Generator: CA
X-RootMTR: 20240124141037eucas1p273082b3863f6e28c7ef2425fb8c6060c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240124141037eucas1p273082b3863f6e28c7ef2425fb8c6060c
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-3-ashutosh.dixit@intel.com>
 <CGME20240124141037eucas1p273082b3863f6e28c7ef2425fb8c6060c@eucas1p2.samsung.com>
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

--a6yyoh62nlplw5d7
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 10:43:14PM -0800, Ashutosh Dixit wrote:
> Normally only superuser/root can access perf counter data. However,
> superuser can set perf_stream_paranoid sysctl to 0 to allow non-privileged
> users to also access perf data. perf_stream_paranoid is introduced at the
> perf layer to allow different perf stream types to share this access
> mechanism.
>=20
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_module.c |  5 +++++
>  drivers/gpu/drm/xe/xe_perf.c   | 28 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_perf.h   |  4 ++++
>  3 files changed, 37 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_modul=
e.c
> index 51bf69b7ab222..8629330d928b0 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -11,6 +11,7 @@
>  #include "xe_drv.h"
>  #include "xe_hw_fence.h"
>  #include "xe_pci.h"
> +#include "xe_perf.h"
>  #include "xe_pmu.h"
>  #include "xe_sched_job.h"
> =20
> @@ -71,6 +72,10 @@ static const struct init_funcs init_funcs[] =3D {
>  		.init =3D xe_register_pci_driver,
>  		.exit =3D xe_unregister_pci_driver,
>  	},
> +	{
> +		.init =3D xe_perf_sysctl_register,
> +		.exit =3D xe_perf_sysctl_unregister,
> +	},
>  };
> =20
>  static int __init xe_init(void)
> diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
> index a130076b59aa2..37538e98dcc04 100644
> --- a/drivers/gpu/drm/xe/xe_perf.c
> +++ b/drivers/gpu/drm/xe/xe_perf.c
> @@ -4,9 +4,13 @@
>   */
> =20
>  #include <linux/errno.h>
> +#include <linux/sysctl.h>
> =20
>  #include "xe_perf.h"
> =20
> +u32 xe_perf_stream_paranoid =3D true;
> +static struct ctl_table_header *sysctl_header;
> +
>  int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *f=
ile)
>  {
>  	struct drm_xe_perf_param *arg =3D data;
> @@ -19,3 +23,27 @@ int xe_perf_ioctl(struct drm_device *dev, void *data, =
struct drm_file *file)
>  		return -EINVAL;
>  	}
>  }
> +
> +static struct ctl_table perf_ctl_table[] =3D {
> +	{
> +	 .procname =3D "perf_stream_paranoid",
> +	 .data =3D &xe_perf_stream_paranoid,
> +	 .maxlen =3D sizeof(xe_perf_stream_paranoid),
> +	 .mode =3D 0644,
> +	 .proc_handler =3D proc_dointvec_minmax,
> +	 .extra1 =3D SYSCTL_ZERO,
> +	 .extra2 =3D SYSCTL_ONE,
> +	 },
> +	{}
We no longer need the sentinel moving forward. At the moment it will
work with and without a sentinel. But that check will be removed within
in the next two releases. I suggest you just remove the sentinel and end
it like this

=2E..
  .extra2 =3D SYSCTL_ONE,
  },
=2E..

Furthermore: isn't that space after the tab on the struct supposed to be
a tab?

best

> +};
> +
> +int xe_perf_sysctl_register(void)
> +{
> +	sysctl_header =3D register_sysctl("dev/xe", perf_ctl_table);
> +	return 0;
> +}
> +
> +void xe_perf_sysctl_unregister(void)
> +{
> +	unregister_sysctl_table(sysctl_header);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_perf.h b/drivers/gpu/drm/xe/xe_perf.h
> index 254cc7cf49fef..1ff0a07ebab30 100644
> --- a/drivers/gpu/drm/xe/xe_perf.h
> +++ b/drivers/gpu/drm/xe/xe_perf.h
> @@ -11,6 +11,10 @@
>  struct drm_device;
>  struct drm_file;
> =20
> +extern u32 xe_perf_stream_paranoid;
> +
>  int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *f=
ile);
> +int xe_perf_sysctl_register(void);
> +void xe_perf_sysctl_unregister(void);
> =20
>  #endif
> --=20
> 2.41.0
>=20

--=20

Joel Granados

--a6yyoh62nlplw5d7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmWxGlUACgkQupfNUreW
QU+aBwv7BgKlIl0+lzRGrgVm0wIER1zaT9Civs+9NKkfVOsZeoA5H274MqsiB9nD
HCwkCg/EJWWVvPi89zXjFxa9B57JPAsrTubeA83jKK0EgGylKRAcnUBrHH2JG69w
2KJvvEWi2usXSUg5Vr2otn38BE/XlcrASeQBDBtvsA3sZ9gSiX3wqc6LVGVJjj07
pd0DXOgpx11biSnwt993LpLBQNqSpFF5M7sqjGhytETb31qWOc1vS0e4XVJFnQAR
pUvaU+FVJ9r4t28fQADWDcRWO0ef8IJj6rLhxcDrEBnrKYf1NW0RF7bDS5Hq01d8
OnjrEzBcJXiih+tmp5tDMjYjsDInT1lqOf3dkedmFFFgk/RKTfd6/dvxggd6mBpd
g4kYJlslt8UuGVYDzRU8UPFzNBz+F89QxjMgBXq56ZCk9PC4puwXCvQm6W+TPoQS
BUZ3kx/u8iamjBvS7K25QdCaM1CvNndq4VhFl/Zc0ILuQsvN0/bxaRcq/pSMR4Dt
8H/PqgeH
=pnri
-----END PGP SIGNATURE-----

--a6yyoh62nlplw5d7--
