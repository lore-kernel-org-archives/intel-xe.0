Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1EFC76196
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 21:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144EF10E1E3;
	Mon, 10 Apr 2023 21:59:43 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB07110E09B
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 21:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681163980; x=1712699980;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SBDEn/cWJMOEDCJNsXYfFzJ+aTA4tp4I42Ii2tiN1Bs=;
 b=SHe4qwkrsyAix7A+HpoTb2EpEhZgPEgjBmbDWD67XM7t5Jyg0jc6NxcF
 CgOj/5eazUgfslJ4xvVEfSM6bOqhOv2HI47rkywf3iOF+CPkaeNRwdkFT
 bW0Un2ZXiDr5/28nLoUvrWu6rTPvW5kFhbVHqJuwGlhLetZgevVugAgzY
 H6qakrtZIPV3AgHAVYaEXuA3PfHUu5x6l0GW2ufbPSqQ+a3mw3UMNgja1
 6N5CJ/MDYc1tzbWDgCOK38RyTX9v3mzA6vukrQjp/V8MfLvAJmLp1LfZZ
 4hm1z9ESx6a3WDxLVf7X7IZOo7XaCJzLTdwbLO6kRUvnBC/biTVcotSWp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="371306943"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="371306943"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 14:59:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="799639315"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="799639315"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2023 14:59:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 14:59:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 14:59:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 14:58:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyY8XVA0YBcrBEyNvgWOc+5HsUVdgPAOpytNu7OSY1TOE2ymDzSGXRtsn/jFEQfNzCCFHTl6T1A62uFAwECwLPOnqgG8cHrlpeMyeWBmD5pQYvKg4p2YWORPq0vEzwoqRDm65hKsKw44ZyO4sNjquajjbmLS1JF1g4x5VcucN6PgPoK56VKRMYOJ2wiKKvLxRf1X9x4ZJwCCFH5oiUlObyUwnrAL2hhd8PRdnOJVE+lLpMla++6iJ6hYVVDglU8XyWa7aWul0D5IjcCyAetaePCqLt9jpKpjvz2ThejgTphjCo5JHEQVpu3uszcb2tpUx/7WaMJj/d5S+PuAGjxApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFdfVC85DU01n3hHsRvtfwJ3B5OMWaTAV9ET2LOg9dE=;
 b=clHM0ZIZm6e5Q2n6Kg3SJzJIEN3hlso36zO04KWYQ1Xs/w6h3EWWL3L594/+EKVjFtHB1ZqM3C0vEXiWisrBn4Imp+vv+f1WT5p+kihdkUnvPm63Skk+Y5PMkWroqadDQjSG26m9M6Xk0aiC0YP8xIiV1gDkV/+POJ52U4POQ9QGDr1CJA0Rxx6m2NcdvJrFrURCZ27wIUrMKUbIn64jj2SYJFxe5yOcqamt2vmb8VnfkZ+VqlzF9D7M547JL3GDSjZYCbcqIsf1iiE2x/yLgy4OJLpOwg4RbHU/mjTQEbxa+t7Fj1Je59oXYbKce4Sjs/lS7EId36C46ZYwB4358w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO6PR11MB5635.namprd11.prod.outlook.com (2603:10b6:5:35f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Mon, 10 Apr
 2023 21:58:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%8]) with mapi id 15.20.6277.036; Mon, 10 Apr 2023
 21:58:56 +0000
