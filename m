Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D53ECA101A
	for <intel-xe@archiver.kernel.org>; Sat, 31 Aug 2024 01:18:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3421D10E002;
	Sat, 31 Aug 2024 01:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EYbn7xHN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1F710E002
 for <Intel-Xe@lists.freedesktop.org>; Sat, 31 Aug 2024 01:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725067135; x=1756603135;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NotOjyFU9Y4Xiw073XxisidcI8IWQpJ33NuSkiKkhGU=;
 b=EYbn7xHNnJ+H1fBQBUOWg9rlHaipeD9zALHE82EdjPP7mRZXZXm30Cor
 OMRvOLhUMjhc0lrxGGdO7rLjxpL28oiZNRs+qRwTzi7Vyh6av7aU8sevH
 i3QLmQLPNfQro7jKVP2aBbbk+N7UJ9DM2SZit+8b9+i670V+Q4T3e4/8B
 Xl75BHnu79xhMQwo6S6AZlvbtKqr3SwNWDVjSFOquQDSFu13gdNrT68Q7
 t7ho0EelnPqfBaYiJXLz/aEOTzG439RfHnkitvQir4CE0mkt4I5r46lrs
 A83dGwAiLcZexHOvz1ZuHdeQJ5iBDgN+yR7Ai+juSrxPQWrfpyEBFF1Ya w==;
X-CSE-ConnectionGUID: DIv26SdrSI6B2UhxW3Cr1A==
X-CSE-MsgGUID: D4wwBATkQBS8KaJFCwY9pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="27601497"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="27601497"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 18:18:54 -0700
X-CSE-ConnectionGUID: wgkJ5snrSDaEotlaRfQeww==
X-CSE-MsgGUID: dYv3oI3USRmhzgxFTdl2Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="68721710"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 18:18:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 18:18:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 18:18:53 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 18:18:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yu8yyY1CedQkuT5bvbIJMHl2kEAhRhW1i00AdsZHjVtVJ7thWV2dsbuUd2CZM8eDL+O4tRa8KQAfY0cDkly2esjqSKEwSJzIp3/oZmTkdq94Nn4n69gTw9xxc8iemOA8vFjuOfKDSgZwJotI2aIT6EB6Qns2ky/IupBRu+GDlG3Wz4J2TUkNwvml5w61L1WlmsGA+Nj4rk5T0emyhhZ20z8gryCBO+SWFzKF/a1E6KfZNb+s/BgO02SJR4dopgT848oyA1PE9uwJJBZk5lqCciwNDlcN/iJeUtfzI24AV1pCAfiU/IWcG2zfk1S70NO2qNmR1Hys47H6lC06Zo6VXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMNjiAt23t0Ts1g7o3gkKX+HiqNXEkkrtNYCNowscEY=;
 b=xFErFH/Qf9J/sfGWMDXmr4dxx8zByoB3Be7o6fNWAdVibASVdsoeHbix2vOqMJiDbd1fxs3e710HFhHR7DYzQeTIKfxfWd1UtBF3qeeKQnlTWN1S6uGkqW0JUi5Xhq1mBsdy7XugIALP2jMCTU7jadeoy3I5FAkOFDQ23VSgTbiogrNN7gc2UydCkTrtQIMVRMquvUUkr6D91X8lPfnyo9x9IAuWS06gOAsH9nIXAOJkqPRlnMH5ocm9JEa0XC+kTYu+08yxFljzZEdxFxGphD+ohEna6A+Wz2llQZzo2Ygxjjdu6C9HNDgFggTwcSaVbcSBqWqWVLQ27WA3hCK/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB6526.namprd11.prod.outlook.com (2603:10b6:8:8d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Sat, 31 Aug
 2024 01:18:51 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.7897.027; Sat, 31 Aug 2024
 01:18:51 +0000
Message-ID: <d7889552-183c-4119-9968-3094f5f79315@intel.com>
Date: Fri, 30 Aug 2024 18:18:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] drm/xe: Add ASCII85 dump helper function
From: John Harrison <john.c.harrison@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
 <20240830062310.3450387-3-John.C.Harrison@Intel.com>
 <ZtJAC9l/gaCnBPdA@DUT025-TGLU.fm.intel.com>
 <9c45f3d1-8d65-4d15-807e-5bb085f3c109@intel.com>
