Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33785C83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 05:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FBC10E2F1;
	Tue, 22 Jul 2025 05:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKIovo7O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DEB10E2F1;
 Tue, 22 Jul 2025 05:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753160441; x=1784696441;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Cw5QNH7vInEaB4zbXpCNo1+UXEovESY+xHpGjIvz7Q8=;
 b=dKIovo7OltVCfcs7ROMnOZL8iIHeLblSbgs6qMmR9Dv7THYaYAD4Vod/
 OdNvoLI8vhb9Z8dpc3Z2wb/5Ouao3ciGIhcnW3uM//CbF4TXiWIt/TTCy
 RPSCoaWJpDlS2E92gvJZ1/uJwr2GXEXiFqy2qpaOHWdj1Im5KYTP2c9hy
 8BXf7MSwpvrxcJb08msgUj+GsCzG9N7TkaZbox1xBvCilGAaBz7Qk2mhy
 h/WWtamjmbWUSE8RIHuDI7ogFFDqnYELtc7Q44bsYps7AGK+DYJTyeiwM
 DfJX9ADGasnjcx4wFylO4OO5gsplMvjaGi5Gk3UParrvhiGPhpboSOsLM A==;
X-CSE-ConnectionGUID: IvR6AtoXSq2rDLzDe4A68w==
X-CSE-MsgGUID: buzLSGdlSHOVZAN9PzonGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55274395"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="55274395"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 22:00:40 -0700
X-CSE-ConnectionGUID: F/YVqSkbTfmMd9DbENWt1A==
X-CSE-MsgGUID: VwyXEYtUTiqo139Jk9fbhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="158329139"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 22:00:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 22:00:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 22:00:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.66)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 21 Jul 2025 22:00:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVE41M6M9Q4Efu+UrF8GTfy4ASwrnyE/hL5DEE7I5pFzU75ankIBsKuznerfLoJJdU6atZcHEQi11dFkDnguAfAI23UWMts0g/s+cOutNU5isig1+S8rItRf06H9dnXLA3sqmZ1VJtNS0YoAlR9Fl+cOze2zD6G1dHBb9esbn0UY7oZHPDPIxbv3Aw2n/wb7Q4abnZpXaoX5f1gp4lXMgryKkQLMc4hYWH6S6lhx/TwdrLBaEoDsIUVKXe9IzYcBzA/oxetqUPPN6zyHt2Chd2Xz9vs9WYJd9EXqjxZfc20+5t5l3papLiy9MEYwGeGJRHEnNvYlkffAzA4I9MXX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtQRY1OhsJgOixBLwWO3wRc2KudIApiwvtQmtx/FcXc=;
 b=iMAhag+oTzmwNaAlaQs7pszZUOCGgEPGoUqDvDW8SsKmEdOQu2xQW2jRiXJCDYtBOeEMfB2iwcX0gEraXrlhynOhgnXi+kYCkl8yDk4laUftHY9ZJ2kRpYj4XaZK/QbURi8Euvo2xZUlgSz9Ey9SyxKBGly5e8b4dIiVGfsCu3TQgCgsa4qAF9S4eSs4Ta60EYG7oDo89hNzI17507k0tYCW83AZc7wXi/4xVrVc5uQib1iYqbq7GYzMRoLcVw8KoMO1eRGuWS99DZd2CL2b+jx0UC8I6c5F4E3HskiHuC+FkdV5cE50V50O/3hpf3oku0sEvTYwNbd1k72637ml9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by DS0PR11MB7214.namprd11.prod.outlook.com (2603:10b6:8:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Tue, 22 Jul
 2025 05:00:35 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::e656:9300:fc6a:1b5a]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::e656:9300:fc6a:1b5a%6]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 05:00:35 +0000
Message-ID: <3672948b-ead9-4d52-afaa-7be4516e8f11@intel.com>
Date: Tue, 22 Jul 2025 10:30:29 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/disp?=
 =?UTF-8?Q?lay=3A_Block_hpd_during_suspend_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20250717085425.1347043-1-dibin.moolakadan.subrahmanian@intel.com>
 <175314248418.178049.4560696387843445831@1538d3639d33>
