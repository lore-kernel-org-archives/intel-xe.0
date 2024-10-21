Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D8ED17143
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 23:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A765E10E27E;
	Mon, 21 Oct 2024 23:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IkoZltd8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC83010E281
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 23:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729553202; x=1761089202;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rhq5NUZ6EJfpYcjy1u7KCDZuIlxBkrR4LFSB81aJgBY=;
 b=IkoZltd8kq0xMrRQEQnJjTG4Trd9zOuDmvHzsRjjY1SOj/+4il+t2Ict
 lJb8PF8gF8jh5q0TeNwZYZZHAHRlwmIJtELyIF28fGo/EHsQKGN4aTYAc
 Ktd+36mN3pWAAD8Syrfz7uvgw8QdV/gv7J9l7d1WGDcmuo2YJcujoLrLr
 tYeXlecvUayMlEI6qsh+gArLFVYWCkYgOEaI2WNM2cGbqLDlgetecado/
 ZIOJ7fjcS2kxEskG1WhDFvC14SMXwD77BfUUh6geTMvzTgo6kC19DvCKc
 lghZhtKL4JD/mbL921driioOJA4k1NRyJiVi5N9+0L6H7eSqUvsfCDoTb A==;
X-CSE-ConnectionGUID: 8FxdzubwT5esnrvmRHUthg==
X-CSE-MsgGUID: MRcnG5uwTzKbokH4ZCgupQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="40449851"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="40449851"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 16:26:40 -0700
X-CSE-ConnectionGUID: /fZLjTH6TOKl2BkTyLkTHg==
X-CSE-MsgGUID: TuMz5oTgRiCCVeBePbwcUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="83680066"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 16:26:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 16:26:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 16:26:38 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 16:26:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqWpPFxv60IyFsqGbwmxTBAy3byOtV5pVYavrGAEKLiBxnwJUTfIV0/MSXL6fRdcCySD9dA60+y2IWxbMr/H+gyi6xiUP5JMTGVxOpmYStvPuPrJw8ezTY1pLl6bCXD+Kl3oMNJC83eufsqpTPhpqcwh+X3WfMThpkzXlPN9me+8QvIyd25L9aO5M27+5EXnRTDTL9L3tH/RoSAPc0jG82mSjr0VEvC7SyQGPI8KqwP8hL1qUALky3xPdHbyC/99PatUO12q1+KH2w71PQiNg2hsJh5jPXgomDfg8kurauzHFokR/DSUMdz0RvL4YR1MN6I7adA8CpdpgVyixgR2dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmhmbexPhHSF7Gffi/UZCFtGn8qQRfZ1VF04wpeF854=;
 b=axJt8ED+Ya9uyvA6hCaGfbYW0VP320oAIPoDZNsbEcKTpfmqRn2nzj+rMifmZZ9H3fJ71yruqvZCpFs4Ka5J+Ly3F6JWr+QjJSMKBHtSl3pxO55lTLtF2FZ7AO8U1tvGGDlUD2juOdpPycWgu+rKmUvNFXM0zUXSgczvCC3a1+Pu/KEiUEnxmzB2WNPUUopYXZW9n0LJpx54pg2TTJSpq4QUPKp0tToBWByu0XKhFXJrTLxfFBPoFic++t1YeDkXyIbkhGT0MPhAdPZF8ZiJVR1bHg1yzT82OJeb7YOEWUt5G6aWmiSsafaWOEg5dmVJafexpfcQ1nsbBEeyBCodBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 23:26:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 23:26:35 +0000
Date: Mon, 21 Oct 2024 16:26:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <john.c.harrison@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] drm/xe/xe_guc_ads: save/restore OA registers
Message-ID: <ZxbjKehYmgu52EMn@orsosgc001>
References: <20241021222401.95833-1-jonathan.cavitt@intel.com>
 <85a5ex2gr8.wl-ashutosh.dixit@intel.com>
 <ZxbheaL0nzSZFTM1@orsosgc001>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZxbheaL0nzSZFTM1@orsosgc001>
