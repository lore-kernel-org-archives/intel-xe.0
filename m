Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63686CAC5B9
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 00:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229B810E038;
	Tue, 30 Sep 2025 00:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYepsSR0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F24E10E038
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 00:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759192946; x=1790728946;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=o7CK7duFEwxZgIuQMrXJXSsQ4nNxSgxmb6GH4nrmYH8=;
 b=AYepsSR04WUQY/y8YeuLXYdj67ju+PUIKAs8Llmnv8EXHb/pKLVi6dGJ
 5c5IYSclgCAQ5dli1Q6w1/nyr53yu8gIgiE6bhV+/ynGQmnQRkMYGmgtP
 a+HGpxHaEEoUmfJs9btjbklLap4pggTdzjB9HhHv19xc5OR/GAEpvgD+R
 XeHbuGdyVjN8rMuK1ZH6E+K9DCAIoNbAaMekAvsiXnvV2/EOW2yh4ZWco
 1Y6ooaUQaSphIH2v5pW0grYrnbV7GT/Y7YMsx9ybeSky3OOBYumeE/F8G
 XehSaCwfv0p2Ttk3iI9RzDHVl5CtBiDTOJd2UAOLqRSFMZSgxe6OODq9x Q==;
X-CSE-ConnectionGUID: DcTJszQ2RhuPwyn1UhJQwQ==
X-CSE-MsgGUID: VWejNZ7USzeD1uIZ7M3Zjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61486207"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208,217";a="61486207"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 17:42:26 -0700
X-CSE-ConnectionGUID: 2BFFhPLeRpKvzQyzQrY6Vw==
X-CSE-MsgGUID: wAnrFFm7Td68JpHSukz1Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; 
 d="scan'208,217";a="182783977"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 17:42:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 17:42:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 17:42:25 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 17:42:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxHrGp1+YtmHb20LBUugAIdudljMP9FJC42gRGnMBYJp0voExFZPRS1WKMsIgwicRHHW5qf2IjkVLv8xCZFg9Wngd5NlAY5EiYbHpBEESsNrinnaBw2gfYzP44jgcbnfVk2DoidOCxovE4NjVQ1uIr6/xBu7yhDvh8+99qAD4IfSdX0DccJjboD9QV6YoQ1n8kJgSjNW2UR62i/uLMB6bEcKYaN2OLPxD2Kli2/2cojyiomGh9nXm0P12CWRbl415V1WCdEINjIBjC1/qo5Jy+egxGRpCastAhIIky4ru4wj7ZhhQ1eTOcUdv2TRG1BB3L2TL19ax0qxOxvz7BAhaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i55FXR5nVYp5TnKBJJZaQCrNJ6OK3935QduylxLHP6E=;
 b=SlYqNRGOeqOUYmEGanEQwgu3iG78polHuKPbGwUB2bszXAKQ7kUmwjjLXrDSs2azxnye7OrsHrrr8nDnAH5hMK85ySATVhb3XTxhyQZNeNfDOpQCUPrLfVHWjVCfhSoVkAvkfb7xTtKGisnzPmIv2a6HcWpP2wnzVwVAxHP68j8N1grH2BQFzVEKuewk21rjigVAJ+EQ8YMjFFJaL2XTV0rK5OCTAzTnIPzS4gAIdNsDdcs7h9ZyeL6O8Vbavd4WoJsQlR0usK/Ib+uYP9Yk4pj07jqeoT9g1/q7RxTqr46x87Ye7ThhjBCdJBfWjPX1oVuDQeqbqYbF5Wk675HLaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SJ0PR11MB5772.namprd11.prod.outlook.com (2603:10b6:a03:422::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Tue, 30 Sep
 2025 00:42:17 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Tue, 30 Sep 2025
 00:42:17 +0000
Content-Type: multipart/alternative;
 boundary="------------EPqEFH0p0zxruDHhaCREuYQD"
Message-ID: <dd0e8950-4111-483f-869c-ba65fb4f0aa7@intel.com>
Date: Tue, 30 Sep 2025 02:42:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/34] drm/xe/vf: Lock querying GGTT config during
 driver init
