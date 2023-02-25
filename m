Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FBEC64ED8
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 00:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3652210E043;
	Sat, 25 Feb 2023 00:55:03 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B16710E043
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 00:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677286500; x=1708822500;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=x2cJ1/Rln3zWOlAlVOt5I3VSRKeZQPe7+bK13W0GHX4=;
 b=YdqGOueN2Iw96653NsAhRE39DP+4qZuwvVFoM0GBI6nyJynNIsmY9ngJ
 JP9j9728qDF7QMa4KjRvVzzE058m55qcznToOc8MmGCuknYtp0yaf3zau
 /KMuEBuEBTt7+e4MagwabLW1hlGtmYiddYJQeew0EkyCswdFhEhuLOPA4
 o1h4kPDRUalZtp3vDQ4hWp9HxHG2MT6dMYfVLYMmESw+NjpVkNH8g3coP
 IfqzhaOb7kOF0YptFIfeeXSpCMetkFsp29eTCeQG4BQ5TTgjABdO2SjkV
 lTk5b83GuH42Inxp0VWy/CRdL4W/440ZC7xJahNoon2lyrZT0JU+uOFmr g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="396123570"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="396123570"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:54:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="673078433"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="673078433"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 24 Feb 2023 16:54:56 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 16:54:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 16:54:55 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 16:54:55 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 16:54:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOiCu34G7ZNmJ8cUiwR/r6J2aSwNRweCVOO75BX1zIZOKq/pL+5ZK8xPpNIefHS8Z2VsXjXwyRj5/3zKXgbF1vtyWxo8lJb3+bFpWxTy14A77ZiEPDU5VVMB2PRz51elF4SUFrQRarUOJYPHyhbcxehKKCm0DLZkIU8OMxz3M3rL4VkW6QFqJxjmSxigCRFlKuVoSXeOOQc5M/9o3lP9wkEUNtYMFqnpYl0D4i0euzrYZdyogdZJbE5RMviFgF98sKBYFp3jzgOU/bc+vWnYFEczvMuQhhGhqNEIRiMcP7iWVTiZqMDc1kj43mo72hpCSZLGMncnzLrlBBJPG4g9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=creTtmn0Pond1lhJCIrxAJjbrgerLfiDzkNX5GkpbTM=;
 b=LxtHDRjVG2Q639ZioX9g44N1oT+BF2MTUiR/zFcCiG400N4Mji2ApxcAK82XAdViBi4y78AcxFNtIU4SbswPr9HpDe1Zc21O3qye9YWRis42Xo8mbE8UULTjj5aNomPmmgVjWDrWzXtoQetaFlcdziej4+y3ZlCfhu6RVCZustig86SfkyeilGA7nsz/DkOZEweyoF8DPQRzt814wDcXRT3n0ZrFUvb+7vTyF/HDw3wbWLTeZc2I0Wgwal922FKNDJOHDtW1snYwbXGIXRgINbWVEHbTmX7FZm/QNV6P6WRgH7qlLcLoFUl4ef8eySQjCP7T1knhCXZOcgZbola8AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA3PR11MB7415.namprd11.prod.outlook.com (2603:10b6:806:318::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Sat, 25 Feb
 2023 00:54:54 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6134.024; Sat, 25 Feb 2023
 00:54:54 +0000
Date: Fri, 24 Feb 2023 16:54:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/lcWpR8Xg5Z0KQ2@mdroper-desk1.amr.corp.intel.com>
References: <20230225001548.1743820-1-lucas.demarchi@intel.com>
 <20230225001548.1743820-12-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230225001548.1743820-12-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0156.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::11) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA3PR11MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: d6edf55b-7284-41eb-d973-08db16cae83c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0DmSOHEj1CRjPk8VelWjxpeRBC+fMjXE1XMlSP3Va8i1LvdUBymTJ/g6MrCq7uFxxqCENYMVuBt0c5Yat1qjFHZVLfkV5fPeq6uAj2ivQunUOdq3K2FRM1syF5J6qfN5Ja8iOLGkZQl1/Hb4jzPWVhyabn6OQOdyUw8gaV/20f5iE0IQx949NjSl/1OZnw22CsApBJZCBKwxVO0yqD+48NGU4Rd/aozYwPsgat5GSrVeQxJWYZHAsSdy81E+nmmvaU2PxEbF2le8PEnKxq6UT1E5x6lGnufMzmdcxO7750AGqrRWzUhrvNEjbn0e/UjVW9pe+jtmuKes/ank6F367BE/POHyPEdiOj1N8UbcQvjU2KySYcb0RSK1ZARIxoNiFnp84gtdU1fYeCWZD0kab6K5Dib13PcbocuZyb7YVWHcOquMRVhMytYDe8trl9J0ncByqLyO3OfGr0wi5HdenFwxeX4SGy0mMnN2t1uQAwnemMi/d9Xd/5R6qT9IiLUtA8RgW/eTwZkvq7RqBgibRxf/vwrcsFRUS2hKWpe0WqDeOVu6NqpVc99U5y7xJOH8hqIzbWG2evDmE/gQx5OMQQ9dJAzlo9knGWhPcMTe6EoMDt4yMeEI3yaKTfzXqYgLM9UQ5QIqhMSRhzaJAghxvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199018)(2906002)(82960400001)(38100700002)(86362001)(478600001)(6486002)(26005)(186003)(66946007)(8676002)(54906003)(83380400001)(41300700001)(6636002)(66556008)(66476007)(4326008)(6512007)(6666004)(107886003)(6506007)(316002)(8936002)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?67UmpsuKnD4HCpLZMm2y0dc4sq3wrCaPbJd0y/egN81JnecZRMakEEgmdl?=
 =?iso-8859-1?Q?HCEvvxXwlrpuHwPotG0n5L5q+ooNRHKLK8wT9LlHe8Ahnhds9CIaz0K0iE?=
 =?iso-8859-1?Q?JFcQxVDvcqdkhw6i/tfZwZW+aASo9bn1luwRRPvQ0bxCMLWIcn+8PF6GBH?=
 =?iso-8859-1?Q?cX32LxeHIfXNVDkKNtbio5H5A9qwvzhRqr9GAaa2Ntj6Xl6jkWvrkoAx3L?=
 =?iso-8859-1?Q?0/+ikv477VzB+TCtr78BAl/7wusE3LL+CIyX2yOzZ9aI1Qdigfejt+ItRC?=
 =?iso-8859-1?Q?geRi/azpz9SUZQ1zcIWSKunimzhI3mJLrn/5cbg/RgaqA1G61NPHsp9kBL?=
 =?iso-8859-1?Q?UV3hgBIIWIeDOvA2D/ZTl5cXaH5MtxJif07EoUAvrvrdaDmbP4HqpOyml4?=
 =?iso-8859-1?Q?9Fto+spRrmyqvhUQLh8AubTTWKJUM9xo8xbiLKgfzX/gmVON+7dsLYv5a5?=
 =?iso-8859-1?Q?ei88kRW7fIAGing+KXKbtzQ9UlnFJwKPsPX4MwXKIzmGuLzrdpvlqukVpa?=
 =?iso-8859-1?Q?tjqP7gkgmz5tLygJH6WmXne4mTRR3Zam6t5u0HQzW0xews/es5h+twaOhh?=
 =?iso-8859-1?Q?/CTOFbf7UfaRTXk7HkRDsjLsqHn3xlvCJmhcCpmTZZB5PYVI1M2zlnYGs5?=
 =?iso-8859-1?Q?F//S2nkzYyOj+ShwjfTcKEGYOAtKj0OXkqQnDVlgbpWvMOI344qbgsy4Wf?=
 =?iso-8859-1?Q?JmLl1xjuWMLG6q4AQjkE6RZMuyDS5xExvVMTg2nI1K/H5VLXcbem8KJQAE?=
 =?iso-8859-1?Q?e6jaJ5OpiuwzxDDIgampqVwn9qhB2Rk2aR91nR8vGo+xAyAb1ouhqPRfgJ?=
 =?iso-8859-1?Q?yeIfG+NHvHyNkk/nBFZEfHCAX3nmIb+4r4hr7MfBVk1ixa1qhHrUrzSf/s?=
 =?iso-8859-1?Q?n77X6Ymzv7EaFSG3lJAh2uQ6a/PWKgG3CAg7jICzrCo6SQKHODOOvdWEXe?=
 =?iso-8859-1?Q?WHGzdo+oJFtBMtgu5OEUCXLDSVlyqe8gBtzcwMYqrObatp0BwgafEm6E9R?=
 =?iso-8859-1?Q?sckY+WkKahKRGa3a+rM5bW/i5KORW/HQRYd6YvuN39La1zzynB2G70/2e2?=
 =?iso-8859-1?Q?qat1wuNq/vUGjxTd9xFdNIAVGutZHHyzAd2z511t1C8EkRr2iVzNyZvW9V?=
 =?iso-8859-1?Q?PSf0tI1oDPnIIQc1spgYj3/yORYLzsnguDnf5uP8OGwdPP1bwGMnUt0U2j?=
 =?iso-8859-1?Q?PZf+a4PELWS0dA3cwgnuQzgOovWDRFMR/x1rdkLJPWbVK4Sf1SjkkiYyEa?=
 =?iso-8859-1?Q?6u4QSMAK8mAnwTE73Ty8/4jROQZWPUnPF2FuscXRP68BLTULYlWHHykRBG?=
 =?iso-8859-1?Q?np09IZtzAdaAur1Pd5nU4db6F2hNKP8xfTdsXWaUhwkxMYJMEytFTO0L/9?=
 =?iso-8859-1?Q?kQD4V2NXvyoVsiGPD2DxWXSWFDyRcCq1YV3QqGdkERbpO6uA97zbOIm+r8?=
 =?iso-8859-1?Q?A7O5TRBjIcMlptP34nMeAPE2ELNcLiIYMUDg+Ffphwf+ZikCeni7PHx8UI?=
 =?iso-8859-1?Q?/ZLRfCjWX5FxGy117XxXSt636SGFP5suTV6SaqGqpcB8X3YavkYiL49o/9?=
 =?iso-8859-1?Q?bopeXE6x2/l0xmDNDL0/wPib8OsSSNSR/1OhMEcMAbzYWJSUaFav1/rcl5?=
 =?iso-8859-1?Q?nLAExMWXb+qHnQbfV1P9BhC2hjbLyVlPFdV74uqGWzMZU3wGnxDmcbIQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6edf55b-7284-41eb-d973-08db16cae83c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2023 00:54:54.0606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Oqmv0ciIPW5jHTVNSaIXotsBk49cimPXDqJueb2opkFQQvXSrApY0WBypLqnD1qKeI/ngYWY2E0Y+Idcw5ydpqednSTJgAgzA8vLpCxQg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7415
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 11/12] drm/xe: Add xe_reg_defs.h
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

