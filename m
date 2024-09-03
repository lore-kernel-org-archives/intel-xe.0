Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D81CD342C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 04:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F51D10E0D4;
	Tue,  3 Sep 2024 04:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUXbO2H5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE17610E0D4
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 04:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725339473; x=1756875473;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ycofmk7/sQOQ+VjWw2TAxpp+e2ZchUlKg1tpudUOvL4=;
 b=PUXbO2H58Ctus+M78oRgp0aB2L2IdbSg9nBDrJ1sijB3gF6ICKQeCCPC
 BAm97141y2ifVn1b7Crafd2xMtVwpzlnlWYlIAIhJSjACoBh//vqRek+2
 9D1gSpM+lMb3X2dBHRV9NaBxxkg/YW4W+IcHOjL2i92FY2M7+lfzRiZLo
 4VPtrSGNTv8iSh8T42pDmKmfpjzbI3dNiOhguWgm+znqucOiLgo1FwCBx
 zTVmnAf9GfahubGU93ZOuaXxFCUfMGIuxc0jh6NWL4FydRENd+87GntYP
 W9+DN1QpP34bHv2kg3FgRni2cymKvIOFQvhih4N43ukMw/JtsBcw1H0qH A==;
X-CSE-ConnectionGUID: Gx+V8TxrQi6YoIDx3nlGlQ==
X-CSE-MsgGUID: JWoHdokwQq63uORNhyY+mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="13338074"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="13338074"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 21:57:52 -0700
X-CSE-ConnectionGUID: Vwk3bwcvRheEV72t4oN6Qg==
X-CSE-MsgGUID: IPyY2P0oQMCdFahibJPNlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="69641578"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Sep 2024 21:57:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 21:57:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 21:57:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 21:57:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYjIiRI7wjhb0ASXza1LBF27F8/1EdAd3UNWSXiYeQ9Bj65NaY/7utCKWmepEvdYxNeoGSQ/sOsaHSZ/JSgDFZUAh6yK4HwcaIxPp6W7hhTU3ryLv7U8kd1lyO9zgQil56/yL93sqDNIm9dkx2eEJG3avESPQMaMitMJfRjYpu4jZ3xx6eA/UKaD/7xORnerY9Xl5W4dTaAkxTSBsC1jw45tcGoCgnF+7O+C6Vu5ozZhuRz1TvYn6gsXehqLpyLJkiKvFuCIpUTQibkqHYKsusRHFdAVyHy1KQncfEeN85xFaFw0cvO42eC4oEhWqkBMGQyDK2P5xOB/9A3J66NKgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QU4hFWIGqABmvnYURAtrtkw5kJV5B0Pf5zZJ8wI9XCw=;
 b=sxt+s49NQy3ygY7WP7BeFtYcrmjBD0vClG1s+ycTRknEsb4Dkscfxt+tfV3YQYHlEus3At35Nto7wb2Qh0kKvAMxj35avmdgS8sk4CGes+wosWaI5/2KfK5n/5UVzqXBkRsGa1vvd9AtBq8hjYxOfJg24V+vLGzPtxFo12ZsJBaguStE16SxqqLVq++m/uQoqiyzwDk3CN3RqTrKD86jUHXXcypQkk54HsGelRozusNxYQwSc/XyQhmkCeQhryMOfyqlt7x2PJEs2E1WfGVTwEbuiDyhTiB32Y0+6XSDpekXWouNXGXt/D+Ort2ewceXUso1//KnCbUFwhgsMOUHDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CY8PR11MB7315.namprd11.prod.outlook.com (2603:10b6:930:9e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 04:57:46 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 04:57:46 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm: Ensure Proper Unload/Reload Order of MEI Modules for
 i915/Xe Driver
Thread-Topic: [PATCH] drm: Ensure Proper Unload/Reload Order of MEI Modules
 for i915/Xe Driver
