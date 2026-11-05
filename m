Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F36606A328
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 23:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DoxGlPFP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD8E11287A;
	Thu,  5 Nov 2026 23:10:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AC7112891
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 23:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793920224; x=1825456224;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JB2gNtafQIFh49AfNZNSgLGzYiepNDasBii+CBXycmI=;
 b=DoxGlPFPDcdlhg5vvX32npQYCH+Ln7dlNdNAr6eBqdjDcu0hh5SCBng6
 pIXzpuq8UCXhC/cJrtfnjzQd7y0clhgcr6e+c86xf84r5BTgcwWQWYUaW
 MOO7xbI5DKLdarZi6QjVUmyrGZbtJwrEZxXoNYpJNx+J2bnkBJel0XSts
 EhXy/xohAiv00oqGFd3h33h8T6Ti1HJC07sqKyl8ZgLeNV782I3b9+PPK
 x+1WUz4Kcf8ebZVEoWu6ZdSk6IVz0Di91TMIP8OxJ03dzzUJ0JI0yGfuW
 lq11VLv7nWhgmKEKCLEA9b5v8BX52KNQKUoMIWgauQfPS1aCutBMoIfFt A==;
X-CSE-ConnectionGUID: OP80TaQ1QvGCv8fjcCYgBg==
X-CSE-MsgGUID: sufQpXd+S/SXP518xLA2Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2630978"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2630978"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:10:24 -0800
X-CSE-ConnectionGUID: L9q5dMJDSRKlSxnnyJ/n/Q==
X-CSE-MsgGUID: BBJCE++KR766w5z1QajhZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8888245"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:10:23 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 15:10:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 15:10:22 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 15:10:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2gtfVVJvT1wxh1LCTmkfzNc8qWAJTfJXfQHDvcLPBcKH0UsYG3GJkGbZcuqoPfEF5+rV1tr03g8Oenv+b3IfXwbaeYY+i0KUBlF+Xb1dftywKdXeCuFiOn72JgwBzSG6Ad+46M5+8QgWz8bqv6ko7SXmr1oATa7Tf2LB1dO4uNPEe3ExPFnBdRO+IrHFkyVfwbX5uX4IySPKbeTJMi8SZqokKksNKkwNo43HM4NlH5teJucAOVhYpTNWrQLbAMBkNXn4N+KpT0+OvxS1FE80V9IxGJdUQsLsWwtpvvS5vNY7Xwk1PKhQZPEEMD+sp2bXpzsaKvPAHFRzvC8HI1Odg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTQkUtmSTSP3dyOKGGSUGSqdjyoFUQnd0oXsWgMHMFc=;
 b=C+2G8SGMPSLPY+awylgFCEA19/q7CAoM3mVJFK5pHVA75F003VTDmQgBflz9NVP2nP74icXoaFSsuIHlsrQn26RMl+pYkipGDH1UynPX+9HHkO6jcVW8QTwBaMz2DIS8unRn9A8yx0AVKHrkTRywVC6o0vJ8kIGLLZ7VLxxF5EhmBb0F6z8Solsn+4at6Nkt/RM/83hWqLdifW8Z+FEM+k8qmqa666lGyMWVZ0xVAy8pw/hnfDb2dAMx3JlzF0elN96qKCa+NIk1XcKKUwMeIsy21Kkocn3sX0/wA7vNkI8EWoHA2kg+DkK1zjQR3T+CDqBjcqP8flciT23gsAHw6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by CHXPR11MB9626.namprd11.prod.outlook.com (2603:10b6:610:2fa::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 23:10:21 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%4]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 23:10:21 +0000
Date: Thu, 5 Nov 2026 15:10:19 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/wopcm: Use the size from HW when excluding
 the wopcm range from GGTT
