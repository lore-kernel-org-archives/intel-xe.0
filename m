Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52799EE4992
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 21:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0267210E049;
	Fri, 18 Aug 2023 21:56:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D906210E049
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 21:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692395799; x=1723931799;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t31u5i+dNCUIc15TPFFDdJgMbAjSbeurHZAw4CHTy7o=;
 b=YBdFbOCSVTJUijJhWWV8P31y8wENjRp+efBOgjHCTrmYRezn3/olN8+S
 xVF87+Ey6Wjd+yho+Io17UKcIIw4/siaxh/MqiJBrfTAeGu5koFhw+hkX
 3EdIhlXAP0N7TkRyHPy+MFhstYHRVcxesTcFh+r1PIlfT7wGwqHtFywAK
 V7nU+G+URXeftCBiYxXa2F8MV8M5rSoVhNePCbf9x2lg+vfux4nkwQkWU
 Fz8gD6aYsFBjIbtClQ8SLKoccAvRJxVQ2XDVFbgTdnQfs9fsInOpaDRfB
 X7NRmQS3Dog48IAWxWaqDzXZRzb4JgDxLRawM1x6C+tyzdAh2wcMZ1ohg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="439590523"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="439590523"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 14:56:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="981799347"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="981799347"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 18 Aug 2023 14:56:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 14:56:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 14:56:33 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 14:56:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2WFip2h1eziFaa2VufbctqoONl8uxIeN7QSXpDBpU25v4764U+MvFSgiWhKfym6sO7I/99EPdulndj67X4ORSdAb9dS+hQc5IgQBxiEsnAoH15GVOZ4efIPXQLmidLIWcaJlOH8sBWUOUmJtEDNoOWFm0ZRlrr0MC4QSpkPL9+UCFo32mhjWRkoZ3UdfQZdVchNSCUPp7uqOFuOJhITqbntAT6juqxcaKCrZ4FZZrZtQDTFMyUJHPKHrS2Yefwcu+mdxC8FcSX8DbXkRYtdrNXKAJku9vAz4QdpHdVQ6KmWHaDGlX6K7r/deVcvjHfVpGxwWz1e0VS736lNtNZhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUlbJfxxtXSjps63bKX8VTtkmUQR9nCyzXcgl7jjzhc=;
 b=PgdQDVpL4vwAf9JXzUjVO4V44wkk8ZeS3kEGSDtTv2ojMqlAd73ZULT6tHFh2Gp1CZzyqB7sERX6bXWY86t8qDPcMZSNFQAJVev9AHYZbhoX2nd9x7tMIFzuYDrQ//HbuS0jlTIVBQxmkQk1z5n6hEqKVsB1L4jWSO9ACftY5DStmddApJy7Hvfl+5m/+6ymujifnMaXjpL7THsbP+UcI1OYKdv1WB6HGlEY+xFj95SvzuxzVkkcLXlmE1JDGv56053M/TVPwijQmdaCTJmoBaX+1ozDsO081fXbCGFXzeScucbvI4qnwLYyhekxDQaFqsdUWtoq/DPRsbAhPJn0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7456.namprd11.prod.outlook.com (2603:10b6:a03:4cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 21:56:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 21:56:31 +0000
