Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24023E7716E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 22:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E419C10EFD4;
	Thu,  5 Dec 2024 22:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Leup3Taa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C809B10EFD4
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 22:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733439069; x=1764975069;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PlZ9/bepzvnp9RhQmg4QxCEVNdx60HyEg13EsqtBmgY=;
 b=Leup3TaasUXq42N5RMru/vloAJYKa9YglkmelPl9Ir2wXKW52pYBans7
 9V0B6mVvJC69C57Wi0lRKN951Uby3ZUzIBArnITLijCT1tv57Go+YRGYW
 NeKqsbmHCrBm6N18FeLImOBrsiJmKLkyAW5ApuGaP6UuJjbVEGk3oVZO2
 /t2H16VWWOi2FeEmb7ryitJVAJQM4Hl6BmUxOTCJYWFMmqBp50huFSL+5
 a2xpqLeJMdmzIjB8hYfTBXLJ5kGMy7svfZZFvCnWEzaiUDuwigjQF7lAF
 LT/ZhtHipCJR/F2ujC/MclDQLYagYg/2hB73jUwvkNZEV+bAyPSmBkqDm A==;
X-CSE-ConnectionGUID: q5WeLyU9QAS4LeJlHFeJ6w==
X-CSE-MsgGUID: CpE5ZcAJQQ+H/wVWlyVUgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33922927"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="33922927"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 14:51:07 -0800
X-CSE-ConnectionGUID: arsCpQwWQOiAaGpRdiHd6A==
X-CSE-MsgGUID: KBhpx8rMQPm4EzXlGRNCYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="94436489"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 14:51:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 14:51:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 14:51:06 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 14:51:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUYZZigM5zbSNIN8UI3XeEcXkGYVRUh4ssUVcnpNQUoBK3goiqO31rvlSQ3Ts2HW//I23Y34AXQHA3NooEw63vffEGkoJQ1BAiKZwIALUdICjd39K2AdbrxV3xn+VaVYz//5heSP3Gd1pvWHTLT4V7ak3MtmT/EGx7obT9ONi4mbjwuEtA/IVVt+ndYUGf87jglmi2DsLQEXJG+azgQ118/gZhFf9WtAirXQaDBk5bCJlFyPCmFgTDPYWZ+UVTqGIx4mHqXgsG285JTJo0g71IdRPjO/ZVO3xTgpKjhpnjlCHtfczMvVbjdzNFyg7DCxAKM+wIfp2YqVvSYoEmx5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DELsfwouPfEORgJbU/GZXJDx/asLp3gYek0+JnX1Tug=;
 b=epW1vccJo7b3NRXvT7giLREdd5yx81/6cEc3LH7eSl7N38mQPqhES4MRWEDLzXXo+mJHPtQnlubvVlzQuTwIn11SDjGHaGD4blVMn8ZTGAFNTEG5ip1iJuzAN7/Tx3UmBtLFZdi4+Dp83r8qjNZQvkud1FOn5nz2JPKuNGAKNz4fW0kQrLpV45y6ivaza0Opq71BoibUgwnctqANkFQuUtx3PpYvHiv1NIEupgRrlzJa52O1t7ipRQYuVWEbyLD7+9PzHaOZcJNj76Dd06cTUikHv4pNDvIbhC1LPxS1814eUgJR0/4+U/TPM8ewHPaMXWvG42W0JHLWiL0Ut5D0mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Thu, 5 Dec
 2024 22:51:03 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 22:51:03 +0000
