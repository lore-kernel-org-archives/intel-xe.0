Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC35E77181
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 19:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B674B10E525;
	Mon,  9 Dec 2024 19:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hicQpFBj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750F610E1C4;
 Mon,  9 Dec 2024 19:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733772018; x=1765308018;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U/qA1DGfpq3nFtXzdn3IdL1/QLRIWikBmCvvFbjpbw8=;
 b=hicQpFBj8ol0/MEyXq5wSGeqqQRF4XlfwWI8VA9Z5cA7UgVqMUIcHlyK
 tyWst1z/PsKN7uTGovIWkpBwfbRL8bC8X2KDxWF5jChJ3mRfNYZh1GQc9
 8DgB3XU2m8AXK+zOErPJo9L4qWgdJQ9skPzuDzMQmaKG00Pq5a+P30bRy
 dzUNZrZYUt4Hu1+BWJqQAHK44a9Rt+GfPinzdeMJkhc088SNl7w0nTVLG
 wCBI9pr8pimRz47pfycC+Fo1JHcY0swzEFXrgFwu7RKpGovRPc2MW+sRq
 hx46nzljGNncdU3SHARNLLlmXWk4ikmat/MJLDWfQwua2fpoanBPhV6Aq g==;
X-CSE-ConnectionGUID: pSR48GdkRvOy7MEi7+dqFQ==
X-CSE-MsgGUID: ifOlibkyQ1W35EyTq/PDLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33431120"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="33431120"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 11:20:17 -0800
X-CSE-ConnectionGUID: WubnH46nS9CVqGt3gdgJVA==
X-CSE-MsgGUID: J+cK4qWaTQq1XsOUw3M9Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="99980473"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 11:20:17 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 11:20:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 11:20:16 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 11:20:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6WtlKaHf8exjsKdtuQxb+jm/tOscFe8KjZtnTDbKm5UOPY1Jtb3LdFrWMGUUeZvMR1GVzGQOcoWe2vKC8oD/6aXN8YlD/JonKcVuaKdGEnMCZKV7VaK5Ik16/MBW2of4HvLdkEbeaML8fln9OjErPmVF4h1TytWvsGiBhjjeuX/1noyU7TabBmJQ069YC6JcmzVnGtjDGZS6VjzPKM3vKFDGAEYEu8lu+oIC1LxIz84SHTJptEiLIxXB5yaRMLKV1eDR9HTmUnNA+hlqicgWwUG+jFioYdOIxRMEShg49MIzfHJlGfdQEq9z6p+AO9pqllHv693joC+JlL2Us+u/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jnrvJa5OPCKracav7hm8Ff+C9QXA99T570QleEqz8w=;
 b=opUKypVxDW/9F/k+tpsar+44MOUZEtRpTnB9KZbrtUzucFohhf3vz9BaDqd14+ffAodZqxDxkMyZafT2rMRfwOLbzHx3Vl46RWVLeUnqDMnlWFn6B3qgH40SiFtrb2JUfopmPmNZJAMFEOEH4tPhBQ+1v68Bwld6cRTcpSDWxwuPquxCgIkBC30ZtU1ZMDQd/HYPCP0LpBCODpv+cZ8MXGMtTm9qmTbkq5qltN+KvkxJU/6gDTfeO6eG9mT36hwnNgHaPZZS96UGZGZXCklPydudcYyAVKl6bdD69WQT7kx3rxjOfz3aa3EVEK0hz7UjJO5xq0D59TSKff2k2fYG5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA3PR11MB8003.namprd11.prod.outlook.com (2603:10b6:806:2f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 19:20:13 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 19:20:13 +0000
Message-ID: <60c6f1d7-6bee-40fa-9f7b-8f138b3a3501@intel.com>
Date: Mon, 9 Dec 2024 11:20:07 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] lib/xe: set hwconfig NULL for unsupported platforms
To: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Jan Maslak <jan.maslak@intel.com>
References: <20241209085709.1979242-1-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241209085709.1979242-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:303:8f::23) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA3PR11MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c99974d-1e82-45ff-8f0d-08dd18868176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVFkOWp1RlM5cHMyZnhJb0FWc3pJNEVQNzM1OHoyT2RRQWFEWjN2ZncrN0VP?=
 =?utf-8?B?UWZZbW9zK3FhWHJFUXcvWEI1QjNqV2ZNMkRLaStQR3ZnM0RpVDNsM0RJY0ov?=
 =?utf-8?B?a2F3bVFOMWJVVzJZMHFkbXlNb3BaSmx0c0J6QVM0dWNqUFJnam1GbzRSVmdj?=
 =?utf-8?B?QjM0UmxOQkQvTnRPbG1wQ3pQc1RkTmk5cFc1b204NXJwdlRoUllwV1pmaDF3?=
 =?utf-8?B?RDZwU3M1cHR6MXBmaWlqek1GS2s2VUpnQno1U0JTNHVkWHM0eWtUUklHRE0y?=
 =?utf-8?B?bGFrNnVtYnhmc3h6bXdmY0E0bWs5SG1FanQ1NU40SEJPeSswa0NUTmx1SUFm?=
 =?utf-8?B?VGpOTFA3N1RSNTRmRDBHZ2ZsZG1LYXZHNVV3c2QxQ21xb3o5bnB4bWhtTVpy?=
 =?utf-8?B?V0N6eUpMaFBkR0ZrOVcrNHdRSDU1M3RvNG5rV3pWd2lnUC9HeXVrUzh5QXE2?=
 =?utf-8?B?R1NXM1p1S2RRaGFFTzZ1Wko3bUs4UkZBSTdzWm9EUnlGWWVreVp3c2Y2bjFt?=
 =?utf-8?B?Rkt5UDllNStjVFF4bGZOQ0E0UEdjelEyR3BBSDRYcUtTTFlKbnlDTFNhcEh3?=
 =?utf-8?B?eVZKVndXdERIdDA0SU5md3RRUUI4dzlpK0VSNWRYSVFBWlpDbFpVMUNqNmlq?=
 =?utf-8?B?bWJLZ3FYY3JtQXRIRitneThhWE9zbUtsdWc3YWhzSFNTalRJdllRT3VqS2Js?=
 =?utf-8?B?c0tSZytHcVprNnRCU2FyTFJsK1ZrNWcrWGowcFZjcFJRQjcwQVZtclJOcVF3?=
 =?utf-8?B?YllzcnBOZkFFdFZSeWdxc1pTdFNOMnkxemEyMjROWnNYZ3NBOUg4NFM3MHRC?=
 =?utf-8?B?Zm9ISnpsY1RPeldmSWhuQUEwNUNVT1RzNko3OEQ3NzdpaHJqUEF6MTFVSzcr?=
 =?utf-8?B?MTUzUzY3d0FEb0NsV0daV2FsVTdKdXVTaTFjMHJlWkhVb2dZZEMwL2ROcGJO?=
 =?utf-8?B?MjVvZGhCZ2hmOVluN2tDY0pnL1lpdjJkVkJacW9IWnpkODlGcGJvU0JROFMz?=
 =?utf-8?B?OUwxS0docUo1anhvSEdKWHBIQXg1THlMejlTN09Gak90RHNLQnRFNE1VTW9t?=
 =?utf-8?B?VklkdVpJVmNhNWdXMS9ON2dGVkh2WVpGdG9tYmpGNTd3ZUtOVkZ0ZmIzOWVk?=
 =?utf-8?B?VTByWU5aVk5xVnpXZThGZ1lYSzNodnNTM0M0SHp3aXJqNFlESnpPYUJlSStk?=
 =?utf-8?B?S1VuRWlObFlkSzNGWDZRVW4xY2RvUm9zM1hsWWMrS2xQdDM4RWo4RWtXem5p?=
 =?utf-8?B?Zkc2cE1PZG5wb3NVMWt4aUp2cmloVEg3NmkvSkJNaHU3ZkhnMVJQQndid3Fx?=
 =?utf-8?B?cXFYb0FmbmdvM1BOT1lGQ2NoajlvVjRaWlEyQ2VpN0Rqc0swb2YrWG11d0ZQ?=
 =?utf-8?B?M2J0ZENLUXQ5Y3JuL09zQmJPdy9FQ1VFdzNIdlJnRGlCcitLZ0ZGWWdlMTlD?=
 =?utf-8?B?eDBOU25lcDhSYy9ZTUpBUlNhdk1RNjhmT1F2WEQ1MnMyVEhzRklDYmR6ZUxL?=
 =?utf-8?B?SFBLRVpxN3FTMXAzZFRpZTRXblptd1Q1ZmpPWE85TWpJNGt0bkRoYmd3U1Iy?=
 =?utf-8?B?NW5IT0s0SlJkMmxpbExMaUxubTdjMlhUS3czRTE2dEZLRDVQZmFtVHIrQXdr?=
 =?utf-8?B?UE5vcmVOMFllTU5ialg0TEx6Um1lVjRkVGpZYWgzMFY0WE5BSGcrSW1IQk5G?=
 =?utf-8?B?ZTR3YWRFN2pYc1VCcy93VmZqcExlSjZNYUV1a2NXRkFhRFZIcHRMOTkvOTFH?=
 =?utf-8?Q?92v+c5Khqd2Hv6/BPY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekRNUmQ2KytTVDFTVGg3Q2NkdlZxeDE1ZUN1ZkozVi8vZGJRSHU3YjRhMW9j?=
 =?utf-8?B?RGxkQ1M0Qk95MjhTbEVWcVRPMWpWcmlSdzRjZ2E1OHBNRU1IL0pPcDhtRXI0?=
 =?utf-8?B?dS9NeklPYmZwcHVVMHhyNUd3U3Fsdm13cmRtaldTamh1TCtMUThVTDlUQlB4?=
 =?utf-8?B?QTRKd2x5UUJpTi8vVndlaVFoR1pzMk9RbFdmdXp3VS9xREJYLzhrWnRqYUlU?=
 =?utf-8?B?Ty85M1hsTnlRN01JL2RUL1pJNG1YdDJsdElvY04xWTNuK0E4aFVRMHdYaFJQ?=
 =?utf-8?B?WXpOd3l4MUJ5c0hxelR4dHY4NHl1K2d2dDR0VWhnL3BpaStOelJiaFlMVE0y?=
 =?utf-8?B?MFNkNDljZXZVMFBlQUNXd2RkZlZSVkN1R1J4U2g4OFZxcDBmMWd0VFNGVks1?=
 =?utf-8?B?RHdCdkdUSDdzM3ZEVEF5RjZRZlF0NE8wRXBwQjZtY1dkN1hKMjFKbTJQaDgw?=
 =?utf-8?B?aW1tVEJtenA2R1cyc1FkZUIxQ1pNQjdzSU1UWFBjVDM1UU1zTGp2SHlSWGxH?=
 =?utf-8?B?TG9BRldpc2l2SU0rSEtjMllXMVJndmttQW5qWjhWY1JuYnVRa3F6ZFF1eHZJ?=
 =?utf-8?B?ZWRFQWNCdUZVdEdIQ2RTYTQ2U1cwYVM5Q0I5TVYyWVBZZkxHN3V5RWxZZDFj?=
 =?utf-8?B?S0xxemJCOVRwSFZRVWZNM29JaXRuL3VzTFpFK0dKcG9QbnhKeWcwNDFpc3ZC?=
 =?utf-8?B?ZkgrTk00ajZoTG1zOFlmeHVGcktSeHRZZHlYTUtCdmtZbGN5R3lvZmx5bWxB?=
 =?utf-8?B?c0dVMG1INkJ1UVR3enp0ek8vSVV4VXlTUzBWZVlaM1J3QjNzTnhiNGNEV3dk?=
 =?utf-8?B?cEg2MUhGYnlTY1UvN2dJd21pZ3pJaEQ0UWsyVnlBSElFQ3lUSG1KR0tOdWx4?=
 =?utf-8?B?dGVJMEIrQUN6NWVJdzZaNzZ3SjQrZGMwcGZZOHF0WEZxd1JtQ3A2eDBpc3Zv?=
 =?utf-8?B?MDBvSGJGd29lTlptbkQyeGFIRG1pVmtFTDVjWmFlcFdPUnhzd1MvN0h5Mmdi?=
 =?utf-8?B?M09QeUxQZWlNQ0VRbUZPMEorZDFwTXlGbG5wbDNNREltRko5Z2o1VUFUWHpH?=
 =?utf-8?B?MHcrY3htU0YyL0UwamFTT2lXYWlPZWwrNnpNVmJ0N3dXd3NQL3cxWS95YUYv?=
 =?utf-8?B?UEFIUXZqT3NtOHo0ZTVjOFhPVGNkVStScFJVOHVOS0RHUVQyWlFPOXozTlpY?=
 =?utf-8?B?OWhQQkRXMlJPYmlVMm1aRXZsMnhjSkZoRy9kZmx5Sk1LM04vN0VibGM4a3Rh?=
 =?utf-8?B?RWZqdFV3bEJhdFEvclpqRE5uaDFQbUhvZjlXUjkrR2wwQ0dheDRIV2s5THps?=
 =?utf-8?B?ajJYQ1FjTlhWQjVqWXlIM1BldUFBbTlYa1J0UWNVNjNrSnN4Qk9Pb3VjNE5H?=
 =?utf-8?B?YktyT0I5WUs5YzdpMEUwTDgyUS85UE0wZ25wa1BzZFBpWEwxdzNMNGlDYldS?=
 =?utf-8?B?OEhvV3p6ek1DbWliUjdQb0dURW5lVDVQS0twSHhuVURMdnFrcUpXU1RtUzNj?=
 =?utf-8?B?V0RmVEkzYm9kNlk3RG9KYkl2bU5XRlpvYThzaXUrQXlGL3VsM200bk9UTER2?=
 =?utf-8?B?dVlUZ0dvb2U3Tm51RHpURG1Cd2hHMVNUTVB6NW5WQngwQUNKMlNwOGU1VXFB?=
 =?utf-8?B?bzNUVlpUc29nQXhhbXBCdklIU3ZWNHUxNlVQZUxzNFAreE1aanFUelJjbmY4?=
 =?utf-8?B?ZW5KMVUxbVhTcW1rQlhxcGVINWVOTjFVQVJmSldFN1pxQkVHVEVSMk9xQlNW?=
 =?utf-8?B?TWluYXFkRnZadnBqcEdhL005akd6Tzh3YTZyTVRmQmVPMzJFZHdOZjhUckJo?=
 =?utf-8?B?RENSd3E5eUZxWllDenJkaURpNS8ra2o3R3IxM0dCR3lPbUZaZUlFQlFJeVNN?=
 =?utf-8?B?TUs0MXpKbE5ZdVN6YUJTejNaRklyMklJbmxpZk9IMkU4anVYcENwcDJ3ZGJ1?=
 =?utf-8?B?c2hsSmZHY2tOTHpLc0h0MlZZN1Ywa2IxSHE3Q2g2R2M5d3Z0WGF6RnE4R29w?=
 =?utf-8?B?Yng3dnNuVC9QdUtlZWZEWFdiSUhBNFRRME84QUhjUHlnZ0VsZ1kxTEkwdWxI?=
 =?utf-8?B?K0tGUDlUY3JNYk9POXRHQVVGUURJSFJkdHVCcFY1eHRENUVVbGZLNnd5TnJM?=
 =?utf-8?B?UGtiSjZ4Ry9OM25oekJwa3dTZ1FGajdPcEt0ZDczWmxsY0dzb0U1UG9IdFVy?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c99974d-1e82-45ff-8f0d-08dd18868176
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 19:20:13.5405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PS+KCEgB2hofycgBchuZo2iJJq0N3tiGV7+KmXfGMictWs4tQzzWn0E8FGCK7hEnnmhlvutfhiCwUrGzZLEIGvwCXVWiThjv2ILwm4UAFpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8003
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

