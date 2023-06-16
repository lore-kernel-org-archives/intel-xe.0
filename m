Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D990EB64D8
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 15:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A4D10E0E3;
	Fri, 16 Jun 2023 15:51:03 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7470E10E0E3
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686930661; x=1718466661;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5xoi5iGLIoGQh6KEpKAqo7cazOtmaTfTzxixpfD6Or0=;
 b=eQwuwgtCm1fiC3pVaAeLDNFbYVzZsIF9kMYrCAvz//u05MqQDCydHaaz
 tmbcrIwmbNq9/gIMtV3T2m1ElrDAgIuJjS//P9ekWiPlt8JIlrRIWLglI
 QDit1h33fDfsgX2KI2xKqJEv+6R4R/EQYkxB7apjwJmjSCeVulRjZV273
 wPo6CKmUdvagJWOeZBkaWC0KAM7atUgb9TM51bvWivC8QyXP9gSxIUmhJ
 id9lL5GlcmqIDQCOdSYk0CKpZinL59OlryBBKuDW3OUuJogova/e+H2/r
 Km4/puAfwdp8GUr6q8qvZ3CXInRDFRakOchP+cEkAdWaToiL6Njzn2ZNS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="359251647"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="359251647"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 08:51:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="690288105"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="690288105"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 16 Jun 2023 08:50:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 08:50:59 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 08:50:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 08:50:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 08:50:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hjm5oS8+IK/22/26vaUM8n93q7bS4U+1Io6Y+pADlL/JovRkBgtRoH02rp3VdCEXXmimlOZQgIZsv2p+eSFLaNX/NRExRIqC3YYIJf1gOLMWTLJSnff5UfXbYGoA0q/4SIytIk/vZJMYncuN0p4/UCMt/2sdNUyuWMDnSg7ZV/kdlFprYa2cT4mHDCBganQcgSv4sjZtAwBqBzEo0+SM2y8DGi8U2JP2IJQw+aUU4qDqZ3ov0/gWBAWDSkYY8jyYVmBO2wR2L0ECdYUrltAOnYjpl0B/gzSae1a2zDlJbIFd/zlg4/slkSivo81b30qfyUYarTy/LSjin/yq7SzQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HTi2lsBNKTO3Hwb6UKCgZOLaJ5AbA8+jO+ktYV9nK4=;
 b=mO55A2p9yEqMktgPnQ7C7wdiMn6G0ki+0M3O4s5VA1uecrbq8lJ93wGRAYkFSCOs0cgAcMrZN4iADGhiQrvpaMvsnooRPCiPGlKy0j4UnMwhem7V9AteKdxb8cKe0iCPBP0oQEz5suUP+IofZDotPHtR6YjqHxeGcxaOQ6a+s0/ReoBpE6cPO2lq5YCiRTb+YQT2njysGuJLIU1KctBy8m/wIuT/z1dlYIGul8V5zwccjP/XmxQZhlWbwn9jIcClA25KTE5sPLuQ76AHhvBsYjDmAakSnhpUytSb/rdJkd/S//RqslIHRwVpGQ2Bwu0ljyS9Bdi8ahFWUJJqZw+uGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4710.namprd11.prod.outlook.com (2603:10b6:208:262::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.30; Fri, 16 Jun
 2023 15:50:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 15:50:51 +0000
