Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4045C61DA4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 18:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95838825B;
	Thu,  9 Mar 2023 18:26:01 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839E68911A
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 18:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678386359; x=1709922359;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r/c536el4NijEFQ0QqYyYvvF9VwahMc4L2oL8mkfQaI=;
 b=djRiJDLm3gkRK2XXMQMk75jkv74OtaKr14Q7pBmfCotqQ3sYsd2Calru
 G+8rbNp8RPLN5OS7M9mBLMA3i8iL9a6pWK6/fwXkCEhYaqXKRMmM5yTdz
 t6PyRiGlAF8igxKhZT3hOkASxquKaQeHYFUbc9fYseJNL53X/TuD//P3G
 YDs055GIkQEVldbUq3B2k4xQYeK0NH47qhl0TCvCuznJv7weG0Zw+0qBn
 mFl7Lt+1xDkNRCtfo11LD/rCR/jUGqD8+JtZ266ViqX5TnkyMtF7Zauw8
 BsR1B9kfZ5TvOa8Za+zLuexHvNWR6gr/DYbSYXhAGjeLwva64IaqTa/LZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="422798080"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="422798080"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 10:25:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="741659609"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="741659609"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 09 Mar 2023 10:25:58 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 10:25:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 10:25:57 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 10:25:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAIeUhKcYri3jlDgcsy1+jEMuGvDzF7uuEAFti01okE35St5GQ9TmVNF3s2us3R4hfG+4vnjc16LtJ6Ep4nlwEP6o7aB4S0MosshbU4yUwAryuaAbNkEhPTUoFvSI0ILU0w3CSUFtAWl6IPVJAis+71NS8lHNwk9iLJ2TRKPvKmQ7ejnvlU6sPo12J3JRzo403XDHXZoRUW8EyWisIpyE0UWRSza0oF+R7JA9G46stVlRRT7KM52WAeY6Lc1bQoVZCeiMbNEMd3eE8ctkmuZ7g4hjD8ZsLSndDCwJhTOk/bx0QLl3+nDpiB8G6AaUQ3rmFZ/j1U5IrhkBIQ0KbsMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgDPYR8McgRhTGXLFio3OtTYZgUvsRzcSuASVDoqh4k=;
 b=F3GDsxCOwjVRAYg860czs167VMGCngtAIsRiO4A0wYm29YCSvwWoVnZe6JeEM3omw1fNXy+XnonBoTNAq9RqisY+NkrzjmEx78tCn7p/qt9ilvwvSqyeWYPmJdsKuFZc2PavmveTBzTGakd3YOIv1Gpd12P735UNjJPNdomCKm8x/pfHBEVTJf6/8nSNQVeSFMWbnQVY893+cn/ruSTt/5/IhPMH8x713pKWRsrnGBp6DdtWnUoXrC4zDOy13RJq6lyqSJ3cffV8N/vbmudXryZP1xsVoMp0MTm+lIOFkGANiCKAg6fSyImjBUZcpLfUk0/immAw+T7U0/pKgDslpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB5189.namprd11.prod.outlook.com (2603:10b6:510:3d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.29; Thu, 9 Mar 2023 18:25:50 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 18:25:47 +0000
Date: Thu, 9 Mar 2023 10:25:44 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230309182544.GS1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-5-lucas.demarchi@intel.com>
 <20230308215338.GY1543793@mdroper-desk1.amr.corp.intel.com>
 <20230308221648.ylc5hxuqe2ymuvke@ldmartin-desk2.lan>
 <20230308222017.z547bjozgzniypjo@ldmartin-desk2.lan>
 <20230308224355.GH1543793@mdroper-desk1.amr.corp.intel.com>
 <20230309045107.kayv63tfzq6i4o2b@ldmartin-desk2.lan>
 <20230309160606.GR1543793@mdroper-desk1.amr.corp.intel.com>
 <20230309180410.e3i5y3hfs6xnv6ze@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230309180410.e3i5y3hfs6xnv6ze@ldmartin-desk2.lan>
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e451d7f-f88a-4929-c215-08db20cbb424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qCHmWk4WAShNZ0AiNYlPqhl/DK1RCCgqVE7+qbSRvLKQOQl2se5rxVzIrKmyq1XcMFXN4TdMCqScrcMmmqH/jG/GcJFB8aiMfatUEnCXV/8BkrqYr6EuVoirUV6KnsmYcWpXz6tV4m+l2n8tdqIeNBRru+GJX1vunkN3yhUrgAn6BZIbsEx3n7ysMP3dc6DGxQcg1m5AceW/REYweicrApfY6RivNXFBH1IM/8xobtLFcTDykdJYBZGZbW8NJlt+y3x6a79tmTqHkAOMMNrW/i5vucD8Fy+d2SvgaOejmUwU7y9BFzIwLH/ZOxAP2jnLMHm0Li62Ba6vcrbkToq9uzeTHDOoX6P+tnrmaOHc4SoJbJYhPGghW9a5cyA8uLqc41f3MQ0qeO/pZeuV0ZRuQOR+imToBgVk1lwHRIrwmG8Urbqes7FhN7wiDlKd10f4XlWQTJhp3AZF+Z6ldB8MEqEwOlvRuQJhl69SqBSdqDV81lcqaCLiUAAFXguaTPAkWupWHpJsuVJ9GZSxw7xAYI5t1vhTtHERhyv1I93RvVY9sYmLyQQ+/5RzeW057Clu9424t5/8XrvHWmHtBDikqr+UPlwO9urGa0drJSvWIivVVuURidopp15LiJhTIhkuzIU/y6bQbW1MGhg9IwfBfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199018)(33656002)(316002)(6636002)(6486002)(5660300002)(6862004)(478600001)(4326008)(8936002)(66946007)(8676002)(66556008)(2906002)(66476007)(41300700001)(38100700002)(82960400001)(1076003)(26005)(6512007)(186003)(83380400001)(6506007)(6666004)(86362001)(66899018);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?97ua361XMpikasqJRmmKCx61el/KQbz2mH8stcc6hSEUrXoI722DPioR1fqD?=
 =?us-ascii?Q?EMDIlBrR4LtlrPOmFsyTe47uYxkrOQATSHMPkerjMzBVHILgXBQh3Kqnq8p/?=
 =?us-ascii?Q?nixvwKgqYkzCCPaHLL1bicaEZNvF4tcuSXx2/sAUkKZRhE9bTm0I8T0dKpWT?=
 =?us-ascii?Q?S0zDm3jD6ymm3niIO2jAndFhosbBMreqoEZrWMKsJFkJs1UuuzLoOkkR9ImL?=
 =?us-ascii?Q?xd4YnwNVReqPJsGF2Rn01wINc5kd6hRKxLBtVYR30drEixukOtr41wHDiFvv?=
 =?us-ascii?Q?z2RJWLoDaMvs2hdX+iuiPN8jyUxkW3wjZo96z6XnqeTp/5x+Ri0A023oyAwN?=
 =?us-ascii?Q?95povIFzED/cWaGTKM2ZAL/OQpkSKR9cjeXBmfS4dLtb/PCPnVxC29RCwYTO?=
 =?us-ascii?Q?Nvx/PslAw7yOUuac/lXbYpYujR6ELFsXC7bEFJL/ChcC8Sj2iaN53zmDmq8G?=
 =?us-ascii?Q?VGa+VuCQlheglgG+5gsm1VEEYd81EFg8sHK+FMVin1rRwjvbILMhiOg7RKPM?=
 =?us-ascii?Q?+eJK42HlALVD44y0+z4mN25229m5NFxbc7BElx3Ob6oyE9Gy7Dt51gglEXIN?=
 =?us-ascii?Q?0Ki0d7YsfxnuTk/InlO/hk6MoDu5UAgkzz8E7PyTTDIDH+1VSfBe7t5eEsdp?=
 =?us-ascii?Q?FcFYWcHLfifTEXyT7YOUa4QdWw7K920TmK2DB41CTuiEPvTHBQBqvP5Yvs2Y?=
 =?us-ascii?Q?/Y3/dEdok+01CMR1g4QJ2WyeXZIm3G0r7dRZpMabU3xN17EM+nbpaa97dLuK?=
 =?us-ascii?Q?3vukex5isPq1yYZIxh9Zn68kBluV1SKxWHfFdQWnz6QeTPQnbQSK9tohWt7m?=
 =?us-ascii?Q?zlKIKl+idstWphVN1TSMQoHK40S+Ir/V2YGURi7ygHo9BdyheM6Nzydh1C/r?=
 =?us-ascii?Q?/sr1Eiv8HpD90vCLUV0WzxNBRu6Ml8wWcJyU+Xfb0j0l7IsINj7PDCBDGCam?=
 =?us-ascii?Q?heXx8XoDBVjgP4SWJ+4+YKbw9qM1GJQybcpv+dzPQfSEBOfVz+xtaXCPCx0/?=
 =?us-ascii?Q?cvkhgkGktBhElsUZzCmGhpgSpGv9QJGk51eW7IedCNg0lsMUZQxdJnwAmxYv?=
 =?us-ascii?Q?D56HoRAV/ENhSNfnRu1EQQ4fy8V5c8KILIJbsO1bTUzZN7dUAxhAjLgxbQDe?=
 =?us-ascii?Q?ii21HJG6XYy0LmFKAuLqcZbJM6gJHyP1Jdi/FfesxUwbWHEBkio3jjx400p2?=
 =?us-ascii?Q?06MmOjc3mPCxS8QqbAz6colRpzooGFT34CYd5ae8eUL8WRrUjyGOvnw3Dfkp?=
 =?us-ascii?Q?eQWl/YgOiurGwEdUYPVYAjx0X0ftBObFrdPyxU7+H6NRabsUDdGBQJxGVtmk?=
 =?us-ascii?Q?cHdInmhwMbsFNvLDip5FGQHcNCoFrM3qKFr36Miwg0H6VUY7s/Alpx3NccPj?=
 =?us-ascii?Q?Pi2D5kTD4UUd+cDlZzrWLkpc4oLAsYkQm5MPE7KW/olIfBzSOyhbq4vjJ/Rx?=
 =?us-ascii?Q?/rs3e2HkzJYVPmo/+pdMRNgv3N1Qv775VcRsSz2rhmbQ6I/X7sCKeR0KuBwP?=
 =?us-ascii?Q?1AQDFGTH8596gXI6Xgnb4b9Y8dlzgK2pgTpNc8AOhFh1Rq6oAzRSKLmkiYT7?=
 =?us-ascii?Q?YE6JAo6/eteFMlv9NRJ9etVOMwCned9nUy9ijlHYuQKtERLvs0Pt3JrOKdpL?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e451d7f-f88a-4929-c215-08db20cbb424
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 18:25:47.8002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RaJsOIrUiwai4gnPnX/H/vqM+ebTP45U6opbc2O32zoN1IpFNiog93tWRexny5L8d0FXmwNDTovwu+KnH4jRmtHZH1/Bi1Kz2DrdM1Qn00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5189
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