On 12/9/2024 00:57, Tejas Upadhyay wrote:
> There are hardware platforms which are not supporting
> hwconfig table, for example ADLS. Querying hwconfig
> on unsupported platforms leads to assert and failure
> for some of tests like,
> ./build/tests/xe_module_load --r load
The module reload test should not be querying the hwconfig table?!

But the hwconfig test itself should be failing on platforms which do not 
have a table. That is intentional. There is no platform which is POR for 
the Xe driver which does not support hwconfig tables. So the test is 
supposed to fail if it ever does not get a valid table.

John.

>
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3683
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jan Maslak <jan.maslak@intel.com>
> Fixes: 37a230e50 ("lib/xe_query: add hwconfig to xe_device")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   lib/xe/xe_query.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index f3731d9d3..8f0a5392c 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -51,7 +51,8 @@ static uint32_t *xe_query_hwconfig_new(int fd, uint32_t *hwconfig_size)
>   
>   	/* Perform the initial query to get the size */
>   	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -	igt_assert_neq(query.size, 0);
> +	if (!query.size)
> +		return NULL;
>   
>   	hwconfig = malloc(query.size);
>   	igt_assert(hwconfig);
> @@ -858,7 +859,8 @@ uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32
>   	igt_assert(xe_dev);
>   
>   	hwconfig = xe_dev->hwconfig;
> -	igt_assert(hwconfig);
> +	if (!hwconfig)
> +		return NULL;
>   
>   	/* Extract the value from the hwconfig */
>   	pos = 0;

