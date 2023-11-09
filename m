Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AC9C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 21:57:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3F810E92E;
	Thu,  9 Nov 2023 21:57:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5673E10E958
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 21:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699567064; x=1731103064;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r/W/U30pMdXl62t5RlkAHiiqtyX1ckYsTMasiJY1Kes=;
 b=AWBsDpAzwGua4vH+S0pI3G1XnY9O8+EnfTuO9A8wcxURAUIrWs4fXwZM
 90lm4Ai/mcgRhFjqSKspnx51irTBfAA7RIVpDRuAgkcWqap5vpDzxOxwB
 QOlEe4YUKn7+26m66SF7Fn7NNQDIbNsfkSR+r9ZS0P8hhv/rmUwa9Wkxs
 ZWwJplUWA3RcZofmuvRzRWn3UO2B14RWiV51RcluW5ux6ygUKrgcj7+Nc
 umz4NmsvNRDfNJ5SGmRcjP4bBqel7FQX9uTrVEGnUhy0MZQptkGuuXKwE
 OPsr2D5HDKmFEWjp1hLHz6Ft96t/l5AygVKvzIekkoa98xiz6ot/p6p1B g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="387242949"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="387242949"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 13:57:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="854204012"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="854204012"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 13:57:37 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 13:57:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 13:57:36 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 13:57:36 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 13:57:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBiQ+j+Ka0C2KXe8d2U8TsySI/+3yrLDrH1Z07Jim+mkxMG/yruBVqWlWyScM1GJs6J5lUk39RUVWfLNgeCnXHAZJpo1W/WM3/P1mJjBeQkJ53ZA2W5oRskr/zpz0c8vxVBA2v4VHg9GIxynlxYuPHmt62pZVJak2rpaE44mP92QT2lO7wzWjTVSMRNEGUt24S3nMHQTC8gyPP4DtvCYICB3YgEAfpG9YibljCm0TVsESCAna99M2yj7zSG2S5jcVhWsi6nAj2T0+qFANtYoL1nf3YTjU9WXgXBdkuj0ADO1L6KKKevhZdAQcib2MOaMpQOgB1SdRsjQJquvEV98mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdP8RksnTJ6d4jffC02REliJrBRI3jlb2VURQp+cE0I=;
 b=X+AuvavS+XT3FH/Zxm7jwsNPE0UxGRxRKtn2tkPbOhd9VUgYISAu+7u94ZYUckgjMZxcNS++MpeovfJ5Use3b/aOHOIktZB11vqI2qymm42eEkwnqKf1nejUTE6PyTa2QqzpUVrmbdsDHW1AMxbXWkuKqfoRzkao9sTPkEzuctzxaJuw6x/y4buDmXJd/iWDmyavr3Bb6yriF7hxURCwJSCZzc2E1Q44oTDdTpgQkreZwB6qVVVdhE79i1qzvENgn55PPibB3pq8pBCmgCEu+7cXdc+RlcG9DiMi+YaNHgHzZn6guuJnH2tnQ+e0WNRfuZaVdJaFoLH2wxioNpa/YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4912.namprd11.prod.outlook.com (2603:10b6:a03:2ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 21:57:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 21:57:32 +0000
Date: Thu, 9 Nov 2023 14:56:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZUzzJx4xofkupowv@DUT025-TGLU.fm.intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-31-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231103143456.7-31-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0085.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4912:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b17c0eb-7066-4b6a-402b-08dbe16edfa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0yR4VfCze/mkNC+tTLgvqTWAIC5u2EKYyJxnhIpL6nuLGat4PrATHIpp37oNjjF/qtmP7sRTty3tWQe/mMG/3afI8VR9JbeT7V+1QmSGJL/LBVKKubaMOMMyE5SYOR4V5koosUb+/tyaWdq3cobg923Fe/b+vv9Kw5CekmE+b63mO4SlD70jARP1eW0CccnPcKQUIIyuz963y/OvzGLyx9EZ9TsTYR7ldtK0Mhaq2f6fCZHh3hmACjriNFOFjgt4D10vrV2osu8y93eGt7ktYW97IAIGmvhLWEuusRo84leRPc7ItoR1e0lVHhTbo9oy9DUKsjW/TfG69dM+mFJFYRQtWP0C9rEDhejv+ScjMIoGspjH+xbEQ/gAh5/zAjHqeKQnxdkVWQi1zaydgRmRGxgzgnb/nYoDHPWhWQUxgwNaL7fK7MGkf4OkdPZt403RZMqUT82CMWBvfT4hkA8gbzGP6PhWPtCUiCulnCfyGE4uTU9RN4T9UCahCxzZhweAiv0Z+uXqsKnaJkri1fTQRjWBIEGYdshy8X0zRq7HSPJIUFsnDdOc6q11LyX0ctr0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(2906002)(5660300002)(44832011)(6512007)(41300700001)(4326008)(316002)(6486002)(107886003)(8936002)(6862004)(8676002)(82960400001)(86362001)(38100700002)(66556008)(26005)(6636002)(83380400001)(66946007)(66476007)(478600001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QY+J2d15uNm8CdxJZnbEXfqwEYkxCIsabe51B2yUkwCQzqozoqS0C29YpfuE?=
 =?us-ascii?Q?KdnZE3BRSOmkB8OQOK8Yta0E8Zho5/db/74HuxwAGxHsm22MnG93GIhMeA+H?=
 =?us-ascii?Q?1nfW4CMC3tMW7ouAapAYs3FNldm/Ak20EwS3Yca4NoqqhUVpAbn7PFg0YJCu?=
 =?us-ascii?Q?ZCFbrWRBmzbxTw30OdItYYQE3EPytQyTwYnQpDs+E+B59miQzdyJ/TCtJXsP?=
 =?us-ascii?Q?PwngIwwCfP/9skAUGUbxN1aZhT0ff7FlqOOzGMiDnQUtty+cyAk0CmiVPoQG?=
 =?us-ascii?Q?q2nFee0AZczkShAKUEhLgD127289kq1xJKtrISJUtBBwShh6WgMLGyHxDYNe?=
 =?us-ascii?Q?JJUt9GySV0dcv1lA7h/Co8pmDA2zMfA4RiKr00W0lWmpCifu6Q11I7vullXC?=
 =?us-ascii?Q?IhUxBwn4kwwDLWCBGZubiUY9E1JII8jWOPC0Z8FjqzsyYJyhNWUX+xr73tsR?=
 =?us-ascii?Q?knt7D4v2ly/NTuxG99qKEMimRYYhyKzvEAjO4xp7v2cwNhrGlT7GCCrZUKRs?=
 =?us-ascii?Q?FC+F9PrT8bNSwp7d7eNIQkVUwCFq/OI72H/JyqEtn+jZx6iHYXUpCQKn5OYF?=
 =?us-ascii?Q?cxHn/H0JcFYn4e8ELiAALG0V6S/+u9rOPAayo87JmFA9HSQ3MJ4/gH29ck5b?=
 =?us-ascii?Q?jiolmQhZ+f+vxw3G+l6w437VpbtR2fmEa015aJm5gq7p3Seoz4/UbHyiIsP7?=
 =?us-ascii?Q?cxVAiEWGxAQnYHW/pgbn/RRQ2rCEhJngiVKanr/sLiT1pjoFNErC+dpm1IjG?=
 =?us-ascii?Q?tuQX+1xpIz/qTiYhOuRa9Rc4gNkmnEDF9XTP8T5G2C29rD7uJLj/OM1Oq/eJ?=
 =?us-ascii?Q?tP1ElxyJwaiaieqEG0R+VcAi2eEgzvvsbxa8kdKhzmgO9f6p3pbsmawwdoH6?=
 =?us-ascii?Q?1Jh3w9CLwXmnMFhA3m8yg0UKyf1xC2p45xh4/Nu0j5LdZpuaSxm+QdhLxzx1?=
 =?us-ascii?Q?RFEs9U2tA/rRL6Ez/ylEJXnCNQkBvGSOkTHbN3Hgs4n6p2LqZ7ALGFS2idJE?=
 =?us-ascii?Q?+NuVPSVgnaX0CLmnOiAKHq5bF3Tn11THDsxFw4eiUunSxM/uw5LB1EwgnXc9?=
 =?us-ascii?Q?VP95ish6zqGh/8XZgTlwKbgYMjtYOfyO1vjaT8nYbAJXnXQv9oSGluS+8tnp?=
 =?us-ascii?Q?PRqbpyfgOLgQpzanK2oIKFkkazVh0woWdWi1cOSNCRgK6yiXBJNNUKvLaJZe?=
 =?us-ascii?Q?gywfbqHWrT1ff2+uEZLEEC1pli4zaTMJmPXwOrGO1CQTGd7TZOGg3fIHu30z?=
 =?us-ascii?Q?MCJPmybxOgYcW7jRRX5sWuTX6LrBJxvjjwnq1bqDiA6DwUO/G21I98kkKRB5?=
 =?us-ascii?Q?mYZ3HhXKgRHWW8TQD3j4bnaECmPuCw/snnk1pDRVFzRzo2Dvu58FQaXLAamb?=
 =?us-ascii?Q?y2ecMNAH0iIYZVdcCB6nVQJcu5gAPfA4A9XgxxnU014+Po+UyV0M9z+HV1Fv?=
 =?us-ascii?Q?lFzRFiMm6Xd4hY3imI+YaHZHaxRStkEplfbaRos/7EGeHSlf20SFQd7HKjwA?=
 =?us-ascii?Q?YqON4PRqdq/nPa9tfjslWw+op90lomVc7SHmUl2zq9XriKK9y6kwY3HhNsgr?=
 =?us-ascii?Q?bAianNe90tT8z7dxE5Nf5N5ifuSqP2ntW1wloXI0ayI7Lj9ocNAaEJHFPxqr?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b17c0eb-7066-4b6a-402b-08dbe16edfa8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 21:57:31.9672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7KoC5WxWPejmAGwBMyfFE8PQHkuCZS76wyUXxn+GsPxwEWx1nTjOEDLIt0zAxlDqUVmvVPpecC9JUS+fXIZcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4912
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 30/50] drm/xe/uapi: Standardize the FLAG
 naming and assignment
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 03, 2023 at 02:34:36PM +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Only cosmetic things. No functional change on this patch.
> Define every flag with (1 << n) and use singular FLAG name.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c |  2 +-
>  include/uapi/drm/xe_drm.h     | 20 ++++++++++----------
>  2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index ad587bc0a0d4..aa5743e2e4d0 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -332,7 +332,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  		xe->info.devid | (xe->info.revid << 16);
>  	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
> -			DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
>  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 4c7ee3828428..7d854c368336 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -354,7 +354,7 @@ struct drm_xe_query_mem_regions {
>   *  - %DRM_XE_QUERY_CONFIG_FLAGS - Flags describing the device
>   *    configuration, see list below
>   *
> - *    - %DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM - Flag is set if the device
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>   *      has usable VRAM
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>   *    required by this device, typically SZ_4K or SZ_64K
> @@ -368,7 +368,7 @@ struct drm_xe_query_config {
>  
>  #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID		0
>  #define DRM_XE_QUERY_CONFIG_FLAGS			1
> -	#define DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM	(0x1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>  	/*
>  	 * DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - This returns the
>  	 * maximum value of the &min_page_size across all memory regions
> @@ -752,10 +752,10 @@ struct drm_xe_vm_create {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -#define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(0x1 << 0)
> -#define DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE	(0x1 << 1)
> -#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(0x1 << 2)
> -#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(0x1 << 3)
> +#define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
> +#define DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE	(1 << 1)
> +#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
> +#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
>  	/** @flags: Flags */
>  	__u32 flags;
>  
> @@ -849,10 +849,10 @@ struct drm_xe_vm_bind_op {
>  	/** @op: Bind operation to perform */
>  	__u32 op;
>  
> -#define DRM_XE_VM_BIND_FLAG_READONLY	(0x1 << 0)
> -#define DRM_XE_VM_BIND_FLAG_ASYNC	(0x1 << 1)
> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 2)
> -#define DRM_XE_VM_BIND_FLAG_NULL	(0x1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> +#define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
> +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
> +#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 3)
>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> -- 
> 2.34.1
> 