To: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-2-matthew.brost@intel.com>
 <95e75ae6-0d2e-4dc9-bea2-daaaf94150c1@intel.com>
 <aNRTM4ahMFul34Xr@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <aNRTM4ahMFul34Xr@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: VI1PR04CA0099.eurprd04.prod.outlook.com
 (2603:10a6:803:64::34) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SJ0PR11MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f041b0-23b6-47e5-1761-08ddffba34b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3BnV0FuTHJad2JaVk1taXNaQVQ4a20ydkxGR0FEWXR6RjQyL1hla1dEZnBG?=
 =?utf-8?B?cm1nL2t1Q3VnNHc1VjQ2d3FXSElYQlBpdXJiSW14ZzVlRkFJN0g0RW10dGlE?=
 =?utf-8?B?b2k2bDlySTFpTWhLRFFCeDF3SnFvU21oY0toZFRmZm5OVytVWTdhNCtITGZH?=
 =?utf-8?B?MHBYSlEwM1ZRcjRKdmRFdHNFZ25KcHJ4cVRQa0FaYmM3VzFkQ2dvbUZ4anFS?=
 =?utf-8?B?MkJRTkFlWUVxNEJwT1NqdytLKytzYlNPL1pzdFNxOU5FY1M3UDU1dVJ6bHg1?=
 =?utf-8?B?SXBocnZDZ0V6bzlQUXJzc2dIcnBwWGZrYVdoTWN1bGVtN01DQ0hqb1k2a1Zw?=
 =?utf-8?B?dExqc09STWo5ak14ZzRPaDYzYzBzMHMyWkUxNmZQbE5iZ3VFdU9MdVNsUEh1?=
 =?utf-8?B?b0JyMno1M0h3cWw0Tnkva0pUTnBGOTFvVmIrZk1iVTVNR1EyV0FqWXBvV3pk?=
 =?utf-8?B?WHNtOGpRNjJMeFF4eUZSK0RlOVBmekZiRTB5NDVVT2QzWWxkSXdiNXhTWDBS?=
 =?utf-8?B?eGFrS3psUWJqMGhSMVBmc0pySlZ3UEpBbFAvd2MrOWo0Vkt6Ukg5dVBaTlNk?=
 =?utf-8?B?NUhMZ09FZkNHREJzWm1sdzN3YTBuWjhqU0dMZFlsRWRuaEJYVTFIb0ZLTlh5?=
 =?utf-8?B?SlVDTS90WGhhK3diMXkzWE14VWdqekJsS0JKa01EenI1UEJXeFZOdFhYWXRl?=
 =?utf-8?B?M0RaRVdxTkRqN2dMYmpLSlNyNEZtaThxcldJMzJhQk0vL25JbjlQNFdsQ2li?=
 =?utf-8?B?TkZlN1NFWkc5NnZ6bzlwSm1WZFV4OE9zZmhQcWlHcmJ1V01SR2NDQ0JYbTh0?=
 =?utf-8?B?WTZhRnNOUjFYbzRJWGxFRndVclh0UFFLYThYN0l6Vm5hMmFRUXNLbDdaNU9G?=
 =?utf-8?B?WVhVbG5kVzgra1NXN1ZVdlVyaXhscUJ6a2JQR3VwVi9mdm1uOGJJVGZkNDlC?=
 =?utf-8?B?clJZK3ZsWHUwYU84MXg5U1NsQ2JUSXVwaFp6REtwNEVGRys2QXUyUFN3ZWtt?=
 =?utf-8?B?QWVnY2NyVCtmSTgxRWJwNFRIRnVRMlo0YWhOTmZXR1NHTDcyR0VmN0lEQXBk?=
 =?utf-8?B?ZU91R2x3Q1VGbDdXTVo0WlhpYVJCNk02eSsvS3NHMEpUVm5nMUM1ak1kWDRS?=
 =?utf-8?B?THBMaVFkclFhbDBQSE81Z2VPa25uUXU1bjVOd1l5T1lJeElDQTRHUUhBM2hv?=
 =?utf-8?B?VmpMRTdyUGRJc2UxUll1R2NBVmdNYWFWaDNtS0tqOFpES0E0bFgzZG1xUW12?=
 =?utf-8?B?ZFFVTjNuSmFQaU02MFBaUlVjaFA0ZFVzSUsySU03R096YS9UOFdtVndoMitL?=
 =?utf-8?B?QkFEamFHeTNWQzVGbDE0OGgwTktkcVEweUxKL2ZlN1NPQ2E2bEo1KzF2N3d4?=
 =?utf-8?B?Y0VRSmhUSjI3V1dVa0FpU2ZqK3NVeUtSNmp3VkQ4WUhqeHlZbXhSM2Nxa1BO?=
 =?utf-8?B?NXcyTzF5K1lhU2xtUUNKU2F3Y2M4NjA3Q2lCcUVnT0k0K2N4VFliVFl5TmxL?=
 =?utf-8?B?aHpIeUgwbVNVbmxrVk1HejFxcG5INCt0S3Ixa2s1SkpMK1I3b3NKTFhZR1Ix?=
 =?utf-8?B?c0NjT0FIL0J3NGgvcndwa2pIRXBRS2swSjV2MEpPMXJFOC94UWpaSFpTM2xQ?=
 =?utf-8?B?VGlqcnZBdWcyM0g3K0FxUCs0OVVGM1RWMmZ5UlZqNGtuYmtOYzkzejNyQ3Vu?=
 =?utf-8?B?ZVQzaFBrM0lPT0VUVGxPNUpMODgrZGM5T2hOcFVENDVta0pKdVZsb1M0NVdU?=
 =?utf-8?B?bkNnUnYxLzVWeGhnbVZXRFdTODBRM3I5WVRCSDRVVFhodUVXdTlRVUROcGRk?=
 =?utf-8?B?YzRpTjRubWk3VXZidmo2RGMyVmx3OGZvTWhsdUVQUHhvdzJBb2VadTJSUGRM?=
 =?utf-8?B?NGxpeEFrMzFuYlFhMVgwQlNaRm54L1ViVW9uNWRPNWxEeGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3ZwSkFtQ1dqZ1VmczErRml2ang0cGlaTDNaMURBWGNZZXFiOXB3NGU5Vk5Y?=
 =?utf-8?B?K0U5VDZIOVVJVWE3R0tkNmZ4YjRRSWlpSHhGeFBITDBBM0FIbTlFRFA5bmtz?=
 =?utf-8?B?UHVHdGdGVldldEwwNEhNT0JmYmY0RjVFMEZ0NzQxUDBHQm1wcnkwVGEyMWcr?=
 =?utf-8?B?NExvYVpGRjdRbnI2ZDV5NXNaMlY2aEY4UEMwcWRFM3cySmxZSDZVRzN2ZkRK?=
 =?utf-8?B?Y2tudEd1U01pTkE4Wk16T2ZzWjNNSFZNdktVWmxURENWbjM0cVRKUXJuUXVx?=
 =?utf-8?B?SzJUcGhyb0orODQzUG11Wmg0eEVGRzFoNkRWeHJMdVZkd0dOMk4vb2FkSE0w?=
 =?utf-8?B?UGxMb3pucUJIdFlHRnFMSXVBQ0NscEJFTWV0SDN0UDU4VG1QMUZERHhLcmFv?=
 =?utf-8?B?bEw1dmNRRW9wdkNFbm4vbXZoaUpYcGJKQ3JoUkFnZTdXUjBjOENVUEZEaE84?=
 =?utf-8?B?ZkFFS2t5UVliV3JaNEw3dEFDS3p5VjgxY0FMdThueS9YYmpKbmZnaGhLOTlw?=
 =?utf-8?B?b0NzazJxQVVvSFpjemhtL1JLQkxmYmVMS2RHRFpkc0Nvb2pLZDJlSmozQnJ5?=
 =?utf-8?B?VmpkcVgydDZHLzduVWQ3RE8yNDQwTEFTNWdDMUdCVjVuVjgxNzh3L2dwZy9S?=
 =?utf-8?B?RmtFWEdnNUF5V3VoRnpMQkZvMCtyWVRLN0lncjdRY1c3Tyt4Qzd0dlBoU0N0?=
 =?utf-8?B?bkgyYnVlSjZVUUN5ME5aQVpiempJTVpHa3d6b3p3Z3ZxT2hkT0JNUFRMcjFF?=
 =?utf-8?B?VlNQdWdMNnVWZFkwVW9hU1ZMM05NRm9QMGMzSjRhMENDL3hzWE92Vzhqbit3?=
 =?utf-8?B?UEVuY1EyalJXSU15azE0RFVMaURLbXMyZkFpZThmY2h1amFoYkM1anI1VWRB?=
 =?utf-8?B?QkFzOFpqT3Y3R3RSMU9GQ0RwR0xhVkdMYmxNbk14SC9rbitydWhFRTF0aVJv?=
 =?utf-8?B?aitGM2FQbDRkQXNmMDFQWUhqMndlUFZPL3VmekZEVjQ1V2pmdktPR05hT1gr?=
 =?utf-8?B?R3BSWURXL3oyY2ZhaHRsMGRlc0czMndGWm5NMDI3a3R6aWRlM3ZlYUxkQ01t?=
 =?utf-8?B?eGdzRjExVXlSOFMyK3paZnBpUXRQYUtUZHN0bjBoRC9NVmRIY2txVmRUR3Ix?=
 =?utf-8?B?ZHNMUVhscjBVM3hsMFpRTFAzWXlpQ21OcXpVdjJEditRQis3T0kwRU9yQXdl?=
 =?utf-8?B?YXdWVUQ0VTRXUVJJZzIwdVpiRkVMWDYxYVd0UzJsbnl6VUFVM3FBSnlvQSsr?=
 =?utf-8?B?cDVYMTR3SW1EbHNnSkN1cXQ2UENLaWtnaDFYK1Zidll0M3Z1TnlCQWQ0aWpP?=
 =?utf-8?B?QUthU2ZtUEpHRWoxOFp0V2Q2Mnc2RmU4SjNPSmJzbm9DRjFuNEpIVU1GelhQ?=
 =?utf-8?B?Sm1QaERDRDd3M3ZYNG05alh5cnF4WERLMWxpQVhTZm16aE93MVNhRCtsQVJn?=
 =?utf-8?B?WkZxT3E3RVZxM3NFN3BXdFNLekNsN0FMRXVZYnBuNVlZVVZkOUxPWE8raXRR?=
 =?utf-8?B?SUV4eU5WYjZFcDUzRE05WVBqeWN6Y3BVNWtEZDhmNUlSUDJzTkhrWVBmWDlr?=
 =?utf-8?B?R01SRW5OZVhVenBFUkNrM3BmSFZuZTZoQStNU0piQUhSSzZzWXQwY1pPWVJS?=
 =?utf-8?B?S3Rrd2w4U28wKytXYk8zSzh4YUFhbXNtUXMxRm5neWlDWk9tU2ZzOXZBK3FN?=
 =?utf-8?B?UzhLQ2lnWnFrMGpBL1YxMUdaK0xSRkRSYmlSc2lqajkrUWVYUVpqTlo0R1hk?=
 =?utf-8?B?T3F5a3NYQjl3bFV2MlVJNzdRQ09TOVdCTXJHWlBaWmF1Q1ArRFV0dlM0WUh3?=
 =?utf-8?B?Q3RhM0hTcW4yU0FhU1hpREs0VUdwbFhybG9rVGIrZjJSVWlSWVVJaUkyUXVt?=
 =?utf-8?B?NXdSaWlmYzBuNDQwWXVrSFQrdUw1eXpKRHkySzBPaFVXaVNpUW16azdoQUVk?=
 =?utf-8?B?YmNtdEdCMWRoYzdMOFZFRUwrSnhPMGRDQThhc3h6RllrMXhhVkhwQ2UyUk5T?=
 =?utf-8?B?TzRxck5WQXlSY3lRYUJNS3Zsc0VEOU9CUzBhc0ZIK2tvdmgzMStqTGFRUVlp?=
 =?utf-8?B?QXd0aXpzSWxZd2VGTWlXZk9XVkF0Zkcwb0wvMk1ieXlFT1Q0c0pvVTgvZWto?=
 =?utf-8?Q?QnHe7yT6Vt/CXU5dSOeJdk7E0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f041b0-23b6-47e5-1761-08ddffba34b0
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 00:42:17.1821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iF/Q0/3Uyo7tAfaAsn9mjuwofon9dL72CgbDnQcoMBvw6ni+MRfuXlvh5Up+Awo9FhzKEcfBlDkWAvg8o6WHTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5772
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

