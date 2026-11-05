Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CDC606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 22:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mS4SwIbl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFA910E99B;
	Thu,  5 Nov 2026 22:18:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59A610E99B
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 22:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793917113; x=1825453113;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MtLDWA4Ax1/ZyEbNej1qXr8TjuWSqThyk8U/FLVF7yc=;
 b=mS4SwIbl1o3+SCw30MX7d/c3qSVihdFybDQHwCdBPvXat8snZKIEhD2A
 y7mUYBU7Gk3jnHS8uuLa65Qf8nC615kNPOh04AZA+h0WtRlLeTI4OEArZ
 Wrm1LlmmwaztrHR8YB+o+EllNS9MZO7WrfckD4lHjptP6UPBvvEQKgyFP
 ArI2s2uQ1OdAZiFvZdYodfZWzNWowg831kGPT+MzuTdJXn3LWx98IFLnL
 wHwsWBNNEGffw9D6M0j5XgtAF2otb4O+PXHHYAW80FL3cuQoraNJHv97H
 5TIJvEmKVAH5JUaY9R7eild+B/Rubwpr16axkGEC0v4HKfKr9Y+HHeYfq w==;
X-CSE-ConnectionGUID: 2If1kL2gQJyEM8/tlUJCqA==
X-CSE-MsgGUID: /MbhWzg+Tty3bnmIVRG4ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2753152"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2753152"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 14:18:33 -0800
X-CSE-ConnectionGUID: JU8wCe9qTw+SNYH1z8kuvw==
X-CSE-MsgGUID: viKlrPnKRBKQjpxGiAscUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7003891"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 14:18:32 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 14:18:31 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 14:18:31 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 14:18:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPAeNHoptzylU0VRwmNhI7d92NfQZhG3TR/srp0dm4M7mkvMHIAL5ugf4dH1mWADwfwGG8JJG1+x2LyX/ainfFv1vVYJ84pjqSAqIk66qiDDtV/GfAUxshEnJ6UZ++MKx5ukr+AfaBbngP0cvOr+M63uRruL//W97DOc+D6HEPtioKgy0qyrJdlTK63Flu66d4lOlKaZEQ9uIPryqJJalDK1/8Tp+C2qbyPdXa3U2IXQVc9BQnhAChMN453ArRytWEnRz1O2VtPOdHxh66cRJv0NXAeHEKpV99MpFw3i8KFrkRvwooxmORL1g1EE8J2CD4LU/nKqOyj1smiMqLYcZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDrHPHC7WWst40pOWApIhepHAYM6uNL8sN2l/64NSVM=;
 b=IzfK3Ek4TBNODnb0dYZz8baUlUTU5VrdnFL1cMKmMEwLcDBUGMtUkj0/zlObl5iLkS9efxze2za+8GP8ebBMxF/2qVDwv6YJz5QxwZN48AENkk9a4kMLFZvMwm2OKFU5k+lED4ZmlbUReNViAKRGB50y6CZZi1g4X32HyNGTYISa5f9mCo7qZiBD2Ca9RrOdUPgeMXu5Hyw4NrK8vwVCMsM/qnokGtzW5k5tlpkwT2r2Y4gXPpXM8xrVS25wk+3hPptOQ+J3i832iq7dPXRT7bDUrB4aUqiTLJLti0h/C+b+YUaXlvu7xTIY5MO0yZ6BXS3KY0/ghtENX8UvWwlZfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by LV2PR11MB277206.namprd11.prod.outlook.com (2603:10b6:408:3a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 22:18:24 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%4]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 22:18:23 +0000
