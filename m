Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598EAC5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 22:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE85C10F05E;
	Wed, 12 Aug 2026 22:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FE7xCyJM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6726710F05E
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 22:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786573734; x=1818109734;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lvs7j5YweioS/PfZpQIRSdRlioihKioMnK7WDYTy+aQ=;
 b=FE7xCyJM4PqFmKKP+8pKwfHP5mpujOnIwtWvtAqtDbBzLs6yM84KIaAE
 pwz1QMaoAGG3HlxCWFMo9pxG/bpUWGoQKVejsvnEdJyIFvJNUJo7loid0
 eWgfCjB+ui6DUlcx7HPUV5owJgLsLiRQV2jEt/kvGqjQq4yb8+8HI6/gY
 ppYbJymSvkeT7s/S7HNUb39mlS1DEJ6UnAhtONJ9pzGj/KOjTBBLT91By
 MY1aGinMvZPd5rTV0b+AyKRjjFJ6N1eB8qPGqc1u4tOzqaJ4GtqNmn7Nt
 gDIwBH3Hkm1vuTikjweRs3FhgT4nTxrIwOKrDujR8Sn1nQyBtdX7y8YEn w==;
X-CSE-ConnectionGUID: 2YRrnWgfQTSB0iV1QNOIyA==
X-CSE-MsgGUID: 72ygYpLxQf2GyFxXbJg57Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87161732"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="87161732"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 15:28:54 -0700
X-CSE-ConnectionGUID: AwIaOpRKQs2WqjxZwuehGA==
X-CSE-MsgGUID: 2g/pTo+dR6mlf84V1nfiQQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 15:28:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 15:28:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 15:28:53 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 15:28:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wu5J+7G1lqPV++rnbZtI1bwCBkRD321oW30B1M7eS9pAXFbWN2/y0qg1kf4XOC7zm3EbcErqNtXQKFNrAIwR3E585J2vU9/6GqbZtJXF8PvibIVtnhaoLifRDiTjNemZAUthfwKvvXRYQY1cLnb2e3fJyrWm/PgH/VNuS4Ahq85+GnpWEZkVOjOOVtyErBWe+/bWi3v0Z8JHZiQlTsBIxpaCvUP0laA0n3gW5wTUwm4WHHlfQHCh3/kuhEHZYVTnku3Nyxm/4uygbtt7sAYRlzcPRGEjMlSU4ZjbAXUcFtg7AYBwZu6Fmv/ZnEQ5Ue6mpZsrbvbJcF57JtHb063Y3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4B3jeBQtVGuf/HVRBv8g3CJ+imNj5Yd9P61m+jq1Ps=;
 b=kZeE2q+XmwghSTfUlJ064rM5rifsfWLsIUE/d391xIxKlW1Iuk3QGXXLFkwZgQIjeYkgwz9BJhj7bD5sGAEgLlw4tS9WRfTC0KpgNjyom9V2PvJFsDmuQZst6lFqEYS525VXKOKXgsp1LUcSNOA3Lj/5fLfL0EU+Luzqj2qGBa0h22pvjcnoQOLfB5ERpPzIZpENV77MwIddJ2xDf//OjAhuDB15QjpYadL2ROoTLK20ThRkQQg+whg0vmfe/nZRW1cEtgq+NAaFKRBejz/pwmDjyL0dHMnPcPYKjY8LbJUVM9TWG2/UYYCLrFXzzG4Gzk5+gjbco/aRCorfJF5tNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by BL3PR11MB6506.namprd11.prod.outlook.com (2603:10b6:208:38d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 22:28:50 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 22:28:50 +0000
