Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5228C77B61
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 01:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09BC10E46B;
	Tue, 11 Apr 2023 01:34:55 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A25B10E46B
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 01:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681176893; x=1712712893;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eZJ1Z4UUSkOI4BtB7xYcZZDdWfzVf5MxgUBes1ikleo=;
 b=UUY+e2X3KXcaLq7xz33RwuLKnHlkQHfdE5cF71Sf5n/3+Lwz0pBL+31u
 qQqsTOdBpYQqQnOZSjFEEDh1KyTSpa0BZps+h4NoaEyVHFoID1r0OyAx+
 CRCcteoud5xpCCqj3AwodCzTi4HvA7P3K9TjaDwLIdtMDcOXI58j1JKRH
 I3/dyJ+dEtCrJdNOpAGbToyuG4HzIgvZf/YZB/Q/TZZfFqGRVmmy5tkbj
 rknGATCrATfpX9ASbWQIrRiOAhRSgKL9XtuGdi9VX5YW/tk0CsEtZwXcD
 Ev6CudQQCc+nJSe5qtEZi8crJ1xHCusrLEmj9KTbBN8+B+oH7Uh4kCgs+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="342262843"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; d="scan'208";a="342262843"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 18:34:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="721016570"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; d="scan'208";a="721016570"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 10 Apr 2023 18:34:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 18:34:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 18:34:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 18:34:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHzsXzrOCuqheijZvc/N+XERe6XA7geEBdJzLa8gZFejW4vkrYxaZF+2Y0tE4IXCTPhNC/mxJVSuzkF5wMRx0cI7MS+vIwwrBazMU+JjQTerWFBlQyikDJHzC/GQaAPXviBtwNuTpga0Nl9PyH84YTO6ZJ1NDe0EhOZvUZ8Aj79tgto4t6v/KL+nVbK6+k5AUW6h2OCKpmq73IP7k+wJrHtL05SvowKBoUB/8LmS7nFXM0X99JtiwE6Z8CqgRMzjT1xIP45wmps/j2LQeyq+/OG2NbFmqlJkJHBdM5FhnhkEax4otmmVnYKI1keT+8FcQfJnBZcQHXpKPZtSPdCdSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etCmbO5LkQNBWkumF3h7GtlYN9H7Q0Z+O/9JmVFrNvQ=;
 b=K6U2z8M4UxomwV0a62MPyiYH2umjNS0mv53692ZaDUGuLV/U3tZEzPrjzMTW1UbA8Ut5U50vYPhTUvTHS/JWC0+JY6n+kTzRiESfUvKLjFiP5WanFQeTV4JQCUmVxo35BUbk2e+c+xN23cH78AdhSpKeOQHx8BRhyNBDhF0JELw9UngaPTza+Kx+i9tng/UUMCZMnZ/7HtNeM9QGXUWDj7+prhTY2IwHs/DdKTBxElxjF95Nw8qoIo/X5EQ6OaRnnGryvMrBu+jgOEOQXLwaZQ8vQzPWFwzTU14L1m0Ogc6HI1MwxVADK/fOOS1nr83ZV0zDGapO5x4y0xWxA8bz7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6440.namprd11.prod.outlook.com (2603:10b6:930:33::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Tue, 11 Apr
 2023 01:34:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%8]) with mapi id 15.20.6277.036; Tue, 11 Apr 2023
 01:34:49 +0000
Date: Tue, 11 Apr 2023 01:34:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZDS5MYHrz2SA/mgs@DUT025-TGLU.fm.intel.com>
References: <20230411002800.2779322-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230411002800.2779322-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY5PR17CA0048.namprd17.prod.outlook.com
 (2603:10b6:a03:167::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f7ca9ad-1b1a-462c-6a59-08db3a2cf08e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199021)(66946007)(41300700001)(966005)(8676002)(4326008)(66556008)(6636002)(316002)(66476007)(86362001)(6486002)(6512007)(6666004)(6506007)(83380400001)(82960400001)(2906002)(5660300002)(478600001)(8936002)(44832011)(186003)(26005)(38100700002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7ca9ad-1b1a-462c-6a59-08db3a2cf08e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 01:34:49.3525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGGE7JKiQpKyTYirFmv0ZMqsvlrOjAZZwFLjEY8LiXx90tvij3w8Cn6S2M8ZwbdJqYrsUt8XBrijijqAA2NTOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6440
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Invalidate media GT TLB for objects
 mapped by media GT
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

On Mon, Apr 10, 2023 at 05:27:59PM -0700, Matt Roper wrote:
> Xe is still lacking some general infrastructure to handle GGTT TLB
> invalidation properly for platforms like MTL where multiple GTs share a
> single GGTT.  As a temporary bandaid while that infrastructure is
> missing, make xe_ggtt_map_bo invalidate on bo->gt rather than ggtt->gt.
> This allows MTL's driver initialization to make some forward progress
> since using ggtt->gt (which is always the primary GT) results in driver
> timeouts while setting up the HWSP for hardware engines on the media GT.
> 
> A proper solution here will likely involve invalidating the TLBs of both
> GTs rather than just one (gitlab issue #220); this is just a temporary
> hack for now to help unblock other MTL-related driver work.
> 

We probably need flags to kernel BOs indicating which GTs they are
mapped in. A LRC for is tied to a single GT (e.g. a LRC for a BCS
hardwarwe engine would main tile while one for VCS would be media).
While the example you gave (HWSP) would be mapped in both GTs. I'd
suggest we convert bo->gt to a gt_mask long term.

I'd prefer just to fix this properly right now but wont block progress
either. With that:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Reference: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/220
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 0ae373b604f6..11461c02a831 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -271,7 +271,13 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  		xe_ggtt_set_pte(ggtt, start + offset, pte);
>  	}
>  
> -	xe_ggtt_invalidate(ggtt->gt);
> +	/*
> +	 * FIXME:  Multiple GTs can share a single GGTT on platforms like
> +	 * MTL, so simply invalidating a single GT's TLB isn't really correct.
> +	 * We really need more extensive changes to invalidate all appropriate
> +	 * GTs rather than just one.
> +	 */
> +	xe_ggtt_invalidate(bo->gt);
>  }
>  
>  static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> -- 
> 2.39.2
> 
