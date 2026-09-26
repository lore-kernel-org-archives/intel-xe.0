Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F5CC9832A
	for <intel-xe@archiver.kernel.org>; Sat, 26 Sep 2026 01:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56BC10E0CC;
	Sat, 26 Sep 2026 01:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WukUc/CK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E064F10E0CC
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Sep 2026 01:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790387813; x=1821923813;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+u2A+uZHHbEQCU89Wt8q672nCmoJsfjqldsWeqsZ6e0=;
 b=WukUc/CKf8qWCIB3v8nbWEpMdn9WJhcQZcfu8Im4414zPQIu1pJ4p9ef
 O/J7rOEcLx6m+ZmF22grY+EFiTjWldKRg7w66aEtAN4GLDt1rUCPX9j+6
 6v9tpyT62SUtQkzRFLdrF+V/Q3Jx7fV6Gmbrj3Cg8B2SM9IdwidPJhQnY
 B4cx8vyUHA8G07Bl5u/a0NrLMMhF/9lqhALixzz37M1WP0IzhbLA37S2P
 A/Ujl10nW2fSexd5qQ71fQt9TY87atBkaRKLVEwA2U6Th8y9mJ6q+oqHM
 akC0P+YbP4yHBGZWjrdIbhdNQ3jLNTrR06eC29FEjz7xGaQUNyi10zeVy g==;
X-CSE-ConnectionGUID: Wv5CAJ8qSISvwyoawR3i8w==
X-CSE-MsgGUID: QykdNskwRLmbwInH9EJOCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="101837598"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="101837598"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 18:56:53 -0700
X-CSE-ConnectionGUID: sCGSCM4uQLmkUKQ50NVpgw==
X-CSE-MsgGUID: WXSOF11WQXqTdWsGrWjyaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="274624224"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 18:56:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 18:56:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 18:56:52 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 18:56:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtHayty6KfQBghsuhlylv7WJ0TV9KvjlA2h1kgq1KITALCakX5iRrYnpwrbJpWxWRONOa3OlYOyloF3ebPBj2L5mZx82vpzEuBDU7B9fEMUaoePNRRQQpe7OBCRyCvdPBaFcdUOrJIJMzEjB+s91bNy0anevGzTlzEOrOu67x/KWtiCp3lU88n22mte3hl2NWskJnRcFjfDEihf8JeXMjmfGtas2eZVtCD2xfcuuHsalxuKV6h65lmhxG/qBXIYUjw9aVRoxW6vyuVxi2J0XxQdjztAiPefxo+tE2F6khwRXB04RsubeW2JQbe8u/WGQ4hwFgnhMa0cYVsPk2Afdqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnT+jeQ1KBFa1j4YCI/SyIpakKmhGxzoRFCXhyG7fkw=;
 b=oRe1C0Z3AalXYH5gB8qfWe8gI/CezuGSHzZgHS/vgNTCDYRCUCifZdcOt86g5YKdDuCvhmQlvizGIPUosm1pbHaXwy4lex4AQKf/qsbI6hUrZwjxoI7dZpKAeryBm23+RKbfgnZqdbf7zr49vSa0plgPgcYsNQbl47bGBQTAFLbRy7RfUOjNcVYVHx5FDBPv2yjkrVgwWbCh0Eh59AIPJeRodQYUvbz2AOJk8I/MdcYT2Ue/OFYgBOB4HvZN7tbI/DJKsaxRPEv2uEtwVURLb3/1bmLy2PHxp8627WBv0mnin6bvglZfgCDN+jnkBhJzq9kK87VWooEqF0E8OHXgPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DS0PPF5812CE227.namprd11.prod.outlook.com (2603:10b6:f:fc02::509)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Sat, 26 Sep
 2026 01:56:45 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 01:56:44 +0000
Date: Fri, 25 Sep 2026 18:56:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/4] drm/xe: Bump prefetch BO LRU via GPUSVM devmem
 callback
