Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3D8D3A696
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 19:41:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE4710E6FC;
	Tue, 29 Oct 2024 19:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4j4spaX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE6910E6FB
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 19:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730230862; x=1761766862;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pGTpG1nW9WujXiz++K+1h2XP1UP6W4LnbNs/hK7epMQ=;
 b=d4j4spaXJTbPuaGsgV4YXWRGE3BbdiUdqBuEYvGUSrYd2Foc9+nk3lFf
 LNjZxziEYt/fwVQ/iELOlx3bI5RoPMRg0919nlEpLRTYSZtE5w1+AynP2
 47EiFX1F+E9/M3bYqCMdtIQ6DaTAUhqYNND4x+ioSw/Yv5agUTRyjlkcT
 U/X3mCrlZaSnCvbhG9VxuaGpqV9MKY4ublIuNDdhA1PQ/2gN05Ykf3hUQ
 7zceHxCkysQdTaLyaeP1YSvvo6/VdP/rXu+YGi/JQUOTZkHt2J6keHa25
 qZi54tIdkJaggVf2mynvn+KV6wUKc3CzutKVz8asEesgZN8ynk8sPMbuc Q==;
X-CSE-ConnectionGUID: IGu3z7GsQTqrR84q4/QWoQ==
X-CSE-MsgGUID: j7zNDH9TTVuCo5WF9RgjEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47359946"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="47359946"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 12:41:01 -0700
X-CSE-ConnectionGUID: s2j0Z19aShmMCCHM3afpQw==
X-CSE-MsgGUID: YAbGN4OiSsyPVuBPE8Bfuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="119549607"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 12:41:02 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 12:41:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 12:41:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 12:41:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJ5FNuwFWu7qeLf0CrfDf0IFUoiBx2NNf/kTXir8z+es0R0wussEoaaw1XtIZP7Zo2eOaknp7O6FCG5Oswe2y/yBGzs5/HvS2BHMuQg6yOrDAtJOTqGMQIFeU9KzGHyAet+1Vz0Ndi5KKnhSwUiIyWb3KwbZEn+Vpk0VKy/VGm+tXjyNpgNeyVN9wNfZn13O8OfKUqH7ymSswdvrsowccDdhjVMEEu4OkTj9/T00WoBNdwob4ZUebyyPHpKstTjBeY65jSYPvJZLT0UnWPlbdNe7HeSVl2JSKajVYJa2JIfKqjGSUEdeVsGsK1+3oslVppz2gQ8A4eXGGHg+RJehCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYEtBrR4ZffDoMSbJmUSs2mXqdHwDz0kEkoACqbhMss=;
 b=Qo3tVZ3RZwH2cZ9OQQ44aC/6vgtbbyKN2YM5RApQ6FYmrUwvGVIFh3L5BYQCRllQZviwcCLzuiYK56hvhBEEkLPYJccFH0o8kxAp7QGKW8opkfHQ1xzm//5D5gUe8+LyziW8SsW0AIxINI3y+EX/QJK7hbyn/6Rpmcwdd5YHcs3ESLjjacMVcbuZnM/Ha240Bdhv0zDHs0tN/0zOy6CNUiDj6VcZ7N7Xnkeaz2he/kx1GTyesWWpW6U0WoUmTVo8Ovjbf6YWAGCKNbOV/8ckdZfq+mjSrrvTft8m8kBaeYgQ96I7oaACvB6S8I2246u1dcMfNo8Mda7SVx5J+NXdpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 19:40:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 19:40:58 +0000
