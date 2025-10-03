Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF83CCCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 13:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8319310E909;
	Fri,  3 Oct 2025 13:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBwy/Spw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476CB10E909
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 13:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759496932; x=1791032932;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=y5ItGJ3TsPI3XlHcC4Noa6kuQaT+w8Ytr71nLIVxqhc=;
 b=BBwy/Spw6KVv231LL0MKICki4Vk4f2Rraa9/sKmrwgAwyl9sPqGmEbzv
 t3x7kMnHTiu0Rer3TG6Nl4Lyk5QxRle+Og72Op2fFShrFZh0Wh+X6KbO6
 RkfyyPS1NrfEtHSXVsSiXY2pFhRz6ZV6H8Jkg7Mgy1iFzED4THnA1cXda
 VsfeDDqH3gM3OS5CFly6hFYH7+eL+eKCfr0GY0J2Xaa9OgHKMlqUG1F94
 R7IAWfjrGUmxsCfmIrJBzsxMNJqDByH1AmcsEx/OsISceA5gAmTYe4atb
 OlVGXA2yBi+LVgfEM1iiUIq+DnekZYHUvx5kcidSisfQMjuA3mchyUecN w==;
X-CSE-ConnectionGUID: Egg4N23OStOdgFXK4ZJh1g==
X-CSE-MsgGUID: QPW/ly4vQAyV3eSeOIZq8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="87235637"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208,217";a="87235637"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 06:08:52 -0700
X-CSE-ConnectionGUID: +yt0B7RvTbm3n+77eFwo7w==
X-CSE-MsgGUID: 2b3tivHDTnWr9qb6KDIrYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
 d="scan'208,217";a="210277944"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 06:08:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 06:08:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 06:08:51 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 06:08:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYx0lAmSjf+7zxXhixKYc3H1dF7bztBQJoE0KR7a3ouofPamKQfI4vhvDAhpHamjkNPAM5OS9p+rZhFqglb9vq8UA9nohUgfByi1LWuje7Si828I3OFyMKRdHGq0YidLr/DJ0WVmmatvSKSkBQHqwnIVlHYlAe5+l7d++fhbjrmNbPcmQr/ZSrNFekRcR9v0PeDoiGkusJVPFE7PNa5YH0l5Dh+Kmtf+ucawnUUykhOhvaysBz72Pz3km1Ku4GjNMISMvV2Q0SwbsBfafzy9HFcS6jz9uSTBFfoP3MUhEQi9PpIUkxgQIyWmF99X0RfafhGWcl9am96jTk3IJsgk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59CeYuz3kSvmMnYkpIPWbnI+XMPPXm6iRtQ1+DKZing=;
 b=E1gopy6ajVCn5vd+3exekqe5NzR5qxIL9sMZDlosUEIbtCigAiwSjL5S4ob1wv1udtHROTJdCZRhog3ezDrQKWj/shHxBqP4/LflpOHIm7yEOCZ2/ZWZrSUii7Sd0IOlyhC6TIWMLR1lwoaGmUGY68zw24EhyLBZfx/o2/PYxyiQY5hcFULG+9grmcMAr3g4WJR45lYm1dC9hnupXBzQXMiOTQSA0E8M55FwBqGtrxCrLHQsz06JS4+HfXw4WXTfB0/ct+biFQoc9pobq6zYMJ0SDT7im8PM6ZbvmA5vYvzK6woIupG9PlF4YPFDENN6gU8l8kbRMiYzKyIHTVio9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by CO1PR11MB5155.namprd11.prod.outlook.com (2603:10b6:303:91::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Fri, 3 Oct
 2025 13:08:42 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Fri, 3 Oct 2025
 13:08:42 +0000
Content-Type: multipart/alternative;
 boundary="------------2MntVpKJ3jhvzu0PVzyh4T6v"
Message-ID: <ae6732b9-d341-4953-aa19-b995e24abdb8@intel.com>
Date: Fri, 3 Oct 2025 15:08:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 28/34] drm/xe/vf: Add debug prints for GuC replaying
 state during VF recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-29-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251002055402.1865880-29-matthew.brost@intel.com>
