Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB43EC77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 23:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F5110E788;
	Thu, 25 May 2023 23:35:38 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9496610E788
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 23:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685057737; x=1716593737;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Jvlz0Z2gOtyVcJ5VHXp5j8oploIS9+bikktwJoXG6/Q=;
 b=hbOvcs733Cq+/PKkJ1FeWgwfk4BcE6R1R/3ruYy+GqtqXlgUGv4ncmwC
 njbqzueuraTwYLEoIJVrdao8VVo7sDpaSOx1pBsSztPVM/eNH8zesQrvh
 i5h7r8N/QKlGDDhbj+QU7r5urUoGzeeSINh0NduGD2RvwfdAA0MgpPm8h
 OEVxPiOU6WC4uqBbHejMT+WYpHXiURSl8fOOvGlZ1e32FoSUYF3tXSunu
 QsunykiINcBcFvdsQL5cISYFhQWMfC9FGvGYhsEHYw29NgBnEM36DyN4O
 OmSqPmoduX9r0jAD7YSIupOlTrDyt0MaVZeZOn1AyVv13iI8MGqxrGTCP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="440412196"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="440412196"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="682522812"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="682522812"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 25 May 2023 16:35:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:35:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 16:35:36 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 16:35:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2jdhhfty//h1mHR/Wc2zon+S/K6hnSVcFYJ/T67lKrhDQCwheTuaWlO74DzC7CyZ0fhgHz0ZCe4y60lUVEK8Y0RSoOnrjJNe83xwx/VDlXwYQDfv5qIiBwHNm6rv6UMxcuXgpy7lkz5m0P8LC5ekVNxLLEvRhQF7mmnSZMcR0huSvVCAco2CVEcCMjJ2WkdIg/T09cElbxYmTLCkuadYu3XnpDJEUakPUEZdEh/LTphIGi+TAu8QP38wFSJdmGmvk42bbIT2brZptiJi6m5CVGcXZHSqiFKqOUF5CYhdHwkI0QjiY4AcQh2SV5Hp0tjdQXjfkBPvoMpWMv54Xs6XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKPh0vb7gtPfhTw2kjw8vnX+qAyLEFHd9AnH3n2ZmnY=;
 b=WtaKnxfFbVTsfsdGpp7Y98je1Ro9e7kLFQDiGtWQcEoUUkD9T9cvElN2JZXwwrYJLC+p+a/pJIVabW6ph6WymHQux1iiaELSvd4+DZNscar6K49tkLW70xNtsRV6m9hqK40cWXmgMwZP7c1MlK2S40O0wYF9FLniwxYwTYNe4YMYSUAWAcgirekHwP1CWD8J0qCTqpNPjp6xx6x0J095G/B4YDfe7zUZjioICMRiQfePnZiLKM/J5y0GS84s+2nh4EWpfXOTZZpUBDn85jZZF5fgst19urwAvUWFR+EJfmoQ8OCNveZVHe5OeHb84IIMYB22gZO1tR2aK9bHoDCOdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB5994.namprd11.prod.outlook.com (2603:10b6:8:5d::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15; Thu, 25 May 2023 23:35:33 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 23:35:33 +0000
Date: Thu, 25 May 2023 16:35:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230525233530.GI10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-22-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230525213407.3907094-22-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR16CA0028.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::41) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4e9f73-9b53-404f-bf91-08db5d78bbe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qVLcl7T3XgaQwkxcVgcDjNlVeqeNL0xHYfNhCCPKfTxBJxLasmRgedjb17ksLdYP0O08VVfxpjLlZ+eTUAzUOBkHNfFZYjy3tWm2jIr57M4MGu6P/JOAIxxwA9srYA3GBjd3+PZHK3BZZ9Vdpgn120VNprKtr66lLl2uIByiVMRqEesItocK6BJXguHmvIk7/aJ8O7lrtZJg+tqFwusUODCAVvbHppNAz8XqUKRhaZDbxenLnQrpP2paUnK+jLimgQlkJXleOJl61SFqcI4hc99Z/FkH0yJlxW0+bXAOEBrUYeaZPhgcKwC3vtNrACH53hdWjmQp9nOiQH1imIMJMmgo2grT8vBONEobf21dA8/mCdJCp0rBAQCSaGnWwyXOOw0T0AUlEmZfP8g3rHd1vaswNN/dHUX4SLE29epR4wKX84pwg/llFKjRfCCnqgq6Xw/TaQS2EvXUOkat6XxD4/w1XoBaAEBMyGP34RSvUSVZeTYrGCMM/Sgi8WlpsPMjYNf8FNcVSfo3yY9nSqOf2rGj9IghggUwKx58prCa4aC0XmbprQqR+Z9wbQcs4wxx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199021)(6862004)(33656002)(478600001)(83380400001)(86362001)(38100700002)(82960400001)(6506007)(1076003)(6512007)(26005)(186003)(41300700001)(8936002)(2906002)(6486002)(316002)(8676002)(5660300002)(6636002)(66946007)(4326008)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MLfFn23YH4HAVIo1NOLC8lwboxuT+w9zW6q4CLmX+SyoCnwWD1B0MRxuL+NL?=
 =?us-ascii?Q?JJbELegPeEaKNsv4uW6W4FC7kz58t0y34J+T3itRLsDbhDjx1s9uUtYT1hvj?=
 =?us-ascii?Q?G6XeljIHA74bbw8RPUGtz5rmxXs3HASG+OndFw3PKzd/LVyDJcdKKfoRk3jz?=
 =?us-ascii?Q?mr3BWByn2ffCci2bNeeZx39XUUZbWWBJer4Wtuds94ObmFrJAMXThghSrTqp?=
 =?us-ascii?Q?G5pK/Cy975MtTyEZ1Z55WbBjkVwk+ks3p7QUZ/z0BZV1tJWIclPrsieaW/b+?=
 =?us-ascii?Q?SYLjmO1OG7/a+upIDaTJJubQA5zWZv768WcW3cp4jaxo9R7VuhH8PpvC7VR0?=
 =?us-ascii?Q?g5C1SfYs8vgL2IglepLSPkoBHi6LaldqmqzDNxRbkFMLpHnDsCaldMpKSTcg?=
 =?us-ascii?Q?aHdE9u0mVXGc2jQThEEwqAqk6EgjlVGZTtqV7I3Dcpl6R8b93sZduut+a7Zq?=
 =?us-ascii?Q?SAOP8DueimQbXX8aHp3XaAPCjEDw/CP89wv61VHtHcdYJLluU4cGoHTzsZvm?=
 =?us-ascii?Q?6RHLGPHWyTJfbo9I80bsjiAt+ZkH0+Wdh8GO1s2CXzJhVFFjJWLjfj6m99h+?=
 =?us-ascii?Q?UgTd3GXYyn4pRgWiIOErHLLh77wYro2IPa9jt8cNh6w7QDZNeoUtVZ2xf0Z3?=
 =?us-ascii?Q?VzLihpxiRUwqO8uO0iJBjncHfOUylr1u7pZ7FZMPTwOpkUYkhZwvRNRKNCQF?=
 =?us-ascii?Q?aIZpmsu7zgzQJ+C9w0ASpo0G281MFeOybvHFL9k3YGVsvm/j//oaA526Wejq?=
 =?us-ascii?Q?bvpYbcmKzArSvjLiOPqtx33jc1Z9IGwpZavq77GHWU0ZP0H89ARKrxJvJ8He?=
 =?us-ascii?Q?ijUKLI4h6Zimh9QyPfJpn9R5frrAt4wUi5oFzqHG4l05xJuAztpgywKeaexg?=
 =?us-ascii?Q?K9MiHSNMFqqPxFSTljY22SRdl1IEPv3RQWJjsnf4KtNQbdXrL+IaoDZCZ6z2?=
 =?us-ascii?Q?8y4F//Bvn+OC+CUJyD16TuTWvgfKHi3HpbwWs5MpliQOtQ/1ORtYJijdbwNe?=
 =?us-ascii?Q?SCghCpp6ItrPY0bKnqtNkwPhOljrWK41SNF4BNGDmOhhGex5m+qgbuVGQxJC?=
 =?us-ascii?Q?zrKDWbz+ItzzrDf5QrX1DB2H+PUcTQVB8e9rqrmX03XbZbN8EGfx0LL06EcT?=
 =?us-ascii?Q?KthVYGYMHj3xjsh6ATSKoJSzL0EJosQtalG/UdueyhS5Ppb4feYlGJhruVlZ?=
 =?us-ascii?Q?OUkifaIPjLqOlnUSQyiMNL8VkVWHjwqalqR9K2Vemjg8hGZWwuflRtxUkn85?=
 =?us-ascii?Q?jE73kWPNWkvC3ES9bn5es/xoGrH5yF+/7ADWcW7yrrLoRVfSvpEC3tLBiBCe?=
 =?us-ascii?Q?YiBjRP9D8h1Ree/vBMhouBoJDadmbwPsvjSfHumu6DaxCH+8cZnK8pXh0nDh?=
 =?us-ascii?Q?zIToQnuuOSXzw50KNyFRYR5YnPwD1Qiy9SiEcHRF6lAaI4DgTIzyNLr1GQKh?=
 =?us-ascii?Q?lcQbyiHtqKLoXBFJAHq+ulNdL3HnHoKqWM7nECIbM6CLG6uGqVCgq2Zce9jE?=
 =?us-ascii?Q?uiHifQncwczs15tMvK/m7+syQ21obWv8j6MWL2fyIe4i2KnK3lf9Hnw8Tw9B?=
 =?us-ascii?Q?wcLkeXx2lgOM3ySaoDDFCFXSmptlPWsBAehRs0dytdOKuLDDSVu+LGhVlbmm?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4e9f73-9b53-404f-bf91-08db5d78bbe4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 23:35:33.4569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iht4xJ9D6Rg/IhgUzqDKvudSzIbZLzjhGlm8zTEGGsUISOXJLNWcnFVgNQm7BZDhFj8InLkTkJJnZ+w3Z8DnSGFzr9/jhga7OD8pGgnrKww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5994
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 21/21] drm/xe/guc: Port Wa_14014475959 to
 xe_wa and fix it
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