Content-Language: en-US
CC: <I915-ci-infra@lists.freedesktop.org>
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <175314248418.178049.4560696387843445831@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::6) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|DS0PR11MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 7abb2211-7b6c-4689-7ede-08ddc8dcb180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rmhaai9MQUNFSFdvaWlDSzE4b0JPbyt2RXdzL0RQcnFaWDRUNE5DU0RCZ2ZL?=
 =?utf-8?B?cUNvR2szTGtxcVRiem8yNGZZRk8vbm1pRTdVZllXRnVSVmowU3BMMGd0OGxL?=
 =?utf-8?B?VUpza2ROaXp0YUVBOHp5ZFZHc0hwei82NGpNMXArQkc0OUwwWlBFbzJMeEJr?=
 =?utf-8?B?dEdUZExScnh0Q2dwNnJFUFBEUllXaHlDNjBtdjR6L1B0aFJQenRTV3dGTE1R?=
 =?utf-8?B?a29xN0N5cTI4SWFlVDdxUGsvbnErK25Ib2dkS1hzamh0Kzk0WWREeGJGelNU?=
 =?utf-8?B?c1YyczJGNnM1NUNnL0tPNDR0QzJDOEVIbHJPVlpJZVlkUVdWbTd4bUlYeEFt?=
 =?utf-8?B?NGpCakY3eWp3TDFKYllzak9tOTFZVGViMTh1UE9xK3NGeURnRUhHVUUybVRV?=
 =?utf-8?B?dnBySGMySy9IWjM0eXdMaWtEc1ZUOXpMa0pLOWtxZmM4ajNjQU0yWGJSZE40?=
 =?utf-8?B?ZHloMTlPRm9JTWphamlZTGlkRE5FVm5UYTZYZm16VFVGV3BnVDR4enRJTDRS?=
 =?utf-8?B?d1k2eklETHkzZ2lKRTZBaUxyT2NUeUQ0NUFEWWk2bFZsUmVMYVNhSW5tZEhE?=
 =?utf-8?B?aytpdkxSVkg4eGtQbGFOYlg2bWpYRjBFSjFtanhPTlRLQ1FOYXdNWlZVM2w0?=
 =?utf-8?B?eUtuQ2s4ekR4OE40cVl3UDB5QUZLSm5QQ1M2YVVxTkp4Y1ZNUENZUmxLOGhP?=
 =?utf-8?B?a2Rpd3hjOTRuQ2RxdUNzNWFkSjIybGxOQ3NIR0RKZk5aUG5TenRNNGhGcFRM?=
 =?utf-8?B?dWt4YzN3Uzh4NjQzZlQwTTFQcHhwQTRWQTNuTXhIUVJERWZMZ1pEb0Q0b0g5?=
 =?utf-8?B?MUhPWmplWXN4dVlzRm5LekNTUXdmd2ZwYjJQcnQ3YytIZTE1Y0ljampBRTRP?=
 =?utf-8?B?YnZWaCt6cFE4TmVzOWZuZmk5OXZvRmUvNm4xZHF6dENFOXVzNytQUmVYYVc4?=
 =?utf-8?B?cVdqQkkweVhJaEpWUzJKQ1krR1BIRDBXa1BWVFJIWWNuNjFvNmJGeFV5K2dl?=
 =?utf-8?B?azNzMzNHWkk5MForZlZYc3hNeUFtZFF4b3pzelp1SStWTFVYVTJKQjNTbWxS?=
 =?utf-8?B?ZjF6MzdUOWFwd01vbE80VkdSbTR2TmtOUHYrTFhGTlBFODVHVXV5UDdPYVJv?=
 =?utf-8?B?Q0ZzTExYSmZJdDB4R2RxZUU1VDRvL0dvaVlXN1pMd1J3OERBeTFWSFVMV3gz?=
 =?utf-8?B?UDVXa1pnVGxHeitHWnMzeTB3ZHhMYnFEdVEvVzVMTVZwZnNMU1c0eGxtUkdN?=
 =?utf-8?B?MFJ3ZXZRMzVNR1hSa3djenh0YU1hazZvTURvc1RkY3d6TUExOXV1LzRBcFJv?=
 =?utf-8?B?ZXg3aDFscC91WitFU0JlQ3Z6QjJGL2xEcWh3RzVpa2ZuYTlLWkREUENqbDl4?=
 =?utf-8?B?TmMxSkt2TDh2U29BV2IvRDgvVlVLZmg1RWl6bEhGcUN3MUcrUXE3U25QZFBm?=
 =?utf-8?B?RmZZNkdzU0pmdEVlYU5GQ3JCTzBvZzhOTkZYbDh1Mk1kc2tBUU95RG5NbFA4?=
 =?utf-8?B?Tmg0U0k2RjArendDY0I0NlVYOFB1bFNpYlRlNDNvM1NYU1ZzN1dRZXVoZ2pC?=
 =?utf-8?B?aVBIUU9RcXZiRTFudFN5eGRubmd5V1RJQVhmb1RsUG41eTY4N3F6QVZVRjQv?=
 =?utf-8?B?NW1SUjJSY2ZLYTV2MHQrZHJ3VmdSdEp0eEZWRGRrNkpRYnpkQVlrSkIxTGxZ?=
 =?utf-8?B?dXZSeXhvdTQ3V1MrRGs5V0R3MVU2cldBc2tFaURtMGd1clhYS0hEZVJRQ25n?=
 =?utf-8?B?dEpHdU5SbVEySFN0Wm92WDZONFRxdDliMUczcjI5WHNDOG9MR0JXbGpGdXhE?=
 =?utf-8?Q?+tg0BJf//A4AU5VnuLO+l4i3vVo4ln0DaYZiM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHEyUkVlajZ5emdUajhQeHpjR0w0N0FvMmRTTU1XejdqdjZ1VVcxSjNhUVBr?=
 =?utf-8?B?dnFaZUZDUVd6MU9MSndYWmlSSmdDaVByWm1OSlFTOUJ1dTQwM3dXSmp3Y0NM?=
 =?utf-8?B?RDRTVnR1eURacnVBekkxZmdhWmQweUk3b1NqdE1Wd0pvSTkzSDN3M1gzWXJD?=
 =?utf-8?B?dUM5dVMvdjFjK0NmNDdWQW83QlZMSlZMTGJ3RFE1VEd1U3ZIM3EvSnlZSUlr?=
 =?utf-8?B?U1haLzJkejNUa2xZVW5peGdObFlDcDNzN2IrczE2SXVHQWdBL0VxYVBCRElr?=
 =?utf-8?B?cEp6WWRWY0RKdDUvTkpxQlVOU0lncUxWZ2t1Tm8zNExJcFNBSTBUdFBCbkNp?=
 =?utf-8?B?M3BpajdQSmxFYndlaGxxeWtKQU4xamtObW10OTRKd045d0FUcmszaldEM2kv?=
 =?utf-8?B?QW5kemRsRVVFeWtpdGVKVXpiNlhMbWEzaFBKNDFFSTA0ZTRnME1OWnlRakFv?=
 =?utf-8?B?MDA5WnJWQ2lQbWpGZTRVZHUvOXFoeUlES2N4cTJuclJkVmdHWkg4QWQzb3BY?=
 =?utf-8?B?dktKZHdiSlFYdE9nN1lBZ1JsWTdMYllZakRYUk1FVWlPWUVRQThTM1Y2OUtY?=
 =?utf-8?B?UG1Wam1XeXhhNGJwcG9JWjYvdTc0ZTcvUCtCUHJZb2VieEtyR2VsbWNycVAy?=
 =?utf-8?B?eC8vNUwwekU3dFlzVWgvWHlPTTl5aUpWNkZCcDdLdWZBT0M3c1hCVnFDcWJQ?=
 =?utf-8?B?NCtNeCsxcDhxM2l3UDV2WjJlTnV0NVVJcnhSYmRhWWFXOWUrcDgrWEdNZFov?=
 =?utf-8?B?a3hlNEo2NUhCZ2s3V3crOU5pbGF2SzlHc0sxNkk1eGliSkRxMjdhSlIycE5l?=
 =?utf-8?B?Nis3clhPSktWY0hMdlMzUXRtUytwT1dQSFpuekVDVGcwRmpjVDB2QVBHQXB3?=
 =?utf-8?B?Si9vODJKUXYxWEhmQnZTVU5yUFM4VnVwNVBMb3B3UlRFMVI5WEsrZVlWMDRk?=
 =?utf-8?B?N0FMQXc5Zmkxa3RQU1dEc253Tm54VXhZNERMMUZtNGdhdjNBRTQvTXlvTUln?=
 =?utf-8?B?RFlnKzBwSFRDOVJrYkpSdVhTZ0pWbU5uZ09IUkJGeTgyMzQ2eEw1amJiZWZr?=
 =?utf-8?B?MlNKN1NFY1RCRy9vQWpLNXN3MUdqRG1RQzJlSXZBMWYxZnBhUFJDSTRpVDM2?=
 =?utf-8?B?RC9sN0xYbnhOWFhOb0lqR3MyelcyYzFNdnFiMGphK053aHVDMUtnWXJibS9U?=
 =?utf-8?B?VTVXaWxyc2E2bzB0cjlBTDg3NzdZQ2VESVRHNGErMlM5c0lVb2JWRjJtNTJD?=
 =?utf-8?B?b1hhdnNteEVxNmZER3BjZmRQdnlBSTJia2hlWEdhR2Izd1NlRVlycUlMdGZu?=
 =?utf-8?B?bldkRCtmTzB6QXVKTFFCQzlYOVR4ZXp2dm1IeTZLenhhM1BicHJOOU1FRWdm?=
 =?utf-8?B?eUdUanhNcEd5djB4amVUM05Fc3dxWFFhTTZsODE1Q0Y5K2daeVJ4ZmNIVEF5?=
 =?utf-8?B?ZXpmeC9TN3NpSDEzODc2ZWFqOS82dEdVZUs0dWZTYVVheWJBN3ZTTGlkSGJ0?=
 =?utf-8?B?OUluZkx6MVlCOUtHa1hkd1pSdk8rQSs2R3V2c0p2d0k0VUMxbWNCL0Vxc1Ax?=
 =?utf-8?B?dVFZb2VtU2R2NHZyRkRodHhLYkFpbzBNVjQ0Q0NMbkRld0NDZXgvekZjbHJQ?=
 =?utf-8?B?Q0hHNVk1ZVpiOFhQUlVRSVRIeXVqOVlSMUVkcUhrVkxjTHYzMVdtc0VJSFJQ?=
 =?utf-8?B?NFkrYWlWZXdGRE5JcnFoOFNieE9ERmVhdW9TdjRhTWt1VzBTbExJajJMYlRU?=
 =?utf-8?B?SEVVaFNHZUVPblh1TTZWdjg5NTZxZHpDTERoMXRENld1R3VFRGhqTjVpSVZt?=
 =?utf-8?B?ZzRPQmRoMHdjZ1hZL2cySnlvRyt4a0x2T3NXaTEycHlRMW9ydVBaaUp6Ti9l?=
 =?utf-8?B?dUc5dWwvaG1JUUFMQTZQNFJMcHlDcm5IekFVU0F2QVAweU9ZTVlNSS9Kcjd0?=
 =?utf-8?B?TzNYOFRVT3RWM0lqelVOWW9kRkZyT2d3RWJpb1R5M3hVZEFGbjFxUnZBcmM1?=
 =?utf-8?B?OGlEMlVpeHdUL3d3alY1Nm9ZcmZwWCtRZlFMRjdNRXYyMXE0VWVoR1NqVDhY?=
 =?utf-8?B?VnNOSFpIS243TTNzeDJMNE9wR2luOWd5MUw4Y2Q3VFBwR2RtRzR0bTRmM2ZR?=
 =?utf-8?B?RXZGeDlMT0dVQVhPVldjY09XNkJqMWdob0RPcVplUE4ySmhtaUs3bHZGTU9Y?=
 =?utf-8?Q?yHpOHySXPqz0MeTuoVzoXpH62fPzHUpxOR09hXglO0+4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abb2211-7b6c-4689-7ede-08ddc8dcb180
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 05:00:35.6959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdm1lUFj3g9ka5mAj4xnHAlw5rF7DZmKvonWQa+hP4W2hJaUV08utpNP8+jdAaCxovoEzqr76L3nBBR8A0+2ZM8BCY2sUozItpEr7QktwCQI+skGuZibqd1npmVwjFxN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7214
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

