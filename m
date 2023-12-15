Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B31C35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 22:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4867F10EA9C;
	Fri, 15 Dec 2023 22:37:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB31E10EA9C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 22:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702679835; x=1734215835;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KE//uqY/dLWSFIYDnh9p8FWHpRrf/18B5syt7Hooj3k=;
 b=NUUDyKj1HtXArIZe8JC8kY7T3JExccMQIccDStWUe73Y6UdyZzgCiZGL
 LHAXaFrXgDbV8wYeAkSAXr6AL6rWH8kIknJVSzT5t36Yk/bO2zQK1g8bC
 6H9AscySua3NexfejWkWEFpbzMEBJ22RnK83HjrSlttEv/d42NWk/a/HU
 M36Z4xdaMTm5Fsmp5Gx+6NdR9zkLWS5fNhNqfLWppAHDX10mSs7lbkBVH
 f9+QXi/ZZqIVO7PFNp4W8MNkntm+VLggGywYC9Aa3JsfP77n0qxxXCL1e
 mibiHt3KVgepeqVuv2862t14fk6oFZcTCGD4n7suAhWJbPUzNZ6EE89hz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2188856"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="2188856"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 14:37:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="23001092"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 14:37:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:37:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 14:37:10 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 14:37:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PB8BmsBzPeMHrxOrby9LNaZHygnVG9cyn51cMs36NFr4wyHYFtjP15i13eV4fZW7IJjpVWT9sZFyORUlLpylc3WYVN6pDyqLHk88YAdt518CnWJHERxy8Qe8b0b2xYe63L49iXRcRTMbnkyil2cvVlqmj7e8M97bfEdTpP3rBSsm8NpMeYBjuTtPPkg9l2XxS03Al5Ykc3qJevbbiNbr6r0YfdETbhMO7qEod3g3GCeSpk5LlptRQS3A2lSr8cRJyAYnT5ktqcJtSMmR8jFuKDWC8PNEYihcTnLPcG/WqcP2hVbhRCff36thlCdfS8ud0R1CeeFJyMIMx68/LXd1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XipAGvHpuIXIiMmQM4uqN8U5yTWY4W4jf9kAzQ5E3Q=;
 b=PKOEpig4amRzmFJ+wMPWJyaaCIuux4ysSZj7Zu58QlE8mVa81wVnqwphHW9LHESTNz+tIF3xg0pJLpidbFv/cmLXKBkaPW4QZIev86EG58FeU4FdhOpXCm1eNXDvM6Vyz5wxJAKTLAF3maFHYg1pqwprDbYN+RMXJI/7YN2hplquoOSfPb+biUy3bnnysVgoTM4URrgG1veFbMKXEVWsDPPQT5FwK3vOyOiBwpTNkZRgxbFuHEr+1kHbIm5iAiefOQAqKpovIppjJfxU+SvBf47gRx2RgT0J5jGZygMVjzG7DeYGBDSY8LaV83XvUMXT6N3vT+P+QU9u6K5w4OolxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB7455.namprd11.prod.outlook.com (2603:10b6:a03:4cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 22:37:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7091.032; Fri, 15 Dec 2023
 22:37:07 +0000
Date: Fri, 15 Dec 2023 14:37:05 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 06/10] drm/xe: Add XE_BO_NEEDS_UC flag to force UC
 mode instead WB
