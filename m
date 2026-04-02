Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D42D6AB10
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 21:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87ACE10F529;
	Thu,  2 Apr 2026 21:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4e5+FgT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3B810F529
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 21:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775166375; x=1806702375;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ut8+smWqKaqEDvijQtJIinqY6Q1k2EF1whdKC1AMlaI=;
 b=e4e5+FgTpI+lpnohHZAZiLjqd09+lE7XHLzkSCmGvbNN4DevQRmC+01G
 MT1ysVpOZsdLX6ma6+Fjzxj82eYVR52yadyDwjPFUbs0Aj8XZN/9BZO1K
 ti5czlk8g1L+Pq/F+i0c6rPmbkfV6PRqmLiBOiFtkFtWaglhqi/y9icpy
 vPrV+lnG8Zf6POjYkknJri24gC9r391tPQX1qBbNg7XvHpZfS/afSPpuQ
 JORiYmsr3EKRTB4nEALosU9SdDKYwo4DPTjCuqMvNIOQXX0w82yFdk4fb
 OrUzisXMOY7R0HQvIb6REVIb2Lv2ilriKSW6O94dNZTW2W5l768DyRqx4 A==;
X-CSE-ConnectionGUID: 55P8dv5YRbuqxdf1O0fybA==
X-CSE-MsgGUID: Qtfov0hCTjaOa9grnYhrXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75275016"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="75275016"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 14:46:14 -0700
X-CSE-ConnectionGUID: Jjy1dt9iQUmStOAQwLj+HA==
X-CSE-MsgGUID: AZxk/ABjT7CCyUS6O6vIjg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 14:46:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 14:46:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 14:46:13 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 14:46:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMQ4K3LDOnLXGY43QEi4t0dxzcyMHp2OxcEeEHObwuL6CuIoiP8IGnQoytAW35cTkpo5Hc/9c+5FJoUHtYaHmt62Lhhd95RT2Ng13HO8WEMEuxgHiK9LlTVPSzCVVzKInF0TPM0G87jyNSd2uDXuFFQeYBEaUmhzWUX8t1hqLorldRrsRD1yWfXnn/PCsZdQn93lvsgmj9ueWdyVM4YSt9+g3ksygzJEY2kMhYV03IRx/4GUKJIPaNe5+YlYMaaKjxxBhnxdJwNgUPVbWXlnkLWjYrGEgYaHTkc7VRwRtNwQ3bYVnHi150W76Phyxmj5T+64QrxrxYXav98nhMi+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7gK38CceexGy0eLRhQVkhtpaS4HLMTcPO+dDx3fsr0=;
 b=dPzD5cKZgu1pBEIyqp9ZISkvRlDWLeht5FGa1/SXO03ZV2eTqsG+/15ICJwTQC2Z3sFJOYL0+dMLwTGxAAJP2fcAQHKIl1CflzyzL4CulYX33V01v1HoNnsjWdc/EbxC8Bh8Er8zWxFC2znxwV9dRBr3IOkljhQVoFirif04I1X1jXGbbKjGUmICfIH1/lwP/EtPcs6YO5ICN4k8Lgk+9xKogxRJb7PIvjhh2TZMvqVUhaRFGGtswIfFti0VxsNzvB7Fr8XgW2533pMEZ/kiREodBy6MeXKR4TvA1/MmOD8GXru7WNCF6x1L9DcHIaRtSkyNerLi72vsY05Bv15J9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM3PPFCA4893B55.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 2 Apr
 2026 21:46:11 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 21:46:10 +0000
Date: Thu, 2 Apr 2026 14:46:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [RFC 03/15] drm/xe: Stub out new access_counter layer
Message-ID: <ac7jni3tTviagHP0@gsse-cloud1.jf.intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318074456.2839499-4-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0307.namprd03.prod.outlook.com
 (2603:10b6:303:dd::12) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM3PPFCA4893B55:EE_
