Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121DEC25B74
	for <intel-xe@archiver.kernel.org>; Sat, 18 May 2024 04:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A435410E034;
	Sat, 18 May 2024 04:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtiqKNob";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8679F10E034
 for <Intel-Xe@lists.freedesktop.org>; Sat, 18 May 2024 04:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716005388; x=1747541388;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ubFIrnCk9o+QvA1Gr87RDF8QTuA4go23eLsMWDygXus=;
 b=LtiqKNobVo8hyXGUdKWeEOLDXI6L3vsOl3M3DrRf9P9B1L53AD7M+DHp
 n6QEy4wcKmle47drWB8kpGi7ufZ93LBFCUU/AedgaskpEpDdTZnv4zKOP
 t9dvZL53IETLjYhUd81TzIK2ywW1dMjesQQfpLRQ84Iy9CtdOMvZU6LuM
 CVIpTGUG1WyF5PSrp2KN3m6GVvRvZ2MIwJzeCsG4He9K1Wun+oOPmGzch
 hdWveDOZex9IwrG0Ge1/z5VZUzcu0x4wyb2HyEs/djdggllDu1jgTGdFU
 9h0itVyRhMBEdvHkpQpbC6s07DbAXmAMYpWLuxHFytCCbQ9ohUi1NkuPX g==;
X-CSE-ConnectionGUID: Uz7Bd0vzQ2CbIS5c0T6GIg==
X-CSE-MsgGUID: EP36rY7VQC6pduvBVLmkPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12388829"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="12388829"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 21:09:47 -0700
X-CSE-ConnectionGUID: n5rAc+OnShmBG5j4vtf4SA==
X-CSE-MsgGUID: cI9zrn3HS7evPUoxkOVRdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="31980728"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 21:09:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 21:09:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 21:09:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 21:09:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 21:09:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZowZvcsWU75uQrioh4wmEsq0JHgX/aqmPvNawDV/rYH7++vxi4nJ8o9loy5kYn+yZn0fTWAVyFeEwoy6NTrPvumXEPoO//93TBRvI9pypbjSI5UTaso9XGX23QBjfBtOtYtVvrlEThsUdffKmsbtuzYrhb/EIFZOLLRhy+mMBwBcKiwp4wT7b/q2mIu3h+0V0/RWGVfr5ezqofi2XxoQI7/2QeJ/1Ib2qOChWHOtKZq+PreAQLaohVF5d3tjaUPXVRQcLJSy2OJSRrOIvItTf3GejTaXNN4UdI3sd3EdaJaWYfhWSvszBa0ixm8IgrtP0LApW2v+i58+Tv9CaIkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oR8EOcURQnSYRoN92b9plSOUqJYkCVzKUJ+Y04ox0C8=;
 b=SRqh/RVy5M8rFRq8mnkHvxPn1s4DkjlUJp3BC1nmWevx8hYcSJBIVuLhDYhU4WB2wU4xOQn6rIMalD+IE+DHFAwAImb1SHQQ7EkkWsl/9xcXF10CqSL8CBq996xKbWlAU2AVhlxGSJ58h5rv9eb1j7J3M6YSBale0k4OllKpTFeombeM+QWteqh4krLxwKYjWwWTMeGRMYXVgOWUPUZiGj1J1X2TfG2XnkkuzY4hjfjaqA4yRu8zX//BO+eumr1PCEzxbaNGI/adfIfIepBeKY2rSsHW+7kxSr7CAH8R2wiTPcBUsQL7NBmo0//IIRQcw4mzHX9mb40fVxJEzcrXYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB8180.namprd11.prod.outlook.com (2603:10b6:8:18d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Sat, 18 May
 2024 04:09:43 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7587.028; Sat, 18 May 2024
 04:09:42 +0000
