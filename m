Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39389CD98F2
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 06:36:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C8310ECB6;
	Thu, 18 Jun 2026 06:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hwCnDgsh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BC710ECB6
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 06:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781764585; x=1813300585;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eB+blwVbw9NertznFeLBFZ39S8hq3415hwR6xT1I4JY=;
 b=hwCnDgsh8XwPJJJfdIJF3Jd1uXbwd5Nk/CL3n2FYZ7LxSSDVU04ZLXDK
 gYfDbdb0V5pj9NRQ1BWOOeGWCr/aBc72QJHYgjkRsziLVf+9BqOggXbjW
 CtqEBtf3IpXTqh5Qqubo4Z816T6nlLYy2jnrKHs5Jy+jaOk5xK8mHKqCV
 4nxGq4dGDBXXzivdY6I+zK4RRgXkF734+qT41VyqaTsCL0AZRhpWrV3Xc
 Gi5WKRsDpnwfZljaEC4ojBZEtKyg62ypG7C707lMyD3P7eSlmxWqpIwng
 yi275WYAJFJTdl8jLPAzuz5Ruua8o+0qBm6j/xixT5l2x7Prg8ImeIf9x g==;
X-CSE-ConnectionGUID: zafKFHG9RveLlIrBZ8Jy+g==
X-CSE-MsgGUID: sL/VQU0+RbqARsuLlc4rrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="100148631"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="100148631"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:36:24 -0700
X-CSE-ConnectionGUID: mljmMryeRLCyYFKqRsyamA==
X-CSE-MsgGUID: DSznIBJURMOnyc7YVGWX9w==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:36:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 23:36:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 23:36:21 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.63)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 23:36:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFsbAFIGrM1d5vastyAk65nkz8tFIyTuf8t3Yjkad2rrd03L3kP5SUvLeGL1FnCWN602Mut/sHdRQOW1qKcYsRkpPdjMm8jfzV1uqISB7etWlu1NhTktMrNzTuXYKv5xAA1nkkZrJipPZer1B93csEf1SrH0Tp4PCh9J9EFRbbjNcIoxei2SZdCn2vksQtSD8CwE6TMWT+uicGmK3eiz4J+SYNJgjLcxlhjDN58iRLDVjHE9Hh4PgI2+hhNkiZ9XQ45VczecGCt5nsU6X2qXrQDG9KLQL32FJ0ey/iORXxwtKt56Yre20Qw+JXh+M1dTQdsLQJ5S4fOWzXhCpcqp9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86Z7GaYwF9vXDODxOwgNaTlMLzAP5e4YjRYygiZamuU=;
 b=lDWq8DfeWidIpslEkMFnFcVamGGtYtt/lBwe724asP9iEolQ3MxsSg/mucvIWIXg/aEQ/GLr222UDvfKuTifeBvkdsXrpX7v2LwRUsUy9qsRcNnmWkMlsqXeMp+K/wJFto2S5lRCFUhTyW78BTQiJKqdLkFzytwwSr7cF51QjgnQOJi8K6d4/2Z5etegEEkUGA2W/w8eaoVNjUe97q9N6EHHLc8+s88WtfsjbxysFA8VVMlrJaj7VOcw9/yQ5IpiYXx3vdsd01JniqGwve1BfVWh7yNrW2iGG2ueybvGUN5HE7FKMG0utHvaRRvLpgvJmpDRZD9zVGWdY/LEnt+27A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 06:36:18 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 06:36:18 +0000
