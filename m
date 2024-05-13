Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363F8C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 15:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EE810E05D;
	Mon, 13 May 2024 15:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPALgu9W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E966310E05D
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 15:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715615097; x=1747151097;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b5Cy7+Cl/8fBdOa/EfJ48cMSy/KtGkR6BRhJfpRQS78=;
 b=WPALgu9WyKNqoxVTddB0WTsi81qzsX8L3sqn7vqzFQqMHeuAvZ2hbmzc
 TBAese2rFE095h8JE8d6R3VNXECd4aiiYhCOj/RNXixZ0YXlUYhP8Be2f
 ItUNpymBYKuBHvYwdar3tjf9aFE0xaBQ7Ao7ptQPxeylECKB5/y4Fp18z
 jeGKntlCwRz943KWtBR2o/nlild3u8tuAlz7MU5S5ureyuWSrCwpn+KHg
 mcsWPHeul44up0m6uTUkbKQhAuCpiEyuuHbfCky5VUvgyM7ZnzxJaBR5w
 Sto+KA9JGKNohpbp6ViY98VbTUQvrHa3v0O5BjrFfE/vgI8Q8VIbFGdBU A==;
X-CSE-ConnectionGUID: zXoOTMDGQYWffuKbXNoUvg==
X-CSE-MsgGUID: ty2JPucDQfuUzGjqeROYgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11412565"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11412565"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 08:44:56 -0700
X-CSE-ConnectionGUID: rqayonGTQ/uL9t3QGvVUgw==
X-CSE-MsgGUID: 1M6ptTWvQM+D+eRmJqrZlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="53579847"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 08:44:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 08:44:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 08:44:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 08:44:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 08:44:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bG+6LuQR2bT1WxBDDnjeXxL55Sz6Ujgfi4MRiviXkLTwEpu7yIEjaTK/5NcE+OiLK7XcRQDVCp3UqOBJmbKf//G+nErLwDhQjx/BhRKc9BCQqMbEShiQt0zQKIWiTwW2zp4uIYUqkt93EaPSXiKhRZ7KHzAseUXlwcdBOy5fUg8+4WeELhteG72ZIyTwdYGxiQD5v0uzUnmHB1tT75RNwFChghE/CLkJR6+lcl0LgPEq+V/2ka5SLEWRwlZMQ7pNlAlDX7ZRhXUBx27+dtJdXadY3jdjz9jKxBk+IZj65ZyW8XYMWnt5oQtPQUJs6J/pJufw20nF3I0UlFHWwk3M6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/n134lAW6l5jnGIq6LXETCakb7aNms0+n4bTQ47hSHo=;
 b=cJPZZc4y16NdhThxjoVJHtDHxFC7fCOErCTNAde2/S/zwDN1fI+YahOAvzp18HB4t4RablXJq9WfjlAa6TuLsbHFR0AEZXb/XKI1sM/Rlso1RqYvsYMCSxYEVabg2tPfbsWdMZTkg/V9bh+F3Au2WFK6K9LBBbQHFWkn1IftJQBPPVFglLpM4OrwuurCBDKwV07zlpmOIuVv5sKulVRLDaQVI4TpdT3VkmjvVPYn17c6kGfDyJ7qbCW5k87KzLmKXnGqmAxk1aj1HunShvq5tC1gV5CiJ/AWbyVvYWro97Bf4SX7zZJz1kaBH9ayrRCkDTtooUEosL8cezlItMNvIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 15:44:52 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 15:44:52 +0000
