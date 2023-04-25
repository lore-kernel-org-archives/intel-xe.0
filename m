Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9E6C7618E
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 00:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD8D10E3C3;
	Tue, 25 Apr 2023 00:23:06 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97D810E3C3
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 00:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682382184; x=1713918184;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DOHqGlP4LB9a6MtyTuI4VSCk3jKdl7L6UXMC+fNUEEI=;
 b=d1u8+2CyRry9X4YbVa3eEE9j7pi3FhcC18nkW7PEjCPWUmnzTahmEiql
 sgNnLXXHsjNpHadbQQDQi9jADWrxUccKl+3ZRKCoP58tfTu4eIQfWwnzF
 6hC3FmEFB7mu3ceewmC9+j8y7+wVH7Pt/NNajME01kIGtmnJ3IN7089Tp
 KBJKhlekNO5WmF27OJfvt1LJsI24VksdSCaph4pEaV+l3X5Xt3vvp123V
 2sh63eCU9rfe6ubiFHioy0Iw5Kc6GNbEUcnmM/Y/uBvmq+7qkp7dacFJT
 aR/ss7XZVMorwRgRXHSYq6vDcTpAD7WmoM5oXj+gUJ577+9fvTc/jJyX7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="346620755"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="346620755"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 17:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="757907153"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="757907153"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 24 Apr 2023 17:23:03 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 17:23:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 17:23:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 17:23:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5a4gf4iIiVRAzC/hYVDgh3yDCWPD9APwMeeV5joSh5sK9++25Zj8MZ2PKPhheCrn0h0SVlFUYYVB71uNKELxu6MX+yr6QWRnZVOActK8i4hdL4SBDymf++064BRDnLUkmPPyLpjjQoOLVQ8PtAyh+em/kqjz+KRyCFp5qrSLh+H5iG8yhrDEa+WH3IUK609YafKHouHowDGIEUmzHb/nVHWhoozFZBudyuLqUla2wdRDNW0WGwQRRSq28LQ03qL1UpowLVpXXnPSs8pWlld7w76z1SxHeHEYFwdSiORy0ejG/2VHTPf6fyeJkyeycfgC1y5GCcX4NI6BqobGX3RtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKHiYLOCM0FARNBv93KodtkAo4LcG1Jhky+gLqKqv4M=;
 b=G/BsnkzoJQhSHBCV1jHUseWXuYPjmtTFpLkRndi+dhQw1jwH9Kga0ZcFBkoytvUgHMkj5+mwLU6NxUW/Nn/iI6alIg/lIC+Cvs5HJDcPd47d+kNcsOyHfTDhhDZr+aRPND31gn91DRWd6uXMzTupjU9SABD0gFbWckDrhqNK4AHNV+dFbvrxL51dCuAXbYAojbA3kKfXmJQonEbuHWEaNGzYk86uov5Ctb95v9qUCEFQDES862h/h7X2MisLpWwbMKBqAT2qCc7Jn7Z3PaIsM7QCJkHvMvhlf7DoI+eaUQU3MkQk9J8Dg+j+3QZvTHzixQoHAXjpS6gvBJRBpwuF5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB6736.namprd11.prod.outlook.com (2603:10b6:806:25f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Tue, 25 Apr
 2023 00:23:01 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 00:23:00 +0000
Date: Mon, 24 Apr 2023 17:22:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <20230425002256.GK10045@mdroper-desk1.amr.corp.intel.com>
References: <20230406092631.2820028-1-himal.prasad.ghimiray@intel.com>
 <20230406092631.2820028-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230406092631.2820028-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 32afea63-22cb-4711-1ac9-08db452339af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oITYfxj/CyQzbcsk7ckygtP5FfJbdT2A4GqobC2oNWTBCCi6aUAOQdpMuQ3VY7ibnm+qDX4uPAKmWh3pr1oET1KhC5oTMX6oQFqk7qAry4c1wGfeLUzw1mAQ1dbEydGlQyjtu4gqJGarM5nRA+EQyeHDZ4CzHtTycwOIrA2bxCrmuxwmACe/EJYhhrTsjIcOmUy5SKGYb1Z37LtRGrkVtBxEPbxhHjuW1Ah31e44lv/H37Xw9UQSvvsiyRwOVqMlPlOSzVn9i2wPo9EnrphDyLfJ07vYdaingRrmr0BrvM+b14ip3DgR/epnXqtSJm7uRvHn4mNPMr6ubq2Rhgb72AEodyAGj79DWZrsAo6Jd6Zk0KpZfj9KyITTceqHY0sfEqmrXWz1lob7jJ+FJe1riUa+1si5p6UOBF1qy5y2DeauuGc3+fZecQWKPzvlkPaJP3RxAcHJmQWa+w73tt4PKltsQuXxnJzmm46UGN3PhJMTYpyAtDlqRZ1zgRHVrA+ZbxgyM8M5oJfb93VNbag+1tEekYjj0zmXy4AqWcRO3/I+Ssu6gSerwmsqXHFivLzm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199021)(38100700002)(82960400001)(6506007)(6512007)(26005)(1076003)(186003)(8936002)(83380400001)(33656002)(2906002)(6862004)(8676002)(5660300002)(30864003)(478600001)(6486002)(316002)(6666004)(4326008)(6636002)(66556008)(41300700001)(66946007)(86362001)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ONOT1XTMfYqIfd7qCg3cN05VSa3E8PoCrJnRY2V8Of33EqH6QK/OxAGlZdnn?=
 =?us-ascii?Q?nwSDzTyFqlm4EG5N62upEuOhodmTEhEEJdVjEN2xVYOBvbmofXMwN/RgxeT5?=
 =?us-ascii?Q?mfs6gbyJiE0kKF9Lu5GDNX18PaqDK7f+dwGRChGn7DxjQj7L5NTXzysKiWgU?=
 =?us-ascii?Q?la689qkZxmFECDoSKEx44eKydAE5zBJtBOxWKDnIxY4D1s3bKlnhtfTOqVAy?=
 =?us-ascii?Q?AXUfHGnFEniiO3MfQQ+0H19DRI2X3Sw9qOkxZ3OPtF82aajvggk+oGx2pVfd?=
 =?us-ascii?Q?ovhuRUbC1vj07/uW7ATOwO4Z0ed0EODvFtp7mCCKaCsOkumjaywSMo7oa9dQ?=
 =?us-ascii?Q?kK2bY8ZMTR5Z4J4m5b0fWCv1Xyk9AdavgEIpfCgfILG2DjbSKnXNNidgoqVx?=
 =?us-ascii?Q?dbVkKfR/6ZJw8Rjcipur2iOti5b5/3jl3oZJDQt2izYqxy9/xoFaeks1m9z/?=
 =?us-ascii?Q?dDxOO1xDniycRbA776VtgeeC5rvYBMGUcHHPJWRJn5nKqlyMAnmp/7Q3avrL?=
 =?us-ascii?Q?PqcL6+1BmtD028dRkDm+4SXGAOyVDyWgCT43HoRytvV1AS9+p1/FFvpFrRpx?=
 =?us-ascii?Q?Ux0WZOfIXL7If6WqNp55kx1JlbNPF98YGzmd1PAmT37fg9je0ZSTByOolzHY?=
 =?us-ascii?Q?PoLpuJRTl19L8FWuQ4llu3z+hQ5yAdojWN7KGqlFHey2QVsi3cmGO+g/kBny?=
 =?us-ascii?Q?krWwqb2QrtkZdvo7RXaqNahKLM7mlbvfmCuUZW3DhVdRlb42LSe/hyB7UnyI?=
 =?us-ascii?Q?KEmDftq6cvjNmfYqpOS4vhsf8fJb79qeqzypbL4N0wyx8UhfL2QYq6X4cpQd?=
 =?us-ascii?Q?uF9GzaJqhx8qrvQh14GdsI6H7qx1a2YeaPxpycyUIFjpNQIp2+Yk4neKblSr?=
 =?us-ascii?Q?OmGQ4BzkPV5nsA1PHNrZuDuucSlUnZFcWVDbAQYVP9s6GnEYs97pxrtAVOIz?=
 =?us-ascii?Q?IY4zGMVKRO5bxp1NjvgdlyRu3uRxHLCh4Pf+lbh4v8ScWh7b5j8niqcDuJSg?=
 =?us-ascii?Q?o25Hhd407dIrEA/TRiukN82s1Lz3yehVQbKlNjOb/bDvcMG2fNqVFjYf/YDc?=
 =?us-ascii?Q?Us+n5/kRSQj16uh+9wN3wss38VQkPZ+n9FBqcq+8duXVODRn5rcZAfXBxbzb?=
 =?us-ascii?Q?QbGYT+BJk6wXOGOOHzloa0J5iU4UGifs72wqhxxaNz7VA6hX8hm76c1jsxtN?=
 =?us-ascii?Q?pds51fhd4HMFNhUdskcoj9ZGu3edRWOY8B6/mPGaBsNxbrNsJ239a8ww+KvR?=
 =?us-ascii?Q?KRHBrx3sBRA+w/2+EEp65KPxoK8oVsOj/AqhBqYdc8AThdK2W37R12JkY2T8?=
 =?us-ascii?Q?OSDdtKS6sbA9CgUCh75PjnihNuXzApkIyA+hyZDaddJCJwrnYRPKTI7gkgfG?=
 =?us-ascii?Q?Ta4+Ybl32wWwVjJbRmqIOgHKRTOj/6h9fVdKADTD1wXZAA3WfEfyk2oiwUU9?=
 =?us-ascii?Q?eMCDKOh7Of7QR9N/lsuoAG3nb80LfXxz65w6TY6VKY/p22LuXJJcOX55O7L0?=
 =?us-ascii?Q?djRmi5fo1G1QOpFM/XO/XJqSXuhKgwpEPnNQob8Ipc0El6hcwc0hgN+Fn/ja?=
 =?us-ascii?Q?5AY6pujznG6rH0gZdY7T6HftUgqWcVa471PaGIUFpfhmgERZzEY5pJ6jzct9?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32afea63-22cb-4711-1ac9-08db452339af
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 00:23:00.3132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUEtVajLQjYcgev3jObaT7x7G/IHAMEOwzkpar2nqvxvp1R0Qf9scdmbrodKHVLVmgxKBYoOYekJ2TngHZh1pjrrY3In+6bXYeL/LtgW30w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6736
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe/ras: Log the GT hw errors.
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

