Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23703C7EE2D
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 18:20:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE9B10E5DA;
	Fri, 24 Feb 2023 18:20:31 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B24310E5DA
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 18:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677262829; x=1708798829;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uZeTHvWcG5gNiPlxvtNz5y/RQHMZmPO6v37/uBJUo5Y=;
 b=JSw1M2FUfSBWpZhN15Sm/uuEOx2h/m48bw945fSmONgBUybQgVu4ikwK
 kliKiCkxTUdSdJM01lsoEOD3ZEes8IJRHufMAr0W5nXIbUn458NKuYFs5
 Sn33Tvw3FKwm8i/O7GFkcE2qiDisVcUizA/34L0XFQMAq8+DMOJclrr9f
 9FgJokoTXyNI1Q4SRiG0mybY8WQDiPTbmzfcJ7DTnUBbaWfTdpf+JN4p0
 sq+2JjkPmTDxBuc5OV/4XzBsDtPEjEDZbNZUmbUGeS/UTipy134fLOIOM
 Th++rqUZ4DKei873ArvwXRX2V7yaJPnUHfZUZGkaloOst4iaXJ2mvj7Qt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="321746115"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="321746115"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 10:20:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="622800868"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="622800868"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 24 Feb 2023 10:20:23 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 10:20:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 10:20:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 10:20:21 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 10:20:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQiSMOzTjcmLDY84vjqMOG0XkQWXKS0evfLTOhCdCYqbUgLiFv9Dszz67PyVc0ldt84Ue6vjcQdltnca17owaQjNIyEbqLDqeoofbtcbD/dGh/Kit/OER9Ugfp/iM8Z4xYXKl20Sjn4or7xuWyKdzEd58IMKiyo4Ly/Ei5UyUFjWUzlX3dh0pAI16dr7W5ElVKMRWDj09br14iKl0fyOAh5R70D2Mc0oaTgDg7L8EJ4SOqimn1JplF84K3xYvzi662OKrcGPgK1ojrz2w11BkXq1A0DVgNUDcv56RQmrLabmSEIP2gnAVYBLqj3v6RRqima4L5nE9twCo+Exg0xeHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHlLfpo1RGsgqvcTT7xH637/6ExwGdYrp3D4flxPRnE=;
 b=JYCEIKEOrkBSFp7aF9XA0FJa97Va0vjZiA7jr1lC5ITS2TSeFZuacqSsuZsgs7jk3ZynlwR+/WWQOMuqZyp/TNGhpuHPAq3ejewqP25WOWEuaBE21xIqbUBTPL4EyQ3XxKDZg0mePX1enPyLIiULDbcHZWKrVRL02wVI6xk0lvbbO5V1p10I6NO1OzpouKagwiZ9gESbepMOq8hkQvu7gISDRh5NpeTh63+1GQMNIQ0bm/F1Q8fOJK0phE/ErW8O5tB2x+1R+YI+nrc5pyxsVOyGVtAx/4ezKX8Lyv35d5nFmc+mHOKcyLkNUAj41HJIZ58wbWNNGG2ecmw17p1JOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY5PR11MB6281.namprd11.prod.outlook.com (2603:10b6:930:23::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21; Fri, 24 Feb 2023 18:20:13 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 18:20:13 +0000
Date: Fri, 24 Feb 2023 10:20:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/j/2unKXBULwbTJ@mdroper-desk1.amr.corp.intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230217005226.106499-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::9) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY5PR11MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: 95da1f11-ef48-4a60-bcb7-08db1693c526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tVZfnTaMYxa71Zj198PhEMnev2Uj5+FUjhWsEDD6o/way00qPs/pb5+FwuTYn3f7vCfW5kqHB8QN3Ir7QjBleRf95JelHLPj3XI0mL+xGhYnMNolDXV0TxFg4IEmGQ8VXZw2BXHhP40mWGoVLmDYWqRbpImBobNTr96e+2AhDMETD402Q6gIZr/TO5vsJNhtJ1VQABBuVxPRztNjjxVhjrqjnRCVoIfi/UJdCsgi7c89k7PmcphsblbdSuZeJbjw/Kl3QcaZ5X8wBjs2qOX4cmZIgZQZd9Fd0OKjEwj8k6ZmPH3MwuUGS/lMWXcMiojZkmQ3hwndOWO/sc9kopihJJUrP4fGD5LCOUhr0W9rvptM2VmGNBTLBg6sex63R3BPxG6ffzOjFnVMw8TzZQNir+kLHzdFZTYOcoN0VwQCDtK/xxNllxt6QSdmtMCkjqfF4v/407Un0ueRr8F2eF3bznso3aY2GzVUeUKTJ5U16MaiXq9GAntWyRcjqUtYtHHXsRQboqn0D8JOiHX0XuQ0YKQLzR4blXVlkc6FNJjQF4ivs0HqCO26lxmlG30S6ImdGPUXsK2OYTBJIXVgsTSy3KY7VJeDfL/12Mpw15ZU4QcBVqM5fdsNuZVP9N61PnEpKyoqs0LQsJY5fIcUt1sRyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(136003)(376002)(39860400002)(396003)(451199018)(41300700001)(83380400001)(5660300002)(54906003)(478600001)(6862004)(4326008)(8936002)(38100700002)(26005)(186003)(86362001)(6636002)(8676002)(66946007)(6512007)(82960400001)(6506007)(316002)(66556008)(66476007)(6486002)(2906002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ndIDH8V/LqQtxkb/hxFWEwQzzLIyvqaHY5djjeZqe5cUD5hSSpXPEg7dKq?=
 =?iso-8859-1?Q?xRicLuRcy6o1s9zC3x319lKSvrsxpB/OMClzfHabPu8L4rCBxEchFOhLsF?=
 =?iso-8859-1?Q?WPslconcj3BAuTsXUiEN2951g6apQ5aOzeGsLan8FiqP73D+EW16MXvBrb?=
 =?iso-8859-1?Q?Xyw+hqhAwY1pLqIg9pWJxMqQ5p9kcUhXvXrHGHRBBnPPcjSNwjhEovCTom?=
 =?iso-8859-1?Q?yLfrffP7tSUw4X+JEVFhMEmseHa+HjM9ebe8Q5+LbRsMat9D1i0vUYp3OE?=
 =?iso-8859-1?Q?LzKyiluFSMK8+CLOLVyeWIB5zTKLOtKAzOGCuhi+u4iMUDosMbkqXA+SwL?=
 =?iso-8859-1?Q?L5Lu3LnHVbr6AgJkYoh8mLE9CxEvBBXpjxGZ/o2e/t0vZ6SACO8ly9DXuo?=
 =?iso-8859-1?Q?oTnuuhjgaRhQHc7pM9WnRbcIggRAAf7zsVASbhNTR4JGVOT7FCOKurgnr0?=
 =?iso-8859-1?Q?e8vAoKaQmwT2aJFk5mo4uP5YcOgbUW6ESXmrdLZicflfxPqV+1/+bu0ECU?=
 =?iso-8859-1?Q?RcklfuiM5UHmIyvBYKJkPs2obQ/bjmX310ykRpJ7naBTXVLrFpBCmKWola?=
 =?iso-8859-1?Q?NqmLsOXDlVN4/a6sKza3KJeuB2VT4OVhTUNUXUT1b5bO5oIk5z72psMIhR?=
 =?iso-8859-1?Q?3xXw0duRxKKjeXGWDD6Dh58xs0Ix0LDJifgQagORVIkJIXtTGMosv/sAd4?=
 =?iso-8859-1?Q?O/ffGmFnnByPxP9uISkiY3gJFX9UBSrISlCQeOyOnGcmEXgKTdjeWUyh9q?=
 =?iso-8859-1?Q?tjK3732PZbWYwEaIfY9+bGATS+PLM5dMA3Sf36IAeWBeh3D4B2o5BwXL2q?=
 =?iso-8859-1?Q?E5wRuRcchCPbX0/+2KRJaUTxdgKCHGZ0KBUxcdeG3FAo+POTTW+4I/8LrU?=
 =?iso-8859-1?Q?b6qFDtlmQPblFQ8kElj49fDIywGmt3S13MUABLOGJPiO+Db9LdLaXS3VEe?=
 =?iso-8859-1?Q?f5+XK/BrztD1fmItyCwVmUl3OaLWJGBMyZbg18jnkwlBcxetoQlGRmQmPT?=
 =?iso-8859-1?Q?kpGAEJ8DIIqyTRbYMuM/zf7pYRdx07NAcXM3bL3QL3LCO6THHgqfGri4Gb?=
 =?iso-8859-1?Q?dMH85dcyelLrIdvrtaG/tye7pW6n+dJAA655wFydFbAOPyl2D1xs1qvxh5?=
 =?iso-8859-1?Q?LqXIxTZvWYL1msrWDFu/C1c2Yo6Y89dlCRZjIxDKMGWDzHzCQVz6eM8ayD?=
 =?iso-8859-1?Q?E/jMFwX6oY1ZTjdgZHu9CHFSTYwG5HXfzu/YRSmpWpdKr97itt2RTlqZ4k?=
 =?iso-8859-1?Q?6pXExoU6Igps6nttE+qsSUgi+6TEmpMHoQA45zQc4lpgqiEqcl24tVmBhR?=
 =?iso-8859-1?Q?k/kLwejwVVtgPsw10zERvFhcUjE5Xm4psguUwdIMeXlKyokAowv5N6SnBf?=
 =?iso-8859-1?Q?/K1RbcI0RVVmeCSeWSnU+PNqzrt60aXv40QHQdeV4h8e3WYrtD9zTcGqR6?=
 =?iso-8859-1?Q?ew/B1iD5ny/qSP0IlY34sXYHfBk1zjGvZUWEkp645auuyM0kjtcy87m4Nl?=
 =?iso-8859-1?Q?3WAJkyArGMPDYIxc88XaiFO8kglVhpc98wcq+lNJDMw08lKLmmEQ3RSQAr?=
 =?iso-8859-1?Q?VNCqeRnNjQ04K1WSUtK7JFSg9MdwN7IEH50igdypDCqS2phs9jTxXbOmDB?=
 =?iso-8859-1?Q?E9CGyniA9qfKAzcbGEZywH5+HnZonJIZ+ygXqijT7kORcmQaZi9dlD0w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95da1f11-ef48-4a60-bcb7-08db1693c526
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 18:20:12.8429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vdb8C4mr8I7a7iOgFq2oWbDKKocie06p7q0es3zBGkgUHLGMUQh3G8z6Si4tBONZnRImtq+Om1qoNOt1UGB8GoTJG28ek7+b5C+EFAOewqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6281
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 06/11] drm/xe: Remove dependency on
 intel_lrc_reg.h
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 04:52:21PM -0800, Lucas De Marchi wrote:
> Create regs/xe_lrc_regs.h file with all the registers used by the xe
> driver. Eventually the registers may be defined in a different way and
> since xe doesn't supported below gen12, the number of registers touched
> is much smaller, so create a new header.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_lrc_regs.h | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_execlist.c      |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c    |  3 +--
>  drivers/gpu/drm/xe/xe_lrc.c           |  2 +-
>  drivers/gpu/drm/xe/xe_ring_ops.c      |  2 +-
>  5 files changed, 21 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_lrc_regs.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_regs.h b/drivers/gpu/drm/xe/regs/xe_lrc_regs.h
> new file mode 100644
> index 000000000000..e8a13fa6722b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_regs.h

