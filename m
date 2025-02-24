Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82197C021BB
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 17:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3743910E353;
	Mon, 24 Feb 2025 17:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XhpSCT/9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F6010E351
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 17:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740417839; x=1771953839;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VxfRS9jQKPGoZN+H2GnqBbDRYvyL0udQ1hcuobzYttU=;
 b=XhpSCT/9ier5c0wTEceYUhvq2VbqGAwjvDh1GtFQGU0hxsy0ef7AvWLi
 vZ2NA1kFpnMO8mLy6/TIGAtR1zTfw+bMA2qFqZLEE4cfPHWNyyK8oJ5UK
 IHh59NavLVaC9LpOQ1XwdtsTDqk5MCF57P13bXUKSiNrPN+GHKssQeW3v
 feFOIleJss8g5DQO0LSqymXJoV1qZJhRp6fxosrbkdEu7bgFJ/aZrJMmJ
 +R1ytO3laooo4BFABbcRkzfYQTaYeTD102yY2CXgeQR08AC44WTGXBe1k
 UMLi0SIGcSbqRCK53sED5o0bKmcarlN5gZjsR1+UT8SB13pCuTFa58ceE Q==;
X-CSE-ConnectionGUID: k2T1qKufRjmlHDn0Jih7Ww==
X-CSE-MsgGUID: UCHJqsDbRrKKktqhLaYCqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40894120"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="40894120"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:23:54 -0800
X-CSE-ConnectionGUID: MvDY6wXLQb+EK2kUuSxU8g==
X-CSE-MsgGUID: x3FQORQOQMeDyFD2/D4Zrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="121049341"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Feb 2025 09:23:53 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 09:23:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 09:23:53 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 09:23:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilkxzFlRDNZa7G7KgvSgLMqRuIpk9XU1waztsw/SqjAdQRmWVLQKb+DHzXCHInmzyerTCvW6dAapSEniVL22Mq0xbmvwIiZ1qrgRw9//VE28++LUypRrKOgYUt/xdXQA8p5hNhkzE57oC00Cz5r6LFK+wu27UGpYPYpfgPcBKjELgrU5cAFddouRrCutMxPNJsnS24d4WyudAqurhGQPqnfOYut4+p0yxCPy81saGWQyWP+ylf7Qb583V57D883DJEQvy1k8M8H3R+LXULNrmlzLAtEs6KDPDDwkJ0jbXT16zUdkUfV97kzXJIVHm9IwxM7K2n/J0FGGE5I6lwO0LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kj0PADO+uJaOfEXIw/w3JIHPwcFruOxxmQNjM/qje74=;
 b=y90a92NPxf3RRPQbcH3nGzGlftBjsK26Qu1BDgNw1jbfk9tAsZdb3WuNE5oOHyAerx+U8UI84xMvWJT/OP0rMMQc0HIH32Xq7+a0gTVRu7qkiwCIaIoo9OpeTfn0W79fZdJIMCE8Bs1PRipHuvWR+9zBKaIpn1Ey+m73oT4rBhbNUbpsrSdq2dv7cL+81rGzF6DKGDVFEO5CLgaeEEJZIHXjyKAUQsq4U1hxC5hrLoa7dnZaudrhQ+MnjqwJRk9aaQJFnlUQ1yFjxANTn7uuf9yOdnKJbT7eSp2xJouK9P/9St8mHeNUenjucX8WJRM6ds9f48NlI7wfcF3o15BSYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8279.namprd11.prod.outlook.com (2603:10b6:806:25c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 17:23:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 17:23:45 +0000
Date: Mon, 24 Feb 2025 09:24:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <thomas.hellstrom@linux.intel.com>, <matthew.auld@intel.com>
Subject: Re: [PATCH v3 0/2] Userptr fixes
Message-ID: <Z7yrYdbScj9ZKAYE@lstrano-desk.jf.intel.com>
References: <20250224165623.3077583-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250224165623.3077583-1-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0358.namprd04.prod.outlook.com
 (2603:10b6:303:8a::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: e3bd0402-84d7-4fb7-f0f1-08dd54f7fe32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p83yBzo6EWF3awFqJoE6NmBCTiLKEnVTtkCfbQSe2ducp/Ck7RKkCOzMx2NP?=
 =?us-ascii?Q?WMaNRF19zsZYKH91+0EhDvzav/3FSdjAe7i1TXc6jNR+Vs06aZmrZrVJjkp6?=
 =?us-ascii?Q?5Csi8pusNLaIm6YVu3Dc0LdLu6EnLB0A4O1Jw8FWgC8k9Zi3kP1uZGczTvNg?=
 =?us-ascii?Q?xEbxcbhhq8OSoVsO985kuzg6a17/SfBESD/9oftj+DAFMwNyRewww7S7mbbv?=
 =?us-ascii?Q?E4wFRTP/8lBVy/lYQ+Vz1JmRxoiNfF2QKAar4TkYRnPSwWyqgKCbqOFTehoC?=
 =?us-ascii?Q?q51wcx44gCfBMbxFQPecVfcjxBcxGuQXDgnnIeaO1UAimf6GkCNqKkz9e2WH?=
 =?us-ascii?Q?10nUJf6Anlq+nHOj7DlLfd6qAXMMkWcSYSQYoKYlsHyuERYjv5u9LjR46pY+?=
 =?us-ascii?Q?vvC0Nu8C29RntAc+3X42voGMZrx9XjTlHZe8fYEDZA1GhKf9FcpNZy9lo9bX?=
 =?us-ascii?Q?2UoVCIJ3wwK1u2hAAxECTthirLZkW1kjSjSTZUWIOuRMUAZDfeSEhS6QVnWT?=
 =?us-ascii?Q?fbp9phoko2gBVAdlBezPAHsDncboom5/nTithySO3Aj22H4gdjvZQ4wM81l0?=
 =?us-ascii?Q?NzsKZjwJcTH/apVEQ5RSJ2KF61nEb7LJdIFnEBeFEMRPUstqk6pZLYn0S70a?=
 =?us-ascii?Q?DyrScbNuzc+AAx2aelnWY/uPuErFp0Y//fj7YJQhgp+Y+d7WycjUwQ6EKMuf?=
 =?us-ascii?Q?C1bNHG4Zg2WYQz5ziH4x3itJkTHEn5+xxdAxyTeeKFRQxNsyH4gyOrYao6Vu?=
 =?us-ascii?Q?ow/c5fmLAotImd3OnFbusmylU+yqaSV0bbKm06AkBRQl/f7TADszZVJ66XOX?=
 =?us-ascii?Q?En+xjSBaOkzUzvRPNo2IOEjDmEOV9uiISznWHNHkM0KlHHozpE/8rsvKnKga?=
 =?us-ascii?Q?w/nfsJQPwRqEQuP8tEHc2GSRoHBDAyYTT+mIdelYvLV99TMZjImSB38RVm97?=
 =?us-ascii?Q?94faWmlbYYCYywXi2yN1uNijqitFAwh8YAWJNi+vp5DuPUM1Z8W35Pi55vlI?=
 =?us-ascii?Q?O7JhvBneaD/2I909OoX0L1OF/5KQezpF/LipXPUp66E/D0GGeOYGBQUsH0z1?=
 =?us-ascii?Q?8f7pkG0cM3Phpl3TfK58QapsPQOSohtvS9t0L7WjN5io3daF8yaZtnMV8nLb?=
 =?us-ascii?Q?0AerEoJGdfuccE43ChBP2pCSGQoq7A3GcBPEvsR8YyHRUooT7v42SC6bW+5E?=
 =?us-ascii?Q?pgqJbmx98RGrV8b7was6qw3DkXTl+EaVL5iY81kS+2Pt43BpOAmiafMtNu6q?=
 =?us-ascii?Q?jrL072ShdG0WVNIVAXwyMfH/1QPyR/VcO1lrG0k+jwfxtIieYq7VwhrQD7An?=
 =?us-ascii?Q?WFcvhrSji3Z0OOwS4P+qqrWfQLvvNJp3N4mkyBR4bvqcbBt4K+yCwNcTUez+?=
 =?us-ascii?Q?l/fWoWBU0z4q66rnTJHAQbxupeNk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7AElOBTkmA68XjY0U21t/35WzyFqA2XUJVK9oFW0N7rlnPixy2NVTBg3m8tJ?=
 =?us-ascii?Q?h9UlEKP6rBPNkwjHpJIoIg3NioNGokj9JwdJpWFnzgVPT2HVxs293WkzGyf8?=
 =?us-ascii?Q?3IYCHz1xBrjamOBX9HL4pC4NFPSJFq4kYUsZEGPk2nqtYWoxOIS65FpdyuDD?=
 =?us-ascii?Q?cPkvvw7GoXzsCe0vL/VUw5NP+lXClv7gDmU0E0PkDLvRmbVYZBwBQaxdau8j?=
 =?us-ascii?Q?tWlIBBnz1t+omcIxVWUP03W72GImj/RPt5ODIQkOwPZ/zuekEcgM9sXgmRuW?=
 =?us-ascii?Q?vcL92lJH4WKBah8Pl3Brsr8WXh9D7mXntSjircsaglVWgVGrsdRiIsUv+Rlu?=
 =?us-ascii?Q?op6fxx+tF5bGVRIaZ/Xwxia3HttNMcYL0oysTD4PmWwuuaD73lTbuWwAaHAc?=
 =?us-ascii?Q?Cba1CT8F4TiOCmA5GOsfalctAiJfJdIteNur75XeQfXxCOcfVt0wQ6JEc5sh?=
 =?us-ascii?Q?e2wJ4FfMCUombvUYUh/+EFJavuEpwgsnqb1Rs1uQbLY1ZzptWLiGmSVujTry?=
 =?us-ascii?Q?ijUGVtpBhRbVOjxYc3iJJUlJ1N3LGyGzhlI5zBYzic7+1QG1aBbLxzNPw1Tq?=
 =?us-ascii?Q?z4EF7Z2yHqnI+IuHsHFI/stYjcc64jznf7QT22qkd6koCSeF44KHAdvsAX4h?=
 =?us-ascii?Q?j6c39KAhOsYY0OqCRkH7ey0K4qK05b3W2xs56y5rI0ew4HzqeocO0qCxkPwc?=
 =?us-ascii?Q?4vIdDtxa4b5V8at9LlZGAXCKwWhAQRO97sqemJ/3p+FavHVRl849J9sIFxsl?=
 =?us-ascii?Q?TI+QB41mImvGpBerq8NMA/Pcz4390u8fQV6h6glYzt9+kTyY/1UlwZqkQI2E?=
 =?us-ascii?Q?d16NYICjqyH0xPdczCGeabZMb8qNWu4qsZeAHxz4Yi6H9057XSr/zmdBqAM0?=
 =?us-ascii?Q?8cS9OryZsSZyJ9Cc2La/2DtgBqpPGE2xPe+yhYIJNMPED+gXudmnRH/misXn?=
 =?us-ascii?Q?hoDjjhnKJOZpkGZPbUDhSFpA79BD0QOqSHx2kaLllJ/p7cj3OYeIzHgC40y7?=
 =?us-ascii?Q?ymt0ofDWXU2tCzl4kxo/+hwXNC7qplwZ9V/vwZn1jVB6Ua8fp+TvmXpRnau1?=
 =?us-ascii?Q?PRwJUc7PeZ37VFzPEYBzF1/bGtKVAGQUJ01IoSo1zCJmS/Pco4XF07YS+KwT?=
 =?us-ascii?Q?n1fopqVUFtDDTEehvfwPbXL+td63A0P8ilkopWg8nE4/uKugZR7I0fOmqNOo?=
 =?us-ascii?Q?XV7huxAmlcLqT87tdVa327n8bNst04AlEp0Nrw6o9HrzF1fIVs3H+GxejQt/?=
 =?us-ascii?Q?2PK80F9HVO+xRQSN/Ae4ZGIEpOn/Fy5f7eOiFk2zscCg5dFJ8X7SGwvtIt2n?=
 =?us-ascii?Q?mFBX6a9vq3jrfOEE+YyfB+xjIKgysknA21Mv/WgUQVTwEiR3fnIRiPmto2e9?=
 =?us-ascii?Q?mAZpgqB8JbvdhUKbUMqllHuSL22knInyZQNB+zkAHdCsl9nXW7aD/SS65ApP?=
 =?us-ascii?Q?o87i0qQ7UkDbNaGjf2qjH0Uo3PbUrMUyWV0YOUkMghZA4z3e1E4lZeLUGTsd?=
 =?us-ascii?Q?eB1nGVL+REgpLkrA+1yT2IDec31HJiGjFlabd/oddJCWf8htyA55cfHYgrPc?=
 =?us-ascii?Q?9yAySuXQZ2aKh29o7qk4Xk7mxfUKnYuGTQMLNStUt2VBiH0HUg+Hm7+5brd8?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bd0402-84d7-4fb7-f0f1-08dd54f7fe32
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 17:23:45.5937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKkDf6US6+IH4Opk7fgJ97QVwOMhgEIymLYJ+2ONhbmeQCEQNSSsRSVTGTE0xOg0n/aXRGe1DOahoCUE5J290A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8279
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

On Mon, Feb 24, 2025 at 08:56:21AM -0800, Matthew Brost wrote:
> Tested with below tests on BMG + CONFIG_DRM_XE_USERPTR_INVAL_INJECT
> xe_exec_basic; xe_exec_compute_mode; xe_exec_fault_mode; xe_vm; xe_exec_threads
> 

Screwed this version up. Ignore and I skipped CI.

Matt

> Matt
> 
> Matthew Brost (2):
>   drm/xe: Userptr invalidation race with binds fixes
>   drm/xe: Add staging tree for VM binds
> 
>  drivers/gpu/drm/xe/xe_pt.c      | 74 +++++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_pt_walk.c |  3 +-
>  drivers/gpu/drm/xe/xe_pt_walk.h |  4 ++
>  drivers/gpu/drm/xe/xe_vm.c      |  4 +-
>  4 files changed, 60 insertions(+), 25 deletions(-)
> 
> -- 
> 2.34.1
> 