--------------EPqEFH0p0zxruDHhaCREuYQD
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 9/24/2025 10:23 PM, Matthew Brost wrote:
> On Wed, Sep 24, 2025 at 11:29:22AM +0200, Michal Wajdeczko wrote:
>>
> I'll let Tomasz respond to most of the commennts as it is his patch but
> replying to last comment.

ok, will answer.

>> On 9/24/2025 3:15 AM, Matthew Brost wrote:
>>> From: Tomasz Lis<tomasz.lis@intel.com>
>>>
>>> Protect access to GGTT config as this is non-static information.
>>>
>>> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
>>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 96 ++++++++++++++++++-----
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  3 +
>>>   drivers/gpu/drm/xe/xe_sriov_vf.c          |  6 ++
>>>   3 files changed, 84 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> index 0461d5513487..016c867e5e2b 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> @@ -440,18 +440,21 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>>   
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   
>>> +	down_write(&config->lock);
>> do we need to protect also VF2GUC communication ..
>>
>>> +
>>>   	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>>>   	if (unlikely(err))
>>> -		return err;
>>> +		goto out;
>>>   
>>>   	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
>>>   	if (unlikely(err))
>>> -		return err;
>>> +		goto out;
>>>   
>> .. or just RW access to the data itself from here?

The protection must start before we receive GGTT start. It would make 
little sense to protect just manipulation of data which we've already 
received.

