Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF671C83030
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 21:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8265510E1CB;
	Thu,  3 Jul 2025 21:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loDuDfKD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49E710E1CB
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 21:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751577320; x=1783113320;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mkP+2NvyBkZ89wABoTyXeMN1tfU7hrZD2fU9uundMsQ=;
 b=loDuDfKDstSkBf6cb1Qko5a0cQMmFLTIgw4Yb73aJHas6uP/D6M6IBmv
 RrFc/VFMrFL9xhq8NY8E8SAxz7fjjqtYE/LoiuQ8tJgSE+EhdgKcUTnCd
 uei8t81oTOteaosVyx4L2Qx+CHL+X6K1LLXcasRK4PeO4IdVxGX2BsZCz
 BQV+ShMm9rH9XtuF+SUsyha6W+AvgNSHQh779wdaTMLbj45t5zd0aMVrq
 MaKyZeTWF/zFNJz7QknJd+iUID1B8G/L0ftv5umcnuuR7kiaTfFrSGbHM
 E0C93rFyKgq9OaKF9EqxWmJ249kxpwvxgF1vLbpEmupum8+KAhEiKb4Dw Q==;
X-CSE-ConnectionGUID: Pn7rMOmDSiqgc+h8oP3nFw==
X-CSE-MsgGUID: kZRjZkYESZei/l9MDnFHDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79353280"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="79353280"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:15:19 -0700
X-CSE-ConnectionGUID: DJfqhKE9REyNid6uOL7QIw==
X-CSE-MsgGUID: y92dWXYWTi+7DeP1hlcGhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="154240779"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:15:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:15:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 14:15:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:15:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wjRmzP0gQ4g9+9W51juxxupl9lcu8XBmz3exY2mf0QCoiGcmQTalUOzXZX3x61FeNL2lEOJTT4DXvQiBVJqJ1Ufi0JAdoJiweQGm47nwbhHYs0MTjQIzB0ASoqo4iVC2KI128kGNjkh+Um8DDXY0taPW6HHqjgWjRRM+tljlA4kDzeg+evhg9y5/oSYtGhzR7YmhQxCDIGai3l6vRVAcvZw5Bilia8vYhFGYshNmwUXU0POnDkjdJPljmSYQguw9Xwf0+OL3w7KUrOVaXiaQ6w3tCP8A3ehlbMkWRdCE7nRBl/Jq9NnlO76Lg2hea0jDu1d6IQmstZ3Kgab1UR23HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zA5sCmnemjhU48rGpJ/Ntk25naaVpcXgu1W7FtAR1EQ=;
 b=elG+M5rxahBl7z2hbgZAFHBcL5OnXOmXZKFszn9RaE8CHNWQVoDgQGJMgrpAKAvztcT+YTFM268BuGfxxl1+o1CNAPi2KJSwhBl2vPlJZtg+5XqQMR7VhJte+FSm5hoBAU/DUD/QTFMqWKEHaolVsTO8p0TwZEs/0lxgYWlAOlGjhfrN0NM2NG6DwqRovVwiBuKau882vDrAbwSg4FVYHPpb1bmqaO0wRoTiuhL0tkehMX/Z4aWJ6IDsGPZvr11liRCTKQvbTQF1cyyWhP8vC4+5jZNNyOi1ZPrOLlY3UTD7wxyurAajDctDRkuCBd/7KrmfNBs5/9rZwmhxc11l4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6295.namprd11.prod.outlook.com (2603:10b6:8:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Thu, 3 Jul
 2025 21:15:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 3 Jul 2025
 21:15:16 +0000
Date: Thu, 3 Jul 2025 16:15:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5 4/6] drm/xe: Move Wa_15015404425 to use the new
 XE_DEVICE_WA macro
