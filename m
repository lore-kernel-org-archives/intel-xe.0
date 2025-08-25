Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439AFC8303F
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 18:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D7410E27E;
	Mon, 25 Aug 2025 18:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/lvrbYA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4BD10E27E
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 18:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756145989; x=1787681989;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H96Aa7JVu25N9AB746aKJk/1wI2UtezGwktAMC75DAI=;
 b=Q/lvrbYARqiKTLgYOq8whYODCKIU5hwcbO8xtUXGYtUePFiy2zN9zyg+
 dxasYml/gHjCYBduV+O7TOgs2omnEKMJ8BrWgtac6qN9VBGnMtpuiRr1y
 O7ruQXSyCmpTgwuiDJYAq7N4oulvb69orqRJdcEzsM2SE0cw6vBhtjNe3
 nprBu9gPBD6ApyAIxN81/tOLLhiuz7v7ky1Qn1TBPqoZrRW5GkZJJVUre
 17zothL7MIEEkZ8TYBAqfCSjDIdUTsaK2UT2Ea9V/cKLxg941NDN36eCG
 PXqKBIGX0GwbuD1ht26uBZTzatDUnAgmwn1Cs3FpKwKgTMOQmwHyef6Jp w==;
X-CSE-ConnectionGUID: kU038KQxTRiFe9dXI829Vg==
X-CSE-MsgGUID: LPsWMx/tRDeVDv1XulAOBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58299683"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="58299683"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:19:49 -0700
X-CSE-ConnectionGUID: +o/THWBOTx+wPh6z8ieE7Q==
X-CSE-MsgGUID: 7kjkR/jfTnKe1MY/doQPAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168966322"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:19:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:19:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 11:19:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:19:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAPw/4dXvcWEn30VIXfnJmaISH2edanpkM9QEu0+CZ5hPUeVZ/+vGG42kP/LsvRstO9FfwHa+djKfEktA5FWcMUh1NE6yaJPoMNLabwffuU9XTm1KhhWyY/DJauhr/dDdRY/bK42WqB+1vsBOMwuwmgu4jTDSdUF0olgOQaBtn6ty/S192BaEFS5r2vQxkl+jaVbwT81dbYdkWs4/GRhdcvfoLD30lSnHLwgxMF3xzQwLkn5EWOuEfHLsSehPZzTygLrweAcfG2Cq61LdDYJqxWyLctA1psPF6GBlt1aQh8kmL2aAmjVJ5CY4Y9D47yvrujUA8HF2V+FO1G6JW2eTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hu5BDhd/QZjZxC9dd5kQTjztJRWBKGoIEJFj1pqF9Es=;
 b=sUkA7WvqoxdlFC+++NeNZZhdFZm1MOxsxvW0ZovZoM12oVtBD+voReaAg1eYhmFgEFKie+qf74odoCRxRoc59BJ3EhEGpZfrOKreVhS+2jO+MGAAyEJZGs637Buznuo4Pkw8CJ8jlKGW896l7avPJDFwRzkNQZaUyKo8Yw+MLXGYtaVJRy152R94xt59SYhhbE2yANdXXR9OKUl2smveZTioEltQBcobAr7BgVluulZDY+WWTtrC9vvyIK50pWASYwBHN2/vlW+hKydszlipzjWDiMoxUEe1r3HjjOSIZZfBQuJBtjSjCKBbtqTnf6JSqmw9hPhbOGn1dvo9Pq5Ybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB6666.namprd11.prod.outlook.com (2603:10b6:303:1eb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Mon, 25 Aug
 2025 18:19:45 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Mon, 25 Aug 2025
 18:19:45 +0000
Date: Mon, 25 Aug 2025 14:19:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Xin Wang <x.wang@intel.com>, Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <karthik.poosa@intel.com>,
 <james.xiong@intel.com>, <stuart.summers@intel.com>,
 <shuicheng.lin@intel.com>, <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Ensure GT is in C0 during resumes
Message-ID: <aKypPHMI88W4bogh@intel.com>
References: <20250825165759.1263546-1-x.wang@intel.com>
 <20250825165759.1263546-3-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250825165759.1263546-3-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:a03:338::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e63c2b1-d060-4b3a-6188-08dde403f7ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?72aWCm9dcOb1wblVH9DuaG0yITy5q3mXtJkmqtbIj9+71b19iWC5ny4WkF7n?=
 =?us-ascii?Q?c1oqY/SGWENae858IlYmJjO58rpymA2NaCE2wuOVO+E9nu4pvBKZeuXIY5VV?=
 =?us-ascii?Q?GNOndj2Wy48VTFmXG9lRYMgpGx6KGKLsCJbTLfI5KC73xpTRh1BOdAh7oDAg?=
 =?us-ascii?Q?ayKSoOfxod3B4uUA9aPOSY00mBXmBJeh4WViviQ7iYp5XG29iX0oNr2KkiVV?=
 =?us-ascii?Q?7V9+vRyPSzas1uNyJIQ37944bgqknXiROqZOlHdo9M5kNrKQAxCTjT25KPOZ?=
 =?us-ascii?Q?JxXWk3570JtK8WBkW5P6DZ8EWt2ex1/VNFkfCugUd6F0+Kac6IECSe25sNQO?=
 =?us-ascii?Q?UCEDEtl+RurlrfLwlSk//xJ6r7jXwfXDHiEWaB7azdCDxlKerjDLpi5yzDJO?=
 =?us-ascii?Q?NuEBxG8AwhsJKZ7f/EofVMQNUw32dOuUGEOywdzAl3fBoKQA5uC5GdUEPPbv?=
 =?us-ascii?Q?CkSxbI2yiXf3Gtr0DuMgM76fYXVGkjVHNtWt2CcL80lXiRQqcxyAPwyipcjq?=
 =?us-ascii?Q?zA/r+tHlhZsk1zGaiPMp3ISeIBu8hLjHf6ZH2IQyYvypRCOBJBQWZSRV0V4K?=
 =?us-ascii?Q?dQOKTy69FkRU0h0C+5MFBZ1YwFliB8zGAvAz4Qij6MmvpmOWGUhuVS4BeWEd?=
 =?us-ascii?Q?Fedh2ylcJdl8DKPD6kJVnaXPCqjsOieQQS9G0zIO12LTXxtyDn8NPhhytHxW?=
 =?us-ascii?Q?lnaFDKInoCdY4q+ykn/cQvcaVGg8PhKZ4qexo5MM7C5aXfxuyphTNcBWi7fs?=
 =?us-ascii?Q?Wrl7moxO3AmRAVrGR7u0YscJvXe1KlPzvoOgsjtfsEHJMHlDieET4Ndc8e5b?=
 =?us-ascii?Q?6U6WEF4EEYCR2Prt8NwQL4t5pj2J5ccncpdTgXG3rHX4xSctMOwLp7XVLoCB?=
 =?us-ascii?Q?/FjK0+KX58ph2CfqY/GNs4jaMc4LN5mW2hVW/QNxWWJqmsGsMrEuefHu3/MV?=
 =?us-ascii?Q?JuUhagtjbUsCQ7ciUPcGutJbH0voGLcCryD8dOurenJDXMgtIo/T9retqvmV?=
 =?us-ascii?Q?mUyDWJmyrZ2PjUuNxXmC7Do9+1EBXNTfUC916hygKfkXp38cvC59y+YTPguB?=
 =?us-ascii?Q?w3o5VkGjJdVrGkFQ4QVveHKoqTSMuNM+S8JOoOATvu+JAIMvhn3TTUAXWGyJ?=
 =?us-ascii?Q?Zv71TWgA6TDplH0pImSnuz0QVZX45FEb8qwpVB/LJP0jM5gcfg05S+9rWFsf?=
 =?us-ascii?Q?uMEVDEnE/PrNQWwlb6SEdQ65jPwk/CUe+2VVwtjFOSE4sp0Vdp3X0V5YKB+y?=
 =?us-ascii?Q?hh4r0v0uxxKQaSz6f+4N+TNsRG+Z4ugwNXz0bkYpVKofaw9Cp/QHsnHd0xVA?=
 =?us-ascii?Q?x5MWE4/zHHZL5e3UP85uAZHzKQZN0XDSdSPE8g3/JQ1Oezqi0RD2lz5fOH7C?=
 =?us-ascii?Q?4upk9cc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kPHF69uDpsw+ASevsZignNQ4Up8wYqOAYRCqNiRZt01MCX/u4qPomN7TDtL7?=
 =?us-ascii?Q?lySJGr7FZ8uipeAGpoVkypwNn6q69EL6/dnyQVrzuZqvwOEHlg6BpMRZI4Sq?=
 =?us-ascii?Q?bMCKcRmcAILktvpZI6c8ihtvPJnm//qy9iZ5z4tnGB56Uc770L3sIDQOr+8+?=
 =?us-ascii?Q?Msp+d1+nd7xSp+ULmCr0lNdnGpYZ6Bs5vAFX4SZnt6CMzZBfaROR57/qKtui?=
 =?us-ascii?Q?sjRcNsic4gLRpfTK9MrLo5j8yXK7o1SZPrIT1gBdRJac8P4yXryg5LCjYnED?=
 =?us-ascii?Q?iLqk9nrNeGvsXHj8zy3FmkZYbEWPBVboo+9ElAmnzxuddD4MHvqZJWadOQ1v?=
 =?us-ascii?Q?jG66mM9CBhKk5SqvOli8xjiVV+wsKPHcoYP/eXYgsLbPJbOH8nqQqb7IF1eX?=
 =?us-ascii?Q?x5DzZJxMbOh5MDneDOguOzHQTXUdL3KtrT/I63KxqZytXniPI4bpHiQkiAyw?=
 =?us-ascii?Q?aoJ4K9duOb7cb6+gh+PtgNeFaGOhTT/4YTRQlwOdtoQ6tDI6kaRUjTp3WC3y?=
 =?us-ascii?Q?DtNWOGdLbXAeVRX3wbSwtQnWsCw3fsqBD7JBQrd+t9ceBWQuI0YyFIra6fly?=
 =?us-ascii?Q?OFul3SZILOLswK3XQfAFf8F2aoOVxVsSm/32gJBmX0CugvHRMt1KkhH6D1rZ?=
 =?us-ascii?Q?HQQhtKX2Dj27HlecVF0lUVfLrLZ+3kb5gc0nOCMNYmLcYQCJIY9G8g2Hjw2+?=
 =?us-ascii?Q?lOYa8gJl0ZxT2z1bjiYoLhj9DQ5Z4bCVjKzHnEcu+Nods/lfgny4uhIMsREa?=
 =?us-ascii?Q?t3i6FjHBfspYHFKPLn/7Dgo0z4ld7GlGRB/haJjfs1UiUdkCrdh2zh68x3B8?=
 =?us-ascii?Q?3VDoHIeOYoSp1WN3lDw4qxudPIKI5idxKxDO/ZZJFITgqcTgqFTz/3W/jQFL?=
 =?us-ascii?Q?Rs2l416eSyXlsuOd3ZVvhofnjItQx0TJWOAUPh9+DRB3cx/FryTFiOWc3TA+?=
 =?us-ascii?Q?Ika30kNbI5d1EKlA6YQufSNH9aa070ZnGqi/rYslT1pYgkkSUzV4JmEES+q8?=
 =?us-ascii?Q?TeYKN9cI8R7xtaaRS4p3mBbuXo8ok8A2CeAGfIPaNty1x3aC0rKSsvH6J9/u?=
 =?us-ascii?Q?VYt6EzNrlilr4bpyK8pweugRJP7iaZ2EqdCys7VoTZ/YXF3ZPQG2/HlrD3xa?=
 =?us-ascii?Q?jSz2Z9Wb9dpDZAVFyx0UxJLWZ7VI2IoPy2IyBMRAQ8QYSfr2bh61Nc9Avyh3?=
 =?us-ascii?Q?eu52L9ZvQWQxh7woQ5yf4x/NlnTt+tZxPsEQLR1y/71VL6aODpMZAsjEu+0J?=
 =?us-ascii?Q?qW0m0T9BqFdA3BVfhzmN5qu/gpjRz/KJWwW0wxmNDd2U1A8zIi+G5JtUxNdS?=
 =?us-ascii?Q?uDmMHiCDG0SPMsPXbceAzu9EvAI/1zTF8HN9z8UZUZopOznfGqFNFLrPiB8M?=
 =?us-ascii?Q?jdWBY9v51DO2WO0n3bQ/c1tayP8SmnAjxXyvbpZ0JKl/q5Ir1YlHaY1e1L+S?=
 =?us-ascii?Q?L6AeTiJRhRH+DrzIABYMI3hUMBhOo5SDlONnGJF+jrlFoEfH2guMEJgGIMzL?=
 =?us-ascii?Q?jrZs/9+nLs+gS+5IJdYDWi46r+sqxaoj3PeSkqrLxjCGerMx5SwUdKKqrD3E?=
 =?us-ascii?Q?9SuSRwBl/hWZ4HK8V+L6cGIMzTGHNyFR+j5rWeuD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e63c2b1-d060-4b3a-6188-08dde403f7ce
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 18:19:45.2834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bteGXvCNyKl42r9h5EPvbl8Di1FZ9FRwwO9nH1j0hDn58xB1i3xaM1CKbMjKeroi8GaRBOx7G6MMtmZexwGoUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6666
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

On Mon, Aug 25, 2025 at 09:57:59AM -0700, Xin Wang wrote:
> This patch ensures the gt will be awake for the entire duration
> of the resume sequences until GuCRC takes over and GT-C6 gets
> re-enabled.
> 
> Before suspending GT-C6 is kept enabled, but upon resume, GuCRC
> is not yet alive to properly control the exits and some cases of
> instability and corruption related to GT-C6 can be observed.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4037
> 
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 51934d5dc44f..a2e85030b7f4 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -18,7 +18,7 @@
>  #include "xe_device.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> -#include "xe_guc.h"
> +#include "xe_gt_idle.h"
>  #include "xe_i2c.h"
>  #include "xe_irq.h"
>  #include "xe_pcode.h"
> @@ -177,6 +177,9 @@ int xe_pm_resume(struct xe_device *xe)
>  	drm_dbg(&xe->drm, "Resuming device\n");
>  	trace_xe_pm_resume(xe, __builtin_return_address(0));
>  
> +	for_each_gt(gt, xe, id)
> +		xe_gt_idle_disable_c6(gt);
> +
>  	for_each_tile(tile, xe, id)
>  		xe_wa_apply_tile_workarounds(tile);
>  
> @@ -533,6 +536,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_rpm_lockmap_acquire(xe);
>  
> +	for_each_gt(gt, xe, id)
> +		xe_gt_idle_disable_c6(gt);

Cc: Raag Jadav <raag.jadav@intel.com>

who is working to avoid GuC reload when we didn't lose power.
So, these lines will likely need to probably move to inside below if
when we have that code in place.

But for this patch with current code:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +
>  	if (xe->d3cold.allowed) {
>  		err = xe_pcode_ready(xe, true);
>  		if (err)
> -- 
> 2.43.0
> 
