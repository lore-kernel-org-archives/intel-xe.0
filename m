Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC31C9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 23:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FAD10E193;
	Fri, 25 Sep 2026 23:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lL8FKc6H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FE210E193
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 23:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790378425; x=1821914425;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wSxMwG4lESJHYH0yK+CTyZjq9YYMzlH6reMWPKH1lKA=;
 b=lL8FKc6Hzi/q/g9hlvv+5eLcRowZ2V1l+RBhpHnaZx0UnnSJF0m9ZnCY
 0DCDQBf/Sd0Ytq+c5V4Mc/0qbapX4/aVmZAsOfR7hDeg+e7GsiUaPw8kS
 axq/3qAJWCTJAIYI5L9yP39zDbaI53CxR3B52S1PbNzCPJRCv9mmO7tBP
 sQYAOlqCBidLQwsQV1Qt+jUCPqE3N/40uoWE8Fdr3+uFvDfHsDaZTQWcv
 qGbjHVK8sWQH5agJ0P3n4asYhunSOCIFKAY+L/k1uUlWdRonV2aCPYQC9
 b8JiqdMus3yUdsEIBSjqLitDFi+9siIgpvlI07WKjmIX/IO9jgT/0e/DY A==;
X-CSE-ConnectionGUID: LqfrY7+cS/iAplRFZShwSw==
X-CSE-MsgGUID: rRPbT+Z9Q+qJBjL6ia0rgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="91272186"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="91272186"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 16:20:25 -0700
X-CSE-ConnectionGUID: ScW/VCjZTI29N+ZD/ZvPEw==
X-CSE-MsgGUID: Yzcz1EKORRyJKs6kmZ+qtQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 16:20:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 16:20:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 16:20:24 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 16:20:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ky8bGMTQTnY5GH7qKMW3+1diJ2IjtvJOgdf5gO2MGt94+0qEKNfUdHuorzuTga3x0iRqsbGjdR5T2q6Q8JPMCRnD9Mxy4oMN1PFTTuMClk4Y4htWNCIcBVWTOpfnz8XIdBLxYP/L2nByFya7WjemSxFSmffXC6HOiWJtzLMzM+Rr4C2LURDJFzSZ+nUzoCMiEeWKjWp24k+Ud+mswlGc3J0o03UoGVm06sIpqyI7d9SrF7xuP1AQpL/Pl7zXPQZKGTJesm9hW9a61PsM4So4Gx461boShZ4NCInzvvuTS8mkxyooVhvDgm7r7JU/bexvWoPD3pRwUWYYqLPSZREm5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vym/+5whEVCaYSiJYxkIF2uoy3S9S8KGrZEE5h/qfmc=;
 b=dzWYuvzq60fMAqAAIOpWKTP8S2RVRNYTby6pkcm4WYbcwwRDOWhaAlzrEhazksb6b2X7t76Amc+quoXLbvBqDJ4XNAB/eiOb2AHVuttbv6RJ23RUaBOyuAAF6HK3YrZyI5VflG05uVrlNtEB+QTa6v9STWL6WTMWQYnjFuFUzWeVq4GJgTwE1rXRz2jzAGeaWJe0XKOgqw88Hu2hC/UNPlttA5JinboGtkddCJfxV8Z8Nb3eBfy7ZPe2pp1urR1fBE3ykU0obnlskfFL2FAKKXWitB2yuzGN29czF9Xtav2zhKs1G+xheQIBCtDjJOyYfxf8gCkiyWhabWvZ4Cqesg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CH3PR11MB525758.namprd11.prod.outlook.com
 (2603:10b6:610:34d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 23:20:21 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 23:20:21 +0000
Message-ID: <8edf915c-8322-45c6-a03d-ced5198c2fa9@intel.com>
Date: Sat, 26 Sep 2026 04:50:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/24] drm/xe: Update GuC submission backend to run PT
 jobs
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Maarten Lankhorst <dev@lankhorst.se>
References: <20260925201526.1355279-1-matthew.brost@intel.com>
 <20260925201526.1355279-11-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260925201526.1355279-11-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::8) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CH3PR11MB525758:EE_