Date: Thu, 5 Nov 2026 14:18:21 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH v4] drm/xe/guc: Demote uncorrectable local error log on CRI
Message-ID: <20261105221821.GG6162@mdroper-desk1>
References: <20261105145531.1847892-2-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261105145531.1847892-2-varun.gupta@intel.com>
X-ClientProxiedBy: SJ0PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::22) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|LV2PR11MB277206:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ebbcabe-cce3-40c4-da34-08df3b8ab4eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|261026140227099003|11063799006|56012099006|261022105027099003|261102123227099003|261021123027099003|261009223027099003|261022075727099003|261022113327099003|261028144727099003|261026121527099003|261021121427099003|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 3PPCwUK4fWXQVl05yK7mYeCGmy8WgRkma8/nM/awn0CzzUxaaB0KcmLd6XeBKdfhOxQVkA/KBUY0Q48wMPD2n8SwvZLPUmPuGwc2FzcTn/cOsoHtE6lr6+WTzvmzuOlTv+6yBkZpRntKlRVp0MziZ2wwsBccwgBIUPVOV019rlycuQxtkj5+9nLAhpAWaVfh+7FVrxADrNeYJqrO+wV2HyfJzgQ++7px1ra3yvBOV+rHiN6LnJByZDlJ7xjeo9w5vgp+AfTDkEp6joUgFUJXvh97mOUtuRz0vS6lwiiqOVcWf/BqHVdEM3WPcPtLE7kylfKdbOlQAJqRir5/VMfHA+ZSTIsx5A9guA6GCdJPjq3cJY6Mq8ZE1vY6Cp7+VtObwyqHo7U//YiYt6gX9Ci/guGZ1nEvPmT8hbDaiV40n9uKhLayMj508Qi3l7OlyL2jzwqrmNPaDLb8JlkPxcdhryqWdRT3nDthqiHPMWdSAqKmFZIHdHXFpeE3Oh+UVnMzZ/PSdzxHt385nWxCAIz/XBD+B88icDuQhQZ4kt0kvu6+X5Qlim0HjFIGGgiL7GylHVY9LRDq8w7cz4uxN5FyQhKTqmQ/a7LVbHXSFLOqT56kA4EXRKCR0b5RmaGKIRF6XEmYXtqprOXKclyuzAhCnTOIpiU3kddjOKLTDwPpWJM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(261026140227099003)(11063799006)(56012099006)(261022105027099003)(261102123227099003)(261021123027099003)(261009223027099003)(261022075727099003)(261022113327099003)(261028144727099003)(261026121527099003)(261021121427099003)(18002099003)(22082099003)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QFyHjDGt/EWIX6P9vahtVn94fU1pVAZZllADxXsZzKwrp7HYsrzhMt3tD160?=
 =?us-ascii?Q?yxL7AhVFvYx8+y04S9V07G5Zx4SMfSZIjmaO6Zt9Hdpr7t239E5Gyni3lJC6?=
 =?us-ascii?Q?VS4xLyABUD3xsvgMbA1PxhuUdJ3Ymb56jpxQvYQONBdR5bgb7Qg1Rplfa37P?=
 =?us-ascii?Q?d4vdYnRi/+AdX13QOJNZRNLtsnxML3MO8iI6W6nwjbX0bzt3f328EQ1ZJhGH?=
 =?us-ascii?Q?0m8x04GYtaCHQsoT2/4R0xjLcrD24+xmsUrvM6dcfs9PMzoUnMr3WB15d93T?=
 =?us-ascii?Q?1uV2d1qrG2hs7sqJ3Lq0+Jz5qEdvHIEb2KU+WdcFryk2rDAQeE2jsTwYH4yq?=
 =?us-ascii?Q?Af0t6QrTVUo81e/5aP6t5y+p3aKfFJrMT2CnEu3BPPgrm0jFsTWyT9bp1LJ/?=
 =?us-ascii?Q?qPT/Dbf6HKdFyWk+2dowHWtSWA2LE3zuBuiAjv2KIZKy7w+t169j0VyRjtSu?=
 =?us-ascii?Q?QM50R1Ay/x0u9ukRI6xgnZeet6bEDocSa5iwXNFvQLCojpHroNyBziG1/zep?=
 =?us-ascii?Q?/DTQLXUPo+YzNFiBWiYFSNf6yuxFVbNxE1N/7MxX2IRJHREtFLZzalEixdvl?=
 =?us-ascii?Q?mUXLaszKsyC3FpXgopEQDMy3Nn7sb5ZacyXrPmaWpPrS6NEaq7ZjYYYs5+ee?=
 =?us-ascii?Q?j/qNTkqjzSt/+a5n7XhEISXD14JHWhJWOmMjddA79t+e/xD/upa6gGQuFXGb?=
 =?us-ascii?Q?bXZzV/ZXR//20BGVine41ZcGCkRacthm929n1QqT2zUfm2qeZ9aAIRJg6BfC?=
 =?us-ascii?Q?2kNMZZVFC8N+tUfzOM3OqTmO2AdlNt/YbQ29AFEzBvfKID+HBTZw85gtKzr2?=
 =?us-ascii?Q?RJDABP9dDIjnO848+f56ITxNEncGfGW+AimiPvMkf+CXEqK0SpZNJOkCCBKn?=
 =?us-ascii?Q?YwEgZLDbHlJRfzNYAUptsWpeT8cBzIKWOrh30vaswLxP1EFeBUzkLvnM1mxg?=
 =?us-ascii?Q?IxGa8AtckzLkme0qJ/tSAR3ay/6FZcOFI2DGroAzULxQ7li1atjmdsESDKtD?=
 =?us-ascii?Q?Rf5ZW3ctD/CuAsSgt+z2oEvHmMg/tNvmz5AG9X4XEVgyQB/fgnEw4Cb+c96a?=
 =?us-ascii?Q?3n0nJutKo7aPRpjCNoz+CVh2MFR0xiVNzEEFJH+UUEIsdPGXe71/nVS0Xl6B?=
 =?us-ascii?Q?Zm02DTjjkmcvsMmmPoavZqWYMRLPppxn1dKa4MswSdcuIrM6JbX1Vbj/OSUN?=
 =?us-ascii?Q?HDB9t2Btg9Cr5kfwreebCdqMsfQg3mDYdDXTtGhXB2Y+8xKpR8b6BLIy9HhD?=
 =?us-ascii?Q?7+eTwiNHXXmd77jRJIbk6MtqdyfkgqiSVwGsNdXK/+UBr1p6M8/0gs4JwL1m?=
 =?us-ascii?Q?CWK5t4kcmbmPLJ9C1BXT9qxfAUoMeJ4pHwAPaVF2tr19cepp7txfAF/f8tfx?=
 =?us-ascii?Q?Sh9FHAm0VINjJHFoSBy7AsZVZSGReKNAzOHRTS55waWpcI896e98bJl1UZkg?=
 =?us-ascii?Q?ebAM2wdCoBzzOKFpWGQm6yWCPC1f6Q23n0iaeOL5hwV+S0cLeqb0GpwkP8Yk?=
 =?us-ascii?Q?SbMUqv0jiID9gtPhjBT698Dtne4dv9WDTsAxd+z2L0xscBiBkpBN9UWSAdwf?=
 =?us-ascii?Q?FWxIFM8eBCQG4CEee5IN90P3Kw+prO7LeL3Ym/Qnt5KK6IDKlJ1mGXZwnQvC?=
 =?us-ascii?Q?2ki0SiwckJOe4SxIfuwNWd27YYzbjBwgAM/vaveiTgxUK6a5u/sNiUhmqg/4?=
 =?us-ascii?Q?nXT6vKhbQBmgMHY1tAlMNJ925nOITHb8xznXb4FCXkDdiI1cxzgsuk2lG88O?=
 =?us-ascii?Q?0GX/5grPf1kBDwIzjFbjjzAwxBCabZA=3D?=
