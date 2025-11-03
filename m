Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E7ECCFA03
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 17:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82EF710E488;
	Mon,  3 Nov 2025 17:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBzLdg5P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA0E10E488
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 17:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762191279; x=1793727279;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Uf3CT501QlN9YzZhcAZrm55S8LIcdpNHe+kmvwNXUSM=;
 b=WBzLdg5PIhCX+pxCaIAGEwlnfUWwDYD5nP4iHylh7l0vvuaWNC09tpQn
 nayzvo74+1mjdc1mE3WAUKaAuvbQ1EECRep56QYZCvcCVIV6r/spZmhXI
 38F5dTBQxjfy85YiZfkUc5XDxCuuYhHUN1BY0gOSYkhRRQAcHiUnRgxT7
 W7Q5vao03igRi0Y8JLOqHMyIv56rS3ninlBgKaBZb29/nK59N2ei/K4gY
 e/1lNH3QwqiSVDqOvMB2aiBfZognGXgicQPlICFAaPMubaYlcf9aPmnxo
 YnEgbK9zRrdXqbop9OA3z5JumSVruUb08/v8gBq3jrenpTFso4XWv+ewH w==;
X-CSE-ConnectionGUID: jknUQQFzSDq46EHaRPZKhQ==
X-CSE-MsgGUID: REqEvwd6TBmMxxGuMbc+xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63969662"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="63969662"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 09:34:38 -0800
X-CSE-ConnectionGUID: g/6GK7UDSkeLEB3kUY+sKw==
X-CSE-MsgGUID: GWcZ+YguQqyouZKuCo7g2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="186214150"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 09:34:38 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 09:34:38 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 09:34:38 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 09:34:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9vsXpQcUt5XNkLlWSzHAJLxAJk//hW/5y0JuKTyFoYcoLy6kiyfpDdNxGGTu8EujORp2tR2WKx5MbHuBQyNm5ZMIl5qx7zGcPHH9IpYIpM0fW4umfJ4nhwA+rh70W68IvGxDMF4tOt3ADClpD2UIp2nj6qJecnbhqGyslT6/WqmIc5dHUf5bYpI1oBzwVRL+UBngzcxAOOlniWIixk2CXVyFOzrBzyHvodvtznUdwyoOR5Qe7x24GBSlofGtOmdULiElvA78t7wjCdVmH5hLTJRDMf2dLUBOaSLP3zEqHJ6zrCeRRUcJ+W2mA9d/RFKgYxnF4s3ab3ysBZLn7zuNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDtfnzVRiI0ZecBxUdgQE1X7zPqDWKMXUzTDZ27kH5o=;
 b=QzNXluEWWIIszNMz981sYWBtxoDbuiUQp50onU0o8mCLGRDJmHCSGHje0zlR+QVTGfNHxbqYICifdqH7YNos1frz6ZUqZ1zq72ej2grgEzPYNzvOf5AIKgeRzkVlGUoN5pAOBLNpv5RXORgf0P8m6bxIKrk9NG91eQJeCJvTFH6QOne9sn4MlH8sA3p74JqKryuxq4sWHI8fnXM1XAWAmxUJF1NNLk/AMXEcxh+8E0oREzr9Hfl7Ax4QSxLXOkieD9YcG0o22l6UPl9Ir+JumcbQDJWufikzyTLbbQIHry84M4SC1XHJ3nFgPPoIwIwWq77H37f9eXSoyl4hC7uNKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Mon, 3 Nov
 2025 17:34:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 17:34:35 +0000
Date: Mon, 3 Nov 2025 09:34:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/vf: Shadow buffer management for CCS
 read/write operations
