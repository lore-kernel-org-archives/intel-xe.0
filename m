Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D4ACCFA03
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 18:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A12A10E45B;
	Mon,  3 Nov 2025 18:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQgZtWQ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EBF10E45B
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 18:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762194537; x=1793730537;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FLcuDI4NAaLqttRylCIoi+cpYLD77t9iKplAem2ba/8=;
 b=PQgZtWQ/UHM19IdJXKzyHOzCC6GhxbEXiJKV8ofOtCMlmvciFHczmUpe
 q4ogSXezbq7yoMlxWIWOSle+bwJDu6u8szyJt4ueL+PzPzKwsbKqS7k6V
 FMuR5lRFMeNYPs0RXW4oGYp081E/5vYf6LD2WfP384AjpsMDFeNElrYC4
 ObHWcojm9BPlmPngg453MjTP7YWTgBy9koZhIKPzqID2kw4KBqbmbut9O
 t/DTX+SXRVncB+ahntdx4EFCNLivAOl0NbAsHu6SuovkSp6BazCjMRKJB
 KWZX2fmtCSoncIhGQ+DbXgsG+iyWeIKDZuyVltiniYfNNs5UuiQXaDH5k g==;
X-CSE-ConnectionGUID: Qwzw4v5QSz2O7u46+3C8rg==
X-CSE-MsgGUID: PN7YWo7oSnO0/6Wa5X+W4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81907890"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="81907890"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 10:28:56 -0800
X-CSE-ConnectionGUID: i5a0CeMCRm6voodMegLdMA==
X-CSE-MsgGUID: YU+gphvPQgy58q3UNhSzVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="187659482"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 10:28:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 10:28:56 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 10:28:56 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 10:28:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3tY/GZTi7vlA8sq0L4IctoauvTvmTvAbX8TG/5vrt12+NIMEu6hf754k8J0yXE83hvjbWtTn6GGWfkiV0W5t2aa0e9KQXq01To77KZxoI5W/UIC9RJhCRxH+Ulw/CXKPpERKe1/zKKHLMQ9RJCSIVmEzWou1+3Buo97AiIaa6+eFP/A2luzlEN1pgr02i4pJ+AvdQkXRhw1SfizcXBTyHROnPkHVfO/xY9k76y2qKFlReqrQG5CEPv+TNoFi5Snvc27bypAG/zzJMGNs72wRsPKXvRZ3u7De7NUTyTnCJZd9EYp11/ep5heYEd96FxRG0v3r+VK4Q9XZyX+iKTyBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMRevhyhTiBa1MUpZEgdTKN1aBEo4LPjoxQA4eMnyHs=;
 b=rMlU3+n4cLQtcKzofVKtEx6mCSE6zMZSxOmGpbo/UqCb2skHwrER38+b7dykDTd2BMY35zf5aOhB8rpDTd48cviilNTUdMUS38F13gyII6Lr1qU4qidWQfS0tTPRf6mMkUAbCkaCGmYcZCUmIxNYBHhNpOCGjenToURz0vkqjsfCE3lmbsYbXNew9JDOgF0UQNwkwvgU/bYvHRU/qg9XKR8wY4CGXP1Rd0GGqvYhM3ey2z9leUVmt1nzsprpL2K8LT2oqIceKxcy5UJD5+fa7Hinnc9ErXR1hSXho8zhMLZF6BEixGr5q1kKdZ2PdPF5RYpNkpFnLOxELk1YdGCGpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 18:28:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 18:28:53 +0000
