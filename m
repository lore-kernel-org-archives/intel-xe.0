Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55174F588C1
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 12:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1293D10E206;
	Mon, 20 Apr 2026 12:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFoaZfRQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FFD10E206
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 12:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776687644; x=1808223644;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vNV1SBiHF948knkT1LKePoyVYO+j5YB0ERPsTfHm7+U=;
 b=AFoaZfRQVaoMvP9PpMFNzXltpuZwJe4u1SotsxJq2G35d+X1eTbqkSMm
 B9srS0fKa+8aDu3DQaNc7hi+iGLuWUgnCD5bAlAjNNxwmoH2Yr2y0wXo4
 +pAmFsijIHJaVhuA9KWiwSHvdTddlvB1J/MQvQYXLuIqobbLnw+GE/fKX
 hFcZXw32UV5NhwwmsQeMObnAWtE475BEMZ8LNchaANiSw99N0eBan9Mlk
 48bZ4gCcfmhpxiLdVDO1oB8FzVROu1vvx/2Y2qeMTDRRruhqkgncnTBt/
 gqeSpjyVmYj2dbdCerjgEj0QonA9cf1ahCXu2YfgKgxRomPNpVo72LAOj w==;
X-CSE-ConnectionGUID: sqrEnGXWRC20gjD3bbQp7g==
X-CSE-MsgGUID: rk9S62hnRoOY0UXOvEKusA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89068110"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="89068110"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 05:20:33 -0700
X-CSE-ConnectionGUID: TB7yy6bGSWSdtvHOMda0gg==
X-CSE-MsgGUID: zeJLCzcwQUyNKPpz9tf7hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="230669457"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 05:20:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 05:20:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 05:20:32 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 05:20:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bY7ACNkdyB1U77E+SmnlY3pvuVUXEYYkv2YVjsTXo6F9ZxX75Cg3xiIE/UvCc0zbZaoAvVDRhWQr1U/9m+hy/UXOrXsl+AZK0or5FK4uhB/9wDzVg7bvVKQpXsDS6VzOz1/1XXWf3MzhQMUEwrqdYYGFUp6pp7WAYR375E4lr+tp2q9pUQM2n4rMP7bukL4rpdfdRvcnFtERpzyjrd2GgLHOwaxyvwKN41zv0AfI+WCe2gwyIKsK7FC4hPzHN6HChxzQzaCQvdyXqBCnem4bqRKo6gv8rvchs8md57agqMmU9Mkqba7T1yOquUvBN/U26Wr+LVFhW4y2QZgdmqmWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8Z5ZF+3o4F5K/y8F0+rzpWulg+fRBhur1AAiJ3J12o=;
 b=XU7Sib8vByLahOvv6cEngMlkWDfTU+4oMNRftzdyEHPabdspDhqokVjRbdgG+Lp4BaAovDp71/j88R+HOV9nh+ZAImTky9cB2eBOyWb1gRI78rtPs6LePGGXAbBYq26BETUte1yGEO5ovu2oE5+SQaOyxwBERyvEFNHo/oeLv10vIbQS1bxK0fWjN1kYoonV0ZuCmbqWe7BZ1z8IP9154Mv/uJnR/6ZsSKZMIuDYVBnX6esWtCQY5A1D7+0qVYu3PACmxUCpfYPWWKQQNH7I0+fsLoVRV08PTx34R0igpiKO/JwESdzVbpYNMh6bF0bf4S3iUgR9L127fzP9noK6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by SA1PR11MB6989.namprd11.prod.outlook.com (2603:10b6:806:2be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 12:20:27 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%6]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 12:20:27 +0000
