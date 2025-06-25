Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C128DC7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 14:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824B410E733;
	Wed, 25 Jun 2025 14:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PGcs/foM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBB210E733
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750860039; x=1782396039;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QLDITMPRXVYfdn23EbqOuuVEmbrKf9m3DCMtCPAs78k=;
 b=PGcs/foMYWWnP4nD4x5tdrSKaLUtdhLEa0vBWtCNbGNyj+7hLEkKVtrL
 i/gBDtXpi36DGXl0uz8ahtMzACANUkbDfO5BVzNIDuIcCEr/mn3FxS/ZL
 ydvBrGUAM8XqBnIIzWbkHAiui1/ne0Afpd8gdnIy8WrOSVC9Ps2MNxSsb
 eY4niUsYVUlBiBX87M5QBWvf7bCeaECvV1SFSmO1eCAs57f2jVNDqRiSq
 J+s7qtE3jXtboSWf367UMThx+qutNHcpGXTK1Ypt9aF87j68qHMD45gCO
 9pjIIyRKYngYTIv5XFy8gEGr/wGUV6GSrfXdramc0uFi0UbsZCo55eAP9 Q==;
X-CSE-ConnectionGUID: Vlf7iV6BS8ugSjEPxSxoXw==
X-CSE-MsgGUID: 6aQco4JJQJ6LSRD4uwqZ0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70564401"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="70564401"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:00:38 -0700
X-CSE-ConnectionGUID: P/eWoAHjTbSxcEaKwwpLzw==
X-CSE-MsgGUID: KXTBWbumTYSe8Ot5o4uC/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="157726482"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:00:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 07:00:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 07:00:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.67)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 07:00:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0V2bUpI+johd0uz+Wi4/Uc/nzKrzVvw+gi/i5x9UsA8z6f9FiOS+pL6WUUcqn4Hkxs8gYMSB7Jts8PNoMiL9BvWcR/1NYX/vwM3Wl4utCfdobIv4wTcav0DkQTvdzODtxWNQXx3WEx4BomBGjX/Ko+XljugHAfocaqYVxo9gONFW2FJYe4zmnzMwjbvGTXwqR0oAmKB7lKfM2tFRM8qA2Kwv/Yut95GOjXR5XoPzexlbrvK/rVjxE2DTSBfmafuwGwEndKPHSI1HeeGN17vae3APNqGkfIEB9H6DGDPuvIhRdmhSPs/0O/XCGPU9M2uTRL0bTMOxJGQXZASNlsHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVSKqqtan36f7Hn0j9kAPXs4xRdbTv8X0bJOYhRz3po=;
 b=VuHJAJabe+LPuTW6wgS31LWxnJf7RP4Hx6kct5IaGBwmnT18SaqUZQSwiKyDdykl6rPKupKwh+UOwmZYzJvJgIdC7403KAvR/TJfMBG2+Z6JqZTIycCGL7mnBFKl15swLf5R850KHRWWrYNMzSwn4vwy3VQwwPCuBv1p9mIg1mQPQ6MTxyxyWlZJDzDCL5gr1c0vjqRmnw9qAoGDZ/pWnLJXMF7CtWYACvMhMGb/yS+2G5q20hnnX40yRo/UaLAcoaGYWimfjqQdIky608ndaV3IjE1NC31hYSGgFTiCqHX85X345sXwaPnurWhbh5+UDmRfc13GHylSTSqZ9mdxYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8402.namprd11.prod.outlook.com (2603:10b6:a03:545::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 14:00:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 14:00:31 +0000
Date: Wed, 25 Jun 2025 07:02:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI] drm/xe: Consolidate LRC offset calculations
Message-ID: <aFwBYzApyBNcs5ZH@lstrano-desk.jf.intel.com>
References: <20250625113241.19362-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250625113241.19362-1-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: 91816f67-3a27-4262-d501-08ddb3f0a59b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T5jBA5zCPL3UjKPb43paZtgPN7MEdGQPVJUr1YtWU1B3pEwIPZx7WWvVTsiu?=
 =?us-ascii?Q?Dwh4WTvnBcPzMbM5Nqd7+xnZnzOlv940yhwWy6HxGKsv46ikStPL4GnVe3nq?=
 =?us-ascii?Q?Mc2I1+cTic2yTsjBwVK/vKCCv/9O1lspzFEXU/xdPFv1AXCCExucBF74KfJM?=
 =?us-ascii?Q?lw+m5Ijp5aH62kXBZ3Iiu5M9g0S8J2TWjYfw/4QyCPiJy/c9/XVY6+0POGwH?=
 =?us-ascii?Q?DU6HGthOW7CA6Kr2yR5TUPAVeJw668cxmg5h1kN8EP4irQgY+/eP5z4CTIN3?=
 =?us-ascii?Q?I2lNtedNIslEU0Y+JlArJKtbgeoHlVyNlfyNKPqHrb+/fN2jF7l9BTi0zPS2?=
 =?us-ascii?Q?LEtKRYo0kdiOckUoWFMJ7jSzQ/quqQJKIZsysXITlyug73Z3SVOlRpck2tEA?=
 =?us-ascii?Q?Gw8pLyOAHXPbsNZuc7cc6TuzPU6qXnbWekm//j6eH0GGvbh9ke9qA0HoN9AU?=
 =?us-ascii?Q?eH/T3P/GDyiCb+TulQEOo7vYc1TrlNfKSTpMzt/hiGMGM0unP7f6MfhQqaYm?=
 =?us-ascii?Q?LrBfvzPomQ2wsm3qDvR6ILlLFEMyP3BhgMrliAeqlBUO9XC0ha216j7IuPpw?=
 =?us-ascii?Q?HQ0A1BE6XlETmgniOnMW1Ux+uun7mKTph1nlYdv64rAAvlEChGbospIPkySJ?=
 =?us-ascii?Q?hg6itBicvoIassIXe47QFMopMt+iTnRgF6kkedoIlm/bKk5zfG+pvOoNyE9N?=
 =?us-ascii?Q?ql2RE2UF+cVZpbmEK1PdzogwNXqnhET9NzdOKDvhdHatn74qTBeqeuWpO10U?=
 =?us-ascii?Q?Q4gTk2xhkfE8xOkUTZVNpuUItswS3y/eIlTRwF/ztEr0gRiIN0tNt99Ap4/I?=
 =?us-ascii?Q?PZ5x5bWiPg6zda/V/dsd5hB16JHJDgSOcyX37Sxwfk8OGeYmp28zxBSIkUpw?=
 =?us-ascii?Q?eW/oNVkhrS1FATnIRf0m+HPsHV1m/+T5lo1O3lbLzOH7qD4aqdp4gXQIPSQp?=
 =?us-ascii?Q?uSxU2qh5yoj5ZREZPP1scvxEPpTd5SXylN8Ox4d2sq8EQt+7mKjj95n8jPoZ?=
 =?us-ascii?Q?lAy7bGgP8YvgxfnveoCteEa9gR9hOsjNDlLDQTnUvPp6PqSjmeNK/CEh/kdK?=
 =?us-ascii?Q?CBf6JtL06pguaaLY2JalMxKWGT2/qtW+jXLoTPeARQ7XDZuj0lcXZcQ/f7KQ?=
 =?us-ascii?Q?xu0JPNxFxAfCPsmQz/pG6OohqqMGTpmLOEO4VDO8PJ2w5Kg2ni32EfRQ/1j4?=
 =?us-ascii?Q?vetr/cxE8bHp82GzgReOuGRSyIP534bj/MHDWz/YrIU3Jdz6Db1va+huMQpb?=
 =?us-ascii?Q?bNQbcMXFWGPVarE3mkZEwoMDUZwnjCEspweaA2OtfHpUViU3j4xOHPhLJQNo?=
 =?us-ascii?Q?KOFl4/y7tSeehdcKANbG9VyvMN2ryusJL70iAAdpm/Mjqq96CnRoYkGKIR6+?=
 =?us-ascii?Q?DdgFD8+xASUO9B8A8zF8r7i7tmetvOovgL7nADgWCDOUkGiI2zZwYfU/bZcU?=
 =?us-ascii?Q?Ddm9o55Jwkc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?juB+lNbgH8rF/7k36gVcyjuh8S3mbw+xPfYTdWVXDDMtdam0pmxxk8QKvMQV?=
 =?us-ascii?Q?cWqueBxLqnA/cGpXJhQ0GiduQnImxo7fuzicNOYXz1ilTgb2XsAP3IkbTDAN?=
 =?us-ascii?Q?iZ1528rpuVQjRDnUzckytQOTOgWUBm4tUTbYd7Z4axuTlG/nzJcqDyHqO/rt?=
 =?us-ascii?Q?NIrN286dagZs/yfqAHZZDQHOYc0mGdEVJaAlBk1IKa9p+vriv+Euz0qY/28W?=
 =?us-ascii?Q?Q+HW0xDHA/8NTHrfx1Xtstihk+Y/PQk9PPE99wvZ/Y1L99rrycJCxirCVQ2G?=
 =?us-ascii?Q?fGBJAtqeK09fuBM3QPZzD1+w7DG4vQaQqRH43eqHE4hPpK+nc4SlT06MszHO?=
 =?us-ascii?Q?BooprWzhatpGUzohKoNyEYhXgVylcskV7pe6kgD/NyAbSvSgGE06abGtxBYc?=
 =?us-ascii?Q?y3jjAG6wdwHJwcNocLeKCctXawHT4xgCc1iCym1PozIw0yAAVU8vCon8Ahjj?=
 =?us-ascii?Q?udgTxxojeMquyWp7+KW17V7Xx8URe0OctCyLk0h3SjdVoEMkSgmjxZyrYUp8?=
 =?us-ascii?Q?VMbMwnDFpi+f2gQ4dF12VCkxqe5KUlEmXTlfOrIYw10UCY/PEq/mHk7W0h8Z?=
 =?us-ascii?Q?aiS0PzR00n/cN/58jtrhHodmQVQkFtvDr9qr6tBDBDiB1PDYKRfv9/Az9TRr?=
 =?us-ascii?Q?0JUnBtVWSsiNwFRE1rY5ji2liJRizEZL4Xkoe4+SYAaw1ZbGBgEsd+OfStBe?=
 =?us-ascii?Q?ZrIUQclXWLox/cDTZk/OrDC72kQf+qA6RvmsCeLyoM7ZGK7FuILn1VKZyqgD?=
 =?us-ascii?Q?HlbGcHDUz01VeC5wbDytPJ2A36P/Pee8saoHFZ4DlZ7Il5653EOrPpxwdNO0?=
 =?us-ascii?Q?c4FMeaohef0KoBvNt0nqeXKu/33KF0Gi2YVklJ1XbHSsP6bTwY7dziqVUz3w?=
 =?us-ascii?Q?KDVdJ48Ax3vvZ7Js+WaJkUi8uRlOQETd9oEtd5GB62loope8JBbfjWqQDVYj?=
 =?us-ascii?Q?TUD+pq35eZjgvyu3uMQbbQbl7NRH7dyX0bUhbGiN+cPcDvKcJWq36Toh6F1J?=
 =?us-ascii?Q?d7i9jBNtZuofkuxJglsEyvhGHVGe4o2aYphwQA46muYYw1izw9xjWTIjOM9t?=
 =?us-ascii?Q?tjenQmZoX3Dc8QsrnopExSUww/bZ4TIRIidCacS30+aY384L3cfuyuIPUsSQ?=
 =?us-ascii?Q?ekd1VTtkQ5W08f/ihExdPUOwZotEdNPHSKY3yJeWHkVVYYpXP9sRdtVM1WzZ?=
 =?us-ascii?Q?UEiDlXno4uDxlxeNHwhUTL2YGGvRyDmUQTz5GcgVuj0EyNfzNiOU2R+5kgMw?=
 =?us-ascii?Q?dUJl1Q3/6k/9dGs0DFQRD2PgZYI1KW6CAXgB5KotPZ3EQt1wdns75JausXFD?=
 =?us-ascii?Q?+1QcCJkQRzdmBiWhBUQMc1i5ENjWKOEAG/ByPXtvYlS/4AD/ye5krF1hQ1dX?=
 =?us-ascii?Q?fivEyODofoTWJptgE3MIQhWptPtcKRnFnvTCYK/VZAbeoSrE+zGt7mMzqJJD?=
 =?us-ascii?Q?LQHgb5+u4nof3S/vx3H+lkKip0oluXy90hTumk4Z7lLUl1dQp2jULR+oSmu/?=
 =?us-ascii?Q?U3lWLG9el9+anC70lMiOdz4CKbx4Kr/eupBnjtqZkSkcpa5pMBKZO00wMYNi?=
 =?us-ascii?Q?CDS8xvv+xajw5asxYgghdHQgb0FDaK9s3WHyPJk/gGY8kUHRW64yyZf0HUWK?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91816f67-3a27-4262-d501-08ddb3f0a59b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 14:00:31.0543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zZiFajQArzzMIBX24WMKBjKmPlL4PpqEEEv4Mcp6SMBDtqFP7f8jVPI2EyS6JEWERsAuxeLewsJyfqNtu5nAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8402
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