Date: Mon, 3 Nov 2025 12:28:50 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <francois.dugast@intel.com>
Subject: Re: [PATCH v4 6/7] drm/xe: Add xe_guc_pagefault layer
Message-ID: <sfcg7e3k33utodthmvswkqyav66z3toqn6seiipgnkz5gmxzdc@7f37xxkdfspn>
References: <20251031165416.2871503-1-matthew.brost@intel.com>
 <20251031165416.2871503-7-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251031165416.2871503-7-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 729f369b-34a4-4387-aed5-08de1b06d757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3WWHdFKXM+P8lYBZWJKozY+koWc7n5VcyrIFE9bMnZ9XrgjY7T8iLSj8CBpl?=
 =?us-ascii?Q?4KDZpU0yyixRMotzkd2U8fIKtWNZt4XhGg8AP5MdT878PYxlNqDRVSsrW/97?=
 =?us-ascii?Q?mIM3wXQbtf6kvB6gfctfAH51W6oJhINoTGj6Sh3zFfM5rTSRfvOylV6z2g2P?=
 =?us-ascii?Q?agEzY+IRkubh53p1kkGR4ij74NbjPjlJ6m3r4R8MkYH1xzHpApK826HGC+0i?=
 =?us-ascii?Q?VcC4E/3wCvbWWVSIMI52/EDCAN20IQ8QNCXmqB89pjspIrtwjM1ZMa4IX9TH?=
 =?us-ascii?Q?FBUvcNfK8rhvXU41knTaOaDhpMJzLSYIQAkPQat20jFua0qlovNL3YFCiL4/?=
 =?us-ascii?Q?/lozYDZZULQdFsJ/VW3XqoUZkIX34hliXmfax+k0puBK4g4RQVIBaI3DiF0U?=
 =?us-ascii?Q?9ybts0YG/Q/gmNb9NZKaa1OBQfdJoAMhP1gykiInxuSVGUmkf5kZ9DAiUbrP?=
 =?us-ascii?Q?hjSmdxfgVHVne8bLRzq7+ilSI0eUDFpcxz9xOaCstZ1GbtIrh525yoDeyrB4?=
 =?us-ascii?Q?7j5qBEpTKdrCw9lsnE+ARc5MB0wLRuoyFFaxp0f5sTNK3cbueSCiujUW9Zi2?=
 =?us-ascii?Q?Wm+aeOekfHucKYu4WI3NWWGuHApyLVeRCtpHKQC0aFzsSVvE/AEoXvYjVvK2?=
 =?us-ascii?Q?4igD6I1ecfWzF/vfzAk2ZL9obWgyj1kKq2MTO0O6mnZa1AYRbeaxTl0yOdHR?=
 =?us-ascii?Q?gx/Jwk1Pl0CqAya4kgrjWB8fJZGZmdzENfKAf4UC+2fXqfN+aw97MDkdVlSS?=
 =?us-ascii?Q?bgwBQXNZFCYUluMKogMosYuL/aV7HWyIjSByMu160lB9DgTRH5us0PbU1VJR?=
 =?us-ascii?Q?kgB4wbTLmKuwprDOBTD1LqBQPm99+wqH+DmqUlwrlaaTdajKWPJjyrwocsVe?=
 =?us-ascii?Q?bPDk7j4uOVpDN2Za8G3vYsSL+mhUKS8xSEK0iPbtvpq9hBvfRKfuquRRkQEE?=
 =?us-ascii?Q?3wRlQGbxBKiiUAmJSKmlPSnx3MLlkCwo15r7rZ3OkRGqCmyHNKijEL0/jyss?=
 =?us-ascii?Q?qPSxOxlZXPNDVlpnB2AYslrgdpaJrBTRntWb+5lBnLLrU9kX9rC2Vxtp9xkx?=
 =?us-ascii?Q?1PMRNx/eQwxNaPLZeQaZqLskD/fk86TE1Wl7oBJ23+EWDnR7KBiY4r4gD6W/?=
 =?us-ascii?Q?8bq0i0opsRYxx+W1bRSP1aORePR5p74j6B3ThpL+28Kb2Ce59IVg6rvTOgOY?=
 =?us-ascii?Q?bpRGGqOK+dE8PahQmeGtugaErUHo5ImdJb3V8YziBN4wtpwkZl0WUVnQxCJo?=
 =?us-ascii?Q?vB53IwR/vFOH/f+IWvRdSaN8INJEnXfbqkuHvYd4NzOfCy9qv4s61Z7jG11/?=
 =?us-ascii?Q?lIy1lKv0nOSUu5uoEDGO5MGI98+TuE9y3sF1odriv9FE/CBMphLGIVv5TZfe?=
 =?us-ascii?Q?AsqqVTNBuDq1mRwU8ENdXd9cqZEOcS1hLG4X37co2Qcmlv+EJgUDjKRni3lQ?=
 =?us-ascii?Q?U3pnzEBL5yiLohLe/CmmyZCFJnbIb4sW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2xyBAmToW5CiSEWM0Qtc/SuohJ4yTNJ60cL6LVIA9JGYua9JCcBz7wbcYnOf?=
 =?us-ascii?Q?4WPDrqKURzsPDb9E/HREdbIr3gGVqalLR9RELuMWplF8NNGWVwBg4yKOEGcv?=
 =?us-ascii?Q?V0nH5fa+Q20U8ip7rY+v6ZQiOZErO0QaxbIpcmhZ7Vdo5HlJLP96sH7acJKs?=
 =?us-ascii?Q?2UdvVFYMzm/ZgZGFmqlgHzts+fdL/XO/FfLUhQLuybCEdQt98Rqo3RW+uhof?=
 =?us-ascii?Q?t/as73jHeWfhLxK36SBS0wv8h0xLu8DzIlZOZpOsudu4C5BuEvciboZ+xWui?=
 =?us-ascii?Q?npr5Mfbooobs0NRYUiEY9bjXJ8WjZO/88khPt3jh3GG9oPyGEiouZ82rJ2XL?=
 =?us-ascii?Q?gCj5qMdKMegTsmZwLdcSixa4O/bsfvX2qQvSqxmig0O1Aipghg1mYrH8pbzO?=
 =?us-ascii?Q?VTtc4qleTkXctO8DNYpyKplL0xPwNxdtO3yTHoI2EC3KexgHenAHuFYXM09Q?=
 =?us-ascii?Q?lhk5/qLgzdIwA4A0b8a3ofdHsyOuLdqqHikFD9kMx0MbwWCensFCZCX3RcPt?=
 =?us-ascii?Q?eZ8M19a5kfk3AgR2VQcTuz9RCWd8rU4bPh15Or24Oqye6+7W9Jk/kLJVeWoe?=
 =?us-ascii?Q?Eq20hNjsbwdjhPjtpps/8JTkbK/1ikVtg23P1HWxkXCILGolKE/tl2RGUK7X?=
 =?us-ascii?Q?qTWR7onyA6wOD9RGH1dfi8LzY+yJOegQV/MpVv7I5B2K6swJhNfEfQI+1vhr?=
 =?us-ascii?Q?pb5ntxoM+nIp0JN2pKO0N8bP9No2vFViULe0q1qirI3MRXXwFzN8MD27icg/?=
 =?us-ascii?Q?U5+qrOq+H/FEVUUK/NylFYPXdsRqqmcAQIIeeFKiI40IG+ooodOirZIKv5bE?=
 =?us-ascii?Q?YfrL0R+2dMMJ9MCq6xwmtVlsPPT3gGNlLcIqpctmz3TX/ONf4akIfBCMnbKC?=
 =?us-ascii?Q?VzvYYt0SoRcsuF6/gyByAXjc1zpXmGqnt/StrO2NAgBaOjpA6mAi4iA8HeXx?=
 =?us-ascii?Q?qxKcKgtWyPBaov2DnbafGL2UmhoSar3fqp2pWoJr+7ZeABl9lTLVx1MoP96l?=
 =?us-ascii?Q?ORlfoVMHBWg50NdHVS0ZmeCRlNhmPdl9WDiONr782UePQ27EGnefh07+2ERc?=
 =?us-ascii?Q?P/EW1zf3CAJkQqz2wDHWnGb9fGM9a3AziyiNKjreNvW8oFFuNMDGYqgbO4oD?=
 =?us-ascii?Q?PgyO9E1B8N2pENRt48x2mYd5GPYD91UawXxFEZBvC54Zo5chQbzo6FrQCzS2?=
 =?us-ascii?Q?VXypJXIqTVLnvMkK8eT1LdK7FEO30V/+d8HprubRg6/4NvYCEQwqRsA0Uddl?=
 =?us-ascii?Q?GS3rjOuyYvgnoEOh3d5lBb/KDr/g/cYby4Ti0v9CCJZC62PZ5157WtihB9EO?=
 =?us-ascii?Q?WuD9pYDAOi+Gy/YjZQPi2ebS4QY+LsLWWBNV9iH6WnYh5ZkvDEqDlg8SY/Eo?=
 =?us-ascii?Q?jG1UgaHay0IM4OGIjHiZzWozoqLoPJ4ka5kNupDrF65VO81sPgfWUdTXfffv?=
 =?us-ascii?Q?Le48ou0KpzW/xGgR8azerhG4FTp0kBNV4RGYwdrkYgQqt1qj/u9os7VvH4wY?=
 =?us-ascii?Q?PJUftPtxl3Y2oSRPd7hXnUNFIOladw+ySN/bOFxN8d6VTV3QckRB2pjE75S1?=
 =?us-ascii?Q?cybAMc5h0KxwMI5KRsJmAIXZcGMu/SEPyXjvU8xgwhzusyCoTZBkly1mrbEe?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 729f369b-34a4-4387-aed5-08de1b06d757
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 18:28:53.5362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hir/2x4Acjyk6t1uGK4WAFffEHS1eNt94q8LFsUkUkpz9Xc09p1IrMPUNMsldcS4rxfzjsdLiCsSVjCyWZwh2DkYC1LeFmveBQplfSRtxjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
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