Message-ID: <aQjnqFFctfRw6yP7@lstrano-desk.jf.intel.com>
References: <20251103152006.1954098-1-satyanarayana.k.v.p@intel.com>
 <20251103152006.1954098-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251103152006.1954098-3-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 530f050d-5355-4459-1b18-08de1aff4181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L3F/mHUuFtC+4nif8qMz7Y7ncS7XEr51MGab5mW5yk9XANjVCp09NmuJz8Vg?=
 =?us-ascii?Q?CRzHva6fzyIctSQj6rf638QwalUWONyp82ECDqDRiSpJ2zsw0QMDwIDEe9Uo?=
 =?us-ascii?Q?/CKrwbi3WI4pq6E1SpEC9KWR0LQghCTR3Fh6ym9NUpP9ji6bB5DJj82jGNpZ?=
 =?us-ascii?Q?yjOb6m8dDc+Ot0MLUCHzzl/XfSNEf6D3mDLQA3uA1klgcCbifygVZi6dzuRa?=
 =?us-ascii?Q?f68D00PCihIGAReyFdXLVNLeVM+/lhVn5ct0SgX0G8cAYhItFhkFchPWyZe1?=
 =?us-ascii?Q?gppJxgw5UlwywErT4vk0oWffZZjvl9e5UyXP8SsIqGX36BNw0I/O2YvoYTyt?=
 =?us-ascii?Q?6lwviUlkl3iOzWE+IYBJb5VyLsNtfc3CqWoYh7isAv9TCoUoHpI5lwNWhi6n?=
 =?us-ascii?Q?v8k5K1v4jzqDyNLDleyPz4mAsuBVQ9m7pfU0p1ep82+KsqLdwjyx7QgLM4Kb?=
 =?us-ascii?Q?XUsV09w7SV53e5a0RdQkzALwZY2CEULaGIIljPbyWGCyh2Y+cgFGPf6TubLQ?=
 =?us-ascii?Q?ef++YVX64HfS1bIog6qiICkkRZVi/KZY8QotbhCj1lRGc0UY1xOHHbBoM6oB?=
 =?us-ascii?Q?ei/znwUawPIpeFzpOVefOPo43NbkZ+niv6p2nlzSKABZlL2Li7RI/1jkmspy?=
 =?us-ascii?Q?wlKmZQ/39Cfpad5wGbY4f+7mk6uB/LknUK5yVEKsRxSD6WPn6v6NT81BcWQl?=
 =?us-ascii?Q?xR86vR/M8wcSZNrNTfW6xyu9aR22YCeaoz3TucKU9iDLMZ6qNfBXZkUomzkm?=
 =?us-ascii?Q?LQrEAZwj1ktDlRZbrFGHrQ/HBlSl0Spxc95/S6W9NaVwaoyQ71QLSLVxq6wG?=
 =?us-ascii?Q?Djb6aHTToKTKVvCSixhkxzqVCkxijgj1H6G6f7dQRlZtv6Oqz9MFyYxOlzSU?=
 =?us-ascii?Q?aBCX5UA6blAwxyXgK2HY4GVsyHPeH1ce4td4BhOdRK89msiIxCKD2YaPEzHS?=
 =?us-ascii?Q?KKoRdU7Dnj1RHweTK6cPBvJM15YkIu9VkgKPsN9MNAB+PUEcjTkZtLqQ4EwY?=
 =?us-ascii?Q?6hRvy7wZjqwKdodyh9aEuluZaiNhGN+RJvCEi2CpBHrueFgsHokQoZdxxKUH?=
 =?us-ascii?Q?82IoR9qjzUwoN/iEqwwYIRBN4vomCvZKeEe9GkZiBfTWvSxOtdEtICytmMPN?=
 =?us-ascii?Q?kvkca2hUxHD7HcClIcZchfxvUkrQCyqM/uCQcy0phq8Bo0b31k0EyA+ALeTE?=
 =?us-ascii?Q?b/lfbnyqfyJsVJ+IzlkQMcCXKur8w1Al/KNrzvSiIF8nWBLCal1yBUKze6Xb?=
 =?us-ascii?Q?EGHY5v/4+NiY9vBmsHGXfK6uIaD+16kPAdUuwTbESMXIz9fq3W/KMnLoM+qW?=
 =?us-ascii?Q?AHOV3+mQnXFE8QYquvm7NFFYcnS4MGrX/VM//A5HXarjxrh6BTYQ2cTHhbhQ?=
 =?us-ascii?Q?AgnF0cWGRDd/lbtHNJOyUeW1uxwFppOIH5NBkIKAWIap4nAz2e99ZnWoS77m?=
 =?us-ascii?Q?QuCE7c5KARDI9FkRF35/+wXrdADh3Wyy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6aBWBu44nn9vYG/DI8/eZymjIv6+gE5MNd+noRDsVuSowmXl7NQ7FGiFvefT?=
 =?us-ascii?Q?opz8R5YWfli0bVrSFzaIwSnOSMqdgrP1wPEISTGr1RyegQF43ZYU3SpEmAYl?=
 =?us-ascii?Q?QwPMMuAlz0wgW52qidB0bh+4VFWV14hdTodwLaoCDIrl0naCa4g1jjATUKeF?=
 =?us-ascii?Q?1Vn/mgbGXRUmhkDbUhhhplUIEnAonSgLyUof/BDp7EW3PVgPo6VOMIwb9Hoz?=
 =?us-ascii?Q?A4uHZsfbfvPKaFrBIuPdUL0ZzqX3/H8yMJam/XkbzpKNsUDh4bolUhGoWuDa?=
 =?us-ascii?Q?Fxwc4UmOwo9LsF3nTrexz/5jnJx5Ckc/64dgZ/PxfAlMzXwaqQwG5S9M9nSg?=
 =?us-ascii?Q?CBAmlPSprjdSNFM7OgTHWZ9p0bfCq5XwsP/oDdHcgEWOSP9TokkWhhDcFiQj?=
 =?us-ascii?Q?YwPG9lVPQkiNMS9ggwlw8b3Ezs62z+YSNFPvIjCl/H7yp0cstPDVYmuMDygY?=
 =?us-ascii?Q?7VafjkcsaQnfmFbCt70S2wkcMQgwOdeZ0x/zd7X13Y/ptmb9QJlEJRIL8kZm?=
 =?us-ascii?Q?5JJg/9MSYUi01mbewkz7ZN/UEoHnfsnYpgXKvOfwP7fqrWKjEHEcEYn0872h?=
 =?us-ascii?Q?lc3xGHKXl9udCN8OhNBN/drrZjKVNl6P4PVQj2ZGTATkMK4DV68lcorkQ2W7?=
 =?us-ascii?Q?HvHXjc85gjxF02BNhriXKoIRvnIhY5GeocY02+0jqXehaphTKs7/sESeZI7R?=
 =?us-ascii?Q?LoZiYukH1NA2UsPbyJAZ+OcjllFsR1sFG6MMNmhzbCQoCFmbkjX2DpAxWFcC?=
 =?us-ascii?Q?lXhWUVaau0l2a6Bp7R7oGZCMATfl/IzPOuuF+DWIkAoMpNdgs4b1taLyF4Sh?=
 =?us-ascii?Q?pDmQhZJ7zQEO2D8uFHo+ETtoOxpySa/bBwDSr/28rLvPyB1CkAXvL6T8yRTG?=
 =?us-ascii?Q?luuqXr/oKpzoNOoZ+SaAbX3Rjd+kUdAB23Xby+A21yCkgzqW7HSH++EOzyS3?=
 =?us-ascii?Q?FsE8Vg5CQ9cd8dv2S4coRDDnu26Ic0Q0bOJ3HEnCBUxalABl6cU+kHefsf5M?=
 =?us-ascii?Q?2lceMO2YG7BvnTjkPTpc+EndFlcRf+sK8fJSofnd/7BvFNoWqgRpTbXFiqey?=
 =?us-ascii?Q?SqCgQ5IuHIHHtZxq8orgl/MPRTLVYBrZLPPF/u91YxVPFi41nSDpiYhIiIse?=
 =?us-ascii?Q?n97XcFeXBCH7apynReFuuTT2Vof+yQpYFGFroppC7WrwxrQpSGT9Z7yP/Y26?=
 =?us-ascii?Q?CEkCLpRyCfhDU7TyRsOSlB4Ng9XxJUXxkuovEV7s6z19LHyxyd7RcZ7av55b?=
 =?us-ascii?Q?BVz52uHei6+/wD017yNU5H9+G7GOdryoJa+TFull5c3Q8JkSj9ubWWfHaPlw?=
 =?us-ascii?Q?z2x0IHzDXxlPf2rFFvQ/7FhALc2ZXBAQiI7dG9YIqMeoEi4EoGqK3OjT1BbL?=
 =?us-ascii?Q?e91JhMuJof5jO8qNn0R0pobvBJi0KFzyo/JKQq/ULQNM1BS6TjP2K3ElaL41?=
 =?us-ascii?Q?F8L2pdEq73ZFwqJ/bCMws/CJ2xkaRxbsX6HjxG7HRWRD7tkYqwFtABf2mHcu?=
 =?us-ascii?Q?UEzfm0w4e1cpAP66Vi9yuJKsDARrkMnCqGPXXr3LaB18A2RnYIfpIPhFKxp0?=
 =?us-ascii?Q?3nLI8+wtBDTYFlxkZrnOl6Aev/vZPwcgA3LCjdhVnKNJN/NwIMIkA/MzRnDf?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 530f050d-5355-4459-1b18-08de1aff4181
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 17:34:35.3431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGOqSnrwbU5U+45ixMt0gzK17pzssb5pll/FGIBo4hSYeXovWW/2d9tPCLms3qX4rUtZP+bCaQ96gliv5GxMIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6889
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

