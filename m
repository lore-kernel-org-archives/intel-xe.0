Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC48C3600C
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 14:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CF510E0BC;
	Mon, 31 Mar 2025 14:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOBucIb8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F0310E0BC
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 14:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743432785; x=1774968785;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RUeN2lWVLPooJIXjnzQWtuBvWRbkkVHYig98lMwRIEI=;
 b=ZOBucIb8hW/L4Aid4st9Fj4SF51a/oPF6jV9IxQqB9qOCQObajtJVXEN
 RJrJ8op0XIXux987A2WJ6ibi06FTiukHYVCqPQYC9ao0aRBrtHUdbK34z
 7gaGjcGwACJpDP6o7KB7IGnvDj++XCK1/l9zesh9tXTsIiQSmoo4FgB9m
 ujpcVGqmet3ycyQewusu98/0vfqD6obCtN0/V8AuBtRNFHo0RgoWYw7hW
 73vaTE5E4uXMp+GGbBK7hf6gGfMr/4DAtQpMLQjsgo6u1CRBptU5qwW0X
 9KdM6tL0ludvUcTPubgBPDT4yVvRegJIAcXicIoLzUyMNLjAWIJhshjmb w==;
X-CSE-ConnectionGUID: BwPLD9LXS+WyMMUs1auINg==
X-CSE-MsgGUID: voNgsGBUTsCRuYpd2fKDnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="70083762"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="70083762"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 07:53:02 -0700
X-CSE-ConnectionGUID: 1bfrr+bzTiu1eVXMXN0fUQ==
X-CSE-MsgGUID: TB/hU/rYRMqtPEQSLZeN2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="125863775"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 07:53:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 07:53:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 07:53:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 07:52:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIgnYKGZe6t4VkzAyfANs9aYkZruNeLMChZIg+kijnobAnHCPDGnMbfmlNMlzftTOnZ5bjLDOc16g702ZvukZ3tjUBrRLs5HQzN+lG3hHhH5VKgpxb6Ix82bJegiYXQkGQRZ3Ha/XfDJdsGzg7ablY+9dKTJ9CM4WLKhQ9cfJXwI0zAyKMbvQb0IAb8094uHyDQ9TCFyrZZEVHZX7nDBCpuBJppnAzn7kPkFdnGKuYBZWUrU5PN3BIqwKq/rDzANHgmDqvwwXA+THxiEhqTHj3CisxXAOvGTF/KBC8de1lhgnSKzC1UMU5xhqD6G/Rdu2B/1sL65qNRqepHIwzMHeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH4CecDWx5qzzrkTMd/J2R8eIo6Vck64f3zzRsnQCXM=;
 b=bLh/f9s4zwvHw/HHvIf/3b1i4hNwppymnW/1Iw1etVuOqx8Eot+0mHc3131xVRiPCjgWagq5nX51chHFUDLL1TddHFVrnSDaJC+rsD55JRH/u8602r8NVmZ9DBDQxjGYoIIIRQuZPgJWJbyYlvZ8NXUmvTmyFcohjFjuDzY6gs8YbXF08z4Kuj53blbsMl9AAMQTiXuV1dqIoRS1Ityf8imzKanv9P2+7UuYx9r+zw+kavSXOiALLIEJsgiM5YuB2XP49u54xVcAkBfdU2XVLduISjbuurxx/VD2sqNt0wb9WnH0BjMUaGdwyBKua8k+DlRpMcxSp1UjuAQj+ekgHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6224.namprd11.prod.outlook.com (2603:10b6:8:97::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Mon, 31 Mar 2025 14:52:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.045; Mon, 31 Mar 2025
 14:52:30 +0000
Date: Mon, 31 Mar 2025 09:52:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH v1 1/2] drm/xe/debugfs: Expose PCIe Gen5 update telemetry
Message-ID: <yujx3wbw5du2pl3po7ahwrmefsroueqf7sa4gimobelbpdfqcz@ifw4g2ctn4vg>
References: <20250331142336.640226-1-raag.jadav@intel.com>
 <20250331142336.640226-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250331142336.640226-2-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:303:8d::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e8d21d0-072e-49b4-759a-08dd7063a992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Lqsxkzh0eaLViby/f/X4pbf4Nsulk0aTTD+wCGJtjUX/l0mzvPD977Z01LCa?=
 =?us-ascii?Q?VswU236v4AGZZREK6dOvD+hlzTJMlthzTbU1Ha+LqxbrG4YvaEQdJEo9r1ug?=
 =?us-ascii?Q?ui7Id2rs5cI6l2tebMUZbJjDgpifHH03gVVb33V3aFVAJLwNPo/n5OyB5O6b?=
 =?us-ascii?Q?2EgdRXObMR4al7YrvRhB0WIK9BVu6/ZyA8ViGHPCiSSNSpiuntHD38vgrZjX?=
 =?us-ascii?Q?0kmjDs2tqzXPz2m0q3mZQ0/0Xp6BGJdmpbYoW19qTSAS+fgoQXRAJT2oNpmH?=
 =?us-ascii?Q?GrZY8sMLZAnipfREyGl30ELYRNsFLKBzGIE4GgBqsC9Hh0y2GGEKriZQ+x79?=
 =?us-ascii?Q?UpeTWT/N04u/YSBDuGxvTYoVSVd742zg1VkzMcWC8p9gynC5L2xW9CAc9k7j?=
 =?us-ascii?Q?lePKePGdL7WvRMwXko3tRGbNFLsmLWrKZS6lG2t7ZlwM5jVzMIerYE7zVoNw?=
 =?us-ascii?Q?7V72kJA1iKQN1U5YfTjVJgwCe9Z5JI7TpEC6g7Eb6TvLiNjNXB7WA/QL9iXS?=
 =?us-ascii?Q?3Z6PXOEACuxZt1mnlUcQdr5BNQbT66k7Y3LpusMKDBMvVafTtl5sInl2rbz8?=
 =?us-ascii?Q?z8e+lz6x+GORRslwDuZBmuU3kcjrv8+XWoVIGJctIBZwOpt/eFzz4KBHjZVR?=
 =?us-ascii?Q?+ugDdLgrjPDsbb1NIT9XgOdDpYVvcVTORaEmqgTy0iTzZPe00kEt4lUQbOWp?=
 =?us-ascii?Q?WtTz6xrei47x/1/GK4WNE6lXTEKpCw59VrTMbETvJhFO6kpgbp3TZ02cJRGA?=
 =?us-ascii?Q?x7KREC0ysZ6xLRSIhjtkpCHlsjgGEuaw32n+ENbPecPaOsJT+jjU13L/snnZ?=
 =?us-ascii?Q?k+q9KThInqtaseLeyhibN+GtstjcB9D5LlJYP9fJrAEqyQKnHHNKCHQkK9mT?=
 =?us-ascii?Q?uIRnbWypwFIe0UFgpEffWL4d4mkSALsFvGwGtK9Sv2Wt8XgAGzuxx0ZSdk4g?=
 =?us-ascii?Q?m2Y6IBBylU9Ara6aREMM00FqkRvcJHxn4C7ujzgjNct5HLplX2DKIdK4g7Sd?=
 =?us-ascii?Q?jHOhCeCcbGnD8tbnm99gKMswTQG+L+E2lybwZNSy7rXIff0NCaJTzIxEqtHT?=
 =?us-ascii?Q?d3VqADe3J+0qdecrdAKflKRatmAOITem7YNaZK6k2l6j7eDyM5b32o3hKv2E?=
 =?us-ascii?Q?ynqTkcZeri/tjcVoo7BkCiMjiviiNZkim7I2C4lzwGnKlO7djXd1yaElES+b?=
 =?us-ascii?Q?KA5du5mci5wqju4/SytFhd7IiY+MZfnrpKvb0xaZ7yz5kE8Qzc2igvfGtNFt?=
 =?us-ascii?Q?SzxRMpvivVbJRscmHUIqjeW/UY8uEKGvZW3LVICp8NOEhqf15VnWOd/CbnbE?=
 =?us-ascii?Q?Ouj5BMq9AL9Xbc81uGAeoNruNoP5oj6WmOrHLOmDi8xEMd9z4XoTMuZmTOb+?=
 =?us-ascii?Q?HqecTKBHkF2yXLZZRN16Ovu0lcG8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GLgpb346hb4GItnwvVsIqKM6LbT0YMXYa2Vwt/C383zhSM+zpGRp+XRnDZRA?=
 =?us-ascii?Q?AscYa8cfseuFf3p2QcQze5GCzkWkqjJFO7zf+2t8b7d/VWnycDhvrDNsSIKL?=
 =?us-ascii?Q?pZ/kyWsCJWC0g4Y2i++sFQCpMyqom70SYW7prQrBQcRNlV4trxvrEcr68jCf?=
 =?us-ascii?Q?dxgEJJSoZSoSHiaO5PLBc/aGOcjyRu+qMu4Sp90Zaix9g81Q0yn+OJEW9KpA?=
 =?us-ascii?Q?0dsLbxu/0S/bW53I2edd26Nzfpq42CTfhzXtSjKo5MnaYrbPNr/iz2PADoNK?=
 =?us-ascii?Q?+ZVVXq0yPxg29DZjiGblcyFX6PYXcc7XJxxjHhelQaeytTTkhbCGM5MYgH9A?=
 =?us-ascii?Q?FSjxlIuasCO5Dt7N4htwAC01NJVNTuAZss+9zKzm3jt3DnjmhtdOeQuhVXs3?=
 =?us-ascii?Q?f30YHg2pijsrxOwWnRVeUwIlbIntB+Z3VO0pBKl8/bCgeIC4w26JameoK715?=
 =?us-ascii?Q?p2V5HOF5xnI/OI3fi3OU+b4x0HOFgd7gk7GTr4A6A6RgdnYN63lnO/A6iHf+?=
 =?us-ascii?Q?RSYaTXGEymKtmHe46GONJ+FAY9bcLoF8MzNa53O1pbusZfU0snQZ0hi3ptQJ?=
 =?us-ascii?Q?BJBdsPQtQ7s6bUhicDGuV2aG/gm8ouc3jgBanXPc9CUXZ8GNC0N5+rLDo4ii?=
 =?us-ascii?Q?/Uc8hAmn1In04A4riHPfSDp0JU++fFxpSrE1kN+cXfOb72X6o7gWAoSJs6AO?=
 =?us-ascii?Q?7cjRvjJ0qWwDRdn5oxZxZJt4tIdtgU5kOJZ+CUYEOJy/knWW/ykTsmWYVc4d?=
 =?us-ascii?Q?79O7rV97N9jV/fnSkBuiuBEtixmsJ1yo6DHZLpVHKRo1GbXadSxELLGq4DHd?=
 =?us-ascii?Q?oE+kVmzGdLM1gX4MkUJd2TohVBBWoHT12JzDy4TLvC2EPjd30bjl6nu2/LQ2?=
 =?us-ascii?Q?hOweS/pNHF1xhIxZMlbjNut7hMZPYwwNoGY5yrQJ5B4YZC/BYlX9TC2mnyk+?=
 =?us-ascii?Q?30ZxlNlMSSOYi5lHVmNa2h+049+mnZUSFptfunvftedeizQEY9CKuapiVzZX?=
 =?us-ascii?Q?vgqA0DVVY5iUprQ/Q6/5sYYkXGkVRP0Gf5gD05jw+Gd0HOIxb2gxjpfvFUY6?=
 =?us-ascii?Q?pzZaGuy+YlQaLk9NaSRFUmf8Cf8kv6YaVTRKUswWM4lEwYU6p0PgspoxG7xW?=
 =?us-ascii?Q?B5oJ9MH87GfKd20pl5AkZcP2T+uKucocdc9QrhqqrUOSfM3G0zrzQah2GyYv?=
 =?us-ascii?Q?7jDit0hdepMfO1j2Z4SAIh5l7gT1SgtEZCHtWYpQ9qy/0J5Nev/Yjvmd/cJm?=
 =?us-ascii?Q?lLD2fmx5rlJI9wyFDDpBN8QMB1MmXIcwqhbTptldhogEODL6Ol4LiQWF+I3l?=
 =?us-ascii?Q?/JnLr+EKvd4+P9uvLM1H0MRWAv6JCE7PxiAmHW0fQbskTgOlTZn0NLFvovuN?=
 =?us-ascii?Q?MPiKAa3tye8lTL5T1jnZ/WzL872sgRiPGA8oT3FutrMQ3C5c2ANFSKbpo7Iw?=
 =?us-ascii?Q?432T02P0jCT2v5AwsmViSLfU6Y5Pit0asvaQUD2sXbdk4HYimAYC+OyVTJr+?=
 =?us-ascii?Q?6n4IRVZsQnMLjriRPlrxERvMPxjIdojl26Og+FXF65wK/Ox//YfGM8mwxRhR?=
 =?us-ascii?Q?nZElWQHdIcEJFGJXhearGihHAMCrre3oE18BvvCObN4iFvhUnytfjsucS7Xm?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8d21d0-072e-49b4-759a-08dd7063a992
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 14:52:30.7449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nsfla6a4cxGl8JVfGp7eXFSP4ZWZvtwtAYrHHXLI9JfyT8F1J9CWvD7sQ5tZZ/SJq33MRAS+iPUKWkkMn3CgXBpNbgyTk7YYTRnrMW/dElw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6224
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

