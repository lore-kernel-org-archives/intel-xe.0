Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C637C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 18:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB8E10E13A;
	Thu, 13 Aug 2026 18:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dRX1WE1N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29F210E13A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 18:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786646319; x=1818182319;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5oiO5feLbv72IuuqhrS/06hDLHKx5Cv58DoD+ANAAXo=;
 b=dRX1WE1NXTh4RvK0C+vRCUQguZoqw4dUsrUiOKpVI3KXXMglhrjx3Vyj
 1Xiyh0XxQRwQUOmCB+9RzEWd85A5tPcIGo6O8Ka7GqzGgrDy4QGlY6XGj
 XuGm60+ONlrsKw6dVwuQIByS77XbXKT8XdF468jRhg0o6s4Jw9LLyQnoG
 U96R7efQpBoXVkggXhxQNhyEz35Ver+TVyHScgLfuqQPZtWwSVNhnvrGd
 3R2rIau1XkUWodJ9Om22/wnJZOuOHvWyYXHdJneH1hC9KOXA9HoUclsKQ
 4A7GKHymhnM8nGeg5icfoIn3MlLRDF2EqzEkpXfxYxR4esyB31RXq+eTP A==;
X-CSE-ConnectionGUID: ti9a3gY7R9CQi6AfVvzJqA==
X-CSE-MsgGUID: v6s5U5WGRHGymFjfY9X5dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="86192745"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="86192745"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 11:38:04 -0700
X-CSE-ConnectionGUID: YwiIrRG7TWOxDYTC9MeZsA==
X-CSE-MsgGUID: sYSdU4LJS4a3/K+2SGV55g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="268289269"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 11:38:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:38:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 11:38:03 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:38:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxqDq9GPaV1j6+K3onSPei4xGkbeMPKqhBBVmaCsADThAacMjvATXSqNRVwBQj9imQokvJGOkmB4ZYY0oP++8r49/sOj6fzgrwv3Y/j0B5aTWs1juUT7/E7ZZZ7zJKj49exuKkCO8HmDEycOBHjI95af96Jli5AeXBSQfHcIGayUDs8aj5Sqrkm5T4baF/7un3dBVIrBUFLBRlD1F5ymibd1lU7T6Lc3jBjSXkB6ploDepUJTC3+lwT23bcKZYVrmRaNHl7VQ9Ulh+cJrqFsWezfDYc6tpn9f9aIZVfPSM5eHKeS9VpJYAq4NgTZP4BGxRVJDkc8krhsF5Wmq8VrPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5cvg2y8cC/zlSWnND4J28CNmdmjyY4uSg3w7hdcXCE=;
 b=d9vgSyuKfmWBnFwQ9p0RGDa7qqOVhZ5cP6nQb57yPMtIayMxGwkjpiEvBf6x+PE2csNTfOMuhOZsfej2gxFXmKlpKeQZ1VmCbTdNvC+fiCIGzTFBgI5XaKTodbNxuYTyv9ELio0eWp5FSdiNJFnRmiYGW6VizS7rdZk0U0mAZL0paX6t1sqa0YY7lm7g96+pnFlk7SFvvR6wh4hoqH2zuTkl7aroODUBDZ36PLcGLZDPcrN//ABXQ48osnL5yvIThpyIWpAhXhWcVwpk3CDtWTiOB+9bjY2aDPP3RCIZW7aw+ki1XZQZN47LO5GzkkaWFeETAyFnRb7NCwXrT98Nvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DM6PR11MB4641.namprd11.prod.outlook.com (2603:10b6:5:2a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 18:37:57 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 18:37:57 +0000
Date: Thu, 13 Aug 2026 14:37:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v4 30/32] drm/xe/gt: Report 'Fault response' pagefault
 error using SIGID
