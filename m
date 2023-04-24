Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44960C7618E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 20:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0432510E1F2;
	Mon, 24 Apr 2023 20:34:59 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475E210E603
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 20:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682368497; x=1713904497;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CtE1q9Jhim8+whfqkyE9tf83dLaDhIIj7WvLfptPURQ=;
 b=kKuJRnKgRQ2YT5j40VJD4460YqYtzc/onETRCKgbfB4sVYG78duBEELm
 KQ534LRyxzZ2CruvJrYn9+xLM3awqwnXCtDVlks6k79wtw96CWR0eEaV8
 qqaPVcZAX+nWgI6aJBo3epz53cea2c8+pbBRvVRhifwz2fKCd3XZ+fIm4
 jAEJbrHirZukbaxI4Btffdbq3m7dztksIqVe414/rXo5KQ7wpwFbhOrhg
 BpfW7GcE3MPv2G60BFQ+KSHIWbqVcsid/QqfhCqJ6x2PoxBZLZQQ8/TOb
 ZAq35GDbLTBA1SjBsCNrglwq5Qn7skEK6H1GJyYe2vY/FNMdDja+GUJ11 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="432827684"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="432827684"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 13:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="687023741"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="687023741"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 24 Apr 2023 13:34:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 13:34:55 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 13:34:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 13:34:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 13:34:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+m6Zoo3GmyVsuY0JDpwiM3GLoYu9bGSXWGkaCmJ3Mt7bFpofQSAgQRm/ULfvnBzKGv24DpTaRDFkB1USJVjcyijIBJPYN4cEPrsf3ouyk0CVpij1guBupBFAAGqnmNCMHpeqAHdcsXX2u42AnSEfjGCdbhwldV2OOYtVH9iRqyri51OlzsnB9Y6O2TQy7I+qj5QPz5y7jkGQ94oMtClVzcCsi5pkUjQ5/940UeN/jE8/nzz59S8Y8q023gg2NgcF5HbQpwrgEN4Z9DHmNey8w3w+no0oXGrnbqLAX2wPVngOPnHfZK1a7mZt71ytyy48UOxzqUh027ZUQE457yDxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKYAR1yGVCyxwwCL2VLZryJk+tN0+vn4B8yUmxPkCD4=;
 b=EJoiqYSNBLKLRByvdzPXyRmtkczrO3/P1LHSgR0s+kGov+zDkL/6Emfn3DpQUxX1CuV9asbe97gr8hNs2sG2BVIKkWz/C9DMx/rrPxTEoubwguwCGmKFTjZ3bhaVJUJL/c7vyj2KYdJTXh1lPT6+h/+Z9zUnWyMKJPCRFTWrYogF4I1EDvdtZqI1v3C6fHjj7Nr/tWlferfmX4KnibOmseHc20ik1fR2A670fC7ynu3S7IEXEWFkzJVZaTNw2oJ8/GJBnDcTBGom2vZjTou34FgNo0AD6XjVMxl4ApUjhKlIGmBtSyrpFuF/LRBlNJXmMsZVjiTNDCg/tm32CRrMlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.29; Mon, 24 Apr
 2023 20:34:52 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 20:34:52 +0000
