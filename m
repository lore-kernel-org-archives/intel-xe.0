Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D66CD6E50
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 15:19:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E491120C8;
	Fri, 29 May 2026 15:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eig6zr+z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A089F1120C8
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 15:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780067964; x=1811603964;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q34nnaIfwANk6sAXL0xxH22wl25U/4MTaDeoOBTjN7E=;
 b=Eig6zr+z62bq0yA+UxFBj9acB49aIPzdPCCHYxJd0FLa2IhPY/NRgwZg
 yJwStC2giRCAunkNQK0O9B8+eZpNARK7HuQaR8nn1EgllcEj7ikK9ACfg
 Jh4lE6ma4etzp4tR0YAoqkVhrozYD0I1FCDTcN7h5uNHvZkR1bdCNrSMu
 7p+dqma7EXTCehU+Vhl+FlEY0zEDVtw0oSoB7suUb3W3ycX5mMBj9kuTs
 wWhob+5XnFQQj1mQR4Ls2ezPXIlFBuVcn4DAqu9Nj6IGpv0JMi3p4uQrw
 hvN/XqcsT5QTd8RZmbCHttnIpeRBTfu73tNUxVwNGxoz9TLHBowZBc+eb g==;
X-CSE-ConnectionGUID: CX6BBNlpQoyrDxB+d3MMfw==
X-CSE-MsgGUID: lH5cWmpFQmSgc/mfc+fRNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="84547902"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="84547902"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 08:19:24 -0700
X-CSE-ConnectionGUID: snUxp6PURDCgy2N+z9XEgA==
X-CSE-MsgGUID: JbtoUhKMSyeMTk6p127Jaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="247971744"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 08:19:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 08:19:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 08:19:23 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 08:19:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfiOtkehpwd9okoTnYakcQaq+HQN9mqbwACBOJdvibYq+pu2mFogsjD+m1jXNPJJBAt5RG3Cy/xYR1s6g0PvU/BHZhHmfjfXfXqpCcuEy5IJLrgGS8iqZePcmPUT+Pdh5/pojuJ3LLbmg8boF6UMfrtC7btXaSnQHp4ZD89SgpCU30R65j45MWzOPYnat8mgLkw+MzzVA7KZrLLnEjVHWqVdjZJvevocgqw2Bv4XsYewTv7u4ufm5dEO9k8ms09kaylwsULeOR1zH/70yzyo0RKp6J4SoXmltCsns3UVF/WV0CTxHcOGNmsJ4+UZ4n7t4CPWz/v62bAgTwIOL0LZGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPw+QR2WtIhxjyM0RUO1qxWb+jXwXAkZeBBFYcFwl7Y=;
 b=n5pruEXIJV2I0ctTG3T2licyUIic2/+0Q+nAAT6a5QXGnsqkvorxyiCC2+JXkcuwd9Rbz5zQX48iGJ34Ou2yuv2IiNel0/g719wCsL1ts99PaAVoaDAq7cTxWx9///acXq4w6eClSyGf4QMdGxWSICLQ1sHdmkygtoEKR8OjSffjPONzypXKZdIXJc//9WYDriclKXXmoUI3Tni5gtCWKjNERnH45/KkjFRmYL85ovdjXNfsp3siq5kCCfLlOXtlqpsxoMRN/6FH8sL26PTbiUoK0wb1+0b00cPEH311p1TJRR2aaFk8+ZfAwC+GuiYrSdjncErHCX8drgrT49BlKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SA3PR11MB7555.namprd11.prod.outlook.com (2603:10b6:806:311::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 15:19:15 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%3]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 15:19:15 +0000
