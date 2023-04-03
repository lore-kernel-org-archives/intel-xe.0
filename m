Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D41AC76196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 20:27:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC1210E564;
	Mon,  3 Apr 2023 20:27:34 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2E710E589
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 20:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680553653; x=1712089653;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L9/pJWSIWiQWC254qPgWu2PUP8kEODz4hTi6QzRXHQI=;
 b=HtfgFfeUVCXgrFPDNIicOLsd7Z1VMQx+iLwO3D0HIdN7kIEAVcnGa177
 /NqVMZyk86eUnICLR5gORuljecH+lTkUJpJU1yGnMObIF9h92Fo6FDXa8
 VfdYn+IypixdZUTfV3UHWMevDHsrhtMvRdmvkSdmqdv7ZaRz1K9njgePq
 zCZ5TxxMS8lwvXgq44Ey+6wTMCJyE8cyt2X0T7w+QNOHrAVCNXqxz3SNU
 qibEQK+pEh98/pxRr8+pMgQTDvlQ7/SSD9qwQo5PzP40Enhp9aVk5omDd
 63xOHcjK/KrXs1QFwo+jmQwHcdUqDDu70hN4Mw6zj+sXK164wreRviIie Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="343703507"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="343703507"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 13:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="1015853444"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="1015853444"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 03 Apr 2023 13:27:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 13:27:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 13:27:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 13:27:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLBDTFFA0CJyyHCWewM09aVE8q6w5+KMo+hz16J8g3XbejrQx05YUypmk0kymn88QMb7ENFHaecjLFMmwlTPUvi60ITZV0cUdLOCRsDDAtCD8XQkKi69Eg8M4y1obzUvjYgczkhIm5B7ttX7PcaDhEJMj+0HhOtnlFRL8VKht+pkeNtLSvMw2UNqjAmYLRv9F+hNVGb+Bxb+J2zJYFpxqC6UhbG/Wh7/enyHHH5J/KB5KzSzCOsVmDAGQI4bbY/V5kyccFVIdo9ABJvs4ZLwoQNlAlGIrThLIde3rvaWooUNjumCvHyXG5HtK7pob5psV6RMjAb9NOWe8Enz4xxMng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1e8uFP2jwXLmY+pta4KF3hP0NWQOC10RbRagnRiCeq8=;
 b=EGCHOH9x41dYOXMfXSwPBVdVsk6TDZcscRH+w0Av/RTaGyxSXsBG1t2w5FjhCKWRhGtPrU/x4rwB7ac5jCDavzSbvAiLSEzIKwONkNOOB6hW6mJHTQ4svASUF14qXfhN3mgjNXrJ3+S7diZiID8aC4s/pUOLXxwODtbbwe2zZq+PQMcKRDOYbV2j8NlC2ChAWmPR+cajRkVN0AphrwTr/aBumxTdPBt492o9PhrweTv9yB79E56asaeOKbLq4Gry14+OYC2Y2vPK+j+oykXLQnHRo1FaF8u7ViY+0uBlIVyCft1ljpvnjrK2XQsDHRDGG7embPUay2/Ly+mkvsuIrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BL1PR11MB5317.namprd11.prod.outlook.com (2603:10b6:208:309::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 20:27:28 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 20:27:28 +0000
Date: Mon, 3 Apr 2023 13:27:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <20230403202725.GX4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
 <20230331102419.521392-3-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230331102419.521392-3-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0095.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::36) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BL1PR11MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b8d4723-7da9-4d3f-1c22-08db3481d784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lB+DZ0iPlA7yQi3LRZZickvqBhRyWcx8ZS2jQUgQrcb4h36bISto1GcT4bvigWPCbKen2iIp4jjOtYBvEirdxce5Dqhcn04dtA9KWK0tkM4/4n2xxwvAjbagQWZ24eCRNCN+txtL5q31XvX7Ue8a7K+Kcz6/B4y38ydM81BUVDtstCgq0QmcCXAN3h0JNCx///C57TKvcOcr9zQk3KmKfhi4U8lnkX9pzH01MXkE+yrO4UsjpyapAu1LsJqOF+y8ZjQ2tZUCNSOAroKH1y98Y8TYf1dGnLhj2JKg0YBa3sFhFPaA650ZlALXjwLIuwDbOs4LuvJ59u0/Dni/RxAWr4BnN9qWgEbF9V4sPwsCTtQCgogsnR1sfSUTcUHStEwvHEqdwQz4itTdvJft2W3IqMJszmUqqNkA2kvdUTYhGc0qlzRvFM846WHoGGBET+DogunYU31Azt+k5TPBDMya6++rW69ZYb9n87gKGuUR4xOUkQn1RDNeMGMEh8ceS9QyxCOE1e0Mor23iaZZNzdlGDnf7Lz0fRDWzj1+Yf2YjWlhFkdYjlDg2fAfbpNPAOrp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199021)(33656002)(38100700002)(5660300002)(66556008)(82960400001)(66946007)(4326008)(8936002)(41300700001)(6916009)(66476007)(8676002)(86362001)(83380400001)(6506007)(26005)(2906002)(6512007)(1076003)(6666004)(478600001)(6486002)(186003)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ciMdk14z+SV7dHWz45t8iIDjohUOCPgYuMNoUE3vgnVhHSfzNGa/OngvOZ69?=
 =?us-ascii?Q?N6KVsvWGI/6QmPT92qqUgAba0RfZKCSSDYKXcNlRHu7R8l43UrVizNSdkpA1?=
 =?us-ascii?Q?wmlUG3BiWTOyx4ps/H+5/vZDsQVcesCpudm4tJReLu7L7rAsyWlMMDLxdBTY?=
 =?us-ascii?Q?hd5d21fQfHTAlYqzeHA2V4XHi5LKmigcmx7FJI8IDCerSgmbiHEYkY6TBR8M?=
 =?us-ascii?Q?cEE0iwDc7qx5xaZtZwsxUAt7fflKHAdl++GpWMuJAMf8dwJYfWrWGZTQuSDp?=
 =?us-ascii?Q?LxwJZ568pUyK54xAK/K5znnVxxNxWrmNEMHYKbFx4i/jvVNA4oFuZm4Dczgb?=
 =?us-ascii?Q?m9mQ9JpkLRBWFXoJ6GsBg6pHmPnDeuYrE1uP6fD6Dfr5J7OjkfgUcn1kilpf?=
 =?us-ascii?Q?rkKEQJWcJhpcxzrHGHzCUB0C8q4T+Q6TlxvtDG9s793ckAM7rtsjNRNBNeLs?=
 =?us-ascii?Q?t1Qpe4I2VreFVRJXZVB1+lot/PA/A3eO+JneUeJ9gJex32Q6AFCIQX1yTed9?=
 =?us-ascii?Q?m7IhzUli/xcnx2PsG1Uwn+Ei/zkUYf0z0MJ0cz7nA47RcZOdMY9oCXNE+olS?=
 =?us-ascii?Q?NYje3Ulr46jT85Esl8cDmHIroBvbozTXgvxFY0W6Mketxx5cgYFpi47Ls4I7?=
 =?us-ascii?Q?tyK86AXOlXD3NLBT2fHQTwZrzQIpJGKM8dj4yx9UbZlwceMPXePOw+5j6PHH?=
 =?us-ascii?Q?pufStS+7OtB1nrRDkKNPEdlmQEL4WUBOrqQwVJYINHb4BlHJfSniaNPCg8jJ?=
 =?us-ascii?Q?mVbbMfUnNEP4M02Yd/ZlIvDNwZdEbAgXfLzFSbtMaYPp8jHxjEeY504zUlB5?=
 =?us-ascii?Q?ZN69fMwbrq/qqmWaoq7KSO1uaBNG6ZifONsRXLTz2VEODE5wJL+aOr+YIYeZ?=
 =?us-ascii?Q?LNXq/p5hfOFo2KcWr7oVJvFkyAszYn2ZshTnwqx3vFvSpo/FsoIIL4irE93e?=
 =?us-ascii?Q?am9y4drUETlsmkUCSCHav/CNCmxXgBfvyZrafPPl47jyAjNef/jMK7xwgDM0?=
 =?us-ascii?Q?9YgH2zC/dsulHqEJEL2q5Qh3QnVJWGTrjh4mRrgTeOQ+0U4fnGZjfDFGTiyX?=
 =?us-ascii?Q?DUNKlvpsbtVXSQt2jGvpl5Gp30pKffWRl0UPJFtAf+CqmgOY7w9o2IRNGwPn?=
 =?us-ascii?Q?IyQq11CfOVJzbOAQ/duEzXoILK0qpmNpaOjrJIRKRPW6b0eTdWPMkatRUVkb?=
 =?us-ascii?Q?HBOdaX5wIU3jGSilGUpfu++PMFqQHaNqM4WapTzFYBz3NHQmEpS+RyEt+/Zk?=
 =?us-ascii?Q?ytjmY/8XnWvN6TV1Bi7V9oxLfRvFpLp0A7J0qecoQdiFFYlvm/0LGE3njX1Z?=
 =?us-ascii?Q?/zty/jUkoG67YoBfvcyiUqQEyfZAA0pZbbvvovFiiNaXhpo3lL0aCczgSKe9?=
 =?us-ascii?Q?3DK9Z4QvCdk2kpTUfh4kkR0yNrv852jGOhKdilm6DHTDmE8h21jKtIM2MPWO?=
 =?us-ascii?Q?x2SUcdv3P5gems3Kb0J5NYGVEm4B86p5n4VknNxJ0f3wopXsjiVhjCfLt+87?=
 =?us-ascii?Q?06Mmudh2nrQcoXZYTGZL0+uDl36/ic3VPpjzAaPrP3ShXrK8cDGumpTiSERx?=
 =?us-ascii?Q?UuhtjIW5oZYtMbNs28w24WxzsZf/zTELKa5hxcOeeedbtEaQ9bknRjjLGS0J?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8d4723-7da9-4d3f-1c22-08db3481d784
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 20:27:27.6549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJDyUXx6juTxd0K4DIDeFmblyqtksaaaIrYVuxWiye4i4/1vMSEy26XVGErsZI/rGiCvP6mIGvCBVAdnnwJ2GKyiunbha7jd0NRkPcG+10k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5317
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe: Use full_gt batchbuffer
 allocation for media tiles.
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

