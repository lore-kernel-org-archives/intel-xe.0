Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA83C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 18:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6922810E2F0;
	Fri, 26 Jul 2024 18:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6lfs4cM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9007610E2F0
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 18:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722019877; x=1753555877;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ldZtVq5YLEODMvqlJY4PSjevF/eIFcDuTWRmbSrXAb8=;
 b=I6lfs4cM8TUDIV0j8gjRxggZH+rJNuXX7Z0eg9SajRemFCMTsnMzTBFg
 x/jykOt+iX4UqqFhrvW8q0/NSK9LUoRZLLWULy6e8yUhj0NicX1o1/Szd
 E+XC7OWumwJ0U2fy9BVv/fi9Q1tN/S7/NKcZkFavJ7kPFh7VSxEG8yVHc
 EgoNljN62ueaTVZcL35IBtfX++cxMeqiWFnQaPH0/i4ImX1eNfwrqmGy5
 x0ieo6cgMkrgo6ftdhzdx+pqKUbNkKJan7PJs3SzqKpkhSLGnoG1LN0ov
 TnGUHZD3o+3MW7Pp9QLLGsq/5Fc3DuzGxdwoKvJ5Dm07eIMMGLOuIAwFo Q==;
X-CSE-ConnectionGUID: FNhHxWuDR1WfxMXxNrKJTQ==
X-CSE-MsgGUID: OdvO63FZQmGHSqs2sARISA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19964925"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="19964925"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 11:51:17 -0700
X-CSE-ConnectionGUID: ZPWEz+EnRa2q3D9b7ZoyXg==
X-CSE-MsgGUID: HQnqjMFAR6Orct/PmVUDtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="53350741"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 11:51:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 11:51:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 11:51:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 11:51:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXqZLU1kF3zNFyALWgUm8NQYssotqoUiTA1xmC9xBvtxtUGHjckQP8HIwaXKkeoq9asHWHjF+vaeb4exPlLNgEbC5PXWxFwhJS5UoU9fdoxHB20wDZjneXz2PrOElwHT0GJrFK8wShQDtX1aESf7p5OHzdnNNtEUzdFTQjflo4m6MhCnsmMIxgbFrSgMyRDycNn5xfOboTP1QML0sOo/F7gI9OkevPV5tyDEsvh3nGN340tczB1E6CAj7uKsy8vch5rcGzTS+UpASvzmwq/Eu1PkkD6Mwmc9JM3N4xHF/492jKnh7gzgmqZmsq03ENkJcJqtIIW0pHZR4ZKuWX7zQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaGFf/KdWDL9ydSRtevr0Ochtk3bou298pJ0VRSsnG8=;
 b=JWmofLUTehQ9AnkTx7DZxQSQ58eZWeF+phLzRQdCNIPyO8FsWMXfSEiHC0oVaxPsBYpXmx5PSdpDTmJ6Xc9Nb0olXfDrNUkYOPkmnMymz6q67Iwp+bhZQmq+7dRvt6Ud2Xn0TVQweCH4zOdkvI4xKJmj5eUafvZN2n02Ac9tWANYhLJAzvNfXFmVJ9aY1Dmlq4s+QlE+gdKPKcpK5gLgxcCMOX2rkm7iiDrd+Vsvk+MFGoqpf8G7JuyuOu1wtzDLgEuomzoaJKLRvc/PihZaJhDggFT1sNj8xr+8Qqssvvw8dcupcAyByARpe/0qsf31NspASt8wzxe0dz80cae81g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 18:51:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 18:51:14 +0000