Message-ID: <euso2d47a7dpm3zovziaieaa3n7bwaecuephb5j2v3jlmmhkst@fdz5azdgl46z>
References: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
 <20250702193036.1417416-5-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250702193036.1417416-5-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BYAPR01CA0005.prod.exchangelabs.com (2603:10b6:a02:80::18)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: c9fe5de3-a54d-4d56-72a3-08ddba76b542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EkXHIMsZOJ4l1Pjz6faL09SaKQgz45w2ZiwQcLKpnOLSzdSmZ1/ob/LCyUTN?=
 =?us-ascii?Q?32k8wP07l6onyjTeD2fvqI5dQ8kM5xjoquzgzK9+FqY4EOkx8d3H85cVGGnr?=
 =?us-ascii?Q?VBjKajvWE/Qwp1K5xTATX5dyJ7Fe7IE09JSKZQz+N90zfZEcw58/tJXRVXEN?=
 =?us-ascii?Q?5kZamtpyNwgqgfJcqDkkmG7hoDJCb4DGAzAcqID7eyeuv8Hb+73NQsLXxw08?=
 =?us-ascii?Q?VL968RAMPu1j5MKq6HraMzR/SAVZQf3kblz3Fjknnikc3YtVIDIzzCUFUhkV?=
 =?us-ascii?Q?1RLcWsVJFKVjzkiPKdWUq2/OVIjVN6nHIEDFIwx6IL53ZlHzjvBCbpuEObKr?=
 =?us-ascii?Q?GdyoPLZz+JYKbCfvDmDf5mXrt9S8rUAsvGHNWhsTSayJ88qVgHPWx8MK9pKo?=
 =?us-ascii?Q?5SKl1yTutxnzyk4BNDt4YEfsAmGzK2m49S8W0XQs9ihALFQ4WXeFTCJIuTLl?=
 =?us-ascii?Q?WkT6H8oB8XCliq7UXxviEZlxKRn+oKLyueOPA8UonYq8MufHbauPjI2VUUQv?=
 =?us-ascii?Q?THFTdCMJHMK/aAvyB0tlfnxWoTJy24lE3+74wIfGJeTEnKuhk1itr89prRsA?=
 =?us-ascii?Q?f8F30b8ZnEm5LH4+QWmZFA4WJUzh+iussCX533P5lWINe8NaMbQdbxaPC5L3?=
 =?us-ascii?Q?6oVf2gIF1Qz+zs6R/t+wF9cekTjpAjmYwbIuEf2PXm3FNOMizhtnmB7zdYkM?=
 =?us-ascii?Q?mnLR/bVCbWZUroJzCG+ImPlxJW4EqwsFLYIlsDZqnh+UJaIeVqMs7uQJ3Rd0?=
 =?us-ascii?Q?d2e1YJcJm1AHGy9xkn8LiKztC5oP9ON0j/WIBTWVJoIO0Qn/C+BaB9ZGVmcf?=
 =?us-ascii?Q?Z1IPb2iah9jl4LjvMY/5eUnylEqDG2P3Hp201+Kvrl5T88z8l9NBRSM2x26i?=
 =?us-ascii?Q?afU8LdgbSO5mUkRs4kk6UXnaT6W8/FCpe2OycEGv1fSOLhuN8w3kaT9pamnr?=
 =?us-ascii?Q?8+VvgzouUAozBI/FguzXbe8OwU1fVQebwBCFdZR2H04xiLG/rhLAaki6q5b+?=
 =?us-ascii?Q?U8V/fMu1kFdt77Nix6aOYyV5ntewJFoocsANKHfZSUVlQfxojb8qhNlqufB4?=
 =?us-ascii?Q?RVAZwnKsbCL7HBQNQ4LZ05WOYlbT7L8XATq3rhbtGWEE8ry47lU93XApN7Lm?=
 =?us-ascii?Q?mGDTYNilFNI21TtRRmDwhHAmIkByu99fA6Vy/zX3NKUGFwN5h21RMbHDw1k6?=
 =?us-ascii?Q?Boy4oUlkpI5aKoWfuxwFZ1kjx+KKXlJyYxrKok0ILK6p2grp7fvZV5pFiuzG?=
 =?us-ascii?Q?n9UIiu+lXx+vqSHyLM5qEmzw2Td6Eom/Gp/MdstV2j/cglKHRIPmr1o9HEvJ?=
 =?us-ascii?Q?Wce5d+gEI0suaMgzxPBr0aNbxPtqP497Yt2Xke1vZX7HZIqsTffD76kHnou/?=
 =?us-ascii?Q?D9UfuP73kwxT6CQ1d62t/AJhnoiRbvLQQIVBF50Ua+QC+QVgSbP5PL+kcdhy?=
 =?us-ascii?Q?KCXQQRqxctE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zzKDa2y4kQrWhpPDi7SDXjPOMZW6CTn8pOBzisUMUM5jgsYk+26qIjt7q92n?=
 =?us-ascii?Q?rmGYokhWG/nVr9lUa28jN+REN4sEAlnuiKoeep2TrLsp5nj7YrV8DzV37SFN?=
 =?us-ascii?Q?8fv7PFdBRIIgNG+KPTAkXmWeO0HVaxqtFEKqn8X51dHBXI7dksx97o3ZNVv8?=
 =?us-ascii?Q?xmtAl4In4pW6FGfK7xF6QjVSK6J9YcHWIPkCck1mAFtG5ZRojZtkfE8wtAbu?=
 =?us-ascii?Q?y3B74VEtHD+0L07wDnXdPk98XoRLddZxKUaY6XHdyup3kpaCUzJN97XYOeaW?=
 =?us-ascii?Q?4R8pQgzTFDPkTUaYQ4mCrGvmscPrxQ19MnB4nlgNLSmIieIF/bYA+aGMaT1V?=
 =?us-ascii?Q?gk1DDXd09bKL6DxOib1v7rFcYToPrwrRTa4mZG8VkrTFqu0/vT1FuJuJM9vx?=
 =?us-ascii?Q?dJfqEJInJXdnpsPAndUqO7lyx2/vLYt2Ki2ckuV/BGQCgGr2cm5pwg62pXfj?=
 =?us-ascii?Q?ADDrjCQsI6mNG6AUDobvmR4cqgmXqiFMtJor+OAZR4EuQ8xn6dSqkLiVeHt9?=
 =?us-ascii?Q?C3PsQKfzdmukPok+bfzHLqY4ZyPXL+7PYwOXaLbovwU/7lWi4Retk6kAAoIH?=
 =?us-ascii?Q?NnNqX50KIqkgjqVvQTNByoip4GzHiHb6b6Hh5C1a9t/NZBqmjT6KH7U1fTfq?=
 =?us-ascii?Q?EjComKryscOznCqYjUBT1iod9en1XuhYbiJIlTTAsuTtYxn1ykM9iad0kKOa?=
 =?us-ascii?Q?ZcDpEjEGH73UvYuaNFWJpB5gWBXb0qLn2QVpm+7EeQ9nioMZ2NzQPNmUitFx?=
 =?us-ascii?Q?bibRQX+AAPF17hvwlb2+U4TywZxpQULXKc2TP//F4Z7nk02Jb/1OiHhNxlq/?=
 =?us-ascii?Q?UxCDrJv76Sf/52X/J2UKJa0hVQ7StuUgTXSw5tjWf7NDGPCsqa8B7sKdUIoT?=
 =?us-ascii?Q?h2fIR1704P9BIJUG7Hj4E6I3ZB+6wqDAqkd3KhHNJiPlYMuWuNnSujOmfrDm?=
 =?us-ascii?Q?sLYs5P+o4PzHtesdpJ5cDEWvcS+fUI/uA19pLIPYeKFvuaBpey/yJWjO41Ye?=
 =?us-ascii?Q?GYPQfXC5Os8edeit92bIbiAFSyHJVsP41fh6514J4Q5NtTzaRspPOVegglGC?=
 =?us-ascii?Q?Zi2wBKLXP0thi8MNNOgDHZbP0ABrbQptbeFgw+QuOXMTRNnbrTSNmG2x470c?=
 =?us-ascii?Q?9HDvLK5J/zSFlQ5D6fc/KeoH5vWiag3yq0Jx1pCm1beVqhETTcnp9KBr5KD0?=
 =?us-ascii?Q?5yn9Pq0iyb0fIxtLTpaU/Z4bW9b5kmMS8ujur4wmp1mMnbURHoSS7IzGh60v?=
 =?us-ascii?Q?asWcAnoJJIFlLqOEvxdL3+s8MqqwPDXdK7TzlquITQWS1nmQfYC5ZKz8Sxby?=
 =?us-ascii?Q?gTaaNRAnr/dYJkOAydIc5StP3C8A+MF+nOJUxncNLGyHw6PymdW5cOtU8ru5?=
 =?us-ascii?Q?V0pd9+X1xybIOKxMFOTZN2wmeJjk9o+LV+nYs3tEQaTqgrq5BV150CTaa7TD?=
 =?us-ascii?Q?OOPltBWgsaVMLF1qRSlWVVbrOrwDqvpZA2Q9rTg5Z+l74FAWVAU9L95Jtg5V?=
 =?us-ascii?Q?QtbYw4X5EET/b0K6hCTz/fqshCJpv7IuDkc3N2xgtyBTk5C7MBH4WEIKdfM0?=
 =?us-ascii?Q?0ZPMKmv4XTW7+uCWEHJyJa9oG60VJuZU96wy/P9s8BIMeakj5zbYN8e0z4tY?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fe5de3-a54d-4d56-72a3-08ddba76b542
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 21:15:16.7972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKzhD+tsoD62mtysBZ+YAdanCQ2BsGBlcwRRPWHvtIWTH2N1QPM/XOGt9fYlkanKB+BueLv8DS6tIbDP8NC74uF5xXmrDsJsNJY8Pd1v/FU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6295
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

