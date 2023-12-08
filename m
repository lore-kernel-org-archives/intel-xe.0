Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDD6C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 05:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A4B10E9CA;
	Fri,  8 Dec 2023 05:16:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CC310E9CA
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 05:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702012569; x=1733548569;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p4IQ0C8qb3A2GK1DnHpuz0M0QDBdTmvHVNbsvl4cKMk=;
 b=R10gWo7Nzo8LKnYEysuav5gOYsOAahuBMyyDp6YRSxj5RSi8+omxDgHk
 68BYH2J3Q2b1hIcKEDh261+fugyqeDH0eamLxpDRKiDKuXWFItUC3sfaU
 IfchU8BAY0ZaLSpgaUv1DEZWq7d0WqUZ0JCPjyHo5mAXk3MmCZTYxoRCS
 zEtrhbaMxOb+kFwlFK31PuDD6L5AxEyKFl1jjL2Pqx6PCMFbYmV81sW/L
 x6u20Ma4Sye3/jkg4CuR3RZIxHmj9jUSEDwCN0bB0VWiy+PVjPVH8a8R+
 Gj74jtS5+ZIw8x6RuVsQ4f91weMh5bJ+p0Cb5ZVhd8WOnfm4DErNImNap w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="393227343"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="393227343"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 21:16:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="19962453"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 21:16:08 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:16:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 21:16:07 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 21:16:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXIafQVjwFNafJuoe8nbjZwwc8iQ0Or1Kaom5unBKEAzdPIGbHW+gM/mLnq48KjguR8EPGeISopISvWAFH0bk+dpRZi0KeU+eNphPCLZOaLYn4q+Wi7/+r1OoHg9jyCe8ZSZrPZgrSwrmJBVDKBMMZssSnR1eNJgWil4Z9hZvFt7uZ5XGHaYenU3Fnk9Pp7inVdRpuZUI1vsu2Y7NTzn0Chby8NPVG7ABu69vFlLHBqAZ8pLE+CLE7DTV8klAVr3S7Yhpj02WjrZxUyp/ROM483Utc7PDDnKhHq10E2RIg6uNTQx49sZH798fIsfAduF2uyWXHaNQlHBAePmPZikmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsA1whLaXt4nphFgYNWvNSTvxaevHGFyBINYjpySgEU=;
 b=Iw5lHm9WYnM1S37i65X4t8I8OdOlWZlwYe3nU2UZ4eXAAUUQ3S6GjBfRQBoKdLivk8ZsxO9/pYCXyZDa8mo094rUTQNo62MftEJtb1bUSUGFTOdNKPojFC7OjEmw4TI8gmXBOgIJm7hKThHpD5qW1BvRmC8XRG9qV/x/nNblUrFSiRVsk3cwijksxcejxG2mEYUU/bi+yGS+pGgXhSOIK7eT+uf3NOAR3zFj5zT5M7/Qbhe6zNSqaLPUf/67Jedxv5fX5D+pGRo3c8jid/nV1MpapuQwlfCANw06pAONaYNhbOllxZxaRb1eI9TTnjKUIcc7WOk6hTGXmW8RG6CLdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6957.namprd11.prod.outlook.com (2603:10b6:303:22a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Fri, 8 Dec
 2023 05:15:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 05:15:59 +0000
Date: Fri, 8 Dec 2023 00:15:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-xe] [PATCH] drm/xe: Check skip_guc_pc before disabling
 gucrc