Message-ID: <0b45c835-b31c-414d-881e-361bcba934a6@intel.com>
Date: Thu, 18 Jun 2026 12:06:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <andi.shyti@intel.com>, <rodrigo.vivi@intel.com>
CC: <anoop.c.vijay@intel.com>
References: <20260618061053.3307213-3-soham.purkait@intel.com>
 <20260618061053.3307213-4-soham.purkait@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260618061053.3307213-4-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0304.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV3PR11MB8531:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b22b78d-9e58-4dfc-9240-08decd03e71a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|921020|3023799007|22082099003|18002099003|6133799003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: j/CL2a1vpavTnZqttm1Tb5ZC71ZMwZD0+dRwpnzbhL8xEjUdOeaBD7iH38sq6sZHGhOwoCiMAUzr614FvN0JuGZixPjLj+5EkrPJUw5+rgFUee7QFrJw4wdFoTWm5ZL8UVvWwgIXrK7ND2iwwjZJ1bOukoyFy56+IU0OoncbOucHhcsrcWCGrzePmirK5ajLSCHpwzy68vlrNCYjr6lSrFJtKnF/sY5tx1++5h06FQLN4P0H2mkOSMHjlwVhrVPwLUVCRg+ix+jIecqtKM7rFwUhuZBp1Jlc/D4PEDUxU6d9NrtctBqwOAsge/SaC3fZ/Sr1efrxPMLPf5YZ+zp1k98z6qp/wHIbN0SHYQo+P9RiEuBOCCUherAKe9Pl2LHQ4cVStBaQEHLrq3kedCGI7py8Qs9dxGJaSZZPWL4Ns+MZECDxzlB+xXxxhWoCI3bpeL3/xj4PNVB/eEynth6i18/p3vRkTxrTAdWA2uELsgeU0PYVwl+VyRMH6xYYYzoLhWg54EWKdYsFc6jFipl84isRSL7g4f3IjNwDCStA/PBNjFJrouLbFX/Wfdi9p+mU80+KfSY9HMIKJSU1fVvgQyTwZTh5kEKXN3eRAO48az/bSCgXlgGhzNKTNCelLANzyX/y17Ayhqmfp/VUOXutXfVIg+f7NLVcDsPqbi/qcKZiRaE3IExyandHTLCOBH0DStP/N/FJlbOHQt0isATC1Qh0AeZ0+UbVw5rcOsdabd8xM0Wi0xXCOpIYyppNRIIM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(921020)(3023799007)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEZmWFk2bmFNSlF0VjU3UlpoS3BGZXVUOU54Tk5Zd25NMThORmMzaUk5MThs?=
 =?utf-8?B?d2NMakdkcC84YmZ4RnY3K2ZuYVpiMU5SUWhHaWhVSU9QWDh2cFJDSy95MTBY?=
 =?utf-8?B?T1VobnRMU29LdjRvajdmSDFCcjhVZVYwS2J2d0xVTU0zTUZHakgyTVc5b09o?=
 =?utf-8?B?YmEyVDZDOWxBQmtDb3hTNDFIcDRneVQyZVoxc2hGbWtscUdOdVZlb3FPZzQx?=
 =?utf-8?B?OUQ0UUF2aGd4QVlydWZkWEkwc1B2UzJKaHVVNkRJd2ZxeVRZMFVvN2FqeXlG?=
 =?utf-8?B?UkRBMUlqbHF2aUVXQUxPY0JDQUhiTWNVTzVScU9IbHM3ZXhmL05ENzQ2ZXdV?=
 =?utf-8?B?S0hUbG1vREhJNTZIKzZDTWpVRGMzRkMrclJsU1VIOXM4R1ZpK2x5RW90UnVh?=
 =?utf-8?B?TXpLR0JJWlFqOCtEalB4dkxUNnhjRUkxNVZ1c3R0dWlLT0gyWW5Td1RJZE11?=
 =?utf-8?B?bG0yR0tTbm9kUG1WSTNVbFFlaS81amR5Tyt6MlpmaWN3a0ROZ2QzVGgrVE44?=
 =?utf-8?B?WmszYW81SXF6MjFCZHY1WklUZS9HR3pFMFQ2RUphekxzZWY3M3BTdHpHSU0z?=
 =?utf-8?B?YUJzRXJPQThVWW5SbWVBYVdFLzNHdkcybDN0TWNDNUc4S0U1bVYvUnRMeXhY?=
 =?utf-8?B?MkFTSDFtcFdobGVZdGFTVGY5K1V1bUJrdEV5TGwydWRETGY1dlc3WlY3YjF5?=
 =?utf-8?B?Wm1peitEUjFZeVR0NFBGVjZNU3QvVzZYeFJFYzhkejlqTjZlTDlVaExjNnp5?=
 =?utf-8?B?aFVEMFFWbE9DU0toa3VZSmNjNXhqTExvL240ZWsvRkZJQUVhN1RWRGtpZU9p?=
 =?utf-8?B?RnM0OW1VazVUcTlsSlpoQjVQV3NJSWRGYmlNK0tSSGtvRm45R2I5cWFuMWNP?=
 =?utf-8?B?UlhPWWhzMjAzKzJXREY2RDNKZEh4VloxVzd4SWhITnBTN3JwUzRzVTdCV1Y2?=
 =?utf-8?B?ZFRvQ095TG1WSlYvWkRvQkpmNFcwL0NZU29KcUg3Zjdlb1dyME9iQkMvN3JY?=
 =?utf-8?B?T3RtTit2UWU4S0xCVS9ENy9sV25pRnRuVkhXUVlJU1JBUVdORUVxTnNTV1pY?=
 =?utf-8?B?Q051Z2Z5eWdwc0VjMzdZN2dOOXV2OEtkT3FmMXBRdTBqZHR1REJLRWxqZ3dC?=
 =?utf-8?B?eUF5SmdISzN2bVlhQUE5dHpUa3VPYnc5d3ZIMEVUTjJYRTNzbzdLMHVQOG9p?=
 =?utf-8?B?RWdEak9BbkxXYkJkREFlNHF6amJyQzlhY0pQcVNSSXZYbmNjamwrRnJGQXdj?=
 =?utf-8?B?a0JxMEM4WE8yWGtQdThMRzFIQm95TVdRUVEvQXlIUURMZlZ4dGZZYitudHVX?=
 =?utf-8?B?Q0hlMVBPMkNXbEVWZUNjeU1mb3laajVYd2x1QlkvaFVQYU5qUGdDbEJGMkps?=
 =?utf-8?B?cDY1MVgwQUVYT0xFVzh0ZXZOYmRjdkFxa1lwaEtteDRRUHJMUG1qMElqS3FM?=
 =?utf-8?B?S2ZidmdiSzVySXprMFlycmZ3RWtmVWQrUE1hNG9Va1JlbU9VckhtbWlGeHkv?=
 =?utf-8?B?ZFdUcG5jRWNaREI5QzhXanpjS0tsdTJkaGlnK0M5OXp1MEg1am9Kb1J5a1dj?=
 =?utf-8?B?Ti93UVBtdEt6T09yRUFVNzZFUEFVaExOR2llbXlSZkpYOXY2QUs0R1puYzV4?=
 =?utf-8?B?N2ltVlBZRnFKNngvblFBb3JVYUtFZ0liVXF1WVhEcTFyakNMaG10dkxRMG9G?=
 =?utf-8?B?VmxyUDJ4MU5XY3NWWHlwelQ4MjNwa21ieEhLWDNBeEV2aHloVUoweU9uTG5K?=
 =?utf-8?B?a2ZVSzVMMm1nL3N1b25jakRyUFF4Q2JHTzlrREtEeStMSDBQMi9YRms3bVdt?=
 =?utf-8?B?MEtpM0svR3ppRVlKdnZ6QTdXRDJkTlFvTXA1eXlZWFBSenVFT0tQcUdnUEky?=
 =?utf-8?B?UHFqS21pNXhjRjVORFVLeVk4dCtjc1VxeHdxYWF4UzZvM2hqMjRjNVM4b25C?=
 =?utf-8?B?amZVdFF0dExYQnpabUZoeVNXNTZxSFRJVW1sSGwxOGU2eWR6bGRTdVNqZXlp?=
 =?utf-8?B?UGhzcGFvZ1hiQXhDQjNiTXMzR2FwOVZ1cmtvQmw4MXdSL21PYURUMFFEakdF?=
 =?utf-8?B?V2RmTzN0dzZ3Qnp4ckh4cWcrWGpSSTF2Sm5COG51anNPQkRqR2prOTlOM202?=
 =?utf-8?B?SWhGek8xcjF3NElHTCs3Z1VKMWI2VUczQVpvVGw4Vkt0K3FpaCt0cm9QL1Ja?=
 =?utf-8?B?MCs0TXVWdG1Cd1V6VDV6SFV0QjJkc0RBQWZOdXdXczJibW9Sdk1lcUlhN0Q4?=
 =?utf-8?B?TVpXa28rUUR2TFhHSmhTc0J2WFpiRTh4cENzSzZtK0lWU3d5MURkQjZ4YXZO?=
 =?utf-8?B?YmZVclE2N0RHZjJ4ei9QclRVeEFkc1lWVzdYV2d2K0ZBNVhxMnZFZz09?=
