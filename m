Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18F9C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 23:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8C310E737;
	Tue, 30 Apr 2024 23:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNVheoqp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2702810E737
 for <Intel-Xe@lists.freedesktop.org>; Tue, 30 Apr 2024 23:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714520685; x=1746056685;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jq33OGjKiFKyXRxVBRmY/F6jOnEwSOqKNJbqmR8opkc=;
 b=QNVheoqp9f7E2Kr1zCf1wsKbXTU3tt1XNONuzYsJ1CAs7SqAoummPzii
 gSASfQJp1hfz+y3T3LY1WewWKxzauBOZqQ6UFAIx13QQO3vvhNbaiISW6
 7ZKHb/3ZKEsGqVh3944wd2nUuWMLWnui/6IRUrorfRIidz1JANM9yOlPS
 pKuVYkNt73YsqfQxpEoB+14ihv7E6h7H1HZ7v6bQ3U1gJrbhLyeJYow5S
 Audd/MdPV7NeKHJsoBxQttmT9q9Tz9e1zF7BjuOhWYla5RZaF7mZeDTkn
 /3ifhB7rewAoCUW9RukG0cte5in6Hfz0FFpdvgLk6NqGNTBvGaG4zngLb A==;
X-CSE-ConnectionGUID: ZiiZ6qiTRBaSAoRBqdWbDg==
X-CSE-MsgGUID: uISnKJ8OTUSguk5zMZMlyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10116440"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="10116440"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 16:44:45 -0700
X-CSE-ConnectionGUID: GTkvfATbSSiF7FVbXztpBw==
X-CSE-MsgGUID: vKogEkj3Tt2xARPSe2xjgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="27042206"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 16:44:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 16:44:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 16:44:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 16:44:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELAW30n63jz/OOxzG9ShFpt9B+ECLCKOZ4TyO5xbZCViNFuIWq5d92yQednxlm51OtkhjYixu4D2prga4QlRHaiuVVFGt7alL/lvTTt6siWnfDJvaiwB7ZgLBjqHwL620sucMZBc2sdTjGyHTEV/m3XisIFma0GqRkWqfzLEEw/oK+v4+COG74gZjhiCPI4jVRyLJPY/LJHXxsQ+yiGPQ+q1Z6yXzj0rOBLqdTOZTU59bMkoKtISq4OBGDUiiu33KUnM2RQoNEUt5rLLOSNrsHRM01/QE0IlssoZTEYSf3wvNHKRQk36wEI7Khnv1ZXwj9hFCn4Wyh7zPd1i3jFutg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NERw776Ks7tTwc/+0aitvx4U+Xa+xUTuAVc5yRsexrM=;
 b=JO1pkLbcHLOFHz3i4jlagB2GM2K8jWfkRsVb735fMYBaW1XU46/wUsidDNbdcgiZxJLaZsc+aVqxa0q45WeU5fFKUmWqUXFRIFYIMZHHQdaTym5yze2Evh+bGGfHrxx5amVhq4qPzBiidObcok6J7+sRcyzvsbNnAamoF87Gy31+uKQuSYz15vGBSPvWbBHH/hvnqpfmH91sy1y8T7A+9k+/0UMb41vKJ+Pwbs9fYvzG8M+iELen8WAjT5kqz1VKdUtnMUYjZLWYMyDvDQs1DCdCsEgH/Sh5NZLrIPN/IFAfxJDLJkizXs4Xe4a4TZ3ssx5GOYIC8lN8/n57WGGeyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7825.namprd11.prod.outlook.com (2603:10b6:930:71::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 23:44:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.023; Tue, 30 Apr 2024
 23:44:41 +0000
Date: Tue, 30 Apr 2024 23:44:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Improve robustness of GuC log dumping to dmesg
Message-ID: <ZjGCYRp7J0/b1MiW@DUT025-TGLU.fm.intel.com>
References: <20240430233436.2838165-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240430233436.2838165-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BY5PR16CA0017.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e4b7c30-b702-4e69-6039-08dc696f818b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g4lk0jet1zNs67dVN/su4tJwbBq+umIa1Tr0TcPhySce1DxY8ItXnwuy42h5?=
 =?us-ascii?Q?kRvi8ZiBYSxvZCzW8jWM9BMZ6cmsj6hEHhf3U16DFuVbM0M7DivMDQnE9yiA?=
 =?us-ascii?Q?6m6cCQiXxajsB1RDn0koOP4zOe5P9YBsW5CaCYySN29AEqyYUaejTKJi77wm?=
 =?us-ascii?Q?8QXS0W0HUZTm0trd1NA1cWmhpuZsl0uVHi15k7U8wFGpEMhP+QirVe1DiOzO?=
 =?us-ascii?Q?0IB7VeLGqKmyAAAud8/rhGSzX3SeO8nhofEa9EN4veZVXYLg9M/Q/qhQ9sza?=
 =?us-ascii?Q?M0o+VgaBOGAoT4eKrJr/NsA1WWTXW6WEps7z77HHRtKhcELo9n17DMoGg927?=
 =?us-ascii?Q?jjB33z8aWbFKfL/u6bnNj0uXQ7qUqMHNMzndAtTSrKj+lUwC6f0g6GK+icA4?=
 =?us-ascii?Q?IjdbFRXz+Ogng8zRHe8aIDbJL/DgfxFmih3V1/2cQvQlMcyXJkp0ZdzSgdKt?=
 =?us-ascii?Q?P+a7o3J68JsxaiuKHATiNo+HvuUyEYsVkVbr0D7eh8CNQ2KFhjyDhrNJEuAi?=
 =?us-ascii?Q?PqpefhNjuAiAjtwceszNBAjkKY9wxwvzoWD0PoAWQ7S7q3tG+o2u5WevyMvV?=
 =?us-ascii?Q?kf9en5ZOjHOMcUh/NvnZB6tuWWhSQqCbd2jOstoPANVYfdvK2omJDXkFfZti?=
 =?us-ascii?Q?frW0pFZBQAgMJ9Ss9lMbkhY1TceUr1KdlNyVfcVqUB9LsgOqHNc7MmyAh16l?=
 =?us-ascii?Q?ZDiV0H6/KFRcEhmr1O5oXKhAr53lWCV1lWxLgAFr84hUPpe9VId57qsCLA5r?=
 =?us-ascii?Q?ODdtSjFUSufJdTBM02zRp5adMJO2cjoppuk4SQo6tyEivbehcTlOQEZKjGJn?=
 =?us-ascii?Q?DTs6Gz0eQ60gC1dJkSRdX7WmHaz1tByv0uk0GDhSuU5/TbCtORrZxSit4B+D?=
 =?us-ascii?Q?wZGnSQgbHP6bwnmBPOMiPm6J46YMKUpOfNwFsVU0q4AUn2wc3dw1YmA3NMh+?=
 =?us-ascii?Q?UHgWeYnkGEmuXoljBcZ7vx/GePaH5CnkE+v/tpk6HLl/OYp2eRx18qjZZ6gh?=
 =?us-ascii?Q?GrASEuuN2yM0hD/5oY21hB0MkpUy7YKRa7ZfvDa8g0FOHm9uepo3wrNo69By?=
 =?us-ascii?Q?79jQ59TZKppGVVRHNZQF6XP1c2nASFYoUqtvv5Q1AyM1emzTnn2Rp9d+L2sj?=
 =?us-ascii?Q?6pZf9m/yda1vhq7xro70Td2x2nv9T+weAtMpx9IU2xEFMiKP91LEmp1N29WL?=
 =?us-ascii?Q?EGzoYA3JrBlFkzKo0au35zBkxjXIYvhsAnsAxFSqO7erj6K5AadWInVEjklF?=
 =?us-ascii?Q?3fMZjlilPSimDnkB6wkJo+GKWdeEh8UYg/xXf9EuMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kqjCD0zSX8BOU4pHIS7lp3VJ/BwDxSOPWFXMIchEA5sJujQa95iKvNB0Dgra?=
 =?us-ascii?Q?ckbwYYCwujF2WUhl9T0erwrSwYOhXGasC6pEyMa5yHm7Ffb/+dcolCp5UiLW?=
 =?us-ascii?Q?CTNe3rPoTII9n+wX9nvaACf4g0PTPdCjkTxkkUR6y56m10/R9sDFMGLp/f/f?=
 =?us-ascii?Q?EW78PzJuQPg4SjDeXA2NP/4eeSWfYZDiunYXj9ZUea8ExAhJMueR9NogbyK3?=
 =?us-ascii?Q?2g1QVoMjF6QRVtFu6DeFejcGD5v3JQr8FpfiNE7gNc2ix0eoaF3OZU4NXnPq?=
 =?us-ascii?Q?NKcrE+4SSKcu2veUPH9myUemfaqMh0EYXN3x8hJXGF+dYnEYgomz8heH8k6k?=
 =?us-ascii?Q?olzavbitYaB/jEUCo8mQE9tmvuCgqza6udSJFBkbp43eI1lK6X5zsm7QTW22?=
 =?us-ascii?Q?C0BvtupMRX2qcFsGNx94dou+MydYYcazq+YPD+3/eeS7nWb4SkoAL+DAh8bN?=
 =?us-ascii?Q?8TF0S7duj+aIshMpc/EDhajlkzJM01oJt9ON99dLar6Kf46NVjraSyXTr4Mq?=
 =?us-ascii?Q?AzzL9/EmGsg0zvhU7ncGcsBPB/b0fvAXxDHDLl9nctpzkMwQOqHtVwfxMhwG?=
 =?us-ascii?Q?Xo41lFm0ioYsQYLTpu9w1vm8/iycc9Uo70NM6e/6x7RLr1u56D+st955xr9Y?=
 =?us-ascii?Q?kU96KI1h3xy9kx6foWb+3q1eDxCEWt4fvmUKklKoAzT8d5GB3lgLz5rUFZC5?=
 =?us-ascii?Q?FMge2k66+xXh8teWObXeztyAHFnPEmeE+y7u66CbutECaarivqVy6g8BFeW7?=
 =?us-ascii?Q?DpSfdGz6MY2Cnl3x+YxOryvZFZlCrt6VOA/wDkatcxgcl9/+EFvvua6i0hzt?=
 =?us-ascii?Q?+N9jnGvP3e5e0KEhCP5Zf4caGR46h8YV9KendGF9cbRAg62iJCx8P+TCcCGE?=
 =?us-ascii?Q?ozdbHabklNN+RPmCCWzWQtABxVPyLNCzkqdrswC8y6L2WCLs8lUmdC67WCEK?=
 =?us-ascii?Q?Uj6Hesg8vYxaby8VwLzGFasCkHnuPbOr9/L+0VdODB/yqNNt6pXTfmEoRxbV?=
 =?us-ascii?Q?TYjVq+b0DxLY+cw9F/C0k4SqYsi+J0WtZT4IFrhq0uDZ9mJo9zJV0lGfwDTq?=
 =?us-ascii?Q?fgQzBILSDGx6jYHhVWewdyhj4P3bT/zG/abfuTZBt6ftz5uGzs+yPE3D45z8?=
 =?us-ascii?Q?sSG4pMulRGu5R2przum+UpCm5ELwths6ihKjA0NnSu5E2XXqOd2j91xny4lB?=
 =?us-ascii?Q?bPydLrJ4xbB+XgFsVIdLy+aYCj60Oy/H5r0GOCvA9xU34Q05hUqMTHdSx6Tq?=
 =?us-ascii?Q?BGHu4U1/HQt1B15zZan/C3o3nuGJdaCytgNV4tFDfPx7Gwrewtn2lmAZn5sw?=
 =?us-ascii?Q?i+JkHN2j+x5ZXe13V5wAkg3+N0hE3mapXu9rSg6XShAoUhbJ/dhHRXZ5RUkd?=
 =?us-ascii?Q?oKpISTcVNIPsx3MAD33ZIAr6n62kVMLCTHx4zXtQna3f7g2rJuMH3WokT09q?=
 =?us-ascii?Q?ajpU/GY0Oje7IRUVYrcAAbkWs51aapCMVXFXkkLj6LsabtvKHN4TtYBdMEqz?=
 =?us-ascii?Q?JRf5nRKahqqe6KqgGG0xG/VoRYQ/snC0r5JeQrszFcEoFTimz88kgKQUOhJb?=
 =?us-ascii?Q?ivCqaIZ9WbmE9jGeePF+JV3PdZs6o8o+4LtDAYhmdOrfXUFjHB314UPA1Y3U?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4b7c30-b702-4e69-6039-08dc696f818b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 23:44:41.6963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9o0j0bgiGRyk9eNNw/W7YdeprWo12hNkvsG8HFyVm8tovLIDVFzbdrANFgLxMcT+R6LM/+It0CCCCzauy5VeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7825
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

On Tue, Apr 30, 2024 at 04:34:36PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> There is a debug mechanism for dumping the GuC log as an ASCII hex
> stream via dmesg. This is extremely useful for situations where it is
> not possibe to query the log from debugfs (self tests, bugs that cause
> the driver to fail to load, system hangs, etc.). However, dumping via
> dmesg is not the most reliable. The dmesg buffer is limited in size,
> can be rate limited and a simple hex stream is hard to parse by tools.
> 
> So add extra information to the dump to make it more robust and
> parsable. This includes adding start and end tags to delimit the dump,
> using longer lines to reduce the per line overhead, adding a rolling
> count to check for missing lines and interleaved concurrent dumps and
> adding other important information such as the GuC version number and
> timestamp offset.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_guc_log.c       | 78 ++++++++++++++++++++++-----
>  2 files changed, 66 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 11682e675e0f..45fb3707fabe 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -82,6 +82,7 @@
>  #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
>  #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
>  #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
> +#define GUC_PMTIMESTAMP				XE_REG(0xc3e8)
>  
>  #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
>  #define   GUC_SEND_TRIGGER			REG_BIT(0)
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index a37ee3419428..ea269efd9c21 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -7,10 +7,19 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_guc_regs.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
>  #include "xe_map.h"
> +#include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_pm.h"
> +
> +static struct xe_guc *
> +log_to_guc(struct xe_guc_log *log)
> +{
> +	return container_of(log, struct xe_guc, log);
> +}
>  
>  static struct xe_gt *
>  log_to_gt(struct xe_guc_log *log)
> @@ -49,32 +58,75 @@ static size_t guc_log_size(void)
>  		CAPTURE_BUFFER_SIZE;
>  }
>  
> +#define BYTES_PER_WORD		sizeof(u32)
> +#define WORDS_PER_DUMP		8
> +#define DUMPS_PER_LINE		4
> +#define LINES_PER_READ		4
> +#define WORDS_PER_READ		(WORDS_PER_DUMP * DUMPS_PER_LINE * LINES_PER_READ)
> +
>  void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>  {
> +	static int g_count;
> +	struct xe_uc_fw_version *ver = &log_to_guc(log)->fw.versions.found[XE_UC_FW_VER_RELEASE];
>  	struct xe_device *xe = log_to_xe(log);
>  	size_t size;
> -	int i, j;
> +	char line_buff[DUMPS_PER_LINE * WORDS_PER_DUMP * 9 + 1];
> +	int l_count = g_count++;
> +	int line = 0;
> +	int i, j, k;
> +	u64 ktime;
> +	u32 stamp;
>  
>  	xe_assert(xe, log->bo);
>  
>  	size = log->bo->size;
>  
> -#define DW_PER_READ		128
> -	xe_assert(xe, !(size % (DW_PER_READ * sizeof(u32))));
> -	for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
> -		u32 read[DW_PER_READ];
> +	drm_printf(p, "[Capture/%d.%d] Dumping GuC log for %ps...\n",
> +		   l_count, line++, __builtin_return_address(0));
> +
> +	drm_printf(p, "[Capture/%d.%d] GuC version %u.%u.%u\n",
> +		   l_count, line++, ver->major, ver->minor, ver->patch);
> +
> +	ktime = ktime_get_boottime_ns();
> +	drm_printf(p, "[Capture/%d.%d] Kernel timestamp: 0x%08llX [%llu]\n",
> +		   l_count, line++, ktime, ktime);
>  
> -		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * sizeof(u32),
> -				   DW_PER_READ * sizeof(u32));
> -#define DW_PER_PRINT		4
> -		for (j = 0; j < DW_PER_READ / DW_PER_PRINT; ++j) {
> -			u32 *print = read + j * DW_PER_PRINT;
> +	xe_pm_runtime_get(xe);
> +	stamp = xe_mmio_read32(log_to_gt(log), GUC_PMTIMESTAMP);
> +	xe_pm_runtime_put(xe);

Just a quick drive by comment, fine grained PM control like this frowned
upon in Xe or maybe even not allowed. Rodrigo / Matt Auld would would be
the experts here.

Presumbly all the callers should already have a PM ref.

> +	drm_printf(p, "[Capture/%d.%d] GuC timestamp: 0x%08X [%u]\n",
> +		   l_count, line++, stamp, stamp);
>  
> -			drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
> -				   *(print + 0), *(print + 1),
> -				   *(print + 2), *(print + 3));
> +	drm_printf(p, "[Capture/%d.%d] CS timestamp frequency: %u Hz\n",
> +		   l_count, line++, log_to_gt(log)->info.reference_clock);
> +
> +	xe_assert(xe, !(size % (WORDS_PER_READ * BYTES_PER_WORD)));
> +	for (i = 0; i < size / BYTES_PER_WORD; i += WORDS_PER_READ) {
> +		u32 read[WORDS_PER_READ];
> +
> +		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * BYTES_PER_WORD,
> +				   WORDS_PER_READ * BYTES_PER_WORD);
> +

Also I think the above pukes without a PM ref too.

Matt

> +		for (j = 0; j < WORDS_PER_READ; ) {
> +			u32 done = 0;
> +
> +			for (k = 0; k < DUMPS_PER_LINE; k++) {
> +				line_buff[done++] = ' ';
> +				done += hex_dump_to_buffer(read + j,
> +							   sizeof(*read) * (WORDS_PER_READ - j),
> +							   WORDS_PER_DUMP * BYTES_PER_WORD,
> +							   BYTES_PER_WORD,
> +							   line_buff + done,
> +							   sizeof(line_buff) - done,
> +							   false);
> +				j += WORDS_PER_DUMP;
> +			}
> +
> +			drm_printf(p, "[Capture/%d.%d]%s\n", l_count, line++, line_buff);
>  		}
>  	}
> +
> +	drm_printf(p, "[Capture/%d.%d] Done.\n", l_count, line++);
>  }
>  
>  int xe_guc_log_init(struct xe_guc_log *log)
> -- 
> 2.43.2
> 
