Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D036CE8D5D
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 16:56:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73AE10E184;
	Fri, 14 Nov 2025 16:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZkLoPEvy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE4A10E24D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 16:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763139378; x=1794675378;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=0rx22QGJdOmMgNV52y3/PHX0yvwy/jkXdtlQP62Yz6Y=;
 b=ZkLoPEvypK60FonzHbWs05CRWhavMPuQJN0c30Z9jcKd2tyaKjAyZXM+
 aard9+8OLlwJ+cZiXBj+NzI5/PMOU20zaZSe2VN62PHAp1sxgI+p3E5jT
 D+igKstfEEViKCsBd2by83rzLv3W/S8OfySpJf1bjxGfyFi5ayw/KnpPX
 mvWpD8UkaDJXAHWLNaL9pME7BoM9EB4gJrQpdi4U2ETWDPC/HRzVOIwHr
 /+l3BPzOw2LTxlWQmLw2NBBiFZhdScLslnsMLGZX/s2ycSFoD/z2/mhWg
 6tT+D+bqiEMDxKprcm6ArDXUggY8+01c9tdwNgvc8GX6wsma6xBYPZnDf A==;
X-CSE-ConnectionGUID: Ky4PFPW4Qmm3Pi6khoddBg==
X-CSE-MsgGUID: XuUGU4yPQZyp8uM0bBA+xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82868971"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82868971"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 08:56:18 -0800
X-CSE-ConnectionGUID: WAzfzRydTcyqnEHWm65PKA==
X-CSE-MsgGUID: iXCCvwL4QGqgC2l9GX3zSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194121217"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 08:56:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 08:56:17 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 08:56:17 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 08:56:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHE3WHwcyH4yeW1qiV5gPb7XGl3Nn1ryJMHFjNjUH4sBvUUSS+xRloIibFjuW6rZaSa26cTnQ4awG4lJzYv9hAmX7SL3EF0SLeIWepnyum1W7ziK6UzcinzMUXAwFTIR4zf++9B9bsEqxyy3KO2YK0KKWwP+DZ0/001CITIgqIMHHG+gkXI8YE9pOA+ZAwwwytMG2cujp6R3OsQRip3xWFLbLq4xWNyBMTAktT8Msub0g/+u0taoNr8/96MDXH1e26gkW/x3KmjtDj5ERQYDusurz6nhVjhLVihF6ej15mZb1/qhLXAYQyDeEri5t8f2d6w0LcSXCKwlz+1nzMKy4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XcK/icxt49tNdUzKQrLvoTJ/STOWmxb9uZI2oh1OGI=;
 b=WqSeO8rVWpXumdzBtFxKxjWX/JfqFQT91cMh9S6IGuM9HJ5eB1j6+DHOW6BrrOtb17hDVR54KL64NuWOYmd8FZVnuzm/QRXZF2bs3B9r176rA49UUXmPRm33SFOHFBoM4Jv7P22FsTJXoVCgtx25dKz+wGXTAC9mibyM41S/TSXRS8K8Jxzzy2fMbvrLYBs9u5cCg+hiZatlBZoTEK37lazmWUQaNh16XZJ+Wrg5i6fttuCqZugIHW7rkPz9FCmTbE6r6mf0TuK/Ir6MhuVB6lGzamITETjZNBrkPlhr8qDid83cQnQMZk1R3Uktrgq5/e//DYE91IHO6wqjcxJaMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 16:56:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 16:56:12 +0000
Date: Fri, 14 Nov 2025 08:56:09 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw6IHN1Y2Nl?= =?utf-8?Q?ss?= for
 drm/xe/kunit: Fix forcewake assertion in mocs test
Message-ID: <20251114165609.GR3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251113234038.2256106-2-matthew.d.roper@intel.com>
 <176311453104.55014.5821810817927472410@10055242dc62>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176311453104.55014.5821810817927472410@10055242dc62>
