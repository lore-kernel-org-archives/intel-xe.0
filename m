Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA398D6DDDB
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 07:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F59010E06D;
	Fri, 15 Nov 2024 07:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZC3k0B7P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67E810E06D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 07:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731655318; x=1763191318;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rmbUldRNq0TIDmFF0XhqrErtr9JSXFlTV0PQLstJAfE=;
 b=ZC3k0B7PlqFZxWALHaRjdqLLmF9MIJUaT3BAEHmuX10H9xUa+GnfvKrQ
 xSQayDU/nHeGNU3uPHq0qOcsxC16HYj2U5H+Hzh1+K23IudggnQx36JUX
 8lActI+SQCnmxphQsJvJYh13XSzKmfbr3m51j8Iyg8yFqb+g0duKUnx6x
 BaeUOFU08RQIk2podhzGSdB8RJAoBWPtnMERAXW1LTNV8MyKMMER3C55c
 Yst67wyF8P2bXT2kCeVjLZXgpuiV3JzTpKOUUP7GkzEnNcKd1aCN/ttJa
 Ko8FjSIvgJ6dDatdBmAszLES25CR2ROikS/B/dUtKH+h5tO5AFEuorScZ Q==;
X-CSE-ConnectionGUID: He616LdtR0KcK/u1NQ0K/Q==
X-CSE-MsgGUID: PyrvevDySsqKp0y1RyVfGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31570355"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31570355"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 23:21:41 -0800
X-CSE-ConnectionGUID: NnAf0FFCRyKIMsSb09E1rw==
X-CSE-MsgGUID: 1G1ZsR4MQt6J0bSVK5sD9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="119290685"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 23:21:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 23:21:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 23:21:40 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 23:21:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wy8Oe2yB6LO/zw9Sdrs96/GmASWbXOjhMgW2Vo56RgQKzzpo626pHgJjVau4vI+8QUHi/0H4BVdyDXn1J5J2rqdofe6/ZmMfV4PRlZMg/D1YY+8LzD0MdWi8+oIfrgWgNkM75zhr/UhMMDvgXBlps7nRTN2+3K1wXG4mRIZtECr/peYF04qLpn9OJ+5UzGbEE7StEpicrJ7PcGsjoXAJNuTQsfeO2+tq96kBIdpP2OEKC91WSo1u4QkVPDbVD7faRt8y9Pq70hM+9+ZBU2SeNk7YJxpA2s4KayATNyuLRCA1jbkJnIKoCQQaAYm/jcPH9kQVp8sx6zjS1LodfrO9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMDN5Ymqf9p4rNclUB45PM+rx/SotecyEKApzj8ugtY=;
 b=YRSnC/+aDwe+KlQ3jFvXQMxnfza0mKdffn46hiGBAZ8OZDN122lqlMz8YOOqaxQhap7rfG5uxgWCkWdSmfHPKkXTZn0doQK/bQj0StPsvDXhYvIxsnGTyZy+VZOLoPlRMYEDBrPwdpdrrAnH0cuP3iKHHvZ929T8aTSs9pzKDPmQW45nRf9Z0vQGcvsIlxmxD13fIb4xWd+OHKyzstm6YtjNt6cS0Y+cRyE7OwRpdJ6ECVZCy9iOy2EWsfy9G5Uu9zMVq2N+Zwq9DzzQ3Kx4W6bPT7ltxlYx1RnGd5VDL7bCzXZt9i+49xufoMrQLI1lXkc0ctVhk5+qh/4OQnxwhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 07:21:36 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 07:21:36 +0000
