Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78766C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 23:28:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AE010E901;
	Wed, 17 Jan 2024 23:28:46 +0000 (UTC)
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Wed, 17 Jan 2024 23:28:44 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED3C10E901
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 23:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705534125; x=1737070125;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ydv9hvIjzHllCq3N+l9EVLnzskHULCpu8GlQChsOCCU=;
 b=Fuyi4PB/tyycGUWeKb4ZYb23hMUIqUBRTr3Y7B04upami3V9Qbfb5gaK
 Y5hQY4V6j2jxDm5ngakDcUstz+s+ixnl77AVeYvejlB73xUW7thxZrglZ
 /0vx82DaKqL/x71Mj3P20bbHCYHr3Zni6KN7124lBHiE5/oErIzfsbqzr
 LYlhF46RB5IHvEEZqTvA0hlyWK5DbKnOFsRleMAGDLSV4U8DJMUGs9rJ9
 s7Ep90a2sybmCmZzF8ecp712OWVFHNNTXfdltpPHeWhQrZbYUAKWbhzmo
 jBTn/XidKefv29pckUhNWC7ne8Nbo4NRN3LLyKXVaPLYFkHvgAiQL5REP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="192573"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="192573"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 15:21:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="957657999"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="957657999"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 15:21:38 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:21:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:21:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 15:21:37 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 15:21:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBhQX923IrNMbooRfyX5GG8qDKgXgS6/8suyXl5GmnPdxc/lQPWAk6Pu74Y7FOOvdZnxbL5tM4nr3EQvfU1MeGl9PJ3lNMGNe4iuzlAX69T5wV8xLz7C3t5jR9MXBdJV7D0SOLc80IMhkq0HKyu4eFKxPX7VegKRe5aOeRIoetPTgM5exkg3zIEwmSEDaYoZSnjRwWpz0GroGfSETfe+siGymXLwO3kdTgUg4k44p12JOPVg3ImFf+p69HDP1IVXiPN0wat5CIN0xsfbMG3cSUQ3QLCgD6zRh+6AsFkR+csUoYDQ7rfTHImRpSkVQFCwBIa1V6917X2uUBwtzgN2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtoVxnXFeAUYqP76Syj005sTy/KMhyUpo80hcs0x0D0=;
 b=l0JRTqOuxtvWbQ4BhNXxXUzAA4mFnLsYiO5mqlkcO4uVXoipAotwh57coZw/ld9kK5Ws0HFAra7RyYLqgUqzYscf1lsWaobhmtlBxlFj8AEn+Dg+ncWpsUMj6PCM7dqK03vA2fUy4CJwVYFADL1BF8SSXB1oyOQaUxkuadSN3B/P1H1ija6MPWaU8K4qhulGo9brN2jJPZ/3P86F9lHiSJXoEsPVjNc7tVGDks02mz0wlua+YBitTUupJObp3ZvMDZA1e1/D5onrpAbynk2DVEOiqlJdg626t9rjHaV6xQD7vjYCGtt1P9Qy8V6kJzd+pTJl0tg5v4RiDVadGGHp7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by PH8PR11MB6997.namprd11.prod.outlook.com (2603:10b6:510:223::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Wed, 17 Jan
 2024 23:21:35 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515%5]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 23:21:34 +0000
