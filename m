Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF956CE7A91
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 19:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3DE10E944;
	Thu,  5 Sep 2024 19:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cr06jm95";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596D810E944
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 19:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725565916; x=1757101916;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ae4rMSgtjTd+xb+ECZRWrUbg9IMkGLBq/vg39OOjukw=;
 b=cr06jm954yK6ouhchBwEdpWVZ/6r9o/LJT6ogVsVpjOBm8OQ078pevDT
 CwGrAueH1NMx4MTKrPwnouKTEeWRlf5qlK/saaN3H29xungmfzo3Fnh+h
 yyTKkY1sR0ByGI+H3z4/7rGdQBFtzci7oFBDD0Zik72tVhm93uW1Izwig
 CsJe+QePj9RqQ6J7t16oi+K6CF/NN5atP9I1EptIktwEmpIxTAq0m1qvO
 N8ocWmp7xrJMEhAKZNfs+Xi288XR2+YQCWnQLCEyjW/qddfGu/jUKZmgN
 nvnDjsE/H8DfN3Aim+vY5YAwl4Z2JvWgTiPL3vzALC69qilWlpNEypOzR A==;
X-CSE-ConnectionGUID: e3iTFwHvTSm6v6GTWSy0ig==
X-CSE-MsgGUID: IEpwo9aARXGp9yRmeH0QJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="28098827"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="28098827"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 12:51:52 -0700
X-CSE-ConnectionGUID: I7s6A91QTIiap8Vg+6pLOg==
X-CSE-MsgGUID: IkwOUPwwSRCyMpvi/JbXLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="65737645"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 12:51:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 12:51:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 12:51:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 12:51:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3Vb/Vcgab9RLfhxR4Me/pF8Y0Up7twvBlyKi6ZzHaSUVTCFjPf1iWLx2bHEwAUOqIy4+amu3tUo43uD4zEYOBxCVbyX0q9xtCCOy1ORTxChSZL1kwEdtfgkXcCwgk26N98v5xmU8x9VP8NrpvSLjUnOMN9EfOrk/X5Dt7vMe4pvsegRBmRILJJj2w5+GYp5o5FfHcGGpGF8HjtSLx3IKNjXoORRXceeJCBNVKGYsExRhZ+mmSGoVwp9nViDyeY7qZQ32M78hxNRpCxBTjjrZGIIROfkNRVwYkzgaBIjHwU9IacqXF5nC9aMiUgE0jiFvW9NZUd3OyUWS/EO5T1q7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsUh0p61iSi+Qxt1uKzDCEoPqMe5QkseO2U3JdoNPGs=;
 b=AxQwC6yBCWyZ0jyhGVK87m8dwh9D91S24g+IHGqHuhuVBun4c6q4R/gxQkDAtzj6HsHgdRAr7XRwKHkN7Uc4Dtioer3SlgtHlDwoG/Y4nmFtJ6OWRQd9/1QTx++Dod5ktjxlsw3JO9ZqHFNiH6CnbS9tM6r/Ol5ZMK1hyPxELQnHl3OIyRbBAyguziplI7pc6MuWuLIfazZaU4Xgj3rZHH15/VL0fDHVwHL5bJSoLvSjOvLiR0hiUBmHi0TYjRnqAlcHhldliM/PNfpHtqH6tFiFIFGSNeY29IdLkfLzP8GdwCyKwvVJ7HRVxymsZdFxabQSzkoKcu1ZiRk3fvEXAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH0PR11MB5157.namprd11.prod.outlook.com (2603:10b6:510:3d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 5 Sep
 2024 19:51:48 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 19:51:48 +0000
Message-ID: <9605f23a-ce16-468d-a7b3-2ea3d9be2f21@intel.com>
Date: Fri, 6 Sep 2024 01:21:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 7/9] drm/xe/gt_tlb_invalidation_ggtt: Call xe_force_wake_put
 if xe_force_wake_get succeds
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
 <20240830052326.3707019-8-himal.prasad.ghimiray@intel.com>
 <ZtoIk-OUD7qkBvKn@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ZtoIk-OUD7qkBvKn@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH0PR11MB5157:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d73533-067e-480a-f4f5-08dccde42d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cCtSNVJsay9ONERUR2toODRsYkRzaElxT012ZzBsc0s4NTNlblNDTmdPVFlw?=
 =?utf-8?B?WFlyTEhQQVZIeXVYZUdwR2h1NWdxYVQxbzBtWHgxN0I5Snlza0plZW45YTNC?=
 =?utf-8?B?bm5RZ2FIekh1ZzNSdUxOZ0M1VUZiNGVja2tRWjRlV0wwTTJUbkVwS2Erc2pI?=
 =?utf-8?B?eWl0VVNxNFRLaFVPajBnbFNaZzBiZjhYbEg5OTRCdGtuYytHK2syQVFOQmV6?=
 =?utf-8?B?dE1ncTZ5NytTOUYvK0M3OVNBSDFmd0dHMXVYRGdaSGFGVFlqZWR2VlViTWhr?=
 =?utf-8?B?YWVrejNpcDJKMzU4TFIxdGxOK3lxaTBqMUdFMDREV3N5cXhnNSsxL3ZJN2po?=
 =?utf-8?B?RmpFM1ZtRkVBemczaE5meUZVOXhQa3FacmdIbmpEMTNjdnEzQmRJV1FRMnhq?=
 =?utf-8?B?V0o1NDJhVHlqMGxGWHRMMlpRNjBHNDM5S09uK2JBK1NpWmN0dklNUkQ4T3hj?=
 =?utf-8?B?dnRWVk92cllGbXBOS2NNZkZhNTExNUFFWlNid2ZUSVIxc3NiZzdlZGxHbG52?=
 =?utf-8?B?VHBKR3ZmeFVRS1E5Q1NOMU1MUmlMOFpqUVhEa04ralZ1VytkUkdGeWJXaGxV?=
 =?utf-8?B?a3BqUW5oSkZKOW1WT09PT1E2WXdVdHVaRWdXQmRZb2JWWGZ2ZHdkL0hwZklI?=
 =?utf-8?B?VTJOSzJRdkN5SXhrbzRFK0FOZG1KUnlxNGlBVXhWbDkwcUlvNE1CbTNJSjJ1?=
 =?utf-8?B?WWRCOFUrYW53VjNraEJVK3hhUUtkMHYwZitWYVVzWmUwdWwwZEg2cW43eW8v?=
 =?utf-8?B?YTBTYTI3aGFUNk5zY05vZmZvYUxuc29nTWR6TURiRmhoNlRyU29MV0xnQXJa?=
 =?utf-8?B?U3JJRG9iYllwd3VCbXgwcW5sU3pkUndZR0kxZlVUbmxZbW5iSHVzUEg1VzE2?=
 =?utf-8?B?NjVVYjAzRmZqb2EwTFYrakQ0M0dLUENWS2xOZkpSbDFXYm8rcVFWNlBvMHNv?=
 =?utf-8?B?NURXa2VHSHN1MmFGWmRRWE55VEtINTBYcXVFVjFrSGhCZHFwMXVieEZWZ28x?=
 =?utf-8?B?cit6ZzBBdkxxaFRnU2V4MHhiaEhLS0dIN29tdHdURDFkMS8vT0gyNVpRQ3c5?=
 =?utf-8?B?RytWMDBpMmhRU3grZTF5dFRyUkJXdXlpSlk5aml2RzRMbHdvakV1bHFWQVFv?=
 =?utf-8?B?NmZxV3NHYUIzemJmNFpZUWtMRDQrU01zandFbzRtYVBpSEJ4RjRKdmZNcmFD?=
 =?utf-8?B?bXVlUVVtazl2VnZEQ3h2YlFhRXVwU1FUNHdOWjZTcERsd1h2bXBLbGJFc3Zw?=
 =?utf-8?B?TmpTZUY5VUZsdEkxSytFdHc0UXhXZkdNa0ZOQStNZ3BvejZRVXprRHZhOE92?=
 =?utf-8?B?RkJWL2x1YnFxZ0krVFl4eUNYK2ZsM1VIYkxLTXhBSUVrUG1uUWRZNGRCNDJC?=
 =?utf-8?B?NlFTV2w2T0gyNENNR1J1SHlOUWhFQXI3RUpqZkE5bVBHditZMGwwNDEwQ25J?=
 =?utf-8?B?UlM0NTJiUHJPc2NOWGVsSktIcjBEYkprSjJ3bi9IbUozbkhucVJLdE5xbkNy?=
 =?utf-8?B?ZHc4OGpWclc1MnZoU3kwWUZrdmxvZ2Zwak9qaGZ0RXAyenJJc0wyS0RZSmxp?=
 =?utf-8?B?VkVBalFiektIQm0xbk5OREVGcjIzeFFRTVRJYkVSSFdKZUpXN0YyUSs5eWhB?=
 =?utf-8?B?Zmlid2dReUNheFhqSWhUNjlUcmxYVTQydU9IMVYrcU1EbENlZDk0dGNDOGRS?=
 =?utf-8?B?Y040a2phWHJzSDFTU01Oa2w4ZDkwSlpFV0o5Ym9TZlRrUHB3M3REVmRJL1hk?=
 =?utf-8?B?SzJleXNUVFVUZnVNb0wyeU93U3JSMTNQOTJPQmZQbFJGaWpvM3Q2S2wyMDVy?=
 =?utf-8?B?aDBWQ2Y4eDJRWDlRWis2UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3VWUzI5dmhpZkc2bkMzRzFMMmp2VVVjSEVaSVNkbGRFYTUvOWI2OVBRSi82?=
 =?utf-8?B?YlVlRFlTWGN0YTRvTzJWbWF5MC96T2pBL1FkcmlVZ0swa3JxUkI2Ukgra2Vk?=
 =?utf-8?B?VTNZYlVHeGlWOHpiMFExckRGcEVnSERsTXh3ZWFEakFrTG9wZk1PdjVOSW1j?=
 =?utf-8?B?endJam1pVW9HYlc1M1Y1cmN2UmhsSkk3c2VobThBVXBtZDdhUHEzb1JmTzRG?=
 =?utf-8?B?WmMrZjcxM2V3NGpoeFR4OGQxbzJYNmpJRDdDS1VEbkw2S25IaVUvN1Q2WnRz?=
 =?utf-8?B?SjZqS3NrVG9MZ200R0o4c3JEeFBFOEJKd0I3RDgrRm9DQ1B1MzM1VHhZYms3?=
 =?utf-8?B?a0lRWjRPZXR3OGc5bmV4UGs3V3NHbzlWSitBVm4wSWt3bUk2NVRQQ1VnR2wv?=
 =?utf-8?B?S0trdnlJa3MwSUhlSEREM0xzaDRVRHhwaCs3M2lZU1hGTEFWVTlDVEpvTzJ1?=
 =?utf-8?B?TDhHRFF0R2ozOGFtbzV1MW84cGlJbFNtVmFoNE9yQVBFTTBQMEl4Tk9GcG9s?=
 =?utf-8?B?N3JiQVJManlTVldDcXVyQzhTM1BaUFMraWN2c1ZkSmFMLzd0bllpY2lYSFZk?=
 =?utf-8?B?NGJXaE1DNVRVZWlaUnBNb09wWUxlV04vaUcwb2w0QlAyRTBiNFZBWHBxd0h5?=
 =?utf-8?B?eXBiZ3hUVVd3OG9OQUFkWjh0WjdjNTV5anVaeUhNajYrd1J4UHBmSUFUZGNm?=
 =?utf-8?B?SFJ6TVREenlGcTFzUTl4cnRMWmhGSWsxRHJha2wwQVRualhlS0taSWpZSjFp?=
 =?utf-8?B?Q0FxblNpdmhaTXpWSlR1MmkvclBTaW9KT3FySFU2SC9LNXBjTUliZ3ZhS3Bq?=
 =?utf-8?B?cThEUWpJOW9LYXRBV3JIbHc3S2todWRZYVBnaDQ4MDRKUjhKZWNKYWFLMTh4?=
 =?utf-8?B?K29nR1c3dWJLeE16aTVoZHFoenVjblRXclAxbzlXb2N5Vi9WTWNZdHRvTlRE?=
 =?utf-8?B?NlpuWW45QThUMXBaNEFHRlYrZFVWWkx3bUZ0SWNnUk4zekgzZGFpQ2Y1SXll?=
 =?utf-8?B?Rm0vVCsvL0gxQ1p6czUyNzR1YW43dW9TN1dvZlF4N1hqRWIwUHJNdUdRMzY2?=
 =?utf-8?B?YmZKUVZlM2pjVW50RWlIK21mWnhrWE8vZldXdFdXWlRKOGN6R0srQVdUQURU?=
 =?utf-8?B?eHhqNUhNNTAva2ZnVUN4eXZwaitCV1k2cFYwSk5QNXlrVkZHVjNWQ3lnYzNl?=
 =?utf-8?B?bTRQMkVFc0l3dVlPMFdUcDlOL3dVdUdxblJjOFRUREgrUHB6aHNZTStpRFNj?=
 =?utf-8?B?NW5NbmtvRDRTZFI0WUpXTTlyOWRVWDU2YVhDOWdYeUxsblROWGFZbXhaZWV4?=
 =?utf-8?B?NGlmWk9paFFpQ1JJam1lWU9Ua2ZWTU1NRFhrQ2o5cXhDaldXVHdXZ2NZbVZT?=
 =?utf-8?B?WGpFcFBycGJHdjVDR2ZMeUU2NVNqWG9odWJkMlA2b241L1N0S1JNS2h4Q3Rv?=
 =?utf-8?B?NWthb0VveE1JMG9Ec0Q2NEwxbFh1cnYzQ3VwMGhEUm1RKzNkQS9ta3F4SnNz?=
 =?utf-8?B?NnFDOUg5RUw2a2c5Q3RyeHRYZUsvck52cksvOU94L3AxUEdsWFhpKzI1RmNl?=
 =?utf-8?B?SFVrQmd4SHFLUXNyR2dodlZUQ3FWQ2JzWXdzMkp2OXBJcFlEUWJVZHVKNkV1?=
 =?utf-8?B?MDUvLy8rWmd2V0NXMHFzTlcwNFllb0trT2JLaWJtRUI1MlRGQnFGd2FxR2RM?=
 =?utf-8?B?NWwvSzFkc081WU95NUpDdDdIZTNockRKUllIWHJoUVlQKzM3Y1BuTXA5YlF5?=
 =?utf-8?B?cDVHTTJHRTV0UmdQK2p1b1UzaytyekpUSVF4UUdZdERnQldNc1FBQjJWck1q?=
 =?utf-8?B?dlVwVFpnT2kySW5ZMGNhbjZoNnlYU3VxZVZyaTc2cWJyTlBJQU56cTJjS1JU?=
 =?utf-8?B?dGxmWGhlV2FObDdLUjZmUXd5eStOQ0d4dkNyZmNaOURCdHFvaktEVGE1REIy?=
 =?utf-8?B?Z29NMENhRkY3ODhtdmE2TjBzTGkrZTJHcXZoT20veHdKKzBWVVFnTUNxc05N?=
 =?utf-8?B?SThENFhrWk5EbU1aZDMyLzhkZjlYT2xHSzA0ejM1eXNPYTZnVWFXMGs2Wm5z?=
 =?utf-8?B?SDAweFNXWFRqOWtXYnNhVGQraDJSVUFLMGl1NkFnL2YyYzhyQzZVeEpYL2N1?=
 =?utf-8?B?Y2ZyRzNINlRxb3lQU0I3ajNzYWw1ZHFsR2k3dHFzamZpMTdlbGJFODJkZCtL?=
 =?utf-8?Q?8blxi9pgT9lxjpQifT2CFwY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d73533-067e-480a-f4f5-08dccde42d82
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 19:51:48.2923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dA0GJLbTSG0DMVs8XOXz2dNb9uxKhQ8rSevW/MS3ZTVLnVNFwHa3Gf4OfPATYz1x0FE9D7VTfVVdPKq3ARaLoFMrySvhv8k8z9fsx/kT4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5157
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