Message-ID: <20231215223705.GZ1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231214185955.1791-1-michal.wajdeczko@intel.com>
 <20231214185955.1791-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231214185955.1791-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f55791f-6463-4936-95fa-08dbfdbe5e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /5iBh+4cMWDN4Pj0p6Xjszn0X8kqxl38FUQe9eBZE/HrDA5E7I+0ha2Dnw68kvFlFQfu7H+Tdl6NtZievvJ60QumkCWkQqafN3sagxhUhr6j49c93JyI6XEfJ7vIzpcixe/gaEBPXWz5U0g3+Jr7FtR4DwOHMMp82ZrhVm0dGQlh5OaauqisIu+4Z3WncsifaRPvH/QEelVym4Ehn/fyWpXAJZR/1hHzmGwneBKAEeRPcf1eNk8JPu015iEUtQeBqE8MXEbyuWAU3a64tq1hwxU+rO2gowZKp+9Ws2Vmqc1+0/F9L9YsthdDSzPkk7V8xeKhp7TdKm3XmLf+SOz2FnZ+euzSfbl+5UXV9G02vfIZrX4tMXP8WSK/8jW5lPQWjslXKv44XU50nQhtaAAx6D8q2ONazudGvTmD/0gPolHz+mepBZ9kIzeSjE3jOi7n3/92dNsTZGHRprBGiyEdZ5YS6cu+sxVTGt+2noq1y3hTZFT0PBPMxjmkcqssgZOGfc8+GibyW228GA7/p3YhLsxOLUK4HbDsFlWUKcTfsG6RdL9AJHlYEPgSQ8DzGdBy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(136003)(376002)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(26005)(1076003)(6512007)(316002)(83380400001)(5660300002)(4326008)(478600001)(8676002)(2906002)(41300700001)(6862004)(6506007)(8936002)(6486002)(6636002)(66556008)(66946007)(66476007)(33656002)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XoztrIoj8nyluDAPUfh9OvZQ8rU+6ljv9Bk0kWrZsKBzKAvBGqdVQGupIQAc?=
 =?us-ascii?Q?zRb9lMTYx6tyg3uBalzDxPkcW+BdeCq18ez5W0CgAU5Lqy2xcNOE/Q6yOA2s?=
 =?us-ascii?Q?9qZaWcdEElZdmxPkG6XbVxzqhla4wf+Gwj93UNvW9/xezDZ8LlVoGRyPo51M?=
 =?us-ascii?Q?ZRuc2qQLfZqwZ30vnZrAUNWfupDPFma997hJxZiqsWuzNzVVDMntkVCb07km?=
 =?us-ascii?Q?l4jNDHAZ4y13VKg1PkIiOD7dAmwbcFDCrwU6mwW2MBtru2cUDleIqANWzrTz?=
 =?us-ascii?Q?uswI0hLkXaUw4ebMOzjpKrQZDPZr896pdTOGw+MSiuF4Du5Aqs41ajfU5X4E?=
 =?us-ascii?Q?F748B+WVTZpo+vyaEteFPBhWwOX0ldOQS/TtVTt3w4yuYNLc+9akq32RdtqS?=
 =?us-ascii?Q?E1a1KPZCaJJNX4yjLYYBQwqo61+eydBD5WkPqbhTte1XDJ76i/01EskG2YGm?=
 =?us-ascii?Q?wUU5SKUMjJoyrBzN3g4L0Uvy6vol1XmGBvYUsOhBtWpVeJG7Sj7MZuS2eX+5?=
 =?us-ascii?Q?EnDHOCe/z7Mp8a7rYWDlsSivpBYsm8D9phbRDrxVmZlPTsjDrwz0T5IGU048?=
 =?us-ascii?Q?ezyFBB3OTKvru0b5YtPuY9f0Hgz4JTj+B08bpMvyGPPyXddjY3WqpSD/uPQZ?=
 =?us-ascii?Q?q3cRcl/dTbpGA56kVg3G/rSHbEPHGt+VBv57ftsRumWT+RmeLoaGvOmvliGh?=
 =?us-ascii?Q?CKzKJCWRC6ymEYk/LneOsQmPmlYmycsMB3xNWVwIQkMuoJxfzTNUPm5HOd6k?=
 =?us-ascii?Q?Te3EqT+6b72RFUnWE7oJfYNx5344UW+r5Xk3EwCiw/+9CVEh59P/fvrzug1L?=
 =?us-ascii?Q?hUf8PsU1RR7vVhFw3n8GaH8GAkwdnX+A2ww1c27wY//4qiE+WeohE8KfMNDG?=
 =?us-ascii?Q?Ll+FeOIPPFsgi3SOu+mPHPyXjwofgwEC7Lqchxwxy21gLQOg7DVMToexGWiX?=
 =?us-ascii?Q?ocPa++4m2lsJO2cFPGLQWp5H6p7rtyxxg3+u/RFjtb8Aa7cHE7G3K5fBS9Od?=
 =?us-ascii?Q?7SgMDvI3UYay0A5elZAzl0YDLOLQA3kGv8yBYvnHdQdTCPcKWvB6NmWTPNTG?=
 =?us-ascii?Q?jiG9zEe4ZcdHrB5kHn4lOPShdEdj78xwIy5/GZOdWhO2VTn0ZDxms6jBWuOq?=
 =?us-ascii?Q?4O2GuV1/VyVRN8ELqhmLA6nX1fA72/U0XxhYmCukbl9vB35NJfrvHukhriT8?=
 =?us-ascii?Q?3t0vjoVniI3VWeR87v7hTD97tzfIfYri7TIm2c+dqj8lt+dJ8FuYRUdeFee5?=
 =?us-ascii?Q?YTBpAWHPvDvGn0Klkgifl7TxN8Bqb67xAjLdFDrcHmvbG1O0xWfcSQJeqwyV?=
 =?us-ascii?Q?B2gyNYXVkB42e/oz0SwQ8OhHTWqypOANtgAchjfUnhMz/4zc43dgmXIdZdYC?=
 =?us-ascii?Q?pb2ZQgKPd1V1lDLcyce6gM+9W/0uq8Ihn0ZP48ti+XoS4EVfBsk1a3X/P370?=
 =?us-ascii?Q?8Ks11RuYR05yNGKiPZylZvBbrznBjNBU/ZplfnhPeE3k3cIunnqCQjBqQ8CZ?=
 =?us-ascii?Q?jInND2t7aK099arAR+b/zsO9s/9IfEygL4ihnUnTRy9i7fG4vDGe8Xc6/LDB?=
 =?us-ascii?Q?ZGhS/ObLHw4bm2YwntzflrvCKvCRHQiPhZNebCJSIysh+GWvymdetSjfJrPs?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f55791f-6463-4936-95fa-08dbfdbe5e8e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 22:37:07.6204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eo3s0IKctSA8Kiw3vjOYp21PJNrFHqAX07MizfEV2N8055yZ4ozDjYH7+GqXIkzgftUqkwxmZCjxvCpn9XRKj3afJoS0M+yxdHz3eiqh89E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7455
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 07:59:51PM +0100, Michal Wajdeczko wrote:
> When we map BO in GGTT, then by default we are using PAT index
> that corresponds to XE_CACHE_WB but ppcoming feature will require
> use of the PAT index of the XE_CACHE_UC.  Define new BO flag that
> could be used during BO creation to force alternate caching.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.h   | 1 +
>  drivers/gpu/drm/xe/xe_ggtt.c | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 9b1279aca127..97b32528c600 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -44,6 +44,7 @@
>  #define XE_BO_FIXED_PLACEMENT_BIT	BIT(11)
>  #define XE_BO_PAGETABLE			BIT(12)
>  #define XE_BO_NEEDS_CPU_ACCESS		BIT(13)
> +#define XE_BO_NEEDS_UC			BIT(14)
>  /* this one is trigger internally only */
>  #define XE_BO_INTERNAL_TEST		BIT(30)
>  #define XE_BO_INTERNAL_64K		BIT(31)
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 374ae4289fa0..c239782498a7 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -335,7 +335,8 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>  
>  void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  {
> -	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
> +	u16 cache_mode = bo->flags & XE_BO_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
> +	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
>  	u64 start = bo->ggtt_node.start;
>  	u64 offset, pte;
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
