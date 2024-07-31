Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D551C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 19:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6A510E22D;
	Wed, 31 Jul 2024 19:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="haECL0fj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB3F10E22D
 for <Intel-Xe@lists.freedesktop.org>; Wed, 31 Jul 2024 19:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722455798; x=1753991798;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LveaNPEgu8HFn6RdBqL5Vz2/19fbhDdMAlIEQdCMJfc=;
 b=haECL0fjPAnCzKeFjdttWqqveRxNqn2RKYLW4H/Qv2jtPA+5pGi/XQk3
 4rPB77wPDDhIC6I953IlUbuoMq89Oa0sCJl6TpjEbFusAaUFfjQmtJlPM
 JBAf2LnIF2OqaU286gLuRBGhBQC2DuJzYL+mg1CO35fim6q7ntj5rl2ZA
 scjYBaTjkdMlj0TfKxXICmjoO1Qq3XIxTR2s9w1PqcQjnOWwfUXwJkKZo
 JqT9CYhKYNXjrt4ZNF1fvdmnb2G9RaGriqGdmj4W4gxxZigX/lqeA6SAn
 dSi7MnZ87XeAWuKaubs1Yg8c0ls2BhKqyGuTF/7ThZM7QUhA9Ro9eBFAd Q==;
X-CSE-ConnectionGUID: 10UGXo+nRpKInar0H2zgoQ==
X-CSE-MsgGUID: X7/y0lXhRRKKvoOn/up15g==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20308538"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20308538"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 12:56:37 -0700
X-CSE-ConnectionGUID: MB9taXegTVeocj6WFHwXbQ==
X-CSE-MsgGUID: egmSRkfdS2KtyqB5SrGabw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54686851"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 12:56:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 12:56:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 12:56:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 12:56:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aR69zaHQ7T4jNBkw4YCnlZNYCTQhh28a9583oi1fXvH41JcIidvAwHG3dM83EhomxXd4ba3wWTIjMJaY33rjwJnyvggN/ipvr/PVCVI+n96vVA3bQb0JHF+ZKrd2TYEn5pJeB7EqkDity60WRyrlElQ4sGIqsL7zr8z2P7kayWmHzaFlsiW3ZGNBfTUGwSjuqC9EpX6H2SG+DnseRxTKpU8nGGQ/qyRhQZsLw4HEomwNJfmt9uS53I13WvzWV3+8MPMm2TzbM489MZktA6r8Q+juxkWOn/o6JpNqWDUPyStBVdnrnn4/IV4Xoe6844CajRRHz1KfG7hhpX0ukics+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LWwIjdEwG4z6FjtBOLGkvKdRjaHYrk1QAh0MgtIsv0=;
 b=k+v6AzMXNo7KNgUBdVFWIaHETmfKr+3rvJVvcd4pvzgIcTo/iF2g/UMpssyaZTBOQq4kIDa6zEmk7O9DXKuqWuIuIAoLcXn6I/iieWG99QmFNi2+hqSJBexr6qjBSc5kkAzmeAJrvfoMGFAKG+4MXZI2dSI9BtVjmp2qZBFLxJGJ0GG539FeUo5HdSGPVqxVXnmYHZqhmDyicDb4GWq8pHp/XQdnGWfQzrLktlZY9RXgsWODTOY2scAsgJMBgcCqEucpO8ClpsZHRqelMLGMwNJgNtXPGLo6rv+u92LtGh9TWPxdEo/4PQAP6ZH8ryIJWuqSH3BMyGF0Xn063n83aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ0PR11MB5056.namprd11.prod.outlook.com (2603:10b6:a03:2d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.30; Wed, 31 Jul
 2024 19:56:33 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 19:56:33 +0000
Message-ID: <a9ef6254-f428-47b7-827d-82ec94408ca2@intel.com>
Date: Wed, 31 Jul 2024 12:56:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] drm/xe/guc: Remove spurious line feed in debug
 print
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>, "Souza, Jose" <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
 <20240729231753.3101070-2-John.C.Harrison@Intel.com>
 <9306b3ec-3999-468b-8395-dc3b7900ff6f@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <9306b3ec-3999-468b-8395-dc3b7900ff6f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0234.namprd04.prod.outlook.com
 (2603:10b6:303:87::29) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ0PR11MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a267592-73f2-4696-1b5f-08dcb19ae06b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHp2bUt0d1lFcjcrM0RtcDhEdjE1RjUxbjJXcGZPa0tJT0JHRXFwTnBPdDZh?=
 =?utf-8?B?T0NmNDhtZGZmdzk5NnpxWUhOQWl3V0U2VWtZQTB5aVpZYzh3N2N3WGpSSjVO?=
 =?utf-8?B?SGtkYk1lTm14U09DWGEvZ085YmNaYnVwKy9OZHdJMkFJTks1eXdyZkN6d1B5?=
 =?utf-8?B?alVPYmlFdklTcmhjWkpnQWQ5VlNvMmNPbWtPRVBLL0FQN1R6VTZCWGZ2YnFY?=
 =?utf-8?B?b1dlSTJ0TFNaQzJkK0lFeFMyNHJCcmtIOWxuQzhYbnA2UHdDTUtaQ1NXMnRk?=
 =?utf-8?B?UkkzTDFmdkYxSHJnYUxZYzNMNFJoc255SFROUkxOdFdBQXc2RC9LT2ZPTzRl?=
 =?utf-8?B?ZWxhTzdjZEJPenBPa2Q2aTMxWUY2cEpnOEpQZUtxVGt5dmpObnFPMUFvcStv?=
 =?utf-8?B?ZDE3dFlpQ3RDa3VIUnFkWkFPeDJpT29ncnlxQzd0dWxVRXNpYkZ3TDl1MXNH?=
 =?utf-8?B?Y2o1dVlldlM2dGRXL3JCWU1uREoxVFdjRm1WL0NUTnBONUJ3RDk4QTEvcXVi?=
 =?utf-8?B?ZTBMWmpJYUhIaXFkRURDMVh3UHlvMzhzSDJ0UzNNZTlyRFhwZkFOSnBRSHlY?=
 =?utf-8?B?andkYjFJVmtWZ0RGSDlwSjgvZ1NyclJ2ZmxiT01KaXJpZTFKcmZEVzlqN3lr?=
 =?utf-8?B?Sm9ZbnRRN013Z3FSSFlXWFFmdXZDM0VPR29CK2RtQUtuMFVZUTQrazZKenh5?=
 =?utf-8?B?NWJnM2hOR0FRQld1UFZCL09lYytxNEVGQ1ZpcHU3Z3BncjZqNUZOdTlQYUNv?=
 =?utf-8?B?OG9oQVdtMmpjOWdValBhVVhnNU1aSGJDQVBpZnZXaWk0M0NGWm1pS3pkNkFj?=
 =?utf-8?B?aVNKcnU5YkZXcDRPMTVYNUkrVjkxaStwVi9aODZIaSt2dFJMenlKYkFxU2Yy?=
 =?utf-8?B?bGZlbzVmYWFrcUdqVm1IdXhJbXR6UWJSREZOYytvbTBIUzg1dlN5Z3oydXAv?=
 =?utf-8?B?QVovaEgzY3NjcFN5Y2k1dFpleHJEWW0wN1NFYVhFWXpxbXBjeGZqc0tqKzRR?=
 =?utf-8?B?KzcxZ09QZzQ3Qm9TOWJVV2dyRUtyanpaVXZaZUFwbmp3WXpBTXd1bUpzMGZn?=
 =?utf-8?B?MjhXb3E4K0doU3FyL1ZtNFpRc1U4RVU0T0hGbk1VNlFXYW8xcGc1VFBCcE1p?=
 =?utf-8?B?UWIrRGUvdk04NkhER0NFeUZaM3l3K3pwQVdDbUozSDZYRVlZajBpN1NDTmZw?=
 =?utf-8?B?VjBHV3pyUDRJSkFweXRpemVEdkpXa0ozSUd3Vjh5UmVZN3A4aEdCbnYvdmVz?=
 =?utf-8?B?M1RMYlYxR3ZiV3VyUjVJY01EMWtWTGhweGdXN1Vra2FzT3dTaGhIOC9MM0lk?=
 =?utf-8?B?RFdYWUdsNHM0Y1hVK3I0RzNmT005bjh3SkRkUUxFOWM1eEZ0UjNvRm9MMDBw?=
 =?utf-8?B?RFlidWRKelJQT2JIMk1zSFVEVWhjcDU1elVrK2dVZUxWcnhFTTc5RHlvSnlL?=
 =?utf-8?B?VjZRdVp4ekcwTXR0U0o5YWY5S2pFM0JZN25KMUttUWMwZ2o3bGErMDVqU0Uw?=
 =?utf-8?B?cmtZNC9mbHlOMGR6NUp5eDZnNGFZVERTQkxRVWRJRGRkL1JmRGFhLytOWFJX?=
 =?utf-8?B?OVRaamExUjRwN1pJK0p6MkxWWDY4b1BPMzR1cTA3K3NDRUhEVjlYbzcrWmpa?=
 =?utf-8?B?TStwRDA5WkxFOUovcjh1RWZQV3AycTlseXdXMkhWM2hrLzBPTW1kWTNDZG52?=
 =?utf-8?B?ZTJlSlE0VnVrOUIwQnlVaHlkd2gzRytVTCtFVlJhSnozTENDYkhLcVFaOVJq?=
 =?utf-8?Q?J7cL+47804Q/5tWWYE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2p2dmFPV2w4N01KNzFIRmplVVV2VXh5WTVFQ2tMajFzejg5MVN0am1nZVNU?=
 =?utf-8?B?WWNES0NsWE5jVk52Nk9scThJcjdJbmpLc2owUkx2WTQyZFZKa2J6aGM2QUp3?=
 =?utf-8?B?VnlSQzFjeXV3NXg1ZHU1dWQxTng0RlljbEY3c0pSVXNWM1ZpZi91OG1JaklR?=
 =?utf-8?B?SjBMRmg2Mkk5TW5wZkc0Mkh2YTAxUHdFWGZ1SkY5MEh5QlQxVHlsVnoyekpl?=
 =?utf-8?B?UFkyZnI2dERKMldaQVlvcW9EQTN6MElxV3cwZUZtSy9wakNKN0N5MjlXYlM3?=
 =?utf-8?B?d0o1Qno3ekYrUkVmQWJtVTJoZFFnb0hpQTJqR3ZSQ3QxWWhQa0FEcTNnOGxB?=
 =?utf-8?B?YTBJTG0vVHhGUGQ5NWlJNU9UbUVtazRGeStzT1UyZDc1VVFBeHpId2xhaVRC?=
 =?utf-8?B?MHRpR1JwRXFzeXYrRTBxQXlSWFUwVHBjZk43V2xpQTl1anBaSFh5b1VqSXlP?=
 =?utf-8?B?OUFaNFFCb1BUTmFtdkt3Q1NKdlk4dmZyMjVGeUhoU2JuVWp3Tng2R1dTN0F6?=
 =?utf-8?B?TEpjVmc4ZzNUM1ROcXkxWmJIeGlZMEZqOHRXcFpISGhHQVN5b0g1VHpmTnpE?=
 =?utf-8?B?WHdpem9RVkg1eUs5RE50TGIrOW1LUDFwR2RrSkNVbldXQU9YQVRYYTdRM0Ns?=
 =?utf-8?B?Mm45cENpVVpSVm11aHJleWxFN3dtbHhjcHZUYUFRTzVzeU5CYm10Zk0yNFFk?=
 =?utf-8?B?d2pzbHpJNTNOYkFnamF4NWhIdE5mbnR1Y1lHVThOMUtiN2pHK01sR1lVakFu?=
 =?utf-8?B?RHM2V1hwUkduRndzb0hIdHNpNVpZa1V3NGl4V0xMMUxXNmhkZCt0N1RmMmx0?=
 =?utf-8?B?MmdmTUhwME9XTFFIY2Zmdml0VC9Rak5LcnRXTWlUSXB6WVdUT25ZYWVvRjJv?=
 =?utf-8?B?WGQ3S1BDRGMyRm54TkZ0V0U4bmxIdlVUaWtSMzB1N2RzM3NGYjNGRTFBbVpE?=
 =?utf-8?B?N21ZSGN3Rk5jTURaUmcrZkhxMXc3Sk1ISHNYN2diei9iZk51dnBHYzFnaGlq?=
 =?utf-8?B?UlR1M2hBQTZRZ1ZzVjBRVlFaOVhVZjJvaUhFVFBHZjNmUEhXZUdhTWRKK0Jl?=
 =?utf-8?B?QWEwQ0Yrb3FQbU5wR1A0ZFBYd1g3YUY3eGdjVm1ueFg4MWJ1OE5KNytzbzNY?=
 =?utf-8?B?MlJpc3hIQ0F1c1JZNGc2bStmRUlPUFljTXhtcDZ5ZERhdTJuQmZIdTJVd2ZJ?=
 =?utf-8?B?NmI1TitESGUwNUV6MzhXVkxFYWFtNHJ6Q1ptbjhramFwNEV1V3ZKQ3NJVGla?=
 =?utf-8?B?RFVZaFJTdEJicGEzM3J3dzRINXBqbHUrd1VXSXZTUEZaTnRyK2wwREErRlU1?=
 =?utf-8?B?cStPVE8rK0hRY2NMZmtnckxmTnk3N0ljWWhVMC85RHFoRUNrQ0xLUGJwYXBu?=
 =?utf-8?B?Z1MvR3FGQnlJNk1oQ1Y3R0RRQXhwdnFWbGNmMHNzMHpVVmczN2xhWTdOWmRz?=
 =?utf-8?B?eTloUjRlaWVneEV5aDZKK1BEOU40Unp5clphY3BCODlzWkdwRnluMzYwQzBW?=
 =?utf-8?B?U3A4bW9XUi8xL1NwOVByVTJ2RUpVSWZyT1cvSncwZVVZdklINitkRVJXOEs1?=
 =?utf-8?B?SFlIcUVoMzNock9wYnQ2NS8weW55QmtWSW5FMWRrSWg1MVE5VjYrTmdGVEFQ?=
 =?utf-8?B?Wndpd0RzS2k4OUdSN3k2YzJYR0lldU9ENjJGUGpCb2NWZUU0VHNiNXUydFRO?=
 =?utf-8?B?S0w2b3dlSTZuYVdyNTZxR1U4a2VhWDNqenE3TjBvMzZGQ0oyTG1YZG1PTjZO?=
 =?utf-8?B?QUNDRUJOaUtmUGJTdFVKelhWWEsweTc5M3FVQTZqeklaSkdFQ2pJK3QyTVJV?=
 =?utf-8?B?Qi9ZMTFybFhCWm81QWh2aG5NUWhySi9JQy8xSGl4aWVCYXBZLzZmeDI1KytO?=
 =?utf-8?B?K2NvSmF1UW9qTVhoR1QwNys0d3cwM29OQldiNE11d0dVd202UlR2YTV2akRs?=
 =?utf-8?B?SFd6WG4wb2c4Vm1SWUhFUUVWckw5Q2V3S2wwZFo1U1RSdzQ4OFhFd0tsc3Uw?=
 =?utf-8?B?SWFHaGVqVzV4SzlLbHByV3dyUHVxUjlMM256V0V2SzJFTURPUjFoa3U3VWVU?=
 =?utf-8?B?T0F1SERMbXNPTUhIQzB3L3lUL0FmbnFJTUpvUGZxWVJZZ3hzZ1NCWXY3S0V1?=
 =?utf-8?B?N2lWcEZ6RWdMOWFYWWlWNkNiRlBhaFpMbTZuL1lxWjRrQ0dsdE5Qc3U0SWxO?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a267592-73f2-4696-1b5f-08dcb19ae06b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 19:56:32.9822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhIfyRLlpu/XJ7iv5IfVlu87nnvrvnZnHKJ636p+N6MgT9jd0/7EEhYSN4kuj3katXVAW9ebLrX20ftv5m3Dm4lEWHtYkMOblzMLWJC64IA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5056
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