Message-ID: <arcmWgk9TsnR6Nbf@gsse-cloud1.jf.intel.com>
References: <20260922043759.3057442-6-himal.prasad.ghimiray@intel.com>
 <20260922043759.3057442-9-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260922043759.3057442-9-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:303:8d::9) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DS0PPF5812CE227:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ab4726-01be-4c6c-bec2-08df1b716a85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YugMnPZf+C+6YHwPnCagqMzOgGEo+8R/tvKa2+DlsBmXBH5iRV9ZU4Rp2eQLM8sPwzBaqxnPO9o+Vhv/N1dtyIo2QdpdQHjTOX+F6CR/FkK5qhqkhjtABYopRxjEP3xeL+sWPaOcPUR+6l2J+5DkUsz8+1lK5Ef0N8hNrbcqR8N3Mcu7vk2CPKoJwY2PD9KenJKITeYtclTEljHB1nQ3vOHxDzq5H1QGesREMHgZR++PysUvkqiQGyuaGZ4I6PS8jnH1UYWv5dM5OEEbM7RhEKuaMEXR8E0INMm4tAn3XEyz0dM+W/vNIYZIEDMTb5+pAonqVaAA2Ga/KzkNRzVHfXE8H6iHyPzg7/m8f9PUCImbbizeEX+jTuITOqvRNazo/Z9SgLLJ2Jd5XwvPR7w3QlJSBEdtWb48v6U70J0GgnTMbM8YfA4nLy/EgvLhSicepmRP5NWuZS0IyrrIP1bmqu/aJdo0RI5qgrc1V+Xx1sbB9YqRZiu68C+02IfYSqtDbLio7D+9xxok2yDlBvKtbv0KR3TuXzCPfSyPp6vgqUyIcRJy3yMEDRynmeKpHoMHaKQh3IJY8Wdz+BBRGnABLAsyu43D9UW2dc4fj+ezAA4f1YZYNuBtEqLeZL0tub00Ho5iW6Uf3LXB40sn2mcblvAv1S7H+2SVw01uHqXNQhA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EBhQn5cA/QVQVLDv0w1FCzlf4cOPSlb9dos9rRp9VToBTjrECoDyWA6SPKd7?=
 =?us-ascii?Q?/2NinXzhdDGKToCREZGeervK9TYDA0GaSCzgYo0gtm0691uE94fDv0HLB724?=
 =?us-ascii?Q?Lef42YspmAIRXXCaOvpkKnFzxGPTTW7vJdoF86u1p/oTpkXIwLVrTZRzbLOb?=
 =?us-ascii?Q?YkZA5JbBJGv/x/MfHp1dAXoM8AKchH69FOuxJIPIgIWVj07W1WxYbxulNtVf?=
 =?us-ascii?Q?B6unbNmZsD7PkNCk7uKv4W5eLWjFxhVA1bfRna2xDGfWZtgDqbFp0m9+/Og7?=
 =?us-ascii?Q?V7/AobQfloxNaW221MAMVZOEWGf450+RYliN+l20kz02P3pSSs04k104h9U1?=
 =?us-ascii?Q?4ehcso2mirC/D86vFLYzpdOMHQNU1WlK3x5/RsLzp04XOgjT95RDUKEG8rNt?=
 =?us-ascii?Q?gJ25N51h8vz2xB1ZKACO0UJ2AxovY3AcFybyFu/ppx/hOQm6k9mym4PYrqk7?=
 =?us-ascii?Q?YHW9IvfuTxXmqP8+JOmg5oVvRs5oSi32pRuqPAj8Y874zq+RvzIatXlY2bzI?=
 =?us-ascii?Q?0Nh0WGKXstAl9mtiOt7Q3C0xibXAnHO6Z3oPgWP42NitdcY4ZM0x8a8YcHwt?=
 =?us-ascii?Q?rGrA302odjhmvyUJaItBdvIUPYtK9jonOiry7oW4jWI//bqtFj1bOi+MtlwS?=
 =?us-ascii?Q?D8YPZzezP7bNk02H8zhuaiWleRwhpDIIgBt/3zKN+ab8UWj+qBnTq+BbScTv?=
 =?us-ascii?Q?AN+tlus4UUy5OOfwUpwgat++iRYpitkP3kXn8psZcYOFs4uRYNHDnUkoEWPU?=
 =?us-ascii?Q?iJtsTLSvS7DbYmfXW1PxA+bTa97m8sQP9cTedCNbRfVu1ZsUFmoWvidRcTnD?=
 =?us-ascii?Q?UUXFoDu+7za/Xlt2oMZ4h3pNXVxhiLsFJOIwhoMtN05qTAXkgmIsoW1DGW5r?=
 =?us-ascii?Q?oMaEqla6Zpiv+ZbGsoitxyGRqVfkvHctZ637ZLUmA+kHOk0gp8K8fgas0HkL?=
 =?us-ascii?Q?o0a/7Qth7JxN6L9U1MS2FCHb/Txvz83eN5xC+6qsKCay0N4ZP3FTJiS2kpa4?=
 =?us-ascii?Q?+NgaMqqJ2rdAngXc1X/qLy8Dz9osQg0mqrvw9rmBOvIvTY0sBKs5sEPNtq+A?=
 =?us-ascii?Q?L/Ji1pEN6C2B1GIAd0zdsuQQX5NO0gR8d0f+bgVc7fEGnNxB0Fl9tshvK2e5?=
 =?us-ascii?Q?O0tO7+uSDsbnM8gI9cWwMSGcVGyRm6Bl26Ywb1Ch/uDVMktkYRBnpycpsNlt?=
 =?us-ascii?Q?0sFMYnUjk+T/vUQOzZghX0S9PM4tTYMNWVsqPaGlekL4oHtlpIDRYRNSgLLY?=
 =?us-ascii?Q?e781wS8Aof1kdrpdfxvdWpg8M3QuO+8ToX5yaVwNWhhks3zdFLnRGwCZNd4b?=
 =?us-ascii?Q?HpdudrwYueq18sXuhK5peWrUAtrTIXvwQmUbt8k8awJNEyLHS9vSSyrtqyAg?=
 =?us-ascii?Q?cKcLdD7iLDMDTW/h/FUJmb8zjeHzV00f3dv4gfEHw7sF+EaG6LJecGZKVWyz?=
 =?us-ascii?Q?0x+QYK1vWmUMFYti/4NgMyfTu78pjbM8rcXQ0anv1PVzUkL4dmaLuAxQDf5P?=
 =?us-ascii?Q?vE/NCY9SPoqW494dLFe9KMNF0jxbtn9+DtiiFWRIcwdspJjLE0Ys/ZxGHuyz?=
 =?us-ascii?Q?/Dy74sN4x2roIYX2Zzj/YB7zeBAHsLktPra1x1QSLuZshYFZW7Koaut7rfdm?=
 =?us-ascii?Q?HOCK2hUUjMdYp1pEdFiO1XIUw6Vvw2EQMta14qPABVtdQYGwdlx7vyuhwmST?=
 =?us-ascii?Q?/C0PgemlzdKdFmrz4Cw/6pdvutRvXMiimBiWqp7yTkuSmb5LCDbo5gQbmQvm?=
 =?us-ascii?Q?fPoi2IVVp2X9AIkVgSn8bhsPWPJ6Agg=3D?=
