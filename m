Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E619EB64DD
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 04:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7D210E3DD;
	Thu,  6 Jul 2023 04:04:21 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B305010E3DD
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 04:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688616259; x=1720152259;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iZwEQlzgO/MSc16uBzUAyDBPwkBVkFSCNk4+vkuv9YY=;
 b=Fw8WcKorS84ijdApp8tTdMojOh8lsCPuWHXVlhVABVFJ4nY1d+IvDDG7
 8lPwS+GtEfn0myQN38XJYUWdPUyDThr+DShuSWdsEYzvLE7UV0eG5t185
 +r/oikfkbBBcJhVT9e/zpvcjh6Dn7hxhWenuLZ6KZq5yWBi3j79C9Q1WL
 AC99e0DvTWGgN/Sr8EF4UGcjgtymzIN64XePe+B+fyyb29VKJ+EX5oX4k
 SKQoy4iG/rizVj6ASoZhOIpwIUhog/Mh4/bMd00cSE9aoJesPYhA65bVj
 JVRnH/pqzTADrERa1uKnAHLuy7YiKSXmLb1vZyBKUesCYFg6m58JDEvon Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="343094244"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="343094244"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 21:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="1049940248"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="1049940248"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 05 Jul 2023 21:02:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 21:02:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 5 Jul 2023 21:02:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 5 Jul 2023 21:02:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLrfAqwckrlc4hL6nJ03qzU45jH0CLMHS4NcCXhTVQ9o7EXpd3kubUgJ++AmoiwQnI7PK6MixHN7sNfM6s+uakKSrqzJBd3zg1ia8hfAHsLrf23hIDMMkhd87mmKHVlOeP5JTHaR7DBs9vqp26D2DZONT/0RGyl1h0SIgmTn63YnzzB5UfdekF/8la3UGa8+pr693XEjc3hIswayiAqyvy/3W9OWzF77qQf7Ray088z3UpvU/5GPV9bZEb+goCbwWvvSRKKoIq7dtOytj2mfYgUc1PHEm7+VtRZhXucVTa8IEfOrJwMtkm9rz2TnuhmwlIEZR5n8kzUuQ/bYf6rS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHf2fab9iT0fhBtEWc/nmaDrl6Ra0EYe2g1WwTMSNpI=;
 b=Jfvcib8x/pv0iYngoNbsaYatiIMVohgeoo1/OONKJMbBlIuSiCToiSeWLMIQHfv3HLuR6YXMTSx3bFda9CmY2zdpblcrW7vcXMSQeApPI9ZocXwf5loEI/orgehN2SztMAUNbQjWmagmxqQp7BuvHtODSNIMXR8q2i4iTuOHoGto1cqFFwEEPKL2Flrm+MkJ/NJZhLnSVzEJJPoRk252+y52/Cfi7rc3R5Kp66bHEziAZd0hXzh/3muyvpGqzHkxNHExumegtDk3/4QxZl4pGjZvJlHxx+fZ6jz1oRP7jnKYcWqj6lKjBfLuPPmUKO9+Ft7vZqLjGuO5NRIIs6JWXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 04:02:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 04:02:09 +0000
