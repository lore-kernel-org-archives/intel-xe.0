Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E94EF531DE
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 00:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8EA10E03A;
	Tue, 14 Apr 2026 00:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yqpyd8el";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6CF10E03A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 00:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776125763; x=1807661763;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ao22oRlMmXv9KPrsffHQNW26rFHzDolhkOb5Wr5OQpM=;
 b=Yqpyd8el+nMSIkYgQKYcxmf228lUVb57GlUUbFBu0T2RO2fQw3DhNq9U
 TQ034cYwIp/CiXEPTRzgciEKoFx5Uz06lGQwuU9Gwmx6wM6hGzvs0CRhQ
 oK3npum+HxIH0qbnKRXNOhPzYgM5X/RJAB20KczZAnL6UJoVCZTmaArEd
 0shjH4HO0C03Anjn2f8iIWTVAMQkJbRiAZQU3FJndyGmni0PEHas0ysbL
 H0dwwcca/lCdvr0AnCCLgXRC0+29sxZi0BeMY50jWnWyCa8hY29L0dyS3
 Rh/ytldsZePXqirUO3KdSPfilf2JZ0aWTe8duzuKzSyPlkIQwcQAWkecy Q==;
X-CSE-ConnectionGUID: BPBel422SHG2JPNy1bhADQ==
X-CSE-MsgGUID: glykCyKRR/GPGkgcwVckfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88518465"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="88518465"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 17:16:03 -0700
X-CSE-ConnectionGUID: xdW+avtlRXGLkOYFWfN8EA==
X-CSE-MsgGUID: ttv6w81sTyCDdyexNTzJxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="253315801"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 17:16:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 17:16:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 17:16:01 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 17:16:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTDvnAM7gsK9yqx8jZvAmOghz+PhZevh4ZyOKpqxqNJG41hePQR4Fd7SRbpJhA67o3naI8q8YQbNK7w1X0tjY2BFmmQ/CMSIaIQUDFjwb1jG6mM33WRM3cCSzkyPBrdN8iU0a9Q6HgqhdYyZ9l6j3wTRUx6oS1vr/zhS+9hid2FNMZb7B9iyfj4acIJyq/kF32h+Lqumr/ojRupY3/0EfqgeX+xcOIgClOngBNPJhefaREroKfGY3hIghzw+GNuXOF3tb1V7x+WbUWCBTAW+wHHdChM6abqDPjgt+Gf8DZgCZeEfycDYIVqpU1hLnr5hqWeboPXmHaZEspG+gQR1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ao22oRlMmXv9KPrsffHQNW26rFHzDolhkOb5Wr5OQpM=;
 b=T/OoojZJDDzPMK8N0m84tzyXmcyehGOVQYN2JapU4jxOMS7DoJaLzPdyscFZNanmT2xXKtQyz4sCv6E9pBqj+9POr5rbWDbZcmeRrxj6I++GWoEiVNR3lLVsAabbDMoNmXx/2WNm6YNiqLkbDvk5P2m+myhio3uz+sWj54CmDgPAgELpOD6CH889fcl/tVSkuiy9b5yMRNX+hx+yoGNcebakpEFFtOTywls6ot8v6/ilTmdNcgS6l84jCv/NNG9H6kOB9y8ShOyDrfQ17wjxTi8lKsbPHnS3Wt2aHE2D9D1jCo0f3KPG+KkfYr5Y/x+AOKT30tuObh6s7sOkeUSW2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH8PR11MB6877.namprd11.prod.outlook.com (2603:10b6:510:22b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 00:15:59 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 00:15:57 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "Nguyen, Brian3"
 <brian3.nguyen@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/xe/ras: Fix error handling in register_nodes()
Thread-Topic: [PATCH 1/2] drm/xe/ras: Fix error handling in register_nodes()
Thread-Index: AQHcxuK6I9NZAAefIkur0xx85qhxorXZTqgAgAMitQCAAUcXsA==
Date: Tue, 14 Apr 2026 00:15:56 +0000
Message-ID: <DM4PR11MB545612765F5ADC302787135BEA252@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260407225913.3397059-1-shuicheng.lin@intel.com>
 <20260407225913.3397059-2-shuicheng.lin@intel.com>
 <SA1PR11MB8839D98125E6279612D9FBBEAA262@SA1PR11MB8839.namprd11.prod.outlook.com>
 <924eb185-11b8-4d12-a310-09a935af2eff@intel.com>
In-Reply-To: <924eb185-11b8-4d12-a310-09a935af2eff@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH8PR11MB6877:EE_
x-ms-office365-filtering-correlation-id: bb5573a2-05cd-497f-95e7-08de99baffe7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: NoNJgbqbnj2krPHYYh4Ug52acjzJi55C5xqhCoIPQzqPSqwAwXt+P0QETsuPnWICg6W29bAaPzXCxRMy58c79oEz+Xqr7TyW953KxmQu9d6jl7jROjIYAnp4RNojMMNb8rMv+cexOQOM1k5XSAcH9k4F6GTp0X2fFbAgowO+S8pWDGfrURBCTo4zhUhqHBmpY9CA0zgJvFpN6DwHRkbz78Gq6gAoiBMF55FOigRZhOZcnwQ7/V+EZu/bk8aWvVGuAx0dfS2jDDaPgUCg3nv15+0TXEPbMo4z5n3q634PTv0N/hhLPvGw6gG0EAQ5NtaX3ArJN7hKuZrY1X2QXEcBlNF/4aAQoZkCTjeXJd0HYQaFqrt1w9b+aqIXz119XALhavr+YzuQhT5bCu8PMCV/byIhq37HBx/sa7zHyJI8idiqZQffxmmJw0Qg4fQm/W27+N5oWS9GdPM01vTj0NTCH6FrT4iIyLInBRYKOgvtqB91d6/JA4o75wl6iatUrubwEF1ynI90SpGT2XIqgR5W8UbBV+KDiABJHcVdoZbYI9OU7YTjjWa5aoZsc/uqDI5H7blmaB65Xmob0GJ9m5U+2ANOetggTRaJOWFKjf/EFTTna6SzXIQcozj1VlaOPLMSxhDPFvreZNLH9WPuxh5rU1bKiBeDYVeqSf5xsExfi3OCvelOeyqDjYqimd05UPXxHQzihkm5akQ8NdpYAcgbge7AoKNkxYNLC2pZHzE6m4z16Y0VP0EvhzWVDlzmy0yb518iooLY6JtBIM7KGCNphbME1lMXfktLY1C2Xh9qYlY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlBIdGVXT2VtNWt0bXlLc3lMQk95WU5EVXB4YWZaQWkyU1Rvbi84b3BZVVow?=
 =?utf-8?B?TFJSbHhhSmo4cHJmY2k2NHhCYjU3ZUxmcUhMV0lrblZwbDlIc0I3Zzhvam1z?=
 =?utf-8?B?ZE0zUWVwWmxRUW55VlVER2FkdVVQRlp4SHk5UjNSZVNKSnhIK3NwZ3FEN2M5?=
 =?utf-8?B?c3VUa1JieWMxbmtzM3owWmxET0FUNlJtOVNEeGNQVHNCdll3QkF4bHhhVytn?=
 =?utf-8?B?YUVFak5Cdm1NLy9FWWNHYSt5b0plakNSaUZiRlN0RU02akY2Q3c5bkE0YTM5?=
 =?utf-8?B?US95WGJ4d0hUeHNkV3h4YVROQ2Njakd0aDFESERpK0dpK1JiT1FuZGI5aGsr?=
 =?utf-8?B?VzhHSWlDZWdSaHh4Q0lTZ2VZa2NLWmpIOHNWc0Y2MitXUXpaYk1QUldUckx5?=
 =?utf-8?B?VnhEYlh4aGhzQk8zelAvMjEzcHFmR2FvM1Z6N3A2TENseDZNaXo1eHAxNnlE?=
 =?utf-8?B?QXdRb29KaXF4bGlUMGpyL1JvRHpWQkx2UjVsZU8yc2p5RnhQN1RNNWlIaEVw?=
 =?utf-8?B?TytvTXNySHBTNnJUZVM5VEQza3lEcXNBUlZZeTMxNXd5WXY3d1Z4d2JGUW4x?=
 =?utf-8?B?cDNOdXppZFZYMGhmcXV1TkloOENUc3R4Q0cxdnJzRFp2OE8rMlNyUkpzVzZK?=
 =?utf-8?B?cTZweWd6MFBJMDFYdUkrbXNWWlM2UWQxQ294NnkyQ09ibVZyd2J1cWlrUXZG?=
 =?utf-8?B?Q0U1L0lldlROS1JYbUgxdXpXb1VtMGIwYWxRL0RHbzFTWVRSNE5jYlJEMjdp?=
 =?utf-8?B?ZTFNbnRkQ3NjdnV3OFlCS3FOTDZrQkhXSU1RT0pKcng0MzBjZjdpQkE0TWIv?=
 =?utf-8?B?VEhwL0RWcHlXdjJINEFxOXpxbkkxbFJVSkg0WEpRVFU1Qzk4bHpXdzJOOWRS?=
 =?utf-8?B?bkVOR1pYYnpzeE10VlJacjh0MkxlaFRpWm96aXNPTUFkdFB0QUw5ZUtBS0lH?=
 =?utf-8?B?eUpBd1dkckg1VUtYb2ZRaDNvVVZLVTBpck1NZUR2ejkxbkpqeFJOUHBVN1FP?=
 =?utf-8?B?UW1CN1NlTGdLR1c5bC9Zem1sTHhZUEJRQkhBaU1KeEkzSFBKVDYxSnNjUHcw?=
 =?utf-8?B?clZKN054Q1U3V29vc3FiZXpNNzJqVUtCbjhvdVJJbk00SW9JRE1naFFTa2h4?=
 =?utf-8?B?eDJDNVVnTkpleGVHdEhEWE1FTitMT01KSmR3SVF2dGRPZDh1bk9rT3dOR2FK?=
 =?utf-8?B?SUM2UmprODN6TUFuS3ZHQ1hVRTA1R2tIOVFTWUZ6QTVqK2xRN0U5TkE0bFl2?=
 =?utf-8?B?a0lyUnp2SmhkQnhOM2VVTkRkdmxQMTR4K09leEdIVWc0dzU3OGxkVFUwcC84?=
 =?utf-8?B?VGJGeDIwRjNkUDRGcHh4eGNWWkt1cnhLSFdJdW9MMjNwVjY2UVZmVTZ5Y1dt?=
 =?utf-8?B?UEwzVUNJdG9DSzA5Y0o2ZnU5TTJRWGpmVE9WVWN0RVplaDk1Sm9XSVpyWjI4?=
 =?utf-8?B?WEtuR3dtV2hMWFZoRzdZb0NhOXcxMlRPZTBQeEtQd2FxaGRhbnlFTlRQcHFM?=
 =?utf-8?B?NzR3cDRBd0ZVTE1WYWNpN2RsL004WnhCTkZLbjdwbnk0UWZIWHJvNlNsaE1r?=
 =?utf-8?B?RzJVUUpUV25hYWFLb1B2SkRmTFI5NEgyaUpKTXhldnFVUkpXSHNBS3Y1QUhB?=
 =?utf-8?B?QVBVNUM3RzZYNytyZ1prSTJVZUpUalcwd1ZGSkswSkg1djluR3gvK3NjV2Zv?=
 =?utf-8?B?S3NNaVFSelhmdmY5R3dQejVxOGFseHVGZEhDZTE1a0VvdGF0UE81enpCQWh3?=
 =?utf-8?B?OWt4SjJEeTUvQnZrRlZsOXRPb3U4T3hSejVQbjVqd0NaWjN3Yy8wZHhGbmtM?=
 =?utf-8?B?RFBMMzh4ZFFVMElkWDdsTitMVStqVUJ4Wng4RWIrMTdDMHRXYWVDYk1yeHJw?=
 =?utf-8?B?WnhEZVNESHp4NkZQWVJBUjRGWWwvZC9IcW9pV3M5VVR0TWp6c3FSMlVHeFBm?=
 =?utf-8?B?eGtHa2lFTEFvcHpyWk5BYkxaZTFSY0lVdDgzQlAxZWRxRWhLelBIZWdndmpW?=
 =?utf-8?B?c2hidWphZWJJemJKOE95aXhhcFZJMHk3ZHB2UWRxaVdFcUV2ZElkRFBhLy9K?=
 =?utf-8?B?d2tGOXJ3QjBZV3I5SXhrU0hWUDFyVGo5a2VOeG9ScmRyWXVWOHlDNlc4Q1ZG?=
 =?utf-8?B?WUpwakRlb2lXNVhDVDdwVndrSlovZnBmTHA5aXJmZTJONGd1TVZrdkQ0REh5?=
 =?utf-8?B?R3BOSUdCTU4wSlROUGV3dW9TM1F0YVhsNVBKeEtPVTUzbTZUSzVFbHFWS3NQ?=
 =?utf-8?B?ZGhPZDM1a014NXBxZ2R5dlpQdVo4QlNsbW1QWEorUytnZER2Um1SaWc2bEEw?=
 =?utf-8?B?NHJaMTRUQmg5dzhmUWYzSWRFVGhVZlVhc1pSeXpyNFU1b3pYSWRGdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eEl/1xctB7m8d6AqkZKq2KfBfi4VEyPKo/xFCD28tix/EXnWBa+lf8Y557IGbQawNyey/V+ndW9dpLFlOSbf1EcZ0Qi/KG7x3EVKjfxfNRke2/4lI504XkT5Q+X9sga/4Ki01I9MsYPpxxRUK5nvJQXaXp9bYqaOahdaimVVkJVhwAXUF2v7gFyYZy3zy5FRw4Vs0NLiE/H2tTHY3v5EPVbBHoqKP0XvS0sGfHT5zEdnEYMBM7NWmwNHD/4gx5OubGuEvknN+nb18la20vX314fsgok2M4PZX54wH7gL63hAcFGnzK03n/mF0AuSKwI2M8m6yOf9zDVRWwObEypWOg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5573a2-05cd-497f-95e7-08de99baffe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 00:15:56.9004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 13+3xP/gT73ontu3PevHs0soFKDPJH/hEcGykzV7Xu06AAoml5LH5oWh3FnaPMCv1uJTi1inRgnydVZHgbTqkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6877
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

T24gU3VuLCBBcHIgMTIsIDIwMjYgOTo0MCBQTSBSaWFuYSBUYXVybyB3cm90ZToNCj4gT24gNC8x
MS8yMDI2IDEwOjE2IEFNLCBOZ3V5ZW4sIEJyaWFuMyB3cm90ZToNCj4gPiBPbiBUdWVzZGF5LCBB
cHJpbCA3LCAyMDI2IDM6NTkgUE0sIFNodWljaGVuZyBMaW4gd3JvdGU6DQo+ID4+IEZpeCB0d28g
aXNzdWVzIGluIHJlZ2lzdGVyX25vZGVzKCk6DQo+ID4+DQo+ID4+IDEuIFdoZW4gdGhlIGxvb3Ag
ZmFpbHMgbWlkLXdheSwgcHJldmlvdXNseSByZWdpc3RlcmVkIG5vZGVzIGFyZSBub3QNCj4gPj4g
ICAgIGNsZWFuZWQgdXAuIEFkZCBnb3RvLWJhc2VkIGVycm9yIHVud2luZGluZyB0aGF0IHdhbGtz
IGJhY2t3YXJkcw0KPiA+PiAgICAgdGhyb3VnaCBjb21wbGV0ZWQgaXRlcmF0aW9ucy4NCj4gDQo+
IFRoaXMgd2FzIGludGVudGlvbmFsLsKgIElmIHRoZSBwcmV2aW91cyBub2RlcyB3ZXJlIHJlZ2lz
dGVyZWQgc3VjY2Vzc2Z1bGx5LCB3aHkNCj4gZnJlZSB0aG9zZT8NCj4gQWxzbyB0aGUgZXJyb3Jz
IGFyZSBvbmx5IGZyb20gbGFjayBvZiBtZW1vcnkgd2hlcmUgdGhlIGVudGlyZSBncHUgbWlnaHQg
bm90DQo+IGJlIGFjY2Vzc2libGUNCg0KSWYgaXQgaXMgaW50ZW50aW9uYWwsIHRoZW4gSSBhbSBP
SyB3aXRoIGl0Lg0KDQo+IA0KPiA+Pg0KPiA+PiAyLiBXaGVuIGFsbG9jYXRlX2FuZF9jb3B5X2Nv
dW50ZXJzKCkgZmFpbHMsIGFzc2lnbl9ub2RlX3BhcmFtcygpDQo+ID4+ICAgICBsZWF2ZXMgcmFz
LT5pbmZvW3NldmVyaXR5XSBhcyBhbiBFUlJfUFRSIGFuZCByZXR1cm5zLiBUaGUgY2FsbGVyDQo+
ID4+ICAgICB0aGVuIHBhc3NlcyB0aGF0IEVSUl9QVFIgdG8ga2ZyZWUoKSB2aWEgY2xlYW51cF9u
b2RlX3BhcmFtKCksDQo+ID4+ICAgICBjYXVzaW5nIGFuIGludmFsaWQgZnJlZS4gRml4IGJ5IG1h
a2luZyBhc3NpZ25fbm9kZV9wYXJhbXMoKQ0KPiA+PiAgICAgc2VsZi1jb250YWluZWQgb24gZXJy
b3I6IE5VTEwgb3V0IHRoZSBzdGFsZSBFUlJfUFRSIGFuZCBmcmVlDQo+ID4+ICAgICBkZXZpY2Vf
bmFtZSBiZWZvcmUgcmV0dXJuaW5nLg0KPiANCj4gYWxsb2NhdGVfYW5kX2NvcHlfY291bnRlcnMg
cmV0dXJucyBhbiBlcnJvciBvbmx5IHdoZW4gaXQgZmFpbHMgYWxsb2NhdGlvbiBhbmQNCj4gd2hl
biBpdCBpcyBOVUxMLiBUaGUga2ZyZWUgaW4gbW0vc2x1Yi5jIGNoZWNrcyBhbmQgcmV0dXJucyB3
aGVuIGl0IGlzIE5VTEwuIEkNCj4gZG9uJ3Qgc2VlIGFuIGlzc3VlIGhlcmUuIFBsZWFzZSBwcm92
aWRlIGJldHRlciByZWFzb25pbmcgaWYgeW91IHRoaW5rIHRoZXNlIGFyZQ0KPiBzdGlsbCBpc3N1
ZXMuIFRoYW5rcyBSaWFuYQ0KDQpGb3IgZXJyb3IgY2FzZSwgDQpyYXMtPmluZm9bc2V2ZXJpdHld
ID0gRVJSX1BUUigtRU5PTUVNKTsNCmFuZCBpdCB3aWxsIGJlIGZyZWVkIGJ5OiBrZnJlZShyYXMt
PmluZm9bc2V2ZXJpdHldKTsNCnNvIGl0IHdvdWxkIGJlIGtmcmVlKEVSUl9QVFIoLUVOT01FTSkp
LCB3aGljaCBpcyBub3QgcmlnaHQuDQpUaGFua3MuDQoNClNodWljaGVuZw0KDQo+IA0KPiA+Pg0K
PiA+PiBGaXhlczogYjQwZGIxMmI1NDJmICgiZHJtL3hlL3hlX2RybV9yYXM6IEFkZCBzdXBwb3J0
IGZvciBYRSBEUk0NCj4gUkFTIikNCj4gPj4gQ2M6IFJpYW5hIFRhdXJvIDxyaWFuYS50YXVyb0Bp
bnRlbC5jb20+DQo+ID4+IEFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNC42DQo+ID4+
IFNpZ25lZC1vZmYtYnk6IFNodWljaGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0K
PiA+IFJldmlld2VkLWJ5OiBCcmlhbiBOZ3V5ZW4gPGJyaWFuMy5uZ3V5ZW5AaW50ZWwuY29tPg0K
PiA+DQo+ID4+IC0tLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kcm1fcmFzLmMgfCAz
MSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tDQo+IC0tLQ0KPiA+PiAgIDEgZmlsZSBjaGFu
Z2VkLCAyMiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RybV9yYXMuYw0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kcm1fcmFzLmMNCj4gPj4gaW5kZXggZTA3ZGMyM2ExNTVlLi44MDJlNGJjYjczMWMg
MTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kcm1fcmFzLmMNCj4gPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RybV9yYXMuYw0KPiA+PiBAQCAtNzMsNiArNzMs
NyBAQCBzdGF0aWMgaW50IGFzc2lnbl9ub2RlX3BhcmFtcyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwN
Cj4gc3RydWN0IGRybV9yYXNfbm9kZSAqbm9kZSwNCj4gPj4gICAJc3RydWN0IHBjaV9kZXYgKnBk
ZXYgPSB0b19wY2lfZGV2KHhlLT5kcm0uZGV2KTsNCj4gPj4gICAJc3RydWN0IHhlX2RybV9yYXMg
KnJhcyA9ICZ4ZS0+cmFzOw0KPiA+PiAgIAljb25zdCBjaGFyICpkZXZpY2VfbmFtZTsNCj4gPj4g
KwlpbnQgcmV0Ow0KPiA+Pg0KPiA+PiAgIAlkZXZpY2VfbmFtZSA9IGthc3ByaW50ZihHRlBfS0VS
TkVMLCAiJTA0eDolMDJ4OiUwMnguJWQiLA0KPiA+PiAgIAkJCQlwY2lfZG9tYWluX25yKHBkZXYt
PmJ1cyksIHBkZXYtPmJ1cy0NCj4gPm51bWJlciwNCj4gPj4gQEAgLTg5LDggKzkwLDExIEBAIHN0
YXRpYyBpbnQgYXNzaWduX25vZGVfcGFyYW1zKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiBzdHJ1
Y3QgZHJtX3Jhc19ub2RlICpub2RlLA0KPiA+PiAgIAlub2RlLT5wcml2ID0geGU7DQo+ID4+DQo+
ID4+ICAgCXJhcy0+aW5mb1tzZXZlcml0eV0gPSBhbGxvY2F0ZV9hbmRfY29weV9jb3VudGVycyh4
ZSk7DQo+ID4+IC0JaWYgKElTX0VSUihyYXMtPmluZm9bc2V2ZXJpdHldKSkNCj4gPj4gLQkJcmV0
dXJuIFBUUl9FUlIocmFzLT5pbmZvW3NldmVyaXR5XSk7DQo+ID4+ICsJaWYgKElTX0VSUihyYXMt
PmluZm9bc2V2ZXJpdHldKSkgew0KPiA+PiArCQlyZXQgPSBQVFJfRVJSKHJhcy0+aW5mb1tzZXZl
cml0eV0pOw0KPiA+PiArCQlyYXMtPmluZm9bc2V2ZXJpdHldID0gTlVMTDsNCj4gPj4gKwkJZ290
byBlcnJfZnJlZV9uYW1lOw0KPiA+PiArCX0NCj4gPj4NCj4gPj4gICAJaWYgKHNldmVyaXR5ID09
IERSTV9YRV9SQVNfRVJSX1NFVl9DT1JSRUNUQUJMRSkNCj4gPj4gICAJCW5vZGUtPnF1ZXJ5X2Vy
cm9yX2NvdW50ZXIgPQ0KPiBxdWVyeV9jb3JyZWN0YWJsZV9lcnJvcl9jb3VudGVyOw0KPiA+PiBA
QCAtOTgsNiArMTAyLDExIEBAIHN0YXRpYyBpbnQgYXNzaWduX25vZGVfcGFyYW1zKHN0cnVjdCB4
ZV9kZXZpY2UNCj4gKnhlLCBzdHJ1Y3QgZHJtX3Jhc19ub2RlICpub2RlLA0KPiA+PiAgIAkJbm9k
ZS0+cXVlcnlfZXJyb3JfY291bnRlciA9DQo+IHF1ZXJ5X3VuY29ycmVjdGFibGVfZXJyb3JfY291
bnRlcjsNCj4gPj4NCj4gPj4gICAJcmV0dXJuIDA7DQo+ID4+ICsNCj4gPj4gK2Vycl9mcmVlX25h
bWU6DQo+ID4+ICsJa2ZyZWUoZGV2aWNlX25hbWUpOw0KPiA+PiArCW5vZGUtPmRldmljZV9uYW1l
ID0gTlVMTDsNCj4gPj4gKwlyZXR1cm4gcmV0Ow0KPiA+PiAgIH0NCj4gPj4NCj4gPj4gICBzdGF0
aWMgdm9pZCBjbGVhbnVwX25vZGVfcGFyYW0oc3RydWN0IHhlX2RybV9yYXMgKnJhcywgY29uc3Qg
ZW51bQ0KPiBkcm1feGVfcmFzX2Vycm9yX3NldmVyaXR5IHNldmVyaXR5KQ0KPiA+PiBAQCAtMTE0
LDI2ICsxMjMsMzAgQEAgc3RhdGljIHZvaWQgY2xlYW51cF9ub2RlX3BhcmFtKHN0cnVjdA0KPiB4
ZV9kcm1fcmFzICpyYXMsIGNvbnN0IGVudW0gZHJtX3hlX3Jhc19lcnINCj4gPj4gICBzdGF0aWMg
aW50IHJlZ2lzdGVyX25vZGVzKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+PiAgIHsNCj4gPj4g
ICAJc3RydWN0IHhlX2RybV9yYXMgKnJhcyA9ICZ4ZS0+cmFzOw0KPiA+PiAtCWludCBpOw0KPiA+
PiArCWludCBpLCByZXQ7DQo+ID4+DQo+ID4+ICAgCWZvcl9lYWNoX2Vycm9yX3NldmVyaXR5KGkp
IHsNCj4gPj4gICAJCXN0cnVjdCBkcm1fcmFzX25vZGUgKm5vZGUgPSAmcmFzLT5ub2RlW2ldOw0K
PiA+PiAtCQlpbnQgcmV0Ow0KPiA+Pg0KPiA+PiAgIAkJcmV0ID0gYXNzaWduX25vZGVfcGFyYW1z
KHhlLCBub2RlLCBpKTsNCj4gPj4gLQkJaWYgKHJldCkgew0KPiA+PiAtCQkJY2xlYW51cF9ub2Rl
X3BhcmFtKHJhcywgaSk7DQo+ID4+IC0JCQlyZXR1cm4gcmV0Ow0KPiA+PiAtCQl9DQo+ID4+ICsJ
CWlmIChyZXQpDQo+ID4+ICsJCQlnb3RvIGVycl91bndpbmQ7DQo+ID4+DQo+ID4+ICAgCQlyZXQg
PSBkcm1fcmFzX25vZGVfcmVnaXN0ZXIobm9kZSk7DQo+ID4+ICAgCQlpZiAocmV0KSB7DQo+ID4+
ICAgCQkJY2xlYW51cF9ub2RlX3BhcmFtKHJhcywgaSk7DQo+ID4+IC0JCQlyZXR1cm4gcmV0Ow0K
PiA+PiArCQkJZ290byBlcnJfdW53aW5kOw0KPiA+PiAgIAkJfQ0KPiA+PiAgIAl9DQo+ID4+DQo+
ID4+ICAgCXJldHVybiAwOw0KPiA+PiArDQo+ID4+ICtlcnJfdW53aW5kOg0KPiA+PiArCXdoaWxl
IChpLS0pIHsNCj4gPj4gKwkJZHJtX3Jhc19ub2RlX3VucmVnaXN0ZXIoJnJhcy0+bm9kZVtpXSk7
DQo+ID4+ICsJCWNsZWFudXBfbm9kZV9wYXJhbShyYXMsIGkpOw0KPiA+PiArCX0NCj4gPj4gKwly
ZXR1cm4gcmV0Ow0KPiA+PiAgIH0NCj4gPj4NCj4gPj4gICBzdGF0aWMgdm9pZCB4ZV9kcm1fcmFz
X3VucmVnaXN0ZXJfbm9kZXMoc3RydWN0IGRybV9kZXZpY2UgKmRldmljZSwgdm9pZA0KPiAqYXJn
KQ0KPiA+PiAtLQ0KPiA+PiAyLjQzLjANCg==