X-Exchange-RoutingPolicyChecked: OKFDLClswmPkv/P+T+r1ybGzXucvnR61czIg4o8Mv2kpVmuHH89xpzgI6uQu0Xo0uEHKGJWWhRO5gUHNTxvO8MlGX3WSPkjHjQ4AdeFyxFnN+aCupY7VW0alyFf1otEU/p6Rg9bhDDNrxz+YxKm4OuAbuXk8wHxhArHXzJAZwJZobFoj5xLTMUCS/BqYNSIRoTT+OuSd1tUC3qGm68NOVkUecJSVmLzkVWxB4JMl/YVncjqXY+p7Fn6YuBxNt3W/T9ohW38S5QxM5ZvzYW6xa1sU7W6A/Rj9mGz5b35W4c1yIFzIXTrdefga6u/uMK6bR/leeX42LJL8QheKwuVqpg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b22b78d-9e58-4dfc-9240-08decd03e71a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 06:36:18.2941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+1bgPI9xndLXFOeUXmr5jkJHHGxduQIY28MVfhQxBG3sz6PBXP0tDnIMsdN/QBvTfEg7eLoJNKdnG042jkacQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8531
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

Hi Soham

On 18-06-2026 11:40, Soham Purkait wrote:
> Add a sysfs interface that reports the current GPU health state and
> lets admin users and management tools update it but is readable by all
> users. Requests are routed through the sysctrl mailbox. The interface
> is present only on platforms that support the GPU health indicator.
>
> The interface is a single read/write file at the device level:
>
>    $ cat /sys/.../device/gpu_health
>    ok
>
>    $ echo critical > /sys/.../device/gpu_health
>
>    $ cat /sys/.../device/gpu_health
>    critical
>
> v1:
>   - Add enum for health status. (Andi, Rodrigo)
>   - Return error number instead of error message in _show/_store. (Andi)
>   - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
>   - Return only the current health state for sysfs read. (Andi, Rodrigo)
>   - Add documentation for sysfs interface. (Andi, Rodrigo)
>
> v2:
>   - Make logs and structures consistent with their counterparts. (Riana)
>   - Drop unnecessary variables. (Andi, Riana)
>   - Add correct KernelVersion. (Raag)
>
> v3:
>   - Add missing blank line before #endif. (Badal)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 +++
>   drivers/gpu/drm/xe/xe_ras.c                   | 177 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h                   |   1 +
>   drivers/gpu/drm/xe/xe_ras_types.h             |  61 ++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  28 +++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   3 +
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>   7 files changed, 304 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> new file mode 100644
> index 000000000000..c7f2cf8bb6ad
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras

