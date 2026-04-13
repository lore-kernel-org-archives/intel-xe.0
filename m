Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E587BF531CB
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 19:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D1710E527;
	Mon, 13 Apr 2026 19:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ak25YexJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A9910E526
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 19:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776109387; x=1807645387;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=a/SV43w9OxEiQcoJmuIJ68kIWMmK8XPnZ9tyk1n7Q4c=;
 b=Ak25YexJL9O0qGM50sOeg/oVWWPBIAJKLvSgI3iPreRoM6Q7xEKb6onm
 igEqH+5SQrzl9GlNaRqUHgnM2b0oYeujtVeizWyJhhk2u03oQuSVIZrD3
 frtVLCOHep7+lERzmstlNewDSN0dtI84hze2KzV7Kr7O355wJKnsJbrm3
 r61kxwA1NFbvMHEFNx+PDP6GVVvpIeouukE/smKakmyRsLHhezvxeuAJ3
 3+6z6Q4wqBLKTigoS6YUuLv4AQ3E2Sa/h3Z11O7+6siFlcdUDf2PxDhzO
 TRgwWpLlI28K9aBZonJ5fd3HIF0rWqDS2fcLR37lsbp1Ud338UTnejwVu w==;
X-CSE-ConnectionGUID: TBqs/TiSQT2uEQj1qFgc5g==
X-CSE-MsgGUID: cJ3X1yesRVq9I8ai9yEkSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87679556"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="87679556"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 12:43:05 -0700
X-CSE-ConnectionGUID: HOeJjpAbR/+LslXRleHRZw==
X-CSE-MsgGUID: R8WVZX5aSUegqkx7+RZ06w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="260303701"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 12:43:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 12:43:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 12:43:02 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 12:43:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3WjeJYeBB2b3RvTyhvztGnTSQ7tlUMJ08cJg3Yd6ajDmgspKN9xu5b7iPeXLE58TsJX6rKF4g+BItVmvh415DUe+z5InOdyQuJOXn8pbZj3lKD1hQPKdt4g2EtYv+HxoIcEnRKb+EZtHtW5PRqHRjIRYd+k1XWjlRyZBCm3Lc136SQaeG6PY/kkQRHHn5pIqyvB4leCHEQ14jc/H4zkq4zREcRj2VKIkkr3BRG8BOn/dgHkyWaz/fdrUWY5ZbRTEzzlZJR2VW+yfs5YfJvC+ypDBAR+zYDN7ObsMUrQVRUjyGiIEPce9pCQmcDYoBPCszySafmJLk4QxgYTLPxFaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QC2HZZO/4b6R9rD4Yl7POrDLM98EoUEkh04jzdB2k8o=;
 b=KemETo3eo6sbA5PbdIzPEZbTAavcRN4g05xwoJbxOV8n8zoD2BU6bFTF0ffpbwQgTi5aQq/WkT9vm/q12EswVN8F5X8iCA5yIlecXqDFhD18knPc4oJqbXFAlADaAa0nhGHk/+75E0A6LffegvDTyci8rUCUptGsIogmdbQ+ah3dYAsYv0CVHl7hmONm+/6Q0256oWreHFRe//OgKjlMik/gVgDySUCHWb34tXwFKxlHPnUQhJdjkVvDWwpJ6h/yolla80mCQmL16q+Z55Uw0amJYiEWnk6275ZUQdl2dCuiy1us6LYs5F84PBHVzkyKUIe2IhJ9bM8BGCsgpV1pRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB7519.namprd11.prod.outlook.com (2603:10b6:a03:4c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 19:42:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 19:42:58 +0000
Date: Mon, 13 Apr 2026 12:42:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 Xe3p tuning and workaround fixes
Message-ID: <20260413194256.GI6301@mdroper-desk1.amr.corp.intel.com>
References: <20260410-xe3p_tuning-v1-0-e206a62ee38f@intel.com>
 <177590469541.453020.1631762697357446845@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177590469541.453020.1631762697357446845@a3b018990fe9>
