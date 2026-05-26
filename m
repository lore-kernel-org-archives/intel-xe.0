Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0FFCD5BCF
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 05:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E4410E203;
	Tue, 26 May 2026 05:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HWCYLycb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA9C10E203
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 05:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779772538; x=1811308538;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lzrMfvMk+dEynGr4urpspIMBbOj6ukmpj1O2E4olgMc=;
 b=HWCYLycbsNwrtkq2Ls+exPLGz1jYqUisIhtQYsKsToLHEV4XNy2HJgRw
 DzK5++tALfqgT0s5hwq8ZFJzXr3+HCQw/OnB1JBAvL/YiwzgXs8eiPSDO
 u4wWummbidGp3T3vV6k1IiMit92LdlrYaMbyqndfTfWx9weHk+dTZuSGo
 24Hj7MM/a0J1/1wY/5hmvaHFpreXXoilsacz+8Cm4YPgL9ILIztpvPIYy
 WkQfQs8m0dbwssyS45aOpYXku+uV/FZCC9oHtIIpMLBC513GmLpVHK1ZK
 mVJRQOaE06noTr+ke7v7GREDhtaEHNKotGXlyzmARdOt+b6ct/Tu72CS5 g==;
X-CSE-ConnectionGUID: /WWNAqkxTx2EP0ZEp43kLw==
X-CSE-MsgGUID: BGhDgFYpRWWWN5gBIjtK5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84431754"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="84431754"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 22:15:37 -0700
X-CSE-ConnectionGUID: vQXHawFQRgaQtkMy1/ckWA==
X-CSE-MsgGUID: sleIqDgRRWKJEW0OitdOHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="279918809"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 22:15:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 22:15:36 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 22:15:36 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 22:15:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L027LtBnpcXtJvvyDt/SPidwaJIdwJd86p9wIJNH3M9wU+JzEMFwmLB9+INUnM836TlTKr1AIELpxNgGJNy+Hxf2iyVN0xfiYrmBydlvRF5IS4j4b+XKMJo4PaVQ8AOXQIy9Ki7dPfSFPEkBFiPMGuJSjtmI+P1EMv+/2ntCxo/UWxJ9gSpj9yL06XqaWYHmvTkyAAuhigj6crpY9G24YZN/nHcKvyINjj4s9GkTQUZetWBnsbqu1ZJy8zxg79DH1MIMl6kOXTRGl6jRGAVtlbokpcdXY6TqSakGt+zYVWlXJHzAlP+xp/9kA1KOv5PxO7E0ea7N0Q197KttqeAFaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlymwJ35Bi3xIHePGi6i5TZW0pM/NvnQzqJjT4szQzY=;
 b=WEJA7IJCeHoA2s/F5y8REbve2p4IjLPSVp2LsBA4GV9dRw3Yb0Or5C2G3o6JWZ3CFUkeKzfrSW2vZYZ/RQQ4QIlYE8WtULyyoaNaQILOMues6dBhqr5yz0EQjIJCS0Pv5mQ5ns9VRi9ExKrYBnz0xkl7vGLkVAA+wji5Hvbo3Kz3VKpjhFskL0OTDj3OK1WKonhH0vXgMW2eSzK0qj55ZxkucWqWbuqBjUR+H1BCj2SAnB0qV7CHFCvSQluADGS8cYPH/6tqFgY39NcyMoRU3uqa//V5XL1X18Inf8hTgptREGw40wnFm/tqTVrtLnYkrYa5EAw84YLEyLeRwBpWBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB6725.namprd11.prod.outlook.com (2603:10b6:806:267::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 05:15:32 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 05:15:32 +0000
