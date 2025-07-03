Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2492C83030
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 21:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB53710E8F4;
	Thu,  3 Jul 2025 21:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CR+eift2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7086D10E8F4
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 21:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751577183; x=1783113183;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zraNwerWbKmLEZAZdOeyqvOKxZqyAtTFaAQHI9oPHME=;
 b=CR+eift2BBwFI01X3wW7r/IuvEfUwDDXknKfgiVwH+0y2/RxPyiWAmA5
 xs2nWoREOznMKkagMZKg39rBCJ5uzRZuUtufE05pMNV/mX9eu3GF1taGH
 jo02PqRoYMGXZKXdTxYeKqjMvjHcaZ21nUH9pSu7jG9NzRCVh7fDQvKyx
 wjZS5h9Dm51J//03TzsAuy4680y8BMRsSvY2AVOI98x8sHb61KPtLG26L
 NapeFGhhrQiRwWv02SsRM8HbnNjQwz6mOCIhGbw/MKpTDUVJ3NogHVZI4
 FXCMhDcvhPnwJXMWPyP1H/t17d9HsFuz9WHWT2J4H0Wm7nagfRcUNpdEQ Q==;
X-CSE-ConnectionGUID: 7oabom9bRq+CXc2bjDYxtA==
X-CSE-MsgGUID: F+GSI2n3Tjq8vtWwo+dtZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57589305"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="57589305"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:13:03 -0700
X-CSE-ConnectionGUID: DpOPfxpqR2G4El/bDUoXAw==
X-CSE-MsgGUID: 3u5ewXk9SLqH9G/GxpqDDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="158514600"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:13:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:13:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 14:13:02 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.41)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:13:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2Ad6r0J0J/ZiovjLufJNCFigvZ1MIunlMIGlLGluaoa5CkQxtE3EUfXrpxGHsZZ7Ofv92AvQ1VCxrK257qR1EJC9TUYDSsHJm3WTsHpUfHFIqDZ9GIisN+keeH/1YQ2eDgbm5gxokKXni0JIiv1lg+ZBwV3u4TZa9EEvdbuztPcsiGj7inCISsjZkw2t95kwtbhhnjWLuF+BVPqMQJvzmel+3lcj9IbBakhLgCyapC47W50NZvIpQZh9+vbhC1kzKsOPlPqhL84F4t2DbdVYKp2et/1p9farbtdX02jKKZDyL+KCx+cKZA6pkiwXkODb8hZqoNM7r7khl+cvG9stA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiMFqoZxKQypTEw+TiiyEEoYsmclSFUlrviAov28l1s=;
 b=R8J7fkj32bl9b5kQIgjpmZdbtGJx46RjnMv3f11t2Zj2Xt3zC2ngo+pp47hu+hcMgzVpIF1IwsMV1ae14HhqXzFRG1eH9+cOCMsxHQ2IkMOT8DUR23rUx1HAcq1HxqHSIhFvIb9+0M/86qlYfjjHCy3Vow6aGCvCQnIVubvC40rHMedbhtbknMRK/TR65pBbUekhfFtt36HINttclBP65bsBtSohqNltIMP0sC5OIO4AXjuZFLEz3LiPWIYtqQTL0DRFirMy5Yk0TzaSHHlZpID6YiFrV0vk1J1Xr1TRyBy+QYRui/FZDi2vig3UdrS4xltfRTgMGB7yphFyaPWPuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB8222.namprd11.prod.outlook.com (2603:10b6:208:44e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Thu, 3 Jul
 2025 21:12:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 3 Jul 2025
 21:12:53 +0000
Date: Thu, 3 Jul 2025 16:12:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5 3/6] drm/xe: Add infrastructure for Device OOB
 workarounds