Message-ID: <df8779dd-1591-47cb-ae7e-df8840690a1b@intel.com>
Date: Fri, 17 May 2024 21:09:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe/guc: Port over the slow GuC loading support
 from i915
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240409190516.2884064-1-John.C.Harrison@Intel.com>
 <20240409190516.2884064-3-John.C.Harrison@Intel.com>
 <bkdt7nxfzgapofla5is2bwabdzqhocedwackbp4caj2v3go6fe@5lcjkpawbie3>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <bkdt7nxfzgapofla5is2bwabdzqhocedwackbp4caj2v3go6fe@5lcjkpawbie3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0032.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::45) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: b25af8fb-9ebe-48fc-a516-08dc76f05864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUtiRy9SUmN0YXdJa1RXYllYM3N2U3VmRTg4SGxFcFRJOHJUalNXVjFxU1Fo?=
 =?utf-8?B?ZjRpMjdMajlqZ2VTS2ZkUm85NG9kMm00eXRhQWpkRURTcjZDc0tlUnRiSStD?=
 =?utf-8?B?dHk5QTNKdFVaOGpFVGNjUldIb2lSVFBLT3BBU2ZsS1RMMXBIL29FZ0RmN1ZV?=
 =?utf-8?B?S2psOHUvYnlTQ05tOXJRR1ZweWVEUUZPWGppZE1Uc2JHSTYraGQxU3RmVVdi?=
 =?utf-8?B?TWxFQ3FKaHRjb1ZiOVFQUW5PYmNpbEdvRkZNQXZsdnB6dkhHMlM4WlkxcWtq?=
 =?utf-8?B?d29WaldEK2FBTVpVNTY5YVFPYUtVNitxOElDaHJWYzhPcElNMWE3THJJUTVv?=
 =?utf-8?B?dEhZMnFwY1d2SEdvVEZkZ2JsVTVHallMMWhwU0FYNkpzTURHRFV3d25nYWpy?=
 =?utf-8?B?RUR4eVdtaUloWDZxN3NiM3ZSdU1BYWZmSVRueWo2WURYbHhlVjlIcWo4N3B4?=
 =?utf-8?B?NEM4VjNrNHNvK2QxTEx0YnlTZVg1dlpmQlNkS25BRk9makVtRHk5Y2tIVW13?=
 =?utf-8?B?S3ZCdVdibEJrQmZEOFhUTW9yMk53VGVDeGsycjdLdWw1ajRZTS90WDdzcldF?=
 =?utf-8?B?WHdQQkkvaTJMd1hoQTdLZVI4c2FRbXJNTUh2OFE2ODhsVHBPejdlTDBNQ1dk?=
 =?utf-8?B?eW0xOWhNUHpueTlPUDJyME9kWEtkUU1DQ3pJRlE4clBVeDNpU3dFMS9yT1p3?=
 =?utf-8?B?NGR3SDJtNys0c2lIak5tSmRGdG1JQ1RvN3VIN0pHeGVGZ2xob1V6UFE5NTQw?=
 =?utf-8?B?aDhaT3lscnBJeGtmczEyZHBKa296Q1FLb3BZQmFJUjB5STVMMHpKM0dMd3Bs?=
 =?utf-8?B?S25yeVFoQ3Y5cEV3UmxxemkrQUhRc0lxcHJLYWlhYlQrcSttWWpod2tmb0I3?=
 =?utf-8?B?Y1RvRlUzRjBMbTBSUGdCNk9KdU1KR2d1aXgxQm50VGNKNW9EMnJuYzF5SThO?=
 =?utf-8?B?SnU1ZjdMVGtvc3ZlSzVKaTJUckExT1BXeDRNNThkb01qMHBCd1hML3dSM3Rr?=
 =?utf-8?B?OHlsdW9QeDE3M0UxaXNlclZJWTUxeFQ2cWRIUE8rUVYrN2VlUkMzUmRtUGE5?=
 =?utf-8?B?UUVYTXQxMENsZ0pGcGhlS2k3TEtnUjZVcWhNK01XVGdhckNtNHVqczBTNC82?=
 =?utf-8?B?MFVSSlorY3R6RlVDcXZ0K2xXWkd6Q0dsMURORmxqRUM3dGFxODJBTUVwQTBk?=
 =?utf-8?B?cnBiVGlTbnoxbllyS1ptcmYxTWllUXV3cjF2by93UGY1WGpGcTZSclYrN2E4?=
 =?utf-8?B?NVVndXRneWRnYTk2S01zUmFkbHppTUtaOU1jQUQ3MDFkN3poZVRyRG9XSmNN?=
 =?utf-8?B?S2MvcFNwU1FuTFlWY1NEdTF6Ny9wczh4TU9YNHVtbnc3UEYva0ZUTVp1WUs3?=
 =?utf-8?B?eTVuZjE2Q2o1YmpsYk9aWnVKdFgyYW9YZnhreTBZYldmaEY5T0sxZnAzcHVh?=
 =?utf-8?B?QUE1UnpKZzc0OWFrcGNDbEdhcXR3cVVCeGEwRnVzeFBKTXJlZTNLQi9CVEVj?=
 =?utf-8?B?eDlVeVlVNkRNbEkxSjRLUjRxc2JVR0RwZ1BvRDJvamFQV0RLcmY1YkdCbGp0?=
 =?utf-8?B?RVN5WStFdE90amdHVHpMOXJMR2dwV09QRTB3aTdHbXI3d0tPY0pHV2tPcXlt?=
 =?utf-8?B?RXlZc2RuanZWUllXY0JYTTlXUHNXODNDcUIyZDAwTW9uZjNtV2hOajIyMU1k?=
 =?utf-8?B?bEd1aEpYL29oaFRhZlE4Z1BoYjdyM0l6VHNRMG9mVkg1WHpwNUxUM0pBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG5ybjExN1VVa3h4d1ZNTlIyeHZFREkwVHlVcldZZHJPcmFDQzZaL3kvUWVu?=
 =?utf-8?B?SllSYlZaOGRMOTdHZmVEMlBPbFI5VXZLUURaMmxqTUkzc0QyM0UwSHEyY1Mz?=
 =?utf-8?B?aUJ6NXNNeVZtV0xLRzQxeFNTRmJDSys2MmJ2cnhXbWhSUlBnWlJjOWV6RHNq?=
 =?utf-8?B?Q0s3QWZyQTFYSExJZEo4NVVocHp3ekhLd0kwazVNR0NqYTJnOEFpODFRWmdI?=
 =?utf-8?B?ZTFKTFJUdkNRRmNKU1FzOERhb3M0QlBXc3g3cnhDbFpnWGpDODBPUXpXU2lG?=
 =?utf-8?B?TzFySFFrbWxIY2FKRjA4WlRXV1FtZGhIOGQ0NzBNcmNOcnZCQXYvL2MwVXVF?=
 =?utf-8?B?K3JVcG0xOU5oK3c2QUt1RklwSnBqdFZzR0t4dTMwSmhNU1RybUlsWmRzN1Zx?=
 =?utf-8?B?djBIZXBaa0NtT1pGZWl6ekhNamhpdUpnRVBIbE5zaTV5dmE0ZmtMb2huZmJy?=
 =?utf-8?B?TXRBREg3ZnpHT2JXekYyRkF5a1NwbU5IdkFnditYWFZSQUxyQkl4dkdPVXN5?=
 =?utf-8?B?TUh0WUhNVFllUyt1SDdBdzhwOU9hVE0rY1ZDN0d4a1prbjl0S3pIeEQ2YmYr?=
 =?utf-8?B?eVdYUCtSeHRITTRDSTJ2bE1LMXVKcHFJVU1ibm9lb3ZCdVVSS2dLWW1HWnpo?=
 =?utf-8?B?cGx0UWladUFLUUh0bG1ER2V2WjdEMFlvSUpYdVBKOXJUdlhwbmU4YzVCQjJj?=
 =?utf-8?B?N1FmYkRYc2hMMk53S28xRGkzKzE4VnlqWmRDNjF2VkcxSHZVK0NPd3pzbmFS?=
 =?utf-8?B?dkpCU3pvdEExb3BHSWx6TzVFMFhGUXhodm9rTkxzZEQ4KzFpNnl3UUxRdmNF?=
 =?utf-8?B?K25UdUxUUTE1ZjFjMjBTOEdmaEJtMUxqYmdXUVdxM3JWM1FTenNBT2ZvNUpK?=
 =?utf-8?B?Q0lGN0p6Nk9odjZDVWxma0o0SmhEa0w2WlZzSkFwTDJlZXhqZjdDV1pZUmtY?=
 =?utf-8?B?RW05cDY0cFBZeHdEQS8vc3Q3VGRMenZNa3Z2dkZHU3Z6ZVc3WmVVL0NxZFNk?=
 =?utf-8?B?TEdOdWprODVpTHgvSGtKaGRCMmVEVXVHMWZuM2poQWtPSjN1ckhBdkFKTWd5?=
 =?utf-8?B?RStaQ25JZjk3OHB5M2kxdlRkeFhMYkV1Wm1VVFJLSXBOZHZGR2QvaksxQUJh?=
 =?utf-8?B?YUNETkFTdXBoV2UxYURYd1lFd3c0c3FOWHFpdjFVNXZaY0xIdnNXZFdtRTA4?=
 =?utf-8?B?d3JOTm1mMUZQVlh4OEY4c013aFA3dk1xdUprTTVVcUVPd2xXdUs5S25tdGtJ?=
 =?utf-8?B?TFNPd1owOFIyMWJYZ1ZUcEFwSDZzWTdGTEoxRzFjT051WkdRYkFIUWNCMmhD?=
 =?utf-8?B?ek9DeDlzd0xodWdqRk9HYkZXcmo1QVR4dzZhVXBKdDA2L21tNVVNQ0hnU2hs?=
 =?utf-8?B?UEpacTdNc004emh1R2oya3JpU1JVTENGcHZUdDZtdzNjNTYxMEdpbnFVSmFM?=
 =?utf-8?B?VWhDNURKSVRhRDA1WjVTN0ZTV3B3YjJNTUVSSXFNWVhic2hrZlZLVEo3Vlhv?=
 =?utf-8?B?Q3o3bGMvVnVDRVQ5TURUNEo2STlxaU1OZnkwdU5JbllSVUlTYlpaRXpjTDdk?=
 =?utf-8?B?YkRFRjdIa0ZyUTlvMmx6R2RJUDBnRGNsRjlVenBtZ2lBbGFIQ3pzNk16T013?=
 =?utf-8?B?VmNJek5selVyQ2hJekVNaW1MbzJvRUYweXhhVjZ0aEt6WDh3aWc0NkU3QzZF?=
 =?utf-8?B?ZmQ0WnZaRjRaVXZjYVV6QUlJZFQrN1Z4NHBsNnQ5OGJSUUdmc1E3T1RDa3BL?=
 =?utf-8?B?UnRHaUpOdkd1SkthUXlzNG8zTkZHU3laUVdsZGZnZ0ZFOHpPcXdlcHlVQWlU?=
 =?utf-8?B?Qkp2aE5yclU2a3V2b2lLQ2x0cG1Za00wdmozZ2Z5bmtsRmRFZGNBUXNiUHNo?=
 =?utf-8?B?OVlMSmI2K00rWkNWSURJSVNVWkJwY0NmWEdZb1g1bGhTaXJGblJ6cGdEMnp2?=
 =?utf-8?B?Qnp3VUlMTnlSMFBOekxZWjNvRnlsVjVJZjIvRWpGUVNodDQ0Y0x1U0tkYUpq?=
 =?utf-8?B?ODNGdlgzYXlNbFFPNXFldVhscENKZkNmcVhFdzQzVEErV0JWZGFydFBqbGEw?=
 =?utf-8?B?bm5rejBKblIvRUtyMU5JTXNWUU1vTnZVNVNtTEdFRUYxWE43SWl4emNNWTZz?=
 =?utf-8?B?LytEZmtNUHpDaUx3bXlYbjd4cEV5MUQ2cFhUM0did3d5RW9hekJnMHd5YStE?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b25af8fb-9ebe-48fc-a516-08dc76f05864
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2024 04:09:42.8565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uF8IBM+xbb/hQ47ny+eqXWIE7d4CDjX2ULqDpp0JYkfi0+PebBxiFeQ5pemM25Dat3RZJL5oJOq9ENLxgwm/SvZQip8SJ44VQLCHlk9idAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8180
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