Message-ID: <20261105231019.GH6162@mdroper-desk1>
References: <20261105004254.262075-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261105004254.262075-3-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0194.namprd05.prod.outlook.com
 (2603:10b6:a03:330::19) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|CHXPR11MB9626:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d277b6-62e7-4c46-7d2a-08df3b91f6f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|10067099003|22082099003|6133799003|18002099003|3023799007|56012099006|11063799006|261026140227099003|261028144727099003|261009221227099003|261009223027099003|261021121427099003|261022075727099003|261022105027099003|261022113327099003|261021123027099003|261102123227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: UdDDVrl9yRtO0o6bL3mLieIN9JHEbNXQ4kNzzxVnANegEn2jBPnhReivBXh7x9kp3mcb7HFwU1K64roORJGBGf2INq4jPoWJAqVC4uFG1zoldwYnOS/oOo2A6tUmCyTFf436I0YBihJDd4MSoy5SYsV/BF/L/cQSVI4ZWPH+V6Sb8zrLoov3rzMoIx7SKhMExK5IECtOhR8BPkcaCV9udGcue+33vsGZBBOklYJMJLoCPJtHo7+w6KWMeScqtokXdtKmFn2CqtH+9/rNi58GpvyN/pScETixrwNgnZlYuo/UwR/3lBe0+L1oT9iqRDOuh80i0JlkZX0jR4Q9Zmxw9bTRkLxiNKpaM5Fn2cHeCcozDC0x11pUHAWq6UvfWkwkRdyF+sFNO5ZKTmcb4FgJXSq1VKJbpsF+phEatGDMsfVzkOFUfPwwr3GmBCdcYbCUC8wz+6E2bnD7ybAWv4rtyDAc3rcWYfkwqALVWKUn3XBhNmPT4pQx+JB/iRCJtJLIWa93VzhkIcOj8tnlNpLtlyYmCQcKqt8yFZgiug58vA+vNE41J0QR81AwzkR1PpN15zarjG5doiUOaG7BpYimaxrjyLQPt5xJAg+LihjcBhsElsfbVCAeriHcsXJ4+qEdyX22V5iaCugIqzUN48BQc1DkI/5LUnvd5UBb00e0TkU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(22082099003)(6133799003)(18002099003)(3023799007)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261009221227099003)(261009223027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261022113327099003)(261021123027099003)(261102123227099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IQX/lQMCfug2vig+Db2TIj9cA2fwy8WudarBm5eJWWWkUSiL3ViGzfyY0znf?=
 =?us-ascii?Q?33lWNufQxgJD7oYTl4tJ0ZcVwQLMA7eT/R/tRrcQdKFtU1D6bxVnSn5V8azQ?=
 =?us-ascii?Q?RTW1TuhbRkNiU0H/wwgJ8CVuqIf4sj3Y9wIh3+yCT5pFot0vb3lUaMDMoBmn?=
 =?us-ascii?Q?Rzu6HLfLWcwiepoed5a0Odt7AHSRUAVzdLOFhxGcAXCTuo6iiEL+8m3FSblj?=
 =?us-ascii?Q?Em8CsahULyAiI7czH9waZ4EKjr309EHm3zqe0iS2VIjmTAgrIkL8uWrI1CMA?=
 =?us-ascii?Q?V/tRMCwFzTxZ80rdfvy2XbPjaLp1iG19au4sbJfaxeCOe3ssvpqPhmkMRxuJ?=
 =?us-ascii?Q?T0vVvx81I7NQ07B8ZjArlYuUc9vtU9mObVF0r9p+ymFaGFE7mtY2I/xDVyvG?=
 =?us-ascii?Q?bT+4R2lAk8UiPsv8RpyRVfEwEGo382ROF4tqixH7ILlfpRa14V5GKiKZvWpY?=
 =?us-ascii?Q?bD+ncAxjTOQAHS5jLQVlGnEPns0FhciKRfEVlSk2xvY0KPwfQZTmFAZSneAZ?=
 =?us-ascii?Q?GneLrbTWpKo4Qlqdzggyxk2mJ2h8UW+q0vKDgVs/tAA3p1BYHjVIRccYNrcX?=
 =?us-ascii?Q?Tq5NEK+ziP2ZhMDwZUuoDV3Lx+JJpfmB97pSujU+l8kv1+0LVikORRYNAIrQ?=
 =?us-ascii?Q?itxg7gP34s8uDyIhHblNOCeCLiz7n6E5LvjPnHtAirWkWRoiS+7HnA9i0/+J?=
 =?us-ascii?Q?ER/kNgnL/k/0uG45x0p+LW6bkIuxbc7YbS222yeHZazW/geVbRs/oQen9tLS?=
 =?us-ascii?Q?2cKgx2asSKUvsfJLMUvpJira8NbNDNF86iYiWuYiSRpU6RUI/PC+AiD29WZS?=
 =?us-ascii?Q?eLE7lwsFF/xhQKRxN5OdK0x3oNA6MAAV4T4F0jl5WiBTzfReyF51IzJMcYp/?=
 =?us-ascii?Q?hgzM1MkPTXp0ZfOW4t8N2Di/y1F2j0wpZ86qxcs34r07hc992egqV1DqI9Eb?=
 =?us-ascii?Q?2gKGomN9jj67oB01gz/bd7s0edid83VI0VsmbrWoBJhlasPFGL5yhVdkLueY?=
 =?us-ascii?Q?NL5aMAzNCm9TTlR9HcDpYEdqJFkDQZYWC85mPwzPcyJCC94xIQf9ZnKQYcNq?=
 =?us-ascii?Q?nQrFy8cmyQD0bz9FMK95ZEdU1U7N1OvNVKv5VkHjKcJqmXjjr5zVkNynX4Tx?=
 =?us-ascii?Q?xlNppvX8Gpht3q757bQ/T9wDKFsBomTyZbDs+YRlkJgUY06Ls0WAix19HYG1?=
 =?us-ascii?Q?UpQrKlYae11/xPJkhlct1x74qjH/daMNoaMBgh7AFmUIkZnU2+lbbQTSDCih?=
 =?us-ascii?Q?jTaoAvg+SMLSoRwlRyxnGV4Nycy72R20LbsdxMF8aDdPqJXPZK2QbmJe9jhO?=
 =?us-ascii?Q?olPgCcr70tb/WgMRqPDwEQHaX0aLh0kf2KLldy9tchmj/7Zou4S7xwGyNbnk?=
 =?us-ascii?Q?g7BX/8KaYSRQ4IoBAHyLAeXkOvIQj4nnCFHsITB6pKa6bceR8wATmJRmHpWZ?=
 =?us-ascii?Q?qyBLaIYclxsTVy3gZY1EuLzjTqxZ8YJw6EEKYdAxwvb/fL0kxyLsGVki2YSc?=
 =?us-ascii?Q?aPwP4NaI0STnkvH1m9eM4upkoqAT2risNYER6W25roQJE6L+J6bPXQKk2N/Z?=
 =?us-ascii?Q?vugYhnTNBy85fWMLU69eJr0y2BgI6aRb9GUMSJ4MgMjwEYzEQ21/sz7J6oFD?=
 =?us-ascii?Q?gvgNmgbeqYWcpRLUdH2I0R1xYJWUdNgR5GwC9aq6JrhF540zfOJH4o3KoFag?=
 =?us-ascii?Q?RxJBWoVjnTSkbX4mJA126FgvrFKDlPk0azdMZSh1Ewr7Bjq8U8xtKE6f2w1g?=
 =?us-ascii?Q?cJiRaCEqeEJq5zruCr4/qVjCI4FrzW0=3D?=
X-Exchange-RoutingPolicyChecked: ffFuHNPK6haHnRpWol+au72rC4BhuXIbxIob/RsagOwwROeKHPJKE+Yg4q5QDuYd/iB2FirND0bcwy+UwlXm2U6anzYjxbuRUsbQAHCewv8j3dGaTvT5AACnhawU/yHFhTyhOE1LbM2r6o9dC6GX7F7ccr5MriFR1RCQUBGsXZ/UMvoz+UGsBDXN2+35b5hNbJb4EBIan1+dqNNH+FLvyhjFCwopnM5l0kSdaZddIjzT7UkvXmeDcCva4XlO847fVK/EauGLV/m3BT5xpLXaoUxRmwUcnOqM66+FOWnt/0uFOjvITvMKdUXLlZKZYja+2/HFSjtF3Y3n6Kjp8I5qOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d277b6-62e7-4c46-7d2a-08df3b91f6f2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 23:10:21.0612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +audXVg78h1DJnj0ZWw1ZZqWHipUS/J2rL2OuMP2ZtGOK9y0NyArh75phxEQLFb1JmNdKsBcRL/xz747l+DzVqZbfU7NUC4LIhZJC17+w2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9626
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 12:42:53AM +0000, Daniele Ceraolo Spurio wrote:
> The WOPCM size is available in HW (we read it during the stolen memory
> init), so when excluding the WOPCM range from the base of GGTT we can
> use the HW value instead of an hardcoded one (which needs to be updated
> any time the config changes on newer HW). This value is not available to
> VFs, but the only use VF has for it is to make sure that the PF has done
> its programming correctly, so we can just trust PF and drop the checks.
> Since the WOPCM is a per-tile value, we can store its size in the tile
> structure and re-use it for both GGTT and stolen memory setup.
> 
> v2: drop wopcm size usage from VF
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c         |  4 ++
>  drivers/gpu/drm/xe/xe_ggtt.c           | 15 +++++---
>  drivers/gpu/drm/xe/xe_tile.c           | 38 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile.h           |  3 ++
>  drivers/gpu/drm/xe/xe_tile_types.h     |  3 ++
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 53 +++++++++++---------------
>  6 files changed, 79 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 273e2c45fea9..db1cc7472af5 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -933,6 +933,10 @@ int xe_device_probe(struct xe_device *xe)
>  	override_has_cached_pt(xe);
>  
>  	for_each_tile(tile, xe, id) {
> +		err = xe_tile_wopcm_init(tile);
> +		if (err)
> +			return err;
> +
>  		err = xe_ggtt_init_early(tile->mem.ggtt);
>  		if (err)
>  			return err;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 9ef2ce743770..cd8b9000046c 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -30,11 +30,11 @@
>  #include "xe_pm.h"
>  #include "xe_res_cursor.h"
>  #include "xe_sriov.h"
> +#include "xe_tile.h"
>  #include "xe_tile_printk.h"
>  #include "xe_tile_sriov_vf.h"
>  #include "xe_tlb_inval.h"
>  #include "xe_wa.h"
> -#include "xe_wopcm.h"
>  
>  /**
>   * DOC: Global Graphics Translation Table (GGTT)
> @@ -394,11 +394,13 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  {
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	u64 ggtt_start, ggtt_size;
>  	unsigned int gsm_size;
> -	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
>  	int err;
>  
>  	if (!IS_SRIOV_VF(xe)) {
> +		u64 wopcm = xe_tile_wopcm_size(ggtt->tile);
> +
>  		if (GRAPHICS_VERx100(xe) >= 1250)
>  			gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
>  		else
> @@ -414,8 +416,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
>  		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
>  
> -		if (ggtt_start < wopcm ||
> -		    ggtt_start + ggtt_size > GUC_GGTT_TOP) {
> +		if (ggtt_start + ggtt_size > GUC_GGTT_TOP) {
>  			xe_log_err_fatal(ggtt->tile, GGTT, -ERANGE,
>  					 "Invalid GGTT configuration: %#llx-%#llx\n",
>  					 ggtt_start, ggtt_start + ggtt_size - 1);
> @@ -647,13 +648,15 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
>   * This function may be called multiple times during recovery, but if
>   * @new_start is unchanged from the current base, it's a noop.
>   *
> - * @new_start should be a value between xe_wopcm_size() and #GUC_GGTT_TOP.
> + * @new_start should be a value above the wopcm size and below #GUC_GGTT_TOP.
> + * VFs can't access the register with the wopcm size info, so we trust that PF
> + * has done the correct programming for that and we just assert on the upper
> + * bound.
>   */
>  void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
>  {
>  	guard(mutex)(&ggtt->lock);
>  
> -	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
>  	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
>  
>  	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 810dfd98d830..6478b9d4a05d 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -13,15 +13,18 @@
>  #include "xe_ggtt.h"
>  #include "xe_memirq.h"
>  #include "xe_migrate.h"
> +#include "xe_mmio.h"
>  #include "xe_pcode.h"
>  #include "xe_sa.h"
>  #include "xe_svm.h"
>  #include "xe_tile.h"
> +#include "xe_tile_printk.h"
>  #include "xe_tile_sysfs.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vram.h"
>  #include "xe_vram_types.h"
>  #include "xe_wa.h"
> +#include "regs/xe_regs.h"
>  
>  /**
>   * DOC: Multi-tile Design
> @@ -225,6 +228,41 @@ void xe_tile_migrate_wait(struct xe_tile *tile)
>  	xe_migrate_wait(tile->migrate);
>  }
>  
> +int xe_tile_wopcm_init(struct xe_tile *tile)
> +{
> +	u32 wopcm_size;
> +	u64 val;
> +
> +	if (IS_SRIOV_VF(tile_to_xe(tile)))
> +		return 0;
> +
> +	val = xe_mmio_read64_2x32(&tile->mmio, STOLEN_RESERVED);
> +	val = REG_FIELD_GET64(WOPCM_SIZE_MASK, val);
> +
> +	switch (val) {
> +	case 0x5 ... 0x6:
> +		val--;
> +		fallthrough;
> +	case 0x0 ... 0x3:
> +		wopcm_size = (1U << val) * SZ_1M;
> +		break;
> +	default:
> +		WARN(1, "Missing case wopcm_size=%llx\n", val);
> +		return -EIO;
> +	}
> +
> +	tile->mem.wopcm_size = wopcm_size;
> +
> +	xe_tile_info(tile, "WOPCM size: %uKB\n", wopcm_size / 1024);
> +	return 0;
> +}
> +
> +u32 xe_tile_wopcm_size(struct xe_tile *tile)
> +{
> +	xe_assert(tile_to_xe(tile), tile->mem.wopcm_size != 0);
> +	return tile->mem.wopcm_size;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>  /**
>   * xe_tile_local_pagemap() - Return a pointer to the tile's local drm_pagemap if any
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index a2a2c0e936b8..5ae9f6753f96 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -19,6 +19,9 @@ int xe_tile_alloc_vram(struct xe_tile *tile);
>  
>  void xe_tile_migrate_wait(struct xe_tile *tile);
>  
> +int xe_tile_wopcm_init(struct xe_tile *tile);
> +u32 xe_tile_wopcm_size(struct xe_tile *tile);
> +
>  static inline bool xe_tile_is_root(struct xe_tile *tile)
>  {
>  	return tile->id == 0;
> diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
> index e1368c04846a..3e69f509a844 100644
> --- a/drivers/gpu/drm/xe/xe_tile_types.h
> +++ b/drivers/gpu/drm/xe/xe_tile_types.h
> @@ -84,6 +84,9 @@ struct xe_tile {
>  		/** @mem.ggtt: Global graphics translation table */
>  		struct xe_ggtt *ggtt;
>  
> +		/** @mem.wopcm_size: Size of the WOPCM for this tile */
> +		u32 wopcm_size;
> +
>  		/**
>  		 * @mem.kernel_bb_pool: Pool from which batchbuffers are allocated.
>  		 *
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 60f39efb02d0..5983b6c0ac3f 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -20,6 +20,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_vram.h"
>  #include "xe_wa.h"
> @@ -38,34 +39,12 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
>  	return GRAPHICS_VERx100(xe) < 1270 && !IS_DGFX(xe);
>  }
>  
> -static u32 get_wopcm_size(struct xe_device *xe)
> -{
> -	u32 wopcm_size;
> -	u64 val;
> -
> -	val = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), STOLEN_RESERVED);
> -	val = REG_FIELD_GET64(WOPCM_SIZE_MASK, val);
> -
> -	switch (val) {
> -	case 0x5 ... 0x6:
> -		val--;
> -		fallthrough;
> -	case 0x0 ... 0x3:
> -		wopcm_size = (1U << val) * SZ_1M;
> -		break;
> -	default:
> -		WARN(1, "Missing case wopcm_size=%llx\n", val);
> -		wopcm_size = 0;
> -	}
> -
> -	return wopcm_size;
> -}
> -
>  static u64 detect_lmembar_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>  {
> -	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)->mem.vram;
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	struct xe_vram_region *tile_vram = root_tile->mem.vram;
>  	resource_size_t tile_io_start = xe_vram_region_io_start(tile_vram);
> -	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	struct xe_mmio *mmio = &root_tile->mmio;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	u64 stolen_size, wopcm_size;
>  	u64 tile_offset;
> @@ -79,8 +58,14 @@ static u64 detect_lmembar_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *m
>  	if (drm_WARN_ON(&xe->drm, tile_size < mgr->stolen_base))
>  		return 0;
>  
> -	/* Carve out the top of DSM as it contains the reserved WOPCM region */
> -	wopcm_size = get_wopcm_size(xe);
> +	/*
> +	 * Carve out the top of DSM as it contains the reserved WOPCM region.
> +	 * Note that the WOPCM region is per-tile, but the code below only looks
> +	 * at the root tile values for both stolen and WOPCM; this works because
> +	 * on PVC there is no driver-usable stolen, so stolen_size is 0 for
> +	 * both tiles, but if that changes we'll need to rework this.
> +	 */
> +	wopcm_size = xe_tile_wopcm_size(root_tile);
>  	if (drm_WARN_ON(&xe->drm, !wopcm_size))
>  		return 0;
>  
> @@ -105,11 +90,12 @@ static u64 detect_lmembar_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *m
>  static u32 detect_lmembar_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	struct xe_gt *media_gt = xe_device_get_root_tile(xe)->media_gt;
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	struct xe_gt *media_gt = root_tile->media_gt;
>  	u32 stolen_size, wopcm_size;
>  	u32 ggc, gms;
>  
> -	ggc = xe_mmio_read32(xe_root_tile_mmio(xe), GGC);
> +	ggc = xe_mmio_read32(&root_tile->mmio, GGC);
>  
>  	/*
>  	 * Check GGMS: it should be fixed 0x3 (8MB), which corresponds to the
> @@ -141,8 +127,13 @@ static u32 detect_lmembar_integrated(struct xe_device *xe, struct xe_ttm_stolen_
>  		return 0;
>  	}
>  
> -	/* Carve out the top of DSM as it contains the reserved WOPCM region */
> -	wopcm_size = get_wopcm_size(xe);
> +	/*
> +	 * Carve out the top of DSM as it contains the reserved WOPCM region. We
> +	 * assume only the root tile is present, so we don't need to worry about
> +	 * the WOPCM size for the remote tiles.
> +	 */
> +	xe_assert(xe, xe->info.tile_count == 1);
> +	wopcm_size = xe_tile_wopcm_size(root_tile);
>  	if (drm_WARN_ON(&xe->drm, !wopcm_size))
>  		return 0;
>  
> -- 
> 2.53.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