Content-Language: en-GB
In-Reply-To: <9c45f3d1-8d65-4d15-807e-5bb085f3c109@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::13) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 186c5273-e509-4f45-77ab-08dcc95adf75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WS9KelRxUVJtZWFxelk1TUljVitsSGovUXltUURjVjAweG0vMnkyaTBzb3RV?=
 =?utf-8?B?SWFRM0Y4enVucjdrWnlzb0JGcE1HZmN4OFlUVlJSTDlrYkpFZ1VpZjRZRGlC?=
 =?utf-8?B?M2l2NUJnbkZvVlIwMWUrZ21DR1V3M0RKYVE4Um1BZnh1clpUd3BmSDhVNEh3?=
 =?utf-8?B?TTNzSnJRalkvSE1SOS9kYkZOQlljMDFSaWJBdEl2WGtHOWRQcHFxa3hwdzU3?=
 =?utf-8?B?MGJDSCtEeThMYnJFTHBOOUsyYjJFUDAxZ0pCOU9JMEFHcmNXcGRPY2J4TzdL?=
 =?utf-8?B?T1hZbExZZVNuTTBrUno0cXAvaTE2Vkp0R0YzSEtTeTJVTUlPZkVtWms0YlNO?=
 =?utf-8?B?eXlybGNjN0JQakRLWlNWQnUwYmlTWmx2Z0Yza0lCeEQ0MXZpRHB3WHVJMGdW?=
 =?utf-8?B?dkJYQjRaRk5GbHZHNkdzMEQvSEZkLy8wL1paVzlQYW9oWGVUMGFmZ3ZrTGtB?=
 =?utf-8?B?RVY3Wm54VVVqZFgzaW1MVVZ5L0tPc1FkbTJ2N3NuU3BEY1o0d1M2Ukd2aFh0?=
 =?utf-8?B?cVVZYjRBaGtsNHl4S0FVVEZaNXMyUm1KK0lJa0RxOVo4L3VOOGwvRTJ2Ykpu?=
 =?utf-8?B?b0NiTUIzdnVHVEdCeE95RXVVcER5bG5ZeDhUYkNZbXg3QXE4MEpSREJtb1JP?=
 =?utf-8?B?YVJZN2FVRWloemZjV3h6MkRZL1VVbVY5MGpoOGY3YUhtaDUyTGR2S2VoWWc5?=
 =?utf-8?B?M3YwUDNMVmlROGh3SUZNZnlzelJ0OFR3VWszU29YWllYdC9uc0VuK21DUFFt?=
 =?utf-8?B?MHFBK0trYmxTdSs2cjAwbDJpeUVhUkdHeXhKN0thL2hMOTJqeWtLVDlyd0Ju?=
 =?utf-8?B?T3FVcGdBTWVBcnh5eXNCZVViTlllTlRLajBPZmhkSzkvUUFjKy9NSHkvRjJt?=
 =?utf-8?B?alYyQkFMWVNBMHQ5R0xWR1NzN3dxaURObnZLZGYvQThWd0FoMElZMytyUEw5?=
 =?utf-8?B?dkRQZ3FOaGdibG1WL2VidkxaakFhUUNiK0c4SDk4ZzNNUkhuQzYwRW0rSVY0?=
 =?utf-8?B?TzU0VnlwTUhnWnhUOUtCUk1VVHFFM1ZuYWxCVlVFeUhRSUozWUNPYTk1TVVX?=
 =?utf-8?B?cDBucjVUMi81c2thR0FobWMwdy9yZ1Fqd2FJZzJZU1FTemdjaUdLb2ZiVm1S?=
 =?utf-8?B?MWpVR203WkZ6WEhxd2xTdkx5K3NkMGx2ZHV0UWJ3aktINUpxTmw5c3JlZ3F6?=
 =?utf-8?B?RWNFakNPVWxaeml6WWUrZmpQRHFxaHJYVThpM3Y3d2F4d2JkY0lWZ0hlSTI4?=
 =?utf-8?B?YkFjSHo3bG8vNjlXUHlTR3JjWHlnc0ZiWDFjYlorQVJTTHgxd05scFJIVGY4?=
 =?utf-8?B?ODJuUFhCV2NsUTM0MW9SU0lab3M5YlRIelB0NFM1VGFGRFJVVHo4U2R6N3ZF?=
 =?utf-8?B?eDdWTnNwQ0NtYjV0QXpKdC9jT0IrcXhJNjgwMGVqd3ZLMGQwMExwUlVKdXM0?=
 =?utf-8?B?aTVqWmcxNzNxZkV6dDJQZDFqVFB0Yk41OGU4K3RoeGRBUVZYeWlCVzRNcm9M?=
 =?utf-8?B?eCtTbU9mVUtrQ1d2Z1VrMkovb1dvYWM5MUNENlBWRzhwRXN0cEo1aDF0Wmtw?=
 =?utf-8?B?cGpUY0h2SEpUUDlrZVJwRmsreW83c09EcGsrUXhUSlQ4cnFCcHVQMXo1Rity?=
 =?utf-8?B?MEx2YXVPSkhrd1FnZDQzREdlYXJEbWdQVjNWOUpiWmRKZ0JlNG9tK3lwOXpX?=
 =?utf-8?B?azY1eWZuem01dlp4VHUxS3c4V0xzV3N6OUNrNm1qaTRNMXhYQWF3cHM3T0tl?=
 =?utf-8?B?WFpRVUkvR01nNTJHNGRRZnRMb0dDbDlYenMvdnlPanFXbFV2YnIrYkt0UDhD?=
 =?utf-8?B?TWYraDRUNCs1MkxWWWV2UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXgxMTdUeEIydWZ0dUJVZ1dLSzZxWkxmdDVXNUZsMG9nMHdkVnhUcEMzajM2?=
 =?utf-8?B?MVF3TEM4bTRjNHY2UmQ0VjFndDU5c3VNdzFsTGk4eDRWOFhrS2dGdUFFamVn?=
 =?utf-8?B?OEVxVzdaUlZodUJ5Tm9pWXc4VG9jdVpxSUpZVUZjVzZpNnFRRzZmTDhCRS94?=
 =?utf-8?B?QkI5N216QmxJeE1Kcjk2d20reWkvbzJBT0E5NWswN3Z0YjlFdGNOZTY5Q0RS?=
 =?utf-8?B?dGpHVUplalZRRFJWckpNWmFDZmlHbXFLREFDa0wrS3NmUDAzbmhPNys5N3ZD?=
 =?utf-8?B?YXM1MENJL0RjaGoySDcvWHZBOU9FWGQrYVNvbXFEUlJ3cDZkcWJQVWFtNXRN?=
 =?utf-8?B?WEE5cjVhNU1jTkRhWm9NMVNrdE1SUWRXSm8yRHhMa2VENGh5dWpXcHhyeHpS?=
 =?utf-8?B?Ly8yV1hnZ0FxRmwxZE50TUNLd3g4b1hyQWgrdk5LMWpFUUZITC9PNFoyNXJa?=
 =?utf-8?B?U05NVzhpRkZuaUgrUGFRZmwvTUpLSlMxRlhXOE5xYU5hekh1ZjBDNXpHRVc0?=
 =?utf-8?B?a3FGVTVpM1JmZllETFhCN1ozUW5YbFNIaGFYNE1sb0hzYko4NUJrUngzb3Fh?=
 =?utf-8?B?dG0rS2dtdUIzUHhCNFBydXNqQURXNHM3M0NJdHJURGd5YUJZRFpYQ0JFUjYw?=
 =?utf-8?B?U1ZXd3g4VFZweUF0bnVQakorMVR1SXUwd1ZUemVPQk9pR25WbzVlSFQzbFhh?=
 =?utf-8?B?YlErWFZQc2ZCaGY3Q3JsM0hxRE9zdVBrdnA0bS9QYWFhTCtsTkc3ZnUyS1No?=
 =?utf-8?B?djVUMGdWL01aVnNkang3Z1F1WlIxYjEycEZZS1FDUWg3dXV2c01iNEU2VDdx?=
 =?utf-8?B?dVN6OTdPNE42TXpsMFRNV1BOSTBHVjE1eHdQRDdlbTdNZUNIYUFJd08yZzdR?=
 =?utf-8?B?bUxlRFNoOThMQnBXSEVlNHc3NmhkU1dIbllmamlFMXJrRFZYb3ZaKysxcXVP?=
 =?utf-8?B?MnU3NUk5akl6MTYrWmpUTENWbk85REd2ai9IS3hOekphZ2p0MHNZcTh6ZWFW?=
 =?utf-8?B?VVFaMzFZR3d4VWNkN1F6QThBYi9KVCs3cXdRRTJkY0JwMUlFWjV6SGI5Y3hO?=
 =?utf-8?B?cUVMTE13Ynd6SzNLOHRsclhpSW5wOEhmbG51VW5uazM5ODZWOEovMk9pK3pI?=
 =?utf-8?B?cXlVOWZwNU0zS1QrbmNIa01DbFNMK1NLT0wrRSsxSEt2WE9qZjZQVWdadWo1?=
 =?utf-8?B?MDlINDhzUFFwaDBqcXE1WHdJbFlTbnB5bVEvUXArWHN0WTNGa2h4cUFkQ2RY?=
 =?utf-8?B?UGloWjRHVHhLV0QyZE02WFpiQzdsdnFENFoyY21pWVdXR3owNEVyc2t0N2Ni?=
 =?utf-8?B?bWx0SDEwMzhyNTRiYWJUVEY1VUI0NENDK05RWE52Tld6TmFlQStTejUxdmdI?=
 =?utf-8?B?SjVwWWw4U2ZEM3FHODVDbXFyMTE1YXlud0E4TGJ5M2FSdi9UZm5EdFBaK1Bv?=
 =?utf-8?B?WkdRbzVhWjlYVTVPdjYwd0RlcTc2WkpXVk9yeVdGZmI2RnplMlJGV0FjaWlH?=
 =?utf-8?B?ZU5NbzdLNXRnQ0xQQkFhZ1FkK1JwaUliNGlsV0IvL28xYnJMenk1aUV0SmF1?=
 =?utf-8?B?SjluN2hNT0RSSHl6ZkJnTXpKUXFabDhJbnp2dkdWR1IxNkVtN0tzbjNDNmtz?=
 =?utf-8?B?bHZIQUVSamZTQnRYalkyVFZoR1BBR2JIMlR2S3hyMHZPR2JJV2pGRUVJdEZK?=
 =?utf-8?B?QWkzaWNiRnJ5ZWFyNlM4SnZtZmhad0NuaEZJVWFvQ2JicWNQRVplZ2dUL1kv?=
 =?utf-8?B?UDZpamVseEp5QTlrNXBBYWdqaEphNXNFQWhPYkRjYnh3bGJ3S29mVE5WMUZp?=
 =?utf-8?B?blJIeHo2MzFWbHM2WTYzVCtiUnNha05lZGV0aWlWZnFqYUV0eVUxUEVvcWJw?=
 =?utf-8?B?ZzV6WTVhZm43T2puUEhza0lqU2ZnR2dXOHVlOHZ5bHNZTXBxaTVoQ29PWWsz?=
 =?utf-8?B?VDNZT2FEQkpiY3ZPRlZ6cy9vKzhPV3lCOTM1L0Y2VWw5T2o0L2N6VEZGZ3lr?=
 =?utf-8?B?bUFLT2dBaVN6VkhqVjU0RDFrcE42WjNmbmw1bjhqU2VKSHB2WlAvdE9NSUx3?=
 =?utf-8?B?VlhXRFl2dmV4eWZCMi8xc0JIWjliTzRyTExYeU9SWGR6QWNKMzZhRlI3TW9N?=
 =?utf-8?B?bmltdWNhMDAvaTNYb2tFZGZ2SGdralgzS1ZneGtDblJ5eEpxTFIrMFpXN2Jh?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 186c5273-e509-4f45-77ab-08dcc95adf75
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2024 01:18:51.4698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fBF2cEEXF+NLGR2E1mDD7Q9/f7wBsdZUcDqOZ7sy3mKLY7FTIDIS9o3a/yTbB0wdSc6B3Mf/ab5ZkKeJRFVFj+dLTrvOjJ415rN21SO9UUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6526
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

