Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CD7CDB474
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 13:56:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05EB10E5B3;
	Fri, 20 Oct 2023 13:56:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C38410E5B3
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 13:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697810160; x=1729346160;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WyO88k9Z3Kq+UOeMylH1duBXXx3Xk4aLWVCOeCY9CNE=;
 b=ORSliXaZgAC5ydmq2lj8tTuuV8SVtn3g2JOSLzxer+8cvFzu21xqA2wE
 QwOzwbiANTfcvV+gmc/7MXIyRavgccCI4/rUArtBovvZV3eoz1KOPZfna
 MmBpIJlY7EntW2LdRgGK/0lW1OigD/43255DIwkoM7Q0/lWasnWr5tESC
 tsp1Vz38zhIXd1h/htON2uISZLGX8OL4VaQ93GFrofrSZ8MneRyI3IW0k
 AFPDlmkMfmHdpq7jLToCg4EvAxbZBJrSTjDon7/T+ZrkDPYloC2+1/Lsx
 qkDEKwXZJ+Ffk0qgJvkP8TvYkElXAxknLMEt5Pt73dGhpq9fXlXw3amBI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="450726321"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="450726321"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 06:55:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="848088229"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="848088229"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 06:55:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 06:55:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 06:55:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 06:55:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6Ym7Srdi96FCaS6UBFwQNHuB6TsV4nukj+Jifq9MYNZUuvUd36RpzIYLVlBwZt3CLCg2w8nN/isxgjKwfm+hfGuSM6PDs+N386KWIIv5cYgDVupfSYKn5qFv3INsJHNaGfSFXImDNkt9O818AAyqI8TA2MYGfbkFA3osx2jr4yOADJkawoI4kDJ3Dj+/r78114sf5y847Q9tg2TlEAbPpcmesfK47jZSeEmQiCNIvmYBAmJ63FRei3sOtmQoM4zOQWkRMoPR9n4Ljhs95xiSwVEbHLnjU0AXCEEytVFTxBDpJroAIW0IU2dYE5SXYiBosskYanUCt4xH1wViCeqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxs1T/HObZEnLlQAjSsAZCsaJNLXc3Duu+X73hgR+/8=;
 b=GePDahPucPTD8dQT8RTf6DGymRM5aOmb2BN+gGEyaNPC6CdOvBknDFcD/l3ITKye2PH60YH+IqnMNrisyE0LykvnNUeqmUgqieQPo58SZwNQaTi9hVjSFn49y7q6+oeSC0bYjRCYgYhJvZS7btSOPRjCJNkeb50Z+QLYvNtaVLKV07BeGEl5UNYjoN9OdNCLTlG3S7Xz+JWhaVUoX4YzVO+L7cpmnR4085IDUXBHs749aTVua+zZGB2S+Fo7xC+ko0Zaxyrh58upUyArDIgm18J+o6Pxg16JaVgsfaQho3WE+3VxiOV9GZh+AWGo5RYBPNiOT1cGMOQ81W+Ty/6l2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5399.namprd11.prod.outlook.com (2603:10b6:208:318::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 13:55:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%6]) with mapi id 15.20.6907.025; Fri, 20 Oct 2023
 13:55:46 +0000