On Fri, Feb 24, 2023 at 04:15:47PM -0800, Lucas De Marchi wrote:
> Wrap the include of i915_reg_defs.h into an xe-only header so the i915
> include doesn't need to be spread across the driver.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 +-
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  2 +-
>  drivers/gpu/drm/xe/regs/xe_reg_defs.h    | 11 +++++++++++
>  drivers/gpu/drm/xe/regs/xe_regs.h        |  2 +-
>  drivers/gpu/drm/xe/xe_device.c           |  3 +--
>  drivers/gpu/drm/xe/xe_gt_mcr.h           |  2 +-
>  drivers/gpu/drm/xe/xe_gt_pagefault.c     |  3 +--
>  drivers/gpu/drm/xe/xe_gt_topology.c      |  3 +--
>  drivers/gpu/drm/xe/xe_guc.c              |  2 --
>  drivers/gpu/drm/xe/xe_guc_reg.h          |  2 +-
>  drivers/gpu/drm/xe/xe_migrate.c          |  3 +--
>  drivers/gpu/drm/xe/xe_pcode_api.h        |  2 +-
>  drivers/gpu/drm/xe/xe_reg_sr_types.h     |  2 --
>  drivers/gpu/drm/xe/xe_rtp.h              |  2 --
>  drivers/gpu/drm/xe/xe_rtp_types.h        |  2 --
>  drivers/gpu/drm/xe/xe_step.c             |  3 +--
>  16 files changed, 22 insertions(+), 24 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_reg_defs.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 6dfa3cf2fd43..2aa67d001c34 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -8,7 +8,7 @@
>  
>  #include <asm/page.h>
>  
> -#include "i915_reg_defs.h"
> +#include "regs/xe_reg_defs.h"
>  
>  #define RING_TAIL(base)				_MMIO((base) + 0x30)
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 9290505d6596..3bf2fc3f80d8 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -6,7 +6,7 @@
>  #ifndef _XE_GT_REGS_H_
>  #define _XE_GT_REGS_H_
>  
> -#include "i915_reg_defs.h"
> +#include "regs/xe_reg_defs.h"
>  
>  /* RPM unit config (Gen8+) */
>  #define RPM_CONFIG0				_MMIO(0xd00)
> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> new file mode 100644
> index 000000000000..5f6735697d9c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_REG_DEFS_H_
> +#define _XE_REG_DEFS_H_
> +
> +#include "../../i915/i915_reg_defs.h"
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 53f1ed54fb1c..74588d42a339 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -5,7 +5,7 @@
>  #ifndef _XE_REGS_H_
>  #define _XE_REGS_H_
>  
> -#include "i915_reg_defs.h"
> +#include "regs/xe_reg_defs.h"
>  
>  #define GU_CNTL					_MMIO(0x101010)
>  #define   LMEM_INIT				REG_BIT(7)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8f2b2acd4024..87d3d2cde665 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/xe_drm.h>
>  
> +#include "regs/xe_reg_defs.h"
>  #include "xe_bo.h"
>  #include "xe_debugfs.h"
>  #include "xe_display.h"
> @@ -31,8 +32,6 @@
>  #include "xe_vm_madvise.h"
>  #include "xe_wait_user_fence.h"
>  
> -#include "../i915/i915_reg_defs.h"
> -
>  #define SOFTWARE_FLAGS_SPR33         _MMIO(0x4F084)
>  
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index c31987d2177c..2a6cd38c8cb7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -6,7 +6,7 @@
>  #ifndef _XE_GT_MCR_H_
>  #define _XE_GT_MCR_H_
>  
> -#include "i915_reg_defs.h"
> +#include "regs/xe_reg_defs.h"
>  
>  struct drm_printer;
>  struct xe_gt;
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 19403dbea9f5..062430394a33 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/ttm/ttm_execbuf_util.h>
>  
> +#include "regs/xe_reg_defs.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
>  #include "xe_gt_tlb_invalidation.h"
> @@ -20,8 +21,6 @@
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>  
> -#include "../i915/i915_reg_defs.h"
> -
>  struct pagefault {
>  	u64 page_addr;
>  	u32 asid;
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 264d6429318b..c03aa10b4c21 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -7,11 +7,10 @@
>  
>  #include <linux/bitmap.h>
>  
> +#include "regs/xe_reg_defs.h"
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
>  
> -#include "../i915/i915_reg_defs.h"
> -
>  #define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>  #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 661effa9830f..a8b0171ed7c2 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -22,8 +22,6 @@
>  #include "xe_uc_fw.h"
>  #include "xe_wopcm.h"
>  
> -#include "i915_reg_defs.h"
> -

Was this one supposed to be replaced by the new Xe header?  There are
REG_FIELD_GET and REG_GENMASK uses in this file, so we probably want the
new header included I think?


>  /* TODO: move to common file */
>  #define GUC_PVC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
>  #define PVC_MOCS_UC_INDEX		1
> diff --git a/drivers/gpu/drm/xe/xe_guc_reg.h b/drivers/gpu/drm/xe/xe_guc_reg.h
> index 513a7e0c8a5a..b5ebec30140d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_reg.h
> +++ b/drivers/gpu/drm/xe/xe_guc_reg.h
> @@ -9,7 +9,7 @@
>  #include <linux/compiler.h>
>  #include <linux/types.h>
>  
> -#include "i915_reg_defs.h"
> +#include "regs/xe_reg_defs.h"
>  
>  /* Definitions of GuC H/W registers, bits, etc */
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index d845f7cadbd4..4872adadeb8e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -11,6 +11,7 @@
>  #include <drm/ttm/ttm_tt.h>
>  #include <drm/xe_drm.h>
>  
> +#include "regs/xe_reg_defs.h"
>  #include "regs/xe_gpu_commands.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
> @@ -28,8 +29,6 @@
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>  
> -#include "../i915/i915_reg_defs.h"
> -
>  /**
>   * struct xe_migrate - migrate context.
>   */
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 2103f684a8b5..4e689cd4b23b 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -5,7 +5,7 @@
>  
>  /* Internal to xe_pcode */
>  
> -#include "../i915/i915_reg_defs.h"
> +#include "regs/xe_reg_defs.h"
>  
>  #define PCODE_MAILBOX			_MMIO(0x138124)
>  #define   PCODE_READY			REG_BIT(31)
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr_types.h b/drivers/gpu/drm/xe/xe_reg_sr_types.h
> index b234a8673e54..0e6d542ff1b4 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr_types.h
> +++ b/drivers/gpu/drm/xe/xe_reg_sr_types.h
> @@ -9,8 +9,6 @@
>  #include <linux/types.h>
>  #include <linux/xarray.h>
>  
> -#include "i915_reg_defs.h"
> -

Looks like just removing this one (without replacing) should be fine.

>  struct xe_reg_sr_entry {
>  	u32		clr_bits;
>  	u32		set_bits;
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index d6ba0b7e5042..bd44fd8bbe05 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -11,8 +11,6 @@
>  
>  #include "xe_rtp_types.h"
>  
> -#include "i915_reg_defs.h"
> -

This one with no replacement looks fine too.

>  /*
>   * Register table poke infrastructure
>   */
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index fac0bd6d5b1e..e87f1b280d96 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -8,8 +8,6 @@
>  
>  #include <linux/types.h>
>  
> -#include "i915_reg_defs.h"
> -

Ditto.


Matt

>  struct xe_hw_engine;
>  struct xe_gt;
>  
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index e5e77cb9ea09..f78a7dc3049f 100644
> --- a/drivers/gpu/drm/xe/xe_step.c
> +++ b/drivers/gpu/drm/xe/xe_step.c
> @@ -5,11 +5,10 @@
>  
>  #include "xe_step.h"
>  
> +#include "regs/xe_reg_defs.h"
>  #include "xe_device.h"
>  #include "xe_platform_types.h"
>  
> -#include "../i915/i915_reg_defs.h"
> -
>  /*
>   * Provide mapping between PCI's revision ID to the individual GMD
>   * (Graphics/Media/Display) stepping values that can be compared numerically.
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
