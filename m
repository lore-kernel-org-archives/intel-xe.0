Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96634C3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 16:39:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F95510EC55;
	Fri, 19 Jul 2024 16:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZgdW6ZDM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F98410EC55
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 16:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721407164; x=1752943164;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+BGtUlFv0+BMVzzrAXHyebc9hsmkfEP7iINYrsr97R4=;
 b=ZgdW6ZDMlq6NnMl4UDtDkkaua50JZfybuTCpv3HkzHaDh8DNgeEAo3vp
 Bb96pNfO2QQ4l2EcNpaxWtKuWRDs5PelFfCydlEDYXrifazg0fP8K+uwz
 VkhkO/b6R1Mdq2yUu81TII9vzmWGBLaXWDWLYLfEk/XQqS5Y7sa3OYt9g
 I0j5AGHOCTpP3JyYlgUIyKF84Vid6zSLgTmNsLqpyyIOFNIGc7Q9BRQJz
 xvZMF3CzWM5Va5Am0S9HiCMvlZ2fVwHsZPooq2tqiEsePxSlJxqkdEUm8
 kanu0Uy8+rV84Arp8pUTZv5PmUwAGrLA2nVZ9YSKakXhacavxFV9yC5aa w==;
X-CSE-ConnectionGUID: cGk11dK5R1iogLqdJKNkGQ==
X-CSE-MsgGUID: 4oYrGlpuSB+yH+MWIZJGbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18648641"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="18648641"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 09:38:58 -0700
X-CSE-ConnectionGUID: 5fDjkV2TRnqi+Ie43JK5+g==
X-CSE-MsgGUID: 93ZpKlMzTqG83F8gLSNyUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51781819"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 09:38:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 09:38:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 09:38:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 09:38:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wv7rgWnZ6xAr9Ru4GeqnSEt94gm28mgH4s7acL9gf2oauqEN+sch+93pWRosi9haAvZ3BG6KffnrsvVf+GLBgjvx7kkEYD0TQsms0oVdz7kaHmxam8JxoRKfOFoPqcJq7t8m0pP2iylob37I5BNhesRJJcxhZWOHnvLbfDpcLDCPLlVfMCx5Yb2jkKsxDrY1Rkia2Ulwh7np9hK564LT6M3MXV18QzQaDUzate50G5O4i1TiriQAKlWDUhboHRi2OYTtfEkdcEdpKcMgMLOsclqYaSohTNGhqLhADDo3kQ9ruoNQEMA2gDGR9I6UxQz2D08cCUUT3zykSxHzPGtDeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAXKhSsQ81dNwWku8pC8BoHbVFI0NCvm60WFJqZCFx4=;
 b=YSzyvWLhIonvq6TRUuOC7pIa7VttDIJKaEdTLCafMDM4F/bsTtLblMlgrXvo/dy2yU7RrLDLRLqdsQ26jnAj4kLqn6sKn8fAozBvnzcAy3xNG/K9jqs26tui1Y18dQFaqZaBJ4pxYYR+Ts5wf/xYnElH5p5oMG830nLFauO4s5p+6y0+vEP/9HZU7OAVCBO/pIG1Ro6nDBC/mhVp2zhdRMjlvWuz5I3TkVsS4ccStmT3WrAZv6WLOjp/jdHrGqh+gQ7Q97aSfr8cn8UE0K3MLDU3e521J0kI/X4ah2wEqHDoFEW2sg+YirjSnq0BJpz4F8qyyZkc4hRaXQfOmpAZ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Fri, 19 Jul
 2024 16:38:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Fri, 19 Jul 2024
 16:38:52 +0000
Date: Fri, 19 Jul 2024 16:38:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 3/4] drm/xe: Hold a PM ref when GT TLB invalidations
 are inflight
Message-ID: <ZpqWbJrczJNkqvPX@DUT025-TGLU.fm.intel.com>
References: <20240718185531.1500815-1-matthew.brost@intel.com>
 <20240718185531.1500815-4-matthew.brost@intel.com>
 <b242f2c3-1c7f-418b-b7f2-0cfd92ba3d67@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b242f2c3-1c7f-418b-b7f2-0cfd92ba3d67@intel.com>
