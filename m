Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE422C7EE2F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 19:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850E610E0ED;
	Mon, 12 Jun 2023 19:49:49 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA83610E0E1
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 19:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686599387; x=1718135387;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9v2jm8BixO2IsfeH9hh/N4nNo6LPPtc1yh5gyz5UO1o=;
 b=SC7uSXUtSJZKPbv1Wo1npHbu+sdMHLZfCypPip4FN5ncLoKV8hz0cqgK
 VipCcpsJvQN4xTJd9FFaPov0L5sNQFQfcqsu47Fk0aJ0a9cwkme1lHRcl
 HDM1yg4vm6h/UYxdg7mEFQU0PzYVrxWvEoXJXm14NFcT3cHSNrSmW7KOB
 HdBLPsuxKb9O4iEvPcaUtXynWDUyf0GQ/CC3PtUlgqRxEggkUIRFxmwZb
 yc1eL/HBuYfClcvNZIWxlZGxBUywAb3xZMU6BAMUYllRr6YeSowkhB0zA
 K4gVfep4GG/YoIU+G5y0Uob4QxzFOvUfgbYTy+m/fxpTRu/OzuaWEn5vY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="342833281"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="342833281"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 12:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="824093397"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="824093397"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 12 Jun 2023 12:49:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 12:49:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 12:49:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 12:49:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGwbvIqP8MmXZpNIjzr/Ms3igxpZFvV7eLq0Kn2BdPYDyoh2vCe7UcL0bTjyhaprfGiZ9B45uQ8MHSNm63knnFnycteUuXTIReGd+hOjsqsbqYgOmBRt8M9LZT1X8qWYG1yXzSK7WGIgn5OJI9OhND+32xqZfOkFdlmeT6pG4MFtovTcFpFc14kwK5kTCfa5I9dUXlSCgasVCftQw2mzporJce+LPAOsOM/CyPD9pdfgWQA8o688UqShBVPvypjVHbTMb5gdiWsN52ZAPJYw/VblZhWZUKIuC38fGnjUtUc3GB1NPtLHgX33lmQ9zcWAQUVoGESAZ2uPYVGtSxhloQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rizqMFmJpqtuCo5H30QtyspO+S5jqss7m/QCZ1IexzU=;
 b=dy9umDONo26WbAqQInjDnGp/X+Yo/yXAtyPifZTv3sWMzrLRIx88gVJ0ZScuGYVqDqkKfg/arHdZNyzebQ1u+EkysBUS0X59JhPDrC8vjlW24kEDnkpLnbEBhQ/o1JsfhJsl1sIdvb0XnT43fckIIVlf/rKWtvXchoS/mzNRDE3pAM2CKY4V9cpul1eMERAVbjHgMo6lFx4i+y9N32OU3nnrgN3hbsbAIQN2t4WoEdTxGdpx7UKbZewSGzgJxq4rhbwyxcfNZKejP5ifTAa2mk2fPtI+/d4CvmSCMm39e7V+NY4kTkjWDbTz2J+gJKe8KVQtM4wbyXwhBtveAXmlJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7066.namprd11.prod.outlook.com (2603:10b6:806:299::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 12 Jun
 2023 19:49:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 19:49:43 +0000
Date: Mon, 12 Jun 2023 19:48:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZId2qzuZ1zBkGQx4@DUT025-TGLU.fm.intel.com>
References: <20230611222447.2837573-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230611222447.2837573-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0086.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b07e2a-8119-4879-be30-08db6b7e2b13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K8nFavp2Z4TB9NpwlyE+vefeKtm4Qw143dV6B+cxXqRqpe5OEYDxFaWWJgvZrSf1htitu+H/DYeu/cIkNVRROB6Qc4l6L/lvBo26oz3OU2OE+sTkxWcZMgDMdGAtGj8DvHNuFCO+CQAENQ/3wK7xVqoZz2BOPXeP0P0IoFnDeztMk81uz3Ho15An3M8hpS4mFJ6d65CXrq7aEqExe/excj6Kp98gUdKMk59/XHA4kjfn4vv5Ppw3kI7LyhP/qI2qNRRn9/KdN7HN4VRdX4E+LJzSGgH/uGnViCKaXCVC52PAr8eSTqDmgo/7hwVZzxfUHxCYAWV2N0GHIxfUaAiOLEmhf+uUymsaX8D5NP8etX9M91Z5u+3EPzidY6R7ntUvrxZyAJcEIGsrPJTBBxO4c/EfrzThnEeG8Az/G0Bf3XJuChVylYj8Z0ECBUpmzAhP+J/BXPaSzZ5ymYx0U6+Ca1qnzsOcqUeZBPxboxIjnA6Yul5jbLpcJEdBfZGGGAH4AHGiwsnKPPJZU7/e1m1koMktrReK7O6MfF38SLhZ+uRA3O3PKntjkitv6qD50YXU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199021)(82960400001)(316002)(38100700002)(41300700001)(6486002)(26005)(66556008)(478600001)(2906002)(86362001)(6512007)(186003)(44832011)(5660300002)(83380400001)(6666004)(6506007)(4326008)(6636002)(66476007)(8936002)(66946007)(8676002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r70lyz9PYUoCpH36V0/IAbjEha98u9IRw69vavUdcv80Q55rHLKyg1zeI/vH?=
 =?us-ascii?Q?kknLqaZEPNFH4Nbo4PoObjmvYoNu7ynH5t9e6TdSevp8C/rec1A4KBAaA8ZX?=
 =?us-ascii?Q?dmKGIdxTITUtWONE/EmXZgaIE+vboQuHyvSpUZV7mNCaRb8Z4S0sSzeEBXiz?=
 =?us-ascii?Q?YQqFP32ID6OEXvb+VvaJ5fpcw9LXP+sVua860GMdw4uCkUKLbdKYDAxFNX65?=
 =?us-ascii?Q?EMO2oIxEIec5NeWqX6N/u90swt1qHTHU6Jgf+YYn0diuYdYDh2JaFWkD3aXO?=
 =?us-ascii?Q?do52tTpC0s2LMV6TRvoghSbzNqyQKO7/iyy6MqdYAll6Ff1RQa6OmMvm8Iwa?=
 =?us-ascii?Q?nYMNR4tpNgsUPff6TIqUY/MQyJl7+oF13Z1rrgBv6rsJmakNsHP377oxOhxm?=
 =?us-ascii?Q?uXtTfZvrSBcbLGS6UzGiUaR4wy6MN0rrs1cFh/5z4+oCpwaZ/S1JDBlgfZF1?=
 =?us-ascii?Q?ARlAaJXJbcaJJ9o7koGheEY4uCsoKlXFup6buom8WLf4znSWeK8rvKpAwWFG?=
 =?us-ascii?Q?JgCWvgBb+HBj8CL1pNkKpDAQ612QJyjhYK/ux+KQeiDyOCZds8FFX4t+6Ywb?=
 =?us-ascii?Q?a3KXr+B1xUeW47oNaQhfZD8Dr1g7scN7yVN7uFwLoPYIKgch91npYESYi2GA?=
 =?us-ascii?Q?VxRJjjloyG2lBTjKu4jnTE7C1wMXE8df1CyaPOzARH7s3X7ZVL7IYcXiGOXe?=
 =?us-ascii?Q?8bncQ3u3Ky2O0s3XZqJW0KQSO2O0hqOEkSdU0VoGvGNx2REpx/bi0dMHvw91?=
 =?us-ascii?Q?vtdT2vjm2AHXKG4glpb/2tJJ2MQOcKkJt5bIhWJErfEMYgwEtWqY1ouLwMDl?=
 =?us-ascii?Q?fc9ELq+2e2Y3Z9HDBeZe20/sjFdqv6W8o1+qAoxEV+WtnvPKh/cfVL4IjY4H?=
 =?us-ascii?Q?Z864INZbGUdjOys68ZQFfgLX3la33mlEjaUGXR7lw7RtJX5ZCGjcviLSnkUC?=
 =?us-ascii?Q?qEZTmr99630gPxElU8iJPqyEurB5MqosUcYxRRrHXYadx5Zoi7e5tZeOx7uK?=
 =?us-ascii?Q?7IMgOCdFfQhtIDqV7WyysASRe8vk3XmPpNFsiL5XwONDnD0w6PRga3uOfrgO?=
 =?us-ascii?Q?1Zd0cSYgxCcG+tDsiRNeARVO2t40wnWHf2l8ATRpNugmrGYoKZy8eCwHB1Nn?=
 =?us-ascii?Q?NbdezjdZ0Bm+eZP35CIHnUQ7WQ/Cc5oyEdCEBpQ2ON9ufK12WIflqSLZ6SzL?=
 =?us-ascii?Q?WTTp0Emy5J6v4qZghlN6/jwpdWIg+9Ul26CcxSV+H+Uy6lBor8/ksegY0GfZ?=
 =?us-ascii?Q?n47/jbJDVZ3fBiVb0yBRa94oSVgsgE9wDoSejGDlI9iel5h2a8UXPLNDOMgx?=
 =?us-ascii?Q?yST5jRJKCMoxqZ8XiVX4ew0UsZ78H7Kvsjja55/5waKM6DOgShKsm/iqwXcj?=
 =?us-ascii?Q?4VSgaumtI8R9c8+1B1Xft1A4SrDOvtBxPI4WmfQpp0KDoL9pUjxIFkbNu6/L?=
 =?us-ascii?Q?2yCLHlW3uyRvgz26PQ1kIVwLBzd88KR0QcGBaH8jVNm2fCy+RwGWNsPhYxv4?=
 =?us-ascii?Q?W+OJUKwfBDwcUTPzjGuoBX/U+TI3sYK/SOdy1pGoL4gefGoQU8I0/WBkw/Oh?=
 =?us-ascii?Q?b3Bpm0zFJKpfDPzJ1g9GVcxwSM0xK886KWnb2Q5LdBPEOIbCk7dteSKqpKFU?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b07e2a-8119-4879-be30-08db6b7e2b13
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 19:49:43.8592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBCOerFD4xM/H0GEx2TyzwXBUS4UFcUEBZf04bE6rJJ/9FsCIBpI7HaRM6UUU4xuovShg0neGIyyNs4nXFqIBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7066
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/5] drm/xe: Rename pte/pde encoding functions
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

