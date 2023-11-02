Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5633C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  2 Nov 2023 21:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA0210E0A9;
	Thu,  2 Nov 2023 21:40:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5974310E0A9
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Nov 2023 21:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698961212; x=1730497212;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oqSWha9hABmslnUGrn/t5+FsV42+o3cLj0GvlVbMAck=;
 b=javRRxFm/j+4N4wqP8mRghE9LtJ2cckXPeTj5oNzQ81mS7P5RUDO6w8T
 8AhkIEJM1wGJmtct2P/0MV5Z2KUKnLW0PGJL7IY46ffUORxgVKoksT9bY
 6CgrA8jIf7SA9JlCtR+Fa6sQLDUQ0XMge9W2xFUUCE12h7GyUNU2uOBMF
 WhqGPr3/HQk8rGr2RG2LrdNG5+NaB/SmNsgIvzX8nkRqqLoiKOQbqC/cI
 uW9XUKEecjuZOScDKCgE+WC2VIVb9rWLQeFeSeoR84cN+isUj4VrXcbEs
 UCy8M/2hUDAI+XFP3D4lxrd8qAZUwXaxVzrHAK7ZsC78GmXe3HpAbDB5U Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="392705871"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="392705871"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 14:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1008605750"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="1008605750"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Nov 2023 14:40:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 14:40:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 14:40:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 14:40:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1OXkGcpSZ2YyAPt0RpBmuxC3T3F5KvJKpbBE8eY9P9MbURpdktp/mLIoQuCntKTGRZHOw7ZWePkwvdRgWd5g8rjlGY5q0O6uOCycsjSERg04FTZb8oArp4eTF9is+uP3OFqy7ms7/raFSFFF83WdooLJiy5IwLtx1UNqTAIXeLixkzWoTQIlkmc+JM1panR4MzPAiAKUtXYsdVEnMAC2MRpQpMuEgBLGwGwcLBSv0Kn7xuuvFv2gDFDKwMMo8tHCEzAMCRJFJUnQEipVMdho0qyIcrRccOcCOYjGcfy9f44UDAHM993XjQolb6CnNRFt442mvkuADzi9Bfz5Iw1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/6lf4l8dDfz4SY11b1kQJIR5fur2Oeb99U2JQU+6GY=;
 b=O4Qf9x8NyHMzQG5/F52HjgZ32KRUA3+T/ZAQmWQ0rz9uNWl2Tkji3/30vq7pI71aWJ3WI+8mWPMmHGqL/bns78e6YIsC6uTNy5sFVALOYqM/KeovKnlLopMuiDbs4gro2fm9g9C2B5uqyL9lYJXb/WwBW/tgOV18NXHY7soguUlfADJmo59Nfa2lm2G9xR6ZNQ4eXd7NYu4evUhizD97UJ+jt+M2gIoTHnQQQ0CDdjz5kzMVvkKRQH6V4KteoRGkGY1BZDBOk8IshZ9EGlqGOx17V3erTSCpSrwIy19VcDcSFBhvIJrI01kWg+gwa8TqooNblaMBdf3w1HRR7UjMFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BN0PR11MB5710.namprd11.prod.outlook.com (2603:10b6:408:14a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 21:40:05 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62%4]) with mapi id 15.20.6954.021; Thu, 2 Nov 2023
 21:40:05 +0000
Date: Thu, 2 Nov 2023 14:40:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20231102214002.GG5757@mdroper-desk1.amr.corp.intel.com>
References: <20231101235749.4720-1-niranjana.vishwanathapura@intel.com>
 <20231101235749.4720-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231101235749.4720-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::24) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BN0PR11MB5710:EE_
