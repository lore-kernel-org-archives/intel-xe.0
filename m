Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D95C7EE29
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 00:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB6B10E55D;
	Wed, 24 May 2023 00:09:37 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2E010E55D
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 00:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684886975; x=1716422975;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FBITMuG5LpFDJ0bcSX/MqyPq5QeS/QgSoMnzyggkqHk=;
 b=chps//Pwr4o5Y/n34h2GV3cakwi5S7nbXWKxD70OXuJ0rJuYsRjKFZN7
 ZyrGSjlzVgWcku70p/6xuHhPHtxdjoXeA0uoLX1Fl/DdtWM9Byl64p68I
 QDHIkcH4+ptZatcr6Z0O5yVdJhlNDwAtmGYpxtVLnIACuqBcsvN5d0gEa
 vXDDzkr8nbfL5tOrlQH+1B/12MV0lpo0SIa0k5noGK4vMV/ZNDFI61Wnp
 m0mI+ODaJguXBlGnnrsJ2/XZQqZhwxXY0JVt7//jithZR5WE38ra4MYvU
 NazHc1TNpOtZ7+5RGThtq/W4o36H0xpuZDrDgFrtQp+z7nz2wtA86QY0G Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="353428325"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="353428325"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 17:09:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="734933385"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="734933385"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2023 17:09:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 17:09:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 17:09:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 23 May 2023 17:09:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTQv6euUFigVfJQWUATOmjNN/3TsEJZPVugAWPX+j5cVWrkYh+uMqD6Qd79rgoaf6ZHjsIaeK3UCnCDZKW+p2jxRiPC24EdWKSenqWY6IqOr2T08Wdd33PvQux+siWRIqSZCNg3vzaB0kcADJwukhORtWu2tsaS7hZV3FQq/hWsZ5whHaA26819OauB1N5HY3W7ZqymPXtaRA13HJ1mBlD8Yftd7Qa/Rz0to4Qr1WXm4C0bnd02O1uvt/6c3WJzQ5NRBUFwcXY2KyQB+M1ufQXEKn4/fmDhtSFBY8I+wSjUwPL+CqCYz1432AnoQkfXrnd900q5YIQIsfrCAeQcoDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/G9TBDqhWDwcfOQWhUFcqFMyoAdtpVV1rArIhsGD+IY=;
 b=OxTUOGsgIb0N4/TirKXCatrDFohw9C9wbwKJLp6gqn8fM1+TCVQ4EyoHeKP9BUlrYQQKsIoehz4aOOGOPPrPpTpl++PhL136cIYpzOsfeWgO+AJiIu/Y9aJccllWiPk7eWfZyk3Ey0u34Tj9RHIOVNvsCXrX8zCSudwNP5fs8ohrN0hHbtQMHla6JFeuAL/37NK7oDfo6SDeMW9PReii8oYz0uIQXJYiGyfXMNp8/FTUb7cNkmRBythFuLJdLebsmtQr2cbfWMgyaeC0M1aLMxXDlkHA76OtfqoGL9l8uIlZ6xdAIcTVck5acwjSykulxNvyU7spFke1yOxRlz+aNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ2PR11MB8345.namprd11.prod.outlook.com (2603:10b6:a03:53c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 00:09:31 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 00:09:31 +0000
Date: Tue, 23 May 2023 17:09:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>
Message-ID: <20230524000928.GO10045@mdroper-desk1.amr.corp.intel.com>
References: <20230523135020.345596-1-michal@hardline.pl>
 <20230523135020.345596-2-michal@hardline.pl>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230523135020.345596-2-michal@hardline.pl>
X-ClientProxiedBy: BY5PR17CA0016.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ2PR11MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad4442a-ea9c-4b8d-07d1-08db5beb25da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HWNu+lsfZxFtvHiogro/UEalGonSa7v72/+TVTshXuMpeKQY5fkuf7WnEZTbZKT8PfCI0Mj/HkiJ7TN97rkPtrKo7GUOWyqJ/+TaWXVuRErH9TtP96z1hCYuAprFPLccG3w/NE0ZRLfy9c+sy/qwb1d4qt2W05sFlDysCehZGISPslK9SipSg7ualbcUX/EI66OuIlbwSAP3zukRWUGsmvXV+Ku7iAsYwKIXjI2bwnW/Qssc0hLF+BqIOghhc57/UnfbhCyd5yI9of0S3NjJeKlhCa1LbTXFR6O9DoAzB0q2rKqLNdit14j1NmoMqvi6yzJbB6O1l4zUQ1gTEsK2kAbA2HQ+A6B77klGXLryMv7uxsafzHPeL5BlLQP8SkL8QBPhMrPXMy2dXmd+9pmiFfTi2FMN6XexwhxAKbhgPw285CmgGByZFL68VrxaGE3uIRh4WyZ9IEtOpVpjeOSaSmcM93S9SGsL+tDdFYuBnuXSZjvcQ9ioHXFrfPmkZAyJDvHTN6/uaCcy5XvQ9FuFN2Ua9ZvaLrgeETKPjcVW5fedbP2pd4qJOV4AXBN2X4Lm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199021)(38100700002)(66946007)(66556008)(66476007)(6916009)(478600001)(41300700001)(6486002)(6666004)(316002)(4326008)(86362001)(8676002)(5660300002)(8936002)(107886003)(26005)(33656002)(6512007)(186003)(1076003)(6506007)(82960400001)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDZuaVdKd1VXUjlHUUtIQ3hHNjRFNVJJTzZlZWlEOUZJNXdyU1ZaV3NyNUYy?=
 =?utf-8?B?QzhqVVR6NEtGT3cyNXlTOUVXdUc1cmt1UFpGUXFqSlR2RXE4RExrak5wU1Rw?=
 =?utf-8?B?OEtrbko1QnJheWtBditMZmx6RzFZQW8wNmlMWW9qQTRvU3JrMS94dk9lR0JC?=
 =?utf-8?B?Wk42NmtGeCtNRGpwNDhYTUtHVkhuWkJNZEJ0VnZFQXdBeitEdzNUVnRyd0hp?=
 =?utf-8?B?OWpmUks0K2trdHJrV2crMFRaMU1Rc0lrQzlkdW5lYlBxUytSRFQxRnZseVpZ?=
 =?utf-8?B?WjNRNlBrUGNKV3lHUDF2ZEo3YW05b0tVR21XQjk5YVFuZ3FFVENkd1JhRjFE?=
 =?utf-8?B?T0tybGlVVmFMWGUrTWVDaGpuaXJGMDJsS1dVVGJPT0NhNWdPU1FFc2dOUEdQ?=
 =?utf-8?B?Skk0TlhGNStpZURnUk9VN3AvOEtlVU5RanhGWW9SYUtOdkZNRFovTWx5bjR3?=
 =?utf-8?B?MXFKSUJ4bzN0S2ZvZEZ6RUM4aW5PbU1tTEtXK1phcjFBbEx4THRnTnB5VnlD?=
 =?utf-8?B?N1NYdzhmdVBXc3YrdXRQZ21SUitOdjQzZGVPNy9EVFdvWWFzL0orb3lNNGNy?=
 =?utf-8?B?L29SYnZGQlNaak85a1JUM1cwcnNuOCtzb0VObTB5WC8rS0lram5IUklGazlx?=
 =?utf-8?B?ek9ENkIwRkNmRFhwZXBZQ3JhSnBDUDBhSjd2d1kycTVpRUZiL1RodWM5a1Yy?=
 =?utf-8?B?Yy84dk56eFVFNnBZOUJuZWNTc2h3Qk5Ia0pBZ1kzQjI5UlRDMTdpVkl2MTA4?=
 =?utf-8?B?dUpxTnc2YnM5YlhhalovT21qM1FWK3hROHFJaDhrRGFSNFYxUGcwMHo0bTVw?=
 =?utf-8?B?Vk5ZTGYvb2lZbkEwT1FXUlp5eUJPWDBOUk9NTXB6SXREU3JIRy9rZXJoL2Jr?=
 =?utf-8?B?bHh0NHgvNE44dFZkRmhJQ09HcmNxeGpNVVFRNU5HOEUxMnptZFJocUt0UzJv?=
 =?utf-8?B?aUVTczJDMjVMT1hHSyt6eVo3RjlVWWw3eStlcFBIb28wT1l5YTF5Q3VWVHo3?=
 =?utf-8?B?cWR2S0lIK1ZRb2dMb0d4OHlOUnNWRjJxdGxvQWQwTUJ4NE8wczdlOThsQ3NF?=
 =?utf-8?B?aXFtQWNWeVlUZ3JLNVRoWGRvQ3dhR21qOW5Eam1DUkYzcEVrOEJkZEF0T1po?=
 =?utf-8?B?K0JxbndzSUE1WG1tL3FWQ3lSNDNocXY5clhLa21QSXNzRnRQWXhuR3VSSlo1?=
 =?utf-8?B?SFlaSkxKam9ESlZIL2EvNzhyZlFKOGcySy8vSU9YVitNbFhGeUJ4YWZkTXIr?=
 =?utf-8?B?TC91emIzbzg3MVdMRXNVN09hV3pWREIzTW9yY0Vvc05pQmJLRytNSENnWjU1?=
 =?utf-8?B?R0JhN3hDMWNuSXNscDhjR2c5bWo0eVdJOVpFOUpHNGFSZTlmR2lvUUYvNU4y?=
 =?utf-8?B?aXFrVlpONGEvdzM4MEVEUDVXbXV0WHZSYzd0QlgyUUk2MmRXL01iZEREQm9q?=
 =?utf-8?B?YXVpcVNoZHkzWm4vbnlUbFVPbXNzZHR4ZXZtT2VFUUNxWmZrYTB4OTU0RjY4?=
 =?utf-8?B?bnZFV0hEVnpwTTRpWXZ0ZGZqeExxRlB3MG5ScXg2c29sNFJmbXlEUFRFSTBa?=
 =?utf-8?B?WVk5dXFlQnNrc000V24vMzJ1Mm9kbnJuRk9WaUI0SWVEOWtBeVl2RXM2ZFBY?=
 =?utf-8?B?OEZ5VUpVRGlGQThYNjc1OXlOaHZnVEplOXIzYnAyVWZXaVU4ck9wR0d0VkFY?=
 =?utf-8?B?Yit5dGoyY0Vsc3FGVHk4VGlCRGFGSGprc2NrVllwS0hIZUVlVS9RV3VuNGFo?=
 =?utf-8?B?c2MwSEUzSHNISGpqL2I5dHVsT1RuekdWS2FhbE8xVmt3S3p2WFpWai9OeFpL?=
 =?utf-8?B?dEVMMUQ0M0c1WGlPNHQzSE5zNktYL2J2bDZGQlFEZm1UUGdXS3hHWkdWdTVN?=
 =?utf-8?B?L09xK3Eya3hqZnNmU0dVemo4akZwRzVpNHphVzBOVjVtWVlUaHZReXAwOTlC?=
 =?utf-8?B?SWNGOHNvZjVLNFZ1dStESktCekhCU1dxY1R3QmN6TTNBVjF4SE5FVHVwS1pZ?=
 =?utf-8?B?RVkzMDhTYXQvcThZN2t4ZDdRYVJBc1FybTJFTmdNY3NGTDR3d3dlU0pHc25i?=
 =?utf-8?B?RXo0MFVLNHk1R1EzZm5FVEV4eEorV3dhVm1odzIrR0JaRERCOXFkQkdqRnAz?=
 =?utf-8?B?MDNscEd0azRhMS9EUXRWamU5cE9oQjk3dVRObEIvVk0xQlFHNDJHZVE4NVhL?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad4442a-ea9c-4b8d-07d1-08db5beb25da
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 00:09:31.6176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6tve/nGeEdbx+HDMjfszgBCosa5Vw0FQ9XDEsjLEDGmZdXEY21UHHVgmVZHfamBDYY926ynXezwGhL/DnNZcEdUVIgXjW6wz94Q26KG2X4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8345
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Fix check for platform without
 geometry pipeline
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 03:50:20PM +0200, Michał Winiarski wrote:
> From: Michał Winiarski <michal.winiarski@intel.com>
> 
> It's not possible for the condition checking if we're running on
> platform without geometry pipeline to ever be true, since
> gt->fuse_topo.g_dss_mask is an array.
> 
> It also breaks the build:
> ../drivers/gpu/drm/xe/xe_rtp.c:183:50: error: address of array 'gt->fuse_topo.g_dss_mask' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 5 +++++
>  drivers/gpu/drm/xe/xe_gt_topology.h | 2 ++
>  drivers/gpu/drm/xe/xe_rtp.c         | 2 +-
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 7c3e347e4d74..d4bbd0a835c2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -128,6 +128,11 @@ xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum)
>  	return find_next_bit(mask, XE_MAX_DSS_FUSE_BITS, groupnum * groupsize);
>  }
>  
> +bool xe_dss_mask_empty(const xe_dss_mask_t mask)
> +{
> +	return bitmap_empty(mask, XE_MAX_DSS_FUSE_BITS);
> +}
> +
>  /**
>   * xe_gt_topology_has_dss_in_quadrant - check fusing of DSS in GT quadrant
>   * @gt: GT to check
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> index 5f35deed9128..d1b54fb52ea6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> @@ -17,6 +17,8 @@ void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
>  unsigned int
>  xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
>  
> +bool xe_dss_mask_empty(const xe_dss_mask_t mask);
> +
>  bool
>  xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
>  
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 86fd1025b931..86427edd3bfb 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -180,7 +180,7 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
>  	unsigned int dss_per_gslice = 4;
>  	unsigned int dss;
>  
> -	if (drm_WARN(&gt_to_xe(gt)->drm, !gt->fuse_topo.g_dss_mask,
> +	if (drm_WARN(&gt_to_xe(gt)->drm, xe_dss_mask_empty(gt->fuse_topo.g_dss_mask),
>  		     "Checking gslice for platform without geometry pipeline\n"))
>  		return false;
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