Date: Fri, 20 Oct 2023 13:54:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <ZTKGlROKvlvH2FM/@DUT025-TGLU.fm.intel.com>
References: <20231019174534.20542-1-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231019174534.20542-1-brian.welty@intel.com>
X-ClientProxiedBy: SJ0P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5399:EE_
X-MS-Office365-Filtering-Correlation-Id: 87490c8f-ba13-4332-27e0-08dbd1744252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bb8nnazwKm2LJHt/isTB8nsP9QBIuqt0rNz6W4lrxKkDRU7r/tSYrFui93CFmvzQPCxpMYz6KXHCRo91cu8fiC6tefNALbVJ865zhH4l9rYFvOBM7G4tQpQzYupYnJzFiU42TJcaBHkcjwlIucwRjujPtcjWzUS/irQHtQrd9SkBRu8oIdu+kN29kKVn3rp1v2ETDuA5h0CQV+ZWHWcibTTo5hoZUiWKFIi04rBd2dQH2BV5TGrrAGsxd8lfnzl9UzVcn2uu8XnT5bsDPZFe+VIQEGxoKZYCDKMlyEn5mViexzcBfSM4bpTDeIDpi7Mos5L0sjr8/w0iJxDvmmuYgQWt+3MSjq1pdwov0u9xSubEgYKYYty90Xc2IwWe53Js8BOZ4+rLxl1vimPZrDhzJXOkOZ9pBDWvC2/iNCdqtDGbhnmdYDWq3ZqoEgSh9erX1GiE1t2dG3DOjfkcn257Yxw5gXPwknZqaOF4F4dGRb8LhO9NkoaD+H88tc/lxopDEv+w9Je3JaD0Qti7Q0wVhiavWKrKWTmqPZK3EGcdfuW7U+FUfPsB8EaMpkeJuf9e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(376002)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(86362001)(6486002)(66556008)(5660300002)(66476007)(66946007)(83380400001)(44832011)(38100700002)(2906002)(6862004)(8676002)(4326008)(316002)(26005)(6636002)(6512007)(6506007)(8936002)(6666004)(478600001)(41300700001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OKrD9QpNI4O0DvGApLCgyRx8MILIW5/J6eb3Sr7z1u6z5Ru9CN0y8thBlLn1?=
 =?us-ascii?Q?PJYA8IXCedU+reEGHHXRhqQDsjp2cHK3ZN72exY47oeb1G7NXLYYWgCV4fwj?=
 =?us-ascii?Q?Z2BxNz+zqT/aAH7ekxfmomFIEvQwYbB1WjqkLgPiht1G91USmDf8aNLTHfdD?=
 =?us-ascii?Q?HKmYmuNU9zU3V+8vcL3UbKchDSRtF61hQHK3ZP56Gr6sEWpGaU2mOSHJdFxh?=
 =?us-ascii?Q?UT1AP2x9nwtCnW9JMAuPBgZJZ8lTPrg4+L6SsCE8sfSwSw4rTx3ocklPFN5x?=
 =?us-ascii?Q?dotbIB/JGsmYuO/KFgwnEBpXEqkGZbaDS6wJQwD05q6GlfMQNtIAznlYGqlM?=
 =?us-ascii?Q?3uFiqYD8mVZSPfBhVDILy3q8BFxkSgLNxeybNAr3S1rzAzSTI6TGZGTbNcNl?=
 =?us-ascii?Q?uxMEnItZk3IZyzKHLZEq7tCPUGGbCQCgngSWHZI//zmKQ7PsDJGVFuoocTWg?=
 =?us-ascii?Q?g8lW0rx43EIfHhVYNyTg0J1hm1/q4dypLNaSBREA2i8Xiua0onUPf4jMOB4P?=
 =?us-ascii?Q?0IB4H1+SfVgB/TPg/dR0Bo9Vrmkk45LPoWpJd0QLCSojz0wlRMX5n8I+E7Um?=
 =?us-ascii?Q?2IciOhxvllyBzvp7FIYOEX0tNjMg15JGI9UXtLFdEtaWqnb148XhztrvFaMG?=
 =?us-ascii?Q?GbEmr5HHL5jMEj0tFo4+KGkAtkp62FSZhu1GS9rfGmltchaFknDWBWQt3Phd?=
 =?us-ascii?Q?1x2iEBzcugA/w70Hfb9PjgdDriaLLJEnRSE6hlSQh6OzipzKEYUD6AuHq16P?=
 =?us-ascii?Q?Aic+/wcPzafIf6DY2MOibYXRDs2lkjJ+bXJBAOK4EW+HPFuYCsztxPR40U5R?=
 =?us-ascii?Q?QQpMo0zk8NjgUhq68MiTQ6sV2SY8dZjLc6U/ipfRW3lQ2ngsTF0BWhBwaZXP?=
 =?us-ascii?Q?nEFQsGws1Oyh08upKnfnHE6E3OrmND2eh0VCFF2B26o27YU+aJ3B8pMry4qG?=
 =?us-ascii?Q?zNA/dHEaCaVW3o7E0E+ubvZfuzihZ6PNZeARqTciHRJ6uef4C9PHXXVUYPhS?=
 =?us-ascii?Q?uZZoBmLjwoddkfZckK7ae118rTs4PVFdGBkat46kVumwtno0Ku+TUZqGVA7m?=
 =?us-ascii?Q?YUyKCoR5BWZYn75GD3an3LdRzKYiwkjGcz97xXiZYKPYtXL8dvZf/3/8wOEC?=
 =?us-ascii?Q?lEFPUnFWVmSXh9CPCUKumkIYVk29deqAEChoAZKIMRQeHF2aFRD+5rSN3nMQ?=
 =?us-ascii?Q?WB34iBikpCYtPR80WXz5BozN1PiqDAZS8W5noZMtZ0nffKW1DfrYGjgO+cjv?=
 =?us-ascii?Q?ertxhRJ0+AUGBrvIV3XkY5XtJl+fc5Ktfsd2usRo0YM6bP0QJb96YsXL8/x1?=
 =?us-ascii?Q?6yi/1yuWD8RpsEDrYqPv0RTzyg7NnDOn+VeYTVG83mmB3LM7G+AjOIQCpgeM?=
 =?us-ascii?Q?ETxOUabokrKRnrX58t0ttNfzIMIQvPHz8SRtNf00rJHRZKA5pASRaIq9dT6m?=
 =?us-ascii?Q?XCjUMNUl7gshK2HfV6HJ0HSPPOyaeU589H6mi354iOUoHxnv8KzFzURoRTcV?=
 =?us-ascii?Q?WyJJrXzKJwzRY6EffPBmxeYFWVP3Og+OY9PqN9TSYeeqKrZ5+z398lSpWCcL?=
 =?us-ascii?Q?1JHNukA0AC8vh+yGoyiHnh4LBdkwGxBJuQWi92+H7xoIlrbqkY1GskeodLsd?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87490c8f-ba13-4332-27e0-08dbd1744252
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 13:55:46.4461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8uu0//87Czn7rMZz+YhFzeXjXaInn1qRjBRdjD66fSn5YHgRS7xlq5aMRJmPpgx448e9LjZfyAqiji0qFMtAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5399
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Simplify xe_res_get_buddy()
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

On Thu, Oct 19, 2023 at 10:45:34AM -0700, Brian Welty wrote:
> We can remove the unnecessary indirection thru xe->tiles[] to get
> the TTM VRAM manager.  This code can be common for VRAM and STOLEN.
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_res_cursor.h | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> index 5cb4b66a5d74..006fc1361967 100644
> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> @@ -50,14 +50,9 @@ struct xe_res_cursor {
>  
>  static struct drm_buddy *xe_res_get_buddy(struct ttm_resource *res)
>  {
> -	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
>  	struct ttm_resource_manager *mgr;
>  
> -	if (res->mem_type != XE_PL_STOLEN)
> -		return &xe->tiles[res->mem_type - XE_PL_VRAM0].mem.vram_mgr->mm;
> -
> -	mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> -
> +	mgr = ttm_manager_type(res->bo->bdev, res->mem_type);
>  	return &to_xe_ttm_vram_mgr(mgr)->mm;
>  }
>  
> -- 
> 2.38.0
> 
