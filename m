Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E5FC61DC6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 12:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F0510E32D;
	Thu, 27 Aug 2026 12:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUKFiGpM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0524610E32D
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 12:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787832484; x=1819368484;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pt0Y9qUuhJjOUXkvDuqJriTIppZYt8z1Bxe7eXQ1YH8=;
 b=nUKFiGpMgkZRD4zbrlWMhKoVo6G6sTUdBKapV2Vu7AU/83dvxfVggbQ/
 26GgC90cfxfti1GGGOIqk3+bwC4dmxRh2LOQ+lswVnk857d6861ZkMW+R
 F/aTwoI3Aq37Y+c+Y7Qvuvjx8655H4McKyzRHxJpJBEcFJ7KTIB98eTKx
 qQTmCknBZq665gMM86NfpJoUUMp+ASdm6DaZJ4TmJ/UB7GC2quF7EW5bG
 oc6zVfERYAlGaG1SuX+jgJhJ5bFUdWDz9yRTEPacawEyuKx6p9jiYrpji
 EonBNTvIbLDz+89Dx+UWSStVQ29cvnkQjkC33kd1QP4z22f/L4/H5TnOR w==;
X-CSE-ConnectionGUID: NpEGQfF6Qkek/xi1QCTM+w==
X-CSE-MsgGUID: 1uauuvFBRy2U+/ahSje40g==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88383422"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88383422"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:08:03 -0700
X-CSE-ConnectionGUID: oe/hHFjVTKyp3vJ2KTgPCQ==
X-CSE-MsgGUID: ulkuxTLLQaSkpLdreYcokQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="297739701"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:08:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 05:08:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 05:08:02 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 05:08:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOp1hGSrpuQWwXnZjVaMe6Xl0JVj5payyTnSJotQz0V0TrjJ4w4uV2PE/k1uQU4g3M7cUTXMQ93KdzzqTV9dQgMIMqnZlup21fRq49N+mAgWbu+cKu9k7EJQZp2YyJKm9wbqcK9YCpyPpYdxlwiJbQl+dsaZj9yW759EzSU2c/iQ7PL/fQpDTVqbhwG9xW2LOU5mmVzodhdtOSOhPChRUYE/W+yuHulZeUAGlNm9VyKxBRwntEInbxu9eSDxZriVG4w3xWTvTvBfE1obgsB72G4pkFsEuP12yT0g3BbIbwThdRfSI0Ru0jwMjz9T6RQBVHMkF9k0ouY8rOR4nSoe0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmLZiP+53aJNi9MhHHmwg3lSzudL2Lke9BFSq5zR5Mw=;
 b=S3AKn/HoumaMbO5vxEyUl8cZHQDJG+FMhVqT3NQFZlbxWRSyQn6Y002Li+qWwy2LZTANIJNpruUl5kDfu7TzIUfO+eBmDQcEwdzFoS7Bnh2Izdl5q5aw0mtonTRmaBHory7woDxpyxXf2Dvozrm0a2zI/DE8TzrA5cLp+XzYVLeY1khjRBTlJ0fOwCb5Y26Shx3K7OxtrU30ebNQZ/BAjSskpWevVT2YZHp7X91HZw0I9T+2Qa2cINFcLD+xVXPJzAfUG9JB1zCBOlPSJ0Pz6wpyO4YHt8zD7nCy8CFPy9FA8bgZDafGx8BMt6/29MVpdDX21a6hzxmiTNtR7fx3QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by PH8PR11MB6660.namprd11.prod.outlook.com (2603:10b6:510:1c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 27 Aug
 2026 12:07:57 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0339.012; Thu, 27 Aug 2026
 12:07:56 +0000
Message-ID: <dd29aafc-1a33-42ef-8cc1-8593edbcce29@intel.com>
Date: Thu, 27 Aug 2026 17:37:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/xe/hwmon: Enable fan curve control support
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-7-karthik.poosa@intel.com>
 <4b1dd652-77d4-4f14-941d-3b53d04ffefe@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <4b1dd652-77d4-4f14-941d-3b53d04ffefe@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::12) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|PH8PR11MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e395cc-05c8-4bc5-3850-08df0433d45e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|10067099003|4143699003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: VjNt+CqtO9TY0eFV/AiuJLTKtOvdTg/FcR1ENEa9OyVntwBju6jcYulixLiNiiuqPtz/JmsWjaBBsW4ROX59vR3+8KfgNVXehtt8PZQ4q0WzLT2dthkUMQXYnKg3cAuiN5xQNb0oq+HuewTaP3HvKeYLRxdur+oJGBIwBid6e/n6YqM0Bz/LIZ1zH6A6ALQ8fLP3lhhtTky/eBs/sHSxrr9asxYE+Fr72I7lXMFd2EOwAyERDG8XnQY/On8kePbAK9iKrrIogjCFeUo5BSDT4mhq5XtOpLcVvQ7rHEo1I29zE8Cwk/Qk2wYAJOm0zBg5Dz8yv2v3QFPzRRy11797GxjreISKcVFpyYYJoN+AW8XwJiXfuuNW2OT3QC6AM6/PIsaduKi8IQu4So32MbHg1y+Cik4aCdqbW/B2bZjqIPm9D2p0TrF/+tNqVu5hLxUKhrbl5vyb+gFPPvvORKKwKoHyPS8PQwey8dsg8SsICkcO1fuNxYLn0tT/HWigjbAzSyu95K7jl1jKxwXXHcJwoh9wkFBvsk5hIhVxGgPSc1yYd19jFw4+Kp3aDn9/QUP7KTEImWRR/lE7i9dEt8dsjNQmHkT3S1+J2Vj6mspRbsLRnOHwLmiI8JWYpI8otYWSW0n+WrNXA9fan7dOPe4bRG5f/8q36DI9tBB3dY1oS/Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWZCU01raC9vZWhtdmR4bEdWRkoyZFg3blFTNWRrSGZoR3hhczJRVlV6b051?=
 =?utf-8?B?eG9KNGxXVjF2bURDZFU3TzAvNUtOSTVIN2wrRExXbkZXMEEwUWk3Y09meDgr?=
 =?utf-8?B?UmU5Zjd5QloraVpUNTFyYitEVTlxUk9BVEdsLzVsdjFTUEZiUCtHcnluYkxC?=
 =?utf-8?B?RGNOUVJqcDlneWV2NERUcTlCWjgxUUgxSTRGSHU4M3BGaGhsZ3F5REs0eXpQ?=
 =?utf-8?B?NXM5MTY5RHZqUHRKR21FK1VDVXpNTElIRHYvY1liZnlGV1JrUnYwS1ZQVWNT?=
 =?utf-8?B?YUtYcDA5bGVFalA1RlFmOW4vTXBIb1cyWVVzSSt0WWlKUkFqR2NEWFJaSFEy?=
 =?utf-8?B?d2JPOUE5dUFSeHFlZC9SYmRRZ2FpUkN5V1BhdlVpdTFyMEFVcEhucWRPSjBK?=
 =?utf-8?B?M0MrUTh4THdJMlJJNUN1Z21ZTnc2VGtlOTRjOFVVOFp0NzAxMDg5ZU5OejNv?=
 =?utf-8?B?Und5eHI3R1QyRE5pNU9wbDRZOE8yVnN2S1RGTnhRb0RuR21qVUhIbE1YWTZE?=
 =?utf-8?B?a1NqelRFbktHcjg4NWx4YUNTZHBiSERsbkd0V25KcS8vUXRpWlA5MTV0Wk52?=
 =?utf-8?B?aWFadlhvdCtndzQ0eTkvMERtSGM0Tk1VQXI3YWRnVkJyaTg1QnFaVjM4K2lr?=
 =?utf-8?B?SXIzanhrNEIyK0hoeFRFOEdSd1p0NE9tRThicjhtR0pSeFpOZFFrUHRBdHRT?=
 =?utf-8?B?RnRHWDRRV2R4WElhUmRYVWdvVDNjVWppekJzOGY1aDNNT09KOXNsODdpalBB?=
 =?utf-8?B?R2VKeUgwRkxJVTdsQ2xYOWhGOTRsMFJBYVZpWWJlNHZ3bzZFTEJURnplRUVK?=
 =?utf-8?B?b3R1R2RoVFUweTc2c3M2bTluUzJvOHkralVQNW4vZ2VrRGQ0Zmg2YnA0M1V6?=
 =?utf-8?B?MVBTODZ0UlFYMldFQ2xCMWNrenc1SktrTXhCQXhNSW45eGFoUXY2ZXhEUlM4?=
 =?utf-8?B?TWxHSUp6NkNScTFvSHoyeko1V3daYVpYV2xsSWExUXV1SHk1VnpTcjg3d2Rl?=
 =?utf-8?B?dDV5anVwZ3Y4ZHEvcWN6dTRISzd4TkhQaDRGajlGVTFJVEdpWElFUHlUQXIw?=
 =?utf-8?B?Vk1jSlcvSThDWWVVWTVRdlgzREE4VmJKM2syTWU5Wjdjemh1LzJVWlZzQ1Bz?=
 =?utf-8?B?cDkvMTJCVEoxVURBdzRFUXdFL09MS0dTelYvMmtFR05pZ1RUV3hIaGlMVlph?=
 =?utf-8?B?eE80WS9NYisyOFluTzM0TWYvOUlpNXlYeE0rTEF0N3MyN1lHVitQZ3l4dGZL?=
 =?utf-8?B?RmlhNFk3aEhtdXRnNkRLNUxueTVrUnFxYkZvRTVYTUlTZ000YVhyaXYzOVFQ?=
 =?utf-8?B?c09FZnErdzd6OXllLzJ3Uk5QNzJPR0dZMTh3N01CZGJFUlg2M2lsQ2w3ZUNS?=
 =?utf-8?B?aitLYVUyVE4zZi9GTzJIbHRXYnpUQ0ZOYkhYalF2KzBvNUZXbVJSWmdYSEJn?=
 =?utf-8?B?RGJKQkFWTkJSYU8rMkZPMXVLNXpQREs0VU1XZURIWXQ5czQ3NmNqaHhHSFMy?=
 =?utf-8?B?NlBxcy9YU1FSank4dm9WR0E0cFRlamdGQmVSVTF2MGl4RjBkVHVEci9Sa2ha?=
 =?utf-8?B?bGJ2NTdOd1c2NHZLNDhaZFZrOW1lVk0vaTZvUVQvRGlCNjlNdEhFRWVqOWVG?=
 =?utf-8?B?eHlYaFNhSGFoT3Z4RlloVGsvNCsrNys3bERkdUkwclYyQXBDYzZ4OGpZbUpO?=
 =?utf-8?B?S3dUVGJQc0FyYnBya2YxVHRyTzNVdkd4Sko2aHN4aHMzWjdEdkh4QlNnTkpP?=
 =?utf-8?B?Z1ViQjcrUHRzeE1hbndVZmo0dWxqbVNzQ3J2S0VyVDNQWm1KVWo5YzJpTno3?=
 =?utf-8?B?biswbTV0WkZpaDRnellkSGFjMlI0Q0UrUmhtZVpISUs0MVhZYXZMWng5OTB4?=
 =?utf-8?B?K1pkUFloWUpvN2IxcGExRW1DN2RreDZoY0lCcms5OVhHWFZIcFY1dUg2ck9i?=
 =?utf-8?B?bGhCa1pmM2w2MzYwTnFySEloYWw3SU5YWjJUVFFMeXZqR0xiWXRKRWppSjF3?=
 =?utf-8?B?YnhyQmJsaXZDYmV4UGsyMzljQjBKZHdldEh3ZE1aeTdvSDhzOEZyRFZ0T3hz?=
 =?utf-8?B?NUpwWHlhdng0T1hpdXBwZXlCd295NGFJdmlFMGJNREptREVHYUVoMmVGSFR6?=
 =?utf-8?B?bnNZQ1ZHL003UktZcEY1cWx0R2d0aFhIMis5dmFLcWdtTk12d1J5ZGRpdDBM?=
 =?utf-8?B?N0RkcGYzTjczRkl4clNHZmxjdUpQK0VKam5WWjNiWnJBZm9KVXJXR1lCbkti?=
 =?utf-8?B?SlRkbXZjaFJoRzhINzRXcUhNT3ZJNFo0eHZzODJ2OUk1ei9oRFord0pEQUdP?=
 =?utf-8?B?Ymg4QkRMd0pSeXEzTkQrZzExL1l6ZG41Zzc3RlJBekl3VFAyTnlxdz09?=
