Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C18C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 07:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC8A10E7A8;
	Wed, 26 Jun 2024 07:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F/00qYoJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3015E10E7AE
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 07:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719387748; x=1750923748;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zaB77bbfsEMoeW+oDTGnwdQxn/bHbDMbmJb2Ynku9A4=;
 b=F/00qYoJyMaCIhkiFeIwmcCogdZA/n5kqAXEy27yhOYRkQAUtLrQQ5aX
 POzdDdCnCuMNwWdvf4COeMHpYGnXWKyBazYjXFqCJrW6k+dC946MmBE/P
 DLE+hryBw0yOt2h6CHu/VbslpjrqGnbcspIFllYLNb97e5U+qDGAW8tqW
 9m9o43rMYNANh8TXmf0hiUHvHpl7cxwndADT4hcIJJo5pSlqiBqS2Hljs
 hvU4dGMLzLhHN8wHgOLm4vmKIPKShcQalYinskNDGJ2k5KBaDLjB0N4zx
 QYxbzjMuIlR8grZb3SSVLrIMRkBuGDwCEpYSNEgTPnhJF7EX5qJuoHK+l A==;
X-CSE-ConnectionGUID: LePJFYUGT1yIVNMVPqi45Q==
X-CSE-MsgGUID: BVjU3Q3FTya4+l4vRAvqgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16321444"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="16321444"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 00:42:27 -0700
X-CSE-ConnectionGUID: RGHxHYtxRqmLuDZLpN8iZA==
X-CSE-MsgGUID: XhKWCNOwSZuLfRtRSuQOrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="48359674"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 00:42:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 00:42:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 00:42:26 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 00:42:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ig5Bcv2h31JkxiDVi0TznkkTWi3J0hO9FETSK7LgxIvDA+b76dxIlPt/DLpt9GsqvBYK6ldwccwn5x7dOL5KTTQNEo4EhFBBjYprI09YwF393We7zmDvhhl5EdcWuMnaVvBFxXg33hyDs3bUQL1NxtjDJHgKb90aN3wktWHnEknV1cAQLtBHgU9aWBznjOEENRe7/AZ0hP9hiOYPyV+Ku/kdHBMGSDdztTRSOqV0F2tQkrMnQ6Q9fdVbILaXn/0oMWs0bbXZg/A3NwwSTm8ZHq5wTax7qmrZ0L37wXS2n9X33t3oZx+La1sWCk+kG61cnSE3TYu/ykMiH/rwEOQxqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAMxIHPUWE8bGT/ckXx7E1qAvWdp54/D8+w3cVLPhRQ=;
 b=QxUQuODkwkQ1XMEftL6wD7KTO5iJfCFxMeHB4Mzozs3pQPektZmuaXgqFPDGrA1KJMPMFRGWW86A/gdrbMdW6EuHjFABSOKuIclnfQcwEZCpI8rBqUCtdf9yyZQduE+G43Fg/S7I8CR8bTToto8DIroNWnPofdYF4A0kL2wZDskKpyt8MjZjz94wSSl+W2hWMahCeCDubSwuC1Uh7W8Ey4cdRG6ttvnuirP5GPi/efNLedR1d8ITdRnMSQ5caMmjQq5zq3NI7YoFi70wGA5efVssWRYLOHcF5aotlU9x9kg/T6jDP4PJMqf494jaGpkaHZSmpqxNcRtLPuEbCJ3Ziw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW5PR11MB5786.namprd11.prod.outlook.com (2603:10b6:303:191::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.33; Wed, 26 Jun
 2024 07:42:23 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 07:42:23 +0000
Date: Wed, 26 Jun 2024 07:41:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Configure TLB timeout based on CT buffer size
Message-ID: <ZnvGOtmxkY2gRkyy@DUT025-TGLU.fm.intel.com>
References: <20240625084947.30869-1-nirmoy.das@intel.com>
 <ZntAuUNTiHbYENzS@DUT025-TGLU.fm.intel.com>
 <f9bec61b-dafe-4762-9f69-2a3d403fd825@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f9bec61b-dafe-4762-9f69-2a3d403fd825@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::47) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW5PR11MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: 256587e0-0aae-4edc-d3eb-08dc95b38441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|376012|366014|1800799022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wjGvVE8VyqkPkRl8XCxGWsB84HEtzQb91Rjayhcm0ZbDcdlXEL6/uJgdufyV?=
 =?us-ascii?Q?S2TeNM1/tEutwu4eFJ8CZdL9S25R8OWKL126p2g70pqLWXmgwgk111RZzZU2?=
 =?us-ascii?Q?fm8FJQn0lfgMdC9oA5o5lqk1E9bVTrus1usuPXeLgVwEJJMGUxw4ptzc3t0s?=
 =?us-ascii?Q?boxG8tWVR4gKhecmAV7o4MTX81ov5QjFiKDXQybtCkbPRI+83iWi5tBYnCis?=
 =?us-ascii?Q?3RYCRN3GuuHvjSBF5/9Yyg0RXeFbXSV6006OCzlEp8s7979ZQvVFvTpO3Gn0?=
 =?us-ascii?Q?RmysAMPzPBiCF6pQilatdoP05W+QLfl8ZoZ1h6dO21awIpbC4fWvzSyG64Vp?=
 =?us-ascii?Q?Uk3QpPuKlrkOnYrkM6/hj8zvqx17V6BkFU90wbkZAmmn7lMol6Dv5XiLLvdb?=
 =?us-ascii?Q?lPMUda32dv4l/KzNccUmRlxbJVk4F68FTDwzuhGppCCq5xKd3S4CmtranNNR?=
 =?us-ascii?Q?FD1O/bHjiJbqHwkmMzvgl1qQS6zCdg1bfByGO3MeSrDYiRA2kW8FFMYOGNNZ?=
 =?us-ascii?Q?MOkIHbo0YzUCzSJ3kt9T1xxBTJDWm39ypDLtohXE7UwXeNObxcQzcvKrT3+9?=
 =?us-ascii?Q?Eqbi3UkXNOoeAgAvBuGpStNIw0ZxhLnyQZF+NY6KdUtIdjB2ZxjfkBUTOMu+?=
 =?us-ascii?Q?nRk/LFWAXSc0o5/2cwJ5qXrl3mfit23WhNSJbF2uolRUYoETE+FrxETtZ8M+?=
 =?us-ascii?Q?u//gIxeU5we8s20cf6jW3bmVq8audGLRtEUKwRnIpRxHl9/knExMWBF+j9cr?=
 =?us-ascii?Q?lPVLHHBnvuvXwdXj2kG/R048kh8M67Xa5yVhnaBcTXk8dq9IzFNWev4CjQb8?=
 =?us-ascii?Q?Px1Qf2O6wr9NICk7TV9dlhirYiwSKMEc35ujp7zvMdFMqfeY07zc3ry7dVNs?=
 =?us-ascii?Q?9I1qzsd+2zM7DFGKEo6ekytB8hsqYr2a79Q3ZXssM6Gtn0oNxn3FI0AuHbyU?=
 =?us-ascii?Q?vJE+R5STQrJS2LBnvEt9WJnzRwMhSYXVoZMe+lzedywD+wBLZmI2oHjqoyrp?=
 =?us-ascii?Q?eJWeyTnQ4YU2bJiIPUqmbZexzZyLkONtYIbt19SaM/HRSZ5qozHA6McahKTi?=
 =?us-ascii?Q?Ooscjq+x5Got+B9hQjTaEsqTjFN7fEHirHA0bcro7YtOGrqbevC1pTy/3n/0?=
 =?us-ascii?Q?iVUxHBwF/fAzSxICXSoaFf9KwpRjzw49b/66TUHndaZydgsfPQE3UxwanaU3?=
 =?us-ascii?Q?wl0vxL/7QuipHBTNtgOZqKeG6qpKYEyTOgGns+dt0HSpKEbzEFnWGzr8oqU+?=
 =?us-ascii?Q?HXKMq7uKzEmFWyrrCKBxdddEqspr4NUSac3MzuExN/XUnuvASbJ+OkcpxvRl?=
 =?us-ascii?Q?dvQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(376012)(366014)(1800799022); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mUJXujzAqv/T+I88xmvMPwMNci5AKOCO1xOh3+JF46yTwwpOxFwh3C5e01W5?=
 =?us-ascii?Q?vLc29z9dbhct30Q8yea3EMvROlDb9Vj1U7biSNPgcTSmYpGDKg1ooO3K7B9f?=
 =?us-ascii?Q?Tj/2jht6jeutVQBupr+W+eG/5WdBjBT1bmP5I6i27nHLqPWpOjXJ5NtG3aI4?=
 =?us-ascii?Q?l2bAAUEU+BoQueqdGpmAPGTRpN5udcdbixpxOSxxRhldswfklbpRZ7jGE0P8?=
 =?us-ascii?Q?eCK7L3A9Mr4vgxatwn89BFYzNSDbtvGg420PWY7H6D5SuFd6FIUN301UkXSl?=
 =?us-ascii?Q?CmFRx+C2petWEOxjxUEM+X3uqjuq97+szZsz/9iotjwCLUbYpbxbLkriCdlH?=
 =?us-ascii?Q?NO6pcCk++sMesAp34ysBBKq3tVscLSqGyxQ7ENC0sunotDZomGvroRn02o48?=
 =?us-ascii?Q?NWDufPIuzfaR594mbp5IKjsTOUVhuNncbf9m1XO0Xtg/O+uA0TDOHRv+BgI5?=
 =?us-ascii?Q?wYkNp85/HDYXxCoy5vLVtUBeYamyRTMHzcvZo+aU0gf+T1apC4hijF208/4t?=
 =?us-ascii?Q?u+SuRcuT0nMEqTRUSd9UV4Ba2Xnrt3txeBsrosvQ4iYX1G8TDBJeJ29FhwPI?=
 =?us-ascii?Q?XgiglCQg9iqUJjVAy69QAEDN65NjHwjhk5rblxg8Qo+nUBq3V9UZdKrK/hRU?=
 =?us-ascii?Q?wtL9S4BouiRwZRdn70uNj8KXt77ja+fJj9/zlSSdg+KojOzzAveaINcpmayx?=
 =?us-ascii?Q?RbyAqzTTCqCCtEpD/jQhUxO8F4BT1wQvRar4sNpGbLvsJZEUGF+VPzydLT24?=
 =?us-ascii?Q?Ogo1zXM/ECtbQtc2p2/Ah5a0JJP84Nocgbd09F9sX5JzaXRb+ntYf8VNxNJ0?=
 =?us-ascii?Q?3WCtuoPDBmzXedsgocGN5jrFO4YghVGGN2NFuxvszG6ADCKvLB9S5gat2vcf?=
 =?us-ascii?Q?cG8hyY+73IDzt8REaELI6DCRkL8ih8imxVOs7teHoLLhTB68qyKBwVLaRRCI?=
 =?us-ascii?Q?0m+MVcQEWABX6qS34Sl5aklxE4xIb59OyAdJDZpcNmIAiXBSbkJ2gcIfPUZ6?=
 =?us-ascii?Q?tOlaUNnRFez0lPHcctgQ5VVsoXJqUhEMQFeMafNIHOo4OJzK9MipvPjHREXv?=
 =?us-ascii?Q?k9yhTjW2r/FLPzfb0fvMNZlFflRTuD+wH/pdIzswQXZmDAecAbA1pHs1Mvd0?=
 =?us-ascii?Q?9f0apti4k35GPZK8fepJLvmCk8MleEa35lP8v8GGmmYzxy/aQgN2lq1V+Ndw?=
 =?us-ascii?Q?NiU8ttqW1MpLvdwQ/pw6K42mEVJCcLonJAIRos46eVb7JQO6/LHGItdPKjUl?=
 =?us-ascii?Q?Xmr34vKprJ92kCc/53M77rBLEGjsjBMZnrEt8bMefilgqIK/ssMXe7kkZt0m?=
 =?us-ascii?Q?JwUZCt9S1FOXaVatH1gzg37EUOABT3jfdDopFKqDqvfpm1XaYiotZkzy/brd?=
 =?us-ascii?Q?a721bYk3mUgu2pyJ3REkmieTkR4tuqvqMhxz2aAThfbWY8ap0/gccJfez7W+?=
 =?us-ascii?Q?gdg0DQWHBNGdeGEUCG7nhXtdDA8pbnTOQAT9KkbX5u2HJfcN4/Fx6EO5CXbk?=
 =?us-ascii?Q?Pp09afPsKmgKaNXx0SfQ2hqtEVAH+WOXZNnlx+xP7q6B4f7Wwgw4CTV3hmv8?=
 =?us-ascii?Q?sVKZqSbTPn+tMP9Nx/s1L+Tu4k9EN/ZmMQFopqR+Dp3itM2M5PfrkA/+2ibx?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 256587e0-0aae-4edc-d3eb-08dc95b38441
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 07:42:23.1259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IRLTjp8IxqkzLHAtDfvvB/NgOBsqgU2G/rVVVpsRDzNvTVjiOZF1NBqV4toJnW85nmUdsZW22In7RK4tH/R2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5786
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

