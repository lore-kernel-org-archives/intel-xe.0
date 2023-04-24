Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A02FC77B61
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 20:49:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B1F10E602;
	Mon, 24 Apr 2023 20:49:40 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CAC10E602
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 20:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682369379; x=1713905379;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h2hNTyG7kL7a7CzrfMkOPXH0oawjGfMYoyZUy9aPH4M=;
 b=hN2n6/zni+V1z+JGS63FGOXK6jxl+KYcEyJECrA1h8hQSm1cNU48RxLZ
 TrKfefvaF3rOBtZMY/uzLW5HY7CU+t+MwgVZxtp6WHexi1kJ3Zbibs2up
 QMJOyASos5CAGbQ/IeSAWIlLeCifNIOG6ulshwId0DSMl4QWObb1X81+7
 hdfLr+OyLJMQWn5IRR08U/moZY1g9JV/6rv7onePUuLlEmL9arSyAIV74
 VsqjKhBsz2X8BcUsIwD2nCFWmLXvMDbaBB33auwybX2JWouxE4N/EqdMI
 2GdVd/OUA6tlNBqppvhhvQhFysxeG+G22wlSDlm9keqdmFI41JOPqLZsM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="411841306"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="411841306"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 13:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="939481820"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="939481820"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 24 Apr 2023 13:49:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 13:49:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 13:49:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 13:49:36 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 13:49:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mh6C8YOeWamOeno0z1s66/PcBf2scztqj8PwlWavvCCv+V8Sr/zXyM6KatV4Ebvmhz9cBB0er6dQAQHBmwZ+dlcOL/PvaMU4EHVx22jblosjOE1XVjeCof76ZzGnzPtX9ig6PdHCg4ho/mt9v3z8jwEyE8jpbgTNTss0PVCHPxfus0h8S+4odiP0JuMYzaqQGtyx/VB+L4T8IocX2evvz490gGxhAwD0pa27cH/cpjyY28sS7GaiNsid8q52sASsIrnC7tLidYfhiWJTNwtAUNDmjujUFsO1vlqZhXWHvpAIYIm/IkvHxndVtslcNgfJ/2o3FwxQXnF1Xsfw/Gpqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnL/MQXnHZaDA2cf3or86GJuezkDwi+7XBGj54D0tEk=;
 b=BgO21homyoYU3bAWqs7j+bKJEqtq5nvWbnu01lqU0BmzKPewvDZOic2fQI8d8MNd2Trq6e35wAWkPn8LiJeH97xRaiRzbXzTrKvvNt6wvTRgu99fL6BExRUkhhxEvGgQRLQxSEW/UdVAt7nmYfBIrQuU8YOxnL/S5DWDETPmElz9LooLljLx6YAS7Ddip+QmZeCf33eYkcVkjlwJQBuwb3HuL1m3vVcdKS5gvoBQjk45fBs4hmECBWg2pcHSEGoaXRSAwHpmToHkLJDuAJ/GXJfp8Aj5D6uEQ/ecnoEZVUwcijc/WvtxIDkd95+3AyK3DIaUobDSh1vLBMKbyCogOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Mon, 24 Apr
 2023 20:49:28 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 20:49:28 +0000