Message-ID: <cac3ruffqmkfzsmsck6hmein3huifc2ec5ptsl6rjwv6vcxzpz@axgeeojlm3s5>
References: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
 <20250702193036.1417416-4-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250702193036.1417416-4-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BY5PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d3ba21-5040-4dba-be02-08ddba765fb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ya8tJiiPw2verdoavRurfdWzW1Svliv8lmCp9BllDDJwo6xoZAFv7BYRhJ6Y?=
 =?us-ascii?Q?Hu/d8NSxpPJPJOAW8dVGzhOM7HQZMr/WsrClicrA6KanrVClb6hJOyLbDWxd?=
 =?us-ascii?Q?A89oNP01TGqtr8Dw9I+bFmgbi09xS0YqSvIaS0bLSHEgzkoaQRdRhybAyvNZ?=
 =?us-ascii?Q?aUJath3us5zIVgDn1J97Pe9Hn0Qw2Ck/QOw7v8B8A+/YSeVx2eWr2ULWRbLp?=
 =?us-ascii?Q?JKNOsczIuhqPgikCY6t8QqrtCoPAY1EgdPB1wfoixFGGhZ//G3fSpD4BFzdg?=
 =?us-ascii?Q?527GRlGvuLXux4Nc55Tvepvgu+NgRcNt3EMFLZ3cDjwQzdn+CWH+0+Q90u0L?=
 =?us-ascii?Q?vDW4W5akGDh2pheFGnr16UYeW12OoMYmhp/Xnd7lcAefqQmtNBq9qrsjqyyg?=
 =?us-ascii?Q?qqURqoS2KKru1YZWnMvwxXMyRYxR4p5gJwcPA/YqIckepiAcdoixy5jjVo5L?=
 =?us-ascii?Q?gCArTqLqmQ3dwF3S+XXFwXgIHVl+QlHZa0GT0f/J0jRsimKVhFK+4Ljw0gTP?=
 =?us-ascii?Q?kHwQjNMrdS7OjRQF+WWVIbZq5eiVWF6sNpVn6RuNnr+WnI0TkyveXyxVX3NZ?=
 =?us-ascii?Q?nheaETFVWSX0WUILcmBJlHh+xFAgD6O42CY+Sztw+fprdwX1vqlIZMCcjvk4?=
 =?us-ascii?Q?E4xW/Tic7cFRC1te5VLA9JQ+/6PlcoNtxJ6Bl2x7mkgVjMC/CmognUcdVBQL?=
 =?us-ascii?Q?gPuE2A5HjnGiyXc6NJrtGaINebuGj8vWAB1y2mWjWmHRBlRkzzaRKIyyZXd+?=
 =?us-ascii?Q?P3hBdXbo0pfCdQVbNG2tdgJuJYfOBkZUNunZKV41gQqeomdNCXB9RnFFHgfd?=
 =?us-ascii?Q?TKoUJ1AwpYBHBefy/PLsvWFWPoFAa/gxUcbH1cPEsb4m0koT01+7n0OHl+Qv?=
 =?us-ascii?Q?1pstM08ReHWcWDuGRwa2apTB1zBg3FOyE5yj50S7W1OQjsdXezbN+YUMsxvQ?=
 =?us-ascii?Q?OR+xs8aW327Nvg75oA63tah7gYHPCCsxLFfq04kxKQr455DvEmH9aV2njFC9?=
 =?us-ascii?Q?v+IFjx3j4Sfyeiju/BhS+ekZrb6fshqTQNXZ6mUyvm6jPiGGKgkq+NtG86Ro?=
 =?us-ascii?Q?nfqLmPwYfzFtMgxAoBQ2/36SM246KJ85DS3BFuJJd4pxYxeC8+BOq0ONMxn5?=
 =?us-ascii?Q?eENm1dEbB8YLVU2bCR3XDrDFsM4Xrd/PaEFIjTlpeL5NZK+0xcOG3PbnZdhh?=
 =?us-ascii?Q?bPJhgAig46RsCmbXICtCMydbdN4v9HZBucycJ66UCTZEYFrfoRszR9dUqKM0?=
 =?us-ascii?Q?aaSEJuWBAiipdp5MGETQRiJOp/Y4g1vsHyAXPF+9RFRM+j0LsXtKFCre2xVa?=
 =?us-ascii?Q?SP4fpFBoNQ5zYXpYlQOE/MSLv6F4G6KFatQfRaOzY4pDUI81SJ4v46RI1S7w?=
 =?us-ascii?Q?nztQsqZBmIRqQKANg+B1zcukOyV0wJR1oXUPqc9NV/W6Zt3IurhffhtcMAm4?=
 =?us-ascii?Q?uFqRRCwneGs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?acCmXBRm/LPYnONtc5pTXFfxw/LhcCYctDrQs3w6Ks12Im0lF1xBwwl8VxzI?=
 =?us-ascii?Q?nOci5YtsMCx9xaU9iXjXs6xYROKWnhWmXknvqwW1LdkxniAa9iAxCiwIS6hG?=
 =?us-ascii?Q?Kwj2Z86OBrYB3/tuFAKDZadnIm9J/WiPiWzIVdIS3p0lK7MSaiHkx4LbZwVR?=
 =?us-ascii?Q?scSdelSAz8cqbbBfV9s0MOxsZH+5Yh+0EdE2YyuOBOUN+XZb2FzOcG0CLXKW?=
 =?us-ascii?Q?DpUx3TIX5rXOpyDRFgvNy4VjnBgjgWhXTxHciSniT7Y1P5mEcWv7oNEmLnNZ?=
 =?us-ascii?Q?6NRzXpz2BqaM0XCuSEuhM1IkBbbpP8xUd1MwOoYL+QLFch3KMkqF6gG0tOUm?=
 =?us-ascii?Q?fp0VBQmch05QEZHzPrapOLHnLGJmTeF7McTUMiC9lvy9cwLP0rJGuL5rvsLs?=
 =?us-ascii?Q?OWOJs28yYTM3fACbnOxoZnw5Qm/IqKec8kW2emtkE/fT6x+hBJQDeDkYHpCd?=
 =?us-ascii?Q?d5KC/jdyAG+UdrH46OJmB/yGPNctchIaD+YYp1WY8J2+5w+pCiCDUan+EbRy?=
 =?us-ascii?Q?Pr1Yaaffpr6N2+mn70+NKHazay4WyvM2fNWu31SokR4ESKvgB4fao06a9lkJ?=
 =?us-ascii?Q?FBeLsWFgRuseYS79WzLn4mhxJ/qMlX3lz8uLRsTycMRtcG0nguarQxgJ96DP?=
 =?us-ascii?Q?GRADSJjcDf4RHzlIBDRnsWTTDxgUPbJLYzdbFknKWppqiY36yCMWXYAaSN5A?=
 =?us-ascii?Q?tVGDCjW7Jwt9ytKYtrhOTtLrSndHJpYXgQdNLX5a7OJOoDWAdr2T0BYM3Uq5?=
 =?us-ascii?Q?VcR+9ZuBuBRG+obqPElo9o+Sgl5KQ1p7oQaWqP7C15QnonVkZc9mMbjXvzTW?=
 =?us-ascii?Q?WX5VNZtaTIn7mhWI2l2+9gAmYchCdQ89vE6/uKhvqGiuewH5l9k9S1sOrN77?=
 =?us-ascii?Q?4B/nCF6M3lK+ng8qMjR6AIeVo+fk3VH3749/5+iRHCXZ+6oKqjbZPYOshe7Y?=
 =?us-ascii?Q?wngF4o1ukEVTp12YUls29uK8eGfRobiEXaUyvaoyVM7j+5CHL6jvhIrbR8K+?=
 =?us-ascii?Q?fug3cOsWDACqf7ro/hTdQQzcwLukYDM+Wlr8iPQCnE3ctlWaDq72kDcUiYY9?=
 =?us-ascii?Q?Jf79QJHL0WlqCvSiIRwfKi4gc4UtlX0bDaTNw1bdDmiym/VM1i6IcooK/n1y?=
 =?us-ascii?Q?8saR/DOHF5qImpTaNPk63e0+l/ptMk0oStX3kRW3+ewxHu7LmE7+BbIucwBN?=
 =?us-ascii?Q?Z7IZy7/n27/HlkClwcToDrVQTACs9T6MdSXlZajVd8Rk8s0OEBkvmEUu+f2s?=
 =?us-ascii?Q?mhD3ZMsX6bVCfEtSYRBrWAAtAQVUUYAO3Ta8CRq9LT6ROB7hRZVfUZ12zaCF?=
 =?us-ascii?Q?uFMTQHNRMyddPqIy9PYVVOZvHI4jBZ4uCeGp5QSBwUymjFwp5npKOroZ1PAM?=
 =?us-ascii?Q?hYR+DfueQkUpgaUhOGcCgnay3gn7jXbzo2fAg2AMfrJxOHBHzm6H8LA7pXOB?=
 =?us-ascii?Q?r1pY4wdQiYToPzElD8WZRmdpon7y8AVkLIgndbjOZOdukYcvDkHWt7oEcod8?=
 =?us-ascii?Q?w8zWQlh/7DNEox6hrj1nfCrzoyihPHs9JH/ty9v3Qcm71cJL0Tf169uDedd5?=
 =?us-ascii?Q?VDttDhFN4eSacq4mO7Ilods6nLojv4gvVX2rjaePUw9VtGcMxGRTw1n6PhZU?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d3ba21-5040-4dba-be02-08ddba765fb3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 21:12:53.3269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xm9YrX4BzKWHEE/gd2IDONWUac3VBeKBd13LU8iEsV/b8EqFUiYiVIogNpTvE7KlQKsXwv8eR4ZOsyxZSzane4bnvcw7K5P8TmrG/OrmDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8222
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

