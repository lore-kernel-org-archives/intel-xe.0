Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A1BC636D6
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 16:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E40510F05D;
	Fri, 17 Feb 2023 16:24:10 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9928910F05D
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 16:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676651049; x=1708187049;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kdy0GkauxjA5MMMdraJDwbZm6084CWGbxDTi1uUmJzM=;
 b=DYxzlpKCwy+/W5Df4oYcu9Ru/khOLoQOEmFXo2sFfwqMd3huzZYjHAZQ
 cs8NRTZhc6ouQsEovOZNyXjVSRVldB/k3cj68sHsvohBDfK5lqvj8jYPF
 Jk9Qs3Wv47l/568mblLiE5iNsu3MleN4TtcqeNxBhJlYUT/F1qVHbUF+i
 iKvkDoc45bLZ4y3cRVF+YPASdhnw/lB6yHoq5qHELTVI+V+Rz+m7X6wrE
 r1IwBfqSKXRgldIVpWgjtY19k4mzJgpoal0ovuPfZ74zu7sh2FwvMbEmc
 Qf0iC8ALMuAeba0oTcDNbkjVeJ6EdfGY8begz/rUGYnysmYfXw7WDIRhR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="418243303"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="418243303"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 08:24:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="916128145"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="916128145"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 17 Feb 2023 08:24:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 08:24:08 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 08:24:08 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 08:24:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZF7hlGcL6RmrWSN0XTB3W9nDWVP4/J6JDEBJC6tGl/9qKlyKBXM96Mz+ml7tuBUL2tVM/vV+ycuHNPCtYKF2iNeKG8srjyod4VGPkVGYRHXTPqThjy6wvJhV8MDP7TvMTW1f1qBzVvnFkwv7T1mG5eftLxcEiuDFQehQyVKlNOeb87l6pJ4jktpCEr8Z0OynuGBIB8L7ZxOprFoOnlYBmZyTIsA5Zlgctr6zStO9E0TZPsZ9mbfMyXvU6dSloWL+MLcphpgB1X7+pWwykkt/VQSM4N6hg1mhL4vW9peoXRoAruG4ypgS6kyhyRg84T6yVn/jN0Zl7MImqGaI2nnI4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCfQFJYLHH/h6c0Xm+PVfmWueVt6oRxcq2diEc1/OR0=;
 b=de4B4IeWm5qcsHrbgdjcTYntdtrZeX9/xGpADMyFB3SmegJ6ch8GMazdcqYH4ywOd+bwQ/T+nRJUBokPtIAWpJd20h7GBKd3eWRw4gHNKsVOueVreirDMB2yAIjXNghvo0NUf8kyRIBg0dhWTOV+AGd8OeQgLVCDYvvlvcifq86d5tmHNXvhKHWlioGJ9kPIXRe6LV1PzyTAkRwwMr8aRbRI6sh6TL8yj57eYvAAj77yYvuwjrytRHutPL/V3nEYOkxA98oitM6HpMU+3kJ4gZoo7p4afzymgzwmtq20AwXm0qtsJi0Vp3smeRPahAgyrWOhf6cBQKlGZL0Nwa81sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6355.namprd11.prod.outlook.com (2603:10b6:510:1fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 16:24:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Fri, 17 Feb 2023
 16:24:05 +0000
Date: Fri, 17 Feb 2023 11:24:00 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <Y++qIGQgEpwQXfny@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
 <20230203202409.577032-9-rodrigo.vivi@intel.com>
 <Y+rGRxzbQf8Tc5AG@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y+rGRxzbQf8Tc5AG@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:74::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: acf67181-c14f-4b2a-2fe9-08db1103630f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0EMF6mpQkvsveJtwd3XzSLA7F8YLmLpatQgfHQYhWu4OrWrmEc/72jf4RxvV7eCWVDZhr3hWSGef7CtFFLhkRRlc4urjtn/dPrzwz0wRJAbPxCNwbyW0uDz6MTg3cKzmAc1dHkyHPpsdLVYLSZ0W2mvCILPWA3s/BgQVrALN8mmQdwLlP2LIfuYcDd3yECAEkLthkLLbsV6vKaq2wjJn/4Ybb0oPxXPwz4h3UTmwlXSFqCoblTCVEH1NAPlijS+xxJFQALxdWTlOhPgXdV7pxywcMBlDXa3MmEOcAWgK7lkHueDz+UMVEx/gBXyOVv1ts0zWtplQUyEnnzBuM66LIcZfjHWS3reNMc6xUVUOSrw6nP1z8TcxaZzF6eDfqsfvo3GvFlSxG0ljArINMuPWVr7MlM+5QAJoTEB4yfS/l1UC6fSp1jv8ckZuyRa/+t+pKyN/bt1q/Kuy8WsPmVY4V7FGedYRHdnlxt2W2lZwwXnq1E72WpcvKaJLEyhMuzypMBzHKP/JoXmiRyLkssNR9H3ZQZ9JJ/knCwA5/nM24NG8JcqyTi5iuAibianmg1DA6MGVdxX6p1skLY1KhSwND89Sa44VssDECU1Blgqxhzw4v8fLypU3JjmVmx92+411oelNnFARuNI3w3Y5zQ25eQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199018)(6486002)(2616005)(26005)(186003)(83380400001)(6666004)(86362001)(36756003)(6512007)(107886003)(6506007)(478600001)(8676002)(4326008)(41300700001)(66946007)(66476007)(5660300002)(44832011)(8936002)(6862004)(6636002)(38100700002)(316002)(66556008)(82960400001)(37006003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/9Hy9Vi7jHy+NlUjgT37pw27xzgIrDdUZe7wYxviCT3f0oN//RwTYGDI8z5/?=
 =?us-ascii?Q?ziHn3EZsA2PTHMtTdbnaJZb+GQpDyEoPXPwKNOtOQZR4aorzZZTWcbujGewa?=
 =?us-ascii?Q?lAO/6DnKZlFa273svbqR+V2XL+m3ahXAatHDYAC0AarxhuIpeybcXJBCU3/P?=
 =?us-ascii?Q?QzAllTUVLsjBp+Za2o2B/aoBLrMQ/ABKGaYbYGGDw8hIHm0LCaYpInly31WW?=
 =?us-ascii?Q?pnANYuCne35stc74o9yTymE1/9yhWWgLR1kwb/+LXMQ/MZ1iNN0g+DRG6gMk?=
 =?us-ascii?Q?NpuhvkVMXdOsYJvgdwB9SuKhbvxOsYmZUP0CXmnEGT9+qAMEN4zvaHVRhLBF?=
 =?us-ascii?Q?kpRdaZ5snYcrYFogvdlbLYnU9SXLQ8HhWItW6dhiXhDP2thIYQzhNlMyEqyf?=
 =?us-ascii?Q?6QWdGSwkrAeoMfRNWQe2st4YZnY4YUEt3XCHgROFD/MVP6vYXNgyY6bC6bQw?=
 =?us-ascii?Q?WwO/OaUoZiutk3Yv7LpNNd/6RDkgL7VzsdnJg6HR4d2VNVuUzoOqAjQPR8fs?=
 =?us-ascii?Q?fo2YlfalCM1tg8U7qfqED9UVU4Jr6vciD1iGQseugrM6QWRWUnOoD+L+dUea?=
 =?us-ascii?Q?gv3yEBZHV4SROWMsHLi7gEBkSsCebGzuWSLWjm/S7oHDFzjMLayJorfRshV2?=
 =?us-ascii?Q?FPpWbYS3vQ87R94FwU9AJfhnlvXZ21gK5yXq81gHRPHeE/WaG9bfWVl+hb8A?=
 =?us-ascii?Q?iBTs1+w/zhoyQdyeKtNc8mpQtGM4t+3G8v5qdYtgwsq3wbJhE1w7+y1J71TE?=
 =?us-ascii?Q?IfpRbXjRICyMsoyb8OIBYDNcjuCcGIyFj8EPfpNSigRbfZ54vmMZJSb4NDzG?=
 =?us-ascii?Q?AbsPXmm2Grnl9dw6vZE/WLh/2DZNY7EcWA6Ng09zYdmF/ldULhxKArU5dpfi?=
 =?us-ascii?Q?li/3qfY+bwyNWH4XljWIIbCzdQZtoQVWNPAj2aPMaq2K/M8CSmSlul6hUVFp?=
 =?us-ascii?Q?9jPvPwfiAM71iJYmAlEUh42p0zDHhHHHkBISEXaRYtvgsUMn2GrBfWzo2QYV?=
 =?us-ascii?Q?0FM2eSqRAtZwpEluN4psjBmd2St0g7lBGnIzxXkxV+z9OCrGPR9ORbTi/agt?=
 =?us-ascii?Q?ThNu9nxbO1FXwYmS7ZKHZa33AY0ykoOPU1CXQ3LpJw8XjvNRCN/VDQlYfBWw?=
 =?us-ascii?Q?Wwa1otr+n7LHYVO+UMtDUpugActXY+13TWyh+2DeCTQCSSr8ID/39sT1alJz?=
 =?us-ascii?Q?SvMzvCO4s4p0T9vnGREQrgWWur8WS8uNo9ZmQ5wL2ER5LmwT8xB+2dBnVQOy?=
 =?us-ascii?Q?YaGkGvoezAfMvLxowJco4AHyqaTAygc74fouYOet9cJaJoEkCnUKoa021E1y?=
 =?us-ascii?Q?cQtoKHcOQ5I75U7gwuUuqGFRqtmARQjgrChoBgkJEZnHFSB1o0CJbVUzmnSM?=
 =?us-ascii?Q?AhBeJrbuUt/Yz7tqnysNRGvCR53C+h5S3cKWB78KxdHpKjBMqv7VYs65f+OF?=
 =?us-ascii?Q?TWGCJolsunmyQoGg4bzJaSq/pMmV7XszDw6rveNC2sZ52HobgK7LMSqR14Ru?=
 =?us-ascii?Q?WPEUUsrBoUK7app5GdVgQ6eL2U/C1nnlsTE64z5xIveTCeZJMom+FFEuBrDj?=
 =?us-ascii?Q?LVQl3N9UQoOG6iTGLlaOZwEf0rPr/UjPEi9KAOOMe2gLiTdOt9AAkRI/7FWo?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acf67181-c14f-4b2a-2fe9-08db1103630f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 16:24:05.3680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJPvuzgt9BBQzfOr/yVwiMXSvFALrPe3JS0rEe6rk8/A9zhnKFOekavzoDu5NYhzbBOmy7U8yt1lcVo1mNnZFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6355
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 08/22] drm/xe: Fix build for
 CONFIG_DRM_XE_DEBUG
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