The post-migration recovery must have a clear state: either we got the 
GGTT already, or not. It cannot have a state "it's not written 
everywhere yet, but GuC may have sent it already, who knows".

The GGTT address must be protected from before the moment GuC reads it 
in order to write to VF G2H CTB.

>>
>>>   	if (config->ggtt_size && config->ggtt_size != size) {
>>>   		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
>>>   				size / SZ_1K, config->ggtt_size / SZ_1K);
>>> -		return -EREMCHG;
>>> +		err = -EREMCHG;
>>> +		goto out;
>>>   	}
>>>   
>>>   	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>>> @@ -460,8 +463,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>>   	config->ggtt_shift = start - (s64)config->ggtt_base;
>>>   	config->ggtt_base = start;
>>>   	config->ggtt_size = size;
>>> +	err = config->ggtt_size ? 0 : -ENODATA;
>>>   
>>> -	return config->ggtt_size ? 0 : -ENODATA;
>>> +out:
>>> +	up_write(&config->lock);
>>> +	return err;
>>>   }
>>>   
>>>   static int vf_get_lmem_info(struct xe_gt *gt)
>>> @@ -474,22 +480,28 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>>>   
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   
>>> +	down_write(&config->lock);
>>> +
>>>   	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
>>>   	if (unlikely(err))
>>> -		return err;
>>> +		goto out;
>>>   
>>>   	if (config->lmem_size && config->lmem_size != size) {
>>>   		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
>>>   				size / SZ_1M, config->lmem_size / SZ_1M);
>>> -		return -EREMCHG;
>>> +		err = -EREMCHG;
>>> +		goto out;
>>>   	}
>>>   
>>>   	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
>>>   	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
>>>   
>>>   	config->lmem_size = size;
>>> +	err = config->lmem_size ? 0 : -ENODATA;
>>>   
>>> -	return config->lmem_size ? 0 : -ENODATA;
>>> +out:
>>> +	up_write(&config->lock);
>>> +	return err;
>>>   }
>>>   
>>>   static int vf_get_submission_cfg(struct xe_gt *gt)
>>> @@ -501,23 +513,27 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>>>   
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   
>>> +	down_write(&config->lock);
>>> +
>>>   	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
>>>   	if (unlikely(err))
>>> -		return err;
>>> +		goto out;
>>>   
>>>   	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
>>>   	if (unlikely(err))
>>> -		return err;
>>> +		goto out;
>>>   
>>>   	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
>>>   		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
>>>   				num_ctxs, config->num_ctxs);
>>> -		return -EREMCHG;
>>> +		err = -EREMCHG;
>>> +		goto out;
>>>   	}
>>>   	if (config->num_dbs && config->num_dbs != num_dbs) {
>>>   		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
>>>   				num_dbs, config->num_dbs);
>>> -		return -EREMCHG;
>>> +		err = -EREMCHG;
>>> +		goto out;
>>>   	}
>>>   
>>>   	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
>>> @@ -525,7 +541,11 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>>>   	config->num_ctxs = num_ctxs;
>>>   	config->num_dbs = num_dbs;
>>>   
>>> -	return config->num_ctxs ? 0 : -ENODATA;
>>> +	err = config->num_ctxs ? 0 : -ENODATA;
>>> +
>>> +out:
>>> +	up_write(&config->lock);
>>> +	return err;
>>>   }
>>>   
>>>   static void vf_cache_gmdid(struct xe_gt *gt)
>>> @@ -579,11 +599,18 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>>    */
>>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>>   {
>>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>> +	u16 val;
>>> +
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>> -	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
>> the purpose of this assert was to make sure no part of the VF driver
>> is trying to get num_ctxs before we finish querying it from the GuC ..

We now know this will never happen _before_we_finish_querying_, as 
there's a lock. Read side will wait for the write side to finish.

So unless you're worried about a situation before we _start_ querying, 
it's ok to even remove it completely.

>>
>>>   
>>> -	return gt->sriov.vf.self_config.num_ctxs;
>>> +	down_read(&config->lock);
>>> +	xe_gt_assert(gt, config->num_ctxs);
>> .. instead of moving this assert in the middle of the lock ..
>>
>>> +	val = config->num_ctxs;
>>> +	up_read(&config->lock);
>>> +
>> .. for code clarity you can add assert here as:
>>
>> 	xe_gt_assert(gt, val);
sure, can do that.
>>> +	return val;
>>>   }
>>>   
>>>   /**
>>> @@ -596,11 +623,18 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>>    */
>>>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>>>   {
>>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>> +	u64 val;
>>> +
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>> -	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
>> ditto

ack, though whether this stays at all, depends on further discussion in 
v3 of this series.

-Tomasz

>>
>>>   
>>> -	return gt->sriov.vf.self_config.lmem_size;
>>> +	down_read(&config->lock);
>>> +	xe_gt_assert(gt, config->lmem_size);
>>> +	val = config->lmem_size;
>>> +	up_read(&config->lock);
>>> +
>>> +	return val;
>>>   }
>>>   
>>>   /**
>>> @@ -613,11 +647,17 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>>>    */
>>>   u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
>>>   {
>>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>> +	u64 val;
>>> +
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>> -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
>>>   
>>> -	return gt->sriov.vf.self_config.ggtt_size;
>>> +	down_read(&config->lock);
>>> +	val = config->ggtt_size;
>>> +	up_read(&config->lock);
>>> +
>>> +	return val;
>>>   }
>>>   
>>>   /**
>>> @@ -630,11 +670,18 @@ u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
>>>    */
>>>   u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
>>>   {
>>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>> +	u64 val;
>>> +
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>> -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
>>>   
>>> -	return gt->sriov.vf.self_config.ggtt_base;
>>> +	down_read(&config->lock);
>>> +	xe_gt_assert(gt, config->ggtt_size);
>>> +	val = config->ggtt_base;
>>> +	up_read(&config->lock);
>>> +
>>> +	return val;
>>>   }
>>>   
>>>   /**
>>> @@ -648,11 +695,16 @@ u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
>>>   s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
>>>   {
>>>   	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>> +	s64 val;
>>>   
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>>>   
>>> -	return config->ggtt_shift;
>>> +	down_read(&config->lock);
>>> +	val = config->ggtt_shift;
>>> +	up_read(&config->lock);
>>> +
>>> +	return val;
>>>   }
>>>   
>>>   static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>>> @@ -1044,6 +1096,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>>>   
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   
>>> +	down_read(&config->lock);
>>>   	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
>>>   		   config->ggtt_base,
>>>   		   config->ggtt_base + config->ggtt_size - 1);
>>> @@ -1060,6 +1113,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>>>   
>>>   	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
>>>   	drm_printf(p, "GuC doorbells:\t%u\n", config->num_dbs);
>>> +	up_read(&config->lock);
>>>   }
>>>   
>>>   /**
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> index 298dedf4b009..d95857bd789b 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> @@ -6,6 +6,7 @@
>>>   #ifndef _XE_GT_SRIOV_VF_TYPES_H_
>>>   #define _XE_GT_SRIOV_VF_TYPES_H_
>>>   
>>> +#include <linux/rwsem.h>
>>>   #include <linux/types.h>
>>>   #include "xe_uc_fw_types.h"
>>>   
>>> @@ -25,6 +26,8 @@ struct xe_gt_sriov_vf_selfconfig {
>>>   	u16 num_ctxs;
>>>   	/** @num_dbs: assigned number of GuC doorbells IDs. */
>>>   	u16 num_dbs;
>>> +	/** @lock: lock for protecting access to all selfconfig fields. */
>>> +	struct rw_semaphore lock;
>>>   };
>>>   
>>>   /**
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>> index cdd9f8e78b2a..d6e2ed9b9bbc 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>> @@ -197,6 +197,12 @@ static void vf_migration_init_early(struct xe_device *xe)
>>>    */
>>>   void xe_sriov_vf_init_early(struct xe_device *xe)
>>>   {
>>> +	struct xe_gt *gt;
>>> +	unsigned int id;
>>> +
>>> +	for_each_gt(gt, xe, id)
>>> +		init_rwsem(&gt->sriov.vf.self_config.lock);
>> this is a wrong place - VF's per-GT data shall be initialized in
>> the per-GT code somewhere in xe_gt_sriov_vf.c
>>
> Yes, it is moved to the proper place in [1].
>
> Matt
>
> [1]https://patchwork.freedesktop.org/patch/676383/?series=154627&rev=2
>
>>> +
>>>   	vf_migration_init_early(xe);
>>>   }
>>>   
--------------EPqEFH0p0zxruDHhaCREuYQD
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/24/2025 10:23 PM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aNRTM4ahMFul34Xr@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">On Wed, Sep 24, 2025 at 11:29:22AM +0200, Michal Wajdeczko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'll let Tomasz respond to most of the commennts as it is his patch but
replying to last comment.</pre>
    </blockquote>
    <p>ok, will answer.</p>
    <blockquote type="cite" cite="mid:aNRTM4ahMFul34Xr@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 9/24/2025 3:15 AM, Matthew Brost wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">From: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>