On 5/17/2024 14:57, Lucas De Marchi wrote:
> On Tue, Apr 09, 2024 at 12:05:14PM GMT, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> GuC loading can take longer than it is supposed to for various
>> reasons. So add in the code to cope with that and to report it when it
>> happens. There are also many different reasons why GuC loading can
>> fail, so add in the code for checking for those and for reporting
>> issues in a meaningful manner rather than just hitting a timeout and
>> saying 'fail: status = %x'.
>>
>> Also, remove the 'FIXME' comment about an i915 bug that has never been
>> applicable to Xe!
>>
>> v2: Actually report the requested and granted frequencies rather than
>> showing granted twice (review feedback from Badal).
>> v3: Locally code all the timeout and end condition handling because a
>> helper function is not allowed (review feedback from Lucas/Rodrigo).
>> v4: Add more documentation comments and rename a define to add units
>> (review feedback from Lucas).
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>
> ...
>
>> static int guc_wait_ucode(struct xe_guc *guc)
>> {
>>     struct xe_gt *gt = guc_to_gt(guc);
>> -    u32 status;
>> -    int ret;
>> -
>> +    struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>> +    ktime_t before, after, delta;
>> +    int load_done;
>> +    u32 status = 0;
>> +    int ret, count;
>> +    u64 delta_ms;
>> +    u32 before_freq;
>> +
>> +    before_freq = xe_guc_pc_get_act_freq(guc_pc);
>> +    before = ktime_get();
>>     /*
>> -     * Wait for the GuC to start up.
>> -     * NB: Docs recommend not using the interrupt for completion.
>> -     * Measurements indicate this should take no more than 20ms
>> -     * (assuming the GT clock is at maximum frequency). So, a
>> -     * timeout here indicates that the GuC has failed and is unusable.
>> -     * (Higher levels of the driver may decide to reset the GuC and
>> -     * attempt the ucode load again if this happens.)
>> -     *
>> -     * FIXME: There is a known (but exceedingly unlikely) race 
>> condition
>> -     * where the asynchronous frequency management code could reduce
>> -     * the GT clock while a GuC reload is in progress (during a full
>> -     * GT reset). A fix is in progress but there are complex locking
>> -     * issues to be resolved. In the meantime bump the timeout to
>> -     * 200ms. Even at slowest clock, this should be sufficient. And
>> -     * in the working case, a larger timeout makes no difference.
>> +     * Note, can't use any kind of timing information from the call 
>> to xe_mmio_wait.
>> +     * It could return a thousand intermediate stages at random 
>> times. Instead, must
>> +     * manually track the total time taken and locally implement the 
>> timeout.
>
> I went to see the v4 because after reading this I had the impression we
> had already talked about how to improve it. Honestly reading the
> changelog in the cover letter ("helper functions are not allowed") and
> the replies to v4 it doesn't seem there's a willingness to improve our
> abstraction. Instead it seems we are shoving more code and "let
> maintainers rewrite the damn thing later".  This is not a recipe to get
> code accepted.
>
> Sometimes horrible code that works is better than one that doesn't. 
> Sometimes.
> But it's also good when we try our best to improve the abstractions.
I don't know what you are arguing here.

The first version abstracted all the timing code out into a helper. But 
I was flat out told that it was not allowed because it was too generic 
and I had to use xe_mmio_wait32 and code everything else locally. If 
there is a way you want this written then feel free to explain it or do 
a follow up patch. But all suggestions so far either don't work or are 
just minor variations on the original version that was banned. The wait 
condition is not some trivial arithmetic operation, it requires a 
callback function. And as soon as you have a callback function, you can 
do what you like in it. Which means it is a 'kitchen sink' helper that 
is apparently illegal.

>
> ...
>
>> +/**
>> + * xe_mmio_wait32_not() - Wait for a register to return anything 
>> other than the given masked value
>> + * @gt: MMIO target GT
>> + * @reg: register to read value from
>> + * @mask: mask to be applied to the value read from the register
>> + * @val: value to match after applying the mask
>> + * @timeout_us: time out after this period of time. Wait logic tries 
>> to be
>> + * smart, applying an exponential backoff until @timeout_us is reached.
>> + * @out_val: if not NULL, points where to store the last unmasked value
>> + * @atomic: needs to be true if calling from an atomic context
>> + *
>> + * This function polls for a masked value to change from a given 
>> value and
>> + * returns zero on success or -ETIMEDOUT if timed out.
>> + *
>> + * Note that @timeout_us represents the minimum amount of time to 
>> wait before
>> + * giving up. The actual time taken by this function can be a little 
>> more than
>> + * @timeout_us for different reasons, specially in non-atomic 
>> contexts. Thus,
>> + * it is possible that this function succeeds even after @timeout_us 
>> has passed.
>> + */
>> +int xe_mmio_wait32_not(struct xe_gt *gt, struct xe_reg reg, u32 
>> mask, u32 val, u32 timeout_us,
>> +               u32 *out_val, bool atomic)
>> +{
>> +    ktime_t cur = ktime_get_raw();
>> +    const ktime_t end = ktime_add_us(cur, timeout_us);
>> +    int ret = -ETIMEDOUT;
>> +    s64 wait = 10;
>> +    u32 read;
>> +
>> +    for (;;) {
>> +        read = xe_mmio_read32(gt, reg);
>> +        if ((read & mask) != val) {
>> +            ret = 0;
>> +            break;
>> +        }
>> +
>> +        cur = ktime_get_raw();
>> +        if (!ktime_before(cur, end))
>> +            break;
>> +
>> +        if (ktime_after(ktime_add_us(cur, wait), end))
>> +            wait = ktime_us_delta(end, cur);
>> +
>> +        if (atomic)
>> +            udelay(wait);
>> +        else
>> +            usleep_range(wait, wait << 1);
>> +        wait <<= 1;
>> +    }
>> +
>> +    if (ret != 0) {
>> +        read = xe_mmio_read32(gt, reg);
>> +        if ((read & mask) == val)
>
> did you mean != here?          ^
Doh.

John.

>
> with that fixed,
>
> |    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> Lucas De Marchi