Message-ID: <ZXKmi4oX6Tep7YM3@intel.com>
References: <20231205232047.3277223-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231205232047.3277223-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BYAPR11CA0039.namprd11.prod.outlook.com
 (2603:10b6:a03:80::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 7724d953-8e65-46d5-2cee-08dbf7acc363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yya4AuwquAqqkyiAjnOYdbFPnT6X4oYsCr/UNACKirKMJhzF4wGn/DknhVCGMb+i6JM1X4eBbRz2aIa+FRdX+tuVxCFZqIYlCTb4O/lbOsYz4gbI/vGE3EnpufSSgv5/CVDNh1KcbQ75X5t7XENO4I7vsWJ8XO/3NwSxjxEkZv4rOKQ6sds+lKukuNVtuLSUeV5pVKYvB+7+z0vsitiSiTcyUpxYyemRtTu73jc8DZKT28jh0/nHIbYF6IjHelpnHoLdU3yVz30lamJkNYQd2sQvLfylcBXbQxdqSaekoiRGik08ShnvVIy1fpV7EOUWhJHcz5+kBEUhaM50oP3F2MCfmVMGTnC1Sw2MuYDQJLgO+ZhUrR4uKlI32OoOYQRdHza1bCTeq6dKIHbDfoLSN8LgIrfEmrEVhEpOlAWCkzStyZ/cmkcjMaBhhwVu6lWUNpnJbZSugoLZSCmQlzRgsydeg235aRF1zkRhnoEqaYgk4VEAajICN7n4k9iXjiGa530hQr/05z0WTndcaDqxzlE/uwtMZs06WJMKVYbZx/VnwG4cGveo8GWKT/teIXAX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(136003)(396003)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(86362001)(36756003)(82960400001)(2906002)(5660300002)(6666004)(6506007)(478600001)(26005)(6486002)(66946007)(316002)(37006003)(66556008)(6636002)(83380400001)(8676002)(8936002)(4326008)(6862004)(66476007)(44832011)(6512007)(2616005)(41300700001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QpaTiFk/mtuMDYX4rRM+OGg24hG7yia6FGqsYqxEbZ8IieiMjXb8nUQ2fMbD?=
 =?us-ascii?Q?KH4vOlFFHplKLInUpFqx9zZT2z4jhhYtzVIlsinRNGl2tAmSd7OgoiliJIDs?=
 =?us-ascii?Q?6PJeRydmaVNKK2Ks6VXPRwuYbnuFh8+c6Wu8/iN5u3VT6Wa/sH3s8L5R1uKs?=
 =?us-ascii?Q?nY1scVxpyCfHVbqzsyQFtivtQkBOsziSEleA1/N52uL2lewqHIp4I1+BxCUw?=
 =?us-ascii?Q?5Cwayl6tODwvrIONje8w+9QAIxol++kmZ2LtAY1VrggisP4xmlDADyOKIzwK?=
 =?us-ascii?Q?nN6OnkEInCiKErkd6bWC3bGFb64F6Hz2GWaGyiJvMbAmjU2f7nTRy0L/175T?=
 =?us-ascii?Q?pxVpV4drGQuSSfzN0qrEn9DXPboCKu9ClS4KKK+9a4G6ONITzURqXGVh0iZJ?=
 =?us-ascii?Q?23Xn+gnwnmapyrieAdDjVO+GMJwMw+wQ13IZLdmwJ1Vem1tFOUOxhGNBSvWj?=
 =?us-ascii?Q?NkYv63qAxLjTzakPOf/Oh6f07bgAQn/LVik7CpT82EHmfpBVTmLnJDsw+kyH?=
 =?us-ascii?Q?1q+Fk7r8xrPKltTkWt7wMgYQv5leYbKiDyrQO4Dsi+JhH+yC8Gc61RQiaEM9?=
 =?us-ascii?Q?WOBRwLqDzIkcnOzega0G7fNy3SV33xmS7LGzoL5I5Z2qz2uuAXjhPet4tF5x?=
 =?us-ascii?Q?/0sAc5jf4aJtnZ6tKoYCaBTRSv/ObWDd3+93OcWHIOb9ixcRalRJFYTSvXsh?=
 =?us-ascii?Q?AMNJi1UdG1BNMg/FAvwW6UEHLSTKWxo8hOcxphFfc+3Jxu2DhDhYH6PBZc/T?=
 =?us-ascii?Q?FrQzZdH9d1MLZTNYtYCraGCVI6O89B8kmCXhxAwwmxnZ+4OVSf1mKNuoJ0YS?=
 =?us-ascii?Q?ZJA0rCR4+fFKaVb0TzdrYvQtbO8mmy4HBwRASTcfE2tHDDIizP0zuHTCNIqv?=
 =?us-ascii?Q?+meqXE2u0H59KE/VhPfvU/5EfJBDN66KlULFTFJ18Odujh6LUAQ3VN36Gnwk?=
 =?us-ascii?Q?q97Vw5cl6rbH4m9t/+MMQCMn0M1xxwuXgcJz+W3YgQor4xqUxlVCIoIbBpZU?=
 =?us-ascii?Q?diNHa6Hi0aOAcbMgHlRMqAE35dnAzwFAFRknHgQd7S+VKvz29k2if47Zs9Os?=
 =?us-ascii?Q?pPIu36TufjQ/kBS2iW2vLCVCytfmVUxV9epfHuwkLnxCBEQ0gPuCo7kWEgmm?=
 =?us-ascii?Q?//Gio6NnhplqMxkcOmETldejKIRia1EijYNJnJdK5AjaIpkU9MtXdKu1ZhlS?=
 =?us-ascii?Q?Ko6cxpKivZgknkMgQKDRNUAEONjtkxSt1JxfhIkq02vn1/k7lNgCFGwGQfpn?=
 =?us-ascii?Q?in6dowVFvOot+nPJUP5CEjlQlvXW6DHNABKLdAqyyDnq3A//3T0Ts2hsbufN?=
 =?us-ascii?Q?wFh/DftT2FovW0uU1Mshr/gN2V4O8et+CYYHUMp/WR8X903RvF6RCxDv8fnf?=
 =?us-ascii?Q?3YoLN3Rn4pLNjXJ64wct3bBH9a/ZNMqP6WJdO/7/mljH7SQiSPQGb31KhQw/?=
 =?us-ascii?Q?MgLVQIEmvSPgAwUDLSiwuL6NM/wUxi9q5o/USX+BvaehS9KWYqAIyyQ1Ick0?=
 =?us-ascii?Q?2+QY06b7MMyWixM8YOJwfPPxoNE70Z9PYjDltrLXcXLWh5dxfeztr68coubH?=
 =?us-ascii?Q?6ma/Ct/LKRkdAo0WTSzjxKLCaLrv58TjH66oHrvFfFsTU3qk2/zh6M4832JY?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7724d953-8e65-46d5-2cee-08dbf7acc363
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 05:15:58.9532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+gOISzI2iKUGLmm4aoVXPgiysQgLA6+7AJS0/Eh95l2AUsZGPDpvDsqQ6jvCx9x9Rq24JwFxYvyb+Ok9Lt+DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6957
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

On Tue, Dec 05, 2023 at 03:20:47PM -0800, Vinay Belgaumkar wrote:
> Also, use the new C6 helper instead of duplicating that code.
> 
> v2: Check skip flag at the beginning of the function (Rodrigo)
> 
> Fixes: ff1db4de1e40 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 1943893a3fd7..86124f55dbd3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -794,9 +794,13 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>   */
>  int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>  {
> +	struct xe_device *xe = pc_to_xe(pc);
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	int ret = 0;
>  
> +	if (xe->info.skip_guc_pc)
> +		return 0;
> +
>  	xe_device_mem_access_get(pc_to_xe(pc));
>  
>  	ret = pc_action_setup_gucrc(pc, XE_GUCRC_HOST_CONTROL);
> @@ -807,9 +811,7 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>  	if (ret)
>  		goto out;
>  
> -	xe_mmio_write32(gt, PG_ENABLE, 0);
> -	xe_mmio_write32(gt, RC_CONTROL, 0);
> -	xe_mmio_write32(gt, RC_STATE, 0);
> +	xe_gt_idle_disable_c6(gt);
>  
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  
> -- 
> 2.38.1
> 