On 06-09-2024 01:07, Rodrigo Vivi wrote:
> On Fri, Aug 30, 2024 at 10:53:24AM +0530, Himal Prasad Ghimiray wrote:
>> A failure in xe_force_wake_get() no longer increments the domain's
>> refcount, so xe_force_wake_put() should not be called in such cases
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index cca9cf536f76..3f86ab704c4f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -259,11 +259,11 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
>>   int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> +	int ret;
>>   
>>   	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
>>   	    gt->uc.guc.submission_state.enabled) {
>>   		struct xe_gt_tlb_invalidation_fence fence;
>> -		int ret;
>>   
>>   		xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
>>   		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
>> @@ -277,7 +277,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>>   		if (IS_SRIOV_VF(xe))
>>   			return 0;
>>   
>> -		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>> +		ret =  xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +		xe_gt_WARN_ON(gt, ret);
>> +
>>   		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>>   			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
>>   					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
>> @@ -287,7 +289,8 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>>   			xe_mmio_write32(gt, GUC_TLB_INV_CR,
>>   					GUC_TLB_INV_CR_INVALIDATE);
>>   		}
>> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +		if (!ret)
>> +			xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> 
> looking all these cases now I honestly prefer the other way around.
> 
> If we called the get, we call the put.
> get always increase the reference and put does the clean-up.
> 
> fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> 
> xe_force_wake_put(gt_to_fw(gt), fw_ref);
> 
> so, the fw_ref is a mask of the woken up cases which require
> the ref drop and sleep call.

Hi Rodrigo,

Thanks for the input. AFAIU using this approach creates issue in the 
subsequent force_wake_get/put in callee function. Which I have tried to 
explain in cover letter.

[1] subsequent forcewake call by callee function assumes domains are
already awake, which might not be true. This shows perfectly balanced
xe_force_wake_get/_put can also cause problem.

[1] func_a() {
	XE_WARN(xe_force_wake_get()) <---> fails but increments refcount

	func_b();

	XE_WARN(xe_force_wake_put());<---> decrements refcounts
  }

     func_b() {
	if(xe_force_wake_get()) <---> succeeds due to refcount of caller
		return;

	does mmio_operations(); <---> Domain might not be awake

	xe_force_wake_put(); <---> decrement refcount
  }

BR
Himal

> 
>>   	}
>>   
>>   	return 0;
>> -- 
>> 2.34.1
>>
