Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF138E85385
	for <intel-xe@archiver.kernel.org>; Fri,  3 Apr 2026 17:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFB110E176;
	Fri,  3 Apr 2026 17:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JELqLhxv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2755B10E176
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Apr 2026 17:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775237025; x=1806773025;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Saq2EaYl0Enwyt1Dx5gi3EF3YfljruiNw1fYI7aPri0=;
 b=JELqLhxvn62vWQWRgVvRm/DxZ/BYahQZfTRHzzzNpY5+mpOazt/PMVgD
 nJmYeUM/IrgU6yUi3dCI3r1pZCpffDuowaiT2zzcoP158vQYk+pGXsljy
 mfF+dZYqwGh4UavlybZY5vZ3TIRfLyjr3Nv6avrlnpffnWjl61uR8JLeu
 /DfggeFl/puxXYz3tDSd+ZkZMxs4qqt9noTQCJSR9t+UuZ2JYtOjdG9r+
 iYLcy9oijkkFd1lktp0yPROfDvleBWvyM288EHXs5UrCkvbVKeDx+vFHT
 nGjLMsvVeyzgMPHWoYmD9dt4YaUMM0ToMQLkMLq/PKu1hy4/yFCCR8bT3 A==;
X-CSE-ConnectionGUID: k+a2ArcvQWGaNCsjeyLcog==
X-CSE-MsgGUID: XBYek1MCTYqkNFt7lmnlng==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="76192147"
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; d="scan'208";a="76192147"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 10:23:45 -0700
X-CSE-ConnectionGUID: 9BTAjXzCQJKzbSmdEoLVCg==
X-CSE-MsgGUID: zbgpWAb6Tx+Zhb3C0paYtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; d="scan'208";a="257775050"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 10:23:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 3 Apr 2026 10:23:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 3 Apr 2026 10:23:43 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 3 Apr 2026 10:23:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JthylNRIYYFULO68luK9jzBN0EKZsRWsoI5e/4+CZsnkRbBnI0ipON3Vr3OTSNhWwQCaPQrtjTOIgLbOOHvq6E42vmn7nUEeM3324KRu0k0fCRuoGVPW5liF8k1VGTvffFo10f23VYYUoKJglVV3JifxbfV8rECnYZ4qOZje4UXTOHg8cUj65YMr3rj2ytdf34cNHJ2xMYYY2NhsTco/+haeWlBOwGY/umzHs6LECuWoHxc/iXm6wVORZBzBzC944RNAa5xz9Q3uceKTFhp/PyyKBQvrPBsWMMnMumvVBY4+MIITF5AReLSTkXqbEmPLCLw9KUMrE8pq1lrelKW1Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2b9FmiwIIDxQI6eaAzxH2tpGh8gVEkUJAN4ZXp29Ug=;
 b=XEALcHyFIQTAZ2zy0Q0rDoSszkPbSWQEF4kUJvq9Flh/q2biU6u+uNHNNRMo6xMGPspK80MttRGUbNzyheqwoYyjfUxLWxZ6sEK9mdzOeMvWgvYq8bQ2/glJEbFJ7ltRSo+OkaTBdtrpfIYthYqEyZS7OwIxstxiQZZ86kHv4kkE4u33Ki+/IihqZkGG9DKEHNda9nxi1eS/ItqttGU1eGlGC4PLVd+k4IMc9NRY1/7q9/ilK0nD3WsiD2tHofav08rM9MNOmtXcj6ap7VlOTmiU6WgqnrjagOilOpg8UWbOFVjezK7qg+hdKZx34LRavKGIkaeZYKJ2JXYTMqBAow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7852.namprd11.prod.outlook.com (2603:10b6:8:fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Fri, 3 Apr
 2026 17:23:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 17:23:38 +0000
Date: Fri, 3 Apr 2026 10:23:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Xin Wang <x.wang@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re?= for
 drm/xe: expose multi_lrc_mask in debugfs info (rev6)
Message-ID: <20260403172336.GQ2729713@mdroper-desk1.amr.corp.intel.com>
References: <20260402180552.24121-1-x.wang@intel.com>
 <177520331087.430638.8110608607877835573@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177520331087.430638.8110608607877835573@a3b018990fe9>
X-ClientProxiedBy: BY3PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: bdae535e-7b95-4b52-a31b-08de91a5be74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: aFzEHM8UOhLc8UDsWAhzkWNfwREqqrk2+foBloKmggnsvCjVPJcMOLEC/YY1FioW87K6oKoJPHozMXh+NdiuYZcP14ZLajmeta1iJK60y00pDRQHSk/cbpawdrYs7LjKAHPkbn/9NtYhv5ar64MFLYnoCCTG6kKetC66hg0mOr4PVg5vOt/sOQIX8f9nPHGCpuKABdjqLxHHAnM0VIqlCrVR+MRDejz/KyZBaDeUzsGyv6xnlmsuAU1VCNhYeeeuwH3mF53WNBIEu4kP50bAd/xlJmyuNJbJQVpz7qF6AHk2VqQJDcW8OLq/Pa71eK92/Sg+lWcNDbzUwEJ3FOn0IIeAKX+p9HP6c6fsDs6AoFcbzt9qbV0K4p/+FEiUIt+87sTeWVbmG6CMU4zsXAwGkPrcUctZ+o9miZz7TmmtAhjn0JfySE6vhuyzQkXsTJq+Xg9JVbFaqSKV5ZVz31FvG619oz4iZNNtOko6747xcg1o8+IlPMazcikmQdLJXurbsxBz95DXX8yGUONHZ3yNGM7jeErC78NeBs1cbIhV20W3bmsi0kLe2wsof9e6N1Kjtr75WdtaW3HuRH/edlqK6rQpeMiw2mYUTtRZAHl3mFenEKdFSG8PuUxoe3yvTPLc99IEaPyz6lR6JByfxMGZoSjgR+YqartAJdsM5uhgHW1wmgkDjIpqoSbt46JFBhJt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UwUzQbvL2bBVCrFzVexQNVTOEhgosrQ3+9+//2rN0UYbpEMczy6GopyhORpE?=
 =?us-ascii?Q?NAXkv/kx3qdJ/oKcoif5iM+dkJCd8XW2QGcTAHQZL61MdvRQf16VmDTIkFzn?=
 =?us-ascii?Q?qTFi7Y21WPE0tMWCP47nSaGfjpZwudd+uHxbURaJIlOg/MFi7EEwxQqLd11p?=
 =?us-ascii?Q?wYN88oXVhjoJ7a2rtx2ZrUPNPBAZtonC2Owr9QN0Dx6EUOOdQwsYjlTTDpCE?=
 =?us-ascii?Q?W6HNHhAlVfelJ0xr5xQtSczGZ4HwQ3EOSJI3M9Wfq3I0ftYyyPdXPAIIZHXJ?=
 =?us-ascii?Q?gGwqsBvdr0PRtGtYKRZdCrNc3Avi5QPjty8DbsVjAF+3d/Zmq087l7GscYob?=
 =?us-ascii?Q?DUBQ5U5h8fzt6x50v+OAe7bDMbYrcThtaw/5pieRvlmhyAm3q7Nvsy+82qz6?=
 =?us-ascii?Q?Av+ipN4yGbVmsci/uX3JOsqaHmQUOAXbanRHNBKCAzzf45uRYa+3RuPFm2Uh?=
 =?us-ascii?Q?le5Cfdkpt86UO2gaMt3j0jF7eO1iV5zkGHWufcSDnnB/JfvOVspWu0duH8va?=
 =?us-ascii?Q?RKVXs06qHLZrqIH8eR3x5zTOxrDqtEq4a5pYsPKNR4QCCcvDhUl64vJU20go?=
 =?us-ascii?Q?QJxWa8hTPwFrh7Mjk+DyqXbtY/QJOYK4R4QjA6/5WA6WHs9TWeYUKdULcehq?=
 =?us-ascii?Q?XvUmiRTHhP5zGAbpg5NO0atwL9cRt/cSDFy/6DDdI37H7g3PZYSCpoeG5yWZ?=
 =?us-ascii?Q?ToNmRsqBwroNDANNJ5g34MvBwXPTNShZTFFzaXlYlR3GHkFJXi8bLQ35MXh9?=
 =?us-ascii?Q?cm02JPLbvqpzLpxGNLAPRflccXi8VBhGVlOO3kc8cy4Os8aUs7w9FrZzYVRh?=
 =?us-ascii?Q?qaBlzaxUzFQAfgZKaht8QyJLHi2sslnvf8cSKGo56EjlezEi1r8PuacPyi0s?=
 =?us-ascii?Q?KN0IyfJITtNzM0ywtK7bbfXv18A5D/jy7sFYECHsQhDo26dTKt6Bb5rbd4es?=
 =?us-ascii?Q?2W04gJbZNsmjMwLlPdIoKKLsWWzY5G1WwCjaN1NYU1qIXvPy6DrQoRGES1zf?=
 =?us-ascii?Q?mirW7neWD/BVGdox7x1fquvoBjZ01c/cb+iwuB3Xetd6ANsqLliV1cujQse4?=
 =?us-ascii?Q?KbtCOEacOHridEJYcT+g/Gl+UlnLQCAwjdTxpswKiVTaSVeBhTZCOk/ByMg1?=
 =?us-ascii?Q?yIa6+2lcVY+F4AwlsoIHHvze3Z2F+npeoBforAkJ8+7Ah97mfCJgbHG9CQXj?=
 =?us-ascii?Q?NLkn56aiXbPhU0IUYpAi2L/mv6LIX/MnXs6uS88wDEKIqpG9muSWripNH6zY?=
 =?us-ascii?Q?00iBN0Xp88M9iS+iRl3b1QDjZWq9rHOpsF96Iu0DmM1ue7Fi3GFl3wHf9VCs?=
 =?us-ascii?Q?zy8vRfD4KGHWYExVtfcBAIUg5AdT/2crsURHSpqLyM3312K650WKuJZYzIRn?=
 =?us-ascii?Q?1zWVmCXq93YKJAUxSU3gRnTjfkSrhSjVNk3Ujc6nFXTGYmYaEYyloUc5FG0A?=
 =?us-ascii?Q?WPhzcIkRnxiGdq1EuM5OnMW9qkeL4w7HFdMNSXym0g/6PA5gDK7r2yUCAXyo?=
 =?us-ascii?Q?aRfaM8mx42iqdutME4ce0LyCIV3YdfOjbZgjUWi9JLme5Gvj742DpyZHf+yA?=
 =?us-ascii?Q?Ofef8R68GxtgwPi+dgo4fMlfSRJ3uJ41KCCQO67GUJIqO1w32lUiCejtDTiD?=
 =?us-ascii?Q?37ECdiZCYmk+IkGt6IMQpKs72YLXwSxsPkLItl1ReyGx2EGm9N7OiSUsAHHI?=
 =?us-ascii?Q?Rk8wC9S9FBJtjtNxtQ85y0441MlUrCE6gYy46MZ1g6s3NH423L5CyDr4JxkK?=
 =?us-ascii?Q?NKf+h1ESSM/4S8zu+dhJgLXMNP3doAg=3D?=
X-Exchange-RoutingPolicyChecked: qQUjmt2Xip2p6L/vzm1Bx0YNZ63dMWfhXnbxvIuSmmCX6qrHbFZU4mBp6ipSlnGlkoNCxCfiCFxw6t+0KwfGrDlp/4b4NLSuUt6i5GionkaibX15XMtYNeilYVS08AV+bNLVtVijkLXzRKkPhZD3zMH02SE/a9d2Ok5VugjHD85Jo4qgi3YUfjReYuYJDY6mGxuEPbho0GWmNld67QTsTjsup6NC4cAzjsv8hHMhHI01WN+0rQhFCvghtvA1m7RTCSifso+LUBvrpX588x5wm9FZuqIXDpGj+nIs2AP/IxMXXqNOTa0fgglYgQluc5v3U7nry/bBfRNoNx9rOS87Zw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bdae535e-7b95-4b52-a31b-08de91a5be74
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 17:23:38.5695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJdpuHx7L99yHJNOBaZuLhVT+O/vxQ/FG8SAMavF+b3sit0uK7/hU/lZreuLts1z1V3GUYwqDaHAUwP0E8xDJPQXqDJ3P7RumoxLpRYVEgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7852
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

On Fri, Apr 03, 2026 at 08:01:50AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: expose multi_lrc_mask in debugfs info (rev6)
> URL   : https://patchwork.freedesktop.org/series/163802/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b_FULL -> xe-pw-163802v6_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-163802v6_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-163802v6_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-163802v6_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@process-many-large-malloc-mlock-nomemset:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-malloc-mlock-nomemset.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-malloc-mlock-nomemset.html

Incomplete with no visible errors.  This test's behavior wouldn't have
been impacted by the debugfs changes though, so it appears unrelated.

Applied to drm-xe-next.  Thanks for the patches.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-163802v6_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-9/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#7679])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2887]) +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#3432])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2252]) +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][8] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-8/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x10:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2320]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
>     - shard-bmg:          [PASS][10] -> [DMESG-WARN][11] ([Intel XE#5354])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-7/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1508])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-bmg:          [PASS][13] -> [INCOMPLETE][14] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#7178] / [Intel XE#7351])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2311]) +5 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#4141]) +4 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2313]) +5 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7283]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1489]) +2 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr@pr-sprite-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-1/igt@kms_psr@pr-sprite-plane-move.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#3904] / [Intel XE#7342])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#6503])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1499])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7636]) +3 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-8/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [PASS][26] -> [INCOMPLETE][27] ([Intel XE#6321])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7136]) +3 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html
> 
>   * igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6874]) +7 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr-invalidate.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
>     - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#5625])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7138]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html
> 
>   * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6964])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-1/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-1/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#4733] / [Intel XE#7417])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#944])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-9/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   * igt@xe_sriov_flr@flr-vfs-parallel:
>     - shard-bmg:          [PASS][38] -> [FAIL][39] ([Intel XE#6569]) +1 other test fail
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-9/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-bmg:          [FAIL][40] ([Intel XE#7445]) -> [PASS][41]
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b/shard-bmg-10/igt@intel_hwmon@hwmon-write.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-2/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [FAIL][42] ([Intel XE#7571]) -> [PASS][43]
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][44] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][45] +1 other test pass
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-lnl:          [FAIL][46] ([Intel XE#6361]) -> [PASS][47] +2 other tests pass
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][48] ([Intel XE#4459]) -> [PASS][49] +1 other test pass
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-lnl:          [FAIL][50] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][51] +1 other test pass
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b/shard-lnl-6/igt@kms_vrr@flip-basic.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-lnl-2/igt@kms_vrr@flip-basic.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][52] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][53] ([Intel XE#2509] / [Intel XE#7437])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445
>   [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
>   [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8843 -> IGT_8845
>   * Linux: xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b -> xe-pw-163802v6
> 
>   IGT_8843: 8843
>   IGT_8845: bdaaf0b253471f6018f93e5c63f5415aa0c96bcb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b: dba2251b00d3faac3be7fc15431ffb9c4d60232b
>   xe-pw-163802v6: 163802v6
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163802v6/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
