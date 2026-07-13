Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AC3C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 16:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AAB10E476;
	Mon, 13 Jul 2026 16:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gC9BfzJF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F2C10E476
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 16:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783959481; x=1815495481;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x7J2IE0n21/vv6n1U1Q8T4zvNIq2qAfhI25NP7wbUjo=;
 b=gC9BfzJFRca1xka4Vua2XhgG7/69etNAgbF6nhy2J0xblI7xrMyXmfeM
 9jEAg2TvocSVmbUS6/7mo9RXCzAGtDikFZc+gHGp3JiaiOsiceeD6mU2w
 wEgIMKwTbE6bo41X7E6mEqsY9qTp66mh4ihhq8uO5xPMD6M4cTKSvbzoe
 wYGRU7uiVKuObNRByWYPBT3eWQEuKP6hcPi9gizGx6Ea903n1sOeXYoxA
 l6AbyxQAJMjHLdpVnWhbAG0c7lyjWxX6AXGSmYm1s4Jv1WTrLPpa4bo9I
 CwU5PhU6dpbY1ObbFcH/l836/1RhIB6W+y8vIAGBiIiqrNDmlE7i41+LJ Q==;
X-CSE-ConnectionGUID: sMuBoQG9TiqOlSYLaGQFQQ==
X-CSE-MsgGUID: CyJ8AMziQ+C0brO9OaUflw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="72096393"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="72096393"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 09:18:00 -0700
X-CSE-ConnectionGUID: DnfILCgySiOQ/2SYUZLNdQ==
X-CSE-MsgGUID: gHZSY8lzQVySbdQLa+cFNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="249241728"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 09:18:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 09:18:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 09:18:00 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.16)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 09:17:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvx5vaBpRhUXGMLqMKqVd+54/21v9EX+yLKZ7d5gtSqfaobls0DBszLcy4MuFWGW5oI193iZcq5QPlOgbBtNJKQdY3YkTJ4jKrDJPEPr3Yssppjl/QX9MXcWbsb950Vplc5UwFpUMcBiYzlgX9x6N6kiB4uAmOFEhdk7sMfg0X9Ku9UzAvCODyWD4vuu6TVPsbkcglgLIng+Q8sLLyl6kqjCfsJoCNLkhtYqUqvCsurClVKlGNeTyvKNL9Jbt/Gid3Jhd5T4OpF9fkzvIkGbL0k/GYFcpN1UaLZEGIM1CCzk2LTLx4H0MXqK8Yf3Y15HxznBp7jzNtrDuXcLmkmEEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfN+Y6H6ZxF0mqE5uxR4G9RAG1TkZk0uywewzUDeCHA=;
 b=j4dis2D4WVnqN2PfU4RocUrYUvtfU4fYTzf2+X6lCfFPTQKzIlORGswDRrAWGDYRJTbjM3fM4GKHZu+5ahyynSblzdmjDMkOl0MVkwKDvF0aanPP5FYCtkhBjy3JVkfhqgYOGnnu2J6f8JRB3pDFSGgPCFoT451TmT16Yztcu5QhCFwelDEkq5H85WrGOX4kpHeDK6Gfa2NB/WE5a8yDKV9Qr8yTPtVqbzqCKGHV2BXsiUUaBrc/RazWSnoOiB9wmn4mx447CPIdFGcbXHMNOzWrTTW7/wpjdybt6qBNrlFq/Ihxb2jK8Nekr5TK6Vtri1I9W2rrsTTK3Z4KGMczcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 16:17:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 16:17:56 +0000
Date: Mon, 13 Jul 2026 09:17:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 3/6] drm/xe/guc: add uninterruptible suspend wait for
 cross-process cleanup
