Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D76F327AA
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 06:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A019D10E7D8;
	Tue, 21 Apr 2026 06:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNeW3GJu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1A510E7D8
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 06:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776752495; x=1808288495;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0gh5uTw3718IEpeZB2i1KlX0II+aMcL7Yd7bbSQfwJ8=;
 b=QNeW3GJuYbiGQp+UXuOKjeNMW17GeYvskjFyETlHZogf6lWcGSakX/jp
 G+mp3VOV3Xwycgx7pYYNc7JYIWQ/BrkcBAERaZK40AYcVrdlZniReULFo
 hHDMsoBwEW8UzMZ+VOAuopaI28ADJplmMW+OBdFmyvZZjj2jxzVIKJNIz
 j2hXOL7afWtPKVJl7dnV/6wvEdeBB7sGPr9Q1U7atwe38jL9d2UbmzBeG
 C4O5hf8xLmockTsFINS/Qnf+DKxPrqcqIg2WxoEjPZ5wfOUeP+kui2eUh
 REFRzSjq52Zf0Wv9rqdyfDPO7e+eGlEfMrapLMmf88s8vl0obz1XGRZrD g==;
X-CSE-ConnectionGUID: 9aL6ScFgR9OCHHMKLqXHzw==
X-CSE-MsgGUID: mkdIf8woRBGtm3xdkK4YCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77748394"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="77748394"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 23:21:35 -0700
X-CSE-ConnectionGUID: 81SAEFN6SaGT93CGdDPPYw==
X-CSE-MsgGUID: KW5i7lk5TfO+owOsOsq9Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="229270208"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 23:21:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 23:21:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 23:21:34 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 23:21:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBakRioVSs2FoeEtE+RJ61uwR1Bp0CvHGy5B7KLT5G06TS6Fme88gQDNbuh4Pki8M8lpWYrF4Zro5/YvK81LfNtPUYcLREH+t6y7kfRRz8tYpNk8pdcf1o5KklbO9B/RzEpQuAhUgsMY2cw9L2xHfpItyRISxU9LyqrsYY2JUtfY2/vN/da+mwo0jc2+BpnibVOkYk6eYfK/0FqiMND31jauJaOI6jPa4JAmhqsM5FmAM6pzKvJ8kVyjgMVQRx9s3qh78N0qFA0DPdz5r35icwgNL12soA6wSYLXEhpIMnoziZmQol8jmQc3G5SqhibKZudlPzNFIa2FPvur+va69g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fglUoR+dF1CQSXFNB5EUdbdcF47teABP6+msI7NUww=;
 b=mxem7bTQT7jbT3y5OKiP9kew503+1Kjn7ChGHn6mmM35bD2jmGBLaGBlA0vpueNqKhRRySiZuRsfHJnClL1AKz8RVm+b7IEtCa95ql0c65kV5ePGkQMPyF76ozsG/aYRRah1Jlo8W1Z81BqjCN/af3iJTddc0rZXAyIy0k4Xw5VgsrIW7WaBNMFm9mGwS+Z/H1AJbf7kmwR/6D78jBuMqIpQa+7d1tU68DfJF77l3/sXuwM/wYRcK2unVBG01HcAcnM636uKunxmK+tN4WVhf58oE6JpaWwphrU/MOSKL+i16uvoCjevwwkaPG74S2n1D2lhJM1NPjF/ARL66h3VdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3232.namprd11.prod.outlook.com (2603:10b6:805:be::14)
 by MW3PR11MB4761.namprd11.prod.outlook.com (2603:10b6:303:53::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 06:21:32 +0000
Received: from SN6PR11MB3232.namprd11.prod.outlook.com
 ([fe80::bf74:5777:8849:5c00]) by SN6PR11MB3232.namprd11.prod.outlook.com
 ([fe80::bf74:5777:8849:5c00%6]) with mapi id 15.20.9846.014; Tue, 21 Apr 2026
 06:21:32 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v4 10/13] drm/xe/xe_ras: Add support to offline/decline a
 page
Thread-Topic: [PATCH v4 10/13] drm/xe/xe_ras: Add support to offline/decline a
 page
