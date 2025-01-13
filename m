Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017A4E7719E
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jan 2025 07:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEAC310E286;
	Mon, 13 Jan 2025 07:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xe946meY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D9910E286
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jan 2025 07:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736754710; x=1768290710;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7sLxZADP8v2yNVR1NDG0qQ8WL6YkiOizWxj18VnpegA=;
 b=Xe946meY/NG58IEJ2i4wNNvs9VUiahXnEsYlTopgnWUENKs3XNzpFNsL
 RRfUKZw5c2UylWWU2pAtuY46sxmbAFotmgtca6eQ/w2Vpqpv/6WK+F3b8
 HzOuItpi716koAckpGrogqaEEKpJq50HY3JiNkHS1gVtOXNpJd3pqLDlr
 i1Oy81W5nBNB9NrHd9AClyjDv4n2fO7Mz2aebHmqpst2Hp/ekrHLj14c0
 FOt7IVZoWrkCkb9SYpB/8hsmtsU9CW+b7rDqo7ah0nB/njby30t+Njy2c
 LuBJMz/H97N2fs4N6Pvm6CjNWzJEDR2N9U3Bv76yywZSPhKJEEwU1XIyN A==;
X-CSE-ConnectionGUID: U8COFXzGTxKnoMCDhngh6A==
X-CSE-MsgGUID: wFZt/PUSR+milYeaqUgSfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="47663082"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="47663082"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2025 23:51:48 -0800
X-CSE-ConnectionGUID: J4SMR3ghSSeF7NYDcLMJHQ==
X-CSE-MsgGUID: T0lD4kgqTNy2eu6kyc69kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="109426167"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2025 23:51:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 12 Jan 2025 23:51:46 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 12 Jan 2025 23:51:46 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 12 Jan 2025 23:51:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OsZjIOqb7nS271JUYr+CjT1LQeUhyIaTG7cY6d6ySBCwIGuyuG8iKdSVoQdx1MjGZIfv696a6UgVoJi0D/Dv4FhDGB/Ihn5BhxLjwyfDiUUzR0jSSR2QWtyd6TOQX26L1lKTwud6p7oEc20shCY68HXhCe4yT96B2H4X4tZF6lGsJ9MCMYsNjeCfDYWaVm/6Z/ItwwoM+G0hvKdKJ1mn16bSrw/9KrzLZIs9C6AV9HzdSwCdj6OOjxDeXdbEL7Lyd0zWrLmfCk+0Iu1wExjWDUGhsTAanerabecMhBeDBIT1q+xgxZKPTlY4VoGtT6BdLGXs6mRu/ULN4NlicHT+sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sLxZADP8v2yNVR1NDG0qQ8WL6YkiOizWxj18VnpegA=;
 b=lXWNw2SQqWK8/b/xuNAtx/rMs0wdfXpMdZ76ljOwzOpZIrrMw7694PvvTD5hY/1w9NkaMaZ+a7q1StgITsRNiNgIsWYsxP4bL8K+1NOp79lTBLDly7NohkKDeq33GFjKHPw7hkxKPNZHAkaljnHTMcUObUbFTwTbV27wPkw1v2b79NpUsatpL8qch2ZQ8IN80bexQNxUeuYOtz6X4VRtmg9k3GAEcUvJFvZs+D5tyKtZhl9p4JfhBNmibxiBllWxGE09ovVgKRVskzyvb6RINoH4csU9qEciK3GQLLNdBFt4u1+hvgliY0WI8D7pxpXct1QeatqCqQEEIOqykXAGdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.18; Mon, 13 Jan 2025 07:51:44 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 07:51:43 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: Emil J Tywoniak <emil+intel-xe@tywoniak.eu>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: oops in xe_bo_evict on 6.12.8
