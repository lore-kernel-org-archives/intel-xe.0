Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F03CA5FF0
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 03:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A26310E09E;
	Tue,  6 Oct 2026 03:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OwmuCi+/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F48710E09E
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 03:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791258947; x=1822794947;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=27ByV7p6uOsKDLVkkjTeeLSW8lJmiCsKmsyyp2+aaOI=;
 b=OwmuCi+/r/XhWvfJMS18mxIaq+7lvZ1obafMOqULtgPL/OIz3PC7fi5B
 RToUIEH/L7+9QTRw51ZRbj6MqWVysKnWkHJpb5o5uDO8Mc+JFfgkGrX61
 v4kBr2r5hNkaXILD4LwqWZyt8ag/B2nUHe+oayMoNn9J9zvM6IZorajQo
 m4XGgpmqsrDz/3w8rJW8EiySvGYuqDkXE4bGql51y+VL/ORUSGyuUWtZI
 4FUu7pgHcq8GhQAbQzFxauASXsaBGZIBveFz7rJa3OcpDeUEmSNMRX562
 Ru+S7kMBQ+4ex3sOT4VSwELa2zDzqC1eEmMJTIbUw+Ba4e9uZtJLyuJ34 g==;
X-CSE-ConnectionGUID: x1FJaY1ESBu31yveF0V2Xg==
X-CSE-MsgGUID: WbHsnsKYS+qeLH3yHIKwsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="79498960"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="79498960"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 20:55:47 -0700
X-CSE-ConnectionGUID: ZyBlYHDrSOONLe/wUcZwIA==
X-CSE-MsgGUID: vd2O2iinS5Ob95qTEIxb1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="281802332"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 20:55:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 20:55:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 20:55:46 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.67)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 20:55:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kD4jhXVGs9W3HMgH0EA1agT4BLDW8+fab8gma3395+wALb8M/JEFlZkzQE/I9Fl1HBTEpI0ZPLAXCprumduMZU9x3SrE6lS+v5qOWNNCMUpyYY0jSW/iaPvu7+CqPrQMsmEARmfPnz4X2JfOW++/8efjv4z26RWEVTKm5xOjVzHYupvs21w2uB6dX4HtS0taQB8KF+vsIw+skKo70J8Ji7Un370JWzJwM3/351cQklwrB7z+Ft+7m4jf7VMgxyDqGWK+9DZlFflChm8ScKc+BcU6KTs+mxoACmh89f41BqadCn6jncjUO43qflnoPphVQe7e78CcsfBKyiS2jE59iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4M1AWPj7h6l8PyS77BbARBsAJFyIRnydnBDSAkRQWXU=;
 b=A4HnN+WuLEBCEqRNKMvFAXFfClwoE2Gi5YoVoJ2VPke8jXGZkT7wliqIe15jUNxi+Os84em+FVNqGNzpAd1/IGzK1k9O94CKjf+fWbJT8Y6orjCiiHPO5qgkO1ipgwpvVCDIdnFU7/GQcx8kBHP/K7Tp1lDJ8vTXI8E5hSeiQqpuK9bNHGnDEMbtJtHXa0m88G+WGyumCJVfkcxm9iRubZfej5QfQ+FTfcfi8K5R3Ary9mMR8hEFpL/Iaq/bqRGg/+uJvrHj/kOLJ7DlSmwT2mcztdDzb0I9l9s0z5I+pvBiHZu5s9BtVvdw4T85PU0S55jRQ+/C/vHjnIcFj6JrEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by CY8PR11MB7825.namprd11.prod.outlook.com (2603:10b6:930:71::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 6 Oct
 2026 03:55:44 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 03:55:44 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v4 3/6] drm/xe/xe_ras: Add support to query page offline
 queue and list
Thread-Topic: [PATCH v4 3/6] drm/xe/xe_ras: Add support to query page offline
 queue and list
Thread-Index: AQHdVKhAD1docXPVdkSj3OKnV+g457buz/1AgAETTkA=
Date: Tue, 6 Oct 2026 03:55:43 +0000
Message-ID: <DS0PR11MB8718657531C7847104A807AB81952@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261005090156.1233748-8-riana.tauro@intel.com>
 <20261005090156.1233748-11-riana.tauro@intel.com>
 <DS0PR11MB871825E717FD05B9DE95144381962@DS0PR11MB8718.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB871825E717FD05B9DE95144381962@DS0PR11MB8718.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|CY8PR11MB7825:EE_