On Fri, Oct 31, 2025 at 09:54:15AM -0700, Matthew Brost wrote:
>Add xe_guc_pagefault layer (producer) which parses G2H fault messages
>messages into struct xe_pagefault, forwards them to the page fault layer
>(consumer) for servicing, and provides a vfunc to acknowledge faults to
>the GuC upon completion. Replace the old (and incorrect) GT page fault
>layer with this new layer throughout the driver.
>
>v2:
> - Include engine instance (Stuart)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/Makefile           |  2 +-
> drivers/gpu/drm/xe/xe_gt.c            |  6 --
> drivers/gpu/drm/xe/xe_guc_ct.c        |  6 +-
> drivers/gpu/drm/xe/xe_guc_pagefault.c | 95 +++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_pagefault.h | 15 +++++
> drivers/gpu/drm/xe/xe_svm.c           |  3 +-
> drivers/gpu/drm/xe/xe_vm.c            |  1 -
> 7 files changed, 113 insertions(+), 15 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.c
> create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index b35021e5b9eb..319f208eb19a 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -58,7 +58,6 @@ xe-y += xe_bb.o \
> 	xe_gt_freq.o \
> 	xe_gt_idle.o \
> 	xe_gt_mcr.o \
>-	xe_gt_pagefault.o \
> 	xe_gt_sysfs.o \
> 	xe_gt_throttle.o \
> 	xe_gt_topology.o \
>@@ -73,6 +72,7 @@ xe-y += xe_bb.o \
> 	xe_guc_id_mgr.o \
> 	xe_guc_klv_helpers.o \
> 	xe_guc_log.o \
>+	xe_guc_pagefault.o \
> 	xe_guc_pc.o \
> 	xe_guc_submit.o \
> 	xe_guc_tlb_inval.o \
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index e4852c4c90cd..44ed3202dfd1 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -32,7 +32,6 @@
> #include "xe_gt_freq.h"
> #include "xe_gt_idle.h"
> #include "xe_gt_mcr.h"
>-#include "xe_gt_pagefault.h"
> #include "xe_gt_printk.h"
> #include "xe_gt_sriov_pf.h"
> #include "xe_gt_sriov_vf.h"
>@@ -638,10 +637,6 @@ int xe_gt_init(struct xe_gt *gt)
> 	if (err)
> 		return err;
>
>-	err = xe_gt_pagefault_init(gt);
>-	if (err)
>-		return err;
>-
> 	err = xe_gt_idle_init(&gt->gtidle);
> 	if (err)
> 		return err;
>@@ -851,7 +846,6 @@ static int gt_reset(struct xe_gt *gt)
> 	xe_uc_gucrc_disable(&gt->uc);
> 	xe_uc_stop_prepare(&gt->uc);
> 	xe_pagefault_reset(gt_to_xe(gt), gt);
>-	xe_gt_pagefault_reset(gt);
>
> 	xe_uc_stop(&gt->uc);
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>index e68953ef3a00..529d2b3bec21 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -21,12 +21,12 @@
> #include "xe_devcoredump.h"
> #include "xe_device.h"
> #include "xe_gt.h"
>-#include "xe_gt_pagefault.h"
> #include "xe_gt_printk.h"
> #include "xe_gt_sriov_pf_control.h"
> #include "xe_gt_sriov_pf_monitor.h"
> #include "xe_guc.h"
> #include "xe_guc_log.h"
>+#include "xe_guc_pagefault.h"
> #include "xe_guc_relay.h"
> #include "xe_guc_submit.h"
> #include "xe_guc_tlb_inval.h"
>@@ -1545,10 +1545,6 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> 		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
> 		break;
>-	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
>-		ret = xe_guc_access_counter_notify_handler(guc, payload,
>-							   adj_len);
>-		break;

this doesn't seem to belong here. Should that be in the last patch?
Or a dedicated patch for acc removal?

I started to look into this because we need to add support for the
prefetch bit for xe3p, and I think it makes sense to add it on top of
your series rather than conflicting with it.

Lucas De Marchi
