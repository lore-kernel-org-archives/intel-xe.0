Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D39C7EE22
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7020910E0E8;
	Mon,  8 May 2023 21:22:02 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F8D10E0E8
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683580921; x=1715116921;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=78rm+heelbAtz8zefnrH8DGhBXRdkzM6mIm6p34sbFM=;
 b=lKgVxlxUim6oozoKAVWdE2zGhOI9pK/LPog4aJV4mxkb7vBeuLMDZYDF
 76nQQZ18o+OhzMEW8in3IIKYBHQ1GSs3X6tCWjYlQ97bEq8/6RSa2n+S5
 0SDzfAHclG0RaOWTniYgd9LjIkVlj0wZckhs5bv5VyHDOZ+fM3+pV0DoJ
 m2OivKjr/PZsXK1M8/UAKVfQt5eA6EpNzsYLZYPS1CCnauYM53CMVGMrf
 nCFYZyDdivSgYeAxIfkXQYX0+ZxpemQkyk+fhQ7AWQaejj/++bSJg58/0
 oCciTEEYjWuW+o2Jy0qhP67YBKitCN6z3XgxtoYIK0B2HSdNoLAHYZIF5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="436080045"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="436080045"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:22:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="731438647"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="731438647"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 08 May 2023 14:22:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:22:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 14:22:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 14:22:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9aYP3lCdYtUiBkBo50Px3kA/kbEWi43x3HSFe7b2qm0j3yp8bBQfs9oeEEfgC1KaZ3Iu7t//hGzMOoSYn43ZEw58gOZ8OFBhsHejSWC/WS00vFx+igU+oTpS/ruM0bPYm4bC4FGjKuf7yCCqqxzljMm58v0iF8GMzzug0OIuZy3mF8qjw4MftogF2gfATrRn0ajDrl4oiuC1BetTvgtg/5bY7q1rHc1vQZt+seK6nlQSaD55EC573tbzpdTukiDDWoyVuS2+7eNNX+2+/hb0RT+8KpyCNhi2GdEAuvHXSpvkqruUMGwDozpP+4lIank7Txc8WZxdLhrHwfFj8ru+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HflQ7ahxb11Ojq06442PEiJZEfWegKC6v1BWxU12jc=;
 b=J0mzK+ewHQkNve2PjmusmAOS4xTqx7ph6LgIKZuCr3zg4NTGKBTQGuFubj5/mSiKGeKxUIvn9RCIJYNeI2pz51c0bckEMgyD+/Mp8b3boRZEE1YLWzkniEPT5APpWnYzjsgs6t22DbHVuX9dLPCnZvxdx/Av1y4D4dD45y9DWdPgD/0W4PdUYkfPyc5aJFDNTxZpP44cnkQgQTcbDPWXU/5IbUzsBdgvCEUnJDMJ5SbKKKGH7h92XINs6CYSzPJhBlILhJ5uAMcc1eytGCxanRHxRbvaPcggwg3ns/8N/S9LmgwEpj1zYa7FACNFqXVJEPhFKKExgMiv6BD+9iz2bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6394.namprd11.prod.outlook.com (2603:10b6:208:3ad::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 21:21:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:21:58 +0000
Date: Mon, 8 May 2023 17:21:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZFln8oZby1JaRy0i@intel.com>
References: <20230505133433.9642-1-nirmoy.das@intel.com>
 <ZFUI3YyB87jY899o@rdvivi-mobl4>
 <edb8a4d0-99ab-0d4c-d866-e6e6e94cd472@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <edb8a4d0-99ab-0d4c-d866-e6e6e94cd472@intel.com>
X-ClientProxiedBy: SJ2PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a03:505::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d8eb86-5592-44cf-730e-08db500a4194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 220xH8izUOD3Go8CVpvgaWaztlLGY+2OJFtqkVCGv4uwW4uX4LQoY7JNGR5UTnRqUhIDMGoRkRINRcbrJcaq6lixn4kolheNi9pFoK7rUP3XKnGUVBEOZYICAV+LRH875J5TSz8XLDHRNcX5K5IHqaIiYluB7QHfKsDPtXeA1qckTE0K6tV3iucDeKWkPc4eaUE5URvBQt7AORJ1orbdRrXvUJtG9Gdb5rMCFMv8CMmchg1AyB9LiaeEr2ox8GDq6fqjT1iHgUOhQxybIsoMg0A6oJsDndQTjcbmDgshmkE1lT18v5hNaz4E8au/8p/dnZ7/GatqMgWPWWpPvqVMDXWgZdvCtLY8OI8u2v8LusKWCkqDx1hZpLTbR+9ofkEPuGo92KXK7d/bGRn6uIuB7/JMSlfo0MsIg6CWV5h6QoAcHGY/Fs/6Der3bEWbyshQIZ1dsoiws/7/kTekQ7qlO4d3CXDmtqPUuzZkqWo3HFQmZodWPdPonwV+UfbDv2hVlj9w1+h3PEfuy/z00aemgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199021)(316002)(966005)(6486002)(6666004)(37006003)(478600001)(54906003)(38100700002)(2616005)(86362001)(66556008)(41300700001)(66476007)(66946007)(6636002)(4326008)(83380400001)(26005)(6512007)(53546011)(186003)(6506007)(2906002)(6862004)(44832011)(8936002)(8676002)(5660300002)(36756003)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JRZ/L5J14hHeEeHtlMTKMngORTKQUBnN3iTJ25HaWFKDKvwV0bkiwRSVdauL?=
 =?us-ascii?Q?qn8bP/7BDLnH/W0bsbw+mCS4r4ez/KlwqpBDy2Oo8toRFuh1FmKmyyMSNoWU?=
 =?us-ascii?Q?QWO/430PRUISsisVkBNNV+2t8MUjFPpPZHn/vm/rhoR3/5EouHhgw/Ic1U1s?=
 =?us-ascii?Q?BesOwcmN0p6/WG7Pbs+N7eEi63XskReRVcApGbxfyB1CvI9hno0C94JTVMK/?=
 =?us-ascii?Q?yPnEMLqEAO21DmdaaY8M5W3X2sPT7EJ1ZKGpoyAHZi7TFgODz+ipvNhnjmg2?=
 =?us-ascii?Q?qPsfbx3KuIK76+b2qzYAEopROPM3sstWXkZLvCV9s/Nzfe/x8JwyyOlKoSCt?=
 =?us-ascii?Q?k6MzzMkJaSSg+YpRv0sI3W/d8D6Rptnq1VhkT9BaNCWvsJuL3RO85d/qzCUm?=
 =?us-ascii?Q?DJzo3OefRIkS13v2En62w+3oiyWbl6fZ5z4i78WCkfcmxHZ3PLqbWpiUw0RL?=
 =?us-ascii?Q?JhTYCejBHKxd2fD3P4Q4lXxyJf6vvyC+bDIhj3PeNOX7eobztvU9IiVwpMjI?=
 =?us-ascii?Q?logXPhLLmfynZLbfV5NeL6ch4ZyyJV8TLq9AYxdFLwY1mEvnMXpWWZqd4Pfc?=
 =?us-ascii?Q?8b8m9BIBEj2sv9seplvPXkO00jSEHDhTBn94C191GYIspIRUohDqtQhg2qdb?=
 =?us-ascii?Q?BCdTzWdh+vzeRD2ey4ZITqCTo8+I3BaxrgO9Ibkc5rnOsWGI8trCrVU8VHt8?=
 =?us-ascii?Q?Imz9PpQteWNvIfnmnagEQeh7INFLX8A1yjSNXVJDBOfrRoWXtiFM5cwF8vya?=
 =?us-ascii?Q?W+I1Uj59naejHoHfjeookhhHDFoRQGHRpMaCeFRvYt+AkdhKEo2iDhKwyV3g?=
 =?us-ascii?Q?xskC90gd4DNSpB5v5th8tBWigAZ3C8cq5PabE6Nzqy5uaLpp/oacmN3EvbHx?=
 =?us-ascii?Q?J3u7fjge0u4z/TpJlGQ1jchEaWaxIaqLT0idtDdkdDMVEsp5FLJHLSvAdk+U?=
 =?us-ascii?Q?2GZmPikOCouTY033/+i5IaX5h6euQoeLNhrfnyxxWl3rP6Lzg3IiyLCsTgzk?=
 =?us-ascii?Q?eOzDvcNS2hNqeg6bhscYM96BWoAcRL5qJfLE9/dapfi3RKi4OfZqHfgc81c7?=
 =?us-ascii?Q?uRDciNpAvJ2nDA+95xDQ3myVm0tVZFj8Nc2CdN10fEPqD0MUh6BtUyKw+pxE?=
 =?us-ascii?Q?7qMEf9oUAYdy+/zb6MoLTlXa2VHoDisf3Vd+wVk6YOxDLXSmO/iUwK5cvCsK?=
 =?us-ascii?Q?PB0GquK5YznF6mrkGi/aBv+x0jzXyZYMU9rBa2PKqLZ99AejsDQu6CKz9m4u?=
 =?us-ascii?Q?e6naKhidi/rmGHcFhiRzXlsjazB01tu681ybmIh6CPEE1b0P+3vB/FgrpmYq?=
 =?us-ascii?Q?yZKLxW/6cis73EHnqJMdbKWDQQMoVKVxDM8bHYFE49o3FQowOEiJv4+WMLYT?=
 =?us-ascii?Q?v7q7a1Tf3RRKZut6QDBvpNo8VL1FwsZl72l6Qf/iaY+YsNAm8KB+XWmyqhcy?=
 =?us-ascii?Q?dzgnev5GbZMHfV+6wCdbtwypdaOuYRs93TP8UNwzXFFTcAjVxfN5TqU8fP0L?=
 =?us-ascii?Q?bRhp7SCS6Vj6OzAf0Vvy9jYwvhQZj+wX0MaFFGjxMt8Ae67VUgTwJspxbyea?=
 =?us-ascii?Q?yNurAi/4HlI/MK+dxsQloxXglmjsEZ8HaJ/lnnh4CbCDN9xkz+XzzsgT1wU4?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d8eb86-5592-44cf-730e-08db500a4194
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:21:58.7220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maJyxUmilBDb7x94kvevkstC9HhhjJrf/K+eAz8TAnvQJ5xcpS0o3/KtpEr4d+EDXUTvKCPA0AHB/eSEI3kifg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6394
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Print GT info on TLB inv failure
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>, intel-xe@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 08, 2023 at 11:10:25PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 05.05.2023 15:47, Rodrigo Vivi wrote:
> > On Fri, May 05, 2023 at 03:34:33PM +0200, Nirmoy Das wrote:
> >> Print GT info on TLB inv failure for better debugbility.
> >>
> >> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> >> ---
> >>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> >> index 604f189dbd70..9e7fe8d9bca4 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> >> @@ -34,8 +34,8 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
> >>  			break;
> >>  
> >>  		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
> >> -		drm_err(&gt_to_xe(gt)->drm, "TLB invalidation fence timeout, seqno=%d",
> >> -			fence->seqno);
> >> +		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d",
> >> +			gt->info.id, fence->seqno);
> >>  
> >>  		list_del(&fence->link);
> >>  		fence->base.error = -ETIME;
> >> @@ -285,8 +285,8 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
> >>  				 tlb_invalidation_seqno_past(gt, seqno),
> >>  				 TLB_TIMEOUT);
> >>  	if (!ret) {
> >> -		drm_err(&xe->drm, "TLB invalidation time'd out, seqno=%d, recv=%d\n",
> >> -			seqno, gt->tlb_invalidation.seqno_recv);
> >> +		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
> >> +			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
> 
> as a reminder, there is pending series with gt log wrappers [1] that
> could be used also here to avoid manual addition of "gt%u" prefix
> 
> [1] https://patchwork.freedesktop.org/series/115083/

Indeed. sorry for not reacting to your v2.
After the many rebases and other patches, I believe we probably
need a rebased v2 to v3.

Then count on my rv-b there. Just cc me so I don't forget.

> 
> >>  		return -ETIME;
> >>  	}
> >>  
> >> -- 
> >> 2.39.0
> >>