X-Exchange-RoutingPolicyChecked: tFLC8ccUzgwxBKTdTAAr37FI6hzi1YEPHKeqOikpOQuXRBFmOpBUni1OvJ4d7cmBd9CuNsAxRf8aZ/ec7zazoO75/fkCAEm5aZqdjNwLWVOmqtRxos3JUAiypXCwEYHES7dzSkqc9MAfWpelKQVIRuYye4JKNOnpPljW0ksf8p+nGQ5+LhKF3FULhg3UJOtUmDD1BAHOCkf7RTj/lwYcCjKGW0NvPlIsiIXTqDIDFGwK5rb+45FPNKrhomyot3u82jZM2e/4OcijyklgNQLcdJTED3fHi8UJkbpKmruGJ8Zqr9sqFH3vlloF0wHYyugeQh8LxB48BzqzmfCoIPA67g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ebbcabe-cce3-40c4-da34-08df3b8ab4eb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 22:18:23.8340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmwgnHgSxUyUeIeOo9Jr+yq+NDAseAmUEAG47Bzh5kYawOJMu73T6tmDiY+rIlW7P+MCq0mllKwElwyFmQVgLjmTlUprWcLgkyYL86KvA/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB277206
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

On Thu, Nov 05, 2026 at 08:25:32PM +0530, Varun Gupta wrote:
> The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
> local, queue-level context termination rather than a global device or
> driver failure. On CRI, due to a hardware limitation, the platform cannot
> distinguish GT translation faults from true RAS conditions, meaning
> standard workloads routinely trigger this error.
> 
> Printing this at ERROR level is too noisy and causes false-positive
> dmesg-warn failures in CI. Demote the log level to INFO for CRI.
> 
> v4:
>   - Change to _dbg instead of _info. (Matt)
> v3:
>   - Limit the demotion to CRI and add comment explaining the HW limitation
>     (Rodrigo)
> v2:
>   - Also ratelimit the GUC_ID_UNKNOWN to match the CAT error handler.
>     (Himal)
> 
> Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Hopefully hardware and/or firmware will have changes on future platforms
so that this message demotion won't be necessary going forward.  If that
winds up not happening, we may have to eventually come back and turn the
platform check into a feature flag instead.  But we can cross that
bridge when we get to it; CI on future platforms will make sure we
notice if an update is needed for them.


Matt

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9e7c2778029c..abc2c3d67f29 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3610,7 +3610,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	guc_id = msg[0];
>  
>  	if (guc_id == GUC_ID_UNKNOWN) {
> -		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
> +		xe_gt_err_ratelimited(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
>  		return 0;
>  	}
>  
> @@ -3618,9 +3618,19 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	xe_gt_err(gt,
> -		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> -		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> +	/*
> +	 * On CRI, the hardware cannot distinguish GT translation faults
> +	 * from true RAS conditions. Demote to info to avoid false-positive
> +	 * hardware error logs.
> +	 */
> +	if (gt_to_xe(gt)->info.platform == XE_CRESCENTISLAND)
> +		xe_gt_dbg(gt,
> +			  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> +			  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> +	else
> +		xe_gt_err(gt,
> +			  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> +			  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
>  
>  	trace_xe_guc_uncorrectable_error(q);
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
