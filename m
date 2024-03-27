Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A943C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 23:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6809110F6BD;
	Wed, 27 Mar 2024 23:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QM7arMVN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A488810F6BD
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 23:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711581802; x=1743117802;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N3mncOcfU4eKJ9iR7mZH9TdQPMjVAk3M7qkE3rgGvoc=;
 b=QM7arMVNZ2F9ZCYeoPb5w5v+g+NZSJSr2C/UOD6ma1/9AKzeZjoGQax3
 5m1z7nIHareJvKV13u48tOpEYMbeCDdv1Kw8w1k1NR6PqxJzovZgg9nBI
 x14MarhtJF3NIGdztaa7Zic9b83G2QS8gUB1QsXvcZLq60Tg8LWsrPYyp
 kF36MfYstROhmrSHpVPK0cmDcfLQpyAY5lqAGh11IQ99gwZT9iO9inHqj
 CeUh0HHYoy6MkhzcE+QP+7RDPp33kkeK/4oiyk5zl1SMYuW/1swO6jWfl
 fEIidYEk8EHEhCHvemlVmwNXZgMLdNduqbyvrOBPCUDga6kS8aVQ+ZbwZ w==;
X-CSE-ConnectionGUID: TIYgRxhdQlalAUufAJQtdQ==
X-CSE-MsgGUID: 3r2vJuZEQQStURQbLCbwsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17443273"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="17443273"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 16:23:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="16290611"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 16:23:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 16:23:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 16:23:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 16:23:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJxdz5fIJxIVBauYSXvg/2jpZ/Lk7xtpdjunebFPJXGBuV6OU/EVsdm4KlPPdHvHYxd0xvTghaaZxNHBuO6IY9SS1pJYSP5rJj2DbW5XWUOmjikK7OcuFC6GHW+W/HLjyce/5mepTyLZoVff8VZen2Y+5KvIyCkFKLvXQOBWwNe/Y9Kjynk3yzCUsE+GtUMX9TT3GAJCYUnKTrr1omrJyE7m7EiloqRwqq0K4FPWzFYqeI9n55fVbQWpJ2Jn8n4ShSl0OAfZ1+yVCLNhu8xXw/YiSbacR221/UwrmdVrg5U3O+mHjZxn80JU4qiGod/5D+STmaJkuy1s28fiVDCrfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWUQOQGxpq+Al3KgJxf/rPz51wu7OSxLk1Ge52qpdwM=;
 b=j1CdhKUhfPtef71UznwfE7rbQLAiBqZDBBjFNVEvzqU9r/8h/PZT9GfdWPuzXYQ2dAz+xyoGJf3XYoXPPoxPSaRJy0vIYEVOWOOOPZfA8u9oawy7ofKdqFtdCDm8krMtbEL2rpyXfIGzhyz4bwmQqhxIxowLZiM1FXH/7QY1/fAumLF6dSf7tSfdma1rts0AisDeAoKJDNkDG4xSdcaVkNB2Ra5aLzvCHUMmaNBsxDWmLiunZ1nyPgPC4gJqwhGedCRA3QE8lV4NH+jvc8/6MK8IlPy9yNYLXO/ngz7eymq/qERBXlBAhTuGdnX1FpH9U4omZcruJVopbtIce9wdaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB8599.namprd11.prod.outlook.com (2603:10b6:510:2ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 23:23:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 23:23:19 +0000
Date: Wed, 27 Mar 2024 16:23:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: [PATCH v5 1/2] drm/xe/query: Define and use a constant for the
 number of masks
Message-ID: <20240327232317.GI718896@mdroper-desk1.amr.corp.intel.com>
References: <20240325111439.7-1-francois.dugast@intel.com>
 <nwogfwjufbp6now5u4huaumpxf2cfeggeyobumovdm4vuv5ong@siqwktqabnrk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <nwogfwjufbp6now5u4huaumpxf2cfeggeyobumovdm4vuv5ong@siqwktqabnrk>
X-ClientProxiedBy: BYAPR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: 546f1b49-65c9-4455-319b-08dc4eb4e313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KHNBG55LH8PvCcprL3jEyfDnr5XeI3ETsKlTOOY9bvraS1/VDvui9+nU/87tzoIliOHQOaJc149QShk7tQabbNt2jc1fTl+6UFtcfJrsdRULZ4tSoE1WyhXU6Vz5UQ9wM7Rl5qC/JMMVHXvvdtWQxe5pClZWN2hp7npD1vnZWSnMCJmGXnsWqq4Hary6W7MVGTOTkMjyCuQYdf42afBzI4Z5Wr7n9uHkqpExXD9hzQT7tQXxRG20wBdZ2LKqAMNllYQBATWRrh9h++snUNMQjvs86SEKyafx2nLupGmN9ZbZitaZOET4xMLjkHVhsh9KcbmnrEc5I/mLtr8c0vW2h6ZrKERqxCDQ0juriFl4vXH0slHG3pbJ6oEyKegcSnHEXWSGWrv8gX4ap+oF4KdOwFAmkR/A5cEhQnI30hvjcB6IGOw+casD1tyYZYwkXnnsdIrr52oKdFSzPpx33So/dx/HUqsssnvSHhqC6CmNJP2oyJAhhowoYFWVOjPyJFBslWpYwiXnfT7NVc13uRJAGJqjie0Q2ODYSwiFhO03mVyMJuAK5WQZFLUzlrDfXJRnzg1a90VKdJ+w0M9cgx1g+f3iE68E9YqFo87UK9qtlogl3pbi+qpx9QChBtHiD5vPXaPs/tyUnYINXRHbQXuWLWPz0Ts3dKjM0ouDRJ1enj4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?izEqhgEm1QUtsddibJ7v9xhelYCUhXxIMnHBF8ZfNpMZMfceHOHlMlWAC1QG?=
 =?us-ascii?Q?ouqDSrJO/qPgRptq2kob6iz/f+5Wy/XO1YH7mQZCixD2eyCx2whsV8YCZCdc?=
 =?us-ascii?Q?35szokTU7WXy9iYSMOpkCPIN0kWl8A+W2LRp9Go9Reqv0KeQQ/SzteVZalST?=
 =?us-ascii?Q?Ia6/mZBMW1fvwrYxycsFL//nlrG2tdfPIA9kR9MbRDHUx3DSR5lhCsftqExu?=
 =?us-ascii?Q?bG2MyzZZxr7AfUgqMry8XgNmUtozVbWH3w+Zu/KqYJJXE6IsVhaRE5Ex1BlL?=
 =?us-ascii?Q?vzX0T0qLcATmgy6TGgPUQ1CLnqWwr+hmB5S17m6NJbJff+gLy7LBQ4X2meP7?=
 =?us-ascii?Q?s55651R7VQdH2JOlX0S0UN4spJ/B68Ds3GEtpmz478R4HygT94dNG/l7m+R1?=
 =?us-ascii?Q?2Mil4J5BW4xXmezS8BXfw6ssTQ72BN7Hec5CrpeU+Cgrr69KA0FY0yMID8Ad?=
 =?us-ascii?Q?OtKiD44sWxc14yvUYTOR9jwbKH+UYVhusIMrQOzOg5uFJQOufePHn0CCToVL?=
 =?us-ascii?Q?WSfow+cIetICOsCo37RnhXjKEFntskSlQDmubWbAB7aYqo/sSfQOn5pj2gLN?=
 =?us-ascii?Q?/BwoSHD+n+3vqNjhCrErWlEU2BfTPVO0lUDLvzor7I32qn8CkyHH0AmfqmZX?=
 =?us-ascii?Q?+MYUQlrpIijUUQiV8RdegWZY6ym3GjWPr+RmE/z5EwmcF1HQP26iRygfP9Tg?=
 =?us-ascii?Q?HUfmPPhg6i2BoLgemBaevBq/jL8V5BZqP28n/qR2/46ox9OPxxD9NTjz3Dib?=
 =?us-ascii?Q?8eoFLtOAF/7yXkaNMiEZbRSMY1WOt4Ts3uRhfUvHVd8UjENk+HnX0UOTy1zH?=
 =?us-ascii?Q?FZMG6eIx2vhREEDHvqVlGBDr5AJF/FWDuKUATII6TocGYwZ2Utflc97vSkW0?=
 =?us-ascii?Q?ppeK8gIgJhOq2SlaK0YjBOwZIZxhRKdlULaqRMMDBGsMnC8aKDCd8RQOBcaX?=
 =?us-ascii?Q?jv0f4P+JHTiWoxwu0CZY4Mlzh2AnOfNjdR+dNIVyACVCGgSbJhtRiAnXuAXB?=
 =?us-ascii?Q?v8dzq6uZ/GVRssbLWchqTQz+U2L0R/r2+5Wx5DPq1Ytmxl9bc7jVsJG9eqfS?=
 =?us-ascii?Q?569TbXirhU3n5HXTeyU4Uhs9c3CxcjlrovSVxZnIEyxdiJIx0BaFCYBO/CkR?=
 =?us-ascii?Q?KuTQ6AkNhLnJSihUt4xuCUxuFiO216iI7fS/U0Tdz8xk3/J/aDNvVbWjjV5z?=
 =?us-ascii?Q?uz9Xw22SM94CMDSi1CqJzc+f6996D9VTzEYCFveU/nKVpQGTUjx9JtA/mgLD?=
 =?us-ascii?Q?x4wtr0dWjzu8Y8Wpb7OUClomZGpxnHaamLUPmY2nDr0CJ6VWXzDkfLkaTjWB?=
 =?us-ascii?Q?Ot1rypdxT8acIcDU/6f5mt+twgTNulNYSFZNudd41loosDf+utLeXAPUAzKb?=
 =?us-ascii?Q?PZF1UWqu3z9YdpM/NQlhbY5yortVlNzf6rJVcOO7iV4rQI2oF5E81pVnb3S7?=
 =?us-ascii?Q?1pHM3/Vw4GhCRrxhRe+Kri24ccIoJ6AMnerzlPuF2PsRI1vrPLoYdVMviklT?=
 =?us-ascii?Q?xRQdUMZ7NGghl8z2Oc2iBShCLR3POtjMgy/x0YqUXQ+rUjiFmoDkaSHZrAqN?=
 =?us-ascii?Q?UP9doWisoyXvp0L8VZZC9WSSvjF8w/gbMoyR3oH2zm7spfQ3/YAObpdGw5Xk?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 546f1b49-65c9-4455-319b-08dc4eb4e313
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 23:23:19.1517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDx4j2eDVuAClV2+O79vZqRIyxBCLudjCmI39sTVHIPBvlWttsXYNzqHxdLcWX6Enf3uexh2noAM6g8RSoYjHp815NuzCBweYGCll1yFNn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8599
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

On Mon, Mar 25, 2024 at 04:22:03PM -0500, Lucas De Marchi wrote:
> On Mon, Mar 25, 2024 at 11:14:38AM +0000, Francois Dugast wrote:
> > Replace a magic value by a constant with an explicit name to make clear
> > what it stands for: the number of masks returned by the topology query.
> > 
> > Suggested-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_query.c | 5 ++++-
> > 1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index df407d73e5f5..109a96212310 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -23,6 +23,8 @@
> > #include "xe_mmio.h"
> > #include "xe_ttm_vram_mgr.h"
> > 
> > +#define TOPO_NUMBER_OF_MASKS   (3)
> > +
> > static const u16 xe_to_user_engine_class[] = {
> > 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
> > 	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
> > @@ -454,7 +456,8 @@ static int query_hwconfig(struct xe_device *xe,
> > static size_t calc_topo_query_size(struct xe_device *xe)
> > {
> > 	return xe->info.gt_count *
> > -		(3 * sizeof(struct drm_xe_query_topology_mask) +
> > +		(TOPO_NUMBER_OF_MASKS
> > +		 * sizeof(struct drm_xe_query_topology_mask) +
> 
> actually no.... the number here should match the entries below
> 
> > 		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
> > 		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
> > 		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
> 
> what do we gain moving it elsewhere? I think it should match the number
> of types and hence maybe use same "namespace", but that also leads me to
> another odd thing:  why is drm_xe_query_topology_mask.type handled like
> a mask rather than an index?
> 
> +Matt Roper who implemented this originally afaics in commit
> eaa6ccf582f5e3252aedea81559fcbf71ed9ccde.

I think you're referring to the
        #define DRM_XE_TOPO_DSS_GEOMETRY        (1 << 0)
        #define DRM_XE_TOPO_DSS_COMPUTE         (1 << 1)
        #define DRM_XE_TOPO_EU_PER_DSS          (1 << 2)

rather than just using 1, 2, 3, etc.?  If I remember correctly, very
early plans for the query uapi was that userspace would ask for specific
things they wanted (by providing a mask of the masks they wanted to
receive).  When we scrapped that idea and decided to just shove
everything at userspace unconditionally and let them ignore the parts
they don't care about or don't recognize, we just never remembered to
come back and change the numbering here.  There isn't any reason we need
to keep this to powers of 2 anymore, so future things that get added
(like L3 bank masks) should be free to grab the currently unused ID 3.


Matt

> 
> Lucaas De Marchi
> 
> 
> > -- 
> > 2.34.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