Why is this under testing?

> @@ -0,0 +1,30 @@
> +What:		/sys/bus/pci/drivers/xe/.../gpu_health
> +Date:		April 2026
> +KernelVersion:	7.2
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		This file exposes the current GPU health state and allows the GPU
> +		health state to be updated.
> +
> +		This sysfs file is present only on Intel Xe platforms that support
> +		the GPU health indicator interface for RAS. Reading the current
> +		health state is available to all users, while updating the health
> +		state is restricted to administrative users only.
> +
> +		Read returns a single line containing one of the valid values for
> +		the current device health state. Writing one of the valid values
> +		updates the current device health state.
> +
> +		The valid values for the device health state are:
> +
> +			ok
> +				The device is healthy and operating within normal
> +				parameters.
> +
> +			warning
> +				The device is experiencing minor issues but remains
> +				operational.
> +
> +			critical
> +				The device is in a critical state and may not be
> +				operational.
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 4cb16b419b0c..b7efd607aadf 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -4,11 +4,14 @@
>    */
>   
>   #include "xe_device.h"
> +#include "xe_pm.h"
>   #include "xe_printk.h"
>   #include "xe_ras.h"
>   #include "xe_ras_types.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_event_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
>   
>   /* Severity of detected errors  */
>   enum xe_ras_severity {
> @@ -31,6 +34,16 @@ enum xe_ras_component {
>   	XE_RAS_COMP_MAX
>   };
>   
> +/* RAS response status codes */
> +enum xe_ras_response_status {
> +	XE_RAS_STATUS_SUCCESS = 0,
> +	XE_RAS_STATUS_INVALID_PARAM,
> +	XE_RAS_STATUS_OP_NOT_SUPPORTED,
> +	XE_RAS_STATUS_TIMEOUT,
> +	XE_RAS_STATUS_HARDWARE_FAILURE,
> +	XE_RAS_STATUS_INSUFFICIENT_RESOURCES
> +};
> +
>   static const char *const xe_ras_severities[] = {
>   	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
>   	[XE_RAS_SEV_CORRECTABLE]		= "Correctable Error",
> @@ -50,6 +63,33 @@ static const char *const xe_ras_components[] = {
>   };
>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>   
> +static const char * const gpu_health_states[] = {
> +	[XE_RAS_HEALTH_STATUS_OK]		= "ok",
> +	[XE_RAS_HEALTH_STATUS_WARNING]		= "warning",
> +	[XE_RAS_HEALTH_STATUS_CRITICAL]		= "critical"
> +};
> +static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_STATUS_MAX);
> +
> +static int ras_status_to_errno(u32 status)
> +{
> +	switch (status) {
> +	case XE_RAS_STATUS_SUCCESS:
> +		return 0;
> +	case XE_RAS_STATUS_INVALID_PARAM:
> +		return -EINVAL;
> +	case XE_RAS_STATUS_OP_NOT_SUPPORTED:
> +		return -EOPNOTSUPP;
> +	case XE_RAS_STATUS_TIMEOUT:
> +		return -ETIMEDOUT;
> +	case XE_RAS_STATUS_HARDWARE_FAILURE:
> +		return -EIO;
> +	case XE_RAS_STATUS_INSUFFICIENT_RESOURCES:
> +		return -ENOSPC;
> +	default:
> +		return -EPROTO;
> +	}
> +}
> +
>   static inline const char *sev_to_str(u8 severity)
>   {
>   	if (severity >= XE_RAS_SEV_MAX)
> @@ -91,3 +131,140 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   			comp_to_str(component), sev_to_str(severity));
>   	}
>   }
> +
> +static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_ras_get_health_response response = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_get_health_request request = {0};
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	enum xe_ras_health_status health;
> +	size_t rlen = 0;
> +	int ret;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
> +				  &request, sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to send get health command %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected get health response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +	if (response.current_health >= XE_RAS_HEALTH_STATUS_MAX) {
> +		xe_err(xe, "sysctrl: invalid health state %u\n",
> +		       response.current_health);
> +		return -EIO;
> +	}
> +
> +	health = (enum xe_ras_health_status)response.current_health;
> +
> +	xe_dbg(xe, "[RAS]: get health:%s\n", gpu_health_states[health]);
> +
> +	return sysfs_emit(buf, "%s\n", gpu_health_states[health]);
> +}
> +
> +static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct xe_ras_set_health_response response = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_set_health_request request = {0};
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	enum xe_ras_health_status health;
> +	size_t rlen = 0;
> +	int ras_status;
> +	int state;
> +	int ret;
> +
> +	state = sysfs_match_string(gpu_health_states, buf);
> +	if (state < 0) {
> +		xe_err(xe, "[RAS]: invalid health state '%.*s'\n",
> +		       (int)strcspn(buf, "\n"), buf);
> +		return -EINVAL;
> +	}
> +
> +	request.new_health = (u8)state;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
> +				  &request, sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to send set health command %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected set health response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	ras_status = ras_status_to_errno(response.status);
> +	if (ras_status) {
> +		xe_err(xe, "sysctrl: set health command failed with status %d\n",
> +		       response.status);
> +		return ras_status;
> +	}
> +
> +	if (response.current_health >= XE_RAS_HEALTH_STATUS_MAX) {
> +		xe_err(xe, "sysctrl: invalid health state %u\n",
> +		       response.current_health);
> +		return -EIO;
> +	}
> +
> +	health = (enum xe_ras_health_status)response.current_health;
> +
> +	xe_dbg(xe, "[RAS]: set health:%s\n", gpu_health_states[health]);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(gpu_health);

