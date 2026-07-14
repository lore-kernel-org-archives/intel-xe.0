Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8616C44508
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 15:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9809110EDD9;
	Tue, 14 Jul 2026 15:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2d0ZQqg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B7610EDC5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 15:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784043933; x=1815579933;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=er5pj5xyGBh2T9mRX4wxgn1pPnlbHU89pNmIegWjfTA=;
 b=K2d0ZQqgpLF1/8Rdb88gXD+d/Eb9SCfbqOnPCE7OVi/sccsRy4joqHw0
 /OQtMP6NZu+oVn8erb/GfwaLt7aSGbFB76FMSs8NZR4NNImc3OhhK7KLn
 pBGWPEPbxz97baFKinrU9GZQTq0oFlqhWsgZsa3ozXccwvJ66TsH2luO7
 i5ahoEmO0aqww8lucE2e3UZ7I0PejD8bx7UU1tIAALvR8pU8hNoe1jQwH
 vdTlqkvFItQJ/50dvTZOENUWVDP8sGggFDOia5e+qMCmXNRrq1s+KNl0w
 oQe03AdrFC6sz1re084LfSS4DJUSiYmpKJBOu8MHgLiWGoy1kSHWQQK/M Q==;
X-CSE-ConnectionGUID: BCLmOO5TQgifyZY3nLsBfg==
X-CSE-MsgGUID: zTw+ZEevT3KnvVYpvW7IOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84690184"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84690184"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 08:45:33 -0700
X-CSE-ConnectionGUID: HrZWD/+xRMeeSYDIqfvFaA==
X-CSE-MsgGUID: TIy4A4wXQ1mptCAUcPKVYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="254771583"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 08:45:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 08:45:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 08:45:32 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.12)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 08:45:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuYWQoZKwOW8oNoq0AHwYSu+zI9xDTKyCBeCu31RjFK7mjnfBzYmVzx7Zpnx8+bojvsgKGnEUw2wwHGvkawkJZJjvM7q/CqcewgKvUP8E5HKd+oSVRpFjE+6lLvK1xRfQmSzXQA/ZmSOpCsuHK8mpC8QEmiyzs2Ea6CD4UbAvpvOyHI+cb787sYQSYScGjjtr4qKgxqXZF3MuXdLA2ZBJ6cIFvwP3ptDfHJza/AupWBZ6zVrYQxFbY8JuM/epMIz91LM0Xkms0rbdxQtJkExEbup9+dueqjLkICzZP5SmoHcvhSjjQiu6fLYAv5qm18+YTz5K8n7t0VVrb/vEo596w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gx1QHG6N1Eq/uZILcZn73fhTNpHkLquiu0CCj9+Hj5c=;
 b=FTohqiqCou2LKqrwedKBVytZx8YYkCLhM+k+89v15M13qKffE0OmqDbZ24AxoherKn2mP2YiF0Bvxhb6FsnX+JsXbRTkWmCSUh5e5GrIBMKLIqtKYmceqEX7P91S16IzFJSfxmaiQ98legMgNalBdj03B71f39MY/6GYmWfoi2ePHuvYFli7fHhegvX2hMx4cIsNlXDcZbA0eIF9UzQx0ZNCMSKBy1YdGfVMo5DVQEJGmppcibdImvBhnQUkERggkgZAEK/1x7R9Jn0W1NM3NG3xlSRRBqPAc0RX3WroTBcqNs0KCH1V1iBjiFl6WTYeL163whlBF6xtJVIvKq6tCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by PHXPR11MB9687.namprd11.prod.outlook.com (2603:10b6:510:3ca::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 15:45:30 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 15:45:30 +0000
Date: Tue, 14 Jul 2026 11:45:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe: Add debugfs for IA/GT bias
Message-ID: <alZZl0PIiDUG6G-M@intel.com>
References: <20260714004359.3905038-1-vinay.belgaumkar@intel.com>
 <20260714004359.3905038-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260714004359.3905038-3-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0163.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::18) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|PHXPR11MB9687:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ed74097-4367-4fe2-7e75-08dee1beeef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: uhEGfFWsP7PhfwpslC80PQoEMrL03w5v0ffkDmxzDtq0x1+6mHOjw9VgyIKPBp+TEUfsYX7jV1fVvjDgOfoneeMXUdtrJpp5hJTi+Ma30yz70DJojRMT075XKssAJW8KRC2TmI2blJ2TknyluxUvzErpWHJiT+lDzYUujCP5ZVbaqlCDkE+ITxRNYp9kRWj+zt28uBcxoHPfZMWC+pfooKqK/jh71DaIE0TGtBk82nCGW5IbR0E9lMFLSBUn056gyaqHf6N0zWOFCpLJ4A9VtvWtINP7skO297N9JwjC469AmswhcR6tVdoKGPSUovBTXrxXk5BYvgp1VV+7v9EzKOVBlHNYA4SMJ3nDRPNqYxMk+kch1kiDRCexPFfpt7lpNPpaBhbOIkDqEE8kyK7l9Vezn9Hd9SUywyL9+AMVHYakInXYVEvwAjFxK5OlJoPm/iSLQzdUsl7KZyvPnEwcwhGHUpKJf/Jj3AojSyQgfSNEbhTfvDLcPXZLvgjpycIsPc/DoJJZo/+m8mMXCfyAV8jhUP+WoyYY1srcloElVnH0An8zLMGSt7edjpRrmCGv7TnPMl2jE0zsbzslu1oKz53GnlXu5C5j0Q+t/ZphXg+G8QAQcyyN+l3tD7+EXHTX+04K81eQUrJ94T6csZHMTLUaVxSFnM7XTXZ4nav8qns=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BlCtCXQ3nwVFNq+1PnaVT9fPFZz5xB6g/r0M7KgWid4B5uyTgvh3mfSsXxwd?=
 =?us-ascii?Q?LhTy17MU8qF57O1wZWSKmJQ030VD5uti6PaZrNN70Gk84ZfhsJKG5l6P32VU?=
 =?us-ascii?Q?sl1SxAvwwBBXArRm23+kyrkYbLmTrDX9VttCEm3Qx8u0XMXzsZSwKSI5aI5J?=
 =?us-ascii?Q?OOt/mpextdY/zjFfcfpqJpMdY3E5lzNLiMLmiEj4U8wjreUXXzTSCnYkI458?=
 =?us-ascii?Q?3LduKIcv1YNXI+KyHr8+cBoHJB/C3Dj/JGVm4sNb0vJ8WiQlWbYieR/wm+M1?=
 =?us-ascii?Q?54JmZXzhmRHIx5SQOcCkLljLVvnfetVPOzcXFEhjMd44aQaNYq0IGDJtMUfa?=
 =?us-ascii?Q?3kz8+e5IAd31J7UjJfo67/hXDWGuISAy3fCI1cYIlMC7cznvP9gYL0B09zkl?=
 =?us-ascii?Q?EhhZ+krXvETnAU7NU4VUrjr/dcoPRf5pEJCCWoiw/30sP/qoyITHqpJ+AcEO?=
 =?us-ascii?Q?BzpsOPLvKr/06ro0Bak6REGRuKOZaq2SdeB8mKpooEYVCKulcxg2EEnR9mIj?=
 =?us-ascii?Q?Yw97CbD6yygcZre4y2WdZn8Y+whcD8Idw0WVDJbzQ9GvhN1iSGTPkB5o/GD9?=
 =?us-ascii?Q?D0e8FaP2O+XPQjYmci0/kLpSP/3GJXYUehs8x2NLNtp39ZrvTCU0Vt3L1zUW?=
 =?us-ascii?Q?B31V3AFyF6ICghztSHG8P9OI4ilw3DaU8aYifwiQZ4yl4K0Trr8yBomtyAEf?=
 =?us-ascii?Q?Wp5Q/wvQzf6n1txhMXk12xKp70jDHQQfyqEjxScBz77CFbNH3ahOcm1CPny9?=
 =?us-ascii?Q?gX0MU+1gj3bWdBckr5ar4JEB6OQ3JC5+/ZP+c1CIw1VELDNJEi+BSWRT1LKX?=
 =?us-ascii?Q?Ie2WZylf6ZhREBuXdik/5sDp4TULZ6k+KtqTqOuE4ZRPdE2Oyp2yRqwYQQSx?=
 =?us-ascii?Q?4opApNRrPbWbsoLz5Vihi5mXKMaDCNxRPEtSmBX4wO2WemXh5nkkpkOSZAUj?=
 =?us-ascii?Q?R2jF1ICdRY4neVJFEuLznIGDAuCTkKrshkgiO8H6sQHlKMWhlwRyVzjpQkhu?=
 =?us-ascii?Q?ihKvYBP6eR1+JtmjZW1LOasst+acj/8fppFbIGFn+AYkNbqrIv6sp70dc+WD?=
 =?us-ascii?Q?u+vVdy2KJhkBd2Q8OSydFEnyOmWX4j+fsVxoNn04ruvrZqEF6lAG9+HwORBV?=
 =?us-ascii?Q?5gs/0FGNF3z4Gj3XFqjdVgwpvingGZxIU47sL6e8eYBPM5HPXfdgzetPDtOl?=
 =?us-ascii?Q?qoITy/vykQH8RteckvF4O9kfY0Ybaai3Vst3xnVugoGaJwOl0LuDvmxybmMr?=
 =?us-ascii?Q?kX+tAB+5Wd6N4dx4GfSY2+AQBs+XVDfN5EO7gyAQTnI2nJZQgEgGK+FNTE/j?=
 =?us-ascii?Q?FuMq3X5d64FqcGor9vnHLa+S5JKaGnipcIfe1XXRvVxsDeLxTj+J1x0x35dz?=
 =?us-ascii?Q?bZu+SanXsIS2+IIOJimBdbDqmVupPTFCmpfUVBPzHxH5rB0QPoTDsfbQDqhL?=
 =?us-ascii?Q?X2yE/9TJHieiVPIGoc0cQbfPcMRxGaUNdwXyl0xU6ajyzaBrb4FbGUMDSnwy?=
 =?us-ascii?Q?b+EeKdYq4qzQqM5W1UzxRll29ZdlFG8JhEY1WoCf+5HoEpbTEqYSNAeFYCgs?=
 =?us-ascii?Q?17nCli8ybDlgwveMHoHG0FIMmB4aH3w0Cmix9tqYHo/5xvz8zZkx1FfLlf7V?=
 =?us-ascii?Q?2L7PoSJkWDk9cbxUdfPMzwGwCQS4dHalJ8wlGkPejgYQ6c9/U6GpymERIxST?=
 =?us-ascii?Q?7w/bfZDlyKG7oTsx3TOufK4arx5VCzIPdc4xDVDVCQGo+RFE7KAOr6MEcvl3?=
 =?us-ascii?Q?R8V90pnoWw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Bm5rbXMvcSWjuXT9mnPuAZtM5Y5jiXhKkKwu2FvrMsni7TJW8oQRuJgUP4qbA090IyxyUiJ4MiFiXzJ2zimS/nqPhG3DaBn0S+IEtIwz0ikWQB2EVjPL2++65Mt9jGNHS9JKoYchGeQXH4HUXFX82ICJYMIbBOEXGNwHT+8XP1Tu7/+u5X6tSiwhWrOranl70a7uESxBa3kED8Eelu2rY+ly09Pt6Xdm1xFjKFiU75KaMkocoE9GXdCkT/wV6vwgwdniajNVaq2rFNz/S+QrJB+tkKjdUhAf60yclY+wwgqV30eDqmNrtZnMOQO+NGY1YYJ7sCzsweu93Wj9x49Xvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed74097-4367-4fe2-7e75-08dee1beeef7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 15:45:30.3937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: US3+lXMcQCtD4cacN5nvo4b91Azd1B5/H60fMM36sWnwAjkJ5ggbGLfnqHlNq9rjQyEPpZ57nEo5+PTiZfofFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR11MB9687
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

