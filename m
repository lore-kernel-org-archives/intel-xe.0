Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41C2C07E97
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 16:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F64A10E166;
	Tue, 28 Nov 2023 16:49:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FE310E166
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 16:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701190173; x=1732726173;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QuxYaCbUCEy6On8aKgMUIEeQSBryKipiExMdUMywVNc=;
 b=kqafrwFsLqBCb23Knwv2yTobu6iJyAJYc63ocHzUQ5Hc/G9o/i0H4jbU
 4y4EQQQQVXaUi17pB71w53fhHuRVLwrBqhDtcBI8Wwd/ybTvbGLTtIhF/
 sMSfg9MYcB8EdKGNtHsslyvXwSqNbj0bO6iq8IC88hNgvA35r7yRJX1a3
 +FUCdI8Qc+cwCAe0FLVOWQSZTFecLASieL89kTJMv682N/EJ/sCHw8Is3
 qAwTHbLUOrpxxvcZJNVcakQfPsQA63nnRxftMK9lHODux/9H+sFTn1olS
 EYT9OpSucyzQ5NvfBadEEg2oEaQwxLruKRL+PCWc3mUgagaWIjV7idj6r Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="383349600"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="383349600"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 08:49:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="912478168"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="912478168"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 08:49:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 08:49:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 08:49:32 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 08:49:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpD+ia6obNFmw1LMm9rnMwrXQNEEFesXQPDytTCMHbqvZv1IRIhvAzcMmx9DSHbLlPuqJ7KrljgIPS+f2MjTL3+MnI/CBx46vFgZTQqSa8J9fJhOuEUlaSCflJV6EZzNPpM1SCaLFMJpikAKQ31QytSQmmIRZBK0Y39VTMCwYYJEe9AdfaKWVWmrcIxC1M/5PAA2WVk33rlRH0NeDjXfFkx4KzGJjxW50l5MJXPsB4dZyLG1ojRby8TNcJRLtcc6cgbSdThsEBs78YYSGWwbqmVBLAMWMkMNeCZX7/K1QS+aiGVFWxuBNp7HLkKsJqTQqgSrHDw53q3MICZtNboRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2wnD9GGg8g/o8thZInuF+du2rComuR8bzWMx1rW6bw=;
 b=PJZi1LmnQ9CvjemelHi59O6k1WedOzpBgv9vv3AvjxatpYWSekyq2rVc0v5PaITjp3YNaBLKUlgeerFV5Xvn2FY3pjwBquKRVjbAJ+5echrd4OKJCuSxJw91FfBQUTXNf0tovGktJw5DRkoWH1s97VOjbE3s+sUfLaU7+ccifdhqnOnh6Gwv2D6TWjpPUUYmyj0tOHELyYQXeWFVy74YxCQMWZoRQCT0gX74hqiMoLl9mr7tQaezkALvChOJyaKwiFQ2C+4OIrTj6S2fdxg3WoxhcnABwIe4kJyGsWY17+EJyelkKfy3KpJ4kf3xcCuYU2qFNq40UAT2w28jKoVU3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4583.namprd11.prod.outlook.com (2603:10b6:208:26a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 16:49:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 16:49:27 +0000
Date: Tue, 28 Nov 2023 09:47:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <ZWW3S/8D+8PvuC/u@DUT025-TGLU.fm.intel.com>
References: <20231127141125.2913415-1-riana.tauro@intel.com>
 <20231127141125.2913415-4-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231127141125.2913415-4-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR11CA0074.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4583:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb23eda-33fe-48e1-9b30-08dbf031fbc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ifiLxwak/W5lHcBExBYLLa8+fazm0vjskAlI2VLbaN4ADw3pkrPes/s61M3OUIExXTmE1mhY8FvEQlrel629GJm3BDfifnw9vKE1kvmreUKEti5/k/eMBqQpnmt9xFZcb2uym9rBp3CqMNfvEb+Gz1sFa4EDL7/R+7C3Z6C59ooO8VwQPSSuR8JpstL9FKCxbQeimZomUoQYdJGY05LS5yIMX9MOt1Ck+SY5eXkl5u717qRCNlrjzjgkDVPuM4u0CX3zYf3BmBfD4RFv3hbxIFtmctD3EJAOjzPU0q5nw/L4TxWVu2dm0vAYqgm7nxUp/7SOGklra7ptunrjluQmvKAIEMjQbPOffBJf2+WZSBMIvacY6jv0DcFzyoyw3DuExDsU74H2S1Ify/IVH+PLwyOZljX2VW1D4aGt6WLUlj9p5ZbxoUjH8Tsm4Id02LHai0xBBO5T1BHYkvFmwd9YyAv2i6km5pJp7YG1fnnLV7H68mTR1hJMSLBMdFczyg0sjBlEPgFiJDyEDw9lNpxLWPh27uAudt1ptvaKLbSycN03JjTxFvQUfRZoCGZuwc2F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(39860400002)(396003)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(38100700002)(41300700001)(83380400001)(5660300002)(82960400001)(26005)(2906002)(86362001)(66476007)(44832011)(6512007)(6506007)(8936002)(6666004)(8676002)(4326008)(6862004)(6486002)(478600001)(316002)(6636002)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lCJ7LkMcdhDeLsxF0XYs5e0xhHeMDjg4AATQEa8K/msdVE0FhkhwQn90HqrN?=
 =?us-ascii?Q?KNG/onNO1taaiVYf4B9vp87zvUB1KITJJh3ubvQbcR2TcT8BrBsWmvsD5xw7?=
 =?us-ascii?Q?U44RWBPfU1TItnCCzUBHCMs0LQOdZyIgvfMjuXpXXbewdOUxE0AI/STwKS6V?=
 =?us-ascii?Q?0ydXPlsv2pjjh+PKnyK9xj5CO362G0e3HLheQHXIvcuQWOVPLy39fyIaa0TY?=
 =?us-ascii?Q?BSK0YSJrDMmb5rag+hAWBDADfZcGR0cG3b5bWisX9bzftrBzw6Xbs90tKjGz?=
 =?us-ascii?Q?8BxYhEseuC36qh8XijZG9yUphEMnnzXqc5CW4tKx9c5u0nVbbBelLsHplBDU?=
 =?us-ascii?Q?A7LEFc24XAp6B6qRzPZQv11wwfv8XJGIrVXrE9l3kkZIEk8+CYymykQKPf3w?=
 =?us-ascii?Q?s+1BwK+P9l8yIlM5Z3EjMlZ3i9s8Q64z/diu69bMgbW8lYaSvsLmy3okesuc?=
 =?us-ascii?Q?GkwL47z3j29/GHiVrsuG+rt/+VlblCpwjdETLziwzFEnLfP/FcmMfS+oGi6F?=
 =?us-ascii?Q?EBc0jdD5WT+7eLozkn+m/gqx4ZK32OEeq72gWHvgf3kSy5veqfW132vwWvL3?=
 =?us-ascii?Q?J7HL6Rzs2UPSRLwGXV0Q1FjgWKBPWyCm1SjLZeQfKuyAspE0arwrPAfRqNgN?=
 =?us-ascii?Q?kVMNN0ktm3QpSZehGWzv47BflB6cTc38MB1mZEMl083vSsYr4CzkJR8IpQmn?=
 =?us-ascii?Q?2O1rl79KLR3pCtYbFO6uCC+z1tvH1rv0dHfhWsdFFF/XIGGpJbEV7U3BWKYn?=
 =?us-ascii?Q?E6bQR+YCMplIXd03BLudmp2BsdFDVmKFvNCVni9kDcVReQDzanzsDxtuFrxh?=
 =?us-ascii?Q?F4ml3Us170SyIUSW2+ndzXlQHBftkUugUyMZKasE4HmAeddhGjsA5hjrWVPo?=
 =?us-ascii?Q?f4Z+RCeHJQcWcyUAD3ldwU7y8H4b+P9PEgBDOqunVaHdIoVWXykf+5kDSB+j?=
 =?us-ascii?Q?MvIBTran9SmVXo5vuOipCrE0N8K8ohiDoUsO7EZo2Cvv3dcKcFguLGaZiDNz?=
 =?us-ascii?Q?V2nYEy3mFisBU9zss4f8Ov6hVb1n1a7tALrjD+tmq4bKsVOOtF8g2z+/ZN5a?=
 =?us-ascii?Q?9Uuhwjh8eovbgtfLyehwFBiUT+g4iSxHx15KdXFX68p1OBkFnA8JalQh/Wjg?=
 =?us-ascii?Q?j0/hYTlNkJRlPPCtoitzWmPIMUQT2NWUBQQTinJOExLMZBWqNLdzeZUryIPE?=
 =?us-ascii?Q?t5iIGp3D7zpjpyE7MyXq7I8NfrvIItWpZrmp+u8aj6BmACNxtwgl5Tz5kuJw?=
 =?us-ascii?Q?MY+uFlfIU8tY868yhBmzpvrvrabR+ASWDGXXCTUOF1sg5XPc7e0uM5tAj66H?=
 =?us-ascii?Q?9yxzTONWuBrlnK9VLevMl6vHOogt4wrrj4nePgAAdPaFIlyj8kz5zwKGzzQ9?=
 =?us-ascii?Q?BiIpRPOZFP5SYMqunI9nYZZNdtrIsVqjIqMEieicyJDf92RYWjOebm9EdfSC?=
 =?us-ascii?Q?mXvzdYYNcJfjeHmp2Fnk4FhUO7vfNIYbs4+yiC2oxYdtk47rHp0qF7ZMiFpE?=
 =?us-ascii?Q?eoWLJ14Pdmyiqot+bmZn50Tv3HQ3OZmakZqC/kVAmZcjbq802WrQUfaTg5HW?=
 =?us-ascii?Q?FQz1TZMVeKWKJZQ6Tfi9g4r4zjrBjBQwx2KG0JLev7jVjjFwVz3W7gHD5Bba?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb23eda-33fe-48e1-9b30-08dbf031fbc9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 16:49:27.4558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /U8ZJ+LfniIv0Xgm4Zx0jLdiQwKpj8A1ZMlEVKpm4+BgTyn117rlRY8emJtPCmQbT3Jw5wEus05XqlLndxosXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4583
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/8] RFC drm/xe/guc: Expose engine busyness
 only for supported GuC version
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