Do we no longer need admin permissions?

> +
> +static void gpu_health_sysfs_fini(void *arg)
> +{
> +	struct device *dev = arg;
> +
> +	device_remove_file(dev, &dev_attr_gpu_health);
> +}
> +
> +static int gpu_health_sysfs_init(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	int err;
> +
> +	err = device_create_file(dev, &dev_attr_gpu_health);
> +	if (err)
> +		return err;
> +
> +	err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Initialize the RAS GPU health sysfs interface.
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl || IS_SRIOV_VF(xe))
Remove SRIOV_VF. Not necessary
> +		return;
> +
> +	ret = gpu_health_sysfs_init(xe);
> +	if (ret)
> +		xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, err=%d\n", ret);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index ea90593b62dc..8acfd0ffe48e 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -11,5 +11,6 @@ struct xe_sysctrl_event_response;
>   
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response);
> +void xe_ras_init(struct xe_device *xe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 4e63c67f806a..535841b8d037 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,21 @@
>   
>   #define XE_RAS_NUM_COUNTERS			16
>   
> +/**
> + * enum xe_ras_health_status - Device health status values
> + *
> + * @XE_RAS_HEALTH_STATUS_OK: Device is healthy and operating normally.
> + * @XE_RAS_HEALTH_STATUS_WARNING: Device has minor issues but is still operational.
> + * @XE_RAS_HEALTH_STATUS_CRITICAL: Device is in a critical state and may not be operational.
> + * @XE_RAS_HEALTH_STATUS_MAX: Sentinel value for validation
> + */
> +enum xe_ras_health_status {
> +	XE_RAS_HEALTH_STATUS_OK = 0,
> +	XE_RAS_HEALTH_STATUS_WARNING,
> +	XE_RAS_HEALTH_STATUS_CRITICAL,
> +	XE_RAS_HEALTH_STATUS_MAX
> +};
> +
>   /**
>    * struct xe_ras_error_common - Error fields that are common across all products
>    */
> @@ -70,4 +85,50 @@ struct xe_ras_threshold_crossed {
>   	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>   } __packed;
>   
> +/**
> + * struct xe_ras_get_health_request - Request structure for GFSP GET_HEALTH
> + *
> + * GET_HEALTH takes no input parameters; the reserved payload is kept to
> + * preserve the firmware wire layout and allow future extensions. The
> + * driver must zero all reserved fields.
> + */
> +struct xe_ras_get_health_request {
> +	/** @reserved: Reserved for future use. */
> +	u32 reserved[2];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_health_response - Response structure for GFSP GET_HEALTH
> + */
> +struct xe_ras_get_health_response {
> +	/** @current_health: Current GPU health, see &enum xe_ras_health_status */
> +	u8 current_health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_request - Request structure for GFSP SET_HEALTH

Why caps?  Remove GFSP.. the group already has gfsp

> + */
> +struct xe_ras_set_health_request {
> +	/** @new_health: New GPU health to set, see &enum xe_ras_health_status */
> +	u8 new_health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_response - Response structure for GFSP SET_HEALTH

Same

Thanks
Riana

> + */
> +struct xe_ras_set_health_response {
> +	/** @status: Status of set health operation, see &enum xe_ras_response_status */
> +	u32 status;
> +	/** @current_health: Resulting current GPU health, see &enum xe_ras_health_status */
> +	u8 current_health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1[2];
> +} __packed;
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index 3caa9f15875f..9507f68bc2eb 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -293,6 +293,34 @@ static int sysctrl_send_command(struct xe_sysctrl *sc,
>   	return 0;
>   }
>   
> +/**
> + * xe_sysctrl_create_command() - Create system controller command
> + * @command: Sysctrl command structure
> + * @group_id: Command group ID
> + * @cmd_id: Command ID
> + * @request: Pointer to request buffer (can be NULL)
> + * @request_len: Size of request buffer
> + * @response: Pointer to response buffer
> + * @response_len: Size of response buffer
> + *
> + * Helper function to build sysctrl command to be sent via %xe_sysctrl_send_command()
> + */
> +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
> +			       void *request, size_t request_len, void *response,
> +			       size_t response_len)
> +{
> +	struct xe_sysctrl_app_msg_hdr header = {0};
> +
> +	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
> +		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
> +
> +	command->header = header;
> +	command->data_in = request;
> +	command->data_in_len = request_len;
> +	command->data_out = response;
> +	command->data_out_len = response_len;
> +}
> +
>   /**
>    * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
>    * @sc: System controller structure
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> index f67e9234de48..fb434cc165b2 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -23,6 +23,9 @@ struct xe_sysctrl_mailbox_command;
>   #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>   	FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
>   
> +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
> +			       void *request, size_t request_len, void *response,
> +			       size_t response_len);
>   void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>   int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>   			    struct xe_sysctrl_mailbox_command *cmd,
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 84d7c647e743..f82e3fb9b5ef 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -23,9 +23,13 @@ enum xe_sysctrl_group {
>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>    *
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status
> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
>    */
>   enum xe_sysctrl_gfsp_cmd {
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
> +	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>   };
>   
>   /**