On Thu, May 25, 2023 at 02:34:07PM -0700, Lucas De Marchi wrote:
> Port Wa_14014475959 to xe_wa fixing its condition. The workaround should
> only be applied on the primary GT, not on media. So just checking by
> MTL platform is not enough: checking GT is of the right type is also
> needed.
> 
> Since the GRAPHICS_STEP() does checks the GT type, we could leave the
> first check as a platform one: it'd would be easier to understand and
> not go out of sync with the graphics_ip_map[] in
> drivers/gpu/drm/xe/xe_pci.c. However it also means that new platforms
> using the same IP wouldn't match. Prefer using the IP version.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c        | 4 +---
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 3ed460d3b6ca..ecc843d91f62 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -142,9 +142,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	if (XE_WA(gt, 16011759253))
>  		flags |= GUC_WA_GAM_CREDITS;
>  
> -	/* Wa_14014475959 */
> -	if (IS_PLATFORM_STEP(xe, XE_METEORLAKE, STEP_A0, STEP_B0) ||
> -	    xe->info.platform == XE_DG2)
> +	if (XE_WA(gt, 14014475959))
>  		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
>  
>  	if (XE_WA(gt, 22011391025) || XE_WA(gt, 14012197797))
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index fc9846af460c..c58f3eb3e993 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -1,5 +1,7 @@
>  22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
>  16011759253	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)
> +14014475959	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
> +		PLATFORM(DG2)
>  22011391025	PLATFORM(DG2)
>  14012197797	PLATFORM(DG2), GRAPHICS_STEP(A0, B0)
>  16011777198	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