Thread-Topic: oops in xe_bo_evict on 6.12.8
Thread-Index: AQHbZU5LtcyXxBaZ8EmR1YM2V4KZAbMUVPFA
Date: Mon, 13 Jan 2025 07:51:43 +0000
Message-ID: <DM8PR11MB565525F99E5497E8874000C3E01F2@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <d157a5f178983448eec570bd5913205142f3f0c6@tywoniak.eu>
In-Reply-To: <d157a5f178983448eec570bd5913205142f3f0c6@tywoniak.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|MW3PR11MB4523:EE_
x-ms-office365-filtering-correlation-id: c0631898-51b5-4866-6d53-08dd33a71f92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VFNFNlZtVCtnaWE2OWFQVndYSUVKQy9wemY1R0dxVjVpNHVuS0xOYk1Ic1Na?=
 =?utf-8?B?U29OaCtQaWR1YkI0UTBEWno5bjFSTFppY2wydDhuNFdLT2FzcjdRSGJhaUpM?=
 =?utf-8?B?UkFmU25OMTR3bzVLVnVHc1NDU3RRZEhXY1JVNUZRaC9NSzRPT0ltd2VBR1Fn?=
 =?utf-8?B?SzczcHNnNnNQampzZk5DQkc1TXhZVGpkY2hUSFRwK3MxTHdtb1kxL0t5dm1i?=
 =?utf-8?B?NGlzZUZoTW9YR1FmeDM2cVR4d293bUM1ZmdZc1d2a09oVHByZGdFU25vTEZT?=
 =?utf-8?B?NWxUbHVDOVBkWExuN1hGVzdKTE4vV0hZWG9qUyt0ME45a1lLTlFKa09qTTVJ?=
 =?utf-8?B?bE5VUW83WnU4Nm9Dem9jWjU1YU1GWVNEV3ZEZTJtT3kzQVdQZUZLY09ES3cy?=
 =?utf-8?B?L0tuSjI3T2dXdnBIcTZlZ3B2eFRTOWRuMVViRE5tM2tYWWZqK20zWWZnOXBq?=
 =?utf-8?B?ejBaVUhqMDRsc0hPTm5OZWErYm5lQTFCRE5yeThOUUNhTnEzR1l3N2pIaSsz?=
 =?utf-8?B?TzNKZEljeEUxQk5yMzBsSnQ4M1RrdGZuMUFkaHUzdm1JdWtNQ1ZlTkdEODRk?=
 =?utf-8?B?Yk1XMFl6K3ZxOWpiWnJCd09QSkpyY2FQRkFqUWVkdTVTR0xaSlo3L2txVWJk?=
 =?utf-8?B?TlAxTEtYQWF6elpWellHdlJUM1JndDRiZjBwNXFYeWFIYlFyRFNyeHlRRk1m?=
 =?utf-8?B?b3dwME5zaVdUd3czMmdINE9Xd2ppejBUNnlGRlVDczdqT3NMVDRnNzRHSndi?=
 =?utf-8?B?NTVQQXp5Um5reVA0TXptemppaUovS1ArU3FyZ0tWajhJMW5WT3VEd3Jha0V4?=
 =?utf-8?B?Um1od1kyRUJCNytMYzFOS3BDQ3ZrQnNmMW1LU3hUQWhVQ1ZVb2IrOXFmRTRN?=
 =?utf-8?B?UmdxbVd4ZU5qUHVPREJoVGRsMXhaNllhdk8rYS93anpiNG5GamlFNFBHekxD?=
 =?utf-8?B?Ym9EK2hTT3Q4UDZGYlZZYnpMZzZKaFlUeTlPRkl1Q0VLUEZNM2lJRndNVUR0?=
 =?utf-8?B?Q0xCUVFONkJPRE90WkNUcGJXaUJ2L01zWnViZjhMQmFQYkw2U0xTdHNBQUNY?=
 =?utf-8?B?OUFucXpvdXhGOTFrRjUvdzhCT25yVGwydmEzejZ3N1ZTYmpKVTRjRjFtRkU5?=
 =?utf-8?B?TVpoZThCWjZMRDA2bGM1VE1NUGpQWFlVdkxQV3VNdExqN2hrMGI2Nk5UVkNQ?=
 =?utf-8?B?UkZ2Y1AwNlNYR2Z6RWp3ajNrcEwvSUQ4VVVLeElEaW94S2txSkI0TU1LbkxW?=
 =?utf-8?B?bGFPRXgvUVQyV3pKK0FjbE5DazBZYjZ1R1VMWEc1d3VUanJ0elNCcnZVRUc1?=
 =?utf-8?B?Y3lJZlJVd2NQRUhlRG9ndmhid1RpcUlnbENvcVRhWmw0ZzhIQzhKTkxMUVYz?=
 =?utf-8?B?dHhnWmI1b21odmI2d1IvM3VUUGdWeXlDK3BDUVh6ODFmY0t2T3hReGhRbDBy?=
 =?utf-8?B?ejR1cytUbjRqNEowWkFzdzM5UEFhVThDdVZBUXZiYWZKd2NXN1FHYXdYMUVK?=
 =?utf-8?B?ZWZvOGM3UTl5Y0lqOGVEZGRxM0tCWkY3ZThSLythbUZwdGRTRm0wK1VBU1Np?=
 =?utf-8?B?akFpY1lIUkxQUmVNbldGbUYxZ0lqODhOd3h6RW5hMHFlejk5NVE4SGFwMlZD?=
 =?utf-8?B?MGdXSk80ODRZNll3MktjejNoaEVYUWJQRjBXUjNuWmdTM2g0UU9kMU5pMjFk?=
 =?utf-8?B?T24wNHNMeHBUbGVsOC9YU2FhQUJDTjN6SGR1VjBnTG95eXVMUUl1VUh1U1ZI?=
 =?utf-8?B?NmRvVFNzRlFBaWdKMHpBbVVwOElzZE91dk5XT2pCRzRTa2ZnZ3B5NFVUNGtJ?=
 =?utf-8?B?clZKd0Q0VVUrb1RCSDN4aEwweCtjYWxZSy9UNXFhM1BJcHpqVVZjRXg3VGtM?=
 =?utf-8?Q?lw5p4XXsYEG8a?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djNVa2RJd0Q5TTIrejlhTXhhSWdZZDN2TUczVXJMcTl2RGFYTTMzTnd5L3dZ?=
 =?utf-8?B?MzdPRHB4b1NkUXVYYmF4elBNM1B2UjEvZW9ZL01sRC9DVlBwWWhnZk5MZnUw?=
 =?utf-8?B?bTh0ZGFyMDhpaXp3NllLSVJrL0hra2VYNU9uMUxIdk85aC9iZXlHQmZwK216?=
 =?utf-8?B?Q0VjVTFzZ3VEKzZqdDBOZHRnb08raFlBK1VEVC9UWG1SZDQ1eE1HMEtkUDNi?=
 =?utf-8?B?UmhQTnVnMTVGT0dKeG5KWVpQZzIrWFFycGhobTFIT0w2Q0JKV290LzBIaER2?=
 =?utf-8?B?aUdKUk0yQXdmNEVyRm0vUWtFM2FSdWlwVVBZOTlkZHZ3MU1nV3pOVm5vY0ZU?=
 =?utf-8?B?aDduYS9mUExXY1U1TkJDWmRiK2F0dGJudm5MbFBPQjdjL1JIOFdMOHNaMkYx?=
 =?utf-8?B?MWdkS0xvR1FMSlRRY3VaK2RFMWhLNC9VbjRwNGcwQmFBQ3g1b3ZxcENid2pS?=
 =?utf-8?B?RHBEVmRiMXpvdmc1RWhZc2F6Qy9FK3d6THBGcTRBZUxJSHh0SjdNWEpybjIy?=
 =?utf-8?B?S3JVdHZVTVhVRzVSd3RKeDdkVDgrMFRhVmpQRGpMNkJXUDUzRGYyZFBOcVIr?=
 =?utf-8?B?TlQ0YkZaSktrQXZCK3VVdFMvbm0zdnhwRG5EQ2VnV21qRW83UGNSSXNFOFBR?=
 =?utf-8?B?dS9RRloxMVlMdXlIWWg2ZXlka25USU5LaytVcW5KUy9kKzRhWElvakpZb29U?=
 =?utf-8?B?cjFNWkJUMGVaYmVQelNjVHQ3RHdZK0ozRXU5TERzV1diVlBTcnJPZWEzOEVW?=
 =?utf-8?B?Snp4RWJxSExaZU5tWFF6RzMySlR3bDk0RktyMnk1QWZXNyt0bmZpWmZJbUQr?=
 =?utf-8?B?RHdmKzJKT3RCOW9xRFc3ejNYa1c4bW5zMEQydzVmNUp5emplZjNITzcxT1E0?=
 =?utf-8?B?Z2E2SnlOTURJM0VaR3NxR2taeFptc3VNYU5VaGwvTmwzTUUvN040dll1Sm5q?=
 =?utf-8?B?eSs1UlZFUWcrWTU2b2t0T1hibmJYblk4UUhlcGVhN3hWbTlNQUVkT1RkTWF6?=
 =?utf-8?B?dXpCWnY0R0pqYlNnQUZXTS9nZHpvOGV2VThUVEwxR0Z3eVBNVTUxM2JReG5C?=
 =?utf-8?B?OXgyVCs3T2wyVWFYRVRsdFphNEk0MDR2Q01OM3I3OE9hcENPRE02QWFJcUJM?=
 =?utf-8?B?alpTKytGVzlzWlV3OTlaTmVncVBucWJCMFNnYWx3UGs0RzlYZVRwZ1k0Q21O?=
 =?utf-8?B?c0E2VENSWW1MU21pODlsMGtuL3ZMemVwSTJMdVI2RmdwbGhjaUo0REFMa1RW?=
 =?utf-8?B?U0lhR2VEZEYwTjFxZW9XRFJTQ01JT2xEcG9FRElaZERQZXNVSGV4eDBpVUVx?=
 =?utf-8?B?N3dReENRTmdTMDBiQWRpMS9UQm45YWVLdEJKdmJ6d0k5b3oxeFVxSnJra3BX?=
 =?utf-8?B?Qlg1a0d3WVI1SUNEU0hXSVdUSGIrMUh6aHUvM2k2dzJUM3RaVWVLQmdtcTlu?=
 =?utf-8?B?N2dYSmhuNEY1RHEwbkc4TFVnVXh0RGxuSzkrTldRYnpzbnlGZnRuclpCck1z?=
 =?utf-8?B?Sm9TbUV4Q2R4OEpDWEwyRGJ3TzdRSFByRitJOGdPWkRIUzAxZ1pycE9oeHc0?=
 =?utf-8?B?TFdEL1FYT2d3S3Fia1NjS1ppQmsrQmdFUENwakhOSzNJclQ4QkhyTkxTSXJ2?=
 =?utf-8?B?aXNvV2VOTTYwdkJQVXMzNHNaSTUyeE1JY3YvUEJuV01oOTF2ZFNqREl4bWlT?=
 =?utf-8?B?M05zR21HdVRPakZhb1djMEdLZTdNcXdDSENxK1pJUlMxZnJSYmNGRGZVZ0F2?=
 =?utf-8?B?QjYrYnRpWnZ3cVBiTG1SNHQ3N2VGRGp4dUdJeXJwdDV3bzQ4SXp5Rkl5SktN?=
 =?utf-8?B?c0FPMFplUXY4aENIeFlSOU0vOS91SE5KcDRiVnNVZjBWVi9xc2xTVmF3QjFX?=
 =?utf-8?B?ZWJXcjFXV3JveVBieU5SS1hnOGxJaG5scUpzRHFjOWJubnRwaDdPRmVUeFVW?=
 =?utf-8?B?RElGcWM5bkZIUHo0WXZkbFpHWDUxOWxLdVJEc1FOUkNGcHd6VVRXYS9rck5F?=
 =?utf-8?B?cnRjc1FxSmRDNWtuNWxHNDFtTVZOQk1RL2tjOHcrb3lRS3FMdlN1clhlV3Yr?=
 =?utf-8?B?T3JwZ2orbElQYXhxMEdrdHBBK3l4Nm9oU1pqQTRpbTFLVTJPSHo5RmZUa0tQ?=
 =?utf-8?Q?W9WDrHHkEd3RFwF4xrwKH5sjM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0631898-51b5-4866-6d53-08dd33a71f92
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 07:51:43.8128 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gjk/7TgiPL2mdUhgTrnhOLHUpwlGd9wF88aTE3jqRBr5B9ZBCljR1bDsYAGYPFXz7+nIciFirv5L79/d+1dMZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4523
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

