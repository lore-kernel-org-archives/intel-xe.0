Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A33CA0EF3
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 21:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B24C10E07F;
	Fri, 30 Aug 2024 21:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvNLHtW9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B33810E07F
 for <Intel-Xe@lists.freedesktop.org>; Fri, 30 Aug 2024 21:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725055088; x=1756591088;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mh94yhmKunKtasTSwNrfM4yaiLbMU987OCxTGN6pgu4=;
 b=lvNLHtW9eVIf0+KLN1tH/YJVWYkjOtbCHvUSa5T2mc6C5z7QM+F0HUkV
 vSkuZsDrdF9TiVciXujUUtenbmdb5xeIhvaUULbe0iu/n2mCvQ5ouq2Q+
 WkDUiJ19tgLfw6uaWEHhlSWIciKLyjFLYphSFb4pn3MjTw+VSdNs/hdi5
 5riwdkCBcZDG/JhpHlPCwBwFFlcNrVcIuZb1ydK4zTbduWszoHzuvkifk
 BCYVfyUTmiAa+4a2f6snATvmZdWfb/nqWbXUnqr8ttl72C8CXxEStfTn/
 5aioUBz+xx2gXQ9Zwn6YK99FGTVi/6HEFreO/jHcZYl/iJYAAtpZDDezn g==;
X-CSE-ConnectionGUID: kfIwX/iPSkWTWCiprr0OZQ==
X-CSE-MsgGUID: r+qgOuQ0RUu65RhiSpLF1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="41207568"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="41207568"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 14:58:08 -0700
X-CSE-ConnectionGUID: 6rqqQM9bQZmIGC5CtiUMVQ==
X-CSE-MsgGUID: PZCHOjJRSsWOcA6wVxNrTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="64768877"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 14:58:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 14:58:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 14:58:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 14:58:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDXCetnLKKFCCOVuhvbWUE8Kp/YNCDq1fcs9QfM3myO3CxLCzgriw4QzF0M+6uPHDh1wV7jUF7CC8+kODDGomhRRt5UqnlzjZkIyjGpq5Com0EtqH8pLjF9iNkZgm4pnXHvDxx/f0EcPRpQECRvnyBCf1qvOuQY1WOgtst6k0yZz/WWfLzexwjPQvKWt77p1JMNK4BxUCLR5RmiuJyomcTQx1GSFeB5YCwXX/+wXpT6uur3PB9x/pBw+8u59yhkgW+GuBO4Q0feDeaHPisEhpGGUq5nrjN0TcpG7/5JM15e9JChHnLwQ7Fos+7zvXBb1vXyJ8ofcRZ805YvonmGzEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cH6zhG/2dzTkDOrk1+LiyZkpYkNsEVg02VTYlGKJmDw=;
 b=B8zAxPyXaDaVTv9UOD8MPB6sXpmcAKjmKsP0WZ2GA2/Q6HcnYNcxtK8vEofjtSehajvf+gZHTGWeN/MLHNZUKul0Ns+JzomgJz3aJsfkjZ3YXtObS/buuzlFfO1llJTOBAV+Zgv/JOpv27a7TqTLcDTFdaf3d9s98t+vUt4NQzelLkF8Zw4AxSQ6IFsavPWRN6UoOYzKkkHWrcba/NRnRVmO9fxqtPZdpFJWa1PXJu1QsDXDQidRgawXiMaarRsKqiNAgfbG83KtdYv/7VQkY2iuPSkLtj/AToZrtRG/u+0hXrnpNzUKsihHoIxpYO9evTeFq5Gx5OMpPMZOH8FnnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Fri, 30 Aug
 2024 21:57:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 30 Aug 2024
 21:57:59 +0000