X-ClientProxiedBy: BYAPR11CA0058.namprd11.prod.outlook.com
 (2603:10b6:a03:80::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f05c26-766e-4263-17fa-08de239eb74c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D3yncXGl/5zi/1tmHad7qwX197/24lDaNIbI0MYoRQ0+cB+576R0QvO6GXya?=
 =?us-ascii?Q?OGWGpqwHCJ+CISb92v4m7CPkQ2GDWIym+jIyrIhwuU6Rd/6d4Q6htKMLUTYZ?=
 =?us-ascii?Q?Rwa1ATlQCUL5iiIDTXJzwQvYyWPr4muIAfjNjZruZBRo6YAA90MEOzNDDfGD?=
 =?us-ascii?Q?iyDQaXTK4fZrR5ORwa4RKw3pdtHFqD+F3kB0gSsMV6yKdUVIvkmYGuo78yEN?=
 =?us-ascii?Q?dC2L0VwHQ1t3KdwKEx6C4qs3aC0J+XPSNuOCRga9Jt2YElCZLrGz3kZ1P/q3?=
 =?us-ascii?Q?gAV+MMX2PQScCrmBRIncPtPVxLKiqq3ATImq7afsg2BWAoHgZ3D8gmkWcWla?=
 =?us-ascii?Q?b/0V6tolEqGwcdRsvvy+3+9a3C8AMXv+qJ9yhXoE/5RuR8zWIbvyH+0DfAj9?=
 =?us-ascii?Q?hykdi20E8TqfN68VmQQpFEcrD6fCFYAcxsbDhJNdFVEf6Y/8CBfws6CmAR9f?=
 =?us-ascii?Q?wxFMicKEUgHjerqfOOvzHsXyT8detvZvHycVFDaEtdYBGeLyXvCG2+5/LAzb?=
 =?us-ascii?Q?VpEZz4xw6X3CDtb2Fd+z8lXMAqxHru/6HzBKur6COUQOVT9LZW0yaIzuq+wc?=
 =?us-ascii?Q?OKqRa5mXfpPJChnDXl15KGLLQamZGWNAJQZfC+gXwO6ygH3cc8J2de3AYOdU?=
 =?us-ascii?Q?w0iPcUfYXy9fVeC0Mj8Ciu1pkPvHgQJOI6Pnlg+VsnJ0zMv1usyBFqgdp4zr?=
 =?us-ascii?Q?La3ZRO4tU1bTOB/a/nfRhnnICEqQFYnpfzS2qJoywQfzKr00m6tyggYcnd6O?=
 =?us-ascii?Q?9Ip5smw/40eMrzyp4s4mu8F17gze7T9lX/OyJvNmQi6WdTw7XvomA2crqhwM?=
 =?us-ascii?Q?hPms3rUF4gcpWEPFwy8EXDRgYHhCZZPYHLkcXmVSMW/IWArU/2rJaGiybEC8?=
 =?us-ascii?Q?kkU6WwnY7pZPo2RzpAeOlI87HvS6IjuH2zjDLHe718GkEFwXWhs2Zk9oGE45?=
 =?us-ascii?Q?xlHOtYRn36tq2szXvEhPu3x7Uv7+zOo4BpSf4330cE1FfUEy+wCVo2HGtBIo?=
 =?us-ascii?Q?pohWUY3Nvu3NQtobgCL6IsU7MXRe25SoXfunRQZcB8mBj2cpO6qSwMOlmwBZ?=
 =?us-ascii?Q?c6WI/0HkBLp2Aaefapj1WTtdrYixDd/7F4gUPo09uW/5GHtU5AmgMmuFj0CW?=
 =?us-ascii?Q?7Ak8afebRKLjxwgJufQuYRSJiPu0Iw2MJ6zmdpC1piVfDMbpfuz/Xu+tKRwz?=
 =?us-ascii?Q?1QhBgty/dyZlAXp90vyXrpLnHbURXvfdyxh7QwfMzMJ1m7tqNPI7j5TNNvGv?=
 =?us-ascii?Q?2fVRXu4nx6rZ3fmH5q8+PqNynrPoOao1FG5J2rFSf2pgcUP1+KDbpn5YCKWu?=
 =?us-ascii?Q?3pSKboI947/PLuQfJAFxdmOUaWeFFIom6cj9dl3cS2ySSJ2i3nHjjcWEvUZx?=
 =?us-ascii?Q?rHCGORwGHr2NoeDz30Ur24sPn+rrosL5m06DfCH8A6/9kbBzgw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FJDX+zmNATb0TWh7zYkjX/ZviIJWF/aU0ouS67sEQepEE2zOUZRgJ5PIVUmQ?=
 =?us-ascii?Q?lE+mQF54TD6gVr14vCUcb2dSDmjZ2o4Rgbl0UYejHePa7mFWH5egYSe4C2+q?=
 =?us-ascii?Q?SHUe++ZCLMIKiHGXR+H6xxRATVLteDQpFH7UjVGpMBiki1wJz298TkmRFcJR?=
 =?us-ascii?Q?DtW0dbHZmQPqsiNpOfZd+TG/ALjEWXrcbGn5Z91vyNo7932XG9oWf68wwY+S?=
 =?us-ascii?Q?w4e/P7+r2ci+ocRA9MClhcgk3zRJZK2SB8PL1PfbxE4SHvZCXQAJ018FYnoS?=
 =?us-ascii?Q?E1i3CkKMXCEjbrjSNTysblV8KAIvN3HgSCgh4in2F9Gw/JB0wELwLD2+OyZk?=
 =?us-ascii?Q?uP4nL1ktEbiJaNWzHMOWTExKUxKJGy/r+t3TIafhOfo3C7kgfY+xXWypt2Fy?=
 =?us-ascii?Q?2SoLQcbLjWycymwwXZjTuARQ02PmpM8Jkqca47RUOWi97pdYzpCN9RVG5TTP?=
 =?us-ascii?Q?bPtLCUfQd5EyAaaWtSEDZMW21ooGaOsbuQiY2Pc8JtbIiOQ9dwFKLAa9EtcQ?=
 =?us-ascii?Q?hhw3XoujriYjMklpV1O7oGh508AmvBbQ2Jrf+7tx8Rvx7XD9wr5nf4wbb4ZM?=
 =?us-ascii?Q?8wwW1i7AZOjQ4JCPOknILOEhkXi0qJ/uOA0titSg0hgXpkq8On0h9PClVl00?=
 =?us-ascii?Q?cqFaUoNHGjLjw9dEOosBGyxRrWAGUY+3PL7LQSkyEDwzofliMU1xDur91MuP?=
 =?us-ascii?Q?uTFNgehvqZUpjzhDgt0/J3/n0/ZcayQAHamJhx+LXeDd0+G/foWdv1eWf8T5?=
 =?us-ascii?Q?hQNnZXHGuNADf5Ra+VWsFdGZoL/hgyDVvT5adCbn2nk9TOWcRhlJnsVQSvi/?=
 =?us-ascii?Q?o8nhl3aMTXPJCRBsDr2H2OV75UgiULxXT+XPoXkxqMrns2OWQ4cRJvKu1Lj1?=
 =?us-ascii?Q?xxxFROYJoK9x+poD3X9eHi4j15vQH7IbeqYvqjd3WE0nZSHJ4t3RMdYYbWWd?=
 =?us-ascii?Q?j/wBNT7DTukh596w5qkYVB/pLfI6KmGUw1NjHeZB0ftO9n3Z8+4+DTQVXquX?=
 =?us-ascii?Q?3nwWtnUzA8Dsh13LE9GsITfRDFUK2PoERRU53yACUKnt/kfMhMdzNs/mViWB?=
 =?us-ascii?Q?UgsnnfytvnZo6ow4iLUIE443i0SpPcFRGxghvJGCvsutYVYG5WtiNIG+HPOW?=
 =?us-ascii?Q?/IE1xsz+oz+uq13MA1RKwDb2WdktM6RfQDL7pcWeWKincXoT047EQoEiF6BR?=
 =?us-ascii?Q?P+4i9LG8UViiRM0TvpUqTPuhMHR9UcVayPl/eBOr7XKZtu8q96a4vB/XJX7u?=
 =?us-ascii?Q?CqtLW8WOJOq/u0fMb2rjAw5KRDJJtCy5lIOzYrL8uqwYIJ//PppJgA7HVoP+?=
 =?us-ascii?Q?dOZuChjF4cvhQYVmAI8APqYGMRlQDepQGKlwCjWzBsUbcfLwN3ntI5AAgSfE?=
 =?us-ascii?Q?fRimxTYq11cWPww6upRjAu9gNNfUxLwVR0bsf/93Twd4p99B0YFaWJLseGhF?=
 =?us-ascii?Q?nF0y45FM9S1+kCvI79DmfR3JZYYtz25cpW3o3M4Q3UYb5rzD0Owm35JvBqf5?=
 =?us-ascii?Q?F//g1F3jDbc0cOCt3LfhCHKKzHJTHt6WVk8kEJyQW5lmzBBUGZGZCIl4CrBN?=
 =?us-ascii?Q?2GP1RCTNPSTmxY+U7O7qvJ2Mh977RwcjllD+gRpBWmmUY9gaMMpDw6eG48EZ?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f05c26-766e-4263-17fa-08de239eb74c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:56:12.2911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3F8t2i7RJSMZeQehzDgenXyK8/kW7P78s9uCF+GFv/s+6P1H4xCF1trh6N9WGMjEsZzJT783PXt7RgxX2jjUnxHbeqTGrUaJZ80/yWUNN6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
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

On Fri, Nov 14, 2025 at 10:02:11AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/kunit: Fix forcewake assertion in mocs test
> URL   : https://patchwork.freedesktop.org/series/157541/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657_FULL -> xe-pw-157541v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Lucas and Gustavo for the reviews.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-157541v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#2953] / [Intel XE#4173]) +11 other tests dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#316]) +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327]) +2 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1124]) +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [PASS][6] -> [DMESG-FAIL][7] ([Intel XE#4543]) +1 other test dmesg-fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +7 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2314] / [Intel XE#2894])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#2191])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#367]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#367])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +12 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#787]) +27 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#2907]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-edid:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2252]) +6 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-1/igt@kms_chamelium_audio@hdmi-audio-edid.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#306])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2325]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#373]) +4 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#1178]) +4 other tests fail
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-1/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][23] ([Intel XE#1178]) +1 other test fail
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2390])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#307])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2320]) +3 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#308])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2321])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2291])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          NOTRUN -> [FAIL][31] ([Intel XE#4633])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#4354])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#4294])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#2373])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1138])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#2316]) +4 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-1/igt@kms_flip@2x-modeset-vs-vblank-race.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-bmg:          [PASS][40] -> [INCOMPLETE][41] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [PASS][42] -> [INCOMPLETE][43] ([Intel XE#2049] / [Intel XE#2597]) +3 other tests incomplete
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>     - shard-adlp:         [PASS][44] -> [DMESG-WARN][45] ([Intel XE#4543]) +9 other tests dmesg-warn
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2293]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-slowdraw:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#651]) +10 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#6313])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#5390]) +7 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#6312]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2311]) +21 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2352])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#658])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2313]) +21 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#653]) +13 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#455]) +13 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-435/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#346])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#2571])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2938])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#2938])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#870])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1406] / [Intel XE#1489]) +6 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +5 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1406] / [Intel XE#2939])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#3414] / [Intel XE#3904])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2413])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_setmode@basic:
>     - shard-adlp:         [PASS][71] -> [FAIL][72] ([Intel XE#6361]) +2 other tests fail
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-adlp-9/igt@kms_setmode@basic.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-adlp-9/igt@kms_setmode@basic.html
> 
>   * igt@kms_sharpness_filter@filter-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#6503]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_sharpness_filter@filter-suspend.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#1499])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-1/igt@kms_vrr@flip-basic.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2168])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@kms_vrr@lobf.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#2168])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@kms_vrr@lobf.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1126])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_eudebug_online@debugger-reopen:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#4837]) +5 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@xe_eudebug_online@debugger-reopen.html
> 
>   * igt@xe_eudebug_online@interrupt-other:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#4837]) +8 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@xe_eudebug_online@interrupt-other.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2322]) +6 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#288]) +11 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-adlp:         [PASS][82] -> [DMESG-WARN][83] ([Intel XE#3876])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-adlp-8/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#5007])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#4915]) +150 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-435/igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#4943]) +15 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#6281])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-1/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
> 
>   * igt@xe_gt_freq@freq_fixed_idle:
>     - shard-dg2-set2:     [PASS][88] -> [FAIL][89] ([Intel XE#6407])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-dg2-466/igt@xe_gt_freq@freq_fixed_idle.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-432/igt@xe_gt_freq@freq_fixed_idle.html
> 
>   * igt@xe_oa@non-zero-reason:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#3573]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@xe_oa@non-zero-reason.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2236])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#979])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2284] / [Intel XE#366])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2284])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#579])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
>     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#579])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pmu@all-fn-engine-activity-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#4650])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-435/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90:
>     - shard-lnl:          [PASS][98] -> [FAIL][99] ([Intel XE#6251]) +2 other tests fail
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#4733]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#4733])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#944]) +2 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-1/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_query@multigpu-query-pxp-status:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#944])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@xe_query@multigpu-query-pxp-status.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#3342])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   * igt@xe_sriov_vram@vf-access-after-resize-down:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#6318])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-435/igt@xe_sriov_vram@vf-access-after-resize-down.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_addfb_basic@bad-pitch-63:
>     - shard-adlp:         [DMESG-WARN][106] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][107] +1 other test pass
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-adlp-4/igt@kms_addfb_basic@bad-pitch-63.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-adlp-1/igt@kms_addfb_basic@bad-pitch-63.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [INCOMPLETE][108] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     [INCOMPLETE][110] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-bmg:          [SKIP][112] ([Intel XE#2291]) -> [PASS][113] +3 other tests pass
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-bmg:          [SKIP][114] ([Intel XE#1340]) -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-bmg:          [SKIP][116] ([Intel XE#2316]) -> [PASS][117] +6 other tests pass
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-6/igt@kms_flip@2x-plain-flip.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-2/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][118] ([Intel XE#3098]) -> [PASS][119] +1 other test pass
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-dg2-434/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a6.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-dg2-463/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][120] ([Intel XE#4543]) -> [PASS][121] +5 other tests pass
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-adlp-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [FAIL][122] ([Intel XE#301]) -> [PASS][123] +3 other tests pass
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-adlp:         [FAIL][124] ([Intel XE#718]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][126] ([Intel XE#6321] / [Intel XE#6606]) -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
>     - shard-adlp:         [DMESG-FAIL][128] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [DMESG-FAIL][129] ([Intel XE#4543])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-adlp-3/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-adlp-8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          [SKIP][130] ([Intel XE#2341]) -> [FAIL][131] ([Intel XE#1178])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-6/igt@kms_content_protection@srm.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-2/igt@kms_content_protection@srm.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>     - shard-bmg:          [SKIP][132] ([Intel XE#2311]) -> [SKIP][133] ([Intel XE#2312]) +7 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][134] ([Intel XE#2312]) -> [SKIP][135] ([Intel XE#2311]) +16 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][136] ([Intel XE#5390]) -> [SKIP][137] ([Intel XE#2312]) +1 other test skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][138] ([Intel XE#2312]) -> [SKIP][139] ([Intel XE#5390]) +11 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][140] ([Intel XE#2312]) -> [SKIP][141] ([Intel XE#2313]) +16 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][142] ([Intel XE#2313]) -> [SKIP][143] ([Intel XE#2312]) +5 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          [SKIP][144] ([Intel XE#4596]) -> [SKIP][145] ([Intel XE#5021])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
>   [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6313
>   [Intel XE#6318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6318
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
>   [Intel XE#6407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6407
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#6606]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6606
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657 -> xe-pw-157541v1
> 
>   IGT_8623: 8623
>   xe-4104-e15c082b1af0c5cd053273ea096ab84fbc309657: e15c082b1af0c5cd053273ea096ab84fbc309657
>   xe-pw-157541v1: 157541v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157541v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
