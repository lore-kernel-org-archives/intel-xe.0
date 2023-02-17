Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE19C636D6
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 20:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E022F10E169;
	Fri, 17 Feb 2023 20:27:22 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA1110E169
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 20:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676665641; x=1708201641;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vxW9t94zBHXXdyBZUKXOL4Fw6amavp8+MM0nsH5lwuc=;
 b=Lww7vfFavKdNzCqDJG8PtuSXsxWkUEGlu5pnmFmENy9a9hgBF55jSjng
 97LK8+4AvLAUSrtW4r0Kl5qcJcPolVfzvURG/xn8SuVwWTHH965gsQBBs
 SlR86BpgbQ114jUUGCSLo1ZQ0NrTD2oJu3OQk6KlvD/ZEgyQXX/bXnXSm
 nWeOqmurCA+pV3jXUOfhvUHJkCYv6MSuonYfhE4oyRIeNIrZs7wBMTj5u
 28hIF7pFA2f4vtlEFfVsiGXT7VH9u9YW+2+YWZ2HaMEFhx2QShGz6M6mZ
 sl7OlkF7ZkYevrvhU3P3/64PgK3cBR22g1bm14I0jIoiOtwPjnC87S3fn g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="329801730"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="329801730"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 12:27:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="672705128"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="672705128"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 17 Feb 2023 12:27:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 12:27:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 12:27:20 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 12:27:20 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 12:27:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUfdesOX4SqTUUcZA1keDBPOHd23/Fb6iHQvgfi5cCf+MwRRx0x/xzcQLjzFbxxDQ5CI9ic72m1XIZmtppeJ49TxNrioTJcrFg2YR3VVK9pV7VWQqOr0Lv06F+OzXJWyMnUGXuhWtqTuVnS7eZbzyYEYSbVaPbsiDdkcXcu3eNWJJY1sTj6r6SfFSK/Hnfp5fOVqcLCWcVhpbq0Om/qmdrB5DSy+yB45KRnrDcy8e8a+CIXPBna+Rp0u/9grk3AF6sv3+ws2P8eYqjq1iEPQpCreGwbf6o5JfXB5n2Psr8DSbKBs4MWZz+1hYds8DPyU/haf3gOUnx7QAkUZ9vvPTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcsQ1MrgE3REM6RGuHuXt2rXneQLUMFVeK6R/a9EsKQ=;
 b=PvIkUUCd9vsBaXhLdSEzLtVXNfFbg+J2dGoghO2Txxb/P0D43/bkPNtN8COMH7LYaLfHldLwTzWb2zPm35VcMrAeQq5Cxfb6Rd4kTRs/ReIeazW2QuOyD2vHUse0TkgssSWZB44bJabr6le3vrCqeGj2+1O0raXH9BNgOfRcL9M63hVFoq6apGOAM84K9BAULcfBn1NNnMQ+8T4JXwBLTL5NmePfkj9JTf32OhcAMXVC+SCLZgU02aD8w+O0gsZqYQFcNeIo/ghOLeCwb0K8XsnGiBqT0FygQY0JBxaZVnNGJ67PtAY1ohh6LZLwTKk7Kc4JZ1qXAytCCuscVwObhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.17; Fri, 17 Feb
 2023 20:27:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Fri, 17 Feb 2023
 20:27:17 +0000
