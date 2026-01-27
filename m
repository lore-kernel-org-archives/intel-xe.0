Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41E2D2FEDD
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 19:50:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB0510E104;
	Tue, 27 Jan 2026 19:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LV7+gvzb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7A210E104
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 19:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769543411; x=1801079411;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UCdhvN1lmV5TuEHzPgXowBbakL7sRPGuuTZO8SjI/GE=;
 b=LV7+gvzbGwnSNaG8N1WWNVnkGAP/3wLSntTRxdv3BOIYtjSySW/HH9QP
 8NhiorSg6ZKtWspHL1MC5wJotHJm11XTkXywWpK+x1VeafPjyF72z7JNk
 2Ib4hCwr9vFp970/hjMEPVmQ+nQFEbbz1NVP/Qe8ZVks24Ndq/JeWrkgx
 GqYjELQS6nd/uIBO6sSVGx5Bx+Ki+hyGZzPWuUlRJEOtjmL/SEDGlHffA
 V5j4oEaSqtqTVU5aDGXs6Haoq0hhyc0icwe5rkqxRmVKBmzPSdvQLqFuB
 450w3CF2NRbcjB3ZzaHXomwwk7G38Qvrm7cQ+qM67fff6w8uFxXm3aL7K Q==;
X-CSE-ConnectionGUID: zb4mgtPXTriVnR6lYRuXxA==
X-CSE-MsgGUID: PmI/HP8iQG+923N6GQdy4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82179506"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="82179506"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:50:11 -0800
X-CSE-ConnectionGUID: 8lvsvXZERFKKOIYNJGq0Pg==
X-CSE-MsgGUID: MO7Uf3BhT9yhdoObTOrQHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="212920058"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:50:10 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 11:50:10 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 11:50:10 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 11:50:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzAm0IS/xzlDD0WCilvE37zF+S/c5IRJzGHHGN/sgev0cyei3jxsBAqPstKnZh53tKNXAtMMe1vx/A/Vi88ZciQYJj/MEl07nAd44LNyRLc8fQJ2xhnElorPox3Bhi8nP9LjT4WEYyAyvHHUxZVXS7W5zB/1AnMpUSIpwHTY/Ra2cLN4DM9LHkRx3mWLO7BzUT6GDlMpCtPYPsIcUdyPyO6hHM0TcjGbFT4HPmTkYVVhM/OFYptxHZBbppBQfL5sa38g0gb7F5Kznv/6FdVz+yQQtnw3uZW2oqLD3DlvoSUCBTIVwu16LXoLaI3rNTONsM3wpFxEnTieBbWdrtaSRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ciNUiiV38a4qQQnnbJOU9xI2DJ8wVRJLfokWLIYGXY=;
 b=RJGX/pVdl/k3dW7ynv2nfwr9DSwLKvyhjmTklbuDQekCjFHwtwd2KIyMq9xpsFkv7bzlCXRDeQOVz6hAeTSUz0+ikPFLfpYXBEM76RlZI1PW3zTfO5d1MEuhd03PEKOzRCYP//L/7wfk9gFknuc4+qA7vyUZQSgZGUiuV/l3b9e0ta1YzC2qlNzOxy12D0NZc7mFR9ZeL9925EWePKnewyWoH5j4cS9RD+4eFPGNl0FjbotzTJqexiBV71ImSorsUO9+LP491Z4eZhlFLr8TgD273AklP/RgGB56g6BeJmnQ64PptuJ4sDaT3Qab/PYKAuqn/GeBKwikklkpXjjppQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB9455.namprd11.prod.outlook.com (2603:10b6:8:28d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 19:50:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 19:50:01 +0000
