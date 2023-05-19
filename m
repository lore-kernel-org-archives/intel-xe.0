Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F04C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 16:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AE510E4C8;
	Fri, 19 May 2023 16:39:52 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A3210E48F
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 16:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684514390; x=1716050390;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ScNtYxKH04tNaZQen9Ilb0jzcOBK6e3IY6UZhe5FbAA=;
 b=PwJjLyaeomey4dOUR1NGz+b+rygWWHCf/OVGhNo3AnKIkV/X0KOagk2h
 cT3I9KdPKzEK4wJ1EL1DOcUDC+oMa71UyHys9JGWGopGCh2vtNVx/t0gS
 JYFZjSVrelSVzSpavhNiLmn6VFlL5fSwl0DHRwwiKj0MGMfzFJ0pRl3cs
 Fud4MeTHqN3Nm2bkRrBu82cxqjaoTfp4Wzngc1cWPkBQxawNIWo51ATQ9
 TUP13H/FoZ9fKSDWtUsbVDecd4EJsA4gnv5YGZPKlqkaubEmRa9vJfCF2
 yOzQfYQX4gf00Xtq5gRR4SsrSKv2VmeBB5jNn+COreJ+PdpjNZU8wbj+s Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="332025942"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="332025942"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 09:39:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="1032663222"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="1032663222"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 19 May 2023 09:39:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 09:39:49 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 09:39:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 09:39:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 09:39:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiAPKrpbsPvPgslfGesjUADwhcDLRJt7/p8DVK3r8DUMEo532lHUnHkD32Vd2Kvx1YocCTEjj5z5YPd1UbAsEi/TpKWxs8WwZ57iH4yquw4301AsypmVmPgxLUm9znJJnBsUKwP2ovazzxKYkTGEALEuVaha5yla1k33j8VyRHKZ9oCc9W/kKLW1SaXrJ2uc/mXwrf2Um8Q4k5oJe3rBMwy7yjO7niPlQWWVt0lsMnITKzPCyHGpzLselXqfeEyycxtyqB2NYFXhJ/qKtdrenlJmQMwyS+N9XNgvPuePWqrGH9Jl+6N6w0hQo0jzU//YALL+9MmxfEotyktMuNSWxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/51LVKNLrcTlqRqSeLPElmz/uB/EpIfS2WiygVrwW1Y=;
 b=LlI95OsSohjQvue83NtL2FOIvO5P2Q69yPGc1CLf7aabkktrJqh1OwlP+f5VDCBWEjV4QjcwFWKn46rcJg8TR7xgt/S4gH7cYf3kvFTbfuvJ4gWpzmxqGbmvEn9Yp0JdRC4cCtFnbMYGUtYXKichQVO7ZMKLEL4eVBVkjxvtIDRMcGLs4uTnAatnzpLobWveAgpMe8HgdRJpyVoR1eO2eAOlSX8p3hFoSVn5/M8EsOzxscaOHCFTOeIK2RPQ9DGJKZyvCSSTLwqbzl50bxq3U/LQ9gFrrGkVSSGS3uCo0Xs8SfQARCjbzzde7naAq4WHuKwfL7B8wxxIUx+SUwmolw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA2PR11MB4810.namprd11.prod.outlook.com (2603:10b6:806:116::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Fri, 19 May
 2023 16:39:47 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 16:39:47 +0000
Date: Fri, 19 May 2023 09:39:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20230519163944.GD10045@mdroper-desk1.amr.corp.intel.com>
References: <20230519095618.1160-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230519095618.1160-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::6) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA2PR11MB4810:EE_
X-MS-Office365-Filtering-Correlation-Id: 468dedac-2da4-435c-9758-08db5887a855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mQLYHQnhpkmYiLi0HJHNOhOM3hsFnbAYcrYcPJZHy2pMxG9v36SDg8MNPujNlPIcxiayjBVr9yskrK3496B2dp6MWg9AdF3M2nG9FqN8nZvsqtcKW3b8ujpSZpYM/pe+WgO7zgqndmTvLI9L7yOrhs85Y2J4w8/3RA4tVZQYhjt0xkS7XfFmCWFnuCFgNle4VbBj6i4oLFkZbxvJ5cGmtQctPETFOrpa5XWrrisH8kI+Gb09iUjZG4nxrdz6a64liqYE3VdX4WEOhmd7N5jNz6cnRz2yfvJX9Gh4TBxoFBxclsrePjo0LXE48GLddoptbYtCwIv6uYobomWfwYfA+dMTtca+nsxeXwSfcsvQsBiiNYO82OxfvCqHHHVI3bj1jeBAMydnsBK+I+ZTW6Zqh9WGTHYW7TH5kzySKCQ8pHw6PXs5KPM34iMLNmUK7bibL3HH9Mbrlm9UVJpFTNtBTfvUKAwx8XQ5ayPWDc7LRi0Om5QEPoJglE+Ev13jXZPakaEJ0NFesIjBUbBQIHQiw6uaKOy/veXWqZk2iWbPHx1Y6E+xdx4H6dzU4VQfIxbc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(83380400001)(186003)(6506007)(478600001)(6666004)(6486002)(1076003)(26005)(6512007)(8936002)(6862004)(5660300002)(66556008)(6636002)(82960400001)(33656002)(38100700002)(41300700001)(8676002)(66946007)(2906002)(4326008)(66476007)(316002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rQnhSvDDo3rIZuU/FpwXZb3Nan9j9AH3NMbAWM9ZthcdWpxPMSIKEcyxHkzP?=
 =?us-ascii?Q?OAcgQOhtKaiUHWEQ5JZGk/nAhKCqbCtF7HknipdxvZGzvIf2REwtIZ+kjIWm?=
 =?us-ascii?Q?ZfDEIcXj4P04LvW9UUEhNkKdsiFL9bGXhG4SMK2rBudj56qB5UP+PzhzawtK?=
 =?us-ascii?Q?ODhsV2apqf4WsLIeZpljxPzoMQ1sdteODqcIQNBb6KZKs6iggntWPdSWIRL7?=
 =?us-ascii?Q?M01Ehzd/Ws9KYnmsxerOXl0fHXiPeVHe66WTo+TEFkVkD4BFK/Z2D0uTNZ00?=
 =?us-ascii?Q?5X4qbvXwcpAhHB6MTB6G8GBaHgxsr+8/B3s1D8QsF9cCaqgBTUaIoGR4WYnU?=
 =?us-ascii?Q?ofc2lG9rmMAsdHqZMpofKq8GfryS2MBG+veMtemxHhIrg9ZWL/EEOIlKgnB9?=
 =?us-ascii?Q?wCzvPB4GKeN+rZ3azk2dWon/J/ADts8hwW1WJO1F49a8cmAqYkNur9hcAu6S?=
 =?us-ascii?Q?A6k8H6ydKsoMocLcNfH4qD4bzf2JZGhGHrkPFoP9XtTAhr5kZoFDgXK/7r/3?=
 =?us-ascii?Q?3I7P0HCeeYCGBH9Qf6yR4//Xv2T3Gueb7zvWfVydpuZu73uuW0IIG6d50q6V?=
 =?us-ascii?Q?P2Rd2RrQ9MK+esOn8IfGs/1mtCELLEB1wZGfr5P0kPKGXoOg2fdYAGC1T4Xj?=
 =?us-ascii?Q?c8irpAziN9Iyh0CF9L1TuPyfIeNs1pflS/VIz5RGj6bu9a2vpA8tlxQg2aRE?=
 =?us-ascii?Q?l2J6W5CRoJPAiHXLnN/CYMaV0vox7ildDixll7EgVIeJ0my6bHN+t2p0HS7v?=
 =?us-ascii?Q?S3CTg2GY1uEG+xrDpsy/0dDWhi49egkBW+pLnc5Q68zEflsBkbpuguDgNLSX?=
 =?us-ascii?Q?PPNyHPPPq9LflQkzpO44GG1ZJKcYfWFQN+aw1GZqi/XhgwcVRXSdfgh+xSTm?=
 =?us-ascii?Q?MLM7w6HWk9TIJXRdEE7ly/GsQLfVteFqXKwQp+O4UWvuWMg0v9YpTcows5vV?=
 =?us-ascii?Q?bCn6a+gqXXFIdhI88dPsVRi1A6OrqV1Xj+exHj1lwH/pl5p8XkBOWX/wywaK?=
 =?us-ascii?Q?gov4zh7et7ys9NQ9BCmh372B4I56uoW0kYlmPF9R0iUEg+XoF3vzf4VB2SA8?=
 =?us-ascii?Q?N4VxM/5mduZ+P+OqtmWC/lSujAJlE6TwGZPiFhYwYpMNvw7WAz3LP3bCMhmd?=
 =?us-ascii?Q?b7j8fmo9qtfiQh3++9ayR4C9oLuXXKiBI0fmjmNwTIjW9ItSpzryntGKiKqi?=
 =?us-ascii?Q?sxIU2tFWfUQgqhPU/3UDTiJnjBp5LpFEl+t4CJ5mlMF+OTp4+a2Mcgcucv9o?=
 =?us-ascii?Q?dWggR9b4zZO1Lajkv4Sm/3IQt4KI1IqcVHsICjwG9upt9qCYmlGWvEim2k0L?=
 =?us-ascii?Q?sDCeuzmTlDkE7uA5IVwl/gbnJxyAFqxIc2CWcGX6AHWAOIWwpc9X2rtBTaJO?=
 =?us-ascii?Q?a0CoDDgGflmm8lT9JiaCVq7lMRYcwmvI60RAB3dG7eLCq+yJRVoa/xT9cIbW?=
 =?us-ascii?Q?cv94Cbzo09HW5ZCERUwvtB6P3fpjH95WHAM52ZY2912kkj662T7y9RbbJPnp?=
 =?us-ascii?Q?xpQtR0oRmbER8Kf1igm9bJgzt+lw/4qvTieD84MqlH7jjpnYd0hf6814G5Zt?=
 =?us-ascii?Q?lOEG6gUlujfZvqQGseMEd9e2IqdHBQu1SVlpzPSx7pCEjnMPITDGInfNiuyP?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 468dedac-2da4-435c-9758-08db5887a855
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 16:39:47.4722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPAg5rqd38RTRGNx7ltt3hdaPnpCsCxBS4BagFCusit7yqEMg4CQUPwPRg+8zJyoBfI/HYwTiHdkqnFU8gFPMtzsHN4y74Rogf3PHhK5VSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4810
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Change GuC interrupt data
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

On Fri, May 19, 2023 at 11:56:18AM +0200, Michal Wajdeczko wrote:
> Both GUC_HOST_INTERRUPT and MED_GUC_HOST_INTERRUPT can pass
> additional payload data to the GuC but this capability is not
> used by the firmware yet.
> 
> Stop using value mandated by legacy GuC interrupt register and
> use default notify value (zero) instead.
> 
> Bspec: 49813, 63363
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Looks like GUC_SEND_TRIGGER was only relevant to the old
HOST2GUC_INT_REG register (0xc4c8) that was used through gen9.  Should
we remove the #define for that bit from the header as well?

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index eb4af4c71124..effd8b1ff59d 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -600,8 +600,14 @@ int xe_guc_suspend(struct xe_guc *guc)
>  void xe_guc_notify(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> +	const u32 default_notify_data = 0;
>  
> -	xe_mmio_write32(gt, guc->notify_reg, GUC_SEND_TRIGGER);
> +	/*
> +	 * Both GUC_HOST_INTERRUPT and MED_GUC_HOST_INTERRUPT can pass
> +	 * additional payload data to the GuC but this capability is not
> +	 * used by the firmware yet. Use default value in the meantime.
> +	 */
> +	xe_mmio_write32(gt, guc->notify_reg, default_notify_data);
>  }
>  
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