X-ClientProxiedBy: WA0P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::25) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|CO1PR11MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: 1906f68a-116e-4de7-f16b-08de027dfa17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGJSbUxvUklrNy9RUVpUQ0svUnhVODY3NlFYdFR4TjV0a2RsS3ZsVnB6Mklz?=
 =?utf-8?B?Y1JlT2Q1S3hZTk5KdUVaSWErM0FxZWpNb2EweVovTTQrM3RuaUlPdHZjeUZ1?=
 =?utf-8?B?NThKSXJNWGZNWDd4Q24yb0VVSG5vcU0rRGZvZkgraHdFNlN4R0ZJNDVWSzBR?=
 =?utf-8?B?UWw1MTVtZE5MZW5BUFcya1docDJOWmRKKzJ2WlRyeUV2Umw0ZnhscjZVNkdC?=
 =?utf-8?B?YndjK2tTMkU1WnU3RXd3M09hczBjcE41ZCtmcHVWQklvbEViTnYyVFl4QlJv?=
 =?utf-8?B?TkUycERlTWpTc2daQTZ2WG1NcXBSU1lHcmVQRnUwYi82RGl2cDBDMDdKMGQ0?=
 =?utf-8?B?YVBENHRuQlRNT1AveCtUaWx1SUs0VXA0SG5zSHZ4K1pYT21PWmZQM2dHRmJ4?=
 =?utf-8?B?VkxFSGltZWN0R1pYMTI3cW1NWnhVMWY4VFNRY3FGa1RBaWRlT2F0R1k2Mm9x?=
 =?utf-8?B?NEdKajhRWHZHT0s2blMzTjZ3VExaUkwzeE1uYXN0eSt0ZmZkUTdvZlk2ZWx3?=
 =?utf-8?B?VFowenN5MWVUNkZ6akFVUktKbTdQTzY3REVMTCtmTnk3M290NGU3K0R4SXlL?=
 =?utf-8?B?dUJZVWY2N092YnBYUWMyMWlKTS9oalBEU3lxRnJoSTlwWDZyT09rNUpsYmhZ?=
 =?utf-8?B?OGJXSzlSdkgvNitlT3Y5Vkl2bkRFZllwT3JHV3FvdlpKQmtKdkp5WVkrQUYy?=
 =?utf-8?B?Z2dHZ1hCYVBCL1dMZXp1a1VjOEI5cmhIOVQ0SWZxU29RZGFjbkpDbjNDejdy?=
 =?utf-8?B?V3AxZXU2Y3loSzVBN2puTHZ5TGJNbU90enBpYysxU2dna2U5UUYxVWQycUd4?=
 =?utf-8?B?ckxhYjJ0RktFNWxldXRuZURlbUdVZ1pISExoRlBsMnJLNFdxbGdlODhndVlH?=
 =?utf-8?B?R0haNHBIVmxkU1ZkYU5RTU1XSFRTdkQ4YWpyenNMYnhtUG1makVuR1pjYVdT?=
 =?utf-8?B?SkdvS2hFNFh6clNVcVlia3NEbnc2WUJQUmtXYkRLYjJYb0x4eE1jdDBqZEVQ?=
 =?utf-8?B?ZXFaQU1RajVJUzRwTnBWeWdrOEx2RUJXY1N0Z3ZxclBROXVsRHdSMTcyWm0x?=
 =?utf-8?B?OFpzRGdUWU90K0s1RkNNUmxONmxtOEhFRVJ4VCt1UC9MLzRleXc4aHdXNkJK?=
 =?utf-8?B?cEdwWTZ4RWd5Y3pvdUVMVnNFUTF0TWN3SXoyRk1sNmkzalhzTUFFY0ZoVW9Q?=
 =?utf-8?B?cWJUcDBYVDVQbmRadFZSRi9pOThkYXJsM2M4Z1NUK2YyWXZlUTBmTlQxZTBC?=
 =?utf-8?B?TGRWeTR1RHRYZ0N2aW5RNVJYVHVSclM5UDJFbW1MVFRJRlpVYWdqa3hZeGs3?=
 =?utf-8?B?RzFNUlJJVXJJRk9kTGdhd1RUUkZDb2tKeS9zZFVEOEhKWWJTTWtoSVd5OVpi?=
 =?utf-8?B?UmNIWXJLVC9idDJxUWpTNnNJRzY4UCs2RE85WlBDUnlCQ2d4dEtzOVUraGV1?=
 =?utf-8?B?MmgyL09YOEExazNwTGVEMnBuVC9wYWtJa1ZDTzRMZjJSSVBqU2JYNnV2Rm5W?=
 =?utf-8?B?WkIrWTBnbVNCdEw0d2c5T3JzL1ovRG90bFp6UDlaK1poUlhFOG1TK0ZEVTd2?=
 =?utf-8?B?RE5NYXNpVXlMNTJHVThMWlptTVV0TlpETnI1cFdmWEx1Q2NWT0JRMG5aNm1Y?=
 =?utf-8?B?MG9iL0pXRFpNbXlKMkoweGlJNkp4MzZ3M05oSGtLMDh6VkFWdU5NcTUwOHZP?=
 =?utf-8?B?N0dMS1p6cDVzSkdDdnZxcmJIYzNhV2NEY2VNWXBDcFZPYnFCZldyTzAxY0xZ?=
 =?utf-8?B?VVRIbzhaOURyVjVxeEFZR25raGRxeUR3SittSTJBQ01yd2pGTkdJNHhOT0sr?=
 =?utf-8?B?andCS0ltUlFGUTBwZ3JvenZMSGphQkcvdFFZbHkzMGZJS0VhMjdTWm1EWDAz?=
 =?utf-8?B?bDA2aHh4WGVKaVpyNHlSTlA1eEVLL2RFaWc5YzBwOTNVc2RqSnFVU2xpQ1d2?=
 =?utf-8?Q?lXzHU/I6sEgJ3tbSI31VMFyiMTssypm/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1pLakt1WVRMdDNTbVl5ZXcrMW5ZN29ZS2F1VUVkUkxtT2RmQlVIZFVLT3F5?=
 =?utf-8?B?Z2hONVZ0ZVV0eVlvS2YzMU9MaTFwcHlLR3haRTV5VDlXdVcrV1Zqbk8yY3VJ?=
 =?utf-8?B?bzNaZmgyVTU3OTBkcGJlVWE2a3BiWG5OaEE2UTU2Mi8xa0Nzd2tFb1RHRnJa?=
 =?utf-8?B?RGE0dWYvdWJ1YmUvQUorWXJ2ZU10cy84RzNXZC9rYVVaTDlGZ3Y2KzFZanFI?=
 =?utf-8?B?R2ExSEpqcU9PQ09FbElCT2MvOXBtSnkwYnJCZzVZTXNKSmx3V1Byanp5NWdl?=
 =?utf-8?B?b3huK0JxUmxWRjVEc1pyMlZQYkxOcEdmTnRYMzlkSjlwalhhQy9sQndqdVlp?=
 =?utf-8?B?aURBRU45K0J3bklRSG42U2F3YitlUnZ5US9SaEh4ZmIrb081VzRZVzJUQjAy?=
 =?utf-8?B?R043Ukw4U1ZQWXVqS2R6QytMNE82RU9DeDIyeGQyZ28zT1VpZUNIOTM3bHM3?=
 =?utf-8?B?RjQ5cUhXSW5qaFNMdzRuajIyZG1WL2U4ZnliTUQyN1d5VlZ3TFhDSHAxTGhP?=
 =?utf-8?B?bS9lbkk5aWxzalFVY2RUVStBUEZTQS84cThkUW1NeXdNZStwRlo3bXVSUStx?=
 =?utf-8?B?dzNSVzhMRzEzOEpHQU1weFk2WFQva0JyTTNOVld2c3FWd0JpTlVzdC9SbHJQ?=
 =?utf-8?B?NzEyWFl0MHlSSWZIdkxpWEQwbzFBZlRWNXdpcnNrekhnV0Z3Rm15Tmc4dHIv?=
 =?utf-8?B?VUN5OGpNb0pPUjN5Tk9GVmxtbGpWRW9LUmJKQkhQZG1HUytHdmVnUnhkcHlD?=
 =?utf-8?B?TWFnSlZtdzZyUmRkMEtOMk8zZVBKL3RJQkp6d3J3ckZJQ3VQdEhZQ01FZTVr?=
 =?utf-8?B?Vmh1b0l1VjB0NnZxUEhjZERBN0FocWlyVllPZXRubGdnZ1J0MjFVWllidWkz?=
 =?utf-8?B?a2JPZTh1WFpYS0pNTTVmaDRRWGd5M0V4Q0VGUzVYOXhmS1I0ZTg2dm13b2pa?=
 =?utf-8?B?MjRIdmVWbHNyaTBYNnZPRDJCbXptUWFYQ0I0dGZ6ZFpBaUdMZnNLOTlzNzNM?=
 =?utf-8?B?bXhSSTAwRTU2c3JNTW9TM0JtNWdkZEhVM1ltdmpJaXRUTnNKWlJCajZ1WFJG?=
 =?utf-8?B?TTlUdFpjdU03eXVlZTd5bmJLdFd2NU51NGREK0NXTVloZXVnTlZyREpYbGxV?=
 =?utf-8?B?QXhDSHBvbHdHZXhDS0pJVGpSang3dUU3MEVjTWFNTkUxaTZlN3UzbGM5U2lT?=
 =?utf-8?B?WGdZQUFUUVhSUVZQcW1wSjZzWDVjRFBIZi92QThZN0FqdTEzUUhQazczTlJP?=
 =?utf-8?B?ZndUVWhnRkZXZnIvTVltblYzSEprZGtOSEJLZ1cxYUgzNEFLZEZyVXhYb0ty?=
 =?utf-8?B?dVlBcGdreTVGL3ZkUGhVdU14STloaHBKMU5tZkVHSzVFZEprdXlsLzdnejhB?=
 =?utf-8?B?aDBYWXN2V3NiT1kvbk1pQjFpRXpRSHh1ZTkvQjNML0FTTlhucDNwVkVXaXZY?=
 =?utf-8?B?YVBsR1ZIV0p6bHBYTzBhZUZjRVJnV2lYK01PR3laOWxLR0J5Qlh6a3N1RXI1?=
 =?utf-8?B?WElBdnVadzRBZUdod2IxV1Z0ZE5vWGxWakhQT0NFUDk3YXloaWlUeXhtbGpY?=
 =?utf-8?B?Qll0akFoRk5OYmNLNlNwanhPUG5vWEU5dEJHK2wxdjBDMFNEcmkzOE1Fbm9w?=
 =?utf-8?B?eWhuTHIzVEVLK21Db0pZSmk1RjhDTEcxUTNUSEd5QjJESG14Kzk0SmZWeE1Q?=
 =?utf-8?B?L3l6cVpIRnl6UEQweUF2cjdpNzlIeFAzSi9OVE1Ma0dMcDBrSUllMk5BVk5K?=
 =?utf-8?B?eE0zL0RlVWpYSjZxc1YvK1VudUNRTjFxYk9xbGxSd3V0U1hsUTdFcnlEY0th?=
 =?utf-8?B?SzI4N0Z3cTZXTVQzOVNoMCtEOHVFZW51ZmNMWWNiLytSYzd3UGt3d0pVTEZ2?=
 =?utf-8?B?V3J3Z2NpS3BOc2dCcVZTVEV5Y3BTeTZoVC9JQlNCT0lwRU1KdXNvZUgrYW5y?=
 =?utf-8?B?bHljNE1XZzkwUTVLbU95ZWhQeEVDVTZHUk9UY2d2VmFneERTdVkxN3JoczFL?=
 =?utf-8?B?Q1o3NE84emREMEtHWVl2OWtHZVpkWVIrSmlhMHU0SHg2TWJsKzgydlp3RGtk?=
 =?utf-8?B?YTFhNGxkdkg2aHRKdEVEYW82RGtpWUlnbHJWMGYzV2hrWXk5c3UrRW04OHdY?=
 =?utf-8?Q?c581UIbtnjUU0w9vbB5c4/tuQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1906f68a-116e-4de7-f16b-08de027dfa17
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 13:08:42.5317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/vstXYKyKW8WhVIo3Limo2jyI6fL2RIpR6qxBPSavCueHiHZGFzNhZBcny9M+vS7utv85xnKBB46sxEqRflSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5155
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