On Thu, Apr 06, 2023 at 02:56:29PM +0530, Himal Prasad Ghimiray wrote:
> From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> 
> Count the CORRECTABLE and FATAL GT hardware errors as
> signaled by relevant interrupt and respective registers.
> 
> For non relevant interrupts count them as driver interrupt error.
> 
> For platform supporting error vector registers count and report
> the respective vector errors.
> 
> Co-authored-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h    |  77 ++++++-
>  drivers/gpu/drm/xe/xe_device_types.h |   2 +
>  drivers/gpu/drm/xe/xe_gt.c           |  29 +++
>  drivers/gpu/drm/xe/xe_gt_types.h     |  43 ++++
>  drivers/gpu/drm/xe/xe_irq.c          | 332 ++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_pci.c          |   3 +
>  6 files changed, 453 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index dff74b093d4e..b3d35d0c5a77 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -122,14 +122,50 @@ enum hardware_error {
>  	HARDWARE_ERROR_MAX,
>  };
>  
> +#define DEV_PCIEERR_STATUS              _MMIO(0x100180)
> +#define DEV_PCIEERR_IS_FATAL(x)         (REG_BIT(2) << (x * 4))

Just move the math inside the REG_BIT parameter.  I.e.

        #define DEV_PCIEERR_IS_FATAL(x)   REG_BIT(x * 4 + 2)

