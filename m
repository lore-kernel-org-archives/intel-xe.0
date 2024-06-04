Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C3EC25B7E
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 11:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3C810E2DC;
	Tue,  4 Jun 2024 11:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aVoGfNEX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F8610E2DC
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 11:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717501304; x=1749037304;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=phq4f4QdjDgMhy+pNgOWMUSUEe0zlNM5neB2qbrmMxw=;
 b=aVoGfNEXoLYWklJcm3a6VO32JMVdsyh2w/PPEZZ1rT/UP53TdJoYMl3Q
 afD1aH/uzxPpvkB3IVPRSE02rveTjguaGtDljRR4HT8Ocxlutt1wRzWFv
 uZNTGxSMfoy0IRA0Ne0+awLzL755XtCjgzHZ2B/mT+rTi0rkPN1rqmuv7
 5I7Am67pxUB89IDyhtTl7VUfDttvnvttHsB/vk9qBbMT8NUyqpuFIErxd
 U3Og8PSN+9U8XmuhG7udBuc2INfcRJZyKEgqJCu/czMfCL4s3vwPOqTfZ
 SnhVY0uBBG4zYNMCf3dC52Y8LLS6e1u+AzlD2sMXeOAkOIFHKgkAvCzPS A==;
X-CSE-ConnectionGUID: LDQ8KqLcRGGd3OHIxIrajg==
X-CSE-MsgGUID: dOx9SWmMT/CLiFVhFmpONA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14156102"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="14156102"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:41:44 -0700
X-CSE-ConnectionGUID: Uy1lS/9pTeyIPaeZq2nIPg==
X-CSE-MsgGUID: Ym8/pdkqSB29KNh3Ov59rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37204895"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 04:41:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 04:41:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 04:41:43 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 04:41:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pxlem0yzJ6R4ihPtNIlkEgrvRzbXD8VibwdCGKwS5AG8UlX15IfqLEX0pk0GOlkOJ36xEzPky7ixArLdwDpfCqJkgM/b90Rtl6+scGkv5+9+4DuK2RhBg2RIvlFf9OSYt7GgiiSB6Dk19OF7oCt3i/RrT7Dd0UxDEax94CcOzPGYjZjwQPPhzPGKGBk0Ebb2BihEyxiX2YwKMP38d4pXp9s94EOnzSqjWMayF1rnYJxtLaobG3aA1iQznqSdyQaBJof8IJupNb5AstEu++Wt3ZNtnbn1mO5F2zJc00GkVNQbwMRH07Fa0vBb8uO/dW3yfThtpPmjIG/iX3xJxgRNvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AdeLc41CUJCa2D7ozx8zVzF4v6fEN4/LWc7NUi2J2A=;
 b=Xwv398t+Yy4hx5e+Zyz+/4kBbKHlW0iH36+sLi/2u8vuG+9VpdsylX/j1jUobcQabM77VQF7ac60mp6fknyLlmv2EL3LfgARhpiTg58I7UQJFKmAX82T7Ak+6burxYC7nqF6G0pnANPNz37lVepqvf2rnNMnCc+lrDYILlS9KLVls99oYLJnDlx+9Tv3h34mNGPN4k7BCXjbtSgQg/dn1xKQwmVcPigUJx/R3Oh3P+vNPfh+vAT8tY7LbrtR8uwjpVyKki3K5cVyiVNY5f5zM7QD+R0uhW6brnkC5QwiAPFwBvcgBDMrvfcfN6iuNbBuEAMPxFpEKjHuladmAAUWsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM6PR11MB4737.namprd11.prod.outlook.com (2603:10b6:5:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 11:41:40 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7611.030; Tue, 4 Jun 2024
 11:41:40 +0000
Message-ID: <d00bb838-de80-4246-8f36-b45e3abfb35e@intel.com>
Date: Tue, 4 Jun 2024 17:11:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] drm/xe/display: Always call xe_force_wake_put/get in
 pairs
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240604110225.29495-1-nirmoy.das@intel.com>
 <20240604110225.29495-2-nirmoy.das@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240604110225.29495-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To PH7PR11MB7052.namprd11.prod.outlook.com (2603:10b6:510:20f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM6PR11MB4737:EE_
X-MS-Office365-Filtering-Correlation-Id: f27a9d98-9fba-44f7-4606-08dc848b4ad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkhMWjloU1E3S0pBSkdRU0F5eld5a3A0SWVLUTNVdjBoTU15L0NZRlp4QlRu?=
 =?utf-8?B?RXd3Z1JlUldha2E5Y0VOV3FROWE5WW9aZmxsT1o5c3FNN04xVzZuWUlQU0s4?=
 =?utf-8?B?MlRoN09wNHNXWWVOWGpGcytJUHdCeS95OWVIT044NGlHUERKeXQyV1hhbzJr?=
 =?utf-8?B?WTkrYnYyWk4yb0FOa2w2SE9OUy9ocFZuUWgwRjlXc0k3ZUF4K0paWEZsQjd2?=
 =?utf-8?B?TE50QVdxT3dEcHdkdXZPOWN6R0xCak9oejJER1VPaThjcmZ6K1dDYUF0Wk4v?=
 =?utf-8?B?SXlCY2ZKSGtlVnZXZkUvUmozLzdabzl0MkZobnFrTk9QcUVnb2RwbENHZXBC?=
 =?utf-8?B?elY3YjRzY0pDZU1ucHYzVjlEUW50V1U5eCtIdGVyem1XWWlBVi9HR1FNN0tC?=
 =?utf-8?B?YlNINDQxaGRxZThINUVKZEhGZHBCa3M4L21LR1p6RnhhUnU1b3REMFVMd3Bp?=
 =?utf-8?B?VUxtbk1vVFczSEpVOHF5NEs2Uml2bmhtZ1hYMTYrWlNBbnRVR0FyR3M2VFh0?=
 =?utf-8?B?RU5yRExEU1ozaGtYcUkrTUdvbXh0WmRKMTNReDFucWJYRlk2dHI2dGppNzRS?=
 =?utf-8?B?ZjdOeDlpWU9tL3QreWZOd25YYlVWdW93cXN3dmp5SWtrRlA5cUZiOGFUSW1V?=
 =?utf-8?B?THhhVGI1Tnh6Y0RJTGRwZmRFeFhIbnl5bHZpZmVJRjlZbXJsWWFFdnZ6WExu?=
 =?utf-8?B?QTdtSUE2NExwU1FjWHRUcnUvV3pTbnVrWks1TjNnWEUvc212YUxWdW1LS3ZB?=
 =?utf-8?B?R2o0TXRuK0FPbzdyNmhTRGFJaDExbC9weUFibUlwNit6b2FReE81QnYwVmNn?=
 =?utf-8?B?cFl1RnA3cFl5TC9zMXF2SXhxSUtWbkF3QWd2MG9QR0JNb05sc0VJVEVqWTJR?=
 =?utf-8?B?NkFYNStFWmluNXhnTjBZelZBV2dkdUZkZUhvRUs5alRON3ZMUWg1bGs4TzJx?=
 =?utf-8?B?WXpjOTFFUVlLczFTSUVIMk9mUTRzakp5T1M5MHE3NmV5alR6bjczWWpvbC8w?=
 =?utf-8?B?QlNhWGgxSmNpRGd6RXR3Z1dDcVNQOURyRUpxL1cwRThjeTJsY3BEYUZ6dkp0?=
 =?utf-8?B?UFd6RlNSeFZtRVR4UWRDVW1mMUVsT2VMMDFURmQwNHFVUzBWTE5DeUFPOHVy?=
 =?utf-8?B?S2hyL0VJVG1vNjdwWWxtdHBHam9yU3BZVGJSMFNFQXo1d1E3V0NHaGZFM3k1?=
 =?utf-8?B?Y2UzRFRxUU9nSXlvYkIrYzArQlBFSXNIYTREUHRxT1gzcGZZOU1hRWl0anJl?=
 =?utf-8?B?VURIbHZQdEJDdjJXK01pdUxUWnQweFRYQ21wL01XclczdnpmdXFQYnRFVnM5?=
 =?utf-8?B?L2tzREEyVjVvZC9hRXF1bEVFZWdiaktBY1c1SDgrcWhtUUZkaWorUFpmYjR5?=
 =?utf-8?B?SFhaaENhRmhyaUhUYzJrVTU0ZWs1d0tPZWsvZ0lRRWhIbW91YlVacDlTU0tm?=
 =?utf-8?B?Zi9BMm53TSt6NDNyL3JnQWU3QjFxVXdoMk1PNzVWL1cwNTFOVkR1Z0kxWVJQ?=
 =?utf-8?B?OWtQZFZsL29rRlNUR0RVaCs0eC9XSzhKOFFyMVpQUnJNWUw4S0N6OVU4Q1o2?=
 =?utf-8?B?YnFpS3A1RkR1QnpzTFN0ZkMvS3NRVm1UbFkzR0JURnVRNGMxbXlXc0ZsRStw?=
 =?utf-8?B?bWxtVEYvUHNKUkxxN29jMjk4OUVUM3V4R2xOb25SdVkrTGF6NEs2RENRUjZh?=
 =?utf-8?B?TFFuS3hYRkZhZzM5U295bW1KMDhHa2gvakNyWXdhc0IzaVE1eDRydFpnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVc1RnBXSmpiOTlYY3d1Slk2eURqOHhsS2ZIV2tXV1UzVVdYNTNOY0l6UDJD?=
 =?utf-8?B?aEsyZlJVM0FMUTFDbzFWSXRGSVpqMUhURWdaMUxnNE1kQnEyVVVPdE1YeU5Z?=
 =?utf-8?B?Q2tWdlZ2bUp6NzRQMkNwT0hpRUsxUkNYTU5GVWs5cXVyU1ZlS28rTnFVSVFV?=
 =?utf-8?B?RXkxL216eGxwM0hlRVA1K3doZEZNT0x0amdGMW0zMnBOWVI0blRBb1VNcW05?=
 =?utf-8?B?dzlRcVkxYW5tdVczUGIxalRaT3Y4WDZycndUb2c3QnRhbWMwbFBYQmdjRUpO?=
 =?utf-8?B?RkNVS0FOUmxUb090WSs2WjY2cDNhdXN5UUh3TUtiUmtrSWM1VmJZZE9VZjl0?=
 =?utf-8?B?V3hoZ25wWk5MN096Q0p6anRudVU0TTJ3dlRidjNxOGZBRzVyYit6Mmkvd0pI?=
 =?utf-8?B?L1djaGt3d1F2ZWY1QzR0dUtPZk54MmVHdVVWMVJnTHFoRmNJVDBnTlk2c0pi?=
 =?utf-8?B?bEhJa2VJUnJnWFJLSU4wTkQ4THdoY01RQ1BBNStKSU5xYzhNOEFkSlFWWVhN?=
 =?utf-8?B?RzhCMWpTL2hKTVpya21rUDVXWUJlamNGUi9LL3B2Z1ZtSS93MVJNakFXSWxs?=
 =?utf-8?B?Z0xBSE1tNzRRWG05ZlVmTTdFTzcwdjRlNDNzcmZ6T20rZWRkU0toblZEMmZk?=
 =?utf-8?B?dnhxVUVKOW85eVF0ZVVSU1ZtU1U4dWpldFhyaElDYXVKVTBaUWI2QlJ2UVZw?=
 =?utf-8?B?cEZYUXkxdDMrcW5uQWwzZEx6VlRpN3BLdHpnUUtiTjNMSE42STlkaWxnN216?=
 =?utf-8?B?THR4UGhTdkxLdjhvYXNBV3FINmRDZWozbWM2V29RZG5VZWM5VTlWY2IxTTB5?=
 =?utf-8?B?clN4WVlxUGRtL2tKQk9nY1FkbGhYSFM1eCtaMjJLVXRMSTl2ZTdJYk96eTRk?=
 =?utf-8?B?Y0R4YnpwdVZXMlc0clhyM0xVeGVvZjk1OFArcyt5ekNob25RcVFMUndCSFZD?=
 =?utf-8?B?bU5vSStkY0dXRklJRzh1WFhrNHBEOXNoZDczdUQ5bjVLN056emt0ekg0NUtw?=
 =?utf-8?B?N0VNd1FodG1PQko3ZnZNaGp1Nlc4NytrZXc5MUpsd2NjVlZGclVtQ0QrTmhk?=
 =?utf-8?B?MFVoZDJaMHFQUHlRQlZ6d204UlZEdDlncEorVXM1emdPTzFZN1JIUnZHWEsr?=
 =?utf-8?B?U212MGQvL0JVUDNEclB6WlBERllRM1pGK2xNSXdraTlKVWc3dE52TmpyMzkr?=
 =?utf-8?B?QlN6OEhMWVU4by9Hck5TNmtsTGt0QWpzOFc4RU9EM21kak9rYkVBaExOaXJo?=
 =?utf-8?B?dHFya3g1c2xNRGtuTXkxR1Y1aWdoU09hdHgzcVBEOERaVmxnQWZtZ2Vma2Ro?=
 =?utf-8?B?eGVjblFhMDM1anpLQXlEZ2JiVTJEeDlEOFBpK1lNYTNBWmRmV2pjK3hIK1RP?=
 =?utf-8?B?QTNraXQyRHMwYTcva3BZVUFvS1BJcXZJVy90UnlxRjNLZ0RsS3ppNDRvLy85?=
 =?utf-8?B?MGlkK1VLblNSS25sb29jQWtCNE1LT0hGUUZFUGN5YkdNU1BqVzhYbWluU2k4?=
 =?utf-8?B?eGZOYjlSMUV0OVdrV1dlSDZCaklpV1EwQnQ5a0JVdXhoY3k0c1VJUFVvbjFz?=
 =?utf-8?B?TWlmOUZIMlZCZnVNYTJHSmJONWx1cVJ2RFZtQ3hpOE9ORGhzWHpPV3BXZ0M3?=
 =?utf-8?B?cFVOQTc1dk5LbXp2Q2ZZMENFNnVZMXZIK1p6VkRYWlp1a1JRcE00QUY3Mnd2?=
 =?utf-8?B?WVdGWVBKME8ybUFVbk8vQk0rQXp6T0lsTUlUeThlZnVQQjhVRUd4dFNLbE1m?=
 =?utf-8?B?b2hiK2x0TkRuTEp6eVo0UzBjTkhtQkxYM2NUN3d5Z0dJVjgrVW8rbWx1WTRt?=
 =?utf-8?B?MHBnQUtnaUEwZHZZTXpOK1FYZkUxdVRoYkh6ZVhXbURjQmtYWnVGVjdZQm5m?=
 =?utf-8?B?WFhDYTc3NTR1NGN2VG1DN2ozRDRDYzh6Y1FKTThXZVlYTHp4RzBBbSsvODh6?=
 =?utf-8?B?WWRkYXpJQXZMMldmSVMzMERVN0lPV3ZrL2NldDVqL0tpV0t2cVpueWpMd3Fy?=
 =?utf-8?B?MVZXdmltbTVSeGxCdmtxbEFSVVZVODJsS3JzQXBjR05PSzh0UGw5UVZML2J1?=
 =?utf-8?B?Zm9UUHlZQmxqS1BkSCsybjlITm9XN00xWHVMZTE2QkMwbC93SG5TS1hycCtk?=
 =?utf-8?B?dUx1QzFwaURxL3VBcTdQemtNaG13MTBnY0RDTCtzVjZDSzBGTVJDTEhna0Vq?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f27a9d98-9fba-44f7-4606-08dc848b4ad5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7052.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 11:41:40.6160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBo/we39oh2QNX9ir6kV3fAzWlhp+yOiMJ3P+tQLCBdtw5W3tuAd6AQM77kVhV7trIDgzIUH/+gr8rjdOktsyhTiSec/Jm8NsUI86ek8MyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4737
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



On 04-06-2024 16:32, Nirmoy Das wrote:
> xe_force_wake_get() increments the domain ref regardless of success or
> failure so call xe_force_wake_put() even on failure to keep ref count
> accurate.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index 14b8b4278317..6cd82ef495c2 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -56,8 +56,8 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
>   	if (!xe_gsc_proxy_init_done(&gt->uc.gsc))
>   		ret = false;
>   
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
>   out:
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);

LGTM.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	xe_pm_runtime_put(xe);
>   	return ret;
>   }