On Wed, Jul 02, 2025 at 12:30:33PM -0700, Matt Atwood wrote:
>Some workarounds need to be able to be applied ahead of any GT
>initialization for example 15015404425. This patch creates XE_DEVICE_WA
>macro, in the same vein as XE_WA. This macro can be used ahead of GT
>initialization, and can be tracked in sysfs. This should alleviate some
>of the complexities that exist in i915.
>
>v2: name change SoC to Device, address style issues
>v5: split into separate patch from RTP changes, put oob within a struct,
>move the initiation of oob workarounds into xe_device_probe_early(),
>clean up the comments around XE_WA.
>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>---
> drivers/gpu/drm/xe/xe_debugfs.c      | 20 ++++++++++
> drivers/gpu/drm/xe/xe_device.c       |  3 ++
> drivers/gpu/drm/xe/xe_device_types.h | 12 ++++++
> drivers/gpu/drm/xe/xe_wa.c           | 57 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_wa.h           | 17 ++++++++-
> 5 files changed, 107 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>index d83cd6ed3fa8..0e26658bcf7e 100644
>--- a/drivers/gpu/drm/xe/xe_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_debugfs.c
>@@ -21,6 +21,7 @@
> #include "xe_pxp_debugfs.h"
> #include "xe_sriov.h"
> #include "xe_step.h"
>+#include "xe_wa.h"
>
> #ifdef CONFIG_DRM_XE_DEBUG
> #include "xe_bo_evict.h"
>@@ -82,9 +83,28 @@ static int sriov_info(struct seq_file *m, void *data)
> 	return 0;
> }
>
>+static int workarounds(struct xe_device *xe, struct drm_printer *p)
>+{
>+	xe_pm_runtime_get(xe);
>+	xe_wa_device_dump(xe, p);
>+	xe_pm_runtime_put(xe);
>+
>+	return 0;
>+}
>+
>+static int workaround_info(struct seq_file *m, void *data)
>+{
>+	struct xe_device *xe = node_to_xe(m->private);
>+	struct drm_printer p = drm_seq_file_printer(m);
>+
>+	workarounds(xe, &p);
>+	return 0;
>+}
>+
> static const struct drm_info_list debugfs_list[] = {
> 	{"info", info, 0},
> 	{ .name = "sriov_info", .show = sriov_info, },
>+	{ .name = "workarounds", .show = workaround_info, },
> };
>
> static int forcewake_open(struct inode *inode, struct file *file)
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 0b73cb72bad1..53df142c1031 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -699,6 +699,9 @@ int xe_device_probe_early(struct xe_device *xe)
> {
> 	int err;
>
>+	xe_wa_device_init(xe);
>+	xe_wa_process_device_oob(xe);
>+
> 	err = xe_mmio_probe_early(xe);
> 	if (err)
> 		return err;
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 7e4f6d846af6..4e0dab46a3e3 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -360,6 +360,18 @@ struct xe_device {
> 		u8 skip_pcode:1;
> 	} info;
>
>+	struct {
>+		/** @oob: bitmap with active OOB workarounds */

kernel-doc needs to use `@wa_active.oob`, otherwise it flags as an error

>+		unsigned long *oob;
>+
>+		/**
>+		 * @oob_initialized: Mark oob as initialized to help detecting misuse

same thing about @wa_active.

>+		 * of XE_DEVICE_WA() - it can only be call on initialization after

s/call/called/ ?

>+		 * Device OOB WAs have been processed.
>+		 */
>+		bool oob_initialized;
>+	} wa_active;
>+
> 	/** @survivability: survivability information for device */
> 	struct xe_survivability survivability;
>
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index f51218a7a580..8a31453bc012 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -11,6 +11,7 @@
> #include <linux/fault-inject.h>
>
> #include <generated/xe_wa_oob.h>
>+#include <generated/xe_device_wa_oob.h>

swap the order

>
> #include "regs/xe_engine_regs.h"
> #include "regs/xe_gt_regs.h"
>@@ -876,8 +877,32 @@ static __maybe_unused const struct xe_rtp_entry oob_was[] = {
>
> static_assert(ARRAY_SIZE(oob_was) - 1 == _XE_WA_OOB_COUNT);
>
>+static __maybe_unused const struct xe_rtp_entry device_oob_was[] = {
>+#include <generated/xe_device_wa_oob.c>
>+	{}
>+};
>+
>+static_assert(ARRAY_SIZE(device_oob_was) - 1 == _XE_DEVICE_WA_OOB_COUNT);
>+
> __diag_pop();
>
>+/** xe_wa_process_device_oob - process OOB workaround table

should have been

/**
  * xe_wa_process_device_oob - process OOB workaround table

>+ * @xe: device instance to process workarounds for
>+ *
>+ * process OOB workaround table for this device, marking in @xe the
>+ * workarounds that are active.
>+ */
>+
>+void xe_wa_process_device_oob(struct xe_device *xe)
>+{
>+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(xe);
>+
>+	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.oob, ARRAY_SIZE(device_oob_was));
>+
>+	xe->wa_active.oob_initialized = true;
>+	xe_rtp_process(&ctx, device_oob_was);
>+}
>+
> /**
>  * xe_wa_process_oob - process OOB workaround table
>  * @gt: GT instance to process workarounds for
>@@ -946,6 +971,28 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
> 	xe_rtp_process_to_sr(&ctx, lrc_was, ARRAY_SIZE(lrc_was), &hwe->reg_lrc);
> }
>
>+/**
>+ * xe_wa_device_init - initialize device with workaround oob bookkeeping
>+ * @xe: Xe device instance to initialize
>+ *
>+ * Returns 0 for success, negative with error code otherwise
>+ */
>+int xe_wa_device_init(struct xe_device *xe)
>+{
>+	unsigned long *p;
>+
>+	p = drmm_kzalloc(&xe->drm,
>+			 sizeof(*p) * BITS_TO_LONGS(ARRAY_SIZE(device_oob_was)),
>+			 GFP_KERNEL);
>+
>+	if (!p)
>+		return -ENOMEM;
>+
>+	xe->wa_active.oob = p;
>+
>+	return 0;
>+}
>+
> /**
>  * xe_wa_init - initialize gt with workaround bookkeeping
>  * @gt: GT instance to initialize
>@@ -980,6 +1027,16 @@ int xe_wa_init(struct xe_gt *gt)
> }
> ALLOW_ERROR_INJECTION(xe_wa_init, ERRNO); /* See xe_pci_probe() */
>
>+void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p)
>+{
>+	size_t idx;
>+
>+	drm_printf(p, "Device OOB Workarounds\n");
>+	for_each_set_bit(idx, xe->wa_active.oob, ARRAY_SIZE(device_oob_was))
>+		if (device_oob_was[idx].name)
>+			drm_printf_indent(p, 1, "%s\n", device_oob_was[idx].name);
>+}
>+
> void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
> {
> 	size_t idx;
>diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
>index 52337405b5bc..3793fcae38a0 100644
>--- a/drivers/gpu/drm/xe/xe_wa.h
>+++ b/drivers/gpu/drm/xe/xe_wa.h
>@@ -13,17 +13,19 @@ struct xe_gt;
> struct xe_hw_engine;
> struct xe_tile;
>
>+int xe_wa_device_init(struct xe_device *xe);
> int xe_wa_init(struct xe_gt *gt);
>+void xe_wa_process_device_oob(struct xe_device *xe);
> void xe_wa_process_oob(struct xe_gt *gt);
> void xe_wa_process_gt(struct xe_gt *gt);
> void xe_wa_process_engine(struct xe_hw_engine *hwe);
> void xe_wa_process_lrc(struct xe_hw_engine *hwe);
> void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
>+void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p);
> void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
>
> /**
>- * XE_WA - Out-of-band workarounds, that don't fit the lifecycle any
>- *         other more specific type
>+ * XE_WA - Out-of-band workarounds, to be queried and called as needed.
>  * @gt__: gt instance
>  * @id__: XE_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
>  */
>@@ -32,4 +34,15 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
> 	test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob);		\
> })
>
>+/**
>+ * XE_DEVICE_WA - Out-of-band Device workarounds, to be queried and called
>+ * as needed.

missing spaces before "as needed"? Not sure... need to check kernel-doc
rendered

>+ * @xe__: xe_device
>+ * @id__: XE_DEVICE_WA_OOB_<id__>, as generated by build system in generated/xe_device_wa_oob.h
>+ */
>+#define XE_DEVICE_WA(xe__, id__) ({					\
>+	xe_assert(xe__, (xe__)->wa_active.oob_initialized);			\
>+	test_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->wa_active.oob);		\
>+})
>+

a bunch of style nits above, other than that lgtm.
With those fixes,  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> #endif
>-- 
>2.49.0
>