On Mon, Nov 27, 2023 at 07:41:20PM +0530, Riana Tauro wrote:
> Engine busyness is supported only on GuC versions >= 70.11.1.
> Allow enabling/reading engine busyness only on supported
> GuC versions. Warn once if not supported.
> 
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 29 +++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
> index 92b37e55fa08..611bafd14d1a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
> @@ -22,6 +22,23 @@
>   * engine busyness ticks (ticks_engine) : clock ticks for which engine was active
>   */
>  
> +static bool guc_engine_busyness_supported(struct xe_guc *guc)
> +{
> +	struct xe_uc_fw *uc_fw = &guc->fw;
> +
> +	/* Must not call this before the submit version is determined! */
> +	XE_WARN_ON(guc->submission_state.version.major == 0);
> +
> +	if (uc_fw->major_ver_found >= 70 && uc_fw->minor_ver_found >= 11 &&
> +	    uc_fw->patch_ver_found >= 1)

This doesn't look correct. e.g. on Version 71.0.0 this function would return false.

Matt

> +		return true;
> +
> +	drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
> +			 "Engine busyness not supported in this GuC version\n");
> +
> +	return false;
> +}
> +
>  static void guc_engine_busyness_usage_map(struct xe_guc *guc,
>  					  struct xe_hw_engine *hwe,
>  					  struct iosys_map *engine_map)
> @@ -79,6 +96,10 @@ static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
>  	struct xe_device *xe = guc_to_xe(guc);
>  	int ret;
>  
> +	/* Engine busyness supported only on GuC >= 70.11.1 */
> +	if (!guc_engine_busyness_supported(guc))
> +		return;
> +
>  	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>  	if (ret)
>  		drm_err(&xe->drm, "Failed to enable usage stats %pe", ERR_PTR(ret));
> @@ -103,6 +124,10 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>  {
>  	u64 ticks_engine;
>  
> +	/* Engine busyness supported only on GuC >= 70.11.1 */
> +	if (!guc_engine_busyness_supported(guc))
> +		return 0;
> +
>  	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine);
>  
>  	return ticks_engine;
> @@ -126,6 +151,10 @@ int xe_guc_engine_busyness_init(struct xe_guc *guc)
>  	u32 size;
>  	int err;
>  
> +	/* Engine busyness supported only on GuC >= 70.11.1 */
> +	if (!guc_engine_busyness_supported(guc))
> +		return 0;
> +
>  	/* Initialization already done */
>  	if (guc->busy.bo)
>  		return 0;
> -- 
> 2.40.0
> 
