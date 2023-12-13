Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A04C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 18:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40FD10E1D9;
	Wed, 13 Dec 2023 18:16:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2ED610E285
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 18:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702491381; x=1734027381;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7m34bqcEMap4Po6Kb1ZyPqqf7VTAQznyBkFoX4p8BPU=;
 b=SzmigiWcQlUryfFYtjjGZ25xikYOR/5ydT+Z4ObU42B3r5xD4ypX/Y5n
 McK5bklT2fJojgJAODhhJ2trYt5oEGEujqpaVaYMar+scl95gKhhXaCW1
 s7nRK3PUiHxxnNBuZT97tLDFFdgqtNLl2Bmmmpqg7eK/0pR5lbyBdbF8N
 ybRMllWoZQgkfKWsrSCDM2hc5YiTA60r1DacdSSYSw1/Em/ocEz2VNU8g
 9zMjc4OnSOdaHqtZjRCBC2hnidEh+ehG0eZ318kcjojN0R4/+nJAl1skw
 Q06wobnKKCbpyKyr1uGbMv1rDSNKb1bmczz+XDmoFuKE7nwYeDdfM5/JG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="385422717"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="385422717"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 10:16:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="864712320"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="864712320"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 10:16:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 10:16:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 10:16:21 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 10:16:21 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 10:16:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMeH4dVRL04bk7l3P+nuMMfrBtxgj84m43FBzJfOcJpjCLwTjt+kHf8fR4JwBfGKmh3cwFqYiEFSXf9tygvNCJeTrzTJOU/qpaebp0BRZ3vOndymORZsPG3B/tUTBw8UcFge1mzKGdjFMnK14d76vZpgwbD9gH5nCpb4QkiMKV7b2JijzBWICW8navqW3VsK7WM3pcaiW1fQ25OFXpLleN5BwRjvoTClJ4frnaATwU0qXyXwpqYvVn+cthM5eTKaYpI83YZMIpZ4aa2APP3ChyFe5AXR4v9KiiZqaJCd3FNjFvhbPS/gHaQI0oEjUMRMx2+6RcWPiA3SPaucCxoj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9k9evt1I2U/clLBQ9gb6TYCKbMiSM6LnSTrqiOx3iZs=;
 b=Bk68gmEMsfUARD/rA5mp2ku+zxgrIaxobMh18DLSlhhxPmQirjBzB2ZxfF04jB7nj2FWwfty1yCJnnoODO2dSrSzgI9LbLyqPPqKk7JO1kvwAVhPzXyGGeqeWVlACFxAyUbndGlQZgVLRVT3ycO9eIl7oEtDfkSsNvKtX/8UBQAw8/R9smdCud4pUV9puhXYys2XrM34t3M9bWSfpIj1piGIvLI13L0DQpYPj80p7C6UyYD3Ffk90ChsavZbEuIQsMB3ssPo/IKI7W7Sj16mfO5kEckY/AdptO3DHS1gBLJFCRtm4nhNfeNjZRAajqX9okig4SBOaoJkPwy1LO4Atg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7630.namprd11.prod.outlook.com (2603:10b6:8:149::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 18:16:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 18:16:17 +0000
Date: Wed, 13 Dec 2023 13:16:13 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v1 06/14] drm/xe/uapi: Make constant comments visible in
 kernel doc