On Sun, Jun 11, 2023 at 03:24:43PM -0700, Lucas De Marchi wrote:
> Remove the leftover TODO by renameing the functions to use xe prefix.
> Since the static __gen8_pte_encode() already has a double score,
> just remove the prefix.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
>  drivers/gpu/drm/xe/xe_migrate.c       | 20 +++++++-------
>  drivers/gpu/drm/xe/xe_pt.c            | 38 +++++++++++++--------------
>  drivers/gpu/drm/xe/xe_pt.h            | 10 +++----
>  drivers/gpu/drm/xe/xe_vm.c            |  4 +--
>  5 files changed, 36 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 60266fea7faa..4c79c1dfa772 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -300,7 +300,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  	/* First part of the test, are we updating our pagetable bo with a new entry? */
>  	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
>  		  0xdeaddeadbeefbeef);
> -	expected = gen8_pte_encode(NULL, pt, 0, XE_CACHE_WB, 0, 0);
> +	expected = xe_pte_encode(NULL, pt, 0, XE_CACHE_WB, 0, 0);
>  	if (m->eng->vm->flags & XE_VM_FLAGS_64K)
>  		expected |= XE_PTE_PS64;
>  	if (xe_bo_is_vram(pt))
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 86df1be3af8f..55e113dd7e82 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -189,15 +189,15 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		return ret;
>  	}
>  
> -	entry = gen8_pde_encode(bo, bo->size - XE_PAGE_SIZE, XE_CACHE_WB);
> +	entry = xe_pde_encode(bo, bo->size - XE_PAGE_SIZE, XE_CACHE_WB);
>  	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>  
>  	map_ofs = (num_entries - num_level) * XE_PAGE_SIZE;
>  
>  	/* Map the entire BO in our level 0 pt */
>  	for (i = 0, level = 0; i < num_entries; level++) {
> -		entry = gen8_pte_encode(NULL, bo, i * XE_PAGE_SIZE,
> -					XE_CACHE_WB, 0, 0);
> +		entry = xe_pte_encode(NULL, bo, i * XE_PAGE_SIZE,
> +				      XE_CACHE_WB, 0, 0);
>  
>  		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
>  
> @@ -215,8 +215,8 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		for (i = 0; i < batch->size;
>  		     i += vm->flags & XE_VM_FLAGS_64K ? XE_64K_PAGE_SIZE :
>  		     XE_PAGE_SIZE) {
> -			entry = gen8_pte_encode(NULL, batch, i,
> -						XE_CACHE_WB, 0, 0);
> +			entry = xe_pte_encode(NULL, batch, i,
> +					      XE_CACHE_WB, 0, 0);
>  
>  			xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
>  				  entry);
> @@ -242,7 +242,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		if (vm->flags & XE_VM_FLAGS_64K && level == 1)
>  			flags = XE_PDE_64K;
>  
> -		entry = gen8_pde_encode(bo, map_ofs + (level - 1) *
> +		entry = xe_pde_encode(bo, map_ofs + (level - 1) *
>  					XE_PAGE_SIZE, XE_CACHE_WB);
>  		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level, u64,
>  			  entry | flags);
> @@ -250,8 +250,8 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  
>  	/* Write PDE's that point to our BO. */
>  	for (i = 0; i < num_entries - num_level; i++) {
> -		entry = gen8_pde_encode(bo, i * XE_PAGE_SIZE,
> -					XE_CACHE_WB);
> +		entry = xe_pde_encode(bo, i * XE_PAGE_SIZE,
> +				      XE_CACHE_WB);
>  
>  		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
>  			  (i + 1) * 8, u64, entry);
> @@ -1231,8 +1231,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  
>  			BUG_ON(pt_bo->size != SZ_4K);
>  
> -			addr = gen8_pte_encode(NULL, pt_bo, 0, XE_CACHE_WB,
> -					       0, 0);
> +			addr = xe_pte_encode(NULL, pt_bo, 0, XE_CACHE_WB,
> +					     0, 0);
>  			bb->cs[bb->len++] = lower_32_bits(addr);
>  			bb->cs[bb->len++] = upper_32_bits(addr);
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index bef265715000..700170543e9b 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -47,7 +47,7 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
>  }
>  
>  /**
> - * gen8_pde_encode() - Encode a page-table directory entry pointing to
> + * xe_pde_encode() - Encode a page-table directory entry pointing to
>   * another page-table.
>   * @bo: The page-table bo of the page-table to point to.
>   * @bo_offset: Offset in the page-table bo to point to.
> @@ -57,8 +57,8 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
>   *
>   * Return: An encoded page directory entry. No errors.
>   */
> -u64 gen8_pde_encode(struct xe_bo *bo, u64 bo_offset,
> -		    const enum xe_cache_level level)
> +u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> +		  const enum xe_cache_level level)
>  {
>  	u64 pde;
>  	bool is_vram;
> @@ -97,8 +97,8 @@ static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
>  	}
>  }
>  
> -static u64 __gen8_pte_encode(u64 pte, enum xe_cache_level cache, u32 flags,
> -			     u32 pt_level)
> +static u64 __pte_encode(u64 pte, enum xe_cache_level cache, u32 flags,
> +			u32 pt_level)
>  {
>  	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>  
> @@ -131,7 +131,7 @@ static u64 __gen8_pte_encode(u64 pte, enum xe_cache_level cache, u32 flags,
>  }
>  
>  /**
> - * gen8_pte_encode() - Encode a page-table entry pointing to memory.
> + * xe_pte_encode() - Encode a page-table entry pointing to memory.
>   * @vma: The vma representing the memory to point to.
>   * @bo: If @vma is NULL, representing the memory to point to.
>   * @offset: The offset into @vma or @bo.
> @@ -140,13 +140,11 @@ static u64 __gen8_pte_encode(u64 pte, enum xe_cache_level cache, u32 flags,
>   * @pt_level: The page-table level of the page-table into which the entry
>   * is to be inserted.
>   *
> - * TODO: Rename.
> - *
>   * Return: An encoded page-table entry. No errors.
>   */
> -u64 gen8_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
> -		    u64 offset, enum xe_cache_level cache,
> -		    u32 flags, u32 pt_level)
> +u64 xe_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
> +		  u64 offset, enum xe_cache_level cache,
> +		  u32 flags, u32 pt_level)
>  {
>  	u64 pte;
>  	bool is_vram;
> @@ -162,7 +160,7 @@ u64 gen8_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
>  			pte |= XE_USM_PPGTT_PTE_AE;
>  	}
>  
> -	return __gen8_pte_encode(pte, cache, flags, pt_level);
> +	return __pte_encode(pte, cache, flags, pt_level);
>  }
>  
>  static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
> @@ -174,13 +172,13 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>  		return 0;
>  
>  	if (level == 0) {
> -		u64 empty = gen8_pte_encode(NULL, vm->scratch_bo[id], 0,
> -					    XE_CACHE_WB, 0, 0);
> +		u64 empty = xe_pte_encode(NULL, vm->scratch_bo[id], 0,
> +					  XE_CACHE_WB, 0, 0);
>  
>  		return empty;
>  	} else {
> -		return gen8_pde_encode(vm->scratch_pt[id][level - 1]->bo, 0,
> -				       XE_CACHE_WB);
> +		return xe_pde_encode(vm->scratch_pt[id][level - 1]->bo, 0,
> +				     XE_CACHE_WB);
>  	}
>  }
>  
> @@ -634,9 +632,9 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  
>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>  
> -		pte = __gen8_pte_encode(xe_res_dma(curs) + xe_walk->dma_offset,
> -					xe_walk->cache, xe_walk->pte_flags,
> -					level);
> +		pte = __pte_encode(xe_res_dma(curs) + xe_walk->dma_offset,
> +				   xe_walk->cache, xe_walk->pte_flags,
> +				   level);
>  		pte |= xe_walk->default_pte;
>  
>  		/*
> @@ -699,7 +697,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  			xe_child->is_compact = true;
>  		}
>  
> -		pte = gen8_pde_encode(xe_child->bo, 0, xe_walk->cache) | flags;
> +		pte = xe_pde_encode(xe_child->bo, 0, xe_walk->cache) | flags;
>  		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset, xe_child,
>  					 pte);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 10f334b9c004..54e8a043d353 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -45,10 +45,10 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
>  
>  bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
>  
> -u64 gen8_pde_encode(struct xe_bo *bo, u64 bo_offset,
> -		    const enum xe_cache_level level);
> +u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> +		  const enum xe_cache_level level);
>  
> -u64 gen8_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
> -		    u64 offset, enum xe_cache_level cache,
> -		    u32 flags, u32 pt_level);
> +u64 xe_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
> +		  u64 offset, enum xe_cache_level cache,
> +		  u32 flags, u32 pt_level);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d1c380ad7f6b..8f8080e0b2aa 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1528,8 +1528,8 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
>  
>  u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
>  {
> -	return gen8_pde_encode(vm->pt_root[tile->id]->bo, 0,
> -			       XE_CACHE_WB);
> +	return xe_pde_encode(vm->pt_root[tile->id]->bo, 0,
> +			     XE_CACHE_WB);
>  }
>  
>  static struct dma_fence *
> -- 
> 2.40.1
> 