X-MS-Office365-Filtering-Correlation-Id: ad6955ef-119f-42b7-0627-08de910140ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 8zpffMaCdDzC/CfmHhany9y6ArJRL5JUAfQYM3JvmK7Zd62Jgz7h424EX0pgudT01wJqsgRrFMeM0RzlIZYOrm+fvMwTAqEPFgJOItDrcdkZ+mOtvfSMLymxubwskyhE/lg38zA+bT0Q2BQbX4emLLvRlmiw0qcjynXXqj+bK+kYQo/KRhTPVEG4Lw8aaAPAPRUSdjACZ+CAP9AHwK2C2uGVgA7KnezI6uL8j4KADlG2yYbbI6jrHDrWGjP1Wqe2q4A3c6YIMh5gpHZ3NcDqQTLJFNrCzweS6rqEymFx4quehQf8DnwZoj2w952vVTjuUXAX7AK16sXefEAnsDRe7kuwtnXoNpWD0hX6AkrPcKrW3quPpBhUj1hlFKXf4oGthP8lk+L268N7GSEswTZRLomWTyZ0ZimbI3m7/N++eAaSxMz2DtJMu/eY1SupQSNnDmGDWFrVxifrwYkwSODxoQpotzSzSOoFWn+Q6wRRcfPNP1u2rwpnM11d2OlIHcaeuYWO7peOJ0dt0arTOB1PkRw/am9gt8ZqKjA0pK+h8UGGV5nNDMIZaAK6DSLyXJ+Kfb3rWpd+/hKN9JSDsBf73sUVCdKInIeheGRHGPIGVILHBUMV/i5kv25eZwu6xDUiWnibq0kRoGtTTudmSzwCkRjklzQMH7bJ4DBXjGk4Nc1uulR0H0L0+LDt5gh8flg3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGRGb0JBZnQyQ0ZHMlJGTW9kK0wxVWZISU5sR1BGNVI1YkFnQjZVbkNteDU5?=
 =?utf-8?B?RGdoU29wcjFoZ3JiMmlvQkhRYTIyV2VGQkhOR3NUN1NpTWdkK01aNjVQaVZC?=
 =?utf-8?B?U3ZWVkFLYU1EanJtbWdJSGtHcmRSY0E0cXMvemptQnMyK0gwRjN6RHRoQjBJ?=
 =?utf-8?B?WWFoejl5SjNuM3F0L0NwSmZ2b1o4RzlXMHFxRnFhbFkxNjlTWkFmLytXRkor?=
 =?utf-8?B?N1lSSGp0cWxRWUlmalpydjR6R3RNUWpOREV6eC90d0h1aUpZOVdlWFlqZDBS?=
 =?utf-8?B?V0ZSV3hYMmNiUTNLcFpSQW92N05oVTBiNTFXWWZBYklCc0c2QXREU1oxT1Q2?=
 =?utf-8?B?MTByUytvblVKdVJxQnRPUXlZNkJSVFA4bzFhMm9oQU40bkxJSzFDMCt0TEJx?=
 =?utf-8?B?VFVMbzFOVzVqbnpyNDFNeklTQXlDQzBiN0NJZEpMc2JHU0N2WENSOStyRTFI?=
 =?utf-8?B?c3ppR0ZHR2M5WmN1cmE2dlZLVWNObDFxRWYxeWFuR2plQnRuclVZKy85U0pE?=
 =?utf-8?B?ODNxSjJIQzJOVG1qSk03bFNKays1T3ZoR1pGYjJ6cGZsbTE5TDVWWll4YTZV?=
 =?utf-8?B?THNQYjhwa1AzQnNpMTFUR25ObEx6TzNwRnZyVFhaNDExTVFDU0dJTGFoR0xs?=
 =?utf-8?B?N0k5cEx3d0pDTVhtTEpHcnQ0QmxBQUFmYlJOb0prVGFLZWU2Ky96OENkUVJF?=
 =?utf-8?B?VkhkYUdvclM1WC9jWVJqT1dxSzhPbm1ZbHZreFF1aC9BYWRnQi9mZzFhL1F1?=
 =?utf-8?B?VnNCYWRkbDZXaENua3NUb2RxMHF0ODJlTlNnamQ4VVBiNmVwdzhEZmNObkJm?=
 =?utf-8?B?TXFKbld2bEh0Ny9WZUVyNGJFc283NkJXdTNtKzY5eWV1QXFFM01mU2c5WVBp?=
 =?utf-8?B?VWl2L1hhVlVDdjFDUkFFOE5tWmxmdkNhRnlFNkRTcHhwd2lNdEZuWGg0NDBh?=
 =?utf-8?B?a24zTW13Nm5yZjA2dk1NcDJOVGxnazBPWmU0UUxYeW9Fa1phV3p1UjJ4Wkpp?=
 =?utf-8?B?a21lZTZ1MnRUbzFPNnEvMnltdXdzQitNaWdIay9IUmRrekZDck9hdnNTKzBY?=
 =?utf-8?B?bDVDeWJsVjQxVlB2dTZMTTVPbS9mbHMyelRlZ1gxY2hjQVBGam5HYUVEMGJ6?=
 =?utf-8?B?a2N0b1BwekpIdEs5T3VVWXlZSy94MDhhUGlDbGZTMnR3OWZWSStvc0Q0UzFu?=
 =?utf-8?B?OXh2VmNhVFMxQ2daN2hYaVU0dWUxcnlRVmNmb0ozRTl0eEJCY21xSWZwYi9C?=
 =?utf-8?B?WnhwVXljcVBaVnR5RmwrQ2NWTzFVaHhJRyt0SXplbmhLbVhRL08vWU9wV29J?=
 =?utf-8?B?VDNHRU5CNUhqOTFrSEovZnBGeUUxN3pabzRVMGJ0a2FJME1WMlIrT3JPOUVz?=
 =?utf-8?B?cmNGQitKZC9pb0p3WlZmdDhqbExvYzdmdzRqQkFaaGtKQ1UveEtNVkJNV052?=
 =?utf-8?B?eUR1akgydnFaY0FvT2dWc1NWTm1Fdy9pTlFIV0J6VTVzTUUyUHFsWS9obWU0?=
 =?utf-8?B?bGlUSHhPTHkzUnZyNGtZK0RMMFNnRm9UeXo0NldvWk1GN3IwVDI0ZG40cUpI?=
 =?utf-8?B?S1JkNFYrYytmR2dnQ2p5c2NicHJtTGhTYk00ZzA4eCtPd1JrR0FDQ1FpZHpr?=
 =?utf-8?B?anh6QzFIY2ZMSXZybUtsVSttUW45T2J3QlFrMlAzcGVHdTNBVDVpa0xkSVRp?=
 =?utf-8?B?NFBJd2tHY2NvaGhuQWNuSHF1YmxKV3ZqQTZocS9jVW9vSG5CVU50VjJmRXdr?=
 =?utf-8?B?TEluc2RzSXlvVm5taTRhTWJzWUQ0akFTYTdNRVgwajkwUWp0bG13NHoyUjZD?=
 =?utf-8?B?cHE0ZTlJMTRxUlVTem9ZT0wyTnB4OVFrWWQ1Q0RNNDl2cjV6YlNMN25HVGtY?=
 =?utf-8?B?RWdLVzl3TDhXdEx1bS84ZnNwbmFJOThJd0g5Smd4NkdtU293WTNEUFFGWjh1?=
 =?utf-8?B?N2huK0MrYkp3ME1WTWVuL0VhOTQzemZyendSSFFHeFZ3aDBPTHJLZWJ4d01k?=
 =?utf-8?B?SEw2YWd5MGRCdEtqc1VRWFR0Ui9BRERicTVreVRDU0xqeWpsM3NLOUcvYWpq?=
 =?utf-8?B?RHNCZEZNSHk0VGlJZGF6THRDVXVZRGcwSCt3QzBTQWZjbnREYTZtYllkcTNi?=
 =?utf-8?B?RFBwazZ2SnZmcmVLMmxQTUtnbnBqb09OWDU2MlRrWldUcy9vR09IbGRrVTI0?=
 =?utf-8?B?aEFzeTR5aDhablNmK1hwSzJRT21qUmRFR0hvK1BuRWxuMVNkNmZEdnRQQmM2?=
 =?utf-8?B?SEZVVS9nYjA4ZXhGdWVSNTNjN2RoeVZDUXJYc2Z5NTIybklVckpoUHd4TjdG?=
 =?utf-8?B?d0IxOEo3ZTJFMnVaRjdtYkhhVGIyS2pVZndFZGt5N0RIR2hyOExEQ256VFBa?=
 =?utf-8?Q?U4Ex24iquPx/Ivcw=3D?=
