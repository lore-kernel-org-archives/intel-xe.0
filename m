Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11C8CCF9F8
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 11:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D60B10E707;
	Wed,  5 Nov 2025 11:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUPMXnE2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351CC10E707
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 11:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762343919; x=1793879919;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kImOcMpd/4W25UaG7EoCkGIypws9l+ibEyh61WC/IzA=;
 b=MUPMXnE2kKrD+RqIl19DIRO+glot7i57zzAJeVI1+N+s0kPwSx+4lwQq
 Kd737RkF4rMq2ibdlChe6PPWetVNo1ce3CwLRyKbU6CjrYydplY0jQTJ7
 ZkiGFHtsVANzYrNHuZxP34JZJKfxZpECrhBWHU4CYkCwHKETzKLRIQHDg
 gRqSj2jloAwH5OhiAheG6vkp1mm1hfovgLxiYBO7tmKPONa/OsSnBA8eP
 /JfYfEmhSF/fYW52v8cbSJnf1ARe2YjntFrreARWCH3TvsilrfdsjkCtx
 R1q7K+pBAKar+s5Gexu1ZLJAccXHvehtFa6BocD4gj22+JCoCJFEqn5IS A==;
X-CSE-ConnectionGUID: xcjbJTeIR7OZaiOpr83lZw==
X-CSE-MsgGUID: Od/vOgr0ThCuL4BdKA9WIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64382422"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64382422"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 03:58:39 -0800
X-CSE-ConnectionGUID: Co4bpFj5QB2WA6QIqvsFvA==
X-CSE-MsgGUID: N7JLR3R3RCK3nBNuU+hDsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="224684150"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 03:58:39 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 03:58:38 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 03:58:38 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 03:58:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrH5+g4yokb02EQicFEPi6nXKj17DTkmcTPd0SU+tVJa5K+RnmWeC2AHu8Sl+7d8v9LMoq+H4NV/XVA0jquwT/kN+z+QdCoHNU4f15rG/gqD5HqC1Qp9I9NVR95z5tJ5sPRhi+6RwrV5kgafYeWqXpYnE9SLr3tNySweEv4rYTcJ+p6Nm0qjS653MRphZgvNOq4Bter9S2S5TsKffAhvqaWVZzfsROXytF5eUKP6QZGnVSOnDfJIxi40FUyjgZy3NXOX6y6r3XhkACff6DWdml9k5fSS8+AMksIa85z1rww+vrvMKjsGIr6LqEXNA5ZTT6K/2npdafuut3DgzHYkSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErHGepuc0qg1o+kEzjjW1wfkLZRnZc9RqOryibi6Pcc=;
 b=bSJHVkpW9eH4POZFf/Wi11AUjIob3i0iJUc08g4Gh5NLi8WPZru/J0zhzROdo3KkmrSeCShkYVFnOXMNqOM0qWNldKj4SewO1KN14LVRidMf2VcDtFZQHObkvLPjqEeSpxPpP2BBS4K0Xn8IfXpIHiFES7uFiwNfpGvtYBDqQcaEJwx8zWUocvw/dHKTlfMRy5ek0QgWgwCbG7DyaLFW5Evp3GJbg4kvA3yMpNpi+krNGMDj9kflL/aSKxpTWefnI+5a13goWxFRmtj5/7b6nblr/URxXvw93utXKzh5KUNFwq3pUc4AxlV+JjH5HzJjABldwh6qW+wseDjnrkavYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by IA0PR11MB7741.namprd11.prod.outlook.com (2603:10b6:208:400::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 11:58:35 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 11:58:35 +0000
Message-ID: <9623f633-a390-4d28-94f7-55e6889fcb1b@intel.com>
Date: Wed, 5 Nov 2025 17:28:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/vf: Shadow buffer management for CCS
 read/write operations
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
References: <20251103152006.1954098-1-satyanarayana.k.v.p@intel.com>
 <20251103152006.1954098-3-satyanarayana.k.v.p@intel.com>
 <aQjnqFFctfRw6yP7@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <aQjnqFFctfRw6yP7@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0126.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::7) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|IA0PR11MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: a9f64110-2bc7-48db-46d6-08de1c62a600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWJRUGRreGJNdzRBZWdLQVBhaW80WmlJekV0QVRHcEt1NFVRWE1rWXIzUmhM?=
 =?utf-8?B?OTNIM1cvaWZHSFVBQVh0cUp2NWtvM2owNFVQd1Y2SndiUm5aOFQrMlpsYXM5?=
 =?utf-8?B?N0NXaEJLaEMyVUlnandyYjlHZ0JUNlRwaStJRU84azJ6dVdMRitScnNRVFlU?=
 =?utf-8?B?RkM5QWRRaXIrM01QQ2NvT2poVm9rempiRTNNb3pkQ2hhUjNhUUNoUkNaR3A1?=
 =?utf-8?B?eGpRSEhwMG5aUmViOWJuYlNrUWF1cDBPMUo0UFhaQUZEYm1DTXExanB0KzN6?=
 =?utf-8?B?ckVwOHNVUXQ0MnZId0lweHZ5RnlRMElkSDlHZjJCdGRyUGZhWlVueW94RXpi?=
 =?utf-8?B?OUpOV1pqNTRxcnNNK0tkMWljelhld0krTnJVWVFKbnBMYjhJc2RMSkpkQUdQ?=
 =?utf-8?B?Q0hiaGdTT1BhWDdyK0YvNE1zTC9zOXdDdDNxVmNIZHUxLzVBblZ1WENEWm1L?=
 =?utf-8?B?Mm10RHBFSlo2TUJTMUxIRmxhR3JpRCtPNCtXbCtMQms0S1NackJ1T1d0UWNa?=
 =?utf-8?B?bzVkZi8wTE90UzcvM0RvZXNUVDJVZGQ1K2hyT3RQTkJDcWp2UVRJUWtwVzlX?=
 =?utf-8?B?ZC9QaWFObTJ3YUNSRE1rYVo5eXl3TXh5Um9xMmdLOTRXY2ZGL0hsQjBwRXFD?=
 =?utf-8?B?QlBxdmZiL1pDWmZlLzdVNlcwa2JXR3B1amJQYVM0WjJuOEZTdFNDNHpuNHVX?=
 =?utf-8?B?eTJMblROSTVyc2M1Q0x4RkdtbVAxZmFpNW5MQmxOdTU1TXloMnFsOUpoU0VK?=
 =?utf-8?B?VTdsME1kYXBEZTBqM3BZL1dsL2xkSUJha0VyWk40L1d2ZmlMYmI4dE50NFZG?=
 =?utf-8?B?RnZMTDh4RVBIdk5uaVhra2ZFeTZ5TkFHaGhvbXluSU01T0Ywc2pJVnYyQXll?=
 =?utf-8?B?UTE5aW9BTUFsZFN0Q1hLN1VGZ0lhV3ltOG5pSlFuNFJTWE9YakpscTFxZ3ZE?=
 =?utf-8?B?QzVWejJUMC84Z3R0UCszZkFRUCtZK2JxNmhqcFVoL2V3Y0Z2RFlXeGtRZ2Mx?=
 =?utf-8?B?cC8za0ovcmZhcUNOdGFVOFN4OWYwNkZwRzZ6NmZ1YWRxZllTR1hSV2Q1aHpE?=
 =?utf-8?B?bkk2VkZyWWR5cEgyVVdTZ094OVZ0UWx2Ukh2RVUvd0xGcnRtSHlpSlVoM09k?=
 =?utf-8?B?Vlk1TFFDQk1KS1pHSFJNUmptd3FscTlxOHY5Nno2M2I5SVU2dEM3OUh4UWUw?=
 =?utf-8?B?RWxXS3BuUzhUSE9Vc29PRHF4NjJjOEV2d05ib05EdDU5VWFaQzBwVCsxQ01J?=
 =?utf-8?B?KzNzeEd0bnF1U3oxQzJOMDFncDhaQTFGZWY1OTVIcmhmMzdIcklRaG9FZVZL?=
 =?utf-8?B?TG5QYXBWRUMwSGlxcC9Qc0ltZzl0WWRaTnd5VnFRcTZ0aVg3MExzWms4VGt1?=
 =?utf-8?B?M3poVHdMNE92R056M2NFOTBVUkR4Y1dqZ3BDR3labElSZUdIVnJJRUVJTHpT?=
 =?utf-8?B?Q2xnV3BVMklRU2lJbjRacTdLY0JXOElaRkFCaHVHVzdxRHdEMFQxRHlCRXlk?=
 =?utf-8?B?aFl2MmNiUkRLckZKbjRGcmc3VmdKYWp4TExOL0JGSGFqbXRnRndnWXBiOVph?=
 =?utf-8?B?b09IZ1BqYk83L3B5UXhnVTBPc3BOLzNaWFZBd0llbXRzemZYenpqeHY2WnZx?=
 =?utf-8?B?VDE4Vmw1VGxMa1hqUTdkMFBtdkdjVm1CZzZXM1NVN3V4V0ZQbVhlSFlYZ0U1?=
 =?utf-8?B?WVB6SXQ0RVE3citHaEM0L0s5OUhUZVhNS1JQU0pySU1qaDdVR3JiUWNjTEJZ?=
 =?utf-8?B?QjdRcmVCUDFwTnpKZzRaSEpzaXpHVjQzdkVUQ3o0eEh6a0JCTlNVVG5yNUwx?=
 =?utf-8?B?RGZJREVMOGdRNVhVd0phZGhuSU5xdmxtbzk5WkFPZitZcjBKSDlRWkl0YmpJ?=
 =?utf-8?B?akM2TjZWblZGMm54UVNxd2w3c2RxR2pqS3lmdmxVa0hkcjNSVEhxSnFOb1Ex?=
 =?utf-8?Q?CFFwBRx/Mx5q4TkFjeWqhVuRhdQmZ9/m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG05SnJQREpzakYrQUMvb0NldWpSQ0g3eU0xaWdlZUtmaVZ6V2pDNjBWNG8y?=
 =?utf-8?B?a0s4cGthRDVRWXFNUGtRc1pKbXZLUGxuYzFRQmdGdkNIazFWQ3lYd3krZDQ1?=
 =?utf-8?B?YTZQR1dsdnR3S3pwQ3ZucWVFcFN3WDRFYlRzMS8wT0h4dTR5dEhDdG9JdkMy?=
 =?utf-8?B?ak43Mlpyc2RleXMxRE1INjZVOWdqbHNEVkJWa3hQeTJ4c0tVOURWZU5KeWlI?=
 =?utf-8?B?R1lubERZOWJmWEp4ZWExdE1CYjQ5T243MU5Ib1hsaytKcGpyU2M2NlYvWkNr?=
 =?utf-8?B?UldERytvdzhBYUdjYm1XTjRMU0M4Y1Jnakp1QktuSzNlaXNPa0pMbXFjWU1W?=
 =?utf-8?B?a2RUMUVRMXg0ZllWeXBZSnIwbnAzV0hHR1FIR3BlSG11eHJoeWQzb1dSRzhU?=
 =?utf-8?B?MUl1Y0R1QUttWm1aQmU2cTRjelZzUWY5R0EvL2RFaE13WUEwMEtuQm5nckhw?=
 =?utf-8?B?N29RZmhoTmZ3WENCOVVSc2xTQUE5RytPR1FVQnBISTFlTVVxWWJOUFpvUlY0?=
 =?utf-8?B?VkFSaURQQlRUTUxWRWcyVldBK1ZtUS9NZ3BCc2FHbXdtKzIxVEJsYXljSGJR?=
 =?utf-8?B?Qm9XRnI4ejhWNUtPVFU2cEhnRVkrOGtSYTRmc2NvZXJrQm1iT3FBUk5RRkxa?=
 =?utf-8?B?N1g2eWRFcS9rTTViR29vY29ROEdkS1BuNXFLeGc2dDZzN2JWQ2ZoSnlxT1RG?=
 =?utf-8?B?eWdpOXYzUXl0Sm93WXlLSkF0ODB4aWw0a2tvblhQVjl6aHBEUTAybk5zemJq?=
 =?utf-8?B?Vk5nVkxZOHNmVkNWOCs0b2oxdGZWMjN4bFkxOVhWWVdwbW9XYlN6RW9wNTli?=
 =?utf-8?B?R2JEaEJXMHVFVWlFV0lzSFE3Q2VHK2lIVDFoeGU1aTJkN2xoOENtbERsdjl2?=
 =?utf-8?B?TU9EMEw0aHI3R3crY2YxRGNGb0VQTCtIT09nZjkxM013K1RlMjc3bCtuWlRZ?=
 =?utf-8?B?ck9ETkFsTWsyTFA0ZHpIZ1NjUmZYN1FHSzhCZUYvb291b2JmZWkzRmdDS2h3?=
 =?utf-8?B?RFVSQWRxTzE4LzU2OVptWUpaZ3NROHNmQmdrUTNqSGtpbzRKNStDUFhTUkdt?=
 =?utf-8?B?NnI5T0lENGZnOXl1QzhBMWxWczBOUnpsUUx2WVpXdW5samRsNWRPcWdwN1Mw?=
 =?utf-8?B?QldRVUZoRzduejF6c21ZNUpuUWZTb3BtTFc4dERzOEZwYnBXYkZ5eE1Gazhw?=
 =?utf-8?B?NDNVaTM0Z3ZENTZPZWhGdjNhK1NZakJrWDVzTUZGblV0QUtHamFuR3VWMDla?=
 =?utf-8?B?cGVFbU1GM1R2aWsyRWJNb3dZdzZZQmZieEVKYlExbTdxV2wxeFg0OHRpRHlu?=
 =?utf-8?B?anlFdUQyb3ZIa285M040eTBDRUZPczN5LzBweU9KODhOUitKMnB4WHIxdkpp?=
 =?utf-8?B?ejFRYTBubzlJQmNHVzBtYjlkdUVmbXFkL2V6Qm5qbFhrREUxSjZPNGlUM3JX?=
 =?utf-8?B?OTFuUmtqUk9NcWVxS296Q3dndTNsSHk2cnVPbXNFOVNFVVdsTlVlb1NjcTJH?=
 =?utf-8?B?eVFnNzExc1o5VHF3SWFyNktxejMzdk4vcXZ0alpBMVBkS0czZlFXcWJ3R0J6?=
 =?utf-8?B?NExpdEV6YzN2dVkvUVBNeTdnT1ZEbm85YUdXa0lzbUU3NUdsV3VubFNucVdy?=
 =?utf-8?B?ZzFORHllR2EvSTNYMXh0QUFLYUo3R21HWGc5bFBZQ0tWS1BvMVM5aFpsTWkz?=
 =?utf-8?B?QkNEbXNGQnlSa1hFSWIxMTB4RVF6aS8vS1RZYlZYemt3a1NKUElRVlptWTNq?=
 =?utf-8?B?anoyM0txdjVNTXgvWllxeUwrQzJxaHVjVXVNdmpONXVkOXc3Ym5UNlBtWUR0?=
 =?utf-8?B?NDZkcU9jODhsRFFnL3M5QWR1bFFjUVFyR2dRZVdRa0tIeEd6UGE0QzlTMkl1?=
 =?utf-8?B?TkhiTFpzU0tCdEZvTHQrdFNwam5oWXJqdlhVcXRBMUFBMVhCUVF5L2FxYkhF?=
 =?utf-8?B?Q3BaM29ZcnM3OGRuSm9PYzRvSERwRTZ4RGhJd1c0MlYrak1OalFXODloV3Rw?=
 =?utf-8?B?OGcydy9ralZBSVNSdkM0cG9pNEV1Z1o1VDVrMm53YVFGaDdWZHNLb1dVb2hr?=
 =?utf-8?B?RlN0WjZOWWFnYkVqUVZQZEVGTmIwcjk4OG5YS2V5dTl6RDk5TzByMy9vaWoy?=
 =?utf-8?B?WTRmOXVBZEdudklkTVBZRElQN1dXMjg1ck1IQVZ5UmkwNkh5L21FM0ZCK2Ri?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f64110-2bc7-48db-46d6-08de1c62a600
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 11:58:35.5421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajsNCp9RK81nkmhmu/lVl8ftMoFFBzZ1Qb/LWgL8QJGag+OpfAP0JQaIcVB0gnzdbZrHmgi46WUSlgPFSWk/r1f1Z6G8/S2saAxdWGQytVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7741
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



