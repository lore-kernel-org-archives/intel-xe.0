Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE206CA0EE6
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 15:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DB010E629;
	Tue, 19 Aug 2025 15:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4lzCZPT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71D810E629
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 15:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755618762; x=1787154762;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=l3rOQ6tRiBdxsQb1anXN93pdpY2rqea0x4CWURTdEJw=;
 b=U4lzCZPTOaCOhAJnB91U63hdATvCa0zxrFKkIF8weOIqTjWdCyUS2M4c
 mMkOi+Y75yBXvAfLhxCoc+ydpyeqBmAzbh7HrBVw5Dc1iB1iBMFd9n51a
 930FYBBhosTV/GRZuYwF68AWMNY2yzFwA1tbUIp/nYqIy1UygR1it5IFD
 krgiDdjduVEmtEhuZJYx/Dh/dcJAXnCjAgyt8aYIAOXHIlP8nGPmVS6bi
 yCkNmAD9nid3FXfS2EiKRMgqzczRwd0b99M932QmwCfz2GLaZc/U+OC2F
 MG+ibr3ib1xhz0HLqVjBvDmZXpkm1HQrKwzJ0xmxDa+2eWKR3hOscvdwr Q==;
X-CSE-ConnectionGUID: HLUvZLvxRtaqvN2qPlxN9A==
X-CSE-MsgGUID: YNYn6PfKT1Opd8HaC/zzWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68965803"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="68965803"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:52:41 -0700
X-CSE-ConnectionGUID: O98svo7VQBeRBmA4OjgJOw==
X-CSE-MsgGUID: t1C0GTzETV+/hMDR415Mdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="173124371"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:52:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 08:52:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 19 Aug 2025 08:52:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 08:52:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrW8za6DGtG8APqwZ6K54HZka+tCcBpKmWu0S6Fl49ZnmYWXXWedYMSoIbItmUIlPOkfzaMkK1IgGQ6YXAk3OluNyDsyB65pNSaeN/aa/tVHkkx6zyC9D/EHlSenFp3fG4py1V1I2epQWQOvWV/+b9eZQh+NWwZKW1ALsKOEIJNjdzk4Z0bWKV+eotcWZ6wGKjQWsYxYlXYFjX8vZFGpzG9I7ozEnCvpHOjzWWiVLSFOv7LvqKP9dxLOC25dCFZLaB37JPp7djLQx/3r5o0BWUlQSrBGG2tQnDJZE2XpL26/SEomZhEFHA78ha2GaV3GJAa0+W+thtS3T5RymnITwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUa/7JFX+TqcSUq3kt0fNpXXCPo+mgn8x5TrBPYanSk=;
 b=ffoeconDzg6+jLKRdlmqvbsDiPq4UIfG+4yKNU3E6SjBjX96cGT91RcD3627uWBl343FzYvQLack+3Amw5BnIBmkP5oD2MrnPVqSd2BgjXg+4YW3rEKO2DVMC0pXIaHENCP0kQ8YA+Tv6u2FWuI9sDmoKOkK+r1cDXiMIqOcAQsvc4u9e5lMVjJb37VTnb7EMgNoRuMNBcRUXPYFIcq5ab+IwnKo2hJvilql5Fk6zqwb8NxnPCZ9wdR3+WjIssOSvZsEPWgf6j34uzUR8gjDDnX0w6qoSsIHsuNpHYHm50IGumBdf9WXZWEuz6ZiflKZFiVhAPsv07YjaXZkKgViHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9255.namprd11.prod.outlook.com (2603:10b6:208:578::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 15:52:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 15:52:37 +0000
Date: Tue, 19 Aug 2025 08:52:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>
Subject: Re: [PATCH 0/8] drm/xe: GPU frequency tracing support
Message-ID: <aKSdw2Sj5NBeBpzM@lstrano-desk.jf.intel.com>
References: <20250819063417.918666-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819063417.918666-1-s.sebinraj@intel.com>
X-ClientProxiedBy: MW4PR04CA0348.namprd04.prod.outlook.com
 (2603:10b6:303:8a::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9255:EE_
X-MS-Office365-Filtering-Correlation-Id: 3806fbb6-f91c-4b25-28ad-08dddf386bcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzVMRVE4ZW5LaFI2UzVFc0Jzd0s1SWw0VkJNcjFtMmhQa1dNN0U3WERITUpz?=
 =?utf-8?B?czlnbFZROEthMU4zbFY4VXRsWnJMOVVOcjdOT1RUQmUrd2Q2djJ2RUk3Y1l6?=
 =?utf-8?B?SSs0YXZadHlmU1RMQUVBOW5IK1d3eUczVWxPYVZFWTFkeHpwaDZ5K1E0MUtT?=
 =?utf-8?B?SWxQbjZxWEc0MmdGT2RqUHE1RkY5RGdwa2RENFI2RGk0WVo1eHJOTGZaY1U2?=
 =?utf-8?B?cWxPc1QwSS9CSUY4eGd0SVZrUDZCc2lEZytoOEl1VEdzWE1sRHpMK0toYUxY?=
 =?utf-8?B?ZmpPOEs3dytIbjMwTDBBNWJZZlBvUC9nYmlmU3hhUFFHVGdUZDVOd1ZiclpR?=
 =?utf-8?B?ak1LVUJBem9mYjhzZkFtZDlQSTAxb1JZN3lXVzB0ZkZOdTAwQ2lqTVR3alh2?=
 =?utf-8?B?Zm9hTEszUG5xa3dMTENWU3ZNb2k2VWhGZjZkaTBEQis4WVlvVUtramc2VVdk?=
 =?utf-8?B?SHJGcmh0TkRPa2V3VkxXa25nNjBSaURYcVBBaXorUUJnL3VZMW9xNG9MNlFY?=
 =?utf-8?B?RDBCVW4rcGU5WTFVZzN5dFVxajUzZVdMNGRpeHpuNlBxQjFVdG1jRmErU3R0?=
 =?utf-8?B?c2dCSHdQMThTcnFSVkY2dTVEMXUxNWV1encxejh2NVFVNFhsTm5GN3IydnVP?=
 =?utf-8?B?QnJvTU1FcTViSnJXTGVnbHpFa1ltamhXbDhZai9BSzB6MkliVzdpUE9uNmsx?=
 =?utf-8?B?VjhyZllubU5aTitnRENpWDkyb2VTc004L0s5eVJrajhSV0RNS0tsWkNXeEp4?=
 =?utf-8?B?aUFlWnMzR251RngwME5SSFFqZW5aZnI5T2JMTlNVcDhDcTdicy9VSm9ROStr?=
 =?utf-8?B?S1Z5OTJpTTdpOG96MEJCZTJZMjVaUlo0NEE3MHdHbUEvbWZmSEF2QWxaZ0Yz?=
 =?utf-8?B?NjhtWWY4eUZqNTlkMXVCaEZIdVJzU2toc0dlaUk5RGFGaGVnWUMreUxtWDEx?=
 =?utf-8?B?amtZY3pMcWRqTi9tQUVNcnQ0VHVtNnhUZVhIVnJZRjdROGhkVGo5SFdTZ21Y?=
 =?utf-8?B?UzUzbmhoNU8yeHFEMnQvOXBJVUl5MW15SmMzb2Q0R2VKWHhSYi94MDQvYVdW?=
 =?utf-8?B?ZkFiT0tyY0RMOEFpdFhITnVSdllsUnlVUlE5TWgvTjBhUDNZU3J6WDlDRi9s?=
 =?utf-8?B?WXdndFN5TldyQjZ0UGZzL0tYZlIxTkh1cGFkaGlDMUY3VHE5VVVHVXJ6bTRm?=
 =?utf-8?B?ZFFRejVuZnZyajdaZ2tkVnpLcTZOSnhQZGprSVJaanJNY0JMVzFKSi9OTzRO?=
 =?utf-8?B?bVpoQVJzUncxWndkV0cwbGxSOG90Ri9rNFp0Tmg1WnEwRGEvWFpKWm1uelVo?=
 =?utf-8?B?Ylc0SXZsK1ZZWC9lY1JiK05tcCtEVlhkTFphbE5oMllLbXBIQnlTc29WNEFl?=
 =?utf-8?B?aGNWZC8vRmt4dDRndDI2VGFWSFpmMzkyTDl5Umg2NGVTamZ0Sy9SVHRaWUYx?=
 =?utf-8?B?TXpibEE3d3JHdWRsb0ptU3pBM2NEQjArWTBtclpwcUhTU1N2YkV5RVN5U0Nk?=
 =?utf-8?B?UTM5SDlXdGFHdGEvRUxlamVVRDNTL29KMTJOc0ZzTVo3dFU4cUdxZG1xc2Fi?=
 =?utf-8?B?dG4yZFM1bzZGZlkvU2ZXbm5DS0ltSkxkR3VENldHNVNnYXFVMFlNMVArZHNs?=
 =?utf-8?B?VkRkYUgybklwekc3T3VBSTArSjQ4RDY1aFJiOU0yVFJaL0Z6VUxpLzdQREY1?=
 =?utf-8?B?VFV6OTdmaE5oM2lxN1NEYnc1Zi9GVUpVbE5vYnIzSUxDSU5XWUhUTktTNlZa?=
 =?utf-8?B?Sk45b3duL3lUSWhDTFhjc1hiQk81MUN5UHpaODV2OVp4ZTArSWVCOHZNQWpN?=
 =?utf-8?Q?fhHiDmLFqeZe+xCgCq29UfpYEXYZIW+5ZH+WE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVYvek52ZEx1U0VGd0Fud3RjOU5EZGpjV1NSN0RBWlB2Tkp4Y1lmYWtGTFpi?=
 =?utf-8?B?Y3lYaitoclJOVFZnYlJnSDdyK25MZmpMd2ZvTUQxUFA5aU9TTGxiTWNBTFdE?=
 =?utf-8?B?OW5BTDZSRndjbDM2c2NTTHFWajkxNU9GMzZUQWhqUS9MWmhqb0djeXd4Q3JE?=
 =?utf-8?B?UnlkRGFxWGlDSEg2dWFkYUJDbXpOQ1BWWG1aK2hRRldkM0hlbmZhZVZXcEh4?=
 =?utf-8?B?eXNhUElLN0p5S2liWlZtMXUzcEw0WUo3TW5TTXFBWDhZdXpucEZCeE14T0Jy?=
 =?utf-8?B?aWtTMlRFeEcvNXp2VytUN1BRMlAxMSswWS9qRmRmWlQzdVh5OUg3WDlWMnE2?=
 =?utf-8?B?MDRyWFg1RTNta3czQTdrMTlyZDlQRS8xTlFNL1N1YnN4NTlNbnZCNllmRFB3?=
 =?utf-8?B?VlBscVcyNVVTNGY4Y1BkVUJHUVA0bWZzRXErMlZXckFqL0dmZWRsL1h0Mlc5?=
 =?utf-8?B?WnkrcWtCNzBuSm9aWFZxeFU1djE4aFBtOEVveDhEeXhlZTkxclRVWWt2NXBm?=
 =?utf-8?B?ZmRMWUxQdENPRER4emllNS8wSk1iK0ZHd1VyYWVxTmh1Um5EeDR2bjU3L0I4?=
 =?utf-8?B?SHo5K1dHN0IzWDNDRWpCY1pnNmZjNUhhSnBJZUVxb244NC9TUGFtK0RHTXhG?=
 =?utf-8?B?cHVlYlNlcHYzQ3lyYzlCRDFjRzVXR3RjOGc2OEZFaGJXRXM0M04wbll1VDl2?=
 =?utf-8?B?YW9kTXZZRWgySVc3a0sycU1UekkvNnZQZlpwMStlblFuUUZ3WGI3NGhsRytS?=
 =?utf-8?B?Y0hPMnd5NG1yV21RWXJHVndmZ29EUm9vRFlUVituMi9QS0VRMDR0Ums1ejBt?=
 =?utf-8?B?SHpzRTVQaGZOUld4WkcyM2VET2JrZ1FwamZRZUpMcmtOdWZuS2tnc09HdmpK?=
 =?utf-8?B?UmFpY3VNOXJRa2tUcEhDVkY2bEx0Q25jT2JreVlwZDZPd2lLVUJLaHh6VStX?=
 =?utf-8?B?Rzd6ZEptZ1JLMkxvbzNsZTZ5Zm5xalp6KzF3eHBHNjdjdzJaMmdMUUxEblhv?=
 =?utf-8?B?QWdwRDhaM3M1bzVGaVFvNUt6TWg0SXVrYVh4amNiSzFTYlBZS0JmMy96VHVP?=
 =?utf-8?B?TVQ3bWVMR2Y3UUdWYW9EbFowemZZTHo4S1lCNjIwNkorYjBidGtob1hJSUxi?=
 =?utf-8?B?Sjc0UGNTb0FjMFhCMkw1K29FYWFjR20ydjZpR2RjRXk5UVlpNnV2V3BPZzJJ?=
 =?utf-8?B?OXlIM3hCMlVvOHBwbW1nYld0aHFxMXd1anU2cjJUa3RxZGs4RlFqdjNFT1p3?=
 =?utf-8?B?c3FKTjhLUit6ZitXZU1HbXdsVitPYUdjZHlIZVRnT0VGS25hU2doenIxd0Vu?=
 =?utf-8?B?NS9JYitIdUdHNk1tR29Tc0VMbVI1Q3R5Q2lnN25LNW52aGtmZ2U0NUdYaWpE?=
 =?utf-8?B?QU4yNi9pbXZycGxDVk5TUEVSc0VjNWkrY25JdVUzZFVka3NqNXhMcnNXMndm?=
 =?utf-8?B?bFZjWjRJWHJ3Z1V1TlU3YkJPYXFId2hJRVhid091RXNQT0M3dnI4ZTZ2WXYw?=
 =?utf-8?B?Tk0zRlVra1NyZVdHMjZhZGpPQS8va1c4Y0toVHI5NlpzYXlJTHpNK2RTMDFK?=
 =?utf-8?B?TkVqTVZoV0J2dGs1d0t0ME9HMkxWL2pOU1I0UUxqOE5KOFZEZVJyVGs5bmsr?=
 =?utf-8?B?R292M0Z4aFBEYWhPS2U2Y3p5QVoxTEtiT0xaWFdXaUFKZDZwLzZSNjFCRENm?=
 =?utf-8?B?c0JwMWxTVVJpOTUvQ0wvZkF3SE4yU2ozKzZod1Q2U3RzY0FFNitnNTZZbnAw?=
 =?utf-8?B?bW9HMjdjRjQwYURhVzhFaFB3NWdHWjVrcWNOZldtNVB6NkhtcnpiTFRrSVZN?=
 =?utf-8?B?MmJrL0tZT0ozbHNTdWFyalBpR1pvWlR0MVRjNmNTVDM3aHBlbUpsbTdxNVZ3?=
 =?utf-8?B?WFREWUhxVysvajNJcXFqYlRqdVgrSXIwZ2dhb1lsdHVlNnVwVWRxZEsydWVC?=
 =?utf-8?B?WE5ROW4xYUxoQ3Jqc3kzMjN2TVQ1blVjcnNXZ1REd3duVUFRK2Jhc3YzUzhp?=
 =?utf-8?B?VTArS3Evajl2WlZWYnBCVEJrM1ZXN3Q5STdKQjRmSXh4SXV1cG0rVVRZUmJL?=
 =?utf-8?B?MEFrNHJRRXl5VFJJL3dVNWd1ekxHdDAzWk10eDcrTlF5TkpOeWNTeU5nOWtm?=
 =?utf-8?B?ZUF0cFppN1hmd0Q2M0pqMW1rT0JRTVBGTVYrVUdFV0MxR1BSSktDa0o5VWxk?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3806fbb6-f91c-4b25-28ad-08dddf386bcd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 15:52:37.7929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKUj+b0dm6w21NjfmVuNUOcNens8XfWxeFHMud5VznUqptmQm9PEQu3awcIn4bVIk5orYMAnBwDAolKzwW1lyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9255
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

On Tue, Aug 19, 2025 at 12:04:09PM +0530, S Sebinraj wrote:
> A periodic GPU frequency monitoring and tracing program for the
> Xe driver. The implementation provides periodic sampling of
> GPU frequency through the Linux ftrace infrastructure.
> 
> Key features:
> - Periodic GPU frequency sampling with configurable intervals
> - Immediate frequency change reporting via tracepoints
> - Integration with Linux ftrace subsystem under 'power' events
> - Per-GT (Graphics Technology) monitoring support
> - Dedicated workqueue for non-blocking frequency sampling
> - Configurable via CONFIG_DRM_XE_GPUFREQTRACER kernel option
> - The monitoring interval can be configured at runtime via the sysfs
>   (default 5sec).
> 
> The module parameter is:
> /sys/module/xe/parameters/gpufreq_monitoring_interval_ms
> 
> The tracepoint is exposed at:
> /sys/kernel/debug/tracing/events/power/gpu_frequency
> 
> Format: {unsigned int state, unsigned int gpu_id}
> - state: GPU frequency in KHz
> - gpu_id: GPU clock domain identifier
> 
> This enables userspace tools and system monitoring applications to track
> GPU frequency changes for power management analysis, performance tuning,
> and debugging purposes.
> 

This doesn’t answer Lucas's question in [1], and I haven’t seen a
response. Why is this feature required when we already have a PMU
interface that appears to provide the same functionality as this series?

Please address this before I look at it again.

Matt

[1] https://patchwork.freedesktop.org/patch/667913/?series=152701&rev=2#comment_1224165

> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> 
> S Sebinraj (8):
>   drm/xe: Add Kconfig option for GPU frequency tracing
>   drm/xe: Add module parameter for GPU frequency monitoring
>   drm/xe: Add GPU frequency tracing tracepoint definition
>   drm/xe: Add GPU frequency tracer interface
>   drm/xe: Add basic GPU frequency tracer implementation
>   drm/xe: Add GPU frequency tracer to build system
>   drm/xe: Integrate GPU frequency tracer into device initialization
>   drm/xe: Add core GPU frequency monitoring functionality
> 
>  drivers/gpu/drm/xe/Kconfig                  |  22 ++
>  drivers/gpu/drm/xe/Makefile                 |   3 +
>  drivers/gpu/drm/xe/xe_device.c              |   5 +
>  drivers/gpu/drm/xe/xe_device_types.h        |   4 +
>  drivers/gpu/drm/xe/xe_gpufreqtracer.c       | 336 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gpufreqtracer.h       |  30 ++
>  drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h |  48 +++
>  drivers/gpu/drm/xe/xe_module.c              |  12 +
>  drivers/gpu/drm/xe/xe_module.h              |   3 +
>  9 files changed, 463 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h
> 
> -- 
> 2.34.1
> 
