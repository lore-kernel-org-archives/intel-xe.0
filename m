Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705C2C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 06:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032DB10E3CB;
	Wed, 12 Aug 2026 06:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1cxHM5+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD49110E3CB
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 06:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786517741; x=1818053741;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=90K+6Oirz1gOkICafpgg17y0Lks5nseYqbrsTKS7uOc=;
 b=N1cxHM5+nUx+X/ZChNcQhAno8pBeVYO9uOLiU900aCFN4WoQPUYChX7h
 wBR4WWnGMG/hmOxV0Jj6OHYDDQzD6uStzie9h2rhjU+0SQ7cWhnKwupJM
 uOqvroj4LS/AlsnmJpDrDiDJUHT/n2Zp/OjqxGVS9kslk3bTBqgiUEM/F
 ep1cLeUVtJtKwgpDNKlof0SHzuIVC7pOQuItGD/QUvxpVsS32Hul1+pPX
 oPSr26OuKHtOfLahimRwkiaCjYtuedlNJlOJC3+bZKTGNMlgDJAf7Mo8O
 mOZYIeQZT1lWCp4jfTGrQjDJyDzzYDfGr1nHV8HE73YdGmumRjcsrNlGl A==;
X-CSE-ConnectionGUID: 7ejSSIHaQZuy9uDsb26/Fg==
X-CSE-MsgGUID: AKkZ7nQ6Si+OD/4S3CZxuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86936290"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="86936290"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 23:55:40 -0700
X-CSE-ConnectionGUID: t7iBuhSZSlGW94gAvf2VEQ==
X-CSE-MsgGUID: ZOOJMHg9Q+STOgTz5hcU9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="257362797"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 23:55:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 23:55:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 23:55:39 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 23:55:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlgjPQn6jYJEs4WGlaVBfEobPwyVs3O+zTK2uanu/fVUv009B7DfUgM11cSqXM0U1e1du4yrggW0uDqJGWSb9VLs1/ZG+kljl0GneXaon9OP/qnBOE5cfYqOSeJXiIjnsgl7/PxSxJaqoyAz3btOXRb7oM/19eBn8kM2kSmn3IrVCckhMFAIUIhp3o3sqc79UvSNj8Vz1xqkO78WhVLRd0VwXGPUYiJr/PVTiP4mFEI0zD5pVa2/+8a0Tkcj6nl1WBb8Q76hjnT7D53GJJ1pN66htSxRQKFMb2snxCdnOHTKAatS1RzBz4yUgrG0f/OaGPuDzJvQ/EH82lD5BQFoYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Za2OFzG8CvJkcXx5DArEkJbGPb5VVq2IzvZhKYCraYY=;
 b=VlbIBg6jZSi/OGb6N+MTXHUztKEOZe+KFPdyyM6BoyYoAPTr4RsAUHXQjGcG+d6jBakYKhjZuPzplyCA543zjajYqsSvUBI1O4sIPbMzYX9AxfkahJ4dHRKl2RiDu7hO01fZ4G1y/kjNARo5eM7gebQ6fB3AZ0rUpsTYebe1rNJwZJVv0exOEU19y+RHKiBO6fG3kXzkr0jf8cqEF1Oew228OhkX965BoQZbiA52tfuMgAmI/QiLvIxKxZLxZMxqkQpIQT01SsXHokFhsVYn6IFZyx9lbuAIxwpR2wR6SqMA5+i053O6rrFHKVaC3PJ5Qzig1C5qQjGD/SPYg7oTwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB6923.namprd11.prod.outlook.com (2603:10b6:806:2aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 06:55:35 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 06:55:35 +0000
Message-ID: <ce505796-9927-4b5c-86e4-4657d51f30b7@intel.com>
Date: Wed, 12 Aug 2026 12:25:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/23] drm/xe/log: Extend components list with hardware
 items
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-12-michal.wajdeczko@intel.com>
 <f70d047f-021a-4ac0-892e-3af837aca082@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <f70d047f-021a-4ac0-892e-3af837aca082@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0235.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: bf41a0f6-b619-49c8-55c1-08def83eb586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|10067099003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: WU5htwAm0gYue9WVyq3d7/zoLNgzzs9Ij2Gh541KbL1If3WwTw8v9y+OIQTZLezPEq9Un/4bUhR797319hLGrwC6v5EdMwsK1oRd+WqsBkH0f6ddyXwsMZo5skFMeYRQSQEYxbLCkYkLBwjobTFG00qs/NvODFpZSaUuiusJWBrBNU5XQ3t9v8FRkmBazSc/zQ8AWrOszPGqrafkmw5pYqTvFjrgEcElzqIOCsa79sWgrTcCI3CeyCaXUwHU2rOE9jVsoHqYYudasZjbwOv9xpH2K430LaafEycaUlVV9frP9OA9vC++Hr590gzr8yvjYY1pOU4VXeDvt02/zd6wHbeMx4zPzXAwulszexAOZCmSSzFqiedQXvf7ejHaPqybabmoJCyZZcKp5Qo1ckup7wc0a+W15tXQv4fUO9sM2aA11l/M84eVVzieQE2Ogd2u/5qTe2Cj98aIF9JV3C0jD2sky494IV4UWtBbgFo4ro93CjxQ9/O+Wak/dj/Kt50bX4PqCpiJCA/tQKqi6P3RF168nsbFqqt1lNe8ZLJj4y79ucz1u0SbZhRBMho121YFbn4lRvb1Lw4nc2iwwFuROrirs4jkLKg8uzxbpFLCyU5JUUOnKhBbAKxAb6GpRxy2k9y+FYeZISqh3AAAf6V9JpvCXSi9mgffJ8VkBzjjkbc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWFqd3AzSE9XV3o3Ykh0Z0xtSFJqSjFtakd0TG9iL3JBNGhicGNQRnR1QlZL?=
 =?utf-8?B?b1VQNWZVS1EzT0NZZzZMUVV6UWRhcGF6TUxyYm1vanFodlRrQTlnWGY0N3A0?=
 =?utf-8?B?MlZqcTl0OEtsUVhiWjJSdE4wbGZic0QrL3AvV0ttVWFaWSswRmNDMU9oUXZl?=
 =?utf-8?B?Q2tScGkvbHBJRGtjSUZoWDZrRlo1N1VxaWhjaUN1UzcrcjlMWHVaYWZEeGx0?=
 =?utf-8?B?cWdlMmphSnlsSUkyUVA3NFpsTUZTQ1BWK0Yza2Q5cTJYNUYvd21pVU80NkZs?=
 =?utf-8?B?UXkrdVFud3pDZytDMVczMitSc05zbWJTcEpEdDBqb3RFdlllTy9mandHb2Q4?=
 =?utf-8?B?UE1iODlpamFDY0ZiNG0rYVBiakJiYjNXbWJCTUZJY3JqLzl4QVM2UHJhNUJq?=
 =?utf-8?B?NWlpL1NIOGRCWEZpKzkxU0orb3p5MG5FL05yT1BCNmU1NXpnblZ1Tjg1SkND?=
 =?utf-8?B?SFpuYndUckUrcE4vM1Mzd0t4aTM0dS9KWUJsckY3MlVmSkthWnVrV1YxQW9U?=
 =?utf-8?B?RFNzNDU2a1VKa05acDYzd2VsMXEzOGZxeFQycUZsWU9GMjl3Z0o4NjVaVXhQ?=
 =?utf-8?B?THBtTjQrME41d2pXenR5UU1uRHZ6b2JZYldTNzBvZDU3RlkzU2ZPUGFXQnpN?=
 =?utf-8?B?OElNczFyeEQ4MUUzbW5jekpHLy82SnMwekJMUml1Wkp2M1JxVmlLUWZEeHhX?=
 =?utf-8?B?UFNjenVBTVZreWtOd1FmTUplQkF5Y1UrRzM1UTF5Nm1OUXJ3bTd6dTRSZFBK?=
 =?utf-8?B?cFFsVGhjeEdGQ2kzRGVPWTdscFJiMEpVS2YxOU1OWXN2RU04c092SDhlNjBT?=
 =?utf-8?B?ZTEwK0JUdlNidFkwVytxaVBxbzRyYmc1SDFzdG1EV29hbEdRQTkrcktTUHI5?=
 =?utf-8?B?aklOU2tvQmZFYVhMQmxFSWVSVUNXYTFaR25xbUErTVNpWVBHSVgwem5FWXZr?=
 =?utf-8?B?dmlqbjZCZDlTOHdIVzRWNkxSOWxraDFvNDZFbm1oTVJzaTZTbUxPZUREandn?=
 =?utf-8?B?UmNmRjI4RFJaNE0vSUZpdXpyc3lHcWxRcWkweVVKNlJjK3hwbGpRZG9RbzVZ?=
 =?utf-8?B?YW84M2tHQmY2UktWaVl0Yzl1VzFXaXR6Mk5aYzZScm53dTREUlhicHFMZGpN?=
 =?utf-8?B?M3JscnJiMFU0TjBZWEp4S2liV2ZvdkEwNlNKRnA5bmhGNlRpbzZwMEpXb0dk?=
 =?utf-8?B?bmFiQlZVRTBVbTgwaEtES3dpalhZZHJhNTJpRVQ3RC9BUlIrYllUUEJZN0w0?=
 =?utf-8?B?UVN3M3ZPZ0lMZVMvaU04RzBDeHhZbnZGUm1iZXZSMUhrL1JBMDBtZnNxeUVu?=
 =?utf-8?B?dFhMbnU3N3FSaWRVQ3FoOG9vdzJKd1lwdE54dzZFKy9kV1AydlBJblJwcmQy?=
 =?utf-8?B?Z2o2c3hrK3JheEdXSERWWlNkZlhSWEV3TTdZc2hzOUtjaTh1SkpSUTRucElh?=
 =?utf-8?B?WmhoV2UwOGFUc2tXUEkrUitoOFhpZjM4azVCRk8ybGRzY3c5QkdhNnRxNHlW?=
 =?utf-8?B?VEllOXp4ejNNZkJDUkJlZVcxNE1yZ1h6SnVPSXIxVHVEMnhSdnFMcjRuNFBE?=
 =?utf-8?B?S2FqU3NwbWx4VU0ydnVYa2p0YllrdEtRZGlwVmJOLzBlN29lTXpabFpqOFBS?=
 =?utf-8?B?T0c4b0RvQ3lJNkJzcVpYbUtoQitQZFBXTjlMRjFkcFRxdytHQ1k5QXRMaXQ2?=
 =?utf-8?B?R3JXTWo0aVpxc1pBVHU3TGVrOGlaNmR0SkwxNk4wbU0waWd6M083Qk5mOUIv?=
 =?utf-8?B?OTRvSkFHOWFKVG9UaE5BUzdCMCt6ZHdUTWM2amxlcWFRK2VtUkpjK3hNNGhW?=
 =?utf-8?B?a3FhakFTWWRiZkRwNllUVk14V1NyRkRqc0l2N1B6NGNRQ3FWNHhQSTBhTkZq?=
 =?utf-8?B?QTdsY1JIUEtJK3VLZVlaTGZtL2tZci9vZUlaUEJNaG1XYVJ5bWFzRFFsWG5x?=
 =?utf-8?B?a0I5NEIzaUFVZ1ZEUkNvQ1NIWWRseVlFTGVUTmZVbFJJb1VaUnpadjk5UzlX?=
 =?utf-8?B?WlVuZE9nZHpPSHNVd3lwL2xOMW11eEh4V2JSTUhBSFhsbkVIVllvU09JbUd6?=
 =?utf-8?B?N2tjODRjalU4KzAvbHlHOHJ0Snc5SG5ja3cySmtQbGlsMWIxdkU2cVU5cUNp?=
 =?utf-8?B?Z2NuMGlkQWJpV2FYOFlnRVhRU1RPd25ya3pBYnA4K2J0MlNFc0Jwbk01YjNh?=
 =?utf-8?B?dHB4YXhDcTJnT25COTRMYW8yTXRlWG5vQXlqUWtDNldtaHlQa2IrZG1HMFAy?=
 =?utf-8?B?UHpqVHZMUTZhVHRwa0RQR0hEQnZCU3JjR2hnYmpxamJOWjMyZU5vdU45c2ly?=
 =?utf-8?B?NVVucGs2T2NJTnpxUldWUWViL2VOaUdUZmNMQWs5NnZTaU5veDkvUT09?=