Message-ID: <alUPsce7S3Kh+YY1@gsse-cloud1.jf.intel.com>
References: <20260713030005.2123322-8-niranjana.vishwanathapura@intel.com>
 <20260713030005.2123322-11-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260713030005.2123322-11-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR02CA0002.namprd02.prod.outlook.com
 (2603:10b6:303:16d::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 51a9639c-1be5-474d-6f00-08dee0fa4c33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DIFoMoZ+fwyn8xQKY3v6G/HLVaItXH++TWM6hsjmUoGCI/TQ7lYkvAlsph0ESdb1i16c3+J/SJOF49BMP4KVpO8J60+hPvKI+XDiiTiwWQ0ZdEwEBo4yVBeQDg4wtc3lOVzVGXb+LM93rcPhFa8zOCA0Dzk/v53jnMzi0tfVgn+X4GIz6VCQ8lijg6ZvNoeCk+eP/WVWzGEq2Mqmd/6zT26c74QzxI1LyThFCaInO5Z0sud0y23D/nH/SZrOr1iknyJVtLRWGzyotBiOBR0nikyjRoJ1rUZoXQvtD5+uPUK7bOiUR/05gmuT4+czBzB/dHTebfEJYQ5CuslAVL0Ul17UcwYOHmPL6PT3Tgil3ezYlfoMRVm6RDM3AjO4hYVo50Df17vX8VTcVImbBeFxWY7gBlSLgMVOGM99wG9djLdDX7rVLuhNHxhvxJfOIbPGsAier+hKwwRGi7wriN6GdjWy+grwka2dmamYmVLuTNbMR0YyOtd+VUMl4G42CXZ7S/QHjPuDGG45c59hPf3KD8WLe/xg31W3Q5JTLe5o6+/i6MiFNXVZfvQ2qD+x+llXzRmti5l6J9otIrwpzrg3HKm5qmt58+hZU3dGnX/DiUSJZC5sh1eztUjoSKeNjo8AjdeBX+QO87/OAW+96q3+q4cX4tvcGqIx2lwe2wwRpdw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EZ6gAlkNJW64uh80hRGTgA4WcFTXmLxltLLuD/YZI0VNLRz/b55Q2eWLeEZi?=
 =?us-ascii?Q?JaGvHGskMYb26t11UcUpEgaVy5pxyGw5pMecXyiImweMmdva7xILCm+Q18rL?=
 =?us-ascii?Q?jpFWp8YoJ16wOMDGsuyJiI49Mnld7mfQuvELO8n5HsAB5rVN+3GXFrXjiWMw?=
 =?us-ascii?Q?NZMpoR7y01ek7MzyAhE97AiC5wlKeH7u4xWz0XT9MUhpAefE9bbC1sdXA/t5?=
 =?us-ascii?Q?oySbiPy393wMkdx3L1DrPo8r1t7IjpACyO8bt5MXfzuPxa8gSkClU3P+m8Qo?=
 =?us-ascii?Q?DaCQQMZJ/cYCyz24jyLy6rNBKcg4onnFe5hvpFEcBTc+LZtKN/Af0INgvUe6?=
 =?us-ascii?Q?VvB3yAJvjeET4qeR6xZbGcDvpFmriv+PDwF4PN9ejqkZ3bjq/ZuwgpBUMoIW?=
 =?us-ascii?Q?1ot1YviNkt926R2Qji6oC2Ay2BMMAuYOys/GiuKSYoBpQP/mDE/d9p5eeyHL?=
 =?us-ascii?Q?eWE29D5/BRrTdk5W5ERMIV+bO9otJU4vcuzSilKOGs72JDdkL/+nOA2nNUq5?=
 =?us-ascii?Q?vzqm0Zr91ltSHSG5VorL8PtniFiRvvYupib9lHTRgOSgZjuylHGZLFBJ3dcy?=
 =?us-ascii?Q?Qgwb91v/JYzGRzlc+ICcmctIq8emuwYLwyJIWaYk0UrXF01YFsNtVYYYl/f4?=
 =?us-ascii?Q?9phiOBu96Y+0wwFVwIQbaN8h+WZi9QxqPWkH5uzekoxruCXqAVTdj3SzjR4H?=
 =?us-ascii?Q?xpDbBNnajexpuubFRYyYydlDNCC6hIFAKJmFqLFx9LDZ34ejdMSS3wfNtEXA?=
 =?us-ascii?Q?AZkz4xAb/7SIvnHsldabxLdI2LAvzuYCsDrCAlpvmsELkYFchjwktxjFyn0J?=
 =?us-ascii?Q?zctnehQg6n/qpVgSmWE9uhaxC5b7AXcTQMjsIhs+EzW2Csg/mujOKIc/IMhs?=
 =?us-ascii?Q?w/1TD3JMTeHtLE+io/bv1Q8nki/Ju5L9KHie36wXXhqaXh38lk8pbri9nln5?=
 =?us-ascii?Q?KmW/K/UXIdKjvhZWatKQeKHPzDCe1z/MnmD4TKbMX36MdijYgiyvipbgZfOM?=
 =?us-ascii?Q?iiFfgoGWeO0veKtmCWchPOj10sBpiQHqczVaw94zHZC/cF0e7U6oGA7QJHBl?=
 =?us-ascii?Q?dnMahi5O2j+HFdrCsNByRT4zHEroWOAg8TrLVPq4EFFSeja4vOxY473DGXDd?=
 =?us-ascii?Q?q6yIcmPGaagu9XgswR95XXuwkbvWL1qI6z2+iXuQSCk0+37pOyBiulYacAR8?=
 =?us-ascii?Q?3bhehNKUmM48VXY/XLKaHLFqikq58vyJcoH+Z/nVjFT+LApr6j9AbD89Vna5?=
 =?us-ascii?Q?pcZxqBmoLuFOIUlKQyiWXgplFeg1GvR+oV6DGFSKg9GLgW4ffQoYFrCG04Hb?=
 =?us-ascii?Q?M0q66i/zkb9fiQQiYGRgIcc+B2gyjiSsQBsTslv6xa17apL/VVXuPsQfwPD7?=
 =?us-ascii?Q?o2ZBELd4UGRVxvDhsOkBigNSAtqqOwkrCt9EVP/UF7pGRNalGgWAJTE1yKv1?=
 =?us-ascii?Q?fRDsusp7qrX0fgjU0ipFiuULmUVZSmVDmLjQvZ0ZMv2moBhp0ra4N8Tndg9m?=
 =?us-ascii?Q?nwVckRQRbBwDwjaj6VP6mcr9+Cm6XKG8Cr7G0DXtngpzSCUFTcRyPwYAoNEw?=
 =?us-ascii?Q?pAScwICF8PnG2DvZ7TE/zJkyeldPvjxFZ6CxcUQTuBR2kfaHQjkzIcE8RDYv?=
 =?us-ascii?Q?dEgQNXue2GSgIfiCJBQO/gof5FGox7HXm7d/W0SdwV3e4z5deeD1L8LJPl6c?=
 =?us-ascii?Q?Z+Q4wdl6Y7cxFano29NZ5stf2lUIijKoWWcZD7MaYPTGHEeOKIjAbG+HwSv9?=
 =?us-ascii?Q?bg6VMc6ahQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: YnXQAWT13kz1RE6bYmkdT2DkPgfy6kRMk9aRQiVw+Hl4SSWTBbqTSstVh4EBgXV3A4fkIGIvkyZd2uA9XqHgXwtefd8kjYM9hQBIUOLCVEQ4hGb0hOw6gDewNZHTpLVIfURVkHr7HFIj67KjiiDewdT5kPs3K6RHhoKw9BhxR2vlA797yXQGkYetIVo9figwImLBd4WslVY/j/hkc0wa7iLsCqELdd+V/rBggw/KC+b4NEMSxuMo4oicxWtMeGJ2jjuqqe2cdRVm1y7sdBSH1XuPx3zjOvWHG/CPeZK+QBJnoEkLJDnUfFyw0uYldfaaaYGYb4RTJYwcwbaaIsqKnA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a9639c-1be5-474d-6f00-08dee0fa4c33
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 16:17:56.2753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNTxNlDi/R+XwVM3hExbhnqxFA6LTIyKx/+9wEAG7kLjqJ54TF18zczu8jkeuzVEkd2Gb/JDoBhhdRVqSB9tuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
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

On Sun, Jul 12, 2026 at 08:00:07PM -0700, Niranjana Vishwanathapura wrote:
> Add a suspend_wait_blocking() exec queue op: an uninterruptible variant
> of suspend_wait() for callers that must complete a suspend on behalf of a
> queue that may belong to a different process than the calling task (e.g.
> cleanup/undo paths). An interruptible suspend_wait() returns -ERESTARTSYS
> when the calling task is signalled, which would leave the other process's
> queue suspended forever - a cross-process DoS.
> 
> The blocking variant waits uninterruptibly and, on a genuine GuC timeout,
> bans and tears down the queue like suspend_wait() (shared via
> guc_exec_queue_suspend_timeout_ban()). It deliberately does not handle VF
> recovery since a blocking caller cannot retry.
> 
> Assisted-by: Github-Copilot:Claude-opus-4.8
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  9 ++++++
>  drivers/gpu/drm/xe/xe_execlist.c         |  1 +
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 39 ++++++++++++++++++++++++
>  3 files changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index dbb2ee8eb5de..0aa0823cbdaa 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -322,6 +322,15 @@ struct xe_exec_queue_ops {
>  	 * avoidance mechanism.
>  	 */
>  	int (*suspend_wait)(struct xe_exec_queue *q);
> +	/**
> +	 * @suspend_wait_blocking: Like @suspend_wait, but waits uninterruptibly
> +	 * (does not abort on the calling task's signals). For cleanup/undo paths
> +	 * that must complete a suspend on behalf of a queue that may belong to a
> +	 * different process than the caller: a signal to the caller must not
> +	 * abandon the wait, which would leave the other process's queue
> +	 * suspended forever (cross-process DoS). A timeout bans like suspend_wait.
> +	 */
> +	int (*suspend_wait_blocking)(struct xe_exec_queue *q);
>  	/**
>  	 * @resume: Resume exec queue execution, exec queue must be in a suspended
>  	 * state and dma fence returned from most recent suspend call must be
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 6b86b4f9cc1c..cc33ae80e8cf 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -468,6 +468,7 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>  	.set_preempt_timeout = execlist_exec_queue_set_preempt_timeout,
>  	.suspend = execlist_exec_queue_suspend,
>  	.suspend_wait = execlist_exec_queue_suspend_wait,
> +	.suspend_wait_blocking = execlist_exec_queue_suspend_wait,
>  	.resume = execlist_exec_queue_resume,
>  	.reset_status = execlist_exec_queue_reset_status,
>  };
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 3ece51451f86..de9c131fc62d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2290,6 +2290,44 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  	return ret < 0 ? ret : 0;
>  }
>  
> +static int guc_exec_queue_suspend_wait_blocking(struct xe_exec_queue *q)
> +{
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	int ret;
> +
> +	/*
> +	 * Uninterruptible variant of guc_exec_queue_suspend_wait() for callers
> +	 * that must complete the wait on behalf of a queue possibly owned by a
> +	 * different process (e.g. cleanup/undo paths). An interruptible wait
> +	 * could return -ERESTARTSYS if the calling task is signalled, leaving
> +	 * that queue suspended forever (cross-process DoS).
> +	 *
> +	 * A timeout is still a real per-queue fault, so it bans and cleans up
> +	 * like suspend_wait(). VF recovery is deliberately not handled (no
> +	 * -EAGAIN) since a blocking caller cannot retry.
> +	 */
> +	q = xe_exec_queue_multi_queue_primary(q);
> +
> +#define WAIT_COND \
> +	(!READ_ONCE(q->guc->suspend_pending) ||	exec_queue_killed(q) || \
> +	 xe_guc_read_stopped(guc))
> +
> +	if (IS_SRIOV_VF(xe))
> +		ret = wait_event_timeout(guc->ct.wq, WAIT_COND, HZ * 5);
> +	else
> +		ret = wait_event_timeout(q->guc->suspend_wait, WAIT_COND, HZ * 5);
> +
> +#undef WAIT_COND
> +
> +	if (!ret) {
> +		guc_exec_queue_suspend_timeout_ban(q);
> +		return -ETIME;
> +	}
> +
> +	return 0;
> +}
> +
>  static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
> @@ -2329,6 +2367,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>  	.set_multi_queue_priority = guc_exec_queue_set_multi_queue_priority,
>  	.suspend = guc_exec_queue_suspend,
>  	.suspend_wait = guc_exec_queue_suspend_wait,
> +	.suspend_wait_blocking = guc_exec_queue_suspend_wait_blocking,
>  	.resume = guc_exec_queue_resume,
>  	.reset_status = guc_exec_queue_reset_status,
>  };
> -- 
> 2.43.0
> 
