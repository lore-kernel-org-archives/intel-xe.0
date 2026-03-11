Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88C5112583B
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 14:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E6D10E93E;
	Wed, 11 Mar 2026 14:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIDQiYyg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97DA10E944
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 14:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773239993; x=1804775993;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G8XdT5M+occzI92kQhrv/KSNxBAXj6jFlF1tK1JCSrU=;
 b=JIDQiYygxjeZt1rj8LsEGKnS1yUaL/4VlzVh4fimXP4S0sS8JFl9oV9M
 +Pn3PHrh3oOIhk6N76pqkiSWMMYPmUjwFAaHZh46J95CEDW4YDljuBP8o
 rKlar2qTjs1Skp1b37W2AWj7eBfNGWlnY7sASeCOgXAOKh3XYyU/49WTx
 VekuiYFeLXCxrW5UUIlA3/p+IXUExRMa6AoMDPi2VXTrsRpUIGbAFwskl
 mJjzaoDlJ2IPBeSfpvon8Y7YEGvnaM8mYK0S70g9PxJ3qZuZdnFJwJpY/
 vHNWccsj4eGL5bHl1vR2Fbm7wAmUvyKER87XdWt3RSfVJhgsqrQK3Y9KO w==;
X-CSE-ConnectionGUID: CtUfWfwsQwyBlO/FQ0oe0g==
X-CSE-MsgGUID: dXIOH+oeTrOoNYUpdS0ZLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85397717"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="85397717"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:39:52 -0700
X-CSE-ConnectionGUID: 1mz47ZhkSTi6e8suN8i96g==
X-CSE-MsgGUID: COj/FxyCSXqgBnHiUoWY8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="220661052"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:39:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 07:39:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 07:39:51 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 07:39:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCKR6hQB3dWL/vWHYUyEvX0WfvQ6slTamnMFnQ1iPkygyJRqOM8OMP0a6ugoKsf1qiCmv8DP5+CvxO+vNGY4KAXV1W6pxgDq+Eirgv8BQQn1Wzr6fl0GTdxN2BLsHMGQPcyHxG6bXCBUCeNHNeIn2H1CwXDiFBTqNJicfIwFEGiL2ceUglBgyeZhhV31LJGHn/psOXqiyoOknfm1ax2AqhOavz5cxEl16FO+EZxQ0OrJgmMrNUyEPuqaMKxZFm0bzrpTvrR0OQUalC02H6AnAsujMppA5L+FYe52UJ0X73rSychidrhdGpbcr7vUZA0MqFrCXh+W+u9l5xwUnkiz9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/K8PYqR5GtlAxHLD89bVJliIzZqEfh/J+vRxzPS/XI=;
 b=fcODn2Dmaes3P3GYhLyA4Ex1m9IF5RnCwrale0S2rXQjNTmAV2FLr7L+qkGa7FlZPEJat2N9eQGO/+pCoDF4TqrbNtjV4T5KrngKPjhAGrmmY+CacFSF24X2kXje2OBv1pY8PTS7rP/XWg/cHSsKv/pegZLkapq3ur19meR09H2AYEZq859asFdgl+HDRwNYMwsxn74wPFoW0fYjPnpuwxukIOR+ouJcFkypvJs4GcHuDqbWCRe0E8ZLHULH/yLMjvLanjs6T5ZZj1AB/U02Yq2Csc/cHT+/22OZHNNmkuRh2otDDnT7ia/hbyO3OP8cDqgsyOQ9BqCIfoqM8b0b0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB8001.namprd11.prod.outlook.com (2603:10b6:806:2f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.3; Wed, 11 Mar
 2026 14:39:48 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 14:39:48 +0000
Message-ID: <4fee6a95-1101-404a-909d-7f3654a8b129@intel.com>
Date: Wed, 11 Mar 2026 20:09:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] drm/xe/xe_pci_error: Process errors in
 mmio_enabled
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-24-riana.tauro@intel.com>
 <b308163f-a203-4cc4-b558-1de58fb1251c@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <b308163f-a203-4cc4-b558-1de58fb1251c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0033.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: a63e75f0-2b50-41c8-dd08-08de7f7c0b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: RrsRkT5+ZerqTuLIQmoxsuTtC98AGqJL+wLDvEWkwFAD4u/IIaIPH0Q2hjQSwj5phpVR1f4mUqCfrojTUKBe7BeS1BO7XKcYD1Qhz0Ue0sgGvH63BykxTYpvh9pEQ1WMMWXCnT0kZmBzYabPzjoFi/7aQTEHPYitJQuB0pk6XB8fDogeGu6JjsqHnoDNxexlhG+nhtMCfGwi6xn91RvHMFu9mSSvqNlS3uN0CQ2+yDIcidXdzPnAQaO54gO/jOPB2MVmLb5kwj5eZJa4unvkg8TxH48xCp9zUP/4JVriqTCGkEdlV7j5LlZFVWHX+5UZ150oOHA+MZRf1Zq9Zq8maIJpPVbKxk/bFioSVmCpM2d/lEdVhGmqM5fka7g7zajKWCBoaMsdqP7KRW+a3t4dKt+MEBE0wK50FK4Xd8tNvKHGJcHdj77FSqTS/KT1uosavAz0ReZQGGS6lRKms78XL5w1uHkr3rxX2mUyhE0Nvc+LwQnq/MXjDLTrOVGBagOCrVK4a6XZagzzHnUqFV38meCsNPpG3yKNIMDjYYaXgLB7mFh9f8d8fdL2XNSkoEHTweIr96xE+iKvV4JTAgxSRpqZxbZJP/wH78aCT9N71VQAdXG/GRhakakKLI0Cy2XwwlzySZ5W/Zq7rIjAxCkAhhqWcYJeqq77p2piJpQosFpGLCKeLhLg5lBlHYOG2smt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckJNQjF1VTFDdys4WHlaWDNiY2o5bEw4NnMzY3hLYU5LTU9CVW5uS041M0gx?=
 =?utf-8?B?dHRGY1NzRHVRcmZJYklyTWRHTnhoRlZaYzN5V1hqR0htN1ZrcDc1UHhrSWZP?=
 =?utf-8?B?ODBqVTJHNHp5L2MyUGJGVjc2MjFmeFB6Q2lpT1haYnBSbVhobnlPUE9zM0lo?=
 =?utf-8?B?bWdZRHJxRVRUVG5lZWtGYmlkS0dOOEdYSlNSWmhPYm8vSHpDUm5jUDhNR0Jq?=
 =?utf-8?B?ZTVhSjNZRDJJcW83OUg0YVEvVmRvUnVSV1kzLzJIdzVSc0tDSnBnREdqT3o2?=
 =?utf-8?B?RGRGeVBZbVM4ZFV2VTh4WDdvUGJlMnRHTTRnUFB1OW52UWRPLzhPYmlTL3hK?=
 =?utf-8?B?Ym9vNlU3NmhZT0FVYUtlSVhwbUxZNSt4dmpDbGdUTkc2ZG55b0NTdGNtY0NQ?=
 =?utf-8?B?dG9aQ3oxaHY1ZlgrbTJDVW5WalVRMUkwdGNpVStyRWlJcHdBYzk0OXVxQUpH?=
 =?utf-8?B?NjExWG12Vkd1eEVMaEsrNEhudjBmWUF1eTBFK1FIOUZQcEw3OWc4SnhPY1pn?=
 =?utf-8?B?cDF5N0praFo0M2NnT0RKWUpiNEJPNmhGWlYxSEFicUlidFhkd0hMZE53STQ1?=
 =?utf-8?B?bmFzSVVaOEFXTi9pSGhZTkpRTVF4VVAvTWhTWll2bkFEMlZTZnR1Y0V1bGpa?=
 =?utf-8?B?RDJTWWdLRU5oVGdud2NqMERPSGZEVC9yVjIyc2IyM1ZqR254bU1RRDJZVE9j?=
 =?utf-8?B?TTlDQ0puN3htdnFyK3dxTytqVFg4UE5MVVNjaVRrTzd4N3c5dDNhM3ptS2N1?=
 =?utf-8?B?VnFMd3NMNytiSkJIQ0NMYTBiNVpuVFQrZ0lucVdVQ0tiOXRMaWUwVDh4RVFj?=
 =?utf-8?B?R1RReHEwYjBRVHhjRG51V1lldFYwaEtIVmQyQTZud1lCR0RkQ1FhMHpBVFJX?=
 =?utf-8?B?L1JjTVlPNmxUSmFKRWF4NmNMK1N5M09DV3dkSS9FUDdpcVZ5VmN4ZmlqUzA0?=
 =?utf-8?B?WWVLTlJUZUVKemFhQWVFaDJUKzVFbjMyZldHa2xyUjZCRm81R1U1ZXhteFBq?=
 =?utf-8?B?dzJ2ME54cVcvaWVrb1F0UDFGQndqa3g3bWMxTE5yU3JKaXlNS1VYNGJweDh4?=
 =?utf-8?B?MjdxeUN2dTQ5MzdwMTRCZVc5Rk9kUDJsRDJobmJLVHJsaTA2MmVVbERhMEpo?=
 =?utf-8?B?bXB3bnQ1TDd2QmlwdzFiQ1R1S2czdTF5NXAyLzN5ZjZZUDJ6YkdpYTVMSzRV?=
 =?utf-8?B?RHFmNmY2WTZZQmRNQUl5M1dFR004MEhjcGpSdDNRdTZuV1U3ZThaRnhUdDRH?=
 =?utf-8?B?TXBJTkQ0bDNmSDVXR1hURmtmZGZkVDZmd2lvWFBib05PTE5uRlIwNkVYVHB0?=
 =?utf-8?B?M3NodjArcDUrV3ZQa2pzNUZkdHBsK2dXbVBlTm9TcG81c1UxRHlDek5Mc0sr?=
 =?utf-8?B?QUwwdmJ1b0Q3MUk5QlRDbis3TnlnRlZKcmlHSExMdkxIeTJINi8wdU04cFRY?=
 =?utf-8?B?ZFk1ZkpYcWM0d0NKZTFTLzdJcCtHeXdRQkJoUWsyemUxRlJNV291Vk1KRjlS?=
 =?utf-8?B?VzdxQTZoVGNmb2FkMm5XRlhVdHB0SFF4a0xqcmgwcEg5UUxBQTJVTzB0Wm1r?=
 =?utf-8?B?QUlTRG9NY2E1cmFVb2hBMUJWYkhzSTg0R0lyek9vZEZuZS9rd3FTRERLd1hP?=
 =?utf-8?B?MG10aCswam5mdVdPTGR4c0FLdU5WbFo1MU40NVNIQjlvQmNiQ1FqU2kzVjNZ?=
 =?utf-8?B?NHc0allielQyZWpQOWp3ZVVzdkJ6N00vYlkrWFVBMzd6WjRCakZ0dk1tL0lN?=
 =?utf-8?B?R3djRU5TNkJuVWs2eFFVMmR0cGM2V1BJS1RNNzJGOTVVWkFCUWhrREo5WUM2?=
 =?utf-8?B?dmIvSDl4QXBrYWtoaS8xQVhKYUtTT2VBT2pCRlU5QmpZTE11V1BZVlNXTm10?=
 =?utf-8?B?Q2daSysvNDAzcXptcENnNU8xQ21ZY3hBYTJrZVFuWmNNSFRDa1RaeVRRU2FF?=
 =?utf-8?B?bStTaExxa1I3bFd2MGFKR2tTTzIwNXJxUnpzd2VtR2R1Nm0wSlhJVjVMWkFJ?=
 =?utf-8?B?UEVoQnZ5REVTRUVwN0hjNENzSDRaY3Nmc1d2TURkcmxLMlhwaVgzWjFIY1c0?=
 =?utf-8?B?MWFhYjl0TzJQamFyMnJmZk54anVpeXUzTUhIbDF1c1JOaGxQM2VUc01Ha01Z?=
 =?utf-8?B?cGtzL1Z2RGlBa3BsaFo5TFBkZWVjRFFrbkJDQzMwaFViYjZRTWhDME9DTnFK?=
 =?utf-8?B?U3VDNWRuZFZQcDlwSXlKc09KeUg5RXNXVnQrTkdJR2ZBTTh0LzdIN1l1QmVw?=
 =?utf-8?B?bUZSYnhGOFY3NDlMS2h0VTc2UkRXamZjT25iWTR0b0FtTUdrRUxRZ0VXOFlt?=
 =?utf-8?B?Q3NHdmpvek5jNENNK2hzZ3lCbTJYWk1RdzJYeUE0ZVZiSGVCTHlsQT09?=
