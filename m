Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3514C88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 04:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7370910F929;
	Tue, 15 Sep 2026 04:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERnCAc4A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5E910F924;
 Tue, 15 Sep 2026 04:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789445748; x=1820981748;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4J/WSFLZkF5eE2tZquU8qgatj806fJnZtQm8Wys05YU=;
 b=ERnCAc4AVlxyHV6SRDBkDGFyU2OQAANkGzdsGs9tEkkQQMFVGD+WyFuq
 FhDBCY5yeK7a9lp6V2RD/BTIfzuj+xBZe3zQBt6iBZc6F6XBOKq/7Rk42
 i2kq/X82WAJrWBlPb8xLemm1QDzqgcC1Bh2agRgbHjrltGEzl99Ada37L
 3c/NYaSW2SGITbkuHCyuI2ULuje7C8OVUWRXAgqFLX+N+lnbxex3fp1bk
 GSFmAErpJ6aLXP71gP9Je+DDHlmH5n5Dp9iFxhdgUxBzsGkMyme34EZG9
 YqwHsZrbnfJK+XvR4hNExZpRN8HNOFyi8JvmFAQZUr15QEbm/LvrqakXj Q==;
X-CSE-ConnectionGUID: kGPx/3AvRiSLM/9Poo6q0A==
X-CSE-MsgGUID: Bxk+7+tHSrK2d67lGntPTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93666740"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93666740"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 21:15:44 -0700
X-CSE-ConnectionGUID: y0l8L3G1TDKdxFJO2NSgyw==
X-CSE-MsgGUID: hHZFUwPqQl2jrt4m/1Jw8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="311103228"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 21:15:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 21:15:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 21:15:42 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.32)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 21:15:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJw8tI5B9pdYgJHZgH09K4j2WIpvZ5cH2PCClU5ZU+F/ANr2iHEjoLayR+pM2h7FHs71+/Lle1Wv2Q9Nt62soKNCNKsFUFxhd06rhpazyjpEcnjJPQiSRN/QcG+h8/Z8CV6f5zoS0P8SEibkEZG/Qn/6pPpi1LXh6AF4lqH5hUTaE6YYNj3ZrSNlCZZW0XDeayo6rbKhz6Fe4jxIduY062cYCyCRQRW2VMUyT44Z4+YGBu0cnHq2OIPLcbxC8EjSdAYsU34fjVZuBFCbheTFKFwv87OpX+7geebAC+1QsqLVVEhqo+s9q3HX/ZU9xvPdCIuxUuCF4fTxjlTWwGZ5aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4J/WSFLZkF5eE2tZquU8qgatj806fJnZtQm8Wys05YU=;
 b=sr4eIGtuOxC5A3mL2kGEfiTUDfwxNhYZW8DPf3k3uy3KXmd8spZ9BMVsnRDb905os/ppFX4UU1w05lll0pe0Kew+bWbTRlzNzvoirDyA1dZ4dHu9KWev3b0bxIQZ9KL1TnNwPx7/nyReAVfhsxhwo89eq5VGmYl5BnTaRxNq8bc4uh0OHqhi9RrCBwcKmnmZaVFwHErnT0HpD5XuV/djbC1cwbL6VRmVyR/wKscAXpVcZEIUuCoBERcX/vp1eEJF2SV6hCek58zBywwofbjHcWE76br/TJAdk6RG2L9MD8ppiuiDirKHbKE7DWSBbxTPGo21ZrHoDowj2KnZOm5rWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) by
 CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.9; Tue, 15 Sep 2026 04:15:32 +0000
Received: from DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb]) by DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 04:15:32 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [PATCH v5 12/15] drm/i915/alpm: Replace is_edp() with
 alpm_is_possible()
Thread-Topic: [PATCH v5 12/15] drm/i915/alpm: Replace is_edp() with
 alpm_is_possible()