X-ClientProxiedBy: SJ0PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:a03:338::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b044bf-203e-4611-d22b-08dca8114633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bLSZ6h5TMd/6nXRC2Q3lei7+XZ4O1YIEeS7y0tqVm/slPxIdEidw1U21LjdB?=
 =?us-ascii?Q?nzF68HkN7/EfDUl87pS09esH/JURPoOHmfTlne1+CwvCIVKOtWUVUTHGRuZu?=
 =?us-ascii?Q?tIuMnl74qRPXZjzGOR/S6/Jez7w1Z65Z0iqD8api1Vm3kSHTFTqwUDWTN4DY?=
 =?us-ascii?Q?OZiC12YZUHadcgAS8OJoC4M3HDTjMiCW3KYDQjmXMSIQymP0nuIhhTcVcfo3?=
 =?us-ascii?Q?s13TBDA5cP0VAfECGzpJlWVdiAHF5XUN9XLmDcXmUdgJB9px9m8K+KUIKko6?=
 =?us-ascii?Q?WQoN8aVWhcbH8y3dJhyD59jY6yUqHJkE/oU8ZuSrVqRdnvSvL1dAwLMw2GEh?=
 =?us-ascii?Q?A5+kqGvYmHHgYW4X1TxfMaLTyEJcNVUe04npS7+4CeOymtNwR6lRMqpfzQN/?=
 =?us-ascii?Q?shX1XtMKM4UXKSTANGTpRW08cJZfranniHVnRpOHVKk8EsgPc007uMJSXlUx?=
 =?us-ascii?Q?HzvNNhr4/vAzxWf83aiBx2FB0Wxx/wa4Jr6I2/fBhDhlLm9d/sq98XuFOERR?=
 =?us-ascii?Q?dppwtuxHCfmu+qjPeuL7YRJAK2kLt3Plu9yNaolNNIXovsXKswU+Uo9kM5ET?=
 =?us-ascii?Q?11j6TrMiQBaDGspdOK8Pq0Zk1CzvgLh2dFs5p28hfVsOHBxZQD5ZhxX/ZZjS?=
 =?us-ascii?Q?XgQj/ywsbWx4yj8PfRwMv0i9fUg6xwqAQPfzeaAj26jdwGJpGXt2Mp/BF6Dz?=
 =?us-ascii?Q?Z8m9AMP/ci8xqifdY3tsbNH6eByt+AnLRMLRONfewBN80Z7SwkqvG6XOelfX?=
 =?us-ascii?Q?aFr/XUKRwDBmWgCuiAa48Ms66lfCgOlM6q01xpN5uQY9zPCNykhX7U0dnzxm?=
 =?us-ascii?Q?Absi2oYNZhUV9UDYXX0k5dnHyaHf7wxTQmHZPNTG10hRwMjUcsN6B4VMAA9v?=
 =?us-ascii?Q?YRaIqRytq0PPw4y9nkwSO4bjtcg/+7CIg6uP7XCk1vgV2OfMQghzfMjfMJIP?=
 =?us-ascii?Q?ec9jn7jl59majzbVE2KCTdzlscHD/6ty2WaN8n8PC+hTs438Jk0ktxhC3rBU?=
 =?us-ascii?Q?nZXvE3jQalCTTAD9zjrvwakLIxo4P6nnDPBeJZZr5cxCvrKkV34ympjbWalG?=
 =?us-ascii?Q?q6kM2y1/AypqFWlCYbwM8ch34rhtnazxxhogo+AWdGhvGSY1OcjsOKeHZBmH?=
 =?us-ascii?Q?i7H6W1WCiB4K4n5JDwklCdKm64F8faxNC46Vs/oMeKMA7ttm2UE8R9sZEiCt?=
 =?us-ascii?Q?I1H0sMBIpqNlwrTsIhcH3aG0Tb8qITumtR37Ygykb5x7W20QzkcTICkWbhW8?=
 =?us-ascii?Q?z40ozkSnlbyZimJRhRSs49T10XtsejKggKrW5zu8auBLHG6j4TKVZQcPpNi6?=
 =?us-ascii?Q?JqT/zDpsPzS6cUkIeiHHz4V2+yiqqGZbKsg5dqzWGieJwQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j8R50TnTDWS/Fcxd0XIszyi5bnrrtuZMVr6lD3SxB/2pZ9wnwrfx44o3iWRa?=
 =?us-ascii?Q?frrY6+gqtSuq8Jb/lefqwv2/++7Rp8BFrwHSqdPmDnPMm5oeIDCl2R5wu4GU?=
 =?us-ascii?Q?yiMMp9LD9dKAiMzK2UlrJPR9xVMwdPmS09M7rhXly28E0nYyB5xSA9IGQ4F2?=
 =?us-ascii?Q?kJdiRfX0MoZhcPbtimJ0RJPe3JlpurQRlc2/iWVrw6twkFyMFPt3MOgrfeE+?=
 =?us-ascii?Q?Hal4P3Wc8+hBvIp3cjyce1dvWkmjcrEEr9zppC9iiHDMQ/GSPrN1K8eQ3kBS?=
 =?us-ascii?Q?ynNpe7C4moQKuWfP5diYxAn9r2GEVBTnGVjQ/6jWEwHxty8NBD3OYPWkYcrV?=
 =?us-ascii?Q?0qexoqDB6iSG86FKM0pkExY5GM+plVCR7NxVgTwc4Rol9vYcineAMfHtuyWd?=
 =?us-ascii?Q?HmzcZmDviRcmFDuiATG3zHbDxwVnSxMihcn/bCejQDqMyAjlfgft4oqyWo4x?=
 =?us-ascii?Q?ZLVtAwL3M2b9n7PKgbSm2lcZZrBZ0nJBTST+LPDGEQnouuQbXous3PSFKXGY?=
 =?us-ascii?Q?5ahd12uFZHv6zNuIZHYof0C86sjoW70WLOFigSU7w+/eHaEBOulpClu+s3Oh?=
 =?us-ascii?Q?lSfp8Tghl5W4RMF5AcjDaJAv3yjTeRgKpK+Fi0cxPB3cFq1HHHlkOwzhyWpL?=
 =?us-ascii?Q?Cxq4Y6xG3Fj/2H/lb00+Wvn8friZAaeK2JbhK9vp71ifz3tlPAaPbre59Ktw?=
 =?us-ascii?Q?rzTGz778qJ7hG+GyqHzy6CVrxGf0rsrfXDn3XsJ8FIikNVpFPbNRivGWpsm7?=
 =?us-ascii?Q?JPCXlPkWTVi0iB0QnbKFjs2wFHz1u+WBweQzX1pV7GvXoi3tgYD3/hjA9sT0?=
 =?us-ascii?Q?w/bxQXpH4B27lL7CRmeeS6426zGKgetYdp0SKYXy+BZdMRUhiwUZo0wc2/e3?=
 =?us-ascii?Q?Njn4XCoEksACNF5elWK7Cz5qKPTfDo9+Gx6pdiw/8WL7t8gQ49MvRkAAor43?=
 =?us-ascii?Q?VKhPzrXkFRuJed3YQ3kE7QS67VBSngO0MSKzPDYmgUb2i0vzHnXEMQF4c46o?=
 =?us-ascii?Q?lzVSafRnK8DCB8TQ2bYj3jXC12lWEdwaLbsy6Wr6qbO5dDNLFBiLp/MaHlyu?=
 =?us-ascii?Q?JutMEodKLLU2gTEniq8e4CqbbTQuh3BZH9o+dLgUSZGZZPkZLv5YXmRGAeEG?=
 =?us-ascii?Q?mRdL88AaTFuC8IYX9iDtWggjaubF8Lja1iSbwF+mIYQXcwBg4FM5Eu1pL+w8?=
 =?us-ascii?Q?vbqI82KZWNkkpPqoi/oCB7eLGB8DaglDs5TCCa85hxwgw/uuwGCChpGz624h?=
 =?us-ascii?Q?aRToY5zEqW8IkJ32K26kqCcGYnIY61mpJjjgGTESEPYfICeNdugcRo2T/R1V?=
 =?us-ascii?Q?6Orl+5yxaIAEvI1hjBqkyY9Kk977p6z+189mXr1qoFM4hVifx5jR1bAMhQz9?=
 =?us-ascii?Q?/ZZzGrS1GpSg181SJ5nzG9Mx6ssEdecgu6eyMp4WkZKu7WZ077deCdvjcvAs?=
 =?us-ascii?Q?NBz8wzp2ab3vTfyHpt4OOnZ53LezTyF+0UnfG7+lx8X3zwipeU2P4f9IrcNw?=
 =?us-ascii?Q?g5w8tFAgqoD5ez+2AFvkc7eLBtfVRIMS8RCtlFqEXTOzkhVrvKpEcmaSyaAt?=
 =?us-ascii?Q?vS2Gl5B4mSyZ27z7Rqofu+JI0sKPI+58eckOhUVC9IS8aNWDgtc4ilfByxZd?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b044bf-203e-4611-d22b-08dca8114633
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 16:38:52.6526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVSue91eBFBg0ZSUJYytCc0ybgDowio1mLEQVdJ7cB59v4t5dDghhVbqrLK+3zQu3OD9ck6r6Su3g/g/RSTwsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5830
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