X-MS-Office365-Filtering-Correlation-Id: fc82ecac-e1bb-428a-77fc-08dbdbec46ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nej6cQu0kBGG5SAKoJx2wTsBicS/l9aFVuGbIfiOLhQnCBDzrSEAPGBsJk3/SqMxI60s4qD8xf8uAk1KkrtCw2d9R39AWmNtfk3olw/vEA8C67e1reHlebDQGdAD/VhFjpRxq/sDNcmPU0JWPTzBelA5BqNSCyQrmSgk5/avltcy1RNMHjGcNYSZ89XVRXXm/5uVh2CpnlPhfrMnUN2h3pfpOVBpwQBzdTp4emLokbmZUugSSWjxfqDq/+OVFw702T95dZvStBralxZMgcpX4wil7kRav6opgonTHb7Bec8SrpBmd3NCH2yvhnVF6ewIktJFwizvxPOwK5WxWhOng+BtUiGeOMGAsTNMmwa5n399pSqxC43ejKS6zNHazap8duWMTcuO3PPo1MBaoymAzFDzqnIEy8UFDN2GrqsRaIH4N5tnr66xAkewMdx6KES5itbkO7AOtG5Eo0qg0OX0uJVmaSUtxe6k62qkThBN0d+FRhmuR/8Ght9I5RDD7WJWtMMVdz/CP6XBM2YJmdalAzSpnk+Tcdaob3q3YIO7ThayjanZjRGa3BSnurOoV7CC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(39860400002)(376002)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(66556008)(66946007)(316002)(6512007)(6506007)(66476007)(6636002)(26005)(1076003)(6666004)(33656002)(38100700002)(82960400001)(86362001)(83380400001)(6486002)(478600001)(5660300002)(2906002)(30864003)(41300700001)(4326008)(6862004)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?b0pS9xS5YRbfvL7Gad0/XMAtK5sTvpilrYL99g/UlOcFbqHbv2vndEZZI4?=
 =?iso-8859-1?Q?+YjlOEv89+bh0/Cds+RoOdpD6iJkAC80TOsWhOjQ6WFJE574Mzzct+uLjI?=
 =?iso-8859-1?Q?5NfaNg6JGlcVlr7t6rLzFIIxu1UInL2pbg6l5/9FH0aRT0jX6gfXTpHEYp?=
 =?iso-8859-1?Q?OVezLRZ5V+RpN28iCowxS4U/SjfuhrEnIxlL157Is33MgGirMEKJ1LNa1Z?=
 =?iso-8859-1?Q?wv66PK611DXe8NjybR07KxaXb6eeC3AvDgyysOPZSJH5ClxHK3xs7E67Kt?=
 =?iso-8859-1?Q?XX+WdibUjxPBhyM899KLqtWijeJfzevB0/VglA4BmdhZiU6qZ1o9tyhh8M?=
 =?iso-8859-1?Q?oSbhMJSIVIPLUKE729Jj+S+B2i4IMOfxsQBvXIHZ17rUj8zbe70R2x4ahM?=
 =?iso-8859-1?Q?sHmJqWcbm6LhuXNpRDx/bdb0oq5SpIfl9EUHNqQNzPANIzjXQ9ScsPsmTf?=
 =?iso-8859-1?Q?eXrHvXX2BnJoaGucu5NVGhXdFkhz/XWWgi8VpunzYyUV0d7abJU99rl88J?=
 =?iso-8859-1?Q?S+nkucZ8j5WHS1isaJB1TcS39IZZnkVFcChfQSbQk8GJF6s8CBFBNmcQbG?=
 =?iso-8859-1?Q?jHUavZx7AdoR6C1m3C6JdFhGp0lh16Azqkc/E/nnYLeyQ2p9Jpa9vF3rSV?=
 =?iso-8859-1?Q?h6eBfPyPMNUDyWIRAOmbC1h+n88rJpHpS/bdX8Ey95qovcY5+k9kG6VkVU?=
 =?iso-8859-1?Q?rz1+F7gXHIas2JXxs+pukS6mqa/oxFOKlJhASgPZNL0YwyIM2AInZ/ybPJ?=
 =?iso-8859-1?Q?PWtDA5oQisaw4gPFbCb4/WK8+ME93xX4Tw2xoLV4dd32uKxrnRa8mrKg3q?=
 =?iso-8859-1?Q?iF8WlLsd8ctQr1Zy/dCn87FkCN7kP18/88Aemjtz1GEXW4w/M/hUunTAuG?=
 =?iso-8859-1?Q?bVAxi45hER5NllbjhYHRhIbZ4LwyQjVfSuAVL42xX7bmBXmOFpyd5qvIq4?=
 =?iso-8859-1?Q?ZnAB85UMSvF3/j1UPRSnKJuc7jTHbI4/UUprMDcTYkSJOet9tYA+L1/I05?=
 =?iso-8859-1?Q?06LycvOl7EaisEMK4R1sY2nalfIcw4XVWmQ7+Hu1gfAlJsDTAPAk0cdaqV?=
 =?iso-8859-1?Q?bHZoEnwtHrmLV/eQL9O7uF1KR/cGnfUh98BOhprLeGec/L82/bgLEDk96j?=
 =?iso-8859-1?Q?9AFYV9ONrNwRKCuMLIYLrpCeNnu4TJ2mvd0XdY1g9b406kmmB8LzE+JyNE?=
 =?iso-8859-1?Q?9r9+bNQWsk0s/mmERC8ilhLaoJaXwBiDE6DsE01CiFRdpmXINvlN9ns8v1?=
 =?iso-8859-1?Q?0DVgrBDm8x1Ox7Cp8KNTGtB2dWCOVVqAB5UuWPCPJeKjRcMNLcf/hCwrkb?=
 =?iso-8859-1?Q?QbCwclOwxplv58WMv6TGuGKBahneWScXcMTWKy25qqzuEdaDAzON2z21L/?=
 =?iso-8859-1?Q?cOzPx6PD+ydEf6fVAhxvcesEgXUr6q+bkKzRm4q7oRf5eqLOlZ0m5WV0T5?=
 =?iso-8859-1?Q?sRqE872y8blUzmL7VTjSI1jpTy26bxIqHG2/AGBqSLbzIweeIHh12aGyZw?=
 =?iso-8859-1?Q?VsrRlTAcy70qz7rSgQ9kR3EH89UTqMpzlHUY3+6PvEYVO621je9JcHWcMx?=
 =?iso-8859-1?Q?fH79EXPvxttLCO+7XF+cuaxSdE6RPvC3STRU9jOGzweN47MjItN/07uOM8?=
 =?iso-8859-1?Q?5bakDJ/PfKGhBLWXtWZ+p8gE+ZQYxEjsAlf9sWmMSfBUuNWZzQjGh8ng?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc82ecac-e1bb-428a-77fc-08dbdbec46ad
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 21:40:04.9357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6Xg39rfOBEDzkv+25tvv71wrByP3yQ/fCfYvDJxtgcw61ynaXWYIvuC4YooY022tI/MKaN3xFJttDEqwi6ybp9F/3aF3XvufyWsMuAigTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5710
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v2 1/2] drm/xe: Enable Fixed CCS mode setting
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 01, 2023 at 04:57:48PM -0700, Niranjana Vishwanathapura wrote:
> Disable dynamic HW load balancing of compute resource assignment
> to engines and instead enabled fixed mode of mapping compute
> resources to engines.
> 
> Allow user to configure this CCS mode setting through a 'ccs_mode'
> sysfs entry.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 +++++
>  drivers/gpu/drm/xe/xe_gt.c           | 27 ++++++++--
>  drivers/gpu/drm/xe/xe_gt.h           |  2 +
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 79 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 22 ++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h     | 16 ++++++
>  drivers/gpu/drm/xe/xe_guc_ads.c      |  3 ++
>  drivers/gpu/drm/xe/xe_hw_engine.c    | 14 +++++
>  drivers/gpu/drm/xe/xe_tile_sysfs.c   | 54 +++++++++++++++++++
>  10 files changed, 227 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 776c31e73f29..a335d8762741 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -58,6 +58,7 @@ xe-y += xe_bb.o \
>  	xe_force_wake.o \
>  	xe_ggtt.o \
>  	xe_gt.o \
> +	xe_gt_ccs_mode.o \
>  	xe_gt_clock.o \
>  	xe_gt_debugfs.o \
>  	xe_gt_idle_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 7a6407e38265..b15aca465fc9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -388,8 +388,22 @@
>  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
>  
>  #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
> +#define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
>  #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>  
> +/*
> + * Total of 4 cslices, where each cslice is in the form:
> + *   [0-3]     CCS ID
> + *   [4-6]     RSVD
> + *   [7]       Disabled
> + */
> +#define CCS_MODE				XE_REG(0x14804)
> +#define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
> +#define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
> +#define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
> +#define   CCS_MODE_CSLICE(cslice, ccs) \
> +	(ccs << (cslice * CCS_MODE_CSLICE_WIDTH))
> +
>  #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
>  #define   FORCEWAKE_KERNEL			BIT(0)
>  #define   FORCEWAKE_USER			BIT(1)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d380f67b3365..5f3e2d3d63c3 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -22,6 +22,7 @@
>  #include "xe_force_wake.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt_clock.h"
> +#include "xe_gt_ccs_mode.h"

