Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972A5C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 14:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A26710E06A;
	Fri,  8 Aug 2025 14:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwBtk/hH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E581310E06A
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754664479; x=1786200479;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5DzL64yrHkTYleq/bb5yh8VoYMO1st/QPtYjStC8KSU=;
 b=jwBtk/hHwlKy7cGWcKBM71HFuuSgqkhxFf49AiLXc7QPaC1N3emToShP
 VV86MFIBYppdhSvcLSRpfD0rQJT9L7scsmf0Arf6BFZ3mQOMHxCPOt6Y3
 hQQa3iPtreHbftXB9ekHBpXcg+r3zTTUzcGJiglC4/czUaZsz3ojz7d6n
 qVm8COaA2LcyovrL3zFI8zFZARz2nndtvzfMrErQmRr0h5IT1FNV0sdSH
 pyezLRThOR0NoaNzUJBr0lgULOho5G59R0duaKb+fVX9yVAdV7+hIL0Xx
 L3TMdI2eBW4teW4cOhIc0b7FghsYLJqcuSOjjInXKxi201rRDH7dEcfv/ Q==;
X-CSE-ConnectionGUID: rHQ1L3GZQIG2/ghrB5jQLA==
X-CSE-MsgGUID: UFgEjYL8QMyVs2dXu2t8bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="82454301"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="82454301"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:47:58 -0700
X-CSE-ConnectionGUID: C/o+nc3vSUm66zMzHGWNgA==
X-CSE-MsgGUID: cbBNXv6qTQ28HM6qQDPYiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="189027535"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:47:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:47:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 07:47:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.75)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 8 Aug 2025 07:47:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUjA72ghGzEgoibRmB2Q+WPB910dFISnhAZon5QZe4sD4HPv9skJ8x9iRfhryReto8+pq1CGbFmjpXqc2BuiV5smpTfMaMKccGVg/Dm0OKMNKu+17bNOgEMLRGrM0qQYXP+S5l9HBex42tBH6Yxni2+485zuwBuIVkbNHqTvNGOBgcfvZdQ5/wYxA+nDlOYcn5SHtRnqpS/WrevdpX0PoN/CHo+yskd2eqdlQjg/TEG86tCMcmDYX9U9PY12wNalxb6W/DN2px73WHmWkXxkalFxddyVEhuCL6kecOjKXYC5D9W8w+DspCnuDk6YapyPzvljpsVfi92EubXMBxJmdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sduzxL1Ztoc0DWpyBkmmqcIjSmYhJ2tub3YndekFqnQ=;
 b=vjQ1Clx2qOFXwM+7Ucum9KbkGyPoEo64UzLfaukwi92FSqFfwcg4tfN23ve5N+B9eHIYUbX9v9fnz6w9WXjstZxZIorymrpqIShNdjePobhoNghvM9XXyHEkc+vjYftv9L4YHJgo9oNT1LjeqJzmy25EA3SJMWKtzNIS5CoYBKL1T5IxjmG19jk+msngaW1HXE/OkgR3jddi/Gg0iHuSkmQY3gWXK/MzUTBisAhvbWH4rbO2dRLiktG6q3t+Kbr9uSYNE4voANDCTH+HcYrLwm7Iuo7LTX6gCC73qDxW3JM3Ou8p3T9OnABjOHyTXRmu0XdZ5bJoNPIAsQ5x1f3m6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB7704.namprd11.prod.outlook.com (2603:10b6:a03:4e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Fri, 8 Aug
 2025 14:47:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Fri, 8 Aug 2025
 14:47:49 +0000
Date: Fri, 8 Aug 2025 10:47:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>
Subject: Re: [PATCH] ANDROID: Add GPU work period support for Xe driver
Message-ID: <aJYOEfGHO8uEs4V4@intel.com>
References: <20250808090922.3716954-1-aakash.deep.sarkar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250808090922.3716954-1-aakash.deep.sarkar@intel.com>
X-ClientProxiedBy: BYAPR01CA0025.prod.exchangelabs.com (2603:10b6:a02:80::38)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: fc94f29f-6346-4433-f494-08ddd68a8b4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Empm6U9jjUbUJzpJqCy8/NLn1sKnYkJWQWBEAn+nnCtfdwdmvxSO+DJi87?=
 =?iso-8859-1?Q?s1igI9pCybzLHUgWjKcgqjwtrNx8idF1RSYj6zzLlRer5N1Vev9PSxU961?=
 =?iso-8859-1?Q?nk4x5W0i4ps0VBAsCKgpXA4TE7Da/RFeiU+cf8QbnYA7gLXwSMCy6zyEod?=
 =?iso-8859-1?Q?PCSS468duQVBtQ56cL72VyfwRQIpdnUxqq9ZptfLfBtHaNveeGMgtyWL6+?=
 =?iso-8859-1?Q?KZNXQkjJwIQNtKPcnaJElPZGiWPm/5y3dt6YPGlhZfJdmV3PjBgjG2VwWJ?=
 =?iso-8859-1?Q?0XqSNyyLAcw2nZwNOSLv+t1reHOhgo8DVdycnWgNJWKsva6QupSDGR49+O?=
 =?iso-8859-1?Q?c57eMZQIcdFFqUxGUtKwxW6a4j42+zV8zxPxw332S/O6CLQefGGyyBAlOQ?=
 =?iso-8859-1?Q?dwmBbiXt9sn00WksITavJJwJhvprFgzO3YPJ3lyxfjIZsBbNnUrZSl+ngv?=
 =?iso-8859-1?Q?iLZi2/u/ohbJgqYTxrd/JI5AGFGvavdcpskuoESskZL7PH0Byo1U95U51m?=
 =?iso-8859-1?Q?q/p92dlnX16dMRV9tuAlg3HurHKSlBRY3LrRMnRdl8ianviFxAE6yoG9Y/?=
 =?iso-8859-1?Q?yynvzoMrHVPxTtszjBvP129G7BPzjw7Ummvu/8w524ved6YUebM7QMtlIr?=
 =?iso-8859-1?Q?Y+/8sAN0QBIejCq118rW1O2AKQI+LSudMhuTYbYwO9fqa8TOJamCe00zhV?=
 =?iso-8859-1?Q?g67yfBNAXLsYaXMVLqiB6bHhzZcyYedrgazEIeEu6Voe6y1TFtYSm/sDEL?=
 =?iso-8859-1?Q?oTVjdXze+HqUb+DMLx7K4fmZbfYVNAPgc7NGv1vn72YqKnQyl7bPurkRpx?=
 =?iso-8859-1?Q?DHmU+RcYMaJh2+sC9LhcOkpFEC1whI5fWoSfPwZIVqolgkRUizHQ5AW2HZ?=
 =?iso-8859-1?Q?EQ+mvc9rmHbQKiEBUSkaLXnFTYywuPVSJmQbOlx962nGMIlGVP15R8PHka?=
 =?iso-8859-1?Q?a74xOtSI+ik/fg3OfJIjOd52sf9qaypM7MW5OHq+XCyVSJEi7bMyDkakEO?=
 =?iso-8859-1?Q?Oe3r1RMLTpjj5ckqHEMKLMauMjrrKEYiKECIkx9TDkSMEwbCdBhkG/9+3v?=
 =?iso-8859-1?Q?xbkZpTqnTxvoExeLiaBHwFipJ5K2QrOtZxqKnq3AA3lLWv9/qfD8Veihnx?=
 =?iso-8859-1?Q?MTyuDWrom8Y2P2SpanpAIDL15v2DuBftG+zx7RWHg61njsLjc/SNdAU5NC?=
 =?iso-8859-1?Q?e/LzsICR/kroAf4bcScKJA7xAxtQ1GZNLldRuzOYLS3yEPyrfoD2c/obfZ?=
 =?iso-8859-1?Q?0gJBdDPHq6jBnWnX6kmZnBAGQeOe7AbSsvemLKnUiRUbt/qaOFxWtwy8PW?=
 =?iso-8859-1?Q?dW/cH8J4/tYHYL4Mk15fLwLotbs1v02s7EyqWWunJOAOB4z0ny+pEtO9cN?=
 =?iso-8859-1?Q?6icjJtvXaUc3uo5yxXIiy/sBTdpajYbsHGdYFEFIo+xHsyvnakXkLAi3GJ?=
 =?iso-8859-1?Q?9WfaqQ7H9afaEUzhP3Y7GL3nHNMfTbnlzgBTOfXNjWTc8KV/6H/rxPyR+S?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?a+jARYhvN8mC8WJEvGpjeNEhXOnjKRWABVh69mKtksynZLNki3OeGFumoz?=
 =?iso-8859-1?Q?zxrol9mRat4BW/O1E26TUuF0WT0iyNYwpQmvZluvvqJMmYqMT1R9lkvNOc?=
 =?iso-8859-1?Q?jmS4ZJtGQoXomiZBCYuZmyoZLL3iWYbfGbEp2cp6tt0bGbWrpMGyc4tAtY?=
 =?iso-8859-1?Q?XIwQI+ZRz6Y8H+/S4tKAHyrA3+PBOTQx79/0sKbg5+U2846vNBLl1I96eC?=
 =?iso-8859-1?Q?XkKXR8r2bD9Cz5rfUU4bMTwKAQvgv6UevM+OXVOY9tvgWuajXcdmN3DRkf?=
 =?iso-8859-1?Q?hKMTdM1NjnLdpzOnS+NqdUItWs19HQQIyTICawScw2OXc4P6iV3wSJtkwN?=
 =?iso-8859-1?Q?P2itAPnQugHO0sxknfauk4p5ys/SceSP3K5EXzVfSCxhez2bRFaLQNL0KG?=
 =?iso-8859-1?Q?IXGItHD/wbMn6bOal0ZmjmhGvm5OC75xpvijWfsj63BYScltQLYIaRAeaY?=
 =?iso-8859-1?Q?dRMYMb++TYqukI1S0vpVkhH9vb1zX4utW/aIHrKcfj6W1Sn83x6TlG1moR?=
 =?iso-8859-1?Q?l9wzw4jysb5O6XpmVT6/Mz8Dw7A5WM7OUVGNLLQpUMKbkscDpkVOjsEfWm?=
 =?iso-8859-1?Q?NLH3pj3vcRLNgfeFQ51hmA3bjmL8f8IjQWPrpbOwgfiDoTyx99DGcHRGDd?=
 =?iso-8859-1?Q?wjEPZIO/Xf8mK/Wj5U8fvtJyu6/U+M9lWwyVeiA7WzlD+cd6TmXZbr9i+i?=
 =?iso-8859-1?Q?9a9gR9c7NP/t/PGb7+F2vspiuboJZVjgmc+G58mbW/8jZOfr57+IRa0LhL?=
 =?iso-8859-1?Q?2qWCIXpGR1CAHpxE8hB5dRMtM/dZJndfPLcIuBS4NsORpUH4KPeKAiacYd?=
 =?iso-8859-1?Q?szXBegnHv8Z2oJPWfbrbIG4kjsvZK+xRV8S/9F+nzhgy4D7OPMxLoBLqqy?=
 =?iso-8859-1?Q?SNTlrTALXYaf3nZiIvTnkg2QaEZ56pHhp3vafsVJz+/+tLXk0SLTEhILgy?=
 =?iso-8859-1?Q?QIBppUbLRK62ECYTn+qOzMzga5NCRUSZaM1slKHQ5D9dLSQhAhNSq8q5By?=
 =?iso-8859-1?Q?bcpX/RjPsTT7DExc4/6W6BrFaJxRtt3c0POD/zJoPNHWi3chPdCHtGnQa2?=
 =?iso-8859-1?Q?t9xZtACfBvV753c3Szt542vzMTHdCoimCl3ReCzp92IQfykXmrMzSLneFq?=
 =?iso-8859-1?Q?tYLNFpSqUCIt/6AjF94GR44JSDbwxthXq1mFgI7dVp0giwx0tugYpwul/w?=
 =?iso-8859-1?Q?qH/3Dd1cUvGAxGsekYsqXL1w6vaZ2iz/cGj4tkpSzw5oS1dGKFexAOvxUN?=
 =?iso-8859-1?Q?Ehiy3wWKurft2FoZ35IQpdYnKuWra9/L/JS0gdT1fDjb4LNtszwW3cEbX9?=
 =?iso-8859-1?Q?Hoyu8w76HHL8XYB8AZMqb8ObZPfqEbwwWBwCLYuaMrJLG0/ZechC0aKvI6?=
 =?iso-8859-1?Q?Xk9vqLZWwyWcViSoCWJvlNZ6yj0QRxtMGbP9PHL7E0wkd0gXIdyxP8tUFf?=
 =?iso-8859-1?Q?hB7aI6M9ziEL2rcBZuYR6POhtP36b8sU43i5FXNLTmulGil80CHbnuqkLi?=
 =?iso-8859-1?Q?w3KvBarz96tEq/TwXWhykRef480MYy/lNUvNIsyYGk15dQDvjMXZecTrTh?=
 =?iso-8859-1?Q?lX+dEZTrQuZyz9jpBKqRbnkEYhNaoaz1Z4sX1S7FUHtjbTGw10iuYnYBgf?=
 =?iso-8859-1?Q?Ab2qx9AjrykdtrZufF/9faJh9LruzMf86K?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc94f29f-6346-4433-f494-08ddd68a8b4f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 14:47:49.0737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: juYuQ0kNCm7PaYu4dQdBwruoo8g+EyCi14V87R2Uy4P5y+ywc4Y1io9Qj/mMf3gFZ8WPunhItUo9NPnh7IAzdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7704
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

On Fri, Aug 08, 2025 at 09:09:19AM +0000, Aakash Deep Sarkar wrote:
> This patch implements the Android requirement GPU work
> period event for Intel Xe driver.
> 
> |GpuWorkPeriodEvent| defines a non-overlapping, non-zero period
> of time from |start_time_ns| (inclusive) until |end_time_ns|
> (exclusive) for a given |uid|, and includes details of how much
> work the GPU was performing for |uid| during the period. When
> GPU work for a given |uid| runs on the GPU, the driver must track
> one or more periods that cover the time where the work was running,
> and emit events soon after.
> 
> Full requirement is defined in the following file:
> https://cs.android.com/android/platform/superproject/main/+\
> /main:frameworks/native/services/gpuservice/gpuwork/bpfprogs/gpuWork.c;l=35

This is a great content, but for a cover letter.

Please split this into smaller patches that will be easier to
digest and review. The patches need to make sense and be compiled
individually but together they have the ultimate goal of fulfilling
this requirement, hence please keep the whole android mention and
motivation in the cover letter while keeping the individual patches
telling what they are doing and why (a why different then the android goal)

Thanks,
Rodrigo.

> 
> The requirement is implemented using a timer to give periodic
> interrupts and a worker thread per user id instance to accumulate
> its run time on gpu and emit the event. Each user id instance is
> tracked using a xe_user structure and the runtime is updated at
> each timer interrupt. The timer period is hardcoded to 500 msecs.
> 
> The runtime on the gpu is collected for each xe file individually
> inside the function xe_exec_queue_update_run_ticks() and accumulated
> into the corresponding xe_user active_duration_ns field. The HW
> Context timestamp field in the GTT is used to derive the runtime
> in clock ticks and then converted into nanosecs before updating the
> active duration.
> 
> Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c                |  98 +++++++++++++++-
>  drivers/gpu/drm/xe/xe_device_types.h          |  27 +++++
>  drivers/gpu/drm/xe/xe_drm_client.c            | 108 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_drm_client.h            |  75 +++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue.c            |   5 +
>  drivers/gpu/drm/xe/xe_gt_clock.c              |   5 +
>  drivers/gpu/drm/xe/xe_gt_clock.h              |   1 +
>  .../drm/xe/xe_power_gpu_work_period_trace.h   |  61 ++++++++++
>  8 files changed, 378 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 57edbc63da6f..116247007a4d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -8,6 +8,7 @@
>  #include <linux/aperture.h>
>  #include <linux/delay.h>
>  #include <linux/fault-inject.h>
> +#include <linux/jiffies.h>
>  #include <linux/units.h>
>  
>  #include <drm/drm_atomic_helper.h>
> @@ -76,9 +77,13 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
>  	struct xe_drm_client *client;
> +	struct xe_user *user;
>  	struct xe_file *xef;
>  	int ret = -ENOMEM;
> +	unsigned long flags;
> +	int uid = -EINVAL;
>  	struct task_struct *task = NULL;
> +	const struct cred *cred = NULL;
>  
>  	xef = kzalloc(sizeof(*xef), GFP_KERNEL);
>  	if (!xef)
> @@ -103,13 +108,66 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  	file->driver_priv = xef;
>  	kref_init(&xef->refcount);
>  
> +	INIT_LIST_HEAD(&xef->user_link);
> +
>  	task = get_pid_task(rcu_access_pointer(file->pid), PIDTYPE_PID);
>  	if (task) {
> +		cred = get_task_cred(task);
> +		if (cred) {
> +			uid = (int) cred->euid.val;
> +			put_cred(cred);
> +		}
>  		xef->process_name = kstrdup(task->comm, GFP_KERNEL);
>  		xef->pid = task->pid;
>  		put_task_struct(task);
>  	}
>  
> +	if (uid < 0)
> +		goto out;
> +
> +	/*
> +	 * Check if the calling process/uid has already been registered
> +	 * with the xe device during a previous open call. If so then
> +	 * take a reference to this xe file and add it to the list of xe
> +	 * files belonging to the this user
> +	 */
> +	spin_lock_irqsave(&xe->work_period.lock, flags);
> +	list_for_each_entry(user, &xe->work_period.user_list, entry) {
> +		if (user->uid == uid) {
> +			xef->user = xe_user_get(user);
> +			spin_unlock_irqrestore(&xe->work_period.lock, flags);
> +			goto filelist_add;
> +		}
> +	}
> +	spin_unlock_irqrestore(&xe->work_period.lock, flags);
> +
> +
> +	/*
> +	 * We couldn't find a xe user for this process. Allocate a new
> +	 * struct xe_user and register it with this xe device
> +	 */
> +	user = xe_user_alloc();
> +	if (!user)
> +		goto out;
> +
> +	user->uid = (unsigned int) uid;
> +	user->last_timestamp_ns = ktime_get_raw_ns();
> +	user->xe = xe;
> +
> +	/* Add this xe_user to xe_device->work_period.user_list */
> +	spin_lock_irqsave(&xe->work_period.lock, flags);
> +	list_add(&user->entry, &xe->work_period.user_list);
> +	spin_unlock_irqrestore(&xe->work_period.lock, flags);
> +
> +	drm_dev_get(&xe->drm);
> +	xef->user = user;
> +
> +filelist_add:
> +	/* Add this xe_file to xe_user->filelist */
> +	mutex_lock(&user->filelist_lock);
> +	list_add(&xef->user_link, &user->filelist);
> +	mutex_unlock(&user->filelist_lock);
> +out:
>  	return 0;
>  }
>  
> @@ -124,6 +182,12 @@ static void xe_file_destroy(struct kref *ref)
>  
>  	xe_drm_client_put(xef->client);
>  	kfree(xef->process_name);
> +
> +	mutex_lock(&xef->user->filelist_lock);
> +	list_del(&xef->user_link);
> +	mutex_unlock(&xef->user->filelist_lock);
> +	xe_user_put(xef->user);
> +
>  	kfree(xef);
>  }
>  
> @@ -347,6 +411,23 @@ static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
>  	return drm_gem_mmap(filp, vma);
>  }
>  
> +static void work_period_timer_fn(struct timer_list *timer)
> +{
> +	struct xe_device *xe = container_of(timer, typeof(*xe), work_period.timer);
> +	struct xe_user *user;
> +	unsigned long timeout = 0;
> +
> +	spin_lock(&xe->work_period.lock);
> +	list_for_each_entry(user, &xe->work_period.user_list, entry) {
> +		xe_user_get(user);
> +		queue_work(xe->work_period.wq, &user->work);
> +	}
> +	spin_unlock(&xe->work_period.lock);
> +	timeout = jiffies + msecs_to_jiffies(500);
> +
> +	mod_timer(timer, timeout);
> +}
> +
>  static const struct file_operations xe_driver_fops = {
>  	.owner = THIS_MODULE,
>  	.open = drm_open,
> @@ -409,6 +490,11 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  	if (xe->destroy_wq)
>  		destroy_workqueue(xe->destroy_wq);
>  
> +	if (xe->work_period.wq)
> +		destroy_workqueue(xe->work_period.wq);
> +
> +	timer_delete_sync(&xe->work_period.timer);
> +
>  	ttm_device_fini(&xe->ttm);
>  }
>  
> @@ -477,11 +563,21 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  
>  	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
>  						       WQ_MEM_RECLAIM);
> +
> +	spin_lock_init(&xe->work_period.lock);
> +	INIT_LIST_HEAD(&xe->work_period.user_list);
> +	timer_setup(&xe->work_period.timer, work_period_timer_fn, 0);
> +	xe->work_period.timer.expires = jiffies + msecs_to_jiffies(1000);
> +	add_timer(&xe->work_period.timer);
> +
> +	xe->work_period.wq = alloc_workqueue("xe-work-period-wq", 0, 0);
> +
>  	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
>  	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", 0, 0);
>  	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", 0, 0);
>  	if (!xe->ordered_wq || !xe->unordered_wq ||
> -	    !xe->preempt_fence_wq || !xe->destroy_wq) {
> +	    !xe->preempt_fence_wq || !xe->destroy_wq ||
> +		!xe->work_period.wq) {
>  		/*
>  		 * Cleanup done in xe_device_destroy via
>  		 * drmm_add_action_or_reset register above
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 01e8fa0d2f9f..32b63b5f1c2e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -418,6 +418,20 @@ struct xe_device {
>  		} late;
>  	} pinned;
>  
> +	/** @work_period: gpu work period event */
> +	struct {
> +		/** @lock: lock protecting this structure */
> +		spinlock_t lock;
> +		/** @timer: timer to give periodic interrupts to emit the
> +		 * gpu work period event
> +		 */
> +		struct timer_list timer;
> +		/** @user_list: list of xe users using this xe device */
> +		struct list_head user_list;
> +		/** @wq: workqueue for gpu work period event emitting work */
> +		struct workqueue_struct *wq;
> +	} work_period;
> +
>  	/** @ufence_wq: user fence wait queue */
>  	wait_queue_head_t ufence_wq;
>  
> @@ -656,6 +670,9 @@ struct xe_file {
>  	/** @run_ticks: hw engine class run time in ticks for this drm client */
>  	u64 run_ticks[XE_ENGINE_CLASS_MAX];
>  
> +	/** @active_duration_ns: total run time in ns for this xe file */
> +	u64 active_duration_ns;
> +
>  	/** @client: drm client */
>  	struct xe_drm_client *client;
>  
> @@ -671,6 +688,16 @@ struct xe_file {
>  	 */
>  	pid_t pid;
>  
> +	/**
> +	 * @user_link: entry into xe_user.filelist list
> +	 */
> +	struct list_head user_link;
> +
> +	/**
> +	 * @user: pointer to the xe user this xe file belongs to
> +	 */
> +	struct xe_user *user;
> +
>  	/** @refcount: ref count of this xe file */
>  	struct kref refcount;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index f931ff9b1ec0..7a21d8e83310 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -5,10 +5,12 @@
>  #include "xe_drm_client.h"
>  
>  #include <drm/drm_print.h>
> +#include <drm/drm_drv.h>
>  #include <uapi/drm/xe_drm.h>
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/spinlock.h>
>  
>  #include "xe_assert.h"
>  #include "xe_bo.h"
> @@ -21,6 +23,9 @@
>  #include "xe_pm.h"
>  #include "xe_trace.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include "xe_power_gpu_work_period_trace.h"
> +
>  /**
>   * DOC: DRM Client usage stats
>   *
> @@ -404,3 +409,106 @@ void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>  	show_run_ticks(p, file);
>  }
>  #endif
> +
> +/**
> + * worker thread to emit gpu work period event for this xe user
> + * @work: work instance for this xe user
> + *
> + * Return: void
> + */
> +static inline void work_period_worker(struct work_struct *work)
> +{
> +	struct xe_user *user = container_of(work, struct xe_user, work);
> +	struct xe_device *xe = user->xe;
> +	struct xe_file *xef;
> +	struct xe_exec_queue *q;
> +	u64 last_active_duration, last_timestamp;
> +	u32 gpuid = 0, uid = user->uid;
> +	u64 start_time, end_time, active_duration;
> +	unsigned long i;
> +
> +	last_active_duration = user->active_duration_ns;
> +	last_timestamp = user->last_timestamp_ns;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	mutex_lock(&user->filelist_lock);
> +	list_for_each_entry(xef, &user->filelist, user_link) {
> +
> +		wait_var_event(&xef->exec_queue.pending_removal,
> +		!atomic_read(&xef->exec_queue.pending_removal));
> +
> +		/* Accumulate all the exec queues from this user */
> +		mutex_lock(&xef->exec_queue.lock);
> +		xa_for_each(&xef->exec_queue.xa, i, q) {
> +			xe_exec_queue_get(q);
> +			mutex_unlock(&xef->exec_queue.lock);
> +
> +			xe_exec_queue_update_run_ticks(q);
> +
> +			mutex_lock(&xef->exec_queue.lock);
> +			xe_exec_queue_put(q);
> +		}
> +		mutex_unlock(&xef->exec_queue.lock);
> +		user->active_duration_ns += xef->active_duration_ns;
> +	}
> +	mutex_unlock(&user->filelist_lock);
> +
> +	xe_pm_runtime_put(xe);
> +
> +	start_time = last_timestamp + 1;
> +	end_time = ktime_get_raw_ns();
> +	active_duration = user->active_duration_ns - last_active_duration;
> +	trace_gpu_work_period(gpuid, uid, start_time, end_time, active_duration);
> +	user->last_timestamp_ns = end_time;
> +
> +	xe_user_put(user);
> +}
> +
> +/**
> + * xe_user_alloc() - Allocate xe user
> + * @void: No arg
> + *
> + * Allocate xe user struct to track activity on the gpu
> + * by the application. Call this API whenever a new app
> + * has opened xe device.
> + *
> + * Return: pointer to user struct or NULL if can't allocate
> + */
> +struct xe_user *xe_user_alloc(void)
> +{
> +	struct xe_user *user;
> +
> +	user = kzalloc(sizeof(*user), GFP_KERNEL);
> +	if (!user)
> +		return NULL;
> +
> +	kref_init(&user->refcount);
> +	mutex_init(&user->filelist_lock);
> +	INIT_LIST_HEAD(&user->filelist);
> +	INIT_LIST_HEAD(&user->entry);
> +	INIT_WORK(&user->work, work_period_worker);
> +	return user;
> +}
> +
> +/**
> + * __xe_user_free() - Free user struct
> + * @kref: The reference
> + *
> + * Return: void
> + */
> +void __xe_user_free(struct kref *kref)
> +{
> +	struct xe_user *user =
> +		container_of(kref, struct xe_user, refcount);
> +	struct xe_device *xe = user->xe;
> +	unsigned long flags;
> +
> +	/* Remove the xe_user from xe_device.user_list */
> +	spin_lock_irqsave(&xe->work_period.lock, flags);
> +	list_del(&user->entry);
> +	spin_unlock_irqrestore(&xe->work_period.lock, flags);
> +
> +	drm_dev_put(&user->xe->drm);
> +	kfree(user);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
> index a9649aa36011..cf5f27e79251 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.h
> +++ b/drivers/gpu/drm/xe/xe_drm_client.h
> @@ -12,6 +12,7 @@
>  #include <linux/rcupdate.h>
>  #include <linux/sched.h>
>  #include <linux/spinlock.h>
> +#include <linux/workqueue.h>
>  
>  struct drm_file;
>  struct drm_printer;
> @@ -34,7 +35,63 @@ struct xe_drm_client {
>  #endif
>  };
>  
> -	static inline struct xe_drm_client *
> +/**
> + * This is a per process/user id structure for a xe device
> + * client. It is allocated when a new process/app opens the
> + * xe device and destroyed when the last xe file belonging
> + * to this user id is destroyed.
> + */
> +struct xe_user {
> +	/**
> +	 * @refcount: reference count
> +	 */
> +	struct kref refcount;
> +
> +	/**
> +	 * @xe: pointer to the xe_device
> +	 */
> +	struct xe_device *xe;
> +
> +	/**
> +	 * @filelist_lock: lock protecting the filelist
> +	 */
> +	struct mutex filelist_lock;
> +
> +	/**
> +	 * @filelist: list of xe files belonging to this xe user
> +	 */
> +	struct list_head filelist;
> +
> +	/**
> +	 * @entry: entry into the xe.work_period.user_list list
> +	 */
> +	struct list_head entry;
> +
> +	/**
> +	 * @work: work to emit the gpu work period event for this
> +	 * xe user
> +	 */
> +	struct work_struct work;
> +
> +	/**
> +	 * @uid: user id for this xe_user
> +	 */
> +	u32 uid;
> +
> +	/**
> +	 * @active_duration_ns: sum total of xe_file.active_duration_ns
> +	 * for all xe files belonging to this xe user
> +	 */
> +	u64 active_duration_ns;
> +
> +	/**
> +	 * @last_timestamp_ns: timestamp in ns when we last emitted event
> +	 * for this xe user
> +	 */
> +	u64 last_timestamp_ns;
> +};
> +
> +static inline struct xe_drm_client *
>  xe_drm_client_get(struct xe_drm_client *client)
>  {
>  	kref_get(&client->kref);
> @@ -67,4 +124,20 @@ static inline void xe_drm_client_remove_bo(struct xe_bo *bo)
>  {
>  }
>  #endif
> +
> +struct xe_user *xe_user_alloc(void);
> +
> +static inline struct xe_user *
> +xe_user_get(struct xe_user *user)
> +{
> +	kref_get(&user->refcount);
> +	return user;
> +}
> +
> +void __xe_user_free(struct kref *kref);
> +
> +static inline void xe_user_put(struct xe_user *user)
> +{
> +	kref_put(&user->refcount, __xe_user_free);
> +}
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 6c176183ed58..59d69863f626 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -15,6 +15,7 @@
>  #include "xe_dep_scheduler.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_gt_clock.h"
>  #include "xe_hw_engine_class_sysfs.h"
>  #include "xe_hw_engine_group.h"
>  #include "xe_hw_fence.h"
> @@ -865,6 +866,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  	struct xe_device *xe = gt_to_xe(q->gt);
>  	struct xe_lrc *lrc;
>  	u64 old_ts, new_ts;
> +	struct xe_gt *gt = q->gt;
>  	int idx;
>  
>  	/*
> @@ -889,6 +891,9 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>  	q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
>  
> +	q->xef->active_duration_ns +=
> +		xe_gt_clock_interval_to_ns(gt, (new_ts - old_ts));
> +
>  	drm_dev_exit(idx);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index 4f011d1573c6..6ba807837198 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -110,3 +110,8 @@ u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count)
>  {
>  	return div_u64_roundup(count * MSEC_PER_SEC, gt->info.reference_clock);
>  }
> +
> +u64 xe_gt_clock_interval_to_ns(struct xe_gt *gt, u64 count)
> +{
> +	return div_u64_roundup(count * NSEC_PER_SEC, gt->info.reference_clock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h b/drivers/gpu/drm/xe/xe_gt_clock.h
> index 3adeb7baaca4..bd87971bce97 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.h
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.h
> @@ -12,5 +12,6 @@ struct xe_gt;
>  
>  int xe_gt_clock_init(struct xe_gt *gt);
>  u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count);
> +u64 xe_gt_clock_interval_to_ns(struct xe_gt *gt, u64 count);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h b/drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h
> new file mode 100644
> index 000000000000..2de05f1b64f3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _TRACE_POWER_GPU_WORK_PERIOD_INTEL
> +#define _TRACE_POWER_GPU_WORK_PERIOD_INTEL
> +#endif
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM power
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE xe_power_gpu_work_period_trace
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +
> +#if !defined(_TRACE_POWER_GPU_WORK_PERIOD_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_POWER_GPU_WORK_PERIOD_H
> +
> +#include <linux/tracepoint.h>
> +
> +TRACE_EVENT(gpu_work_period,
> +
> +	TP_PROTO(
> +		u32 gpu_id,
> +		u32 uid,
> +		u64 start_time_ns,
> +		u64 end_time_ns,
> +		u64 total_active_duration_ns
> +	),
> +
> +	TP_ARGS(gpu_id, uid, start_time_ns, end_time_ns, total_active_duration_ns),
> +
> +	TP_STRUCT__entry(
> +		__field(u32, gpu_id)
> +		__field(u32, uid)
> +		__field(u64, start_time_ns)
> +		__field(u64, end_time_ns)
> +		__field(u64, total_active_duration_ns)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->gpu_id = gpu_id;
> +		__entry->uid = uid;
> +		__entry->start_time_ns = start_time_ns;
> +		__entry->end_time_ns = end_time_ns;
> +		__entry->total_active_duration_ns = total_active_duration_ns;
> +	),
> +
> +	TP_printk("gpu_id=%u uid=%u start_time_ns=%llu end_time_ns=%llu total_active_duration_ns=%llu",
> +		__entry->gpu_id,
> +		__entry->uid,
> +		__entry->start_time_ns,
> +		__entry->end_time_ns,
> +		__entry->total_active_duration_ns)
> +);
> +
> +#endif /* _TRACE_POWER_GPU_WORK_PERIOD_H */
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>
> -- 
> 2.49.0
> 
