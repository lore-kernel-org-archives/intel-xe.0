Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52183C7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 23:25:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE4610E787;
	Thu, 25 May 2023 23:25:19 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E5510E787
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 23:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685057117; x=1716593117;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6Ilj/htanGRYLScVjO6t15LRLXKOcxRE/ga4poTvTQY=;
 b=A2H2qC7q3ltGg0/FAz3H/uqZ/uTox6tApsvDVRq287V7kV7ZoCbDDUaG
 +Ol1G/A+4VKV9gYr7rszoakzROafg5yDJ+INwKzdA2WqBNSxeSLENsLDl
 KDwEKNfWCLE+m/vyyvN/l62f1s1tItSY7xpwMyaeimdl0IiayEtN1PcC8
 FSjcfFz508oLCjOMz4shGnOikFQkyjdvSiz8i3DPRXEVOBPMVLaGk4+8r
 LD2R/Xj6+VopJnw5MUI3l8zWfVXlBy4URXgnNxjowKMDXsil7cMzuGt5F
 uIqy4NTFgqQiMkXlzRWwElvXAa+NczQ1er0yJ5UYDPCQc8CGQ51gqp/bN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="333686496"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="333686496"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:25:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="794871341"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="794871341"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 25 May 2023 16:25:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:25:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 16:25:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 16:25:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkFK2y8gIzOunMha7FfvtvGiIDoXmabTi2YOVPoPm+3tpyJn0dQ9ZAs8MSJyOfbKW7cVDY9POctOrsGbY5V+Py2kTjz1AiA2cvEL74nMSvLh9RWVnIoDreAO16bRRkGWpnmSWoP2PHwNDJf0feVVH2f+UWHita/fsI5HwCSxajcjXdOaFmdSkiWDTkRAwVzlVG1bE+NvFXhBNyVmQGZAz7cRoaSloZUXkZ/MiqdRzoMdUd3MKNhGbUI/3iEHhBV6IpfJubeNB6qJE/USdC4QVhmTHBhqJnjYSb2sG0Y49fEZi1DWEuoa0M5H5ys8fGaAqWNOL84WgWHcxDn7tSCvvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=He3iI9U0P7vWVrR2+dh+PtJpsgph3JylBSl0UDBIqnI=;
 b=g6HPTvfht7oih36YgB2e0AmETOJx49ybkHR1gvKvlcsuj+cbArkcf8SmdhR0DSlxz0sP/ILV+o6Ro76ITIOUyuuPajhXRVBBTkoMqy7XB91wuWYzN2AUL9naXRdvYPok/ut/1O1RDCDe8xImlH4yiOF1f1NDRfFZeTaIHRjK14f5yQiTBDEt9HtUwQxMt9Kt2SB2BoScbB7KMo5j7Y/jD5T5FAU3U7pJXtlxEhNqRANxCwVcw2sVTQGh8r6JVA7/vz1aE839D52risMeKSyg1Hft0v2mYE44K4BwwKHK9TlwWmDW8KNp63bXOnsHMn2LI6jOs8iAtdgBQTBosq+xMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 23:25:14 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 23:25:14 +0000
