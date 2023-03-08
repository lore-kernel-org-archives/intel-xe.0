Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E6CC678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 22:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F8A10E08D;
	Wed,  8 Mar 2023 22:44:05 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4302B10E08D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 22:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678315442; x=1709851442;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eg0LEtnU2Lf9OStbdT92jPkLsFS6lkJ/DkVzdNTY9y0=;
 b=myUxadOZ4zAEGQL+GXj+l739beqKTaIxSPxpL107qvSWGjmaPEUymgK+
 E/drcPQTKJ9WVBeCde9crS4wpnqcQoE/CiJ9m+tZVoTeT5Fe/WJSYnkin
 f8NsKtLMXWoXtiH4AoZCiHKzJmfa9MW7tpgsSgRwLlV/cMmzrYcsCsqfP
 4MCeaJhzZ8dsMNaJcGyrQQQPcuVG5YJoAjYchEl2TroCCbDeeqzElgq+s
 CYTTFZuSgE3L8YUDUVwwrFR4wpv2trMJTFLX0XVCbun5qaODNmYjAipUR
 HKRYkXFMSOrr+L4/D8kLsG2sOCXDNIQwF71Q6PgPXEbm1Totzr0lNOu1k g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="315952820"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="315952820"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:44:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="1006514062"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="1006514062"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 08 Mar 2023 14:44:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:44:01 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:44:01 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:44:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0r6WT8/EpFeqwIxh2EEmRChk4tfWxI4vKIZ20RaBfv2ZGUKjZyOTIRFm9enH+jCF7m1/13RFZygqWgMXMqfoDONgMQNn6DJYGYJjLi0Qq/FmV9oWzFEpGqOGlV5H3rsCwFhXas2b9aoAL4I10JIoW/LwjBw7wIxsZ/NFthUXdvN9XLGzdqu8fROSDUk4+trikbPZ7G29hMxOYKO7Q6R2lkLngct2/ScVldTmnBC1fpyKGLxNMjVXHaj4A+155zk48t3hJocVhZX9zlHWx/vczzgeevESqImzeUWKZFXA+VZIZl5YcUO6ORYoR6OSK/mLiS1x0gbAt6J79F0OYSlbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qoOJJoSrJ3wldDKzrUFMHwJKh4ulTex2LMWBSLntleo=;
 b=HQgL4w5vbSjMHhCGETS02ESUHcXTAOtBP8++egwFMo0TlT5JfNkRLbrHm/MlYEfieCLyNVLRncAbHlzk3qDb2quTMOrWjcpRaMX11E++yuEIKiqMuGkqQV2zLABmiDIZ08z3GWIX6WRTot67J1C3z0AHljcnqD4O3F8fi2XHzHMU8UMJsDMV4V4BR+AYzitr+yw4+kZh9WyAT5195tiYQt+QHLor9d8dl6dumsZhus8xhf7LmAbKZYDrYFhcrfdpvIFPxyiRdojDEPw9PyFUQtQ0wJSRdjiLuFzmOPc1I0lNOVlnhSMdPzxcsN4MdOn+dHIWzWlQ/1GMbeusHeBxrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH0PR11MB5562.namprd11.prod.outlook.com (2603:10b6:610:d5::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.17; Wed, 8 Mar 2023 22:43:58 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 22:43:58 +0000
Date: Wed, 8 Mar 2023 14:43:55 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308224355.GH1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-5-lucas.demarchi@intel.com>
 <20230308215338.GY1543793@mdroper-desk1.amr.corp.intel.com>
 <20230308221648.ylc5hxuqe2ymuvke@ldmartin-desk2.lan>
 <20230308222017.z547bjozgzniypjo@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230308222017.z547bjozgzniypjo@ldmartin-desk2.lan>
X-ClientProxiedBy: SJ0PR13CA0094.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::9) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH0PR11MB5562:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a7b07b-4123-4508-f676-08db20269aee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W+HyquOpfnRv5ZtCTBUJpg43D3dYg0HSHfuAEpB8r36MvArftUtqVrBnp9SgyLBeFwyyJ2ALB08dedhwtbwg3WJ0lVwCZ5o7UWf3Z6P9dkwI+/HQiyfkLY781HKpRBhcCQslDxZORQVuIEmEawJ2fY8ZD2jINV14phPddef8Ea0L7kFSuRmuVtWk3nPoxz6BDTF2g8/NmDh9FzbwmZzN8HvOytTFo93AwbZxvsyX9f4bVwH7S06x/uyweYVMEQ9TLFRkF2bdZQ8lXlm22za6aMEQFiN1QK1kRUwRrJAhpaSpmwxcIkrPXAfzCO+XitggDf3O5nrGC3/arYENbJMA7VRbr1wmF70Rljlp3R+a1qI1OtMWy/4qsiLqHb/KT+tFx/saiRwzelzAf/HHyUt/GpEd0kIY52QDzjSlrcTfs7k1F0KUGqFU79Bbxcp/PUwjql8cYipFB+anFwN8532W2pKA1B2HCd5kyIb+JN3N/f/aQkOaimiJ3ZRvGxycAyl6cfbrMfdfeIhZax6MGP8akRmiON3bpoSqwk2M7ZqMCyyq8hxH1JbGHnrTHGlVNe/gszzz1Ev4JXO5hzqSwOnzHMSvACLN1R6BDic7a20uOopTvG25U9z/TMXC2Fh38w6NDZj6k1LL06Aw2tLOcjuthA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199018)(26005)(8936002)(6862004)(5660300002)(6506007)(6666004)(82960400001)(38100700002)(6512007)(83380400001)(186003)(6636002)(86362001)(316002)(1076003)(66556008)(41300700001)(33656002)(8676002)(66476007)(6486002)(478600001)(66946007)(2906002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5aOZOyS5Qp5/y6lVKmKfGM2i13+IrhCNyZ36J2y8wdLFoOEMQeuZghtnk9d4?=
 =?us-ascii?Q?CaZlGsnyt5A0BgXp+6pdeJ8oBEoaVlaj/UE9qM29nWWuM0lfwDCkGHUmzCiO?=
 =?us-ascii?Q?1OqOhPPA9iZruVUWXVAKCTOqHuBMBZqg6pWNJ57AQIjC6DpNKxoDsG8jeFnb?=
 =?us-ascii?Q?ZSQ0Ypz4mrkSa55i6t1T41ZNyvbDMU0DWIQLr5uSQ6OJrAcrUjmaWXQQHb3j?=
 =?us-ascii?Q?nxMSjE8fY0IBuJpi1RP2FIeQqYvqRHLOeOMU7Rnt/QQUJx6YhkFoFMKmq1wQ?=
 =?us-ascii?Q?Yu6KVdRZauoDhbvBYsv2oK8XDMc5O41UimS2ZkCAhuhEyR2ujK7DlKypC6Cc?=
 =?us-ascii?Q?e7iNcljw7B/kideDjyPUDM7dJLXRMaETTJHqTgb9shPHHPMYzUPrgUVdgboQ?=
 =?us-ascii?Q?T+Xu3DxBElg3IgaiVS3mzHysdJFPZel14/rh+2TRuloEaaFFcK6XnKl+Qq/F?=
 =?us-ascii?Q?lp0lEiKznHGfTtULgSqUXFV/UdYW7QsjX4O4BNeOskKQAnNXHqdVJV7PNPgE?=
 =?us-ascii?Q?kfEZk7QW3W6kCSdw2/vH+wedi9XW2ZnxhMsVbvgwRGYAUDFB9pOnfTFv7in6?=
 =?us-ascii?Q?ihrhhxcvxHFD34+4ne6+MgTHJojcllUStZ9RGnpRq5GmTXnvG5b4L1X03zhn?=
 =?us-ascii?Q?7UyXN9UL75hG4xFI5GKhyBqPqhi5tqMgsjWAQgRx3Dtx+ymbkLrPrBjszVca?=
 =?us-ascii?Q?/MCzTHa7tIbD8a78UQJnMABYrZGEQ8VG5Gx87WeszbptatXRCO5WbX5VWENn?=
 =?us-ascii?Q?4mC7aeSJcDw+Gzo/up9eKYVTY6lRimvcDkLftw+s/0bgFN6qi/pTQeoEothL?=
 =?us-ascii?Q?CvzmspHLLBwvF5sOsLLl0V55kLZCLwCGTCHgQdflClYiBl62ujar1fJvXIzx?=
 =?us-ascii?Q?QGu6XIc88pfrr0jJxxTYjk216WefUrn7Uzp8B0cNsMWiNubNXnYlU/92DJvx?=
 =?us-ascii?Q?AUhoM4Re81Nom2KeSTcpLtALxE+TUI+2CVMQ2iwGmrBaotfvSMUknBre+TfC?=
 =?us-ascii?Q?9k0QZtzB2bkBUeHTj9iclKHRytwycMfN4Wle2ZfljUmDkb/NQeT3fIdCv03a?=
 =?us-ascii?Q?VjGO9XvybN7dLdhHycEKemvoToA2NhBQhEBCOcHbGkRW+t1+8TjFl8Y0C+bp?=
 =?us-ascii?Q?cH1wd3jRvLPBnT079jXL8FFWhPExcAyFKOstsJ1cbTGxRRJVWAwEC+G67en7?=
 =?us-ascii?Q?5UEJRAh3+zk1AS2t5PfB+l9Yj1b9BUCLTEj9yQGwut8nh7j9g8Wjy2QM9lDU?=
 =?us-ascii?Q?UDk+008lWIU/hy+7ZdxTJ+HWGapQAhvGDmo6qVtcbx7dRf4TxOyQVWgVS+I8?=
 =?us-ascii?Q?bx1LW5FhMgLG0qQxuIu0WfgKpbWuj3AIT/Mvj3KleGluWFAQYuO4q1/+ke32?=
 =?us-ascii?Q?0XUkepNo7nPF8mudVwpduqR7UezamKDsV70L6oT5yFgJAZIvK1bPE6OPgBHY?=
 =?us-ascii?Q?RzFtn66J/1tXO2nsFPZzIlY2Yli/c9IrcetRYeeqx4d7wnHaOSrUPkA0B/u5?=
 =?us-ascii?Q?zdZQlIVO8fNaXoIa6wJUU+FIKcCvVFnzZSb/LcXFSnLacxQKPGYkQo7L/+UI?=
 =?us-ascii?Q?CSRn3TxRaNEG4bwtQ4jvJvpDBl5GcQOhXYr7xSqiFJoadTdqurFrQuVHR4kH?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a7b07b-4123-4508-f676-08db20269aee
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 22:43:58.4661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdBzFnj0fm7Eq0gRft87HAFFJ6wja8f/6RRg+93E3FmQUOtgsJKNXhgp5ImCu/sHerwLsMDEEyCjJl4x51HVBENDaAn2wbHq6cDqxSpHsdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5562
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/19] drm/xe: Add helper to get dss per group
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

