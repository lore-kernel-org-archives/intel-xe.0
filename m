Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1FBC5B572
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 06:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6F310E4FE;
	Wed, 19 Aug 2026 06:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LB4OdF6z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F3F10E4FE;
 Wed, 19 Aug 2026 06:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787120305; x=1818656305;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J//D4K/qiQJpgvDzc+L0CkWKtKDMqa93fIaYEzkXm6A=;
 b=LB4OdF6zQiKv6ZgcCelefWMogD2oPCAX86qsjwcpirOK1LyA1zlt5tJq
 KI443awtM0ShkGk8eapVh2bXt5476RnQLtk0nU9eJYo0flJFsyjk/9gj0
 slbnKDtSga0ckDxYhP8vsGwVeVsmjp1wFFNj7Lc2IBY1jGy9CHAajRxif
 60jH7ZDVd1DCI81KpaXupeGHeKbGKV6EDS8ddVKymiUa7Y6Rawd3gq23p
 uqn0qa9XjBJ5C3k10pKurq+6DjlH9f3GGGBue7m1M5xKak8bvEmxwMPdG
 a79rC/YZSTv0QETP350uadls257+gwvgfJAKNtgwdgvPiucFyk0GHxG6C A==;
X-CSE-ConnectionGUID: 8rOYvPe1RSCxMk1vhBy0nw==
X-CSE-MsgGUID: MhY5F0dsR4uf6YX+CY6Ecg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="90142863"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="90142863"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 23:18:24 -0700
X-CSE-ConnectionGUID: tMaXPumoTVOt/OaZAxYGQw==
X-CSE-MsgGUID: jTlcdfsCTZi0NrqhpCIZbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="269288455"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 23:18:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 23:18:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 23:18:23 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 23:18:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdenLi83ygWx4D/76CxPVdTubR6v97B8M3HpyxA3hzSlTIrpvqqm3rtGgK7e5brP6/WJyaMq7sjZWjxbErCfqsKxMfaZnMXZertpoV47putc2q1ed8WGj8rElxX7uQgluRf37PzD07aiaduJ/GscfrcH3HpWPd1k2Awvv3TQVAaHrhfDqPQHy5Cs4SlxJ0P/eMF6fQRjnMqebZU4obCWPfDDtHcNR9lEwoGxU7jGVoZuOo6KxwT13eDfbwdxxTyUb+LulHo+PsiKuEVrFgaLubDlyfdEJl5syw06V1fevT5Ar+Z1I8WSXJd+kVxL4o/zlGpYDopSl46s/p86255sdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J//D4K/qiQJpgvDzc+L0CkWKtKDMqa93fIaYEzkXm6A=;
 b=xj87GaM9gbEDPR4noHAUptM9aTrdVVrophq2oN04FdnR6tYyeDhu553vgICzWRcLmYcKmwgR/SfPM5s8VrzlZpKVvfh0xqusdyUR5q7xc09vitccUjnt3UamePWKfglOE/SUa69vqweS6W63vizucFdBgA0O1lFMBQhudMq0fX3je/0rle7k3crUCTW52ReB3QTBQmLx7y3t/UKqYw1b3fSfAh+qSe0xUygKZ0MJFRwFw/GCGyfFbm6roZSBJPfgcaoREKoWQ3Amb24B7AZE2u5iMagibSzwSCakvCJAi0+b9IQRJZYatpCwt2MDbjqCJCpojK6bMCT6pmds5E2JQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by LV3PR11MB8506.namprd11.prod.outlook.com (2603:10b6:408:1bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 06:18:14 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 06:18:14 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/xe/guc: rework exec queue teardown PM/unplug
 handling
Thread-Topic: [PATCH 1/2] drm/xe/guc: rework exec queue teardown PM/unplug
 handling
Thread-Index: AQHdKZFr7X2S9lWp8UGU7ulXmbjj2bak5D+AgAAMJWA=
Date: Wed, 19 Aug 2026 06:18:13 +0000
Message-ID: <SA3PR11MB8118D10309C85E6B1CF59F86D0A52@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260811133753.1742666-4-nitin.r.gote@intel.com>
 <20260811133753.1742666-5-nitin.r.gote@intel.com>
 <11b9d99a-0263-4a28-9288-67a16d145f3b@intel.com>
In-Reply-To: <11b9d99a-0263-4a28-9288-67a16d145f3b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|LV3PR11MB8506:EE_
x-ms-office365-filtering-correlation-id: 35bda038-4e48-4b94-74ce-08defdb9a6a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: uaIDfA9j6Q0ld0hpBofzOEtoz7J0acpgumPN6HofJc+B3CnFBXJ1FpPPegJTtwPTuML11QGJ8tY9s9p3iq9F/Xkwhp/vKiDY9EZ6pGWLmPK/77yU/qO2GHclBgV8A1ULnYTnD0LmQZ91IWGPbSikkepAFKkQQmmVqsvhx7A7dse3DxDgNmcyo7QraeKg1RxyKRY7rgW3x/Hhz4tYpVZk+wGdeIuClTrD4yR7A84ERQ4dXAQwP9n5IYDs0uEth83fofTCMRXSbcUVFndwM8wyoudH5i/8ml837TRFl78lYXLlg5I8MSAYvYicy2wqDn6xh593SvEueyY73qWjLCw0kCEnqGH+9Lfed0toar5Wh103GyZ0KnlITBGsg4urTkdou1clwrsjY3gYEBpUt3QhEy0Wz00W6/fxpgQPkl+t6dq0a41vQHSRbKdBXV6/QC3fozz2m8Wd+h77EhReOPNT9p10AgveDt+651o/HXse8OGS96etSslhzTZbD2GmLcnzatKTXQ+NTN/p3RhRoq2tOhB8mCrI796M7iedaVO5Lwp2d/dtC3nOh+EoeDU5dV579TpcUtu6nm0NKsyJjs2OIzEUC+iE9HlHwgoPVnm+VJRDe3H+HsE//3yVXShhA4jvbC2NJ6kqORXFiLqDjadl+CwvsYVj/q1j/OioonDb4ykk6diclE5XS8hhdD75zGNVDd59d1p2dYwR/EIn7M9/KMKM6TIuwQN3RVFY6DpaeuA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3BvQzNCSmsxN2I4SUtFZDdCVk0zTFBFdlFqV3NNQTlIcVV5TmY0SEdFRkdM?=
 =?utf-8?B?OEEzSm9Pc0xJN0ZkT25sU3BCQnFsSXEydzAxaUNnWGRvOFhUNkpPaVlHeWtp?=
 =?utf-8?B?SXh5OUQrVTV5YXl4V1QwMUNrSmRBMSszV1RGTWhoRzl4MDZIWjFMY2FwSURo?=
 =?utf-8?B?UU5UeG5BMHFEL0h0ckV5cWdoc1A2SThQNHdaWnEzSkliUVlpTmRYeWhzMGtF?=
 =?utf-8?B?VmtuZ21tM3dnNWZDRmRuSmgwNmdmWUpmbXFndDdNaURuMElDMjBYd0tvYVg2?=
 =?utf-8?B?Vk5zaEJJN0l4Q29vU2VFcmR3UUV1MGJTS2hKeWczQncva1pEZEZiNlFRV2Z3?=
 =?utf-8?B?c2FCU09ic1lMZldsRXRLSWJyMXpjNWUzTWw5RVN4VVBqajFJa3oxYmd6Y1px?=
 =?utf-8?B?NDcraEovQWFUWnBhUUdZeDI3ZlNDZEJxNjNBK0VabitZM1JjY0ZCUU5MRmYv?=
 =?utf-8?B?R0J0K25RRDlEZWVPdUtYaExLRHdCWmdEWHBEWVcrSjhsV2RRczh3dUtoZG1E?=
 =?utf-8?B?QXJOU2IyMlNhb21PY2FKcEdoQVREUTlEYVp2VUZaZTRSMnloVDE2TE95NVNm?=
 =?utf-8?B?Q1JqMERLWUZOc29BcVBQcVdWVzBoYjE1dWRMdlBjVUpzVThVYzFnZkFFYU55?=
 =?utf-8?B?TlRSeFFZNzNTQkwyNWJtYkRVd09aZ3BOcDZzSVM5SGxHZ3RrL2h4VEVmNC9Y?=
 =?utf-8?B?RnZxaXJrMDQ0WWdJNG9NUDNpeDBHOFdmUUdnTitWZlJHb0pXTmJ1OXU5Q3NG?=
 =?utf-8?B?SmkvN0o0RVpsUDZadkQydkljZitHM2NCK0lUbWRIcFIzdys2TGxneHJQV2Yv?=
 =?utf-8?B?Q2dLQ0cwbnA4MEkxVU1aT25rN29PWkFjaGZIQ0M5bGlQOHdaV1Ntemh0TCt2?=
 =?utf-8?B?Njd2YUR6VjV2S3A0bDN2dmVicVpvai9kQU42cUh1TXhiSmp2d2dIYktheXZr?=
 =?utf-8?B?SThNMVZQRmtDYys1UGlFY2IzaFI2dTcydUxkQlJuemo5ZXVaM0VHdWx3SVZ4?=
 =?utf-8?B?Z2tQcittckJmUWNYRGhQSkxyR3NSKzN1aGFMYk1QdTFZUE5FWW01ai9BaHRG?=
 =?utf-8?B?eG1zdllERGJlanBSNG9FTWlaVzlhbGpsTnE4UU9SYkNDY1hoMWpJNU9FdWNS?=
 =?utf-8?B?eXBXZVN5R1NBR09pRVN3RWZYbllKTEl2Y1FNWFI4VjkvK05CclY1dURCNEIz?=
 =?utf-8?B?ckJRbjZCUDRBaXAremU2L1AvWmNmMUpRR0prNUp2TmZrN1U4NTJ2VVF0ZWRM?=
 =?utf-8?B?cm1JU2pPQTUwWE0vSlRHZ2t1dFA0Rk9tM1ZpTGFvVUNrWWU1b2pDWnA4SnNs?=
 =?utf-8?B?aHBXWXVOVnFMenBFTkovMXIzSEw3K1BnYXhVZ0lTakRJVGYveHlJa3dhdVFL?=
 =?utf-8?B?eG5QUW90V2JVdGVkOG03ZFIrVGd4OFlScDRZY0k5U2lxaGNnMWF6L1oyeldL?=
 =?utf-8?B?S0g5c3pqbGdsVys2bjhVSUhPOVM3WmpYOUhaS09TSGVsZkNqRE1yUHFXaGdR?=
 =?utf-8?B?Y0VXR251Skc5dnR3RTlKNjBlM0ZBQ0hxd1I1ZnJrNzBpWXFXQ29aOG81dENi?=
 =?utf-8?B?YzNmVkN5VUczcmxBZTZZZHJIL2R6QXJYcXhVTGlLMk5jTDhRMzhuU0hLRWxu?=
 =?utf-8?B?ZFJOa1JNKzVSVkJkQWlITzUxU3g5Tk1MUWJGbVRTMFdlSnJmeC8zRm10U3pG?=
 =?utf-8?B?a3lka1QxOUFyZldQMjJxL1JPQUFEMmZKRzV0QUFLelJDQWNENWt1NkhlcnFB?=
 =?utf-8?B?M3dYU3A3ZzBrV2Q5WlVjYzF4TUJRNEpaa3hsQk1ZRm9rMnNVOHV5b1lRaTlo?=
 =?utf-8?B?ZFRHOXRiZWErRmFDVHhzd1NpSld0M0Z5TnhmVXEzanZ0bHdCVWZQV3MrdVJM?=
 =?utf-8?B?OGxrUkNVWmFvYjJWNlI1R3dzb2hvd01YdnpJdm0wbmgyWXlMamlPOHJqQWRW?=
 =?utf-8?B?dmdxN0ZJZnkyaFJLaEgxWnF4WkxsRWdsajlqSjM4MkJaMmRjUVBqTUg2MXJl?=
 =?utf-8?B?bkpFaTZyWmY4R1FGVkxhTXFHVFg0cHdiTEhWTmpwNXJaK1pEU3lxTGVtci81?=
 =?utf-8?B?VkVSRFU1aTdzeFQ5SndYaWtXaTg3aENrZUEyMk4rTTBiOWtxOWVwUndudGl2?=
 =?utf-8?B?LzJxSnJDZHg4RFhIOWJYTndRZGpEZDFESkhwYkJxUmM0MnJlcnloaXcxSGNq?=
 =?utf-8?B?a2FuSlp0dm0vRERWcnVLS3B4NWduYmYzcktINnJleWxsMDV3THhNUXZtajRv?=
 =?utf-8?B?K0hmTitBbFEzSW15MUZzZ2RDSXVuMUJ2cWp3a0U0bGdXdmdkbDI1c3FOMDJm?=
 =?utf-8?B?OEsxbWZrL1VFbng5aDJXVk5sVlpMUWMrUkZ0YjhRVnYxdnVVZFhrQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BlB+/WhYZJDoWKaSmgQyurQ+tKwG8Bqs3mNkRRm/SVkwki6ExTTD9dFjtpxk9FpNeadm1TczZIDY/cKNepS2VCPE5aAiPjw3oISExzallySzV7LXnZa+oSGfndaQTjR1rYnDrwqutD3pyv5pITAGEYCyWhx5Xnzyo8ORGX/v9VJVL5smtzNXL5ZZRDb73x32+B5ig5Z65bVci9Fnzq7/aQVC6rzDjn0S05I+emFF6PHumsAncMn/rm3di+T3ygxK6yM81rZr3t0E9ZAjyxy4Q+QnSRthAB1M1dx/HjRkNsqiLMpr+WmGMIO4LU1kyxwn0R/gxo667kxfikqjQshP2w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bda038-4e48-4b94-74ce-08defdb9a6a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 06:18:13.9711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rPQ4NIjBnINv/qP+3kt4m66hqTUSpGN6/25Cb3PAesonqgPxNxPG7Q6Tp/H8uCEVDBFCEsxTN5j/FbX/+G/qsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8506
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC14ZSA8aW50ZWwteGUt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBHdXB0YSwNCj4gVmFy
dW4NCj4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMTksIDIwMjYgMTA6NTkgQU0NCj4gVG86IGlu
dGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0g
ZHJtL3hlL2d1YzogcmV3b3JrIGV4ZWMgcXVldWUgdGVhcmRvd24gUE0vdW5wbHVnDQo+IGhhbmRs
aW5nDQo+IA0KDQpDSSBmYWlsdXJlIGFwcGVhcnMgdW5yZWxhdGVkLiBJIHZlcmlmaWVkIGxvY2Fs
bHkgdGhhdCBpZ3RAeGVfcGF0QHBhdC1pbmRleC1hdXRvQGJsdCBwYXNzZXMgd2l0aCB0aGlzIHBh
dGNoIGFwcGxpZWQuDQoNClRoYW5rcywNCk5pdGluDQo=