Date: Tue, 27 Jan 2026 11:49:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/6] drm/xe: Move exponential sleep logic to helper
Message-ID: <aXkW5wI85nBZnMFV@lstrano-desk.jf.intel.com>
References: <20260127193727.601-1-michal.wajdeczko@intel.com>
 <20260127193727.601-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260127193727.601-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0318.namprd03.prod.outlook.com
 (2603:10b6:303:dd::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: 891127d2-b80e-437c-7489-08de5ddd423e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?97hPJGSJmABpceJigTtWRSN8X3ux69Fal3b+79ASyjzSAjNGnCz4drwUkTdp?=
 =?us-ascii?Q?95VhgxwTvg6KLSXMxlbxA77YQBSq0SKro5hNFZGZFfld3ior8Gbj3PVq0C5m?=
 =?us-ascii?Q?KFfQ0Slck/3sdvFFFTbfv552wysnhAXlNDLIDm0wz8DukFWNNuZoAhDAncAX?=
 =?us-ascii?Q?8TjXQTQysznXfocjhl5uj/PWwl5+UKsDb4xoWO94RNu3SP0/yfQffVEfxrBb?=
 =?us-ascii?Q?anGm8LfFU0WUPAEXamhT5mXnqqd6csHMTO9FeEwRW010nNkr9cx0/4aJW0+V?=
 =?us-ascii?Q?Sj0VytdtjTKJn2NXk8JTpCuoC6zxK6nnHDk3iXjsjCZIag5RAHaLq1qsYwx3?=
 =?us-ascii?Q?R0Ci2SmVbBYhmmRL5TWvUoxzsIiTsMaXcv5McF6fd5hm5UUqKyCC+/TM29uC?=
 =?us-ascii?Q?UTcDgDU04QjFFuEit5kVz0WiTAMM+Ot+VgMYd6VydMkc+hiMjfYI6HR1JrtK?=
 =?us-ascii?Q?T2mXTrv/AQ+U2gkOWpKhHAONRFGJN0s/sQw0lTygU/CPb2KPl21yznAuQMgE?=
 =?us-ascii?Q?oNKMj9WzSe/FEoKTuUzRvthuWqMd+93SiJzUUDP8GjnDKhNNDjsuOX2xiJHt?=
 =?us-ascii?Q?CVPTaWUgVrXxsa7KD3t4VFhzEvB0etrahuz9B0/sCJ0MRow4DZujj4xpMFg6?=
 =?us-ascii?Q?l3SILbq7yhHU+m6WJJQS87BC0qCeTcvt8+ijEdRkRxS1NH9Bv/mLRuFGVIl6?=
 =?us-ascii?Q?pHa6IfHfx4Uulj2j5gXzLLfvOdFSq6vTTBEqdL1c12EROznlW7k1Y98FwjPs?=
 =?us-ascii?Q?mP7wXE7Yd5xY0saAwJHnraz9AaihtuHRoZvqtU1ZzVTyu+ih4gjgL3agJp4/?=
 =?us-ascii?Q?X/6somma5imRr9mrE4ydwD7XDxZ0eAqiEETTLnAIa0UoFbgKEe7Wj59AiyVV?=
 =?us-ascii?Q?uk10y0QATUmTaO982I+NopszLRVnXX+2UYq8HPKyJoW/ATSrrhBaGTe+Ql4+?=
 =?us-ascii?Q?l37S0czaz2Yy7BF1QS6SMrtZ96HXnt8KcDc4L4FZLRvyG3AFSSJ+q4B4inta?=
 =?us-ascii?Q?PMbw9ldbUW5E85jUGqP9e3xZdSwD0VcCKZ0bK02tJrAMoe6KGc+Y2UKrDSu3?=
 =?us-ascii?Q?idhhD4kZFXvA6fe5FM2q9h3PKClCcISHtC8Jk5uVoQJ00tajEEEZd7UXaJ8s?=
 =?us-ascii?Q?vxFWUtXv/v+8nEGJIOsUzwKyWbvqLXhX1CCaGXijNYV8dc2lp1WI5nsNmHfG?=
 =?us-ascii?Q?vr+jlEHkzBEpNw8PqZlM9Mo9kxe6Ang4gW9NkMXoFeoHuIBbxbzY1NkhpUwY?=
 =?us-ascii?Q?1ULaIWkA6CuMsp9rRrFsDH7bbng1WUUZ+pw/ei/ocMSUFYwyjMZH1L9Yafuh?=
 =?us-ascii?Q?UbcHf77AT5w21AcaPNmNheTguOtG9TlmJJG6lGazC+GFIGeDPUNuf+dnwMT9?=
 =?us-ascii?Q?rU7KtX4ygR0T17uR+SDSxl6joPxOyzOYM5PYDdPpEQ3o101wSncubaT7QYKt?=
 =?us-ascii?Q?0AoBSQTjn/1qSqlDul+RB2ppnfjTVcGyZ/QeM6WH4I8hNAByaEAp29hmeGhV?=
 =?us-ascii?Q?vxKU9aUCohviG9zRvB84FyJy2U+iIohGyWj+ASFFTzreaBqke8nJjM52YZQd?=
 =?us-ascii?Q?BZz0g9jOkUT39HU87Xw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AV/wZ6HA+0s1rXXUpOj95eVc2iNjkAoREnaGOcvp3u3/hfVA3tnC1i69jTLH?=
 =?us-ascii?Q?YQ9gTXYFcf1fproaGUm7N018BNHQ4AF5fWZZaMhBUJVFSwUN/JVp6CwyOVV0?=
 =?us-ascii?Q?r8zeQX29N8zTH+YP8Juock+/CX9pdEfWKUBF6PEeYJ4kT1/ahM5Ck+FWGRf/?=
 =?us-ascii?Q?+Gkxbhv+ommZSrWzQlefmXxAsew6TKdd+3+O9t5F43xnah82M3VYvLM1DJy0?=
 =?us-ascii?Q?8qpjw7iZ8pDsnHzdknvAwzFN7JoBSoit0mmGMaIG1548w4UQ0YfNvNMcU2Y6?=
 =?us-ascii?Q?etFSRX0c/n7Knk0apNRuAjXeZmfu/bBWNu0gIduu/WS6MskLBAZssTGyEfcE?=
 =?us-ascii?Q?zBcKxAMD4Inb5zVLfzYnVrhgn9VIsjDTVJHiisw2isMlWPNYDTle7Wegmdh2?=
 =?us-ascii?Q?n1X/DjlKQct7V7DLnDZ0Ticzu8t/jdlWWUpxPFAqHGH3OR3EsUEm1UtpU6HI?=
 =?us-ascii?Q?KIrKwN+NFCeAysopBBCz5CR9E3G6k7jKcN9QG3UnH+5125TVNCpesG+1fzi3?=
 =?us-ascii?Q?Rzz69yA1Ii3Rpm7KwscWsYKsl8YjiCobl4EzZSyv5SoHCMz9W5OU7skCrJc9?=
 =?us-ascii?Q?UxJ5NMH+EUk3uZAWO+b8TkIszj357fSBy1LS+tanZ2g5+seljdXbzjdpOPl0?=
 =?us-ascii?Q?YefgNqBX6ipFp4wVBxlHkGH6VjTsxGQl+7Csux7l1e42mZdDOcttUGEnPAO/?=
 =?us-ascii?Q?nKA4fi9ESHF25m85MJrc+33uzYZxqKCHvLZvg2L1F10uRHbj0j2uCSrw4pPQ?=
 =?us-ascii?Q?+sXMEL9QF6UWhwBh5gcbkbKz/aH17hrETCoq3/Ib37qmqz0ztSWC8Yipfmcx?=
 =?us-ascii?Q?VZUPcTcTF8sHHVHORC06II343QCDkvG+NPXuRuDXZO4kmEWf83suyKr3yXLu?=
 =?us-ascii?Q?cr1Hupqv22ftIa6pZDbrBIUNgmddCkJY+QyNJerGbJmaTcwQIGThX230tPao?=
 =?us-ascii?Q?5iedsfwfjHDiWGeMuoZ0CI8JTt2RBy1wwH4YYJf4zaWU384vc7M0Wo+nO3+x?=
 =?us-ascii?Q?Z1J+fjlrIhQ6iFtCtfqGZx4kdir7pgA+Rcwk7SBgJU2FxAdciqq2uJI0MtrR?=
 =?us-ascii?Q?5hhZ9+pYc4JsPyQqn7+or0K2U6zmeJw/7XO4oLYHvtvNlkpN7yY/S06zewHK?=
 =?us-ascii?Q?ByDzs0mH5QdsL/Y0sDolcYEi01x4pPWQjLQY1II95fl/ZiVT3hU4aUq3MG3u?=
 =?us-ascii?Q?X9hAr4MX4eIAh4b/J2t4b6fFW8XaJNj5ffS/xY/UuVkLscAX2tP++oJvPuab?=
 =?us-ascii?Q?YhXwlXxGcVd+AQBVWEiZZJ6eefMcMm0IxUAbP9z3it0zDkGL4SP3vaI/lghe?=
 =?us-ascii?Q?fv3GE0/3cweVqmlX+HZpLJbhvl/Ghlz6IOpD2qkRCsI0ZgZjtYjoDxOueXOx?=
 =?us-ascii?Q?IUUq4jlnJF5458BuF7T/QjMtfMjwuoVVghQ7dNWQ2AYXFYIoAxxXB+6aLdu8?=
 =?us-ascii?Q?9+BRMrgbouuD52J4paKHoZbyyjX6EjJ+uY0Xt2+496ZGkW9XvDLbjpc4vXRx?=
 =?us-ascii?Q?RcYJA9jPTX5eVFK3B6qIbtO3CJMXyjxivmsZvDaEUK9vk2yDMO8BliCEu4B0?=
 =?us-ascii?Q?OpY9JWjnoW0Kc7DIH9N9Ic3EzomsRPGRCU9pq7AKu3QRuxujv6AKLu1yRY76?=
 =?us-ascii?Q?vyGCzwmQd1ev1FK7LbrxEVX93HqPY2h/CrbWAcxfnBlNeDcdmEMg0Zhs6sQW?=
 =?us-ascii?Q?9f5gSW77z8tmAU/h0lPWboDE+mZgg4u+Zd+kj7HuBUoOFFB/XV/ybnoD9xe5?=
 =?us-ascii?Q?wVC49MmGRw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 891127d2-b80e-437c-7489-08de5ddd423e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 19:50:01.5001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CneL7lQ/Jnd1Db7iFr4rqOoHWBR54DZoTHXdml7Kp/ivDnx2ACwL0PsXnOqzpQXtksk0inU1WLK0ckaAlHzZzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9455
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

On Tue, Jan 27, 2026 at 08:37:22PM +0100, Michal Wajdeczko wrote:
> We want to reuse the same increased sleep logic in other places.
> To avoid code duplication, move it to the helper.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c |  5 +----
>  drivers/gpu/drm/xe/xe_sleep.h      | 21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4ea14f2794f4..66dffa13553e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1045,10 +1045,7 @@ static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
>  				return -ENODEV;
>  			}
>  
> -			msleep(sleep_period_ms);
> -			sleep_total_ms += sleep_period_ms;
> -			if (sleep_period_ms < 64)
> -				sleep_period_ms <<= 1;
> +			sleep_total_ms += xe_sleep_exponential_ms(&sleep_period_ms, 64);
>  			goto try_again;
>  		}
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_sleep.h b/drivers/gpu/drm/xe/xe_sleep.h
> index a772f1a37395..2bc3f4c0ee0b 100644
> --- a/drivers/gpu/drm/xe/xe_sleep.h
> +++ b/drivers/gpu/drm/xe/xe_sleep.h
> @@ -33,4 +33,25 @@ static inline void xe_sleep_relaxed_ms(unsigned int delay_ms)
>  	usleep_range(min_us, max_us);
>  }
>  
> +/**
> + * xe_sleep_exponential_ms() - Sleep for a exponentially increased time.
> + * @sleep_period_ms: current time in msec to sleep
> + * @max_sleep_ms: maximum time in msec to sleep
> + *
> + * Sleep for the @sleep_period_ms and exponentially increase this time for the
> + * next loop, unless reaching the @max_sleep_ms limit.
> + *
> + * Return: approximate time in msec the task was delayed.
> + */
> +static inline unsigned int xe_sleep_exponential_ms(unsigned int *sleep_period_ms,
> +						   unsigned int max_sleep_ms)
> +{
> +	unsigned int delay_ms = *sleep_period_ms;
> +	unsigned int next_delay_ms = 2 * delay_ms;
> +
> +	xe_sleep_relaxed_ms(delay_ms);
> +	*sleep_period_ms = min(next_delay_ms, max_sleep_ms);
> +	return delay_ms;
> +}
> +
>  #endif
> -- 
> 2.47.1
> 