Date: Thu, 25 May 2023 16:25:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230525232510.GE10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-18-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230525213407.3907094-18-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0223.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::18) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: bca291a0-c5c2-4e81-1e42-08db5d774a96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Om4jjb4h3cw8G0GEu8HTJSSsx/c+G6QC8Zb760pZ9QCwVbeTS8r763TqTs0E2fn6dTn5RkP1QlHne53Jgp38tnQUvOrf7CLwDl0ocaeIgY8rKedf9Dqhm2GfEdCvSPvJ5+SA9j5aXzfD1XY8rNHzAKrhiMX4HJuCHkfz0Nlu91ZlZhd15fwBrYID/5zyNzfFIgS0OzYDb/GTVof/10Fm1lNo9q3F6fMpmc0igF1yDyK4iDQDEcR+ZNsDp7+frEOuWHb7jBs0bP7x5sOV25QnYCx+httawlTuhdpJYph9YNFavrP96cSFLygfIf6plaPgc0gIok54ZLnrCanJN7EsxwyTkPuWsSIOvxjTuCTfaz2svza/xb4eGjalFyTL1YznLYnBsKRs1N/f/Fjp7QAz4vQ09iVphqCDAYlzpSU9l6JBR/sPVw9Nbln2dwlAvD/cUl5/87VcSP9MN/P1YNIULOJD7hc2S0ofaemIRkmkJaCvMjR1aXgDAlLrnf9gF0BjCbTGkGIgtCKrFDor6DBFZWOkEk+xe7ZFqoDtyEypLZzYa9iXXe7+PkS8OA9JpWJL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199021)(82960400001)(33656002)(186003)(6512007)(26005)(1076003)(38100700002)(6506007)(2906002)(316002)(6666004)(41300700001)(6486002)(478600001)(86362001)(66946007)(6636002)(66556008)(4326008)(66476007)(6862004)(8676002)(5660300002)(83380400001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D14aWCEJgHx+FjsvSQe20qzcAGgX+C1i++bePT1WNXpT/GiEyTo3uAid0Sc9?=
 =?us-ascii?Q?wTLeHTwHRphgZ7rSoueRHDYvMvUaZxorGzG6B9qhxy/FJIq3Ypbea6er7W2I?=
 =?us-ascii?Q?1oPFD73R79cetMt3Vbg5f70OIZdm17gMgfjQ/NUhGOwuzZjOUoe5vD0w79KA?=
 =?us-ascii?Q?Ik4MAq1G6fetaVIBCggWonXn9lWqq/ycerBAc0mLG1tZAzgSf9s0Gtno4lel?=
 =?us-ascii?Q?ZGJOSvdZwQ9Rt5cUrVzJjgL4wqflGMSVBbk/eWPTn2LZV6kYObN489lrMilr?=
 =?us-ascii?Q?eo5MrfJYFqQTbBeimdPk5maNqI6MyvrZDNM2uZu9qPVj19YMn8x3kEqPEGrB?=
 =?us-ascii?Q?tx4Ct234FuSZHuUfDTi5vgBAw0wG85vjz0pZDI3bERY3a9wxXf53Xeb0VSTL?=
 =?us-ascii?Q?GTSZNNcEhHHJ7aymqdyg0zJ/bAa3NTq9QaAuqhwXihUcdQrI4c6FP3pg+0E6?=
 =?us-ascii?Q?HjTg49W8UvPMCrr73yycx4AWmsk3/gWdxlQDHoYSTrAUoIhxNDV+T9bzrhQC?=
 =?us-ascii?Q?QjlhID9a8ShzdHnjnTW1kSygB4Avkb6fGrB3SeP01I5M7jxAr405qwEbC5yF?=
 =?us-ascii?Q?udP3q//YF6WzESx+saURHuq9nRHuuicFx8fbc1mZJJCGtiy7/axrte0b+Z1R?=
 =?us-ascii?Q?MijM6PyASj3UeujFoTkbFZsXm7nbPWqfjhZArb9UyP/fpSPKc5RYXCg8vMFV?=
 =?us-ascii?Q?VmqLICeL9ciIiw+qEgqhR09ACk3bxZhomlwA9e1BfGAYBbLP20wHrQU28Cej?=
 =?us-ascii?Q?Pvxb1HCPLPqWRyW7meOIFbtkM337rtWfB4lKHiz2TRyf2WCnfZlAUlO9qkwN?=
 =?us-ascii?Q?OuEbYzc7EeRHm9WKv0lB7Q8SZpJ+jVMDaqhsZFq3Fb4SFPZlcVlzJAVAU3rl?=
 =?us-ascii?Q?8W2TVH7EEZoRai/5LRIUaYY4JJEQ/L982dSE+FzKI8Q26QtCMQak1cvNcl8v?=
 =?us-ascii?Q?UMALb0Ntc4NSh4Haoykrl6Qv5XQh68BV/65c3m3FxIdURDLsXdbZT8y5ZZ+S?=
 =?us-ascii?Q?fYEkQCn9AwS6farc+Je2JfkGhIsMAdh3Iv0Aez6xm14aXqicW9fRQa1DboGP?=
 =?us-ascii?Q?G/MVbNboxM+jGT4t9HdCTf2p8VNlsTd1Dcls1IyNGbQgyU/wsQWxmml7wyNF?=
 =?us-ascii?Q?LkMz5SszGCItBcpliciHYnoe7VSPBp/j1jCNoy/PMg05nnEP3eKZsvrn+C8Z?=
 =?us-ascii?Q?cwHOKZyfyzVxqAWy8zJ+7xeYucmVF77/5dm30KYbfWoNl0TE4sOQaFQDokhe?=
 =?us-ascii?Q?lYt4NwrBquiuUMzxaZoHWjrdkQaOQ/MZ7GShLXlsTdx+fnYpJ4b40r9FCWBX?=
 =?us-ascii?Q?fIJMV2F54ufjfBn2j+HAFaE7x1nXvsSR2jr6oAwg7eJDNrhMQk6KprRad2ma?=
 =?us-ascii?Q?jF433Z2GdMn8Z3il4ty43xxgKqqXRYN1mvcoVgRWUGsJXcKfS2Md1RwrLO4Q?=
 =?us-ascii?Q?xSBXipul8SaFxZBmn+eDP/DIIsXHEoELiTjUX/ZsnUUv1ydX/lgo8sgNU+QK?=
 =?us-ascii?Q?49bs4AJJPRN2pFL/iJ0wsTl5x5b+Vd4DVpcb+Ic8gq7wHc6kBwiyZ9V+nbVi?=
 =?us-ascii?Q?kLx6Py4bvrz4o9gLpvyn6OXaVFBl28o8JMYXelYzkt3c/WZkFxjK4YHPckqy?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bca291a0-c5c2-4e81-1e42-08db5d774a96
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 23:25:13.9619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIZXDIRp5aGLMvDVqlebhO28/NBNIr5xhdKmhOWLpKnO3HtEMERPQBF9exP69NT/WAUEwrDoAA+g/SNYQCiW74twqJxW3L+VlrS9+CR91EY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 17/21] drm/xe/guc: Port
 Wa_22012727170/Wa_22012727685 to xe_wa
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

