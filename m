Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F8EC54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 16:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A90510E9BD;
	Mon, 25 Mar 2024 16:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FtSrWXhQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD5910E9BD
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 16:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711385370; x=1742921370;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lC44Scf79M5lkZjZFCRF+a96neOVFvwItZrMSQwu8T4=;
 b=FtSrWXhQq+IfOx/7NCth4WMHVOo4XyQo584eSz2ab4FLavdZsbaXu7U3
 92jD8rknTV/Rt9jBQN9jHJ7lWgLUUt1oQEZ1IIPeudeFuIgrr+ve4mXnc
 N5AGPS4o4nSmFjjXH2oSBgeyT9p6zwuAA0kzj5bjaYlOZqn5dzVGz7pgu
 V8ie+SjGbUKF1/pm/RDLdy2rMjXerq2AjFOsaoDE6Dh1La5PnEAfEqFUT
 SpFMl/PP7xvo9rEhegazFdNdacLCAZnmlYy3mdInoMdP/u1Q5EhXcraju
 0T3ZsXXngVDOpvk1qR/Ot1cLtEO6gUVJ8HjifHbPf//aPge2DuaCcJ3Mq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6265411"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6265411"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 09:49:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="46669498"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 09:49:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 09:49:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 09:49:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 09:49:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 09:49:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mw/mr/RPI738Y8rGVrGZ7yoFHeIhkrhI5IJ7Jt6zb/RgCW2xdO4tp4LWul6DYBI4cykCNDlK/N1cBVzkDJ8Qc02xcaYUEKEXeIe+mMAozAqa7Z3fCfWSgMyHIFyf+32oY7cEldoUIe9vL7vT5yEBnx/Sez58JUj/plu07Zw4HlmLGUu+VbEtgJeGWPUGM3tlH8C6AY5n2P/W5QfJlXYQMXWmuWiPAwFrDxZaaNwPuR5MUzbqwqVHSZqq4rpjn65/ecLu0PjumC9B081YNMavz8+r1USuU35g1+LAy4DZhbwIxbSiaexfA0DcoRGKl4SiJfDIenksA/wuw5/q2glFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ck7SPQ0OS8ov2ZCN8AFzSiR5SKs6FOmaa3u6V0sjtW0=;
 b=boojPzsEWOUXJbeqEvRL2q8kTZsfqLlu+VdXmft9lPV2VP8RbxBxY3vuDX8ERzh20SZyWbFbltn+63doXVnxTemh90vHMBlGtZncCSGPOmFGJx7jLdC2aoFshmV+S0/9eE1nB1hqTO1tu7kLEE79kF23OLFZiZsN+aRIL5xWkezyAqOuQSpaCjTzNd6qMIej4m6yV86ToHVraLIkno27E3OVg7NbDvPlHAcvimqA7tU2iQK5co6+vG7jvyD1NWP3GW5EZJLHCyFWMdRYYVqTmPSOl1ehSkKxNCnRx53T8A4t5frVqWvIiqWyw52J5LvQdGrs6hnebBK0NufaMMFTbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6926.namprd11.prod.outlook.com (2603:10b6:510:226::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Mon, 25 Mar
 2024 16:49:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 16:49:25 +0000
Date: Mon, 25 Mar 2024 09:49:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/gsc: Implement WA 14018094691
Message-ID: <20240325164912.GW718896@mdroper-desk1.amr.corp.intel.com>
References: <20240320211819.211624-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240320211819.211624-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY3PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:217::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 93b2316d-7e82-4f93-0c36-08dc4ceb8751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BNWR5P19ZmmjBk43MrsXg6i91atVqIc7bU2ZLMXEpiB5jrITxGjS+oHb73XZskYfw8Z9LzNQrHZEfJaJykRYsHTe9A8q2osddovX1smXq4nYoOxSfKv7aP3ZnuKpBLYJ4wk7s5QT/LUn7l5zmTUbhutR4y1TqAHWj1HNkOlMCXSr4ePwFC0ymmucLYzdognXek31By4qzjwLURVgQm0fyRVADpHyjo9EFzDxGlakZbKCMUerP/kaNA3ixGS5KStnv6RT5WW/OSjnsELNU8mOYp0zFNYcYN9U33CRQSUlZqc1wYq5JHcQOW6duoeBHfWEsCml4EBxbnTUiNmeamesGAz6cbZYJo2/YcwqKQNSRY9aTdKgKfSCleT0X+eGLQMbbLfbO8uuOZyf14nj2LXf71UibdQUh6GaLubHF0Nb9nPyVDc/aGmkl2CC+CG0/McrOarhRh5eFcUQudgLGzQUfAqT4ZSrUZzgQi1ya2VTYEteA+0ZpfjYNUBJaOnd6qX4fcDPHUexWLHx95BBMrBVzbLRh/FvOMjTRCL1hO1ej8iQ6AYtqV03eTLl0Er0tAu+0hstIQKAKjDDiZaH09jMBj/0+0jg5rZ78jBUEomfaxQ7bUAA7Dw4AdvBU2ip5sxORFm6kocJoLqt306ehBhhhihcPRUW/W4Y2XoWdDiqgxw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a7GDZcxhT7OVAkt8G5GQe3e/7pEHAxV1lJFDGziI19Xiv2HjFF/Pr3+Y0LHC?=
 =?us-ascii?Q?76QmxtZ7OUM9PsWXjwTCNUbyxL4In+Cj8FYpgaz1ADIko89BRfGhr2By6hi3?=
 =?us-ascii?Q?TxXMfTkhVc44MH923K1U5QH2MgPYNFQ423vglwnOmrGswXdQUGsbdN7gQHKX?=
 =?us-ascii?Q?qmyW3bgnsym1nJGjrZbVX6kCcsPgLpaMBolKBggkhZHPYV42Jv5rz943rl5a?=
 =?us-ascii?Q?7WL3mKY9ZozV9TU9KMQB3WP/so82ACH45HzqFO6N5gvvlUxsVx8YwwG8rIkG?=
 =?us-ascii?Q?xuNRh9bDgWbZnhGGO7itbxZF/WD9ULKi/dqDJRUHut4hYgmOgKGXnK4NF+k/?=
 =?us-ascii?Q?X+0GcreuX4DR+NDptfyQBaG32sem5WA4XWD1dQDzc5hqP/aszCdt0bp4sSU9?=
 =?us-ascii?Q?tC6qq1L35xr9TVwNwUksyQ6RT6yK8GHAsUom+t6ys0GlnSuaJRbYPj+qWadw?=
 =?us-ascii?Q?j6rNbQoyyvPEV4G5C/41VcigDz3tQw3UOKgn8rOM1P/a948P+tTDZ+r70sW3?=
 =?us-ascii?Q?VKN0BvYEXtzp5Mg3GSkBgyjxKu+4w4qqkJCBGWkJIVumi37jibpaKhkXHd+d?=
 =?us-ascii?Q?9Bz7o0gU3j/8m+/F3z9WRSBVvb9thzqIP6VouARAnLYTFmRNtkOgljSji0YG?=
 =?us-ascii?Q?oJgtuQc1UEKALn2U0y85KGaanGPbmHjq8CeruinCrvM5m9wY21NsINPXqpz8?=
 =?us-ascii?Q?oyjaWEZQpobBjxMtQjT62TcTPdNJR870VB5ZIg7UOoo/BUFvubuUEHYYmkAd?=
 =?us-ascii?Q?F4ELq9oPxkgIddzNpiCA2iJx8FD8lwR3Ke+Cml+eyrTxFOFrEnFHlTLYRo5G?=
 =?us-ascii?Q?K664rkcccsc3m0yRGEe7aU/FivThT8HKcBTwOrmRqvxGKVUiCvjAaEWCkWZv?=
 =?us-ascii?Q?KevYfI5CP2d5vvdMT2Mm74ONEr0w48V70wRQwWrwQECJhLcngV2ut/aQ+PBR?=
 =?us-ascii?Q?yhmU7cuL2F/pM+S3Y2JpYibTNYBDIkc4k6w3QD3uNaYeQatyzq+6HWSRWdBK?=
 =?us-ascii?Q?raXk4RKbefOzEdMkdq8jMHLMgj8wrJPDuTYO6j6w8U09z24bxdd3bbMI/yCa?=
 =?us-ascii?Q?bBsiRTm7CrwZWrCh6v9K6iVXkN78fE+BIB8dp/W6q6l7pd7aHUykcpu2uLIT?=
 =?us-ascii?Q?xK10OW29Q3HXY6gfeu9fFiGEX9hueRlvxJNip+PnNYzSI//ApuiHOnvylC5j?=
 =?us-ascii?Q?SGRCFUyDNXllwvkzG1B50Qj6leStQBmpnIa8r2Db5kut2LDSG4vOjMIz+Jhu?=
 =?us-ascii?Q?1/xfA39yqtw2yVcLURTARa+xwHW/+aN8PYtzi/FFxu2eCOREzZ8+KY8cea+s?=
 =?us-ascii?Q?bvHkXcLwyyGheDqaeSmXSj1K+hkszWO5jYjT3PC0wC6jYtTbc10hHXn4zxJR?=
 =?us-ascii?Q?tuP7dYlAGuwEiPyjhY1QUgS0U9MwrIsqTLEQrDxnmFmDk2YsIhPD0g3WM8er?=
 =?us-ascii?Q?eNnoeukRFJpmMzz1+vVL37fUlm6inhTivNx06ZH1TtkKCombIcsO+dul/W+I?=
 =?us-ascii?Q?/lQ7/wNAEpBA30HmB9jh04SDoj9B96xETGVzdaEynkXOivkV126dqIHxMjnd?=
 =?us-ascii?Q?EAWVwAsSkNnZGAPgGKPqwkmHrCNNxdd20QibCDVhSrHJ2xH5S0syRM57Ky+o?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b2316d-7e82-4f93-0c36-08dc4ceb8751
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 16:49:25.3083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RB8djU1kc3cvedOyMKbKFbZ90FYzAFGQFBifk3Z5botHQ9Gy9y1NK6e5DnJpZuTorU48A7Y23mU0HYlp8+TFc7JiAbPu+n1qYYrwcfCQoRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6926
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

On Wed, Mar 20, 2024 at 02:18:19PM -0700, Daniele Ceraolo Spurio wrote:
> The WA states that we need to keep the primary GT powered up during GSC
> load to allow the GSC FW to access its registers. We also need to make
> sure that one of the registers is locked before starting the load.
> 
> Bspec: 55928
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
>  drivers/gpu/drm/xe/xe_gsc.c          | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
>  3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 95969935f58b..713e4d590fc0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -373,6 +373,9 @@
>  #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
>  #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
>  
> +#define EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK	XE_REG_MCR(0xe534)
> +#define   EU_SYSTOLIC_LIC_THROTTLE_CTL_LOCK_BIT	REG_BIT(31)

It's not obvious from the context here, but I think this should be
slightly higher in the file, before the XEHP_HDC_CHICKEN0 definition.

Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +
>  #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
>  #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
>  #define   TGM_WRITE_EOM_FORCE			REG_BIT(17)
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 09f6e7899921..c9a139d45095 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -17,6 +17,7 @@
>  #include "xe_gsc_proxy.h"
>  #include "xe_gsc_submit.h"
>  #include "xe_gt.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
>  #include "xe_huc.h"
>  #include "xe_map.h"
> @@ -252,9 +253,30 @@ static int gsc_upload(struct xe_gsc *gsc)
>  static int gsc_upload_and_init(struct xe_gsc *gsc)
>  {
>  	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_tile *tile = gt_to_tile(gt);
>  	int ret;
>  
> +	if (XE_WA(gt, 14018094691)) {
> +		ret = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
> +
> +		/*
> +		 * If the forcewake fails we want to keep going, because the worst
> +		 * case outcome in failing to apply the WA is that PXP won't work,
> +		 * which is not fatal. We still throw a warning so the issue is
> +		 * seen if it happens.
> +		 */
> +		xe_gt_WARN_ON(tile->primary_gt, ret);
> +
> +		xe_gt_mcr_multicast_write(tile->primary_gt,
> +					  EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK,
> +					  EU_SYSTOLIC_LIC_THROTTLE_CTL_LOCK_BIT);
> +	}
> +
>  	ret = gsc_upload(gsc);
> +
> +	if (XE_WA(gt, 14018094691))
> +		xe_force_wake_put(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
> +
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 48cdba1cbf95..68600cdead84 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -19,3 +19,4 @@
>  		GRAPHICS_VERSION_RANGE(1270, 1274)
>  		MEDIA_VERSION(1300)
>  		PLATFORM(DG2)
> +14018094691	GRAPHICS_VERSION(2004)
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