X-Exchange-RoutingPolicyChecked: sLMb2JKdsZEr0wy4jq3wdRjWK4HF92WhJufnpquDJXwtr/1JFg3saTAxysdA/2XGO6hKwCz1gRju2fc4dbaBibpoGLK0sNELerCkh0DDS+WSihTdw8n4kGvEcBNqry9yEcJBguNSn+IjRAAYrMlTKk66YkvGOGHhunNpn+1A/T/PqmV67OWE/T4hO6hiDPt98l1DzHZAwovo53x+wj+ceEATLQBE4VxJQO84md0kHjmYVVqpmLil2DlAtuXK3F4y75ol7NvVRLr4KMtqaHAnRt7TUEziTaq3+xyqvE72jUHzoxS8pu1g3Y1Lg8G2tKITIJZtJ51g/f3TQubNL368gw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bf41a0f6-b619-49c8-55c1-08def83eb586
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 06:55:35.4077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yi7OCl8jicX0NgZfthacOWQKkWeDCcP9FenWW5ULo3skBfu+eERQGuqy7/kkOflkv7UeHoafRkdjkpQA6b9DGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6923
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


On 04-08-2026 11:35, Mallesh, Koujalagi wrote:
>
> On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
>> Update our super macro with new top level hardware components.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> LGTM,
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> ---
>> v2: follow enum xe_ras_component values (Aravind)
>> ---
>>   drivers/gpu/drm/xe/abi/xe_log_abi.h | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h 
>> b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> index 4861a5b58c10..b3373d4b29d5 100644
>> --- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> @@ -129,6 +129,10 @@ enum xe_log_location_bits {
>>    *     @SIGID is the default xe_sigid for the component (without 
>> the XE_SIGID_ prefix)
>>    */
>>   #define DEFINE_XE_LOG_COMPONENTS(define) \
>> +    DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
>> +    DEFINE_XE_LOG_HARDWARE_COMPONENTS(define)
>> +
>> +#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
>>       /* */                                    \
>>       define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")            \
>>       define(SYSTEM, 2, DRM, SW, "DRM")                    \
>> @@ -156,6 +160,14 @@ enum xe_log_location_bits {
>>       define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")            \
>>       define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, 
>> "PCode")            \
>>       define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System 
>> Controller")    \
>> +
>> +#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
>> +    define(HARDWARE, 1, DEVMEM, DEVICE_MEMORY, "Device 
>> Memory")        \

DEVICE_MEMORY

>> +    define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")        \

Core_compute

>> +    /*     HARDWARE, 3, RESERVED */                        \
>> +    define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")            \
>> +    define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")                \
>> +    define(HARDWARE, 6, SOC, SOC_INTERNAL, "SoC Internal")            \
SOC_INTERNAL

Let's retain the names same as UAPI to avoid unnecessary confusion while 
collecting CPER logs.

These names were asked to be retained similar to actual hardware error 
classification even for uapi.

++@Aravind

Thanks
Riana


>>       /* eod */
>>     /**
