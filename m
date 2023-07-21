Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3926EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 15:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D33610E6A0;
	Fri, 21 Jul 2023 15:51:37 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AF110E6A0
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 15:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689954695; x=1721490695;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QDtS1YnhOMhpCLWg0V9j+IHneUNDtiJOZBdopsQeu8s=;
 b=OkXSr/7OH7h326+4KDqh+ucpoh+AguzcO8CfRM2O9xD+YowDUVKBJW/I
 60qZu5rkTNsmi3f6QXl2K1W7LB0Sq4vXL9PETLvctGuw6StaM5FSsez3z
 Gi/VildkMlp3xl+uXaC+6lZcjD3y3C1BJjTJoOS5PvGG5Ia1NxihVWKD5
 4lkBBzVt53EV293Z6BaZlJnuZvxoGcPVK0TV8bw6htpaiqygDQASBhweT
 sG46pxiL9rnYxR4HxemS0CeMkZWFIV9jK2HUlOdxHa+Ygv21jpWrfJjJG
 fddyAoa3UjgxYPuDwR2Nj/9VVzxq6atnbD6+DNRZOgbVT7F/fUJnrQdCW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="453428984"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="453428984"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 08:51:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="898748837"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="898748837"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 21 Jul 2023 08:51:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 08:51:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 08:51:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 08:51:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jeE/DAk591VA6daklNXh33obyyUk9F5LwmkiwIhGYf6SIisgisstQQqiw8Jw+vVku1U3ZILThGw+MTT0PxPucVZ61Rvt/Gue9+YbjY7f0vZjP1PjwP57HJCb8wgfXHR/EC/NgDKBwzcY/XZUXbgj5qb4ECpjvRZkr7c0nj27yO5T+M2CLhY/hIg2vkt35TW0QhVsUqs93VJDyLll2hVaULsFE6WI9/NInaw/k3+4KvBfQKdPpSye53hvumwO9YjbllGGFm6nMwf75GJCtvmT+Pu+6v0Pj+8o9w+en/KllZKrf90+053gcLI9IIpkEnTFL8NhKQvRoQ+fK/fVxMv14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVLMuHnhpVjxA5/Q4iDW4eMl14drl7MXskBfhSoSrfM=;
 b=T23YecgT87921+o/XzcMrFSjPtA1fexvkWSM3A/rCfpPK3hEfdt5XFDBHnJCpzzuzSkk7gXKAKViheqwnJjRsg/1osrWSETA+XYjuHmeBvEQ6pCNR+0xo6R2ASQWGvcxbP1tn/t4ZlnAHp91zEBX6dv8k13Aw2br3OaBQgpM48n8cqPnA5PR0K949iHwfNWIAyfCCF8mc9NhSalL/UFGlkNbisTjU+c4PJ04xoBVRXt5mo3YTViqej/fx3QHqb0cvZGchWC+eN3sIPG7tNKVDiUk6OOYk1lWcQdMyoIohjtSthIPYw/kVAhZ3xPosivaJiU8cqgeOxvZ49CSyqP3mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7321.namprd11.prod.outlook.com (2603:10b6:610:150::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 15:51:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 15:51:31 +0000
Date: Fri, 21 Jul 2023 15:50:42 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZLqpUr90JRk4fQIR@DUT025-TGLU.fm.intel.com>
References: <20230721132030.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230721132030.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:a03:333::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a47710-6c3b-49e6-b554-08db8a025a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z0EbJjGCsGpiANffhRLDvfuUzPlIVtiUz7ToZBDYig6hIrQvRA7ANRBx9aC+mOfmOxvZ3jBpqc1TzOi3Ed8IXQubebR1ve31K/gKK1KPkCLkPdepb3BUSZ0/WSRP8X8lkikxcF0fhFmRRbb4uyOaBuXk9c0cCaRKNorPwON/hAgOVYhrYin0TteGAnR4sG7uBNJKzY5NPZt83Vj43D+Emj9RcXTtcSKPekatCnN1uDMsoj9987c7uN3hCviSZ7iLmbpZvWegWl007RewJxsmNVL+tjMXYM9HPpJIpzbTt7VMJUwt9SdG09ehNfj/BO1E73UrWVrnR33KhiDr8PJpaDDimk8WhcOb8YNP1iu/YJ8zh0iEc0MuigGEG4kdOOMYZzguAkblct1R2iKOF9Z6dl9sKCSo1tRW4Sc1hXxEp72AFTzUKXDBYznLo6HDM/WEZlImRLG0et9NJ54fY0I+WJJ/432mvR27vwyWJpGVfKNnY0crSVGM2lw3+NfdmEyjrQm/RJlJPzO79vDW273XjQ3/5jzZ43nvu0i8xRD6vFwyH4htqEIkChiZQN9nFkED
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199021)(186003)(6506007)(478600001)(26005)(66476007)(66946007)(6636002)(4326008)(316002)(41300700001)(66556008)(86362001)(6862004)(8936002)(8676002)(6666004)(6512007)(6486002)(44832011)(5660300002)(66899021)(82960400001)(83380400001)(2906002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rs6ejU+PtqM02n96ddKuK6XMxrtfL89Q7oQy4vXvAGE4J3RnMuWQMXopMPge?=
 =?us-ascii?Q?UqqEoc4kkJF/OsmOjEbOvnRinfrbMsL1YdBtOPAe1XE9GL3w17TWuGq5aJc1?=
 =?us-ascii?Q?ITVAcxjJUTYj6RQmKqvUKiowiBdeX3uvbXSyYWjHN3a8ftBoo1YKoSFw3FRj?=
 =?us-ascii?Q?rD6lYLUB37QE63rtvwMVDQ1ynavk5VwL6dcOKcyysKpz/y2yfYfXDYt66+vs?=
 =?us-ascii?Q?EgAvGY7Fi3FDIdt1AnScW1xO3nETTyYw99YVK4R48WYmu1MUigN91Szagi21?=
 =?us-ascii?Q?b9getwlmrovlOkfDcX5+NCblPG/w3gbPtzfuyi1OkgosC7O9sWTQlA5suL9S?=
 =?us-ascii?Q?NBqNiGrwXVkg1S+QvdvdFmWo2iTeqWeJGJd2jXqSTLBr6Es1asXOZFJ5eXeZ?=
 =?us-ascii?Q?LlddxOmjgWf2l0tb3PLJRMq0tNyEl7AIlZtEmzxDtgboorbr2FsvK/iQDuUV?=
 =?us-ascii?Q?4xDxUyg0X2vjzGs+H88YaUzu+SCYe0NIy53dJPt2jkZrlu4zRo3AEvLOvect?=
 =?us-ascii?Q?alYsFmEeMz8HBslxaHyNvLYzKM/QTl2OpUznrii68ScyqmEWGKeKeS3H9ZaC?=
 =?us-ascii?Q?ccBa/0O9EL3uCwdAsiuF8iG+fYgnLEB9QP8H6FLkvYZuMjGazEP02sMXTn8J?=
 =?us-ascii?Q?fgvi9x5LmbhZJDQ3ju10gRG+ArxUv/eSz1aBuQf0lT9JcSpGhshvnzKqnGCS?=
 =?us-ascii?Q?VaquC+6fYilhCj+DInwY3U2HljguJwGzamw+zgYYRPaKFBap+r1ztblFUaYG?=
 =?us-ascii?Q?xIkGnp5TkmrE0jzG4SFBB0HxIT+/psuLhp1MD8MH/ROnTCjxUkh4HG6rpPNg?=
 =?us-ascii?Q?wuAGXtz1dPvoZtJT4bexsh8JBkPRFSMl75XkbmD+w6Jq9pp8SxnQ+q97DOrP?=
 =?us-ascii?Q?gIMsOUCn9gRu/TvF+IsddXyqRVkykZRLDu9cQ6fu0Kms65zDhj+wSMmsmkza?=
 =?us-ascii?Q?BFJHKbXOq3dzjYHhPILSRp0cvE1QpqQ3q/Air5kl+n5XVwuKCoIwegrXB5YD?=
 =?us-ascii?Q?FRpCPhCw0GRlilFlPISH68DU3smm5G8B1PZW5WtMm26hwrFblvqXehmTF9om?=
 =?us-ascii?Q?/kHue3Ugv8uPVcuST4ZEr7rAarWoMfB7MbHoUh5JWaEMUx0wVOjyX81yMRpo?=
 =?us-ascii?Q?MJqepVOyCQG+UmobRNNmFYoJDqQjyLjTLpvE229b0vZgwnqf3RvKOgW3gFTH?=
 =?us-ascii?Q?A8CISJHp6pPXYUzrLbR/5ctU96YQoc6EcDjwzKx2uUKmvCxRMZ4uprMf0Sw5?=
 =?us-ascii?Q?W++gtj07q+IRma8FICLCDO1LerqvmLP4JyIfpiAD4fP2/kCQRRzyjFVQFaVf?=
 =?us-ascii?Q?sxu7qOIQyZl6FoSKOEC3R4zUgCRGOsH5Kyw9iWklKLLQBURvrH4PpEKLAVzo?=
 =?us-ascii?Q?1Twj87c2muXLbpiGin14+ZHMDGGO4dBdbtZ7N4F+LKQ336VMM0egJDb8dcaz?=
 =?us-ascii?Q?hnn9sQIZMTrODq7kyXOrL0rVgtvKMziclZyBBo1Gq0woHgO5sFsCIMG6jHa2?=
 =?us-ascii?Q?C1VgVyAoQkAZK8t1Lx5NmObcdPsmPTbdWNdp/UgZghFYAQ43n4XV9usc2kgc?=
 =?us-ascii?Q?HUUM2q/9we0CxT62w4jndWaP9+mWIPiEoHe/TpYvo/ZuBpCPIMTPk+mf72nB?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a47710-6c3b-49e6-b554-08db8a025a30
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 15:51:31.2408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeF8XQEsgJ3FKjHsDFf718QpsDpx+MjLRZVNmlPQ2PNpVAofYJFnGhvjNgOLqHVQUPJtwUs7Yo/l5UAK73EoOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7321
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/1] Remove uses of BUG_ON
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

