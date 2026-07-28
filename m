Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652ACC531F9
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 11:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132E810E869;
	Tue, 28 Jul 2026 11:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKLicBnR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA6510E57B;
 Tue, 28 Jul 2026 11:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785237274; x=1816773274;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QfUQ2Ns294sN2KkAL1TOW1+Ku+q5ctRSd92c/th2QHw=;
 b=YKLicBnR1To31zKWoPm1EfJdzUVev6jcrWNFxd4RQFHJ5VSnJPjaHN2f
 vqTbSIFy7KJGhJUjpt7lOALP5rt/MtslJb0sSVg8Rap8W6qSVrW18wqNX
 dkVNwhOdvslPUQ1UpvBlGKTIQ2zIyUxs+R6uaupX/SxqL+u6jzQ71nlym
 X0P0uGq8a34Fh4lM1oA8t2p9xLnn6HctGNoX38GGagkORgncm9jrKMz3V
 hi/q+Eu/Nm78ru4u30h4NOdTdtcDh8m6FEWhHd+EgUV03U1tGQHVv14vz
 /FhhE8t3rOf21amyiWi71YUJ2QEiiYzROjX90aWkn9MeHpuxNLREC/XQO A==;
X-CSE-ConnectionGUID: uD/yrUmRRQ6hhvYVFmiZ5Q==
X-CSE-MsgGUID: H2dqS6j9Q1a8M8VD7W5Rcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="73355013"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="73355013"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 04:14:24 -0700
X-CSE-ConnectionGUID: nlyzTkCwRbqqq81aOZ7ExQ==
X-CSE-MsgGUID: bg8jpPY3RYSuWMTjNHxQTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="253346732"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 04:14:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 04:14:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 04:14:23 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 04:14:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0mSLET/bKKOL+lExFczjClPaB9KyFINMgnI0gnbfbiBddkdi+wH0Vv33dRP2SJnUJA8DxJE+YqeKurf6JulU75CC/HOEayh1QXh2RQo7OJadmvRBKG84BqPoWNWMFbsH0lpIdwPEnipVGqCmSGU9IXN2k6NRe4lnddgIpM9Sq58PPVFYgcoG37CuMqfry6vBDM82gAjrcf07lek/lGmgj7qAIw+ZWFSRsZlBXLUbs31kA8T+2zhi0yddPSv571PxsAR6HBNfY5Ic8lzmJZ1VgeA/dnCFkiYLmFk+3BTXV5O3WtQsk/BDyth+XqZYtL1eRlQ9Or56+R7wI6RCT+3AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfUQ2Ns294sN2KkAL1TOW1+Ku+q5ctRSd92c/th2QHw=;
 b=XQvBmsknnliulBPNXHli3KY+tmn6r3pweb9p7pvOjxWJKWG4m9niLU24W3uLVp9MGN2XqpnRu6FOKlLPg7Cc7iIXgBM1A2tFVPlSJXle+vf231g7lZRjN9BO4KUZHlpFnYy90DHfORgzDBE4PW5y/FzkDIq16D0AlDXbkFZitwpomEWzK9skRvQ6Gzqx+5xgcbu22dvs/ZxObec6U2GFY/tI66/67fYWFhAexMV1HPRzr+vcCZ5eEZIulOmudyJ0IcgLMKqsMf2HOQUTQdX+LWjYQ+NcCI1OOKQ9FEWUWnHveHoTG8vj9ZAh23MA6Y9xBSfcRcLlebf3RPbxe86dIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by SJ0PR11MB6766.namprd11.prod.outlook.com (2603:10b6:a03:47c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 11:14:21 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31%7]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 11:14:20 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v6 9/9] drm/i915/vrr: Enable cmrr
Thread-Topic: [PATCH v6 9/9] drm/i915/vrr: Enable cmrr
Thread-Index: AQHdGZbr+0Jv0pBzXkOf71Ffk0QrRLZ7S4gAgAEk+4CABmA+0A==
Date: Tue, 28 Jul 2026 11:14:20 +0000
Message-ID: <IA1PR11MB6348A512894F5CBE7C1F7CD6B2CB2@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260722043923.3241977-10-mitulkumar.ajitkumar.golani@intel.com>
 <3adf77cc-f716-447f-898f-fd129533ff44@intel.com>
 <1c19cb67-bf6a-478a-945a-12523ca6c5a8@intel.com>