On Wed, Jun 26, 2024 at 09:33:46AM +0200, Nirmoy Das wrote:
> Hi Matt,
> 
> On 6/26/2024 12:12 AM, Matthew Brost wrote:
> > On Tue, Jun 25, 2024 at 10:49:47AM +0200, Nirmoy Das wrote:
> > > GuC TLB invalidation depends on GuC to process the request from the CT
> > > queue and then the real time to invalidate TLB. Add a function to return
> > > overestimated possible time a TLB inval H2G might take which can be used
> > > as timeout value for TLB invalidation wait time.
> > > 
> > Not reviewing this patch as some reviews seem to be inflight, just
> > adding some thoughts. I will say that this patch looks correct as a
> > short term fix.
> > 
> > Longterm I think we need explore coalescing TLB invalidations targeting
> > the same VM when pressure exists (VM bind case, [1] should help here
> > a bit) or
> 
> I assume you mean to queue tlb requests in kernel for sometime and then
> coalesce before sending.
> 

Yes exactly. A rough idea would be:

- Have a water mark between TLB invalidation seqno of send / recv
- If difference between send / recv is higher than the water mark, start
  holding TLB invalidations in the kernel coalescing them in each VM
- Once we drop below another water mark of send / recv, issue all
  coalesced TLB invalidations