Message-ID: <dee410d2-f96e-4819-aa5f-7060b1d376c8@intel.com>
Date: Thu, 5 Dec 2024 14:51:00 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/xe/reg_sr: Write all whitelist slots
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, <ashutosh.dixit@intel.com>
References: <20241205182240.3463027-1-lucas.demarchi@intel.com>
 <20241205182240.3463027-3-lucas.demarchi@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241205182240.3463027-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0251.namprd04.prod.outlook.com
 (2603:10b6:303:88::16) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS7PR11MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: d7da338f-b68a-4dee-ed2e-08dd157f4b78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFlzUkZoNGJ5UExSNEJpZFJqdVMzMlFZZGYyZGNVWG1qWXNBYXhML1lmWUhO?=
 =?utf-8?B?YkIwZzB0dVBTeExYMGdpTlZ4SnFUeit2VmlGWFJXaXZzRUdsVG9vWDN0U1V0?=
 =?utf-8?B?d0llb3FqUUVDckd1MEcxNnBjUXdYSFRuaEZUU2ZlUXdkTG9QZ04zVUFURXYz?=
 =?utf-8?B?OWpxRjU3QzIrU2VIc1FpR052bUk4MWpmZDQvYXRLaHZsQ1FXUFZtVnN0Zm5Y?=
 =?utf-8?B?Q0Z2ZmZnODRKRWtyblJmMUZwQTZLMnJhaVRHUU9jck5mR2x0RENaNjZqNUs5?=
 =?utf-8?B?QklWRzhDVCthQXBxTE1NSlBsNUs0cWd6djh5MFFacG43RE1SWVd2R1VDNFRP?=
 =?utf-8?B?ODV6ak8vOTQvNDdUUzZjWWJMdko4bTNmSW5Pc2hSbTVnNzd3Z29CL0V4d2xT?=
 =?utf-8?B?ODRaZGw3eVNtM3dNY3gzK09LOGtYVVAvdE5DNnVMRnNHeGFsRTF4Q1hvYjF4?=
 =?utf-8?B?OG5MTzRqNFRhK09TbHdrNi9BZUNqTkM0U2lFVTFjVnI5ZWhQZU44b25qbUd1?=
 =?utf-8?B?eGxBS3BrUlc0b2RDU3hDN2dUZXM2TUJZQk1UbnZBQTRoNnBCVDFaRDJuaVBG?=
 =?utf-8?B?OGJlYnZTK0cxVE9DZjBNT2ZOVWF0aGw5RWdYM3B4SjEzb3N1clJ0dVlQQjgy?=
 =?utf-8?B?UnFjTXNzT3FLUityYjhnMWREcFNjTkdmeVV4NVpNUll5T1d4UFVWUWhiNXFJ?=
 =?utf-8?B?MnVGdzQvUTRmQU5NTXp1VlFCZkNMMmxrSkkrajJibG0zTjJQZWtwbjVUQnMr?=
 =?utf-8?B?aE05d2t6S05XU0NRbFRPeGZucVYxMERNL2c4OGxDZXRxRTUzY0JzK2NDTzBQ?=
 =?utf-8?B?czFST1gybDZVY0JseFBHN2UzeHZsZzU5dnNWQ2dUaUczOCtrS3NLUzRBbUsw?=
 =?utf-8?B?SGhDNkFJMnR2aFY5UEdQckpjNjEwODhqT0d3OFhOODhOVXlGMGRBS2d6MjJr?=
 =?utf-8?B?QmQybUlSQysrWXJ4N1h4MmJLR0oyYVVQc2xlUU53djZxV1V4cGhMQ1Bma2Jn?=
 =?utf-8?B?MjJxWUZ6WitTQzV0MXpiNCtjRWF4cG9mZ2hKV0ViQjZPNUhmR0taTTgwOThm?=
 =?utf-8?B?bGwyN3M1alFwN245b0RKWjdURkZZS3dLZStPQ1RBYmtHSUNlZlg1SnYxWUlM?=
 =?utf-8?B?ZWRka3czejZQWitYamEyeEdkMS9icHNqeDZZMVJ5ak9ta1pkYU85ejgwSWRP?=
 =?utf-8?B?OHFyaStXNzdLaytVRUZ0cGRNNExxQkU5cWpoTUtudXlLUnQ2dlV5dDJKbUk2?=
 =?utf-8?B?Z3NYeTI3ZjZJWjBZeEpEYVFBdmY4bUtVcytUQm5LSjZmM0x1R3FoYjF0Wlcr?=
 =?utf-8?B?WmZwMURTbmplaFd4NnFkYWpuTnJhSVBCNDlQLytsM2hnUHI2bWRrQXowczBw?=
 =?utf-8?B?dnRrUzgrSWdiSVM4aFQ4R3E0dlpySzZFalQvWWZ2Wm9UbVhaL0R3ZUdEZEhi?=
 =?utf-8?B?OHVhM0tSaWorSXZ2YkV6eTByUVVIeE9BVUIyQm5GQkNQQ29PYWRkUVVVZHJF?=
 =?utf-8?B?VW1EeE9GT1E3cm1HOUNjLy9OMGw5UnJqQTdYeWVhc1ZaQWJRZ0d6a3VpZ01W?=
 =?utf-8?B?MGtTNUFqUm5LOXR4N1pUTkx6VmZ0dW8vUmNDQzNJUnQ0eTRaay9xdEFpRUQ2?=
 =?utf-8?B?M1Jydm44SHpuR3lrRVpZQzJtcEtiM1UwZWUxdHV3N0RGdVhnN0JTd0ZhRFJH?=
 =?utf-8?B?UWtpWWlFWmNBMVFJM2orWGtFbFVJMU02ZlBLYXFlTUFycUtxOTRYZUswaGtE?=
 =?utf-8?B?cmpGNDRvSGVnYURUS2JyY1ovdFF1dnN2S1NIU0t2eWNGNk12NmFRNWJhY1g3?=
 =?utf-8?B?Y2N1aU9BWVF3a2p0bXVGZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2lhc1RRTk5aVXI1Sk1STkdkbEpIUVQ5elV0cDFsWUJ3Nm9udjdGMW5lWFh0?=
 =?utf-8?B?RFZkekEzb1lrRjQ3RmlaTEhqUUxvblo0VTcvTEgzN2RLYUVVY3N6WlRVSG44?=
 =?utf-8?B?a1A0L0VtOXhYUks4UW1sWDhYbU9zeUNkTkRPZDU3LzdnY25LWVg1WmdEdnpW?=
 =?utf-8?B?NDVuTlNTc21pQXpPVlhrZDNON2ZQUG1rdmxBSjdpRXNweWpNN3Z0R29zNi9j?=
 =?utf-8?B?dVVITWljQ25Lc1VmcG5ua0lNOTNkYmhDSVErdnJuZ2dQZjdSU3VzMGdrSlVX?=
 =?utf-8?B?WVcwV3ZYY0N0cnpaUDd2dHhuajgwbGttRE5rUEhWanBucEUwVkdYSHF5L1lW?=
 =?utf-8?B?L05JQTJxaUtGTlp2UW02dDdncDVyZWJXWlNQa0tTKzRtV0lqeTdhRU5jVUlE?=
 =?utf-8?B?MnAyNE5QY25saDhrK1N2dUdIWVZ1NDUyVGxnMnpxMWlzYzR3ZGRKeEhzUllR?=
 =?utf-8?B?eUNoN3RCT1UwbkdKRG9naGNjNmRodnFSOGw3dXBXNlJDZ205Qm9iWFdtZ2VN?=
 =?utf-8?B?VjJJbGkrMHZMR1ZEL0NIaGlOMzQ3RWxzRmtvend5NEg2SjM2eXMvUXN3M0Ez?=
 =?utf-8?B?V0F2QWJEM2RDYTJscE8yZTlCRXJnUGdqVnFENE1pWGoxdFo2ZDNSbTY0VUNG?=
 =?utf-8?B?VlFodTRlaXBQdjFiN3YzUkJpVXdtY2FiYk90M1puYW85MFNydXhKaUljZE5O?=
 =?utf-8?B?djZETmpSWmRGRWs1SWJGRmZDQjZrSFR0eEJZTkJXc0FMalY5NnpCMnJMUUky?=
 =?utf-8?B?Ym5HRDZwUnFIdUdTZlNEU25UdU1mNDVhTmlOUTZpbEZ6RG5FdWFYcU5XVTA2?=
 =?utf-8?B?enJ1eHJpRks2c1htb1NxRXhLd1JYamNZYkpYSllLWEZCNjdDVk5ncWcwdVhy?=
 =?utf-8?B?N0IwNW1qSlNFa0Q4TGkzZ2E4T3k5RG52NjlLM1I0dUlpYmxHbXpyc1FoNVEx?=
 =?utf-8?B?d01BaHIwUVhSMVdFQktqWEYwbHBYeDR1STJWM2w2OS83T01rRzFUUzZoNERn?=
 =?utf-8?B?TkFIZjIvcHQ3VWIxSitlbDJDUUg3Qy94WTl2ZFN5dkQwVHNsMVpRTjc2QjZq?=
 =?utf-8?B?Y2tSMDNzczVOMnkzWW1wNnVsUC9pcVM1SHp4dHZqNCtZS1VOVG1FT0pWNGdQ?=
 =?utf-8?B?ampFTWZ3dWg0OG9mQ3h2TjdwQzVyWXE3UkVtVEY5RVVXMGdYNG04cFd5Y284?=
 =?utf-8?B?Tk9kVFMxME5CYnY0UFdDMzg3emZnZ1ZSYWkvamZNbjV0a3piM2I4Q1dsbERh?=
 =?utf-8?B?THBkNlBMZEtrWjVsam1HNkxYYzEwQjZLR1A3T3BaN2pDYWJlekdxK3BPVUVR?=
 =?utf-8?B?TVpsZUxCdElWQ25sKzVTT2dYNEhDWmRrRDJJL3NVekNqQW10K2lzazAreVli?=
 =?utf-8?B?Z2dYNFpjU2FRYlVJWUN5V0djQVdkRDY2amIvNGxxMlFTYUVONzNlR2JsYWxl?=
 =?utf-8?B?VkszRkJXZVU0RjAyTGZTTVQ5ZzZ6cXVydkxIM1g3MllVSDlKWjZLYTFlbkdG?=
 =?utf-8?B?eEhPN0ttZkg5UXRza1NuNm1iSjQ0VnhMcHdObWJic0k2eVBhUjBSYUY5K2lm?=
 =?utf-8?B?UFZTN0dUUWdqT1RoTWJRTjlMeGlla1gyODZ4RGZLT1UzN1IwOExFTHUySG5h?=
 =?utf-8?B?czRXVlROSkJKVWpPL290UUZMczlzL1o4WlAxaElrWUEzNkg0WmxzV3l5VFg3?=
 =?utf-8?B?UXdvNGhPMFBGYXlXbUM5cDRDbkpvdWJ2dUlGK2k3Z1V1NXlKUkU0ZVlTQmI1?=
 =?utf-8?B?MjlCdTk3OVhsZnM4d29aWE5QOTRZcGZXcGpIQTZ1M2pKdGtTQ0RrUjdRRk1T?=
 =?utf-8?B?RElacVR1L3hyQ3UxMktlYnpPSUg3bnYzeThtY2Q5cDVUTTlodkh0TmdONUJl?=
 =?utf-8?B?ZTJ0MnFlUnhDWGh4aGlSQlZQaGZSWmpPK3FHL2taWlRScG9qZUl5TWZ1aVJT?=
 =?utf-8?B?KzN5dHdGRTlDQjRkZFpaM2t1QzN4R3ZLOXppZ085Q210dHZwMjRISHpuN1B6?=
 =?utf-8?B?TXBCZURWemlRR1N0N0JtKzRkbmRETG5XcHNGeUdIbTd5REwwSDgwZVBEQ2ll?=
 =?utf-8?B?cWZLYzMwd2o3Z2g2MnBqTkd3clNOK1dtNlBxdStXR3VzSENiTGNxeWM5allF?=
 =?utf-8?B?cDZGbGtBQ1F5Y29pM0JUd2NidWV1VHBNZDdqaTIyZGIxOFJnTkQ1R3VYOGIv?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7da338f-b68a-4dee-ed2e-08dd157f4b78
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 22:51:02.9587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0RDDdml32V29JyaGI1CfPx1FuA+xZ4kOGjXeEzUJvFry0aHEGvJmRq4TgvE7xUvrAe9FuGcUFTZcoHPWkuzV7l+J8nosNCd2Z2lR9Uuoqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7859
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

On 12/5/2024 10:22, Lucas De Marchi wrote:
> Currently if there's 1 whitelisted register in the engine, on slot is
> written with that register and all the others are written to a sane
> value. For the free slots, there's no reason to change the behavior
> if there are 0, 1 or slots occupied. If the default value from HW is not
> trusted, all values should be written to.
>
> Also, later on all values are passed to GuC via ADS to be restored on
The values are not passed to GuC, only the register addresses. GuC does 
a read prior to reset and a write post reset of the registers to 
preserve their value at the point of reset. It does not blanket restore 
a fixed value set by the KMD at start of day.

John.

> engine reset, so make sure they are also written to when probing the
> device.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_reg_sr.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index c13123008e903..f982c1cdb369c 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -204,9 +204,6 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>   	unsigned int slot = 0;
>   	unsigned int fw_ref;
>   
> -	if (xa_empty(&sr->xa))
> -		return;
> -
>   	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);