x-ms-office365-filtering-correlation-id: 1a3f9405-5128-447b-f2ed-08df235db247
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|10067099003|56012099006|11063799006|4143699003|6133799003|18002099003|38070700021;
x-microsoft-antispam-message-info: 8LwMB6FMTJWOmuvOU7lHhKtvB5Jzu/6E08Tx7Ap5X8qh7p9MYGCF6KEB9B5RLzKXk4WtzrPzyAvrf7R/Af4szQbdF6c5/ejOJlyP5K1SJI2cAMwhpFYEAs6U4NTC5O1uxc+tVrvEDHkvuy2ZOToyW1wtCepZ101osmNAjYLSUleIH6OdO8PJrCPZC04+CC5Z8e4thgV59M5FyAr96CUhdHFSCHknJO2dxR5HyHkFdAbn5LazqjX3PZ5XhPUNxjDk7VEUBh3AZndWlMlFGP95INtNmATmK1u6d04rni9AhxO5jzi/bg4cpDD/RUtzO+j1nH4ve12UQDHKWR7msmExKNNkPChXEgfSPmbIkEY4CXyVieKgIIedgc3vRuqu3tSbJ1uAPn3eqt3hiKX8vbDRtYS+kGGYisparwXIcAjcy9XCTZRhDjgau9JWEaB4gBi5I0HTD+AyaR8qwocS+o2zliQAvjqPtnr0Q+h8yraeAFhN/7ufwoF/ZRUPDoO2/i/AJ2zM8kuNz2fFctnWUtkGGdWlfiyj0ro9AQEdoJW0t1DmfxbROqENMZlK84n4CkpF5C+e2tZx+FRVZvnT99Q/dlKLDAgcDl4/Dop/aZMi7sNNLNEQ5569AMTyuIjWSGaYnCnpo0c9UzSyfxJos3bfoFb3mGRO7p4iW3rmEnjTEsXL8bV7uBOil/+TH+RwJciqXPTmko9mVO9m60oHh6IrZtcPW77ewu8PDBx//nclryg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qIn0PeQB1cmLX1i/T/8SlZNi325edClY6ERG16MWPdILQ6Gyuwar/zr1TmVh?=
 =?us-ascii?Q?5xvZGOGU1XV+nLyHaPAEAMHy74iqR45bmiDV36xEGOgRvOaGJVbEEk3FMMqs?=
 =?us-ascii?Q?YytTYWyL46trsHv+0Qu0FEoOJB8O4OCGIGGgxb4HwKHU2QP3YW+DNnugu7ok?=
 =?us-ascii?Q?tS0Ot38Mal3t+0Fp/OSjzPzmva+HbrZ/yCGp0/jUlIpSAzHdPYJLv5HSbddw?=
 =?us-ascii?Q?6AVDzUII+ShWu5xzmCh7ZsKkC9W2u1nua7vpjjNN1B1aZCFasDFsaJbZjYYD?=
 =?us-ascii?Q?mXo3q4EXGEFO95/WRWvjfmxAeRlpfCbYzGaK39vLuPh6ASf5fTiiFAysZg8Z?=
 =?us-ascii?Q?NBPypOO3dxcpuFSdfs88iFU3PDVQy0QGXh3B4oNV1QpESZxybhYMccgO0X31?=
 =?us-ascii?Q?lni9oqH5mMptVCvGnMDUsqJF+UBg3wDAJufjK+We1iyrQyHvy8K2PzDYfnp2?=
 =?us-ascii?Q?KxvO9Mpu0KiPru88AiKxmPSXIedU5hsd+HNq70e/fRzzW1uuyUq81IfnrUWr?=
 =?us-ascii?Q?uMHc4Al1h+8P1BaGOazPpm8cfguDwCNR7Ikfx5/DwJUT/o/T1GgLxJFAtEtW?=
 =?us-ascii?Q?AaqieKPFBKE/7mZOhk7TBAdni2fFCE6Wigzgz1HSuqPYZT0ztys0L2R/tS11?=
 =?us-ascii?Q?ccQ//cb0+w7MUy1hNhfHQbmHFA31TMzwWC3FwJ3ymESoXjRZyAtLc0LVMjd0?=
 =?us-ascii?Q?Yun7zpcLiPPWbIBk4iwTZab9UvTp2nKkuwm6rItV5CCcREHFnF7CIBXUJgc/?=
 =?us-ascii?Q?GAeNoMI0c10MNFQjDzsxeaiRnw8wlxXeiLZiOurgSrwEVUCnuc/mY3kGr5GK?=
 =?us-ascii?Q?CbTCQEw6maY5wASUWXD6PJzmn4/+o5yAQbikC4F+abvh92/80bGddcKllC0e?=
 =?us-ascii?Q?IwFb1tf+wagNYnLRpLhxodtwmBlROCVKHigHcsAz01olHQtwgeAek4bsfGYL?=
 =?us-ascii?Q?VarLhz3tQgAVecZZOdLTswHyzt6ZF7uOYeA1YSEFZuehBYR62dDtdkSiW/fv?=
 =?us-ascii?Q?8jyO3UcousDPPPKTP4bNvqhYV8McTufhWn5nPumCu+9DJ4AS0/926IMphSz6?=
 =?us-ascii?Q?Z9V3rzeOF3bCinEbdphQLap6+jHwT9u9L9Ix2Ixfp+Jo10RvBcpnSfhBamd9?=
 =?us-ascii?Q?z8/fiMFNzKdGtLN5nJD2CQIIH7kSb0wTj87IyfDGhx3AoS0klVb2WBWW72hi?=
 =?us-ascii?Q?/tERYm+62VgZ4tB9qyf70AFcFe9Sh77HUM5Z56xESuOiBCuPyQbOFw46Z0j9?=
 =?us-ascii?Q?8lHK/EM0kQF3yG44oyK5BTTg9pk9DKY9vXmjNFaRb4apWmID2kZk0IchHCR0?=
 =?us-ascii?Q?Ti6Rg+HbjklEEtlwE96ivh0AZh9vL9DXcfzw0fPKL1q4nKaMpUOsjGSUpxz2?=
 =?us-ascii?Q?p3Q6DWGPeo8tCeICrFctM9FEPQS5gUtH9YffDsZl0LiS1h5zz19GDA8SBWzo?=
 =?us-ascii?Q?sEUXMTJ96qUQpekhcfOIC9rAdPNDK3fF7TtKcxMGesQOdp33HlpgoEtj79G1?=
 =?us-ascii?Q?09Jeufcl0cxpZpF8+16b57Hd74kKvB+QrAdyApRtYf4+Du4+xfe29Yf8wrTu?=
 =?us-ascii?Q?YiSgF9n98UFnpehlCmihQWxAFjirbVuBu2VjhH2MJ+VjPftkpoQmsn3AdDwn?=
 =?us-ascii?Q?STF8iPuj6hmBVYuHoxNN29CKPEAHXWhiof5HNd8PLzDWnhn+mXRbLT/QVIap?=
 =?us-ascii?Q?DJiEaunL1r4csmcr3jEaQulc0uBLsImlWrL7UwHF06hh3tcHr2vQ/bSY3pRO?=
 =?us-ascii?Q?ZndUym/lwA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 1F6eF2rHWiwH+yYCtz4uo8xUfuihnQL9PCQQv0EILNxrFALCPYcH3as7GEZXJ8DJDU+S3gYAu6WZ/q60NaK9bDdNamH6F0Hbk9v2Ln4WIPr/duXEM39WiQ412Y2Fsky2P4FWZZQmL3f/OP38II/+w6m/tCE1IGWNBbfsTUhcWvHECQS4n8c+QsNmzeQjuV/JdEwZkkbKcRlMpoSdCRYyJNgeMag6x8RiIBy38HvZEZDqOTpJaJrM4VVCraAZge7hW1j9/sAM3aG9kV7IblKxSk5SPno05Y26c/Cil0TMNnUHalWFaRTAIynG9o3A40sHnk3+ciDdclLN3NEiizkOfQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3f9405-5128-447b-f2ed-08df235db247
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2026 03:55:43.9610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cKJiHhqyTpqCmoIhtVuRpk4H63rQRCdCWPhFrEIVzfbCfIOFrY8QBD2EHjzKJVonGZGWcPaBnvSKcxo/KHKIVdY0WPz5HqFhVGT6NeEiMhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7825
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Upadhyay, Tejas
> Sent: 05 October 2026 16:59
> To: Tauro, Riana <riana.tauro@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; aravind.iddamsetty@linux.intel.com; Nilawar, Ba=
dal
> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi=
,
> Mallesh <mallesh.koujalagi@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: RE: [PATCH v4 3/6] drm/xe/xe_ras: Add support to query page offl=
ine
> queue and list
>=20
>=20
>=20
> > -----Original Message-----
> > From: Tauro, Riana <riana.tauro@intel.com>
> > Sent: 05 October 2026 14:32
> > To: intel-xe@lists.freedesktop.org
> > Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> > aravind.iddamsetty@linux.intel.com; Nilawar, Badal
> > <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
> > Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>;
> > Koujalagi, Mallesh <mallesh.koujalagi@intel.com>; Upadhyay, Tejas
> > <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>
> > Subject: [PATCH v4 3/6] drm/xe/xe_ras: Add support to query page
> > offline queue and list
> >
> > Add support to query page offline list and queue from firmware during
> > module load. The page offline list command retrieves pages that are
> > already offlined by the firmware. The page offline queue command
> > retrieves the pages pending to be offlined by the firmware.
> >
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> > v2: rebase
> >     store total pages once per response (Sashiko)
> >
> > v3: common function for offline and queue (Himal)
> >
> > v4: re-order list and queue (Sashiko, Himal)
> >     remove type
> > 	use size_t
> > 	add description and rename functions (Tejas)
>=20
> LGTM,
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>=20
> Tejas
> > ---
> >  drivers/gpu/drm/xe/xe_ras.c                   | 87 +++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_ras_types.h             | 35 ++++++++
> >  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +
> >  3 files changed, 126 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> > index 2ec310c29489..14fc3227483c 100644
> > --- a/drivers/gpu/drm/xe/xe_ras.c
> > +++ b/drivers/gpu/drm/xe/xe_ras.c
> > @@ -343,6 +343,89 @@ static bool ras_counter_is_valid(struct xe_device
> > *xe, struct xe_ras_error_class
> >  	return true;
> >  }
> >
> > +/*
> > + * Fetch and process offline list and queue from firmware via mailbox.
> > +@notify_fw controls
> > + * whether firmware is notified of the offline/remove action.
> > + */
> > +static void process_offline_pages(struct xe_device *xe, u32 cmd, void
> > +*req,
> > size_t req_size,
> > +				  void *resp, size_t resp_size,
> > +				  struct xe_ras_offline_common *common,
> > bool notify_fw) {
> > +	struct xe_sysctrl_mailbox_command command =3D {0};
> > +	struct xe_ras_offline_list_request *list_req;
> > +	u32 total_pages =3D 0, count =3D 0;
> > +	size_t rlen;
> > +	int ret, i;
> > +
> > +	list_req =3D req;
> > +
> > +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
> > cmd, req, req_size, resp,
> > +				  resp_size);
> > +
> > +	do {
> > +		memset(resp, 0, resp_size);
> > +
> > +		if (list_req)
> > +			list_req->index =3D count;
> > +
> > +		ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> > +		if (ret) {
> > +			xe_log_err(xe, SYSCTRL, ret, "failed to get page offline
> > data, cmd=3D%#x\n",
> > +				   cmd);
> > +			return;
> > +		}
> > +
> > +		if (rlen !=3D resp_size) {
> > +			xe_log_err(xe, SYSCTRL, -EINVAL,
> > +				   "unexpected page offline response length
> > %zu (expected %zu), cmd=3D%#x\n",
> > +				   rlen, resp_size, cmd);
> > +			return;
> > +		}
> > +
> > +		for (i =3D 0; i < common->pages_returned && i <
> > XE_RAS_NUM_PAGES; i++)
> > +			handle_page_offline(xe, common->page_addresses[i],
> > notify_fw);
> > +
> > +		count +=3D common->pages_returned;
> > +		if (!common->pages_returned)
> > +			break;
> > +
> > +		if (!total_pages)
> > +			total_pages =3D common->total_pages;
> > +
> > +		if (count > total_pages) {
> > +			xe_log_err(xe, SYSCTRL, -EINVAL,
> > +				   "Pages returned exceed total pages %u,
> > returned %u, cmd=3D%#x\n",
> > +				   total_pages, count, cmd);
> > +			return;
> > +		}
> > +	} while (common->additional_data);
> > +}
> > +
> > +/*
> > + * Retrieve firmware queued pages from warm-retained SRAM during
> probe.
> > +Handle and soft-offline
> > + * each page as required.
> > + */
> > +static void get_offline_queue(struct xe_device *xe) {
> > +	struct xe_ras_offline_common response =3D {0};
> > +
> > +	process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE,
> > NULL, 0, &response,
> > +			      sizeof(response), &response, true); }
> > +
> > +/*
> > + * Retrieve permanently offlined pages from firmware's non-volatile
> > +storage during probe,
> > + * allowing the driver to soft-offline them before kernel allocations =
begin.
> > + */
> > +static void get_offline_list(struct xe_device *xe) {
> > +	struct xe_ras_offline_list_response response =3D {0};
> > +	struct xe_ras_offline_list_request request =3D {0};
> > +
> > +	process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST,
> > &request, sizeof(request),
> > +			      &response, sizeof(response), &response.common,
> > false); }
> > +
> >  static struct pci_dev *find_usp_dev(struct pci_dev *pdev)  {
> >  	struct pci_dev *vsp;
> > @@ -1067,6 +1150,10 @@ void xe_ras_init(struct xe_device *xe)
> >  	if (IS_ENABLED(CONFIG_PCIEAER))
> >  		ras_usp_aer_init(xe);
> >
> > +	/* Fetch the offline list before queue to avoid duplication */

How about suspend/resume, do list persist or again ras_init()?=20

Tejas
> > +	get_offline_list(xe);
> > +	get_offline_queue(xe);
> > +
> >  	ret =3D devm_device_add_group(xe->drm.dev, &gpu_health_group);
> >  	if (ret)
> >  		xe_err(xe, "Failed to create GPU health sysfs, err=3D%d\n", ret);
> > diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
> > b/drivers/gpu/drm/xe/xe_ras_types.h
> > index 1495a8636255..40224db38906 100644
> > --- a/drivers/gpu/drm/xe/xe_ras_types.h
> > +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> > @@ -10,6 +10,7 @@
> >
> >  #define XE_RAS_NUM_COUNTERS			16
> >  #define XE_RAS_NUM_ERROR_ARR			3
> > +#define XE_RAS_NUM_PAGES			25
> >  /* Error bits in IEH global error status register */
> >  #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
> >  /* Device memory error categories */
> > @@ -330,6 +331,40 @@ struct xe_ras_page_offline_response {
> >  	u32 reserved;
> >  } __packed;
> >
> > +/**
> > + * struct xe_ras_offline_common - Common structure for offline list
> > +and queue  */ struct xe_ras_offline_common {
> > +	/** @total_pages: Total number of queued pages */
> > +	u32 total_pages;
> > +	/** @pages_returned: Number of pages returned in this response */
> > +	u32 pages_returned;
> > +	/** @page_addresses: Array of page addresses (4KB aligned) */
> > +	u64 page_addresses[XE_RAS_NUM_PAGES];
> > +	/** @additional_data: Indicates if more data is available */
> > +	u8 additional_data;
> > +	/** @reserved: Reserved for future use */
> > +	u8 reserved[3];
> > +} __packed;
> > +
> > +/**
> > + * struct xe_ras_offline_list_request - Request for get offline list
> > +command  */ struct xe_ras_offline_list_request {
> > +	/** @index: Zero-based index into the offline page list */
> > +	u32 index;
> > +} __packed;
> > +
> > +/**
> > + * struct xe_ras_offline_list_response - Response from get offline
> > +list command  */ struct xe_ras_offline_list_response {
> > +	/** @max_entries: Total no of pages that can be stored in flash */
> > +	u32 max_entries;
> > +	/** @common: Common offline page information */
> > +	struct xe_ras_offline_common common; } __packed;
> > +
> >  /**
> >   * struct xe_ras_get_health_request - Request structure for obtaining
> > gpu health
> >   */
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > index 60d17ccc002c..e1bb64856f43 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > @@ -31,6 +31,8 @@ enum xe_sysctrl_group {
> >   * @XE_SYSCTRL_CMD_SET_THRESHOLD: Set error threshold
> >   * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> >   * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/remove
> > a page
> > + * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined
> > + pages from flash
> > + * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined
> > queued
> > + pages from firmware
> >   * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
> >   * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
> >   */
> > @@ -42,6 +44,8 @@ enum xe_sysctrl_gfsp_cmd {
> >  	XE_SYSCTRL_CMD_SET_THRESHOLD		=3D 0x06,
> >  	XE_SYSCTRL_CMD_GET_PENDING_EVENT	=3D 0x07,
> >  	XE_SYSCTRL_CMD_PAGE_OFFLINE		=3D 0x08,
> > +	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		=3D 0x09,
> > +	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	=3D 0x0A,
> >  	XE_SYSCTRL_CMD_GET_HEALTH		=3D 0x0B,
> >  	XE_SYSCTRL_CMD_SET_HEALTH		=3D 0x0C,
> >  };
> > --
> > 2.47.1