Date: Wed, 17 Jan 2024 15:21:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/6] drm/xe: Assert size of the struct xe_reg
Message-ID: <20240117232132.GJ45138@mdroper-desk1.amr.corp.intel.com>
References: <20240116145617.1177-1-michal.wajdeczko@intel.com>
 <20240116145617.1177-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240116145617.1177-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0181.namprd05.prod.outlook.com
 (2603:10b6:a03:330::6) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|PH8PR11MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: eb7a47b5-4b0d-4e95-0cd3-08dc17b30c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b2A4WmJfGutEHVQhtQTmYV6G5AZvzRIlEcG1RgccSbi6VfIwm7fZxhKGzpVcfBUlkn0La/gUDNbfw2H1ZBzUU6DnpIeoqiSRaBGU5U6cQJNUFDeq1eGkEkPoFllRtNkkTvE5+ENtVkRrw93Rp9dtV64AnCuTt2jBNC6qOOy/ikSI/R6oPyPnK3z17zZ/Ddfij2BG6dc9kYqY2nPLbtdOkfaQqv08v79UBuvW2hcGqJcEgLhQTr52mwuYAluqwANy/QthBqwDvWU5tSPTVQD3nFCKN4ofIQj2Y1fjF98a6sySrgQ90LCSuAu5W5wkMfYJWhRm48wTiXu4Mz1UOOUV4GenJEzrQcQWbEgbimZ1Lqi+yiwVwUAmmuJhKsFb4VS85BSA6Br14uTzdueGRQGj6mGHnFPD4HUoUqGb1M4mBUZUAmJAlf2c2s8dg7wovgv/mMyAfBGd7arrHYIVALhgFutgOmE5FU5mK9dSqvM+hzwVIE+LX8u6c/plCim8K+AEgITSI3HyUedpfEMLVQoTTs6dSNafFVn72iSx/TIYUPBMUwLwKN9wsVNYE+r1ZMtA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(1076003)(86362001)(26005)(41300700001)(6512007)(6862004)(8676002)(5660300002)(4326008)(6506007)(2906002)(478600001)(6636002)(66946007)(66556008)(316002)(6486002)(8936002)(66476007)(38100700002)(82960400001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HBTLYlUGSf/90oVjq7VUugyDiq43JvofTuHrYEoDS4l4aA0sPViMvQzlU4iV?=
 =?us-ascii?Q?PRDyE0NHfBwdIYP/6B2uxFF4mHiHFaYfMgFK7JQcwf/Aj2jAMcbnYsbYtiOc?=
 =?us-ascii?Q?qlXQkbTnZWw8mH05bCUZEYuiD2G0aDg2KpQKSkqimOANvCb599KzNrCn2egu?=
 =?us-ascii?Q?MVEhf3scipN/NrjJZPS6S9LbscWXHlPZtfkAuLuyeFn4NyKLlNLTCCo0qXD5?=
 =?us-ascii?Q?T8amVftHBhKGtGqwe+UTPdae/N1DW8bCqNW8516AD6ChhhvSruYCnyG09pCT?=
 =?us-ascii?Q?+RXlvGyRwYOzN9oiG5co7gYX51usWOn4by19jTNSGUOcPhuCouN+5+F4XAmC?=
 =?us-ascii?Q?EEBwoBZCKx6c57obO9Y5cOgEC+KTq7OoCw/oqspEmkoHuOCRyxbLI2uZM/8Q?=
 =?us-ascii?Q?77RaF2PUtIUTOpE/4LesU2tVnUhrrST6GxdFaMRNgH0JKGnUjx0qvoeT7a/X?=
 =?us-ascii?Q?+IbaurkxFzVbSUzqtEMA6+fwBPAU02PlF2d4e9+t8g8d1HvBeIZl0JhE6JK/?=
 =?us-ascii?Q?OtSp1yBzZHBcS9GtZaBcaEEUj4HB9xKE+7h/RyT42fXtJE3I2rw40HbCY+0S?=
 =?us-ascii?Q?aHZonymaRwiY2uKlL/Gua+yGJODTW3IXcAinjzuvoE5xp5Q/ZpcFH8yGO/oj?=
 =?us-ascii?Q?oWrXZ6i/T4JE0G9h8ERFxJnGJJZP9dZXqh8Dzbdso5um9mlv4plIsPHekYnV?=
 =?us-ascii?Q?ar01WHD0Em5VgiJ4Oe4EmrMcTTxcWRM94cotxwZb6B7zxio6fGTKyiGrf7CD?=
 =?us-ascii?Q?MQSJCdFLrAzzK2XwCrmdY8nsCLs40o8g4l8vPIO4kU3f9qhZYsgcrdmNI5Ur?=
 =?us-ascii?Q?5pMp1aDvLSzNflHnlrlKo2TLGMEgqrUKQtI5XnbqYWHatJBrzQMrqmhNHV4h?=
 =?us-ascii?Q?KY5TZsWT4HgtMWHss0s/NLPXYFmWR/CoXcAVvTg/WVM3Df2JUMD0GC9Cp4R/?=
 =?us-ascii?Q?kptQo+HXwr7i3/ccwpeM1B6oN5pb7h80gdIKKibubIAvO+HqnrrUHq60vQrX?=
 =?us-ascii?Q?Ek/xDz7FuaLds7CySMHguFenHsBo+fbn/Lhf4zkFVsih8EM65RHCzvo6w8v/?=
 =?us-ascii?Q?sXFZnvJ9sKBtfT0ANTm71BS4Gzho65PutTTOQpW7w5m/x02nNr2grA0FMWE/?=
 =?us-ascii?Q?Vo+1pBZAkOW1Jw2YqotpuXN9GHw68KaCssNKB1xtgQzUnqM5oI24uK+8Ok11?=
 =?us-ascii?Q?D5GHBQgVIYDvrKhBftv66TZNHxb82tHS7fmPmMVT7VDxKllFm98L43oRBzai?=
 =?us-ascii?Q?ayyZhDuOzCrVzgWdfrODpALBqeB4IFPp+OfzSrCo4lvvtIN2Vfclar7NIFob?=
 =?us-ascii?Q?In8V64r4rvpzlAQx8UNXsltpD/XvnR4Sy4EoqxxiIhNokQluj8YhC+bkP+Tm?=
 =?us-ascii?Q?p27P1LL0quq+XRPSzNs9tBa7dWFpsMb4oTmkfqcCv7IyEvSerPr/K2wv2/WH?=
 =?us-ascii?Q?Xut+vKJUYgsl5MyBvglOkEk6c2pxMjKuM5g4nYjYzRI2KZKceaQ5X77k2ON3?=
 =?us-ascii?Q?8B2+LZ5fliTQF4UuvxTD3UUpxu7rofi2AsGdSsxoVPng6eHPSgZe10gO3UQj?=
 =?us-ascii?Q?rj0N0hkD6Yc8eXrFVAX99q2FRcXYmWmcH8OT8V570pLXrPZfdy4LY3UjW7x5?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7a47b5-4b0d-4e95-0cd3-08dc17b30c02
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 23:21:34.8914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gaiWtb0QhdVgrdBOcLUOlnEuhCfgWGWirAh17bDDPyJmSk1PXWeD5vZFZHybhW6A9xlb57FWB/65AjJ5KG/I0GvjKMD8P9eRnY/068ue/gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6997
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 03:56:12PM +0100, Michal Wajdeczko wrote:
> We want to keep the struct xe_reg as small as possible.
> Make sure we don't accidentally change its size.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> index c50e7650c09a..114b07db962f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_REG_DEFS_H_
>  #define _XE_REG_DEFS_H_
>  
> +#include <linux/build_bug.h>
> +
>  #include "compat-i915-headers/i915_reg_defs.h"
>  
>  /**
> @@ -44,6 +46,7 @@ struct xe_reg {
>  		u32 raw;
>  	};
>  };
> +static_assert(sizeof(struct xe_reg) == sizeof(u32));
>  
>  /**
>   * struct xe_reg_mcr - MCR register definition
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