Message-ID: <88413a39-a949-42a1-bd99-6e66a6540684@intel.com>
Date: Fri, 15 Nov 2024 12:51:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/xe: add function to convert xe hw engine class to
 user class
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
References: <20241113045549.2390980-1-riana.tauro@intel.com>
 <20241113045549.2390980-5-riana.tauro@intel.com> <ZzY3d-NLOzlOsS5E@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZzY3d-NLOzlOsS5E@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB5150:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e98c674-23b3-45d9-dece-08dd05462399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHo1V3FDeWIzcnJILytlWUhWT2tGNW9URnlpVGJkTm9ONGl5TkpCTHV5YmVk?=
 =?utf-8?B?MTVBQmorL2JPRXRVV0xLMHpsNGVHMGFjeXRVZnF3TkM1MXBHalRuTHlhcU5S?=
 =?utf-8?B?bEQySTNaZHVDVDRDbUdCSUFuS2s1VUg1TW92Wmt0WnBwMzJiM2hndU0yM29M?=
 =?utf-8?B?YjJYYjFmczRJZzFsczhDS0NQMjhUSE5peFFhVWVwRTFJZjlQenRmMTJMd3Q3?=
 =?utf-8?B?TFBGRFRrTW12RDk2UEJiWkVuZWx1czZWSm5qTFFucVVwcFIrWE5nWERFUjVQ?=
 =?utf-8?B?Z1RJazhVa2k2T0ZGeDk4MVlsMVJxSWQ1TU9VcElxK2FxUElZRTkxS0txNk5K?=
 =?utf-8?B?emFzVFJaZE9vQk9jRjVWeis0VmlDRzdsa093Q21iM2JXRFkxbWg3cFRqaDFI?=
 =?utf-8?B?VHpwVmdaQWtKd1ZOMnJneFFMR1lDTExYYTBnazhmZWVua0NMbGdhU3ZOa055?=
 =?utf-8?B?UGpEOEVnTjlCNWk4TmxaTVFFQzk1NHc1WVV1aWoxeG13M0hGbmlqN3ZnRk1p?=
 =?utf-8?B?S2gwT1lPNXhCTy82Vkp4OXVOSENyMmZ6czZYMEdCaGRGTmFHRTBuRnIwMWV2?=
 =?utf-8?B?bjhGQVg4bUVMb1psQ0ttbm1HVjkvT1l0OXNCZ1ljc3BleFdxRVNVT1YyakRu?=
 =?utf-8?B?dkdjb0ZzS1BNMml5cldaQ0w5YVFqYmI0c29iOFJKcHdJeGlvc29vM1hsM0NM?=
 =?utf-8?B?d05pb1hOc0h6UThTZDF3QmZWMkpaRkNzeVM0S3B0cG1tdUFtL2J2QXVxb1Fs?=
 =?utf-8?B?ZFlzcklGSml3TjhOU2xjSExsbWZEb0g4SUZvbkpBVWdxdEZQYmRIaFkxTkEx?=
 =?utf-8?B?T3ZNSGxQVGhxMHhjcEZ5V2tmdG5CbFJHRER0Z2xSRkZ6bjhOcFFMNHlQRTJH?=
 =?utf-8?B?MTVvekV0V2N5c0wrQUJ4SXRyS21TMzlKOE1WN1VBdHVTeGRXN2h1K3hkNjNs?=
 =?utf-8?B?THdzTXpkd1l0NmhsTEx4SXJWek1rZ0ZJRndBUjF0R1dNTTBackVELzUvZ1gy?=
 =?utf-8?B?dlhaZkxiTWtHcFBaOFRCTjlVQi9CMTZhZTRrL3NacU5zRFNCWjRHM0xXM0xN?=
 =?utf-8?B?QzdiY0JXVXpiSU9yMHZ0TXBjTnBYN3VuQllSSDh5bTN0bXk4YnkzOXNiejZI?=
 =?utf-8?B?dG8wVVQ5c3poZ2x4cDJGc3duRmtUZGR1enNHYVJWc0FiaEhxdnZUcmdqejFi?=
 =?utf-8?B?akMyQm85RStrTGlBRnJTK3VsSFN6eDBrSEFzYWpQdFdjajFFeU85ZFM3NG9l?=
 =?utf-8?B?MnNhNGRKc21NYXJmT2M5c3BNVDUxeHlHT2tqcXhvT2VyMWRrV20rSTJUbDA2?=
 =?utf-8?B?STFxNWtDM3J4MDdWQlozajdDUU5EdkYxdzlab0ttSDI0bjVwQ2hISlpib0Vh?=
 =?utf-8?B?SWYrdkJnQXF1Q1Y0d2dEWG85eWwwcHNyR3RRT0xvamtGSHh5TFpDczlmeWVh?=
 =?utf-8?B?b3I0L013bE9yTDUzNGhaOXA1UDZxRTVDSEhuYjFRdmt0bGt3MDRMN2xvQzcw?=
 =?utf-8?B?VElWOS82OUd6T3JuK1VDRTFHTFJUQUF3dHlMZWZ3cEg4SjB4MStsT3pVK2h2?=
 =?utf-8?B?N1lVTitZdmZCa3BCSEhwdHNFc0F3RmxxVExMemQ5Rm9zL1VwK2JFWVBGeDM5?=
 =?utf-8?B?WVBJZTdRa3JuQVFXa1crQld0NGdPdUZsVmpYOXp6bWkrN2lKT2dqM1hjZHVD?=
 =?utf-8?B?MjFweTBEWE1FaU9zTy9ielVQa1IrZEkvNzlUTk1uRWZJRzhFaXA1T1hBc1NR?=
 =?utf-8?Q?FWLlUz+RP+4OYxwTcErCWGeUEYKR7/fenWS3w62?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1QrdFVORVJ4KzJxOC9yTmhlU2QvNjZlbWs5NE5sMHk5UVlrRnpCVFlJeGZ1?=
 =?utf-8?B?R245NXY4REhaWE15TjRQR0xXMzBVa3JPdExjYnpmczlzajNZR3lUbW9xU1VS?=
 =?utf-8?B?UTJBc0kxclRzeWd6SGJyUzFIczhQS2VwNTlsVE5JdWZZWDF6SHIrc2h1VlZ3?=
 =?utf-8?B?aDVJVW00THpKZ1ZuKzR6ZnhFVkc2QzFTTy81dEg5eHhaMWtSM1c4UXQzNmha?=
 =?utf-8?B?ekJJa1FMMEhqbDNxbmJhLy9BN0NtcHhTWGEvbnEzS09naDJmZnFIMC9KL0Fr?=
 =?utf-8?B?MnJvYW54QVEvRUJjMmxsOTY2TWJFWTFxQ2QrSUVpZFN6ZmlWK29sU1ltZDUr?=
 =?utf-8?B?ZUdYbDdHT1pEMEtucHFOSVlmZVBVY3hhSTlLUXpBU09oTjVFaHVEeEM3TzZa?=
 =?utf-8?B?ZzFOY1JrTEt1YlkzTmpZT2dPc2EvOXdtTy9QL3F4c215NUtYZ0w5UnlDQi9v?=
 =?utf-8?B?U2RFcXY1dGpuMHNOdWZGOGptVnNlbjRjWHRFVVcxVWowTytBTi95c1hVbE5X?=
 =?utf-8?B?MkZYdWV2dzNKZDNKUyszb0d6OHZzdnlzVG1kTWo2d00rWEQrcGh0Wk9ISWVE?=
 =?utf-8?B?eWp4ZERpSlNwTHhGQzVsNzJRS3VTWTFQTC80SG9ERXgyQkNQUlkrYUUvaSt2?=
 =?utf-8?B?ZnpnZ1JOZ2FWYUFHdUhLaGpJejNFK1JrcjlFZFVaOVd0VlViOFc4dldxQVN3?=
 =?utf-8?B?dzlKQS8rVWFkc2tvckVEdCtMaGR5Um50S2NHZzVIdFprem5kV25NL28xZ29Y?=
 =?utf-8?B?KyszRFJhVXpLemlDQTBIWjNZa1FYc0d2dXRBekdmcEtKRmtPVnBySDlESWM4?=
 =?utf-8?B?RW1UZmNTMTE0NGlBRGc2c0E1bU14SmNLTm11M0VSTkluSlNtd0I3NXZ3RVg5?=
 =?utf-8?B?c3N3U1VqZHNCS0RjSkIzNjJ4M2FsaFQ4ZThwYUVHL0RSM0h3V25DSGt1UkFU?=
 =?utf-8?B?aFI5ZFN1ZjNIRlgreE1yK05Ca0xPemlOWERKYXBxQmRRU200SDFDOVlNSjMr?=
 =?utf-8?B?V2JxUHpTMFRhbU0rdjlhM2g1bHdMNW5LSXN2a1owd2tDZEV5dVdRK2xKRlU0?=
 =?utf-8?B?TlFUeTk3bjB6djlsY0YyK29hVHgxZ1VQcll6NWVQcVFEU0IrTXE2Qkt6N2tw?=
 =?utf-8?B?b0RpYjlkWmFveU0zbXpjdU0wbDhpTCtHZWNvdkRVbEQ5ejh5K20wNHhwbVVS?=
 =?utf-8?B?cWgxbjkvTlFpZmlzRlpCTm5xNERuWk14KzBNa2cyK0dGV3RObUo2aFRCMHRI?=
 =?utf-8?B?c3g5bkNCRFhNc3hGcmVwR05tKzhTcktaWFNScnA1R09rMWV4czNEMTZXZ2ho?=
 =?utf-8?B?SkFMTGlRV3JtQmJqUkxPTEdJUFVHalcwbHZPNmV6OG9XYzM1UFdJOVZ3WDls?=
 =?utf-8?B?eURHWjBTK1JOTnV2Yjk1Si9uL3V2M085bVQ2WmVEdE0weDZISWl0RTVUTUNT?=
 =?utf-8?B?VDU3T2lHZE5aS2tBRXBFajI2SHQyK2Jvc0pxbjNUSVBpQjNNN05ZMy9qZm1y?=
 =?utf-8?B?M3cwbDY4Wjd0V3gwNnBCelhEOWJZQUdJVnRpVjcrZXd5RThZZEFDU2VzR0Nm?=
 =?utf-8?B?OU91d2NyRGIxdHRmbzZldm9iYVlFYnRVcVEvZHl2Zk9MYlhaaFRHWEtVWEpP?=
 =?utf-8?B?RHphY1R3K3NiSFpub1FPNnNCTkZUN284NkxIQ2krL2RIcU0wWWc0aFZoZStx?=
 =?utf-8?B?MktwdHBjc3hyNVJnU3hyRWZUOTdvay9Hd2owSkw3b09oYmduZnhIOFNvSXpJ?=
 =?utf-8?B?QVlrMHAwRU9hU2NFWE5NNW5QbnFxbC9aRWEyVHBQZGZuT2xBcndPaEJrSGVh?=
 =?utf-8?B?eDBvTVZSdUZ6QW5jN1k3SXpNUmpMV3k1aklXODl5U3JvT0pCRTlhVFpoUnJv?=
 =?utf-8?B?K2MzVXJUeGl0dlJqdzlINVNHSHNSL3RDZUZpRC9tMmtNc3JHSzR1QjZHSFJM?=
 =?utf-8?B?NHBJdkdpaW1oWnFZVysxWnVScTMzMjdEcHdyTDllb0d0R0V3Z3h3RzNGV2V4?=
 =?utf-8?B?Y1BkRHJ4TDU4M3krTTZBVHBaUlZxcVRlRm5WeDJCSmRFVkw4aXozaXU5elQz?=
 =?utf-8?B?dVBleVRpRitCczJIaWphdFVKQTZEaUZWaUNYUzMvK2pJNUl1Q1pCdjFodFhW?=
 =?utf-8?Q?UQdo2YxTjwm5XNXIU5xjckhMX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e98c674-23b3-45d9-dece-08dd05462399
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 07:21:36.3360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KHdTaA57cXttxWquuCUzmhIaBo5cTsBYoz7d/hbFVcvVAtCOg48gBpWSUdKlxy72Pk9e6l59xrskvc3y1Nd3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5150
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