Message-ID: <ZXn07TvG2o2OK0pI@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
 <20231207135009.7-7-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231207135009.7-7-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR06CA0031.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::44) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d092aa6-e2d7-4517-4a9b-08dbfc07992c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NaRYopZEHS7ExsPsRuMJuYt5a1EjDV6mXeuXQ2ckrwM/YJSvDeHDWzqkeL8KPzKzJPWgE+AJtzLvM4rG3ahkt/bXAe5Daquy1may7OAznS9Q+QmRYtstDA0SGRJqjqAQPycVldOel7jvQ4PfJ8sAH8PXL4fg6ELuuM6tXFmBPLmeFmqBkRQXCqws/mDiIXGkpan2LcdLFzHl+ljrMlEh+QhNpsTBOcoAttg7jeKdqbKU2U3cuv4zegfg+JJeMtmOa2XpCydvRmJiA15whCN4+2OmRLZj1pmir/KnQv52QLTQJylRDm+6YLuyoOwhWsMjhfvmQtYEhhe8sG4Gx6Qi/CbtKPnCQNjK79mJ/latFrPiSOSBTQUlWr7C3l/7E6uLBFw7aaQvHhHl98lrGWUktOJ8EHy2U/TpTvQI2QzJB6wWTUhtdwJBFMiFsOxnT4/UA4rIu+arlzxHUPCGVZDyrRFXmpm4l/ihIZJY2JeYNpUbUtTZHkPI0mLw6fcsA0ZEMRjVd7rL+IDiOxz8oVcCK6Fxn+JOYSBhS9OAdpd8gaSUVacltoOWRarakC2hfkE/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(366004)(136003)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(86362001)(6506007)(26005)(2616005)(6512007)(38100700002)(44832011)(5660300002)(4326008)(8936002)(8676002)(41300700001)(2906002)(6486002)(6862004)(478600001)(6666004)(30864003)(37006003)(316002)(6636002)(66556008)(66476007)(66946007)(36756003)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hUiXVNBZKbZI664ltFiFRITYD1tVZgsM4sSQNYo+FyvdknbPdNtHYyn4Yptv?=
 =?us-ascii?Q?41TYyepJ1f3pr8aYGaVo1njkS4c8hHCF5FJU127nxjXlg/MLSv9FWzSE8nlG?=
 =?us-ascii?Q?/gTqdDc12j+1TMmfmqBimrbWV45ZzpcGesVrwMo980CKXY/8/VCQ88poWmMe?=
 =?us-ascii?Q?GGMrryL7gwCQyW7+tWJCMNN7xOIcTZcFMawTvguGM9BIjs5Ayx9Y7bDdIrO7?=
 =?us-ascii?Q?aYpTdnQP5OKQe4h6awHzhfFAFEpMQdaMP1sDeLncuNdpfZe1UmDqhjLRu9Jj?=
 =?us-ascii?Q?MEY+Bx2rqOO0gLr6IqvnJhoxV6Cr5QZKMx22t3Oemqgm/nkcwxr9C6Tq4ITE?=
 =?us-ascii?Q?Z9HxoeoHd0cz6c6k1Tt82mwBSSmLIM9r4nOOUGzIzmDUY9TQ7yhNOVY47gwu?=
 =?us-ascii?Q?M/l+Xn95jCIHMAy+NY71QiFGI3j7awEBMroEisSgF70rE3IxFtNRHRDBHbcA?=
 =?us-ascii?Q?qfzH7Yxtvo1iEELJVQc0YTg/bOOlPyuE+vHaD4fKeyUHdfOX4E3Iv9lG7YHR?=
 =?us-ascii?Q?0On87s+CfEoN2FZStKt3K+U6r/7W41UhWLhu7fWoNlCx4EUk8bdFe7N7lr++?=
 =?us-ascii?Q?NVXkF8/k+EO3rV9WPnZZ1qi0ZE4KUqj1/qcfmaEDn0CFzncZ+NzpoJvy2Rui?=
 =?us-ascii?Q?pEmy8HjSTz/0xJlPtQvZrHEDHIyqT0hdjZwKFA+P8JHgJX8Au7F+rcXFRtaF?=
 =?us-ascii?Q?bL7M3WBGooslbLywY1/3RT3gIIKYI6FwK1rmHuTFIodUhVrmek8joaWe7b8p?=
 =?us-ascii?Q?nPGmQ7QdMAFKpYptfQ2vmGuyl8f/5vIKxycyutc3Y2y1m2aD4dnJZis1jura?=
 =?us-ascii?Q?LSoGSzcFJPO/muUhrZ5njCh5qtoXcR1qNYGKUM49jsj73OsemNFFqDF+kMe3?=
 =?us-ascii?Q?wq8wnzs/dfr1IYSAcYMMRKK0lc+pNHWj68E4lKKEWRa8efgMHckbaVB/m795?=
 =?us-ascii?Q?H5UpkqDIr48oU9VdXt/955lt7+TLG9n0rK5Y+STVskAcvZYQaxiPdDzDYFUq?=
 =?us-ascii?Q?ZJ3bV5rB+oXAJgJOM50G2f+bGQQMK7s8M2ObpgAs0HXqWIZK31PWcqg0fCZH?=
 =?us-ascii?Q?YRqqHAdcrxjQ0KtqNiqTAAITLIXYuv3yjcKFVxceUqxCfMj9eR26sVLXdDDF?=
 =?us-ascii?Q?3l0YWQorsakgQP71dnvGkZTOcYRJeEbEIDT53GlMxzZxVpwlJgOg17XZZHS/?=
 =?us-ascii?Q?GMhTt0xpi3n9JBY1zRvwdCWh31hEGifSD3GGk1OE2VA7E0qIXCph0+Aza747?=
 =?us-ascii?Q?cSv0MLONdpeX6Ub39cPbE7bL0DvBv6b+TfAUudoE63EhVfcF+0JDZ+SwT3ZJ?=
 =?us-ascii?Q?Q5e8pNphZxii1TLRxXBEgfEhR0B2mGXu3wPbp/ROKG7CBAagv3CvPl/x0R9m?=
 =?us-ascii?Q?TfPpwLRIeNsuXqG4e1qJO3McPDI9WnW0xN/Q3yEPSgQAwwP5HKXehm8miFj9?=
 =?us-ascii?Q?56YosYBS3Mx1CGyKhhiiinE9dixeFITNoPKj7cz1y2TVhxO7djGferkK5BpU?=
 =?us-ascii?Q?uI9cKGAW8+qNmruiJZaiT8aaNciBu1AM1hyj2+1BuMsv6bDXMplaxTycT+RG?=
 =?us-ascii?Q?TImhmfJ0x3EFDCZhVORI53eq4GWnusSYYP7L8w32jTkZM/yaYJ5rJ0wgXuRy?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d092aa6-e2d7-4517-4a9b-08dbfc07992c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 18:16:17.1377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eeC6wXdcl/wPXRhXoLy3hQrxHlsevlsorXiu2igK89uby8RKtlmZd1E0NsNb6eNaXJjrUNDpqT5LHkxPXQUEKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7630
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