Message-ID: <an4PAo7kT0tomdgh@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-31-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260812191450.11690-31-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::13) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DM6PR11MB4641:EE_
X-MS-Office365-Filtering-Correlation-Id: 33819dd4-e773-4d03-7ed9-08def969fe57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: EWwy2sz8FT7K3fYvQre3EPuKbbUk2WfW3fPGt37TaadzfTjagXsZZ8kWUQx0UI+3bfLcnTnnYD5IjtDh1Au5KvZsHIIM9T7ouYsp4IpwdCnY+zWSLabMa76As0/Zgc9hX2BJ4HPUAxP0QFSXAdZ2eRsQQgxxHLZp0UJvsZarIMIss4eVAXTmaH783wZorkbu/aJgfym0d2++lBNppYgpK21pT3AAOyK8Tdx1/Nw6JCYuADkdDEswtngdl+qj2Z7u9PdukMLUmB79tNdFumW4zpdODLJeaE5JmDyO/4YeJeCue3InyRypVwTGklDlXKmJVA1wAExt8pkJnVuwgU1p39JBJzq5jii0lEpuGrPVhpYg7KdtuTZm7uopBkemlgXUK5BRebuURzcZnvQi4l1EF1lMfBWlAdMi8phUz3ARCk9D282C7l3Oajys5l+BqzF1wa8GEpvH2PEUyODmu2qZE9hy60HfsYfBeENfw9QaXx9RfcD9Dm0EhBVGaqCF4pNO53P6iS6fc8C6yXHTuzkiu5FR17MFe8pYQNEFF+0BGDqF66HFuQXAdKqJpdSA62VDjUpPfrO1FDE1dPfeWk+4lXJyy3CxQwOv0e56AfnkP1RNLvfJdEL0RBemAYIMuf/53zUWkNrdn3j2i6U3TSOw0q6TGYdhrrQ91Y792BDubV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UkvsJqE3ky6AmYrN2wn/6a0zTb3hiDw7jifHMu+Z/fi2zi62F3K/LQIgLbmm?=
 =?us-ascii?Q?pPT0Vs/r+Xa7drPDbURPArdNKenGywCMGfE9lxzJsP4mq+1mRASfVeiFb77u?=
 =?us-ascii?Q?voW0Zhm8euP1+Z09LyF/RysG/gUldNGkUrf9UVqwnygoXe5ydOc9SARb/nJM?=
 =?us-ascii?Q?i0ZWa13drwdNaLqlUGqMpl2EejopDCUoTOCNyn3U1gjj1H4PvmKzpDJH6Gx8?=
 =?us-ascii?Q?xJPUYD+JuYB3GsuQxnF6OhltDaSiciNOhhl31fQ1W1F7Mh0lZaZZy/MTKw81?=
 =?us-ascii?Q?3q7YMO3i/6EWidXTt5fLz9Zk2M+ufTcwSzc0UsKHKJ8EgMOxMaKUxjLIGYJu?=
 =?us-ascii?Q?qb4Vv0ebgU5oyK0V3SXSaKXh4nb5AEDtS/MHIX+rdbAgzZDXF7B0zWjoBNde?=
 =?us-ascii?Q?Gl/iYu8YWRrj6rfpX3wwnsRnuUY4ot5pEirY4+l/nh69LS8pkpy6+93gr87o?=
 =?us-ascii?Q?uWt0A2IkY9fR3owaJq2aK4CakI65Ei7vbVLdT0KKfPg1PPMK8ep9CDE4j/Q4?=
 =?us-ascii?Q?OMz+mIoUQW6LBzBeXWNybxJUVaSpXJEuzmDtdkE0dR1GEtWWEuszuJJBtvxz?=
 =?us-ascii?Q?2IaAeEHrjieI+iY7JjQINayRIWvSAW8WYzmFBujyo9ZFacCCgLKbnVlYI7dL?=
 =?us-ascii?Q?0eNs66/uapnGUOaOZm2EU0w6IZI6gdbCO//mRaAxgb1pEy2mKGXJo6fezEv0?=
 =?us-ascii?Q?mXfMIZPuQriVLuAibGUwUBQDRBFip6RkbvdN5J0m8lV7V/HZP1MBBR59rlX+?=
 =?us-ascii?Q?0YaGA3nac64CaRQ4SJdZiYc32021FNsXLO0iMTTRbKj17ve5/Nz5FBBFC3Z1?=
 =?us-ascii?Q?TdBIwtfvuhS5hjW3y0WrI4FyhUBWtV02yvuM1mZwsBU9NSejcobNFFmgqZtH?=
 =?us-ascii?Q?wAU2qui9CGZxwRqbvLy3G3WgHYAYCtIhOmpHBTSTpv06qIwRXtbPHIHvENdE?=
 =?us-ascii?Q?f653ykHn6SFywYgQi9vMJPeDfyoKbhiETw7IW2rjjVzsFrcNxtbV2rbcAc8e?=
 =?us-ascii?Q?n13kl88cfYCFqDkLuCuey1+yEWIDtydZlDHl+kvi8Pg1rbhPQWvuDn1gtuRj?=
 =?us-ascii?Q?N43UMo+gan4UsjN6DeDcWuSbj0S0DCSfszQP3mh3+fTL3AstLWfsZDyj1rNB?=
 =?us-ascii?Q?ijQpgTsN+/dYiyzK8q6zogAkZ2gSOUmJTqqESZGKGszMbLgezinuBsZy190E?=
 =?us-ascii?Q?aqWpnypzEN56/As/SngU1wExie1d3P7SGjc+FLjrVBqw1beDE+mhxQsKyxwp?=
 =?us-ascii?Q?KaxszgwnMTdhyvWgPH0H0DxsM1U65O0O/Av9aLoqmvx/7i15ExQDJoJpEhul?=
 =?us-ascii?Q?9yHW4ZLAXaeiIRWBQ1GyeD7If3qqPqsxM0xHbURKQZUMvMBzpd+0zqv74cvP?=
 =?us-ascii?Q?Zw2RIaRdj9rr7yGs2ACoHpf40Ya+N83yFlx3x4c/mAGlmJbWWwOqJKAMIAaV?=
 =?us-ascii?Q?VonxW7GEkt2AIbyfHoKpWysmxOrbFQCXdaJ542AxzkguhKyWnaLs5AC58vRL?=
 =?us-ascii?Q?Gou3v+sVw1F1ZMWxb6YdvhH7O6EGj8qJ1gnAUPW66tj5H0CASHPoHoqrmCvJ?=
 =?us-ascii?Q?ANzYzV6Y0P/mtuhMy1HKr7rRHHSI22uOTDefN1cj/siiMt7DjM9O8dHGe0Uq?=
 =?us-ascii?Q?KKSsEuepCELWiOf72rhwbPqXYErHzQej4ApS7UkCEVZb3yEomWDb2vVxXIaq?=
 =?us-ascii?Q?peBdbpNXfe2Vi7JzkdHUKbmpaQmgu4OX2BR+0tefCpX7etXGn3yW28AyRNZf?=
 =?us-ascii?Q?Jg3NBM+1iw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Pk++4oj9mYW/ISH0lH0rsUQrJ0ia2f1dQEWpcznx82hpNO3aGdfvnr3xSWaE6QzYZVyLMvIJmtKItZ4P8fbuLJh2jf2gpSoXf9Ub9NhHUmLqNsk59WR5syfN/zkm/DeID3HxDaXnrMf6dO71+LJ9BlKotL8+57WQSKEmmkhFf2NX+ezwrZZnn/LtmSDyKO2cfh+ambhXmgf/ZKZCPmHZy/kOOXBjHFonEEIL7XXYK7VoI7JQnCOf3TFAvbOrU0M/KQueCki9UO9QFaeUOV976Y1xFy9SM2sOY71Ns3bKajayq10ZJE7kyvvFAKAoZUe+gxJ5jq97RZ14b+aDY1oBJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 33819dd4-e773-4d03-7ed9-08def969fe57
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 18:37:56.9544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjpy/+SJnzmqscoCV9lIRKNSRTv2B7JXyLA9JnrCZV9s1YfBNzwows93tS/97STKwfBVFgEuO3epLb6AdIrs3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4641
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