Date: Fri, 18 Aug 2023 14:56:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <c3tymembst2cg732h3yjtrpyjqo52aocmkzf5dsbv25pqtvurx@w5voscia2pm3>
References: <20230817230407.909816-6-matthew.d.roper@intel.com>
 <20230817230407.909816-10-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230817230407.909816-10-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4P223CA0002.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 91e8bedd-50aa-47c1-28d5-08dba035fb00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VRleOmj2LNcSHU+bkaIgonEvaucfSVoxYXrGzTvQgNgkg0yX109TZrfubPaE5uZgZm3uZl+pyShE2R3VoslIksH6Bdmc2txkD76U23cnhl42zg5SpIj4tgCRfd5wZo08aoKQISnkLT2u6W9u5TN9zObksSfu8vxNiQp1ewxMXsY57wnFk1XuxbJtuoiIgsomhC2xNe54sih+lyFe83tTnZeujfULtNpknnvxv3sSvIqFGTUH2RJ3HAT5x0HTn+yFcKGt1t2E3SRbnw4uUDuN4yc9sYmOf+rygDC2iU3JJ35w3OK0FZYgznDn35qiEvuJsexNAifZIdW/pjWitFtn5YXr3w0TkYTQLn/o15S4qDPgah8hTPAlygcYslrhH6Mv/usPr8oSm6PZ3sMjJhPEdCHQtdE3Bm/3D91P/iXXd2gqhJ2EYbwntPTwgBx5/3CM/U7TSzbeEfeKPUFepW9uknzjQO+XsFOMi3bdp/yYt0edodJVhrLhVdrQgBzmuKnLuQhOOehz39AMyMyH3OBSlOssVZ0HAlB6Mz2SlPS0tgnijLzea9EoNLqvzLvHAoQb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199024)(1800799009)(186009)(83380400001)(66556008)(6636002)(38100700002)(316002)(66476007)(82960400001)(66946007)(478600001)(5660300002)(2906002)(41300700001)(6862004)(4326008)(8676002)(8936002)(6512007)(9686003)(6666004)(6506007)(26005)(6486002)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xk4qnbcFl+l+ZzKAFGHtH4XT3EtEnwhriHK3w+K+uXCW8xJaX8+5aQz1+U76?=
 =?us-ascii?Q?+dyK7EFUJArUCb8/VvQo5vxW8tYuL5SPJbCjzQQKLn7SSUkDZCwnNzmN1dl2?=
 =?us-ascii?Q?agflvCNW0ZmJ02O1H0NsG0LgzwhZ346hiyRBkm8Q+4lqeuiwJoiXoPIZMljq?=
 =?us-ascii?Q?UvSz3nEn05N4/6Cg5KD6NYUPGdVeTu+5//i4lQRtPVU41JF6S0TPDC6oDTTH?=
 =?us-ascii?Q?e8Q+zQYpDo5nlxbCe32ZBEb0ce7V2f729lNETENhFeZanqxgoQxR0XLem8p0?=
 =?us-ascii?Q?wKYdw0HzjHYr1ptiuyG5I+cGPvYrFnKnroG7f+74DHkScwBsd5PW15Q3lVHs?=
 =?us-ascii?Q?LheGZCLsRcgus154w5BqSuA8xEzPzIvCA2yomzkO3bgklV6umTMn6KtLY2Y1?=
 =?us-ascii?Q?gcJJUVmeeN1s9fih/YHRs1iHEJBPJFCcSR021LL8Oy6R3FYBSGmXdSe8OfZX?=
 =?us-ascii?Q?ZtbR5kx+UOKnwpakG5KNswqrP9xGR/AbmMm4ZLag2dcXP40/d3BMIsMtTM36?=
 =?us-ascii?Q?WltHIrr12QJ3uI24nmqHU2lPAsy5pI6OqkILncce5kTX3Bpi00aO6bLvARus?=
 =?us-ascii?Q?Cb9NvOz+R502IG/qQQaqHWAxcb6SlPdVcWZ9CS72BloRtmDv0CyBW0ndhhhU?=
 =?us-ascii?Q?qFUmtLa3qbZYh8geId4BPBz8uvSJrauNzzY5OPiTdXqOM2ZuIvaDq0S7ODHJ?=
 =?us-ascii?Q?r9tZ5MjooTq0eOHrRtGZ+0VL8ZvCFYp/Hbo7tWpsC8B1tsOY1vvIbvXmcYvL?=
 =?us-ascii?Q?mTe4OVyiO43gENiSI8+bTbhZPB4IIgp0OdWnX/zqZMFO/6tgF+Kr7uChtGOY?=
 =?us-ascii?Q?w7zWsqh0lKzZZs2vXLqguNoFJ27jG4QKyhO8nn48YxT3cNqd65z5tBgPWf6/?=
 =?us-ascii?Q?tkuqFtJAbhu1j5Tgex9GuYCW8pLmkGzvtZozMM3HW6iDdoqe9FLhJXpUnsIy?=
 =?us-ascii?Q?0TWin1ymnzMMhmTonfsqSadkkXfUmia2GgMBVflSaVPp+jEAxDv1JPWSkell?=
 =?us-ascii?Q?EeRAWJQ3GNGVF0Lzos4JRZWx3xz63rIYthmLqOobeC5OfE4vbLBfjzqjMgri?=
 =?us-ascii?Q?8vr27ONvgmiHI7ByUEwuNwhDdHTVRQDSVETgXzYWeS+w8xdtQUU351fh+Acd?=
 =?us-ascii?Q?nKGzCi2Vk4a/UIRAB3jK4hk0B/NI+uoyeZNuNIswCVlASMMOKIcELyCE+vAI?=
 =?us-ascii?Q?L3pSoNStBQVnwkC47ht21sWU3adLdTx+fb+zpveWYgD2U4c2D6rF2/vNEQoQ?=
 =?us-ascii?Q?dRGL5BC+f8umAX9m3IzSNKiG7FkjDwn4p99BqGmzmVfWHgvIUsEYvXCdpQt0?=
 =?us-ascii?Q?ptHxDkBj4rCOgME1Le8yKHXUUr6PqNeGQ8t0s0AMSvCmb5DewNQA73BfeDJh?=
 =?us-ascii?Q?PH5j6dS3avye5/D8Wn8dIgnXXlD6Cp8YK7H6W7j7lb4G8bI7ZfhwNUhqy9YU?=
 =?us-ascii?Q?C59HV0VUHTnM/zBvOO6q5N8YHzu75B1PtyTDrjvH55DrG+/3M4c2DXDEY6TZ?=
 =?us-ascii?Q?qL5jX+fy/1+ELoOPYwn1cJ2b/DdSf5BxM01u51PCKTgQyVGBwbrrQSUtshTm?=
 =?us-ascii?Q?iqjZ0r+YDgHRBjIzn6RCpEwFcpD4azYvbzvwMisu2OLpjPc2iTaqdBQ+oKz8?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e8bedd-50aa-47c1-28d5-08dba035fb00
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 21:56:31.0859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNIhCGAHli2mEyuygQMDi3RVOIUO92re1VFV3G1hAeF2sNBtO92Iu8s5C1/HRK+f4rpmvmP2IIbg86p4yqpx2aOZuFt+NYCe0i2p6bejuXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7456
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe: Stop tracking 4-tile support
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