X-Exchange-RoutingPolicyChecked: FVr6qQp33UgDhArKlj2qw5jlTX+cQN0UJbLuAnE1qx7eGzxKL9gEqP6gQv+6TtE1oMsgc6Zk5n1cnnUkJ5Q4zf3Yv0HlY0uzVBNt+8X4Pp9Kdj1TAd8XYSFo1eqYkR8DXiISZzpGhgmVDdkdjYmFouaeSuFHH/L7BFnT27zjFJIfa02sbEondBW6z1IEVeqEMcUsANvXV0+JSPECSvFQI1zk6QoyCzrJzPZTlQntuDihztxFCmN3yrxx5mf9c8mmPS2iNcHo4r/GvJCQYd0ydh0VjPEWDUogqBNsmDbLgS3srXUCQFPH/xhrYkac4X7l/FpIIxlhLj0aCn3kWHVibQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a63e75f0-2b50-41c8-dd08-08de7f7c0b69
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 14:39:47.8993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYUo5vqSKJkvTEd8TyuxCWXxjHCA6SQr1bIUc2NWoG2bevHf/wd1vcW0lOAVCxSpkKGC01XCHeXnLvI1nmNXbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8001
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

Hi Mallesh

On 3/11/2026 12:40 PM, Mallesh, Koujalagi wrote:
> 
> On 02-03-2026 03:52 pm, Riana Tauro wrote:
>> Query system controller when any non fatal error occurs to check
>> the type of the error, contain and recover.
>>
>> The system controller is queried in the mmio_enabled callback.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: use ras recovery enum (Raag)
>> ---
>>   drivers/gpu/drm/xe/xe_pci_error.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/ 
>> xe_pci_error.c
>> index ba62868f00d4..35bc5b8cee99 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -9,6 +9,7 @@
>>   #include "xe_device.h"
>>   #include "xe_gt.h"
>>   #include "xe_pci.h"
>> +#include "xe_ras.h"
>>   #include "xe_uc.h"
>>   static void xe_pci_error_handling(struct pci_dev *pdev)
>> @@ -26,6 +27,12 @@ static void xe_pci_error_handling(struct pci_dev 
>> *pdev)
>>       pci_disable_device(pdev);
>>   }
> Explain the mapping rationale