Message-ID: <88f42243-af5e-469f-9769-aa5dfabd6740@intel.com>
Date: Tue, 26 May 2026 10:45:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] drm/xe/xe_ras: Add support to clear error counter
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260514052205.1340143-8-riana.tauro@intel.com>
 <20260514052205.1340143-11-riana.tauro@intel.com>
 <agtTMBeI6mk1d7Rd@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <agtTMBeI6mk1d7Rd@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0315.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ce2631-b0db-4602-6bfd-08debae5cf5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|3023799007|56012099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: AnfLnXSQawls6gDGc85YNnHXsMcphcdxr6fDh3NigMyP//xjMYObzfMNWhKyABeXLMrcy3r846TwQlJkDJpcMHTXWrnSuLvIgEOWb+cx7S8SaE0XdvX/LAJ5K7B1yh7zRscasYxFJGvlvctPaPg2IkTap6i3voCpEL8K2xShnhhfIrfeAkox5CKGY/4KMPatZkDYJdJF4nujs5C0KBaM1ODu+ubc1hWtgGJ0k44VgcSAdfBVbQBeDy8eVPppwelgeclCAQ7Gs1hcu5UbIyfVGAyyc4kPhJ5V3xxOqdPqNyBLUwkrzsYRJM4wunm9BGxEseqvhvorXoxSyjS1QWu0WKy+0mFQYLRGq+RzK+I3kBlahRCT4phnC3i7kXu6E9GVtYdW3ScnwaOd64geroeI11HcSDqInXES0eUBhV2pNcEJO8htjAKidknNQB0AoYMMjySTaW9YSKqFX1/oM4Jm/3YQ5Hyi3GhzR7pHmMDh9h32xL92j05FhzzS8NdoGu1lJ25EaJSHVYJVQC6DJTfqJSzNT7ziE21MiZP7d4ljkge/HbfGxY5EIG4NEPVnr6VF8BgHV+U4SeuPl1PuIv+WsRz5xnqgv84EC+UWF/zd3HGqv0XivvPztxYWziqylPZGPbogPBc30+LU4QscLwLsudasnVrsR8/9tlraI/Yn0HGRyJBE4Ad9sJ83QgGTEHsV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(3023799007)(56012099003)(22082099003)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjR3NWVWSG5yRU0reDFoSGg1SEgyOGpNblNIUVAvejM4K1A4a2NRdFRzM0lo?=
 =?utf-8?B?QjNNRDJDejZ3QjYwTFdVSnJ5Vzl5bGZpYXJBMmlSZnhsUUE2R0ljMEZZU0FR?=
 =?utf-8?B?K3psaUlKNTBnZTZxZzRCOGNrTkRKYWg5cGM2SWxKVjVXblJHSFBjMnVQcjNY?=
 =?utf-8?B?N0lVeTZVSG1idytnNlBPSDVVZzJZOTZpUCtxbmh4SlNCYkt4eGZoUk1RcUw4?=
 =?utf-8?B?L3RDNXppQ0ErdDRuVEVHNkZUVnhpWFp6MFk5UWFWbmlMYU91dTNzaHpiN1Qv?=
 =?utf-8?B?SE8yNGtod09yK01IQUZqbTB2RFZxQ0ZJQloyMHdqNHZmMm4yUExpMVpwc3pW?=
 =?utf-8?B?QTQyZDBSQm0yNVlvdkxEUFFwMUd4b0wwREUxbm9laGlHYTdJWFRPZEV5MjVn?=
 =?utf-8?B?cGxnNlNhZnNWMWlsenZvQ0Y1aloyMFkwd1dqdDYzS1dYN005YkRrd1BVczd4?=
 =?utf-8?B?Vjl1TzhsamNmSVZuMFB4VDhPYm54Si8zS1ZOb0tRdVR1a1RLTy9jOFdiaUcz?=
 =?utf-8?B?d1I4MWtjMnk4Z3pvRlBFd1J6L3hzNzhVNWtWRjRJNURpSUg0d3pJU2JCTjZT?=
 =?utf-8?B?SG8yL0MrMkRHR3hxMDQyM1VCZ05LdHA5T1Q5NlV0U09ZY3hIV21Vb2M0UVI4?=
 =?utf-8?B?ZlhRMnY0QmhMa3JuRmVyaU5TU1FDcXF2VTZmZ1B5K3JocGRONW9lbVA3U3Qy?=
 =?utf-8?B?UmxJZUVPcHF3bFFQOG81bFJLbEdoSHRUN29scFhQSDQrbUNMT3lWWVJlaXFB?=
 =?utf-8?B?VzJjbmwxT1pzWVdYalUvQXlHQXJiNkM4dDZ1SkQvRjVaT0M5Q1Baam9zL0NZ?=
 =?utf-8?B?UlRHdzFaRUg4YUp0eWlKckxhaUdiWnNiOHpWNk15QmhaYkpKUGd4RjhyZmJh?=
 =?utf-8?B?ZzdQUFByQ09TQzNpT1MzTTcreEFKYXRFK0NaRlU0Y0crNjFtWklRWklXeFUz?=
 =?utf-8?B?R1RvREJnbkNyaU1XdFppaHRQTTJlY1FucGVlckJJVWZzbmgreWZJbkVXNVkr?=
 =?utf-8?B?MThCV3U3a09FcUNVLy9LNW1MT3drZFk5cVlNOGUwdENIWGVmN1ZZWFhXOEpH?=
 =?utf-8?B?UzkwRHJaM0Z2M2s5SmhvNXJ6UUZLQ3BLZnBoZk9TdVVKNTRvWnhEb3ZWb0ph?=
 =?utf-8?B?K2pGTWtNUk9iNUwzUExjdnVVNUcxNDd1VzFmSjFRTmhwVVRRcloyZzZzaU5v?=
 =?utf-8?B?d3JOLzlzdHNhY3NkY205amRobkZsdlVYdlZaMmlXL2ZjejZ2YzVRbjhNU1lW?=
 =?utf-8?B?aVZiT295bHVvMG5WOCtubXh6MUpjZVdTTExnK1AzUyt4TUd3ckR4UFdYS1Bz?=
 =?utf-8?B?eVJWYXdJdlkvTzNNdmxMNHlTQTRSdVZRNFNJdXpJOXA1bVZnZlJDeGpVOUZT?=
 =?utf-8?B?aDd4MS9BLzVEbDhFVnFiR0t4YSsxK1Q3WDYwamh3SnczaVV3TTluYWRwT1pV?=
 =?utf-8?B?Z2tpaEI3U0VqeHNCVFBtQkhZbEdKS2VueXlqanJYWnM0RFpwK0ZzenFHL0dB?=
 =?utf-8?B?b2VOQTZTSFdNb1J1dFVQL3NXaE1td1YzdWhhR1oyOFZLQUQrMG9ocHZzWkJI?=
 =?utf-8?B?dkFjWWFyWTFzWEZYbmlGQ1F1eC82eEszMGRWZEFHMkNVVXRuem9PK3U0Vys4?=
 =?utf-8?B?K1VnUDJpTjJQaStMWCtQSW91RGNZbU5FVENhb0VmQ2tPc2VLSGRDRTR6TWFo?=
 =?utf-8?B?bEtMb2xYQzB3cy9mT0wzZ0VJSlB2SUZlcWY1QlhpcGFKVzV5NGRNbC9zdG9Z?=
 =?utf-8?B?NVJhdUZHQzNrR1dDTzREanBZY2UvWk9CREVuQ3NINVA1ZXMrT3NGbzFpaDNx?=
 =?utf-8?B?V3IyMmxTZkg2blNYNlV3MkJvME5rN2hJM2JpZzg5QzFEUXplUldNbGpwbldj?=
 =?utf-8?B?Nm1URklhM0V1UzM1Y2E0TGRvR3pEcUsrUXhQbEpMMW9PMkxIY1RmblZzdXJH?=
 =?utf-8?B?NFJSVzVZMnBJQXUzTWZIcTZOQSt0WDc4bGEyNW1sbDFXRjdJZndoUlVyTEIw?=
 =?utf-8?B?QW1uTFpTSlNJbC9vUVV3b3JXTVlLd1paMFBCbkZUbkdNLzVjVUIweTRPZFd1?=
 =?utf-8?B?SElQamFCTkZmcEVST3JRZ2l1MTRINThKOHl2eUF0eDJ2RGx6UzdRd3hhZUNL?=
 =?utf-8?B?QnpUeFBPTzMyUEpLNGE0TGJIaTNTNEFRMDFtL0hqczJRSE5OY1J5QnVyMHpZ?=
 =?utf-8?B?cmNUU1pWVERKaExDNXNSTzJrS09WbXg4MUhLQ0pQUXJub3BHZXl0OGF2eGlJ?=
 =?utf-8?B?WHJjU2VQQ3U0MUNMN1hRaFBjM2JNRTMxZ1lyS0s2T0FhQk1Eei80bllSY1F6?=
 =?utf-8?B?dUFwaTZ6bkd4dEJTd2JDMXlKcHFRSCtaNnFuVUNDTTA5RzlTYTJ3dz09?=