Date: Wed, 12 Aug 2026 18:28:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v4 24/32] drm/xe: Report 'device wedged' errors using SIGID
Message-ID: <anzzn66MTWkMR24U@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-25-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260812191450.11690-25-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0226.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::21) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|BL3PR11MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd46e8d-5885-4eba-bc9f-08def8c11551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|5023799004|11063799006|4143699003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: iJC8EjtTdFMkVmVy/SfJp1A+Fjs60C5NXRB8BOT1x7k3I9ma7UooMxHBSb/qaC3lGmCe23DxGM40hqRx0Uzpy/svDH1HTQhaaNNK1ern7LOgfjCrfOQgyugr/nV/VCJEAQmMJ0H4V4WzGws8/JV3vetpl6RBkDBNR7evmTefFlt5gxrBcvb8mZCKvp01/HA1/xE/WrQWD9rLmTypJ/OHbq/IAXdzVYp+nisYdBv+bBKgp6vvy9CtzIQAcR3zgi5dmaa7XkwchkVLeYxvLM/6bstCo7uD+++LYt+1hjr+2uEQjVBZF7P5HoIPE0PsXpK2kE1yI0dLBXNCnA51GZC/phLh3DnmnYLXn7hCUx8kz+qRWpVfQ+cGfi0dXpx4r+dKU3+e7eQIACTfI1J33nxCcqdIV0j2KQdm1AfRqwllGJDMgKa5QhOfr+lCSZws+4Y057iOcROj9/ANqZe7lHSfu+r5fH6MWk1eBM0ILSP6dchrUyCv9NtbHHya3aeHDobQ0snibuEE5F8e3OhzI5bYul5bBXZXjVbZz8oa+C3juBEMZE6WCJn0yxukDfwaXiT1GAgHLy+SU4ePTUEJGErLCMvMYGY/9Sjb1GBiTq2VyDk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3YgsdBHa/CWWT+K6cOPj+sIVOMGR28jtty9H70GbhCZK/qnamGAbUGEBMCzL?=
 =?us-ascii?Q?5TZ+ojs9G6CimIgpqyccrk1RgPcTI5rGF3T1VfZ3affaQfJtHe+EnN31UcNc?=
 =?us-ascii?Q?N9mgP2bTbOChnG4qsGfkUUCs0CFBsAaJYo6sR7iAtpG10U8TBF0VIQvYqMhe?=
 =?us-ascii?Q?6RcTPcp6ecjkQnxNdQtYxJGxERJOEthcy0pGDoYhxFzO2MA8p/2E0gindQ+h?=
 =?us-ascii?Q?hZxRVN9J44ic+9e1mlxrvY30RDBSjG77ymL6jlUXUna8+0dxnNz968ErvEBs?=
 =?us-ascii?Q?S4gQxZAJw14if2/H/wZ6QCuyHojpwa7TcHveWyMaXdhyLDIc0cZ62fQPQGGu?=
 =?us-ascii?Q?zSIeCfhDccOZ9Qajubseyx8d+dB6Kb507gPG06JIg4TQez28ev+hvNJBC3A3?=
 =?us-ascii?Q?1vdcEQCwgyslLCl0Lk67+iCrwazLlxU7XwxfgWsH1xDC+baa6HykiopPave+?=
 =?us-ascii?Q?MkfROjX0Hl7k8+L4cg4YX8eMCfMaMsmgHTzt4Fbd+6M8ZYeYM3AIp11TU7PL?=
 =?us-ascii?Q?WMDU1cOHxiHhHSuBwxurjEXZ2TpaZXRJDm5SJgINR2MLmzE5C8CRWKnLgccP?=
 =?us-ascii?Q?SZoLzAIXLU4mcFuWH7JtfwLmdxEsFEgCwmUbyaThaN1D54tN9A8Njjd3tVeD?=
 =?us-ascii?Q?SBVfdORyYlIPGn/aplMWLyJLVWkKHlet2lqJCdf4DyLhTEKQb84GCEagmh1N?=
 =?us-ascii?Q?vPjVQ6XlrLrLv3fxquoLH22ID1ggkivyepvfC75EGomqiRCOVaFy2sVeiLJT?=
 =?us-ascii?Q?DGlq1BW1I/AUo+HKnzd0ozuEM66QSKayjcRLQaqqc3EL6mIpy1aAw84kHjLY?=
 =?us-ascii?Q?R+PNWrKUeTGdq2t6OzjXw9DC6759WKRNINKkn1tjO/GfgEjwTjXek0H8uvBV?=
 =?us-ascii?Q?kxsob3nExmd1AA2e6BC2EZ5+NVADH2me3iBcwIl+knSMLZsNoAK+G//mf5x7?=
 =?us-ascii?Q?7g1l+Dm4joWhQquIrOuly2THfhOcRkOaw54A3Yohtdm+srCoKRPKGMVdC7dK?=
 =?us-ascii?Q?qrr73NsJ5cmohe/bVzzwhTBeCOij/goP4YeAMIEEE+dnx7SrygVt9uBba70z?=
 =?us-ascii?Q?/JWW8QZPApvkQIEBzb9HhR6WV8DNJ5cGPxKE4rQnqI7f3VS0kelo7eWymokp?=
 =?us-ascii?Q?wyE8FmjwgGR25aJryYGQ9bwgPZzdjQixL+U2vxQAqz5JWOiBMMF1rTYz/tVX?=
 =?us-ascii?Q?aMUoWJNBAZ9U5YfJ6wed2ovXzelP/T+ivRwX+IST9iOZh9+GmThna5YWgZE/?=
 =?us-ascii?Q?bunyZ6bXtU1IF/DPWj62FmqAJ98G1HZv115Zi0WkHjLqDjsI3qrVCfanNU8m?=
 =?us-ascii?Q?K2/nlE4wp4V8MyhCsvZgl7kkytdJJIIEzsi/66ojQgAhhm8e60Y3kzk+BOHe?=
 =?us-ascii?Q?Sql286nB3NwdimbFd+2ZIHRi5PXrsVInpLT04GeHuH0hbwtzofkuTzTsSjj4?=
 =?us-ascii?Q?IxppqAtlsGf3zJng5Cs3x5Cm/NMPArpGFV58JAJ3DnjOWGnroOyq3XSzQwu4?=
 =?us-ascii?Q?8Wv5PVQO/wxd3km6LBWwyanxQeOchJbZnbpGGX5W/hk4PT6VPaXdDXL/gKzq?=
 =?us-ascii?Q?e9/bqiyG87urUjpk5BhzKpVkrsvtfEnSzNAJ6V1BAj11Xn/wF4H9iXTV2Dum?=
 =?us-ascii?Q?ijp4txko6C7HwZj3FUPheiB3jWy3ZVF64u+/KcMS0a3R4ejiMuf77McPfZo9?=
 =?us-ascii?Q?1LM3ytyR9BEKTJPlxqZ06fb67jFUHqMfJnm+6fTAsw9+SReULNCtCf3gkyet?=
 =?us-ascii?Q?5dY1qZ3iJg=3D=3D?=