Thread-Index: AQHdNFm6cSmhYg/qaEa3+rmaiM0VCba7GBAAgBQP8GA=
Date: Tue, 15 Sep 2026 04:15:32 +0000
Message-ID: <DS0PR11MB804928BD227DC4303B0A8870F9BA2@DS0PR11MB8049.namprd11.prod.outlook.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-13-animesh.manna@intel.com>
 <1fcd07b004289a4263428763806a6f5b79439669.camel@intel.com>
In-Reply-To: <1fcd07b004289a4263428763806a6f5b79439669.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8049:EE_|CYXPR11MB8754:EE_
x-ms-office365-filtering-correlation-id: 6abbd682-5643-4faa-d4fd-08df12dffc11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|18002099003|22082099003|38070700021|10067099003|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info: 2zQFUU6Wkc/yDMpNV/aV2vYc4Td06rWOmETVY6k94LcRmQQ/g1RNsDnT0m/oHQ8jMfyT15cR/bSzB4CqznxBeygRXpEFFyVKEmLxRUvd1iNkkK7/k9/z+xoKnG/MVOBIuwEE1L7ZtLNo5E/FKm3IKLvDLLhy25OeU+PrbNMtuWSoZQvYKNiVB7l0cSt2hYuGUb/o7b5sJ5k2JUSYxIZUGZVbIEm6981H/kTJGp+TZnbDQbGISaps3qe/l83h4j9qkN6MytNVYQLKVoxpx22DGkDe2iJ9yey5wOgR7mPIH4tOw0BnPWEUpBKvLu5G7lpjqVvNH06AQ69LlY5xtRPJIMffe2EAputN9GeY17UQV7Pj6kkGl71RuGIncPg2wkXn4Fhjk0w5I0RP4mBGhjndHIcZmsysN8tMiDZnnKPtoKgsvlIU4yq6RfmOW2LZipkYjetOvDZt1r+tb7Z0GCxAY8K9qvG8oK37cy5m3hoVhhkEKM7wh2UfRfLISwad2kbO6qbgiqOffh/Lhy45B+KyK2JWhjCItTlvqmsbZO+BV4AAE10MbIe013JVg7tjrT50ddTMSvYZPOfMPyk4bzC/JgWjZ7v/wJKt2xGhtajhSHv1XVnZ859o/ZCxVyeGnf21iPwvRqxRg2xkDYr2icqqpbU+COHNbnXRyLtZpBslxd3F6zfRra7BVPDZ5qD0ySe48SzA2Ete4k5UdEwJW4P4pqrou9+MWEYa5nosRb1Fjwc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(38070700021)(10067099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFdKMTBEM0NlandlWmJFMmpyZDBYMXFYUHNaZ0t5UXBGa0NXSmlGY2FKVTZl?=
 =?utf-8?B?SGVpbG00SnlPbUg0TmVUbWd6TEhiQ1RNbTdCc2o3dGZ2ZFdENEJEMkJLaFRV?=
 =?utf-8?B?MkVLRCtjL2VUeUtEM081UXEyRFZkNm5OdGRMODlpRmFlVUUzSWRZMjVLb1hZ?=
 =?utf-8?B?NWc4L3pleEtoZVU1dklzQzRHbEZmUXduU0tVT0tsYTd2QnN6YXdqcWxhUmpJ?=
 =?utf-8?B?MWhROStBdjJhQm9MYU1JRmg2Q2pnZWJ3UFhBSzdZelZEVVQxRTMzUGR3Q2dl?=
 =?utf-8?B?Q0FvSjNSU3U4R3kwMmpLcmNKN082aEtJMVdGekJ4TlB6OU5haHRBYmNhMmYz?=
 =?utf-8?B?MEZsRTdpTDkrUTdEcmdOUy9MWHZwR2x0VWtPa2F2NkJ1eTBhcEtEUzNpRzVq?=
 =?utf-8?B?UFBtbmdVMUFxTDRlaEhjL0NieHgyNEpkTy9RU2lFc055eWRPcGRxRDE0eGhT?=
 =?utf-8?B?OGJRSmNtWjZNdGgvS1grR3Z6em1FZ3lZVzJxcUtwN2lyQlUvc0p2dDlrMVJJ?=
 =?utf-8?B?RERNaWdsNTBnMmJJTUowUXBZWFRWWmNTNmkvQ2Z5ZTd3MWgwdnBFRG5FY2Za?=
 =?utf-8?B?Q1gwMHRzckpqbm9kTkI1SGV2L00yVWFwT1E5cEszSkQzamo4b0p3ZUZKaXBO?=
 =?utf-8?B?dUVHTGVheWxMWjZxZVpwK1U2cisvK3hSTnVRSy80NXBmMTFaNWo3MzM2cUFh?=
 =?utf-8?B?K0tpbkdUeEVkbDhhTDV4S1U3WjFnQjl0eTBBZEtUbFZ2U1dqY0FkT1huMlVk?=
 =?utf-8?B?bEMxMm9HTTgvSHZKMzFaa0tGQXB1cUI5aEkzcWRLcCswYUV4ZkZoOU00aThB?=
 =?utf-8?B?NzQxLzdEbzUwOXE3cTZaV0hwRjdIMFNmK2c4YUE2WURLT1hsYW9XNXRIOExv?=
 =?utf-8?B?YVlTN1U1OW9TSmFOL1E4dmpONEpwekFaNndkSHBIb2JEb2xIN1JRdFdER1Q0?=
 =?utf-8?B?RC9BRXFKaGx4dTZPakE3clZCL3hKSXMzd2pRTUh5OUVPQTJTNEtlQVNEMHR6?=
 =?utf-8?B?dFdEeEM3UFkvY2pMQUF6aHJNQWJZRUNmMUVMQlQxVkxJeDZMQ2JtVnFwY0t6?=
 =?utf-8?B?dFhURHEyaWpRb1F3RWtIYWVRU0R6VW53K2RIdnJMcXYrNzhqMEwvV3Nicyt2?=
 =?utf-8?B?SUFiTnNrT0VnS3BpZ1RqSHY2QlBYK1B4ZW9BT3FOUGhIeURYSWhSbjk3eERR?=
 =?utf-8?B?YkcveEsyK0NQcmNEV29BYWhiQy8yQjlPeXpNc0pvUWkvVjRCcVVodlFsRGlQ?=
 =?utf-8?B?Qi90ZjlUNDJBTzdIMmU2TEZIcC9aUVZSUUlIZERxNmtZWVNqVVRKNFd0d1V3?=
 =?utf-8?B?UWhYR0d0N2RzcUVpZHJZNGNVZ1Jhem52VTcrYjVPa2tLMDZORHJramxJMkF0?=
 =?utf-8?B?bzJXVm1WTXk0dUhpeFhXWnJjY0VPTlVBd28zK2tSL0Y1Sm9qOXZIdkdMcmpu?=
 =?utf-8?B?TkpPVkcrcjVhblpsamNPd1RWVmg2RlBEVHJzNjFEak05Q1FLdEZjWkg3MUR3?=
 =?utf-8?B?dmljM3FxUU5WL2RXSDA0S0M1QnJWSXNMZm0xeENxRi9aZFhnajRLbkFqWUVI?=
 =?utf-8?B?elIrT21lWEtRSDhyVytxTldTeXZqU0FHaCtIKzV3djEzU1lDKy9vcllNc3NB?=
 =?utf-8?B?K1VvWDA0SnFQQ2EybTdzSVZEV2pvZjlIYi8xdDJ4blFOaGliMGNSbG9Ed2lr?=
 =?utf-8?B?RFFqNDJKalpGdXB5SnNGbWdHTUdNSHZIUXpWN2FWTUhnM0lBei9Tc2UwUVlX?=
 =?utf-8?B?UEd3WWoyK0U5WUg0NkdaK24xa0lEL2d4MFZXMEpiMFJFSmRMZDRTQUFoeTRE?=
 =?utf-8?B?NUN2VHNmVDhZVWJOSkNnUi9IN0htV0k1UzRoeDVLMzhZVzFscysvMFhpelB5?=
 =?utf-8?B?amRUeStVZVJ3Mi9jcEE3U2pUNytudzY5ZkczcldYcnEzenQyYTBYMFZiTC9x?=
 =?utf-8?B?L2paMUg0UHlaVWVnb0t3cnZLKzEybDBQdkh4Z0RNTEt1cVhNTVRIUWZHUFRa?=
 =?utf-8?B?bG9wbm1DTUdQaFlPR2tUbTRmWUhFWEdYSkFIVWxFV1gwSXBaN2w3d29qT1lq?=
 =?utf-8?B?RDNwNGhad2d1YTdkSmdTeHJwWXQ1cXd0T25LZEM5TlVaNklkb1VySFVjUDQ4?=
 =?utf-8?B?eHcxcjl0ZEk0R1Bsc3oxS0NUalVmbi83T3NvaktBajgxVHVCdEwrd2FlMjZW?=
 =?utf-8?B?eGNKdEw3SGtPWlRMaXpET0NiR1NkTE5sOERJak1rQjlRU2JUMmozUW1jYVFI?=
 =?utf-8?B?Q2JoYW85UUhnOTd3TXlJSG5vc3ZOYTcyL0EyMGYrMTN6VGJSQitXQVdaaS81?=
 =?utf-8?B?TVdjNmhjdHlXN0Z5elN2aTJ0UEFYM2t6YmJWc2cyYzMxYjJmZElpdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aXe0l0PNYU5568NNOoHhGxsUtGMJoF8lpuXbR08mmZieOU5ZDuBz06o5iEtaG1u6BEKZNJv4E2P7wIO6okARQOc7IlKGqKVPQYqw8Puj5q05Qy5Owg4eJ+AdXcrauQok6yjYOoT8BtqvC2Z4M5AA8UzjIdawG0YuDzmbQJVjMc7MdiozZ4gI2HntrBPDGdbEwEWZkhXtqUIuEtdajU2gS93KmPpvFbptVpAPdX0wJ/eDja/TlP3GIHRlBtIGMYOz0GYzSozYkqvEAGnKpRX3UWCUUgNoz9jQkQVXWXG3KQBC5iWza5Ka4BUV1IxVS3ZjzernrT1Q4QaDKPDYpiVV/Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6abbd682-5643-4faa-d4fd-08df12dffc11
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 04:15:32.5740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HIWTVbkWhK/FsikyRonE3kOSHVTeaBIt6FDnFIV2S2EqcD4N+PQhNSZ6aFkb1QKTByKRbN3KEc7tnkcaYtU18A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8754
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSG9nYW5kZXIsIEpvdW5p
IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVy
IDIsIDIwMjYgMzoyMCBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBN
YW5uYSwgQW5pbWVzaA0KPiA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+OyBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBLYW5kcGFsLCBTdXJhaiA8c3VyYWoua2FuZHBhbEBp
bnRlbC5jb20+OyBOaWt1bGEsIEphbmkNCj4gPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2NSAxMi8xNV0gZHJtL2k5MTUvYWxwbTogUmVwbGFjZSBpc19lZHAo
KSB3aXRoDQo+IGFscG1faXNfcG9zc2libGUoKQ0KPiANCj4gT24gVHVlLCAyMDI2LTA4LTI1IGF0
IDExOjE1ICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0KPiA+IEFkZCBhIHNlcGFyYXRlIGFs
cG1faXNfcG9zc2libGUoKSB3aGljaCB3aWxsIGNoZWNrIGZvciBib3RoIGVkcCBhbmQNCj4gPiBk
cC4NCj4gPg0KPiA+IENjOiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNv
bT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5hIDxhbmltZXNoLm1hbm5hQGludGVs
LmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
YWxwbS5jIHwgMTYgKysrKysrKysrKysrKy0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9hbHBtLmggfMKgIDEgKw0KPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxNCBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiA+IGluZGV4IGQyM2YzYmRmMTMzOS4uZjNm
NmY0MGY5NjI0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfYWxwbS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9hbHBtLmMNCj4gPiBAQCAtNzIsNiArNzIsMTYgQEAgdm9pZCBpbnRlbF9hbHBtX2luaXQoc3Ry
dWN0IGludGVsX2RwICppbnRlbF9kcCkNCj4gPiDCoAltdXRleF9pbml0KCZpbnRlbF9kcC0+YWxw
bS5sb2NrKTsNCj4gPiDCoH0NCj4gPg0KPiA+ICtib29sIGludGVsX2FscG1faXNfcG9zc2libGUo
c3RydWN0IGludGVsX2RwICppbnRlbF9kcCkgew0KPiA+ICsJc3RydWN0IGludGVsX2Rpc3BsYXkg
KmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KGludGVsX2RwKTsNCj4gPiArDQo+ID4gKwlyZXR1
cm4gKERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDEyICYmIGludGVsX2RwLT5hbHBtX2RwY2QpDQo+
ID4gfHwNCj4gPiArCQkoRElTUExBWV9WRVIoZGlzcGxheSkgPj0gMzUgJiYNCj4gDQo+IE5vdCBz
dXJlIGlmIHlvdSBhcmUgZ29pbmcgdG8gZml4IHRoYXQgaW50ZWxfYWxwbV9zb3VyY2Vfc3VwcG9y
dGVkLg0KPiBNYXliZSB0aGF0IGNvdWxkIGJlIHJldXNlZCBoZXJlPyBXaGVyZSB0aGF0IGRpc3Bs
YXkgdmVyc2lvbiAxMiBpcyBjb21pbmcNCj4gZnJvbT8NCg0KR290IGl0LCBjdXJyZW50bHkgbW9k
aWZpZWQgdGhlIGNvZGUgd2hpY2ggd2lsbCBjaGVjayBvbmx5IGRwY2QgaW5mbyB3aGljaCB3aWxs
IGJlIHBvcHVsYXRlZCBpZiBpbnRlbF9hbHBtX3NvdXJjZV9zdXBwb3J0ZWQgaXMgdHJ1ZSBkdXJp
bmcgaW5pdGlhbGl6YXRpb24uDQoNClJlZ2FyZHMsDQpBbmltZXNoDQogDQo+IA0KPiBCUiwNCj4g
Sm91bmkgSMO2Z2FuZGVyDQo+IA0KPiANCj4gPiArCQlpbnRlbF9kcC0NCj4gPiA+bHR0cHJfY29t
bW9uX2NhcHNbRFBfTFRUUFJfQUxQTV9DQVBBQklMSVRJRVMgLQ0KPiA+ICsNCj4gPiBEUF9MVF9U
VU5BQkxFX1BIWV9SRVBFQVRFUl9GSUVMRF9EQVRBX1NUUlVDVFVSRV9SRVZdKTsNCj4gPiArfQ0K
PiA+ICsNCj4gPiDCoHN0YXRpYyBpbnQgZ2V0X3NpbGVuY2VfcGVyaW9kX3N5bWJvbHMoY29uc3Qg
c3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gPiAqY3J0Y19zdGF0ZSkNCj4gPiDCoHsNCj4gPiDC
oAlyZXR1cm4gU0lMRU5DRV9QRVJJT0RfVElNRSAqDQo+ID4gaW50ZWxfZHBfbGlua19zeW1ib2xf
Y2xvY2soY3J0Y19zdGF0ZS0+cG9ydF9jbG9jaykgLyBAQCAtNTE5LDcgKzUyOSw3DQo+ID4gQEAg
dm9pZCBpbnRlbF9hbHBtX2xvYmZfY29tcHV0ZV9jb25maWcoc3RydWN0DQo+ID4gaW50ZWxfZHAg
KmludGVsX2RwLA0KPiA+IMKgCWlmIChpbnRlbF9kcC0+YWxwbS5zaW5rX2FscG1fZXJyb3IpDQo+
ID4gwqAJCXJldHVybjsNCj4gPg0KPiA+IC0JaWYgKCFpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHAp
KQ0KPiA+ICsJaWYgKCFpbnRlbF9hbHBtX2lzX3Bvc3NpYmxlKGludGVsX2RwKSkNCj4gPiDCoAkJ
cmV0dXJuOw0KPiA+DQo+ID4gwqAJaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpIDwgMjApDQo+ID4g
QEAgLTY4NSw3ICs2OTUsNyBAQCB2b2lkIGludGVsX2FscG1fbG9iZl9kaXNhYmxlKGNvbnN0IHN0
cnVjdA0KPiA+IGludGVsX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlKQ0KPiA+DQo+ID4gwqAJ
CWludGVsX2RwID0gZW5jX3RvX2ludGVsX2RwKGVuY29kZXIpOw0KPiA+DQo+ID4gLQkJaWYgKCFp
bnRlbF9kcF9pc19lZHAoaW50ZWxfZHApKQ0KPiA+ICsJCWlmICghaW50ZWxfYWxwbV9pc19wb3Nz
aWJsZShpbnRlbF9kcCkpDQo+ID4gwqAJCQljb250aW51ZTsNCj4gPg0KPiA+IMKgCQltdXRleF9s
b2NrKCZpbnRlbF9kcC0+YWxwbS5sb2NrKTsNCj4gPiBAQCAtNzI2LDcgKzczNiw3IEBAIHZvaWQg
aW50ZWxfYWxwbV9sb2JmX2VuYWJsZShjb25zdCBzdHJ1Y3QNCj4gPiBpbnRlbF9jcnRjX3N0YXRl
ICpuZXdfY3J0Y19zdGF0ZSkNCj4gPg0KPiA+IMKgCQlpbnRlbF9kcCA9IGVuY190b19pbnRlbF9k
cChlbmNvZGVyKTsNCj4gPg0KPiA+IC0JCWlmIChpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHApKSB7
DQo+ID4gKwkJaWYgKGludGVsX2FscG1faXNfcG9zc2libGUoaW50ZWxfZHApKSB7DQo+ID4gwqAJ
CQlpbnRlbF9hbHBtX2VuYWJsZV9zaW5rKGludGVsX2RwLA0KPiA+IG5ld19jcnRjX3N0YXRlKTsN
Cj4gPiDCoAkJCWludGVsX2FscG1fY29uZmlndXJlKGludGVsX2RwLA0KPiA+IG5ld19jcnRjX3N0
YXRlKTsNCj4gPiDCoAkJfQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2FscG0uaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9hbHBtLmgNCj4gPiBpbmRleCA3MjgwODY1ZWQ1ZjAuLmIwZjZlMmE5ZWVkZSAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uaA0KPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5oDQo+ID4gQEAg
LTE4LDYgKzE4LDcgQEAgc3RydWN0IGludGVsX2NydGM7DQo+ID4gwqBib29sIGludGVsX2FscG1f
c291cmNlX3N1cHBvcnRlZChzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3IpOw0KPiA+
IMKgdm9pZCBpbnRlbF9hbHBtX2luaXRfZHBjZChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKTsN
Cj4gPiDCoHZvaWQgaW50ZWxfYWxwbV9pbml0KHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApOw0K
PiA+ICtib29sIGludGVsX2FscG1faXNfcG9zc2libGUoc3RydWN0IGludGVsX2RwICppbnRlbF9k
cCk7DQo+ID4gwqBib29sIGludGVsX2FscG1fY29tcHV0ZV9wYXJhbXMoc3RydWN0IGludGVsX2Rw
ICppbnRlbF9kcCwNCj4gPiDCoAkJCcKgwqDCoMKgwqDCoCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0
ZSAqY3J0Y19zdGF0ZSk7DQo+ID4gwqB2b2lkIGludGVsX2FscG1fbG9iZl9jb21wdXRlX2NvbmZp
ZyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KDQo=