On Fri, Jul 19, 2024 at 08:50:02AM +0100, Matthew Auld wrote:
> On 18/07/2024 19:55, Matthew Brost wrote:
> > Avoid GT TLB invalidation timeouts by holding a PM ref when
> > invalidations are inflight.
> > 
> > v2:
> >   - Drop PM ref before signaling fence (CI)
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 62 ++++++++++++-------
> >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  1 +
> >   .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  4 ++
> >   drivers/gpu/drm/xe/xe_vm.c                    |  4 +-
> >   4 files changed, 47 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index 668c1a3f06ac..481d83d07367 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -13,6 +13,7 @@
> >   #include "xe_guc.h"
> >   #include "xe_guc_ct.h"
> >   #include "xe_mmio.h"
> > +#include "xe_pm.h"
> >   #include "xe_sriov.h"
> >   #include "xe_trace.h"
> >   #include "regs/xe_guc_regs.h"
> > @@ -35,6 +36,24 @@ static long tlb_timeout_jiffies(struct xe_gt *gt)
> >   	return hw_tlb_timeout + 2 * delay;
> >   }
> > +static void
> > +__invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
> > +{
> > +	bool stack = test_bit(FENCE_STACK_BIT, &fence->base.flags);
> > +
> > +	trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
> > +	xe_gt_tlb_invalidation_fence_fini(fence);
> > +	dma_fence_signal(&fence->base);
> > +	if (!stack)
> > +		dma_fence_put(&fence->base);
> > +}
> > +
> > +static void
> > +invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
> > +{
> > +	list_del(&fence->link);
> > +	__invalidation_fence_signal(xe, fence);
> > +}
> >   static void xe_gt_tlb_fence_timeout(struct work_struct *work)
> >   {
> > @@ -56,10 +75,8 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
> >   		xe_gt_err(gt, "TLB invalidation fence timeout, seqno=%d recv=%d",
> >   			  fence->seqno, gt->tlb_invalidation.seqno_recv);
> > -		list_del(&fence->link);
> >   		fence->base.error = -ETIME;
> > -		dma_fence_signal(&fence->base);
> > -		dma_fence_put(&fence->base);
> > +		invalidation_fence_signal(xe, fence);
> 
> Should this be moved to the previous patch, which introduces the fence on
> stack?

Yes, will fix when merging.

Matt