--------------2MntVpKJ3jhvzu0PVzyh4T6v
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/2/2025 7:53 AM, Matthew Brost wrote:
> Helpful to manually verify the GuC state machine can correctly replay
> the state during a VF post-migration recovery. All replay paths have
> been manually verified as triggered and working during testing.
Repeating on request as looks like it got lost in v3:

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 23 ++++++++++++++++++++---
>   1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 7fe3fb07e35e..bc717403740c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2306,21 +2306,27 @@ void xe_guc_submit_stop(struct xe_guc *guc)
>   
>   }
>   
> -static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
> +static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> +						       struct xe_exec_queue *q)
>   {
>   	bool pending_enable, pending_disable, pending_resume;
>   
>   	pending_enable = exec_queue_pending_enable(q);
>   	pending_resume = exec_queue_pending_resume(q);
>   
> -	if (pending_enable && pending_resume)
> +	if (pending_enable && pending_resume) {
>   		q->guc->needs_resume = true;
> +		xe_gt_dbg(guc_to_gt(guc), "Replay RESUME - guc_id=%d",
> +			  q->guc->id);
> +	}
>   
>   	if (pending_enable && !pending_resume &&
>   	    !exec_queue_pending_tdr_exit(q)) {
>   		clear_exec_queue_registered(q);
>   		if (xe_exec_queue_is_lr(q))
>   			xe_exec_queue_put(q);
> +		xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER - guc_id=%d",
> +			  q->guc->id);
>   	}
>   
>   	if (pending_enable) {
> @@ -2328,6 +2334,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
>   		clear_exec_queue_pending_resume(q);
>   		clear_exec_queue_pending_tdr_exit(q);
>   		clear_exec_queue_pending_enable(q);
> +		xe_gt_dbg(guc_to_gt(guc), "Replay ENABLE - guc_id=%d",
> +			  q->guc->id);
>   	}
>   
>   	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
> @@ -2337,6 +2345,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
>   		else
>   			q->guc->needs_cleanup = true;
>   		clear_exec_queue_extra_ref(q);
> +		xe_gt_dbg(guc_to_gt(guc), "Replay CLEANUP - guc_id=%d",
> +			  q->guc->id);
>   	}
>   
>   	pending_disable = exec_queue_pending_disable(q);
> @@ -2344,6 +2354,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
>   	if (pending_disable && exec_queue_suspended(q)) {
>   		clear_exec_queue_suspended(q);
>   		q->guc->needs_suspend = true;
> +		xe_gt_dbg(guc_to_gt(guc), "Replay SUSPEND - guc_id=%d",
> +			  q->guc->id);
>   	}
>   
>   	if (pending_disable) {
> @@ -2351,6 +2363,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
>   			set_exec_queue_enabled(q);
>   		clear_exec_queue_pending_disable(q);
>   		clear_exec_queue_check_timeout(q);
> +		xe_gt_dbg(guc_to_gt(guc), "Replay DISABLE - guc_id=%d",
> +			  q->guc->id);
>   	}
>   
>   	q->guc->resume_time = 0;
> @@ -2376,7 +2390,7 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
>   	else
>   		cancel_delayed_work_sync(&sched->base.work_tdr);
>   
> -	guc_exec_queue_revert_pending_state_change(q);
> +	guc_exec_queue_revert_pending_state_change(guc, q);
>   
>   	if (xe_exec_queue_is_parallel(q)) {
>   		struct xe_device *xe = guc_to_xe(guc);
> @@ -2478,6 +2492,9 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
>   	list_for_each_entry(s_job, &sched->base.pending_list, list) {
>   		job = to_xe_sched_job(s_job);
>   
> +		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
> +			  q->guc->id, xe_sched_job_seqno(job));
> +
>   		q->ring_ops->emit_job(job);
>   		job->skip_emit = true;
>   	}
--------------2MntVpKJ3jhvzu0PVzyh4T6v
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/2/2025 7:53 AM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251002055402.1865880-29-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">Helpful to manually verify the GuC state machine can correctly replay
the state during a VF post-migration recovery. All replay paths have
been manually verified as triggered and working during testing.
</pre>
    </blockquote>
    Repeating on request as looks like it got lost in v3:
    <pre class="content"><span class="reviewed-by">Reviewed-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a></span>

