Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF729FF8864
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 06:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF24610EE6B;
	Wed, 29 Apr 2026 06:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MnVrR4EB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB2D10EE6B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 06:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777442838; x=1808978838;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aIP0KZ2i9AcehY4mHHM3SpO7Uoi0FC+bJf8g3ZtQVeY=;
 b=MnVrR4EBEZN41JnIICtXkfsZsrhldogLu2dKRXMYF2Fix0b+LH8aQ3PB
 aJRams+FioScxZ1EnJEpuZYPEXqEuA0TCyCmV/irbhW0bjQTZcitvKEHM
 2XyE4cg3EBf1CORO+cudAgxuIqVOfYM4w7Y1lZx7DMm6Asbe9DwzhMpRq
 89JWR3j3xiPn6QwIWMiOdqPINp8s5T0Wou0dK+Mr0oWos5FK0BmuS3QVd
 ZtNSEJUbHlShnTP2ArV8AQJKUJ0HeT1j75v+XIZiicuLlUlcVVcN66M/7
 xj9RgGTGPta4lmuDf+hbzbKdc/23oV2yGO1kKjqxgZ4xrzoKwohr8GKGC g==;
X-CSE-ConnectionGUID: f3vW4KFkSIG8Xuz3E414RQ==
X-CSE-MsgGUID: LtjcniA9Q3S8WUVBcGiqAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95783429"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="95783429"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 23:07:17 -0700
X-CSE-ConnectionGUID: x3aP0/h1SHKEHCt2GgGLMA==
X-CSE-MsgGUID: OJLlOpuoQFG37gWvxKrjLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="257487929"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 23:07:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 23:07:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 23:07:17 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 23:07:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8hY77/8SBbGgtK4kPUHCe0GWyxIfKg8JtfZbbEuwI5kE5ybDj0Z5AErmZIVfrurddY/Xg9iyZa5o31ktRzkwR2hpJSv86T+9yMGUAb2qFnimiBPN4ZqzHF1AHZ/T5dHGmjoJtQmQWRvrd1KwjvKsv9pkywY5tvs2DfI/48Qb8bjRsLDvxtGXUNhI0hyM3BtFbg7ZLZJuo/hhQFmmm67cGM3Eaqogw+tqKQGGxzIquwlTUegKnvNDqLrJCcaaKAIeZAkq4772fxQBLx0pdQJKZsQyuZRXBGgLzuyDAGmoW5gW+mGMtgeIAgf7fTXfr9bIOQEr/GJsk/24YlSM2Gvzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/09rvxlIEFFs88o1yTfCt49RbrjW0+jNpnfGVidUXuw=;
 b=OOjAATNuHgKAQAf42Fst8L1svFGReZV5wZkO5hUzqLSefTUcwaw14ZVhs73+tJbJOopck+gHN70CnYC8Z5iKrAyhlUZ7dZmT2j64jOXzFYLyh97Ga5xCKvUZLwLnKAMsw2XcOWcf4v0xTVfgCJzN/2RbqbVJe108uYW0Qzvu0SZjpajdD9YyhrbyT7sm6hR/xRhkHscAUvlslwaoV/L6/8hI/9CxzSdvDqQ8m7chZnANvFA1kzWspHLnCCPQTXnCmtAz/BxoKHnSBBRhrC4kjhVCckfDVRv36mFW9sCKrWcXLGDcLTqvWELk0KQ9QSuF3w/2YcLhJDMjlOVh+FlB+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PR11MB8716.namprd11.prod.outlook.com (2603:10b6:0:43::13) by
 SA1PR11MB8859.namprd11.prod.outlook.com (2603:10b6:806:469::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Wed, 29 Apr
 2026 06:07:13 +0000
Received: from DM3PR11MB8716.namprd11.prod.outlook.com
 ([fe80::2e63:338a:bf30:7868]) by DM3PR11MB8716.namprd11.prod.outlook.com
 ([fe80::2e63:338a:bf30:7868%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 06:07:13 +0000
Message-ID: <616ef05e-122c-4a71-9044-01ed21b74327@intel.com>
Date: Wed, 29 Apr 2026 11:37:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/xe_ras: Add RAS support for GPU health
 indicator
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <andi.shyti@intel.com>, <rodrigo.vivi@intel.com>
CC: <anoop.c.vijay@intel.com>
References: <20260423173925.699486-1-soham.purkait@intel.com>
 <20260423173925.699486-3-soham.purkait@intel.com>
 <f9b1624f-543a-45dd-ad02-6a656999a1e3@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <f9b1624f-543a-45dd-ad02-6a656999a1e3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::19) To DM3PR11MB8716.namprd11.prod.outlook.com
 (2603:10b6:0:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8716:EE_|SA1PR11MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a0f186-0efc-419d-b5f9-08dea5b58e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: TwZcqeeQRPUEf6gtwmX3q3wsSsXFv8OWtWPgzrUTp4i6Tszej4xdlVsD7cmTM/ish5T7z2NW3l+DqoC8zaTc2asXU/vhqnVTp10VMMpg6LrdN0G4FCzfeyNE7pN8etbgykNxPiy53xMHBUk3/cwn6WOufqsiTBzscvpqNWDNzZ00/v0PXUhLKIegu4qHCG3N57MIl3KZtNeOKL5h6nW3N90AUgRXw6ijHVgwenDh/KbH0KyLVDem9gvJQD3MSsGTo3e7fGRH9ATy/+H4lq4IubR9W/uTKCGLRCRR54qdRfBxNEO+8mXDMb5aX4EHHGhtnWleVIL1/NWsYq1r/jEbOVI6rJd1iMeA5aQ+7LpJyk4eZVcz2Ywe0QBpjJCRnanaVwChcyxZyWXBHiyoIVGxMGtVnf3VaW97EKTc5G/+Ha8I0SAsDIhOzwaW3DV7baCpUhOO9+wxFh6ajgq5pVnfoA/REotdRMkYi57mGeVqimyXxJwe8+PIpL1GkKrPjjlBYoYSUgS4DSPXPctdJe+8lVrQ3Pk2lKA5w2f3SQ3NWjbt7cSTclHyFFsO3oBTZ/GhCMFXrcDody0E0k5/rzGUgnloWIXJ4e2tVTg9FctCE2HldiFQNtFZPp8mWUse/0rDr14lo9oBEjr2JlqGT+GyP/Kbe7FbDZAXMGlPChxUCiM2LehvM4/1+YgUho2tljNStYNeJHPSxB2YP6YpWul4UG1pXC05vhjI5BMI/xDRH44=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR11MB8716.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(921020)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0FscFlKL2JQTHh6MnpaSS9PQkp0WVRLSW8yVEpOaTFkZjFxNmlscHV1WWFP?=
 =?utf-8?B?VWNVN09yQXNZVFJ2VHNSbXdUQkhRRUt4SEgwbHhBekhNN1VycE1WNWxUMXBk?=
 =?utf-8?B?OWhtWHpmMmlsaVh3aTc2WWg1OGx2L0gvTWc2bUVMb2QrQW9WZmtWNmdFWkox?=
 =?utf-8?B?eVRBRmdoTytPQ0lmMGZIaGdSSkx3QWZweWp3NXNhRjZSVlAzaGFKRFZsYlhn?=
 =?utf-8?B?QTIzT2tqTlJBV25qS0JDUW1WZCs2Mk93UkpwVFR0MUNsL1ROU0hGZVVDS2M2?=
 =?utf-8?B?aGZPU3I2UnpwSzFzQmg0SXhsWlRET01aUC9PWUhjaEJydUQwOHJ5NHUxdmNw?=
 =?utf-8?B?clpod2xsRVV0cjFXaXRsU3lFVUlUNHJoejZFMTdKVk5WdVBCc2gxa3ZNYWpk?=
 =?utf-8?B?c1ZaY1JzUEtFdWNuVE51eDd4bmJaRGFoazVUeTAzYTd2VGFSMFBjYWQwbjMz?=
 =?utf-8?B?c2FmRUt2WlV5dXgwK2ljMi9YRCtWTGErSFk2eVM5ZytrckFhM2pVaVJxL3lJ?=
 =?utf-8?B?bmVtRnIyUXkyNERlZXYrWTNxaUg0TThsSk1TZUlIWklweUFZWVlPYmRKbWpQ?=
 =?utf-8?B?eE9MZWZHMGxlajVyc0EwdmV6dnBJcnFCOVNJVjQ3NlBLT2hzWk80ZDRCRVY5?=
 =?utf-8?B?OW5WUHd0SjYxakQwaFloa21LQk82WmxUS2hzeCtWWmx3UkVTTFJZSUlYRld3?=
 =?utf-8?B?cnVMNGxnckhONllxVFQxRG95OFJkZHQ5MzZpSHpXdU5Qa2RlNjhPZ21zTnNG?=
 =?utf-8?B?T29FSHJqVVk0cXJJek00SWh3ZGRMdk5ENXgxS1dnWi9WcmI0eGdvV1laS3Ns?=
 =?utf-8?B?QmV1dU1NSERvVmRPb2gxU1hvUmljUUIxNTBhQVhnMTAwZzdlRmV1YUVrV3hH?=
 =?utf-8?B?YVpwYUtaek1lLzRJRWJydFRHanY2bkVaYzNMeGJYem1YRGdHQnVTUCs3WUh1?=
 =?utf-8?B?dmRuRTJTQUNrTGkydXNQRUkvbGRBKytRa3NSNEl1WkV0aXJVdkdvcXMraW5D?=
 =?utf-8?B?eTdzaUc5QndmQVN2NTF4UDgyWlhlSFBOZ1BKcFN5SjhyamIzbVFWQU1RckZS?=
 =?utf-8?B?dTdtazdhUC9jZmM2TXVsYmt6Qld3NUFHRmZnZzFBQVdVMlJMbVJaV3JJaXcy?=
 =?utf-8?B?UFNST3h0K0FSM3hGc2VQREFXMnBvYU1HM2J5c0svcFhyOG5GMEdnajlNRzkz?=
 =?utf-8?B?WFZZL2ljSlZLUVNTaVl4c1Q4cFY5aGZjOFlWWEpvNkcxZG1CU1NzVmhka09T?=
 =?utf-8?B?cnlTTjlzZHhBdUpLK2djRlk0WFVqYkcrcVpqOHJ4MlNuV081MVhzbHlvUWZ1?=
 =?utf-8?B?c0pNYmliN3ZZMk9UMFJxU2toNS9EY1ZLT3R5aWpuakFTRDVwdnBFS3ludGJo?=
 =?utf-8?B?RXQ3UW1ibWlVVXdNU3JMK0hSbnlXM1VtdXBrWEZXR0VnNDlFUjFDaUlHUGxm?=
 =?utf-8?B?ODNaNzd5MXdsU2NGR2d5Wm1ENlNxYUNxRlI2WjAwOCs2MWtocDNaWVpCTVRC?=
 =?utf-8?B?S3ZneDh3OGIrV0ljUzVXTW9ZVXRHdTB2VmlTNDNkRnlGRGx5WXZualFOREN2?=
 =?utf-8?B?Um93V29OZlMxQy9kWmZNWHpXRUdZVGtPV3g2bW5NcW9RTUFTZzRYUk9nalcz?=
 =?utf-8?B?dldzbW02UXJLZHZNUlBOeWd1MXYvak9oRVFhSDdvaGVIS1FNdG9xd3A3cG1X?=
 =?utf-8?B?Vy9EY1J1Y2ViaXlwM1BqdjBPR2VDSlBvb3lTU0FJRi8rZnFDSEdSWENGWWMy?=
 =?utf-8?B?WCt5TFZ2TVp1TWxyUjFBSVlENHg2YzZEb0Ztd0hiN2FmcHQ2cGJWc3V1NkpV?=
 =?utf-8?B?TG1xWUw4d1NCKy9RYzdPSE5TbjEyMlNtdGZheGRqaVpvWmU5MmtMSzF3cVNY?=
 =?utf-8?B?TU5DM093YUdwY0kwRE5qRXZKNWF0ekxjZ21ybVhUblJxb2ozRWdLSlpwbFNK?=
 =?utf-8?B?alJKK0QxSmQ4M21aRHkrc2JITnVOdmlqTWJ5ekVCNzJSSVg3ZlQ1YVlVdzZF?=
 =?utf-8?B?cWU0U2MxTVZvU083V0I4TEYzaWh6Q1I3eUN0Z000RDRzRjlwbk1ZNTdPaCtk?=
 =?utf-8?B?WVI1YVdwOFpwYTN6TEczbTV5ZW9lV0pNV2lxb09aL0JKaklKM0RicjVqYjl0?=
 =?utf-8?B?bWxBRkh2YkRWN0Y0UER5TlZScnU1aXFmV0crK2tsMHBlWjA3cmx5ODNHUjFP?=
 =?utf-8?B?QWxyeDAzc3BRR2xlSXhmY3pSakVBS1pub0ovTFFVdnhhS0dFMGlYY1lOYnlh?=
 =?utf-8?B?TUYvaVBJemhVbEtUSHlJY240eExobkRSSzNnY2JHd2t4Q0ZqcXhONlhjUllD?=
 =?utf-8?B?VVdRMU9TUUlJMHBhMlRZQ1BycWRtd2NoenBPSXZqVmFEZ3RnUzlLUT09?=
X-Exchange-RoutingPolicyChecked: G+yv1E+RIPVesmr4Uje9LTiNTms99QxPdrvXrCatEPC/Zb8p1czSNhbkupPwvkCcxDnVboZx6qeMqkFOAj8o7IWky3jE5Z+YJE+EUIsrjwP2Ybjg8RdVcFbaMCjiwqt7LOeZg9PrwBIfl/54fsduVd1gGEgk3mvXwosfiX47R50suE7sOYPWmhg+AMsCALJTHK9NKl0/8kTh6PJEOsiFKpvIgr8orJs5rYiydzpLjnY2RVpZg6RoeuUyv4grJYotMXqPOZnz646rduXHeG1S5yPZO/y1f7efo7pfBrVlVoU07MArRsfg8WYXORoI5f4DApIWUuma7G3jiCCtEWfMhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a0f186-0efc-419d-b5f9-08dea5b58e3e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8716.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:07:13.2585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADJTUUNl3+BumaPUBU5ets8wl5pz3YtHWoMB7s+8mJUqFLshA3Jh/QFQ16ySlAn9la2v+Erob2xWdPo1BSiyQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8859
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

Hi Riana,

On 28-04-2026 13:54, Tauro, Riana wrote:
>
> On 4/23/2026 11:09 PM, Soham Purkait wrote:
>> GPU health indicator exposes a single sysfs interface, gpu_health,
>> at the device level, allowing administrators and management tools to
>> query the GPU health status. The interface permits both read and write
>> operations on PF and native functions, while on VFs it is exposed as
>> read-only.
>>
>> The sysfs file (gpu_health) is placed at the device level and behaves as
>> follows:
>>
>> $ cat /sys/.../device/gpu_health
>> ok
>>
>> $ echo critical > /sys/.../device/gpu_health
>>
>> $ cat /sys/.../device/gpu_health
>> critical
>>
>> V2:
>>   - Return error number instead of error message in _show and
>>     _store. (Andi)
>>   - Remove redundant VF check in _store callback. (Andi)
>>   - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
>>   - Return only the current health state for sysfs read. (Andi, Rodrigo)
>>   - Add documentation for sysfs interface. (Andi, Rodrigo)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-ras     |  33 +++
>>   drivers/gpu/drm/xe/Makefile                   |   1 +
>>   drivers/gpu/drm/xe/xe_device.c                |   3 +
>>   drivers/gpu/drm/xe/xe_ras.c                   | 202 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h                   |  13 ++
>>   5 files changed, 252 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>> new file mode 100644
>> index 000000000000..085cb79a6e00
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>> @@ -0,0 +1,33 @@
>> +What:        /sys/bus/pci/drivers/.../gpu_health
>> +Date:        April 2026
>> +KernelVersion:    7.0
>> +Contact:    intel-xe@lists.freedesktop.org
>> +Description:
>> +        This file exposes the current GPU health state and, for 
>> Physical
>> +        Functions (PFs), allows GPU health state to be updated.
>> +
>> +        This sysfs file is only accessible to administrative users 
>> and is
>> +        present only on Intel Xe platforms that support the GPU health
>> +        indicator interface for RAS.
>> +
>> +        For Physical Functions (PFs), the file is read-write, while for
>> +        Virtual Functions (VFs), it is read-only and does not 
>> support GPU
>> +        health state updates.
>> +
>> +        Read return a single line containing one of the valid values 
>> for
>> +        the current device health state. Only for PFs, writing one 
>> of the
>> +        valid values updates the current device health state.
>> +
>> +        The valid values for the device health state are:
>> +
>> +            ok
>> +                The device is healthy and operating within normal
>> +                parameters.
>> +
>> +            warning
>> +                The device is experiencing minor issues but remains
>> +                operational.
>> +
>> +            critical
>> +                The device is in a critical state and may not be
>> +                operational.
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 95666f950a6f..28a09d06a44c 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -112,6 +112,7 @@ xe-y += xe_bb.o \
>>       xe_pxp_debugfs.o \
>>       xe_pxp_submit.o \
>>       xe_query.o \
>> +    xe_ras.o \
>>       xe_range_fence.o \
>>       xe_reg_sr.o \
>>       xe_reg_whitelist.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 4b45b617a039..cb5484712f1c 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -62,6 +62,7 @@
>>   #include "xe_psmi.h"
>>   #include "xe_pxp.h"
>>   #include "xe_query.h"
>> +#include "xe_ras.h"
>>   #include "xe_shrinker.h"
>>   #include "xe_soc_remapper.h"
>>   #include "xe_survivability_mode.h"
>> @@ -1067,6 +1068,8 @@ int xe_device_probe(struct xe_device *xe)
>>         xe_vsec_init(xe);
>>   +    xe_ras_init(xe);
>> +
>>       err = xe_sriov_init_late(xe);
>>       if (err)
>>           goto err_unregister_display;
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> new file mode 100644
>> index 000000000000..25609257bd07
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -0,0 +1,202 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <linux/minmax.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_device_types.h"
>> +#include "xe_pm.h"
>> +#include "xe_printk.h"
>> +#include "xe_ras.h"
>> +#include "xe_ras_types.h"
>> +#include "xe_sriov.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>> +
>> +static const char * const gpu_health_states[] = {
>> +    [XE_RAS_HEALTH_STATUS_OK]        = "ok",
>> +    [XE_RAS_HEALTH_STATUS_WARNING]        = "warning",
>> +    [XE_RAS_HEALTH_STATUS_CRITICAL]        = "critical"
>> +};
>> +
>> +static const int ras_status_to_errno_map[] = {
>> +    [XE_RAS_STATUS_SUCCESS]            = 0,
>> +    [XE_RAS_STATUS_INVALID_PARAM]        = -EINVAL,
>> +    [XE_RAS_STATUS_OP_NOT_SUPPORTED]    = -EOPNOTSUPP,
>> +    [XE_RAS_STATUS_TIMEOUT]            = -ETIMEDOUT,
>> +    [XE_RAS_STATUS_HARDWARE_FAILURE]    = -EIO,
>> +    [XE_RAS_STATUS_INSUFFICIENT_RESOURCES]    = -ENAVAIL,
>> +    [XE_RAS_STATUS_UNKNOWN_ERROR]        = -EREMOTEIO
>> +};
>> +
>> +static int ras_status_to_errno(u32 status)
>> +{
>> +    status = min_t(u32, status, XE_RAS_STATUS_UNKNOWN_ERROR);
>> +    return ras_status_to_errno_map[status];
>> +}
>> +
>> +static void prepare_sysctrl_command(struct 
>> xe_sysctrl_mailbox_command *command,
>> +                    u32 cmd_mask, void *request, size_t request_len,
>> +                    void *response, size_t response_len)
>> +{
>> +    struct xe_sysctrl_app_msg_hdr hdr = {0};
>> +
>> +    hdr.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, 
>> XE_SYSCTRL_GROUP_GFSP) |
>> +           FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
>> +
>> +    command->header = hdr;
>> +    command->data_in = request;
>> +    command->data_in_len = request_len;
>> +    command->data_out = response;
>> +    command->data_out_len = response_len;
>> +}
>> +
>> +static ssize_t gpu_health_show(struct device *dev, struct 
>> device_attribute *attr, char *buf)
>> +{
>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_ras_health_get_response response = {0};
>> +    struct xe_ras_health_get_input request = {0};
>> +    enum xe_sysctrl_mailbox_command_id cmd = XE_SYSCTRL_CMD_GET_HEALTH;
>> +    enum xe_ras_health_status health;
>> +    int ret;
>> +    size_t rlen = 0;
>> +
>> +    prepare_sysctrl_command(&command, cmd, &request,
>> +                sizeof(request), &response, sizeof(response));
>> +    guard(xe_pm_runtime)(xe);
>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (rlen != sizeof(response)) {
>> +        xe_err(xe,
>> +               "[RAS][GET_HEALTH]: invalid Sysctrl response length 
>> %zu (expected %zu)\n",
>> +               rlen, sizeof(response));
>> +        return -EPROTO;
>> +    }
>> +    if (response.current_health > XE_RAS_HEALTH_STATUS_CRITICAL) {
>> +        xe_err(xe, "[RAS][GET_HEALTH]: invalid health state %u from 
>> Sysctrl\n",
>> +               response.current_health);
>> +        return -EPROTO;
>> +    }
>> +
>> +    health = (enum xe_ras_health_status)response.current_health;
>> +
>> +    xe_dbg(xe, "[RAS][GET_HEALTH]: current GPU health state = %d 
>> (%s)\n",
>> +           health, gpu_health_states[health]);
>> +
>> +    return sysfs_emit(buf, "%s\n", gpu_health_states[health]);
>> +}
>> +
>> +static ssize_t gpu_health_store(struct device *dev, struct 
>> device_attribute *attr,
>> +                const char *buf, size_t count)
>> +{
>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_ras_health_set_input request = {0};
>> +    struct xe_ras_health_set_response response = {0};
>> +    enum xe_sysctrl_mailbox_command_id cmd = XE_SYSCTRL_CMD_SET_HEALTH;
>> +    enum xe_ras_health_status health;
>> +    int ret;
>> +    size_t rlen = 0;
>> +    int state;
>> +    int ras_status;
>> +
>> +    state = sysfs_match_string(gpu_health_states,
>> +                   buf);
>> +    if (state < 0)
>> +        return -EINVAL;
>> +
>> +    request.new_health = (u8)state;
>> +
>> +    prepare_sysctrl_command(&command, cmd, &request,
>> +                sizeof(request), &response, sizeof(response));
>> +    guard(xe_pm_runtime)(xe);
>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (rlen != sizeof(response)) {
>> +        xe_err(xe,
>> +               "[RAS][SET_HEALTH]: invalid Sysctrl response length 
>> %zu (expected %zu)\n",
>> +               rlen, sizeof(response));
>
> Please keep error logs/ return codes consistent across multiple ras 
> patches
>
> Refer to the patch Intel Xe - Patchwork 
> <https://patchwork.freedesktop.org/series/160184/>. This will likely 
> be merged first
>
>> +        return -EPROTO;
>
> Is this the right error code for userspace? We do not expect user to 
> use any protocol.
> And system controller might fail due to its own errors.
>
>> +    }
>> +
>> +    ras_status = ras_status_to_errno(response.operation_status);
>> +    if (ras_status) {
>> +        xe_err(xe,
>> +               "[RAS][SET_HEALTH]: cmd 0x%x failed: fw_status=%u 
>> errno=%pe\n",
>> +               cmd, response.operation_status, ERR_PTR(ras_status));
>> +        return ras_status;
>> +    }
>> +
>> +    if (response.current_health > XE_RAS_HEALTH_STATUS_CRITICAL) {
>> +        xe_err(xe, "[RAS][SET_HEALTH]: invalid health state %u from 
>> Sysctrl\n",
>> +               response.current_health);
>> +        return -EPROTO;
>> +    }
>> +
>> +    health = (enum xe_ras_health_status)response.current_health;
>> +
>> +    xe_dbg(xe, "[RAS][SET_HEALTH]: current GPU health state=%d (%s)\n",
>> +           health, gpu_health_states[health]);
>
> Do we need this debug log since it is sysfs
Not strictly, but it represents the current health state after setting 
the new value, so it might be helpful when triaging health-state issues. 
Although It is gated by dynamic debug.
>
>> +
>> +    return count;
>> +}
>> +
>> +static struct device_attribute dev_attr_gpu_health_rw =
>> +    __ATTR_RW_MODE(gpu_health, 0600);
>> +
>> +static struct device_attribute dev_attr_gpu_health_ro =
>> +    __ATTR_RO_MODE(gpu_health, 0400);
>
> Use DEVICE_ATTR_ADMIN_RW/RO. More readable

DEVICE_ATTR_ADMIN_RW/RO(gpu_health) both expand to the same 
dev_attr_gpu_health symbol, causing a naming collision since we need two 
separate attribute instances (RW for PF, RO for VF)

Thanks,
Soham.

>
>> +
>> +static struct device_attribute *gpu_health_attr(struct xe_device *xe)
>> +{
>> +    return IS_SRIOV_VF(xe) ? &dev_attr_gpu_health_ro : 
>> &dev_attr_gpu_health_rw;
>> +}
>> +
>> +static void gpu_health_sysfs_fini(void *arg)
>> +{
>> +    struct device *dev = arg;
>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>> +
>> +    device_remove_file(dev, gpu_health_attr(xe));
>> +}
>> +
>> +static int gpu_health_indicator_sysfs_init(struct xe_device *xe)
>> +{
>> +    struct device *dev = xe->drm.dev;
>> +    int err;
>> +
>> +    err = device_create_file(dev, gpu_health_attr(xe));
>> +    if (err)
>> +        return err;
>> +
>> +    err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
>> +    if (err)
>> +        return err;
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * xe_ras_init - Initialize Xe RAS
>> + * @xe: xe device instance
>> + *
>> + * Initialize Xe RAS
>> + */
>> +void xe_ras_init(struct xe_device *xe)
>> +{
>> +    int ret;
>> +
>> +    if (!xe->info.has_sysctrl)
>> +        return;
>> +
>> +    ret = gpu_health_indicator_sysfs_init(xe);
>> +    if (ret)
>> +        xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, 
>> err=%d\n", ret);
>
> Should we fail probe here?
>
> Thanks
> Riana
>
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> new file mode 100644
>> index 000000000000..14cb973603e7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_RAS_H_
>> +#define _XE_RAS_H_
>> +
>> +struct xe_device;
>> +
>> +void xe_ras_init(struct xe_device *xe);
>> +
>> +#endif