On 7/30/2024 02:14, Michal Wajdeczko wrote:
>
> On 30.07.2024 01:17, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Including line feeds at the start of a debug print messes up the
>> output when sent to dmesg. The break actually appears between all the
>> usefu
> typo
>
>> prefix information and the actual string being printed. In this
>> case, each block of data has a very clear start line and an extra
>> delimeter is really not necessary. So don't do it.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> there was some discussion about merging this one without a conclusion
>
> [1] https://patchwork.freedesktop.org/patch/601018/?series=135447&rev=1
The last comment was for Mesa people to shout if it would be a problem 
and no-one shouted, so...

However, I would strongly argue that devcoredump exact layout and 
content cannot be considered UABI because it is going to change as the 
driver changes. Some of the information being printed is internal driver 
state. Driver internals can never be UABI. If there are userland tools 
parsing the dump then those tools have to be able to adapt to changing 
core dump formats. There is also the argument that we are still in 
force-probe so there is no fixed UABI yet anyway. So now is the time to 
get the formatting as good as possible before officially going live.

John.


>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index beeeb120d1fc..422c3f5c87d8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1515,7 +1515,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>>   		drm_puts(p, "H2G CTB (all sizes in DW):\n");
>>   		guc_ctb_snapshot_print(&snapshot->h2g, p);
>>   
>> -		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
>> +		drm_puts(p, "G2H CTB (all sizes in DW):\n");
>>   		guc_ctb_snapshot_print(&snapshot->g2h, p);
>>   
>>   		drm_printf(p, "\tg2h outstanding: %d\n",

