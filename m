Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05D4C001DC
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 20:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2D710E080;
	Thu, 13 Jul 2023 20:24:02 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71FB10E080
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 20:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689279839; x=1720815839;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hbDoRqKAI0gZ1AYIu5mw1hvNSD3T4QUYFGk0FUh3szw=;
 b=L5nnavTiGA/05xYo9kBD633XMeF4GG58zCZ9EM4qAh3eUgQWw63TjaQU
 aRiSzmKQpyiL71nnbHHbesZ5UNKoWldjGcs+6yh+833Ia6lrg5bNel+NA
 ie9jHz6serUqfGzsGBazHqESuQ+tFg6vcuBSY2XU8xGTsk8m5x3/11TnG
 Yzbrfs4YdJ4kdZyZe0in622efKENBBkRJO7EX5+1JEJWZoqYVu7qSTf1u
 +mGLo1z8DdgHIVJrAYHnhiBAoB4E7EqmaFpcVZ0ne8kpbW9GQxbH0tVim
 buSCaL7F+xktySDsIpc16TJkCXfpQPldWcPKayVsycfsL+NgB3l7CvmSF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="344901069"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="344901069"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 13:23:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="812156834"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="812156834"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2023 13:23:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 13:23:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 13:23:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 13:23:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 13:23:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSqTh7TomueXUfRdASimL4OTVUah2uPlQy/KP0aOgMCzW0wROMSHvBPCxqPoVvOWF8gkSnN3YRPQgbcs2+UdzXWD+jF3jkts7usChmQ6unhN/oROWlchKAjAA7rUsraZsW8jHRCiPTlqOeGqWLS9p5Vb6EJcACVt+syU+70qFJ9kgiKMEfXrOXirpPlzLbbX0M4ktfp/9YtxGrZWsHIVagfi9NF0yCqeguDCCtyxftIpHRrbQaHsO127gLLrz1wmb96KPDbcI74VXqiNgKCEUTbK2W6YeqNKKoofJqnSufipoW//Vk+rvRNLEyqy2Xcer3tucyv6++JB6uGs1MplJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhGR5Z1vjkK80oPsw6hVWHNzgOqRE0gK2LeTza/NVzw=;
 b=czkKlwd9usBTFk6AoivdVFRpIetx6H8UI0hk2HEofg48rcTMTBdqWtoz9VI2Zo+6OOaDD13SKbjDt6LsyBiK5nmRqmaF2NFAhrIXHAUahaSv2NO764m7bKtpCTOCmi1dKDMrVZv+nGaMoAhrFjFAFhKqTUZZ7FtpcynMwYsmkUzlE+Oa6UPCOec6oIqbwRt1AUPp3uKACXPn97l0zD2llB1y9KR5kyzwZFi/guf7KJY1aknJf8hPVx3GETSAIQEPY0K4k2vg1Ul0evcepNYtubdnDCfdgiKJ9RX2DyHjIUqQxYNrIaxnK30ZY7BdB3C3XPbSqWVdWqLgcUVHCEABuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4943.namprd11.prod.outlook.com (2603:10b6:a03:2ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Thu, 13 Jul
 2023 20:23:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Thu, 13 Jul 2023
 20:23:47 +0000
Date: Thu, 13 Jul 2023 16:23:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLBdT866TPKU2quC@intel.com>
References: <20230711212748.2029455-1-matthew.brost@intel.com>
 <20230711212748.2029455-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230711212748.2029455-5-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4943:EE_
X-MS-Office365-Filtering-Correlation-Id: 53fb49a8-f62c-40b1-5ea0-08db83df102e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EN4vIlRHgiPl6Zf6trbefDpGQ0YVGzi4C4jnZHBHvKxypNATd9ukCDUUt5ZEIcCAwoP1a6/SXC5DRz7uvf9mZo3aWC998yhaxvCgt5biQqXCpUbZRPkrvdSJaGGq0vj4lSRAhlxQK8Oo9h6H8TfbwrMSO0rnsD0xk0TW9dk0ubduInAIG5vlfnFJBDxLGYR7iYYJySfCoMVombSekbFbuSmStQL5qDrlJV4wNPnWTHXZ6HIvPL+sEPV66bdRBe/M4HZGZ6reaoekxdPraSY6RZfk2r0c/mXdx5Ag5oWrURNdsNo5sGkzNb6/pk6CM+O/mgd5jxHonn04GCKiPmSfkjJjF1sXAct5YfZL93Inc7rf1FieuSHSOzpMOll3DhE3vFgzAixhl0Fhz//UPT/W7vZiNjmXfhqibFkzfIusn3MhPsikWeBc69TYsIzyf2i03oTa/OhB3IIfQ/PJUQIgJyBc3neNsiHJw0MvWELJhmX3EnGWDlo7YfPiDKilMiK0TvEUBVicZ5ssjOWgFJl52+mssf0k/4vN+v3WHYLL2Zy+Hk/0yFEhh8Z1ckFOrMAd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199021)(6486002)(4326008)(6636002)(66946007)(66556008)(66476007)(37006003)(478600001)(82960400001)(6506007)(26005)(6666004)(38100700002)(41300700001)(6512007)(316002)(6862004)(8676002)(8936002)(86362001)(44832011)(186003)(5660300002)(2616005)(83380400001)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xxGh1U4cX2PuEFxghIWarQrvC6BKAJX9tmH9Mzi9T7gUuYBGfuZfHaTy32vw?=
 =?us-ascii?Q?uSFbcsykGLrGTRSHljL+0juFGJ1z/S5FtHkIglr0RufO+r4c6+WXTvYOZMPD?=
 =?us-ascii?Q?Dx9gTORrMdzbjwyG0kt4FIwZHI5AtyeI5lBokWK/anMjbNW+gw/1JThUoHcM?=
 =?us-ascii?Q?w4I8ihfylpa/wx+7LLHCHu/KG4fRBzsw8yxdxDEbiucBdzddwc9xOB5LrF2g?=
 =?us-ascii?Q?4ftwaedsuuhZfI6nLdn3X120ldDYqnny1Hs7j+zGraAvAwknimdfo1ZQ9fRK?=
 =?us-ascii?Q?4hxmTrOj5C15pNz6sIrr1gBCArJI5w1PF88ubWKqMjOecNO+0H3Wji6mwQNN?=
 =?us-ascii?Q?POow03LpiJOGIDNXam+yK2rkJo9y7FBduCLnSmUS3v1fnGO2X0RtWlxmUWoh?=
 =?us-ascii?Q?0WbUIQAARGZdqiX3jksqLoBP7OmmRATIvSPDs/OyjuUnjSoeJfdDHJhwscnI?=
 =?us-ascii?Q?JfINWTEpAM9ZtZ6wQyr/09VDgY70FdUkNW8XW4tm+dgfMcmAHTt8WIH/e+PN?=
 =?us-ascii?Q?dWYyU6ydvXhJmmf0yuzU7dN6z3akxydpvE5kaMja0bQU/wPuROffh0dW5NP6?=
 =?us-ascii?Q?wcyIWQRPn+GUe4iVu5j9MWHkM0IWZkEk5bgjtqUt9iRaaEbAQDrucmMT5/EA?=
 =?us-ascii?Q?MMEHTWUsKeDWs3VVxlsX8CkcvNXbzmCqT+r77t7QAUKYkiku44yKgJlAFtji?=
 =?us-ascii?Q?2FtDHkQXkJmBnyv+3WyOf5Ek3GJXFR1a5Yy1lVJP0QyE7eYNLrrK/06fKIef?=
 =?us-ascii?Q?nP+aTyXumc74gk1T2yvIcTiW0zBC6BXHlP4ixNEYLam0bzqA3WE+d41W1J12?=
 =?us-ascii?Q?hiRRmi+jUAgkSIahlGRk5OVsDdmCgqu6tKzoO4OkopxFCBTnxPb8+MYx+Dfc?=
 =?us-ascii?Q?ZLBTPo+59vQcPDVnxu8ebZ5vHoAkIeKkd091R06+g7BQG+NPwDVbAhqCRJ30?=
 =?us-ascii?Q?M8fulLVLgAbI6ZcU3ivusiTyOwDms1BSijXAOd+jISaN6gsUFJpywwj7tShi?=
 =?us-ascii?Q?vQUFNx2HwKFcjQZe/J7K7USemZfn4lxTun34jBvygDv/5tc+HbDTtHtKq3XD?=
 =?us-ascii?Q?efd2niwStO8vWZkuyfQfPPevWqgPIyrAssGcDaMdOi2mFYXFPTukZLRWwi0A?=
 =?us-ascii?Q?YNrEay6gz00r4tk27KZwJb1i4fF4kwkYeuvAZfVCcEHl1S3sp2th46LJZsgY?=
 =?us-ascii?Q?MYn6ovxGWf0e4cHa581JWOma4Wh7njB8Zntyc4u81E5YgUqG3YpIZdEW9yVv?=
 =?us-ascii?Q?+/GeVCh/pr9hiMIqCzHfBTVu4WzK+mEVXrT2BaqIWwwPIZmWQC1wtI6uGH/2?=
 =?us-ascii?Q?voAOtydqcAHqBgS+KEiXRFOUjN7GA6dONFzb5W0HFVC36WMUfbg2k3oUPRjo?=
 =?us-ascii?Q?BUn3/ZsaAwLFYUfWYS47xymntE1iqoq2scIC3+xWQWv5w1XUzO5fSJYc+yi0?=
 =?us-ascii?Q?vPltOYvTYB/EpGDm0DFFXTsZuQNf6MN37Vht+JEWuIORLCy1JCFFI6D9ppcO?=
 =?us-ascii?Q?/Vs5t9R9xuUhnXo8Uf1ed7A5qyWdM6Ka4Y1RkUQ9mw4+XpyqP96BuPTfzHps?=
 =?us-ascii?Q?aeMaSasytwy23ttxycFYGO7MDMxwXIO4sWQi+y56?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fb49a8-f62c-40b1-5ea0-08db83df102e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 20:23:47.7653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YuDVHu1YbxUz34NxWqQrs9FRnyYiqkbctDQqrxZO2v7CunvvrXPsc5jWthHWt2Y+QtD3f5BS1Df0rT3ieOKPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4943
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/5] drm/xe: Combine destroy_cb and
 destroy_work in xe_vma into union
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

On Tue, Jul 11, 2023 at 02:27:47PM -0700, Matthew Brost wrote:
> The callback kicks the worker thus mutually exclusive execution,
> combining saves a bit of space in xe_vma.

could you please open up a bit on why they are multually exclusive?!

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm_types.h | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 2a8691a48c55..30beae541aca 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -51,11 +51,12 @@ struct xe_vma {
>  		struct list_head destroy;
>  	} combined_links;
>  
> -	/** @destroy_cb: callback to destroy VMA when unbind job is done */
> -	struct dma_fence_cb destroy_cb;
> -
> -	/** @destroy_work: worker to destroy this BO */
> -	struct work_struct destroy_work;
> +	union {
> +		/** @destroy_cb: callback to destroy VMA when unbind job is done */
> +		struct dma_fence_cb destroy_cb;
> +		/** @destroy_work: worker to destroy this BO */
> +		struct work_struct destroy_work;
> +	};
>  
>  	/** @userptr: user pointer state */
>  	struct {
> -- 
> 2.34.1
> 