On Mon, Jul 13, 2026 at 05:43:59PM -0700, Vinay Belgaumkar wrote:
> GT_IA_PERF_BIAS_REG indicates power budget between IA and GT.
> Lower 16 bits correspond to IA and upper to GT. Higher value
> indicates more bias towards that plane. The values are in U1.15
> format.
> 
> $ cat /sys/kernel/debug/dri/0/gt0/ia_gt_bias
> 0x80004000 (GT: 1.000, IA: 0.500)
> 
> This interface will allow us to observe power budget changes while
> running workloads and also, if needed, tune it.
> 
> v3: Add a helper function for U1.15 decode (Michal)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++
>  drivers/gpu/drm/xe/xe_gt_debugfs.c   | 70 +++++++++++++++++++++++++++-
>  2 files changed, 73 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 08251c7a1a4b..4f1404c6c209 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -634,6 +634,10 @@
>  #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
>  #define GT_GFX_RC6				XE_REG(0x138108)
>  
> +#define GT_IA_PERF_BIAS_REG			XE_REG(0x138158)
> +#define   GT_BIAS				REG_GENMASK(31, 16)
> +#define   IA_BIAS				REG_GENMASK(15, 0)
> +
>  #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>  /* Common performance limit reason bits - available on all platforms */
>  #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c38bcacb27e4..f9230b3427d0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> @@ -22,6 +23,7 @@
>  #include "xe_guc_hwconfig.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
> +#include "xe_mmio.h"
>  #include "xe_mocs.h"
>  #include "xe_pat.h"
>  #include "xe_pm.h"
> @@ -336,6 +338,70 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
>  
> +#define U1_15_MAX		0x8000
> +#define U1_15_INT_BIT		REG_BIT(15)
> +#define U1_15_FRACTION_BITS	REG_GENMASK(14, 0)
> +
> +static void decode_u1_15_value(u16 num, u16 *whole, u32 *frac)
> +{
> +	u16 frac_bits;
> +
> +	/* Uppermost bit is integer value */
> +	*whole = num & U1_15_INT_BIT ? 1 : 0;
> +
> +	/* Rest are fraction bits */
> +	frac_bits = REG_FIELD_GET(U1_15_FRACTION_BITS, num);
> +
> +	/* Up to 3 decimal places */
> +	*frac = ((u32)frac_bits * 1000) / U1_15_MAX;
> +}
> +
> +static int ia_gt_bias_show(struct seq_file *s, void *unused)
> +{
> +	struct xe_gt *gt = s->private;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 val;
> +	u32 ia_frac, gt_frac;
> +	u16 ia_raw, gt_raw;
> +	u16 ia_int, gt_int;
> +
> +	guard(xe_pm_runtime)(xe);
> +	val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
> +
> +	ia_raw = REG_FIELD_GET(IA_BIAS, val);
> +	gt_raw = REG_FIELD_GET(GT_BIAS, val);
> +
> +	decode_u1_15_value(ia_raw, &ia_int, &ia_frac);
> +	decode_u1_15_value(gt_raw, &gt_int, &gt_frac);
> +
> +	seq_printf(s, "0x%x (GT: %u.%03u, IA: %u.%03u)\n",
> +		   val, gt_int, gt_frac, ia_int, ia_frac);
> +
> +	return 0;
> +}
> +
> +static ssize_t ia_gt_bias_write(struct file *file,
> +				const char __user *userbuf,
> +				size_t count, loff_t *ppos)
> +{
> +	struct seq_file *s = file->private_data;
> +	struct xe_gt *gt = s->private;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 val;
> +	int ret;
> +
> +	ret = kstrtou32_from_user(userbuf, count, 0, &val);
> +	if (ret)
> +		return ret;
> +

Specially because we have this mismatch and what is printed and what is expected
as input, I believe that we should have some kind of checks here no?!

> +	guard(xe_pm_runtime)(xe);
> +	xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
> +
> +	return count;
> +}
> +
> +DEFINE_SHOW_STORE_ATTRIBUTE(ia_gt_bias);
> +
>  void xe_gt_debugfs_register(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -368,7 +434,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  	debugfs_create_file("stats", 0600, root, gt, &stats_fops);
>  	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
>  	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
> -
>  	drm_debugfs_create_files(vf_safe_debugfs_list,
>  				 ARRAY_SIZE(vf_safe_debugfs_list),
>  				 root, minor);
> @@ -378,6 +443,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  					 ARRAY_SIZE(pf_only_debugfs_list),
>  					 root, minor);
>  
> +	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe) && !IS_SRIOV_VF(xe))
> +		debugfs_create_file("ia_gt_bias", 0600, root, gt, &ia_gt_bias_fops);
> +
>  	xe_uc_debugfs_register(&gt->uc, root);
>  
>  	if (IS_SRIOV_PF(xe))
> -- 
> 2.38.1
> 