In-Reply-To: <1c19cb67-bf6a-478a-945a-12523ca6c5a8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|SJ0PR11MB6766:EE_
x-ms-office365-filtering-correlation-id: 36d9cdb9-d5aa-496b-6d00-08deec995f6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|23010399003|376014|1800799024|38070700021|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: de6ZA8Y4zrrszOXVP/9VADkkby+eJQVA8x/bBrJpe7wKhwozHK6E+gNGSZYKaBpwtjIX6C9CGPu9WhOd5KhVZNt2XNqy7t5vYZ6ETxBuYotQceCcbbTRBPJsJn/cC5mtJuLfSkrAj0qatw1W9pGoZ2ZnDNBAgvpgJnAS1r2sjdcCCf5Dr4jt2bCbrw8sBaj8tu9nMpf4ebm1vxzQCMBY9Z5QPyPYM8hcPtXM5H3vH3YIXNzq0Airy1mYmJBniqc/xasG1eQEM6Q7Ayaq41GcRjovbdBf5JftFn8c6cnF/qPelm06nBrKJMN3KpzPiIdGfdVorGoHgCS+kZeqAuHNK2L1hRKpxb31voZaD2YNN0FLFsJsyy7kDpUHXcmJYTP8u4d50dR9kV66C2pMO30k/+GCX7TyVAQrUyhCIemSaS+Lt8NS5C3o0rfyTTq9mI7LcfLnegJ7wYzJa+Aj0TsHvHNP0x7CV2Rw99bNbpx56S52rRk790FEpdQnK2TbtegTXp1Io3Rw1meg5OO7GAmS3FJKgjKuaqfWH3hu62FSltgB+GZT/DhpDvDIujspZQh/nTjvvhlTXoyMhlOMCqtSHQXx3wq0akxOFDdonWM7oKFdGClBbTyAtKMuKfkkroJLs+Jt+RXaZlAuHehqO5Fss7H73TYskmuwJmH+CdyA5SCNULwbQa7oBLjGqg1P6GOgbDa5IMO1a4Djukr+Ox6uEdMuCEkAwDNE456Km2hw2aE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0E0THhkR0VOT1NrK3V6Y3VzNWRkK0Fzd0VDRDh2cEF0VTlmSjZsYmI1dnE3?=
 =?utf-8?B?ODM3ZVpkVisvTFYvOWtRTGtKaFdMbmhDRUUrZTQyK0RmdU1DVGVsUFdBNGVS?=
 =?utf-8?B?YTVvaTVRWkhENC8xb1JnQjM4OEFVbERKSVZjSkg5RWpxSStjamVlWi81Sndw?=
 =?utf-8?B?MWpFVTZKb3ByRVc5VVFmbUFsTVpDbm01ZEVQb2JiK1d1NFloT21TcnQremtr?=
 =?utf-8?B?TTE5d1ltbVpKZEtGRSs2VkNTZHFaZkk5cDB2TmJadUxpZ2h1MDFWNitYV1lO?=
 =?utf-8?B?U2pqMERRNlcxMVYxMkNHV0Y5THd4cjBtT2dUcWJ2LytnNU5kMjYrM1Yxemxy?=
 =?utf-8?B?aDN4RTVaOHFhVzlGTW92OFNoeXhNR1dUdzlsNVdCWVkvdEhXb0EySTRCNDdK?=
 =?utf-8?B?LzBJaGdMZ1h0K0lodFphdzRwNnRwb1RkRFcyZnczMU8vSGVQTHQ5YjBJY0ZP?=
 =?utf-8?B?VzN0UmlEOGV6OUVUTnlWRHdUR20zWWZBbVNMVUxod0NPRUFKbDJ2N1Y0YUNi?=
 =?utf-8?B?TmdQY2tmcmFxbUYzVm1sZjVvcGxXVHNaWXlPcE0xK2dLam90N3BKS1o5UmNR?=
 =?utf-8?B?VzJhbWJkRW1RQldXL004eVdURnFZclhVcHZPZ0NNSVROcFpGV1dUeGJuQjRa?=
 =?utf-8?B?OUNaaFFEYS82cG5TK3YrWXlpdmJ6TlFUT1d6ODVlc1JDSWV4aVVHTy9CT0JU?=
 =?utf-8?B?alB5TTVxZlorVENvcDNKTTdHVU5WMS9GaVhGMlpqaGRybkNBZWxodVZqZW1h?=
 =?utf-8?B?ZU1DVW1sWDB5TmlpLzdSRWFCTE8xMzFrMzhFd1dySHVNaHBXM2VIb3d5Mkkz?=
 =?utf-8?B?cjRwQnVnOCtJS2pEMDArOWFOdXRZd1hKNFp6WkxHOW9iRXRyZ2tmOXMzZXVW?=
 =?utf-8?B?V1U3M3lZeFRpWjhFU0RHb0tncUc2RExabzU5cnBLLzBQQ1hobGN1SlVzUUtq?=
 =?utf-8?B?Z3ZZRWREZHl5dlBqZDlOVEpTUlVxTG4vNjllU1ZsVG9GL2grOGVRQUtxOWpD?=
 =?utf-8?B?bCtjWlF6V3NMaXBrckNkN04wMmZDVkFKNzBZbFJzNFFwUEY5VU5GK2lnaWQw?=
 =?utf-8?B?T2N1dVlyWkc1OFNHZlF5OS9DdXQ1MndaRGxCQ0ZSM1J2bXlicno1UENLTjN5?=
 =?utf-8?B?Y3JMYmpuR2xSVVRZanB1Rks2aVhsV3hVbEhmaENnazFIQmg3OXZZYUkvSmRk?=
 =?utf-8?B?QVhzWWluVUlwbXZ6L05leVVzVnFoS3Frek9CNTMrTUZkM2FOeXBvUWRHNVBP?=
 =?utf-8?B?MStyWVBoUzlTM0ltVUxPS0dCdEtKRGdvUW5kaHpERnh0STdjNnQxMTNJcUNH?=
 =?utf-8?B?c0NyTnRPZEhYZ3huUHRLclNpN0hqalNySFRtS0liV3lTZDRhc2l0QnFOM29S?=
 =?utf-8?B?WE5iOE9IbllQZjA3bS9maWJvNWgzbUFxS1Z2Y0xNaEJiV2FGdlM2OHE2SFBz?=
 =?utf-8?B?ZCtUZ0dvT1VRV08xODRGZ210MG83eWxrVC9WYmkrTkd0K1FqRVlodlgwVTh1?=
 =?utf-8?B?U0JNUzZJd2pzM0RtcHpRb3pWUVpsZlowT29GVzZ4YlRycmZ5OVFCaHpPb0tW?=
 =?utf-8?B?Qy9Dd0JxR2krYlNjRC9wTHRUWFpFL2pLbEV6c25kWVExNlRwaitwcEVBK3R1?=
 =?utf-8?B?d29uakc1VWtzOWNoYm5ma3dOQ01YRXBlVFFxSitqUlhlekdIU0NvbU5ZcGZ0?=
 =?utf-8?B?S1ZUaG1POUtlZ294VUxrRHE0em1VMHAyZzRHWjRvYVRWbEllMXlkSEM4SkRu?=
 =?utf-8?B?eE5scWd4cXhBQUoxbUNXZENLcGZza1hCODRNbmZLWFJROHFCYlhzVlpzY1lx?=
 =?utf-8?B?YVQ3b3VNOGl2SDBaSE4rdTBEY0trMitCclluMy9yYmFxSjExUFoyemlGSEU1?=
 =?utf-8?B?SXRqMlh0dHQ4VWM5b1ZJZHh3TE5yTDY5dWNhUjkyUWRTQitNenJwVjd4Qkdp?=
 =?utf-8?B?UTlBdnF0U3djQzF3MWNrRkhGQzFieGZmY2xyS0g4cDRZbnZoMXpxRGgxRWkz?=
 =?utf-8?B?bVczZnhqQlo2SXBYTXg0SHdLRjBDWHA5OUNqYXB1Z1Q3dUFrN3VacVExSUlU?=
 =?utf-8?B?SHZ3TU9HUHJ3V3NXNFhJSjRrdExkZEZTQTUwVmFGaHVMdEZ0aGxlb3VqNHFo?=
 =?utf-8?B?MnhPa1NXZHBJSXoxQUtjVUZUajRpV0hOOVJEZjY1NzYwODFpT3hocDI4TXph?=
 =?utf-8?B?VkZiRUZLZWpzQzJScVhKbG9PTWpyU2NwUkt3aGk3Z3RqY3dJbEwrY1RFa29v?=
 =?utf-8?B?aUFQQjRjU3pRTkdoOWRjVXpUaDMremFwaGhMbFZucjlEbjJyQW5TVmlwQy93?=
 =?utf-8?B?bnRtYmpBRmdLNjE5dzJxbmZ6NFVqTVhhWE1XZ3QyRTd1WHJyU0dXTndwZ1or?=
 =?utf-8?Q?f5DYri8rVCwo0WY31PZuGITfIrH/Q76JfvNZSa6TFIQPT?=
