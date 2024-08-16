Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1171C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 06:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4E510E597;
	Fri, 16 Aug 2024 06:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iz3qfyhS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF2110E597
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 06:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723789621; x=1755325621;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GgLD0BJ3/ilDYqaK/vACYfYpwvLA9FTEhB+cBHlJjKQ=;
 b=Iz3qfyhSwrGEBUkAWqtVWr+Ajon7zTMLu0I7qDPNQgSxsfL43EYCdWSr
 HWUifR6/tJzh3XndqoqQq12jAV18pu9uU7FehjpzEMg0LPa2bM0a9CR+4
 YU4wbETnh0Wa9oEkVv4rCOyDGWaq+Qsm9fqWs9GnwAQa4IhSCdUvgKAsl
 eobeAwXspBf6vDb3aBuddJ/Xclh/Ro5ZzZZxJCcyUFbrxbGFJuIV/i2ZO
 QFaF2C6ig72SkQ7pOFurSRDG99PA1PY2SCEaNt4clggAceQTUtGAOZbBh
 bHRA6pbEdmpJ+bd+aEiC3oD144CIaI86+QdJyXlXdfL0a7XMZC5aYpp2I A==;
X-CSE-ConnectionGUID: wMIpB3DmR2GYcO9h8efQmw==
X-CSE-MsgGUID: OS7p4hyISmevidUN6h4mrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="13049009"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="13049009"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 23:27:01 -0700
X-CSE-ConnectionGUID: fcSl9MNVSoKmlR55pFCU2w==
X-CSE-MsgGUID: 1O3IFRQgT++e1mWlUTygvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="59533327"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 23:27:01 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 23:27:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 23:27:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 23:26:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/t9X2R/YaH+fWur6wgNfLys6RNsrTdumF8XkQH8pym9fe+Llo5MFGFmujubw4ARjtLXKwo5BDX12Awv7KhCONjpxzmGl9PjbJzfEHExdSjbGYTiI5vfrbMJmW+cdJndjehTJO2rWrYQ9Pa+EEvhiSOiKTbI98+eYBMqj0DOh1FDiXRDybYWAqCpzLr92ElHf1kjOIwC4K0kbEmAxdFB8CbofGJCA8fKCxpo9zPLLA15sh+T3PWYRQ5eF4O/YUFzhwwr9SnBh37yHUnXKvchsmTsv9HRvnUYQNEEu5wN9aFfmP9KqbIrB//ZfvtDyPguwpjkzfc9qUGt/ocpdO4Njg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vH6aGGxHMknOO+B14afIWZdN9NETgpr7Cxto57z+SQ=;
 b=x+GXmCRAhMukWduBrPNGSuLmvZ2Hgl2dODBbO+OJpfmVIMBP23R3nrdnZ6OofVMVGnLSTM1+/sBhUbuZvSVTHDQdPXD/chwQKONdQLJwFpAkuPT1J1aP/z9nNQX8rSUCitxuGOlMTTNIAJbKrFBzeq0lXYO418izJ80xrZcHy3RfF11xAjycisD2Ji7iWtjpVSylmdTN+5ul3dUZmJhnPlybNpvPZxL7Dgvyex8D9TFlqqUDZKnQljIQV+htFDsuzw6hubFbqfczIpKWSZM1IuoanC6gCcZd1/qGRL7t6uWlfH5KKjJoQCnVDzcQuK7D/+PLOQuCPxiwoBzWkRsHzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13)
 by SN7PR11MB6996.namprd11.prod.outlook.com (2603:10b6:806:2af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Fri, 16 Aug
 2024 06:26:57 +0000
Received: from CY8PR11MB6868.namprd11.prod.outlook.com
 ([fe80::1eb4:7d0d:53f:6923]) by CY8PR11MB6868.namprd11.prod.outlook.com
 ([fe80::1eb4:7d0d:53f:6923%6]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 06:26:57 +0000
From: "Singh, Apoorva" <apoorva.singh@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Remove NULL check of lrc->bo in
 xe_lrc_snapshot_capture()
Thread-Topic: [PATCH] drm/xe: Remove NULL check of lrc->bo in
 xe_lrc_snapshot_capture()
Thread-Index: AQHa76UphjfxMAfghk2Rte6FfZWnO7IpaxiQ
Date: Fri, 16 Aug 2024 06:26:57 +0000
Message-ID: <CY8PR11MB68681A720E6E25B7594D7916EE812@CY8PR11MB6868.namprd11.prod.outlook.com>
References: <20240816062446.896829-1-apoorva.singh@intel.com>
In-Reply-To: <20240816062446.896829-1-apoorva.singh@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6868:EE_|SN7PR11MB6996:EE_
x-ms-office365-filtering-correlation-id: 4dc75704-d2e0-4547-7b25-08dcbdbc6e14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?jG/7qIA2BSV6wg0tm2KbJLTBqvVEohAVIYM3ozT32EV+QeSfg7PgAf6Vdnrk?=
 =?us-ascii?Q?6p4PO+0ukaYS51Le6BlHfrZGcjLDEJEPb//DCwMhDLn4JScDnVIycWWraQ59?=
 =?us-ascii?Q?M4JWdh5zXkG2odZ56e6GYFi34Pxc4Tht07sUW+hM8Y3C+qUEXWJM6saPoveQ?=
 =?us-ascii?Q?yZMBX61Ojsq5YwNBcEho1LkXGPLoe1OHOoF2SUwQ6wuI7qSE2nQqi6AQiulu?=
 =?us-ascii?Q?9QMxd1sKxcukKGJMklHDhJV9Ymkp2jtChGGWRgXlcjTj2Mj6ipQ3yoXWsfXQ?=
 =?us-ascii?Q?TUz+621VDUzippECVtTOjz9aIatE5PT71IUgzQQq9qNyvYp+cMuLm+LbeGWe?=
 =?us-ascii?Q?KEkQBrR/pLwS62vv+p0+ayDUDvBhz2WFNUyRDsETeac2n5pWt6jg0OgTeYR/?=
 =?us-ascii?Q?Znm6YaTbgHYkBNjaxstdIgSvr/IPHpzoV4NUHzHbZYKWVbhp7/IddK/kO7Bp?=
 =?us-ascii?Q?61mz+NtgRMzZCUWd/qjFi6oY4dJWxr/jkVQcukccHiTdMtHU16zGiRNm6Ef6?=
 =?us-ascii?Q?a99vhAwO1jjqsrWWv2Ux2LlQyrhUXiBSp7kCFHFpYsFlFolZCH/zi/cNGelg?=
 =?us-ascii?Q?IN+Y5OiYzaiHizgBwUoYxF5yh421DF1pfVF8FhmJVjSaaLPzYqTQNa6JRRCF?=
 =?us-ascii?Q?dQ5Q7uIdYYSxp/vaTwSrwHFNGrahqahX9S3c51JSXQcs+RZyYUbiun26ZsyP?=
 =?us-ascii?Q?WXtoJNEcBCxxdxZwFZhhAT/UHRYwykFen4adgVFXh0BjPwgmr03aVEjRscju?=
 =?us-ascii?Q?JJvxvKm9c/ONET+heHFVFa4al2iI+iuQ9dmgeANDb5AZwRakVKktLSEZOKzD?=
 =?us-ascii?Q?o1zpd7K+GK1grP/cqoNtVgAFjafpfoYJewdltDe1+8bICPqhxaUQ3pBdPWK9?=
 =?us-ascii?Q?qhF0WOEXk1y6mlhsF1PMbFrTtBKIstHTzADK+c4QuXI5sw9DK4XL7k+/GD6F?=
 =?us-ascii?Q?lLyP3vuw/56wZBMF04A635aLEbAlW4p2OAIG7dSfXVRP418iNYpf4CuRU+Yz?=
 =?us-ascii?Q?1ycIDTWYFt4nNJsK5notVJgjAlr6Xvnc3XvW85SF/iq6VAZfnmvTs6WUXlk6?=
 =?us-ascii?Q?vVq2PuzZMPth1MRVyl7OsVww6c3GGL81B8QPec6dGjKaZ0Yjb1ZstcCTZLNE?=
 =?us-ascii?Q?mqiXOkbpM0qwNnRnsjbt5td4g34m6yhuL1QStQGyglzxnBGWMIqb1pVbfFoK?=
 =?us-ascii?Q?61TC0cGj9gN/n9yEEKXLno0GGFYI7NyiOA/JLFcOtPlq18At2eE/XCMBebW8?=
 =?us-ascii?Q?OvRFXlVB8NsuAgg+1RXI1UITF7j+fTsRY/x1/Dj+WN+Y1TjBn6qIYfY8bcxl?=
 =?us-ascii?Q?bTAW6TSzCB3aKzWAJEF3le7fMvmSN+MUhebbtMmEOdLWvekWOclSBfCiWq6I?=
 =?us-ascii?Q?6Jhtzao=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6868.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qdi4W6hiPRpsnWsaXvpBmLe/RnkKOhyx/n2j8fkAVdoRMU6vggUzBytSJRVc?=
 =?us-ascii?Q?kG+SF+JiuMRUkbXodfIAbrwfwk27DqnMUt+jlzvTQ5D40mvZ5xaemtUXetZ+?=
 =?us-ascii?Q?ANu8+kG/D0FNk0mXd2MDwIKYJET6O0N2Q+KjCsQTqDI3zBiODqcnzRzifew6?=
 =?us-ascii?Q?+cIvwTNt91g9mLPOnnPb0zuMfos4xccN0ibWwYi3DwvP8ObrnvmpoR59pNne?=
 =?us-ascii?Q?oReVx34j24hTZG5LelHVDfaHl7Tw7fHBOuYv7WNYQix4mEkVwLqMqAbaN5lg?=
 =?us-ascii?Q?ZYj3yKmx4+oPrIoCG+Afdao5rA8lojA/qIr2kIwIkrF0zAM+DnM+6qFNTn8j?=
 =?us-ascii?Q?LPpMfJTfnRPmI11ohA62zSL8CDMXrz+Bvm+yyBd0RO0S1YCp5fXO8eIBZvAb?=
 =?us-ascii?Q?dT7Bo/OqRI35VEc+dPr/WNAu0B3KTwoy4mECpV9Flm5iW5lOXanSIW+MCWtx?=
 =?us-ascii?Q?qjozhGP8AhyZ6cB7mcmY1UeQM8SLgMRXrfb3f+tgC1AdTF6nrgMFz8uvrJBd?=
 =?us-ascii?Q?S5hjzNYuYfuoQowp2ADaH2FAJKWWtSIfBR9+w8OjwSaBlV4nmtHVMR7paUjC?=
 =?us-ascii?Q?BFrjk/LWKTg3CR4fDPwVM1n1JPF4doD/FcYWj12YyUDlTi+ba0/7y21W7sta?=
 =?us-ascii?Q?9Q4XOfvOiimIp8DnWhqHbPYDBs6OP+JRlp6zZjvgh+uirelGvq812LC0MzbC?=
 =?us-ascii?Q?IVChlomBYMry+Z+TI+i3iYbjr5kauhzTJshF2GqyuYw13PvNRa+zNAJ4HOzM?=
 =?us-ascii?Q?UbvDenn6ggSYZcPAq4qCAvx9TYCY6d/lqOkwDiCJSubG/qAasIcAp/qBMIy2?=
 =?us-ascii?Q?pQyNB7xhDB41Vu18SVEh7QCG1dOY6yg4//9YPpA5Qqip7P2M/2kC8PruZhw3?=
 =?us-ascii?Q?tlgdvqAg/cfoNodBSKpKREEUg2AWWele9cdNkw0vg1RQ72efAeb4tleBoqhk?=
 =?us-ascii?Q?rKaGVHAHQHfLRGzXgL9sd61IRwL3CaGbWL/115CRWiGjdEh13RMWIHNMbEEH?=
 =?us-ascii?Q?pSf94CBpKmpLdCIXnIW63yLHUOoO+Sw4UHdyDLupBZhwHqH4KyszdY4RHhaA?=
 =?us-ascii?Q?2HXwFuK0kV2vjkUf5PEcFfyQhsgAuFls4gVxSoy3sKT6xo1mrUL08nTbkMcP?=
 =?us-ascii?Q?E+axFENAQqApF1wpPazuh+LmPEmd+MftJOlNBaUgYg4pZCX3qI8SLhefW4wm?=
 =?us-ascii?Q?3TaitYrEQRUHSvKSasYvo/FJDD0T344qw/PuGFbA86eMaW5edwtAbkNfNbz0?=
 =?us-ascii?Q?t9Z3hCFyuq/DHyEIYzM6sWjrd1esRrBAtr1gA155hM4ChnjDNtodUY2T00zt?=
 =?us-ascii?Q?bzJD4fwgO4wXDBf3XzlTomUFytD1OkrDgdjgVdq02TLj9EdV8d5EquGGdBT8?=
 =?us-ascii?Q?0ujCtZLSN1qR/GkB7bQHbaN8KwQtQUhgjV5EPuddhU9ulgm2ovEcEyEK4S40?=
 =?us-ascii?Q?vjQ2pNDPFOVlzpmYmWk/Byqlgxg6DPM6U5qEOPYli0l6GcnWuPOtVlE3NznF?=
 =?us-ascii?Q?4IiIjPPqmPrg7+vsCio28RlkugXpQj3aZp/r3RCbcEchdw5EQ0KRcIGKKMCq?=
 =?us-ascii?Q?+BMfOGuZOYrpM2kMHc5UYCqcq+LCM93YOn+MzuW8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6868.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc75704-d2e0-4547-7b25-08dcbdbc6e14
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 06:26:57.8070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: diviE0lWTndpFUID31UME7y1b+Dz6xuEpmgdz3qXd903Fgz0E96W9Vs5HvmX40mFLRB+wC1LKBte2xVqbSbN6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6996
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Old series: https://patchwork.freedesktop.org/series/137289/

> -----Original Message-----
> From: Singh, Apoorva <apoorva.singh@intel.com>
> Sent: Friday, August 16, 2024 11:55 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Singh, Apoorva <apoorva.singh@intel.com>
> Subject: [PATCH] drm/xe: Remove NULL check of lrc->bo in
> xe_lrc_snapshot_capture()
>=20
> From: Apoorva Singh <apoorva.singh@intel.com>
>=20
> - lrc->bo NULL check is not needed in xe_lrc_snapshot_capture() as
>   its already been taken care of in xe_lrc_init()y.
>=20
> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c in=
dex
> 974a9cd8c379..aec7db39c061 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1649,7 +1649,7 @@ struct xe_lrc_snapshot
> *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  	if (!snapshot)
>  		return NULL;
>=20
> -	if (lrc->bo && lrc->bo->vm)
> +	if (lrc->bo->vm)
>  		xe_vm_get(lrc->bo->vm);
>=20
>  	snapshot->context_desc =3D xe_lrc_ggtt_addr(lrc);
> --
> 2.34.1