On Wed, Mar 08, 2023 at 02:20:17PM -0800, Lucas De Marchi wrote:
> On Wed, Mar 08, 2023 at 02:16:48PM -0800, Lucas De Marchi wrote:
> > On Wed, Mar 08, 2023 at 01:53:38PM -0800, Matt Roper wrote:
> > > On Tue, Mar 07, 2023 at 01:24:31AM -0800, Lucas De Marchi wrote:
> > > > This is already used in intel_gt_mcr and will be used in workarounds.
> > > > Add helpers so the platform-dependency is in a single place.
> > > > 
> > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_gt_mcr.c      | 2 +-
> > > > drivers/gpu/drm/xe/xe_gt_topology.c | 6 ++++++
> > > > drivers/gpu/drm/xe/xe_gt_topology.h | 3 +++
> > > > 3 files changed, 10 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > > index a42061c4b9d2..694a79b40ec0 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > > @@ -223,7 +223,7 @@ static void init_steering_dss(struct xe_gt *gt)
> > > > {
> > > > 	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
> > > > 			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
> > > > -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> > > > +	unsigned int dss_per_grp = xe_gt_topology_get_dss_per_group(gt);
> > > > 
> > > > 	gt->steering[DSS].group_target = dss / dss_per_grp;
> > > > 	gt->steering[DSS].instance_target = dss % dss_per_grp;
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> > > > index 967f2349c67a..9fe06a46a400 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> > > > @@ -103,6 +103,12 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
> > > > 
> > > > }
> > > > 
> > > > +unsigned int
> > > > +xe_gt_topology_get_dss_per_group(struct xe_gt *gt)
> > > 
> > > When this shows up as a general interface, it leaves me wondering what a
> > > "group" is.  The rules for DSS steering happen to use gslices on Xe_HP
> > > platforms and cslices on Xe_HPC platforms, but that's just the
> > > platform-specific rules of steering and doesn't automatically translate
> > > into which type of slice would be appropriate to use as a grouping
> > > elsewhere in the driver.
> > 
> > humn... maybe I myself didn't understand the group meaning here.
> > is group a generic term for cslice/gslice?
> 
> btw the term "group" is already used in e.g. xe_dss_mask_group_ffs()
> exported in drivers/gpu/drm/xe/xe_gt_topology.h