Message-ID: <c81153b6-5f29-4d19-9352-2c135321c0af@intel.com>
Date: Mon, 20 Apr 2026 17:50:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Convert stolen memory over to ttm_range_manager
To: Matthew Auld <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20260416151935.388354-2-sanjay.kumar.yadav@intel.com>
 <eb06fdbd-7fe7-4030-9de5-6f6a04473924@linux.intel.com>
 <961ca0c1-30e0-4b9f-81ff-e9899bc5950a@intel.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <961ca0c1-30e0-4b9f-81ff-e9899bc5950a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0070.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::9) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|SA1PR11MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: cd5d98f2-c925-4167-e922-08de9ed73421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: rQ//d3FZWSiafbJn9yITX0oIch5PAycm7dofUK+wT66MD+1moPhbgYyfV4gi9nj5H37sFhq7QADdYZaxrgPUZrcw8eLOG2VzAomxZTnylmDl6j+CTB69QjP7I4mAOaWTg40cp2O6VBOPmCPKL2bgaYxPlr1rsZlv+kGFVu2cBM5OtQOZ+WG8RsZgRz49/N70V2bRns7gueBdpSjI9oc4dUhlTkP6uI5MCqeFkcKuwdr1K4QVq9vo/sSgnIbaTZzBA1V7mtAKkovpclNI2XqScF4JCS7Q6+bVEMAEp7mH5MahjPJKq1KOO9BfY1XwMKLWnPFJ3Wk4zHtViG0bGu5yntgvpu/wdQYvWoKjm9/Bl824cGUXpY0e5/qM6SxJaYV17lPr/S9KF3Oiclhx3ZZTO7Yy5aEQsVtzGNl4dL5mzRQvN8D1vb33u/rld5gTgFbA87mHD4HiRmXBa1rGqSGmMdMI9Tw5DDTARziI/Q7kFvZPf+95XH7RUKXRGcZW2k3yYAZ1WzeYqFYQNBKfoUXbXYQBaKXAXC065UsnocP/RPdcWUcg4hUXj+isplvFzqWrJwiIkSj2YyLkTpTNTdKG7Zd+DBn2oqRXW6OSrcynCYCElcuXJ3IcKBw2IFVjbi60BZVBFQknJY4rbVVsNt0J61sjpJJqSuEEGFUsL8WGoAlh9exDcd7/gUrKvkADQKan
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmZjRGlrT2xjbTF4Qm53RmlkVG56UFA0YTFGaEM0UDZoWnB1T3lFckRUVzRv?=
 =?utf-8?B?VXN2dVJFajRwaEFVWUNVL2lDUER2U1VJci84bzJpMi9PVEc5Z1U4eitEQk9B?=
 =?utf-8?B?cWErZHNrN0pKZG5FMXJIQnFuRGxkZVM0M2pTR1VNdkFiN1UyTTVVRlJYcXE5?=
 =?utf-8?B?OUYrTDNmZkpzcmdWRERUU0dWL09XOFdyY0FvSWczblBxU053ZlN5bVFocmMz?=
 =?utf-8?B?SUVVajZadVdTQTBSZ3UwMFZkbk5ubEpNTWR6ZTU0MHRmOUNXMTNuNEIyMk01?=
 =?utf-8?B?YXFXUjhDMzVBZ2hDOWZzeWJUcWF5THg1MnRxSStHMXVYOHFpRFRPV2hVc3Nz?=
 =?utf-8?B?K3dnUzQ1bmU2dmR5WlRkcDYzeDZ3c2hnRkVBTjFUM3N2UmpITUxXaEd0TThm?=
 =?utf-8?B?RHRPRzk3VTJiN2Y1VDluSU9hTXhuclUzVnVJcit1REFDT29GWXNTaXg0M1NC?=
 =?utf-8?B?NHNndG9va0Rzanlxam92NzV5Q3I1RHZ0QnU2UjE3UUpxNWNUc1YvamY0ZFNh?=
 =?utf-8?B?YnJnbVR6eENVbGVRSm9KNU1oc1Q4RGEzeW5WdTlsTndYeVB0L0VoaWlpVks1?=
 =?utf-8?B?dTAvVktIN0ExK04wc280TmcxTzRiRDJ0c0R2M01CVWRaT1ZQTkxwQThmNS8r?=
 =?utf-8?B?eUR5VVptQndyZFlNcG95MEptNmkzaEdWR0JocC9mOW9yZFUzSXNwbHQ0cEFz?=
 =?utf-8?B?NHRvOHpKTGc3WEpqZXJQbUwzL2NVL3BpcE1tSGJoSjZ1eWwwQWdSNFo2WlQ2?=
 =?utf-8?B?NUR3azQvUkljd2N4a3Y3NEhHY0JrbkVTMUQ4OHFpNXdxQlB3cVFjR3lzVFRj?=
 =?utf-8?B?a2YvOHgxUzBRTDJlSlFRYjdHMnVrZXRHN3VPU1lXak1PeWZ5U0hGbEpVZ3hL?=
 =?utf-8?B?K3NYb1pkblVmOFk3MlJENkJvWmxmTENJbjQ3U0dINlI2ZGxyMnEzbWtPRTVZ?=
 =?utf-8?B?VDkyQzBFYlVrUGZ2UGloWUgzSzlJZ0ZMaXJPRzdhNVhEbFRHdnN1a3pXdm9D?=
 =?utf-8?B?YkpkSDJtOGE5UFBCd0ZrTHg2M0M1QW1TNFdaZ2tMQVhuempYRlhFZzJVNnZ6?=
 =?utf-8?B?YmFsazZveVVndkJ3SDhTVElTN1VxZmtNL1pJaHo4RlcyMWxoWUFWNldwVXhv?=
 =?utf-8?B?T2lDNndrVmN4TnYwSEYrUTVGZ1NOZFJaRUxuVGFEL2lpWlBlQkR0VklFWkJ6?=
 =?utf-8?B?Nld2dTNNL3MyVTJHaFJxNUd6d1JZeUNIWFV5VjZZek1jZ2N6N2w0aHdUVUlQ?=
 =?utf-8?B?QmNxd2crdFlNR1VZNmVYS01BQzk5K0VkWUw4Ri9uT2U4V0pDN2kzSUhlY29C?=
 =?utf-8?B?dHI3bHhtb09uQzBmUGVXcVJRaDEyRThZRFhZdGFjRlpqaG44SHkwUFduczNn?=
 =?utf-8?B?THEwdFpHTDhwYmFmWENqR1R6Y0d4UWUvTmowcGg4VHBRNkdqakRoZVNHdExw?=
 =?utf-8?B?YnBVclRpamUzdTVMYThTOGRTUlFKV0lnYXcvR1pYenJCSVBkaWtNNkh0M2Fo?=
 =?utf-8?B?anJYS3ZiQWJsZ0hoWTdZYkZrb0E1L0xIMkpJVGVvblQwZTZTOHErUW0wbU9Y?=
 =?utf-8?B?VEhRenhoeEZza1Nna3BDTzlEb1Yxd1ZhV0VvZGZSVEo2TWdEZ096dVhMam8z?=
 =?utf-8?B?aUxqVFVUZFo4TDRHeFM3enFSVndVSTdwN1prbGtQZUxneTMrS2hEQlBoMHRy?=
 =?utf-8?B?RkNXMlpGcjBybm01eU0wVElRWlFFQjJUNWJXUXIrT21xNUQ0eFpHYjV6Z09Z?=
 =?utf-8?B?RS9FbjdqWlFocmgyVFdDQ0dNTHZobjBHZVY4SjNTbitaVmRyanR0aWlnRFRs?=
 =?utf-8?B?djFnckRjcWE4ZDZnb0JSUytJSkV3M0xNS21ibkdLY2dyM0JERGh6bkNnbGsz?=
 =?utf-8?B?cktTTk5ubWphOEpFY1BZaHZTVlhRcjR2V0tNY01tQis1TGpIcVlMUVU2QWFY?=
 =?utf-8?B?WTg0MGpBajkydnNKRXJrQURBSnlicjNoVllRUitnOTVaOEZmL2owTVNCR2s5?=
 =?utf-8?B?ZzczbnExS1dOTmx3UFNIYlQ2UEhZcUNNcnJxL3NxZ2Fmb0kyeXpZOVFNS040?=
 =?utf-8?B?S1hrL1JKb2Fvb2c3NnV4SmFLdHFJQ2hTWlBGNEhpZU9FbmJPWHRSdWs4NXpM?=
 =?utf-8?B?bzN3Y1BmdTBmakIwYmlzUy9leWxHRlg2YWxhb3BBa05VeE9XQnFxaENJNmNN?=
 =?utf-8?B?Tm1sUmlHNUxPZmJVblhYclVacytCN1B3bXRFTE1BNitGd0J5NXUrbDEweWpL?=
 =?utf-8?B?bk1BNU93bkw5QzdMcVZMMmtodzJvWEUxdXpWcFkwTTVrZU5xSTczSUJjLyt4?=
 =?utf-8?B?TEE2bFNTbVgxZ3BVRFppQlNNMlBxZDNKenl3Z0kreXRCQk1hR21PK0hOaEZl?=
 =?utf-8?Q?xDFiPROuaTfKRUDA=3D?=