Date: Fri, 17 Feb 2023 15:27:12 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y+/jICXsAkeW0Onw@intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230217005226.106499-9-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR06CA0016.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4637:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e04b9b5-0448-454d-52df-08db11255ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tdeCPbILROM9Fpchb6PbJfxXiXdcoH4cWCBmm9EYjrJNdNhMhzaNV4jxEwM2zVzEfc/xjyk8Zc+ooePnD7OWl/Z9iGph56NfRy4PEMUq6y2oNoGhW7FV2oSwh6Pc//3SzxMLUGWQ7tjiUPNB3+ZnlYg44EaXwBXmdP6VxTuF/lYQP09HO2YL3y5snHIefNknJ8rSOp3DyAC+DqQcpTBAscja9YdpU55n8yYw2SR9jVCAIfPtk1hwq0VEEXmqsI5xEnE3ku+pSy9+z6YCCPn21PgFVpCQY4HNFJe92cVacn7izI6tGZAG/YwpiUrVq1aDMJ3dro/i6SVvm7cQ2Bcge1Db2wJ+B6d6x8JWG/4mFv5UoUnE/WNKAJXcyVI2taMqUS2oGVRwM0iPtTzGyiLcCghcCyrq32aKrpz9O+wdWmEf5Jzt3wT0tzu7wwEGANjk2z/qtrEvJQmTUoM9kUUCeqo+NtkRWVEjg3UEtnPhjDcQ0/w7Pie2rh7J+k1W+M6WxLRt4EHHAGkHw6Y3BdexVH0AROdIFi4cBBbr3RHfZPOkc6UEQ4yXFEim24XG9Y21FseD+K9sOJqt+CQPWsGOWNERGcfTYL+3QDeMLHCXn2UA4LQ2MWA+WMhAGJC+qh5Jo8gn2GSMcyEF7QLkioCd9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199018)(36756003)(38100700002)(2616005)(83380400001)(478600001)(107886003)(82960400001)(6666004)(26005)(186003)(6506007)(6512007)(6486002)(8936002)(6862004)(54906003)(316002)(37006003)(6636002)(4326008)(66556008)(8676002)(86362001)(66946007)(66476007)(41300700001)(30864003)(44832011)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?c9vHI4m2Cz9uFpdu3Kn8mUjmZPUaP1SLC3LeyXDCZAXzusB8s3xlrFdmih?=
 =?iso-8859-1?Q?EtrSinoFjc9o88+7ver5SfQJKpsv3JfdJjWgvemf/1uWtLA1+SsXUXtM5u?=
 =?iso-8859-1?Q?CiBQ6V9xgN010eHrU8+2f/ufPUcc4d78KieZqEZjjzobnnp0GGeRQGor/7?=
 =?iso-8859-1?Q?dQfEYEUMiGOq6z/+2BmTHWOmDWbH7md+maAuec2Dt8Dogt/jY/+krTLndK?=
 =?iso-8859-1?Q?n8R8XUtHLzZjovnE/hDgCudjBwdoMSbpNuLkv32uziB43OAekdBDfLn//b?=
 =?iso-8859-1?Q?c0gWgYPlCIyI1I0XJnqSCvat3vjlMy4BDuQo83vcnTaefSw4aUfugKYvdp?=
 =?iso-8859-1?Q?FPBr9zmb7nlDow7kCt5JsKvOobqv/b608T4z8+lp4OXPUCdiUB4XtAKAI0?=
 =?iso-8859-1?Q?Pf0v+cMXKJGJP61DYAygsIh5aTozFGuNdI6dxdhmoHJJxxPHFhwTH3NJoh?=
 =?iso-8859-1?Q?42B8kIbRpg6d44vBCBxaeC/AXt7unybRFz8v6bLoaoyumgbMqMm4aS5Pz1?=
 =?iso-8859-1?Q?9G8Ikw+GERImx3Y4j3ATFqY90M8YFNtYGu4LmMnHz0iLlb1uINCEl8k7RS?=
 =?iso-8859-1?Q?3x+RehCdwk364Cyqx5q7zcaceTx9D0lnrKIMhY7bGRK0SMU5+RNZs2fgnw?=
 =?iso-8859-1?Q?gPHMIbHSZubGvQtCZGq6oz+ap/HP2w9X+WCKfrbJ4Mh4nIhhFGXkAPX4FH?=
 =?iso-8859-1?Q?81e3KNJ/3b2FH0LkEop8/Igy8mk7dhCb0jWcGgcsrliaRullQhxnnZge3A?=
 =?iso-8859-1?Q?h0XmVfgg5CfSmLv0wE7P8X7+duyvpUJleSmhHy/zjDWBtWGzox8V1mut83?=
 =?iso-8859-1?Q?RBG+Ly9jV7fo8J5geHmVqeCwCjHUTSGADQaHzoyjL4d8QUqxIL6LOi1X/T?=
 =?iso-8859-1?Q?URngW25WqXFrbrOZzjZRNDe6731GIDo4XUrVxSOGgJ4rnj7csYC2PG8f9y?=
 =?iso-8859-1?Q?hkNluf3SGpizfx1Me14AX3AZBMboWgWFlWVDhgk5QkYb/POsjzHUaSdvN8?=
 =?iso-8859-1?Q?ahxP1+LVUCLCT0qjFNQUtKKyIhW5MJb83OhmDnzefhOuQuuDGnirpqcwMv?=
 =?iso-8859-1?Q?0kY7e5Jp6n31dSIpXIs8h+L+dTVG4sB6/sC0NzfPsVVp7TuXk1JPBBNaJM?=
 =?iso-8859-1?Q?zyXkArK3Wm45FSrORD7r7oDdv/IIrAoAj/3RkDsX218tQXV9vqkOV6jR/w?=
 =?iso-8859-1?Q?w5DmU77bt5XEK2ZYXlpM0BfWan+HI+4TJpGp7GF4biuBThkHy8vsMtGhkk?=
 =?iso-8859-1?Q?KT0UZtrIQONNNHgubscEQELnvyWa8ekCbeT+d4djhdXvVZsEAn10vSuNc8?=
 =?iso-8859-1?Q?vFj+Sa7bmoKsfyIWY5sEwitNx5GM+yzt6ckAzm0m8SzhudokxrWNksW3oc?=
 =?iso-8859-1?Q?RaFDslRl8ikgQg0CSYs2gLUzTdXkQgMAwNuMHMiv2UhsJ25LWUtIHmv3ZX?=
 =?iso-8859-1?Q?VLL3I6WnA6H+QS+PmqVf+d9R3EN2cy7X7MPyE9+2nj3LNqc5cyplyO9K+2?=
 =?iso-8859-1?Q?7DKSkRwej3vbdVgaGw0B4F3Zi9SQam/b5SOS7UuIWCxkr6A9C/wUgvm0w0?=
 =?iso-8859-1?Q?a0al/xeRG13dxhMEMyu7kqsaR7GXWL2HcUdiF5fuPNc/dYubxQbwrdj7OE?=
 =?iso-8859-1?Q?GXhWizu3ud/uGS2OwnTF7FBtEcw9q+t6Ma+gXkGruTNOVF5B7ji1ZfPg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e04b9b5-0448-454d-52df-08db11255ce1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 20:27:17.6396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8bZgPRfxzYvSAZhYX9lQKWDAyL+8olYlrWtv5/OAJEUL6cTd1qSDuT5ebbkLoLjEBteVSp2YyEduqFoVZ5CLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/11] drm/xe: Remove dependency on
 i915_reg.h
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