Date: Thu, 6 Jul 2023 04:01:30 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZKY8mvEtFdEaPBei@DUT025-TGLU.fm.intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
 <20230705160602.237213-14-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230705160602.237213-14-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR08CA0038.namprd08.prod.outlook.com
 (2603:10b6:a03:117::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5420:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d085230-03b5-4f5b-c043-08db7dd5c524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s9Gi7T/MGZwRFKvdDmD0+86Brr7JfCTprLi/FeOP4c66C03h8mVEPK8pY4bnUKZl4Dc4fnKmXs2t8naPH76+prdW8bzecLdlAKg/Tmy39oe/In2xN6LsvwVk/fVxenkizboOFqrxZoJz86HPJrX7FOJxEqKYtW3KphQkhUWBItlHBzoowuIbw4XPSEJVSM9nL9i5HFh5njMf0W1en7VWpX5/ubttiz6aaCRQiDV5OE8iu7k0Jhjnsdb++wMCpmzowlTKgzaYtjgKnPphFu/iMv1OUN3GlaQUU/nyKUTXnwyhUS7wn8eLYutwlei+k3z6r47bhArlFmXcfIudTgKziMZcod0q6OZaGWANvSBBlK85+I5jFzZxhqdtUXRLYWRJAFREtoo5wSMGkR4KpofuYJR5DDwcLyeqkJbE7AeENed6/445xEARfHCSEkPZo5tgtwyphB8JMVIEAu3eEb4sxryFO3rAojBd//kM2XyplkjiG8UUyNuNl4R6d2Gkbw66f4LEVqnp4+pCkn6qyGuMV0FzvWh777z9GPyKNlcd48reTL7UpYU9M0/0xEAxs6tE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199021)(44832011)(26005)(6862004)(8676002)(5660300002)(83380400001)(107886003)(186003)(6506007)(8936002)(6486002)(316002)(2906002)(6512007)(41300700001)(38100700002)(6666004)(82960400001)(4326008)(478600001)(6636002)(86362001)(66556008)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pjM3Jv9wYiyhbMsRW5NJr/qs1nzLjzGMNb1ZA41menFAV108kth/IzZHcu?=
 =?iso-8859-1?Q?O93opazRzQzQWLS04QAaeu9DEUx+0Kd3qA/nbjUChtP8ee5eysR1QCji8h?=
 =?iso-8859-1?Q?nBZMOQPtJb5NkTeXyoJAgNJLuMbwraN1t6lyluZKOyIbqSg8BZ3mAuaSBD?=
 =?iso-8859-1?Q?eIFep091w3/UdV0/ppZ9LTzmfU5JZCdbnq4+pNRnkDUA60Lt7eoeSrnTnu?=
 =?iso-8859-1?Q?TjMnc+IAKU+jjQZXdd7sg+mPSepkUJ7w3a7uPqDUjYTsssEowOcMCHoxV4?=
 =?iso-8859-1?Q?tFH0T+84wvh/pnqPkJ4v8gyiHzECrtIAab0UKJIgXou3zWizx1DE5rjaF9?=
 =?iso-8859-1?Q?s3iPKs18cpGFhMxBc6BXuYfagdDP3/LrRHuh4e0m3x0BbqNnE7FLBQmx36?=
 =?iso-8859-1?Q?mifqJba9EZkwln9n1M/rzDQgi4/6QKMcTjqS03b8QRg/7ggMmf4NwVGPq4?=
 =?iso-8859-1?Q?oMU2xRIwi6pC3GfK+c1+H6ijXLhLZ8bo+q9wfAFISNS4DDer7J5tP0VqLH?=
 =?iso-8859-1?Q?z7lZrd3q4Tf7UWPZwVwtjUBOxMTOPZrsXNsPcgQQG0M2Gdmpkxer7iQmUS?=
 =?iso-8859-1?Q?k5+xJFDgCyG5qejR7TQJTABII+4TibErhSO2Pp8MYVefKU0KyCj2r7cnlj?=
 =?iso-8859-1?Q?6ykD2XfCIBcucT3yeuF+33bRPP/qP8r3XwEKisbhkquDvzWDdiVDy76VmS?=
 =?iso-8859-1?Q?8uyA1mzAvCz7eF8xpG2ArbmaRltT61Cm8Zlv87cykAF3+TFpSK2INLKBop?=
 =?iso-8859-1?Q?lvLHVRP3NVoP/a1N4haI7afrMbOLMhIZd6DVXVthx8isqHpHj3ZcA4Ua2O?=
 =?iso-8859-1?Q?jeVvW5OoKDo4NHyKlr2zHWJ2kZeOhm6R1aHyEz941mRpCE36Wmt/nCrdUp?=
 =?iso-8859-1?Q?TIwcY0i9m/mC6Pq/5OnNHctImuNFpvFesZWF3svG/TWLjHpCGACDBMt480?=
 =?iso-8859-1?Q?DnnQ9kt99Htdlf4rAuMzIMahnPIShsB+pMD4HrZ685c3bP185LPrfgIsRG?=
 =?iso-8859-1?Q?bu+TwHMFGcIvruWXikjGfsxfGqAONC0btW3Lm0E8qfHKBtWu2u65RiU+Dp?=
 =?iso-8859-1?Q?V3wwGzlJLdfxeh1OnDe8W33w9A89uzAyN85JFy+/aPinBay1phW1l8cuA+?=
 =?iso-8859-1?Q?bHEDDLlbygPBbtt6jXAafAgoa0BQ/Nb1GxopgEiAwjqojO2kCcOrgR12zJ?=
 =?iso-8859-1?Q?JniuVLPjGTRkZ49bLdp/gbdtsA9Al6EfhobkEIt0j1JHOyPH3IfAB5/w0w?=
 =?iso-8859-1?Q?LShxWQjCAh9iZ3+tX/HUfy0pMji/iE6lVsh21rrduDCl+UlzQJ+Gfa4oRh?=
 =?iso-8859-1?Q?LB6oe2nPi94jBABXczmuoIWiFFOT6/rQCyfP/fB5QUFsZ0BQRLdvVe/v4/?=
 =?iso-8859-1?Q?GB7mXZQnECoENre0YT23i8cJWl8/8OMOVCRAZO90LQhuX46p7LDgY/Fzdo?=
 =?iso-8859-1?Q?gYQMt4oRa5Chw+6FYA6lytCbrDOEzcO54/fO0HtKfFKDgSZ3JupcUYMD99?=
 =?iso-8859-1?Q?wpS42UhxkXbvF4tWGpitxvW50vCFybJlhQ7lloGFTIW1nqbXdm9TU25a8p?=
 =?iso-8859-1?Q?Fh5yTH8cHr0zuk9JJxpHsL5KIMf1KbOAbvKE2j2DazX2E3isv77efdYgo7?=
 =?iso-8859-1?Q?xX4aJwKNI3qDg7Jc30t++VLspFQTSAzllA23dIgjLxwtGe2GlT/n36mQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d085230-03b5-4f5b-c043-08db7dd5c524
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 04:02:09.3404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7OH9PixvFuh6A2PQYYPeOka4bljZU/DsW0HVnN5iwQ2yLydEDBF2DaVOHO0zLKi4Z92axrLbXehg9IAMCSNaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5420
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 5/7] drm/xe/gt: tweak placement for
 signalling TLB fences after GT reset
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

On Wed, Jul 05, 2023 at 05:06:08PM +0100, Matthew Auld wrote:
> Assumption here is that submission is disabled along with CT, and full
> GT reset will also nuke TLBs, so should be safe to signal all in-flight
> TLB fences, but only after the actual reset so move the placement
> slightly.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index bc76678a8276..a21d44bfe9e8 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -519,7 +519,6 @@ static int gt_reset(struct xe_gt *gt)
>  
>  	xe_uc_stop_prepare(&gt->uc);
>  	xe_gt_pagefault_reset(gt);
> -	xe_gt_tlb_invalidation_reset(gt);
>  
>  	err = xe_uc_stop(&gt->uc);
>  	if (err)
> @@ -529,6 +528,8 @@ static int gt_reset(struct xe_gt *gt)
>  	if (err)
>  		goto err_out;
>  
> +	xe_gt_tlb_invalidation_reset(gt);
> +
>  	err = do_gt_restart(gt);
>  	if (err)
>  		goto err_out;
> -- 
> 2.41.0
> 