Right, but that's just working on an arbitrary grouping of bits (of any
size).  The definition of "group" in that case is explicitly provided by
the caller via parameters; the function itself doesn't decide what a
group is.


Matt

> 
> Lucas De Marchi
> 
> > 
> > > 
> > > I don't see this new function being used yet in the other patches of
> > > this series, so I'm not sure exactly which workaround(s) plan to re-use
> > 
> > it was supposed to be
> > "[PATCH 07/19] drm/xe/rtp: Add match helper for gslice fused off", but
> > then I forgot to replace the hardcoded
> > `gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;` by a call to this
> > function.
> > 
> > 
> > Lucas De Marchi
> > 
> > > it.  But likely we at least need some kind of clarifying rename for this
> > > function, otherwise it's probably going to get re-used incorrectly
> > > elsewhere in the driver.
> > > 
> > > 
> > > Matt
> > > 
> > > > +{
> > > > +	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> > > > +}
> > > > +
> > > > /*
> > > >  * Used to obtain the index of the first DSS.  Can start searching from the
> > > >  * beginning of a specific dss group (e.g., gslice, cslice, etc.) if
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> > > > index 2375f005e0c8..cf8f75a4c7dd 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> > > > @@ -14,6 +14,9 @@ void xe_gt_topology_init(struct xe_gt *gt);
> > > > 
> > > > void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
> > > > 
> > > > +unsigned int
> > > > +xe_gt_topology_get_dss_per_group(struct xe_gt *gt);
> > > > +
> > > > unsigned int
> > > > xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
> > > > 
> > > > --
> > > > 2.39.0
> > > > 
> > > 
> > > -- 
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