Thread-Index: AQHczkPg8EQCELVYL0G0DcNLJmzOI7XpEXcA
Date: Tue, 21 Apr 2026 06:21:31 +0000
Message-ID: <SN6PR11MB3232FF644E0579D4FD1D28AA812C2@SN6PR11MB3232.namprd11.prod.outlook.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-25-riana.tauro@intel.com>
In-Reply-To: <20260417085812.4013309-25-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB3232:EE_|MW3PR11MB4761:EE_
x-ms-office365-filtering-correlation-id: 8f44b072-3cd3-4b24-4b6f-08de9f6e3b13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: MxDW+Y8CTc0VEeleJhzSTsgE/qWeGkVZmDQ7DSI8hgBoOne2Anfq/dKrPh1Stuk48WYoBeC6lrtsqHf0hOB9XgMMoiM+QzItOFTXpriufWZeeI8l2gLZJ7WFCnHUMAwa8SK7jCt8WJOKarOO+8eLN5WB/wXNqaxKS7rKyDqPk1w7fUyg3TVzDeoIFLXFANcxFi7tS+DlZPjacLcvVb049cLDuJvxXvK66KaRv1jo9knJuryFRg+VVuuwV1Px2HzHSS2nZzqkogqbj5PRYHBW7JJ2tliqqAYPfvUt4+xRUwC+QzikDlxbtuIbPXBYMKDsojezOceNasISB58ZikxYAaWuuk30/G1cXwyzGu6hJ/e+dT/weRDq7ptfgnddlmwXf23L1tUltQxzpuNXsBSRgI2pltLGhO7yDz0fR4+tBHP3iumsn1eKWmzNvr2v7hDY58rxNmxgY++P7GjIeRq3T+lPu8jRkW3DbS/JpdoVBG1jwtgro9m6lEDk+YdZPmw8IYBDE82eTDkca7OH/9MpWLaStqHTT42ajZFH2iqQenSs6HRKdBhW+uFGKituPF+NGQ9vLHT3Ny97Rh20ImHEAymM4DOgX/HF1NqxSeyfbp9BhYB9ANSuLdRvZJoVlPeyDGphsCR9sarOJHsCeY/ZgWQ6PQW3q6HZ6KzCeonC0lntp0YvW42RypysDflDR/VdAPtp8avY7sZBPb3u/jAjY/bae2XxwVuPiXv/7EizK08X8THWk1R2eNGcAbECDLjpkPhUuu7Z8AW98EorpCcyW4eHx8iCpRF+GPk99gTPqY8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kwIJgDZgtF1wfn3kVY5WcJcOw/5keyibd78URil2ZthxgPZBgDkLooqzQ1CA?=
 =?us-ascii?Q?IbVkRlaeGZA0RB06p/GxaQY+dL+qaqz1XHOty1tWc8YeDgMtKUSJKZKQzhCB?=
 =?us-ascii?Q?gI8QDlAKJwnFK8uFKSC79rB8yt+ondU5zyNIpYBTOhOFrIQkWOGtV4us39TA?=
 =?us-ascii?Q?RYbtc+7OdnU4diG/MsZn0lKBorlfYZH0+uHfqZBKt8P1r/hzITI8UgYe1B/f?=
 =?us-ascii?Q?2alBvloHufbdS7Xmk9n7I8/OoVXiG0Tnm98o9cSq3Rsl0dvvfXalUvVq5KR0?=
 =?us-ascii?Q?Rgxy6ppGD2keP3gQzexai4/B1TqU2UzPDePwxup17YiCeo/j4vOI6K/n67om?=
 =?us-ascii?Q?J0PEKQauYvbSVMy0t2E+2JVAsnRkd9buIjEB6cFoxxPXcTDaV4FNmX2n7Rjn?=
 =?us-ascii?Q?6D/i0gOwxHpyqqI6aAbOH7OJAf9LN7uDEW3zSFA2RfnWQfXcJVctoIs++g19?=
 =?us-ascii?Q?R4n3IPv0SxbIySAcMhiJFikTDPwsSYBribvwzUiBDJNwKUG9HMxgG4fOnw9v?=
 =?us-ascii?Q?Aam6o/X5VhL/5DK0zn56GmSJluoIiEJFN/s04xOkvrLUYcZkBQJXydSkBR0i?=
 =?us-ascii?Q?mWHM9s6M7LY4DFWZc4AcbKGih08f4Yb4nWym/uWyhmL6YA7ozoo9cmIxuNLz?=
 =?us-ascii?Q?F535+yq/JgImmMTzRyO0L9f4a56pptLLp/L2uPqSM6moOLVFIhXS+W5GD5+z?=
 =?us-ascii?Q?qbn1g27O5IJV081lr8dkvvsuxAarpOb0fjWDjdIYY9zgyeVCy9cEa0VwijQs?=
 =?us-ascii?Q?S46LECa3UF3DJAmAsW5pqVU96K/b4Q9Cz5CwepeOckFoNoSE5Bsdg/6zK8dA?=
 =?us-ascii?Q?WHMX1BPWlLC0zrE8CQjDbb7BB6nU3NspZn7Wn5iZHcgF/LqwiEgmEy1ZVxWS?=
 =?us-ascii?Q?3FIvcvjxtB4Jva3lKCSzkVAp6rdPjbiYUlIOUW03iSRUmYdo8AH4iidBYXRc?=
 =?us-ascii?Q?1CB+0AV+p+wh0tS1Kn/oAsFg+Q3Q8+GplwlRWgsvM5Etjo4YYxbb8W3aEofm?=
 =?us-ascii?Q?bCKa2lXuUGjY9cDd3PfbFgEUp0x3zlLR5r9pTL84bA4KjcnjBj+jfRA7zVYK?=
 =?us-ascii?Q?/eRGuIDOrNKI4tB6ljgpkLNseypmvvdxIb+CO5mwkAYpZcHWuG1sSsIxIcxt?=
 =?us-ascii?Q?DATZDBtLAOjz+wFCXgkKLJ1HuYs5HUcuNPvO6jWJ/HLrVQC+YVhbegCFXBsI?=
 =?us-ascii?Q?vsO3K2SnatE+asU4spzfOC7Riokm796KmQT+fhCQR+Qn0ZSXdVhlX0e6UUjD?=
 =?us-ascii?Q?9skeiAvMjfJ6YMAyv0LQiaS56Yqe8GFq8cNeg8zlh7EKPJ0pzlUfSTMP18oQ?=
 =?us-ascii?Q?DpUUxXccVJSQqgAi2teINs59TRzrkzNOGbhIqxK5xq/WHRygj0kzWL8I3TYR?=
 =?us-ascii?Q?VHG6Khslr+ZxtD6G+HdC+ISNZLsZo0Hqis9ZA/lF5VWHZas3C0XZyJ0Btohm?=
 =?us-ascii?Q?u+y/vayk8EGolirkBVLT8qjqyFTzkoElh7ZcKOK3G5ZTwiuNHgSrlHboDDt5?=
 =?us-ascii?Q?12JZqKV04IynUqQRTyBU2GxyM5kIwyDjUivVjs4TE3Bz34Q0Y0alu5Us+KmL?=
 =?us-ascii?Q?mF5w+demH4pFNX9Deudrb9oPrBl8kifz813xeT0qZ2Hc41susUdwWXJ14fyW?=
 =?us-ascii?Q?GctPvJPKhljOn2pRJ18YThHq2A4x9TvFCzhmzNVcA8oaUUr4l/kz7NcjoPek?=
 =?us-ascii?Q?7gCP/r5f+eVIz7ypP56g0wjUXTWo+nhvkVkcn9GV2aUs9OyqNic9MLdmYgiZ?=
 =?us-ascii?Q?snr33ulpjw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RU6QmWcu4aOPwNO7PWmtEEXiBkr3xp7CF5Nzu7IX5tChLMie4K8Y4MoF1AcUglwCDE6306Rw8S3Zzf6OiG8LAU9R+pWH+p/ZFQ/e4L3macTgbDm1IIBeJYKPKM4ZVr0s3//zPsRjtb8hwcY4HzWfG4SBZ++bgSmhcrKzY5gojLlUZKdmYYTlQouO5cO3COl5GQ5Noaffrw3PM1p1M1FlMmKCaPsu6BqSBC442xWs1aZF1eKi7X6X0Sxyzuiq0pXjBEboNM3IBGHV8I/bi6R3qaApizkkCGOGnYofCCC4x/yOeA3eYwxHOvHmiDhiTFFLytZCdsfLoY/L+w8nJFiy1A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f44b072-3cd3-4b24-4b6f-08de9f6e3b13
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 06:21:31.9086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kC8kBu1RhIBTcs9nBqfRGL2bIhJCUWr7ijOFW+HxrxH0kId+g1GTLjE0NGqC9kAuSiFty5ENp23hIrBPQPSz74nktcYXBDykxDbGrPrY3JU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4761
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



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: 17 April 2026 14:28
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi=
,
> Mallesh <mallesh.koujalagi@intel.com>; Purkait, Soham
> <soham.purkait@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH v4 10/13] drm/xe/xe_ras: Add support to offline/decline a
> page
>=20
> Add a helper function that sends commands to system controller to
> offline/decline a page based on user policy.
>=20
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ras.c                   | 51 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h                   |  2 +
>  drivers/gpu/drm/xe/xe_ras_types.h             | 37 ++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +-
>  4 files changed, 93 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c in=
dex
> 347844b3d2bf..cd1ac6441b92 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -268,6 +268,57 @@ enum xe_ras_recovery_action
> xe_ras_process_errors(struct xe_device *xe)
>  	return XE_RAS_RECOVERY_ACTION_RESET;
>  }
>=20
> +/**
> + * xe_ras_page_offline() - Send page offline/decline request to system
> +controller
> + * @xe: xe device instance
> + * @action: Action to be performed (offline/decline)
> + * @page_address: address of the page
> + *
> + * Returns: 0 on success, negative error code on failure  */ int
> +xe_ras_page_offline(struct xe_device *xe, enum xe_ras_page_action
> +action, u64 page_address) {

Where is this used?

Tejas
> +	struct xe_sysctrl_mailbox_command command =3D {0};
> +	struct xe_ras_page_offline_request request =3D {0};
> +	struct xe_ras_page_offline_response response =3D {0};
> +	size_t rlen;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return 0;
> +
> +	if (action >=3D XE_RAS_PAGE_ACTION_MAX) {
> +		xe_err(xe, "[RAS]: Invalid page offline action %d\n", action);
> +		return -EINVAL;
> +	}
> +
> +	request.page_address =3D page_address;
> +	request.action =3D action;
> +
> +	prepare_sysctrl_command(&command,
> XE_SYSCTRL_CMD_PAGE_OFFLINE, &request,
> +				sizeof(request), &response,
> sizeof(response));
> +
> +	ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "[RAS]: sysctrl: error ret %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen !=3D sizeof(response)) {
> +		xe_err(xe, "[RAS]: sysctrl: response size mismatch. Expected
> %zu, got %zu\n",
> +		       sizeof(response), rlen);
> +		return -EINVAL;
> +	}
> +
> +	if (response.status) {
> +		xe_err(xe, "[RAS]: sysctrl: Page offline command failed with
> status %u\n",
> +		       response.status);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>  #ifdef CONFIG_PCIEAER
>  static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe=
)
> { diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index e191ab80080c..ec59258eb3df 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -12,5 +12,7 @@ struct xe_device;
>=20
>  void xe_ras_init(struct xe_device *xe);  enum xe_ras_recovery_action
> xe_ras_process_errors(struct xe_device *xe);
> +int xe_ras_page_offline(struct xe_device *xe, enum xe_ras_page_action
> action,
> +			u64 page_address);
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
> b/drivers/gpu/drm/xe/xe_ras_types.h
> index 020e3f92a057..d76310866da5 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -30,6 +30,19 @@ enum xe_ras_recovery_action {
>  	XE_RAS_RECOVERY_ACTION_MAX
>  };
>=20
> +/**
> + * enum xe_ras_page_action - Page offline actions for page offline
> +request
> + *
> + * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to remove page
> from
> +queue
> + * @XE_RAS_PAGE_ACTION_DECLINE: Instruct firmware to mark page as not
> +offline
> + * @XE_RAS_PAGE_ACTION_MAX: Max value for validation  */ enum
> +xe_ras_page_action {
> +	XE_RAS_PAGE_ACTION_OFFLINE,
> +	XE_RAS_PAGE_ACTION_DECLINE,
> +	XE_RAS_PAGE_ACTION_MAX
> +};
> +
>  /**
>   * struct xe_ras_error_common - Common RAS error class
>   *
> @@ -260,4 +273,28 @@ struct xe_ras_memory_error {
>  	/** @reserved2: Reserved for future use */
>  	u32 reserved2[2];
>  } __packed;
> +
> +/**
> + * struct xe_ras_page_offline_request - Request for page offline
> +command
> + *
> + * This structure provides the request format to offline/decline a page
> +*/ struct xe_ras_page_offline_request {
> +	/** @page_address: Page address (4KB aligned) */
> +	u64 page_address;
> +	/** @action: Action to be performed (enum xe_ras_page_action) */
> +	u32 action;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_page_offline_response - Response from page offline
> +command  */ struct xe_ras_page_offline_response {
> +	/** @status: Status of the page offline request */
> +	u32 status;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 00a0f05aab32..2cafa8a14cc3 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -14,9 +14,11 @@
>   * enum xe_sysctrl_mailbox_command_id - Command ID's for GFSP group
>   *
>   * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Get basic error information
> + * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a
> + page
>   */
>  enum xe_sysctrl_mailbox_command_id {
> -	XE_SYSCTRL_CMD_GET_SOC_ERROR		=3D 0x01
> +	XE_SYSCTRL_CMD_GET_SOC_ERROR		=3D 0x01,
> +	XE_SYSCTRL_CMD_PAGE_OFFLINE		=3D 0x08
>  };
>=20
>  enum xe_sysctrl_group {
> --
> 2.47.1