Date: Mon, 24 Apr 2023 13:49:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230424204924.GD10045@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-16-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421223258.128781-16-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:a03:333::17) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 87d677ff-0a6b-466b-0359-08db450564ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sKfSMiL/Rn9NHslwMuxPevmbO3BPk4rV9XBePooI11ONfqvAbLm3QcH51M0FpDxwyKXUsLH11T6kHCv46AXNy6/G/1S5YWhGwWrWcqbfRuzg7JGrsRfeQocXrGXvcgCH0qdB0S6JzI2L4ceN41ZYK2TGtY0q0jFpoG+QYe6AipcQHi1KGCLv2fwbN6dKJ5dfNXaoH+89iVf0nUEc1wju1oZyLfjYNRmEPlRykiWort99OChmLhsy1h+UmbLevfbAPGjumihPkZ6nM1/xVmWy81LpmgSUz8cAom7aBJm+PNq49KGaB4iWpMlLKTf+JdQQAz6fIp5V9rHzQLOso3k4t23yMuScFZlEEpmc2yd0pYUa/OYVHJhLCwH+UaWILaV+GfRdS8KyDjTnaP7HMYH1BUngjpP2Sc+7QKAyHQC4n6ok+Vbe3+29QDgOs9QHMctksQgrnMOHqFUXP3WDI1Ty+vJhe54z2Yoi3rqDbaaKNLxPa103biZcLeAvPUoZnHLhBbKX+utGFAfUTuKh40JF3WAuPvBKZwHMEA/9tif/Esj0ILjHMtXyX/gTqAzLLMn4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199021)(54906003)(478600001)(82960400001)(316002)(4326008)(66476007)(66556008)(66946007)(6636002)(41300700001)(2906002)(6862004)(8936002)(8676002)(5660300002)(38100700002)(6512007)(6506007)(1076003)(26005)(86362001)(186003)(33656002)(6666004)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MGvKj33UaW0pIWxnXB/L+IS6QeR0qP7vuj3BUWAglTCXDFwDiomoPDvtqIMu?=
 =?us-ascii?Q?4/QK7SuHlvJE8UrlDWuiV1C5LZ7kPbE6lu/ABWDt/OsHgo5W9jfNPNgUqYwa?=
 =?us-ascii?Q?QiMhIw7as4y/BF/EU0dDuZ8IGz2zYbjVOKVzD02q8eEIdwQrvD44LO5LOhG7?=
 =?us-ascii?Q?YdTICDQGhNCNoFexUYJUlpI57Hzn07UbLOcFcRsJkcRJO1w8OEG/4laBuc2y?=
 =?us-ascii?Q?0ww82pd7L+gQ96BKyATHnJEHJjz3u9sN+rzymIecRzQ+E1GVm8kFc4hwwEK7?=
 =?us-ascii?Q?GGHBkITjxIgMOkv9YBZHAhGjZMGmFtqlLy5TJy9k3dUIV0TcGKQfIiBQsgom?=
 =?us-ascii?Q?NZ1Abi4D2GxCX3zXhcMBfafsKRuZ26ZtNFkmnuYB59n8ajuQ19IPFyh2Kd/B?=
 =?us-ascii?Q?PPuusDoOMAAWYn4DialY8u/QHm4RLgYRCCaMK9uNbIbaqrsrJ5gMe2q9dCbd?=
 =?us-ascii?Q?MFTPRwnErlS67SsxBfV9XLU8eqcUAEZ8KhZ4ejeByFuBexzfExTNHb1zaG7+?=
 =?us-ascii?Q?f1lMfbUsI7USBLNfV3LIIRzpSjrOQymkwUz/bhp5vB2YPif7Hf2D2tWqrgRB?=
 =?us-ascii?Q?trK75sthuzazDg1Ed5JpS2YjveIMyI2XNiBd8lWnViCY/qjtfSetv1FGoUbq?=
 =?us-ascii?Q?KMVAgdTj8I7nobdQ9mLSz/FZ5mGGw9lLwg+AoMVYaeB6UXkja1V+fVQvBBfF?=
 =?us-ascii?Q?LmNIgjijlM1Y3UtVVRzsns5L4vXvQjZ63V2NtRwWR0D0livO9/AComlPLDy5?=
 =?us-ascii?Q?VWfTmrysq/xIelu7kCZciTCucf5nUe1RkXt4Q3dsyJVhE6sKIAasBMsLqLXp?=
 =?us-ascii?Q?0ymnyG0oNjnS7tABb6nezo2ifrVkyhidmVzBCwIGHavLE+jA0bRsanycB669?=
 =?us-ascii?Q?eTLMA74i5gb+EW4qx011ldpgx/md84mHh566Eujnsruk+kLQ1W1ir1mFrW3u?=
 =?us-ascii?Q?mK0OF2qcv7uoTG4qeVooglUsP9eNbrWxsbAEjy91JWBKxn8OCe0ScefrbD9N?=
 =?us-ascii?Q?6B6RKzxtJHGNj9FWKncKjehKafd9CF9akvoXb0vEp7KoaAqPhPfPHwzuFBMJ?=
 =?us-ascii?Q?aXzHT80DNQD9WonK6UY8RppiFJHe+0AH+yXnHpmeMnkw8QCA5HlFAw3cDRTr?=
 =?us-ascii?Q?BC7+031oUKjf3420dt4oYCXqJA2EbGFn+UX4/IrdqXv2gJDLVOP71H/gJdOW?=
 =?us-ascii?Q?tkERLYH4V9MnmDkCXi9lEL89urNN447OHxQPMwQ/tuSI87vQ2zadqe+I4OGz?=
 =?us-ascii?Q?CBnR3M7QSE3oMIyjxh3YpO3OiSCYW2NkRI7fCn4YbUEZ+VKE3qSxH/zHyQ91?=
 =?us-ascii?Q?ETVwhgsB8UAJf+DlFXnLJFNTV/LYW2m08/jZK0rncRHn3MWbpL/QrTCc1PkA?=
 =?us-ascii?Q?6eLE+Hgf3ef+dWjzXQtbN/716hBESIqEBMuQ3Z+hHtuk3kvaKyWfwFL0F7fF?=
 =?us-ascii?Q?AXYAa6LHxT13I7jD+Xm5NabK7watCylnaESx4acX4DPjgm2za36wt13pTRys?=
 =?us-ascii?Q?+m8iPYreiDhtBT4uU7ZcL9LmkxnNbKBFRMxWELPjUbFX73xUwoSYngNSmlx7?=
 =?us-ascii?Q?xcsgFjZa209J4LyYh5rUyp1E66r6LEojLSUM+DxO1Q3nYzrIXB5djX+nPy0R?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d677ff-0a6b-466b-0359-08db450564ec
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 20:49:27.5548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmzONgxMVsII4/iFZGlHmaTyjU6ES6XEep8OdQv+bwsmJHyJDxaKh2RDeZ3VzZzE4yI1um8NykIsCE89Sb8q16Y9rnzYwSOCpj/DLDMIATw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 15/17] drm/xe: Annotate masked registers
 used by RTP
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