On Mon, Mar 31, 2025 at 07:53:35PM +0530, Raag Jadav wrote:
>Expose debugfs telemetry required for PCIe Gen5 firmware update for

telemetry?? it doesn't seem anything related to telemetry here.

>discrete GPUs.
>
>Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>---
> drivers/gpu/drm/xe/xe_debugfs.c   | 93 +++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_pcode_api.h |  4 ++
> 2 files changed, 97 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>index d0503959a8ed..67c941abf4fe 100644
>--- a/drivers/gpu/drm/xe/xe_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_debugfs.c
>@@ -17,6 +17,9 @@
> #include "xe_gt_debugfs.h"
> #include "xe_gt_printk.h"
> #include "xe_guc_ads.h"
>+#include "xe_mmio.h"
>+#include "xe_pcode_api.h"
>+#include "xe_pcode.h"
> #include "xe_pm.h"
> #include "xe_pxp_debugfs.h"
> #include "xe_sriov.h"
>@@ -191,6 +194,89 @@ static const struct file_operations wedged_mode_fops = {
> 	.write = wedged_mode_set,
> };
>
>+/**
>+ * DOC: PCIe Gen5 Update Limitations
>+ *
>+ * Default link speed of discrete GPUs is determined by FIT parameters stored
>+ * in their flash memory, which are subject to override through user initiated
>+ * firmware updates. It has been observed that devices configured with PCIe
>+ * Gen5 as their default speed can come across link quality issues due to host
>+ * or motherboard limitations and may have to auto-downspeed to PCIe Gen4 when
>+ * faced with unstable link at Gen5. The users are required to ensure that the
>+ * device is capable of auto-downspeeding to PCIe Gen4 before pushing the image
>+ * with Gen5 as default configuration. This can be done by reading
>+ * ``pcie_gen4_downspeed_capable`` debugfs entry, which will denote PCIe Gen4
>+ * auto-downspeed capability of the device with boolean output value of ``0``
>+ * or ``1``, meaning `incapable` or `capable` respectively.

It doesn't seem like something to have in debugfs. If this is for end
users, they may not even have debugfs mounted or available at all.

Please clarify what's being used for this firmware upgrade.

>+ *
>+ * .. code-block:: shell
>+ *
>+ *    $ cat /sys/kernel/debug/dri/<N>/pcie_gen4_downspeed_capable
>+ *
>+ * Pushing PCIe Gen5 update on a auto-downspeed incapable device and facing

Isn't the ability to downgrade the link to Gen4 something controlled by
the firmware? Why would we push a Gen5 firmware that can't downgrade to
Gen4?

>+ * link instability due to host or motherboard limitations can result in driver
>+ * not being able to successfully bind to the device, making further firmware
>+ * updates impossible with RMA being the only last resort.

when starting survivability mode, can't we always force it to gen4 to
avoid this kind of issues?

Lucas De Marchi