Date: Mon, 13 May 2024 11:44:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe: Fix xe_lrc.h
Message-ID: <ZkI1cFQMSVG5Sddk@intel.com>
References: <20240513084218.2084-1-michal.wajdeczko@intel.com>
 <20240513084218.2084-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240513084218.2084-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0360.namprd03.prod.outlook.com
 (2603:10b6:303:dc::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 76299cb2-4c26-4598-47e9-08dc7363a153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4g+AkZKHlusi5WFIr+jmRmlBAuKBEvQiWOuwP47wDW6GXgoi67wT29pcFVsL?=
 =?us-ascii?Q?CooGXumYx8PpY7lB6yB7ss0bgTw2ksWE40EoEeSAmqbsyJi/wMbpCjpeXOqe?=
 =?us-ascii?Q?ELlWWcK1W6XNety36nUegsjYjhC7mwDwssz20sSe02ezZbUfDcEn2y9wGzvf?=
 =?us-ascii?Q?zof+pEBmO2X9pAeFylReaf15M9P2ejYK8REWSIPhBDg9Wvwlk3XAlADP6GZf?=
 =?us-ascii?Q?8jj1l/+vIakn3BLxmKM3HVB3WnxcbjvA4N5aiq6HxTHaosd4YGM+SMrV4wK5?=
 =?us-ascii?Q?ytwReSgcqoRm0xDGbn1DrknDKideVOpUT1Ed0TLiL6rHJKBUo3K4Y8N9LGzs?=
 =?us-ascii?Q?czMQdt7JrM/yEgFWowH35pMRo98y2xCfHQSuMu8ynXwRviammCgyy36VL4M/?=
 =?us-ascii?Q?aZlMCgrPA/ilhrxAzRYIm9xVVUrDUls+yJbQz4+RlwKsOzqWzIEq5kvIWPN1?=
 =?us-ascii?Q?EMgmJiqYrw17yRnniTinMUSZiwC6Dsm7ZYgnwgwegLkARrn4zleZUkirQmGP?=
 =?us-ascii?Q?wE9ta7Tzs0z8VPN04MJiVd2lxzetpTrxToQxJYYE/I9BEKPnOxkfBDSb590v?=
 =?us-ascii?Q?Ngbe4aBDFVCUaeLzQvUX+oX6hZiUHItiiPNx0vwl3otm65vRaEqJw33fx4NM?=
 =?us-ascii?Q?jLhxEON+B7nrF2xEEdIK6ZSv2Wb90epoC6ibD3UQ+L+oJu7hakIfZ9w6ui4c?=
 =?us-ascii?Q?fQHzd3Y183/I5OVo8XYaIVJH32h1v1jBHcPhkru7/O9AW2OOs0AIAL7Lp0ay?=
 =?us-ascii?Q?Fvn5rF49AstkqH1H2uYTX6n2y7CbqFz46VxILLCQhecxQaR2hJH7Yd/qDXlq?=
 =?us-ascii?Q?GaRYzl7txBWxFkhCa7vIjlCjMqZUzq/PsuFwjCwevTMIx9rdSPaxF3SfXcaM?=
 =?us-ascii?Q?Ly3VzB2HhHPP3xu/Fr94qRNDYf0T6A+XL4XU4wPM20IO9tHa4Fq/6wZ7pYZw?=
 =?us-ascii?Q?5JuAiv97ReVx6dSyGVOa12KtNL4Zoxg7iERFMnoqWME7XFSJ19rlxfAfGmwy?=
 =?us-ascii?Q?kQTGF8WUg1qWOJbesTLFTLZbysSJvpup2Dk3HHuiIqXkFETcFMoHYWlz5fTP?=
 =?us-ascii?Q?9roqFv6IzSUxpTm6e3ohsqeDVG3UKhr/1+Iq8yD51+j5NCxlxRn549oL2Ugi?=
 =?us-ascii?Q?s/cBvHHYS/hsiAtoArO4XmFVOYGyrBzTl857tROIEGOnVY8lVecBRzLMlN+h?=
 =?us-ascii?Q?Bzkdlj3ntMX9SSB1utCxvjEIG3RgxYnMjGDx926pkmniMi+UK1SpGa64gyf/?=
 =?us-ascii?Q?XPXvhFg/D61Vx7i418SE4Yb8jXVYzYJr8lCKy8LaQQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iEwt8CwskaVxTNHzEIAMoCXN5o+6dwWpTzgsWf59x08jheJKHjHqCK+DuJWj?=
 =?us-ascii?Q?arN/blmjOsYskHCb++5Fw8f+zk3O4XrkIyqaqGDmtlzy0tY14eLDw3SmaOCn?=
 =?us-ascii?Q?Xie+kSJmKbm1ATj44eBGkSOR3f2uqoeef++xjNjhrYyfP0BfN8FYJsrAilqJ?=
 =?us-ascii?Q?rFai4M+gWSRZmBp+MtS891aDR4FZupzV1WDATqwJUAdqPd7uvh5tDklRJOCy?=
 =?us-ascii?Q?oZDbzC6X1SnNJ0DwZSi/zllJnDSH2kcP7ZzCToM5eE8djnVntX6mvyslVTzB?=
 =?us-ascii?Q?RPiTe+cSBrTpU5oPs7nov4lCh3LcF9x7D96BMxB5dgRoUiq2VpE9TtuRLEag?=
 =?us-ascii?Q?psdRavcX4Au04a8WkgQhhukf3m1szHohapbitce8BNVAXeHu7j9LsVN1cSf/?=
 =?us-ascii?Q?smsz6U9Te/ih9nEhTYjdw/YdG3pIGy4biv0AbWKe/ngI+4vDV2F5B1tUCMDC?=
 =?us-ascii?Q?/Ihj+sPuwWMfe2RmJY2zpyhoPTxSduPkGyW/JH1mw5PmXmftV+AQ1U4y1Tue?=
 =?us-ascii?Q?w2zdrQsylfNi+Bbor4YwU9C095yYiRe9SWAU/YXI1uuphVt//0OpMMWTLAVT?=
 =?us-ascii?Q?2c45w+Sd32yjX2pFT/xv8YImgyjKyhABo5+x7E54Ng1LlCUkvrQ4T7g8ixG8?=
 =?us-ascii?Q?kNeLgjqwF3v+smgcWHCg1VLZaw+ZvTjYVKU6bmhYwbFZoE7Z5gDBZPujaEL3?=
 =?us-ascii?Q?Ds316WkUoeU6GefSwXWoGhOzehGZjD+zH5RMi/HlSREK5sNuuZREyzkappTo?=
 =?us-ascii?Q?+WeVX7Y5aAXxgg8JwN0PTG/E/IP7rKe1007XbV3aQht48iVZE645sNI29n54?=
 =?us-ascii?Q?X2uMYhwUCbYOeyCa7x1JtzOwFPGb3CHa8eMbgIk3/4jKy7ozk752Fjya5ayO?=
 =?us-ascii?Q?q7/i66rOGzjidOx+jUZwaqmdhG5jkZeJKilg4erwAOJJ6AFSbF+fd86Fztln?=
 =?us-ascii?Q?oLuA2UVnjaLeo2z9HdtNrfEPNYzNMcbuhUZrwUq7JsBgtWmKeDD4i/ppJ2Q9?=
 =?us-ascii?Q?xD8YA5RLJuVrAOJL8Ktd7zmhTqx4ho91UKDZXWcnUu2KLk0RubiXoDqFimXj?=
 =?us-ascii?Q?7F0uxasXy5KcYewe3EpeUWNhfVZsNx0jdNZ+sWCONYb8Pgr39jhd9bvCRtRp?=
 =?us-ascii?Q?b06h5DuQC2LXRhTzoB0sbpW2YIEOp/9neaFqwLxr56NBTZNxr6NrECmLGVDX?=
 =?us-ascii?Q?/Kt+blwrhYVT/DfKXQCsyab98Te3BYPF1MKDYidb9x6flcvbXAGV+fjA7RQA?=
 =?us-ascii?Q?1CEbMf4Gec/ZyEFda4u2GbS8nUDBxI75yxd/MBcRNrJzrV7zTMqGVglWqmZB?=
 =?us-ascii?Q?0OINHsHKD0RCDqD542bTGClzGWa953e8wzwFrYGCfWlNbvvfk4gyaUIyGmc3?=
 =?us-ascii?Q?fZipz9Y5KiJyAx5KOqh6/AD9x4ESppz5RbebpBa0ZEbnIdVCoYKy6TJRbGIq?=
 =?us-ascii?Q?TXlBYsWUa+nNDTWRoWQJXYnCSPURuyOjwm6BStv9dRkp/hp4VH/n9RjTPqDV?=
 =?us-ascii?Q?Pnd8q9tIoWwmaES3bn+aaNviLBJ1XOHYi4wYfIk/KzelY3IO/kEfM3pFNPG3?=
 =?us-ascii?Q?kPrBadrPIsdhaYWhLz/jsNcmeviALzFu9MmwQYYh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76299cb2-4c26-4598-47e9-08dc7363a153
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 15:44:52.8245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVMLKzLtzGdu8R5MK83fe2nrsDxebuRTU7q/O6hQPXF80pzSgd+9Ucp3E1Im99CE7HOoCdWE9JJle0AZt5OjQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
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

On Mon, May 13, 2024 at 10:42:17AM +0200, Michal Wajdeczko wrote:
> Prefer forward declarations over #include xe_lrc_types.h

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 06a95a598736..e0e841963c23 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -5,14 +5,17 @@
>  #ifndef _XE_LRC_H_
>  #define _XE_LRC_H_
>  
> -#include "xe_lrc_types.h"
> +#include <linux/types.h>
>  
>  struct drm_printer;
>  struct xe_bb;
>  struct xe_device;
>  struct xe_exec_queue;
>  enum xe_engine_class;
> +struct xe_gt;
>  struct xe_hw_engine;
> +struct xe_lrc;
> +struct xe_lrc_snapshot;
>  struct xe_vm;
>  
>  #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
> -- 
> 2.43.0
> 