x-ms-exchange-antispam-messagedata-1: xW/f6FtKg91ErKD6IV2YLYy3ZCzh6pyCAt7sxrNLVPWdTYPKanr7sBz7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XCO+7j8uBvS7VIqRwNw5MDQAYGVjhk3luUlVHesop22JPvRfUEdVYqog5ohJdpGMDSrslI1HUSToOEkuibRos81EpIDdHZZy1vsDcSC1TBMT4GleQTnPwlugz+1jnFXyI1CGf6kbGMlvAhzubN3lpuq1CZWrxXJIoCc2VSAbkPGRITT2CsLLjeOxx7ANM9DB9UNTlWjKC3r6Y9cVdBfd319DNfNuPs6GEaan5WQHvo0BuIT5tlJYVa46aN4tq8xR9/B2R7n+TL9mLQyoIV88MiJq4XTdIlIimxutoiA9q4ulN3MBteQy36CIaDURecJJ/XNQiQNcK+JbUrisxF30gg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d9cdb9-d5aa-496b-6d00-08deec995f6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 11:14:20.7963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Mt3tTcpmtb6TeHWUA8YTGgFtpdtMsUizMaME5zy9BOsc04gNwKs0nMOV27lT9roY0vuHKzqa4pVFdndQUos/EfoZUb+sw+TXBDUuth7vRhVJ0IMvG2U07D55/ljTXNb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6766
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQm9yYWgsIENoYWl0YW55
YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gU2VudDogMjQgSnVs
eSAyMDI2IDE1OjIwDQo+IFRvOiBHb2xhbmksIE1pdHVsa3VtYXIgQWppdGt1bWFyIDxtaXR1bGt1
bWFyLmFqaXRrdW1hci5nb2xhbmlAaW50ZWwuY29tPjsNCj4gaW50ZWwtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTaGFua2Fy
LCBVbWEgPHVtYS5zaGFua2FyQGludGVsLmNvbT47DQo+IE5hdXRpeWFsLCBBbmtpdCBLIDxhbmtp
dC5rLm5hdXRpeWFsQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiA5LzldIGRy
bS9pOTE1L3ZycjogRW5hYmxlIGNtcnINCj4gDQo+IA0KPiANCj4gT24gNy8yMy8yMDI2IDk6NTEg
UE0sIEJvcmFoLCBDaGFpdGFueWEgS3VtYXIgd3JvdGU6DQo+ID4NCj4gPg0KPiA+IE9uIDcvMjIv
MjAyNiAxMDowOSBBTSwgTWl0dWwgR29sYW5pIHdyb3RlOg0KPiA+PiBFbmFibGUgQ01SUiBkdXJp
bmcgY29tcHV0ZSBjb25maWcgYW5kIGFkZCByZWxhdGVkIHN0YXRlIGNoZWNrZXIgZm9yDQo+ID4+
IHRoZSBzYW1lLg0KPiA+Pg0KPiA+PiAtLXYyOg0KPiA+PiAtIEV2ZXJ5dGhpbmcgZWxzZSBleGNl
cHQgZW5hYmxlIGNvbXB1dGUgdG8gaGFuZGxlIGJlZm9yZSB0aGlzIHBhdGNoDQo+ID4+IChDaGFp
dGFueWEpDQo+ID4+DQo+ID4+IC0tdjM6DQo+ID4+IC0gUmVtb3ZlIHJlZHVuZGFudCByZXR1cm4g
ZnJvbSBjb21wdXRlIGNvbmZpZw0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBNaXR1bCBHb2xh
bmkgPG1pdHVsa3VtYXIuYWppdGt1bWFyLmdvbGFuaUBpbnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+
PiDCoCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Zyci5jIHwgMiArKw0KPiA+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4+DQo+ID4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Zyci5jIGIvZHJpdmVycy9n
cHUvDQo+ID4+IGRybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdnJyLmMgaW5kZXggNmJjM2NjZDYyNTEz
Li5lZDIzYTAzYjBkM2QgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfdnJyLmMNCj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF92cnIuYw0KPiA+PiBAQCAtMzAyLDYgKzMwMiw4IEBAIGludGVsX3Zycl9jbXJyX2Nv
bXB1dGVfY29uZmlnKHN0cnVjdA0KPiA+PiBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQ0K
PiA+PiDCoMKgwqDCoMKgIGFkanVzdGVkX21vZGUtPmNydGNfdnRvdGFsID0gZGl2NjRfdTY0X3Jl
bShkaXZpZGVuZCwNCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY3J0Y19zdGF0ZS0+dnJyLmNtcnIuY21ycl9uLA0KPiA+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmY3J0
Y19zdGF0ZS0+dnJyLmNtcnIuY21ycl9tKTsNCj4gPj4gKw0KPiA+PiArwqDCoMKgIGNydGNfc3Rh
dGUtPnZyci5jbXJyLmVuYWJsZSA9IHRydWU7DQo+ID4NCj4gPiBXZSB3aWxsIGFsc28gbmVlZCB0
byBjbGVhciBpdCAoYW5kIGNtcnJfbiwgY21ycl9tICkgYXQgdGhlIGJlZ2lubmluZw0KPiA+IG9m
IHRoZSBjb21wdXRlIGNvbmZpZy4gSWYgd2Ugb25seSBoYXZlIHRoaXMgc3RhdGVtZW50IGNtcnIu
ZW5hYmxlIHdpbGwNCj4gPiBhbHdheXMgcmVtYWluIHRydWUgb25jZSBzZXQgYXMgaXQgcHJvcGFn
YXRlcyB0aHJvdWdoIGR1cGxpY2F0ZWQgY3J0Yw0KPiA+IHN0YXRlcy4NCj4gPg0KPiANCj4gU3Bv
a2UgdG9vIHNvb24sIGludGVsX2NydGNfcHJlcGFyZV9jbGVhcmVkX3N0YXRlKCkgemVyb2VzIHRo
ZSBjcnRjX3N0YXRlIHJpZ2h0DQo+IGJlZm9yZSBpbnRlbF9tb2Rlc2V0X3BpcGVfY29uZmlnKCkg
cnVucyBjb21wdXRlLiBTbyB3ZSBzaG91bGQgYmUgZ29vZCBhdA0KPiB0aGF0IGZyb250Lg0KPiAN
Cj4gVGhlIHByb2JsZW0gd2lsbCBzdGlsbCBsaWUgd2l0aCBDTVJSX0VOQUJMRSBub3QgZ2V0dGlu
ZyBwcm9ncmFtbWVkIGR1cmluZyBhDQo+IGZhc3RzZXQuIEl0IHdpbGwgbGVhdmUgdGhlIENNUlIg
cmVnaXN0ZXJzIHByb2dyYW1tZWQgKHRvIDBzIGluIGRpc2FibGVkIGNhc2UpDQo+IGJ1dCBDTVJS
X0VOQUJMRSBiaXQgaW4gVFJBTlNfVlJSX0NUTCB3aWxsIG5vdCBiZSB1cGRhdGVkIGFzDQo+IGVu
YWJsZV92cnJfdGcgKGV4Y2VwdCBpbiBscnIgY2FzZSkgYW5kIGRpc2FibGVfdnJyX3RnIGFyZSBj
YWxsZWQgb25seSBvbg0KPiBtb2Rlc2V0Lg0KDQpSaWdodCwgc2luY2UgaW50ZWxfY3J0Y19wcmVw
YXJlX2NsZWFyZWRfc3RhdGUoKSBhbHJlYWR5IGNsZWFycyB0aGUgc3RhdGUsIGV4cGxpY2l0IHJl
c2V0IGlzIG5vdCByZXF1aXJlZC4gDQoNCldpdGggbGF0ZXN0IHJldmlzaW9uIEkgd2lsbCAgdXBk
YXRlIFZSUl9DVExfQ01SUl9FTkFCTEUgZnJvbSBpbnRlbF92cnJfc2V0X2NtcnJfdGltaW5ncygp
IChOZXcgRnVuY3Rpb24gaW5zdGVhZCBvZiBzZXBhcmF0ZSBlbmFibGUvZGlzYWJsZSksIHNvIGJv
dGggZW5hYmxlIGFuZCBkaXNhYmxlIHRyYW5zaXRpb25zIGFyZSBoYW5kbGVkIGNvcnJlY3RseSBv
biB0aGUgZmFzdHNldCBwYXRoLg0KDQo+IA0KPiA+PiDCoCB9DQo+ID4+IMKgIHN0YXRpYw0KPiA+
DQoNCg==