This file isn't so much about "register definitions" as it is about
"register offsets in the context image."  Maybe we should name this a
bit differently to make that clear?  E.g., xe_lrc_offsets.h or
xe_lrc_layout.h or something.

> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_LRC_REGS_H_
> +#define _XE_LRC_REGS_H_
> +
> +#define CTX_CONTEXT_CONTROL		(0x02 + 1)
> +#define CTX_RING_HEAD			(0x04 + 1)
> +#define CTX_RING_TAIL			(0x06 + 1)
> +#define CTX_RING_START			(0x08 + 1)
> +#define CTX_RING_CTL			(0x0a + 1)
> +#define CTX_PDP0_UDW			(0x30 + 1)
> +#define CTX_PDP0_LDW			(0x32 + 1)

I'm wondering if it would be more clear/obvious if we laid this out as a
C structure rather than using defines?

        struct tgl_lrc_layout {
                u8      _lri1;
                u16     CONTEXT_CONTROL;
                u16     RING_TAIL;
                u16     RING_START;
                ...
        };

and then later just use code like

        offsetof(struct tgl_lrc_layout, RING_TAIL);

to find the offsets when needed.  This could cover not just the
simple/common subset of registers here, but also stuff like per-platform
stuff like MI_MODE, BB_OFFSET, GPR0, etc. that we have lookup helpers
for in i915.