X-ClientProxiedBy: MW4PR03CA0144.namprd03.prod.outlook.com
 (2603:10b6:303:8c::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a2efaa2-84f8-46a1-e480-08dcf227cdfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eG9mUG9mbzNLZkk3dW5mN2pGN1NRa0lhQWFYYkY2b29vWnluajA1VEt6dDBY?=
 =?utf-8?B?RUZBOEc3bVBoZW5wUFYyWG4xUWdSakVhSjFnSk5WNGgxaDlDTnZJNGxSUFhL?=
 =?utf-8?B?aG0zT1JpN09ibTZ2YmpZWCt2MVRKcm84S3hqUHZKVUliVERpbm5kSHlDdGoy?=
 =?utf-8?B?eG4xU21Fa1c0aFFhMVBRTllHQVRIa3dCNXpucThRYzRmTTg3VFFoT2pGbkFn?=
 =?utf-8?B?TWRKYmRCcUdyYkZKMkhkV3dUL2ZjK001eDRQWjJXMUJWc2dGbmFjOUtYRW9u?=
 =?utf-8?B?VC9oV001RHpnWTRoMUVWbDd2SzZaeFVKNXVuNU1obWUyTXhpam43ZEdqTDRs?=
 =?utf-8?B?cDY3aFAxUlJmUFg4T3h3cngwUFJGNEM1dkVXS1AyNlRWZG1vZ2dVbkVwOTQ5?=
 =?utf-8?B?eUNZNWRyRXhQRVBNMXFOR3ZRd3JhdGVDYnJibzVvdmR2OUwwYXFKS2o2TUxh?=
 =?utf-8?B?ZmhRQTVJSjBNUnp3UTByS0tKTVlxejQxeFkzd01yM1k1LzlpSTFhR1BGdTBS?=
 =?utf-8?B?cmtEcCtoeU90LzVsU1I3cUZJbEpIVUR6SjRibm0vcWxnVnAvdFByOGEvV3NM?=
 =?utf-8?B?aVhDSXk1cVRaWmV5ZjdTS20yU1h4ekowUG04ZFlZNHFvVXhBZ254dXZnTStk?=
 =?utf-8?B?TEdCVFcyRHJCKzFpU05LVm5UbDROd1Qzelo0WmI5VllieFJGM2o0UE5XYS9Z?=
 =?utf-8?B?MmJNRTdVZkVmdDFyNjZHM2hIRVlSMEluQ043eFBtMnpmRzFlajk3VEppTjRz?=
 =?utf-8?B?bnJKZ09mTTRqaldEeW9VMlFsSjVGR3FsQ2taVzMyUUl6Y3VTOVJmZzA1d2tG?=
 =?utf-8?B?c0dMV3lzOStxMTBDNloyQ2pKcGhEWjg1SjRxWDcyMExVRlR1UkRCVm1IdE1Q?=
 =?utf-8?B?NzA5NFRXZUpVK0U1ZkNtZmF2VkdDUTZsQURJWExMNFdzeTBReEhsdGVSZWpt?=
 =?utf-8?B?MHNtZlNQa0tSUi8rMS9oMW1SNFpTekdScHN6QVdZcnhobDltTTBkcytMaTI0?=
 =?utf-8?B?anZLVHFsREltOU5leDJxWndXdDUzYnhTcVhiOTlYb1BHNGk5MmdsQndhYmdv?=
 =?utf-8?B?UGZheUt2ckdYbkdlNElHalU5TXIrbFBET1J2REdXS3laTkxxUE1TRXRlTkda?=
 =?utf-8?B?RjhqUGJKOTlHbWYyR1R6NTREUHBsRG41eVV3a2UzVUxLeEs2RWhUcDhVY0Q2?=
 =?utf-8?B?NXBiRHUvRGZib1o5c0hkRjByVk5ZTUVORE85N0UyMXA3ZHVvbWlFWnVEVUNh?=
 =?utf-8?B?cUphMksweGNkaHNSd0JwS3VFR1Nna0xrQmJlR2VJc3MvZGJUM0Q4ZzEwVDBR?=
 =?utf-8?B?NVA2TE5ndlRWUUo0bVh3RGcycFpFRmNGY2k2c2UzS2dVNmRSY0NycUl6TDZV?=
 =?utf-8?B?SWhndFo0NC8va0hRUmpCcmExaVVSQnRQM1NncTVPZlo3TEg4ZCtnU0IvTjY4?=
 =?utf-8?B?blZ4M1REYXM0eG5mcWN4RTRnTlNDOVE5OGQwdld4T0VZTDZWeTFDdTNYMFBY?=
 =?utf-8?B?NlZKQlVVUlhiVkdVUFMxRGMvNHJYbGcva05GNkhUSnBRTklwVzBUZXVFU0FP?=
 =?utf-8?B?Si9SS0FnSEE1ZWZuQ2lWOHo0OHBjTkNJeTNDbmdGVEtJemozL2VUYzd3UVAx?=
 =?utf-8?B?OFRRUGRyRndBL2JtdDRMYWxwdTNud0R0bW91U3Y4RENOb0ZBWGVXcGlmTmVC?=
 =?utf-8?Q?A0PtXe46JWh7fmphl4tf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzMzRVhxQUlqSVRVaDBTUURLeDk1T0pKSGJlYUhIQ2t4RDBoME5NSmNucFN5?=
 =?utf-8?B?SGVvM1VZL28wUktYcnZ5d2tGU2ZianpiUnVYVlRQVld5Z0ZjWm9nOGQvU1FS?=
 =?utf-8?B?akM5aWcwRVNzVWVZVEJQQllGUWJzbkpTZFVQRkZucHRzK3Q5U2hFZWlDbkNW?=
 =?utf-8?B?QXdieXFiWlZOVnNoNTZkWFZoL3F1NkhVTHV3ZnN3MGZaWW1JSjY1ZitzVFUw?=
 =?utf-8?B?aGtmMllvWDdQM2E5WlgwMllrbGlkRmRDYURSd05BdWR3NGNHRmNweGFEQUht?=
 =?utf-8?B?UG1Ta0tHczV2MzlybGhFZUowbDBrdnhYY0JSYnh4R2tjTW95WExTdzRkQ3Ev?=
 =?utf-8?B?RDF6UytrUGVmQXZDSmtHcjZtck9BMjFGUHN5T0hhdFJVbHRsWjJCZUx5RytL?=
 =?utf-8?B?QVU2eW1UcTI5RVpxell0SUZFby9PUENraHVVV09samMzdGh1TTF6TFVFbGhI?=
 =?utf-8?B?N2g2Wk9DMFFYVzJtTkgrZlpydGJBRXdTc0Jrck5xalJhSXQ2N3VkNXpzeVcv?=
 =?utf-8?B?aE0vcDdBUWIzNDd2cnhHZ2FyTFdVUDYvWGdNQUFiZ3lDQVpNemcvNUZ4UnhD?=
 =?utf-8?B?MVdVL0lDenNlY0hzckxicHkxRjdQbVI0N2pudXduVlFHcTA1b3oxWmhweS96?=
 =?utf-8?B?UkgwaXR3NEFkcnhqY1lONjdUMlJUU1NjekR0MHJWb3BSNDd1ZVF6SldpQmFS?=
 =?utf-8?B?S2k5cjRhU3pIamlnY1A0czlpOGxMVVova0lQcTNGalhVeERFd0c2cVFkbDdh?=
 =?utf-8?B?SlN6eXVJUmJDZDlWOTZvUHluRC9IMWZaTTBKblBlUEw4RnJWdEV2Z3NVMXJR?=
 =?utf-8?B?S1B6d2JJVFZOQ2Q3NjhTWFd3WHRSRndSSTdVRzI5c2hOQWh5Tlc1Zy93Y0NT?=
 =?utf-8?B?NUlPNGc2UkQ1bi83VzVIWTQ2WFgwclFRTGptek1zMW9LbjFoY2dTUmtsWWhw?=
 =?utf-8?B?Rnd5WEg3MEFFa2UvZ3FVZkdoNlVFdU5HVnZiUTBwcVl1Z2JJTjlWYzNwOUdX?=
 =?utf-8?B?bUNZbExaSHZEVG9OR3JFWllWR0s5ZHZaTzU2QUVHejU2RmdsL0R1ci9nVDFJ?=
 =?utf-8?B?b1lSczhXLzhZV3c4ZXNJK09OaXBsSy9hQm8wbWdVQXJHTGhCZUVBdmliYzJm?=
 =?utf-8?B?cmI1aHF1cjd2RzBGeTFoeWRGeE95aHd6b1UwVnVJNytPb2pNS0V5N2RpNVB6?=
 =?utf-8?B?a3IxZXNHcGZBRE9wSXJOSXZLVmxqL3hBTlpJQ0JwU1Y5N3RrbjBsTEVncVRQ?=
 =?utf-8?B?Y1UwYnJkclZhdzcwcDZleUNpNHlJa3UydTFYeVN0T29hd1BoRk4zeTN4clM4?=
 =?utf-8?B?WmVaVjNJYnpSMFI5azM5NzM1MGYyZ0g1MjJoSlBuaGdWTTRHdE1sM0Rnb1Q5?=
 =?utf-8?B?NUNWRWFsR3M4akVzK1NBSHA2TnNSb01MWHU1aWM1YWtadlRnUjhNalJ0N3A0?=
 =?utf-8?B?OGVETzM0ZmFISytRbHVXb2NjeFFCRnd2blRjLzE1TFJRanRVbDBiaWNyOGl4?=
 =?utf-8?B?QXhxZjF5REpuejhHb2tOOW9zclh3NmJ6c3Y2TWttZlc4SFJzZmxFdnlBVDJC?=
 =?utf-8?B?VWJGRUxqQUlydHUwZGtIYnNXSysrOXNvdlNUc3dqcDd1emxSRDA5TzBiQWsz?=
 =?utf-8?B?V1VaSzA0dk5HYk9abTgrU3ljU2c4OStGVTVoN0dYYlMwbUZPTWNsbG1IU2xr?=
 =?utf-8?B?WVFYRjZJblBWODRHTDRkK0FmakdxYXZPYWdoaHNWQVNzRXBEODRidG42RFNu?=
 =?utf-8?B?U29SQ1RKMTIrSkJ2SVhyWmphL3puOS8xZ2dYOUZXQ0tydU5Db2ozc2t6bU1P?=
 =?utf-8?B?SXlXOVg5ODZQVVpuVkFjckc5L0lpN25qK3h0ZFBseHRPWGdQSVdDY3B4RnlM?=
 =?utf-8?B?d2pCdUp0dXNySkhURFJFWFlTSmlhejVHWnRoV3BYeXA1VmtDbEhRbFdUUlhr?=
 =?utf-8?B?SWpvbVZjVXBEa1J2NjlKdUlZZVFvbXV3YlZ3UFBCRStzTVEweUcrWVJXaTRo?=
 =?utf-8?B?NnkwM1hFVU1iRnUvZGRxRG1YRXQrVmQvY015SWVVcTkyeE9nVXZrRkRqVWhP?=
 =?utf-8?B?ZkpaYSsvVDhScEVIc3ZRRWpTQlhLNUR4alRWZWZ2WUNoNEF6ditBdW1hREtV?=
 =?utf-8?B?eWZ5MThEODl3K3EwK1Z0cGthbjBzZGpGdG55cVpYeFRhOTlSenBDZ0l4SW9n?=
 =?utf-8?Q?sYA3/upoT7UTsY/JLfmHoY8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2efaa2-84f8-46a1-e480-08dcf227cdfa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 23:26:35.4540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38YC4VhqhtA19oh82cQ8kOrL/jCFyEwETCmCoJ+0GHXZ031a7CvLj4C1vGjvjle0mLnZxyoaKCz4NgOwx5Uix7ju3c4RyMUPeyZ9dYB0w14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
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

On Mon, Oct 21, 2024 at 04:19:21PM -0700, Umesh Nerlige Ramappa wrote:
>On Mon, Oct 21, 2024 at 04:11:39PM -0700, Dixit, Ashutosh wrote:
>>On Mon, 21 Oct 2024 15:24:01 -0700, Jonathan Cavitt wrote:
>>>
>>>Several OA registers were missing from the save restore list for GuC and
>>>could be lost during an engine reset.  Add them to the list.
>
>Thanks for isolating this issue. Just a nit here:
>
>OA is just one of the users of the command streamer allow/deny-list 
>regs, so I would just reword this:
>
>s/OA registers/OA registers and allowlist regs/
>
>rest looks good,
>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Responded to the wrong mail. Addressing Jonathon above.

Thanks,
Umesh
>
>
>>>
>>>Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>Suggested-by: John Harrison <john.c.harrison@intel.com>
>>>Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>
>>Thanks for chasing this down.
>>
>>Think we should consider this a fix and add:
>>
>>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2249
>>
>>And also, maybe,
>>
>>Cc: stable@vger.kernel.org
>>
>>For that we may also need a "Fixes:" tag?
>>
>>Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
