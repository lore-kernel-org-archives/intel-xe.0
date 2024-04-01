Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70979CD1288
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 15:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA4610F250;
	Mon,  1 Apr 2024 15:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnlYzvMf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A91510F255
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 15:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711986424; x=1743522424;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A4yf0F5DDve1ykUlUa/GLgV2eVbNFKKVehZJoE9AGjc=;
 b=BnlYzvMfqmsJytz07fLUWzQSBGFiVAbyh1GzThxiL88ihaV2y43cz05G
 49SiJ1jMTpsxAtIhSrVEt6371FvHRXbEttRE+ZNtgVmmheeUvdjO5y6wp
 kfhlC9qgy3tuz9hbxcVLhF1JxI7AeUnk5m5DBg4eWSis9E0zit3v3DkbC
 r5ITCoNop6d6/XzArgXpbmK+HiA2XivBUqpoF2kEGB/MbFxcYrg8HM08m
 pNPqNGSr3Ygt04L3bk7kt10hJ5LhETbIEYgUiet5h5ZWfiHXoUdutXnde
 YuJoT8kse+DXAONv6Ki3l9ALB1VGcCq3PNlgEUKQRApPiF1iVo3lU1mgG Q==;
X-CSE-ConnectionGUID: iefk3jSvSPeVMVHYVLom8w==
X-CSE-MsgGUID: LXAVinnhQgWMI16FNHj6Rw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7015861"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="7015861"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 08:47:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="22428965"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 08:47:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 08:47:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 08:47:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 08:47:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjOyZMPiCk1V8lByHHGqPsY1gftaF7iMi8hyHiGLQJ6I569WqJXv5ZxhGNXPWOVAcbBg8kIVR1HQQnzxcfYRMdvgsult7S1rscBQ60aMLARWKnH7WfLK2T3wM4OLAfHL2Ly4Z/DM4e107PciMf76vCT8L1Et82c5FjvfyejV67PLi/OXwZGQYBJBeY+JLvjaJ0B0YLRvnEeQFckmmBPMpmrbDrl6QCrcaM+Ot8+vm6LGmpWOq74/5XYcVBTauTLP186rYVZRL4WdaxnyZVXU7F8d3t8zkazKgEWRedZmKUA/DaYjTygM5YgwlGLnddiNLqP1hSEU+i3iK3khEj4+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U69/NCOxJ4abyy9Rf7i4UeDn2VS75MEe76id1fGZ63Q=;
 b=UHiBPO6yMCC9rYfU2wpkNBXZKNm/Kb5M4DvHj5Nvw6B5rbF2C54RcjIOtlj+9PauGV8DoQWfs5hNyoJWeW7x/EHq+AnXangqQp3NqTbvwFPgs99es8/6aayv0MHcgxt4SEiWdegGsAfFfEtSb+yhcWkyRdIw5I56mgvLvVG8cpZV3BR4xna50vTAdkeg7TLkJeuQNLDoctX6YwbF1iCFDGGD6FVGL/zZR58NZQPtigri5OQo0U8GBRbwU02j5J7VpAu8dh9lHtuWc7IOjUcRMzC1fIbzg7UBIU9EWP7p/jwLlO5GHynEtS8LiqCvkXx96nH6zbr9PMRi1uOdXqwzkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5051.namprd11.prod.outlook.com (2603:10b6:806:11f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 1 Apr
 2024 15:47:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 15:47:00 +0000
Date: Mon, 1 Apr 2024 10:46:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe2: Add workaround 18033852989
Message-ID: <m3jjlg2pkwi3wg4hmh36clzwlwr2gyc3pv2jo2s7wpl3pqss46@gktupq7r22z5>
References: <20240401052142.3799284-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240401052142.3799284-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR07CA0056.namprd07.prod.outlook.com
 (2603:10b6:a03:60::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5051:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tceryEaf1fk3XpbHvY6uqZtjFqd0rPVGKnV4EfotCEOAQoeQaMYLX/MJir3/T1nplwTOEH8ACXLCJ+URyaNRvb3TtIOMj8xBPKDmq5HUrldOPFYSjSZbL+1hAqsr2KPh3gbaVCA49Dvs1XCAnVgU7ZRm/62/Qqs6uFOcnEkekkLiHx1CMH43kweBM1q/fdN7/tVZzkSXRR3UwDReaobAfZvYT+UI0Yh4MBZgDxLd1M5HHO4yOpVxZ0D1vLBMA/dmumnD1uiWc76+yslvn0O2U1GR1f3OBtOiFKXu4Zt0LV9IS+1e0+BXVOObFVrZLj65vUr3s52MRUCg2Bf4ky5nO2aFF++CYl0Yb+RxPMSX38mzlNSt+EllvsN4u9SQ5O40XZdt4836a/nXAAY4Y9gYZ0ayvJA267rLWmMy9eYbbc4wdBvZy9HVSRJfEjhqpPfOA8Hy/5UpUA59bufLyp4Z4aPd+5LR56I5opUrqt1HxuI83y/2CkPEatkHFSsjkO0avzyI1T3LsRGeP+y/ZqQcKQr2EzglwiTnKAQl1PBxsBSlIXwggUMtbKD+tGvtyWzNBTatk2m0mlgenLKlH1W/heKw20jpq20g0BzQz6idUcEbhezsCdSYmDrfJKnQLK0fsmDM3oCq1nrApVv2/So+MPr22nJn0iHqp6TIheZFKdI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JnQ+dwDQLKMoze/H7Yz6pOWXLaV4Q7miu5RlQUU+WrU1s/tzRE+LXeKH0C8U?=
 =?us-ascii?Q?LL0OgXAG9MCOGsOJEN/Um0tOPCwzo8wbR7TSLkoJr+PWRKgqV4HEb00K/q2G?=
 =?us-ascii?Q?3+nj0XTHbZjXsL2uVZQ+xneyeIBjqFIThqnBK/VAs7eqWJbaa0M0BNazNR1D?=
 =?us-ascii?Q?mEEb6m3gL7fKCtjGGcXxP0o358dZ2S4lhREL9VuQxmKe7EyIBQUlvcx74a7r?=
 =?us-ascii?Q?KX+TytzTIcLIv//qXJ2U/rKYkMkPVsOP0/hL5TXQmU0kKSP1EBVEBL4lWjem?=
 =?us-ascii?Q?8c4HbvwpTNU51ikm8KEDbXMsuY6FEjNnI2EF3uZiFQ1Xt/rk9UDMAQtZHXMr?=
 =?us-ascii?Q?Q1nVm+mtyfoSie7mE09oVH+RrGkHXVrpzx3mI2gN3YbSeDSJ0yY+8gtLvoNg?=
 =?us-ascii?Q?FoSGaDdcwqOarkGb3JKQyJxp4Yex3bbHdt/u7wC19BEsBfmZoh1udoXIhALW?=
 =?us-ascii?Q?2yarUiY5vNfXKMweoNbqetmy6odXtd+lWQ4NfZA0D88E7lswyHV8nJg9hlYg?=
 =?us-ascii?Q?UZcL1hdce4CAYC2/bqY/F5sycSvpdwA0NXcACwm2QDWaXTgcVsn4qn+ZnCAQ?=
 =?us-ascii?Q?TiD0mw10uCwppSBBGi14Fa28gwJLV8gV8o99CB8SB58uy/ghe1pLWcMMux//?=
 =?us-ascii?Q?YLVR+4RpsIaxpPob0qAasBE04U8Uz2UZoGW904GqF9jfPnksEvLzq1Z128mV?=
 =?us-ascii?Q?zeYgoBs4EyjXHxR+/zpCIHrwuEQoWZeOlgrViFDFELlQiDmkL/zCK5GEO28u?=
 =?us-ascii?Q?HI0/RFbZUb47Qi0ZpKvQfGRKjkk0hz6SlFdCszL5jLB1H3/+FUClL8c92Lx0?=
 =?us-ascii?Q?Jzeb1MSyWV3IMPNXWIdNHl91C8TvsJkwll3BK1rFnEWofrZ3D0rcfGWSR7gh?=
 =?us-ascii?Q?j+OTsHsCHirrRqqqV143gdXQb+374EZOFdd0sbxYcXFXCx0aBLM8a/xq1I5x?=
 =?us-ascii?Q?sdEFAsNtLFjyrDiav4ow6SlZcEsXJguM7dsVaAV8rX+jS62UcolPiTwRIchV?=
 =?us-ascii?Q?uvyZoEQXcQlMZxOS8O1uDFvYYuf0Sr5Jxaxuytvc2H2WMy060xUb4xuOsAbv?=
 =?us-ascii?Q?VLiQ30aMsaU+7on1Mm/KVK01fOxRka5TqIgh7PRusZeTgD0jn/rPTr78Lblj?=
 =?us-ascii?Q?AatjbjWAVPyddcosl+TIa9p0MFXbRgKALP0A0jwrCgc2OD4937CrBKEoaT8X?=
 =?us-ascii?Q?vUH0lcmHAXqaZ/PrZUr7r2oPzbjym4s/MyUOOVJQB6dKA+tvEHzKHmH8nVnL?=
 =?us-ascii?Q?9cg7qN0ppBY7aP2h333Uyytfyr5Hpmbvr6SEL1Af9TwEWGr88uOOhhYdlkJG?=
 =?us-ascii?Q?ggUmg/mycBxvKbsL+rBYFKqSr68G3u2tRwgyLacUKnPxHr8L6Ny5dC2838m0?=
 =?us-ascii?Q?RXfK863cLhwgptFEgmaVq4Lh2gx+58GnjowHTqqjzmBhMBXDljBVY50dCU0z?=
 =?us-ascii?Q?3WvBi1iH4DWKo0f7kC0DEhlemNsXxOqmQz9PBZ5R4wINOdiShrkpAZirZrK8?=
 =?us-ascii?Q?Y6C3Uv2O7oNBWSTfJ196w7YwwESziWNLlZd+bkhsH7od5c3R2cPBw7DOpqBs?=
 =?us-ascii?Q?3ESOPDLxXm+6W16cE0tIQ7aOPr+1L8r7aaB38FZ71tTeaqDigvVmPqE2B4FO?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: feb32f92-fd65-41a4-aab1-08dc5262f830
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 15:47:00.6058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/iI8+fLBvejAJOjLvuwbs+l5PCvwyAgnU1I6YAvLHo1smpsnpoV36TigTHTLL/A66emT/SyLhW1oORg2zDliJfhojgZNEaK0JyV6AYDL6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5051
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

On Mon, Apr 01, 2024 at 10:51:42AM +0530, Himal Prasad Ghimiray wrote:
>This workaround applies to Graphics 20.04 as RCS
>engine workaround.

It applies to render as this is a RCS register, but since it's part of
the context image we classify it as an "LRC workaround", not "RCS engine
workaround". The code below looks correct, so I'm not sure if this is
leftover from previous version.

Aside from commit message,  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
> 2 files changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index d5b21f03beaa..9728d9da9931 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -98,6 +98,7 @@
> #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>
> #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
>+#define   DISABLE_BOTTOM_CLIP_RECTANGLE_TEST	REG_BIT(14)
>
> #define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
> #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 74b33a3845f2..c904e55ced9c 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -579,6 +579,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
> 		       ENGINE_CLASS(RENDER)),
> 	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE), ENABLE_SEMAPHORE_POLL_BIT))
> 	},
>+	{ XE_RTP_NAME("18033852989"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
>+	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
>+	},
>
> 	{}
> };
>-- 
>2.25.1
>