X-MS-Office365-Filtering-Correlation-Id: 8613af05-22a9-4db4-1ebc-08df1b5b918b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: heKoK3aktK1+EQn1IeFiNFykjgvRh0HcBBuIbuV9mp40AXcvM9nTD7s84D3ijoc9m2G/xwOt4QIUi/D8UFzBcqiHQBJ406c+ggeBe/lyc4D4RwnMa0N46fRgqFHUH9f3HCwer92NsMjfuPvZaZxbuHrec345Xsm22WtGNRHHV2uUcsBWJWKsy+hNnCzFtMEYDy2d31xrWDscZqZ+ygVvvXHoqeQf0sjzwkq/FI2iLtGIBEEUDZ9JMc5CJBCeeHchajRTmZGHp/UNUpqENo9pKJGXgYXH/mLGekUHBAN1Ueuf0uRO/1je/OhdUGZRyHVbIWELA1T8GMUtkxjUb6eSCKliJux1dMZE4IyOlOYq1k7H9iB9+3uml7IlZN9RaCf9IZymxcxcdtLLhaO7lihQDiXy1a7VfgyhYjyIV9dcg3PxL1RL+alAqpYx8p5EFmyVn5V2UuPho/M69SQtE1IiolWtI26221aVKA758qBS3BLUjlfgjedkCdO7oQ6OS37ss87gykFSoSDsX+nV/srkfox3CXwx95cLnadpSdRUHKyO3nFSle3p/ItW//09t5WPgjpkImOPm7jTp3HIRTkQh+68a1FpGkGfZ0ZZhnLXk10cpYGaJjYysNgcUSgtfDUf0FkFK+w6WS0MSRp5RQOpQZHi5sNV2s9XsuRAVY0Q8VA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1JqdElhU0gvRzF2NTZCR0dQWWNKbFNtcXllSmNkQUlJRW1ZLzhkT2IzODh0?=
 =?utf-8?B?alh2OURsU0hyUFRieXQzSytHbmloQllpZGsyaXEwN3IrWTNNN3NCbSthK0Vp?=
 =?utf-8?B?b0RiZ1pnSENlbDAwQnBBTldhNE5oN3drZTZVS0p0YXpLTWtFWmZLVFg4K0c2?=
 =?utf-8?B?T21HMjlReG9QL1gyeFpHOVhwQXlINFZOb0ZsaXltTUhZT3QvYXIvMEJhVDhn?=
 =?utf-8?B?ZkZsZ3h1SXZXZkZ3V0wrVFRWYWNRSlp0clU3NjBJVEtGbVZrdUtRRXRzSXEw?=
 =?utf-8?B?WjJlTk9pSzlIRVF3NWp2R0NHdHhaY3B5RERJSnFncnBZcXdxWXVLb2RlNjdS?=
 =?utf-8?B?elJvMENkM3Vkcm92VnQvcXRFS3JDTWtJdDBUQlp2c1lXL01JZ1NFRHVJWmJw?=
 =?utf-8?B?b1VqbUllTUZVVVRTRkNpaTFFcFF2S1R3bE1HM1Jxd1hBWW81aUNldjhjcVZk?=
 =?utf-8?B?a1YvL3ErdktHUEgvUUJGZjRsQ3BOaDBIZk9uQzZtVVlqSXNWWk82ZmkvOXA4?=
 =?utf-8?B?cFdzVWRkMDZsNDhtcGcwMmJoNVJaUTB2UXFlSUkrOTVMVjZuYlZzRGREWFh5?=
 =?utf-8?B?S2hhSnFmMzV5M1F2MEl2Rm9UY2I5U3kySmNIMXhGbStsaXZIMXROOE02cXZy?=
 =?utf-8?B?WHNrempHcnoxRW1QUTc3TTBPUFU2eEpENzAxclNjaWN5SG5iZE15bEhzSExr?=
 =?utf-8?B?cWEyeWtwZjZCdm5JZTdWK2RDS293OVUvQzJUSjl0OTExYVJTR3EyM0RaK2c2?=
 =?utf-8?B?S0kxeXpWVUFoZW9sWkhCY2pYSkdBOUhlVVl6MjVBUUUxYVI1RXFYRm5iUjVi?=
 =?utf-8?B?b0FoaWVsdWtneElxc2dxeXdqMUZvcDNocGRZamtWckgzd2h4ODJMNFhoNERV?=
 =?utf-8?B?bG45VGttcEpRNGRZY2JnZUFIVFJ3dGcyeHppN2NseXIwVi9YQ1lLRUtQMjBK?=
 =?utf-8?B?MFpyZUtMaE1qS0NUQkRvSjFEd0ZYQU1HaDVsWENyL3BjTExNTTZvRFYwM0s4?=
 =?utf-8?B?OXcwNE1rdDhRdHRxWVdIUlNLVFE3QkdzRGgwUDJHYWJZdVpIVzVmSDRoQlVl?=
 =?utf-8?B?ajBweFNHU2ZIVXNaaGRaMVdZWFhPbGN0SXc4ejI5YTIvdG5US3M2OXRVd0o2?=
 =?utf-8?B?M3RCWnNLVnFQTGlubkFKOCt3R3FoTVpNU3FGN2JtOTE2U2NHVlpXenNxczF6?=
 =?utf-8?B?bW80eUtXTVJwQW0wcFBQNVkvM1dnZXIrM0owV0xTYjBpNVYwOGljK1Z6MzJS?=
 =?utf-8?B?bjIvMFFmV1FaSXF1cmdoUGI5cU1IZkVIT08vSFR3Z0h4VUFEdm5WS2x2RUVv?=
 =?utf-8?B?MkM2Y00veTloanRhaVIrdGNFa2loSkZyL2lOUDVGU2ZKWEN0VU5XWGtCMTVS?=
 =?utf-8?B?bm9JOFVhRnN2N3pLZ1BCUHYrU2luaXliL3JDNDkzcGswVHY2c0IrMUE0VklK?=
 =?utf-8?B?YW5ONG9SM3pEWXoxK0cwVkxPKzYyWkZoRzVDL3VSU3JrblNKQ0x5a215WEtV?=
 =?utf-8?B?T0xzNFh4dElSNUlpaGJnbUQyVFFQWUFIOGRmVXl3eGJ5NWM1NUc5ai9veXZG?=
 =?utf-8?B?aW1YOHFCTkcwendMV3ZNNXdXeTdBdTg4aTJRdThwSkl5VmJ0emF4ckJOa1lt?=
 =?utf-8?B?NW5yNEgwL0Q1WDI4ZUVEWUdSKzlaRnFYcitqYW9aVEdZVlNnOUJtWC9IOENZ?=
 =?utf-8?B?NkJQSnZwMUpVTXoyY1dUMUtjNHlzajdCQmdQaW9Rc3RHVnNrMWxOUWlna3gw?=
 =?utf-8?B?R01qZ0JiSDdvUEZpakYyUXM5UXZPajZVMUFVS04ya3JlNUszRzFsTmF3cGla?=
 =?utf-8?B?WDA4RDlWTjI2Nk1WdE8yN2MwK3VqbWFKRjNCRHVRVW9HcFk2Z1ZybXhuY09o?=
 =?utf-8?B?L3RqNTg2ZjgwdVdmY1dNTTd3MDU4TkgvbFpIdmZtMGV0SjBqdUVWYmZ1Sjhu?=
 =?utf-8?B?WUVCby9iTUJheVJEYlRISVp6dDB3MHh6V2Fjd0ovNXM4Zk5ucGlZZ1d4dnZ5?=
 =?utf-8?B?SHhXWWU2Nm9pdE0zRW1HcFJKOGFLUXdOWW1IMCtidnE1WWR6eUtwd216VkZP?=
 =?utf-8?B?Nm4zV0M1b3VmMVFyQjR5WkRVMExjTlVybGFEV0xDRDcyZlBUQmRrK2pSL0hJ?=
 =?utf-8?B?eTM2T09TbnB3SzdQeVA2elVOLzBHMXRHems4YmoxT2dTRTU0aVlBUThLMUhL?=
 =?utf-8?B?elB2VUtndlpnUEVHSk51b3hSY0VGMThzMzZCN1AwMVFUL3hGdzZmSEIrWHJj?=
 =?utf-8?B?RHpINllJWFE5OG1rS2gybGRMVFRYTzNqZWZhR2NwaTFidzgwUjJPZWI5Wm5F?=
 =?utf-8?B?Y3BsU2dhb1Vqbmx6Yi9EbWM3Rlc3VWc5cnJoejRDMGQ2QTNZMWw0OEFuSFV4?=
 =?utf-8?Q?+2Iy6jgFhqkPeOk8=3D?=