Date: Tue, 29 Oct 2024 12:40:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Move Wa 1607983814 to oob
Message-ID: <20241029194055.GZ4891@mdroper-desk1.amr.corp.intel.com>
References: <20241029193258.749882-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241029193258.749882-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:40::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bcb7995-8da6-4d73-433c-08dcf8519c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SX0z0aPI99hLZwwCTSZIAub120lz8E//mQ5fc2q/S6jArka/4iMgkTOZx6Ug?=
 =?us-ascii?Q?zC5qyprdsu1V7LwDR1HxzddnU5FylMfGOpcLd+I5qbToJ76xmlzj5CIJI/HO?=
 =?us-ascii?Q?F8icLMgEoS/p/D5RNk5nSIgYsGJeoQcPx9CtQ1kFcy1Tq7nDtYK1cMi5iXA6?=
 =?us-ascii?Q?z5saZ4M2ROKcyQHpOxMUnQb2Q7hHJkcy1LOHXCfOsiUP1lZ+aAwwihu2VhqN?=
 =?us-ascii?Q?RzVyQKYCmRYtMk30gxZE2nlLp1IF4Z/H6WFThV2FfZbvpDOPRfcDUZoQBn1z?=
 =?us-ascii?Q?R/PZgzTsuojGvrKpMFD0quIPxLZgEZggiWd4TNN23Jw1hf2RKberDP0Lh8O5?=
 =?us-ascii?Q?wqH+ZJorJfyz1I+AmLEGaHO3bnH/qnBcwJ+McYuE4UXkLbVkY4ChC6aqNn+M?=
 =?us-ascii?Q?xCn/JjWIlpNh3bEyAD/0QamXxImNQlPlcLf0HB/ZBPXQW6XXh0f7WqHWuANp?=
 =?us-ascii?Q?gP2T28OCJ4gMnwGD5wCmTbYA3SkIJ0Q1c/4xagZ0+xY5a/zi3HGJQAqNlUFS?=
 =?us-ascii?Q?HBnKHdmgDJaSoQXpTYcXgvaoV8gLnBgzXKs8m8h/PfBkICvy5kDs+f8qn7sa?=
 =?us-ascii?Q?xnlm6ZzVJZAFjOKhqf05moO4HNYK9n+SG8Mrt4I7OMIn5kz5OitaABWUJgfV?=
 =?us-ascii?Q?UAic4csddqZeYoYKXVPTdwFAsOaBTr+oepGRDv871hYsOGqnj/V+McbN56Sc?=
 =?us-ascii?Q?C9PgWpD6KRikT8lGqT2N+G95Dc5ZY+Y1s+Q7ZvnLilc3CfnG+Nyk401P6IqL?=
 =?us-ascii?Q?QyKatONYByQZkaCB6VHrop5DVs2ItyVtznu8wkFPvUSMU5oFTt+K/LTRCyje?=
 =?us-ascii?Q?UB3ttNYNo2R3fmSu+/ElbXl2ThpKONdVf7x+AzV8zzh4H3oRhT0cln3Od5JC?=
 =?us-ascii?Q?hprIz8hZ6sq+wTyUfMF6N7lRg0nxgsxImuiOoPtIr9UHJDgtOWYacifceyKr?=
 =?us-ascii?Q?TL5DW4a9NL9maJxUdf4kpdQNz8LvII89Fdglz13joyejVUSfmptU9ypwhTa+?=
 =?us-ascii?Q?JCL5iO6ToNX9VmVEjUvzfA1O6oBmrjUKMnsOgJL8fgKKVomwyfYDwhA6wgLS?=
 =?us-ascii?Q?CBfIJ0UNj0aNhjxJf5rMryEiM7MT+oXX49wzv1PrxUjcPnVw4xcUpHgHrSrp?=
 =?us-ascii?Q?neYMH/gPr3XK8IiHejiZI9w9ONJ4v0B1IK5YpLPKBoYwoPiBvZdIh0zK4VUN?=
 =?us-ascii?Q?xumxtJQ8rPPoVTkNfWUemFITkXWIlhM76MeROn3XcES1vespecbPGuR8D3jg?=
 =?us-ascii?Q?MLs5kgTuaBghzrPUi2ugZl1xlwY/7Y8m+shWHbtzDgm0kc3JZAvngHmNv/vB?=
 =?us-ascii?Q?QqmUPj2i2/8Abm8Ub2liytlS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oiUzkmgJr9h9gdopAGRxIrpUfDA1FDrw2Ca7de2BWjyzCJwWXzkUd2bIgBe1?=
 =?us-ascii?Q?7Q328L7fg8sCxTH+lxGnc7xnUdKF9iGYMbnC0zF+Jw0//1p+coKblLz5xr3B?=
 =?us-ascii?Q?uhC3b5NvudIv5ylnZHh52y4hQ8jE2Ki2YIlcGryjz1ysa2FGdSpRJfF7x80m?=
 =?us-ascii?Q?w+WeTDhUVB/k7o3Sgd9UpkU3Uvg8m1r5hIaJFdiPMkOeY3nO7kpjgZTdByZO?=
 =?us-ascii?Q?cp6pQppXmKaESiwylx4OqYfuRQ6vPwMyxqKYTG4OKDXH6CQHvYASKcFOwcjZ?=
 =?us-ascii?Q?t050gx+uZHUFTcRGAR9vZUBQTa4mP65aV3yW904XZQzHKyJcuAPc7hhkNGOD?=
 =?us-ascii?Q?VmPjc72SkhKl1LzI9YZv1s2i6Ee7GIu0n8iJLrAQlTPnHEHhp9On8abaHRBU?=
 =?us-ascii?Q?XRTTY9rsl3eIiTWleymLX/IdFIg+GDiA9AkLDAWvdq9LXza7Ag4YIUMHu2j+?=
 =?us-ascii?Q?I1p6gXCltOxCHx3AfViyvEOGoH81GHIFn27fWVPeYMzLaQG8dl2DG3qzn3Li?=
 =?us-ascii?Q?7cUVqr+lKySgZVeIjKaaKcWwv0as/rV3jDlqQsn56d82AAVqDbditwjSLpFz?=
 =?us-ascii?Q?7WBvjxAmpsJtDth0NMcX4IC2g17e6uMpdNpuZKSLrcsLbjkr1SUD5d+qC6e/?=
 =?us-ascii?Q?3Cctqjeyqy8FdPyqqiqIQbLyPqFOxijCXjQNFxTVbNRd06Y3TFfzKEzgnFU3?=
 =?us-ascii?Q?OciNguAJ9j4xh1jFYnwKQ6E1KMjLGIQUynoYbMb2MpPKH4g0su7ysDoOPxLl?=
 =?us-ascii?Q?QTIhXiJBuLzSW/3fbAIdJPPB5ZDz09ytD4wHDQfmpUuDcxzLj5ZRA6rixkp2?=
 =?us-ascii?Q?8hNxDG3/I6cwOc4kKFc46Qyr1PVBGVZHqU+augroybOs3FOEWVpIDn+ImVmy?=
 =?us-ascii?Q?gq4MXPZHMQNaQGftmaQtXqj/R+7890MG9AG8EK1g3mbAPKvayimglVxKbH+G?=
 =?us-ascii?Q?gA9iWjVopZX8wDrvtKs6uKYo/eM4OK+FmAxDH8C8Je+Or69A8lzhfmk9D7Hj?=
 =?us-ascii?Q?E7tG55Z/oo9WxdbuNg48nve15L43HO6lH43BCzaXEeyVszoHNj8mYQWCZ9m/?=
 =?us-ascii?Q?AXFqqDhe/hLMRaR+RMwwILUnPE/3O+PsGtP+F7GWr8Hg9QtJ5o2l7ZZyNcNU?=
 =?us-ascii?Q?pXXzsNjBf2Ip8O7yLyTCbCDzbNX/1ClDIkitDTBz5qua8Kn88jpBkTzUhuF1?=
 =?us-ascii?Q?cSJZ5y4/rVJEAzenHi2PfADc6MIxrQiingiyDBJPKr7r0Ao64/IjJ1t4QK5P?=
 =?us-ascii?Q?b97zlTe1+qbkbbLWcKQdj/4hPprEpB43z0/7pyMzRVdNoHUhyk5Fy5Z/0ayH?=
 =?us-ascii?Q?+fLRzdf8yjSaLzlhbbwQ/se6Ho9J69KXGs/Zd2yK1s6ZV49gWQ/mWcxFUVcU?=
 =?us-ascii?Q?4Y//30CJgAtzdA0JN6Uy8JepNswDCnhlwNpytjI9QzTLjCVJXwRZn/AcMebE?=
 =?us-ascii?Q?aA15HPqIJrgFDzWZmW8brFOW2ADYEl1RDszMfzqU5of0+FekzD22gCTzftir?=
 =?us-ascii?Q?jss1M/4yqI1ZS6CJm34ouDI9akec34NgkCHA99xgGV5QcNNb1n0OHyRUG1Du?=
 =?us-ascii?Q?PCT8Nnt1VyxRVL7lDtA26n+BVLwwZinM9Gf1O6i620ClqKPUtdysdPoI84h0?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bcb7995-8da6-4d73-433c-08dcf8519c4b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 19:40:57.9895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVZGiUY3YbAiSZ2t/rIDVxyvEi1dVOlqGbknnOJjiJckn24i9FocePoo0nI+rJZRnQdCz8q7Kb88mKAxxRS2WvSDhe0t9yhRdYJs00ujpcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5902
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