X-ClientProxiedBy: SJ0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: a3b4101b-af05-4549-b796-08de9994dd7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 9RufJ+0G+/ooLD8aBpmEc5S/mmRQWg0mkVC0qOH4dJ8hH9FvXu/DNi8YOYo6CWBhX5jjWUMo3MawAjpsTkV9TTYcgfGqbk6DlL7XFMqCb0kI8rgR/bERfkUIVj+Hfg62rnhKyqCVGRE69Cs9uxn9Uo8/1CttROTc06aOsvNa8VHTUowZOirsvNUvVD8nfjLUMz3AcTdGZnTKGVX6qhrfFQ4nCDojRwUUGqz/7dlKs5EOWpW/53B0lMHYPfpyUNmyeMBVlNQZrBbWBPJl5aKYOVgawTbKzC2x8sKXITCupuWCFnTZICTcp5BRmx/9EkZmbMke8zD1UQxydHleCIBGyZweN/k81yP1cxEeUxAIyGSXt/COk4/VLjt+MZxKRZFEffS9bw7GZEhN1Rl9lSx2HIpQ+dzlazKIjGASxxNBTgsGJ9eJkhEGu+jASvOa4h0QXCCCN+GJY/RLBrcByXvh8y8T2UkLN1CPb7vIDLGhAAN8Fz7MYWaCsI9sfPXzoLgUg2wdTS2MZ0jmc2VcVAJVQSeOb77gaatwfjvc5Ix6l00p+hdwQGiQudsfvdLeiE02XqD1O5v5MM2dh6iLJciY0Z9KKYu8zxc/jvvg3/aXo1VtCykTgxnOMbRU/XvRt5LieC11OAjyBtWLVN8x9sBOiCxP4ZZPU+BfRj+Y/Zt9+u+hIPB4WdMAzY5V3riS+L29
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?df/Af5nxGkJC9dkHxYl8VLeC6KWU0gqp/eG3hijDMGNUb61VoGFGnfwtaKL8?=
 =?us-ascii?Q?cbw4USkwv7jOlR42C+BltNuauIC6DQNy6nGtWR7Bf1Vv2fJnd7HZaD1BjoCz?=
 =?us-ascii?Q?A5uWYDJH3LC1vDkSMb+p9zYZzsV6/5HS3vc+h3hAzGpXmgoEeJA3w5tlSb/3?=
 =?us-ascii?Q?kdDAoZXbzMJdmz3GrinLkK7+sJJZWrTnM7Uvp7kD+yK0sFpl+u9NkOj3/kUT?=
 =?us-ascii?Q?bKo1ROjzXR7E0QEqTN1X+mgqoP+ELlXBjXKVzjuspDgCUSaTAg4Mn80J8V5R?=
 =?us-ascii?Q?NoH6817WmNY8f6z56FyWDTOmrAMzRIWl032nRcykRLffIoaLoGxYvhhm5Uuj?=
 =?us-ascii?Q?DQzoUksHLBUtkdGrdsNF+cR+p+8gsG+hpqho/vZzCPaWp3B26uVPegSpO2B3?=
 =?us-ascii?Q?3mvqo3dHXBvuSn6EkrmF5LCFnP4miRpQtIT2PAe4UspBd3ErjsoX5hoDPqgt?=
 =?us-ascii?Q?zFWyW/dUIeWYFjoZLa9DJKicoqfDOPIMWgyUt9cqm18C5G0WlgctYty+dB4V?=
 =?us-ascii?Q?CIc4JWSgpUytrWEWPn+yWIuLBZ0fJu8D9CMnc3HD+d4COdUSPzKQVwJxm2T/?=
 =?us-ascii?Q?J/YvZiCeuQw7EciFaFZU2qkr8MMeCFOdzuKe8cJqLWWjD6MJ1XbExFmvSPAE?=
 =?us-ascii?Q?llNVxU2YLG35hp+HA/AWNKX+4RT4L/+Gxi8TmRYZupGKbZtBBdlu252LeZ1S?=
 =?us-ascii?Q?ZcNFJiaCUk7+oRoryqBGMwGGp+nycPKwQnGx02hQcuCnEP16YVC15UOIlnQQ?=
 =?us-ascii?Q?Ej7DRS/x2pOKugiytJF9Dcyd9zLpIT4rqyDcaJ9UJ7ff+WVEB9H2kKUqdB5g?=
 =?us-ascii?Q?k+IIHRcil0iPDsYhr5QDhfTD40YpLEraaiOb+EEcrIzJAsVVi6pv9UZT/0e1?=
 =?us-ascii?Q?/a9wwBuwMljazatudK52jzGVE4H6gmQTwy6lP3/hN3mpJwwdR4ZM5aM3i5vt?=
 =?us-ascii?Q?M3QkAdwXGvO1TKrGcvKrZQUm7QIZyNs0wjpL7NIAGWPJ5MYf68BOASJHrFIv?=
 =?us-ascii?Q?FowQB414zufgsQ3j5NEzXcN/RK6n1HzOP5WPfAJ78lVCMq2dci2B5UQ/iP8a?=
 =?us-ascii?Q?hBL034wJzod66G14wqtpNV6IgtW6Vqab9CTPMqOVkoeXOjVvHLcfSxCPvNrx?=
 =?us-ascii?Q?Ss095cf+Q2BU3wzrM5efCBzhuQPOaBsgNJUNrQl3ekhYWdYf2reXQs1JeVLh?=
 =?us-ascii?Q?5VZ/JrQFJjafa7Vd7CA21nwGY5KiqYTEo8IxQfOJkC2ssT2y/BCs5C1+gxMA?=
 =?us-ascii?Q?5w9EfGKdUPL1adJFZ4Lkb5++J4oJqWk9fcYlPKXlplKux+EpmTFGaetwt52Y?=
 =?us-ascii?Q?I8xgnxbl/WTSUcXgGz2q9t4OIwjnSxmWtjxio5cGZKZpYDLES/8+2jo8lbbe?=
 =?us-ascii?Q?ZMZp+G6zXRzp3FnZfr3LmOc9BJ+8eViIBNCFzsBGqi00gYJqArw5JCryOon1?=
 =?us-ascii?Q?YMe1il5v9no/SE6lIfBXu9krzuRKxs5fGYbJhEoF70iwTbpi6LCvm7cAtwI5?=
 =?us-ascii?Q?JkAI3kAq2n4ZRoO3NXBD/p1qGxJO0nsI9ROTDMs222S7X+lR5Z2V6uKaofgA?=
 =?us-ascii?Q?h5u6/rhbOubWdgU7u31xzDHIWYZtExDR45tYJn14+z4bSVHrF9C1UkJnctQu?=
 =?us-ascii?Q?unmLSkyNf7ImRsT7O5L53mjuRT2q09SYBiECsyUfer3i30m3QZh7qakxRBAu?=
 =?us-ascii?Q?D+V60gCRRo+i7zEpSYBalctp8TngoED/eavVLuvOcu/uDvyy3OsBotTRjcjc?=
 =?us-ascii?Q?imJEb70NgbCxsZPTwZOwQ2AFM7QdsBw=3D?=