On Thu, Feb 16, 2023 at 04:52:23PM -0800, Lucas De Marchi wrote:
> Copy the macros used by xe in i915_reg.h to regs/xe_regs.h. A minimal
> cleanup is done while copying so they adhere minimally to the coding
> style.  Further reordering and cleaning is left for later.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h      | 111 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_execlist.c       |   3 +-
>  drivers/gpu/drm/xe/xe_ggtt.c           |   3 +-
>  drivers/gpu/drm/xe/xe_gt_clock.c       |   3 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c         |   3 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c      |   3 +-
>  drivers/gpu/drm/xe/xe_irq.c            |   3 +-
>  drivers/gpu/drm/xe/xe_lrc.c            |   3 +-
>  drivers/gpu/drm/xe/xe_mmio.c           |   3 +-
>  drivers/gpu/drm/xe/xe_pci.c            |   3 +-
>  drivers/gpu/drm/xe/xe_ring_ops.c       |   3 +-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |   3 +-
>  drivers/gpu/drm/xe/xe_wa.c             |   3 +-
>  13 files changed, 123 insertions(+), 24 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_regs.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> new file mode 100644
> index 000000000000..53f1ed54fb1c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -0,0 +1,111 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#ifndef _XE_REGS_H_
> +#define _XE_REGS_H_
> +
> +#include "i915_reg_defs.h"
> +
> +#define GU_CNTL					_MMIO(0x101010)
> +#define   LMEM_INIT				REG_BIT(7)
> +
> +#define RENDER_RING_BASE			0x02000
> +#define BSD_RING_BASE				0x04000
> +#define GEN6_BSD_RING_BASE			0x12000
> +#define GEN8_BSD2_RING_BASE			0x1c000
> +#define GEN11_BSD_RING_BASE			0x1c0000
> +#define GEN11_BSD2_RING_BASE			0x1c4000
> +#define GEN11_BSD3_RING_BASE			0x1d0000
> +#define GEN11_BSD4_RING_BASE			0x1d4000
> +#define XEHP_BSD5_RING_BASE			0x1e0000
> +#define XEHP_BSD6_RING_BASE			0x1e4000
> +#define XEHP_BSD7_RING_BASE			0x1f0000
> +#define XEHP_BSD8_RING_BASE			0x1f4000
> +#define VEBOX_RING_BASE				0x1a000
> +#define GEN11_VEBOX_RING_BASE			0x1c8000
> +#define GEN11_VEBOX2_RING_BASE			0x1d8000
> +#define XEHP_VEBOX3_RING_BASE			0x1e8000
> +#define XEHP_VEBOX4_RING_BASE			0x1f8000
> +#define GEN12_COMPUTE0_RING_BASE		0x1a000
> +#define GEN12_COMPUTE1_RING_BASE		0x1c000
> +#define GEN12_COMPUTE2_RING_BASE		0x1e000
> +#define GEN12_COMPUTE3_RING_BASE		0x26000
> +#define BLT_RING_BASE				0x22000
> +#define XEHPC_BCS1_RING_BASE			0x3e0000
> +#define XEHPC_BCS2_RING_BASE			0x3e2000
> +#define XEHPC_BCS3_RING_BASE			0x3e4000
> +#define XEHPC_BCS4_RING_BASE			0x3e6000
> +#define XEHPC_BCS5_RING_BASE			0x3e8000
> +#define XEHPC_BCS6_RING_BASE			0x3ea000
> +#define XEHPC_BCS7_RING_BASE			0x3ec000
> +#define XEHPC_BCS8_RING_BASE			0x3ee000
> +#define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
> +#define   GT_CONTEXT_SWITCH_INTERRUPT		(1 <<  8)
> +#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	(1 <<  4)
> +#define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
> +#define   GT_RENDER_USER_INTERRUPT		(1 <<  0)
> +
> +#define GEN7_FF_THREAD_MODE			_MMIO(0x20a0)
> +#define   GEN12_FF_TESSELATION_DOP_GATE_DISABLE BIT(19)
> +
> +#define PVC_RP_STATE_CAP			_MMIO(0x281014)
> +#define MTL_RP_STATE_CAP			_MMIO(0x138000)
> +
> +#define MTL_MEDIAP_STATE_CAP			_MMIO(0x138020)
> +#define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
> +#define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
> +
> +#define MTL_GT_RPE_FREQUENCY			_MMIO(0x13800c)
> +#define MTL_MPE_FREQUENCY			_MMIO(0x13802c)
> +#define   MTL_RPE_MASK				REG_GENMASK(8, 0)
> +
> +#define TRANSCODER_A_OFFSET			0x60000
> +#define TRANSCODER_B_OFFSET			0x61000
> +#define TRANSCODER_C_OFFSET			0x62000
> +#define TRANSCODER_D_OFFSET			0x63000
> +#define TRANSCODER_DSI0_OFFSET			0x6b000
> +#define TRANSCODER_DSI1_OFFSET			0x6b800
> +#define PIPE_A_OFFSET				0x70000
> +#define PIPE_B_OFFSET				0x71000
> +#define PIPE_C_OFFSET				0x72000
> +#define PIPE_D_OFFSET				0x73000
> +#define PIPE_DSI0_OFFSET			0x7b000
> +#define PIPE_DSI1_OFFSET			0x7b800
> +
> +#define GEN8_PCU_ISR				_MMIO(0x444e0)
> +#define GEN8_PCU_IMR				_MMIO(0x444e4)
> +#define GEN8_PCU_IIR				_MMIO(0x444e8)
> +#define GEN8_PCU_IER				_MMIO(0x444ec)
> +
> +#define GEN11_GU_MISC_ISR			_MMIO(0x444f0)
> +#define GEN11_GU_MISC_IMR			_MMIO(0x444f4)
> +#define GEN11_GU_MISC_IIR			_MMIO(0x444f8)
> +#define GEN11_GU_MISC_IER			_MMIO(0x444fc)
> +#define   GEN11_GU_MISC_GSE			(1 << 27)
> +
> +#define GEN11_GFX_MSTR_IRQ			_MMIO(0x190010)
> +#define   GEN11_MASTER_IRQ			(1 << 31)
> +#define   GEN11_GU_MISC_IRQ			(1 << 29)
> +#define   GEN11_DISPLAY_IRQ			(1 << 16)
> +#define   GEN11_GT_DW_IRQ(x)			(1 << (x))
> +
> +#define DG1_MSTR_TILE_INTR			_MMIO(0x190008)
> +#define   DG1_MSTR_IRQ				REG_BIT(31)
> +#define   DG1_MSTR_TILE(t)			REG_BIT(t)
> +
> +#define GEN9_TIMESTAMP_OVERRIDE					_MMIO(0x44074)
> +#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT	0
> +#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK	0x3ff
> +#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT	12
> +#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	(0xf << 12)
> +
> +#define GGC					_MMIO(0x108040)
> +#define   GMS_MASK				REG_GENMASK(15, 8)
> +#define   GGMS_MASK				REG_GENMASK(7, 6)