Message-ID: <a6186e29-d7fc-48a5-abbe-113c6dc1839e@intel.com>
Date: Fri, 29 May 2026 20:49:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] drm/xe/xe_late_bind_fw: Add support to load Ocode
 firmware on CRI
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <michael.j.ruhl@intel.com>
References: <20260305104441.2857181-6-badal.nilawar@intel.com>
 <20260305104441.2857181-8-badal.nilawar@intel.com>
 <de92b0f6-cee9-49ce-a1e2-3a4fc7ac3b7a@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <de92b0f6-cee9-49ce-a1e2-3a4fc7ac3b7a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::6) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SA3PR11MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 6870a13b-561d-4acc-9407-08debd95a4e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JjcJ6jWl7Lt0KwUjQdpH6meG6UaDV08gIrYK7FRL3iEkFIRI2COa6r/1rFs+QMVfQgEZioYN5i2qQFr4D6lZU9mkbK8GmnEMCirznVbgzSqsqdmIqVIMJ7/bvpvEtRoIzPRKKbk5g3dPlurPCNwPCbS/oyEmH0d3wQH9csilRay3Re50kprtzZ7zaRdS/onr48c0t4nDtNAlNth8plPcJziWeVkZ4i9hNf8LzJjk0QiiJPv4e7PQEiWOqHWj+tXB4VupO2VoQCVX4fyWdjdxCEuNJ5N+Jl9xCENBcuMrWHq8jCQB45fjU/rdmCoJOm6RwmzkVu6GaIdIvWkS43fT/VyS4HPU4zVSAZRwTsBr1tXIuZW+jLCjpXUGjU38tOwshoPTieTl0gCiowl7DdlC3BW5ZAB9L6Di/T22cfqlB3eXlM12GpOBS/07c08+HIzVt86CAv6ZjyP9JHyEOo6ViuYWqRKSvaztIpZ/NJ0txknl/X1hNpE8TLR8geHpkxY+Lmmd3GI2Q401GgD1715OaT3r0zIaPtYayvjpuejdvqG5RJWFOH2LmsbCxO1OqC9D3YKAvSXc/l4RNGZuMxjxh+2vNl6QGijcSg63FC9/OA2vDYRBTMpfwGC3T2L1bAkyQTaAbNnPvDh15MbGB/wTmXidPSGjat2HjhCGjtPux/h36ozPSx9ef+1JGcPEb4JO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dithVUpaVy84U3ZYS0Z3ckZEcHgyOVptVGxucjBXbmcyVko0OTlJaVBjVlk1?=
 =?utf-8?B?aVp2MXFFQVd3Vmp1Z1h0MllST1ZVMS9DOEtWdGJCaDZSMUh5R0svU2w1Smlt?=
 =?utf-8?B?dVJUbFUzd1BtR0xuUkhNaGkzNElFWmxPY1YrdTVUQ2UrNWNhdFdPYUs2K3dz?=
 =?utf-8?B?Mk1ETnoxcFMvdS8weUx3R3A1NWNqNmZEdktud1FHaWVMSFBzS2JTVWxwbVlh?=
 =?utf-8?B?SGtieU0wTkZzdllrNFBybkEyRytmN2FNamxVbmRVbHhYSGptUkFTMjBvTmt0?=
 =?utf-8?B?eExJdGpMMEsrRUQrZ2gxV0NiLzNsNEpJUE5BaXl1dnJ6WjVIb1RwVTQzRWxK?=
 =?utf-8?B?aTF2WDgzTTJETE55ZlkzSUcxSzUxRUs0eU1kUG5XNHVWVStjVktWMzBzUlpN?=
 =?utf-8?B?TGxXZjludzNINFdCQXNYZjhiNWtDMDRBSEpZbGQxT2pIZHQ0alc2SWtkSkZU?=
 =?utf-8?B?UnF3YmlpL0QvaUpJNEFEOWhRRHR6aWdtYUt5eDAwY3lDR2JMWXNjcUhPM2t2?=
 =?utf-8?B?QzVZbkNSekg0V01tVTRRK3pNUEJlcVl1Yy9rNW5MMGxrdXJTQVZvMFBGb2xZ?=
 =?utf-8?B?VUNSbGxyNUxxb3NYb2QwMWpDUzF3NGNXZHBQOC9EYWgvNzJSZXo4dkxCSDFS?=
 =?utf-8?B?ck50U1ZkZzF6TTlUdm9CcVlVVzBKenZJWk1CV2pDSGlTZ0hsN0RBNTIzVUtK?=
 =?utf-8?B?amVJZXdVK3ZUT1gxRTFRTmN4ZUxXNjFmdEJUZ0Q4Y0lOSWRiM0ZubUpLYnZu?=
 =?utf-8?B?cmo0V0NOc0ZtWjU0eVRRRjBnK3N2dnAvQWhpaWY0djhoRnhDZXBKUXFXZVkx?=
 =?utf-8?B?SSt2QzZYQXUwMzUwUzcvcmVUdjFnbkVNQ1MwZjdhV3hDY0dOT3RUNlRQZVpz?=
 =?utf-8?B?YnZWeU9ERjBKQ2VWZDFQMjV6Q3pCM1g1R2VvaC9HeXYyR01ZeUpnTUlrOXNa?=
 =?utf-8?B?dld3d1oycnFaZ3ltUjVmTlhPdE1mdUM2NHg0MGt6Q3NlS2JOOU9sMlFucFlK?=
 =?utf-8?B?SnF5V0Vza3ltT3N0b0V4emZYdjBCZ1c0OEpxbGd2WW0wRWxmWUFZTG9SS09t?=
 =?utf-8?B?NXNOY1dldWlFOXg0UXJsc2NiY1JVZ21OdDdUaXV1c3lBcjFsU09QRGhtT2Zs?=
 =?utf-8?B?UWxqd2pvSEJIRTBTeWY3dW9vTHN3eWF1cWtJVkhRT05xYmJuUG9Lb2s4Nis4?=
 =?utf-8?B?VzZqVk1UMzRvUFNlNzlzMWIycDVNYkdOaDRqa1RuZFFFMUJCTWNEampZeC9J?=
 =?utf-8?B?Ti9DZjZNNXU0dUxTQ0JiOWRvWTBkYWN1Nk5lRnZjWUU5UHp5dVlUVnlpQ3RO?=
 =?utf-8?B?QXlPa3ZOdzNVdC9hL0ZIdUNIbzRUZjRUWDhQN0lBckJNZEVUa0JPTUNLZExy?=
 =?utf-8?B?dVBTekdmZVBTZ1NWc1I4M3Qzd01veUdyY1d6VUdzWElFY2FLNEJMZ1pvdWdv?=
 =?utf-8?B?THZDRVVTYnVPa290UzJKcjkyU2pJcGdaMnJKbERCdjdWcUJUVjR6WXorVE9Y?=
 =?utf-8?B?NmRvSVUySXNUUzJMQlNscURrejcrWnVVVU84Yzl4WnQydTVmMVh1cndjWngv?=
 =?utf-8?B?SHNqb2dFbEpYNTl6RDR6QWk0b3c0T2M5ODl6Mmg0MmNaNU9GblE1TEtBT3p0?=
 =?utf-8?B?eVd6NHJxM1lzVEswZldkYlpNRnJLMHNFVzVHTWNtczNoQzJ2ZGVMQ1hrN3dv?=
 =?utf-8?B?dUpTTlNNbUl3cUJVQmMwSnl5cGxHbXIzaC9PUkxNbXN0cG03VTZtblBWYWRq?=
 =?utf-8?B?aVUxTzlFQkF6cDMwVURFVFdtQVExcXM5YnlVKzllK0dyMTB5am42TXpSL3Nv?=
 =?utf-8?B?TkplTHhiUm1FYUN6YWlDb2Y3UkJWdDVwWitOREttd3M2bHRDZEdMTm8vaFBN?=
 =?utf-8?B?Y1Z6TVhlSFRyaEROVjF0UFcyN1h2YUl0OGRKOTg4bmxUbDNqYld4T3hMQXJN?=
 =?utf-8?B?cEpYT3VPM3dDQUVrejBjK3kvcXVhOG9QeHFMMG9PKzlQRHdtNWE5d2djaUQy?=
 =?utf-8?B?Tk0weW5XdkJNUUJLT0FoWWxEUW5ZQ1gwZHJLT3hObVB1bVFPcXBtUlFCR3pq?=
 =?utf-8?B?bU5qZWRxUmFoQ09EOUdOWjBOMHR0d1FaNkx6RWRZZVRMdy91WDFhZjNOMmNY?=
 =?utf-8?B?TlNza3lGekVPU3pGSXNsZFVxSjNaYzZ1S0drV2ZoNWNuVnZZRjlqTWtYbDhm?=
 =?utf-8?B?WHNYN0wrcGNnbFZSMlU2TVd0TTNpd3dIRXQybmZ5aDBrUXZVdytrUWxDOUg1?=
 =?utf-8?B?WVlETXIvMHp6R1JtOFJ0UURXYzg4bDMvUkJwT1BEWitNM2dlTUxBZGdWdlRy?=
 =?utf-8?B?M0VpaUhQaGtsVXltSmtoc0hXekp6R0ZsU1NuY1N4MGl2NTQ4K2pzQT09?=