X-Exchange-RoutingPolicyChecked: nRTulcwygy04mJyoMydObMbFPdaKklnEcDdgUIw906P5R68oTd5IwB6AzwYiDmBHQVYjSZyhpQOvOvDPbbnwlJJqovxMgaYOFX2Crq6M5bk+t2DPn3bd86kTC8iCoskyBu0Y+zlSq/kGljauypv6KS65QLFaM5lVt5xFMnYJdgLoXPSG8EGGVRzTQfii1Rf2VVr3vj0BUXxg6FP2j1BFzQuCA5bH/kgqLAQwIcGXzy/Lm+MEa6v7uzcfn7oxsER+WO8pM4v0hFLF1l2re3YEiliQ/nFZTsUh6rVcccX47mY14FX1q+VvVDVCcXgaYkWYopHBoUlZaDp7GFytPrHBlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd46e8d-5885-4eba-bc9f-08def8c11551
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 22:28:50.5318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BhTWUnqMJrXIrqDN5gRCn7E30cw5IbmjRb2V7so2vRl1AvoFfavtcAI+BpOoR5fZFUuIZWJ6ecrokkhTWtKUWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6506
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

On Wed, Aug 12, 2026 at 09:14:40PM +0200, Michal Wajdeczko wrote:
> Report 'device wedged' error using xe_log_err_fatal() helper.
> Use -EIO as the error cause, as nothing else is provided here.
> The hints about the recovery method and bug filing are now
> separated as it only needs to be printed once.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 71111ad32465..74d566693dfd 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -48,6 +48,7 @@
>  #include "xe_i2c.h"
>  #include "xe_irq.h"
>  #include "xe_late_bind_fw.h"
> +#include "xe_log.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
>  #include "xe_nvm.h"
> @@ -1442,6 +1443,9 @@ void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
>  	xe->wedged.method = method;
>  }
>  
> +#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
> +#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"

From the old comments:

yes, let's keep these defines as is and where they are. No
need for changes.

> +
>  /**
>   * xe_device_declare_wedged - Declare device wedged
>   * @xe: xe device instance
> @@ -1473,12 +1477,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>  		xe->needs_flr_on_fini = true;
>  		xe_pm_runtime_get_noresume(xe);
> -		drm_err(&xe->drm,
> -			"CRITICAL: Xe has declared device %s as wedged.\n"
> -			"IOCTLs and executions are blocked.\n"
> -			"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
> -			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> -			dev_name(xe->drm.dev));
> +
> +		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> +		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> +			    "For recovery procedure, refer to %s\n"
> +			    "Please file a _new_ bug report at %s\n",
> +			    WEDGED_URL, XE_BUG_URL);

I like the idea of refactor the wedge functions to give a proper errno,
but definitely for a separate future thought.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  	}
>  
>  	for_each_gt(gt, xe, id)
> -- 
> 2.47.1
> 