X-Exchange-RoutingPolicyChecked: uNAkoHLaCIvFihw6vEOfdHmyy6vzDrxQtZNJrNJUtZFdYgQuBOIljVh1pbAfwRxGE6gEIVMG6N7Jn/ItQiwa3JK6BsspP4qQrq0va7i9lDiYO+CtC6DZpkGDRo1eoSHjWOqNJYjx0vgeqrqv7c/ikOUFoQQTDNSC7bLkBQdGC5pfxL7/ru7VKLJHscn+wUaGufiMTZRuy7y4lXtS8rv8BvB712Fcqcjj8ltGMwG4NoTdHG2QHpxmpHH8vROG/b9GsfelvmLjN15KsqUDA8SK+bPceQ+I1OeX+LKFrZFUA/5u6Uuran5/SXKLsNuluROWP/HwoCxaVFRjNIJtSM2T4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5d98f2-c925-4167-e922-08de9ed73421
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 12:20:26.9243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5g0xK9K67UBsFAbws1If5K+whAUX2fuJnsMLO/1EhaHaPYsXpZtd5v4dD3VPmKoHgHuCjcE7IEDm6W8avbMMW4VW1ui4vZ3ehWkwQkh5vHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6989
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


On 16-04-2026 21:52, Matthew Auld wrote:
> On 16/04/2026 16:33, Maarten Lankhorst wrote:
>> Hey,
>>
>> Den 2026-04-16 kl. 17:19, skrev Sanjay Yadav:
>>> Stolen memory requires physically contiguous allocations for display
>>> scanout and compressed framebuffers. The stolen memory manager was
>>> sharing the gpu_buddy allocator backend with the VRAM manager, but
>>> buddy manages non-contiguous power-of-two blocks making it a poor fit.
>>> Stolen memory also has fundamentally different allocation patterns:
>>>
>>> - Allocation sizes are not power-of-two. Since buddy rounds up to the
>>>    next power-of-two block size, a ~17MB request can fail even with
>>>    ~22MB free, because the free space is fragmented across non-fitting
>>>    power-of-two blocks.
>>> - Hardware restrictions prevent using the first 4K page of stolen for
>>>    certain allocations (e.g., FBC). The display code sets fpfn=1 to
>>>    enforce this, but when fpfn != 0, gpu_buddy enables
>>>    GPU_BUDDY_RANGE_ALLOCATION mode which disables the try_harder
>>>    coalescing path, further reducing allocation success.
>>>
>>> This combination caused FBC compressed framebuffer (CFB) allocation
>>> failures on platforms like NVL/PTL. In case of NVL where stolen memory
>>> is ~56MB and the initial plane framebuffer consumes ~34MB at probe 
>>> time,
>>> leaving ~22MB for subsequent allocations.
>>>
>>> Use ttm_range_man_init_nocheck() to set up a drm_mm-backed TTM resource
>>> manager for stolen memory. This reuses the TTM core's ttm_range_manager
>>> callbacks, avoiding duplicate implementations.
>>>
>>> Tested on NVL with a 4K DP display: stolen_mm shows a single ~22MB
>>> contiguous free hole after initial plane framebuffer allocation, and
>>> FBC successfully allocates its CFB from that region. The corresponding
>>> IGT was previously skipped and now passes.
>>>
>>> v2:
>>> - Clarify that stolen memory requires contiguous allocations (Matt B)
>>> - Properly handle xe_ttm_resource_visible() for stolen instead of
>>>    unconditionally returning true (Matt A)
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7631
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>> Assisted-by: GitHub Copilot:claude-sonnet-4.6
>>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>>> ---
>> Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>
>> The changes look good, I never considered the differences between the
>> buddy allocator and range manager. Glad to see this works a lot better!
>>
>> One thing I did notice that in most cases, is there any reason for the
>> range manager to use pages? It should be able to use bytes and remove
>> a lot of shifts to convert between bytes and pages in the code.
>
> Ah, that reminds me of: dfd1d2f7eb39 ("drm/xe/fbdev: Fix BIOS FB vs. 
> stolen size check")
>
> That would need to be converted back to pages, I think.
Thanks Maarten for the review Ack, Matt A for the discussion.
>
>>
>>>   drivers/gpu/drm/xe/xe_bo.c | 16 +++++--
>>>   drivers/gpu/drm/xe/xe_device_types.h   |  3 ++
>>>   drivers/gpu/drm/xe/xe_res_cursor.h     | 14 +++++-
>>>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 64 
>>> +++++++++-----------------
>>>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h |  9 ++++
>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c   | 11 ++---
>>>   6 files changed, 63 insertions(+), 54 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index a7c2dc7f224c..b737edf04d60 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -599,11 +599,17 @@ static void xe_ttm_tt_destroy(struct 
>>> ttm_device *ttm_dev, struct ttm_tt *tt)
>>>       kfree(tt);
>>>   }
>>>   -static bool xe_ttm_resource_visible(struct ttm_resource *mem)
>>> +static bool xe_ttm_resource_visible(struct xe_device *xe, struct 
>>> ttm_resource *mem)
>>>   {
>>> -    struct xe_ttm_vram_mgr_resource *vres =
>>> -        to_xe_ttm_vram_mgr_resource(mem);
>>> +    struct xe_ttm_vram_mgr_resource *vres;
>>>   +    if (mem->mem_type == XE_PL_STOLEN) {
>>> +        struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
>>> +
>>> +        return mgr->io_base && 
>>> !xe_ttm_stolen_cpu_access_needs_ggtt(xe);
>>> +    }
>>> +
>>> +    vres = to_xe_ttm_vram_mgr_resource(mem);
>>>       return vres->used_visible_size == mem->size;
>>>   }
>>>   @@ -621,7 +627,7 @@ bool xe_bo_is_visible_vram(struct xe_bo *bo)
>>>       if (drm_WARN_ON(bo->ttm.base.dev, !xe_bo_is_vram(bo)))
>>>           return false;
>>>   -    return xe_ttm_resource_visible(bo->ttm.resource);
>>> +    return xe_ttm_resource_visible(xe_bo_device(bo), 
>>> bo->ttm.resource);
>>>   }
>>>     static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
>>> @@ -637,7 +643,7 @@ static int xe_ttm_io_mem_reserve(struct 
>>> ttm_device *bdev,
>>>       case XE_PL_VRAM1: {
>>>           struct xe_vram_region *vram = res_to_mem_region(mem);
>>>   -        if (!xe_ttm_resource_visible(mem))
>>> +        if (!xe_ttm_resource_visible(xe, mem))
>>>               return -EINVAL;
>>>             mem->bus.offset = mem->start << PAGE_SHIFT;
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 150c76b2acaf..ffb84659c413 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -42,6 +42,7 @@ struct xe_ggtt;
>>>   struct xe_i2c;
>>>   struct xe_pat_ops;
>>>   struct xe_pxp;
>>> +struct xe_ttm_stolen_mgr;
>>>   struct xe_vram_region;
>>>     /**
>>> @@ -278,6 +279,8 @@ struct xe_device {
>>>           struct ttm_resource_manager sys_mgr;
>>>           /** @mem.sys_mgr: system memory shrinker. */
>>>           struct xe_shrinker *shrinker;
>>> +        /** @mem.stolen_mgr: stolen memory manager. */
>>> +        struct xe_ttm_stolen_mgr *stolen_mgr;
>>>       } mem;
>>>         /** @sriov: device level virtualization data */
>>> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h 
>>> b/drivers/gpu/drm/xe/xe_res_cursor.h
>>> index 5f4ab08c0686..0522caafd89d 100644
>>> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
>>> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
>>> @@ -101,7 +101,15 @@ static inline void xe_res_first(struct 
>>> ttm_resource *res,
>>>       cur->mem_type = res->mem_type;
>>>         switch (cur->mem_type) {
>>> -    case XE_PL_STOLEN:
>>> +    case XE_PL_STOLEN: {
>>> +        /* res->start is in pages (ttm_range_manager). */
>>> +        cur->start = (res->start << PAGE_SHIFT) + start;
>>> +        cur->size = size;
>>> +        cur->remaining = size;
>>> +        cur->node = NULL;
>>> +        cur->mm = NULL;
>>> +        break;
>>> +    }
>>>       case XE_PL_VRAM0:
>>>       case XE_PL_VRAM1: {
>>>           struct gpu_buddy_block *block;
>>> @@ -289,6 +297,10 @@ static inline void xe_res_next(struct 
>>> xe_res_cursor *cur, u64 size)
>>>         switch (cur->mem_type) {
>>>       case XE_PL_STOLEN:
>>> +        /* Just advance within the contiguous region. */
>>> +        cur->start += size;
>>> +        cur->size = cur->remaining;
>>> +        break;
>>>       case XE_PL_VRAM0:
>>>       case XE_PL_VRAM1:
>>>           start = size - cur->size;
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c 
>>> b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> index 27c9d72222cf..5e9070739e65 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> @@ -19,30 +19,11 @@
>>>   #include "xe_device.h"
>>>   #include "xe_gt_printk.h"
>>>   #include "xe_mmio.h"
>>> -#include "xe_res_cursor.h"
>>>   #include "xe_sriov.h"
>>>   #include "xe_ttm_stolen_mgr.h"
>>> -#include "xe_ttm_vram_mgr.h"
>>>   #include "xe_vram.h"
>>>   #include "xe_wa.h"
>>>   -struct xe_ttm_stolen_mgr {
>>> -    struct xe_ttm_vram_mgr base;
>>> -
>>> -    /* PCI base offset */
>>> -    resource_size_t io_base;
>>> -    /* GPU base offset */
>>> -    resource_size_t stolen_base;
>>> -
>>> -    void __iomem *mapping;
>>> -};
>>> -
>>> -static inline struct xe_ttm_stolen_mgr *
>>> -to_stolen_mgr(struct ttm_resource_manager *man)
>>> -{
>>> -    return container_of(man, struct xe_ttm_stolen_mgr, base.manager);
>>> -}
>>> -
>>>   /**
>>>    * xe_ttm_stolen_cpu_access_needs_ggtt() - If we can't directly 
>>> CPU access
>>>    * stolen, can we then fallback to mapping through the GGTT.
>>> @@ -210,12 +191,19 @@ static u64 detect_stolen(struct xe_device *xe, 
>>> struct xe_ttm_stolen_mgr *mgr)
>>>   #endif
>>>   }
>>>   +static void xe_ttm_stolen_mgr_fini(struct drm_device *dev, void 
>>> *arg)
>>> +{
>>> +    struct xe_device *xe = to_xe_device(dev);
>>> +
>>> +    ttm_range_man_fini_nocheck(&xe->ttm, XE_PL_STOLEN);
>>> +}
>>> +
>>>   int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>>   {
>>>       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>       struct xe_ttm_stolen_mgr *mgr;
>>>       u64 stolen_size, io_size;
>>> -    int err;
>>> +    int ret;
>>>         mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
>>>       if (!mgr)
>>> @@ -244,12 +232,12 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>>       if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>>>           io_size = stolen_size;
>>>   -    err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, 
>>> stolen_size,
>>> -                     io_size, PAGE_SIZE);
>>> -    if (err) {
>>> -        drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
>>> -        return err;
>>> -    }
>>> +    ret = ttm_range_man_init_nocheck(&xe->ttm, XE_PL_STOLEN, false,
>>> +                     stolen_size >> PAGE_SHIFT);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    xe->mem.stolen_mgr = mgr;
>>>         drm_dbg_kms(&xe->drm, "Initialized stolen memory support 
>>> with %llu bytes\n",
>>>               stolen_size);
>>> @@ -257,36 +245,32 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>>       if (io_size)
>>>           mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, 
>>> io_size);
>>>   -    return 0;
>>> +    return drmm_add_action_or_reset(&xe->drm, 
>>> xe_ttm_stolen_mgr_fini, mgr);
>>>   }
>>>     u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
>>>   {
>>>       struct xe_device *xe = xe_bo_device(bo);
>>> -    struct ttm_resource_manager *ttm_mgr = 
>>> ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
>>> -    struct xe_ttm_stolen_mgr *mgr = to_stolen_mgr(ttm_mgr);
>>> -    struct xe_res_cursor cur;
>>> +    struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
>>>         XE_WARN_ON(!mgr->io_base);
>>>         if (xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>>>           return mgr->io_base + xe_bo_ggtt_addr(bo) + offset;
>>>   -    xe_res_first(bo->ttm.resource, offset, 4096, &cur);
>>> -    return mgr->io_base + cur.start;
>>> +    /* Range allocator: res->start is in pages. */
>>> +    return mgr->io_base + (bo->ttm.resource->start << PAGE_SHIFT) + 
>>> offset;
>>>   }
>>>     static int __xe_ttm_stolen_io_mem_reserve_bar2(struct xe_device 
>>> *xe,
>>>                              struct xe_ttm_stolen_mgr *mgr,
>>>                              struct ttm_resource *mem)
>>>   {
>>> -    struct xe_res_cursor cur;
>>> -
>>>       if (!mgr->io_base)
>>>           return -EIO;
>>>   -    xe_res_first(mem, 0, 4096, &cur);
>>> -    mem->bus.offset = cur.start;
>>> +    /* Range allocator always produces contiguous allocations. */
>>> +    mem->bus.offset = mem->start << PAGE_SHIFT;
>>>         drm_WARN_ON(&xe->drm, !(mem->placement & 
>>> TTM_PL_FLAG_CONTIGUOUS));
>>>   @@ -329,8 +313,7 @@ static int 
>>> __xe_ttm_stolen_io_mem_reserve_stolen(struct xe_device *xe,
>>>     int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct 
>>> ttm_resource *mem)
>>>   {
>>> -    struct ttm_resource_manager *ttm_mgr = 
>>> ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
>>> -    struct xe_ttm_stolen_mgr *mgr = ttm_mgr ? 
>>> to_stolen_mgr(ttm_mgr) : NULL;
>>> +    struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
>>>         if (!mgr || !mgr->io_base)
>>>           return -EIO;
>>> @@ -343,8 +326,5 @@ int xe_ttm_stolen_io_mem_reserve(struct 
>>> xe_device *xe, struct ttm_resource *mem)
>>>     u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe)
>>>   {
>>> -    struct xe_ttm_stolen_mgr *mgr =
>>> -        to_stolen_mgr(ttm_manager_type(&xe->ttm, XE_PL_STOLEN));
>>> -
>>> -    return mgr->stolen_base;
>>> +    return xe->mem.stolen_mgr->stolen_base;
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h 
>>> b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>>> index 8e877d1e839b..049e91e77326 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>>> @@ -12,6 +12,15 @@ struct ttm_resource;
>>>   struct xe_bo;
>>>   struct xe_device;
>>>   +struct xe_ttm_stolen_mgr {
>>> +    /* PCI base offset */
>>> +    resource_size_t io_base;
>>> +    /* GPU base offset */
>>> +    resource_size_t stolen_base;
>>> +
>>> +    void __iomem *mapping;
>>> +};
>>> +
>>>   int xe_ttm_stolen_mgr_init(struct xe_device *xe);
>>>   int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct 
>>> ttm_resource *mem);
>>>   bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> index 5fd0d5506a7e..79ef8e1b5e5c 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> @@ -301,14 +301,13 @@ int __xe_ttm_vram_mgr_init(struct xe_device 
>>> *xe, struct xe_ttm_vram_mgr *mgr,
>>>                  u64 default_page_size)
>>>   {
>>>       struct ttm_resource_manager *man = &mgr->manager;
>>> +    const char *name;
>>>       int err;
>>>   -    if (mem_type != XE_PL_STOLEN) {
>>> -        const char *name = mem_type == XE_PL_VRAM0 ? "vram0" : 
>>> "vram1";
>>> -        man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
>>> -        if (IS_ERR(man->cg))
>>> -            return PTR_ERR(man->cg);
>>> -    }
>>> +    name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
>>> +    man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
>>> +    if (IS_ERR(man->cg))
>>> +        return PTR_ERR(man->cg);
>>>         man->func = &xe_ttm_vram_mgr_func;
>>>       mgr->mem_type = mem_type;
>>
>
