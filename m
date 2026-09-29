Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C638CA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 20:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D907410F0C1;
	Tue, 29 Sep 2026 20:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jwl36he7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5536710F0C1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 20:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790715346; x=1822251346;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u5gwgOMHkaliG18r2OTWBs9eq5epO+cQsX/FXZyBqek=;
 b=Jwl36he7gaLYGSATEE23l4FQk10gZxqO5gKOe/2Iw2LAdpUtqQPPL8ku
 o8lPuMTjLL08bWT9qH1mgH0s8xL2abTAJd7PKBJVCGsQvls5+etMFJFAX
 L62TbBo4BszoyC3Rj6qi+M5Q/Qr47gVygPl98lTyybILC3IM5c7GisV28
 YyTFJZnyBmHl3GRMAP4GK6GlMIE0ysRIW4xTEI9Aiy1831ZZbB260MDNj
 vqAjT4ZrAzzW45MyUGd/ZqNOmBtRtv+YXNJrqM33dNpgVmDH54zUfRJ4K
 O6XBAY4ODPxvwjuTULclUTsQJLEpBD6/UmBl0ziz2SHlk5jhRdFj5CNgN Q==;
X-CSE-ConnectionGUID: sujz0oNASIO0f5vUiHc8Vg==
X-CSE-MsgGUID: A7Niy3NyRZWh2Cxn18htEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90396250"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90396250"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 13:55:46 -0700
X-CSE-ConnectionGUID: /Y0YKL0HSRaNvutRINJ/ug==
X-CSE-MsgGUID: 4KfsDGh/SrmqGK4BIKWFEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="280238003"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 13:55:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 13:55:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 13:55:45 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 13:55:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mylR18pnSozGFL10cPeALq3EhlnL86ggsynRIC2RlCWeFU2pA8ChkoGBtwJ8torxPxAR0VU6D8IhX3eGZwlYato9faDW0bCt0alfN7Lk6fsGbRGXPKfHTbME2jhjpB+jlofJY1h6c1Dksx2AJLqG3tXAsoMgPFJ0QMDhmsNVTd9QIHw4MrX58wjOPaFSelsCwOT2muLwQrHIimMQEH8VFl80NR8wcJTQqHX+US/5yQoWdrelYZemfpb8PNAForbn+Yi3DAhUj40h582ZAX8OioX22fAYfrfFH4Al/CmLQiBP8PBPTaWKscc4+EFY+2IU9zNZKnF3w9/9uBbzMmI87w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kjo/NgVQ1bdEs7vZLIQNw0d+mRBwjdQoqhjpb8sljoc=;
 b=EBCMB7qkX4CxB+NA49bVXVCtL2i5TPoIHZBA7CJNOhq6Wp6YXaays52EyichgGQKrUoZxrm3QC6G0h5sYKTwtR2aFS091TbNiD40uAt2D2E3ND69e2+9w6XtYwjRTA4Dm0WYWf4lQcF+KliOv2yveW0Y1GEiK/lSfvUwLvoVHUEl3BfmE3A5/4sAR4X9ydYIe0jDEe+OtODsyv4AM6t1lcHMCEN6vem0/j0o9xbd8y1bW5scz1EKiMMsmbfnMsBgMLtpw3ZQbbkorBSZST3CmA0oim0gWsrFukwzHHVBw2pz+j5rymbSkw/+4RsJJBjC9Wh/1sXC/Fwt0+1OMXSoCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8256.namprd11.prod.outlook.com (2603:10b6:806:253::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 20:55:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 20:55:36 +0000
Date: Tue, 29 Sep 2026 13:55:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniel Charles <daniel.charles@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p: Force non-compressible memory reads to 256B
 overfetches
Message-ID: <20260929205535.GO730887@mdroper-desk1.amr.corp.intel.com>
References: <20260929200839.843116-1-daniel.charles@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260929200839.843116-1-daniel.charles@intel.com>
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 4815ca78-ee05-4eff-3523-08df1e6c02fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: CRb3nJ3H1Un4s7YrKtf+1CceaDzoFyYIxSi/DCGhBjO28MJhnOOViVrZagTSYRtdz10VjSfj6v6jqOHPYlj7cCwSidQpewvsHlBzIoa5OgBDVjld+v0s/1XrdFogUj/e9W6UfLL6lqfKE2SURYQ53+FWpoRp8BbQqCAq8tCg9P6TQlPSM0yzWNAcFu2PZ2sl8jFjYyjnJZ2HViPl6AlR10EDlSyK2s2+3h/DMXmeMgQywRt5KZ4DI4buHaubjhk9PydeVtSjA4bdXhSM+RXCju6aL1np5IeSol+F3TqRmpGzn7Jq0HYWDzlbdroxZoYo84vTqZma3lVidQEk8AI2PM4PITllr2a7jybXb8KNZzuyCnMCRaXimVUfKKYSIkyUBXNct4R0XR2PYKQ5Iq3LJF01KURLZ93RpPF3yCaXtWe+SAZCXz4ZhGf4a4wxoWqkiEGI7hG5ppLNr5CQprYoZ0oBFGa3tTQOSNFxQpeR5P/+xdFIAPoR8PIOnYL/2hBef4bGVwIjhFN/zABB9w0SQ8nNT+kLPeWc8UqkaBSJJylb3RcdNKfpFJWv062sQcuvxwXIRvf2I6OHPwdALcMrRB0o9NYMrLnk/HI4BlHAVx0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UUJer3S1jPNYR0h7ozWYOb4K+EW17AsXWCwoGmFqyncD5f/hBBMALUq/aym4?=
 =?us-ascii?Q?l9Y/u7Smzy7eIMoDID2ZHwJ3GbZyIvUdHzkDywo63Mq8/P5HV9xVqKmbFZAA?=
 =?us-ascii?Q?y4yHdPdmWoDdcbpNOl+upsQUZuvTDnTQh1/RUrZAD8mNPvOSP22zLFU4GyK7?=
 =?us-ascii?Q?221HpsoWSWDwmz99E1UypRA+ap3EYAP872GclJwDP8AjAPWBXBz3Y+3V/e1G?=
 =?us-ascii?Q?TxO09eb8PZMEf7G4+piSFn+L0R9w9Q+QYLrMVvyF75iHC5pScvRTorJ2m5sX?=
 =?us-ascii?Q?VVRJtoWmCD25IpWrJp9+mcn9ULMHhME0WkZ2a+Z4suRzssW+DvMdnhrRGbpl?=
 =?us-ascii?Q?GRap5SkiGkZ3B45szv0R4Os8U/beAVHpbWhQPyCH5qWXrjg9T+vYsW8dwLgp?=
 =?us-ascii?Q?WDwBGzU3kaWYMwNqzod0P/688+bqDXAOh+J4kowckwrEZjnNf/lAuxwRBaia?=
 =?us-ascii?Q?G6MBhlyJrR2/UFMEVNpcLymoc3Ca7/5FofhE2thbIsiTdAoEs8LK3QGy75Zi?=
 =?us-ascii?Q?CZ43p/kkNxkDmoXABpstE9yIl0w+GNO5IVNU92NXbl9s9RGfDdnnDMECVpfA?=
 =?us-ascii?Q?XvdDpXIZt4AJFDfsoma4mUXcaTbo+zU5hD2DxcvPcEjTB+Yx3DGHTysblVkJ?=
 =?us-ascii?Q?2HZE3f6lpHQu/jLpMJgTBmRKkA3bNvg49SXO89shti1m5MdcW9OArk1gJIqR?=
 =?us-ascii?Q?JeqAnuzqZddJT9K4fMM9UcX1XagCsFk9GeRS90pi0ZZqNQgUTZa7WJiFQp4D?=
 =?us-ascii?Q?Ve8KTjzN3VJQ130LwXhDGxbS+bRhulwUBnsuxfQw5lov9A/bTnSkb4tFzAzy?=
 =?us-ascii?Q?mUNHRKRy1qjdaXd5uUFz2cM3iJNukUiXK/VGHG3oZpNZpoMzsHx8tKwqtdqp?=
 =?us-ascii?Q?aWVEPNQ9JWd0cGIe4JyVZpTJDfIE9V0m15MoZnNb25qBvJtogzuxHP10dREZ?=
 =?us-ascii?Q?+6UBD6kjmGlkZRDP35ijUZLsFqHH9lpiMIlIyN2m95KeUBPBG/dPvXqtWr8d?=
 =?us-ascii?Q?ePBDw7nUDWM19e/sVy9PSzcXlZt0OvRiN+e1jTWWbOrkobHIIXfRJfSPKh6E?=
 =?us-ascii?Q?57IleLQoxpd2aCRne29UQdkPzUIKrtMM9U87tDpfJOJQIGcRHq3aWwgk10fR?=
 =?us-ascii?Q?nK4Lv6HQ9kHHNCDmgX+V9Jv3M4xYo4MhuZCCXaLx427QLCn1iN+njXzmaycm?=
 =?us-ascii?Q?k+2IFipc8a9BGxxhW4ws1ePWhAAfWn/obTRcxH2wbAePT3Q7EWNv+utYWlgl?=
 =?us-ascii?Q?O2YZV4dyvcdnuZh1HaOssUsAylIkIWrCh8B+rMActGgSYhD7yyR8syFu45cY?=
 =?us-ascii?Q?9rA2Xs6lX9PdsiHeXJndCOgRDIWwXN0BfaSd+6HWrxgqdd26WbSyxfoQVXck?=
 =?us-ascii?Q?gmiDeMfrL4FFIqG5WhHVbjvrje82+qwa4CZ8KAOxrFxRkoWmAA3Ru6c4YKPd?=
 =?us-ascii?Q?7UgvTuPaYuDGClX0RpAx9T1llgaVfVp7X+T0Pubd3cF/PjWDMJizlsKph98j?=
 =?us-ascii?Q?TBIMkxOe2Hnb+ciblL/x+VTnsG8guKTEKzmrZMTny0Rye6aZc/N7KEbzH3do?=
 =?us-ascii?Q?cJ7ysBATlUkroU9BBiNily3moHDr80Rccxnx2Tvi3soFSnxe51tPPmIVXhQR?=
 =?us-ascii?Q?z1Gr2Q5OA5j05IH6V4D5IqZOWhmw3VVVo3EJvEr3UIFK/IHaAxe+uZv1CyQZ?=
 =?us-ascii?Q?CG4P+hVrIgdunGDs/b7kQwvlP2aF+WQFG6LYA6CHL+IkeQOcJYM4QWZk6VlN?=
 =?us-ascii?Q?Kl6JLVkaTUo7KNuZsfRpBW7iiyYcrEk=3D?=
X-Exchange-RoutingPolicyChecked: Jv+q8vTHXKMX9rrlnLS90RMdHNf4j0xT9aMn3vbOagijs0qtdC21yAnTyEstZP3WrdauGXa93kAaqfJ0fHEoQSSCTGpJNDt2m3z8ErEb/EXr67odq6WhhbiNNS50z8pLRhQspUNdAbORQ7CBBSdccGNBBoUIU5ff48rOGEcWsQQ/iDtwH6x1r5EjAz5IFxCcUFzTWcpd/8Nw3XzRVs/f6Ab4ybM9IvfFGdbCEUHNd8HrKyygBvbyQl6PhXsu+l+iELRVmfLrSQ6p8mk/iajdEXtXVJ/EhyL1Sd3PDkDTQOWa70W8C1JgEvKbEtWF3+7PzXl4lBewgQw7qwaL1u0NSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4815ca78-ee05-4eff-3523-08df1e6c02fe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:55:36.6675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nv5kJh0RcvuWZunzqQubGr6NU9kowdeE53fmpd+v3nsfqfeVBF4ZaOzdv+5nr6epvSMoAJKQyM12GcSD1p8wYCoziCS0RIpLxnHZqpU5IuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8256
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

On Tue, Sep 29, 2026 at 01:08:39PM -0700, Daniel Charles wrote:
> Add a tuning entry to set bit 14 (NONCOMPMEMRD256BOVRFETCHEN) of
> L3SQCREG2 for Xe3p and later platforms.
> 
> BSpec: 72161, 59927
> 
> Signed-off-by: Daniel Charles <daniel.charles@intel.com>

Applied to drm-xe-next based on the CI results and discussion from the
original thread ([1]).  Thanks for the patch.

[1] https://lists.freedesktop.org/archives/intel-xe/2026-September/142035.html


Matt

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_tuning.c       | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 2e059cb36c82d..7061b035d3c12 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -468,6 +468,7 @@
>  #define   L3_SQ_DISABLE_COAMA_2WAY_COH		REG_BIT(30)
>  #define   L3_SQ_DISABLE_COAMA			REG_BIT(22)
>  #define   COMPMEMRD256BOVRFETCHEN		REG_BIT(20)
> +#define   NONCOMPMEMRD256BOVRFETCHEN		REG_BIT(14)
>  
>  #define L3SQCREG3				XE_REG_MCR(0xb108)
>  #define   COMPPWOVERFETCHEN			REG_BIT(28)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index bcec40ca2d35f..a9bd3f8969a54 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -100,6 +100,10 @@ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(
>  	  XE_RTP_ACTIONS(FIELD_SET(GAMSTLB_CTRL, BANK_HASH_MODE,
>  				   BANK_HASH_4KB_MODE))
>  	},
> +	{ XE_RTP_NAME("Tuning: Force All Non-Compressible Memory Reads to be 256B Overfetches"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(SET(L3SQCREG2, NONCOMPMEMRD256BOVRFETCHEN))
> +	},
>  );
>  EXPORT_SYMBOL_IF_KUNIT(gt_tunings);
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