X-Exchange-RoutingPolicyChecked: qgYsoxBoXpuQ/YN9RrsnUNRGYp6LotXL/37pp9vXA850/hjyrt5lZBJ/cRN931VysFsfF5Fy5k5iapT0CT7euUHUgnC5jpNe0Ii4ztl2YccKsmab225+7X5Jvux5IY3LZvtUrr2awQzglsUxtdscYybjXYyVnG9lcI4LtyDrWqa3/PRCoym7IoUmb/9xEujTvhNHPAMKcyhxJl0rwqJfVgrm9igsWMzzoeRScZzC5SsQIip+zf2s4zLBqZZLjO69JNN9j5nLRtAc3s8dP8xiv5uSkEjoUGC1OG5ox44tFdHzpNALAlTd75lB0wgJLKuDB+nGpSGmXpG6hGPSuKxBQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8613af05-22a9-4db4-1ebc-08df1b5b918b
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 23:20:21.1280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rEdO2hQYOGQZMTGe7Wg876Nbbc2hr7qRbLTUbeEsN8MEXCSfXXQ2xxDlo+z1FyUHjq4t+oviBTBP9pf0rXuVXc9NEZkju9Yz5MrL8BUY6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB525758
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



On 26-09-2026 01:45, Matthew Brost wrote:
> PT jobs bypass GPU execution for the final step of a bind job, using the
> CPU to program the required page tables. Teach the GuC submission backend
> how to execute these jobs.
> 
> PT job submission is implemented in the GuC backend for simplicity. A
> follow-up patch could introduce a dedicated backend for PT jobs.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 31 +++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_migrate.c    | 20 +++++++++++++++----
>   drivers/gpu/drm/xe/xe_migrate.h    |  7 +++++++
>   3 files changed, 51 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4bd1ead57efa..9faddb7c6407 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -39,9 +39,11 @@
>   #include "xe_lrc.h"
>   #include "xe_macros.h"
>   #include "xe_map.h"
> +#include "xe_migrate.h"
>   #include "xe_mocs.h"
>   #include "xe_module.h"
>   #include "xe_pm.h"
> +#include "xe_pt.h"
>   #include "xe_ring_ops_types.h"
>   #include "xe_sched_job.h"
>   #include "xe_sleep.h"
> @@ -1238,21 +1240,44 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>   	}
>   }
>   
> +static bool is_pt_job(struct xe_sched_job *job)
> +{
> +	return job->is_pt_job;
> +}
> +
> +static void run_pt_job(struct xe_sched_job *job, bool force_clear)
> +{
> +	xe_migrate_update_pgtables_cpu_execute(job->pt_update[0].vm,
> +					       job->pt_update[0].tile,
> +					       job->pt_update[0].ops,
> +					       job->pt_update[0].pt_job_ops->ops,
> +					       job->pt_update[0].pt_job_ops->current_op,
> +					       force_clear);
> +}
> +
>   static struct dma_fence *
>   guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>   {
>   	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>   	struct xe_exec_queue *q = job->q;
>   	struct xe_guc *guc = exec_queue_to_guc(q);
> -	bool killed_or_banned_or_wedged =
> -		exec_queue_killed_or_banned_or_wedged(q);
> +	bool killed_or_banned_or_wedged_or_error  =
> +		exec_queue_killed_or_banned_or_wedged(q) ||
> +		xe_sched_job_is_error(job);

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
>   		     exec_queue_banned(q) || exec_queue_suspended(q));
>   
>   	trace_xe_sched_job_run(job);
>   
> -	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
> +	if (is_pt_job(job)) {
> +		xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
> +		run_pt_job(job, killed_or_banned_or_wedged_or_error);
> +		xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);
> +		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
> +
> +		return NULL;
> +	} else if (!killed_or_banned_or_wedged_or_error) {
>   		if (xe_exec_queue_is_multi_queue_secondary(q)) {
>   			struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>   
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index d7f35aa91c1c..3007fe0b8535 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1819,11 +1819,23 @@ struct migrate_test_params {
>   	container_of(_priv, struct migrate_test_params, base)
>   #endif
>   
> -static void
> +/**
> + * xe_migrate_update_pgtables_cpu_execute() - Update a VM's PTEs via the CPU
> + * @vm: The VM being updated
> + * @tile: The tile being updated
> + * @ops: The migrate PT update ops
> + * @pt_ops: The VM PT update ops
> + * @num_ops: The number of The VM PT update ops
> + * @force_clear: Force clear
> + *
> + * Execute the VM PT update ops array which results in a VM's PTEs being updated
> + * via the CPU.
> + */
> +void
>   xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile *tile,
>   				       const struct xe_migrate_pt_update_ops *ops,
>   				       struct xe_vm_pgtable_update_op *pt_op,
> -				       u32 num_ops)
> +				       u32 num_ops, bool force_clear)
>   {
>   	u32 j, i;
>   
> @@ -1834,7 +1846,7 @@ xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile *tile,
>   
>   			xe_tile_assert(tile, !iosys_map_is_null(&update->pt_bo->vmap));
>   
> -			if (pt_op->bind)
> +			if (pt_op->bind && !force_clear)
>   				ops->populate(tile, &update->pt_bo->vmap,
>   					      NULL, update->ofs, update->qwords,
>   					      update);
> @@ -1874,7 +1886,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
>   
>   	xe_migrate_update_pgtables_cpu_execute(vm, m->tile, ops,
>   					       pt_update_ops->pt_job_ops->ops,
> -					       pt_update_ops->num_ops);
> +					       pt_update_ops->num_ops, false);
>   
>   	return dma_fence_get_stub();
>   }
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 2ec9de896dfe..c41f6e3ca2c6 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -24,6 +24,7 @@ struct xe_pt;
>   struct xe_tile;
>   struct xe_vm;
>   struct xe_vm_pgtable_update;
> +struct xe_vm_pgtable_update_op;
>   struct xe_vma;
>   
>   enum xe_sriov_vf_ccs_rw_ctxs;
> @@ -163,6 +164,12 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   
>   struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
>   
> +void
> +xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile *tile,
> +				       const struct xe_migrate_pt_update_ops *ops,
> +				       struct xe_vm_pgtable_update_op *pt_op,
> +				       u32 num_ops, bool force_clear);
> +
>   struct dma_fence *
>   xe_migrate_update_pgtables(struct xe_migrate *m,
>   			   struct xe_migrate_pt_update *pt_update);