On Wed, Jun 25, 2025 at 12:32:41PM +0100, Tvrtko Ursulin wrote:
> Attempt to consolidate the LRC offsets calculations by alignning the
> recently added wa_bb_offset with the naming scheme in the file and
> also change the size stored in struct xe_lrc to not include the ring
> buffer.
> 
> The former makes it somewhat visually easier to follow the layout of the
> various logical blocks stored in the LRC bo, while the latter reduces the
> number of sprinkled around calculations.
> 

I think this is a good a cleanup. We have bunch of other work on going
in this area - trying to root cause a LRC hang, Lucas is adding some
needed documentation, etc... Maybe let's hold on making changes here
until those issues are resolved or perhaps we can pull in your patch to
one of rounds of changes.

Matt 

> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Matthew Brost <matthew.brost@intel.com
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c       | 41 ++++++++++++++-----------------
>  drivers/gpu/drm/xe/xe_lrc_types.h |  2 +-
>  2 files changed, 19 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 37598588a54f..f0c33de4eb6c 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -717,8 +717,12 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
>  
>  static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>  {
> -	/* Indirect ring state page is at the very end of LRC */
> -	return lrc->size - LRC_INDIRECT_RING_STATE_SIZE;
> +	return lrc->bo->size - LRC_WA_BB_SIZE - LRC_INDIRECT_RING_STATE_SIZE;
> +}
> +
> +static inline u32 __xe_lrc_wa_bb_offset(struct xe_lrc *lrc)
> +{
> +	return lrc->bo->size - LRC_WA_BB_SIZE;
>  }
>  
>  #define DECL_MAP_ADDR_HELPERS(elem) \
> @@ -973,11 +977,6 @@ struct wa_bb_setup {
>  			 u32 *batch, size_t max_size);
>  };
>  
> -static size_t wa_bb_offset(struct xe_lrc *lrc)
> -{
> -	return lrc->bo->size - LRC_WA_BB_SIZE;
> -}
> -
>  static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>  {
>  	const size_t max_size = LRC_WA_BB_SIZE;
> @@ -993,7 +992,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>  			return -ENOMEM;
>  		cmd = buf;
>  	} else {
> -		cmd = lrc->bo->vmap.vaddr + wa_bb_offset(lrc);
> +		cmd = lrc->bo->vmap.vaddr + __xe_lrc_wa_bb_offset(lrc);
>  	}
>  
>  	remain = max_size / sizeof(*cmd);
> @@ -1017,13 +1016,13 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>  
>  	if (buf) {
>  		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap,
> -				 wa_bb_offset(lrc), buf,
> +				 __xe_lrc_wa_bb_offset(lrc), buf,
>  				 (cmd - buf) * sizeof(*cmd));
>  		kfree(buf);
>  	}
>  
>  	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR, xe_bo_ggtt_addr(lrc->bo) +
> -			     wa_bb_offset(lrc) + 1);
> +			     __xe_lrc_wa_bb_offset(lrc) + 1);
>  
>  	return 0;
>  
> @@ -1040,19 +1039,22 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		       u32 init_flags)
>  {
>  	struct xe_gt *gt = hwe->gt;
> +	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
> +	const u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct iosys_map map;
>  	void *init_data = NULL;
>  	u32 arb_enable;
> -	u32 lrc_size;
>  	u32 bo_flags;
>  	int err;
>  
>  	kref_init(&lrc->refcount);
>  	lrc->gt = gt;
> +	lrc->size = lrc_size;
>  	lrc->flags = 0;
> -	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
> +	lrc->ring.size = ring_size;
> +	lrc->ring.tail = 0;
>  	if (xe_gt_has_indirect_ring_state(gt))
>  		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
>  
> @@ -1065,17 +1067,12 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
>  	 * via VM bind calls.
>  	 */
> -	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL,
> -				       lrc_size + LRC_WA_BB_SIZE,
> +	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
>  				       ttm_bo_type_kernel,
>  				       bo_flags);
>  	if (IS_ERR(lrc->bo))
>  		return PTR_ERR(lrc->bo);
>  
> -	lrc->size = lrc_size;
> -	lrc->ring.size = ring_size;
> -	lrc->ring.tail = 0;
> -
>  	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
>  			     hwe->fence_irq, hwe->name);
>  
> @@ -1096,10 +1093,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
>  		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
>  				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
> -				 xe_gt_lrc_size(gt, hwe->class) - LRC_PPHWSP_SIZE);
> +				 lrc_size - LRC_PPHWSP_SIZE);
>  	} else {
> -		xe_map_memcpy_to(xe, &map, 0, init_data,
> -				 xe_gt_lrc_size(gt, hwe->class));
> +		xe_map_memcpy_to(xe, &map, 0, init_data, lrc_size);
>  		kfree(init_data);
>  	}
>  
> @@ -1859,8 +1855,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  	snapshot->seqno = xe_lrc_seqno(lrc);
>  	snapshot->lrc_bo = xe_bo_get(lrc->bo);
>  	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
> -	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset -
> -		LRC_WA_BB_SIZE;
> +	snapshot->lrc_size = lrc->size;
>  	snapshot->lrc_snapshot = NULL;
>  	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
>  	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> index 883e550a9423..2c7c81079801 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -22,7 +22,7 @@ struct xe_lrc {
>  	 */
>  	struct xe_bo *bo;
>  
> -	/** @size: size of lrc including any indirect ring state page */
> +	/** @size: size of the lrc and optional indirect ring state */
>  	u32 size;
>  
>  	/** @gt: gt which this LRC belongs to */
> -- 
> 2.48.0
> 