-Tomasz</pre>
    <blockquote type="cite" cite="mid:20251002055402.1865880-29-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7fe3fb07e35e..bc717403740c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2306,21 +2306,27 @@ void xe_guc_submit_stop(struct xe_guc *guc)
 
 }
 
-static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
+static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
+						       struct xe_exec_queue *q)
 {
 	bool pending_enable, pending_disable, pending_resume;
 
 	pending_enable = exec_queue_pending_enable(q);
 	pending_resume = exec_queue_pending_resume(q);
 
-	if (pending_enable &amp;&amp; pending_resume)
+	if (pending_enable &amp;&amp; pending_resume) {
 		q-&gt;guc-&gt;needs_resume = true;
+		xe_gt_dbg(guc_to_gt(guc), &quot;Replay RESUME - guc_id=%d&quot;,
+			  q-&gt;guc-&gt;id);
+	}
 
 	if (pending_enable &amp;&amp; !pending_resume &amp;&amp;
 	    !exec_queue_pending_tdr_exit(q)) {
 		clear_exec_queue_registered(q);
 		if (xe_exec_queue_is_lr(q))
 			xe_exec_queue_put(q);
+		xe_gt_dbg(guc_to_gt(guc), &quot;Replay REGISTER - guc_id=%d&quot;,
+			  q-&gt;guc-&gt;id);
 	}
 
 	if (pending_enable) {
@@ -2328,6 +2334,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
 		clear_exec_queue_pending_resume(q);
 		clear_exec_queue_pending_tdr_exit(q);
 		clear_exec_queue_pending_enable(q);
+		xe_gt_dbg(guc_to_gt(guc), &quot;Replay ENABLE - guc_id=%d&quot;,
+			  q-&gt;guc-&gt;id);
 	}
 
 	if (exec_queue_destroyed(q) &amp;&amp; exec_queue_registered(q)) {
@@ -2337,6 +2345,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
 		else
 			q-&gt;guc-&gt;needs_cleanup = true;
 		clear_exec_queue_extra_ref(q);
+		xe_gt_dbg(guc_to_gt(guc), &quot;Replay CLEANUP - guc_id=%d&quot;,
+			  q-&gt;guc-&gt;id);
 	}
 
 	pending_disable = exec_queue_pending_disable(q);
@@ -2344,6 +2354,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
 	if (pending_disable &amp;&amp; exec_queue_suspended(q)) {
 		clear_exec_queue_suspended(q);
 		q-&gt;guc-&gt;needs_suspend = true;
+		xe_gt_dbg(guc_to_gt(guc), &quot;Replay SUSPEND - guc_id=%d&quot;,
+			  q-&gt;guc-&gt;id);
 	}
 
 	if (pending_disable) {
@@ -2351,6 +2363,8 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
 			set_exec_queue_enabled(q);
 		clear_exec_queue_pending_disable(q);
 		clear_exec_queue_check_timeout(q);
+		xe_gt_dbg(guc_to_gt(guc), &quot;Replay DISABLE - guc_id=%d&quot;,
+			  q-&gt;guc-&gt;id);
 	}
 
 	q-&gt;guc-&gt;resume_time = 0;
@@ -2376,7 +2390,7 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 	else
 		cancel_delayed_work_sync(&amp;sched-&gt;base.work_tdr);
 
-	guc_exec_queue_revert_pending_state_change(q);
+	guc_exec_queue_revert_pending_state_change(guc, q);
 
 	if (xe_exec_queue_is_parallel(q)) {
 		struct xe_device *xe = guc_to_xe(guc);
@@ -2478,6 +2492,9 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
 	list_for_each_entry(s_job, &amp;sched-&gt;base.pending_list, list) {
 		job = to_xe_sched_job(s_job);
 
+		xe_gt_dbg(guc_to_gt(guc), &quot;Replay JOB - guc_id=%d, seqno=%d&quot;,
+			  q-&gt;guc-&gt;id, xe_sched_job_seqno(job));
+
 		q-&gt;ring_ops-&gt;emit_job(job);
 		job-&gt;skip_emit = true;
 	}
</pre>
    </blockquote>
  </body>
</html>

--------------2MntVpKJ3jhvzu0PVzyh4T6v--