Date: Mon, 10 Apr 2023 21:58:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZDSGmfni4sy+7/Xa@DUT025-TGLU.fm.intel.com>
References: <20230410183910.2696628-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230410183910.2696628-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO6PR11MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dac0d9a-cb39-43e5-697e-08db3a0ec835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tL13K1bkzoNIJWzOGzuHXxu8kwVPyBwNRgGreasEDCyOm7+P4hibE1ya2PNPONdn44r5/UAg9N7vFeuhd87ZnAzxCZ6ZV36fxS5Yr1Elx7+V01+x0SR7Juc23iBRuJy0tO1P5lLlzgkBV79OgKu20HOrvdU4vzBEvEeIC1hPyeHy2RmIEHZaHRDKppFqaF/uMOXDlUgpDEVKvrfVI5UkG5Wx3IfLbc9xfmsRTDXncajP89MNpkQ+Xrfxf7H9F0ZdR3HpLOrSWivScDOxGBI1+x06Yd3LbOUGgi1QymBgrafOeLgkOueDqOJleVYWSsknhXKompBVJqLF8SR2nEXCino/v06mgU18L2y2Sb16Eu0TW26P09MFLypGNFGGMP9GWmyv+586fv5e0QDNZp+FyyYe09aD/HKMfn+cQEVBEweSbw5XGl/j6xygYVBTvB5A8c0D2NsOSdGchJf1vGQt4O8WFbOiAC3sV0guFxlLnLt+Cy4/oF5Xo6YxH+b7dXRcpzdthQ7PcT2bo8jK3bOwAtHov2nfZw9ji/sOWzVbAaQWkU3hw3LmRL5vG7jOhynp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199021)(478600001)(316002)(6512007)(26005)(6506007)(44832011)(186003)(6636002)(6666004)(6486002)(2906002)(5660300002)(4326008)(66946007)(41300700001)(6862004)(8676002)(66476007)(8936002)(66556008)(38100700002)(86362001)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?04lpkU0ZMjSwPcheB8d+pm8b5CGmfFWH14FUBnJUDd4VlC0QiR9Tx0XOdZ6F?=
 =?us-ascii?Q?tiKC3wdUL7deihJdHpL7Ibw0Nj/YN0RGhQ73EgaHk+klVU016JCnK2k32yGO?=
 =?us-ascii?Q?DKxLhI3jDmNboF37rk8aWJTqb5nlbmwTarYZF2fdHj9CgufoCOk5o711kTZ3?=
 =?us-ascii?Q?AUkD6mNWKS+L9BTxJqEj4VP2LB+VRPQ57LfpcFqIzgDse50jx3gGzYHz2dZ3?=
 =?us-ascii?Q?9yio9ac9a1yVfvY42VlbowrEo+kpoXXFhy3uwK/Z20zFmTNgMYn+cyG7GJRF?=
 =?us-ascii?Q?MglPK5DggV6gmmWtKDOcCWDL/KQfs/e8N125T28y3ffX0RyUffn14sFqVYD2?=
 =?us-ascii?Q?D5vOF5Mt5T1mKZX8QGkFeaoo98DWixRELv/h6cPxtfvCz3YiIOz9HYHbMyTG?=
 =?us-ascii?Q?TX2ENM+xFn4kcWj3vqWEkH0m3EQfJxMYzgdBlc8fZePjTsAIIhC7lbPetsH6?=
 =?us-ascii?Q?ecoMwylbcHrTJPqCp1uMdxSK4nStwi4QOAOdfzzN4/HfXIPr60Su6pG5Vn1K?=
 =?us-ascii?Q?cPRbX5f8wUh0ndBC5n1Zj+9yiS45CTxpiuZE2SuvDLmKIwGs6aDOquwYaq5+?=
 =?us-ascii?Q?+d+gyg3NaszTQJJlnwl36f1ZXKX+KNZybN8R8318XFuG6af+O4+iKNWGyMjm?=
 =?us-ascii?Q?dSqcy+8soC9keRhEx183jQzTw21ngZkeMBTXcYPTwnaN0FGSJSknqv2shfE1?=
 =?us-ascii?Q?1wx9WRwh8clx7HiwMpV3MeTvnMXdfFEso34Op2/3K8NXckBq2TLyzf7cmsSs?=
 =?us-ascii?Q?tP/S7SjEGmRyokBIkItk6NzOthnxfV59RBxPpulIKUPA9T/adIpzpsO9jHgx?=
 =?us-ascii?Q?V6lK73pMlrujrYecw+iZY0qZ6FgJB28Vf8HVq41a4jws32J1xyO9+UgCnn63?=
 =?us-ascii?Q?Vdj4aBmIYN/SbOV97HgN3iunBGbW4Sohl9yzuA54eY1BLmdxVclspieKkM1R?=
 =?us-ascii?Q?HizDEber1CmTlPJ0DsrWeHXkzMiFtEij/yMGqukWLCQAjWOmXunwjvTszhkL?=
 =?us-ascii?Q?kADDcf+5/fT8goGAA6Q5oCH4brqRNh6zWGsQxb8vFrLiIm46MBDzKqZi3HK5?=
 =?us-ascii?Q?FCNyzB4qmg88RbN/3/ikBKwDYifO/6vdh/lmCveHod1zTCX39r5/QJ6kRCuv?=
 =?us-ascii?Q?bsGUlzcc7NKydzig1Y2/n+1I3w3oyygkkc+CdNS/7nm/77aUK8L5w0BxraXg?=
 =?us-ascii?Q?tNi647Z9GJLcuLckJh81FGh8LJ2yuJQXF1k9mxm0/XvPawd+MfDPPDKGOKaE?=
 =?us-ascii?Q?1zHbotqxI/b5v63Ax0yLlKCB0DUeZMlH6rOyfqFROPXSQ/yMTHNNit5vn4fK?=
 =?us-ascii?Q?OnccSaPrhJ/afw0W6/KOlEKUjY3pHz040399RkrNNhsQO1peIgyPUOc62ZLz?=
 =?us-ascii?Q?wdCkSexXcdkRo1uNR6zf1ImmZgROCpk4Xsq1oEjNKIaJs4ccXKxrxOUJKc1k?=
 =?us-ascii?Q?wGtQDoSwyz+5T7it0Amk5WTh8t4G5Efx9TAMq0jm2h1219A+C+U/H2dOSklr?=
 =?us-ascii?Q?YhAUvHLIYFlwMHwZ9FyAGue4w6fr0JSPBA+fMhbL3hafNzH6Ottmdu9Siixy?=
 =?us-ascii?Q?63IudkbHzs1glXXFp7mkv/zUh0o1rHwzIJokJg4zYO2a+WFaqY5gxTKasf/r?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dac0d9a-cb39-43e5-697e-08db3a0ec835
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 21:58:56.7673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bPuUJqRQaHvRjzh4oUb1MQqk8pdHH0SRfgZJrbKTIMLpUrTB86QYe9Ol9p0RfcBYX+6Qx+TTdNiXlVy1s06kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5635
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Use packed bitfields for
 xe->info feature flags
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