X-Exchange-RoutingPolicyChecked: BC5eJKxnV+k8WsMyFOEYyWohhljbpo39eA+nHP2fmhE1wfRTzhVmVCzAFiGqDAx7Xh2FnnQePxJyMdTq+sTFSb3jhcXw5pFxeF9gb1VuzEBy7VWfbqG4XW3wX7LdBCheF/oevwja1vploPof+wdzBQuOGAkJVId8dBL3tqeg7XOa+RfIhNnTJGsFBo2SYSSXYOdK1+ZQDUq1NZ5Eew9SI3ayJXEjQOqDoMjiM2Cp9gQ6Y1Ts6pWnUWEKD9vnubRO8Mf5oKwb3VHBMutT5SElj+L2thzEe2acWQnGREuYbUZRy8yZfmKTevJ3r0hcSvg0OxoCOfMfyPYnWn+PKkGwew==
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b4101b-af05-4549-b796-08de9994dd7d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 19:42:58.5237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Co+i1H0/5ayQzhPIQiPmaDlyov6hz1gMiiilY5rE7V46uYV206vrz9qR1KfzAMLwByb4W/V5Z135FGg5/tPXvLxvI0bVa35/CSboO4BiE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7519
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

On Sat, Apr 11, 2026 at 10:51:35AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Xe3p tuning and workaround fixes
> URL   : https://patchwork.freedesktop.org/series/164719/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f_FULL -> xe-pw-164719v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-164719v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-164719v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-164719v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_edge_walk@256x256-top-edge:
>     - shard-bmg:          [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-bmg-10/igt@kms_cursor_edge_walk@256x256-top-edge.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-top-edge.html

Test didn't run due to lack of valid display config.  Might be a faulty
monitor capable since it seems like hotplug interrupts are coming in
while the test is running.

> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>     - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +5 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

<4> [157.570760] drm_dp_i2c_do_msg: 20 callbacks suppressed

A lot of aux transaction timeout messages are being generated that
exceeds the ratelimiting threshold, so a warning gets printed.  This is
likely due to the same flakiness that was causing the spurious hotplugs
during the previous test; a bad cable or loose connection is a likely
culprit.

> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:
>     - shard-lnl:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html

The unbind in this test is taking longer than IGT is willing to wait
(300 loop iterations).  The loop seems to have a bogus "sleep(.01)" to
attempt to create a delay, but sleep() takes an integer parameter, so
this doesn't actually do the expected sleeping.

Not sure why things took longer than usual on this specific execution,
but LNL behavior wouldn't be impacted by any of the patches in this
series, so it's unrealted.


Applied to drm-xe-next.  Thanks Gustavo for the reviews.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-164719v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#3658] / [Intel XE#7360])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +6 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
>     - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#7621])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-bmg-2/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#7679])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#367] / [Intel XE#7354])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +4 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#3432]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2325] / [Intel XE#7358])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#306] / [Intel XE#7358])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2252]) +3 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2321] / [Intel XE#7355])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#309] / [Intel XE#7343])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1508])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2373] / [Intel XE#7448])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1421]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7179])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#6312])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2311]) +9 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#4141]) +6 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2352] / [Intel XE#7399])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2313]) +17 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#656]) +3 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7308])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-3/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#6900] / [Intel XE#7362])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#7591])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7283])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7283]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7376] / [Intel XE#870])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@dc5-dpms:
>     - shard-lnl:          NOTRUN -> [FAIL][39] ([Intel XE#7340] / [Intel XE#7504])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#1489]) +3 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@fbc-psr-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-3/igt@kms_psr@fbc-psr-suspend.html
> 
>   * igt@kms_psr@pr-sprite-render:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1406])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@kms_psr@pr-sprite-render.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-bmg:          [PASS][44] -> [ABORT][45] ([Intel XE#7200])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-bmg-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1127] / [Intel XE#5813])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#3904] / [Intel XE#7342])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_sharpness_filter@filter-tap:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#6503]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_sharpness_filter@filter-tap.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1499])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1447] / [Intel XE#7471])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_eudebug@discovery-empty:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7636]) +9 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@xe_eudebug@discovery-empty.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-small:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-small.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [PASS][53] -> [INCOMPLETE][54] ([Intel XE#6321])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-small-external-multi-queue-cm:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7140]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@xe_evict@evict-small-external-multi-queue-cm.html
> 
>   * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#7482]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1392])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2322] / [Intel XE#7372]) +7 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#7136]) +5 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#6874]) +3 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-basic.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#6874]) +12 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html
> 
>   * igt@xe_exec_system_allocator@many-stride-new-prefetch:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][62] ([Intel XE#7098])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
>     - shard-lnl:          [PASS][63] -> [FAIL][64] ([Intel XE#5625])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#7138]) +3 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-userptr-rebind.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#7138]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html
> 
>   * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#6964]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html
> 
>   * igt@xe_pat@pat-sw-hw-reset-compare:
>     - shard-bmg:          NOTRUN -> [FAIL][68] ([Intel XE#7695])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@xe_pat@pat-sw-hw-reset-compare.html
> 
>   * igt@xe_pat@xa-app-transient-media-off:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#7590])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@xe_pat@xa-app-transient-media-off.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#944]) +2 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html
> 
>   * igt@xe_query@multigpu-query-topology-l3-bank-mask:
>     - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#944]) +1 other test skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
> 
>   * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random:
>     - shard-bmg:          NOTRUN -> [FAIL][73] ([Intel XE#5937]) +1 other test fail
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#4130] / [Intel XE#7366])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-1/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-bmg:          [FAIL][75] ([Intel XE#7659]) -> [PASS][76] +2 other tests pass
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
>     - shard-bmg:          [FAIL][77] -> [PASS][78] +2 other tests pass
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_cursor_edge_walk@256x256-right-edge:
>     - shard-bmg:          [FAIL][79] ([Intel XE#6841]) -> [PASS][80] +1 other test pass
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-right-edge.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-right-edge.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [FAIL][81] ([Intel XE#7571]) -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a3:
>     - shard-bmg:          [ABORT][83] ([Intel XE#5545] / [Intel XE#6652] / [Intel XE#7200]) -> [PASS][84] +2 other tests pass
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a3.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][85] ([Intel XE#301]) -> [PASS][86] +1 other test pass
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>     - shard-lnl:          [FAIL][87] ([Intel XE#1874] / [Intel XE#7305]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-lnl-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
> 
>   * igt@kms_vrr@max-min@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][89] ([Intel XE#4227]) -> [PASS][90] +1 other test pass
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-lnl-2/igt@kms_vrr@max-min@pipe-a-edp-1.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-lnl-4/igt@kms_vrr@max-min@pipe-a-edp-1.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:
>     - shard-bmg:          [ABORT][91] ([Intel XE#7578]) -> [PASS][92]
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][93] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][94] ([Intel XE#3544])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][95] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][96] ([Intel XE#2509] / [Intel XE#7437])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
>   [Intel XE#6841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7200]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7200
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7305
>   [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
>   [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
>   [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
>   [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
>   [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
>   [Intel XE#7471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7471
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504
>   [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
>   [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578
>   [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
>   [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
>   [Intel XE#7621]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621
>   [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
>   [Intel XE#7659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7659
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f -> xe-pw-164719v1
> 
>   IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4885-f52d25edfb0ca9916a6c4da50fe0b0363cd5193f: f52d25edfb0ca9916a6c4da50fe0b0363cd5193f
>   xe-pw-164719v1: 164719v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164719v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
