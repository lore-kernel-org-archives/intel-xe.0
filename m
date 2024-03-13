Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4631C54791
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 19:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561E210F284;
	Wed, 13 Mar 2024 19:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLE5Z0ib";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F2110F284
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 19:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710359793; x=1741895793;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FprslsoeQvILbqJP82nCpKOPrIQ2XKj4EiZZCvsA3PE=;
 b=LLE5Z0ibs3AhSyHtCuTkkTYglIj2lG9qPNDgoegOlFOaVRe3HMNpX3+R
 XK7Up6JBIy4DgDHo93ZiF/qyfu4cmLuIQq/SZru9AQ0llsFPWVqB1vR/N
 +vRLlDIzDEYexJKbQcWtmJU9pr2Zfm4aImX8xuMKTKsw71XKmQepST2KE
 S0UuUkAAnCsh4way+Ici7ZfBpskFc0gZULNDJLIWMuGdOE0S/Ib1jNLIo
 n1f1KjtSjk08PSKCZQEvvFZ0FDvhoJ89zEdSBggHvawb5TSVZhC4BMrMq
 JQIP89VpG0qQc2pJMXjVVe/j5hzAd9plcigZichf5qLpUwRN6hXkIGuV/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5018336"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5018336"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 12:56:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="12494664"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 12:56:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 12:56:32 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 12:56:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 12:56:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 12:56:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEOht3CfHqf9RuWoh6PS+BWD0L8eiWU7+sA7NA4ThyePt/xiB7NeUo7/p0bdCfOVyAc6BbTWsorAgOQ+7YnbV3osuNvEM+ykbnQZBcRsH1vPsCIQngc6qJ1AcCNW/eLkWNwGt9m0wEibBQ4LhI04ir63i66EA5bPj4qZdt7fl7Q5tlMwrDhHfIvNKM2D1/YpbXsDP+KnjtwpR7XPiWuqfPPW9QD0FV5CkVYrL4PUDc4yiNZsHUyE/d2X4fpsFYrVc4vHdj/a5SihC2S2uhmzA0sf646KVpZYBUCN9IGA10Bh5uaF/B+UuwTNmZGYsQPnl7sGvzDySDMspzPeTguMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnJUhy1fH+SmuGzOt2TaYlfGX5IR9TR3ml+yjRLMEHQ=;
 b=V5bDVXuxGQCavspibhnFeBnRr08UF4Dyx8OTeTx+52S2izXlzIOeG+7TB1aYXVdXCL5DAdxe1uMtXcO9LU67dnl9dtG7mE3vzdwgVR500gxS55JYoYkd+jYmfjhyCtMxmr/WJQilduskx1dM8CdM3mBFwBvx+9L+KEriYKC9onh5TSDDzy2gm7y0WSuhRxTU+AkMuc5nG2CCcGGFzsrVAjMh6tw73Bbpi3e/SRNiTkCXvCQMfdgbaJLic4ZVgo40ArI05M0QoPXizHipn4PvjsBlaxWVCi0xqCcdmJYf9cvnLYCTvqapNKchmrm6hps1jSiG7oWRbQ5r2rTWpdHCcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5254.namprd11.prod.outlook.com (2603:10b6:208:313::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 19:56:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 19:56:29 +0000
Date: Wed, 13 Mar 2024 15:56:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Use xe_assert in xe_device_assert_mem_access
Message-ID: <ZfIE6SVMYz5B7x1X@intel.com>
References: <20240313184430.999397-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240313184430.999397-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:a03:331::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5254:EE_
X-MS-Office365-Filtering-Correlation-Id: ab967697-7458-45cd-8872-08dc4397ac97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oi48/QPju5aoCTlj9YVu92NdvjU/K9BTWR+lsgecxQ6JVt+a6fr+/wpRa7SSlFiDQ3yIT+2quIcYiJCS0sL0LRHLIUlLARTSbc88rmDdzu7Ly9/5fC1SFXR/L314rG5zmyjsuDuqPQ5Fq+bvC/6yEBQfUEEZDc7SGh+3A/z8YleVhf83OCnfPlRpZ1pu2qIpABv7baAwyAWr8MNyqqNKtsEyTdMu2OrrGx7+tkbgI/Io2pC2kC5/VTr8leJr7d6gZjSiqtP5dUL1gGFMBZTp/7Qg6tP0WuO7P4FTWoa+we7V59Ntjb7GIyTtwcEyP/Fyt86Oq/aGMUyg4qqGMWgfO2HFnDXrOMQKybLqna6xMTw+/FVt0N3GpJahSx5nibSZJNa4uUxMVTV3FRbGAnIRU5MefQSIY9J+vMnmkVhnW1OFlgnvPxvQ1IiFzc6M8THh7BMvMZTKzQA5Ssk7anVscukb+iiqoBDBI9IJrNrcP5nJEvt9MbXhRH7jTr1kAH4bxIXUxGspuuGKOkujOTFFCv/lHl1qXSKqk32R+JKLc1Zlf9RupDKILQ6qihHuc/KREAe04ydynrmE5sP0OrANLDswnpQjeSOy49mEZlvZD11georEgwRVapEm1HdMqJEMroo3ovbDhtqdEHywjbv59xf/aFJRG/i9qYxaG/5DNTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9gOoPkkd1f8Nqts7nRKlWWR6YF4TQ632VzL7jq6nYo0RwN02Z1GSO8qVDpU3?=
 =?us-ascii?Q?Qj77WxlRgpcmd9WvR+6ePCepz6bQtOqFhtLoWW+J4frNYBvlpP2AwOtKLEWf?=
 =?us-ascii?Q?3K23Hu666Pt85A0h2yg5U1GbWsffSqoVTFRVFUTznha3QTAFITe9UtTOx/Pe?=
 =?us-ascii?Q?zUX/NDo7u9YGcAb4LrXOCj2Xcdy54ndRkmwq35Wfz1xzWN6H3FRTxbouCJIF?=
 =?us-ascii?Q?EYw1ExbLsmhw97or6nvaEMe6qopUG+dK1WnhkE8WJX7x4RVz5tBwGlg+pgTF?=
 =?us-ascii?Q?tctCV+OKcddfJMYRSaOUAbewvgLXUT89SQtRNpt1E7zYCPclJ1002etb25Ai?=
 =?us-ascii?Q?qSPFJ5mlUwgLGqd8/bUN15DJoTXt5WsGq9N5F2QgDeCXE8e1CUClBCHfNDXk?=
 =?us-ascii?Q?dOjkfciTOrdKD4y5RqbYT4VwxeCNHMpDVnfd2qow+olmzAljP9ms+0JV3m0s?=
 =?us-ascii?Q?Rr2lRPXPSGzz5P+62yxuImYVFJ1ZiElvptmAhe3k1LOsjmGdpwcSkloU2+tx?=
 =?us-ascii?Q?x7U6fLwY4RoL1UxxcHj6mybijWFUjORlvV12bevsPRuD0nF/n6S3c5nazXsj?=
 =?us-ascii?Q?9sExol+/ZNn/3PIcUfuZHrolZH7KtewiXeNh/6NyCqt7Qze9KVjzgNXLhrrb?=
 =?us-ascii?Q?hTeRzMmJV9B1VZWNbw1wKlT93QLwUI0RMzZ5emF+Wd+y8ljLDPoO1RcjGcLg?=
 =?us-ascii?Q?HzuJjhoEBD3Per45LPPEocHJBhunMR+YjZOUQjR0hfY0I1NGlhygMAdXc11j?=
 =?us-ascii?Q?izSrdmMkAm2B85CNJQFzyaXSKHdk+VrpKBmVsMaV568Kpd/Ylrw7B3+BQjO0?=
 =?us-ascii?Q?JJuBba2MKtfcCm9idfRGjthYc27KQuMfGmeVuHDsniYBGuCapOU3Y68MBv7v?=
 =?us-ascii?Q?uKqlHJvumpjUQUaLYVBRE0xfxyT8WUjsw7MwxANorVeGH58l9144p0ujzZIw?=
 =?us-ascii?Q?kRi7QbfpmatKdrB7VsBp83aOCkxArdMwFCLXWaVEA+jWlosH+LPpSE1rkD+l?=
 =?us-ascii?Q?nH7j9Ht/1JNWfIRRLTaN8p/5Od2FTMWjeYh9jAuQ/hxvzH0nSsUqOwdYXcQj?=
 =?us-ascii?Q?jMhdJ9TokMIaGxLMKYttQF+9RCJYjLZ5UIacKOjBsekVoX9CjYTf/bw6j7Gz?=
 =?us-ascii?Q?BRgksAPj/KMMGn5ZRv8vnpPiMfCyUD0rWoioyILcIVym8vRFbz+1uVKdXBYb?=
 =?us-ascii?Q?Ggsp7FOiMh/ThhvHjuuy03dKMzBZgkNH+BDRApth/Z27Qo8dER89+eBxSVlp?=
 =?us-ascii?Q?5O/I7oGIjcHRXng8iOwx3h1pkV3vCG8aoZLTS/RUm34VArY5Finxfgy+ycY5?=
 =?us-ascii?Q?Fa6VP0TjpP7agKTXa7AKywHT1AWUNIsAUvRAwuN6MX8oe38vs+qY8kB0Twxu?=
 =?us-ascii?Q?dZNoiA6Vr5oImsstetZTY0HUz2SlzIYcJOxL5+DBbt6OZDTJ9Ori91ynDkOk?=
 =?us-ascii?Q?zmcmJ7ZeGOcalIIzg66nqb7u+jXoBq3IxhjZ5QjmT1CFXMY7p4TWWTrbGAJ8?=
 =?us-ascii?Q?t9Nx8nLvHMNm/ZC720Mm7AIGczTC6VSqHW+IYJUn4zQaHqlPUPscCG+T8m14?=
 =?us-ascii?Q?Cw8J0zwC/WsWy7jSm2iWLqU6In9zT1B0DRZL3elo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab967697-7458-45cd-8872-08dc4397ac97
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 19:56:29.6454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQTkGykeSy/Eh1iyiroVZXSn8PFEa0CjmecXbvajMLtg9QtJCqgRzzgx1TGSL+7ctpw3+4qu7f1Z5UfyBUErEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5254
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

On Wed, Mar 13, 2024 at 11:44:30AM -0700, Matthew Brost wrote:
> The implementation of xe_device_assert_mem_access has a non-zero cost.
> Use xe_assert rather than XE_WARN_ON so it will compile out in non-debug
> kernel builds (Kconfig CONFIG_DRM_XE_DEBUG=n).
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 919ad88f0495..b0bfe75eb59f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -666,7 +666,7 @@ bool xe_device_mem_access_ongoing(struct xe_device *xe)
>   */
>  void xe_device_assert_mem_access(struct xe_device *xe)
>  {
> -	XE_WARN_ON(xe_pm_runtime_suspended(xe));
> +	xe_assert(xe, !xe_pm_runtime_suspended(xe));
>  }
>  
>  bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
> -- 
> 2.34.1
> 