one of the things that I'm always confused is with these REG_{BIT,GENMASK,FIELD_PREP}.
Why can't we simply use the regular "non-REG_" versions like every other driver
(aside of i915 of course).

> +
> +#define GEN12_GSMBASE				_MMIO(0x108100)
> +#define GEN12_DSMBASE				_MMIO(0x1080C0)
> +#define   GEN12_BDSM_MASK			REG_GENMASK64(63, 20)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index c3c52bdc70b1..ad097918b496 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -10,6 +10,7 @@
>  #include "regs/xe_lrc_regs.h"
>  #include "regs/xe_gpu_commands.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_engine.h"
> @@ -22,8 +23,6 @@
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
>  
> -#include "i915_reg.h"
> -
>  #define XE_EXECLIST_HANG_LIMIT 1
>  
>  #define GEN11_SW_CTX_ID_SHIFT 37
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 2c9b2175c5bb..6674297fa25e 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -10,6 +10,7 @@
>  #include <drm/i915_drm.h>
>  
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> @@ -18,8 +19,6 @@
>  #include "xe_mmio.h"
>  #include "xe_wopcm.h"
>  
> -#include "i915_reg.h"
> -
>  /* FIXME: Common file, preferably auto-gen */
>  #define MTL_GGTT_PTE_PAT0	BIT_ULL(52)
>  #define MTL_GGTT_PTE_PAT1	BIT_ULL(53)
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index e9aa7c5452af..cbf9c96c142c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -5,13 +5,12 @@
>  #include "xe_gt_clock.h"
>  
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  
> -#include "i915_reg.h"
> -
>  static u32 read_reference_ts_freq(struct xe_gt *gt)
>  {
>  	u32 ts_override = xe_mmio_read32(gt, GEN9_TIMESTAMP_OVERRIDE.reg);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index f7aaf4826f00..0df82defa7e4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> @@ -19,8 +20,6 @@
>  #include "xe_mmio.h"
>  #include "xe_pcode.h"
>  
> -#include "i915_reg.h"
> -#include "i915_reg_defs.h"
>  #include "intel_mchbar_regs.h"
>  
>  /* For GEN6_RP_STATE_CAP.reg to be merged when the definition moves to Xe */
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index caae4f897644..2b49ccba0ce9 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -8,6 +8,7 @@
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_execlist.h"
> @@ -22,8 +23,6 @@
>  #include "xe_sched_job.h"
>  #include "xe_wa.h"
>  
> -#include "i915_reg.h"
> -
>  #define MAX_MMIO_BASES 3
>  struct engine_info {
>  	const char *name;
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index d7756c14b4e2..f4f84a16dd83 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_device.h"
>  #include "xe_display.h"
>  #include "xe_drv.h"
> @@ -17,8 +18,6 @@
>  #include "xe_hw_engine.h"
>  #include "xe_mmio.h"
>  
> -#include "i915_reg.h"
> -
>  static void gen3_assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
>  {
>  	u32 val = xe_mmio_read32(gt, reg.reg);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index c1df76c2cf78..261eabaae369 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -8,6 +8,7 @@
>  #include "regs/xe_lrc_regs.h"
>  #include "regs/xe_gpu_commands.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_engine_types.h"
> @@ -16,8 +17,6 @@
>  #include "xe_map.h"
>  #include "xe_vm.h"
>  
> -#include "i915_reg.h"
> -
>  #define GEN8_CTX_VALID				(1 << 0)
>  #define GEN8_CTX_L3LLC_COHERENT			(1 << 5)
>  #define GEN8_CTX_PRIVILEGE			(1 << 8)
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index d0cd9e920d34..262d33e59d26 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -9,14 +9,13 @@
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_macros.h"
>  #include "xe_module.h"
>  
> -#include "i915_reg.h"
> -
>  #define XEHP_MTCFG_ADDR		_MMIO(0x101800)
>  #define TILE_COUNT		REG_GENMASK(15, 8)
>  #define GEN12_LMEM_BAR		2
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b0e5c402190c..4ecde7c2e619 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -13,6 +13,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/xe_pciids.h>
>  
> +#include "regs/xe_regs.h"
>  #include "xe_device.h"
>  #include "xe_drv.h"
>  #include "xe_macros.h"
> @@ -20,8 +21,6 @@
>  #include "xe_pm.h"
>  #include "xe_step.h"
>  
> -#include "i915_reg.h"
> -
>  #define DEV_INFO_FOR_EACH_FLAG(func) \
>  	func(require_force_probe); \
>  	func(is_dgfx); \
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 104f96658e1f..ba3bde117af1 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -7,6 +7,7 @@
>  #include "regs/xe_lrc_regs.h"
>  #include "regs/xe_gpu_commands.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_engine_types.h"
>  #include "xe_gt.h"
>  #include "xe_lrc.h"
> @@ -14,8 +15,6 @@
>  #include "xe_sched_job.h"
>  #include "xe_vm_types.h"
>  
> -#include "i915_reg.h"
> -
>  static u32 preparser_disable(bool state)
>  {
>  	return MI_ARB_CHECK | BIT(8) | state;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 1c3783becefd..19828e003283 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -11,8 +11,7 @@
>  #include <drm/ttm/ttm_placement.h>
>  #include <drm/ttm/ttm_range_manager.h>
>  
> -#include "../i915/i915_reg.h"
> -
> +#include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 155cfd1dcc50..df72b15dfeb0 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -9,6 +9,7 @@
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_device_types.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> @@ -18,8 +19,6 @@
>  #include "xe_rtp.h"
>  #include "xe_step.h"
>  
> -#include "i915_reg.h"
> -
>  /**
>   * DOC: Hardware workarounds
>   *
> -- 
> 2.39.0
> 