Nitpick:  We usually try to keep the #include's sorted, so "ccs" should
come before "clock."  Some of the other #include's farther down this
patch also need to be moved too.

>  #include "xe_gt_idle_sysfs.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_pagefault.h"
> @@ -78,6 +79,7 @@ static void gt_fini(struct drm_device *drm, void *arg)
>  	int i;
>  
>  	destroy_workqueue(gt->ordered_wq);
> +	mutex_destroy(&gt->ccs.mutex);
>  
>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>  		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> @@ -447,6 +449,12 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> +	/* Configure default CCS mode of 1 engine with all resources */
> +	if (xe_gt_needs_ccs_mode(gt)) {

If we're making this the new driver default, that's a pretty big
behavior change.  That's probably fine right now since Xe is still under
development, but you should probably get ack's on this change from the
relevant UMD devs just to make sure everyone is on the same page here.
It might also be good to put some justification in the commit message
too about why we think this is the best default.

> +		gt->ccs.num_engines = 1;
> +		xe_gt_apply_ccs_mode(gt);
> +	}
> +
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	XE_WARN_ON(err);
>  	xe_device_mem_access_put(gt_to_xe(gt));
> @@ -468,6 +476,7 @@ int xe_gt_init(struct xe_gt *gt)
>  	int err;
>  	int i;
>  
> +	mutex_init(&gt->ccs.mutex);
>  	INIT_WORK(&gt->reset.worker, gt_reset_worker);
>  
>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
> @@ -477,11 +486,11 @@ int xe_gt_init(struct xe_gt *gt)
>  
>  	err = xe_gt_tlb_invalidation_init(gt);
>  	if (err)
> -		return err;
> +		goto err_ccs_mode;
>  
>  	err = xe_gt_pagefault_init(gt);
>  	if (err)
> -		return err;
> +		goto err_ccs_mode;
>  
>  	xe_mocs_init_early(gt);
>  
> @@ -489,19 +498,24 @@ int xe_gt_init(struct xe_gt *gt)
>  
>  	err = gt_fw_domain_init(gt);
>  	if (err)
> -		return err;
> +		goto err_ccs_mode;
>  
>  	xe_force_wake_init_engines(gt, gt_to_fw(gt));
>  
>  	err = all_fw_domain_init(gt);
>  	if (err)
> -		return err;
> +		goto err_ccs_mode;
>  
>  	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
>  	if (err)
> -		return err;
> +		goto err_ccs_mode;
>  
>  	return 0;
> +
> +err_ccs_mode:
> +	mutex_destroy(&gt->ccs.mutex);
> +
> +	return err;
>  }
>  
>  static int do_gt_reset(struct xe_gt *gt)
> @@ -549,6 +563,9 @@ static int do_gt_restart(struct xe_gt *gt)
>  		xe_reg_sr_apply_whitelist(hwe);
>  	}
>  
> +	/* Get CCS mode in sync between sw/hw */
> +	xe_gt_apply_ccs_mode(gt);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index caded203a8a0..1c2a1d35a2c1 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -17,6 +17,8 @@
>  		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
>  			  xe_hw_engine_is_valid((hwe__)))
>  
> +#define CCS_MASK(gt) ((gt->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
> +
>  #ifdef CONFIG_FAULT_INJECTION
>  extern struct fault_attr gt_reset_failure;
>  static inline bool xe_fault_inject_gt_reset(void)
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> new file mode 100644
> index 000000000000..cec552e823b6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "xe_assert.h"
> +#include "xe_gt.h"
> +#include "xe_mmio.h"
> +#include "xe_gt_ccs_mode.h"
> +#include "regs/xe_gt_regs.h"
> +
> +static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
> +{
> +	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_hw_engine *hwe;
> +	int num_slices = hweight32(CCS_MASK(gt));
> +	int width, cslice;
> +	enum xe_hw_engine_id id;
> +	u32 config = 0;
> +
> +	lockdep_assert_held(&gt->ccs.mutex);
> +	xe_assert(xe, GRAPHICS_VERx100(gt_to_xe(gt)) <= 1260);

Why a <= here when the other checks elsewhere are ==?  Actually, if we
think we might extend this to other platforms in the future, it's
probably best to just pull out the version matching to a dedicated
function now so that when new platforms need this in the future we can
just make a single change in one place, rather than hunting down all the
1260 checks in the code.

> +
> +	xe_assert(xe, num_engines && num_engines <= num_slices);
> +	xe_assert(xe, !(num_slices % num_engines));
> +
> +	/*
> +	 * Loop over all available slices and assign each a user engine.
> +	 *
> +	 * With 1 engine (ccs0):
> +	 *   slice 0, 1, 2, 3: ccs0
> +	 *
> +	 * With 2 engines (ccs0, ccs1):
> +	 *   slice 0, 2: ccs0
> +	 *   slice 1, 3: ccs1
> +	 *
> +	 * With 4 engines (ccs0, ccs1, ccs2, ccs3):
> +	 *   slice 0: ccs0
> +	 *   slice 1: ccs1
> +	 *   slice 2: ccs2
> +	 *   slice 3: ccs3
> +	 */
> +	for (width = num_slices / num_engines, cslice = 0; width--;) {
> +		for_each_hw_engine(hwe, gt, id) {
> +			if (hwe->class != XE_ENGINE_CLASS_COMPUTE)
> +				continue;
> +
> +			if (hwe->logical_instance >= num_engines)
> +				break;
> +
> +			config |= BIT(hwe->instance) << XE_HW_ENGINE_CCS0;
> +
> +			/* If a slice is fused off, leave disabled */
> +			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
> +				cslice++;
> +
> +			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
> +			mode |= CCS_MODE_CSLICE(cslice, hwe->instance);
> +			cslice++;
> +		}
> +	}
> +
> +	xe_mmio_write32(gt, CCS_MODE, mode);
> +
> +	drm_info(&xe->drm,
> +		 "tile-%d CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
> +		 gt_to_tile(gt)->id, mode, config, num_engines, num_slices);

You probably want to use xe_gt_info() here so that it will print out the
GT identification automatically in a standard form.  Then you can drop
the tile ID part of the message (which could become confusing anyway if
we ever have multiple GTs with CCS engines within the same tile).


> +}
> +
> +void xe_gt_apply_ccs_mode(struct xe_gt *gt)
> +{
> +	mutex_lock(&gt->ccs.mutex);

What exactly is ccs.mutex protecting?  From a quick glance it doesn't
look like racing calls to this function without the lock would be any
more problematic than racing calls with the lock?  And this only gets
called during init / reset so is it even possible to have a race?

> +
> +	if (gt->ccs.num_engines)
> +		__xe_gt_apply_ccs_mode(gt, gt->ccs.num_engines);
> +
> +	mutex_unlock(&gt->ccs.mutex);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> new file mode 100644
> index 000000000000..793f3bbb4937
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_CCS_MODE_H_
> +#define _XE_GT_CCS_MODE_H_
> +
> +#include "xe_device_types.h"
> +#include "xe_gt.h"
> +#include "xe_gt_types.h"
> +#include "xe_platform_types.h"
> +
> +void xe_gt_apply_ccs_mode(struct xe_gt *gt);
> +
> +static inline bool xe_gt_needs_ccs_mode(const struct xe_gt *gt)
> +{
> +	return GRAPHICS_VERx100(gt_to_xe(gt)) == 1260 && CCS_MASK(gt);
> +}
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index d3f2793684e2..5342aff9dd68 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -185,6 +185,22 @@ struct xe_gt {
>  		spinlock_t lock;
>  	} tlb_invalidation;
>  
> +	/**
> +	 * @ccs: Fixed mapping between CCS engines and compute slices.
> +	 * Through the per-tile 'ccs_mode' sysfs interface, the user can specify a
> +	 * fixed number of compute hardware engines to which the available compute
> +	 * slices are to be allocated. By default all compute slices are allocated
> +	 * to the first available compute engine instance. This user configuration
> +	 * change triggers a tile reset and it is expected that user will ensure
> +	 * the tile is idle while doing so.
> +	 */
> +	struct {
> +		/** @mutex: Serialize CCS mode access */
> +		struct mutex mutex;
> +		/** @num_engines: Number of CCS engines enabled */
> +		u32 num_engines;
> +	} ccs;
> +
>  	/** @usm: unified shared memory state */
>  	struct {
>  		/**
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 88789826e781..74b550be0e36 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_engine_regs.h"
> +#include "xe_gt_ccs_mode.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_guc_regs.h"
>  #include "xe_bo.h"
> @@ -454,6 +455,8 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  		{ .reg = RING_HWS_PGA(hwe->mmio_base),			},
>  		{ .reg = RING_IMR(hwe->mmio_base),			},
>  		{ .reg = RCU_MODE, .skip = hwe != hwe_rcs_reset_domain	},
> +		{ .reg = CCS_MODE,
> +		  .skip = hwe != hwe_rcs_reset_domain || !xe_gt_needs_ccs_mode(hwe->gt)	},

I don't think CCS_MODE exists on older (pre-xehp platforms).  So I think
this will cause either an invalid register (or possibly an unrelated
register if there's something else at that offset) to get saved/restored
on older platforms like TGL, ADL, etc.

>  	};
>  	u32 i;
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index b5b084590888..0058bbf8fd06 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_engine_regs.h"
> +#include "xe_gt_ccs_mode.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_assert.h"
> @@ -283,6 +284,13 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>  	hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
>  }
>  
> +static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
> +						 const struct xe_hw_engine *hwe)
> +{
> +	return xe_gt_needs_ccs_mode(gt) &&
> +	       xe_rtp_match_first_render_or_compute(gt, hwe);
> +}
> +
>  void
>  xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>  {
> @@ -307,6 +315,12 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>  				 blit_cctl_val,
>  				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  		},
> +		/* Use Fixed slice CCS mode */
> +		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
> +		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
> +		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
> +					   RCU_MODE_FIXED_SLICE_CCS_MODE))
> +		},
>  		{}
>  	};
>  
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 16376607c68f..a0162744ce24 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c