Protect access to GGTT config as this is non-static information.

Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 96 ++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  3 +
 drivers/gpu/drm/xe/xe_sriov_vf.c          |  6 ++
 3 files changed, 84 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 0461d5513487..016c867e5e2b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -440,18 +440,21 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
+	down_write(&amp;config-&gt;lock);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
do we need to protect also VF2GUC communication ..

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+
 	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &amp;start);
 	if (unlikely(err))
-		return err;
+		goto out;
 
 	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &amp;size);
 	if (unlikely(err))
-		return err;
+		goto out;
 
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
.. or just RW access to the data itself from here?</pre>
      </blockquote>
    </blockquote>
    <p>The protection must start before we receive GGTT start. It would
      make little sense to protect just manipulation of data which we've
      already received.</p>
    <p>The post-migration recovery must have a clear state: either we
      got the GGTT already, or not. It cannot have a state &quot;it's not
      written everywhere yet, but GuC may have sent it already, who
      knows&quot;.</p>
    <p>The GGTT address must be protected from before the moment GuC
      reads it in order to write to VF G2H CTB.</p>
    <blockquote type="cite" cite="mid:aNRTM4ahMFul34Xr@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre"> 	if (config-&gt;ggtt_size &amp;&amp; config-&gt;ggtt_size != size) {
 		xe_gt_sriov_err(gt, &quot;Unexpected GGTT reassignment: %lluK != %lluK\n&quot;,
 				size / SZ_1K, config-&gt;ggtt_size / SZ_1K);
-		return -EREMCHG;
+		err = -EREMCHG;
+		goto out;
 	}
 
 	xe_gt_sriov_dbg_verbose(gt, &quot;GGTT %#llx-%#llx = %lluK\n&quot;,
@@ -460,8 +463,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 	config-&gt;ggtt_shift = start - (s64)config-&gt;ggtt_base;
 	config-&gt;ggtt_base = start;
 	config-&gt;ggtt_size = size;
+	err = config-&gt;ggtt_size ? 0 : -ENODATA;
 
-	return config-&gt;ggtt_size ? 0 : -ENODATA;
+out:
+	up_write(&amp;config-&gt;lock);
+	return err;
 }
 
 static int vf_get_lmem_info(struct xe_gt *gt)