X-Exchange-RoutingPolicyChecked: jh1rA5eqKM5HhQB5ryNN3hHcqVkyLV/hY5lhkrfp0GmuRWc5mX4o4fZfe3a2stLYM9TrgecbyncNwOs1Vn7ESAg8jSe63KjzVdSjlFiLyWfrlrO8S6NiqCZUcoG56yfbtVAKvezrN6pNRqaF3H2/ZDj4Y6QI+TROKWGQqqANUegXKDayl8qFfZ9o/Z1bV+QsKlBTVnflHWrj/1JEEyf2GALLdWvonO1R3ovWmpfos+FwzqJjhc7pBo3rLi6mu9chQKTOfS4/MEnFfnj4bAW/oTzEtLv6j49/ZKagzl74hKM3k8qd0k9rJFBbA4jORxQD6VXyu+Ja2R6ueYPGYZXWCQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ce2631-b0db-4602-6bfd-08debae5cf5c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 05:15:32.6216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOuGJkrCqf2l5WOca9cEKWbNqojpqdx/3dnvpdPGVoTLxyAlJ0C9TZTcxg9UzZUZ2KUWJD7S/JWg/msidchQHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6725
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


On 5/18/2026 11:28 PM, Raag Jadav wrote:
> On Thu, May 14, 2026 at 10:52:09AM +0530, Riana Tauro wrote:
>> Add structures and helper function to clear error counter value.
> ...
>
>> +/* RAS response status codes */
>> +enum xe_ras_response_status {
>> +	XE_RAS_STATUS_SUCCESS = 0,
>> +	XE_RAS_STATUS_INVALID_PARAM,
>> +	XE_RAS_STATUS_OP_NOT_SUPPORTED,
>> +	XE_RAS_STATUS_TIMEOUT,
>> +	XE_RAS_STATUS_HARDWARE_FAILURE,
>> +	XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
>> +	XE_RAS_STATUS_UNKNOWN_ERROR
> Nit: 'UNKNOWN' is sufficient.

Changing it to switch.

>
>> +};
>> +
>>   static const char *const xe_ras_severities[] = {
>>   	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
>>   	[XE_RAS_SEV_CORRECTABLE]		= "Correctable Error",
>> @@ -53,6 +64,16 @@ static const char *const xe_ras_components[] = {
>>   };
>>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>>   
>> +static const int ras_status_to_errno_map[] = {
> Nit: Redundant 'map', just use 'xe' prefix.
>
>> +	[XE_RAS_STATUS_SUCCESS]			= 0,
>> +	[XE_RAS_STATUS_INVALID_PARAM]		= -EINVAL,
>> +	[XE_RAS_STATUS_OP_NOT_SUPPORTED]	= -EOPNOTSUPP,
>> +	[XE_RAS_STATUS_TIMEOUT]			= -ETIMEDOUT,
>> +	[XE_RAS_STATUS_HARDWARE_FAILURE]	= -EIO,
>> +	[XE_RAS_STATUS_INSUFFICIENT_RESOURCES]	= -ENOSPC,
>> +	[XE_RAS_STATUS_UNKNOWN_ERROR]		= -EIO
> -EPROTO?

This is protocol error. Would be misleading to userspace. -EIO is better 
for unknown errors
indicating an hardware error

>
>> +};
> I think switch() would be good enough but if you want to use array, let's
> also have static_assert() against XE_RAS_STATUS_MAX.
>
> ...
>
>> +static int ras_status_to_errno(enum xe_ras_response_status status)
>> +{
>> +	if (status > XE_RAS_STATUS_UNKNOWN_ERROR)
> With _MAX in place, we can make this consistent with other similar helpers.
>
>> +		status = XE_RAS_STATUS_UNKNOWN_ERROR;
>> +
>> +	return ras_status_to_errno_map[status];
>> +}
> ...
>
>> +	xe_dbg(xe, "[RAS]: %s %s counter cleared\n",
> Let's try to make this consistent across series.
>
> How about "<component> <severity> <operation>:<value>"?

There is no value here from firmware.
I am adding

"xe_dbg(xe, "[RAS]: clear counter for %s %s\n", 
comp_to_str(counter->common.component),
            sev_to_str(counter->common.severity));"

Hope this is okay

>
>> +	       comp_to_str(response.counter.common.component),
>> +	       sev_to_str(response.counter.common.severity));
> Same comment as last patch.
>
> ...
>
>> +/**
>> + * struct xe_ras_clear_counter_request - Request for clearing an error counter
>> + */
>> +struct xe_ras_clear_counter_request {
>> +	/** @counter: Counter class to be cleared */
>> +	struct xe_ras_error_class counter;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_clear_counter_response - Response after clearing an error counter
>> + */
>> +struct xe_ras_clear_counter_response {
>> +	/** @counter: Counter class that was cleared */
>> +	struct xe_ras_error_class counter;
>> +	/** @prev_value: Counter value before clearing */
>> +	u32 prev_value;
> Nit: Postfix is a bit more suitable for variants, i.e. value_prev.

prefix should also be okay for variants.

>
>> +	/** @clear_timestamp: Timestamp when the counter was cleared */
>> +	u64 clear_timestamp;
> It's already 'clear_counter', so perhaps just 'timestamp'?

sure

Thanks
Riana

>
> Raag
>
>> +	/** @status: Status of the clear operation */
>> +	u32 status;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved[3];
>> +} __packed;