>  #define _DEV_ERR_STAT_FATAL             0x100174
>  #define _DEV_ERR_STAT_NONFATAL          0x100178
>  #define _DEV_ERR_STAT_CORRECTABLE       0x10017c
>  #define DEV_ERR_STAT_REG(x)             _MMIO(_PICK_EVEN((x), \
>  						_DEV_ERR_STAT_CORRECTABLE, \
>  						_DEV_ERR_STAT_NONFATAL))
> +
>  #define  DEV_ERR_STAT_GT_ERROR          REG_BIT(0)
>  
> +enum gt_vctr_registers {
> +	ERR_STAT_GT_VCTR0 = 0,
> +	ERR_STAT_GT_VCTR1,
> +	ERR_STAT_GT_VCTR2,
> +	ERR_STAT_GT_VCTR3,
> +	ERR_STAT_GT_VCTR4,
> +	ERR_STAT_GT_VCTR5,
> +	ERR_STAT_GT_VCTR6,
> +	ERR_STAT_GT_VCTR7,
> +};
> +
> +#define ERR_STAT_GT_COR_VCTR_LEN        (4)
> +#define _ERR_STAT_GT_COR_VCTR_0         0x1002a0
> +#define _ERR_STAT_GT_COR_VCTR_1         0x1002a4
> +#define _ERR_STAT_GT_COR_VCTR_2         0x1002a8
> +#define _ERR_STAT_GT_COR_VCTR_3         0x1002ac
> +#define ERR_STAT_GT_COR_VCTR_REG(x)     _MMIO(_PICK_EVEN((x), \
> +						_ERR_STAT_GT_COR_VCTR_0, \
> +						_ERR_STAT_GT_COR_VCTR_1))
> +
> +#define ERR_STAT_GT_FATAL_VCTR_LEN      (8)
> +#define _ERR_STAT_GT_FATAL_VCTR_0       0x100260
> +#define _ERR_STAT_GT_FATAL_VCTR_1       0x100264
> +#define _ERR_STAT_GT_FATAL_VCTR_2       0x100268
> +#define _ERR_STAT_GT_FATAL_VCTR_3       0x10026c
> +#define _ERR_STAT_GT_FATAL_VCTR_4       0x100270
> +#define _ERR_STAT_GT_FATAL_VCTR_5       0x100274
> +#define _ERR_STAT_GT_FATAL_VCTR_6       0x100278
> +#define _ERR_STAT_GT_FATAL_VCTR_7       0x10027c
> +#define ERR_STAT_GT_FATAL_VCTR_REG(x)   _MMIO(_PICK_EVEN((x), \
> +					_ERR_STAT_GT_FATAL_VCTR_0, \
> +					_ERR_STAT_GT_FATAL_VCTR_1))
> +
>  #define _ERR_STAT_GT_COR                0x100160
>  #define _ERR_STAT_GT_NONFATAL           0x100164
>  #define _ERR_STAT_GT_FATAL              0x100168
> @@ -137,7 +173,42 @@ enum hardware_error {
>  						_ERR_STAT_GT_COR, \
>  						_ERR_STAT_GT_NONFATAL))
>  
> -#define  EU_GRF_ERROR                   REG_BIT(15)
> -#define  EU_IC_ERROR                    REG_BIT(14)
> -
> +#define  EU_GRF_COR_ERR                 (15)
> +#define  EU_IC_COR_ERR                  (14)
> +#define  SLM_COR_ERR                    (13)
> +#define  SAMPLER_COR_ERR                (12)
> +#define  GUC_COR_ERR                    (1)
> +#define  L3_SNG_COR_ERR                 (0)
> +
> +#define PVC_COR_ERR_MASK \
> +		(REG_BIT(GUC_COR_ERR) | \
> +		 REG_BIT(SLM_COR_ERR) | \
> +		 REG_BIT(EU_IC_COR_ERR) | \
> +		 REG_BIT(EU_GRF_COR_ERR))
> +
> +#define EU_GRF_FAT_ERR                  (15)
> +#define EU_IC_FAT_ERR                   (14)
> +#define SLM_FAT_ERR                     (13)
> +#define SAMPLER_FAT_ERR                 (12)
> +#define SQIDI_FAT_ERR                   (9)
> +#define IDI_PAR_FAT_ERR                 (8)
> +#define GUC_FAT_ERR                     (6)
> +#define L3_ECC_CHK_FAT_ERR              (5)
> +#define L3_DOUBLE_FAT_ERR               (4)
> +#define FPU_UNCORR_FAT_ERR              (3)
> +#define ARRAY_BIST_FAT_ERR              (1)
> +
> +#define PVC_FAT_ERR_MASK \
> +		(REG_BIT(FPU_UNCORR_FAT_ERR) | \
> +		 REG_BIT(GUC_FAT_ERR)  | \
> +		 REG_BIT(SLM_FAT_ERR)  | \
> +		 REG_BIT(EU_GRF_FAT_ERR))
> +
> +#define GT_HW_ERROR_MAX_ERR_BITS        16
> +
> +#define _SLM_ECC_ERROR_CNT              0xe7f4
> +#define _SLM_UNCORR_ECC_ERROR_CNT       0xe7c0
> +#define SLM_ECC_ERROR_CNTR(x)           _MMIO((x) == HARDWARE_ERROR_CORRECTABLE ? \
> +						_SLM_ECC_ERROR_CNT : \
> +						_SLM_UNCORR_ECC_ERROR_CNT)
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 88f863edc41c..ecabf4d6690d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -99,6 +99,8 @@ struct xe_device {
>  		bool has_link_copy_engine;
>  		/** @enable_display: display enabled */
>  		bool enable_display;
> +		/** @has_gt_error_vectors: whether platform supports ERROR VECTORS */
> +		bool has_gt_error_vectors;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  		struct xe_device_display_info {
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index bc821f431c45..ce9ce2748394 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -44,6 +44,35 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> +static const char * const xe_gt_driver_errors_to_str[] = {
> +	[INTEL_GT_DRIVER_ERROR_INTERRUPT] = "INTERRUPT",
> +};
> +
> +void xe_gt_log_driver_error(struct xe_gt *gt,

It looks like the things this function gets used for fall into one of
two categories:

 - Software assertions that we don't expect to happen unless we screwed
   up and missed something in the code.
 - Hardware is doing something out of spec (e.g., raising interrupt bits
   that aren't documented).

For the first one, I don't see a reason to be counting up such errors;
they're just there for early developers and such mistakes should not be
present in the driver anymore by the time it gets into real users'
hands.  For the latter, classifying these as "driver errors" is
incorrect since it's the hardware misbehaving, not the driver.

All of this new infrastructure seems pretty questionable at the moment.
We're doing extra work to count up errors, but then never doing anything
with the counts.  You mention in the cover letter that these will be
exposed to userspace eventually, but what's the benefit of that?  Which
userspace component is going to actually use this information?  What do
you expect userspace to do if it finds out there's been a fatal or
correctable error in some low-level hardware unit?  Generally userspace
shouldn't even need to care about the really low-level hardware details;
if something has truly gone fatally wrong, it's game over for userspace
and it probably doesn't matter exactly where in the hardware things are
actually busted.

Without some extra justification from the userspace point of view, it
feels like we're just adding a bunch of code that doesn't have a
real-world purpose.

> +			    const enum xe_gt_driver_errors error,
> +			    const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_driver_errors_to_str) !=
> +		     INTEL_GT_DRIVER_ERROR_COUNT);
> +
> +	WARN_ON_ONCE(error >= INTEL_GT_DRIVER_ERROR_COUNT);
> +
> +	gt->errors.driver[error]++;
> +
> +	drm_err_ratelimited(&gt_to_xe(gt)->drm, "GT%u [%s] %pV",
> +			    gt->info.id,
> +			    xe_gt_driver_errors_to_str[error],
> +			    &vaf);
> +	va_end(args);
> +}
> +
>  struct xe_gt *xe_find_full_gt(struct xe_gt *gt)
>  {
>  	struct xe_gt *search;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 8f29aba455e0..9580a40c0142 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -33,6 +33,43 @@ enum xe_gt_type {
>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
>  
> +/* Count of GT Correctable and FATAL HW ERRORS */
> +enum intel_gt_hw_errors {
> +	INTEL_GT_HW_ERROR_COR_SUBSLICE = 0,
> +	INTEL_GT_HW_ERROR_COR_L3BANK,
> +	INTEL_GT_HW_ERROR_COR_L3_SNG,
> +	INTEL_GT_HW_ERROR_COR_GUC,
> +	INTEL_GT_HW_ERROR_COR_SAMPLER,
> +	INTEL_GT_HW_ERROR_COR_SLM,
> +	INTEL_GT_HW_ERROR_COR_EU_IC,
> +	INTEL_GT_HW_ERROR_COR_EU_GRF,
> +	INTEL_GT_HW_ERROR_FAT_SUBSLICE,
> +	INTEL_GT_HW_ERROR_FAT_L3BANK,
> +	INTEL_GT_HW_ERROR_FAT_ARR_BIST,
> +	INTEL_GT_HW_ERROR_FAT_FPU,
> +	INTEL_GT_HW_ERROR_FAT_L3_DOUB,
> +	INTEL_GT_HW_ERROR_FAT_L3_ECC_CHK,
> +	INTEL_GT_HW_ERROR_FAT_GUC,
> +	INTEL_GT_HW_ERROR_FAT_IDI_PAR,
> +	INTEL_GT_HW_ERROR_FAT_SQIDI,
> +	INTEL_GT_HW_ERROR_FAT_SAMPLER,
> +	INTEL_GT_HW_ERROR_FAT_SLM,
> +	INTEL_GT_HW_ERROR_FAT_EU_IC,
> +	INTEL_GT_HW_ERROR_FAT_EU_GRF,
> +	INTEL_GT_HW_ERROR_FAT_TLB,
> +	INTEL_GT_HW_ERROR_FAT_L3_FABRIC,
> +	INTEL_GT_HW_ERROR_COUNT
> +};
> +
> +enum xe_gt_driver_errors {
> +	INTEL_GT_DRIVER_ERROR_INTERRUPT = 0,
> +	INTEL_GT_DRIVER_ERROR_COUNT
> +};
> +
> +void xe_gt_log_driver_error(struct xe_gt *gt,
> +			    const enum xe_gt_driver_errors error,
> +			    const char *fmt, ...);
> +
>  struct xe_mmio_range {
>  	u32 start;
>  	u32 end;
> @@ -357,6 +394,12 @@ struct xe_gt {
>  	 *    of a steered operation
>  	 */
>  	spinlock_t mcr_lock;
> +
> +	struct intel_hw_errors {
> +		unsigned long hw[INTEL_GT_HW_ERROR_COUNT];
> +		unsigned long driver[INTEL_GT_DRIVER_ERROR_COUNT];
> +	} errors;
> +
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 6b922332bff1..4626f7280aaf 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -19,6 +19,7 @@
>  #include "xe_hw_engine.h"
>  #include "xe_mmio.h"
>  
> +#define HAS_GT_ERROR_VECTORS(xe) ((xe)->info.has_gt_error_vectors)
>  static void gen3_assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
>  {
>  	u32 val = xe_mmio_read32(gt, reg.reg);
> @@ -359,44 +360,281 @@ hardware_error_type_to_str(const enum hardware_error hw_err)
>  	}
>  }
>  
> +#define xe_gt_hw_err(gt, fmt, ...) \
> +	drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "GT%d detected " fmt, \
> +			(gt)->info.id, ##__VA_ARGS__)

As on the previous patch, it looks like we're printing error-level
kernel messages for correctable errors (i.e., things the hardware caught
and fixed internally like ECC).  Generally those kind of things
shouldn't be putting errors in the kernel log because there's no actual
problem from the end user perspective.

> +
>  static void
> -xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
> +xe_gt_correctable_hw_error_stats_update(struct xe_gt  *gt, unsigned long errstat)
>  {
> -	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> -	u32 other_errors = ~(EU_GRF_ERROR | EU_IC_ERROR);
> -	u32 errstat;
> +	u32 errbit, cnt;
>  
> -	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
> +	if (!errstat && HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
> +		return;
>  
> -	errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
> +	for_each_set_bit(errbit, &errstat, GT_HW_ERROR_MAX_ERR_BITS) {
> +		if (gt->xe->info.platform == XE_PVC && !(REG_BIT(errbit) & PVC_COR_ERR_MASK)) {
> +			xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
> +					       "UNKNOWN CORRECTABLE error\n");
> +			continue;
> +		}
>  
> -	if (unlikely(!errstat)) {
> -		DRM_ERROR("ERR_STAT_GT_REG_%s blank!\n", hw_err_str);
> -		return;
> +	switch (errbit) {
> +	case L3_SNG_COR_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_L3_SNG]++;
> +		xe_gt_hw_err(gt, "L3 SINGLE CORRECTABLE error\n");
> +		break;
> +	case GUC_COR_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_GUC]++;
> +		xe_gt_hw_err(gt, "SINGLE BIT GUC SRAM CORRECTABLE error\n");
> +		break;
> +	case SAMPLER_COR_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_SAMPLER]++;
> +		xe_gt_hw_err(gt, "SINGLE BIT SAMPLER CORRECTABLE error\n");
> +		break;
> +	case SLM_COR_ERR:
> +		cnt = xe_mmio_read32(gt, SLM_ECC_ERROR_CNTR(HARDWARE_ERROR_CORRECTABLE).reg);
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_SLM] = cnt;
> +		xe_gt_hw_err(gt, "%u SINGLE BIT SLM CORRECTABLE error\n", cnt);
> +		break;
> +	case EU_IC_COR_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_EU_IC]++;
> +		xe_gt_hw_err(gt, "SINGLE BIT EU IC CORRECTABLE error\n");
> +		break;
> +	case EU_GRF_COR_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_EU_GRF]++;
> +		xe_gt_hw_err(gt, "SINGLE BIT EU GRF CORRECTABLE error\n");
> +		break;
> +	default:
> +		xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT, "UNKNOWN CORRECTABLE error\n");
> +		break;
> +	}
>  	}
> +}
>  
> -	/*
> -	 * TODO: The GT Non Fatal Error Status Register
> -	 * only has reserved bitfields defined.
> -	 * Remove once there is something to service.
> -	 */
> -	if (hw_err == HARDWARE_ERROR_NONFATAL) {
> -		DRM_ERROR("detected Non-Fatal error\n");
> -		xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
> +static void xe_gt_fatal_hw_error_stats_update(struct xe_gt *gt, unsigned long errstat)
> +{
> +	u32 errbit, cnt;
> +
> +	if (!errstat && HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
>  		return;
> +
> +	for_each_set_bit(errbit, &errstat, GT_HW_ERROR_MAX_ERR_BITS) {
> +		if (gt->xe->info.platform == XE_PVC && !(REG_BIT(errbit) & PVC_FAT_ERR_MASK)) {
> +			xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
> +					       "UNKNOWN FATAL error\n");
> +			continue;
> +		}
> +
> +	switch (errbit) {
> +	case ARRAY_BIST_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_ARR_BIST]++;
> +		xe_gt_hw_err(gt, "Array BIST FATAL error\n");
> +		break;
> +	case FPU_UNCORR_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_FPU]++;
> +		xe_gt_hw_err(gt, "FPU FATAL error\n");
> +		break;
> +	case L3_DOUBLE_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_DOUB]++;
> +		xe_gt_hw_err(gt, "L3 Double FATAL error\n");
> +		break;
> +	case L3_ECC_CHK_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_ECC_CHK]++;
> +		xe_gt_hw_err(gt, "L3 ECC Checker FATAL error\n");
> +		break;
> +	case GUC_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_GUC]++;
> +		xe_gt_hw_err(gt, "GUC SRAM FATAL error\n");
> +		break;
> +	case IDI_PAR_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_IDI_PAR]++;
> +		xe_gt_hw_err(gt, "IDI PARITY FATAL error\n");
> +		break;
> +	case SQIDI_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SQIDI]++;
> +		xe_gt_hw_err(gt, "SQIDI FATAL error\n");
> +		break;
> +	case SAMPLER_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SAMPLER]++;
> +		xe_gt_hw_err(gt, "SAMPLER FATAL error\n");
> +		break;
> +	case SLM_FAT_ERR:
> +		cnt = xe_mmio_read32(gt, SLM_ECC_ERROR_CNTR(HARDWARE_ERROR_FATAL).reg);
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SLM] = cnt;
> +		xe_gt_hw_err(gt, "%u SLM FATAL error\n", cnt);
> +		break;
> +	case EU_IC_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_EU_IC]++;
> +		xe_gt_hw_err(gt, "EU IC FATAL error\n");
> +		break;
> +	case EU_GRF_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_EU_GRF]++;
> +		xe_gt_hw_err(gt, "EU GRF FATAL error\n");
> +		break;
> +	default:
> +		xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
> +				       "UNKNOWN FATAL error\n");
> +		break;
> +	}
>  	}
> +}
>  
> -	/*
> -	 * TODO: The remaining GT errors don't have a
> -	 * need for targeted logging at the moment. We
> -	 * still want to log detection of these errors, but
> -	 * let's aggregate them until someone has a need for them.
> -	 */
> -	if (errstat & other_errors)
> -		DRM_ERROR("detected hardware error(s) in ERR_STAT_GT_REG_%s: 0x%08x\n",
> -			  hw_err_str, errstat & other_errors);
> +static void
> +xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
> +{
> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> +	unsigned long errstat;
> +
> +	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
>  
> -	xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
> +	if (!HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
> +		errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
> +		if (unlikely(!errstat)) {
> +			xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
> +					       "ERR_STAT_GT_REG_%s blank!\n", hw_err_str);
> +			return;
> +		}
> +	}
> +
> +	switch (hw_err) {
> +	case HARDWARE_ERROR_CORRECTABLE:
> +		if (HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
> +			bool error = false;
> +			int i;
> +
> +			errstat = 0;
> +			for (i = 0; i < ERR_STAT_GT_COR_VCTR_LEN; i++) {
> +				u32 err_type = ERR_STAT_GT_COR_VCTR_LEN;
> +				unsigned long vctr;
> +				const char *name;
> +
> +				vctr = xe_mmio_read32(gt, ERR_STAT_GT_COR_VCTR_REG(i).reg);
> +				if (!vctr)
> +					continue;
> +
> +				switch (i) {
> +				case ERR_STAT_GT_VCTR0:
> +				case ERR_STAT_GT_VCTR1:
> +					err_type = INTEL_GT_HW_ERROR_COR_SUBSLICE;
> +					gt->errors.hw[err_type] += hweight32(vctr);
> +					name = "SUBSLICE";
> +
> +					/* Avoid second read/write to error status register*/
> +					if (errstat)
> +						break;
> +
> +					errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
> +					xe_gt_hw_err(gt, "ERR_STAT_GT_CORRECTABLE:0x%08lx\n",
> +						     errstat);
> +					xe_gt_correctable_hw_error_stats_update(gt, errstat);
> +					if (errstat)
> +						xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg,
> +								errstat);
> +					break;
> +
> +				case ERR_STAT_GT_VCTR2:
> +				case ERR_STAT_GT_VCTR3:
> +					err_type = INTEL_GT_HW_ERROR_COR_L3BANK;
> +					gt->errors.hw[err_type] += hweight32(vctr);
> +					name = "L3 BANK";
> +					break;
> +				default:
> +					name = "UNKNOWN";
> +					break;
> +				}
> +				xe_mmio_write32(gt, ERR_STAT_GT_COR_VCTR_REG(i).reg, vctr);
> +				xe_gt_hw_err(gt, "%s CORRECTABLE error, ERR_VECT_GT_CORRECTABLE_%d:0x%08lx\n",
> +					     name, i, vctr);
> +				error = true;
> +			}
> +
> +			if (!error)
> +				xe_gt_hw_err(gt, "UNKNOWN CORRECTABLE error\n");
> +		} else {
> +			xe_gt_correctable_hw_error_stats_update(gt, errstat);
> +			xe_gt_hw_err(gt, "ERR_STAT_GT_CORRECTABLE:0x%08lx\n", errstat);
> +		}
> +		break;
> +	case HARDWARE_ERROR_NONFATAL:
> +	      /*
> +	       * TODO: The GT Non Fatal Error Status Register
> +	       * only has reserved bitfields defined.
> +	       * Remove once there is something to service.
> +	       */
> +		drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "detected Non-Fatal error\n");
> +		break;
> +	case HARDWARE_ERROR_FATAL:
> +		if (HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
> +			bool error = false;
> +			int i;
> +
> +			errstat = 0;
> +			for (i = 0; i < ERR_STAT_GT_FATAL_VCTR_LEN; i++) {
> +				u32 err_type = ERR_STAT_GT_FATAL_VCTR_LEN;
> +				unsigned long vctr;
> +				const char *name;
> +
> +				vctr = xe_mmio_read32(gt, ERR_STAT_GT_FATAL_VCTR_REG(i).reg);
> +				if (!vctr)
> +					continue;
> +
> +				/* i represents the vector register index */
> +				switch (i) {
> +				case ERR_STAT_GT_VCTR0:
> +				case ERR_STAT_GT_VCTR1:
> +					err_type = INTEL_GT_HW_ERROR_FAT_SUBSLICE;
> +					gt->errors.hw[err_type] += hweight32(vctr);
> +					name = "SUBSLICE";
> +
> +					/*Avoid second read/write to error status register.*/
> +					if (errstat)
> +						break;
> +
> +					errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
> +					xe_gt_hw_err(gt, "ERR_STAT_GT_FATAL:0x%08lx\n", errstat);
> +					xe_gt_fatal_hw_error_stats_update(gt, errstat);
> +					if (errstat)
> +						xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg,
> +								errstat);
> +					break;
> +
> +				case ERR_STAT_GT_VCTR2:
> +				case ERR_STAT_GT_VCTR3:
> +					err_type = INTEL_GT_HW_ERROR_FAT_L3BANK;
> +					gt->errors.hw[err_type] += hweight32(vctr);
> +					name = "L3 BANK";
> +					break;
> +				case ERR_STAT_GT_VCTR6:
> +					gt->errors.hw[INTEL_GT_HW_ERROR_FAT_TLB] += hweight16(vctr);
> +					name = "TLB";
> +					break;
> +				case ERR_STAT_GT_VCTR7:
> +					gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_FABRIC] += hweight8(vctr);
> +					name = "L3 FABRIC";
> +					break;
> +				default:
> +					name = "UNKNOWN";
> +					break;
> +				}
> +				xe_mmio_write32(gt, ERR_STAT_GT_FATAL_VCTR_REG(i).reg, vctr);
> +				xe_gt_hw_err(gt, "%s FATAL error, ERR_VECT_GT_FATAL_%d:0x%08lx\n",
> +					     name, i, vctr);
> +				error = true;
> +			}
> +			if (!error)
> +				xe_gt_hw_err(gt, "UNKNOWN FATAL error\n");
> +		} else {
> +			xe_gt_fatal_hw_error_stats_update(gt, errstat);
> +			xe_gt_hw_err(gt, "ERR_STAT_GT_FATAL:0x%08lx\n", errstat);
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (!HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
> +		xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
>  }
>  
>  static void
> @@ -409,7 +647,8 @@ xe_hw_error_source_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>  	spin_lock_irqsave(&gt_to_xe(gt)->irq.lock, flags);
>  	errsrc = xe_mmio_read32(gt, DEV_ERR_STAT_REG(hw_err).reg);
>  	if (unlikely(!errsrc)) {
> -		DRM_ERROR("DEV_ERR_STAT_REG_%s blank!\n", hw_err_str);
> +		xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
> +				       "DEV_ERR_STAT_REG_%s blank!\n", hw_err_str);
>  		goto out_unlock;
>  	}
>  
> @@ -417,8 +656,9 @@ xe_hw_error_source_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>  		xe_gt_hw_error_handler(gt, hw_err);
>  
>  	if (errsrc & ~DEV_ERR_STAT_GT_ERROR)
> -		DRM_ERROR("non-GT hardware error(s) in DEV_ERR_STAT_REG_%s: 0x%08x\n",
> -			  hw_err_str, errsrc & ~DEV_ERR_STAT_GT_ERROR);
> +		xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
> +				       "non-GT hardware error(s) in DEV_ERR_STAT_REG_%s: 0x%08x\n",
> +				       hw_err_str, errsrc & ~DEV_ERR_STAT_GT_ERROR);
>  
>  	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err).reg, errsrc);
>  
> @@ -634,12 +874,44 @@ static void irq_uninstall(struct drm_device *drm, void *arg)
>  		pci_disable_msi(pdev);
>  }
>  
> +/**
> + * process_hw_errors - checks for the occurrence of HW errors
> + *
> + * This checks for the HW Errors including FATAL error that might
> + * have occurred in the previous boot of the driver which will
> + * initiate PCIe FLR reset of the device and cause the
> + * driver to reload.

Is this saying that there's already been a PCIe FLR and you're trying to
read the registers after that reset has happened?  The bspec indicates
that these registers have 'DEV' style reset, so they wouldn't be able to
preserve their values across a reset.

> + */
> +static void process_hw_errors(struct xe_device *xe)
> +{
> +	struct xe_gt *gt0 = xe_device_get_gt(xe, 0);
> +	u32 dev_pcieerr_status, master_ctl;
> +	struct xe_gt *gt;
> +	int i;
> +
> +	dev_pcieerr_status = xe_mmio_read32(gt0, DEV_PCIEERR_STATUS.reg);
> +
> +	for_each_gt(gt, xe, i) {
> +		if (dev_pcieerr_status & DEV_PCIEERR_IS_FATAL(i))
> +			xe_hw_error_source_handler(gt, HARDWARE_ERROR_FATAL);
> +
> +		master_ctl = xe_mmio_read32(gt, GEN11_GFX_MSTR_IRQ.reg);
> +		xe_mmio_write32(gt, GEN11_GFX_MSTR_IRQ.reg, master_ctl);
> +		xe_hw_error_irq_handler(gt, master_ctl);
> +	}
> +	if (dev_pcieerr_status)
> +		xe_mmio_write32(gt, DEV_PCIEERR_STATUS.reg, dev_pcieerr_status);
> +}
> +
>  int xe_irq_install(struct xe_device *xe)
>  {
>  	int irq = to_pci_dev(xe->drm.dev)->irq;
>  	irq_handler_t irq_handler;
>  	int err;
>  
> +	if (IS_DGFX(xe))
> +		process_hw_errors(xe);

Why is this conditional on DGFX?  From what I can see this also applies
to integrated platforms like MTL too.


Matt

> +
>  	irq_handler = xe_irq_handler(xe);
>  	if (!irq_handler) {
>  		drm_err(&xe->drm, "No supported interrupt handler");
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1844cff8fba8..69098194cef8 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -73,6 +73,7 @@ struct xe_device_desc {
>  	bool has_range_tlb_invalidation;
>  	bool has_asid;
>  	bool has_link_copy_engine;
> +	bool has_gt_error_vectors;
>  };
>  
>  __diag_push();
> @@ -232,6 +233,7 @@ static const struct xe_device_desc pvc_desc = {
>  	.supports_usm = true,
>  	.has_asid = true,
>  	.has_link_copy_engine = true,
> +	.has_gt_error_vectors = true,
>  };
>  
>  #define MTL_MEDIA_ENGINES \
> @@ -418,6 +420,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	xe->info.vm_max_level = desc->vm_max_level;
>  	xe->info.supports_usm = desc->supports_usm;
>  	xe->info.has_asid = desc->has_asid;
> +	xe->info.has_gt_error_vectors = desc->has_gt_error_vectors;
>  	xe->info.has_flat_ccs = desc->has_flat_ccs;
>  	xe->info.has_4tile = desc->has_4tile;
>  	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