@@ -474,22 +480,28 @@ static int vf_get_lmem_info(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
+	down_write(&amp;config-&gt;lock);
+
 	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &amp;size);
 	if (unlikely(err))
-		return err;
+		goto out;
 
 	if (config-&gt;lmem_size &amp;&amp; config-&gt;lmem_size != size) {
 		xe_gt_sriov_err(gt, &quot;Unexpected LMEM reassignment: %lluM != %lluM\n&quot;,
 				size / SZ_1M, config-&gt;lmem_size / SZ_1M);
-		return -EREMCHG;
+		err = -EREMCHG;
+		goto out;
 	}
 
 	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
 	xe_gt_sriov_dbg_verbose(gt, &quot;LMEM %lluM %s\n&quot;, size / SZ_1M, size_str);
 
 	config-&gt;lmem_size = size;
+	err = config-&gt;lmem_size ? 0 : -ENODATA;
 
-	return config-&gt;lmem_size ? 0 : -ENODATA;
+out:
+	up_write(&amp;config-&gt;lock);
+	return err;
 }
 
 static int vf_get_submission_cfg(struct xe_gt *gt)
@@ -501,23 +513,27 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
+	down_write(&amp;config-&gt;lock);
+
 	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &amp;num_ctxs);
 	if (unlikely(err))
