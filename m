Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0574EC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 19:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74F7113F80;
	Thu, 18 Apr 2024 19:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+7NwhnX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F86113F81
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 19:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713470143; x=1745006143;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d77uKFhMaxCVTnLal1N/MhYO/fSHtRlbmp7/3+3SaDs=;
 b=A+7NwhnXDIpGIynjoPURb2Vca6ttNW82lh8bg76pdJ1OQw92CPVPu9Br
 nuo1XRrkraYf9e7pSQQ4+N4NzwqjNUZ/M8pJPO4NeP/hBXpDrR4Ooavdy
 Tchr8uy+3Dg3abCB9saEVZwk9IRjoVZGK98uZ7RXtwPNZuyEpTLMDeJnx
 sGRvoeDwjfl4aX0akV8+LHa42o8vZlONlfuHusvsABTYunvmEtE/Rr7FX
 a2qbcNoKcnPKSaDl2Yva3GUMMVVeK/AAFR7EJUSdfRC3A2Fxizye7c5ss
 7YGhV9XXAnL6GReo2MyXy4Pf90M8E5mWwJ/u59vDv4wJXN783cS8Rj/bC g==;
X-CSE-ConnectionGUID: 0OxQc0L+SaCIws+Wgi62tQ==
X-CSE-MsgGUID: hz4pPcTyRPaDmWoqpWCA7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8914426"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8914426"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 12:55:43 -0700
X-CSE-ConnectionGUID: UuDl/UuHTOWPZrMq/BgOyw==
X-CSE-MsgGUID: iJpXM72ETRiFOxfFYC4lyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23149199"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 12:55:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 12:55:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 12:55:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 12:55:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jggoCp1S2ZnVh2MU1VRCHpJ9DerBZJM0qx3yhyDbBQNiNhn6Zu/AdFostQGeJolWC9O0Ydea0k6YTjZaTVa8U+iVNgPc4cCDLaAYZCPSgpNq8haj8MI8lceA7peR49NnL5ZvwnxKP8jiYju/luBGFafCIPD3nM3QDM9AUPC5Y8oBT4dZN7lXiDHxw/wTeNoAuIm7W4v1tKWgiD4NULYsACZysH2IWWmHq39uiywUtx3fk7k+EitvqdoOvXkq0dnTPzCChfpTOiC04LqegqFqakdMXPFts6fFblTTBmeMlwnCi5FndBqwZsQLwtK0GuF4D3sOhvh/RqW0KcEp8Kfxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N178vcrECHFzQSLAW4J7NQfsiKNT53y9Sj+fAdYfwj0=;
 b=ZDE9MgknkY3GpH3yDruiAlHbO7UqABI+16xQoT6dkGyFQXEOX12QWVQBdRff1FepzCO3rT/eVya/5VGQgHGg08aAt36GTvhmF2nPOWXesP1xlb/5fgF/DVUQ0caX120H1NGhtLzZxtv1dnMW3rRiiDotdlzb9WZXOV16kwaPcmUI8Gd8vKO7CIPnb/iI/fBb2DMDC330muzZEnEzmiYkKi/2UjZqJIUyfygB0lzsR/12RbFXiOAD1dkIfzYrtdZ9hPS3QS4kj767K39fugEpLW1i2hB9WAX4hU+qClF3sH1Cf6m+av/IeRl/ZMUsXr9ipHSzBzpfoXCeGssvP2i6GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7662.namprd11.prod.outlook.com (2603:10b6:510:27d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Thu, 18 Apr
 2024 19:55:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Thu, 18 Apr 2024
 19:55:40 +0000
Date: Thu, 18 Apr 2024 19:55:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/preempt_fence: enlarge the fence critical section
Message-ID: <ZiF6rw+6AjgMqqHE@DUT025-TGLU.fm.intel.com>
References: <20240418144630.299531-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240418144630.299531-2-matthew.auld@intel.com>
X-ClientProxiedBy: BY5PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: 3052f1d2-d26b-4950-6289-08dc5fe185fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dhwjpdIm7Xw9tFYvSa04LsLN0S9T9hBoOhSPq//EDojHAxC4F58hsjNyUi4H48eTKRb8+gh/GzPgabXKyuoqzie4jyPPbp9qzMvhg8VxkTvVZZc3EaV+Z1dV+Z+Cdb3ukuBAQV4iUEj89pc/vq/39JyY6xb4R6YY8byFLG+st636CyI7WB6PEkL28EOxQ+ZxmujebZsxdt6ksNtA7PmmFwuQHkHNRatqLwkUIAfiAayvMcZ83rxTP7rLwdhEK8b6TI4DDIMrm9nZl1XazVmC+dKFmZ/+Nuht6lFnS5+TaOoxdB1bhhN+YqfqItrtUshvgIJrQw+eNCjVAai0kmYMvhSzJWtBZn0mPEwzBk8qTy8QWV+p/rwcKdTTV5OqeXZWJNPEBzeq8KaWHAM2FB6uiuEv2LmK5NnWXEn1z6HVWu9h1ZucdGo7/BLz+YP+3swQmfkwO2tJvlY/seNMxTZGm+2hVhebGXwx1UW+lMCor7+xoukNA5IOCF5PeBRr++p4xqZZpOZtfFJO144vCGiu9LIztxw7pc7RvMGZPels2oxCrxZphWSSn/CoZ/lHPp462Tr80lHqQN+LKw9S9oZop1YJRbfRklpr8Lz5whQsD6M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0F2giMn55v/RaYqrAdqqyQUKpUzPkdzIcXA6MmjulnGTzIDw922jTsBZ46q+?=
 =?us-ascii?Q?oVBNBTrHo5NYYD4BVo4ikkmtD6DwUHdhCIlX8ma4PuysmSnlwQKLn5xqJJSC?=
 =?us-ascii?Q?WceyRK1ct8myu+TQm/sbGKGwS+RYQhPlFa6+aOaCD8khXT542Fvz380Mx5oz?=
 =?us-ascii?Q?xP/5dDxll2ydspstqPJpLMdBVOS56XKSC2UnV/ItZkgHoz+iVrwiSOKOXeQu?=
 =?us-ascii?Q?Zor+Lf+5iJeZ7R7KcReXntc9aAW9ERO5e/+KRJfxJeXjNlRCVzebGxYVVYYC?=
 =?us-ascii?Q?ZZYq2P4ocujTzDekmwMjYWIMmTpoi/uDRuMPf0euZ/nFNqV7KwiEjmVeFrMN?=
 =?us-ascii?Q?2j1IkdlKJdYX6M4rYG8MdYIdR8rC6JFgZx78Vd7YSaeJLoZjp58eWhjkmvWx?=
 =?us-ascii?Q?8Mg1+WtmM+Vo3KxzC6/oiu9z8AfCkCCXvPlLtg4Nruknt37LdtB1MjUOI2h3?=
 =?us-ascii?Q?F0DcxAVUgGCjSDsPHhRtsBkKj3gm2SNbyBcvBKS3QFJMlIdjrUSKC7/iGRwl?=
 =?us-ascii?Q?ELWLg5HAxL6wQ8PF6VZ4W7mjkZkifAAfGv5toMZkvEyCNDH8qb1TMzyDFS7Q?=
 =?us-ascii?Q?5HyLMPuVaOCpHIZGKE+5lWj0D9fvmKaOnoxQNJNlJfmYtJOYx4u9weF76rhI?=
 =?us-ascii?Q?NrIPmg3SLksmAOJzPMPGyKBZ4JKFLFlFXGbLAy93hMxcF0kn1CIg9UjUEAzD?=
 =?us-ascii?Q?fySXF/B6QUW+qjAzG1tAljW+3lPujFXeYRk6mS0HHAYEXJQlRIUDeDIVw4HW?=
 =?us-ascii?Q?8V4igade6yYYyP72aSz7/WIWDoEyYB6mMQcc16E1Bac4FIcf4L4Wfz8a+977?=
 =?us-ascii?Q?4ZuDf9O/aSqowQJ3sYsaCDJx/8QGuzOyjJmdZiQw1R4JS9tmZx63wvwsn1E+?=
 =?us-ascii?Q?5X7PhiZPQfVboXT5SAomhGZd5niPjOvGNpXYLoZgD+rNvzUOhrSzNwcvf9TN?=
 =?us-ascii?Q?AGBEtwXVGLF2qrUif4HPAHzz3+XNTY6RjTSgTXx+Z7DUd3wYIPgOItxZVlC/?=
 =?us-ascii?Q?D9FIRNSK7+7E0iGCRtrp0o4/olGlSo10BmdIpxSltZ+fNWz2tvkSsy1nwdzP?=
 =?us-ascii?Q?9xkou+BVYgHiN1czkIbKCgtjrkxgKxDCQUmuRqfo/7BpS6Zg52qhb68T4dnh?=
 =?us-ascii?Q?fsiNtKftCkJDGyiLqPEc/43z3osiW9o1qFD2qig1LEEu1cECpmNFmEUSEblw?=
 =?us-ascii?Q?InTFHuv7HLHhjE/8/GddtHwG67GxuXFtcm0O3ycc78B/l+4dD40xVtRnH8dh?=
 =?us-ascii?Q?IDU+f/RvRdwfDO4x7dXL9h0m8V+hHYdrwfOvKe3OrW4AZmC+INsBGgC8+rEN?=
 =?us-ascii?Q?A/eogu46Wc8LDRTY820bD42Xge8s6X/4WmDQ7jGjkHzEsNMLHA69mKlbvYiR?=
 =?us-ascii?Q?juTy9Eu65Oe+/Sj/zrC2SDJ/J9/Ren0LjfMuxhcFUVo0cyFfLJQl1OupZO4P?=
 =?us-ascii?Q?tC8RxpLuZNsPfLRyZci61Mp7HiKM8qVyWpxzf+BZhhSBkC07fR/iFJUD3Oxu?=
 =?us-ascii?Q?iaX5sQZJEMhZ0xjXLDki5G2ES/U9oyEQOl+ITQZyPM+uFdIt9p015gLqe5Co?=
 =?us-ascii?Q?RwpdDTydIvCmxE6meq6ZPT599MDYvTu8a/fSxhHGfHm02em47k1ZfeYWHUNa?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3052f1d2-d26b-4950-6289-08dc5fe185fb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 19:55:40.1006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNcbakqOYs7hc6I2WJ7b34eRfD3eSoExaoFMa8o5B8fqSGc9oSqfCOBEk45iMcGeTFSH8A3yvDJH4JPJ7Q5LMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7662
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

On Thu, Apr 18, 2024 at 03:46:31PM +0100, Matthew Auld wrote:
> It is really easy to introduce subtle deadlocks in
> preempt_fence_work_func() since we operate on single global ordered-wq
> for signalling our preempt fences behind the scenes, so even though we
> signal a particular fence, everything in the callback should be in the
> fence critical section, since blocking in the callback will prevent
> other published fences from signalling. If we enlarge the fence critical
> section to cover the entire callback, then lockdep should be able to
> understand this better, and complain if we grab a sensitive lock like
> vm->lock, which is also held when waiting on preempt fences.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Thanks for the patch. Assume lockdep complains if [1] is applied?

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/132571/

> ---
>  drivers/gpu/drm/xe/xe_preempt_fence.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> index 7d50c6e89d8e..5b243b7feb59 100644
> --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> @@ -23,11 +23,19 @@ static void preempt_fence_work_func(struct work_struct *w)
>  		q->ops->suspend_wait(q);
>  
>  	dma_fence_signal(&pfence->base);
> -	dma_fence_end_signalling(cookie);
> -
> +	/*
> +	 * Opt for keep everything in the fence critical section. This looks really strange since we
> +	 * have just signalled the fence, however the preempt fences are all signalled via single
> +	 * global ordered-wq, therefore anything that happens in this callback can easily block
> +	 * progress on the entire wq, which itself may prevent other published preempt fences from
> +	 * ever signalling.  Therefore try to keep everything here in the callback in the fence
> +	 * critical section. For example if something below grabs a scary lock like vm->lock,
> +	 * lockdep should complain since we also hold that lock whilst waiting on preempt fences to
> +	 * complete.
> +	 */
>  	xe_vm_queue_rebind_worker(q->vm);
> -
>  	xe_exec_queue_put(q);
> +	dma_fence_end_signalling(cookie);
>  }
>  
>  static const char *
> -- 
> 2.44.0
> 
