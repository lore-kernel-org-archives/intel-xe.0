Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1466C3DA4B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 19:42:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A67210EB75;
	Thu, 11 Jul 2024 19:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6GG3oFt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078CF10EB74
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 19:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720726957; x=1752262957;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZATM7FiH3pU2duhte+wRTK0xhNFeuOhLXLlXepSyIe0=;
 b=I6GG3oFtK0h8sOEnd+nJSoovHtYq4hN9J5RUKqgrlBctfh9bEatX7UTJ
 EHDcpC23+as+knJb9+8Xedw4A3SC5ODzTyWlfzfWCQE/1TqDudzyLw+5I
 IOO/iHXNcx2WUn2Z35CKkG2bRj2clXmBEldyaAZg9BZF3tWYgFu0gzAu5
 6Qh2Ad31810QflLQ4WUXq8r8jmKx85FvoX1CBaNs0iT3uV9LOIvaQygcm
 BF4RJOlCEabScoiPq/Wj6vxiCfHhX2eEbVisEOGAd33RGwqLJTLlX+23D
 4WDhB2WtufzwlFN1M4+92dPNv9s3kKJAAlqjNDdgTWQkPY0D62UVO+LWf A==;
X-CSE-ConnectionGUID: 2P0rhTABSc6J/xwqU1bCnQ==
X-CSE-MsgGUID: UWSoUXzOT2Cx13i9p0uWYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17959618"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="17959618"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 12:42:37 -0700
X-CSE-ConnectionGUID: dYzK75jVQEav89bOxUN+uQ==
X-CSE-MsgGUID: sCU5fDnSRGmqqoUxAC9Vnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="52980482"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 12:42:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 12:42:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 12:42:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 12:42:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfTS6MBEdR3wUUEVQwrhhZgxQ6yJW51EXUZyP7v1lJU2Q571RHFGUkSBQL8PmVzxjgBQJtvmCAC8svlWmpBAWjmTjhTWuT8QwmC8ttb3F6yDF0lF2gjcORZB7w66p1OW86yafxjU8evj1VFw9iUnOkuAXZgbSA2OTt9hDc2V1KtwhYQfIB4wP2iYyUAShSSL1seJ2b43QLqY3uxU1E/2q/JyQvsvXEKKtDy/ab9XaE5wKGy/xzrEYJS67kIzXbKRN3a6910PBniVtSXOyNo5y1D0D+Hw34H2mk0vmsTPcF2QXTfcq4q4usf3/iXZZtoyBpBENLIe0yz1h/xPvXJiqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlaDffo8C2JQbI0kxeJWHa9SeY3P9TXSkC+oSYIsbVc=;
 b=Nil45iCnDS0x2zKut/1PGrXnh4vIIxDSxGswQ/OqBGR8CsxEXMFuljo8DoaefkVaTAWdZK9HsmPExNBhNPHNniHf/VWS4KoJ+z3WmllkIxtJ7LAXY59ACygJB7A1GnCI7KssQeqpYZYf+G4skpfSZMUTWDWnprqdrn/sVJwuonUfxR8UzbtFitzAwkDKcUX/C5Yg4fh08P2YgCBsQ341wUSjnznX4F2wLSA6RQd0uvJQmlClC+Y5SpDBdyQ768FTYMnsbkDzYs7zhpJkfNrzdZ0VO2NW5vkiz+EK1b/k4zKoodLjezxftJWZo2iHAqpvdZgy+Wf7PiwnC6evsFCZ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB7376.namprd11.prod.outlook.com (2603:10b6:8:100::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.39; Thu, 11 Jul
 2024 19:42:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 19:42:28 +0000
Date: Thu, 11 Jul 2024 12:42:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, <fei.yang@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Expose SIMD16 EU mask in topology query
Message-ID: <20240711194225.GU2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240710220446.2169797-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240710220446.2169797-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0143.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c4817a-1143-4106-d3b2-08dca1e1990f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7wbg9N0pVl5DI/Uz3PtqofuQS+DpMYJ4GGN7pezpHFouCGCbI4msmZ/JhGYy?=
 =?us-ascii?Q?F4iLPRpI3EtoxIAM8NBtWaq4w+7uccwYZMR2AqzAWkg95TxR19mi34Q67C1N?=
 =?us-ascii?Q?7xpXPyzo7dVyopEyJRqYsGM8JdAJBl14dFLdhU1YjXBuRKCyQgV/FRUA9It2?=
 =?us-ascii?Q?OUVVK0prFf6a6wqiY2TvXhHwn3aFe6rT3mcZYxc3ry4qVOl4udzum1arL4we?=
 =?us-ascii?Q?nFhzvguXUBWxK45ullYCh5eL/P8XFoOKVCVo/RoUjxVNCfsjUArG532jKQqV?=
 =?us-ascii?Q?jvuZj1CTWBbM+S8VSIewtuMguA+2yxZVGon1D6AJbovccaSo/+YCL0AkLnKc?=
 =?us-ascii?Q?eDWFVwijJcKjUMUT70DnhpVaGlR0bPBTCbfd9ROSOWjmUHkW30mecN2NzW6D?=
 =?us-ascii?Q?X5kkGpoMgmDlgU5saXFA+QOcxzKvB1sIiDyQN9TgDW9twgNQTNPcrGrV+wGr?=
 =?us-ascii?Q?I9n5nluaSVXTJuGcS8Vm2jaHhcjirMLuGduiLd6wKlfk8ytWKsh3MkUXyYwT?=
 =?us-ascii?Q?XyQkKYtAJ82QXBzCEo153jOdJtQSq7oxgYfgCcwdG40ZChAnhXjHkbRLMiU4?=
 =?us-ascii?Q?/PwdsSSvE7yoInk34/VfOQTmpYCDawFA6bGxngQ4l858sZNshSgIqJeMXq8a?=
 =?us-ascii?Q?0hhcTLyb//Bqb9sy01JnqNTQnjVtEG/iDFlGFIdKrwCm3C+LkVExvw3WTL1T?=
 =?us-ascii?Q?nrnPdDKTjXteLl1aaoJndWz0H/6NmpDVcoihANPzz+IS1lpTgwE7PH36QDFP?=
 =?us-ascii?Q?5v/f4+lzCTq2lKVwP+Gk0HL2WVQo3UTHXIrHV1Z4UPjONvlnTCoIyp4wjZEy?=
 =?us-ascii?Q?fuBgE3DQWCGXcK+xmhUJJhwKa+UQERo2kLEbCCBb4BSbTkiHpR1PWLbHZpp8?=
 =?us-ascii?Q?YJ8DMoEWre9J9nAhx1YTcX7vYcsBQLuxnTpCCLrtOp5w1mM8TEmKBopSjmy7?=
 =?us-ascii?Q?jA4OYTuZZlpR9OISii6dpCeFPUnuHEfoRDZ2t7siZmxWqo2J4ImL5lhzM0Cz?=
 =?us-ascii?Q?E+5rhshZvvtKq3dCUep4cUGjtnUlc1F6eIXUFHKvGNtegLcLGg2EuinsYUW0?=
 =?us-ascii?Q?ApW1UKtVJ6SJ2wyLypB1/5I9kxKlzLj20XT4MX3K62+ceEC0n3UobP5PyQiy?=
 =?us-ascii?Q?xTEC7tGtoTITxtuwzqNQ13Gc2gLjCNneFmta+FlzyN0bkA8YJIMyYylcHXCr?=
 =?us-ascii?Q?jORJnYSyIsfa/+LLTw+tUKCELHPRrUAJ4JPv8NiEtZwpOAuJcTx2K/kRG1Ty?=
 =?us-ascii?Q?0g4clDpcxKmFNzuXiHXTcEeGB/sbYuGHBell2EDrR/W93Yz6mAynd63jCNHh?=
 =?us-ascii?Q?KaY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?la8vjUYyc1WLzohK8kEGCte/6SreZ8qe5C/fgP28boWBwPXlVwjQzY1GrN1v?=
 =?us-ascii?Q?Nuik7J2zEsFJwrf9FKJ6rab48KzqJtrYmxo85ATIAaxayoee9U7xq0zCdeQC?=
 =?us-ascii?Q?qBaKpO2YMNQ25kA+fhNRT0EITEIVrcMd34+wSqyIUwY7pjiIlrythz08GIER?=
 =?us-ascii?Q?en+mq3W8yRA5rpYoiofxEMi8o4LTK6vhq+0vckLnwYSJ5/PgX/Ksr4kalz3q?=
 =?us-ascii?Q?54dS4CjNOrmyJJWSIITuXIqiBAKfSMpg+WUfNkYyfEpeQ03+iDMQBEa8pV3K?=
 =?us-ascii?Q?hSdfAh6lF3Uc+8qz2kUvkTeoSCwbSHz9jplvacLd35+NaV5ZlMFdOa267qDY?=
 =?us-ascii?Q?NgYFj835pS2htvCLayZDHlbjUyyOnoLp9n4zdMIeF6U6HkAqnKlTDBvfr/lD?=
 =?us-ascii?Q?GwD2rBGgL+iGLC/BUx4NCHGz2sWR6Z/Z8bn0ih5wKy7CCsGtqG17brJSm/PC?=
 =?us-ascii?Q?fBBU7uN426EdeaH3fjwn66rK3WmcLE50OzwplQ8PztdUt65e6onZT9cTzYNQ?=
 =?us-ascii?Q?tNeN/rzk1RjNloTR4zYn1e7gp+pqyvg9ryHmoE6f/JnrV9bonr4BC0hnI6Qz?=
 =?us-ascii?Q?yFGo+S+pM9ZynftTNsK/eP6XLigyvp4xrfsikkgnjZ4sldjv39kA41aM+KH8?=
 =?us-ascii?Q?vCyomr39yMOsAM1WaVJVx0NKu+MEoIeKIA7FL4YQZklZG50vlP6yxq6lDy8n?=
 =?us-ascii?Q?HnUu1OIgiF+Pnxk6yKSqDgGkvtGzQDQNyHO5OlkVSNEJ7Glj3JDRNiei1PZ9?=
 =?us-ascii?Q?6DlOHrmN/UC4oKHZfH1eURd308RupAd3vy4dTYPQPzYnhPdPrQ+AO0wmb20L?=
 =?us-ascii?Q?ExaPmNdijo5AJALgc0hlf5l0TAvJP6AHbqSLkBzj5NuOCUVgR8k575MvG/Rl?=
 =?us-ascii?Q?jSai1oLU9ogEuC95IfaXn2+ui/P46LsUqd11KJok0FBSiuHL1rQa1B2hOK/o?=
 =?us-ascii?Q?je02tgw1MBmALM+lrtJWCb8qLzxD6FjM7ED8huY5nWW9RkMEPy6dIcYsPUTs?=
 =?us-ascii?Q?aEaVTpmIsTC49tRbmUwWcm2AKjBPAKfnMKWw6PDKfOcU+nYOtuLbe8nkfOQ5?=
 =?us-ascii?Q?ydWzV4iET4aG5QRPTa2QLP3z4xU7dC+Z0xoB9zg39j9Yo7Tr7luQ5odVG71D?=
 =?us-ascii?Q?hT+dEFq1BeLYxrfRZhc5Qzbi4N0Qh5imOSp1j1LB4zpQ/fgt5sPQqBgFuAqY?=
 =?us-ascii?Q?jdltqNSZXJYGfPwDpguugoaGFLe0ISTBnGZ6JM5FSjGoQ4ArTS/0OFLXXgOX?=
 =?us-ascii?Q?ukqxweJD/Zu2ptp+FfZGbMLgKda/6lEUBnFNJ2zDqRcRQEXQwJ4isW07LAz5?=
 =?us-ascii?Q?kL//23QaJtXzv90OtdELf4ZmQ8nVlt8vGbxDT0x9xBTED72TRiPxmya5q76y?=
 =?us-ascii?Q?b0TEUxzfMT44ogdfzvJI5zgiu+xmmmvH9aHGIMLArhEvNZ9VR9sswjgvx08r?=
 =?us-ascii?Q?ZRTh4OiASNNN94xAWL1SijBN24OumgyLmRNQqRmRfUekkH1zK+8NHNtLG0Iw?=
 =?us-ascii?Q?5APXRzUe4HXiB2jPdfLsQjMgbk6Z6/EhcGgGJsGCewtdzrd1U0QKkUN3gXrt?=
 =?us-ascii?Q?QYprOKj5HGq1GBCIG9XY6N1PP6eaQQxAFUVKINFSmoXNgmmHpWLFLkz3BWVK?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c4817a-1143-4106-d3b2-08dca1e1990f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 19:42:28.8293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spJ4915oddWU1yPWGlKX26F3AVNaC03BycCatWtR5wU+wCamK21kMVOlSVgfY9da+XCPbv+Pk41Wk3cKnoUpSkmNOTE4eLGTMLKpNhtQgwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7376
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

On Wed, Jul 10, 2024 at 03:02:27PM -0700, Lucas De Marchi wrote:
> PVC, Xe2 and later platforms have 16-wide EUs. We were implicitly
> reporting for PVC the number of 16-wide EUs without giving userspace any
> hint that they were different than for other platforms. Xe2 and later
> also have 16-wide, but in those cases the reported number would
> correspond to the 8-wide count.
> 
> To avoid confusion and make sure the right number is used by userspace
> depending on the platform, add a new item to the topology query and drop
> the one that is not available. The new mask reported for both PVC and
> Xe2 should now match the numbers reported via hwconfig.
> 
> v2: Use a different topo item with EU type in its name to report the
>     new mask instead of adding the type itself as the item (Matt Roper)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> 
> Tested on LNL to check the behavior in dmesg, debugfs and ioctl.
> Test-with: https://lore.kernel.org/igt-dev/20240710220050.2169596-1-lucas.demarchi@intel.com/
> 
>  drivers/gpu/drm/xe/xe_gt_topology.c | 27 ++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_gt_types.h    | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_query.c       |  4 +++-
>  include/uapi/drm/xe_drm.h           | 10 +++++++++-
>  4 files changed, 45 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 25ff03ab8448..5a1559edf3e9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -6,6 +6,7 @@
>  #include "xe_gt_topology.h"
>  
>  #include <linux/bitmap.h>
> +#include <linux/compiler.h>
>  
>  #include "regs/xe_gt_regs.h"
>  #include "xe_assert.h"
> @@ -31,7 +32,7 @@ load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>  }
>  
>  static void
> -load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
> +load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask, enum xe_gt_eu_type *eu_type)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 reg_val = xe_mmio_read32(gt, XELP_EU_ENABLE);
> @@ -47,11 +48,13 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>  	if (GRAPHICS_VERx100(xe) < 1250)
>  		reg_val = ~reg_val & XELP_EU_MASK;
>  
> -	/* On PVC, one bit = one EU */
> -	if (GRAPHICS_VERx100(xe) == 1260) {
> +	if (GRAPHICS_VERx100(xe) == 1260 || GRAPHICS_VER(xe) >= 20) {
> +		/* SIMD16 EUs, one bit == one EU */
> +		*eu_type = XE_GT_EU_TYPE_SIMD16;
>  		val = reg_val;
>  	} else {
> -		/* All other platforms, one bit = 2 EU */
> +		/* SIMD8 EUs, one bit == 2 EU */
> +		*eu_type = XE_GT_EU_TYPE_SIMD8;
>  		for (i = 0; i < fls(reg_val); i++)
>  			if (reg_val & BIT(i))
>  				val |= 0x3 << 2 * i;
> @@ -213,7 +216,7 @@ xe_gt_topology_init(struct xe_gt *gt)
>  		      XEHP_GT_COMPUTE_DSS_ENABLE,
>  		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
>  		      XE2_GT_COMPUTE_DSS_2);
> -	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
> +	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss, &gt->fuse_topo.eu_type);
>  	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
>  
>  	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
> @@ -221,6 +224,18 @@ xe_gt_topology_init(struct xe_gt *gt)
>  	xe_gt_topology_dump(gt, &p);
>  }
>  
> +static const char *eu_type_to_str(enum xe_gt_eu_type eu_type)
> +{
> +	switch (eu_type) {
> +	case XE_GT_EU_TYPE_SIMD16:
> +		return "simd16";
> +	case XE_GT_EU_TYPE_SIMD8:
> +		return "simd8";
> +	}
> +
> +	unreachable();
> +}
> +
>  void
>  xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
> @@ -231,6 +246,8 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>  
>  	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
>  		   gt->fuse_topo.eu_mask_per_dss);
> +	drm_printf(p, "EU type:             %s\n",
> +		   eu_type_to_str(gt->fuse_topo.eu_type));
>  
>  	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_MASK_BITS,
>  		   gt->fuse_topo.l3_bank_mask);
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 6b5e0b45efb0..01ea87d8886b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -27,6 +27,11 @@ enum xe_gt_type {
>  	XE_GT_TYPE_MEDIA,
>  };
>  
> +enum xe_gt_eu_type {
> +	XE_GT_EU_TYPE_SIMD8,
> +	XE_GT_EU_TYPE_SIMD16,
> +};
> +
>  #define XE_MAX_DSS_FUSE_REGS		3
>  #define XE_MAX_DSS_FUSE_BITS		(32 * XE_MAX_DSS_FUSE_REGS)
>  #define XE_MAX_EU_FUSE_REGS		1
> @@ -343,6 +348,12 @@ struct xe_gt {
>  
>  		/** @fuse_topo.l3_bank_mask: L3 bank mask */
>  		xe_l3_bank_mask_t l3_bank_mask;
> +
> +		/**
> +		 * @fuse_tipo.eu_type: type/width of EU stored in
> +		 * fuse_topo.eu_mask_per_dss
> +		 */
> +		enum xe_gt_eu_type eu_type;
>  	} fuse_topo;
>  
>  	/** @steering: register steering for individual HW units */
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 4e01df6b1b7a..73ef6e4c2dc9 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -518,7 +518,9 @@ static int query_gt_topology(struct xe_device *xe,
>  		if (err)
>  			return err;
>  
> -		topo.type = DRM_XE_TOPO_EU_PER_DSS;
> +		topo.type = gt->fuse_topo.eu_type == XE_GT_EU_TYPE_SIMD16 ?
> +			DRM_XE_TOPO_SIMD16_EU_PER_DSS :
> +			DRM_XE_TOPO_EU_PER_DSS;
>  		err = copy_mask(&query_ptr, &topo,
>  				gt->fuse_topo.eu_mask_per_dss,
>  				sizeof(gt->fuse_topo.eu_mask_per_dss));
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 19619d4952a8..29425d7fdc77 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -517,7 +517,14 @@ struct drm_xe_query_gt_list {
>   *    available per Dual Sub Slices (DSS). For example a query response
>   *    containing the following in mask:
>   *    ``EU_PER_DSS    ff ff 00 00 00 00 00 00``
> - *    means each DSS has 16 EU.
> + *    means each DSS has 16 SIMD8 EUs. This type may be omitted if device
> + *    doesn't have SIMD8 EUs.
> + *  - %DRM_XE_TOPO_SIMD16_EU_PER_DSS - To query the mask of SIMD16 Execution
> + *    Units (EU) available per Dual Sub Slices (DSS). For example a query
> + *    response containing the following in mask:
> + *    ``SIMD16_EU_PER_DSS    ff ff 00 00 00 00 00 00``
> + *    means each DSS has 16 SIMD16 EUs. This type may be omitted if device
> + *    doesn't have SIMD16 EUs.
>   */
>  struct drm_xe_query_topology_mask {
>  	/** @gt_id: GT ID the mask is associated with */
> @@ -527,6 +534,7 @@ struct drm_xe_query_topology_mask {
>  #define DRM_XE_TOPO_DSS_COMPUTE		2
>  #define DRM_XE_TOPO_L3_BANK		3
>  #define DRM_XE_TOPO_EU_PER_DSS		4
> +#define DRM_XE_TOPO_SIMD16_EU_PER_DSS	5
>  	/** @type: type of mask */
>  	__u16 type;
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