On 8/30/2024 16:33, John Harrison wrote:
> On 8/30/2024 14:56, Matthew Brost wrote:
>> On Thu, Aug 29, 2024 at 11:23:03PM -0700, John.C.Harrison@Intel.com 
>> wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> There is a need to include the GuC log and other large binary objects
>>> in core dumps and via dmesg. So add a helper for dumping to a printer
>>> function via conversion to ASCII85 encoding.
>>>
>>> Another issue with dumping such a large buffer is that it can be slow,
>>> especially if dumping to dmesg over a serial port. So add a yield to
>>> prevent the 'task has been stuck for 120s' kernel hang check feature
>>> from firing.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_devcoredump.c | 76 
>>> +++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_devcoredump.h |  5 ++
>>>   2 files changed, 81 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>>> index bdb76e834e4c..eec7b89ab48b 100644
>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>> @@ -6,6 +6,7 @@
>>>   #include "xe_devcoredump.h"
>>>   #include "xe_devcoredump_types.h"
>>>   +#include <linux/ascii85.h>
>>>   #include <linux/devcoredump.h>
>>>   #include <generated/utsrelease.h>
>>>   @@ -310,3 +311,78 @@ int xe_devcoredump_init(struct xe_device *xe)
>>>   }
>>>     #endif
>>> +
>>> +/**
>>> + * xe_print_blob_ascii85 - print a BLOB to some useful location in 
>>> ASCII85
>>> + *
>>> + * The output is split to multiple lines because some print 
>>> targets, e.g. dmesg
>>> + * cannot handle arbitrarily long lines. Note also that printing to 
>>> dmesg in
>>> + * piece-meal fashion is not possible, each separate call to 
>>> drm_puts() has a
>>> + * line-feed automatically added! Therefore, the entire output line 
>>> must be
>>> + * constructed in a local buffer first, then printed in one atomic 
>>> output call.
>>> + *
>>> + * There is also a scheduler yield call to prevent the 'task has 
>>> been stuck for
>>> + * 120s' kernel hang check feature from firing when printing to a 
>>> slow target
>>> + * such as dmesg over a serial port.
>>> + *
>>> + * TODO: Add compression prior to the ASCII85 encoding to shrink 
>>> huge buffers down.
>>> + *
>>> + * @p: the printer object to output to
>>> + * @blob: the Binary Large OBject to dump out
>>> + * @offset: offset in bytes to skip from the front of the BLOB, 
>>> must be a multiple of sizeof(u32)
>>> + * @size: the size in bytes of the BLOB, must be a multiple of 
>>> sizeof(u32)
>>> + */
>>> +void xe_print_blob_ascii85(struct drm_printer *p, const void *blob, 
>>> size_t offset, size_t size)
>>> +{
>>> +    const u32 *blob32 = (const u32 *)blob;
>>> +    char buff[ASCII85_BUFSZ], *line_buff;
>>> +    size_t line_pos = 0;
>>> +
>>> +#define DMESG_MAX_LINE_LEN    800
>>> +#define MIN_SPACE        (ASCII85_BUFSZ + 2)        /* 85 + "\n\0" */
>>> +
>>> +    if (size & 3)
>>> +        drm_printf(p, "Size not word aligned: %zu", size);
>>> +    if (offset & 3)
>>> +        drm_printf(p, "Offset not word aligned: %zu", size);
>>> +
>>> +    line_buff = kzalloc(sizeof(DMESG_MAX_LINE_LEN), GFP_KERNEL);
>>> +    if (IS_ERR(line_buff)) {
>>> +        drm_printf(p, "Failed to allocate line buffer: %pe", 
>>> line_buff);
>>> +        return;
>>> +    }
>>> +
>>> +    blob32 += offset / sizeof(*blob32);
>>> +    size /= sizeof(*blob32);
>>> +
>>> +    while (size--) {
>>> +        u32 val = *(blob32++);
>>> +
>>> +        strscpy(line_buff + line_pos, ascii85_encode(val, buff),
>>> +            DMESG_MAX_LINE_LEN - line_pos);
>>> +        line_pos += strlen(line_buff + line_pos);
>>> +
>>> +        if ((line_pos + MIN_SPACE) >= DMESG_MAX_LINE_LEN) {
>>> +            line_buff[line_pos++] = '\n';
>>> +            line_buff[line_pos++] = 0;
>>> +
>>> +            drm_puts(p, line_buff);
>>> +
>>> +            line_pos = 0;
>>> +
>>> +            /* Prevent 'stuck thread' time out errors */
>>> +            cond_resched();
>>> +        }
>>> +    }
>>> +
>>> +    if (line_pos) {
>>> +        line_buff[line_pos++] = '\n';
>>> +        line_buff[line_pos++] = 0;
>>> +
>>> +        drm_puts(p, line_buff);
>>> +    }
>>> +
>>> +    kfree(line_buff);
>> Dive by comment kvfree per CI. Will try to plan sometime soon to give
> Not for a kzalloc. That's just a kmalloc(GFP_ZERO) which means kfree. 
> Although I think the IS_ERR test is not actually correct. It should 
> just be testing for null. Not sure how that would result in the CI 
> failure though.
>
> John.
>
The boom in CI is because the alloc is for 'sizeof(DMESG_MAX_LINE_LEN)' 
which is 4 not 800! Doh! Not sure how come it didn't blow up in my local 
testing. I've dumped out some pretty huge logs without issue. Just lucky 
I guess?

John.

