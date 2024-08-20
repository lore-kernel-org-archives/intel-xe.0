Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A10DC3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 20:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C75410E366;
	Tue, 20 Aug 2024 20:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQxC/HCJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE97110E366
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 20:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724186931; x=1755722931;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OWEYxxM2sho5E1/kHO4ZdL9iWo/MR/dlrjXGTyvyJm4=;
 b=mQxC/HCJavIzl90EplQr7pVYQpOh4GYxg2Xqi4w3iVAXdWWjgnJ3GC7p
 7vbexr6SwsHjscVy3oaMfNX+KM05gZn6Kk4rF5w621ZpbT9AOkRO9p2aA
 QwIBzqk70HZ09btcFrhqtjzKb0ZylCxkrgdW4hLveWuvC7yR6Pj9es0Hn
 rbm7+sPsJPEtVs5HHOl1/qOlaKqZ8WTvICWbYI7LMkchz1s9QDNiPVVFd
 zVZ0hpOxoc4owKR3ccpkzPiKNUjGYVzcPkVa+x1E84EjBS8x/3ZbMa4bP
 TH6TTspIjpbGd+EMi3Gl689f5i7/i+U46/1Nr95KHNlmquPcjH2AGY/u8 g==;
X-CSE-ConnectionGUID: Lh2GHp/OT2uLcrUR4XW7UQ==
X-CSE-MsgGUID: 3jKEynIjRDCh2vMToOlXLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33905478"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="33905478"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:48:51 -0700
X-CSE-ConnectionGUID: AQIOIOPIT0W0Y1Sy2L5CpQ==
X-CSE-MsgGUID: jwmsk0kjSmiHmu65z72g8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65743498"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 13:48:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:48:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 13:48:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 13:48:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCNsCiq10v7q9gPRkBNlr73OldIYBAjm9hzqjewGvjOdUyTtSDN8ocaIow98vGW8dZBdTH64QD8C5hXWiAOZhnDZ0Sy1fbzqV4evoGHRAIsdllGPDA9EWgClxFLvQgqBliNLhjLmqiS/nyz96DlUshJuyTfN9klgvLzqmC/atkB4Y6pXkTDgX7sJJWaCAi2icGh5Iy/POuDh7KCTmgkX8OGy2iw68Rio/BXrMfLOwpuc+0W19gA78UYKULuCo4Q6qcN9Jgtfa7u78YPB19TBm21w9f6G69zHYUfNQpQsMZ+XTsbSuQ8XxEVqTcLSPfSK8AsekEyWl2emUUcXE+UbiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLIAXEPq67wrmQ6pTWVqqcg+F6CAwqVde4SXqiPaRbU=;
 b=DgbyjyP+d+YxhMSwfo+/CgpGA6TTAoCdTPBhpuEP8kSinLeDF7q8XP7TWDtm6CFtPsOvk5NLTyHTjmC48Cr7W2PiHe/FWDCczPngBV3/LsTlE6bZLQgDb1iTKMmSRl9/Xhztcr9Cy9BD3iJViWUBi40fPd3PiliYabRqXY8u/iAoxUReBaxjJVSeW3PKQHGFKp4xlVgWCSwz1Ji8xq1eYIPcDOx+ApSciIlVgKKmgtGWMP2WvNWcwIYPU07raCc3xEkXQckLM4o8iijKyWC11qABFkvcNfp4HCMQE60J/f0AP+5q6oEtq1dZmj+RaDqraN8lDrYds2Gub0nURk2e6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7474.namprd11.prod.outlook.com (2603:10b6:a03:4ca::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 20:48:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 20:48:41 +0000
Date: Tue, 20 Aug 2024 15:48:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/6] drm/xe: Move hw_engine_fini to devm managed
Message-ID: <b6qn4ivrrjeuxpqvvlfviqgqt4qwsgs642p6j4t5uri4fhc3i6@e3ejo6q7zsux>
References: <20240820172958.1095143-1-matthew.brost@intel.com>
 <20240820172958.1095143-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240820172958.1095143-5-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0361.namprd04.prod.outlook.com
 (2603:10b6:303:81::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 010ebe54-f138-4bf5-83da-08dcc15979ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zrk280jxVcqCybraQHj8ywHODLtB4iMgQzb1R3nuX+FhQsA3ikKownGXQl1l?=
 =?us-ascii?Q?DmyUJv/unNIHQMTAg+PAhtA+XyiY4dSTPwFqEVYHh3aZ5m/COlxI2g3timy5?=
 =?us-ascii?Q?p+qIw8Hu48Ywo26OxgV76aEM0YMvOTajdoVjzjfcJejGAZ/fm5AbA4FP6jsr?=
 =?us-ascii?Q?43LDQ4fAfoJ6ylrHpM8CouB+OW4vtCLielKOyAXlSP9NtdgrSCFnsQC4OTI1?=
 =?us-ascii?Q?aPCm4f1Sdq0vckyjZ3hAt5+MvvNZTA1keQfy8JsRq3jT/jSVZEqsB5cVXnDX?=
 =?us-ascii?Q?EWIdhQIPK30XlQBPNJxNqB0JMtC84MqjXoir6elnQhq8nQ4Ecd5Jc3z3AYiM?=
 =?us-ascii?Q?3vRYii3auGqxAt+mUvg7wSk5ij7hmCoy6RM27AC3yk3eaeuho4JTNPVhXqMN?=
 =?us-ascii?Q?7FbBzM7IsuzorrsqVsPJ0+/1aZWrq8u2T84SVYbp31d1xWfmntkXuCsHFTCp?=
 =?us-ascii?Q?BsH4n15rk/v63jsFBuCkMZPNqTonUBK4VSaPzAPXG7Q4ssR3wQaQoOfpdmV5?=
 =?us-ascii?Q?H/t654oezJXgGaCeyK1cP0Sfi0zlKEBCPbF3pQKzem6sR4uhZ+qt1tzGBf9j?=
 =?us-ascii?Q?7kbfoN+cEXZgZ/Bc7vDNWWT941c3v5bb3G5b5WW8kNbYR0FcTJ8WL5EBx89f?=
 =?us-ascii?Q?QC0sryDwbi+fDupZRBtGpm5nJkmyGgMia5ksjKGkSmineb9WZVwsAqWHuu0i?=
 =?us-ascii?Q?2/K6GyNC0WYJfy9/3vwHnC/xOyCLlg3+zmMMa0Q4Mtrp3HzBHz8GZcujhP8t?=
 =?us-ascii?Q?dNL6Nxwv37flcUPpDMSiuDAW5AykL/p8XJkYBlQXD9qyorp+d2+pfmJKtmyB?=
 =?us-ascii?Q?d5Mp7srgRXTS3zAYUA2/0nIjmQe88+TpQLNa3vtXLp+fUOazq9y3WGv0ZRvb?=
 =?us-ascii?Q?MBvt2yQkzD6yg8CEK1dy+ZcvvNSG3xkJOTyJBqNPvpGokyvGbIElG9Fa+mAI?=
 =?us-ascii?Q?wk5aIX0MdwungAz5rEkQFqKDDxhcThCBtkpxnIr5evXzJfSPHDfUhK/LZawx?=
 =?us-ascii?Q?OXP0lfJi7P3Vx2Iulja1vzj1DZCMassFj5wQ0dABEXbcdrFg5e8MbZ33ftKh?=
 =?us-ascii?Q?TQhWzo0vDxyuYWop80yUaRN9cjDhybyfBDCIqRKIABtla1I5hO8OoGg4CyP+?=
 =?us-ascii?Q?9Jla5X8eI3lcNib776TRgAQwPRm5aXJotzLuDH+fEnwWBfs8z/akA1yTiVdM?=
 =?us-ascii?Q?ynRmiuHR0jJdOFgZCEJjPPCPWUjUzN9H2S8EXbdqp68Ogowxh2MeHjkPm0aZ?=
 =?us-ascii?Q?WoK8C233TWLqcLmdBc9fxXey+amjB1RZBzlcg66XPBq0REGgFc0S10k2TPsl?=
 =?us-ascii?Q?UKstXN+/RXwCtgIej7//iL2W6vmdB84poS5RmxEI5L+4/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TLXv5iapsDOIn77/Xb9jcdHksntSubNi2RXuX1Sv7wgdypDdUHDDiwH45Bee?=
 =?us-ascii?Q?jozXys2vzPRK+gIn/JhQKevPMg3V9P0K2djS/d9b1AD1BRJ+ezrV3x/NAMVx?=
 =?us-ascii?Q?U46M2I6+kyblH4TKeWfM5uD701qhi4JeGPbzy3hIQuxakV/ifTuzljrRoOlh?=
 =?us-ascii?Q?5UKsYtl2l8setaLe7tyM02Y7yBtmslkHhKLrKxwQLvgMN9qg9Dqc7YS2iZRg?=
 =?us-ascii?Q?Qyf7i4f1qzNnXi2jlga0qtqpS0laLlCEbXWvXqZnMoHoOmrRL0ZPyVAVZoXd?=
 =?us-ascii?Q?FK9yaY9bRrrew0tvZvko9JS2X2JaEHHi9Uh/oQcBi3fEWobdERfauBH+F0ZQ?=
 =?us-ascii?Q?ITtkPgoF7lbBLScEhzE2yNfnvviECUdr0Wss3d6frIVOYKa9lGGm0ShK1GD/?=
 =?us-ascii?Q?0R28EFtl2BZhE/K+LuaEYw9kP6W3bUWeQIXU6gIGTv1qthHsYviMvxyDm8Pg?=
 =?us-ascii?Q?avl9k/UYSTVpaEVYiQBluygC+RRV1Nw99PVzzxQ8CIbQLUX3Q4eD7K2nPwSD?=
 =?us-ascii?Q?rVFSmD2k/Ffqx+2RIhLZDrpozU3vUgZqCpNGPb4FoDnDvqBqq6C7vhehffXF?=
 =?us-ascii?Q?0ADeY0Z67HrMQgTdIWA5JjNW8GOSbH4ZK5ebTlu18x987mMjU3vMs2ojb4Ni?=
 =?us-ascii?Q?1Qe532gy0aMlYkKXrnUgEdoXo59xU2LUuprr1zudx544QjFJsnse+nJ9jaCC?=
 =?us-ascii?Q?yqdMHhWUzvCPtcqS++yNaKOgeFecmFo/qaCIwXtO92dIAemLPdHNrMip444W?=
 =?us-ascii?Q?LlKTR3mBUjXy8dU8+z6zIUNmjflQvDB13OWiuIxwXwkIxmpFLaiBCqj8lGWD?=
 =?us-ascii?Q?cJTcPBwop+tewQIxVrWy4mHfPbphKTkgY3xTf0dw7+kTCs51rV1AKJCOidRA?=
 =?us-ascii?Q?5rR/5SrJxhRl/JKI2agHMlwB2HZMKk1hFxr+3uUhna+1vwuP4psUA7Cdgghx?=
 =?us-ascii?Q?0Ib6fSk//dIPalfs0OS+BdCFHn3bjfww7qB8TVzDh7RjjPEwa1ORnMtsuCpo?=
 =?us-ascii?Q?/OyqWuD6RpHobcRgSzQvO1dY9KVXWU2qoerKdlsrjVcipdyJ90szXwcCC+MT?=
 =?us-ascii?Q?xYb/LCGq7edANMoGk8Kud8q/tsy4BKXKILAdOWT1O0heAdeL1CFjJhBpnd7x?=
 =?us-ascii?Q?UwNMbo3YpLPPNYR0YFJgqiUxKp9ekatFoAZuEdb1U/Rv9+EYPxgvbOAiupke?=
 =?us-ascii?Q?mUmNlQ/tiJDNVKH32GSqKIXx7LSv+fKUjWezGnb/HAq/sK5pdpgpvOLQn/u+?=
 =?us-ascii?Q?t4GJLukeN80yt6eM8DX4ac0kI7gcj/44xbsq1O9lVpp7oRPNwX3LLFiz9Vi2?=
 =?us-ascii?Q?jU83slazzS43pLzTambDWYJCBMSZXBitldGDjq7KA6xe1EJmNrbebiLAQ4Pz?=
 =?us-ascii?Q?BUoMzVW3XAQyATLtQcCIznrXXihH/r6/ggj09YniQi8Kc8BwjIaZmIHOBCWG?=
 =?us-ascii?Q?RHTVWKtcgJONhmqMgb/mn2/GNeqHm9TjLXSops441zhALHKALUBoS6pW01Lu?=
 =?us-ascii?Q?g2WRhrIYhfGj5vQsC8f3k1In3VSI0PSRqz/0yUQuYJp9j/wEBQyvBigMfsWJ?=
 =?us-ascii?Q?1jmEBaF2Sb6frRYIQDJmumKKzgYTl1eViGLraN/PkiGHSJkaI/8o+t0vvIq5?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 010ebe54-f138-4bf5-83da-08dcc15979ae
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 20:48:41.9178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWR1PdZuT1R5sTLSibOC3plFIPM8FZpt3HZRZQzjpvGeFRRqPlnZC+T5qtIolqj9DTHpOqGrg6KWwYyhhpQpxXcq1vYymkT2cRc62oFl9aI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7474
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

On Tue, Aug 20, 2024 at 10:29:56AM GMT, Matthew Brost wrote:
>Kernel BOs are destroyed with GGTT mappings, this is hardware
>interaction so use devm.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_hw_engine.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index aa9b2b16a6e0..18980238a2ea 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -267,7 +267,7 @@ static const struct engine_info engine_infos[] = {
> 	},
> };
>
>-static void hw_engine_fini(struct drm_device *drm, void *arg)
>+static void hw_engine_fini(void *arg)
> {
> 	struct xe_hw_engine *hwe = arg;
>
>@@ -585,7 +585,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
> 	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
> 		gt->usm.reserved_bcs_instance = hwe->instance;
>
>-	return drmm_add_action_or_reset(&xe->drm, hw_engine_fini, hwe);
>+	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
>
> err_kernel_lrc:
> 	xe_lrc_put(hwe->kernel_lrc);
>-- 
>2.34.1
>