On Thu, Dec 07, 2023 at 01:50:01PM +0000, Francois Dugast wrote:
> As there is no direct way to make comments of constants directly
> visible in the kernel doc, move them to the description of the
> structure where they can be used. By doing so they appear in the
> "Description" section of the struct documentation.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 267 ++++++++++++++++++++++----------------
>  1 file changed, 158 insertions(+), 109 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 492f3c240e87..e608a8e7dd76 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -129,6 +129,19 @@ struct xe_user_extension {
>   * It is returned as part of the @drm_xe_engine, but it also is used as
>   * the input of engine selection for both @drm_xe_exec_queue_create and
>   * @drm_xe_query_engine_cycles
> + *
> + * The @engine_class can be:
> + *  - %DRM_XE_ENGINE_CLASS_RENDER
> + *  - %DRM_XE_ENGINE_CLASS_COPY
> + *  - %DRM_XE_ENGINE_CLASS_VIDEO_DECODE
> + *  - %DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE
> + *  - %DRM_XE_ENGINE_CLASS_COMPUTE
> + *  - %DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC - Kernel only class (not actual
> + *    hardware engine class) used for creating ordered queues of
> + *    asynchronous VM bind operations.
> + *  - %DRM_XE_ENGINE_CLASS_VM_BIND_SYNC - Kernel only class (not actual
> + *    hardware engine class) used for creating ordered queues of
> + *    synchronous VM bind operations.
>   */
>  struct drm_xe_engine_class_instance {
>  #define DRM_XE_ENGINE_CLASS_RENDER		0
> @@ -136,10 +149,6 @@ struct drm_xe_engine_class_instance {
>  #define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
>  #define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
>  #define DRM_XE_ENGINE_CLASS_COMPUTE		4
> -	/*
> -	 * Kernel only classes (not actual hardware engine class). Used for
> -	 * creating ordered queues of VM bind operations.
> -	 */
>  #define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
>  #define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
>  	/** @engine_class: engine class id */
> @@ -344,6 +353,19 @@ struct drm_xe_query_mem_regions {
>   * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
>   * struct drm_xe_query_config in .data.
>   *
> + * The index in @info can be:
> + *  - %DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID - Device ID (lower 16 bits)
> + *    and the device revision (next 8 bits)
> + *  - %DRM_XE_QUERY_CONFIG_FLAGS - Flags describing the device
> + *    configuration, see list below
> + *
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
> + *      has usable VRAM
> + *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
> + *    required by this device, typically SZ_4K or SZ_64K
> + *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> + *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
> + *    available exec queue priority
>   */
>  struct drm_xe_query_config {
>  	/** @num_params: number of parameters returned in info */
> @@ -352,31 +374,11 @@ struct drm_xe_query_config {
>  	/** @pad: MBZ */
>  	__u32 pad;
>  
> -	/*
> -	 * Device ID (lower 16 bits) and the device revision (next
> -	 * 8 bits)
> -	 */
>  #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> -	/*
> -	 * Flags describing the device configuration, see list below
> -	 */
>  #define DRM_XE_QUERY_CONFIG_FLAGS			1
> -	/*
> -	 * Flag is set if the device has usable VRAM
> -	 */
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> -	/*
> -	 * Minimal memory alignment required by this device,
> -	 * typically SZ_4K or SZ_64K
> -	 */
>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> -	/*
> -	 * Maximum bits of a virtual address
> -	 */
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> -	/*
> -	 * Value of the highest available exec queue priority
> -	 */
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>  	/** @info: array of elements containing the config info */
>  	__u64 info[];
> @@ -389,6 +391,10 @@ struct drm_xe_query_config {
>   * existing GT individual descriptions.
>   * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
>   * implementing graphics and/or media operations.
> + *
> + * The index in @type can be:
> + *  - %DRM_XE_QUERY_GT_TYPE_MAIN
> + *  - %DRM_XE_QUERY_GT_TYPE_MEDIA
>   */
>  struct drm_xe_gt {
>  #define DRM_XE_QUERY_GT_TYPE_MAIN		0
> @@ -446,34 +452,30 @@ struct drm_xe_query_gt_list {
>   * If a query is made with a struct drm_xe_device_query where .query
>   * is equal to DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, then the reply uses
>   * struct drm_xe_query_topology_mask in .data.
> + *
> + * The @type can be:
> + *  - %DRM_XE_TOPO_DSS_GEOMETRY - To query the mask of Dual Sub Slices
> + *    (DSS) available for geometry operations. For example a query response
> + *    containing the following in mask:
> + *    ``DSS_GEOMETRY    ff ff ff ff 00 00 00 00``
> + *    means 32 DSS are available for geometry.
> + *  - %DRM_XE_TOPO_DSS_COMPUTE - To query the mask of Dual Sub Slices
> + *    (DSS) available for compute operations. For example a query response
> + *    containing the following in mask:
> + *    ``DSS_COMPUTE    ff ff ff ff 00 00 00 00``
> + *    means 32 DSS are available for compute.
> + *  - %DRM_XE_TOPO_EU_PER_DSS - To query the mask of Execution Units (EU)
> + *    available per Dual Sub Slices (DSS). For example a query response
> + *    containing the following in mask:
> + *    ``EU_PER_DSS    ff ff 00 00 00 00 00 00``
> + *    means each DSS has 16 EU.
>   */
>  struct drm_xe_query_topology_mask {
>  	/** @gt_id: GT ID the mask is associated with */
>  	__u16 gt_id;
>  
> -	/*
> -	 * To query the mask of Dual Sub Slices (DSS) available for geometry
> -	 * operations. For example a query response containing the following
> -	 * in mask:
> -	 *   DSS_GEOMETRY    ff ff ff ff 00 00 00 00
> -	 * means 32 DSS are available for geometry.
> -	 */
>  #define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
> -	/*
> -	 * To query the mask of Dual Sub Slices (DSS) available for compute
> -	 * operations. For example a query response containing the following
> -	 * in mask:
> -	 *   DSS_COMPUTE    ff ff ff ff 00 00 00 00
> -	 * means 32 DSS are available for compute.
> -	 */
>  #define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
> -	/*
> -	 * To query the mask of Execution Units (EU) available per Dual Sub
> -	 * Slices (DSS). For example a query response containing the following
> -	 * in mask:
> -	 *   EU_PER_DSS    ff ff 00 00 00 00 00 00
> -	 * means each DSS has 16 EU.
> -	 */
>  #define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
>  	/** @type: type of mask */
>  	__u16 type;
> @@ -493,6 +495,18 @@ struct drm_xe_query_topology_mask {
>   * and sets the value in the query member. This determines the type of
>   * the structure provided by the driver in data, among struct drm_xe_query_*.
>   *
> + * The @query can be:
> + *  - %DRM_XE_DEVICE_QUERY_ENGINES
> + *  - %DRM_XE_DEVICE_QUERY_MEM_REGIONS
> + *  - %DRM_XE_DEVICE_QUERY_CONFIG
> + *  - %DRM_XE_DEVICE_QUERY_GT_LIST
> + *  - %DRM_XE_DEVICE_QUERY_HWCONFIG - Query type to retrieve the hardware
> + *    configuration of the device such as information on slices, memory,
> + *    caches, and so on. It is provided as a table of key / value
> + *    attributes.
> + *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
> + *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
> + *
>   * If size is set to 0, the driver fills it with the required size for
>   * the requested type of data to query. If size is equal to the required
>   * size, the queried information is copied into data. If size is set to
> @@ -539,11 +553,6 @@ struct drm_xe_device_query {
>  #define DRM_XE_DEVICE_QUERY_MEM_REGIONS		1
>  #define DRM_XE_DEVICE_QUERY_CONFIG		2
>  #define DRM_XE_DEVICE_QUERY_GT_LIST		3
> -	/*
> -	 * Query type to retrieve the hardware configuration of the device
> -	 * such as information on slices, memory, caches, and so on. It is
> -	 * provided as a table of attributes (key / value).
> -	 */
>  #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
>  #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
>  #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
> @@ -563,6 +572,33 @@ struct drm_xe_device_query {
>  /**
>   * struct drm_xe_gem_create - Input of &DRM_IOCTL_XE_GEM_CREATE - A structure for
>   * gem creation
> + *
> + * The @flags can be:
> + *  - %DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
> + *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
> + *  - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using VRAM as a
> + *    possible placement, ensure that the corresponding VRAM allocation
> + *    will always use the CPU accessible part of VRAM. This is important
> + *    for small-bar systems (on full-bar systems this gets turned into a
> + *    noop).
> + *    Note1: System memory can be used as an extra placement if the kernel
> + *    should spill the allocation to system memory, if space can't be made
> + *    available in the CPU accessible part of VRAM (giving the same
> + *    behaviour as the i915 interface, see
> + *    I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS).
> + *    Note2: For clear-color CCS surfaces the kernel needs to read the
> + *    clear-color value stored in the buffer, and on discrete platforms we
> + *    need to use VRAM for display surfaces, therefore the kernel requires
> + *    setting this flag for such objects, otherwise an error is thrown on
> + *    small-bar systems.
> + *
> + * @cpu_caching supports the following values:
> + *  - %DRM_XE_GEM_CPU_CACHING_WB - Allocate the pages with write-back
> + *    caching. On iGPU this can't be used for scanout surfaces. Currently
> + *    not allowed for objects placed in VRAM.
> + *  - %DRM_XE_GEM_CPU_CACHING_WC - Allocate the pages as write-combined. This
> + *    is uncached. Scanout surfaces should likely use this. All objects
> + *    that can be placed in VRAM must use this.
>   */
>  struct drm_xe_gem_create {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -579,21 +615,6 @@ struct drm_xe_gem_create {
>  
>  #define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
>  #define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
> -/*
> - * When using VRAM as a possible placement, ensure that the corresponding VRAM
> - * allocation will always use the CPU accessible part of VRAM. This is important
> - * for small-bar systems (on full-bar systems this gets turned into a noop).
> - *
> - * Note: System memory can be used as an extra placement if the kernel should
> - * spill the allocation to system memory, if space can't be made available in
> - * the CPU accessible part of VRAM (giving the same behaviour as the i915
> - * interface, see I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS).
> - *
> - * Note: For clear-color CCS surfaces the kernel needs to read the clear-color
> - * value stored in the buffer, and on discrete platforms we need to use VRAM for
> - * display surfaces, therefore the kernel requires setting this flag for such
> - * objects, otherwise an error is thrown on small-bar systems.
> - */
>  #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
>  	/**
>  	 * @flags: Flags, currently a mask of memory instances of where BO can
> @@ -621,16 +642,6 @@ struct drm_xe_gem_create {
>  	/**
>  	 * @cpu_caching: The CPU caching mode to select for this object. If
>  	 * mmaping the object the mode selected here will also be used.
> -	 *
> -	 * Supported values:
> -	 *
> -	 * DRM_XE_GEM_CPU_CACHING_WB: Allocate the pages with write-back
> -	 * caching.  On iGPU this can't be used for scanout surfaces. Currently
> -	 * not allowed for objects placed in VRAM.
> -	 *
> -	 * DRM_XE_GEM_CPU_CACHING_WC: Allocate the pages as write-combined. This
> -	 * is uncached. Scanout surfaces should likely use this. All objects
> -	 * that can be placed in VRAM must use this.
>  	 */
>  #define DRM_XE_GEM_CPU_CACHING_WB                      1
>  #define DRM_XE_GEM_CPU_CACHING_WC                      2
> @@ -684,35 +695,35 @@ struct drm_xe_ext_set_property {
>  
>  /**
>   * struct drm_xe_vm_create - Input of &DRM_IOCTL_XE_VM_CREATE
> + *
> + * The @flags can be:
> + *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> + *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM accepts
> + *    exec submissions to its exec_queues that don't have an upper time
> + *    limit on the job execution time. But exec submissions to these
> + *    don't allow any of the flags DRM_XE_SYNC_FLAG_SYNCOBJ,
> + *    DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ, DRM_XE_SYNC_FLAG_DMA_BUF,
> + *    used as out-syncobjs, that is, together with DRM_XE_SYNC_FLAG_SIGNAL.
> + *    LR VMs can be created in recoverable page-fault mode using
> + *    DRM_XE_VM_CREATE_FLAG_FAULT_MODE, if the device supports it.
> + *    If that flag is omitted, the UMD can not rely on the slightly
> + *    different per-VM overcommit semantics that are enabled by
> + *    DRM_XE_VM_CREATE_FLAG_FAULT_MODE (see below), but KMD may
> + *    still enable recoverable pagefaults if supported by the device.
> + *  - %DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT
> + *  - %DRM_XE_VM_CREATE_FLAG_FAULT_MODE - Requires also
> + *    DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated on
> + *    demand when accessed, and also allows per-VM overcommit of memory.
> + *    The xe driver internally uses recoverable pagefaults to implement
> + *    this.
>   */
>  struct drm_xe_vm_create {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
>  #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
> -	/*
> -	 * An LR, or Long Running VM accepts exec submissions
> -	 * to its exec_queues that don't have an upper time limit on
> -	 * the job execution time. But exec submissions to these
> -	 * don't allow any of the flags DRM_XE_SYNC_FLAG_SYNCOBJ,
> -	 * DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ, DRM_XE_SYNC_FLAG_DMA_BUF,
> -	 * used as out-syncobjs, that is, together with DRM_XE_SYNC_FLAG_SIGNAL.
> -	 * LR VMs can be created in recoverable page-fault mode using
> -	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE, if the device supports it.
> -	 * If that flag is omitted, the UMD can not rely on the slightly
> -	 * different per-VM overcommit semantics that are enabled by
> -	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE (see below), but KMD may
> -	 * still enable recoverable pagefaults if supported by the device.
> -	 */
>  #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
>  #define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
> -	/*
> -	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
> -	 * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated
> -	 * on demand when accessed, and also allows per-VM overcommit of memory.
> -	 * The xe driver internally uses recoverable pagefaults to implement
> -	 * this.
> -	 */
>  #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
>  	/** @flags: Flags */
>  	__u32 flags;
> @@ -739,7 +750,27 @@ struct drm_xe_vm_destroy {
>  };
>  
>  /**
> - * struct drm_xe_vm_bind_op
> + * struct drm_xe_vm_bind_op - run bind operations
> + *
> + * The @op can be:
> + *  - %DRM_XE_VM_BIND_OP_MAP
> + *  - %DRM_XE_VM_BIND_OP_UNMAP
> + *  - %DRM_XE_VM_BIND_OP_MAP_USERPTR
> + *  - %DRM_XE_VM_BIND_OP_UNMAP_ALL
> + *  - %DRM_XE_VM_BIND_OP_PREFETCH
> + *
> + * and the @flags can be:
> + *  - %DRM_XE_VM_BIND_FLAG_READONLY
> + *  - %DRM_XE_VM_BIND_FLAG_ASYNC
> + *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
> + *    MAP operation immediately rather than deferring the MAP to the page
> + *    fault handler.
> + *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
> + *    tables are setup with a special bit which indicates writes are
> + *    dropped and all reads return zero. In the future, the NULL flags
> + *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
> + *    handle MBZ, and the BO offset MBZ. This flag is intended to
> + *    implement VK sparse bindings.
>   */
>  struct drm_xe_vm_bind_op {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -828,18 +859,7 @@ struct drm_xe_vm_bind_op {
>  
>  #define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
>  #define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
> -	/*
> -	 * Valid on a faulting VM only, do the MAP operation immediately rather
> -	 * than deferring the MAP to the page fault handler.
> -	 */
>  #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
> -	/*
> -	 * When the NULL flag is set, the page tables are setup with a special
> -	 * bit which indicates writes are dropped and all reads return zero.  In
> -	 * the future, the NULL flags will only be valid for DRM_XE_VM_BIND_OP_MAP
> -	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
> -	 * intended to implement VK sparse bindings.
> -	 */
>  #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 3)
>  	/** @flags: Bind flags */
>  	__u32 flags;
> @@ -966,6 +986,9 @@ struct drm_xe_exec_queue_create {
>  
>  /**
>   * struct drm_xe_exec_queue_get_property - Input of &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
> + *
> + * The @property can be:
> + *  - %DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN
>   */
>  struct drm_xe_exec_queue_get_property {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -1000,7 +1023,15 @@ struct drm_xe_exec_queue_destroy {
>  };
>  
>  /**
> - * struct drm_xe_sync
> + * struct drm_xe_sync - sync object
> + *
> + * The @type can be:
> + *  - %DRM_XE_SYNC_TYPE_SYNCOBJ
> + *  - %DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ
> + *  - %DRM_XE_SYNC_TYPE_USER_FENCE
> + *
> + * and the @flags can be:
> + *  - %DRM_XE_SYNC_FLAG_SIGNAL
>   */
>  struct drm_xe_sync {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -1082,6 +1113,24 @@ struct drm_xe_exec {
>   *	(*addr & MASK) OP (VALUE & MASK)
>   *
>   * Returns to user on user fence completion or timeout.
> + *
> + * The @op can be:
> + *  - %DRM_XE_UFENCE_WAIT_OP_EQ
> + *  - %DRM_XE_UFENCE_WAIT_OP_NEQ
> + *  - %DRM_XE_UFENCE_WAIT_OP_GT
> + *  - %DRM_XE_UFENCE_WAIT_OP_GTE
> + *  - %DRM_XE_UFENCE_WAIT_OP_LT
> + *  - %DRM_XE_UFENCE_WAIT_OP_LTE
> + *
> + * and the @flags can be:
> + *  - %DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
> + *  - %DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
> + *
> + * The @mask values below can be used:
> + *  - %DRM_XE_UFENCE_WAIT_MASK_U8
> + *  - %DRM_XE_UFENCE_WAIT_MASK_U16
> + *  - %DRM_XE_UFENCE_WAIT_MASK_U32
> + *  - %DRM_XE_UFENCE_WAIT_MASK_U64

this will conflict with the removal you recently did.
But with the conclict solved by simply removing from this patch as well,
feel free to use:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>   */
>  struct drm_xe_wait_user_fence {
>  	/** @extensions: Pointer to the first extension struct, if any */
> -- 
> 2.34.1
> 