On Fri, Apr 21, 2023 at 03:32:56PM -0700, Lucas De Marchi wrote:
> Go over all registers used in xe_rtp tables and mark the registers as
> masked if they were passed a XE_RTP_ACTION_FLAG(MASKED_REG) flag.
> This will allow the flag to be removed in future when xe_rtp starts
> using the real xe_reg_t type.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 +-
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 46 ++++++++++++------------
>  2 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index c13aac8f900c..f8851e045c0a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -21,7 +21,7 @@
>  #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>  #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>  
> -#define RING_PSMI_CTL(base)			XE_REG((base) + 0x50)
> +#define RING_PSMI_CTL(base)			XE_REG((base) + 0x50, XE_REG_OPTION_MASKED)
>  #define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
>  #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 64ab2255a406..c6949cec1dc3 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -45,19 +45,19 @@
>  #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
>  #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
>  
> -#define FF_SLICE_CS_CHICKEN1			XE_REG(0x20e0)
> +#define FF_SLICE_CS_CHICKEN1			XE_REG(0x20e0, XE_REG_OPTION_MASKED)
>  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
>  
> -#define FF_SLICE_CS_CHICKEN2			XE_REG(0x20e4)
> +#define FF_SLICE_CS_CHICKEN2			XE_REG(0x20e4, XE_REG_OPTION_MASKED)
>  #define   PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
>  
> -#define CS_DEBUG_MODE1				XE_REG(0x20ec)
> +#define CS_DEBUG_MODE1				XE_REG(0x20ec, XE_REG_OPTION_MASKED)
>  #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
>  #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
>  
>  #define PS_INVOCATION_COUNT			XE_REG(0x2348)
>  
> -#define CS_CHICKEN1				XE_REG(0x2580)
> +#define CS_CHICKEN1				XE_REG(0x2580, XE_REG_OPTION_MASKED)
>  #define   PREEMPT_GPGPU_LEVEL(hi, lo)		(((hi) << 2) | ((lo) << 1))
>  #define   PREEMPT_GPGPU_MID_THREAD_LEVEL	PREEMPT_GPGPU_LEVEL(0, 0)
>  #define   PREEMPT_GPGPU_THREAD_GROUP_LEVEL	PREEMPT_GPGPU_LEVEL(0, 1)
> @@ -77,10 +77,10 @@
>  #define XEHP_TILE0_ADDR_RANGE			XE_REG_MCR(0x4900)
>  #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
>  
> -#define CHICKEN_RASTER_1			XE_REG_MCR(0x6204)
> +#define CHICKEN_RASTER_1			XE_REG_MCR(0x6204, XE_REG_OPTION_MASKED)
>  #define   DIS_SF_ROUND_NEAREST_EVEN		REG_BIT(8)
>  
> -#define CHICKEN_RASTER_2			XE_REG_MCR(0x6208)
> +#define CHICKEN_RASTER_2			XE_REG_MCR(0x6208, XE_REG_OPTION_MASKED)
>  #define   TBIMR_FAST_CLIP			REG_BIT(5)
>  
>  #define VFLSKPD					XE_REG_MCR(0x62a8)