Date: Fri, 30 Aug 2024 21:56:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 2/9] drm/xe: Add ASCII85 dump helper function
Message-ID: <ZtJAC9l/gaCnBPdA@DUT025-TGLU.fm.intel.com>
References: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
 <20240830062310.3450387-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240830062310.3450387-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BYAPR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:74::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 52e31d91-52b9-40cc-3cec-08dcc93ecfab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?arqLqETH3VZRNJET+A41xi4BmSb00DNrn+O9CotXgwFUDkHGhQwu9duJQRrj?=
 =?us-ascii?Q?MjXtutOO7kC3ZaEWju7Ne/rILu2U1cS+ge6rawiUCSUug5/qxB6FvjAaah2K?=
 =?us-ascii?Q?Ihr/qEareY5yyNVVqSFYRSXp6OvU6yPdrEd9iBHvGCoHcMADbLTKhurHnitq?=
 =?us-ascii?Q?ac81AecYTdAEzmPhZHTUsxS4iGUdaAxcCkr98mP3iwhlJHWSSDewcPHc2ZVH?=
 =?us-ascii?Q?8EFCpeNaScvC+E2mL+Qt83u05iCuQHSUi6gxpGALRr9EdB//wDJrrWnlkGh1?=
 =?us-ascii?Q?b9D8CQE/z8qHIhPAYJKCeO8Yq1n0vxCD3hnAp9s6HWeDuFBiZaQiVU/X688v?=
 =?us-ascii?Q?XZTFsgL1ynGOh1xYMfLHCRHdLaaBJUIaa/0RUBq/+FAncl25+xAf6HR30UpL?=
 =?us-ascii?Q?AZXjkAJIoFHt2/Dmy5S3rav98WcdAlq7XzQ0qR3E38X9Tdgqmq2pDC3aib/4?=
 =?us-ascii?Q?Jq96vxrdz2dNN0Z5c+HWRIkMp6hVm8jVJGQbLkZrtREvurvgRvEtVza5jQOr?=
 =?us-ascii?Q?1s93mXSbL2Au4ouOIN9whJ5hd+5b253adTZwyae1Wdy29v7Mw2u6ac/5PMgf?=
 =?us-ascii?Q?BuddLJj6FGM5XYcPU6WYtd8n38A/yHeGiPL3snhyOzvRVOrOIX/VgeNNj5Vl?=
 =?us-ascii?Q?2nup7qDmM8LOS8WRhdHXNnD4fC75ZYxzZIiQq3OAPQhCB8XxEx4L8d8v3vbd?=
 =?us-ascii?Q?xic+tubD6Z543XZ2pnFTUaOTQSDHN2XRI0abWUUVsGvfCHI3vlf3szMCjJKT?=
 =?us-ascii?Q?GTudT9aDy/bXhhdQEqE0o1sZEBLSOc7bXY3+lI8sQ46Ulyz6v7sqzArFE7Pu?=
 =?us-ascii?Q?eqpOXyzKcUK4QD3ndhy6v7pJIDymFETrJ4776CfjKNoXUR5QH2bMZJidxmhc?=
 =?us-ascii?Q?36CG3efYdZ0eIhIm9diW6W1svlHTDicFOu/McleXarNMAJFBfDZMLh5tqYdZ?=
 =?us-ascii?Q?fEvad4B/n8ucghfDvfAPE663JBxJZzVVaHKVB+9QH0DEY6mb2dRE+K74tyil?=
 =?us-ascii?Q?+z+b3deEGPWbvSfYxeUBbrfJsNqlSIKluVMwLA+KiXhOLY7Iov4KOMy6Q/g4?=
 =?us-ascii?Q?iOurh+xDlWPhChZ4g7hdkYfIg3JqY2Ce5qpmyWLDMGvyQDvMZq30GswRTGqd?=
 =?us-ascii?Q?FMw4GJBzzYRhpaH5CtCzp9fJ5OgWNYGjKdrgTUDPyUhEx1IxFyma33d8JFAn?=
 =?us-ascii?Q?eBBp0x3IT221dMW3hVouUh7l9ixeAV0r0OpBOjFFUnasWpc59cAmQysZJB5r?=
 =?us-ascii?Q?+mm5ieaABtoZl7VMqKf0ePMzr1KyGmmVrgSbY9RByrmLp0R1cY1Xb3Algfud?=
 =?us-ascii?Q?3ziCBx51odk6yPYW2l1lNiFJVxMHmWPGawwsUS2CqrClDA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CEGjtHabvxWSSI2kTj8mx53emXx7IiZiO7MuM2y307Apzdw+U6VdUnqD+VNQ?=
 =?us-ascii?Q?STOZQhjxlVdw9rByMyasr7ifKaNwfvpPr4tUBuJ9jrET0f+awt69a1FcJ7l5?=
 =?us-ascii?Q?PBbxnEsFeaZQ3yLbwHG1ahr9qr8oXeJWf+HbG1d3dAqfY9VRihHh+KS+3RUH?=
 =?us-ascii?Q?lsVyUl/SRUFjt6HcNSZC/a+iS5Ssx6qQulnzbbYHUlNuAE0y71JL1IuLY9wS?=
 =?us-ascii?Q?boUF2v8i7GD8MHnTU2nOGUS7w7sYo0uEJHZt24ofUzldpuJsgMnnTZx7B3rE?=
 =?us-ascii?Q?l+9Wtb+9iHnnLnSINUeborcleYObblwJt9UIE/Iwh4QsfC17iSBo6jc/dTFV?=
 =?us-ascii?Q?6qZaQ5zIvXoFvnqnlOjzPkxNNSjlBgrVHTZNRFjDU31gM/YuBqFhEiYm7Rlo?=
 =?us-ascii?Q?I6aE6Rm5BZsRHJfULcYR3IcfUeGadlNdBFGEJBhlzBxyTzt88fc1gTIO13ZG?=
 =?us-ascii?Q?+y9M+u+xf6YGuVgvnrHG5ogxZHcUBIKFXqXzko4WXRT6fNEEBgHKiNrjRoJs?=
 =?us-ascii?Q?rM3LORkXFJIOsHLSN3hgDett8BKcB8OxLPBpYJ7U9wsx23NYEGva4D9bMCEk?=
 =?us-ascii?Q?pd2V0qWBJoQyXrv7zAkXPWdKU9GTxQlNjkV8G8FX9Sm65Pjc1Z3lHhsxu7fZ?=
 =?us-ascii?Q?0gFiy1MTYluf+TplcoJPJo6/cnXJZX77bC4r2fNls7jltQ0udbP8rbuaiLRG?=
 =?us-ascii?Q?M0kzYfkHkxGIq+bS8FnMeLH4ucNKHsjZBZbbOp6gplANACS4XWWqLJiHybVA?=
 =?us-ascii?Q?IDOjI16vXjfKBym3kmc0vDNdx/5buHUWFqsuHp8Vc02XArPyczGo9UsayRL+?=
 =?us-ascii?Q?82fSqzKuGuDc572u27Ucs6sHyB9wBwBGH5x9ItyQSxXcAlNbUMW7fpihQsVe?=
 =?us-ascii?Q?y6+iKmZF1elwJa9Umx4VI4tzkeW0djiHFbQzG+NOHhG7ESkdx3gMmOAaHdvs?=
 =?us-ascii?Q?wGZ4bqqioaVohYPQcSYA9LwGrHJEhd6p6VX4/17LvYFLuI1I4FcpAYcG4q/7?=
 =?us-ascii?Q?p/UTk0BBCJtx2gKz9ZnAKbf+t6Mo+Ndzo5a4XI/3kD33dffeHUbnBp+/xVhZ?=
 =?us-ascii?Q?luM0jASGFYOenMNPedQv4/XVEcUt0+vPJH20BUWdFpKXAXVMgpEuvlnNayvZ?=
 =?us-ascii?Q?tS300vlwLMkc4aQx0+iPpJpxIeBbL6J3pEon7cKYmUC8n/AQN4/JxM+Ea4U6?=
 =?us-ascii?Q?35r3VhdEmD/8qWsGq6n2Cl+ck4/mK2uhrwd8yNhqk4PNJSMfoeVE8Au8ZkJo?=
 =?us-ascii?Q?A/hVyzPisBL9ScJ5N04WQYDTIbbgNwG4rZmkwcZ39MwGHFg4d+56JomtCAVW?=
 =?us-ascii?Q?n2XvxBDKLhveyfshvL2tMre9gPYgFTEYGDU93QM570xOSmCM2nY77h4BMXSc?=
 =?us-ascii?Q?N7vMK2tT/ebVCYYlCwlxZkp+hkoRJ6IXQlZhuKogWF4985B4b/egeFAz0Jcy?=
 =?us-ascii?Q?2j5qY/zsjzjrZGNYIPsBJgX3NTPqJlAtr92J8BpUWR2zPIikd8SbtBhjfpJa?=
 =?us-ascii?Q?TcloGVuuzvHlsvu+vd3gkuHSkEW3tRCAFOEJuskKLI6EoQLu+BmaJmKPyUsg?=
 =?us-ascii?Q?1bVks6F0jD5Qx8G7p9T7CvFEJOPbowW/ZvV4DTFX1Xac17MV3UqgiHC4cb3D?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e31d91-52b9-40cc-3cec-08dcc93ecfab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 21:57:59.0180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLRP9EDibAA2GXxBXAs1mvjKH7pDquxZrpQobQEF6hmyPde+eMsTggWpQpREd3kXAxgR6JIky9oZyXsrqu+/7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
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