On Thu, May 25, 2023 at 02:34:03PM -0700, Lucas De Marchi wrote:
> Wa_22012727170 and Wa_22012727685 apply to DG2 using the same action and
> conditions. Add both to the oob rules so they are both reported as
> active.
> 
> Do not Wa_22012727170 to PVC and MTL since only early A* steppings are
> affected.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c        | 8 +-------
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++++
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 5eccc4b67381..1291f71348db 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -161,13 +161,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	if (XE_WA(gt, 16011777198))
>  		flags |= GUC_WA_RCS_RESET_BEFORE_RC6;
>  
> -	/*
> -	 * Wa_22012727170
> -	 * Wa_22012727685
> -	 */
> -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
> -	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
> -				STEP_FOREVER))
> +	if (XE_WA(gt, 22012727170) || XE_WA(gt, 22012727685))
>  		flags |= GUC_WA_CONTEXT_ISOLATION;
>  
>  	/* Wa_16015675438, Wa_18020744125 */
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 3d4304b7111e..fecf9dd431c5 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -4,3 +4,7 @@
>  14012197797	PLATFORM(DG2), GRAPHICS_STEP(A0, B0)
>  16011777198	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
>  		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)
> +22012727170	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
> +		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)
> +22012727685	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)

I don't think the G10 condition applies to 22012727685 if I'm reading
the database right.


Matt

> +		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