X-Exchange-RoutingPolicyChecked: YLVv/3lgWHL+cJsJ3T3vc3pRjBdRZzddTTqNeFSm9onE5aEtld8pFed6FFMdF6YWDLJY0AXwi7y47TfN8tAW786JbdABCLKsZYTZGi/l2ARYnXb4EpP1jv3ueZ/jTaD/QoVdItB02uF5VXZrqaHUGjU4sDzfQ22aP8vROeZjG0zsaB95zNn/TKwV41ud/hYjqqc7eSzKYSwfaU79rwaCi75zA/mZUQhWt7HmqMxgRdr3+YBDWDVqlBoXbgUJSZGGaNBRxsyUW982bbVycNvYZqmtSfX8ODb6CVt8wuHRfRNSrDOHU7D/ihbE8A3VQ5Asw1ZZyBAnucCkUwwnTjJe2A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ab4726-01be-4c6c-bec2-08df1b716a85
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2026 01:56:44.3774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FVR/VEAiYpgI5sDjQPSV8KcVGrw+d1mVdTcr18zE/Q+AQSbyWvGHr7tjjMDW4nXfv3SM8KwNoTdX9hIeDoFhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPF5812CE227
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

On Tue, Sep 22, 2026 at 10:08:03AM +0530, Himal Prasad Ghimiray wrote:
> Add xe_svm_devmem_lru_bump() and set it as drm_gpusvm_ctx.devmem_fn in
> the prefetch worker so each backing BO is moved to the LRU tail during
> get_pages.
> 
> v2:
> - Guard xe_svm_devmem_lru_bump() against foreign device-memory
>   allocations before casting to xe_bo: return early when
>   devmem_allocation->ops != &dpagemap_devmem_ops. A shared
>   device_private_page_owner can hand us another driver's allocation.
>   (Matthew Brost / Sashiko AI review)
> - Add stub for function (CI)
> 
> v3:
> - Guard xe_svm_devmem_lru_bump() body with CONFIG_DRM_XE_PAGEMAP; it
>   references dpagemap_devmem_ops and to_xe_bo(), which only exist when
>   PAGEMAP is enabled. Fixes the build with GPUSVM=y, PAGEMAP=n.
>   (Sashiko AI review)
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 30 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
>  drivers/gpu/drm/xe/xe_vm.c  |  1 +
>  3 files changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index f39e647512ad..018836ecbb06 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_pagemap.h>
>  #include <drm/drm_pagemap_util.h>
> +#include <drm/ttm/ttm_bo.h>
>  
>  #include "xe_bo.h"
>  #include "xe_exec_queue_types.h"
> @@ -1625,6 +1626,35 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  	return err;
>  }
>  
> +/**
> + * xe_svm_devmem_lru_bump() - Move a range's backing BO to the TTM LRU tail
> + * @devmem_allocation: The device-memory allocation backing the range's pages
> + *
> + * Intended as a &drm_gpusvm_ctx.devmem_fn. Runs under the GPUSVM notifier lock;
> + * the dma-resv trylock avoids inverting against eviction/shrinker, which take
> + * dma-resv before the notifier lock. A contended BO is simply skipped.

This kernel doc isn't right.

- get_pages() calls ctx.devmem_fn under the notifier
- the notifier lock is path of reclaim so dma-resv can't be taken under
  the notifier lock
- dma-resv also is an outer lock of the notifier when memory is
  allocated + migrated
- in practice because BO is private (dedicated dma-resv) a trylock
  should always work unless it moving elsewhere, e.g., eviction

Somehow tie this all together into a coherent kernel doc.

> + *
> + * A shared device_private_page_owner can hand us allocations backed by a
> + * foreign driver; skip anything that is not an xe BO before casting.

s/xe/Xe

Otherwise LGTM.

Matt

> + */
> +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
> +{
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> +	struct xe_bo *bo;
> +
> +	if (devmem_allocation->ops != &dpagemap_devmem_ops)
> +		return;
> +
> +	bo = to_xe_bo(devmem_allocation);
> +
> +	if (!dma_resv_trylock(bo->ttm.base.resv))
> +		return;
> +
> +	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> +	dma_resv_unlock(bo->ttm.base.resv);
> +#endif
> +}
> +
>  /**
>   * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
>   * @vm: Pointer to the xe_vm structure
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 2ef4ef026ccd..585ad64b672b 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -128,6 +128,8 @@ struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>  int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  			   struct drm_gpusvm_ctx *ctx);
>  
> +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation);
> +
>  bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
>  					const struct drm_pagemap *dpagemap);
>  
> @@ -356,6 +358,11 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  	return -EINVAL;
>  }
>  
> +static inline
> +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
> +{
> +}
> +
>  static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
>  {
>  	return NULL;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6b793ef31537..0fdc740f1a41 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3260,6 +3260,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
>  	ctx.devmem_possible = devmem_possible;
>  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
>  	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
> +	ctx.devmem_fn = xe_svm_devmem_lru_bump;
>  
>  	skip_threads =  op->prefetch_range.ranges_count == 1 ||
>  		(!dpagemap && !(vops->flags &
> -- 
> 2.43.0
> 