On Mon, Nov 03, 2025 at 03:20:06PM +0000, Satyanarayana K V P wrote:
> CCS copy command consist of 5-dword sequence. If vCPU halts during
> save/restore operations while these sequences are being programmed,
> incomplete writes can cause page faults during IGPU CCS metadata saving.
> 
> Use shadow buffer management to prevent partial write issues during CCS
> operations.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c      | 59 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_migrate.h      |  3 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 17 ++++++--
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
>  4 files changed, 76 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index dbe9320863ab..4c4e4cc369d5 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -34,6 +34,7 @@
>  #include "xe_res_cursor.h"
>  #include "xe_sa.h"
>  #include "xe_sched_job.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_sync.h"
>  #include "xe_trace_bo.h"
>  #include "xe_validation.h"
> @@ -1103,12 +1104,16 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	u32 batch_size, batch_size_allocated;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_res_cursor src_it, ccs_it;
> +	struct xe_sriov_vf_ccs_ctx *ctx;
> +	struct xe_sa_manager *bb_pool;
>  	u64 size = xe_bo_size(src_bo);
>  	struct xe_bb *bb = NULL;
>  	u64 src_L0, src_L0_ofs;
>  	u32 src_L0_pt;
>  	int err;
>  
> +	ctx = &xe->sriov.vf.ccs.contexts[read_write];
> +
>  	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
>  
>  	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
> @@ -1141,6 +1146,10 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  		size -= src_L0;
>  	}
>  
> +	bb_pool = ctx->mem.ccs_bb_pool;
> +	xe_sa_bo_swap_guard_lock(bb_pool);
> +	xe_sa_bo_swap_shadow(bb_pool);
> +
>  	bb = xe_bb_ccs_new(gt, batch_size, read_write);
>  	if (IS_ERR(bb)) {
>  		drm_err(&xe->drm, "BB allocation failed.\n");
> @@ -1194,12 +1203,62 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	xe_assert(xe, (batch_size_allocated == bb->len));
>  	src_bo->bb_ccs[read_write] = bb;
>  
> +	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> +	xe_sa_bo_sync_shadow(bb->bo);
> +	xe_sa_bo_swap_guard_unlock(bb_pool);
> +
>  	return 0;
>  
>  err_ret:
> +	xe_sa_bo_swap_guard_unlock(bb_pool);
>  	return err;
>  }
>  
> +/**
> + * xe_migrate_ccs_rw_copy_clear() - Clear the CCS read/write batch buffer
> + * content.
> + * @src_bo: The buffer object @src is currently bound to.
> + * @read_write : Creates BB commands for CCS read/write.
> + *
> + * Directly clearing the BB lacks atomicity and can lead to undefined
> + * behavior if the vCPU is halted mid-operation during the clearing
> + * process. To avoid this issue, we use a shadow buffer object approach.
> + *
> + * First swap the SA BO address with the shadow BO, perform the clearing
> + * operation on the BB, update the shadow BO in the ring buffer, then
> + * sync the shadow and the actual buffer to maintain consistency.
> + *
> + * Returns: None.
> + */
> +void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
> +				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
> +{
> +	struct xe_bb *bb = src_bo->bb_ccs[read_write];
> +	struct xe_device *xe = xe_bo_device(src_bo);
> +	struct xe_sriov_vf_ccs_ctx *ctx;
> +	struct xe_sa_manager *bb_pool;
> +	u32 *cs;
> +
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +
> +	ctx = &xe->sriov.vf.ccs.contexts[read_write];
> +	bb_pool = ctx->mem.ccs_bb_pool;
> +
> +	xe_sa_bo_swap_guard_lock(bb_pool);
> +	xe_sa_bo_swap_shadow(bb_pool);
> +
> +	cs = xe_sa_bo_cpu_addr(bb->bo);
> +	memset(cs, MI_NOOP, bb->len * sizeof(u32));
> +	xe_device_wmb(xe);

I think xe_device_wmb() should be built in xe_sriov_vf_ccs_rw_update_bb_addr.

For safety, I'd include xe_device_wmb before / after xe_map_wr in that function.

Otherwise LGTM.

Matt

> +	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> +
> +	xe_sa_bo_sync_shadow(bb->bo);
> +	xe_sa_bo_swap_guard_unlock(bb_pool);
> +
> +	xe_bb_free(bb, NULL);
> +	src_bo->bb_ccs[read_write] = NULL;
> +}
> +
>  /**
>   * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
>   * @migrate: Migrate context.
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index d7bcc6ad8464..db66b2ea31a5 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -134,6 +134,9 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  			   struct xe_bo *src_bo,
>  			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
>  
> +void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
> +				  enum xe_sriov_vf_ccs_rw_ctxs read_write);
> +
>  struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
>  struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
>  struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 9959d619addc..35769fb9225c 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -150,7 +150,8 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>  	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
>  		      ctx->ctx_id ? "Restore" : "Save", bb_pool_size / SZ_1M);
>  
> -	sa_manager = xe_sa_bo_manager_init(tile, bb_pool_size, SZ_16);
> +	sa_manager = __xe_sa_bo_manager_init(tile, bb_pool_size, SZ_4K, SZ_16,
> +					     XE_SA_BO_MANAGER_FLAG_SHADOW);
>  
>  	if (IS_ERR(sa_manager)) {
>  		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
> @@ -384,6 +385,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  	return err;
>  }
>  
> +#define XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET	(2 * sizeof(u32))
> +void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
> +{
> +	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
> +	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
> +	struct xe_device *xe = gt_to_xe(ctx->mig_q->gt);
> +
> +	xe_map_wr(xe, &lrc->bo->vmap, XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET, u32, addr);
> +}
> +
>  /**
>   * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
>   * @bo: the &buffer object to which batch buffer commands will be added.
> @@ -444,9 +455,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>  		if (!bb)
>  			continue;
>  
> -		memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
> -		xe_bb_free(bb, NULL);
> -		bo->bb_ccs[ctx_id] = NULL;
> +		xe_migrate_ccs_rw_copy_clear(bo, ctx_id);
>  	}
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index f8ca6efce9ee..00e58b36c510 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -20,6 +20,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>  int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
>  void xe_sriov_vf_ccs_rebase(struct xe_device *xe);
>  void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p);
> +void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx);
>  
>  static inline bool xe_sriov_vf_ccs_ready(struct xe_device *xe)
>  {
> -- 
> 2.43.0
> 