-		return err;
+		goto out;
 
 	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &amp;num_dbs);
 	if (unlikely(err))
-		return err;
+		goto out;
 
 	if (config-&gt;num_ctxs &amp;&amp; config-&gt;num_ctxs != num_ctxs) {
 		xe_gt_sriov_err(gt, &quot;Unexpected CTXs reassignment: %u != %u\n&quot;,
 				num_ctxs, config-&gt;num_ctxs);
-		return -EREMCHG;
+		err = -EREMCHG;
+		goto out;
 	}
 	if (config-&gt;num_dbs &amp;&amp; config-&gt;num_dbs != num_dbs) {
 		xe_gt_sriov_err(gt, &quot;Unexpected DBs reassignment: %u != %u\n&quot;,
 				num_dbs, config-&gt;num_dbs);
-		return -EREMCHG;
+		err = -EREMCHG;
+		goto out;
 	}
 
 	xe_gt_sriov_dbg_verbose(gt, &quot;CTXs %u DBs %u\n&quot;, num_ctxs, num_dbs);
@@ -525,7 +541,11 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
 	config-&gt;num_ctxs = num_ctxs;
 	config-&gt;num_dbs = num_dbs;
 
-	return config-&gt;num_ctxs ? 0 : -ENODATA;
+	err = config-&gt;num_ctxs ? 0 : -ENODATA;
+
+out:
+	up_write(&amp;config-&gt;lock);
+	return err;
 }
 
 static void vf_cache_gmdid(struct xe_gt *gt)