X-Exchange-RoutingPolicyChecked: mArvU2eeFPVUXdfIzpJYh4ZdiibLQ+4VkL4GzlUERB7C+9rcb1BT/W3LYymErNR1sZzsDFRIjDR3e5BUKxTx6OiDi2wi9geJyPZejHwrWpKe3m+09Xn7SLgGZQftJSTiTZ1EJcATwj2HyE0NLvC8VsXgNIs59gtgvxi7yUkro58yFVDfjna+CgHpldGPc+Pcir61byJQ6GW/YaKePa5vhgvrP8bgcxRbmltdRs6NgnzCn0k3zRSqHTnw7pJD4CCk+gq7teh533HNnfzOg2ozNA6zcJ59WKfXFIftQh9wLxwFxGuWNp5Q15zBwhHeyDpBRNwz3Sg5jBvJfKulQmUHFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e395cc-05c8-4bc5-3850-08df0433d45e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 12:07:56.7360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8C9o/6xjpxDJI5KSRofPbWyCOcgI9c2jMWTbGO2BLj//yAPZ85UMrxCMPMkQihJ7FLzWvzlyDPvK1F7PkGVBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6660
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


On 22-07-2026 23:46, Purkait, Soham wrote:
> Hi Karthik,
>
> On 17-07-2026 09:47, Karthik Poosa wrote:
>> Expose curve-point temperature and pwm controls via
>> pwmF_auto_point[P]_temp and pwmF_auto_point[P]_pwm, where
>> F is the fan number and P is the fan curve point number.
>> Each fan curve point has temperature and pwm sysfs.
>>
>> Update Xe hwmon ABI documentation for pwm auto point temperature
>> attributes.
>>
>> v2:
>> - Use xe helpers for dmesg logs.
>> - Update kernel version in Xe hwmon documentation.
>> - Correct debug level of some dmesg logs.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Assisted-by: Codex:gpt-5-4
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  16 +
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 700 +++++++++++++++++-
>>   2 files changed, 715 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index effc7d38ce1f..68cc6b99e8a5 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -341,3 +341,19 @@ Description:   RW. Fan control mode selector.
>>                  user table control and value 2 to use firmware 
>> default behavior.
>>                    Only supported for particular Intel Xe graphics 
>> platforms.
>> +
>> +What: 
>> /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_auto_point[1-10]_temp
>> +Date:          June 2026
>> +KernelVersion: 7.2
>> +Contact:       intel-xe@lists.freedesktop.org
>> +Description:   RW. Temperature in millidegree Celsius for each fan 
>> curve point.
>> +
>> +               Only supported for particular Intel Xe graphics 
>> platforms.
>> +
>> +What: 
>> /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_auto_point[1-10]_pwm
>> +Date:          June 2026
>> +KernelVersion: 7.2
>> +Contact:       intel-xe@lists.freedesktop.org
>> +Description:   RW. PWM duty value (0..255) for each fan curve point.
>> +
>> +               Only supported for particular Intel Xe graphics 
>> platforms.
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index fa9dbadd5fd6..a3ed139ad446 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -173,6 +173,10 @@ struct xe_hwmon_fan_info {
>>               /** @speed: fan speed in percentage */
>>               u8 speed;
>>           } fcp[MAX_FAN_CONTROL_POINTS];
>> +        /** @last_point_temp_valid: last user temperature point was 
>> written */
>> +        bool last_point_temp_valid;
>> +        /** @last_point_speed_valid: last user PWM point was written */
>> +        bool last_point_speed_valid;
>>       } fan_table[FAN_TABLE_MAX];
>>           /** @max_rps: maximum fan RPS */
>>           u32 max_rps;
>> @@ -779,8 +783,11 @@ static const struct attribute_group 
>> hwmon_attrgroup = {
>>       .is_visible = xe_hwmon_attributes_visible,
>>   };
>>   +static const struct attribute_group hwmon_curve_attrgroup;
>> +
>>   static const struct attribute_group *hwmon_groups[] = {
>>       &hwmon_attrgroup,
>> +    &hwmon_curve_attrgroup,
>>       NULL
>>   };
>>   @@ -945,7 +952,7 @@ static int xe_hwmon_get_num_fans(const struct 
>> xe_hwmon *hwmon, u32 *num_fans)
>>   }
>>     static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, 
>> u8 fan, u32 *point_count,
>> -                    int table_type)
>> +                    enum fan_table_type table_type)
>>   {
>>       int ret;
>>   @@ -960,6 +967,16 @@ static int xe_hwmon_get_fan_point_count(struct 
>> xe_hwmon *hwmon, u8 fan, u32 *poi
>>           return ret;
>>       }
>>   +    xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
>> +           (table_type == USER_FAN_TABLE) ? "user" : "stock", 
>> *point_count);
> Remove duplicate log.
ok
>> +
>> +    if (*point_count > MAX_FAN_CONTROL_POINTS) {
>> +        xe_err(hwmon->xe, "fan %d %s point count %u exceeds max 
>> %u\n", fan,
>> +               (table_type == USER_FAN_TABLE) ? "user" : "stock", 
>> *point_count,
>> +               MAX_FAN_CONTROL_POINTS);
>> +        return -EINVAL;
>> +    }
>> +
>>       xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
>>              (table_type == USER_FAN_TABLE) ? "user" : "stock", 
>> *point_count);
>>   @@ -985,6 +1002,60 @@ static int 
>> xe_hwmon_write_user_fan_point(struct xe_hwmon *hwmon, u8 fan, u8 poin
>>       return ret;
>>   }
>>   +static int xe_hwmon_commit_user_fan_table(struct xe_hwmon *hwmon, 
>> u8 fan)
>> +{
>> +    struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +    u32 point_count = 
>> fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
>> +    int point;
>> +    int ret;
>> +
>> +    if (!point_count)
>> +        return -ENODATA;
>> +
>> +    for (point = 0; point < point_count; point++) {
>> +        u8 temp = fi->fan_table[USER_FAN_TABLE].fcp[point].temp;
>> +        u8 speed = fi->fan_table[USER_FAN_TABLE].fcp[point].speed;
>> +
>> +        /* Ensure fan control points are strictly increasing order */
>> +        if (point > 0) {
>> +            u8 prev_temp = fi->fan_table[USER_FAN_TABLE].fcp[point - 
>> 1].temp;
>> +            u8 prev_speed = fi->fan_table[USER_FAN_TABLE].fcp[point 
>> - 1].speed;
>> +
>> +            if (temp < prev_temp || speed < prev_speed) {
>> +                drm_dbg(&hwmon->xe->drm,
>> +                    "fan %d invalid user point previous value > 
>> current %d: %u/%u prev=%u/%u\n",
>> +                    fan, point, temp, speed, prev_temp, prev_speed);
>> +                return -EINVAL;
>> +            }
>> +        }
>> +
>> +        drm_dbg(&hwmon->xe->drm,
>> +            "committing fan %d user point %d temp %u, speed %u %%\n",
>> +            fan, point, temp, speed);
>> +        ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, 
>> speed);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>> +    drm_dbg(&hwmon->xe->drm,
>> +        "committing fan %d user table with %d points\n", fan, 
>> point_count);
>> +    ret = xe_pcode_write_timeout(root_tile, 
>> PCODE_MBOX(FAN_SPEED_CONTROL,
>> + FSC_WRITE_NUM_FAN_CONTROL_POINTS,
>> +                               fan),
>> +                     point_count, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
>> +    if (ret) {
>> +        drm_dbg(&hwmon->xe->drm,
>> +            "failed to update fan %d user table count, ret=%d\n", 
>> fan, ret);
>> +        return ret;
>> +    }
>> +
>> +    fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
>> +    fi->is_full_speed = false;
>> +
>> +    return 0;
>> +}
>> +
>>   static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, 
>> u8 fan,
>>                           bool is_full_speed, enum fan_table_type 
>> table_source)
>>   {
>> @@ -1105,6 +1176,633 @@ static int xe_hwmon_set_user_fan_pwm(struct 
>> xe_hwmon *hwmon, u8 fan, u8 pwm)
>>       return 0;
>>   }
>>   +#define XE_CURVE_IDX(fan, point)    (((fan) << 8) | (point))
>> +#define XE_CURVE_FAN(idx)        ((u8)(((idx) >> 8) & 0xff))
>> +#define XE_CURVE_POINT(idx)        ((u8)((idx) & 0xff))
>> +
>> +static int
>> +xe_hwmon_decode_curve_index(u32 index, u8 *fan, u8 *point)
>> +{
>> +    u8 local_fan = XE_CURVE_FAN(index);
>> +    u8 local_point = XE_CURVE_POINT(index);
>> +
>> +    if (local_fan >= FAN_MAX || local_point >= MAX_FAN_CONTROL_POINTS)
>> +        return -EINVAL;
>> +
>> +    *fan = local_fan;
>> +    *point = local_point;
>> +
>> +    return 0;
>> +}
>> +
>> +static inline enum fan_table_type 
>> xe_hwmon_get_active_fan_table(struct xe_hwmon *hwmon, u8 fan)
>> +{
>> +    if (hwmon->fi[fan].pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE)
>> +        return STOCK_FAN_TABLE;
>> +    else
>> +        return USER_FAN_TABLE;
>> +}
>> +
>> +static ssize_t
>> +xe_hwmon_pwm_auto_point_temp_show(struct device *dev,
>> +                  struct device_attribute *attr, char *buf)
>> +{
>> +    struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +    struct xe_hwmon_fan_info *fi;
>> +    u32 point_count;
>> +    u8 fan;
>> +    u8 point;
>> +    u8 temp;
>> +    int ret;
>> +    enum fan_table_type active_table;
>> +
>> +    ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
>> +    if (ret)
>> +        return ret;
>> +
>> +    fi = &hwmon->fi[fan];
>> +    active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
>> +
>> +    guard(xe_pm_runtime)(hwmon->xe);
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    fi = &hwmon->fi[fan];
>> +
>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>> active_table);
>> +    if (ret)
>> +        goto unlock;
>> +
>> +    if (point >= point_count) {
>> +        ret = -EINVAL;
>> +        goto unlock;
>> +    }
>> +
>> +    temp = fi->fan_table[active_table].fcp[point].temp;
>> +    ret = sysfs_emit(buf, "%u\n", temp * MILLIDEGREE_PER_DEGREE);
>> +
>> +unlock:
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +    return ret;
>> +}
>> +
>> +static int xe_hwmon_update_user_fan_point(struct xe_hwmon *hwmon, u8 
>> fan, u32 point,
>> +                      u32 point_count, u8 temp, u8 pwm)
>> +{
>> +    struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +    int ret;
>> +
>> +    if (temp) {
> But as per the xe_hwmon_get_u8_from_sysfs() "0" is a acceptable curve 
> point then, why is it being over loaded here ?
>
> Thanks,
> Soham
The intention here was to indicate whether the update is for the 
temperature or PWM field of a fan-curve point.
instead, we can pass an explicit enum describing which field is being 
updated

enum xe_hwmon_fan_point_field {
XE_FAN_POINT_TEMP,
XE_FAN_POINT_PWM,
};

>> + fi->fan_table[USER_FAN_TABLE].fcp[point].temp = temp;
>> +        if (point == (point_count - 1))
>> + fi->fan_table[USER_FAN_TABLE].last_point_temp_valid = true;
>> +    } else {
>> +        fi->fan_table[USER_FAN_TABLE].fcp[point].speed = pwm;
>> +        if (point == (point_count - 1))
>> + fi->fan_table[USER_FAN_TABLE].last_point_speed_valid = true;
>> +    }
>> +
>> +    /* Cache intermediate points and commit once the last point 
>> arrives. */
>> +    if (point == (point_count - 1) &&
>> +        fi->fan_table[USER_FAN_TABLE].last_point_temp_valid &&
>> + fi->fan_table[USER_FAN_TABLE].last_point_speed_valid) {
>> +        ret = xe_hwmon_commit_user_fan_table(hwmon, fan);
>> +        if (ret)
>> +            return ret;
>> +        fi->fan_table[USER_FAN_TABLE].last_point_temp_valid = false;
>> +        fi->fan_table[USER_FAN_TABLE].last_point_speed_valid = false;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int xe_hwmon_get_u8_from_sysfs(long val, bool is_temp, u8 *out)
>> +{
>> +    long hw_val;
>> +
>> +    if (is_temp)
>> +        hw_val = DIV_ROUND_CLOSEST(val, MILLIDEGREE_PER_DEGREE);
>> +    else
>> +        hw_val = DIV_ROUND_CLOSEST(val * 100, U8_MAX);
>> +
>> +    if (hw_val < 0 || hw_val > U8_MAX)
>> +        return -EINVAL;
>> +
>> +    *out = hw_val;
>> +
>> +    return 0;
>> +}
>> +
>> +static ssize_t
>> +xe_hwmon_pwm_auto_point_temp_store(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   const char *buf, size_t count)
>> +{
>> +    struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +    struct xe_hwmon_fan_info *fi;
>> +    u8 fan;
>> +    u8 point;
>> +    u32 point_count;
>> +    u8 temp;
>> +    long val;
>> +    int ret;
>> +
>> +    ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
>> +    if (ret)
>> +        return ret;
>> +
>> +    fi = &hwmon->fi[fan];
>> +
>> +    if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
>> +        drm_err(&hwmon->xe->drm,
>> +            "pwm%d_enable not in manual mode; cannot update temp 
>> point %d\n",
>> +            fan, point);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = kstrtol(buf, 10, &val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = xe_hwmon_get_u8_from_sysfs(val, true, &temp);
>> +    if (ret)
>> +        return ret;
>> +
>> +    guard(xe_pm_runtime)(hwmon->xe);
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>> USER_FAN_TABLE);
>> +    if (ret)
>> +        goto unlock;
>> +
>> +    if (point >= point_count) {
>> +        ret = -EINVAL;
>> +        goto unlock;
>> +    }
>> +
>> +    drm_dbg(&hwmon->xe->drm,
>> +        "updating fan %d point %d temp to %u, pwm %u\n", fan, point,
>> +        temp, fi->fan_table[USER_FAN_TABLE].fcp[point].speed);
>> +    ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, 
>> point_count, temp, 0);
>> +
>> +unlock:
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +    return ret ? ret : count;
>> +}
>> +
>> +static ssize_t
>> +xe_hwmon_pwm_auto_point_pwm_show(struct device *dev,
>> +                 struct device_attribute *attr,
>> +                 char *buf)
>> +{
>> +    struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +    struct xe_hwmon_fan_info *fi;
>> +    u8 fan;
>> +    u8 point;
>> +    u32 point_count;
>> +    int ret;
>> +    enum fan_table_type active_table;
>> +
>> +    ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
>> +    if (ret)
>> +        return ret;
>> +
>> +    fi = &hwmon->fi[fan];
>> +    active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
>> +
>> +    guard(xe_pm_runtime)(hwmon->xe);
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>> active_table);
>> +    if (ret)
>> +        goto unlock;
>> +
>> +    if (point >= point_count) {
>> +        ret = -EINVAL;
>> +        goto unlock;
>> +    }
>> +
>> +    ret = sysfs_emit(buf, "%u\n",
>> + DIV_ROUND_CLOSEST(fi->fan_table[active_table].fcp[point].speed * 
>> U8_MAX,
>> +                       100));
>> +
>> +unlock:
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +    return ret;
>> +}
>> +
>> +static ssize_t
>> +xe_hwmon_pwm_auto_point_pwm_store(struct device *dev,
>> +                  struct device_attribute *attr,
>> +                  const char *buf, size_t count)
>> +{
>> +    struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +    struct xe_hwmon_fan_info *fi;
>> +    u32 point_count;
>> +    long val;
>> +    u8 point;
>> +    u8 fan;
>> +    u8 pwm;
>> +    int ret;
>> +
>> +    ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
>> +    if (ret)
>> +        return ret;
>> +
>> +    fi = &hwmon->fi[fan];
>> +
>> +    if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
>> +        drm_err(&hwmon->xe->drm,
>> +            "pwm%d_enable is not in manual user mode, cannot update 
>> pwm point %d\n",
>> +            fan, point);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = kstrtol(buf, 10, &val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = xe_hwmon_get_u8_from_sysfs(val, false, &pwm);
>> +    if (ret)
>> +        return ret;
>> +
>> +    guard(xe_pm_runtime)(hwmon->xe);
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>> USER_FAN_TABLE);
>> +    if (ret)
>> +        goto unlock;
>> +
>> +    if (point >= point_count) {
>> +        ret = -EINVAL;
>> +        goto unlock;
>> +    }
>> +
>> +    pwm = max_t(u8, pwm, fi->min_pwm);
>> +
>> +    drm_dbg(&hwmon->xe->drm, "updating fan %d point %d pwm to %u\n",
>> +        fan, point, pwm);
>> +    ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, 
>> point_count, 0, pwm);
>> +
>> +unlock:
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +    return ret ? ret : count;
>> +}
>> +
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point1_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 0));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point1_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 0));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point2_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 1));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point2_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 1));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point3_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 2));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point3_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 2));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point4_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 3));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point4_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 3));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point5_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 4));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point5_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 4));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point6_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 5));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point6_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 5));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point7_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 6));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point7_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 6));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point8_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 7));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point8_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 7));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point9_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 8));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point9_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 8));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point10_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(0, 9));
>> +static SENSOR_DEVICE_ATTR(pwm1_auto_point10_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(0, 9));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point1_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 0));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point1_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 0));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point2_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 1));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point2_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 1));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point3_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 2));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point3_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 2));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point4_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 3));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point4_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 3));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point5_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 4));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point5_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 4));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point6_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 5));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point6_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 5));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point7_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 6));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point7_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 6));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point8_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 7));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point8_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 7));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point9_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 8));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point9_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 8));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point10_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(1, 9));
>> +static SENSOR_DEVICE_ATTR(pwm2_auto_point10_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(1, 9));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point1_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 0));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point1_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 0));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point2_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 1));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point2_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 1));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point3_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 2));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point3_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 2));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point4_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 3));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point4_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 3));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point5_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 4));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point5_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 4));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point6_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 5));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point6_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 5));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point7_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 6));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point7_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 6));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point8_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 7));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point8_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 7));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point9_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 8));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point9_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 8));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point10_temp, 0644,
>> +              xe_hwmon_pwm_auto_point_temp_show,
>> +              xe_hwmon_pwm_auto_point_temp_store,
>> +              XE_CURVE_IDX(2, 9));
>> +static SENSOR_DEVICE_ATTR(pwm3_auto_point10_pwm, 0644,
>> +              xe_hwmon_pwm_auto_point_pwm_show,
>> +              xe_hwmon_pwm_auto_point_pwm_store,
>> +              XE_CURVE_IDX(2, 9));
>> +
>> +static struct attribute *hwmon_curve_attributes[] = {
>> +    &sensor_dev_attr_pwm1_auto_point1_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point2_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point3_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point4_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point5_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point6_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point7_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point8_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point9_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point10_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point2_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point3_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point4_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point5_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point6_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point7_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point8_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point9_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm1_auto_point10_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point1_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point2_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point3_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point4_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point5_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point6_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point7_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point8_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point9_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point10_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point2_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point3_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point4_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point5_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point6_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point7_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point8_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point9_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm2_auto_point10_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point1_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point2_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point3_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point4_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point5_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point6_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point7_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point8_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point9_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point10_temp.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point1_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point2_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point3_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point4_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point5_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point6_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point7_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point8_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point9_pwm.dev_attr.attr,
>> +    &sensor_dev_attr_pwm3_auto_point10_pwm.dev_attr.attr,
>> +    NULL
>> +};
>> +
>> +static umode_t xe_hwmon_curve_attributes_visible(struct kobject *kobj,
>> +                         struct attribute *attr, int index)
>> +{
>> +    struct device *dev = kobj_to_dev(kobj);
>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +
>> +    /* Temp/PWM pairs for each point. */
>> +    u32 attrs_per_fan = 2 * MAX_FAN_CONTROL_POINTS;
>> +    u32 fan = index / attrs_per_fan;
>> +    u32 local = index % attrs_per_fan;
>> +    u32 point_count;
>> +
>> +    if (!hwmon->xe->info.has_fan_control)
>> +        return 0;
>> +
>> +    if (fan >= hwmon->num_fans)
>> +        return 0;
>> +
>> +    point_count = 
>> max(hwmon->fi[fan].fan_table[USER_FAN_TABLE].fan_control_point_count,
>> + hwmon->fi[fan].fan_table[STOCK_FAN_TABLE].fan_control_point_count);
>> +
>> +    if (!point_count)
>> +        return 0;
>> +
>> +    if (local < MAX_FAN_CONTROL_POINTS)
>> +        return (local + 1) <= point_count ? attr->mode : 0;
>> +
>> +    if (local < (2 * MAX_FAN_CONTROL_POINTS))
>> +        return (local - MAX_FAN_CONTROL_POINTS + 1) <= point_count ?
>> +            attr->mode : 0;
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct attribute_group hwmon_curve_attrgroup = {
>> +    .attrs = hwmon_curve_attributes,
>> +    .is_visible = xe_hwmon_curve_attributes_visible,
>> +};
>> +
>>   static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>>   {
>>       struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