On Tue, Oct 29, 2024 at 12:32:58PM -0700, Lucas De Marchi wrote:
> needs_wa_1607983814() predates wa_oob, so it was not being printed
> in /sys/kernel/debug/dri/0/*/workarounds. Port it to OOB rules.
> This makes the WA show up in debugfs. For TGL:
> 
> 	OOB Workarounds
> 		22012773006
> 		1409600907
> 		1607983814
> 
> Eventually the RTP infra may add support for writing registers in a
> loop, which would allow to keep track of the registers as well. But for
> now, just listing it as OOB workaround is already an improvement.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c    | 11 ++---------
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>  2 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index a196c4fb90fc9..00945caf49ff4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -232,11 +232,6 @@ static size_t guc_ads_size(struct xe_guc_ads *ads)
>  		guc_ads_private_data_size(ads);
>  }
>  
> -static bool needs_wa_1607983814(struct xe_device *xe)
> -{
> -	return GRAPHICS_VERx100(xe) < 1250;
> -}
> -
>  static size_t calculate_regset_size(struct xe_gt *gt)
>  {
>  	struct xe_reg_sr_entry *sr_entry;
> @@ -251,7 +246,7 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>  
>  	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>  
> -	if (needs_wa_1607983814(gt_to_xe(gt)))
> +	if (XE_WA(gt, 1607983814))
>  		count += LNCFCMOCS_REG_COUNT;
>  
>  	return count * sizeof(struct guc_mmio_reg);
> @@ -710,7 +705,6 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  					  struct iosys_map *regset_map,
>  					  struct xe_hw_engine *hwe)
>  {
> -	struct xe_device *xe = ads_to_xe(ads);
>  	struct xe_hw_engine *hwe_rcs_reset_domain =
>  		xe_gt_any_hw_engine_by_reset_domain(hwe->gt, XE_ENGINE_CLASS_RENDER);
>  	struct xe_reg_sr_entry *entry;
> @@ -746,8 +740,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
>  					  count++);
>  
> -	/* Wa_1607983814 */
> -	if (needs_wa_1607983814(xe) && hwe->class == XE_ENGINE_CLASS_RENDER) {
> +	if (XE_WA(hwe->gt, 1607983814) && hwe->class == XE_ENGINE_CLASS_RENDER) {
>  		for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
>  			guc_mmio_regset_write_one(ads, regset_map,
>  						  XELP_LNCFCMOCS(i), count++);
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index bcd04464b85e8..d4ddfcdbe9370 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -41,3 +41,4 @@
>  no_media_l3	MEDIA_VERSION(3000)
>  14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
>  		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
> +1607983814	GRAPHICS_VERSION_RANGE(1200, 1210)
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