@@ -579,11 +599,18 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
  */
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
 {
+	struct xe_gt_sriov_vf_selfconfig *config = &amp;gt-&gt;sriov.vf.self_config;
+	u16 val;
+
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 	xe_gt_assert(gt, gt-&gt;sriov.vf.guc_version.major);
-	xe_gt_assert(gt, gt-&gt;sriov.vf.self_config.num_ctxs);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
the purpose of this assert was to make sure no part of the VF driver
is trying to get num_ctxs before we finish querying it from the GuC ..</pre>
      </blockquote>
    </blockquote>
    <p>We now know this will never happen _<span style="white-space: pre-wrap">before_we_finish<span style="white-space: normal">_querying_, as there's a lock. Read side will wait for the write side to finish.</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: normal">So unless you're worried about a situation before we _start_ querying, it's ok to even remove it completely.</span></span></p>
    <blockquote type="cite" cite="mid:aNRTM4ahMFul34Xr@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre"> 
-	return gt-&gt;sriov.vf.self_config.num_ctxs;
+	down_read(&amp;config-&gt;lock);
+	xe_gt_assert(gt, config-&gt;num_ctxs);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
.. instead of moving this assert in the middle of the lock ..

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+	val = config-&gt;num_ctxs;
+	up_read(&amp;config-&gt;lock);
+
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
.. for code clarity you can add assert here as:

	xe_gt_assert(gt, val);</pre>
      </blockquote>
    </blockquote>
    sure, can do that.
    <blockquote type="cite" cite="mid:aNRTM4ahMFul34Xr@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+	return val;
 }
 
 /**
@@ -596,11 +623,18 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
  */
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
 {
+	struct xe_gt_sriov_vf_selfconfig *config = &amp;gt-&gt;sriov.vf.self_config;
+	u64 val;
+
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 	xe_gt_assert(gt, gt-&gt;sriov.vf.guc_version.major);
-	xe_gt_assert(gt, gt-&gt;sriov.vf.self_config.lmem_size);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
ditto</pre>
      </blockquote>
    </blockquote>
    <p>ack, though whether this stays at all, depends on further
      discussion in v3 of this series.</p>
    <p>-Tomasz</p>
    <blockquote type="cite" cite="mid:aNRTM4ahMFul34Xr@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre"> 
-	return gt-&gt;sriov.vf.self_config.lmem_size;
+	down_read(&amp;config-&gt;lock);
+	xe_gt_assert(gt, config-&gt;lmem_size);
+	val = config-&gt;lmem_size;
+	up_read(&amp;config-&gt;lock);
+
+	return val;
 }
 
 /**
@@ -613,11 +647,17 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
  */
 u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
 {
+	struct xe_gt_sriov_vf_selfconfig *config = &amp;gt-&gt;sriov.vf.self_config;
+	u64 val;
+
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 	xe_gt_assert(gt, gt-&gt;sriov.vf.guc_version.major);
-	xe_gt_assert(gt, gt-&gt;sriov.vf.self_config.ggtt_size);
 
-	return gt-&gt;sriov.vf.self_config.ggtt_size;
+	down_read(&amp;config-&gt;lock);
+	val = config-&gt;ggtt_size;
+	up_read(&amp;config-&gt;lock);
+
+	return val;
 }
 
 /**
@@ -630,11 +670,18 @@ u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
  */
 u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
 {
+	struct xe_gt_sriov_vf_selfconfig *config = &amp;gt-&gt;sriov.vf.self_config;
+	u64 val;
+
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 	xe_gt_assert(gt, gt-&gt;sriov.vf.guc_version.major);
-	xe_gt_assert(gt, gt-&gt;sriov.vf.self_config.ggtt_size);
 
-	return gt-&gt;sriov.vf.self_config.ggtt_base;
+	down_read(&amp;config-&gt;lock);
+	xe_gt_assert(gt, config-&gt;ggtt_size);
+	val = config-&gt;ggtt_base;
+	up_read(&amp;config-&gt;lock);
+
+	return val;
 }
 
 /**
@@ -648,11 +695,16 @@ u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
 s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
 {
 	struct xe_gt_sriov_vf_selfconfig *config = &amp;gt-&gt;sriov.vf.self_config;
+	s64 val;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 
-	return config-&gt;ggtt_shift;
+	down_read(&amp;config-&gt;lock);
+	val = config-&gt;ggtt_shift;
+	up_read(&amp;config-&gt;lock);
+
+	return val;
 }
 
 static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
@@ -1044,6 +1096,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
+	down_read(&amp;config-&gt;lock);
 	drm_printf(p, &quot;GGTT range:\t%#llx-%#llx\n&quot;,
 		   config-&gt;ggtt_base,
 		   config-&gt;ggtt_base + config-&gt;ggtt_size - 1);
@@ -1060,6 +1113,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 
 	drm_printf(p, &quot;GuC contexts:\t%u\n&quot;, config-&gt;num_ctxs);
 	drm_printf(p, &quot;GuC doorbells:\t%u\n&quot;, config-&gt;num_dbs);
+	up_read(&amp;config-&gt;lock);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 298dedf4b009..d95857bd789b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_GT_SRIOV_VF_TYPES_H_
 #define _XE_GT_SRIOV_VF_TYPES_H_
 
+#include &lt;linux/rwsem.h&gt;
 #include &lt;linux/types.h&gt;
 #include &quot;xe_uc_fw_types.h&quot;
 
@@ -25,6 +26,8 @@ struct xe_gt_sriov_vf_selfconfig {
 	u16 num_ctxs;
 	/** @num_dbs: assigned number of GuC doorbells IDs. */
 	u16 num_dbs;
+	/** @lock: lock for protecting access to all selfconfig fields. */
+	struct rw_semaphore lock;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index cdd9f8e78b2a..d6e2ed9b9bbc 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -197,6 +197,12 @@ static void vf_migration_init_early(struct xe_device *xe)
  */
 void xe_sriov_vf_init_early(struct xe_device *xe)
 {
+	struct xe_gt *gt;
+	unsigned int id;
+
+	for_each_gt(gt, xe, id)
+		init_rwsem(&amp;gt-&gt;sriov.vf.self_config.lock);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
this is a wrong place - VF's per-GT data shall be initialized in
the per-GT code somewhere in xe_gt_sriov_vf.c

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yes, it is moved to the proper place in [1].

Matt

[1] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/676383/?series=154627&amp;rev=2">https://patchwork.freedesktop.org/patch/676383/?series=154627&amp;rev=2</a>

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+
 	vf_migration_init_early(xe);
 }
 
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------EPqEFH0p0zxruDHhaCREuYQD--
