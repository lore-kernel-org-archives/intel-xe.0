Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1696C44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 04:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702C310E125;
	Mon, 20 Jul 2026 04:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HjQCfskq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885A910E115;
 Mon, 20 Jul 2026 04:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784523565; x=1816059565;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8wwVO2BjwLwRQZTEYsKYWJxyjSYaZ0RGZbkOuWuLv1E=;
 b=HjQCfskqN7yK6TB5DxEbpmQQ8V9msbmhIfj3CORAq76OoUCe2zofqvHd
 07XbKgSRFv9H4jAGGIyPBGgynzrqSK/rSg9xWSIWch+E7t24xzjzNLHUl
 WKrIZcD5OAIMyOEaQKrLWcWf5T79JgAsWW227vZafhD76JUPjdPVbIovl
 wD9Zb31Uw61ki6NjENBrKVZiky3UDAoC0naZIwwlKfBuPqFKzmmlJKnkz
 Yd6FvMHjzY4atMV4/hfVY6BCkuoPi4yy5IvHhLhQRTkLDyxEsr4udnZoA
 1weqrA/w5o3RJRdcODMVAcmQQbDH6mGqcko0c3B1rQtYKTbN+sok8BrOr A==;
X-CSE-ConnectionGUID: epoAClRPSkKkMLqk6a3QyQ==
X-CSE-MsgGUID: i5IPOYmuSnSo75o8URGtsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="95690954"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="95690954"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 21:59:24 -0700
X-CSE-ConnectionGUID: AydjDUcGRFWE5BOywMeYeQ==
X-CSE-MsgGUID: d/gP0HngSDiTk2Qx8iFaaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="257983930"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 21:59:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 21:59:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 19 Jul 2026 21:59:23 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 21:59:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQOL3AcTPmTB4zLarmH1Mutm52LegDEZAvHZ1mXz+zMWxEYVVYVcVuNcoet8dUYyaJCDROHlImAdBDtURyHjc21S8RBNU0qhbxpMadablvr1Fg97F22L4+Yy43r76z5Vhb2ycAGyWn7cOH8sMYEApLc27BqWEfYnrkLJf/0G5AUhdvBXax5+sQpqZQE74IaGSsNBx4XHGa2As3JpYfillHK6cArlVqoQI3qXB8GXvGdMocx806wvdmEJ07uUgF6JQZ5OvDBGYWJvekFU4Cy2Zy+Sr1OKDsiYzFLshCx0d1MV1F5Y6NBZ9d2+MG39sCJGY6K5Yl5BEY5PLrnDShlvag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wwVO2BjwLwRQZTEYsKYWJxyjSYaZ0RGZbkOuWuLv1E=;
 b=kB0/xHlyGkQA42dJ3GVFZxi5I46+zXbfooftg/Fye79rmJXV88X1s6lmrTODC3xMXMVVDK23D7zNgOzkcUqadurlnizttGTcvH/wj5omyp54bnWpM8OwQAK8dANYLPsqC6SQSedmFCBPcxCOf1gdro9CJSM08nhYKHO3aXY12DU7DdSbfhtg5E5cGrJRjstq6l/051omo4uVAGmLwJuNkPxFRgBXeowb2lxy1iMXE0Y8anZekl+Q8jqStP8Ao0+82eW0Ct0z7Ws/JFQbYpyqocDjq927N83k0eMDLiu3vIj+PXCGuQIhGLS+jkfmfUOAvyeGu4pv6TClZdnl0WPCPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH3PPF76AA2D882.namprd11.prod.outlook.com
 (2603:10b6:518:1::d30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Mon, 20 Jul
 2026 04:59:21 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 04:59:21 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: drm/i915/backlight: Remove DP_EDP_BACKLIGHT_AUX_ENABLE_CAP check
 for DPCD backlight
Thread-Topic: drm/i915/backlight: Remove DP_EDP_BACKLIGHT_AUX_ENABLE_CAP check
 for DPCD backlight
Thread-Index: AQHdFe4WZ3DJcK5RmkCOjDaHP5BC5LZ12wCw
Date: Mon, 20 Jul 2026 04:59:20 +0000
Message-ID: <DS4PPFE901A304FADD15BAEBC6B192C846EE3C32@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260716030959.436430-1-suraj.kandpal@intel.com>
 <837ba34a-35ee-57b9-02fb-880b35c1c692@intel.com>
In-Reply-To: <837ba34a-35ee-57b9-02fb-880b35c1c692@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH3PPF76AA2D882:EE_
x-ms-office365-filtering-correlation-id: 4eee0503-a036-46ab-245a-08dee61ba925
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|38070700021|10067099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info: XVoPS+Vcez33XCoAaNqcdvQ/K5pujtLJDKWZTpCgqIt0/l1AroEapWf7m9VRUTUFbfxkLPMKLFu+dXgSpAvQXABdxwSEnlV1AMJBS4oGbl2DVvRKHb4bGGS+/8nVVqgIDHCf8ERAqkkxoKM4yetsP6xRvsSHhKFztV/Pe5oTjLOsZTmgusFZXHTZkyMVJYnVkZOCxlvh0FHYIh5aSARhXowfm8VRLobzBlvClfzPMu2JucwNCy5PkuC7WYO1UHDwVDWfSKvzjGfMl5fSI6M1ofqGomr3y7L1eW5cK/BIf3vdSYAJFJRVRrCANFW8VQEd5TiKDqoiC7x+u32LsBbSgwGOvntLC44cM3Ha5OzKK4llzYOJ4nYOaG8c9vG5qkUtzSZLmTtac4/twYy/gcCni7nyS5OK+5qD0wADPfzYYOGgfE2pQ3gXx31sKtHRujZ/Omekj2lIafRUF3ydi2QDh6WsgLq2sCZe8Kr8sCHPtMCMoEbfX5xNIGB5rb0nDVK7Wemg7taPtCyS7a/M5NvLUK/gyCqlOAjgsfcqMtYfBGCPWDt8WD5VAAO2x9kWlcvADTrfBQCMnONBMhTDilpGYnARSCRemL1E2JU1iWo7zn/M5BBPVIaDg7UQQmrBUed44FqJBvpqY6H0xwXXnIiB6L3nZEkVwFrQSDHkyrWnP+o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(10067099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTZqenBsdm00SkRqeFBROGRnQTJxWjdoOHJkRThrT0swYmVxdnJJV21KT2E5?=
 =?utf-8?B?dGdRL2VSbkxvTkdiczZSQzRnYmx4TzE3eGhjbkZhV0YyMmYyMU8ycGJRSVlx?=
 =?utf-8?B?VVZac2FLYlAzZHJJa0VTblJjNkJnbVQwNzZKNk54OStnazJJSGsycnBERGhG?=
 =?utf-8?B?b3FubEZsSWJYQWRYbWdiRk1Ha0tXcnZnZlBXUnpjWklyTEw3UDg3ZFQ1MFls?=
 =?utf-8?B?c202bFE0NWo5NUJ6SEpXWFVORytwaGxPTWQyREl6VEprUVdoYXVCcHc5QXcx?=
 =?utf-8?B?ZUdYWXd6UlBvcXBtTE83bW9zUXlGcnhBRHh5aFUraDR5Y0hJVDBjRGh4K05C?=
 =?utf-8?B?UGJQdkxYSzU1a0xnTkJ2OU0wazhkeWNXVmRMQlEzOE9rYTJXSmNqUkJJWE51?=
 =?utf-8?B?S1Q2WUlRUHJoUjdBaE5nOG4zbHp4ZldsUEVJUnBBU2xGT2NHMTc1dVJrSnVt?=
 =?utf-8?B?RExGcHphYTA3aU5LaUE0QXprdjFNNC82N3VpR3BzV0tqK0ZRR0dVdnVJcG9v?=
 =?utf-8?B?SzhuVWozU2wrUFUyYnc3dEF1bHBkVXhjU3ZVc3hobzl2eUN2dElNTXR4S3l2?=
 =?utf-8?B?VmZucnNBT3ZWTjBQUm85cGdtNjJzVGZyKzFUVFRaVlJxSjZROVlkdFVEdEFI?=
 =?utf-8?B?czlaVUN4U2hwZ04rZGNhRjFNUHd2ZVFoNUdFaWl5eU9uejdDOTg5YldnSFlF?=
 =?utf-8?B?ZnYwSTFlRnVpektMazJ6Mm9DZ3dZSWxwdHQ5aWk0bVp3T3FhN2JPRWRHcTBF?=
 =?utf-8?B?MkFvWk9YTnpWbzMwWmlwVDlSVmw5K3FuQmh4SDFDdWRodm9GQXMzelZ1YVVG?=
 =?utf-8?B?M2VEYlVCQlV6U2U5SmVxdThFTFczL2k4c0IwRW44eUNnbjNhdTZhbWhpSWVS?=
 =?utf-8?B?YkExbkk5aWp2ZHppSlQ2b0pTYWZNdTVVbVFLbDFOVHNOV2tDQm45L2lQZlhm?=
 =?utf-8?B?TStZbU1RQ3ExL1RXTS9PU3NtYXEyRStac0RyaGI1UkhHRTNUUDd3QkEzZkti?=
 =?utf-8?B?QVNqeVFjcGxsTlR3MFh0c3o5VC85NkY5WXIrZkY2cVl5TGNud1BzUTVrYUlp?=
 =?utf-8?B?OS9QR2JxOU55U2tubkp3N2c4SkM3L1dSUGkyd1BIalVYdHlkekRSTlEwdHBv?=
 =?utf-8?B?ODZpWnFaYzU0cWdQdzRxSTVKTlBGdjBaZG1ENnk0TURZamxoSStzVjRXTWZj?=
 =?utf-8?B?QU5MUUxsU1FWNExsaytYL1diakdVZFl2Vk5FVThqNlpUWE5Za1l2MXpPOFR0?=
 =?utf-8?B?N093bzdkSTRFeU10TE92K1VwMkEvWk12eE5UcGdNcDZueTZUdmtRdCtNVGxw?=
 =?utf-8?B?TzZWNHJSME5TZHAvR0dtM0lVaG0zTElmMmM1OExxMVpla0ZCQlkraU1yQ3R4?=
 =?utf-8?B?MXVrRXJlbmhqalRGcmVValB3WUdNaUtlMmlmVytTdkF3MFhCdjF5a0Q2aFBy?=
 =?utf-8?B?cWVXMHBFdXRGMGh3a0dpcEE4V3dkTm9oNGZkRzkvSzlBZy90eVFFaGJ6WTRt?=
 =?utf-8?B?OGYrU1BkeVBiNlArOHhkajBLVFVzSmxJSGNzQXpBWENWYVpIMmNMZGVTeTVh?=
 =?utf-8?B?TFRPTGFLMjM0eDBXMGNmcXA0ZXJTSHJHMXNZa2lLZDNWbmpDTWNYU3VVK2lH?=
 =?utf-8?B?MU5ibUFIbFdmNnhPbUpaem9iNXdlc1Q3UWpuSHpmcUV2R3VIRndBZnJ4ZGV5?=
 =?utf-8?B?cXdhc0dWZ1ZyM1dmay9vNjJOcmYveVJJWm1jUG1CcnJKZExSTFF5MGpRcWVy?=
 =?utf-8?B?eHdQaVhVK1dJa0hPdnJGMHJWazd1RnlwZzIzZnFRL0xtZXhyWVBaQ3Q1L1Vz?=
 =?utf-8?B?Zmpha1NOSi93czhLalhVamc1c1o5Nmg3MWpQRlB0Q3hPVmQzRFFuYUJYMVpJ?=
 =?utf-8?B?Q0dvT05DNTE2VCt2d0Z5UkZSY2lRbmVtN0tKK3dnWnFGZ2llUjM0a3Nydkhj?=
 =?utf-8?B?cWdsdXk3UG1BNXJDT0Nsam8wZVo4c01qdUxWcC9sTmFTSm1YNGJYYVVYWTFM?=
 =?utf-8?B?MDJ6TkgveDB4QTNFWVo1TWd4czlEczdaS3V1SGNsWUZraC9aSExCZFlXejNx?=
 =?utf-8?B?bGlGRGhnSkMxWlVmZ1RsMWo4anB2ZFlRRU03eHdmSkRSL0U1TUF4aFk0RXdU?=
 =?utf-8?B?SXhaRERCT2NSUFpaY1hibEtIVzhaRTFxa1RhT3FPWXRiZmxpRVRNcEFQWGJo?=
 =?utf-8?B?ZTNmSlo5WEF4VldTRGFlblkwRjhsT2FmTGF6cndTYkdOR0ZDelZQdDd0VGl0?=
 =?utf-8?B?aGQvNmJOQnU4R0RTdTQwYVJycnNYdGJpNFNWMitoNWVaWEc4RUR3ZU5DdDN5?=
 =?utf-8?B?SitnZ1BYQ3NpSDlrNHgrNm1XaEJUNklQY3RJd3ZzNldXQWEzTWlRQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TvH+QLk9H1Hi8W6JZFS8TNP7fe/TB+HnWZbny0B2KD6K254xPKuNuS4Et3D6bRlBucm61ZgOFLwNrX66DU0PHPwlCkxXLmlztAfeHWZtdjc3KGFAfjcZt30Hvx8RX29cOO/Bj/LuL2pazXZgH6I1tB4A5j5+HRgn7lkRojaKAn8S7E2tqMjbDfkNVnRDk2y6zd8oU9GEyI/kibNddnHC+cE3LKQZNsZI2SCx0j2nXOxLzjMAgUq0S9TKKE/X5P3SCjRlqDyixYXPEWFzuRtzObCZmr5PXLXujp8+/SA5GCO8tp8ZDK6VOj9UL5pG/LFAuEelOsBni4QLVFDta48qZQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eee0503-a036-46ab-245a-08dee61ba925
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 04:59:20.8747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 80PxKjJYUlVA8e4rJb/IzjtoIk4dlwejxMl5h1DSV74jBsYDAFJUzKXU+4INzt5yIgoZs2JP/8VZ1Rzpr9DW/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF76AA2D882
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

PiBTdWJqZWN0OiBSZTogZHJtL2k5MTUvYmFja2xpZ2h0OiBSZW1vdmUNCj4gRFBfRURQX0JBQ0tM
SUdIVF9BVVhfRU5BQkxFX0NBUCBjaGVjayBmb3IgRFBDRCBiYWNrbGlnaHQNCj4gDQo+IE9uIFRo
dSwgMTYgSnVsIDIwMjYsIFN1cmFqIEthbmRwYWwgd3JvdGU6DQo+ID4gVHVybnMgb3V0IFNvbWUg
cGFuZWxzIGFsbG93IG9ubHkgYmFja2xpZ2h0IEFVWCBiYXNlZCBiYWNrbGlnaHQNCj4gDQo+IG5p
dHM6DQo+IHMvU29tZS9zb21lLw0KPiBzL2JhY2tsaWdodCBBVVgvQVVYLw0KPiANCj4gPiBieSBq
dXN0IHNldHRpbmcgdGhlIERQX0VEUF9CQUNLTElHSFRfQlJJR0hUTkVTU19BVVhfU0VUX0NBUCBh
bmQgbm90DQo+ID4gc2V0dGluZyB0aGUgRFBfRURQX0JBQ0tMSUdIVF9BVVhfRU5BQkxFX0NBUC4N
Cj4gPiBJZiB3ZSBtYWtlIERQX0VEUF9CQUNLTElHSFRfQVVYX0VOQUJMRV9DQVAgYSBuZWNlc3Np
dHkgZm9yIEFVWCBiYXNlZA0KPiA+IERQQ0QgYmFja2xpZ2h0IHRoZXNlIHBhbmVscyBsb29zZSB0
aGUgYWJpbGl0eSB0byBtYW5pcHVsYXRlIGJhY2tsaWdodA0KPiA+IHZpYSBBVVgsIHNwZWNpYWxs
eSBvbmVzIHdpdGggbm8gUFdNIGNvbnRyb2xsZXIuDQo+IA0KPiBtYXliZTogcy9zcGVjaWFsbHkv
ZXNwZWNpYWxseS8NCj4gDQo+ID4gUmVtb3ZlIHRoaXMgY2hlY2sgZnJvbSBmdW5jdGlvbiBzbyB0
aGF0IHBhbmVscyB3aG8gZG8gbm90IGFkdmVydGlzZQ0KPiA+IERQX0VEUF9CQUNLTElHSFRfQVVY
X0VOQUJMRV9DQVAgYnV0IGFkdmVydGlzZQ0KPiA+IERQX0VEUF9CQUNLTElHSFRfQlJJR0hUTkVT
U19BVVhfU0VUX0NBUCBhcmUgYWJsZSB0byBtYW5pcHVsYXRlDQo+ID4gYmFja2xpZ2h0IGFnYWlu
Lg0KPiA+DQo+ID4gRml4ZXM6IGVkOGJlNzgwYmRiYyAoImRybS9pOTE1L2JhY2tsaWdodDogRml4
IFZFU0EgYmFja2xpZ2h0IHBvc3NpYmxlDQo+ID4gY2hlY2sgY29uZGl0aW9uIikNCj4gPiBDbG9z
ZXM6DQo+ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8t
L3dvcmtfaXRlbXMvMTY1MDcNCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJh
ai5rYW5kcGFsQGludGVsLmNvbT4NCj4gDQo+ID4gLS0tDQo+ID4gZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcF9hdXhfYmFja2xpZ2h0LmMgfCAzICstLQ0KPiA+IDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2F1eF9iYWNrbGlnaHQu
Yw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9hdXhfYmFja2xp
Z2h0LmMNCj4gPiBpbmRleCA3YTZjMDdmNmFhZWIuLjgzMjQ1Y2I3MzhlNSAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2F1eF9iYWNrbGlnaHQu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfYXV4X2Jh
Y2tsaWdodC5jDQo+ID4gQEAgLTYxOSw4ICs2MTksNyBAQCBjaGVja19pZl92ZXNhX2JhY2tsaWdo
dF9wb3NzaWJsZShzdHJ1Y3QgaW50ZWxfZHANCj4gKmludGVsX2RwKQ0KPiA+IAkgKiBTaW5jZSB3
ZSBvbmx5IHN1cHBvcnQgRnVsbHkgQVVYIEJhc2VkIFZFU0EgQmFja2xpZ2h0IGludGVyZmFjZSBt
YWtlDQo+IHN1cmUNCj4gPiAJICogYmFja2xpZ2h0IGVuYWJsZSBpcyBwb3NzaWJsZSB2aWEgQVVY
IGFsb25nIHdpdGggYmFja2xpZ2h0IGFkanVzdG1lbnQNCj4gPiAJICovDQo+IA0KPiBXb25kZXJp
bmcgaWYgdGhlIGNvbW1lbnQgYWJvdmUgbmVlZHMgYW55IGFkanVzdG1lbnQ/DQoNCllvdSBhcmUg
cmlnaHQgdGhpcyBjb21tZW50IHdpbGwgbmVlZCB0byBiZSByZW1vdmVkICBub3cNCg0KPiANCj4g
RWl0aGVyIHdheToNCj4gUmV2aWV3ZWQtYnk6IE1pY2hhxYIgR3J6ZWxhayA8bWljaGFsLmdyemVs
YWtAaW50ZWwuY29tPg0KPiANCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3cywNClB1c2hlZCB0byBk
aW4gd2l0aCBhYm92ZSBtZW50aW9uZWQgY2hhbmdlcw0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBh
bA0KDQo+IEJSLA0KPiBNaWNoYcWCDQo+IA0KPiA+IC0JaWYgKCEoaW50ZWxfZHAtPmVkcF9kcGNk
WzFdICYgRFBfRURQX0JBQ0tMSUdIVF9BVVhfRU5BQkxFX0NBUA0KPiAmJg0KPiA+IC0JICAgICAg
aW50ZWxfZHAtPmVkcF9kcGNkWzJdICYNCj4gRFBfRURQX0JBQ0tMSUdIVF9CUklHSFRORVNTX0FV
WF9TRVRfQ0FQKSkNCj4gPiArCWlmICghKGludGVsX2RwLT5lZHBfZHBjZFsyXSAmDQo+ID4gK0RQ
X0VEUF9CQUNLTElHSFRfQlJJR0hUTkVTU19BVVhfU0VUX0NBUCkpDQo+ID4gCQlyZXR1cm4gZmFs
c2U7DQo+ID4NCj4gPiAJcmV0ID0gZHJtX2RwX2RwY2RfcmVhZF9ieXRlKCZpbnRlbF9kcC0+YXV4
LA0KPiA+IERQX0VEUF9QV01HRU5fQklUX0NPVU5UX0NBUF9NSU4sICZiaXRfbWluKTsNCj4gPg0K