This one should be masked as well (bspec 46114).

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> @@ -94,35 +94,35 @@
>  #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
>  #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
>  
> -#define CACHE_MODE_1				XE_REG(0x7004)
> +#define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
>  #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>  
> -#define XEHP_PSS_MODE2				XE_REG_MCR(0x703c)
> +#define XEHP_PSS_MODE2				XE_REG_MCR(0x703c, XE_REG_OPTION_MASKED)
>  #define   SCOREBOARD_STALL_FLUSH_CONTROL	REG_BIT(5)
>  
> -#define HIZ_CHICKEN					XE_REG(0x7018)
> +#define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
>  #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
>  #define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE		REG_BIT(13)
>  
>  #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
>  
> -#define COMMON_SLICE_CHICKEN4			XE_REG(0x7300)
> +#define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
>  #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
>  
> -#define COMMON_SLICE_CHICKEN3				XE_REG(0x7304)
> -#define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304)
> +#define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
> +#define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
>  #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
>  #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
>  #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
>  #define   DISABLE_CPS_AWARE_COLOR_PIPE			REG_BIT(9)
>  
> -#define XEHP_SLICE_COMMON_ECO_CHICKEN1		XE_REG_MCR(0x731c)
> +#define XEHP_SLICE_COMMON_ECO_CHICKEN1		XE_REG_MCR(0x731c, XE_REG_OPTION_MASKED)
>  #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
>  
> -#define VF_PREEMPTION				XE_REG(0x83a4)
> +#define VF_PREEMPTION				XE_REG(0x83a4, XE_REG_OPTION_MASKED)
>  #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
>  
> -#define VFG_PREEMPTION_CHICKEN			XE_REG(0x83b4)
> +#define VFG_PREEMPTION_CHICKEN			XE_REG(0x83b4, XE_REG_OPTION_MASKED)
>  #define   POLYGON_TRIFAN_LINELOOP_DISABLE	REG_BIT(4)
>  
>  #define XEHP_SQCM				XE_REG_MCR(0x8724)
> @@ -248,7 +248,7 @@
>  #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
>  #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>  
> -#define XEHPC_LNCFMISCCFGREG0			XE_REG_MCR(0xb01c)
> +#define XEHPC_LNCFMISCCFGREG0			XE_REG_MCR(0xb01c, XE_REG_OPTION_MASKED)
>  #define   XEHPC_OVRLSCCC			REG_BIT(0)
>  
>  #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
> @@ -276,20 +276,20 @@
>  #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
>  #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>  
> -#define SAMPLER_MODE				XE_REG_MCR(0xe18c)
> +#define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
>  #define   ENABLE_SMALLPL			REG_BIT(15)
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>  #define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
>  
> -#define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194)
> +#define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
>  #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
>  
> -#define CACHE_MODE_SS				XE_REG_MCR(0xe420)
> +#define CACHE_MODE_SS				XE_REG_MCR(0xe420, XE_REG_OPTION_MASKED)
>  #define   ENABLE_EU_COUNT_FOR_TDL_FLUSH		REG_BIT(10)
>  #define   DISABLE_ECC				REG_BIT(5)
>  #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
>  
> -#define ROW_CHICKEN4				XE_REG_MCR(0xe48c)
> +#define ROW_CHICKEN4				XE_REG_MCR(0xe48c, XE_REG_OPTION_MASKED)
>  #define   DISABLE_GRF_CLEAR			REG_BIT(13)
>  #define   XEHP_DIS_BBL_SYSPIPE			REG_BIT(11)
>  #define   DISABLE_TDL_PUSH			REG_BIT(9)
> @@ -298,18 +298,18 @@
>  #define   THREAD_EX_ARB_MODE			REG_GENMASK(3, 2)
>  #define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
>  
> -#define ROW_CHICKEN				XE_REG_MCR(0xe4f0)
> +#define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
>  #define   UGM_BACKUP_MODE			REG_BIT(13)
>  #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
>  
> -#define ROW_CHICKEN2				XE_REG_MCR(0xe4f4)
> +#define ROW_CHICKEN2				XE_REG_MCR(0xe4f4, XE_REG_OPTION_MASKED)
>  #define   DISABLE_READ_SUPPRESSION		REG_BIT(15)
>  #define   DISABLE_EARLY_READ			REG_BIT(14)
>  #define   ENABLE_LARGE_GRF_MODE			REG_BIT(12)
>  #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
>  #define   DISABLE_DOP_GATING			REG_BIT(0)
>  
> -#define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0)
> +#define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0, XE_REG_OPTION_MASKED)
>  #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
>  
>  #define RT_CTRL					XE_REG_MCR(0xe530)
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