On 03-11-2025 23:04, Matthew Brost wrote:
> On Mon, Nov 03, 2025 at 03:20:06PM +0000, Satyanarayana K V P wrote:
>> CCS copy command consist of 5-dword sequence. If vCPU halts during
>> save/restore operations while these sequences are being programmed,
>> incomplete writes can cause page faults during IGPU CCS metadata saving.
>>
>> Use shadow buffer management to prevent partial write issues during CCS
>> operations.
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c      | 59 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_migrate.h      |  3 ++
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 17 ++++++--
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
>>   4 files changed, 76 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index dbe9320863ab..4c4e4cc369d5 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -34,6 +34,7 @@
>>   #include "xe_res_cursor.h"
>>   #include "xe_sa.h"
>>   #include "xe_sched_job.h"
>> +#include "xe_sriov_vf_ccs.h"
>>   #include "xe_sync.h"
>>   #include "xe_trace_bo.h"
>>   #include "xe_validation.h"
>> @@ -1103,12 +1104,16 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>   	u32 batch_size, batch_size_allocated;
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	struct xe_res_cursor src_it, ccs_it;
>> +	struct xe_sriov_vf_ccs_ctx *ctx;
>> +	struct xe_sa_manager *bb_pool;
>>   	u64 size = xe_bo_size(src_bo);
>>   	struct xe_bb *bb = NULL;
>>   	u64 src_L0, src_L0_ofs;
>>   	u32 src_L0_pt;
>>   	int err;
>>   
>> +	ctx = &xe->sriov.vf.ccs.contexts[read_write];
>> +
>>   	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
>>   
>>   	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
>> @@ -1141,6 +1146,10 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>   		size -= src_L0;
>>   	}
>>   
>> +	bb_pool = ctx->mem.ccs_bb_pool;
>> +	xe_sa_bo_swap_guard_lock(bb_pool);
>> +	xe_sa_bo_swap_shadow(bb_pool);
>> +
>>   	bb = xe_bb_ccs_new(gt, batch_size, read_write);
>>   	if (IS_ERR(bb)) {
>>   		drm_err(&xe->drm, "BB allocation failed.\n");
>> @@ -1194,12 +1203,62 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>   	xe_assert(xe, (batch_size_allocated == bb->len));
>>   	src_bo->bb_ccs[read_write] = bb;
>>   
>> +	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
>> +	xe_sa_bo_sync_shadow(bb->bo);
>> +	xe_sa_bo_swap_guard_unlock(bb_pool);
>> +
>>   	return 0;
>>   
>>   err_ret:
>> +	xe_sa_bo_swap_guard_unlock(bb_pool);
>>   	return err;
>>   }
>>   
>> +/**
>> + * xe_migrate_ccs_rw_copy_clear() - Clear the CCS read/write batch buffer
>> + * content.
>> + * @src_bo: The buffer object @src is currently bound to.
>> + * @read_write : Creates BB commands for CCS read/write.
>> + *
>> + * Directly clearing the BB lacks atomicity and can lead to undefined
>> + * behavior if the vCPU is halted mid-operation during the clearing
>> + * process. To avoid this issue, we use a shadow buffer object approach.
>> + *
>> + * First swap the SA BO address with the shadow BO, perform the clearing
>> + * operation on the BB, update the shadow BO in the ring buffer, then
>> + * sync the shadow and the actual buffer to maintain consistency.
>> + *
>> + * Returns: None.
>> + */
>> +void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
>> +				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
>> +{
>> +	struct xe_bb *bb = src_bo->bb_ccs[read_write];
>> +	struct xe_device *xe = xe_bo_device(src_bo);
>> +	struct xe_sriov_vf_ccs_ctx *ctx;
>> +	struct xe_sa_manager *bb_pool;
>> +	u32 *cs;
>> +
>> +	xe_assert(xe, IS_SRIOV_VF(xe));
>> +
>> +	ctx = &xe->sriov.vf.ccs.contexts[read_write];
>> +	bb_pool = ctx->mem.ccs_bb_pool;
>> +
>> +	xe_sa_bo_swap_guard_lock(bb_pool);
>> +	xe_sa_bo_swap_shadow(bb_pool);
>> +
>> +	cs = xe_sa_bo_cpu_addr(bb->bo);
>> +	memset(cs, MI_NOOP, bb->len * sizeof(u32));
>> +	xe_device_wmb(xe);
> 
> I think xe_device_wmb() should be built in xe_sriov_vf_ccs_rw_update_bb_addr.
> 
> For safety, I'd include xe_device_wmb before / after xe_map_wr in that function.
> 
> Otherwise LGTM.
> 
Updated in the new revision.> Matt
> 
>> +	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
>> +
>> +	xe_sa_bo_sync_shadow(bb->bo);
>> +	xe_sa_bo_swap_guard_unlock(bb_pool);
>> +
>> +	xe_bb_free(bb, NULL);
>> +	src_bo->bb_ccs[read_write] = NULL;
>> +}
>> +
>>   /**
>>    * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
>>    * @migrate: Migrate context.
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
>> index d7bcc6ad8464..db66b2ea31a5 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.h
>> +++ b/drivers/gpu/drm/xe/xe_migrate.h
>> @@ -134,6 +134,9 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>   			   struct xe_bo *src_bo,
>>   			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
>>   
>> +void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
>> +				  enum xe_sriov_vf_ccs_rw_ctxs read_write);
>> +
>>   struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
>>   struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
>>   struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> index 9959d619addc..35769fb9225c 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> @@ -150,7 +150,8 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>>   	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
>>   		      ctx->ctx_id ? "Restore" : "Save", bb_pool_size / SZ_1M);
>>   
>> -	sa_manager = xe_sa_bo_manager_init(tile, bb_pool_size, SZ_16);
>> +	sa_manager = __xe_sa_bo_manager_init(tile, bb_pool_size, SZ_4K, SZ_16,
>> +					     XE_SA_BO_MANAGER_FLAG_SHADOW);
>>   
>>   	if (IS_ERR(sa_manager)) {
>>   		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
>> @@ -384,6 +385,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>>   	return err;
>>   }
>>   
>> +#define XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET	(2 * sizeof(u32))
>> +void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
>> +{
>> +	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
>> +	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
>> +	struct xe_device *xe = gt_to_xe(ctx->mig_q->gt);
>> +
>> +	xe_map_wr(xe, &lrc->bo->vmap, XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET, u32, addr);
>> +}
>> +
>>   /**
>>    * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
>>    * @bo: the &buffer object to which batch buffer commands will be added.
>> @@ -444,9 +455,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>>   		if (!bb)
>>   			continue;
>>   
>> -		memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
>> -		xe_bb_free(bb, NULL);
>> -		bo->bb_ccs[ctx_id] = NULL;
>> +		xe_migrate_ccs_rw_copy_clear(bo, ctx_id);
>>   	}
>>   	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>> index f8ca6efce9ee..00e58b36c510 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>> @@ -20,6 +20,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>>   int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
>>   void xe_sriov_vf_ccs_rebase(struct xe_device *xe);
>>   void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p);
>> +void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx);
>>   
>>   static inline bool xe_sriov_vf_ccs_ready(struct xe_device *xe)
>>   {
>> -- 
>> 2.43.0
>>