On Wed, Jul 02, 2025 at 12:30:34PM -0700, Matt Atwood wrote:
>Move Wa_15015404425 to use the new implemented OOB macro XE_DEVICE_WA()
>
>v2: rename from SoC to Device
>v5: move workaround call back into the flush call
>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
> drivers/gpu/drm/xe/xe_mmio.c              | 5 ++++-
> 2 files changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>index e69de29bb2d1..b7d12ea4d65c 100644
>--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>@@ -0,0 +1 @@
>+15015404425     PLATFORM(LUNARLAKE)
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 7357458bc0d2..f92fd8e97079 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -22,6 +22,9 @@
> #include "xe_macros.h"
> #include "xe_sriov.h"
> #include "xe_trace.h"
>+#include "xe_wa.h"
>+
>+#include "generated/xe_device_wa_oob.h"
>
> static void tiles_fini(void *arg)
> {
>@@ -163,7 +166,7 @@ static void mmio_flush_pending_writes(struct xe_mmio *mmio)
> #define DUMMY_REG_OFFSET	0x130030
> 	int i;
>
>-	if (mmio->tile->xe->info.platform != XE_LUNARLAKE)
>+	if (!XE_DEVICE_WA(mmio->tile->xe, 15015404425))
> 		return;

since now we have the info in the code of wth we are doing this, all the
comments /* Wa_15015404425 */ can be removed.


With that, Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>
> 	/* 4 dummy writes */
>-- 
>2.49.0
>