On Fri, Mar 31, 2023 at 12:24:15PM +0200, Maarten Lankhorst wrote:
> This fixes an oops on media tiles, because we don't initialise the
> bb pool.
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index bc821f431c45..c7a2e9baabfb 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -237,6 +237,10 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  		struct xe_engine *e, *nop_e;
>  		struct xe_vm *vm;
>  		void *default_lrc;
> +		struct xe_gt *full_gt = gt;
> +
> +		if (xe_gt_is_media_type(gt))
> +			full_gt = xe_find_full_gt(gt);
>  
>  		if (gt->default_lrc[hwe->class])
>  			continue;
> @@ -262,7 +266,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  		}
>  
>  		/* Prime golden LRC with known good state */
> -		err = emit_wa_job(gt, e);
> +		err = emit_wa_job(full_gt, e);

If we pass the primary GT here, then we'll take the wrong path in
bb_prefetch().  That doesn't actually matter very much (we'll just
overestimate the padding needed for media engines, which is safe and
something we already do for BCS engines), but we should probably just
drop !xe_gt_is_media_type(gt) condition there as part of this patch
since it will always be true now.


Matt

>  		if (err) {
>  			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_wa_job,e failed=%d",
>  				gt->info.id, hwe->name, e->guc->id, err);
> @@ -279,7 +283,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  		}
>  
>  		/* Switch to different LRC */
> -		err = emit_nop_job(gt, nop_e);
> +		err = emit_nop_job(full_gt, nop_e);
>  		if (err) {
>  			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_nop_job,nop_e failed=%d",
>  				gt->info.id, hwe->name, nop_e->guc->id, err);
> @@ -287,7 +291,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  		}
>  
>  		/* Reload golden LRC to record the effect of any indirect W/A */
> -		err = emit_nop_job(gt, e);
> +		err = emit_nop_job(full_gt, e);
>  		if (err) {
>  			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_nop_job,e failed=%d",
>  				gt->info.id, hwe->name, e->guc->id, err);
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