On Fri, Jul 21, 2023 at 01:20:29PM +0000, Francois Dugast wrote:
> This is a first pass on removing BUG_ON. It is replaced with a call to
> drm_err() and a return. Feedback on this is welcome before removing
> remaining uses of BUG_ON, which will require more manual and specific
> work.
> 

Personally I don't like this at all, agree the BUG_ON should be removed
but IMO we just replace these with a XE_WARN_ON that gets compiled out
of non-debug builds. I like WARN/BUG as they act more like a self
documenting assert of the codes usage plus if they get trigger we get
the call stack which usuaully help diagnosis the issue and disappear in
non-debug builds.

Let's see if the team agrees.

Matt

> For this pass, most of the changes were automated with coccinelle using:
> 
> 	@notpossible@
> 	@@
> 
> 	- XE_BUG_ON("NOT POSSIBLE");
> 	+ drm_err(&vm->xe->drm, "NOT POSSIBLE");
> 	+ return -EINVAL;
> 
> 	@e@
> 	identifier macro =~ "^XE_BUG_ON$";
> 	expression cond;
> 	@@
> 	macro(cond)
> 
> 	@script : python q@
> 	cond << e.cond;
> 	cond_expr;
> 	@@
> 	coccinelle.cond_expr = cocci.make_expr("\""+cond.replace(" ", "")+"\"");
> 
> 	@replace_in_func_return_struct@
> 	identifier e.macro;
> 	expression e.cond;
> 	expression q.cond_expr;
> 	identifier func;
> 	identifier a;
> 	@@
> 
> 	struct a *func(...) {
> 	...
> 	- macro(cond);
> 	+ if (cond) {
> 	+ drm_err(&xe->drm, cond_expr);
> 	+ return NULL;
> 	+ }
> 	...
> 	}
> 
> 	@replace_in_func_return_void@
> 	identifier e.macro;
> 	expression e.cond;
> 	expression q.cond_expr;
> 	identifier func;
> 	@@
> 
> 	void func(...) {
> 	...
> 	- macro(cond);
> 	+ if (cond) {
> 	+ drm_err(&xe->drm, cond_expr);
> 	+ return;
> 	+ }
> 	...
> 	}
> 
> 	@replace_in_func_return_other@
> 	identifier e.macro;
> 	expression e.cond;
> 	expression q.cond_expr;
> 	@@
> 
> 	- macro(cond);
> 	+ if (cond) {
> 	+ drm_err(&xe->drm, cond_expr);
> 	+ return -EINVAL;
> 	+ }
> 
> Francois Dugast (1):
>   drm/xe: Remove uses of BUG_ON
> 
>  drivers/gpu/drm/xe/xe_bo.c                  | 105 ++++++++++++----
>  drivers/gpu/drm/xe/xe_bo_evict.c            |  10 +-
>  drivers/gpu/drm/xe/xe_execlist.c            |  22 +++-
>  drivers/gpu/drm/xe/xe_force_wake.c          |  10 +-
>  drivers/gpu/drm/xe/xe_gt_clock.c            |   5 +-
>  drivers/gpu/drm/xe/xe_gt_debugfs.c          |   5 +-
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  31 ++++-
>  drivers/gpu/drm/xe/xe_guc.c                 |  32 +++--
>  drivers/gpu/drm/xe/xe_guc_ads.c             |  35 ++++--
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c        |   5 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c          |  95 +++++++++++----
>  drivers/gpu/drm/xe/xe_huc.c                 |   5 +-
>  drivers/gpu/drm/xe/xe_migrate.c             |  61 ++++++++--
>  drivers/gpu/drm/xe/xe_sched_job.c           |   9 +-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c      |  10 +-
>  drivers/gpu/drm/xe/xe_vm.c                  | 125 +++++++++++++++-----
>  drivers/gpu/drm/xe/xe_wopcm.c               |  45 +++++--
>  17 files changed, 482 insertions(+), 128 deletions(-)
> 
> -- 
> 2.34.1
> 