On Thu, Aug 17, 2023 at 04:04:12PM -0700, Matt Roper wrote:
>The choice of Y-major tiling format (either the legacy "TileY" or the
>newer "Tile4") is based on graphics IP version (12.50 and beyond have
>Tile4, earlier platforms have TileY).

ok

> Only display was using the
>has_4tile feature flag, but that handling is now self-contained within
>the display code itself, so we no longer need to track this feature flag
>in the main Xe driver.

nit: as display is going to move above this patch, we may need to reword
this. Maybe as below?

"The tracking in xe was added to allow re-using display from i915.
However the tracking has been implemented in i915 by commit XXXXXX,
so this can be removed from xe."

>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_device_types.h |  2 --
> drivers/gpu/drm/xe/xe_pci.c          | 10 +---------
> 2 files changed, 1 insertion(+), 11 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 303447c093c5..dbb732e14606 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -227,8 +227,6 @@ struct xe_device {
> 		u8 force_execlist:1;
> 		/** @has_flat_ccs: Whether flat CCS metadata is used */
> 		u8 has_flat_ccs:1;
>-		/** @has_4tile: Whether tile-4 tiling is supported */
>-		u8 has_4tile:1;
> 		/** @has_llc: Device has a shared CPU+GPU last level cache */
> 		u8 has_llc:1;
> 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 46e3a9632efe..f6bc6ae1c920 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -80,12 +80,6 @@ struct xe_device_desc {
> 	u8 is_dgfx:1;
> 	u8 has_display:1;
>
>-	/*
>-	 * FIXME: Xe doesn't care about presence/lack of 4tile since we can
>-	 * already determine that from the graphics IP version.  This flag
>-	 * should eventually move entirely into the display code's own logic.
>-	 */
>-	u8 has_4tile:1;
> 	u8 has_llc:1;
> };
>
>@@ -277,8 +271,7 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
> 		{ XE_SUBPLATFORM_DG2_G11, "G11", dg2_g11_ids }, \
> 		{ XE_SUBPLATFORM_DG2_G12, "G12", dg2_g12_ids }, \
> 		{ } \
>-	}, \
>-	.has_4tile = 1
>+	}
>
> static const struct xe_device_desc ats_m_desc = {
> 	.graphics = &graphics_xehpg,
>@@ -555,7 +548,6 @@ static int xe_info_init(struct xe_device *xe,
> 	xe->info.is_dgfx = desc->is_dgfx;
> 	xe->info.graphics_name = graphics_desc->name;
> 	xe->info.media_name = media_desc ? media_desc->name : "none";
>-	xe->info.has_4tile = desc->has_4tile;
> 	xe->info.has_llc = desc->has_llc;
>
> 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
>-- 
>2.41.0
>