Engines are a GT concept, not a tile concept, so you probably want this
in the GT sysfs instead.  Otherwise we're going to be stuck with a
problematic ABI down the road if we have a platform with multiple
compute-capable GTs within a single tile.


> @@ -7,8 +7,12 @@
>  #include <linux/sysfs.h>
>  #include <drm/drm_managed.h>
>  
> +#include "xe_gt.h"
> +#include "xe_gt_ccs_mode.h"
> +#include "xe_mmio.h"
>  #include "xe_tile.h"
>  #include "xe_tile_sysfs.h"
> +#include "regs/xe_gt_regs.h"
>  
>  static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>  {
> @@ -34,6 +38,51 @@ static DEVICE_ATTR_RO(physical_vram_size_bytes);
>  static const struct attribute *physical_memsize_attr =
>  	&dev_attr_physical_vram_size_bytes.attr;
>  
> +static ssize_t
> +ccs_mode_show(struct device *kdev,
> +	      struct device_attribute *attr, char *buf)
> +{
> +	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
> +
> +	return sysfs_emit(buf, "%d\n", tile->primary_gt->ccs.num_engines);
> +}
> +
> +static ssize_t
> +ccs_mode_store(struct device *kdev, struct device_attribute *attr,
> +	       const char *buff, size_t count)
> +{
> +	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_gt *gt = tile->primary_gt;
> +	u32 num_engines, num_slices;
> +	int ret;
> +
> +	ret = kstrtou32(buff, 0, &num_engines);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Ensure number of engines specified is valid and there is an
> +	 * exact multiple of engines for slices.
> +	 */
> +	num_slices = hweight32(CCS_MASK(gt));
> +	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
> +		drm_dbg(&xe->drm, "Invalid compute config for tile %d, %d engines %d slices\n",

As earlier, we should probably use xe_gt_dbg() and drop the
tile-specific number since the function will print the GT identification
automatically.  Same for the other drm_info (xe_gt_info) and drm_warn
(xe_gt_warn) messages below.

> +			tile->id, num_engines, num_slices);
> +		return -EINVAL;
> +	}
> +
> +	if (gt->ccs.num_engines != num_engines) {
> +		drm_info(&xe->drm, "tile-%d: setting compute mode to %d\n", tile->id, num_engines);
> +		gt->ccs.num_engines = num_engines;
> +		xe_gt_reset_async(gt);
> +	}
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(ccs_mode);
> +
>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_tile *tile = arg;
> @@ -69,6 +118,11 @@ void xe_tile_sysfs_init(struct xe_tile *tile)

We'll want to move this to xe_gt_sysfs_init as well.


Matt

>  		drm_warn(&xe->drm,
>  			 "Sysfs creation to read addr_range per tile failed\n");
>  
> +	if (GRAPHICS_VERx100(xe) == 1260 &&
> +	    sysfs_create_file(tile->sysfs, &dev_attr_ccs_mode.attr))
> +		drm_warn(&xe->drm,
> +			 "Sysfs creation to set ccs_mode failed\n");
> +
>  	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>  	if (err) {
>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