X-Exchange-RoutingPolicyChecked: hZMskRueg1Z02EvNEVXfyOcCaExpolsgTc49dNGaxafZ5D6S+nAKcrHbD+nS2o9UFlIWnk+/qXkur8Icnt3nvqDmxYafVNgiwEmIs1K9zrm3Xuwt6YsQa4ibvUAo1WdxBv9gmWxxV2snOcK6CaHyd2bM12IP9FHeXv3gCgRnP+gDx47XaqxHPJ5Xko3pp67FgD/kbizmoYrmTMt51RHccDw2swwXhM5wSXV91Ot0Uc6lp7fE5dmNzwLlo7gCZexUh14Eo70zCvXiQCnT3Wf6o5dbWpTbrIgpP4agLsEqAl788++GI2yVUKkHXaqMmHf2qhQW15fp0hMKfPBKuhfICA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6870a13b-561d-4acc-9407-08debd95a4e6
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:19:15.0369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0e2uL06L1OgGktoc8YVBce+NhUsSOzXVZ1ClD1Cn1+ivSlelg4VUJeXlrR+d8cGMt5zaoImHrbIRcGwD/SxWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7555
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


On 06-03-2026 05:08, Daniele Ceraolo Spurio wrote:
>
>
> On 3/5/2026 2:44 AM, Badal Nilawar wrote:
>> Ocode is the OOBMSM telemetry/manageability firmware, and on CRI it is
>> loaded through late binding flow.
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 49 +++++++++++++++++-----
>>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  2 +
>>   2 files changed, 40 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index 5ca25186dc0cc..d3ef2926517bd 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -33,10 +33,12 @@
>>     static const u32 fw_id_to_type[] = {
>>           [XE_LB_FW_FAN_CONTROL] = INTEL_LB_TYPE_FAN_CONTROL,
>> +        [XE_LB_FW_OCODE] = INTEL_LB_TYPE_OCODE,
>>       };
>>     static const char * const fw_id_to_name[] = {
>>           [XE_LB_FW_FAN_CONTROL] = "fan_control",
>> +        [XE_LB_FW_OCODE] = "ocode",
>>       };
>>     static struct xe_device *
>> @@ -179,6 +181,34 @@ static const char 
>> *xe_late_bind_parse_status(uint32_t status)
>>           return "Invalid Payload";
>>       case INTEL_LB_STATUS_TIMEOUT:
>>           return "Timeout";
>> +    case INTEL_LB_STATUS_INTERNAL_ERROR:
>> +        return "Internal Error";
>> +    case INTEL_LB_STATUS_INVALID_FPT_TABLE:
>> +        return "Invalid FPT Table";
>> +    case INTEL_LB_STATUS_SIGNED_PAYLOAD_VERIFICATION_ERROR:
>> +        return "Signed Payload Verification Error";
>> +    case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_CPD:
>> +        return "Signed Payload Invalid CPD";
>> +    case INTEL_LB_STATUS_SIGNED_PAYLOAD_FW_VERSION_MISMATCH:
>> +        return "Signed Payload FW Version Mismatch";
>> +    case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_MANIFEST:
>> +        return "Signed Payload Invalid Manifest";
>> +    case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_HASH:
>> +        return "Signed Payload Invalid Hash";
>> +    case INTEL_LB_STATUS_SIGNED_PAYLOAD_BINDING_TYPE_MISMATCH:
>> +        return "Signed Payload Binding type Mismatch";
>> +    case INTEL_LB_STATUS_SIGNED_PAYLOAD_HANDLE_SVN_FAILED:
>> +        return "Signed Payload Handle SVN Failed";
>> +    case INTEL_LB_STATUS_DESTINATION_MBOX_FAILURE:
>> +        return "Destination MBOX Failure";
>> +    case INTEL_LB_STATUS_MISSING_LOADING_PATCH:
>> +        return "Missing Loading Patch";
>> +    case INTEL_LB_STATUS_INVALID_COMMAND:
>> +        return "Invalid Command";
>> +    case INTEL_LB_STATUS_INVALID_HECI_HEADER:
>> +        return "Invalid HECI Header";
>> +    case INTEL_LB_STATUS_IP_ERROR_START:
>> +        return "IP Error Start";
>>       default:
>>           return "Unknown error";
>>       }
>> @@ -264,7 +294,6 @@ static void xe_late_bind_work(struct work_struct 
>> *work)
>>       /* Do not re-attempt fw load */
>>       drmm_kfree(&xe->drm, (void *)lbfw->payload);
>>       lbfw->payload = NULL;
>> -
>
> I think it'd better to keep an empty line before the "out" label.
Sure.
>
>>   out:
>>       xe_pm_runtime_put(xe);
>>   }
>> @@ -314,9 +343,14 @@ static int __xe_late_bind_fw_init(struct 
>> xe_late_bind *late_bind, u32 fw_id)
>>               return 0;
>>       }
>>   -    snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), 
>> "xe/%s_8086_%04x_%04x_%04x.bin",
>> -         fw_id_to_name[lb_fw->id], pdev->device,
>> -         pdev->subsystem_vendor, pdev->subsystem_device);
>> +    if (lb_fw->type == INTEL_LB_TYPE_OCODE) {
>> +        snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), 
>> "xe/%s_8086_%04x.bin",
>> +             fw_id_to_name[lb_fw->id], pdev->device);
>
> Are we expecting different ocodes for each PCI id? if not, we could 
> name this like the other fw binaries as <platform>_ocode.bin (e.g., 
> cri_ocode.bin)
Yes, ocode firmware is 2-ID based.
>
>> +    } else {
>> +        snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), 
>> "xe/%s_8086_%04x_%04x_%04x.bin",
>> +             fw_id_to_name[lb_fw->id], pdev->device,
>> +             pdev->subsystem_vendor, pdev->subsystem_device);
>> +    }
>>         drm_dbg(&xe->drm, "Request late binding firmware %s\n", 
>> lb_fw->blob_path);
>>       ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
>> @@ -326,13 +360,6 @@ static int __xe_late_bind_fw_init(struct 
>> xe_late_bind *late_bind, u32 fw_id)
>>           return 0;
>>       }
>>   -    if (fw->size > XE_LB_MAX_PAYLOAD_SIZE) {
>> -        drm_err(&xe->drm, "Firmware %s size %zu is larger than max 
>> pay load size %u\n",
>> -            lb_fw->blob_path, fw->size, XE_LB_MAX_PAYLOAD_SIZE);
>> -        release_firmware(fw);
>> -        return -ENODATA;
>> -    }
>
> Why is this check being removed? is MEI/CSC now going to accept bigger 
> payloads?
Yes, ocode firmware size is 80k+. So dropped this check. MEI driver 
sends the payload in chunks of 4k.
>
>> -
>>       ret = parse_lb_layout(lb_fw, fw->data, fw->size, "LTES");
>>       if (ret)
>>           return ret;
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> index 2a8a985c37e71..a128e3f638a6c 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> @@ -20,6 +20,8 @@
>>   enum xe_late_bind_fw_id {
>>       /** @XE_LB_FW_FAN_CONTROL: Fan control */
>>       XE_LB_FW_FAN_CONTROL = 0,
>> +    /** @XE_LB_FW_OCODE: Ocode firmware */
>> +    XE_LB_FW_OCODE,
>
> This will now automatically look for ocode for bmg as well. not an 
> issue, but potentially noise in dmesg. Maybe we could change 
> has_late_bind to be a mask of supported fw types? that way we can set 
> it to BIT(XE_LB_FW_FAN_CONTROL) on BMG and BIT(XE_LB_FW_OCODE) on CRI 
> and skip the FW type if not set in the mask. Not a blocker.

Fine I will modify has_late_bind  to late_bind_mask.

Thanks,
Badal

>
> Daniele
>
>>       /** @XE_LB_FW_MAX_ID: Number of IDs */
>>       XE_LB_FW_MAX_ID
>>   };
>