Anyway, that's something we can think about in the future; no need to
handle it as part of this series.


Matt

> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index b426f8000070..ea551dc922cc 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -7,6 +7,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_lrc_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> @@ -21,7 +22,6 @@
>  #include "xe_sched_job.h"
>  
>  #include "gt/intel_gpu_commands.h"
> -#include "gt/intel_lrc_reg.h"
>  #include "i915_reg.h"
>  
>  #define XE_EXECLIST_HANG_LIMIT 1
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 305a0e061778..451c9e1c43ff 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -12,6 +12,7 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_lrc_regs.h"
>  #include "xe_device.h"
>  #include "xe_engine.h"
>  #include "xe_force_wake.h"
> @@ -30,8 +31,6 @@
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>  
> -#include "gt/intel_lrc_reg.h"
> -
>  static struct xe_gt *
>  guc_to_gt(struct xe_guc *guc)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 8e341d11f2e3..af6fe47a0495 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -5,6 +5,7 @@
>  #include "xe_lrc.h"
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_lrc_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> @@ -15,7 +16,6 @@
>  #include "xe_vm.h"
>  
>  #include "gt/intel_gpu_commands.h"
> -#include "gt/intel_lrc_reg.h"
>  #include "i915_reg.h"
>  
>  #define GEN8_CTX_VALID				(1 << 0)
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index a7ab0d4451f0..0a1e32ab9758 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -4,6 +4,7 @@
>   */
>  #include "xe_ring_ops.h"
>  
> +#include "regs/xe_lrc_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "xe_engine_types.h"
>  #include "xe_gt.h"
> @@ -13,7 +14,6 @@
>  #include "xe_vm_types.h"
>  
>  #include "gt/intel_gpu_commands.h"
> -#include "gt/intel_lrc_reg.h"
>  #include "i915_reg.h"
>  
>  static u32 preparser_disable(bool state)
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