On Mon, Feb 13, 2023 at 03:22:47PM -0800, Matt Roper wrote:
> On Fri, Feb 03, 2023 at 03:23:55PM -0500, Rodrigo Vivi wrote:
> > From: Matthew Brost <matthew.brost@intel.com>
> > 
> > GT TLB invalidation functions are now in header
> > xe_gt_tlb_invalidation.h, include that file in xe_gt_debugfs.c if
> > CONFIG_DRM_XE_DEBUG is set.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Should this be squashed into patch #2?

It would be better indeed.., I'm trying to avoid the changes
in these merged patches right now. But I will keep in mind
for the next rebase on upstream.

Thanks,
Rodrigo.

> 
> 
> Matt
> 
> > ---
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index 30058c6100ab..946398f08bb5 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -11,12 +11,15 @@
> >  #include "xe_gt.h"
> >  #include "xe_gt_debugfs.h"
> >  #include "xe_gt_mcr.h"
> > -#include "xe_gt_pagefault.h"
> >  #include "xe_gt_topology.h"
> >  #include "xe_hw_engine.h"
> >  #include "xe_macros.h"
> >  #include "xe_uc_debugfs.h"
> >  
> > +#ifdef CONFIG_DRM_XE_DEBUG
> > +#include "xe_gt_tlb_invalidation.h"
> > +#endif
> > +
> >  static struct xe_gt *node_to_gt(struct drm_info_node *node)
> >  {
> >  	return node->info_ent->data;
> > -- 
> > 2.39.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