Date: Fri, 16 Jun 2023 15:50:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZIyEuYhycb1qDHJu@DUT025-TGLU.fm.intel.com>
References: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
 <20230616095504.17084-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230616095504.17084-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0205.namprd05.prod.outlook.com
 (2603:10b6:a03:330::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4710:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0c22cf-3f7b-45a4-e346-08db6e8175ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RLzSR4mOLr3gCKx+GwGIOBRGgaFUH2o5x9bK/w3ocABRU5nQrbwe9WVkIfh5lCFYP0KEsnFOc+8ierkrhTuZUvuJTub6e6w/7J44NZ+k9RsN0Khkce6QHh/40Ysgvc4534otMy2/oG8wf/LVnqWN2HHMQF+6X3WPR8au/yZcNt+/2wC9+Yf4v1sZv5JWJt1rcpCOHC6XL7ZNLrV0lWqJJTPq7MrQYMQ8TO6m2w4HcwTV+Xv6UC4CFJOQcfdu+hEZ5KgZaAPkRrYQSuQjnx4ClToMQjIiiE/LwuzkhY3GphUNSDecuxvYBmnrJPHQLkoZtoEzgmDtSvAnimG30DR+PZwly69bF54TCAYA8bZl+njmtCbFlmBns0MzcfcOvRPr5OQdKcyAzyBTdEJjDkmeERrdiN1Ro5i/cr6z2JoOG46hQP8HGeK8kd651a8uncvjy1IQebL51EpaskhKWAeJBW7TfxYzOEqtIEF0y3XvrpPqhnlP50hGMIXz8ee2sszjDHxbNCoNfeDU03UT6I9+EG5aIloiwaML0i6RKQac3sVwYSld1R1gngsXC0OJpkhB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(86362001)(66556008)(66476007)(316002)(6916009)(4326008)(66946007)(478600001)(6486002)(6666004)(44832011)(41300700001)(8676002)(2906002)(8936002)(5660300002)(38100700002)(82960400001)(83380400001)(26005)(6512007)(6506007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9CweEaO5vdU/3agQaJNCSz+azQJFCImp6sGWaTzhqggQMs/qHMqXcsxhag?=
 =?iso-8859-1?Q?iD4JHkNqbz0dZScqbiQH1v2+9l1uePEIgxpSvbf5XG1FY8ltu1FxGr1P3V?=
 =?iso-8859-1?Q?RoxtHOoOZPV82mBRQVNeRlyn/+CXrIalYq867O2la0BehYPNIh63LrKva+?=
 =?iso-8859-1?Q?7g+XgtLtkSK6rndN1qnqZsvaltg2gqAVoZsO1f1sZ+skc6iWz/q2bsiPfk?=
 =?iso-8859-1?Q?iZALL+XhgF1fjpk+rGjcpxsfWYsqRhdbe7bx9KMxeAiHEgyV7462aE4ZjB?=
 =?iso-8859-1?Q?bhhGwm09i2b1wSS0Mf2w+Xd+fVExXjJt/7iShyy1NYYsOOYq+t9b4ULQNK?=
 =?iso-8859-1?Q?EWpcj6Hz0RkakTOjQP4aquIw4wdLdATOiT18hSTtYxYZ8mYEqCXCA9VseN?=
 =?iso-8859-1?Q?5wY7+jt3+XZEvCfZPSUtzoJdnqr8YShWFl4tBNz1MZqp9jaC6xtu/sNJda?=
 =?iso-8859-1?Q?fmE1/NTa2ro42GDCVYLR7bjPDVtx7hibCSy5MUDcpIzUtAToo7Rn1QQX8e?=
 =?iso-8859-1?Q?njJhSUck7bJRsxYIxOD5Mpg8JLjEc+Me37Cdn9+MA+8DxnU1FBZ8hz7nSQ?=
 =?iso-8859-1?Q?wqvat1Px/MFMPFbB5UmwZpEWijt0HccZDw9257e623pXvcywszHuYyeD1Z?=
 =?iso-8859-1?Q?6Y785Z4S+NgfF1TJCOR7ihxzqr/C1Zoea/SBZmtCDWeE8Si2ZBbQGLYei6?=
 =?iso-8859-1?Q?ltIUW/ss+vwi59NvkBF3H490mE4mYJVkHzkOIx22pH6r8LzGTdPBPG99Xw?=
 =?iso-8859-1?Q?nzCfZXlbcuQsyaFQ+EF7Z96Lf8N9ccNKmMBt6odP8zF2mrL2EWx2Ywnxhi?=
 =?iso-8859-1?Q?gkfcGqZq8d5zVQg7AeAHjKDPpENciTuUec7WVEeg4TAZZObF4Cn3dFmdAy?=
 =?iso-8859-1?Q?qie1WW2nvAA7ja/g3tK/jz6Nn4u4LySAx9E30f1rqtoQMtZ8Z+R0hnFxi0?=
 =?iso-8859-1?Q?P858rpGLiHHVpMWkrakBj1xCoOywKXf/G7cpWdJEki59CdLpnxKhODboBO?=
 =?iso-8859-1?Q?2xM8lz+bMh/kIs2Dq+HS5BrEdHo7Pqm+ICg9v0AWdvywD/Vv9br0JX3N0f?=
 =?iso-8859-1?Q?bCZgE2erGAYw7Uu8hSJD5cGmB54MXU7BWxKyRtZMEyMbIndfm9whT+Pq+V?=
 =?iso-8859-1?Q?sVSYnV+PJi/s9Q2SXWeGql6YIzIjqkbOhX3rLa5rrW0CKaOH0tB/OKqSEV?=
 =?iso-8859-1?Q?lSc+UrFaTRF5zmTkLioQVG3UZg/QHmO6I6EqK8hyOVBFSwsrtY+wNB/prN?=
 =?iso-8859-1?Q?s7vXc9cFQvHX2JuqkH+qmIsc9mh6XT5jSDxKLCTwP09Ad7/413GhWecVdH?=
 =?iso-8859-1?Q?XwaO/OVjXL8rCIU1QwBu4lHLJsyrNBG2VbQJ9z/u4hbcW9dm71EsGHy2OE?=
 =?iso-8859-1?Q?KGoy5pAZleGbby27Ym+gFFmAGEFUTIHsbXe3CbMJdOi1NFp3444z0QO9jb?=
 =?iso-8859-1?Q?4iyGq+JbU5xGugpZ5ZdVM7sfL8YKyLdIMzFuTOONcKbJXOukrl4WKQuT5q?=
 =?iso-8859-1?Q?b70fFkCb+E5iZu8uQKDctz1oRn7GRT8B0J6JyN8uGACzUIhN5+9DNttloj?=
 =?iso-8859-1?Q?cJNBTMH7SgJlU+9FTEnflHImDhE4NrHLDlUkBwlFgJq0WpR5xvUyfZT8N0?=
 =?iso-8859-1?Q?c6DoOik749m67ujssbpn4psX2QwqmL0AqcDBFAzkchRVRFL9j5B5LHAg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0c22cf-3f7b-45a4-e346-08db6e8175ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 15:50:50.9858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2X5MS60OaCuqXUHtMjB0NxkimZQsn2U0Epqi1KfQPZXwFiO+6qO9vAxwmt9VuNx5Nu+JfCTpMzRV6O2dCzVQIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4710
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe/bo: Fix swapin when moving to VRAM
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

On Fri, Jun 16, 2023 at 11:55:00AM +0200, Thomas Hellström wrote:
> When a source system resource had been swapped out, we incorrectly
> assumed that we were lacking source data for a move and therefore
> cleared the destination instead of swapping in and copying the
> swapped-out data. Fix this.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index b94a80a32d86..43d81f37a855 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -568,6 +568,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	struct xe_tile *tile = NULL;
>  	struct dma_fence *fence;
>  	bool move_lacks_source;
> +	bool tt_has_data;
>  	bool needs_clear;
>  	int ret = 0;
>  
> @@ -590,8 +591,10 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		goto out;
>  	}
>  
> -	move_lacks_source = !resource_is_vram(old_mem) &&
> -		(!ttm || !ttm_tt_is_populated(ttm));
> +	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
> +			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
> +
> +	move_lacks_source = !resource_is_vram(old_mem) && !tt_has_data;
>  
>  	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
>  		(!ttm && ttm_bo->type == ttm_bo_type_device);
> -- 
> 2.40.1
> 