Date: Fri, 26 Jul 2024 18:50:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: Re: [PATCH 15/21] drm/xe/eudebug: implement userptr_vma access
Message-ID: <ZqPv8NNmBSqbNJF+@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-16-mika.kuoppala@linux.intel.com>
 <ZqPvBYnU4ULY1BxS@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZqPvBYnU4ULY1BxS@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR01CA0001.prod.exchangelabs.com (2603:10b6:a02:80::14)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: f20b3d84-8f77-4d62-7466-08dcada3ecf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mtHbjbeyG4BQFq+mVtl0hGTfua1ZUb+OYbQfCd+odBE6IbJ1tK20ziiJDZJV?=
 =?us-ascii?Q?bdTrqGQhkVKFyykFhpAS56wR5SMqiJwtiFEje2IDM8zbKKeQUoF/Yiyic0z2?=
 =?us-ascii?Q?hoecFPCg+kjgoyE3H/h7ndrnxvigi65kx54+vUu8mauxKMb+6RZuTBkRZ2rD?=
 =?us-ascii?Q?y/hknDYCFTwGcj16kLr1UD2gZKd77vVotcVfzt1ke8OF9BEeaqg0xCIL0BIi?=
 =?us-ascii?Q?uCFxE39Smfq0D/S5W9QuKlUOqTt5yVbVxTzEeI8wUxZqPrixliwz8mX2RQ1Y?=
 =?us-ascii?Q?tG0Vc4Pb4Bq6hRECN+dFPh9YFBG1IiUboHUOQHIkb2zEra63C4dLaBOFwozx?=
 =?us-ascii?Q?oxar3DbJsM67yJjboSRLXk3SXoZvCUFjeAwes4+wKYxz/ffRzePMsL3xVCIF?=
 =?us-ascii?Q?gZOp5fTKQJoWo0rO6UNPVjDDUmH5phSoggXL3NBHXekXQnNE1iSPvvMHlsys?=
 =?us-ascii?Q?nmc7qj0xu+Eb1rv2rUOF3jRfZMmMc70DBZVHysyYWpni2zXWVN8puL0L5xC5?=
 =?us-ascii?Q?iKAZU/QLpHMkPPvYVz6JhiD5HPjzJPrdWh7ON+eZoH9FBiYUo4x1KAMKJhfh?=
 =?us-ascii?Q?YcsQ987K7V4CO2kz19LbYVVwWBZhVwZ774JeLI0eaW/liPP1YXSWPykOaRnQ?=
 =?us-ascii?Q?34S8/uEd8J5Xu/pzn9sgAW5Yo0lf5Y+J9WWDf3Cxs8hFSKlQ1VLRNN1Mux50?=
 =?us-ascii?Q?HDumt01tbOJjPvkpprUKpkOTDRar2oD9fAZz7kh86hBJXsIfXpAQ/upFyiCO?=
 =?us-ascii?Q?2xdm4w/oH+oVqbYm3o+uineT+qxOv2F6s763Mzbh8I17S32T1MLCxajHDE6y?=
 =?us-ascii?Q?v5zWKlLBJ2t1XSSA+3jqFgTgwIwLmR12ukTvQH8Wd2NddKRbVL19CsLkNf3Y?=
 =?us-ascii?Q?XzV90amAszSPi1DnwJ4cRPg5IemOJNzdaJ0iXF5A903KGH8hFoiT1d4L65hS?=
 =?us-ascii?Q?HFaYm0Rkqtg3K0KtfoxbG7vGqXzXtSbawaUSA+Gip45/nlAMOBTej1Fm1ue0?=
 =?us-ascii?Q?b+jFhxsDFkWaTXFHoPsfiveuNpfuExUa0Y8YC01+xeA2rr0bmU6kmYY2B9ws?=
 =?us-ascii?Q?aeyI5wuC9vBR3OECnMFrH7SJjiFaiAZGIHowxGCQFqGKHoXDezPqfYe5DpFg?=
 =?us-ascii?Q?JsPmbopKqBdkeUV728TC8jPta7bJYCTvOMwcWlYjj95bZmnJxA5D9ypgWjDZ?=
 =?us-ascii?Q?j7B5XdE5RuzkU3FN7aUO2IzDH9AplhcSssphZJWdAk8GiXA+7R9TQKAjcmAk?=
 =?us-ascii?Q?3dbfsjd12/LbhocsRixaIogHu+tY6jYUo3L0o7CYWGdmGBn3Dvt6+X2HR5uP?=
 =?us-ascii?Q?4k4GLhQGW66rbEJlHKN0Q25DacV/qLe5CkRz6sv5Zw9ROg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tdKlD1n+fpx+EHss7IaDR2kCW0b09QflKLjXyMsOzPdgH6MalaMFaLGNsHo6?=
 =?us-ascii?Q?/CbiLhpk7jcdYWgbcmQPqgccnHWN2koRnhzsNb4ynTSCKOzeYxZAd3WHbTPW?=
 =?us-ascii?Q?73iXkguupjQkKsX3OfP0XtwwemlDCeBKGPNBl+v+6ojj2CGcwMMC4RExChZd?=
 =?us-ascii?Q?ccSRv+/1m3E3Op/m8qRcdC1yyVpYqCencQH0AappxOEC4E6Mf2TeJZeDKAUh?=
 =?us-ascii?Q?m+usjc4OBOxNP/5MOBcA24qGRjCxJeOGOy6PpkyfvBF+8xka+iWklnxB+DQc?=
 =?us-ascii?Q?lR1m3YvKzQm6vGsNU/wp28bhobN735QjNozOxr3p2+Y3yJWYs3jCxxiBTPFr?=
 =?us-ascii?Q?QIntqTWlYd6UVhx0x+9OaMSi4/aboJyoUcIhKgIUa/QjqIF6GoPm/8ct7zye?=
 =?us-ascii?Q?mHQPBEyd+zcjq3eHLp7TncswU8kw7gtSa1amcpiPIAGl26TiLOdiwxtEERAc?=
 =?us-ascii?Q?PiQzDNa28B87CQIzCB1G68+5Kh/Slh7iKGnj6IA7wisyrDS877eGy1DwVW11?=
 =?us-ascii?Q?frFN8h5vPmw728W7sv+a8wkLolkjFDeBiZuUXEhB/Yg44MOCWGHJEZ+p06X3?=
 =?us-ascii?Q?JM/IVg4znDB/LFpPouKu8SM8InJDiZmpAPPLoVFflPdUbEQvl6w3owEGpC2J?=
 =?us-ascii?Q?WK85PZUhogdKFKNvkcgxYdQfHsbaXKJL+NaJLwqrhr5e/EQ7lwzaa5QnEWca?=
 =?us-ascii?Q?1++1h4g6Ph+RpKWW1mPKIUgeNYIcmd8dVj5VamvqKuMI29FTUPYx/a/8TzRN?=
 =?us-ascii?Q?1elX3Zugqn4bsehsNzvPIiw/t3QS14qmBU3KpwUNIz3yUTc8RJvwH0AHk4UT?=
 =?us-ascii?Q?kbzysZahJQ8HTyeY963bHGTRsDUx6dZ+uDhxUJPqZgJrAIHJuWhw6aGUi+38?=
 =?us-ascii?Q?BZcvoKChwCxFVxrvZOMx4MkQJFQODcBJQVh+F39yQeVLQNqHy9gM5UMbhHDe?=
 =?us-ascii?Q?SEkGxts7ljdVV/TEdH7TKcni6p7t7RO6HqALlaOFu+MTxPbC0olMrcYfbKX+?=
 =?us-ascii?Q?RcMMFkIAfV3QqIMlhZuNIwCihd6rarbIQMQlmm0/FdOJ87wGoSGM9sU/b+YM?=
 =?us-ascii?Q?/I7ny4ByP/FF9RT+9dqmce+rwbSajJDQ5o7zfT3L2rVlIMThufo0IFfr8WQ7?=
 =?us-ascii?Q?OQoRwNxvF2Xg9HDJPfastOdXZpz2uqDsK0jdLhX8fq6JF5tkfiutXiB6vMvv?=
 =?us-ascii?Q?ApXkvEQ2jP2Eu2aBOqIFRJfjG2D1vt4HPuPczm7U2LGQ5fFO4mug0GPHncOa?=
 =?us-ascii?Q?0rRp360cCTrflBsrccyyXp25xQLy+ofYpfpmTykAw1c3vl4KQqvSq1wDNnPg?=
 =?us-ascii?Q?8kFfTPSU3nCSwwmkuAWQ/U2gHJzSi7JX6Yf8VIvi9RBim2StIpsupD6tUmne?=
 =?us-ascii?Q?Z6uwIDWGkM/zP48d4X1sHrY9oQQtxeJd45nL+q01xYRqmUc03HX/ry4I3WIX?=
 =?us-ascii?Q?1R+RJtRiP/bjIV4/a7yr/AlLF5UsrlcQ2KQFS4SSLMvZJbWwdbsO6wpaQg8v?=
 =?us-ascii?Q?h9pJn+bbQWUjpn2Opw3QWuG+OQuxl9faEtncZHRqFNhdHQB8A9Y5z+BGxSob?=
 =?us-ascii?Q?Ucd528XLsL4yM02YwtLoXUQ97hL631xd96iAjJHrAX1sSf1V/Iw9dOOzo+/x?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f20b3d84-8f77-4d62-7466-08dcada3ecf2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 18:51:14.7229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4cMjIoZywcupweA1WqeNwTYth0fZxOsIeFZ/xzDG+sWrGgLe/6XmtVclNBfKfOzVEMx5dyR/R8E9Wy3YKmMJag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
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