X-Exchange-RoutingPolicyChecked: NwzhnnssGFC1KXtvZtbM7wdSe9sI95A13ZbJN3gJuggoPmHqoG32/2bzgwBxTzSFt8QCgONpe7hYFQkg7PPGTyMehqyklARTBVoMsqctwJ28uIQoAbbM8+FfwQmSiwCDKU+DgqBm1ly+sbl17oIMAoa4QQKa2qIISAk70d9JLW/y5HrmvfU0xTw758t1M+JaFrPS1/zVPHo7WF03p0bY0Y3CTH2KCT8TiXywUQ0/xcDIyd2P+IFBLb7vh5Hp2kazG9+DIXf7rbMbWZGrs4p9WEfvK7A2fS9hO+sSH5N0XSs+7Bi0TJzgFufxnJrqm5GWeRIfQLX93ymBUvEZ7tnvkA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6955ef-119f-42b7-0627-08de910140ae
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 21:46:10.0910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2AecCXsKofFfprussj/Li/wlMRkSvw8itqrqifgQnZVpRHOWwwfwDR/S8w203qyLi1/W77KfWJe06eBt3G4wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCA4893B55
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

On Wed, Mar 18, 2026 at 01:14:44PM +0530, Himal Prasad Ghimiray wrote:
> Add access counter infrastructure with type definitions, header files,
> and stub implementation. This follows a two-layer producer-consumer
> architecture similar to the pagefault layer.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                  |   3 +-
>  drivers/gpu/drm/xe/xe_access_counter.c       |  55 +++++++++
>  drivers/gpu/drm/xe/xe_access_counter.h       |  17 +++
>  drivers/gpu/drm/xe/xe_access_counter_types.h | 123 +++++++++++++++++++
>  4 files changed, 197 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_access_counter.c
>  create mode 100644 drivers/gpu/drm/xe/xe_access_counter.h
>  create mode 100644 drivers/gpu/drm/xe/xe_access_counter_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 3a3f9f22d42a..92d8d6e4a447 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -32,7 +32,8 @@ $(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe
>  
>  # core driver code
>  
> -xe-y += xe_bb.o \
> +xe-y += xe_access_counter.o \
> +	xe_bb.o \
>  	xe_bo.o \
>  	xe_bo_evict.o \
>  	xe_dep_scheduler.o \
> diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
> new file mode 100644
> index 000000000000..f3a8a93b5135
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_access_counter.c
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/circ_buf.h>
> +
> +#include <drm/drm_exec.h>
> +#include <drm/drm_managed.h>
> +
> +#include "xe_access_counter.h"
> +#include "xe_access_counter_types.h"
> +#include "xe_device.h"
> +
> +/**
> + * DOC: Xe access counters
> + *
> + * Xe access counters are handled in two layers with one-way communication.
> + * The producer layer interacts with hardware or firmware to receive and parse
> + * access counter notifications into struct xe_access_counter, then forwards them
> + * to the consumer. The consumer layer services the notifications (e.g., memory
> + * migration hints, binding decisions). No acknowledgment is sent back to the
> + * producer. The consumer uses an access counter queue sized to absorb all potential
> + * notifications and a multi-threaded worker to process them. Multiple producers
> + * are supported, with a single shared consumer.
> + *
> + * xe_access_counter.c implements the consumer layer.
> + */
> +
> +/**
> + * xe_access_counter_init - Initialize access counter consumer layer
> + * @xe: xe device
> + *
> + * Return: 0 on success, negative error code on error
> + */
> +int xe_access_counter_init(struct xe_device *xe)
> +{
> +	/* Stub implementation - to be filled in */
> +	return 0;
> +}
> +
> +/**
> + * xe_access_counter_handler - Handle an access counter notification
> + * @xe: xe device
> + * @ac: access counter notification
> + *
> + * Process an access counter notification from the producer layer.
> + *
> + * Return: 0 on success, negative error code on error
> + */
> +int xe_access_counter_handler(struct xe_device *xe, struct xe_access_counter *ac)
> +{
> +	/* Stub implementation - to be filled in */
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_access_counter.h b/drivers/gpu/drm/xe/xe_access_counter.h
> new file mode 100644
> index 000000000000..b3a331687f13
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_access_counter.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_ACCESS_COUNTER_H_
> +#define _XE_ACCESS_COUNTER_H_
> +
> +struct xe_device;
> +struct xe_gt;
> +struct xe_access_counter;
> +
> +int xe_access_counter_init(struct xe_device *xe);
> +
> +int xe_access_counter_handler(struct xe_device *xe, struct xe_access_counter *ac);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_access_counter_types.h b/drivers/gpu/drm/xe/xe_access_counter_types.h
> new file mode 100644
> index 000000000000..74b903b9461b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_access_counter_types.h
> @@ -0,0 +1,123 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_ACCESS_COUNTER_TYPES_H_
> +#define _XE_ACCESS_COUNTER_TYPES_H_
> +
> +#include <linux/sizes.h>
> +#include <linux/types.h>
> +
> +struct xe_gt;
> +struct xe_access_counter;
> +
> +/** enum xe_access_counter_type - Xe access counter type */
> +enum xe_access_counter_type {
> +	/** @XE_ACCESS_COUNTER_TYPE_TRIGGER */
> +	XE_ACCESS_COUNTER_TYPE_TRIGGER		= 0,
> +	/** @XE_ACCESS_COUNTER_TYPE_NOTIFY*/
> +	XE_ACCESS_COUNTER_TYPE_NOTIFY	= 1,
> +};

What’s the difference between the types? Patch 8 handles both of them in
exactly the same way, which may be correct or fine, but without kernel
documentation explaining the distinction between the types here, it’s
hard to reason about it. 

> +
> +/** enum xe_access_counter_granularity - Xe access counter granularity */
> +enum xe_access_counter_granularity {
> +	/** @XE_ACCESS_COUNTER_GRANULARITY_128K: 128K granularity */
> +	XE_ACCESS_COUNTER_GRANULARITY_128K	= 0,
> +	/** @XE_ACCESS_COUNTER_GRANULARITY_2M: 2M granularity */
> +	XE_ACCESS_COUNTER_GRANULARITY_2M	= 1,
> +	/** @XE_ACCESS_COUNTER_GRANULARITY_16M: 16M granularity */
> +	XE_ACCESS_COUNTER_GRANULARITY_16M	= 2,
> +	/** @XE_ACCESS_COUNTER_GRANULARITY_64M: 64M granularity */
> +	XE_ACCESS_COUNTER_GRANULARITY_64M	= 3,
> +};
> +
> +static inline int xe_access_counter_granularity_in_byte(int val)
> +{
> +	switch (val) {
> +	case XE_ACCESS_COUNTER_GRANULARITY_128K:
> +		return SZ_128K;
> +	case XE_ACCESS_COUNTER_GRANULARITY_2M:
> +		return SZ_2M;
> +	case XE_ACCESS_COUNTER_GRANULARITY_16M:
> +		return SZ_16M;
> +	case XE_ACCESS_COUNTER_GRANULARITY_64M:
> +		return SZ_64M;
> +	default:
> +		return 0;
> +	}
> +}

As discussed in [1], I think the granularity handling can be moved into
the GuC layer, so there’s no need to include public definitions here.

[1] https://patchwork.freedesktop.org/patch/712600/?series=163429&rev=1#comment_1318525

> +
> +/**
> + * struct xe_access_counter - Xe access counter
> + *
> + * Generic access counter structure for communication between producer and consumer.
> + * Carefully sized to be 64 bytes. Upon a device access counter notification, the
> + * producer populates this structure, and the consumer copies it into the access
> + * counter queue for deferred handling.
> + */
> +struct xe_access_counter {
> +	/**
> +	 * @gt: GT of access counter
> +	 */
> +	struct xe_gt *gt;
> +	/**
> +	 * @consumer: State for the software handling the access counter.
> +	 * Populated by the producer and may be modified by the consumer to
> +	 * communicate information back to the producer upon acknowledgment.
> +	 */
> +	struct {
> +		/** @consumer.va_range_base: base virtual address of range */
> +		u64 va_range_base;
> +		/** @consumer.sub_granularity: sub-granularity */
> +		u32 sub_granularity;
> +		/**
> +		 * @consumer.counter_type: counter type, u8 rather than enum to
> +		 * keep size compact
> +		 */
> +		u8 counter_type;
> +		/**
> +		 * @consumer.granularity: access granularity, u8 rather than enum
> +		 * to keep size compact
> +		 */
> +		u8 granularity;
> +		/** @consumer.reserved: reserved bits for alignment */
> +		u8 reserved[2];
> +		/** @consumer: Platform-specific fields */
> +		union {
> +			/** @consumer.xe3: Xe3-specific fields */
> +			struct {
> +				/** @consumer.xe3.asid: address space ID */
> +				u32 asid;
> +				/** @consumer.xe3.engine_class: engine class */
> +				u8 engine_class;
> +				/** @consumer.xe3.engine_instance: engine instance */
> +				u8 engine_instance;
> +				/** @consumer.xe3.vfid: VFID */
> +				u8 vfid;
> +				/** @consumer.xe3.reserved: reserved bits */
> +				u8 reserved;
> +			} xe3;
> +		};

Can we drop the xe3 prefix here to keep this interface generic across
platforms?

Also, a question: xe3 implies these are only valid on xe3+, so do access
counters not work on prior platforms? For example, without a valid ASID,
the common layer can’t find a VMA.

> +	} consumer;
> +	/**
> +	 * @producer: State for the producer (i.e., HW/FW interface). Populated
> +	 * by the producer and should not be modified—or even inspected—by the
> +	 * consumer, except for calling operations.
> +	 */
> +	struct {
> +		/** @producer.private: private pointer */
> +		void *private;
> +#define XE_ACCESS_COUNTER_PRODUCER_MSG_LEN_DW	4
> +		/**
> +		 * @producer.msg: access counter message, used by producer in
> +		 * acknowledgment to formulate response to HW/FW interface.
> +		 * Included in the access counter message because the producer
> +		 * typically receives the notification in a context where memory
> +		 * cannot be allocated (e.g., atomic context or the reclaim path).
> +		 */
> +		u32 msg[XE_ACCESS_COUNTER_PRODUCER_MSG_LEN_DW];
> +	} producer;

As discussed in [1], unless we have plans to ACK access counters in the
near future, I would just drop this.

Matt

> +};
> +
> +#endif
> -- 
> 2.34.1
> 
