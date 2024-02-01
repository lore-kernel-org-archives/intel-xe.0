Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7907C4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 17:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6196410F253;
	Thu,  1 Feb 2024 17:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LORPW0Q+";
	dkim-atps=neutral
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 17:32:03 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6B910F253
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 17:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706808724; x=1738344724;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nXQoqywdfKJPrDB21GjuuwYyYS/D7mfjTQc+W4JYR9g=;
 b=LORPW0Q+QwHt7AuuHHqefatsWMiWT6c0sW88SmwO/5ru2/API7A50oC1
 tRbwky8b2LTifDxp8kbH0LavGhLSl7jLtsh9m8QqasfOXsFwrLt3u1bxb
 xqOIq5aCCM5obybM8FKVbEXpyetJp4FvOijr1mDpL/ldk9wbN/jnRto83
 xz16tGxYVCNZ4uArMSFOdUidaYFur7wQi42RGZ5D4ZDONNoZ/xJQ17YZD
 lJ0gG918EPa5sHqBM10WwaWL5nhvJuBKd+fuJXBnM77/LP/tjbVvJ/Atb
 kBHGkgIwllVsKZmpvD1OnV45zl6dNSm72ftM5Tomd4WHwAocSscXp4zZw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="137641"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="137641"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 09:24:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="30930975"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 09:24:58 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 09:24:56 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 09:24:56 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 09:24:56 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 09:24:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+ZRY6aFzOcc4ah7VBloK+5ktwH+qCRaYPK/QzO9y7mJY5HHSzgomh/twB22SEcOFd10y8hchswQ3lhe7yardguevXsEywFVcQ9ZPut4W+Rinj787JF7wZq6d3PUgBzjnkapMiUB3uM3JflAEV/zT/WPl5Ye4c2V+IG1cSb059o2J8nByRVsKzyJ9bLwD1ZiOOovEIkmfuu3STezPi8MZfvh6e5UpYGzHAmTaAzEfbLxjdCKsfPs4nL9hufxnRJa/Fgm3GbgcvDMfKi2E61mhkqJ7RKXJUCdBcZwwYZpEPIbtfUxOKm/T+n8kI5AjxY4huMVTajmZ/pmtZg9r1eqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eaRIpPaqRwdyBFzmK6zPUTGeEciZO1VkqaKiBIMBFsQ=;
 b=Kh5SqCK3mnmOdMj665TcwlOUmpRSf0wBrYxUd7epkuLI34zjpFvFT7rIUisNF7asMmpqvOgUqe1jJHkrXv7j8aDxStxL1+fhpjTh2DCT+PDLiMWJDtNwZ2++g2dtng5RN+aDkdHcGllsRZwlqJ9syAOJHsKi2SbLzmALXXb9XFXjp5c3l2jhZshqqP/qHrOS5K/TAOBlnQ4krz7/t8XnFPIcrzLzWGgmIy44k0A6AALbGfbKl9fjOaUe2reYHLUGoTtXZxUJJG7U8km8a4a43ujCQWBK1Qlp5NiddXpsbWpk73TNeI7jF2ijDTzXZOYl9368g4HvAORQs/V0YCnwNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5555.namprd11.prod.outlook.com (2603:10b6:208:317::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.26; Thu, 1 Feb
 2024 17:24:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7228.040; Thu, 1 Feb 2024
 17:24:53 +0000
Date: Thu, 1 Feb 2024 17:24:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [V13] drm/xe: Introduce and update counter for low level driver
 errors
Message-ID: <ZbvTtjW8FLRarNSD@DUT025-TGLU.fm.intel.com>
References: <20240130084135.2065579-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240130084135.2065579-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR02CA0056.namprd02.prod.outlook.com
 (2603:10b6:a03:54::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5555:EE_
X-MS-Office365-Filtering-Correlation-Id: 69ed33b8-2067-46c9-cb5c-08dc234ab3e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pwqse1FImdFVH/CY6OSyD9c+G+0bgZtx3xV5yKInukBjmrElaFzrJ6CTH3T00fLhV8II7w6tHvcaV+/+/ITUjqKpepZ7IRqNU7t+ZbkrQe70APszdJbQCzw8ZAgHVbaSs5KQHK1XPr7r07PQYLkgn5BdqoPkXUkRoqKlSu/9z3GBSNEEPPCpz4v5zXpBbbBppS/lKB1mZEDzMUih1KI9pW15OGThI3hraxtOe1cW5cpkjzAVhF8Klb9Mbn0SlvrbHrNNA7iJlx99tBChT+4t3a/pki0IXWOwipSkP5Xax3Q52FQ8VvJ2lgzK1A2JdFl1cc3S09N1YrHkd/aTd/ifklub7pKNBmzy10/G6rMvThzlTfKH6BIgkjZh4lpVc+HKzrn++e2/aHaIseasldq9pX3Pz43+vZSIiQdJihjMZuKTv9ufMVxRNQkhnRyuBSasyQE82QmBwTqduXeN8oDg9M5/qYQkDnM3EEfAIhfHO5C70vEaK3oa7FbZcmky1rgszQrzg4dZ9fz8BS8gDP7+CtEVatHVsr81vKzzZsj7cl3iYlcu76zeL44iz7l4EP1a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39850400004)(366004)(396003)(136003)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(38100700002)(2906002)(15650500001)(30864003)(82960400001)(83380400001)(41300700001)(5660300002)(316002)(6636002)(86362001)(44832011)(8936002)(26005)(4326008)(6862004)(8676002)(478600001)(66556008)(66946007)(66476007)(6512007)(6506007)(6486002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jIgHDZtQfd1K1lVnhr6bsPdfzr9wSKde/WALz2ZDSeuIXjxq5Y7P93xbfLgW?=
 =?us-ascii?Q?RuOPmw8e9RKNe0fONiDXiWasdMe4GXLLB66uou4H8HBdFTO1PCHiXml3wS1P?=
 =?us-ascii?Q?7i3KX5xiPe8k/6X9KIkuJHFTNC4Pfper527bLbJ6AgP+SyUMEq9l6bLD17YP?=
 =?us-ascii?Q?657beAn1VR4qOBgKC1iBQ2ISOWXKFwFkAmg8ZHU3LJU2/UWNhi/Nb+pltAzi?=
 =?us-ascii?Q?B5JsTv0KN5xvL4WndPHSZmvHlJESpIRWxdlrZxKiNeM+u1ApXsptt6A3+yvc?=
 =?us-ascii?Q?f3zpEjSCRhfTsXe9mvfykXUZXhJUhDpw9y7pQP1wuA1VI72h70vCjx9qjMZf?=
 =?us-ascii?Q?/ctbz/kwUGOcF/EDOXGGegY+GnQ/d4ziJj3o5XulXcGbVk78DGtYPCx2GQSB?=
 =?us-ascii?Q?F2P5a5mp+WZSPMqe1J+DPQQD4J2vDEzYvA2uoKZMHb3cC9FU6nYxoX2Pp7tn?=
 =?us-ascii?Q?z04+7rx/SuHjDXA/vsov3zi+lyt7TT3ONfRG5Xnf33VP8LGgDRJD8Ao6t0ug?=
 =?us-ascii?Q?RC/BjphhxOUwUFVG/BVrQNcJqEkJYj9JAGA0LGNIcYFzDMaUbk+38+/3xfx+?=
 =?us-ascii?Q?8M2fmK2tlkavUq12WnaBdAcJwdmNyn8YsTWX7ZevrMYznOXy0QzcofMgUdkC?=
 =?us-ascii?Q?qCsqLilKrxZiCCkxZWK7Euw6uYq+UfYuowwKu87D2CR2pIDmIBolK1O5ZwJ0?=
 =?us-ascii?Q?jNfY6HuqeUgfcdhOpE6iWEydw/OjOZJxWIkDvl1qBZQz8Cz4vlNgRdxQfGbf?=
 =?us-ascii?Q?eWHVTpQq+5Vok7xAwBnG211gfsvPzlUIiECmobZvwRZoNwDuW0KWphbpsb6I?=
 =?us-ascii?Q?jbkl1w0iEOPFPL2V7b5q7INUQby0Cl+hzoVfnq5wwD98Q8/EQP1pKj7xFrm2?=
 =?us-ascii?Q?KYikC/mXPQNYJhycp00mMndbn7eHevvt2WoFRFQ8++3BOQgEN/6dNoId51Ew?=
 =?us-ascii?Q?GOhF3loHObXX/ss/31hBHpkulRussXwa7sgecqI60K2NckTHttWCUMT6vP9a?=
 =?us-ascii?Q?CJqzICCt6NcMwlZD21wHloEEM14WaSXfpThnuZBN3btv9E0j38rQ9EyncX3J?=
 =?us-ascii?Q?I5IWnmdjcqRVfIL9IPfrzkZmtVKnRky9i7UPsds41CFcPNxBwZ6U1VC5dmFC?=
 =?us-ascii?Q?X8SSAfRG/LkCm5XqTtc2pDLnN/+etVvSehAGnwd1rcGsa+gRaksampk26/6d?=
 =?us-ascii?Q?m+37b1HPwGUjQOmRTd0gxiUvoHmGWBf32lMSkZWPd+89kk6E6iINEnucDhes?=
 =?us-ascii?Q?i5XJiECoQEUxG7z9Lg1MhakKnOiltQ+HOrnU6tyi+BBVcfBic8udNJ1dA5hh?=
 =?us-ascii?Q?cimXoU3ruFFbPU8yLz4eliu4uOcW1N4ZzlNs+kxf8Bwy3r1xGrJ9Hgwrmq+d?=
 =?us-ascii?Q?ZkG9S/e/56NPqDHi9H1z0dTa5g4frwB/5K3HQivE/PZuABQHlf/W4qRAP/W9?=
 =?us-ascii?Q?JbipthpSDGsN3aihckGlfG+aWP7vvvKUQRbY+tnWdJN+kqRk8G5g/BhrLG/u?=
 =?us-ascii?Q?+EvYsRmHYA3tvVdrq5fGGDWqJ+f6SzoZvZQumwk1sYCD1xXGNULbqo2m9pH8?=
 =?us-ascii?Q?E22GmU7KbFR59We8Q5WOtZVDTnR8wVGBi+vCMC9GatZrbjWiqOuwBZscGott?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ed33b8-2067-46c9-cb5c-08dc234ab3e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 17:24:53.3942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvnEaHhyve9Idotoo4CGsiXQMKRr8q0hcMD4XhAi7lhINYjdlfTiWkrD/y1BY9Z6PSuv9TSxPz6zzVdmJDoNHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5555
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

On Tue, Jan 30, 2024 at 02:11:35PM +0530, Tejas Upadhyay wrote:
> Introduce low level driver error counter and incrementing on
> each occurrence. Focus is on errors that are not functionally
> affecting the system and might otherwise go unnoticed and cause
> power/performance regressions, so checking for the error
> counters should help.
> 
> Importantly the intention is not to go adding new error checks,
> but to make sure the existing important error conditions are
> propagated in terms of counter under respective categories like
> below :
> - GT
>   - GUC COMMUNICATION
>   - ENGINE OTHER
>   - GT OTHER
> 
> - Tile
>   - GTT
>   - INTERRUPT
> 
> Currently this is just a counting of errors, later these
> counters will be reported through netlink interface when it is
> implemented and ready.
> 
> V13(Matt):
>   - Fix more places to not report error when CT stat is cancelled
> V12:
>   - Rebase and respin on top of Matt's GuC CT stats change
>   - Do not report error when CT stat is cancelled
> V11:
>   - Unify tlb invalidation timeout errs - Michal
>   - Improve kernel doc comments - Michal
>   - Improve logging output message - Michal
> V10:
>   - Report and count errors from common place i.e caller - Michal
>   - Fixed some minor nits - Michal
> V9:
>   - Make one patch for API and counter update - Michal
>   - Remove counter from places where driver load will fail - Michal
>   - Remove extra \n from logging
>   - Improve commit message - Aravind/Michal
> V8:
>   - Correct missed ret value handling
> V7:
>   - removed double couting of err - Michal
> V6:
>   - move drm_err to gt and tile specific err API - Aravind
>   - Use GTT naming instead of GGTT - Aravind/Niranjana
> V5:
>   - Dump err_type in string format
> V4:
>   - dump err_type in drm_err log - Himal
> V2:
>   - Use modified APIs
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

For the GuC CT changes:
Acked-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h        | 15 +++++++
>  drivers/gpu/drm/xe/xe_gt.c                  | 41 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h                  |  4 ++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 12 ++++--
>  drivers/gpu/drm/xe/xe_gt_types.h            | 17 ++++++++
>  drivers/gpu/drm/xe/xe_guc.c                 | 16 +++++++-
>  drivers/gpu/drm/xe/xe_guc_ct.c              | 43 ++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
>  drivers/gpu/drm/xe/xe_reg_sr.c              | 26 +++++++------
>  drivers/gpu/drm/xe/xe_tile.c                | 40 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile.h                |  3 ++
>  11 files changed, 199 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index eb2b806a1d23..71d7bf97ee6e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -63,6 +63,18 @@ struct xe_pat_ops;
>  		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
>  		 struct xe_tile * : (tile__)->xe)
>  
> +/**
> + * enum xe_tile_drv_err_type - Types of tile level errors
> + * @XE_TILE_DRV_ERR_GTT: Error type for all PPGTT and GTT errors
> + * @XE_TILE_DRV_ERR_INTR: Interrupt errors
> + */
> +enum xe_tile_drv_err_type {
> +	XE_TILE_DRV_ERR_GTT,
> +	XE_TILE_DRV_ERR_INTR,
> +	/* private: number of defined error types, keep this last */
> +	__XE_TILE_DRV_ERR_MAX
> +};
> +
>  /**
>   * struct xe_mem_region - memory region structure
>   * This is used to describe a memory region in xe
> @@ -204,6 +216,9 @@ struct xe_tile {
>  
>  	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
>  	struct kobject *sysfs;
> +
> +	/** @drv_err_cnt: driver error counter for this tile */
> +	u32 drv_err_cnt[__XE_TILE_DRV_ERR_MAX];
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 675a2927a19e..164fc9ac3079 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -55,6 +55,47 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> +static const char *const xe_gt_drv_err_to_str[] = {
> +	[XE_GT_DRV_ERR_GUC_COMM] = "GUC COMMUNICATION",
> +	[XE_GT_DRV_ERR_ENGINE] = "ENGINE OTHER",
> +	[XE_GT_DRV_ERR_OTHERS] = "GT OTHER"
> +};
> +
> +/**
> + * xe_gt_report_driver_error - Count driver error for GT
> + * @gt: GT to count error for
> + * @err: enum error type
> + * @fmt: debug message format to print error
> + * @...: variable args to print error
> + *
> + * Increment the driver error counter in respective error
> + * category for this GT.
> + *
> + * Return: void.
> + */
> +void xe_gt_report_driver_error(struct xe_gt *gt,
> +			       const enum xe_gt_drv_err_type err,
> +			       const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_drv_err_to_str) !=
> +		     __XE_GT_DRV_ERR_MAX);
> +
> +	xe_gt_assert(gt, err >= 0);
> +	xe_gt_assert(gt, err < __XE_GT_DRV_ERR_MAX);
> +	WRITE_ONCE(gt->drv_err_cnt[err],
> +		   READ_ONCE(gt->drv_err_cnt[err]) + 1);
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	xe_gt_err(gt, "[%s] %pV\n", xe_gt_drv_err_to_str[err], &vaf);
> +	va_end(args);
> +}
> +
>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>  {
>  	struct xe_gt *gt;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index c1675bd44cf6..c2d1536f180f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -70,4 +70,8 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>  		hwe->instance == gt->usm.reserved_bcs_instance;
>  }
>  
> +void xe_gt_report_driver_error(struct xe_gt *gt,
> +			       const enum xe_gt_drv_err_type err,
> +			       const char *fmt, ...);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index e3a4131ebb58..f9dc6b109ac2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -11,6 +11,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
> +#include "xe_tile.h"
>  #include "xe_trace.h"
>  
>  #define TLB_TIMEOUT	(HZ / 4)
> @@ -31,8 +32,10 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  			break;
>  
>  		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
> -		xe_gt_err(gt, "TLB invalidation fence timeout, seqno=%d recv=%d",
> -			  fence->seqno, gt->tlb_invalidation.seqno_recv);
> +		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
> +					    "GT%u: TLB invalidation time'd out, seqno=%d recv=%d",
> +					    gt->info.id, fence->seqno,
> +					    gt->tlb_invalidation.seqno_recv);
>  
>  		list_del(&fence->link);
>  		fence->base.error = -ETIME;
> @@ -326,8 +329,9 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>  	if (!ret) {
>  		struct drm_printer p = xe_gt_err_printer(gt);
>  
> -		xe_gt_err(gt, "TLB invalidation time'd out, seqno=%d, recv=%d\n",
> -			  seqno, gt->tlb_invalidation.seqno_recv);
> +		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
> +					    "GT%u: TLB invalidation time'd out, seqno=%d, recv=%d",
> +					    gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
>  		xe_guc_ct_print(&guc->ct, &p, true);
>  		return -ETIME;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 70c615dd1498..a2fcc2828b1b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -24,6 +24,20 @@ enum xe_gt_type {
>  	XE_GT_TYPE_MEDIA,
>  };
>  
> +/**
> + * enum xe_gt_drv_err_type - Types of GT level errors
> + * @XE_GT_DRV_ERR_GUC_COMM: Driver guc communication errors
> + * @XE_GT_DRV_ERR_ENGINE: Engine execution errors
> + * @XE_GT_DRV_ERR_OTHERS: Other errors like error during save/restore registers
> + */
> +enum xe_gt_drv_err_type {
> +	XE_GT_DRV_ERR_GUC_COMM,
> +	XE_GT_DRV_ERR_ENGINE,
> +	XE_GT_DRV_ERR_OTHERS,
> +	/* private: number of defined error types, keep this last */
> +	__XE_GT_DRV_ERR_MAX
> +};
> +
>  #define XE_MAX_DSS_FUSE_REGS	3
>  #define XE_MAX_EU_FUSE_REGS	1
>  
> @@ -362,6 +376,9 @@ struct xe_gt {
>  		/** @wa_active.oob: bitmap with active OOB workaroudns */
>  		unsigned long *oob;
>  	} wa_active;
> +
> +	/** @drv_err_cnt: driver error counter for this GT */
> +	u32 drv_err_cnt[__XE_GT_DRV_ERR_MAX];
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index fcb8a9efac70..f969662882e4 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -670,8 +670,8 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
>  	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>  }
>  
> -int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> -			  u32 len, u32 *response_buf)
> +static int __xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> +				   u32 len, u32 *response_buf)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_gt *gt = guc_to_gt(guc);
> @@ -790,6 +790,18 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  	return FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);
>  }
>  
> +int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> +			  u32 len, u32 *response_buf)
> +{
> +	int ret = __xe_guc_mmio_send_recv(guc, request, len, response_buf);
> +
> +	if (ret < 0)
> +		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM,
> +					  "MMIO send failed (%pe)",
> +					  ERR_PTR(ret));
> +	return ret;
> +}
> +
>  int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
>  {
>  	return xe_guc_mmio_send_recv(guc, request, len, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index f3d356383ced..e6dd24f6e997 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -624,9 +624,9 @@ static void kick_reset(struct xe_guc_ct *ct)
>  
>  static int dequeue_one_g2h(struct xe_guc_ct *ct);
>  
> -static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			      u32 g2h_len, u32 num_g2h,
> -			      struct g2h_fence *g2h_fence)
> +static int _guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> +			       u32 g2h_len, u32 num_g2h,
> +			       struct g2h_fence *g2h_fence)
>  {
>  	struct drm_device *drm = &ct_to_xe(ct)->drm;
>  	struct drm_printer p = drm_info_printer(drm->dev);
> @@ -698,6 +698,20 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	return -EDEADLK;
>  }
>  
> +static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> +			      u32 g2h_len, u32 num_g2h,
> +			      struct g2h_fence *g2h_fence)
> +{
> +	int ret = _guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
> +
> +	if (ret < 0 && ret != -ECANCELED)
> +		xe_gt_report_driver_error(ct_to_gt(ct),
> +					  XE_GT_DRV_ERR_GUC_COMM,
> +					  "CTB send failed (%pe)",
> +					  ERR_PTR(ret));
> +	return ret;
> +}
> +
>  static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		       u32 g2h_len, u32 num_g2h, struct g2h_fence *g2h_fence)
>  {
> @@ -768,8 +782,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
>  	return true;
>  }
>  
> -static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			    u32 *response_buffer, bool no_fail)
> +static int __guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> +			      u32 *response_buffer, bool no_fail)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct g2h_fence g2h_fence;
> @@ -833,6 +847,19 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	return ret > 0 ? response_buffer ? g2h_fence.response_len : g2h_fence.response_data : ret;
>  }
>  
> +static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> +			    u32 *response_buffer, bool no_fail)
> +{
> +	int ret = __guc_ct_send_recv(ct, action, len, response_buffer, no_fail);
> +
> +	if (ret < 0 && ret != -ECANCELED)
> +		xe_gt_report_driver_error(ct_to_gt(ct),
> +					  XE_GT_DRV_ERR_GUC_COMM,
> +					  "CTB send failed (%pe)",
> +					  ERR_PTR(ret));
> +	return ret;
> +}
> +
>  /**
>   * xe_guc_ct_send_recv - Send and receive HXG to the GuC
>   * @ct: the &xe_guc_ct
> @@ -1282,6 +1309,12 @@ static void g2h_worker_func(struct work_struct *w)
>  		ret = dequeue_one_g2h(ct);
>  		mutex_unlock(&ct->lock);
>  
> +		if (ret < 0 && ret != -ECANCELED)
> +			xe_gt_report_driver_error(ct_to_gt(ct),
> +						  XE_GT_DRV_ERR_GUC_COMM,
> +						  "CTB receive failed (%pe)",
> +						  ERR_PTR(ret));
> +
>  		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
>  			struct drm_device *drm = &ct_to_xe(ct)->drm;
>  			struct drm_printer p = drm_info_printer(drm->dev);
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 2fd8cc26fc9f..1100e9321775 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -21,6 +21,7 @@
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_tile.h"
>  
>  /*
>   * Interrupt registers for a unit are always consecutive and ordered
> @@ -226,8 +227,9 @@ gt_engine_identity(struct xe_device *xe,
>  		 !time_after32(local_clock() >> 10, timeout_ts));
>  
>  	if (unlikely(!(ident & INTR_DATA_VALID))) {
> -		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
> -			bank, bit, ident);
> +		xe_tile_report_driver_error(gt_to_tile(mmio), XE_TILE_DRV_ERR_INTR,
> +					    "INTR_IDENTITY_REG%u:%u 0x%08x not valid!",
> +					    bank, bit, ident);
>  		return 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 87adefb56024..217d37fa3deb 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -125,12 +125,12 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>  	return 0;
>  
>  fail:
> -	xe_gt_err(gt,
> -		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> -		  idx, e->clr_bits, e->set_bits,
> -		  str_yes_no(e->reg.masked),
> -		  str_yes_no(e->reg.mcr),
> -		  ret);
> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS,
> +				  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d",
> +				  idx, e->clr_bits, e->set_bits,
> +				  str_yes_no(e->reg.masked),
> +				  str_yes_no(e->reg.mcr),
> +				  ret);
>  	reg_sr_inc_error(sr);
>  
>  	return ret;
> @@ -207,7 +207,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>  	return;
>  
>  err_force_wake:
> -	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS,
> +				  "Failed to apply %s save-restore MMIOs, err=%d",
> +				  sr->name, err);
>  }
>  
>  void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> @@ -234,9 +236,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  	p = drm_debug_printer(KBUILD_MODNAME);
>  	xa_for_each(&sr->xa, reg, entry) {
>  		if (slot == RING_MAX_NONPRIV_SLOTS) {
> -			xe_gt_err(gt,
> -				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
> -				  hwe->name, RING_MAX_NONPRIV_SLOTS);
> +			xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_ENGINE,
> +						  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more",
> +						  hwe->name, RING_MAX_NONPRIV_SLOTS);
>  			break;
>  		}
>  
> @@ -259,7 +261,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  	return;
>  
>  err_force_wake:
> -	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS,
> +				  "Failed to whitelist %s registers, err=%d",
> +				  sr->name, err);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 044c20881de7..cf81e77a7eb4 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -72,6 +72,46 @@
>   *  - MOCS and PAT programming
>   */
>  
> +static const char *const xe_tile_drv_err_to_str[] = {
> +	[XE_TILE_DRV_ERR_GTT] = "GTT",
> +	[XE_TILE_DRV_ERR_INTR] = "INTERRUPT"
> +};
> +
> +/**
> + * xe_tile_report_driver_error - Count driver error for tile
> + * @tile: tile to count error for
> + * @err: Enum error type
> + * @fmt: debug message format to print error
> + * @...: variable args to print error
> + *
> + * Increment the driver error counter in respective error
> + * category for this tile.
> + *
> + * Return: void.
> + */
> +void xe_tile_report_driver_error(struct xe_tile *tile,
> +				 const enum xe_tile_drv_err_type err,
> +				 const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(xe_tile_drv_err_to_str) !=
> +		     __XE_TILE_DRV_ERR_MAX);
> +
> +	xe_tile_assert(tile, err >= 0);
> +	xe_tile_assert(tile, err < __XE_TILE_DRV_ERR_MAX);
> +	WRITE_ONCE(tile->drv_err_cnt[err],
> +		   READ_ONCE(tile->drv_err_cnt[err]) + 1);
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	drm_err(&tile->xe->drm, "TILE%u [%s] %pV\n",
> +		tile->id, xe_tile_drv_err_to_str[err], &vaf);
> +	va_end(args);
> +}
> +
>  /**
>   * xe_tile_alloc - Perform per-tile memory allocation
>   * @tile: Tile to perform allocations for
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index 1c9e42ade6b0..446a76c43189 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -14,5 +14,8 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
>  int xe_tile_init_noalloc(struct xe_tile *tile);
>  
>  void xe_tile_migrate_wait(struct xe_tile *tile);
> +void xe_tile_report_driver_error(struct xe_tile *tile,
> +				 const enum xe_tile_drv_err_type err,
> +				 const char *fmt, ...);
>  
>  #endif
> -- 
> 2.25.1
> 