Do you mean commit message?
In the code the naming is self explanatory

>> +static pci_ers_result_t ras_recovery_action_to_pci_result[] = {
> The mapping array should be constant, never modified.
>> +    [XE_RAS_RECOVERY_ACTION_RECOVERED] = PCI_ERS_RESULT_RECOVERED,
>> +    [XE_RAS_RECOVERY_ACTION_RESET] = PCI_ERS_RESULT_NEED_RESET,
>> +    [XE_RAS_RECOVERY_ACTION_DISCONNECT] = PCI_ERS_RESULT_DISCONNECT,
>> +};
>> +
>>   static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, 
>> pci_channel_state_t state)
>>   {
>>       struct xe_device *xe = pdev_to_xe_device(pdev);
>> @@ -50,9 +57,13 @@ static pci_ers_result_t 
>> xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>>   static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>>   {
>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>> +    enum xe_ras_recovery_action action;
> Add action_max @ end of enum to validate.

Answered below, but for consistency i can add max

>> +
>>       dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
>> +    action = xe_ras_process_errors(xe);
> What will happen, if RAS processing takes significant time?

System controller times out after a duration. Refer patch
https://patchwork.freedesktop.org/patch/710637/?series=159554&rev=10

If the ret is negative in process_errors

+		ret = xe_sysctrl_send_command(xe, &command, &rlen);
+		if (ret || !rlen) {
+			xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
+			goto err;
+		}
+

We request for a reset assuming a SC error.


>> -    return PCI_ERS_RESULT_NEED_RESET;
> 
> Use array bound check before using action to avoid out of bounds array 
> access

The action here comes from a xe_ras_process_errors which also returns
enum. This action is explicitly sent and is not coming from user
or firmware.

Adding a check here seems unnecessary.

Thanks
Riana

> 
> Thanks,
> 
> -/Mallesh
> 
>> +    return ras_recovery_action_to_pci_result[action];
>>   }
>>   static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)