Date: Mon, 24 Apr 2023 13:34:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230424203448.GC10045@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-15-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421223258.128781-15-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR07CA0091.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::32) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a51817-2473-4631-d098-08db45035af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nwvouZtc7PbxWopoaUxN2cxxDvNvVSm4mSpK6ck8FAuLoQJpAebOpk4wEIkIR2qe6vZfmfYbGn9+MArfqxOjBeKLq0fiWkuASLVG7idf4P9Ivd9e5tySsxbonWY59CTPWIJpq0haRMXragT9RjCpZt8ocWxyXiUtl9s10BNHsTfyGzyKAoK4iUkKLWdsXeJtEolRsHc33D5db+c+il9XY3Ev3gPqNnAnL9M0Xb9g8WmjW+ZD9uA4k0cKPR3xUL/vTub8d6SIjQQrzm3RijwRezNNwOqZQtBXCO4XJpsdTNsO2wvddWN+RJuD4tYiGhU2fC+CD3UgDZHACtTAdO9c344697FvJUd+v3+R86CNXJp6/ec5DgbNH1OdkOma1FbVX+AL/qwT8eNJbrsWrhdXWfHhxvVulV4G2WhmwaNnBMv6w03p3UNxDBIiLTSsWhi4u42vO9NS0OalcYlYx3pomVoXo4evvb7fvwsVgAuT5wbqZBjBZsiRN7VV1yg57kwdn9TDmA4knzd9tHXhJfols2hQ+3MvlTz8QB/v/dWiPYVHXZV/lB4+7+vYZ46uB+4J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199021)(54906003)(82960400001)(30864003)(478600001)(2906002)(6666004)(6486002)(86362001)(33656002)(6862004)(8676002)(8936002)(41300700001)(316002)(38100700002)(5660300002)(66946007)(66476007)(66556008)(4326008)(6636002)(66574015)(83380400001)(6512007)(26005)(1076003)(6506007)(186003)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I1E27463mhk6EZC8n95rpC1RRb6Czb9Hy4N2ua8BUKI8cftCipuWdt4OCKsa?=
 =?us-ascii?Q?KHjG6BSDBCNEI+mlbUt28Krfl3ZiG6mq0ZI0QWVAqEvU/7BhmhyC+AqQTfSo?=
 =?us-ascii?Q?nQukwqNz5PBtiPi1Pk0PWdp9lz+iyy7/AYN7r6e5ql1FJyjcczSiDz5mSq64?=
 =?us-ascii?Q?wihpsITXj/VALAgnD0bqQkIu+coMsLsV8dpolp11Y1OBHoK6Ycd9E4woRgUn?=
 =?us-ascii?Q?OdEyxAOuijOT29Ke5laGwQpHKhII8bEo/INpUqVv6E9rEa3/uj2/riqc0omI?=
 =?us-ascii?Q?9EaZ05mK5ZCBf+3hH97oSjYwyNlOrxlI6V9OumZhJAVKBltSSXRMaiD21x98?=
 =?us-ascii?Q?J6WhD5mhPJtnrUbvzl36iauUNThFbbROxm45GtspP62FWeTWKCNYAwJ+afkl?=
 =?us-ascii?Q?xoG1IRbujhhou95h5KII6yBubT8/tth/+n+CBLXVO7eeCE6szEQ0TSDEkXeE?=
 =?us-ascii?Q?3vRG/RVTlkYrJhydeg4JZaEE6/ANjVBgjQGMsvoshMLCF2zBBheAf8sk4zuO?=
 =?us-ascii?Q?3eCMT/nslPvts44UIQ1ewU/XLTiNAFvqRyAW/N8Er9gD5cM3AoCy5uog1QIp?=
 =?us-ascii?Q?OQdpNNLuOWXjzpnUAml5m0dk4U6HrHf6cwaJo3TdFjDkGAe+MJArGptUYrz1?=
 =?us-ascii?Q?CeRwKbJvClVJLjFyySe97k4n3mw6oJgCUE5CFepTiNHzfKWZcp1NfdqkgOE8?=
 =?us-ascii?Q?ILSCM6qnqGjLgN5oYSoD2Uw2f/rSNZH78/lfU+bLWvjEtdV4pF1CpWmXbRzs?=
 =?us-ascii?Q?wvZYJcwTPRkFiM8gD/IohmHcqiJRvaCm4kOvnp5srTnHtVmn/p9qi7bx/2Hr?=
 =?us-ascii?Q?z7Yas1+RJ/XKQ7kzIq4DspRPV+R1pja0L+H2jGCEqpySU4Xd+0J902aNdDGI?=
 =?us-ascii?Q?uHRjdY6X5jij8CLyH/27wi6HCS9Y3PicwiyBvI+n1LpvOtELecJva9gsjw3o?=
 =?us-ascii?Q?2p27MAe+MvmnzXNHrkjy/uga+Npm7Zcq8Za9ctkIMGlmjiWsFNCz5L3bTnwm?=
 =?us-ascii?Q?aY3NOqriUsAGhn6B+qP+Ft+R8CeHJrFzHKFQ8IZz4VEWHNriLV0w/kfSB92K?=
 =?us-ascii?Q?GSloQ9s8jwI/WPO9AbsFg7t/FtfOIVFP79JUOfjf/FGHOny3jnLedymG306L?=
 =?us-ascii?Q?/X4koqM8zCkRASb64bXo8QwPJNgIziUoa8LXih7RhZeZGIQn78EKdl4aQFPe?=
 =?us-ascii?Q?ha0FoNDSWm08IZxdFptH0R6IzdJfNQBL8i9qqLj8YYp0VmZjZ5UkvsbkFCls?=
 =?us-ascii?Q?zC9ZhjwVbvofDjk/bLwl7xBhgBuZcmYS70cGY2VhQ1qaj7+lx/QQ1YJsmRvF?=
 =?us-ascii?Q?rd5Z8VqPc9o+p7lAtT3dPsfQGmjBKqGlNiVwCfCyn/FMMLLnFgmRZImn+Z70?=
 =?us-ascii?Q?ynOqhACZyt7KjzvGBNjw1p2mRj/XYKZ1EVDgSfksIqC9QftkvUcCLprSYHrE?=
 =?us-ascii?Q?n4aJN7jCpDqs82AY6U9xsCKeqf7WKHgCgw8ewBMfSfuXZjqy4ZAW10hxDl8V?=
 =?us-ascii?Q?oEjwOmVdcskmPUP73+CRIa5GfwZPkziHqgZ3ij8OV42tQlaqdtdZS23isg+o?=
 =?us-ascii?Q?TQk2cIGTWVkjfqZHuiu1mLcS6ORsvw499YzPhD/d7Za+uIUd08ESw4oamWH2?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a51817-2473-4631-d098-08db45035af2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 20:34:51.8794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/yQgTEAEYjo+dLXb6A6Y53smCTdBCPjZnim9yZXRfvTOt9G/JQ9eg+MlTyL2gcy4lJ5zr1+FK7nAC1XYG4VlKmycKZG02N5oCwbA4QFIMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5782
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 14/17] drm/xe: Use XE_REG/XE_REG_MCR
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 03:32:55PM -0700, Lucas De Marchi wrote:
> These should replace the _MMIO() and MCR_REG() from i915, with the goal
> of being more extensible, allowing to pass the additional fields for
> struct xe_reg and struct xe_reg_mcr. Replace all uses of _MMIO() and
> MCR_REG() in xe.
> 
> Since the RTP, reg-save-restore and WA infra are not ready to use the
> new type, just undef the macro like was done for the i915 types
> previously. That conversion will come later.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  72 +++----
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 237 ++++++++++++-----------
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h    |  64 +++---
>  drivers/gpu/drm/xe/regs/xe_reg_defs.h    |   9 -
>  drivers/gpu/drm/xe/regs/xe_regs.h        |  28 +--
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c   |  20 +-
>  drivers/gpu/drm/xe/xe_ggtt.c             |   6 +-
>  drivers/gpu/drm/xe/xe_guc.c              |   6 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c           |  14 +-
>  drivers/gpu/drm/xe/xe_irq.c              |   6 +-
>  drivers/gpu/drm/xe/xe_mmio.c             |   2 +-
>  drivers/gpu/drm/xe/xe_mocs.c             |   4 +-
>  drivers/gpu/drm/xe/xe_pat.c              |   2 +-
>  drivers/gpu/drm/xe/xe_pcode_api.h        |   6 +-
>  drivers/gpu/drm/xe/xe_reg_sr.c           |   4 +-
>  drivers/gpu/drm/xe/xe_reg_whitelist.c    |  12 +-
>  drivers/gpu/drm/xe/xe_rtp.h              |  10 +-
>  drivers/gpu/drm/xe/xe_tuning.c           |   8 +-
>  drivers/gpu/drm/xe/xe_wa.c               |   8 +-
>  19 files changed, 256 insertions(+), 262 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 938055f75492..c13aac8f900c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -10,63 +10,63 @@
>  
>  #include "regs/xe_reg_defs.h"
>  
> -#define RING_TAIL(base)				_MMIO((base) + 0x30)
> +#define RING_TAIL(base)				XE_REG((base) + 0x30)
>  
> -#define RING_HEAD(base)				_MMIO((base) + 0x34)
> +#define RING_HEAD(base)				XE_REG((base) + 0x34)
>  #define   HEAD_ADDR				0x001FFFFC
>  
> -#define RING_START(base)			_MMIO((base) + 0x38)
> +#define RING_START(base)			XE_REG((base) + 0x38)
>  
> -#define RING_CTL(base)				_MMIO((base) + 0x3c)
> +#define RING_CTL(base)				XE_REG((base) + 0x3c)
>  #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>  #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>  
> -#define RING_PSMI_CTL(base)			_MMIO((base) + 0x50)
> +#define RING_PSMI_CTL(base)			XE_REG((base) + 0x50)
>  #define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
>  #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
>  
> -#define RING_ACTHD_UDW(base)			_MMIO((base) + 0x5c)
> -#define RING_DMA_FADD_UDW(base)			_MMIO((base) + 0x60)
> -#define RING_IPEIR(base)			_MMIO((base) + 0x64)
> -#define RING_IPEHR(base)			_MMIO((base) + 0x68)
> -#define RING_ACTHD(base)			_MMIO((base) + 0x74)
> -#define RING_DMA_FADD(base)			_MMIO((base) + 0x78)
> -#define RING_HWS_PGA(base)			_MMIO((base) + 0x80)
> -#define IPEIR(base)				_MMIO((base) + 0x88)
> -#define IPEHR(base)				_MMIO((base) + 0x8c)
> -#define RING_HWSTAM(base)			_MMIO((base) + 0x98)
> -#define RING_MI_MODE(base)			_MMIO((base) + 0x9c)
> -#define RING_NOPID(base)			_MMIO((base) + 0x94)
> -
> -#define RING_IMR(base)				_MMIO((base) + 0xa8)
> +#define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
> +#define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
> +#define RING_IPEIR(base)			XE_REG((base) + 0x64)
> +#define RING_IPEHR(base)			XE_REG((base) + 0x68)
> +#define RING_ACTHD(base)			XE_REG((base) + 0x74)
> +#define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
> +#define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> +#define IPEIR(base)				XE_REG((base) + 0x88)
> +#define IPEHR(base)				XE_REG((base) + 0x8c)
> +#define RING_HWSTAM(base)			XE_REG((base) + 0x98)
> +#define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
> +#define RING_NOPID(base)			XE_REG((base) + 0x94)
> +
> +#define RING_IMR(base)				XE_REG((base) + 0xa8)
>  #define   RING_MAX_NONPRIV_SLOTS  12
>  
> -#define RING_EIR(base)				_MMIO((base) + 0xb0)
> -#define RING_EMR(base)				_MMIO((base) + 0xb4)
> -#define RING_ESR(base)				_MMIO((base) + 0xb8)
> -#define RING_BBADDR(base)			_MMIO((base) + 0x140)
> -#define RING_BBADDR_UDW(base)			_MMIO((base) + 0x168)
> -#define RING_EXECLIST_STATUS_LO(base)		_MMIO((base) + 0x234)
> -#define RING_EXECLIST_STATUS_HI(base)		_MMIO((base) + 0x234 + 4)
> +#define RING_EIR(base)				XE_REG((base) + 0xb0)
> +#define RING_EMR(base)				XE_REG((base) + 0xb4)
> +#define RING_ESR(base)				XE_REG((base) + 0xb8)
> +#define RING_BBADDR(base)			XE_REG((base) + 0x140)
> +#define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
> +#define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
> +#define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>  
> -#define RING_CONTEXT_CONTROL(base)		_MMIO((base) + 0x244)
> +#define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244)
>  #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
>  #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
>  
> -#define RING_MODE(base)				_MMIO((base) + 0x29c)
> +#define RING_MODE(base)				XE_REG((base) + 0x29c)
>  #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>  
> -#define RING_TIMESTAMP(base)			_MMIO((base) + 0x358)
> +#define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
>  
> -#define RING_TIMESTAMP_UDW(base)		_MMIO((base) + 0x358 + 4)
> +#define RING_TIMESTAMP_UDW(base)		XE_REG((base) + 0x358 + 4)
>  #define   RING_VALID_MASK			0x00000001
>  #define   RING_VALID				0x00000001
>  #define   STOP_RING				REG_BIT(8)
>  #define   TAIL_ADDR				0x001FFFF8
>  
> -#define RING_CTX_TIMESTAMP(base)		_MMIO((base) + 0x3a8)
> +#define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
>  
> -#define RING_FORCE_TO_NONPRIV(base, i)		_MMIO(((base) + 0x4d0) + (i) * 4)
> +#define RING_FORCE_TO_NONPRIV(base, i)		XE_REG(((base) + 0x4d0) + (i) * 4)
>  #define   RING_FORCE_TO_NONPRIV_DENY		REG_BIT(30)
>  #define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	REG_GENMASK(29, 28)
>  #define   RING_FORCE_TO_NONPRIV_ACCESS_RW	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 0)
> @@ -84,15 +84,15 @@
>  						 RING_FORCE_TO_NONPRIV_DENY)
>  #define   RING_MAX_NONPRIV_SLOTS  12
>  
> -#define RING_EXECLIST_SQ_CONTENTS(base)		_MMIO((base) + 0x510)
> +#define RING_EXECLIST_SQ_CONTENTS(base)		XE_REG((base) + 0x510)
>  
> -#define RING_EXECLIST_CONTROL(base)		_MMIO((base) + 0x550)
> +#define RING_EXECLIST_CONTROL(base)		XE_REG((base) + 0x550)
>  #define	  EL_CTRL_LOAD				REG_BIT(0)
>  
> -#define VDBOX_CGCTL3F10(base)			_MMIO((base) + 0x3f10)
> +#define VDBOX_CGCTL3F10(base)			XE_REG((base) + 0x3f10)
>  #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
>  
> -#define VDBOX_CGCTL3F18(base)			_MMIO((base) + 0x3f18)
> +#define VDBOX_CGCTL3F18(base)			XE_REG((base) + 0x3f18)
>  #define   ALNUNIT_CLKGATE_DIS			REG_BIT(13)
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 4076d903b20e..64ab2255a406 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -9,7 +9,7 @@
>  #include "regs/xe_reg_defs.h"
>  
>  /* RPM unit config (Gen8+) */
> -#define RPM_CONFIG0					_MMIO(0xd00)
> +#define RPM_CONFIG0					XE_REG(0xd00)
>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK		REG_GENMASK(5, 4)
>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ		0
>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ	1
> @@ -17,25 +17,26 @@
>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ		3
>  #define   RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
>  
> -#define FORCEWAKE_ACK_MEDIA_VDBOX(n)		_MMIO(0xd50 + (n) * 4)
> -#define FORCEWAKE_ACK_MEDIA_VEBOX(n)		_MMIO(0xd70 + (n) * 4)
> -#define FORCEWAKE_ACK_RENDER			_MMIO(0xd84)
> +#define FORCEWAKE_ACK_MEDIA_VDBOX(n)		XE_REG(0xd50 + (n) * 4)
> +#define FORCEWAKE_ACK_MEDIA_VEBOX(n)		XE_REG(0xd70 + (n) * 4)
> +#define FORCEWAKE_ACK_RENDER			XE_REG(0xd84)
>  
> -#define GMD_ID					_MMIO(0xd8c)
> +#define GMD_ID					XE_REG(0xd8c)
>  #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
>  #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
>  #define   GMD_ID_STEP				REG_GENMASK(5, 0)
>  
> -#define FORCEWAKE_ACK_GT_MTL			_MMIO(0xdfc)
> +#define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
>  
> -#define LNCFCMOCS(i)				_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */
> +/* L3 Cache Control */
> +#define LNCFCMOCS(i)				XE_REG(0xb020 + (i) * 4)
>  #define LNCFCMOCS_REG_COUNT			32
>  
> -#define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
> -#define MTL_MCR_SELECTOR			_MMIO(0xfd4)
> -#define SF_MCR_SELECTOR				_MMIO(0xfd8)
> -#define MCR_SELECTOR				_MMIO(0xfdc)
> -#define GAM_MCR_SELECTOR			_MMIO(0xfe0)
> +#define MCFG_MCR_SELECTOR			XE_REG(0xfd0)
> +#define MTL_MCR_SELECTOR			XE_REG(0xfd4)
> +#define SF_MCR_SELECTOR				XE_REG(0xfd8)
> +#define MCR_SELECTOR				XE_REG(0xfdc)
> +#define GAM_MCR_SELECTOR			XE_REG(0xfe0)
>  #define   MCR_MULTICAST				REG_BIT(31)
>  #define   MCR_SLICE_MASK			REG_GENMASK(30, 27)
>  #define   MCR_SLICE(slice)			REG_FIELD_PREP(MCR_SLICE_MASK, slice)
> @@ -44,19 +45,19 @@
>  #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
>  #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
>  
> -#define FF_SLICE_CS_CHICKEN1			_MMIO(0x20e0)
> +#define FF_SLICE_CS_CHICKEN1			XE_REG(0x20e0)
>  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
>  
> -#define FF_SLICE_CS_CHICKEN2			_MMIO(0x20e4)
> +#define FF_SLICE_CS_CHICKEN2			XE_REG(0x20e4)
>  #define   PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
>  
> -#define CS_DEBUG_MODE1				_MMIO(0x20ec)
> +#define CS_DEBUG_MODE1				XE_REG(0x20ec)
>  #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
>  #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
>  
> -#define PS_INVOCATION_COUNT			_MMIO(0x2348)
> +#define PS_INVOCATION_COUNT			XE_REG(0x2348)
>  
> -#define CS_CHICKEN1				_MMIO(0x2580)
> +#define CS_CHICKEN1				XE_REG(0x2580)
>  #define   PREEMPT_GPGPU_LEVEL(hi, lo)		(((hi) << 2) | ((lo) << 1))
>  #define   PREEMPT_GPGPU_MID_THREAD_LEVEL	PREEMPT_GPGPU_LEVEL(0, 0)
>  #define   PREEMPT_GPGPU_THREAD_GROUP_LEVEL	PREEMPT_GPGPU_LEVEL(0, 1)
> @@ -64,70 +65,70 @@
>  #define   PREEMPT_GPGPU_LEVEL_MASK		PREEMPT_GPGPU_LEVEL(1, 1)
>  #define   PREEMPT_3D_OBJECT_LEVEL		REG_BIT(0)
>  
> -#define GLOBAL_MOCS(i)				_MMIO(0x4000 + (i) * 4) /* Global MOCS regs */
> -#define GFX_CCS_AUX_NV				_MMIO(0x4208)
> +#define GLOBAL_MOCS(i)				XE_REG(0x4000 + (i) * 4) /* Global MOCS regs */
> +#define GFX_CCS_AUX_NV				XE_REG(0x4208)
>  
> -#define VD0_AUX_NV				_MMIO(0x4218)
> -#define VE0_AUX_NV				_MMIO(0x4238)
> +#define VD0_AUX_NV				XE_REG(0x4218)
> +#define VE0_AUX_NV				XE_REG(0x4238)
>  
> -#define VE1_AUX_NV				_MMIO(0x42b8)
> +#define VE1_AUX_NV				XE_REG(0x42b8)
>  #define   AUX_INV				REG_BIT(0)
>  
> -#define XEHP_TILE0_ADDR_RANGE			MCR_REG(0x4900)
> -#define XEHP_FLAT_CCS_BASE_ADDR			MCR_REG(0x4910)
> +#define XEHP_TILE0_ADDR_RANGE			XE_REG_MCR(0x4900)
> +#define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
>  
> -#define CHICKEN_RASTER_1			MCR_REG(0x6204)
> +#define CHICKEN_RASTER_1			XE_REG_MCR(0x6204)
>  #define   DIS_SF_ROUND_NEAREST_EVEN		REG_BIT(8)
>  
> -#define CHICKEN_RASTER_2			MCR_REG(0x6208)
> +#define CHICKEN_RASTER_2			XE_REG_MCR(0x6208)
>  #define   TBIMR_FAST_CLIP			REG_BIT(5)
>  
> -#define VFLSKPD					MCR_REG(0x62a8)
> +#define VFLSKPD					XE_REG_MCR(0x62a8)
>  #define   DIS_OVER_FETCH_CACHE			REG_BIT(1)
>  #define   DIS_MULT_MISS_RD_SQUASH		REG_BIT(0)
>  
> -#define FF_MODE2				_MMIO(0x6604)
> -#define XEHP_FF_MODE2				MCR_REG(0x6604)
> +#define FF_MODE2				XE_REG(0x6604)
> +#define XEHP_FF_MODE2				XE_REG_MCR(0x6604)
>  #define   FF_MODE2_GS_TIMER_MASK		REG_GENMASK(31, 24)
>  #define   FF_MODE2_GS_TIMER_224			REG_FIELD_PREP(FF_MODE2_GS_TIMER_MASK, 224)
>  #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
>  #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
>  
> -#define CACHE_MODE_1				_MMIO(0x7004)
> +#define CACHE_MODE_1				XE_REG(0x7004)
>  #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>  
> -#define XEHP_PSS_MODE2				MCR_REG(0x703c)
> +#define XEHP_PSS_MODE2				XE_REG_MCR(0x703c)
>  #define   SCOREBOARD_STALL_FLUSH_CONTROL	REG_BIT(5)
>  
> -#define HIZ_CHICKEN					_MMIO(0x7018)
> +#define HIZ_CHICKEN					XE_REG(0x7018)
>  #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
>  #define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE		REG_BIT(13)
>  
> -#define COMMON_SLICE_CHICKEN1			_MMIO(0x7010)
> +#define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
>  
> -#define COMMON_SLICE_CHICKEN4			_MMIO(0x7300)
> +#define COMMON_SLICE_CHICKEN4			XE_REG(0x7300)
>  #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
>  
> -#define COMMON_SLICE_CHICKEN3				_MMIO(0x7304)
> -#define XEHP_COMMON_SLICE_CHICKEN3			MCR_REG(0x7304)
> +#define COMMON_SLICE_CHICKEN3				XE_REG(0x7304)
> +#define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304)
>  #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
>  #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
>  #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
>  #define   DISABLE_CPS_AWARE_COLOR_PIPE			REG_BIT(9)
>  
> -#define XEHP_SLICE_COMMON_ECO_CHICKEN1		MCR_REG(0x731c)
> +#define XEHP_SLICE_COMMON_ECO_CHICKEN1		XE_REG_MCR(0x731c)
>  #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
>  
> -#define VF_PREEMPTION				_MMIO(0x83a4)
> +#define VF_PREEMPTION				XE_REG(0x83a4)
>  #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
>  
> -#define VFG_PREEMPTION_CHICKEN			_MMIO(0x83b4)
> +#define VFG_PREEMPTION_CHICKEN			XE_REG(0x83b4)
>  #define   POLYGON_TRIFAN_LINELOOP_DISABLE	REG_BIT(4)
>  
> -#define XEHP_SQCM				MCR_REG(0x8724)
> +#define XEHP_SQCM				XE_REG_MCR(0x8724)
>  #define   EN_32B_ACCESS				REG_BIT(30)
>  
> -#define	MIRROR_FUSE3				_MMIO(0x9118)
> +#define	MIRROR_FUSE3				XE_REG(0x9118)
>  #define   L3BANK_PAIR_COUNT			4
>  #define   L3BANK_MASK				REG_GENMASK(3, 0)
>  /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
> @@ -135,31 +136,31 @@
>  #define   MEML3_EN_MASK				REG_GENMASK(3, 0)
>  
>  /* Fuse readout registers for GT */
> -#define XEHP_FUSE4				_MMIO(0x9114)
> +#define XEHP_FUSE4				XE_REG(0x9114)
>  #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
>  
> -#define GT_VEBOX_VDBOX_DISABLE			_MMIO(0x9140)
> +#define GT_VEBOX_VDBOX_DISABLE			XE_REG(0x9140)
>  #define   GT_VEBOX_DISABLE_MASK			REG_GENMASK(19, 16)
>  #define   GT_VDBOX_DISABLE_MASK			REG_GENMASK(7, 0)
>  
> -#define XELP_EU_ENABLE				_MMIO(0x9134)	/* "_DISABLE" on Xe_LP */
> +#define XELP_EU_ENABLE				XE_REG(0x9134)	/* "_DISABLE" on Xe_LP */
>  #define   XELP_EU_MASK				REG_GENMASK(7, 0)
> -#define XELP_GT_GEOMETRY_DSS_ENABLE		_MMIO(0x913c)
> -#define XEHP_GT_COMPUTE_DSS_ENABLE		_MMIO(0x9144)
> -#define XEHPC_GT_COMPUTE_DSS_ENABLE_EXT		_MMIO(0x9148)
> +#define XELP_GT_GEOMETRY_DSS_ENABLE		XE_REG(0x913c)
> +#define XEHP_GT_COMPUTE_DSS_ENABLE		XE_REG(0x9144)
> +#define XEHPC_GT_COMPUTE_DSS_ENABLE_EXT		XE_REG(0x9148)
>  
> -#define GDRST					_MMIO(0x941c)
> +#define GDRST					XE_REG(0x941c)
>  #define   GRDOM_GUC				REG_BIT(3)
>  #define   GRDOM_FULL				REG_BIT(0)
>  
> -#define MISCCPCTL				_MMIO(0x9424)
> +#define MISCCPCTL				XE_REG(0x9424)
>  #define   DOP_CLOCK_GATE_RENDER_ENABLE		REG_BIT(1)
>  #define   DOP_CLOCK_GATE_ENABLE			REG_BIT((0)
>  
> -#define UNSLCGCTL9430				_MMIO(0x9430)
> +#define UNSLCGCTL9430				XE_REG(0x9430)
>  #define   MSQDUNIT_CLKGATE_DIS			REG_BIT(3)
>  
> -#define UNSLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x9434)
> +#define UNSLICE_UNIT_LEVEL_CLKGATE		XE_REG(0x9434)
>  #define   VFUNIT_CLKGATE_DIS			REG_BIT(20)
>  #define   TSGUNIT_CLKGATE_DIS			REG_BIT(17) /* XEHPSDV */
>  #define   CG3DDISCFEG_CLKGATE_DIS		REG_BIT(17) /* DG2 */
> @@ -167,7 +168,7 @@
>  #define   HSUNIT_CLKGATE_DIS			REG_BIT(8)
>  #define   VSUNIT_CLKGATE_DIS			REG_BIT(3)
>  
> -#define UNSLCGCTL9440				_MMIO(0x9440)
> +#define UNSLCGCTL9440				XE_REG(0x9440)
>  #define   GAMTLBOACS_CLKGATE_DIS		REG_BIT(28)
>  #define   GAMTLBVDBOX5_CLKGATE_DIS		REG_BIT(27)
>  #define   GAMTLBVDBOX6_CLKGATE_DIS		REG_BIT(26)
> @@ -181,7 +182,7 @@
>  #define   GAMTLBBLT_CLKGATE_DIS			REG_BIT(14)
>  #define   GAMTLBVDBOX1_CLKGATE_DIS		REG_BIT(6)
>  
> -#define UNSLCGCTL9444				_MMIO(0x9444)
> +#define UNSLCGCTL9444				XE_REG(0x9444)
>  #define   GAMTLBGFXA0_CLKGATE_DIS		REG_BIT(30)
>  #define   GAMTLBGFXA1_CLKGATE_DIS		REG_BIT(29)
>  #define   GAMTLBCOMPA0_CLKGATE_DIS		REG_BIT(28)
> @@ -199,7 +200,7 @@
>  #define   GAMTLBVEBOX0_CLKGATE_DIS		REG_BIT(16)
>  #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
>  
> -#define XEHP_SLICE_UNIT_LEVEL_CLKGATE		MCR_REG(0x94d4)
> +#define XEHP_SLICE_UNIT_LEVEL_CLKGATE		XE_REG_MCR(0x94d4)
>  #define   SARBUNIT_CLKGATE_DIS			REG_BIT(5)
>  #define   RCCUNIT_CLKGATE_DIS			REG_BIT(7)
>  #define   MSCUNIT_CLKGATE_DIS			REG_BIT(10)
> @@ -207,88 +208,88 @@
>  #define   L3_CLKGATE_DIS			REG_BIT(16)
>  #define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
>  
> -#define UNSLICE_UNIT_LEVEL_CLKGATE2		_MMIO(0x94e4)
> +#define UNSLICE_UNIT_LEVEL_CLKGATE2		XE_REG(0x94e4)
>  #define   VSUNIT_CLKGATE_DIS_TGL		REG_BIT(19)
>  #define   PSDUNIT_CLKGATE_DIS			REG_BIT(5)
>  
> -#define SUBSLICE_UNIT_LEVEL_CLKGATE		MCR_REG(0x9524)
> +#define SUBSLICE_UNIT_LEVEL_CLKGATE		XE_REG_MCR(0x9524)
>  #define   DSS_ROUTER_CLKGATE_DIS		REG_BIT(28)
>  #define   GWUNIT_CLKGATE_DIS			REG_BIT(16)
>  
> -#define SUBSLICE_UNIT_LEVEL_CLKGATE2		MCR_REG(0x9528)
> +#define SUBSLICE_UNIT_LEVEL_CLKGATE2		XE_REG_MCR(0x9528)
>  #define   CPSSUNIT_CLKGATE_DIS			REG_BIT(9)
>  
> -#define SSMCGCTL9530				MCR_REG(0x9530)
> +#define SSMCGCTL9530				XE_REG_MCR(0x9530)
>  #define   RTFUNIT_CLKGATE_DIS			REG_BIT(18)
>  
> -#define DFR_RATIO_EN_AND_CHICKEN		MCR_REG(0x9550)
> +#define DFR_RATIO_EN_AND_CHICKEN		XE_REG_MCR(0x9550)
>  #define   DFR_DISABLE				REG_BIT(9)
>  
> -#define RPNSWREQ				_MMIO(0xa008)
> +#define RPNSWREQ				XE_REG(0xa008)
>  #define   REQ_RATIO_MASK			REG_GENMASK(31, 23)
> -#define RC_CONTROL				_MMIO(0xa090)
> -#define RC_STATE				_MMIO(0xa094)
> +#define RC_CONTROL				XE_REG(0xa090)
> +#define RC_STATE				XE_REG(0xa094)
>  
> -#define PMINTRMSK				_MMIO(0xa168)
> +#define PMINTRMSK				XE_REG(0xa168)
>  #define   PMINTR_DISABLE_REDIRECT_TO_GUC	REG_BIT(31)
>  #define   ARAT_EXPIRED_INTRMSK			REG_BIT(9)
>  
> -#define FORCEWAKE_GT				_MMIO(0xa188)
> +#define FORCEWAKE_GT				XE_REG(0xa188)
>  
> -#define PG_ENABLE				_MMIO(0xa210)
> +#define PG_ENABLE				XE_REG(0xa210)
>  
> -#define CTC_MODE				_MMIO(0xa26c)
> +#define CTC_MODE				XE_REG(0xa26c)
>  #define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
>  #define   CTC_SOURCE_PARAMETER_MASK		REG_BIT(0)
>  #define   CTC_SOURCE_CRYSTAL_CLOCK		0
>  #define   CTC_SOURCE_DIVIDE_LOGIC		1
>  
> -#define FORCEWAKE_RENDER			_MMIO(0xa278)
> -#define FORCEWAKE_MEDIA_VDBOX(n)		_MMIO(0xa540 + (n) * 4)
> -#define FORCEWAKE_MEDIA_VEBOX(n)		_MMIO(0xa560 + (n) * 4)
> +#define FORCEWAKE_RENDER			XE_REG(0xa278)
> +#define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
> +#define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>  
> -#define XEHPC_LNCFMISCCFGREG0			MCR_REG(0xb01c)
> +#define XEHPC_LNCFMISCCFGREG0			XE_REG_MCR(0xb01c)
>  #define   XEHPC_OVRLSCCC			REG_BIT(0)
>  
> -#define XEHP_L3NODEARBCFG			MCR_REG(0xb0b4)
> +#define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
>  #define   XEHP_LNESPARE				REG_BIT(19)
>  
> -#define XEHP_L3SQCREG5				MCR_REG(0xb158)
> +#define XEHP_L3SQCREG5				XE_REG_MCR(0xb158)
>  #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
>  
> -#define XEHP_L3SCQREG7				MCR_REG(0xb188)
> +#define XEHP_L3SCQREG7				XE_REG_MCR(0xb188)
>  #define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
>  
> -#define XEHP_MERT_MOD_CTRL			MCR_REG(0xcf28)
> -#define RENDER_MOD_CTRL				MCR_REG(0xcf2c)
> -#define COMP_MOD_CTRL				MCR_REG(0xcf30)
> -#define XEHP_VDBX_MOD_CTRL			MCR_REG(0xcf34)
> -#define XEHP_VEBX_MOD_CTRL			MCR_REG(0xcf38)
> +#define XEHP_MERT_MOD_CTRL			XE_REG_MCR(0xcf28)
> +#define RENDER_MOD_CTRL				XE_REG_MCR(0xcf2c)
> +#define COMP_MOD_CTRL				XE_REG_MCR(0xcf30)
> +#define XEHP_VDBX_MOD_CTRL			XE_REG_MCR(0xcf34)
> +#define XEHP_VEBX_MOD_CTRL			XE_REG_MCR(0xcf38)
>  #define   FORCE_MISS_FTLB			REG_BIT(3)
>  
> -#define XEHP_GAMSTLB_CTRL			MCR_REG(0xcf4c)
> +#define XEHP_GAMSTLB_CTRL			XE_REG_MCR(0xcf4c)
>  #define   CONTROL_BLOCK_CLKGATE_DIS		REG_BIT(12)
>  #define   EGRESS_BLOCK_CLKGATE_DIS		REG_BIT(11)
>  #define   TAG_BLOCK_CLKGATE_DIS			REG_BIT(7)
>  
> -#define XEHP_GAMCNTRL_CTRL			MCR_REG(0xcf54)
> +#define XEHP_GAMCNTRL_CTRL			XE_REG_MCR(0xcf54)
>  #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
>  #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>  
> -#define SAMPLER_MODE				MCR_REG(0xe18c)
> +#define SAMPLER_MODE				XE_REG_MCR(0xe18c)
>  #define   ENABLE_SMALLPL			REG_BIT(15)
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>  #define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
>  
> -#define HALF_SLICE_CHICKEN7				MCR_REG(0xe194)
> +#define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194)
>  #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
>  
> -#define CACHE_MODE_SS				MCR_REG(0xe420)
> +#define CACHE_MODE_SS				XE_REG_MCR(0xe420)
>  #define   ENABLE_EU_COUNT_FOR_TDL_FLUSH		REG_BIT(10)
>  #define   DISABLE_ECC				REG_BIT(5)
>  #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
>  
> -#define ROW_CHICKEN4				MCR_REG(0xe48c)
> +#define ROW_CHICKEN4				XE_REG_MCR(0xe48c)
>  #define   DISABLE_GRF_CLEAR			REG_BIT(13)
>  #define   XEHP_DIS_BBL_SYSPIPE			REG_BIT(11)
>  #define   DISABLE_TDL_PUSH			REG_BIT(9)
> @@ -297,87 +298,87 @@
>  #define   THREAD_EX_ARB_MODE			REG_GENMASK(3, 2)
>  #define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
>  
> -#define ROW_CHICKEN				MCR_REG(0xe4f0)
> +#define ROW_CHICKEN				XE_REG_MCR(0xe4f0)
>  #define   UGM_BACKUP_MODE			REG_BIT(13)
>  #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
>  
> -#define ROW_CHICKEN2				MCR_REG(0xe4f4)
> +#define ROW_CHICKEN2				XE_REG_MCR(0xe4f4)
>  #define   DISABLE_READ_SUPPRESSION		REG_BIT(15)
>  #define   DISABLE_EARLY_READ			REG_BIT(14)
>  #define   ENABLE_LARGE_GRF_MODE			REG_BIT(12)
>  #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
>  #define   DISABLE_DOP_GATING			REG_BIT(0)
>  
> -#define XEHP_HDC_CHICKEN0					MCR_REG(0xe5f0)
> +#define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0)
>  #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
>  
> -#define RT_CTRL					MCR_REG(0xe530)
> +#define RT_CTRL					XE_REG_MCR(0xe530)
>  #define   DIS_NULL_QUERY			REG_BIT(10)
>  
> -#define LSC_CHICKEN_BIT_0			MCR_REG(0xe7c8)
> +#define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
>  #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
>  #define   FORCE_1_SUB_MESSAGE_PER_FRAGMENT	REG_BIT(15)
>  
> -#define LSC_CHICKEN_BIT_0_UDW			MCR_REG(0xe7c8 + 4)
> +#define LSC_CHICKEN_BIT_0_UDW			XE_REG_MCR(0xe7c8 + 4)
>  #define   DIS_CHAIN_2XSIMD8			REG_BIT(55 - 32)
>  #define   FORCE_SLM_FENCE_SCOPE_TO_TILE		REG_BIT(42 - 32)
>  #define   FORCE_UGM_FENCE_SCOPE_TO_TILE		REG_BIT(41 - 32)
>  #define   MAXREQS_PER_BANK			REG_GENMASK(39 - 32, 37 - 32)
>  #define   DISABLE_128B_EVICTION_COMMAND_UDW	REG_BIT(36 - 32)
>  
> -#define SARB_CHICKEN1				MCR_REG(0xe90c)
> +#define SARB_CHICKEN1				XE_REG_MCR(0xe90c)
>  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
>  
> -#define RCU_MODE				_MMIO(0x14800)
> +#define RCU_MODE				XE_REG(0x14800)
>  #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>  
> -#define FORCEWAKE_ACK_GT			_MMIO(0x130044)
> +#define FORCEWAKE_ACK_GT			XE_REG(0x130044)
>  #define   FORCEWAKE_KERNEL			BIT(0)
>  #define   FORCEWAKE_USER			BIT(1)
>  #define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
>  
> -#define GT_CORE_STATUS				_MMIO(0x138060)
> +#define GT_CORE_STATUS				XE_REG(0x138060)
>  #define   RCN_MASK				REG_GENMASK(2, 0)
>  #define   GT_RC0				0
>  #define   GT_RC6				3
>  
> -#define GT_GFX_RC6_LOCKED			_MMIO(0x138104)
> -#define GT_GFX_RC6				_MMIO(0x138108)
> +#define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
> +#define GT_GFX_RC6				XE_REG(0x138108)
>  
> -#define GFX_FLSH_CNTL				_MMIO(0x101008)
> +#define GFX_FLSH_CNTL				XE_REG(0x101008)
>  #define   GFX_FLSH_CNTL_EN			REG_BIT(0)
>  
> -#define GT_INTR_DW(x)				_MMIO(0x190018 + ((x) * 4))
> +#define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
>  
> -#define GUC_SG_INTR_ENABLE			_MMIO(0x190038)
> +#define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
>  #define   ENGINE1_MASK				REG_GENMASK(31, 16)
>  #define   ENGINE0_MASK				REG_GENMASK(15, 0)
>  
> -#define GPM_WGBOXPERF_INTR_ENABLE		_MMIO(0x19003c)
> +#define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c)
>  
> -#define INTR_IDENTITY_REG(x)			_MMIO(0x190060 + ((x) * 4))
> +#define INTR_IDENTITY_REG(x)			XE_REG(0x190060 + ((x) * 4))
>  #define   INTR_DATA_VALID			REG_BIT(31)
>  #define   INTR_ENGINE_INSTANCE(x)		REG_FIELD_GET(GENMASK(25, 20), x)
>  #define   INTR_ENGINE_CLASS(x)			REG_FIELD_GET(GENMASK(18, 16), x)
>  #define   INTR_ENGINE_INTR(x)			REG_FIELD_GET(GENMASK(15, 0), x)
>  #define   OTHER_GUC_INSTANCE			0
>  
> -#define RENDER_COPY_INTR_ENABLE			_MMIO(0x190030)
> -#define VCS_VECS_INTR_ENABLE			_MMIO(0x190034)
> -#define CCS_RSVD_INTR_ENABLE			_MMIO(0x190048)
> -#define IIR_REG_SELECTOR(x)			_MMIO(0x190070 + ((x) * 4))
> -#define RCS0_RSVD_INTR_MASK			_MMIO(0x190090)
> -#define BCS_RSVD_INTR_MASK			_MMIO(0x1900a0)
> -#define VCS0_VCS1_INTR_MASK			_MMIO(0x1900a8)
> -#define VCS2_VCS3_INTR_MASK			_MMIO(0x1900ac)
> -#define VECS0_VECS1_INTR_MASK			_MMIO(0x1900d0)
> -#define GUC_SG_INTR_MASK			_MMIO(0x1900e8)
> -#define GPM_WGBOXPERF_INTR_MASK			_MMIO(0x1900ec)
> -#define CCS0_CCS1_INTR_MASK			_MMIO(0x190100)
> -#define CCS2_CCS3_INTR_MASK			_MMIO(0x190104)
> -#define XEHPC_BCS1_BCS2_INTR_MASK		_MMIO(0x190110)
> -#define XEHPC_BCS3_BCS4_INTR_MASK		_MMIO(0x190114)
> -#define XEHPC_BCS5_BCS6_INTR_MASK		_MMIO(0x190118)
> -#define XEHPC_BCS7_BCS8_INTR_MASK		_MMIO(0x19011c)
> +#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
> +#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
> +#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048)
> +#define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4))
> +#define RCS0_RSVD_INTR_MASK			XE_REG(0x190090)
> +#define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0)
> +#define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8)
> +#define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac)
> +#define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0)
> +#define GUC_SG_INTR_MASK			XE_REG(0x1900e8)
> +#define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec)
> +#define CCS0_CCS1_INTR_MASK			XE_REG(0x190100)
> +#define CCS2_CCS3_INTR_MASK			XE_REG(0x190104)
> +#define XEHPC_BCS1_BCS2_INTR_MASK		XE_REG(0x190110)
> +#define XEHPC_BCS3_BCS4_INTR_MASK		XE_REG(0x190114)
> +#define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
> +#define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 835d413ae186..f9095407bee7 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -13,7 +13,7 @@
>  
>  /* Definitions of GuC H/W registers, bits, etc */
>  
> -#define GUC_STATUS			_MMIO(0xc000)
> +#define GUC_STATUS			XE_REG(0xc000)
>  #define   GS_AUTH_STATUS_MASK		REG_GENMASK(31, 30)
>  #define   GS_AUTH_STATUS_BAD		REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x1)
>  #define   GS_AUTH_STATUS_GOOD		REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x2)
> @@ -27,55 +27,55 @@
>  #define   GS_BOOTROM_JUMP_PASSED	REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>  #define   GS_MIA_IN_RESET		REG_BIT(0)
>  
> -#define SOFT_SCRATCH(n)			_MMIO(0xc180 + (n) * 4)
> +#define SOFT_SCRATCH(n)			XE_REG(0xc180 + (n) * 4)
>  #define SOFT_SCRATCH_COUNT		16
>  
> -#define UOS_RSA_SCRATCH(i)		_MMIO(0xc200 + (i) * 4)
> +#define UOS_RSA_SCRATCH(i)		XE_REG(0xc200 + (i) * 4)
>  #define UOS_RSA_SCRATCH_COUNT		64
>  
> -#define DMA_ADDR_0_LOW			_MMIO(0xc300)
> -#define DMA_ADDR_0_HIGH			_MMIO(0xc304)
> -#define DMA_ADDR_1_LOW			_MMIO(0xc308)
> -#define DMA_ADDR_1_HIGH			_MMIO(0xc30c)
> +#define DMA_ADDR_0_LOW			XE_REG(0xc300)
> +#define DMA_ADDR_0_HIGH			XE_REG(0xc304)
> +#define DMA_ADDR_1_LOW			XE_REG(0xc308)
> +#define DMA_ADDR_1_HIGH			XE_REG(0xc30c)
>  #define   DMA_ADDR_SPACE_MASK		REG_GENMASK(20, 16)
>  #define   DMA_ADDRESS_SPACE_WOPCM	REG_FIELD_PREP(DMA_ADDR_SPACE_MASK, 7)
>  #define   DMA_ADDRESS_SPACE_GTT		REG_FIEDL_PREP(DMA_ADDR_SPACE_MASK, 8)
> -#define DMA_COPY_SIZE			_MMIO(0xc310)
> -#define DMA_CTRL			_MMIO(0xc314)
> +#define DMA_COPY_SIZE			XE_REG(0xc310)
> +#define DMA_CTRL			XE_REG(0xc314)
>  #define   HUC_UKERNEL			REG_BIT(9)
>  #define   UOS_MOVE			REG_BIT(4)
>  #define   START_DMA			REG_BIT(0)
> -#define DMA_GUC_WOPCM_OFFSET		_MMIO(0xc340)
> +#define DMA_GUC_WOPCM_OFFSET		XE_REG(0xc340)
>  #define   GUC_WOPCM_OFFSET_SHIFT	14
>  #define   GUC_WOPCM_OFFSET_MASK		REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
>  #define   HUC_LOADING_AGENT_MASK	REG_BIT(1)
>  #define   HUC_LOADING_AGENT_VCR		REG_FIELD_PREP(HUC_LOADING_AGENT_MASK, 0)
>  #define   HUC_LOADING_AGENT_GUC		REG_FIELD_PREP(HUC_LOADING_AGENT_MASK, 1)
>  #define   GUC_WOPCM_OFFSET_VALID	REG_BIT(0)
> -#define GUC_MAX_IDLE_COUNT		_MMIO(0xc3e4)
> +#define GUC_MAX_IDLE_COUNT		XE_REG(0xc3e4)
>  
> -#define HUC_STATUS2			_MMIO(0xd3b0)
> +#define HUC_STATUS2			XE_REG(0xd3b0)
>  #define   HUC_FW_VERIFIED		REG_BIT(7)
>  
> -#define HUC_KERNEL_LOAD_INFO		_MMIO(0xc1dc)
> +#define HUC_KERNEL_LOAD_INFO		XE_REG(0xc1dc)
>  #define   HUC_LOAD_SUCCESSFUL		REG_BIT(0)
>  
> -#define GUC_WOPCM_SIZE			_MMIO(0xc050)
> +#define GUC_WOPCM_SIZE			XE_REG(0xc050)
>  #define   GUC_WOPCM_SIZE_MASK		REG_GENMASK(31, 12)
>  #define   GUC_WOPCM_SIZE_LOCKED		REG_BIT(0)
>  
> -#define GT_PM_CONFIG			_MMIO(0x13816c)
> +#define GT_PM_CONFIG			XE_REG(0x13816c)
>  #define   GT_DOORBELL_ENABLE		REG_BIT(0)
>  
> -#define GTCR				_MMIO(0x4274)
> +#define GTCR				XE_REG(0x4274)
>  #define   GTCR_INVALIDATE		REG_BIT(0)
>  
> -#define GUC_TLB_INV_CR			_MMIO(0xcee8)
> +#define GUC_TLB_INV_CR			XE_REG(0xcee8)
>  #define   GUC_TLB_INV_CR_INVALIDATE	REG_BIT(0)
>  
> -#define GUC_ARAT_C6DIS				_MMIO(0xa178)
> +#define GUC_ARAT_C6DIS				XE_REG(0xa178)
>  
> -#define GUC_SHIM_CONTROL			_MMIO(0xc064)
> +#define GUC_SHIM_CONTROL			XE_REG(0xc064)
>  #define   PVC_GUC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
>  #define   PVC_GUC_MOCS_UC_INDEX			1
>  #define   PVC_GUC_MOCS_INDEX(index)		REG_FIELD_PREP(PVC_GUC_MOCS_INDEX_MASK, \
> @@ -90,9 +90,9 @@
>  #define   GUC_DISABLE_SRAM_INIT_TO_ZEROES	REG_BIT(0)
>  
>  
> -#define GUC_SEND_INTERRUPT			_MMIO(0xc4c8)
> +#define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
>  #define   GUC_SEND_TRIGGER			REG_BIT(0)
> -#define GUC_HOST_INTERRUPT			_MMIO(0x1901f0)
> +#define GUC_HOST_INTERRUPT			XE_REG(0x1901f0)
>  
>  #define GUC_NUM_DOORBELLS			256
>  
> @@ -106,24 +106,24 @@ struct guc_doorbell_info {
>  	u32 reserved[14];
>  } __packed;
>  
> -#define DRBREGL(x)				_MMIO(0x1000 + (x) * 8)
> +#define DRBREGL(x)				XE_REG(0x1000 + (x) * 8)
>  #define   DRB_VALID				REG_BIT(0)
> -#define DRBREGU(x)				_MMIO(0x1000 + (x) * 8 + 4)
> +#define DRBREGU(x)				XE_REG(0x1000 + (x) * 8 + 4)
>  
> -#define DIST_DBS_POPULATED			_MMIO(0xd08)
> +#define DIST_DBS_POPULATED			XE_REG(0xd08)
>  #define   DOORBELLS_PER_SQIDI_MASK		REG_GENMASK(23, 16)
>  #define   SQIDIS_DOORBELL_EXIST_MASK		REG_GENMASK(15, 0)
>  
> -#define GUC_BCS_RCS_IER				_MMIO(0xC550)
> -#define GUC_VCS2_VCS1_IER			_MMIO(0xC554)
> -#define GUC_WD_VECS_IER				_MMIO(0xC558)
> -#define GUC_PM_P24C_IER				_MMIO(0xC55C)
> +#define GUC_BCS_RCS_IER				XE_REG(0xC550)
> +#define GUC_VCS2_VCS1_IER			XE_REG(0xC554)
> +#define GUC_WD_VECS_IER				XE_REG(0xC558)
> +#define GUC_PM_P24C_IER				XE_REG(0xC55C)
>  
> -#define VF_SW_FLAG(n)			_MMIO(0x190240 + (n) * 4)
> -#define VF_SW_FLAG_COUNT		4
> +#define VF_SW_FLAG(n)				XE_REG(0x190240 + (n) * 4)
> +#define VF_SW_FLAG_COUNT			4
>  
> -#define MED_VF_SW_FLAG(n)		_MMIO(0x190310 + (n) * 4)
> -#define MED_VF_SW_FLAG_COUNT		4
> +#define MED_VF_SW_FLAG(n)			XE_REG(0x190310 + (n) * 4)
> +#define MED_VF_SW_FLAG_COUNT			4
>  
>  /* GuC Interrupt Vector */
>  #define GUC_INTR_GUC2HOST			BIT(15)
> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> index c0a091206f27..38c29eb4e19f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> @@ -92,13 +92,4 @@ struct xe_reg_mcr {
>  				 .__reg = XE_REG_INITIALIZER(r_,  ##__VA_ARGS__, .mcr = 1)	\
>  				 })
>  
> -/*
> - * TODO: remove these once the register declarations are not using them anymore
> - */
> -#undef _MMIO
> -#undef MCR_REG
> -#define _MMIO(r_)	((const struct xe_reg){ .reg = r_ })
> -#define MCR_REG(r_)	((const struct xe_reg_mcr){ .__reg.reg = r_,		\
> -						    .__reg.mcr = 1 })
> -
>  #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index da1d5aa6cdb7..8be616a1bd51 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -7,7 +7,7 @@
>  
>  #include "regs/xe_reg_defs.h"
>  
> -#define GU_CNTL					_MMIO(0x101010)
> +#define GU_CNTL					XE_REG(0x101010)
>  #define   LMEM_INIT				REG_BIT(7)
>  
>  #define RENDER_RING_BASE			0x02000
> @@ -42,18 +42,18 @@
>  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>  #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>  
> -#define FF_THREAD_MODE				_MMIO(0x20a0)
> +#define FF_THREAD_MODE				XE_REG(0x20a0)
>  #define   FF_TESSELATION_DOP_GATE_DISABLE	BIT(19)
>  
> -#define PVC_RP_STATE_CAP			_MMIO(0x281014)
> -#define MTL_RP_STATE_CAP			_MMIO(0x138000)
> +#define PVC_RP_STATE_CAP			XE_REG(0x281014)
> +#define MTL_RP_STATE_CAP			XE_REG(0x138000)
>  
> -#define MTL_MEDIAP_STATE_CAP			_MMIO(0x138020)
> +#define MTL_MEDIAP_STATE_CAP			XE_REG(0x138020)
>  #define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
>  #define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
>  
> -#define MTL_GT_RPE_FREQUENCY			_MMIO(0x13800c)
> -#define MTL_MPE_FREQUENCY			_MMIO(0x13802c)
> +#define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
> +#define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
>  #define   MTL_RPE_MASK				REG_GENMASK(8, 0)
>  
>  #define TRANSCODER_A_OFFSET			0x60000
> @@ -73,32 +73,32 @@
>  #define CURSOR_C_OFFSET				0x72080
>  #define CURSOR_D_OFFSET				0x73080
>  
> -#define SOFTWARE_FLAGS_SPR33			_MMIO(0x4f084)
> +#define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
>  
>  #define PCU_IRQ_OFFSET				0x444e0
>  #define GU_MISC_IRQ_OFFSET			0x444f0
>  #define   GU_MISC_GSE				REG_BIT(27)
>  
> -#define GFX_MSTR_IRQ				_MMIO(0x190010)
> +#define GFX_MSTR_IRQ				XE_REG(0x190010)
>  #define   MASTER_IRQ				REG_BIT(31)
>  #define   GU_MISC_IRQ				REG_BIT(29)
>  #define   DISPLAY_IRQ				REG_BIT(16)
>  #define   GT_DW_IRQ(x)				REG_BIT(x)
>  
> -#define DG1_MSTR_TILE_INTR			_MMIO(0x190008)
> +#define DG1_MSTR_TILE_INTR			XE_REG(0x190008)
>  #define   DG1_MSTR_IRQ				REG_BIT(31)
>  #define   DG1_MSTR_TILE(t)			REG_BIT(t)
>  
> -#define TIMESTAMP_OVERRIDE					_MMIO(0x44074)
> +#define TIMESTAMP_OVERRIDE					XE_REG(0x44074)
>  #define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
>  #define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
>  
> -#define GGC					_MMIO(0x108040)
> +#define GGC					XE_REG(0x108040)
>  #define   GMS_MASK				REG_GENMASK(15, 8)
>  #define   GGMS_MASK				REG_GENMASK(7, 6)
>  
> -#define GSMBASE					_MMIO(0x108100)
> -#define DSMBASE					_MMIO(0x1080C0)
> +#define GSMBASE					XE_REG(0x108100)
> +#define DSMBASE					XE_REG(0x1080C0)
>  #define   BDSM_MASK				REG_GENMASK64(63, 20)
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index 29e112c108c6..51d215f08113 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -18,17 +18,17 @@
>  #include "xe_reg_sr.h"
>  #include "xe_rtp.h"
>  
> -#undef _MMIO
> -#undef MCR_REG
> -#define _MMIO(x)	_XE_RTP_REG(x)
> -#define MCR_REG(x)	_XE_RTP_MCR_REG(x)
> +#undef XE_REG
> +#undef XE_REG_MCR
> +#define XE_REG(x, ...)		_XE_RTP_REG(x)
> +#define XE_REG_MCR(x, ...)	_XE_RTP_MCR_REG(x)
>  
> -#define REGULAR_REG1	_MMIO(1)
> -#define REGULAR_REG2	_MMIO(2)
> -#define REGULAR_REG3	_MMIO(3)
> -#define MCR_REG1	MCR_REG(1)
> -#define MCR_REG2	MCR_REG(2)
> -#define MCR_REG3	MCR_REG(3)
> +#define REGULAR_REG1	XE_REG(1)
> +#define REGULAR_REG2	XE_REG(2)
> +#define REGULAR_REG3	XE_REG(3)
> +#define MCR_REG1	XE_REG_MCR(1)
> +#define MCR_REG2	XE_REG_MCR(2)
> +#define MCR_REG3	XE_REG_MCR(3)
>  
>  struct rtp_test_case {
>  	const char *name;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 3417cc7e0291..6d450e431872 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -185,11 +185,11 @@ int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt)
>  	return err;
>  }
>  
> -#define GUC_TLB_INV_CR				_MMIO(0xcee8)
> +#define GUC_TLB_INV_CR				XE_REG(0xcee8)
>  #define   GUC_TLB_INV_CR_INVALIDATE		REG_BIT(0)
> -#define PVC_GUC_TLB_INV_DESC0			_MMIO(0xcf7c)
> +#define PVC_GUC_TLB_INV_DESC0			XE_REG(0xcf7c)
>  #define   PVC_GUC_TLB_INV_DESC0_VALID		REG_BIT(0)
> -#define PVC_GUC_TLB_INV_DESC1			_MMIO(0xcf80)
> +#define PVC_GUC_TLB_INV_DESC1			XE_REG(0xcf80)
>  #define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	REG_BIT(6)
>  
>  void xe_ggtt_invalidate(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 4e9e9b1aad02..3794fdf3d35a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -22,6 +22,10 @@
>  #include "xe_uc_fw.h"
>  #include "xe_wopcm.h"
>  
> +#define MEDIA_GUC_HOST_INTERRUPT        XE_REG(0x190304)
> +#define MEDIA_SOFT_SCRATCH(n)           XE_REG(0x190310 + (n) * 4)
> +#define MEDIA_SOFT_SCRATCH_COUNT        4

Didn't we kill off these last two in patch #6?  They're supposed to be
MED_VF_SW_FLAG now I think.

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> +
>  static struct xe_gt *
>  guc_to_gt(struct xe_guc *guc)
>  {
> @@ -244,8 +248,6 @@ static void guc_write_params(struct xe_guc *guc)
>  		xe_mmio_write32(gt, SOFT_SCRATCH(1 + i).reg, guc->params[i]);
>  }
>  
> -#define MEDIA_GUC_HOST_INTERRUPT        _MMIO(0x190304)
> -
>  int xe_guc_init(struct xe_guc *guc)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 10c3a442ecd9..fdbcfbcc9861 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -23,18 +23,18 @@
>  
>  #define MCHBAR_MIRROR_BASE_SNB	0x140000
>  
> -#define GEN6_RP_STATE_CAP			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5998)
> -#define   RP0_MASK				REG_GENMASK(7, 0)
> -#define   RP1_MASK				REG_GENMASK(15, 8)
> -#define   RPN_MASK				REG_GENMASK(23, 16)
> +#define GEN6_RP_STATE_CAP	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5998)
> +#define   RP0_MASK		REG_GENMASK(7, 0)
> +#define   RP1_MASK		REG_GENMASK(15, 8)
> +#define   RPN_MASK		REG_GENMASK(23, 16)
>  
> -#define GEN10_FREQ_INFO_REC	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
> +#define GEN10_FREQ_INFO_REC	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
>  #define   RPE_MASK		REG_GENMASK(15, 8)
>  
> -#define GEN12_RPSTAT1		_MMIO(0x1381b4)
> +#define GEN12_RPSTAT1		XE_REG(0x1381b4)
>  #define   GEN12_CAGF_MASK	REG_GENMASK(19, 11)
>  
> -#define MTL_MIRROR_TARGET_WP1	_MMIO(0xc60)
> +#define MTL_MIRROR_TARGET_WP1	XE_REG(0xc60)
>  #define   MTL_CAGF_MASK		REG_GENMASK(8, 0)
>  
>  #define GT_FREQUENCY_MULTIPLIER	50
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 4409490024a6..ac72c1a38e5c 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -23,9 +23,9 @@
>   * Interrupt registers for a unit are always consecutive and ordered
>   * ISR, IMR, IIR, IER.
>   */
> -#define IMR(offset)				_MMIO(offset + 0x4)
> -#define IIR(offset)				_MMIO(offset + 0x8)
> -#define IER(offset)				_MMIO(offset + 0xc)
> +#define IMR(offset)				XE_REG(offset + 0x4)
> +#define IIR(offset)				XE_REG(offset + 0x8)
> +#define IER(offset)				XE_REG(offset + 0xc)
>  
>  static void assert_iir_is_zero(struct xe_gt *gt, struct xe_reg reg)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 0bb83ff18599..f13d35a3ee36 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -17,7 +17,7 @@
>  #include "xe_macros.h"
>  #include "xe_module.h"
>  
> -#define XEHP_MTCFG_ADDR		_MMIO(0x101800)
> +#define XEHP_MTCFG_ADDR		XE_REG(0x101800)
>  #define TILE_COUNT		REG_GENMASK(15, 8)
>  #define GEN12_LMEM_BAR		2
>  
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 67c63facdbf9..f2ceecd536ed 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -477,8 +477,8 @@ static void __init_mocs_table(struct xe_gt *gt,
>  	for (i = 0;
>  	     i < info->n_entries ? (mocs = get_entry_control(info, i)), 1 : 0;
>  	     i++) {
> -		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, _MMIO(addr + i * 4).reg, mocs);
> -		xe_mmio_write32(gt, _MMIO(addr + i * 4).reg, mocs);
> +		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, XE_REG(addr + i * 4).reg, mocs);
> +		xe_mmio_write32(gt, XE_REG(addr + i * 4).reg, mocs);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index fcf6ae2c92cc..abee41fa3cb9 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -71,7 +71,7 @@ static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
>  static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
>  {
>  	for (int i = 0; i < n_entries; i++)
> -		xe_gt_mcr_multicast_write(gt, MCR_REG(_PAT_INDEX(i)), table[i]);
> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_INDEX(i)), table[i]);
>  }
>  
>  void xe_pat_init(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 4e689cd4b23b..837ff7c71280 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -7,7 +7,7 @@
>  
>  #include "regs/xe_reg_defs.h"
>  
> -#define PCODE_MAILBOX			_MMIO(0x138124)
> +#define PCODE_MAILBOX			XE_REG(0x138124)
>  #define   PCODE_READY			REG_BIT(31)
>  #define   PCODE_MB_PARAM2		REG_GENMASK(23, 16)
>  #define   PCODE_MB_PARAM1		REG_GENMASK(15, 8)
> @@ -22,8 +22,8 @@
>  #define     PCODE_GT_RATIO_OUT_OF_RANGE	0x10
>  #define     PCODE_REJECTED		0x11
>  
> -#define PCODE_DATA0			_MMIO(0x138128)
> -#define PCODE_DATA1			_MMIO(0x13812C)
> +#define PCODE_DATA0			XE_REG(0x138128)
> +#define PCODE_DATA1			XE_REG(0x13812C)
>  
>  /* Min Freq QOS Table */
>  #define   PCODE_WRITE_MIN_FREQ_TABLE	0x8
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index f77203b32026..1e792ec8239b 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -153,7 +153,7 @@ static void apply_one_mmio(struct xe_gt *gt, u32 reg,
>  		val = (entry->clr_bits ?: entry->set_bits) << 16;
>  	else if (entry->clr_bits + 1)
>  		val = (entry->reg_type == XE_RTP_REG_MCR ?
> -		       xe_gt_mcr_unicast_read_any(gt, MCR_REG(reg)) :
> +		       xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(reg)) :
>  		       xe_mmio_read32(gt, reg)) & (~entry->clr_bits);
>  	else
>  		val = 0;
> @@ -168,7 +168,7 @@ static void apply_one_mmio(struct xe_gt *gt, u32 reg,
>  	drm_dbg(&xe->drm, "REG[0x%x] = 0x%08x", reg, val);
>  
>  	if (entry->reg_type == XE_RTP_REG_MCR)
> -		xe_gt_mcr_multicast_write(gt, MCR_REG(reg), val);
> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(reg), val);
>  	else
>  		xe_mmio_write32(gt, reg, val);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 5a2665706912..310d5dfe30d5 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -11,10 +11,10 @@
>  #include "xe_platform_types.h"
>  #include "xe_rtp.h"
>  
> -#undef _MMIO
> -#undef MCR_REG
> -#define _MMIO(x)	_XE_RTP_REG(x)
> -#define MCR_REG(x)	_XE_RTP_MCR_REG(x)
> +#undef XE_REG
> +#undef XE_REG_MCR
> +#define XE_REG(x, ...)		_XE_RTP_REG(x)
> +#define XE_REG_MCR(x, ...)	_XE_RTP_MCR_REG(x)
>  
>  static bool match_not_render(const struct xe_gt *gt,
>  			     const struct xe_hw_engine *hwe)
> @@ -45,10 +45,10 @@ static const struct xe_rtp_entry register_whitelist[] = {
>  	},
>  	{ XE_RTP_NAME("16014440446"),
>  	  XE_RTP_RULES(PLATFORM(PVC)),
> -	  XE_RTP_ACTIONS(WHITELIST(_MMIO(0x4400),
> +	  XE_RTP_ACTIONS(WHITELIST(XE_REG(0x4400),
>  				   RING_FORCE_TO_NONPRIV_DENY |
>  				   RING_FORCE_TO_NONPRIV_RANGE_64),
> -			 WHITELIST(_MMIO(0x4500),
> +			 WHITELIST(XE_REG(0x4500),
>  				   RING_FORCE_TO_NONPRIV_DENY |
>  				   RING_FORCE_TO_NONPRIV_RANGE_64))
>  	},
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 53650f09efe9..9148f32baa02 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -196,7 +196,7 @@ struct xe_reg_sr;
>   * XE_RTP_ACTION_WR - Helper to write a value to the register, overriding all
>   *                    the bits
>   * @reg_: Register
> - * @reg_type_: Register type - automatically expanded by MCR_REG/_MMIO
> + * @reg_type_: Register type - automatically expanded by XE_REG
>   * @val_: Value to set
>   * @...: Additional fields to override in the struct xe_rtp_action entry
>   *
> @@ -212,7 +212,7 @@ struct xe_reg_sr;
>  /**
>   * XE_RTP_ACTION_SET - Set bits from @val_ in the register.
>   * @reg_: Register
> - * @reg_type_: Register type - automatically expanded by MCR_REG/_MMIO
> + * @reg_type_: Register type - automatically expanded by XE_REG
>   * @val_: Bits to set in the register
>   * @...: Additional fields to override in the struct xe_rtp_action entry
>   *
> @@ -231,7 +231,7 @@ struct xe_reg_sr;
>  /**
>   * XE_RTP_ACTION_CLR: Clear bits from @val_ in the register.
>   * @reg_: Register
> - * @reg_type_: Register type - automatically expanded by MCR_REG/_MMIO
> + * @reg_type_: Register type - automatically expanded by XE_REG
>   * @val_: Bits to clear in the register
>   * @...: Additional fields to override in the struct xe_rtp_action entry
>   *
> @@ -250,7 +250,7 @@ struct xe_reg_sr;
>  /**
>   * XE_RTP_ACTION_FIELD_SET: Set a bit range
>   * @reg_: Register
> - * @reg_type_: Register type - automatically expanded by MCR_REG/_MMIO
> + * @reg_type_: Register type - automatically expanded by XE_REG
>   * @mask_bits_: Mask of bits to be changed in the register, forming a field
>   * @val_: Value to set in the field denoted by @mask_bits_
>   * @...: Additional fields to override in the struct xe_rtp_action entry
> @@ -273,7 +273,7 @@ struct xe_reg_sr;
>  /**
>   * XE_RTP_ACTION_WHITELIST - Add register to userspace whitelist
>   * @reg_: Register
> - * @reg_type_: Register type - automatically expanded by MCR_REG/_MMIO
> + * @reg_type_: Register type - automatically expanded by XE_REG
>   * @val_: Whitelist-specific flags to set
>   * @...: Additional fields to override in the struct xe_rtp_action entry
>   *
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 43912312cfba..f6eefa951175 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -12,10 +12,10 @@
>  #include "xe_platform_types.h"
>  #include "xe_rtp.h"
>  
> -#undef _MMIO
> -#undef MCR_REG
> -#define _MMIO(x)	_XE_RTP_REG(x)
> -#define MCR_REG(x)	_XE_RTP_MCR_REG(x)
> +#undef XE_REG
> +#undef XE_REG_MCR
> +#define XE_REG(x, ...)		_XE_RTP_REG(x)
> +#define XE_REG_MCR(x, ...)	_XE_RTP_MCR_REG(x)
>  
>  static const struct xe_rtp_entry gt_tunings[] = {
>  	{ XE_RTP_NAME("Tuning: Blend Fill Caching Optimization Disable"),
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index f402d56c675c..b7dc71f63c8a 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -87,10 +87,10 @@
>   *    a more declarative approach rather than procedural.
>   */
>  
> -#undef _MMIO
> -#undef MCR_REG
> -#define _MMIO(x)	_XE_RTP_REG(x)
> -#define MCR_REG(x)	_XE_RTP_MCR_REG(x)
> +#undef XE_REG
> +#undef XE_REG_MCR
> +#define XE_REG(x, ...)		_XE_RTP_REG(x)
> +#define XE_REG_MCR(x, ...)	_XE_RTP_MCR_REG(x)
>  
>  __diag_push();
>  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