On Wed, Aug 12, 2026 at 09:14:46PM +0200, Michal Wajdeczko wrote:
> Report 'Unsuccessful response' error using xe_log_err() helper.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: rebased (Michal) reword message (Mallesh)
> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 7e829c61387f..eb600c466187 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -14,6 +14,7 @@
>  #include "xe_gt_types.h"
>  #include "xe_gt_stats.h"
>  #include "xe_hw_engine.h"
> +#include "xe_log.h"
>  #include "xe_pagefault.h"
>  #include "xe_pagefault_types.h"
>  #include "xe_svm.h"
> @@ -625,8 +626,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  				xe_pagefault_save_to_vm(gt_to_xe(gt), pf);
>  				xe_pagefault_cache_start_invalidate(cache_start);
>  				xe_pagefault_print(pf);
> -				xe_gt_info(pf->gt, "Fault response: Unsuccessful %pe\n",
> -					   ERR_PTR(err));
> +				xe_log_err(pf->gt, PAGEFAULT, err, "Unsuccessful response\n");

I'm wondering if we should really go from info to err here...

Why not staying with xe_log_info or now?

But also, why err and not ERR_PTR(err)?

>  			} else {
>  				xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
>  				xe_gt_dbg(pf->gt, "Prefetch Fault response: Unsuccessful %pe\n",
> -- 
> 2.47.1
> 