> 
> >   optimize out invalidations
> What do you mean ? Queue ggtt invalidation and send only one ?
> >   (GGTT case, at one point I had
> > logic in for this but pulled it out as it was buggy).
> > 
> > I say this because when debugging [2] I found that lots of TLB
> > invalidations can overwhelm the GuC to the point where it can barely
> > make forward progess on submissions.
> This sounds very serious!
> > The former is likely a fairly large refactor, while the latter shouldn't
> > be too difficult.
> > 
> > Something for us to keep in mind as a group.
> 
> Created https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162 to track
> it.
> 

Great! Thanks! Maybe add some of comments from this reply to that?

Matt

> 
> Thanks,
> 
> Nirmoy
> 
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/133034/
> > [2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497
> > 
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
> > >   drivers/gpu/drm/xe/xe_guc_ct.c              | 12 ++++++++++++
> > >   drivers/gpu/drm/xe/xe_guc_ct.h              |  2 ++
> > >   3 files changed, 15 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > index e1f1ccb01143..fa61070d6201 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > @@ -17,7 +17,7 @@
> > >   #include "xe_trace.h"
> > >   #include "regs/xe_guc_regs.h"
> > > -#define TLB_TIMEOUT	(HZ / 4)
> > > +#define TLB_TIMEOUT	xe_guc_tlb_timeout_jiffies()
> > >   static void xe_gt_tlb_fence_timeout(struct work_struct *work)
> > >   {
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index b4137fe195a4..e30c0da86acc 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -112,6 +112,18 @@ ct_to_xe(struct xe_guc_ct *ct)
> > >   #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
> > >   #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
> > > +/**
> > > + * xe_guc_tlb_timeout_jiffies - Calculate the maximum time to process a tlb inval command
> > > + *
> > > + * This function computes the maximum time to process a tlb inval H2G commands
> > > + * in jiffies. A 4KB buffer full of commands takes a little over a second to process,
> > > + * so this time is set to 2 seconds to be safe.
> > > + */
> > > +long xe_guc_tlb_timeout_jiffies(void)
> > > +{
> > > +	return (CTB_H2G_BUFFER_SIZE * HZ) / SZ_2K;
> > > +}
> > > +
> > >   static size_t guc_ct_size(void)
> > >   {
> > >   	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > index 105bb8e99a8d..a9755574d6c9 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > @@ -64,4 +64,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
> > >   	return xe_guc_ct_send_recv_no_fail(ct, action, len, NULL);
> > >   }
> > > +long xe_guc_tlb_timeout_jiffies(void);
> > > +
> > >   #endif
> > > -- 
> > > 2.42.0
> > > 