Hi ,

   * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
This is a known issue

   * igt@xe_oa@buffer-size:
     - shard-dg2-set2:     NOTRUN -> [SKIP][2]

SKIP is expected


On 22-07-2025 05:31, Patchwork wrote:
> == Series Details ==
>
> Series: drm/xe/display: Block hpd during suspend (rev2)
> URL   : https://patchwork.freedesktop.org/series/151747/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-3448-c090dd90a95779c036f581aac578851ab3fe1920_FULL -> xe-pw-151747v2_FULL
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with xe-pw-151747v2_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in xe-pw-151747v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
>
>    
>
> Participating hosts (4 -> 4)
> ------------------------------
>
>    No changes in participating hosts
>
> Possible new issues
> -------------------
>
>    Here are the unknown changes that may have been introduced in xe-pw-151747v2_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
>      - shard-bmg:          NOTRUN -> [ABORT][1]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html
>
>    * igt@xe_oa@buffer-size:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][2]
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-434/igt@xe_oa@buffer-size.html
>
>    
> Known issues
> ------------
>
>    Here are the changes found in xe-pw-151747v2_FULL that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>    * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
>
>    * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#316])
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
>
>    * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>      - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124])
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1124])
>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>
>    * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887])
>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
>
>    * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#787]) +111 other tests skip
>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html
>
>    * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#455] / [Intel XE#787]) +16 other tests skip
>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html
>
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
>      - shard-dg2-set2:     [PASS][10] -> [INCOMPLETE][11] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
>
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][12] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html
>
>    * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#373])
>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-434/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
>
>    * igt@kms_chamelium_frames@hdmi-crc-fast:
>      - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2252])
>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-5/igt@kms_chamelium_frames@hdmi-crc-fast.html
>
>    * igt@kms_content_protection@atomic:
>      - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#1178]) +1 other test fail
>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-5/igt@kms_content_protection@atomic.html
>
>    * igt@kms_content_protection@legacy@pipe-a-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][16] ([Intel XE#1178])
>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html
>
>    * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][17] ([Intel XE#3304])
>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
>
>    * igt@kms_cursor_crc@cursor-random-512x512:
>      - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2321])
>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html
>
>    * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#4208] / [i915#2575]) +22 other tests skip
>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
>
>    * igt@kms_dp_linktrain_fallback@dp-fallback:
>      - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#4208])
>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-dg2-433/igt@kms_dp_linktrain_fallback@dp-fallback.html
>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-433/igt@kms_dp_linktrain_fallback@dp-fallback.html
>
>    * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
>      - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2316])
>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
>
>    * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
>      - shard-adlp:         [PASS][24] -> [DMESG-WARN][25] ([Intel XE#4543]) +1 other test dmesg-warn
>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-adlp-9/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
>
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#5390]) +3 other tests skip
>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-rte:
>      - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#5427])
>     [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
>
>    * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
>      - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2311]) +2 other tests skip
>     [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html
>
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#651]) +4 other tests skip
>     [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2313]) +3 other tests skip
>     [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
>
>    * igt@kms_invalid_mode@bad-vsync-start:
>      - shard-adlp:         [PASS][31] -> [DMESG-WARN][32] ([Intel XE#2953] / [Intel XE#4173]) +20 other tests dmesg-warn
>     [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-adlp-3/igt@kms_invalid_mode@bad-vsync-start.html
>     [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-adlp-4/igt@kms_invalid_mode@bad-vsync-start.html
>      - shard-dg2-set2:     [PASS][33] -> [SKIP][34] ([Intel XE#4208] / [i915#2575])
>     [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-dg2-433/igt@kms_invalid_mode@bad-vsync-start.html
>     [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-433/igt@kms_invalid_mode@bad-vsync-start.html
>
>    * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>      - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2763]) +4 other tests skip
>     [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
>
>    * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
>      - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1489])
>     [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html
>
>    * igt@kms_psr@fbc-psr-primary-page-flip:
>      - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2234] / [Intel XE#2850])
>     [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-5/igt@kms_psr@fbc-psr-primary-page-flip.html
>
>    * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#2850] / [Intel XE#929])
>     [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
>
>    * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#4837]) +1 other test skip
>     [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-434/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html
>
>    * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
>      - shard-dg2-set2:     [PASS][40] -> [SKIP][41] ([Intel XE#1392]) +6 other tests skip
>     [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
>     [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
>
>    * igt@xe_exec_basic@multigpu-once-rebind:
>      - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2322])
>     [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-5/igt@xe_exec_basic@multigpu-once-rebind.html
>
>    * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#288]) +1 other test skip
>     [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html
>
>    * igt@xe_exec_reset@gt-reset-stress:
>      - shard-adlp:         [PASS][44] -> [DMESG-WARN][45] ([Intel XE#4812])
>     [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-adlp-1/igt@xe_exec_reset@gt-reset-stress.html
>     [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html
>
>    * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge:
>      - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#4943]) +2 other tests skip
>     [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge.html
>
>    * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#4915]) +20 other tests skip
>     [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-436/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file.html
>
>    * igt@xe_exec_system_allocator@threads-many-large-mmap-shared:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#4208]) +113 other tests skip
>     [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-433/igt@xe_exec_system_allocator@threads-many-large-mmap-shared.html
>
>    * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>      - shard-dg2-set2:     NOTRUN -> [ABORT][49] ([Intel XE#4917])
>     [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>
>    * igt@xe_query@multigpu-query-gt-list:
>      - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#944])
>     [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-5/igt@xe_query@multigpu-query-gt-list.html
>
>    
> #### Possible fixes ####
>
>    * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
>      - shard-adlp:         [DMESG-WARN][51] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][52] +2 other tests pass
>     [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-adlp-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
>     [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-adlp-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
>
>    * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>      - shard-adlp:         [DMESG-FAIL][53] ([Intel XE#4543]) -> [PASS][54] +1 other test pass
>     [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>     [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>      - shard-dg2-set2:     [INCOMPLETE][55] ([Intel XE#3862]) -> [PASS][56]
>     [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
>     [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
>
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>      - shard-dg2-set2:     [INCOMPLETE][57] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][58] +1 other test pass
>     [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>     [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
>      - shard-dg2-set2:     [INCOMPLETE][59] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][60]
>     [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
>     [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
>
>    * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>      - shard-bmg:          [SKIP][61] ([Intel XE#2291]) -> [PASS][62]
>     [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>     [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>
>    * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>      - shard-bmg:          [SKIP][63] ([Intel XE#2316]) -> [PASS][64] +1 other test pass
>     [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
>     [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
>
>    * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>      - shard-lnl:          [FAIL][65] ([Intel XE#301]) -> [PASS][66] +1 other test pass
>     [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>     [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>
>    * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>      - shard-bmg:          [SKIP][67] ([Intel XE#1435]) -> [PASS][68]
>     [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>     [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>
>    * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>      - shard-dg2-set2:     [SKIP][69] ([Intel XE#1392]) -> [PASS][70] +4 other tests pass
>     [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>     [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>
>    
> #### Warnings ####
>
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>      - shard-dg2-set2:     [INCOMPLETE][71] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][72] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
>     [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>     [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>
>    * igt@kms_content_protection@srm:
>      - shard-bmg:          [FAIL][73] ([Intel XE#1178]) -> [SKIP][74] ([Intel XE#2341])
>     [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-bmg-8/igt@kms_content_protection@srm.html
>     [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-6/igt@kms_content_protection@srm.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
>      - shard-bmg:          [SKIP][75] ([Intel XE#5390]) -> [SKIP][76] ([Intel XE#2312])
>     [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
>     [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][77] ([Intel XE#2312]) -> [SKIP][78] ([Intel XE#2311]) +1 other test skip
>     [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
>     [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
>
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
>      - shard-bmg:          [SKIP][79] ([Intel XE#2313]) -> [SKIP][80] ([Intel XE#2312])
>     [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html
>     [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html
>
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
>      - shard-bmg:          [SKIP][81] ([Intel XE#2312]) -> [SKIP][82] ([Intel XE#2313]) +1 other test skip
>     [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
>     [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
>
>    * igt@kms_plane_multiple@2x-tiling-y:
>      - shard-bmg:          [SKIP][83] ([Intel XE#4596]) -> [SKIP][84] ([Intel XE#5021])
>     [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
>     [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html
>
>    * igt@xe_exec_basic@multigpu-no-exec-basic:
>      - shard-dg2-set2:     [INCOMPLETE][85] ([Intel XE#4842]) -> [SKIP][86] ([Intel XE#4208])
>     [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic.html
>     [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic.html
>
>    * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>      - shard-adlp:         [ABORT][87] ([Intel XE#5530]) -> [ABORT][88] ([Intel XE#4917] / [Intel XE#5530])
>     [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3448-c090dd90a95779c036f581aac578851ab3fe1920/shard-adlp-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>     [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>
>    
>    {name}: This element is suppressed. This means it is ignored when computing
>            the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>    [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>    [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>    [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>    [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>    [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>    [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>    [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>    [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>    [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>    [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>    [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>    [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>    [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>    [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>    [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>    [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>    [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>    [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>    [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>    [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>    [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>    [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>    [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>    [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>    [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>    [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>    [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>    [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>    [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>    [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>    [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>    [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
>    [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>    [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>    [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>    [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>    [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>    [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>    [Intel XE#4812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4812
>    [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>    [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
>    [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>    [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
>    [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>    [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>    [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>    [Intel XE#5427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427
>    [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
>    [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>    [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>    [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>    [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>    [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>
>
> Build changes
> -------------
>
>    * Linux: xe-3448-c090dd90a95779c036f581aac578851ab3fe1920 -> xe-pw-151747v2
>
>    IGT_8470: ee326481fd4d17eba84fbc629f9e4a5def7dbd8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-3448-c090dd90a95779c036f581aac578851ab3fe1920: c090dd90a95779c036f581aac578851ab3fe1920
>    xe-pw-151747v2: 151747v2
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151747v2/index.html
>