SGkuIA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC14ZSA8aW50
ZWwteGUtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBFbWlsIEoN
Cj4gVHl3b25pYWsNCj4gU2VudDogTW9uZGF5LCAxMyBKYW51YXJ5IDIwMjUgMS41Mw0KPiBUbzog
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IG9vcHMgaW4geGVfYm9f
ZXZpY3Qgb24gNi4xMi44DQo+IA0KPiBXaGF0J3MgdXAgZ2FtZXJzLA0KPiANCj4gTk9URTogdGhp
cyBpcyBteSBzZWNvbmQgYXR0ZW1wdCB0cnlpbmcgdG8gc2VuZCB0aGlzIGVtYWlsIHRvIHRoaXMg
bWFpbGluZyBsaXN0Lg0KPiBQcmV2aW91c2x5IGl0IG5ldmVyIHNob3dlZCB1cCBvbiB0aGUgYXJj
aGl2ZS4gSSBoYXZlIG5vdyBzdWJzY3JpYmVkIGFuZCBhbQ0KPiBnaXZpbmcgaXQgYSBzZWNvbmQg
YXR0ZW1wdC4NCj4gDQo+IEkgaG9wZSB0aGlzIGlzIHRoZSByaWdodCBwbGFjZSB0byByZXBvcnQg
dGhpcyBvb3BzIHdoaWNoIHBvc3NpYmx5IGlzIGR1ZSB0bw0KPiBhbWRncHUgaW50ZXJhY3Rpb24u
IFRoZSBjb21tdW5pdHkgZ3VpZGVsaW5lcyBsaW5rIGZvciB0aGlzIGxpc3QNCj4gKGh0dHBzOi8v
MDEub3JnL2xpbnV4Z3JhcGhpY3MvY29tbXVuaXR5KSBkb2Vzbid0IHdvcmsuIEZlZWwgZnJlZSB0
byByZWRpcmVjdA0KPiBtZSBpZiBub3QsIGV2ZW4gdG8gL2Rldi9udWxsLiBUaGUgVmlkZW8oRFJJ
IC0gSW50ZWwpIHNlY3Rpb24gb24ga2VybmVsIGJ1Z3ppbGxhDQo+IGRvZXNuJ3Qgc2VlbSB0byBn
ZXQgbXVjaCBsaWZlLg0KDQpDb3VsZCB5b3UgcmVwb3J0IGlzc3VlIHRvIHhlIHdpdGggaW5zdHJ1
Y3Rpb25zIGh0dHBzOi8vZHJtLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy9pbnRlbC1kb2NzL2hvdy10
by1maWxlLWk5MTUtYnVncy5odG1sDQoNCj4gSSBzZWUgdGhlcmUgaGF2ZSBiZWVuIHJlY2VudCBj
aGFuZ2VzIHRvIHRoaW5ncyBhcm91bmQgYm8gZXZpY3Rpb24gb24geGUgYW5kDQo+IHRvZGF5IEkg
Y2F1Z2h0IHRoZSBmb2xsb3dpbmcgb29wcyB3aGVuIHNwYXduaW5nIGEgc2Vjb25kIFZTIENvZGUg
d2luZG93DQo+IGluIHN3YXkgd2l0aCB0aGUgTmV3IFdpbmRvdyBjb21tYW5kIChDdHJsK1NoaWZ0
K04pLiBWUyBDb2RlIHdhcyBub3QNCj4gcnVubmluZyBvbiBYV2F5bGFuZC4gU28gZmFyIEkgaGF2
ZW4ndCBiZWVuIGFibGUgdG8gcmVwcm9kdWNlIHRoaXMuIEkgaGF2ZQ0KPiBhbWRncHUgbG9hZGVk
IGFzIGEgZmFsbCBiYWNrIGZvciBteSByeXplbiA3OTAwWCBidWlsdGluIGdyYXBoaWNzIHNpbmNl
IEkNCj4gaW5zdGFsbGVkIHRoZSBmdW5ueSBHUFUgKEludGVsIEFyYyBCNTgwIC8gQk1HIEcyMSku
IEknbSBvbiBNZXNhIDI0LjMuMy4NCg0KQnINCkphbmkNCj4gDQo+IA0KPiAtLS0tLS0tLS0tLS1b
IGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4gDQo+IHdvcmtxdWV1ZTogV1FfTUVNX1JFQ0xBSU0g
c2RtYTA6ZHJtX3NjaGVkX3J1bl9qb2Jfd29yaw0KPiBbZ3B1X3NjaGVkXSBpcyBmbHVzaGluZyAh
V1FfTUVNX1JFQ0xBSU0NCj4gZXZlbnRzOmFtZGdwdV9kZXZpY2VfZGVsYXlfZW5hYmxlX2dmeF9v
ZmYgW2FtZGdwdV0NCj4gDQo+IFdBUk5JTkc6IENQVTogNSBQSUQ6IDI5MTk5IGF0IGtlcm5lbC93
b3JrcXVldWUuYzozNzA0DQo+IGNoZWNrX2ZsdXNoX2RlcGVuZGVuY3krMHgxMGYvMHgxMzANCj4g
DQo+IE1vZHVsZXMgbGlua2VkIGluOiByZmNvbW0gc25kX3NlcV9kdW1teSBzbmRfaHJ0aW1lciBz
bmRfc2VxIGNtYWMNCj4gYWxnaWZfaGFzaCBhbGdpZl9za2NpcGhlciBhZl9hbGcgbmZ0X2NoYWlu
X25hdCB4dF9NQVNRVUVSQURFDQo+IG5mX2Nvbm50cmFja19uZXRsaW5rIHhmcm1fdXNlciB4ZnJt
X2FsZ28geHRfYWRkcnR5cGUgb3ZlcmxheSBhZl9wYWNrZXQNCj4gYm5lcCBidHVzYiBidHJ0bCBi
dGludGVsIGJ0YmNtIGJ0bXRrIGJsdWV0b290aCBtb3VzZWRldiBjZGNfYWNtIGpveWRldg0KPiBu
bHNfaXNvODg1OV8xIG5sc19jcDQzNyB2ZmF0IGZhdCBtZWlfZ3NjX3Byb3h5IG1laV9nc2MgbWVp
X21lIG1laQ0KPiB4dF9jb25udHJhY2sgaXA2dF9ycGZpbHRlciBtdDc5MjFlIGlwdF9ycGZpbHRl
ciBtdDc5MjFfY29tbW9uIG10NzkyeF9saWINCj4gc25kX2hkYV9jb2RlY19oZG1pIG10NzZfY29u
bmFjX2xpYiBlZGFjX21jZV9hbWQgZWRhY19jb3JlIG10NzYNCj4gc25kX2hkYV9pbnRlbCBhbWRf
YXRsIGludGVsX3JhcGxfbXNyIHNuZF9pbnRlbF9kc3BjZmcgeHRfcGt0dHlwZQ0KPiBpbnRlbF9y
YXBsX2NvbW1vbiBzbmRfaW50ZWxfc2R3X2FjcGkgY3JjdDEwZGlmX3BjbG11bCB4dF9MT0cgbWFj
ODAyMTENCj4gc25kX3VzYl9hdWRpbyB1dmN2aWRlbyBuZl9sb2dfc3lzbG9nIHNuZF91c2JtaWRp
X2xpYiBjcmMzMl9wY2xtdWwNCj4gc25kX2hkYV9jb2RlYyB4dF90Y3B1ZHAgcG9seXZhbF9jbG11
bG5pIHZpZGVvYnVmMl92bWFsbG9jIHhlIHNuZF91bXANCj4gcG9seXZhbF9nZW5lcmljIHV2YyBz
bmRfaGRhX2NvcmUgZ2hhc2hfY2xtdWxuaV9pbnRlbCBjZmc4MDIxMSBuZnRfY29tcGF0DQo+IHNu
ZF9yYXdtaWRpIHNoYTUxMl9zc3NlMyB2aWRlb2J1ZjJfbWVtb3BzIHNwZDUxMTggc2hhMjU2X3Nz
c2UzDQo+IHNuZF9zZXFfZGV2aWNlIHZpZGVvYnVmMl92NGwyIHNuZF9od2RlcCByODE2OSBzaGEx
X3Nzc2UzIGJhdHRlcnkNCj4gc3A1MTAwX3RjbyB2aWRlb2J1ZjJfY29tbW9uIGFlc25pX2ludGVs
IHNuZF9wY20gd2F0Y2hkb2cgcmVhbHRlaw0KPiBnZjEyOG11bA0KPiANCj4gIGNyeXB0b19zaW1k
IG1kaW9fZGV2cmVzIHZpZGVvZGV2IHNuZF90aW1lciBjcnlwdGQgbGlicGh5IHJma2lsbCBzbmQN
Cj4gaTJjX3BpaXg0IGRybV9ncHV2bSB3bWlfYm1vZiByYXBsIGxpYmFyYzQgbGVkX2NsYXNzIG1j
IG5mX3RhYmxlcyBpMmNfc21idXMNCj4gazEwdGVtcCBzb3VuZGNvcmUgc2NoX2ZxX2NvZGVsIHRw
bV9jcmIgcnRjX2Ntb3MgZXZkZXYgbWFjX2hpZCB0cG1fdGlzDQo+IGdwaW9fYW1kcHQgdGlueV9w
b3dlcl9idXR0b24gdHBtX3Rpc19jb3JlIGdwaW9fZ2VuZXJpYyBidXR0b24gdWlucHV0DQo+IGhp
ZF94cGFkbmVvKE8pIGZmX21lbWxlc3MgYXRrYmQgbGlicHMyIHNlcmlvIHZpdmFsZGlfZm1hcCBs
b29wIHh0X25hdA0KPiBuZl9uYXQgbmZfY29ubnRyYWNrIG5mX2RlZnJhZ19pcHY2IG5mX2RlZnJh
Z19pcHY0IGxpYmNyYzMyYyBicl9uZXRmaWx0ZXIgdmV0aA0KPiB0dW4gdGFwIG1hY3ZsYW4gYnJp
ZGdlIHN0cCBsbGMga3ZtX2FtZCBjY3Aga3ZtIGZ1c2UgZWZpX3BzdG9yZSBjb25maWdmcw0KPiBu
Zm5ldGxpbmsgZWZpdmFyZnMgdHBtIGxpYmFlc2NmYiBlY2RoX2dlbmVyaWMgZWNjIHJuZ19jb3Jl
IGRtaV9zeXNmcyBpcF90YWJsZXMNCj4geF90YWJsZXMgYXV0b2ZzNCBleHQ0IGNyYzMyY19nZW5l
cmljIG1iY2FjaGUgamJkMiBoaWRfZ2VuZXJpYyB1c2JoaWQgaGlkDQo+IGFoY2kgbGliYWhjaSB4
aGNpX3BjaSBsaWJhdGEgbnZtZSB4aGNpX2hjZCBzY3NpX21vZCBudm1lX2NvcmUgY3JjMzJjX2lu
dGVsDQo+IHNjc2lfY29tbW9uIG52bWVfYXV0aCBkbV9tb2QgZGF4IGFtZGdwdSB2aWRlbyB3bWkg
YW1keGNwDQo+IGkyY19hbGdvX2JpdCBkcm1fdHRtX2hlbHBlciB0dG0gZHJtX2V4ZWMgZ3B1X3Nj
aGVkIGRybV9zdWJhbGxvY19oZWxwZXINCj4gZHJtX2J1ZGR5IGRybV9kaXNwbGF5X2hlbHBlciBj
ZWMgY3JjMTYNCj4gDQo+IENQVTogNSBVSUQ6IDAgUElEOiAyOTE5OSBDb21tOiBrd29ya2VyL3U5
NjowIFRhaW50ZWQ6IEcgVyBPIDYuMTIuOCAjMS0NCj4gTml4T1MNCj4gDQo+IFRhaW50ZWQ6IFtX
XT1XQVJOLCBbT109T09UX01PRFVMRQ0KPiANCj4gSGFyZHdhcmUgbmFtZTogTWljcm8tU3RhciBJ
bnRlcm5hdGlvbmFsIENvLiwgTHRkLiBNUy03RDc1L01BRyBCNjUwDQo+IFRPTUFIQVdLIFdJRkkg
KE1TLTdENzUpLCBCSU9TIDEuNjAgMDUvMzAvMjAyMw0KPiANCj4gV29ya3F1ZXVlOiBzZG1hMCBk
cm1fc2NoZWRfcnVuX2pvYl93b3JrIFtncHVfc2NoZWRdDQo+IA0KPiBSSVA6IDAwMTA6Y2hlY2tf
Zmx1c2hfZGVwZW5kZW5jeSsweDEwZi8weDEzMA0KPiANCj4gQ29kZTogYzAgZjMgMDEgMDEgOTAg
NDkgOGIgNDUgMTggNDggOGQgYjIgYzAgMDAgMDAgMDAgNDggOGQgOGIgYzAgMDAgMDAgMDANCj4g
NDkgODkgZTggNDggYzcgYzcgYTAgYzcgZGYgYjQgNDggODkgYzIgZTggODIgN2UgZmQgZmYgOTAg
PDBmPiAwYiA5MCA5MCBlOSAwYSBmZg0KPiBmZiBmZiA4MCAzZCA5OSBjMCBmMyAwMSAwMCA3NSA4
ZiBlOSA0MiBmZiBmZg0KPiANCj4gUlNQOiAwMDE4OmZmZmY5NWRkOWVmOTdjNjAgRUZMQUdTOiAw
MDAxMDA0Ng0KPiANCj4gUkFYOiAwMDAwMDAwMDAwMDAwMDAwIFJCWDogZmZmZjkyNjVjMDFiOGUw
MCBSQ1g6IDAwMDAwMDAwMDAwMDAwMDANCj4gDQo+IFJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6
IDAwMDAwMDAwMDAwMDAwMDAgUkRJOg0KPiAwMDAwMDAwMDAwMDAwMDAwDQo+IA0KPiBSQlA6IGZm
ZmZmZmZmYzA0MzhjMDAgUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOTogMDAwMDAwMDAwMDAwMDAw
MA0KPiANCj4gUjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDAwMCBSMTI6
IGZmZmY5MjY4MWExM2IyMDANCj4gDQo+IFIxMzogZmZmZjkyNjVjOTQzMzhjMCBSMTQ6IDAwMDAw
MDAwMDAwMDAwMDEgUjE1OiBmZmZmOTI2NWMwMWJjZTAwDQo+IA0KPiBGUzogMDAwMDAwMDAwMDAw
MDAwMCgwMDAwKSBHUzpmZmZmOTI2Y2I3ZTgwMDAwKDAwMDApDQo+IGtubEdTOjAwMDAwMDAwMDAw
MDAwMDANCj4gDQo+IENTOiAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1
MDAzMw0KPiANCj4gQ1IyOiAwMDAwMDAwMDAwNTBkNmQwIENSMzogMDAwMDAwMDJhMzhkNjAwMCBD
UjQ6DQo+IDAwMDAwMDAwMDBmNTBlZjANCj4gDQo+IFBLUlU6IDU1NTU1NTU0DQo+IA0KPiBDYWxs
IFRyYWNlOg0KPiANCj4gIDxUQVNLPg0KPiANCj4gID8gY2hlY2tfZmx1c2hfZGVwZW5kZW5jeSsw
eDEwZi8weDEzMA0KPiANCj4gID8gX193YXJuLmNvbGQrMHg5My8weGY2DQo+IA0KPiAgPyBjaGVj
a19mbHVzaF9kZXBlbmRlbmN5KzB4MTBmLzB4MTMwDQo+IA0KPiAgPyByZXBvcnRfYnVnKzB4MTBk
LzB4MTUwDQo+IA0KPiAgPyBzcnNvX2FsaWFzX3JldHVybl90aHVuaysweDUvMHhmYmVmNQ0KPiAN
Cj4gID8gaGFuZGxlX2J1ZysweDYxLzB4YjANCj4gDQo+ICA/IGV4Y19pbnZhbGlkX29wKzB4MTcv
MHg4MA0KPiANCj4gID8gYXNtX2V4Y19pbnZhbGlkX29wKzB4MWEvMHgyMA0KPiANCj4gID8gX19w
ZnhfYW1kZ3B1X2RldmljZV9kZWxheV9lbmFibGVfZ2Z4X29mZisweDEwLzB4MTAgW2FtZGdwdV0N
Cj4gDQo+ICA/IGNoZWNrX2ZsdXNoX2RlcGVuZGVuY3krMHgxMGYvMHgxMzANCj4gDQo+ICBfX2Zs
dXNoX3dvcmsrMHgxMGMvMHgzMjANCj4gDQo+ICBjYW5jZWxfZGVsYXllZF93b3JrX3N5bmMrMHg2
Mi8weDgwDQo+IA0KPiAgYW1kZ3B1X2dmeF9vZmZfY3RybCsweGI3LzB4MTUwIFthbWRncHVdDQo+
IA0KPiAgYW1kZ3B1X3JpbmdfYWxsb2MrMHg0MC8weDcwIFthbWRncHVdDQo+IA0KPiAgYW1kZ3B1
X2liX3NjaGVkdWxlKzB4ZjAvMHg3NTAgW2FtZGdwdV0NCj4gDQo+ICBhbWRncHVfam9iX3J1bisw
eDhlLzB4MjAwIFthbWRncHVdDQo+IA0KPiAgZHJtX3NjaGVkX3J1bl9qb2Jfd29yaysweDI4My8w
eDQyMCBbZ3B1X3NjaGVkXQ0KPiANCj4gIHByb2Nlc3Nfb25lX3dvcmsrMHgxOGEvMHgzNTANCj4g
DQo+ICB3b3JrZXJfdGhyZWFkKzB4MjM1LzB4MzcwDQo+IA0KPiAgPyBfX3BmeF93b3JrZXJfdGhy
ZWFkKzB4MTAvMHgxMA0KPiANCj4gID8gX19wZnhfd29ya2VyX3RocmVhZCsweDEwLzB4MTANCj4g
DQo+ICBrdGhyZWFkKzB4Y2QvMHgxMDANCj4gDQo+ICA/IF9fcGZ4X2t0aHJlYWQrMHgxMC8weDEw
DQo+IA0KPiAgcmV0X2Zyb21fZm9yaysweDMxLzB4NTANCj4gDQo+ICA/IF9fcGZ4X2t0aHJlYWQr
MHgxMC8weDEwDQo+IA0KPiAgcmV0X2Zyb21fZm9ya19hc20rMHgxYS8weDMwDQo+IA0KPiAgPC9U
QVNLPg0KPiANCj4gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQo+IA0KPiAN
Cj4gSSBob3BlIHRoaXMgdGVsbHMgeW91IHNvbWV0aGluZy4gSSdtIHdpbGxpbmcgdG8gc3dpdGNo
IHRvIHNvbWUgY3V0dGluZyBlZGdlDQo+IGtlcm5lbCBjb21taXQgYW5kIHJlcG9ydCBiYWNrIGlm
IEkgZ2V0IGFuIG9vcHMgYWdhaW4sIHNvIGZlZWwgZnJlZSB3aGljaCByZW1vdGUNCj4gYW5kIGNv
bW1pdCBJIHNob3VsZCBnbyBnZXQsIG9yIGFueSBvdGhlciB0cm91Ymxlc2hvb3Rpbmcgc3RlcHMg
SSBjb3VsZCBmb2xsb3cuDQo+IA0KPiANCj4gVGhhbmtzIGZvciBhbGwgeW91ciBoYXJkIHdvcmss
DQo+IA0KPiANCj4gRW1pbCBKLiBUeXdvbmlhayAod2lkbGFyaXplcikNCg==