On Mon, Apr 10, 2023 at 11:39:08AM -0700, Matt Roper wrote:
> Replace 'bool' fields with single bits to allow the various device
> feature flags to pack more tightly.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index f5399b284e3b..9ce6e348dd29 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -67,8 +67,6 @@ struct xe_device {
>  		u32 media_verx100;
>  		/** @mem_region_mask: mask of valid memory regions */
>  		u32 mem_region_mask;
> -		/** @is_dgfx: is discrete device */
> -		bool is_dgfx;
>  		/** @platform: XE platform enum */
>  		enum xe_platform platform;
>  		/** @subplatform: XE subplatform enum */
> @@ -87,22 +85,25 @@ struct xe_device {
>  		u8 tile_count;
>  		/** @vm_max_level: Max VM level */
>  		u8 vm_max_level;
> +
> +		/** @is_dgfx: is discrete device */
> +		u8 is_dgfx:1;
>  		/** @supports_usm: Supports unified shared memory */
> -		bool supports_usm;
> +		u8 supports_usm:1;
>  		/** @has_asid: Has address space ID */
> -		bool has_asid;
> +		u8 has_asid:1;
>  		/** @enable_guc: GuC submission enabled */
> -		bool enable_guc;
> +		u8 enable_guc:1;
>  		/** @has_flat_ccs: Whether flat CCS metadata is used */
> -		bool has_flat_ccs;
> +		u8 has_flat_ccs:1;
>  		/** @has_4tile: Whether tile-4 tiling is supported */
> -		bool has_4tile;
> +		u8 has_4tile:1;
>  		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
> -		bool has_range_tlb_invalidation;
> +		u8 has_range_tlb_invalidation:1;
>  		/** @has_link_copy_engines: Whether the platform has link copy engines */
> -		bool has_link_copy_engine;
> +		u8 has_link_copy_engine:1;
>  		/** @enable_display: display enabled */
> -		bool enable_display;
> +		u8 enable_display:1;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  		struct xe_device_display_info {
> -- 
> 2.39.2
> 