Thread-Index: AQHa/UOmwZnLEiJl+kCHE913zQii1rJFgHTA
Date: Tue, 3 Sep 2024 04:57:46 +0000
Message-ID: <SJ1PR11MB6204E7D7A9431C42605DA90181932@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240902141041.18467-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240902141041.18467-1-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CY8PR11MB7315:EE_
x-ms-office365-filtering-correlation-id: 8ed4ff22-abf3-4273-47fe-08dccbd4f3ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?e5Tj3MAgocZqK/FuWtSi9KfJ8EdE51AQmVp0NH8Hna6D/oOSD/SOH9vrCPYP?=
 =?us-ascii?Q?Lnb9sIqvRKM8ftAE0qlBy0IKR7JF5OW42Qgq7fxfd1Waiz5A1KDowc9dZB2x?=
 =?us-ascii?Q?QU2EM8erKtVQ8GROfTP7HAmtkgIokaD9XHGiGoQfMTY6nWZ72xDTdngfSVMT?=
 =?us-ascii?Q?9xl3JtRKwgn0iPgwsbBD9DkR658J1cWIShjycn/tOYVFDiRReS6fdFlyUh1D?=
 =?us-ascii?Q?HOtdNjc6qnOojVw4Dya9bm0TvxOsauVoJnUFV53tYVH2u/Oheqbs88yHgFhh?=
 =?us-ascii?Q?pIEYKH1XvPu/z6xGkzZURzOP5nEfwWyJbdotfdNJSZ4/MvKKsWaqxu8qsqSa?=
 =?us-ascii?Q?V8zqQ5TFocYBtkXWUrGA7dbz3BYAG7ryXxrx/JcYvawgaYVjZ/2ISGfzKz3a?=
 =?us-ascii?Q?TD2oyYOuKdxMEVUoSkCIzEF6wJm/SdAvPyhpjVxqsRE+9puHVC0Suh7YGifO?=
 =?us-ascii?Q?nUhTj4i2AVYpYmjEkZ4mC18Pt0KJ4oXKoT1CFDmR9xmn45A35aQqEaNwQM1b?=
 =?us-ascii?Q?J5Wvb2X6gi66gFnqEw3EkXf4WroXkOuaMxCymNxzVCpNv/6Ho7DFpvErlxn9?=
 =?us-ascii?Q?cLtdgu4O2zPOCSIUCrOiv/hh9KJS8k0pIfsjwk/cFMYQYOri+KBfJjeKcDc6?=
 =?us-ascii?Q?V9hfh6BZxOect9VAZjQGg9cXdd0SR7278bp26M4eSiGdf/iYnOZ9eZGCYaFP?=
 =?us-ascii?Q?A6+9t4h/spfMKZVfaUBMFteL4nuYNLjL1MfyWdLSMx0sO2zcJv6+VecGROdF?=
 =?us-ascii?Q?epGGWaRByNM3D6nIf7GZoYaVIhOhg4hGve8A32LwfpxaLQ/435Rj5Gyo3kgH?=
 =?us-ascii?Q?2/gVo1kP+OzbO1gND7Obsja6kPI2cxz35/dyO3i0chzqv2WNqEhMe4VMH3Ix?=
 =?us-ascii?Q?on7Yf7StZdBrQ2HLwPBSlPEp+VQDVD7/FIMUMr/pHs8bJKPoKZylocJQVBRq?=
 =?us-ascii?Q?iI/cs1GvRUp2lgYtDurVSiOh++O4UXvwHpdiq4tLf4SBZzSwPdAoCTsFUDzK?=
 =?us-ascii?Q?fTXbT06MEqHAo0daxVFoFnqgSNYVackIMCpKU9anNN3sVYn5dn+I+0YkdwIg?=
 =?us-ascii?Q?0ClM+hAoUezsxt6kAEzId2vPQRoY+UcdP+MrOHNtmclwUenV1Qo6JUxsDxpm?=
 =?us-ascii?Q?dwPSl0bODEWXiIoG7qNGLSzvxVnzUNrXrx0wQGi+Vr+nFuyhrZF13GDP+Peu?=
 =?us-ascii?Q?zevQA3xSGq7WxhPEXoA0RLFVW8NAxQJuWBhAmAiz73DdzGptxE0SJTJq8NRV?=
 =?us-ascii?Q?HXM4Oi6pZYmfy5rQ1MPGV81ecsTQC5Ra8reRn8DObp3K7w1afHC9dEFwBOBm?=
 =?us-ascii?Q?aEBT5bEedEfGR3vc6W9tcrLHxLPG25fzXj33OuSvjwH9DRCjeTJoZEz4tJMR?=
 =?us-ascii?Q?tbOabg/H7joPS1isx5tVPYgaadkbN6iP++UWACbtDCwotjzR9A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BYsw9XSO3HwT7YSj2UQVNqL47M4NNNuiCmlaX49a4X0dh1RQ4QbMfLMaKuv1?=
 =?us-ascii?Q?JYXFDSf/Jwvb9rkCEzDxZObtIQ0A+lF8ejZFTUtv1Bog6PeXmWg4yrc48qIJ?=
 =?us-ascii?Q?raN8plSXc89wjGpFhwMyWo09VvJripOs54Sgve00Rgs9z9Ylc8QQyZjoiAd+?=
 =?us-ascii?Q?+h/iB0fJrjumPw6JcUMeHffFrES59IrjlslKqRjL6POKd8jvj6+ZxXK3bFAA?=
 =?us-ascii?Q?mJwqSzEl+cvMpUnSeGYLTdCH7Yl3JsF9OsRhO40g1hJX4uMoTyEvyG7ncooW?=
 =?us-ascii?Q?dJ5JIEhrU3ukj8CpSoP3tXRF6imqiXbjLA1i/tc6uCmIzLzWy5OEOcWHmTaq?=
 =?us-ascii?Q?nficncqgiscZ1WMTvJ2Du2UNr8PhjwT3H0+Nn8lNdqfqLfI7JrDgDMbG2Gwr?=
 =?us-ascii?Q?1OwpyrNuVO/G4kuc5apt+ZdKX9odWo79jAKFTv/IciYaOdRidmsmelWyfnaQ?=
 =?us-ascii?Q?9FWBC2Pv0AW9Ut24Ql5NSVybhJbgJfgFt7nfZMPpLbww9YzqDRvHXRyTJI40?=
 =?us-ascii?Q?F2LR42wPiiP9dLiiwGO/k6gcrT4NOG/4c18N3GCgQBx+L0ZIndRCxD6p/Gac?=
 =?us-ascii?Q?V6Ekcw4TDZHm8317LZWre0Jl/GUG8U4QrmyGq6DE8wlyMHqIgTxfkr6/4FTu?=
 =?us-ascii?Q?BYk57sB67/431L0lm1Hr+CKzFlshbOYPWq2/IrrRSR9vevcn22icujDAtO1Y?=
 =?us-ascii?Q?wf9TPOeqtKoBTtBEQP3Uq5v5IE0H7EZiFies0cBzOGEQg6hmQr8KnUho0oN3?=
 =?us-ascii?Q?LAZcUOhUgDqyf9edo8kg/GVqT13twYJxvBK9HQwOYv651iYXlKIzJ0F9fTXK?=
 =?us-ascii?Q?wmb1a4IvxLtJHL5y7qZAalJ3iJ/GrhW5lnYYd04utEnyFzaqkLi64OsgwtDw?=
 =?us-ascii?Q?+aqLbpm/NZCbgLZus9opKyGfoPBwFluIipVMbFnSXtQbDI6e1esGw0Sam6L9?=
 =?us-ascii?Q?AxQVqLc9AB/fz91LQYu0zVbqGUmxldJ9h2rnkwbnlaCnirVCW7jIibH94a7m?=
 =?us-ascii?Q?bvJj7bkrPLI0tkyFlcZv2H6LdX5lkARcWU9748wYHu+drTa+KTixjAWbr4pd?=
 =?us-ascii?Q?heeiOZVWimkD9OFefDs56IXvcBela5kQrANRIf8YuKrwObzDgd4pcJCoGX8J?=
 =?us-ascii?Q?Y6LIHEnZM9DyUTL6afiExoioNfludl/tXcKXR7D+qPVi1C4DbLELZqNoxykq?=
 =?us-ascii?Q?XVXGVyc1VG3pMspFje4DRxhvO6R41B31ltVce1UT+/m8fE2A+HwFo4GeUoD8?=
 =?us-ascii?Q?qG2mRfMztTbbEZYDWlx8kckUER2hd8eOLiS8AmCPOywp2gha3HZwyZ1u2FMa?=
 =?us-ascii?Q?bcpgvEzvo1HRGsBCwGxSIev7TJVsyQmr1CFAdb3yXHxF53k5dULnr5uah0c1?=
 =?us-ascii?Q?m0mfBwnEXaKgp9DAFL5xxdv2k/m6ER4/Dy9UBc9djkDDoXY+PkNtM5kK1Z3a?=
 =?us-ascii?Q?LDlwHF8Vq1yDhEUR0Mc0R6DUj5ja6mUasREQhE+U1PjumWuFf1TYtCMBufII?=
 =?us-ascii?Q?58TeM/I3rrj4SlGAyhj5jE8UVjiOwXfSp6GC5uvaRHFeMl1wO8pli1+wrvK+?=
 =?us-ascii?Q?VMAdfSdW28WcXAtqJn+urqV8azN4cXDLuqFcv0D8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed4ff22-abf3-4273-47fe-08dccbd4f3ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 04:57:46.4891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0EPoc6cb7039QW784+OfXWUt1a4Pk15aeGDw/pbkTr2zDPyXRcIkvOEJz3I/rq7lxZeAFYfICsCOaslQcDsAA9rSTrldgNV+3SigqcnZAz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7315
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Bomm=
u
> Krishnaiah
> Sent: Monday, September 2, 2024 7:41 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Subject: [PATCH] drm: Ensure Proper Unload/Reload Order of MEI Modules
> for i915/Xe Driver
>=20
> This update addresses the unload/reload sequence of MEI modules in
> relation to the i915/Xe graphics driver. On platforms where the MEI hardw=
are
> is integrated with the graphics device (e.g., DG2/BMG), the MEI modules
> depend on the i915/Xe driver. Conversely, on newer platforms like CLS, wh=
ere
> the MEI hardware is separate, this dependency does not exist.
>=20
> The changes introduced ensure that MEI modules are unloaded and reloaded
> in the correct order based on platform-specific dependencies. This is
> achieved by adding a MODULE_SOFTDEP directive to the i915 and Xe module
> code.
>=20
> These changes enhance the robustness of MEI module handling across
> different hardware platforms, ensuring that the i915/Xe driver can be cle=
anly
> unloaded and reloaded without issues.
>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_module.c | 2 ++
>  drivers/gpu/drm/xe/xe_module.c     | 2 ++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_module.c
> b/drivers/gpu/drm/i915/i915_module.c
> index 65acd7bf75d0..2ad079ad35db 100644
> --- a/drivers/gpu/drm/i915/i915_module.c
> +++ b/drivers/gpu/drm/i915/i915_module.c
> @@ -75,6 +75,8 @@ static const struct {
>  };
>  static int init_progress;
>=20
> +MODULE_SOFTDEP("pre: mei_gsc_proxy mei_gsc");

As I am reading MODULE_SOFTDEP("pre") means this module required to be load=
ed before i915/xe. If that's true, dont we need to make it "post" as it dep=
ends on i915/xe? . Please share the link where you are referring this usage=
.

Thanks,
Tejas
> +
>  static int __init i915_init(void)
>  {
>  	int err, i;
> diff --git a/drivers/gpu/drm/xe/xe_module.c
> b/drivers/gpu/drm/xe/xe_module.c index bfc3deebdaa2..5633ea1841b7
> 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -127,6 +127,8 @@ static void xe_call_exit_func(unsigned int i)
>  	init_funcs[i].exit();
>  }
>=20
> +MODULE_SOFTDEP("pre: mei_gsc_proxy mei_gsc");
> +
>  static int __init xe_init(void)
>  {
>  	int err, i;
> --
> 2.25.1