On Thu, Aug 29, 2024 at 11:23:03PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> There is a need to include the GuC log and other large binary objects
> in core dumps and via dmesg. So add a helper for dumping to a printer
> function via conversion to ASCII85 encoding.
> 
> Another issue with dumping such a large buffer is that it can be slow,
> especially if dumping to dmesg over a serial port. So add a yield to
> prevent the 'task has been stuck for 120s' kernel hang check feature
> from firing.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 76 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_devcoredump.h |  5 ++
>  2 files changed, 81 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index bdb76e834e4c..eec7b89ab48b 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -6,6 +6,7 @@
>  #include "xe_devcoredump.h"
>  #include "xe_devcoredump_types.h"
>  
> +#include <linux/ascii85.h>
>  #include <linux/devcoredump.h>
>  #include <generated/utsrelease.h>
>  
> @@ -310,3 +311,78 @@ int xe_devcoredump_init(struct xe_device *xe)
>  }
>  
>  #endif
> +
> +/**
> + * xe_print_blob_ascii85 - print a BLOB to some useful location in ASCII85
> + *
> + * The output is split to multiple lines because some print targets, e.g. dmesg
> + * cannot handle arbitrarily long lines. Note also that printing to dmesg in
> + * piece-meal fashion is not possible, each separate call to drm_puts() has a
> + * line-feed automatically added! Therefore, the entire output line must be
> + * constructed in a local buffer first, then printed in one atomic output call.
> + *
> + * There is also a scheduler yield call to prevent the 'task has been stuck for
> + * 120s' kernel hang check feature from firing when printing to a slow target
> + * such as dmesg over a serial port.
> + *
> + * TODO: Add compression prior to the ASCII85 encoding to shrink huge buffers down.
> + *
> + * @p: the printer object to output to
> + * @blob: the Binary Large OBject to dump out
> + * @offset: offset in bytes to skip from the front of the BLOB, must be a multiple of sizeof(u32)
> + * @size: the size in bytes of the BLOB, must be a multiple of sizeof(u32)
> + */
> +void xe_print_blob_ascii85(struct drm_printer *p, const void *blob, size_t offset, size_t size)
> +{
> +	const u32 *blob32 = (const u32 *)blob;
> +	char buff[ASCII85_BUFSZ], *line_buff;
> +	size_t line_pos = 0;
> +
> +#define DMESG_MAX_LINE_LEN	800
> +#define MIN_SPACE		(ASCII85_BUFSZ + 2)		/* 85 + "\n\0" */
> +
> +	if (size & 3)
> +		drm_printf(p, "Size not word aligned: %zu", size);
> +	if (offset & 3)
> +		drm_printf(p, "Offset not word aligned: %zu", size);
> +
> +	line_buff = kzalloc(sizeof(DMESG_MAX_LINE_LEN), GFP_KERNEL);
> +	if (IS_ERR(line_buff)) {
> +		drm_printf(p, "Failed to allocate line buffer: %pe", line_buff);
> +		return;
> +	}
> +
> +	blob32 += offset / sizeof(*blob32);
> +	size /= sizeof(*blob32);
> +
> +	while (size--) {
> +		u32 val = *(blob32++);
> +
> +		strscpy(line_buff + line_pos, ascii85_encode(val, buff),
> +			DMESG_MAX_LINE_LEN - line_pos);
> +		line_pos += strlen(line_buff + line_pos);
> +
> +		if ((line_pos + MIN_SPACE) >= DMESG_MAX_LINE_LEN) {
> +			line_buff[line_pos++] = '\n';
> +			line_buff[line_pos++] = 0;
> +
> +			drm_puts(p, line_buff);
> +
> +			line_pos = 0;
> +
> +			/* Prevent 'stuck thread' time out errors */
> +			cond_resched();
> +		}
> +	}
> +
> +	if (line_pos) {
> +		line_buff[line_pos++] = '\n';
> +		line_buff[line_pos++] = 0;
> +
> +		drm_puts(p, line_buff);
> +	}
> +
> +	kfree(line_buff);

Dive by comment kvfree per CI. Will try to plan sometime soon to give
this series a thorough look as it has been around and definitely is
something we need.

Matt

> +
> +#undef MIN_SPACE
> +}
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
> index e2fa65ce0932..3f82188590ac 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> @@ -6,6 +6,9 @@
>  #ifndef _XE_DEVCOREDUMP_H_
>  #define _XE_DEVCOREDUMP_H_
>  
> +#include <linux/types.h>
> +
> +struct drm_printer;
>  struct xe_device;
>  struct xe_sched_job;
>  
> @@ -23,4 +26,6 @@ static inline int xe_devcoredump_init(struct xe_device *xe)
>  }
>  #endif
>  
> +void xe_print_blob_ascii85(struct drm_printer *p, const void *blob, size_t offset, size_t size);
> +
>  #endif
> -- 
> 2.46.0
> 