On Thu, Mar 09, 2023 at 10:04:10AM -0800, Lucas De Marchi wrote:
> On Thu, Mar 09, 2023 at 08:06:06AM -0800, Matt Roper wrote:
> > On Wed, Mar 08, 2023 at 08:51:07PM -0800, Lucas De Marchi wrote:
> > > On Wed, Mar 08, 2023 at 02:43:55PM -0800, Matt Roper wrote:
> > > > On Wed, Mar 08, 2023 at 02:20:17PM -0800, Lucas De Marchi wrote:
> > > > > On Wed, Mar 08, 2023 at 02:16:48PM -0800, Lucas De Marchi wrote:
> > > > > > On Wed, Mar 08, 2023 at 01:53:38PM -0800, Matt Roper wrote:
> > > > > > > On Tue, Mar 07, 2023 at 01:24:31AM -0800, Lucas De Marchi wrote:
> > > > > > > > This is already used in intel_gt_mcr and will be used in workarounds.
> > > > > > > > Add helpers so the platform-dependency is in a single place.
> > > > > > > >
> > > > > > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > > > ---
> > > > > > > > drivers/gpu/drm/xe/xe_gt_mcr.c      | 2 +-
> > > > > > > > drivers/gpu/drm/xe/xe_gt_topology.c | 6 ++++++
> > > > > > > > drivers/gpu/drm/xe/xe_gt_topology.h | 3 +++
> > > > > > > > 3 files changed, 10 insertions(+), 1 deletion(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > > > > > > index a42061c4b9d2..694a79b40ec0 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > > > > > > @@ -223,7 +223,7 @@ static void init_steering_dss(struct xe_gt *gt)
> > > > > > > > {
> > > > > > > > 	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
> > > > > > > > 			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
> > > > > > > > -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> > > > > > > > +	unsigned int dss_per_grp = xe_gt_topology_get_dss_per_group(gt);
> > > > > > > >
> > > > > > > > 	gt->steering[DSS].group_target = dss / dss_per_grp;
> > > > > > > > 	gt->steering[DSS].instance_target = dss % dss_per_grp;
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> > > > > > > > index 967f2349c67a..9fe06a46a400 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> > > > > > > > @@ -103,6 +103,12 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
> > > > > > > >
> > > > > > > > }
> > > > > > > >
> > > > > > > > +unsigned int
> > > > > > > > +xe_gt_topology_get_dss_per_group(struct xe_gt *gt)
> > > > > > >
> > > > > > > When this shows up as a general interface, it leaves me wondering what a
> > > > > > > "group" is.  The rules for DSS steering happen to use gslices on Xe_HP
> > > > > > > platforms and cslices on Xe_HPC platforms, but that's just the
> > > > > > > platform-specific rules of steering and doesn't automatically translate
> > > > > > > into which type of slice would be appropriate to use as a grouping
> > > > > > > elsewhere in the driver.
> > > > > >
> > > > > > humn... maybe I myself didn't understand the group meaning here.
> > > > > > is group a generic term for cslice/gslice?
> > > > >
> > > > > btw the term "group" is already used in e.g. xe_dss_mask_group_ffs()
> > > > > exported in drivers/gpu/drm/xe/xe_gt_topology.h
> > > >
> > > > Right, but that's just working on an arbitrary grouping of bits (of any
> > > > size).  The definition of "group" in that case is explicitly provided by
> > > > the caller via parameters; the function itself doesn't decide what a
> > > > group is.
> > > 
> > > 
> > > so.. do you think documentation for what this is should be provided and
> > > be sufficient? Otherwise, if you prefer not to expose this, how should
> > > we implement xe_rtp_match_first_gslice_fused_off()? Just hardcode it as
> > > 4?  I was trying to avoid the word "slice" so I used the word group as
> > 
> > Hardcoding as 4 sounds fine to me since that's true for all current
> > platforms and at least the next few upcoming platforms as well.
> > 
> > > it is used around this code. Maybe I shouldn't.
> > > 
> > > What about the following?
> > > 
> > >  /**
> > >   * xe_gt_topology_get_dss_per_slice - Get number of dss per slice
> > 
> > "Slice" is also ambiguous since we have gslices, cslices, mslices, and
> > bslices these days that are all related to different subsets of the DSS
> > pool and that can all potentially be used in different areas of the
> > driver.  If we're making a function specifically for gslices, then it
> > should state that; if we're making a general function that can be used
> > with anything, then it needs to take parameters that describe what type
> > of DSS grouping we want to use.
> > 
> > Unfortunately the bspec still uses the term "slice" in a couple places
> > without specifying which of the types of slices it's dealing with, so
> > you have to read between the lines a bit.  I remember that leading to a
> > lot of confusion during early xehpsdv bringup where different sets of
> > hardware architects were arguing about "slices" and didn't realize that
> > some of them were talking about gslices while others were talking about
> > cslices.
> 
> I think the 4 hardcoded is worse than slice being an abstraction for
> gslice/cslice/mslice/bslice depending on the context. The reason to have

My point is that with the current function signature (which only passes
a gt structure), it doesn't know what the context is.  It knows which
platform you're on, but it doesn't know which of that platform's
multiple slice types you're asking about.  On PVC it can infer that the
caller isn't asking about gslices since there's simply no geometry on
that platform, but it's still unclear whether they want the numbers
related to cslice, bslice, or mslice.  On DG2 or MTL the hardware
doesn't have bslices, but the function still can't determine whether the
caller was asking about gslices, cslices, or mslices without more
information.

Basically, if you want a single function for this, you'd probably need
to add an extra parameter that passes a slice type enum so that it knows
which way of chopping up the DSS pool is the one you're asking about.

> just one xe_gt_topology_get_dss_per_slice would be the one below
> 
> > 
> > 
> > Matt
> > 
> > >   * @gt: ...
> > >   *
> > >   * Each slice in the GT contains up to a fixed number of DSS. This
> > >   * can be used when the ``g_dss_mask`` / ``c_dss_mask`` saved needs
> > >   * to be interpreted on a per-slice basis.
> 
> ^ here. Because for the current platforms they are the same.
> we expose g_dss_mask and c_dss_mask at the platform info level, but we
> don't expose how they can be grouped. This leads to additional platform
> checks in different places rather than the one place we can have a
> better understanding, the xe_gt_topology.c file.
> 
> If I hardcode the 4 in that function. We will still have:
> 
> 	drivers/gpu/drm/xe/xe_gt_mcr.c:
> 	init_steering_dss() {
> 		unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;

To be clear, the condition here is because the MCR rules are different
on PVC than they are on other platforms.  The size of slices stayed
exactly the same as they've always been (cslices are 8 DSS on all
platforms so far, gslices are 4 DSS on all platforms so far).
These could just be defines

        #define NUM_DSS_PER_GSLICE   4
        #define NUM_DSS_PER_CSLICE   8

The fact that steering uses cslices instead of gslices on PVC is
independent of which type of slice gets used for non-steering decisions
elsewhere in the driver.


Matt

> 	}
> 
> 	drivers/gpu/drm/xe/xe_rtp.c:
> 	xe_rtp_match_first_gslice_fused_off() {
> 		unsigned int dss_per_gslice = 4;
> 	}
> 
> None of them seem to be in the right place (xe_gt_topology.c, for me).
> Particularly the one inside xe_rtp.c seems totally out of place.
> 
> That said, I can disagree and commit here. Hardcode it for now as 4
> and later we figure out if we want an abstraction in xe_gt_topology.c
> 
> Lucas De Marchi
> 
> > >   *
> > >   * Returns: Number of DSS per slice to use with [gc]_dss_mask
> > >   */
> > > 
> > > 
> > > thanks
> > > Lucas De Marchi
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