On Fri, Jul 26, 2024 at 06:46:29PM +0000, Matthew Brost wrote:
> On Fri, Jul 26, 2024 at 05:08:12PM +0300, Mika Kuoppala wrote:
> > From: Andrzej Hajda <andrzej.hajda@intel.com>
> > 
> > Debugger needs to read/write program's vmas including userptr_vma.
> > Since hmm_range_fault is used to pin userptr vmas, it is possible
> > to map those vmas from debugger context.
> > 
> > v2: kmap to kmap_local (Maciej)
> > 
> > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> > Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_eudebug.c | 56 ++++++++++++++++++++++++++++++++-
> >  1 file changed, 55 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> > index aa383accc468..947331c19f43 100644
> > --- a/drivers/gpu/drm/xe/xe_eudebug.c
> > +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> > @@ -33,6 +33,7 @@
> >  #include "xe_mmio.h"
> >  #include "xe_module.h"
> >  #include "xe_pm.h"
> > +#include "xe_res_cursor.h"
> >  #include "xe_rtp.h"
> >  #include "xe_sched_job.h"
> >  #include "xe_vm.h"
> > @@ -2852,6 +2853,58 @@ static void discovery_work_fn(struct work_struct *work)
> >  	xe_eudebug_put(d);
> >  }
> >  
> > +static int xe_eudebug_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
> > +				  void *buf, u64 len, bool write)
> > +{
> > +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> > +	struct xe_userptr *up = &uvma->userptr;
> > +	struct xe_res_cursor cur = {};
> > +	int cur_len, ret = 0;
> > +
> > +	/* lock notifier in non-invalidation state */
> > +	for (unsigned long nseq = uvma->userptr.notifier_seq; true;
> > +	     nseq = mmu_interval_read_begin(&uvma->userptr.notifier)) {
> > +		down_read(&vm->userptr.notifier_lock);
> > +		if (!mmu_interval_read_retry(&uvma->userptr.notifier, nseq))
> > +			break;
> > +		up_read(&vm->userptr.notifier_lock);
> > +	}
> > +
> 
> I don't think this will work without lockdep blowing up.
> '&vm->userptr.notifier_lock' is taken in the MMU notifier, the MMU
> notifier is in the path of reclaim, thus you cannot allocate memory
> under this lock, xe_vma_userptr_pin_pages allocates memory.
> 
> I think you are going to need to pin the pages first, then take the
> notifier_lock, recheck the seqno, retry on a miscomapre, once the

Let me make 'n a miscompare' a bit more clear.

Drop the notifier lock and repin the pages again.

This how the VM bind flow works to avoid memory allocations under the
notifier lock.

Matt

> compare passes it should be safe to write the userptr.
> 
> Matt
> 
> > +	/* re-pin if necessary */
> > +	if (xe_vma_userptr_check_repin(uvma)) {
> > +		spin_lock(&vm->userptr.invalidated_lock);
> > +		list_del_init(&uvma->userptr.invalidate_link);
> > +		spin_unlock(&vm->userptr.invalidated_lock);
> > +
> > +		ret = xe_vma_userptr_pin_pages(uvma);
> > +		if (ret)
> > +			goto out_unlock_notifier;
> > +	}
> > +
> > +	if (!up->sg) {
> > +		ret = -EINVAL;
> > +		goto out_unlock_notifier;
> > +	}
> > +
> > +	for (xe_res_first_sg(up->sg, offset, len, &cur); cur.remaining;
> > +	     xe_res_next(&cur, cur_len)) {
> > +		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
> > +
> > +		cur_len = min(cur.size, cur.remaining);
> > +		if (write)
> > +			memcpy(ptr, buf, cur_len);
> > +		else
> > +			memcpy(buf, ptr, cur_len);
> > +		kunmap_local(ptr);
> > +		buf += cur_len;
> > +	}
> > +	ret = len;
> > +
> > +out_unlock_notifier:
> > +	up_read(&vm->userptr.notifier_lock);
> > +	return ret;
> > +}
> > +
> >  static int xe_eudebug_bovma_access(struct xe_bo *bo, u64 offset,
> >  				   void *buf, u64 len, bool write)
> >  {
> > @@ -2895,7 +2948,8 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
> >  	if (bo)
> >  		return xe_eudebug_bovma_access(bo, offset, buf, bytes, write);
> >  
> > -	return -EOPNOTSUPP;
> > +	return xe_eudebug_uvma_access(to_userptr_vma(vma), offset,
> > +				      buf, bytes, write);
> >  }
> >  
> >  static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> > -- 
> > 2.34.1
> > 
