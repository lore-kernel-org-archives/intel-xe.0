Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60ABDC79FA3
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 16:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239CB10E4A3;
	Mon,  5 Jan 2026 16:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IcOsECm9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0F010E4A2
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 16:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767630056; x=1799166056;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uWRGJfUmten/F7JTlmqkYVZyKuCmH5SZPxi+bLDh0fo=;
 b=IcOsECm9DaNhmKKmRXjdITrrfUtl6TG8C5ZVG1Xq0fpBncZNfFYvBjga
 lyTDy2gbo5/Rl257m9ZDY1pfZN/+TyPH+3+/uve5qLPTXrAeb3mN4wa/s
 7oZykymwMsFTPDLquuCpK4ibxMUIDMyso4Twl8qkKP5ZLGpdiEcJZ8ZUP
 k8Ps2CsIn/MwGumAFBgWYB/YHqmCM2r9igvLR0TSMqDj+v7u6bu3ns6hy
 tAtSYMRbJHt9Pvv/l2BMsnPVvhBwYqaunS0fqi5BF4tvR34L85xwnFNoW
 ttTcmqcwUbQwgxaIdqNf/RDqUR5Dd9Zm1oLgds2U9/MFQTJPUeT4Uywua w==;
X-CSE-ConnectionGUID: VxP+xyqiQI2EXi5sIaOPNA==
X-CSE-MsgGUID: Q7b5nEdeTImk/LKNbeen+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68736553"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="68736553"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:20:55 -0800
X-CSE-ConnectionGUID: Hr/QfMHvRqGH+LrF+AiCbg==
X-CSE-MsgGUID: gNFOo9N+TbmQoWFA9dE6mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="201657606"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:20:55 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 08:20:54 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 08:20:54 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 08:20:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXyMW17oQH0wiLWghTQFXcfJQuq8NPp/LndBWx/udvaJTa0QnIociGcf03FeWMokJ2K1rW41uOHS1DL6XU5RN3lrGAWuCUWpvOndkWvjtirvkeJdxoYP9UAidfFy3iQFUxQDKBEd/v/9qwKzw589QeUehIBs3LldMZVRTcayG6v1KAMnha5czN7xVZTXCyQULsJxiS/mQOt/AJbcJASQbfMQCbed9F58mkNzZ+wJiYwAIwhR/bt0BhxEBIjkrfFmysb1jbUkb3lmVYg2vh8XUNxUa87bCpZiqQx0yEy/QbQUzh9N5RCBOlZebmBwa9XEYwBXMsYtIJI9jUD+/M2xzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVbnRDzoy4WlgXml1KunGMJRsFp4G9P+I0MVExa9a8w=;
 b=Syv0l6ZnqFIRqJL8UMvo4xLQQbIjqK8MBC5rcl/F96wyYYrYesGJmzsy76oj3BRA3oz27N/dHAnnm8DeXAmPPTNDEqSmR3YruahKbumtm6y2hRjk8ulp7FiIUhrcG1qWHV88QMjiJXwbJpp8lnFCHeelPd/OedGaDPAkmF+Hl4GrBZ7o8d4o1jkcWG6eqOn77qTd8ncL0o6Q4bBeJ5TX9uR7UErI/idiWEIqpIzvyUT59pUHZXiZbCXqcS7QtMJnI6ggiDH5X2zBQSV+21ijCIzGw66kOw8FXgXy4DWqQObHnTVkb3f70p22vCy9PoOJTjocmC7Iq6zrB36CPSv8GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4761.namprd11.prod.outlook.com (2603:10b6:303:53::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 16:20:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Mon, 5 Jan 2026
 16:20:49 +0000
Date: Mon, 5 Jan 2026 08:20:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Fix page reclaim entry handling for large
 pages
Message-ID: <aVvk39vLp+j9qRR1@lstrano-desk.jf.intel.com>
References: <20251224233638.1535283-4-brian3.nguyen@intel.com>
 <20251224233638.1535283-5-brian3.nguyen@intel.com>
 <SA1PR11MB8839BBCE618C31517EFA4A47AAB8A@SA1PR11MB8839.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB8839BBCE618C31517EFA4A47AAB8A@SA1PR11MB8839.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4761:EE_
X-MS-Office365-Filtering-Correlation-Id: d21468c5-110c-41a6-8da3-08de4c7663a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q2iSxZBejwyNuSHw/zmHKIBKQeJFyOE8Ci20a8/RvHty4KEHY8B0Tm7AxxIH?=
 =?us-ascii?Q?ZcE/28EW1K0Wu4k+kEfCLb6Xxxy4yj+effZgHF6ywB06SKtJiM+niCrQWs9h?=
 =?us-ascii?Q?TdcCT4yzPSoqcLvxqGXKgBqP4lsN4/eHG3Vjz8hh9j/bFNsY92NwJABYxjC+?=
 =?us-ascii?Q?1afGgAeXr9g7m10eYVgDmabUod37rcxE7Lwkhn6nk7wFb8XMxQQm920viShO?=
 =?us-ascii?Q?KV9ol3WmxsczHjK0bST5vxhoIzaOMGuFnz12rggsjqkWzC8OD7MsDWVnGBCP?=
 =?us-ascii?Q?goB6DtGSjL/a02lNT6jGX5Ac+nsJPLxMxyqaH/JaOC6TxyLsp9vDyEbiuv5Y?=
 =?us-ascii?Q?Abcr8OpOImZ+u1+ZxH3wB6arILnutzTQbCpksWnFfLZvFAp6+VKYajVLs6tr?=
 =?us-ascii?Q?S+Z6qm1MAQjec46pGJLL7x6XEQeYlqXdLZ8030HP9n10U7gm3MFiydbpz1u3?=
 =?us-ascii?Q?ADuOoMiqlRAeKG/X1emR+AH3UdwaQIgruWnHejO+qr+fZq7nmTRIwTeCuCjL?=
 =?us-ascii?Q?P6grsJuFbA02wgKjRtsYXvLNNaxNl3tvR84MxZQUAnntvzBxRdJzyO1fGwqW?=
 =?us-ascii?Q?jQEYEsdJO7e4RZL6bYLTK0HZiS4CxF+AHipAnT8XiNPnFZC4gXZfcVq/ELFr?=
 =?us-ascii?Q?HE4yemcjeTDcYF/AB1XdG7nMUVusPw3NOQtLsVhJn3Rn8X6PCtHfCvhFcEjz?=
 =?us-ascii?Q?TK6A2UBu5Ekn2DvT6NdC7utQF18ZFZGrI34kgcGQpB2ufNCS4SNHX2ANuj7+?=
 =?us-ascii?Q?qwiEVEhGIeUpKcqXRquGMh0Y1np8ZO3bcuMqkqoshPNumBRJkTyRu8RkYklJ?=
 =?us-ascii?Q?hHSOO2kYEFO7+vd6P96caTpkmKtKKQwxGsawJB8JxEGBEvKtIY8u3XTkfYwO?=
 =?us-ascii?Q?FcJfSEotDtw9rhug7mkUH8DQeVcq2LP8rJl84cejNpfEsDfNtvunnBFbrwml?=
 =?us-ascii?Q?vzPmxoIpo7vPtOF3slMVijsNj5zpuusa2znOWEHzWB4GetMYrYozzUigxE6D?=
 =?us-ascii?Q?9GJm/GKL581KSvdcR+3WhBt/yt2rwF1dpgBOk/yVi+sEYMXQJsHCEv3VFAMd?=
 =?us-ascii?Q?KNA8NzUiWTJBl0bdP4bkOKFp3OnoU8EgIOhgcd7R9VrjJZuGJCA8Sm1uDkql?=
 =?us-ascii?Q?6WlsyfOVMY2IfE60unEOCGPr2kTIQs/7U7bg2quQjAPcg9R7V1tqOcAN3RQV?=
 =?us-ascii?Q?3icRzWlSOhO9SwmW9HbreVJjQ7F5ZIjaJKO8bPubvH3ilRC1uYfw6LN/c6O+?=
 =?us-ascii?Q?AcLhF1HW7+8qapiLcPa6wzF4e/F5BONPZFkaQoP+kISwtFMg2YIKtiQum5qP?=
 =?us-ascii?Q?HEPuvCghFsZ9KGzHf9B2wBYM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?StY92HWKS75KaEDwRV3G5eoHTgVLT5MvICi++UcnYaOGmc7ZbFlKb2w4e4kg?=
 =?us-ascii?Q?WHzp4s+KsYENr4vY9+kZeVcf8eUrSlnr+E/zO1GLInQYmwoMiG2++8dPzRyf?=
 =?us-ascii?Q?1rfysq0kB6q3PNT0odTkikDPy3zLkIAjacT8zKuVhSLT7rVTvNfo80xdHjtP?=
 =?us-ascii?Q?n4SShMddXUDF62wcRp03/DzTK83e2vWF79zKRaFAIIX1nKRPinRfpfJTHHNC?=
 =?us-ascii?Q?Mc3kHk0y1N6+2rC6OSwt+iu+GuGTtNWwHL2bxzql/KfqGE0UbkQ3LlJ8ayIM?=
 =?us-ascii?Q?5Owg0jkaaVeZZj9lQX2r1XQBKo0KzpBfggPmU8qK/1e/HgXdXQ+hPksJxnKs?=
 =?us-ascii?Q?kSPxla3r3sSEq/V5Z1pgvLMGPmJ8oaZSfOQS2MWlMkTT5fWyPHV4RgZ6/oo3?=
 =?us-ascii?Q?bHcOjGvYRSTzlZqZHXMKAgfzvd25JntvfXJ2akbHNzzweeq3KzNMKrKtWbVE?=
 =?us-ascii?Q?SKyTKGQCtN17uiLyzATwm1dHY7OYI9jHz029+FGBqsXVzImbWc0I17EwfsVl?=
 =?us-ascii?Q?MBjkKHqpPuRWO7F5tsdLydpHxo83EhoJbl3/GsDVYm92oKtJuI9r8votULp/?=
 =?us-ascii?Q?dlO8lyuwCkQMfAxjdIZ+SDu0rHP4Wekvb4U9Efm0MjOnEXC3rOVQnAr7J+/0?=
 =?us-ascii?Q?exW3BCQDVmima9D+g/rRdh0CsoQQbstBsXmZ+msLHWFvwibzN2eAqLiQKBhD?=
 =?us-ascii?Q?NlamWTYHOUuPFgvfWiGlOJwIap+tVyBOVtgHUPf1t4BNgBHs1CoplqtgSDB7?=
 =?us-ascii?Q?juOBaUby+xc/hihbqtC0PAGkZSIsBngmgre/aUzRELKh/hyi7uJ+GPnMRyN8?=
 =?us-ascii?Q?Y8ENovD9Yb54vxrwg4xRaW8Q9/zTVCL0B8p1sOTAi6WhWc7d0XVPlTdlCVBb?=
 =?us-ascii?Q?SPNafKk6JJbqydeBdVLsWGuidvhRvr0VZAweP0SyCILH6v2+oaahW0JpGRT1?=
 =?us-ascii?Q?arH4aJ1lbtm+gab/7FLEpLimgqlZPbtattlPQovSZXkE1M+vBksG8yGkufQn?=
 =?us-ascii?Q?fBnEnRQ86W0COZ2xJUoZlBr5gmXf0J9zPYCSNFnK5IbJncTMYObzVaLzLdLK?=
 =?us-ascii?Q?umIlHKf/SPPEpADCy86Iy5PwZeot+F25T0l+bweXFr3kGWwesr3qQCgiBgR5?=
 =?us-ascii?Q?ivGGI1cNDF0zv4dYt5avJSGXko54baO1jM80E6TSK4c4JrWYhvZmcQCJ0ZZS?=
 =?us-ascii?Q?fLohi4eca7lPP/nedJuM5U4s2c3oysLMCZk72unlWgsN3bKIEnrUN3rn1fiE?=
 =?us-ascii?Q?BSScmF1jindsgbH0IK/TBoeCn7F82BYxcSyEy9eVom7+CPC8YSAIINJz3mQ1?=
 =?us-ascii?Q?FkYs1f0prmqO96E25Ft9bR2U4OZuJeKMrf8at8ei16vA7Jy68kAio2KnD9zy?=
 =?us-ascii?Q?7U0R4vQODbIwBVV/vGuA/wGojvBvBcxRkrluWjz7phzvbZnLDa/QBRcJnTRy?=
 =?us-ascii?Q?F9nU7A01j2/evzzPIQEsTbt7wW96/WKiMqzj3WH7u3tm0dKnJzd9sWTHogWO?=
 =?us-ascii?Q?q1fBnU0EJpGF3qzEBBRhJhoWO3NC/4/VsNjDiQSCXI9GiGDrIcmhQx+JKdrY?=
 =?us-ascii?Q?wZj1TTQhnvZX9a8rXvFjyYnIRysXZ7tBIuZVP8RirTnnlUWCLnIefNkaW1mi?=
 =?us-ascii?Q?vD7MXnOEs9YqQ22SZ7yUNgDU5Lu/xx+06H8aDzsgbpbFeenlGUoWbNlsHMtU?=
 =?us-ascii?Q?XaGKt5A6aMz34Nfx9xSKZdXWwhQry0adLS3hNDy8p5wdK2BiX8x5PYWAmjb7?=
 =?us-ascii?Q?mrZzXdgRYLWzst/OJqConJx0CPveIzk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d21468c5-110c-41a6-8da3-08de4c7663a8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 16:20:49.8355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIRaoFSvamcVrA6LBSY1hPEwJRIWOZRPG141GaKWxuoSjhy/O/r9GW1SjZwWwnTPcIMKAwPnAeuCq9prffvBCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4761
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

On Fri, Jan 02, 2026 at 11:21:08PM -0700, Nguyen, Brian3 wrote:
> On Wednesday, December 24, 2025 3:37 PM, Brian Nguyen wrote:
> > For 64KB pages, XE_PTE_PS64 is defined for all consecutive 4KB pages and are all considered leaf nodes, so existing check was falsely
> > adding multiple 64KB pages to PRL.
> > 
> > For larger entries such as 2MB PDE, the check for pte->base.children is insufficient since this array is always  defined for page directory,
> > level 1 and above, so perform a check on the entry itself pointing to the correct page.
> > 
> > For unmaps, if the range is properly covered by the page full directory, page walker may finish without walking to the leaf nodes.
> > 
> > For example, a 1G range can be fully covered by 512 2MB pages if alignment allows. In this case, the page walker will walk until it
> > reaches this corresponding directory which can correlate to the 1GB range. Page walker will simply complete its walk and the individual
> > 2MB PDE leaves won't get accessed.
> > 
> > In this case, PRL invalidation is also required, so add a check to see if pt entry cover the entire range since the walker will complete the
> > walk.
> > 
> > One small case is some seemingly racy condition where multiple invalidation on the same PTE will caused the value read to be zeroed
> > out. In that case, we could just skip the entry since it only occurs if a previous page walks invalidates it.
> > 
> > Fixes: b912138df299 ("drm/xe: Create page reclaim list on unbind")
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c | 44 ++++++++++++++++++++++++++------------
> >  1 file changed, 30 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c index 6cd78bb2b652..a79734079ef3 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1576,12 +1576,6 @@ static bool xe_pt_check_kill(u64 addr, u64 next, unsigned int level,
> >  	return false;
> >  }
> > 
> > -/* Huge 2MB leaf lives directly in a level-1 table and has no children */ -static bool is_2m_pte(struct xe_pt *pte) -{
> > -	return pte->level == 1 && !pte->base.children;
> > -}
> > -
> >  /* page_size = 2^(reclamation_size + XE_PTE_SHIFT) */
> >  #define COMPUTE_RECLAIM_ADDRESS_MASK(page_size)				\
> >  ({									\
> > @@ -1594,7 +1588,8 @@ static int generate_reclaim_entry(struct xe_tile *tile,
> >  				  u64 pte, struct xe_pt *xe_child)
> >  {
> >  	struct xe_guc_page_reclaim_entry *reclaim_entries = prl->entries;
> > -	u64 phys_page = (pte & XE_PTE_ADDR_MASK) >> XE_PTE_SHIFT;
> > +	u64 phys_addr = pte & XE_PTE_ADDR_MASK;
> > +	u64 phys_page = phys_addr >> XE_PTE_SHIFT;
> >  	int num_entries = prl->num_entries;
> >  	u32 reclamation_size;
> > 
> > @@ -1613,10 +1608,13 @@ static int generate_reclaim_entry(struct xe_tile *tile,
> >  	 */
> >  	if (xe_child->level == 0 && !(pte & XE_PTE_PS64)) {
> >  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K);  /* reclamation_size = 0 */
> > +		xe_tile_assert(tile, phys_addr % SZ_4K == 0);
> >  	} else if (xe_child->level == 0) {
> >  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamation_size = 4 */
> > -	} else if (is_2m_pte(xe_child)) {
> > +		xe_tile_assert(tile, phys_addr % SZ_64K == 0);
> > +	} else if (xe_child->level == 1 && pte & XE_PDE_PS_2M) {
> >  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamation_size = 9 */
> > +		xe_tile_assert(tile, phys_addr % SZ_2M == 0);
> >  	} else {
> >  		xe_page_reclaim_list_invalidate(prl);
> >  		vm_dbg(&tile_to_xe(tile)->drm,
> > @@ -1648,20 +1646,33 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
> >  	struct xe_pt_stage_unbind_walk *xe_walk =
> >  		container_of(walk, typeof(*xe_walk), base);
> >  	struct xe_device *xe = tile_to_xe(xe_walk->tile);
> > +	pgoff_t first = xe_pt_offset(addr, xe_child->level, walk);
> > 
> >  	XE_WARN_ON(!*child);
> >  	XE_WARN_ON(!level);
> >  	/* Check for leaf node */
> >  	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) &&
> > -	    !xe_child->base.children) {
> > +	    (!xe_child->base.children || !xe_child->base.children[first])) {
> >  		struct iosys_map *leaf_map = &xe_child->bo->vmap;
> > -		pgoff_t first = xe_pt_offset(addr, 0, walk);
> > -		pgoff_t count = xe_pt_num_entries(addr, next, 0, walk);
> > +		pgoff_t count = xe_pt_num_entries(addr, next, xe_child->level, walk);
> > 
> >  		for (pgoff_t i = 0; i < count; i++) {
> >  			u64 pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
> >  			int ret;
> > 
> > +			/* Skip already cleared PTE from past unbinds */
> > +			if (!pte)
> > +				continue;
> 
> Jumped to a conclusion a bit quick on this.
> On a second review of this specific case, this pte read of 0x0 is not a cleared PTE but an unwritten value to pte.
> It looks like there is a race condition here when xe_migrate_update_pgtables() does the gpu job instead of the cpu write,
> So, the pte value read here is an unwritten pte value still awaiting the write from bind time issued job.
> 

Yes, I think there are 2 possible race conditions:

 - Another thread is issues a TLB invalidation, I believe this would be
   possible if unbinding a userptr and MMU notifier races.
 - The original bind has dependecies which are unmet so the GPU job for
   the bind has yet to be executed and an unbind is pipelined behind
   that job.

IMO both are really academic cases (i.e., very unlikely to occur in real
workloads, IGTs likely can hit these cases though). So maybe if a empty
PTE is found, we abort the PRL walk and fall back to a full cache
invalidation?

> I'm working on a better handling here that will most likely have to wait on the fence of the gpu job to be signalled
> rather than just skipping the value (?)

See above, I think since this likely race, we don't over engineer this
and just fall back to a full cache invalidation.

Matt

> 
> Brian
> 
> > +
> > +			/* Ensure it is a defined page */
> > +			xe_tile_assert(xe_walk->tile,
> > +				       xe_child->level == 0 ||
> > +				       (pte & (XE_PTE_PS64 | XE_PDE_PS_2M | XE_PDPE_PS_1G)));
> > +
> > +			/* An entry should be added for 64KB but contigious 4K have XE_PTE_PS64 */
> > +			if (pte & XE_PTE_PS64)
> > +				i += 15; /* Skip other 15 consecutive 4K pages in the 64K page */
> > +
> >  			/* Account for NULL terminated entry on end (-1) */
> >  			if (xe_walk->prl->num_entries < XE_PAGE_RECLAIM_MAX_ENTRIES - 1) {
> >  				ret = generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
> > @@ -1679,9 +1690,14 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
> >  		}
> >  	}
> > 
> > -	/* If aborting page walk early, invalidate PRL since PTE may be dropped from this abort */
> > -	if (xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) &&
> > -	    xe_walk->prl && level > 1 && xe_child->base.children && xe_child->num_live != 0) {
> > +	/*
> > +	 * If aborting page walk early or page walk finishes,
> > +	 * invalidate PRL since PTE may be dropped from this abort
> > +	 */
> > +	if ((xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) ||
> > +	     xe_pt_covers(addr, next, xe_child->level, &xe_walk->base)) &&
> > +	    xe_walk->prl && level > 1 && (xe_child->base.children &&
> > +	    xe_child->base.children[first]) && xe_child->num_live != 0) {
> >  		xe_page_reclaim_list_invalidate(xe_walk->prl);
> >  		vm_dbg(&xe->drm,
> >  		       "PRL invalidate: kill at level=%u addr=%#llx next=%#llx num_live=%u\n",
> > --
> > 2.52.0
> 