On 11/14/2024 11:16 PM, Rodrigo Vivi wrote:
> On Wed, Nov 13, 2024 at 10:25:46AM +0530, Riana Tauro wrote:
>> add a function to convert xe hw engine class to
>> user engine class
> 
> a bit of why would be desired here.
> 
> I noticed that it is now used by patch 7 on PMU, but some words
> here would be better.
Will add details here. Added it to hw_engine to avoid duplication of 
code in pmu

Thanks
Riana
> 
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hw_engine.c | 25 +++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
>>   drivers/gpu/drm/xe/xe_query.c     | 12 ++----------
>>   3 files changed, 28 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 1557acee3523..ba40f2692f34 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -981,6 +981,31 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
>>   	return NULL;
>>   }
>>   
>> +/**
>> + * xe_hw_engine_to_user_class - converts xe hw engine to user engine class
>> + * @engine_class: hw engine class
>> + *
>> + * Returns: user engine class on success, -1 on error
>> + */
>> +u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class)
>> +{
>> +	switch (engine_class) {
>> +	case XE_ENGINE_CLASS_RENDER:
>> +		return DRM_XE_ENGINE_CLASS_RENDER;
>> +	case XE_ENGINE_CLASS_COPY:
>> +		return DRM_XE_ENGINE_CLASS_COPY;
>> +	case XE_ENGINE_CLASS_VIDEO_DECODE:
>> +		return DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
>> +	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>> +		return DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
>> +	case XE_ENGINE_CLASS_COMPUTE:
>> +		return DRM_XE_ENGINE_CLASS_COMPUTE;
>> +	default:
>> +		XE_WARN_ON(engine_class);
>> +		return -1;
>> +	}
>> +}
>> +
>>   u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>>   {
>>   	return xe_mmio_read64_2x32(&hwe->gt->mmio, RING_TIMESTAMP(hwe->mmio_base));
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>> index da0a6922a26f..3aca7751a482 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> @@ -74,6 +74,7 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>>   
>>   const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
>>   u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
>> +u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class);
>>   enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
>>   
>>   void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index 170ae72d1a7b..98b036678eee 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -26,14 +26,6 @@
>>   #include "xe_ttm_vram_mgr.h"
>>   #include "xe_wa.h"
>>   
>> -static const u16 xe_to_user_engine_class[] = {
>> -	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
>> -	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
>> -	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
>> -	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
>> -	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
>> -};
>> -
>>   static const enum xe_engine_class user_to_xe_engine_class[] = {
>>   	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
>>   	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
>> @@ -206,7 +198,7 @@ static int query_engines(struct xe_device *xe,
>>   				continue;
>>   
>>   			engines->engines[i].instance.engine_class =
>> -				xe_to_user_engine_class[hwe->class];
>> +				xe_hw_engine_to_user_class(hwe->class);
>>   			engines->engines[i].instance.engine_instance =
>>   				hwe->logical_instance;
>>   			engines->engines[i].instance.gt_id = gt->info.id;
>> @@ -677,7 +669,7 @@ static int query_oa_units(struct xe_device *xe,
>>   				if (!xe_hw_engine_is_reserved(hwe) &&
>>   				    xe_oa_unit_id(hwe) == u->oa_unit_id) {
>>   					du->eci[j].engine_class =
>> -						xe_to_user_engine_class[hwe->class];
>> +						xe_hw_engine_to_user_class(hwe->class);
>>   					du->eci[j].engine_instance = hwe->logical_instance;
>>   					du->eci[j].gt_id = gt->info.id;
>>   					j++;
>> -- 
>> 2.40.0
>>

