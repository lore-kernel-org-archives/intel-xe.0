Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4072C5472D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 17:31:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B0010E1FA;
	Mon, 26 Aug 2024 17:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bAxJaX5g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADFC10E1FA
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 17:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724693471; x=1756229471;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9f9I7rf2ZO7d2PbhjiJ40G7AG3YgvUhK3v/0TbWE0/M=;
 b=bAxJaX5gufdy3/x4RVKS/UTUMkCzbi3XYnWAIPT1TAxV3pQTIQPFZPsF
 JdaJmuVDfBLKSlZ3rBhMz47gBDzIGqtZ9lnTzCkDniGdfW6p6rW+eIWiZ
 cuyyTQteMqW1XOV/Yt3p0ue4prv1WRxRCOdPatNKTawYL7zjcCcpCt5ny
 WuPjkmMDgG9sVKD73eD79VnCB3cM7mE6BQjGsJfJbwoeYplpQSZeBVm49
 GWR3Wl6ItH9u7KxuWCpktNKsE5g8VEWCZvWtTieEbKPm272cNRylRNg9P
 inN2aA6SY0uAS5o2U0Sm35o7Bt/PVsnnaQT4p+7QqWNdvAnpXLXH/2fYY Q==;
X-CSE-ConnectionGUID: FiYKEkYKTvKQEm1oEKTjxg==
X-CSE-MsgGUID: pQ48AAJeToKq2gYabNRPeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="27015378"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="27015378"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 10:31:11 -0700
X-CSE-ConnectionGUID: O7OxHaCTSeCRgoMGDVFQOQ==
X-CSE-MsgGUID: CtslzGHVTsG9fyajxOQAjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="62749225"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 10:31:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 10:31:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 10:31:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 10:31:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMgq+Rh5MzBI067gSyRJZl+tCEfjXzlxL4lgo6gQOJUgF9XjhLjHOx3T4mQIDH0yLKDYOzMNg74SF8V46fzmJ8uI87nvBHFoI4BtcfI+/GozjMOlXJVJuZeYBoXPrlp6PB+uOBvgldfeG7woW+gg0GPXdCDfv7Gntdnsh4u/3c67jKVKr/BoI7vEQoCuZlyvVS/MiwsnLk1I0HmjFtD/1b/KCadVAiqmxWhMnqH+0xne2Mnp6rvmhMSTln/aT3Lbej6ntdDP4VlHxoWLNkXupilZwZ54IhsGwSY3o+zhEQ1sDAVdfbZaWWnljpvjHGgXSC41vkMWt/jE84d7P7tqiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBlP9+0nv12KcbB1GBELpKiuyYSWKYlcRMUs1DJ5cU4=;
 b=ExbgaJfa+pSTMHmmaVBIeZxWkDZhJl5RMQd60nUyb4MMEiFCafFroiyElzrt5Mn2HqDPurmZ0zrQOtbQT9V+HPg7VwNpRiVz5dTbMa4cInRqH0zpGFMbHAu2maubcIfeOfWO6Yk2hm5bRIqTZpUJ/hILhgXINGC4gbWkR1qmsquMFYyiGCw05x8kcmjhmB6ezZJyhMJ1+WwqZh86H2koMyWcEt933mw7gePVmaB4NK25pyNmODQOp+D3zWb8B49PtOWMzogzNvWs2OMzlwcwAwsptOf4V3h0Tdui7vqNgMufJRi+MgBnx4L4PhQQxRwJOPpygEFzA2dqkccQSSesjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8360.namprd11.prod.outlook.com (2603:10b6:930:c3::9)
 by SA0PR11MB4750.namprd11.prod.outlook.com (2603:10b6:806:9d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 17:31:04 +0000
Received: from CYYPR11MB8360.namprd11.prod.outlook.com
 ([fe80::4a38:8db0:72da:d89a]) by CYYPR11MB8360.namprd11.prod.outlook.com
 ([fe80::4a38:8db0:72da:d89a%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 17:31:04 +0000
From: "Cabral, Matias A" <matias.a.cabral@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Degrood, Felix J" <felix.j.degrood@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ranjan, Joshua Santhosh"
 <joshua.santosh.ranjan@intel.com>, "Chegondi, Harish"
 <harish.chegondi@intel.com>, "Kumar, Shubham" <shubham.kumar@intel.com>,
 "Ausmus, James" <james.ausmus@intel.com>
Subject: RE: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
Thread-Topic: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
Thread-Index: AQHa8C5c+HX32gF1pkG4mkU3pdLp9rIyILYwgAHLLoCAAXjQgIAEamkAgAAKlwA=
Date: Mon, 26 Aug 2024 17:31:04 +0000
Message-ID: <CYYPR11MB8360E6440D35516CFF554555B28B2@CYYPR11MB8360.namprd11.prod.outlook.com>
References: <20240707224141.2865472-1-ashutosh.dixit@intel.com>
 <20240707224141.2865472-2-ashutosh.dixit@intel.com>
 <878qww3xh8.wl-ashutosh.dixit@intel.com>
 <CYYPR11MB83605299AB7259BC17AF3E38B28E2@CYYPR11MB8360.namprd11.prod.outlook.com>
 <87frqwyxsc.wl-ashutosh.dixit@intel.com>
 <3cab72ee68db99761ad07c6b8d8127b7d84ee77f.camel@intel.com>
 <87frqrtelv.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87frqrtelv.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8360:EE_|SA0PR11MB4750:EE_
x-ms-office365-filtering-correlation-id: 6e4e3668-30c3-425b-6b2f-08dcc5f4dc89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ohETqhGA+Duz93eHirqMpr3VO5fXJVbA2R7YS1nuWDe79Qc0wWIrNpt+H2LD?=
 =?us-ascii?Q?ygmyKlvfOnAhgR0/+8Re9231P2zVUfu7/Ts+5buujz+N3f4pGeRnmbE28noi?=
 =?us-ascii?Q?1olj54iwyNULhTpX0OjfoeOcNBI7k+nMNFd3ruqVZvNhzp82IL/0J8z4coQw?=
 =?us-ascii?Q?6MI3ltuLa/dXvcWragS5yYM1MBqe4QTBGQA93HhaTABVI6zffMva7ww0mu1K?=
 =?us-ascii?Q?rdY/+NJKOUYhA+pqjpQiFBLHNQ+V0HdVxfcSUBqAPRoQ8KWzmmgawXpWGJ00?=
 =?us-ascii?Q?O9Ge3xbCfTslVljlnN66bNhb8EVtK1SID/+s9M+uU5SQE5yxv7l5Vy97DQoS?=
 =?us-ascii?Q?o78+n3nEtQ3DmsqBsFvxzaQeIL9rDp9nj7HXVMoKtrHrS59aQTNIdtvtxWp7?=
 =?us-ascii?Q?EG+pzZ2PbcKN6LGfCM3VC9MKi709elLYpc1nSJ9cqQ793GSc4AsCOTJDlzNM?=
 =?us-ascii?Q?Y7f/6Es3hS1y8ZYyD4Ugp1+ezlyUu42oM/KtKxX/dONXbIGWlY5PkcOSuHFG?=
 =?us-ascii?Q?O26C9ZuT0lfjjlX8jXvT6UQ2NE9BUESX+vxfvziLybyGNtHq/SdM3wVOxNpE?=
 =?us-ascii?Q?xKXib/wlrLc0hUMTe3MN1ilyr2ZhgoSHHjEt5Cm+UGc7ImJGzFWwTtfuaaaT?=
 =?us-ascii?Q?S16tFJPP+/pjKd9j5v004IeeZxNIRc9WSs4YF70eO8EWqvc9SuXD35uFj0BS?=
 =?us-ascii?Q?lFR21GifuosI3WieeGVKWARZhgXDwoBb7Q3GHWqg6+ZYB0wzEKHIUyWTK7jC?=
 =?us-ascii?Q?B+ShIQJKqMg3E2RfTqJdCrM5aNTibXSEXaNSyERK5HOctAH1i18m7lDniu/O?=
 =?us-ascii?Q?cz0e7ax4AGoKKQMxVfAcchktkgiz/45eUl/5H58Xb44aDvz45d9CtA1DtTjK?=
 =?us-ascii?Q?lGrD3pEChzwa6WSs2d4NkJE7qDONsuaAsu6iU68yKdUuxUxGOgd5tpdZfUaG?=
 =?us-ascii?Q?KLKJw2atVuupVVsz8eyrRO8WvlkPH8Dp4yhgdFLxO1AuLm0I0/E3vN/dzqzn?=
 =?us-ascii?Q?ccWP6npgXkjYYu8GnxMchlLnnRuJKmg/ERUGWq0Jy18QFrVLBQTQiciBkJO+?=
 =?us-ascii?Q?wo1nvyeFhsAfNxifp/QvbKAGulZ8qsAoA+r1hZSmG+/BZDk0VyktYK1coKSk?=
 =?us-ascii?Q?r1HG3jzT2H505SwELB0K1KFxCT+9SLNZ7k6poNfxKe2cqDK2JlhUszvDZCTJ?=
 =?us-ascii?Q?V/BXq97mL2d0Kw21exGowGOOlFCgQkmhAMetERnUFEoqu5sJUxXdOG5v8+R5?=
 =?us-ascii?Q?PXWqTO/qd/gkiuwhDimUoyUH84KDaq89QfYavkYxoIbpDYh6TQTrmrR8202e?=
 =?us-ascii?Q?ApPkpCbS7oCDYnekoBfvfMFnRz4LbTIoWBzGOMSLMTsOTAFVQ6UzXqLCw5GZ?=
 =?us-ascii?Q?Vpmz+vg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?efvdmHWl8NnPR7Tyng5A6HlGsG3RXFWhej9GTtOA7gBCD0NHcuRUnpUHZ6Eo?=
 =?us-ascii?Q?m5SOBCMdyTizfOZgpuaLg5FFXCSStBiGP0YgfoSiNavLqKZKgHm2ftEcXYu0?=
 =?us-ascii?Q?mVT3lUUS65EaimMsomHx5m8NE2kobvFx02ibKC0D2DS/TF6ocLl3w44uF4sc?=
 =?us-ascii?Q?K561z6Rb3KOakM7RaWjMmJ0d3lGQsOsvn1Jkprb+mPuZQgwNmpb76+55IvRE?=
 =?us-ascii?Q?XcXR1QMjnTW1BKvGlk0JTcpQv1PymdcDb2fmhXCLeXUKYsIbIXBY7valWA2G?=
 =?us-ascii?Q?i1mWpaK0w/hCQa+hPULmqMYVJgLgVWPHrKW2+qz0opDIwOkbAwCFdkgKH+OT?=
 =?us-ascii?Q?4oY30PPnDyfTgIYoxf+Fl/ioxjz6V5g7PPN8YF9PTqO5IKerVFBrAzU3l0hy?=
 =?us-ascii?Q?P6HciWiWDssMI9cNv+icRxKz8cyrIqMldZzhsdrubZBcnndehCTfdEr2REKC?=
 =?us-ascii?Q?/PIwp7KuNaMZgb0ialIgEkLjXaqCj8Y2DaHNzHirZCQRcKQARLVCT4kUnzQJ?=
 =?us-ascii?Q?MT0CZZ62BNpr7Dp0uPkVRWv885e99bsBr/uezO0IWKZaIgZyjfj68Epv6hge?=
 =?us-ascii?Q?KnG9gaHjLxMfreLYhc+ywfrhwhOGQGlgt4m7bmRtvsc3j3dG/sH5Yc3wVi2O?=
 =?us-ascii?Q?eIG0Bqhm9HtYJ8L8bTk57i9R1FCUMp9H/nhgAEz0YwulxUAFty+E0Y/3rT26?=
 =?us-ascii?Q?tIzEOXxC7WQ7U+iITSnxDtp9lytQFqFKJxd1ZcTFUC9goaY93tqSCXTB3b4j?=
 =?us-ascii?Q?glpadTpVw+c1g6VDOszT3YnLf90dxZ+707/nwAzoxkRNUYsJrD8Lb+sNg2vP?=
 =?us-ascii?Q?rAC3MaELzrXO3b1wGZ8a18H2L+86HAnCcxvumngSKUMBooUAQe22sYP0K1yH?=
 =?us-ascii?Q?iTbQqO0gOfj4yNW/JLU6+rIIS6rRNrlFedzXb1Dzi5rwUSI/pXy4UrLmmZKE?=
 =?us-ascii?Q?5X3MDHiAbT9OuyCfH+qsRJHsSPivBGfMz3J9n9eDgffvt4v6MYCxHopIa2+W?=
 =?us-ascii?Q?xm+kel8tY+DqjoJOmLE/iuYU9AIeTNkZQyCOzjQcsq4m1Np4W1hTT3ST/38E?=
 =?us-ascii?Q?3T5vv2nHB8aQg+4BiW66YyHX1NTjapZQ0LB2IryOHCeusW3wv1z19SQ0lewR?=
 =?us-ascii?Q?41WDE3tUBbSrGGjhF2w0eh1nB2i0pP1CDJIF9g2tiKgBI1cCmhUhygFnpgOx?=
 =?us-ascii?Q?hPJb3f6xU+mV1oTYPrerEdROcEp6cfz7hZGZ2SVy2fL2yMB09uE32AFmlnQU?=
 =?us-ascii?Q?kS81MlH81OnOajEqwfduGUFfj2ej+miZRV09oz85lN5qVuzmo6Yc2Yowtzmh?=
 =?us-ascii?Q?wj7V3zJnB9g13xso5Fxj3yGV/HLqX9zTcHFfw47MZ4DMyK94vOAyaahKjAe9?=
 =?us-ascii?Q?aVBTl5foOD3SCQlALb3tiOLWUzWw7/0sIX4OzihpoJNmgGdxEIpp/urNTIOg?=
 =?us-ascii?Q?sxQlmyslFmtaYcjXz7NEtalt619osc0a2yP7DGDtxEyObFSQsweuUHRvOQD3?=
 =?us-ascii?Q?7wXemf1MhBvlP5a1l/bKVa8KF1AsWZSM3cNef/+9Z186PflXLv7pxw/3FvJ1?=
 =?us-ascii?Q?nxM0+vT+qdyydmmNb+NbwK5MFX9rh8e5ZXUpcJTL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4e3668-30c3-425b-6b2f-08dcc5f4dc89
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 17:31:04.1911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZkNCvC8pX/4jH90IffPX3bY9ERhq+MBILLTjQz3HjlsJvs/L+M5qS2AvShGnPzUqXmxefeIaxutgPdEgTiEVSAaEXOvRKiBg/HB+8Vwu4z0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4750
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

> Matias: could you please explain what L0 does with this dropped flag?

During the processing of the data, L0 returns a warning message. VTune ( I =
think) also warns the user that results were collected but will be inaccura=
te because the draining/reading of data was not done fast enough. By moving=
 the warning to be returned at earlier/reading step, VTune may a) on the fl=
y increase the reading frequency reducing the amount of data lost b) cancel=
 the collection immediately, saving time to the user that may collect data =
in one node and process in a different one.=20

Thanks,=20
_MAC

-----Original Message-----
From: Dixit, Ashutosh <ashutosh.dixit@intel.com>=20
Sent: Monday, August 26, 2024 9:48 AM
To: Souza, Jose <jose.souza@intel.com>
Cc: Cabral, Matias A <matias.a.cabral@intel.com>; intel-xe@lists.freedeskto=
p.org; Degrood, Felix J <felix.j.degrood@intel.com>; Nerlige Ramappa, Umesh=
 <umesh.nerlige.ramappa@intel.com>; Ranjan, Joshua Santhosh <joshua.santosh=
.ranjan@intel.com>; Chegondi, Harish <harish.chegondi@intel.com>; Kumar, Sh=
ubham <shubham.kumar@intel.com>; Ausmus, James <james.ausmus@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampli=
ng

On Fri, 23 Aug 2024 14:22:19 -0700, Souza, Jose wrote:
>
> Hi

Thanks Jose. One question for Matias/L0 below.

> On Thu, 2024-08-22 at 15:53 -0700, Dixit, Ashutosh wrote:
> > On Wed, 21 Aug 2024 12:35:51 -0700, Cabral, Matias A wrote:
> >
> > Hi Matias,
> >
> > Thanks for responding, the input is _very_ helpful.
> >
> > Mesa folks: would it be possible for you to provide similar input too?
>
> Felix's MR[1] is only using record_size and num_records, if the
> drm_xe_eu_stall_data_xe2 was the same size and the sample we would not=20
> need the header at all, inline replies below.
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30142
>
> >
> > Thanks.
> > --
> > Ashutosh
> >
> >
> > >
> > > Hi Ashutosh,
> > >
> > > Some inline questions below [MAC]
> > >
> > > Thanks,
> > > _MAC
> > >
> > > -----Original Message-----
> > > From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> > > Sent: Friday, August 16, 2024 3:38 PM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Chegondi, Harish <harish.chegondi@intel.com>; Nerlige Ramappa,=20
> > > Umesh <umesh.nerlige.ramappa@intel.com>; Degrood, Felix J=20
> > > <felix.j.degrood@intel.com>; Souza, Jose <jose.souza@intel.com>;=20
> > > Cabral, Matias A <matias.a.cabral@intel.com>
> > > Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Add support for EU=20
> > > stall sampling
> > >
> > > On Sun, 07 Jul 2024 15:41:41 -0700, Ashutosh Dixit wrote:
> > >
> > > Hi Harish,
> > >
> > > Some comments below on just the uapi first, towards finalizing the=20
> > > uapi with the UMD's who consume this data. And also comparing the=20
> > > uapi with what we did in OA.
> > >
> > > >
> > > > diff --git a/include/uapi/drm/xe_drm.h=20
> > > > b/include/uapi/drm/xe_drm.h index 19619d4952a8..343de700d10d=20
> > > > 100644
> > >
> > > /snip/
> > >
> > > > +/**
> > > > + * struct drm_xe_eu_stall_data_header - EU stall data header.
> > > > + * Header with additional information that the driver adds
> > > > + * before EU stall data of each subslice during read().
> > >
> > > One question to resolve is if we really need this header and if=20
> > > UMD's are actually using the information in this header. In OA we=20
> > > dropped the header and are providing information in the header via=20
> > > different means (see below).
> > >
> > > Another option is to actually add a property for the header. So=20
> > > headers are added only when user space requests headers.
> > >
> > > > + */
> > > > +struct drm_xe_eu_stall_data_header {
> > > > +	/** @subslice: subslice number from which the following data
> > > > +	 * has been captured.
> > > > +	 */
> > > > +	__u16 subslice;
> > >
> > > Do UMD's use this subslice information? We should check with L0 and M=
esa about this.
> > >
> > > [MAC] L0 does not currently use this.
>
> No usage for sublice at the moment in Mesa
>
> > >
> > > Also about whether UMD's need or want the header itself. For OA,=20
> > > UMD's were happy not having to parse the header.
> > >
> > > > +	/** @flags: flags */
> > > > +	__u16 flags;
> > > > +/* EU stall data dropped by the HW due to memory buffer being full=
 */
> > > > +#define XE_EU_STALL_FLAG_OVERFLOW_DROP	(1 << 0)
> > >
> > > In OA such information is returned via=20
> > > DRM_XE_OBSERVATION_IOCTL_STATUS. For EU stall, e.g. we could=20
> > > return a bit mask of subslices which reporting drops. So similar=20
> > > to OA, we could return -EIO when HW reports drops and userspace=20
> > > optionally issues DRM_XE_OBSERVATION_IOCTL_STATUS to retrieve=20
> > > which subslices are reporting drops.
> > >
> > > [MAC] having a return code to notify of reports drops would be=20
> > > much preferable. This would allow the UMD detecting this condition=20
> > > during the read phase without needing to process/parse each report.

Matias: could you please explain what L0 does with this dropped flag?

Harish: do we know what is the reason HW sets this dropped flag? Is it beca=
use userland is not reading fast enough so HW is forced to drop data?

>
> But what can UMD do when that is set?

Mesa can ignore this if they don't need it.

>
> I would rather have a warn once printed on dmesg, so the issues don't=20
> go silent but it don't need to go to the uAPI.

dmesg warn is likely not an option because it will trigger bugs in our CI.

>
> > >
> > > > +	/** @record_size: size of each EU stall data record */
> > > > +	__u16 record_size;
> > >
> > > This is static information. Does it need to be in each packet header?
> > > E.g. it can be returned via DRM_XE_OBSERVATION_IOCTL_INFO after a=20
> > > EU Stall stream has been opened.
> > >
> > > [MAC] since the size is constant, it seems an overhead including=20
> > > the info in every report.
>
> drm_xe_eu_stall_data_xe2 should be of the same size as record_size so it =
can also be dropped.
>
> > >
> > > The INFO data struct could also include a capabilities field. So=20
> > > if new features are added to EU stall in the future, they would be=20
> > > advertized to user space using the capabilities field.
> > >
> > > > +	/** @num_records: number of records following the header */
> > > > +	__u16 num_records;
> > >
> > > This will not be needed if just return raw EU Stall data without=20
> > > headers. Or even otherwise it is probably not needed, it is the=20
> > > total size of returned data minus the size of the header. Provided=20
> > > we return all available data.
>
> Same as above, would not be needed if drm_xe_eu_stall_data_xe2 matches sa=
mples size.
>
> > >
> > > [MAC] the KMD will always return atomic units of reports, right?=20
> > > Then this is not needed, having UMD the possibility to query=20
> > > report size when opening the stream, the UMD can know how many report=
s are in each read.
> > >
> > > > +	/** @reserved: Reserved */
> > > > +	__u16 reserved[4];
> > >
> > > This can be handled via 'extensions'. And if headers change they=20
> > > can be advertized in capabilities.
> > >
> > > > +};
> > > > +
> > > >  #if defined(__cplusplus)
> > > >  }
> > > >  #endif
> > > > --
> > > > 2.41.0
> > > >
> > >
> > > Thanks.
> > > --
> > > Ashutosh
>
