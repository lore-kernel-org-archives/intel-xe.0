Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1073EC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 22:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70F010E6CB;
	Tue, 12 Dec 2023 22:43:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC04110E6CB
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 22:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702420996; x=1733956996;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eqGW/+lD7jSjAvfGcX8ScAg/O52Wg3r5vh3txCbwm1k=;
 b=AOGDRGBMw2y9bmmqxSdExzpWahGSCaNJNGfjOsNHioaxDs6ffLotvHLd
 /0PJeQ4zJd5+2u3uoPQIDBx1yjmCDyHmgVWeMp4tw603KEq4jyOFJ3qBw
 J49prXKSWpMRHM+s0keG0FD5k7r5k3IdUWHfh/lIpCBH95DRe8UoK+e4R
 sOMiWKszudTWQe7RdWvSDyWmTKq9EfWH+Bkv4BVlWWGFecTY12YV+hPp6
 rkZlI5iAykY0FcQddz78NM0PBpBmDTpPvftcMthKdWK6ij8/tiliOjzCN
 DsIuw0Y4lINJeyyhBNiS7p4f6y6u+h5YHtRtdxhKZ1H7PRFvnilwZNVjq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="13574897"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="13574897"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 14:43:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="802639599"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="802639599"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 14:43:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 14:43:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 14:43:14 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 14:43:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWlEmfZvEGydu7R6L9U3tfHZKWgjhq50XXA8kjjOGSR8lce0/41fORSwiC00tFudKz6Z5nZrLtT052dKmAKod5Ax7GFLgivmsZthW5dg5Zxj8enCpBoI4yfiPNdTuL06llJETdb3e1OsQU0H+UzCi6GkNzb6zi+ag+bCExrIf+5tY8LHrfxzzaIUvGFRWf7KGT0KPSvsY403Z0S7pKYntwa5sLq7g3BxHt3qsm2xn23GTRVhAmNF+jDZXVOFzaA3pyvjcLwg8/qHNXr0cZnuJ3LN9/L01l5jOh4Mv96pyYTJOz4HNArsncLlv/CwQAovmyWva+UqSG/oZGwK3Wli+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixjnbXzWzAKgm58OIl2lboyuZOMGvHfb0501sEtJrEM=;
 b=d0w3eVHEBAAdOnGKLIpS9KL5hjxoi4uA92yYqC2AAGj1erqtfcAqv7Mz6LTRBqyWKA+GdaKxq9PkUAw0QSTplI9lrGWGQoWPByBZyPEQFzfsXHm4J9Rz2QNHOVj6OQz7mupR7YoRJRFkjmQ2Y2UoMFJZ+8Ot2M1jPXeMLsa2OyN0phLKecg9bVz9fWN5/v773KP+cD7xMSHH30X3V/t+HPhvdgcHFYlta/Yj8lPEHAqXv1mUOrkS9yCNDRQ41CBQ9yUOs+AP+/5ZfPnjS2eVF0imtX53od8my+eP6+/7ThngQg0g+rAhYQIxjrgxSe3ZRicixfM1D0Jfl5xRehOT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5119.namprd11.prod.outlook.com (2603:10b6:a03:2d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Tue, 12 Dec
 2023 22:43:11 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 22:43:11 +0000
Date: Tue, 12 Dec 2023 14:43:09 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 06/10] drm/xe: Define IRQ offsets used by HW engines
Message-ID: <20231212224309.GM1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
 <20231212210054.1747-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231212210054.1747-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5119:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c997429-fb63-4511-e841-08dbfb63b841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VOvqCeZChdCW3EVioeeSHzotAvAYg96RJbY0+FPhKjUbcfRIRgZJoRAZKgV0nQsXvngaAi0l6BSsvSJmZdF91OFGCuNYLqY22zMPfZD8ucEku287OIOV1rpLewhBpZ1rFWGlEGS5CuuPpGCfPuhl1tFMlZOAHUYJKwYPi+K9bDFy2Oy4JQie/uk5nYJiGHy4u0DuDTk7PN5fPwz1rXQg0/E7QBoA9+QX2ONqGolfbQmhnkkkBBAv30QLmSI+FcnCvH7iQXZmkCrbT3iH1MV+H9Q/FCIyfLzVSAy6RdOAnUy9AM0mY0cVwq/KSFVAgWsdER+RtRDvwuEo3+K5HB8IV/UsHJGgdVmbqYJbk1zEYrRdj5V8R06pJORLFIpK+pyfkbpGq/HBmkjTmQ2Iw1MQLxj0wQ7o5mn18mRC5zyX1dn0VfQNFUwgUopCId5mpWNkeMXuav1aemNG173r7wClFsDiAyFGnhvo2rWOVJ6taEREPI4YqldlCIknRmSK8lgasaG+f8J2L3CZgx1guPqqrLM9c+aztS5OmyiXD/94HeRaVxF4hu38RjJzR8wWTbvX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(376002)(39860400002)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(33656002)(38100700002)(5660300002)(2906002)(41300700001)(86362001)(82960400001)(1076003)(478600001)(6636002)(6486002)(316002)(66476007)(66556008)(66946007)(26005)(6506007)(6512007)(6862004)(4326008)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/q6FBKLw1+g/NWc+di0iBGqZ9NL9lxKq2NyV6B/HRXse6E0c6heiDl6aJ5t1?=
 =?us-ascii?Q?+dMqrvsuKeLGVBs6yVb1yNRaXmC/ZH1zJwTndMV3F2YH8SzhYpYsAGMSvo2I?=
 =?us-ascii?Q?vzpy0X268Ca/hAOniVHjht0CvvccwS7Dx7y5KhFGr9BGsDRydWsAEsO2s5V4?=
 =?us-ascii?Q?7LUCbd+Hc4nbcT/VPItdpvUvG7fEctQ6ct0KCZ3uyBpfkLmYNeitF2pFZdNX?=
 =?us-ascii?Q?XmVI+BbWAcKWmgEycwNnwwD9Ea+MjcAQEh5JsdVOSjIwetNYCuiVAz3o6+yF?=
 =?us-ascii?Q?iBCn5T9mFFE9XrSO94a0iNYyTWXwD3XZOB4VMbYoy+WtbDWRo5I1fCTTwpQ4?=
 =?us-ascii?Q?5xwoPXZIPJbgMqja4TAXYFPjczB6NeurO895h5AdS8GVBE3ltpGG51x4rqW3?=
 =?us-ascii?Q?B2BQzjerIWqLMXzWsnfEgdn9+dNhkHXiki6JF9PsFmXfy9+yEmosHPRcVNcr?=
 =?us-ascii?Q?eoPj/fepn8c7t7x0VHjFrqJIjjco3xkug3fbqtt5QueWB2oK8EEVS9VsgFdv?=
 =?us-ascii?Q?iNAhqqeHsoiJtaPmkF5BpFuj57jzPQb9cgXoLaWbO5dJmNr2NiCw2egFt60d?=
 =?us-ascii?Q?5IdfePY/deMGV3RtendA84FAa3n7o4KDM1WjXM65Fv652NFlN4CrpUeP6OPR?=
 =?us-ascii?Q?w+sp7WIj9adEQjmdfuVPQm6LCTXT/JgPC/X3YF3SNN03LMw+izA3XJKrpPZ2?=
 =?us-ascii?Q?OzXUXmYGJKL8llNIh8EnBPxX9Bn7JIXF6nrM0IO8oZxYT/YRBxxFSH2A6yAy?=
 =?us-ascii?Q?BQL88LoRZkuSjnqCvUMxkx2NRHX1faTCHj3gOsafmYj0Goyr6MJ0jvN0pZ0f?=
 =?us-ascii?Q?36mu+nz7HJVtFgfctq/vzswRS7SREYGjDj+z6hQaQGDdcBXQq8ieXOk9dcSD?=
 =?us-ascii?Q?UmN6HrGfonBvU5UTcR6QUXgki/N0Ii/BWQo62QPRShh4Tb5JjNeMZ9G6tkjN?=
 =?us-ascii?Q?cRKUPpmLkVa0PU15q4lTgo3RDuuVEQTkOCQmwZxZjjrZJJ0Y7R+UZbhTutmN?=
 =?us-ascii?Q?KRwjcieuLvhSnzJjWKuaU27AvU/RiRQudWzTjv+KyeMX94N4g6LHE81tnLdt?=
 =?us-ascii?Q?cVDIvERusFviq6DZzeFoMb1KKRKoABQOkLN6UWaOnnmcB14NDjp0V0j/YQRU?=
 =?us-ascii?Q?IzT0Q/LNRCJxOyiMvfCODZM0xqtO2ULOJnplQp+MooRcKSEp1ciNR1r8UNJU?=
 =?us-ascii?Q?MsJcoD+pDSLX4bI/dhMMnFpSHF3D43Iu/e6KtJnc5gzc8XGJ57+OaKadjd6i?=
 =?us-ascii?Q?GFOxHemMJQh4MPj1TIzILMgWI/VS70kbNXVigW6MR/77w3OUlcrp7mv+wPmD?=
 =?us-ascii?Q?2PV5si+HlctlEJzITgR/9LM3EC481Z9G3d03AFsxb2KSPMcLmwP45mFB04QT?=
 =?us-ascii?Q?1SyADKUFnMGxjiEM2v5CCGf3lIgPYzOBkC7sUWMCxwJkYazx9hjIuYr4RXq5?=
 =?us-ascii?Q?YwGGLNW2SEVJV3z+NFbnIJtyEtcg0t8DOogdnPZG5vxxT1ZHlCkGjO0nidqt?=
 =?us-ascii?Q?eLePlu0xGNhWNyAn1cmIlsMPMp23b8z/mEucgOX//AG43gqG4/6P+u6buV7M?=
 =?us-ascii?Q?J30i3reSmRlto8SbPBhSMR5R2F1TyFIYrW1lAS/KTsiAesCkx5UQa2kXWd+b?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c997429-fb63-4511-e841-08dbfb63b841
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 22:43:11.6297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s5CAweNkEYuVSYUFG/iLUXPaDNDPn1wqsO4evJVaypqIiQ82AW7BH2nkJD89Ekg8YeK8/Uq0GvKQ5iWqDAoIxHUnF0vKPcAN1KR5AEDi9K0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5119
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 10:00:50PM +0100, Michal Wajdeczko wrote:
> When interrupts are delivered using memory based mechanism, engines
> will write status to the report page at the offset that corresponds

You might want to say "offset (in bytes)" since otherwise it gets
confusing as to whether we're talking about bits, bytes, or dwords.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> to their interrupt bit from the GT_INTR_DW register.
> 
> Add engine interrupt offset definitions to engine info as we will
> need this to process memory based interrupts.
> 
> Bspec: 46149, 50829, 50844
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c       | 28 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h |  2 ++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 86b863b99065..ca35b1768a8a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -35,6 +35,7 @@ struct engine_info {
>  	const char *name;
>  	unsigned int class : 8;
>  	unsigned int instance : 8;
> +	unsigned int irq_offset : 8;
>  	enum xe_force_wake_domains domain;
>  	u32 mmio_base;
>  };
> @@ -44,6 +45,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "rcs0",
>  		.class = XE_ENGINE_CLASS_RENDER,
>  		.instance = 0,
> +		.irq_offset = ilog2(INTR_RCS0),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = RENDER_RING_BASE,
>  	},
> @@ -51,6 +53,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "bcs0",
>  		.class = XE_ENGINE_CLASS_COPY,
>  		.instance = 0,
> +		.irq_offset = ilog2(INTR_BCS(0)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = BLT_RING_BASE,
>  	},
> @@ -58,6 +61,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "bcs1",
>  		.class = XE_ENGINE_CLASS_COPY,
>  		.instance = 1,
> +		.irq_offset = ilog2(INTR_BCS(1)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = XEHPC_BCS1_RING_BASE,
>  	},
> @@ -65,6 +69,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "bcs2",
>  		.class = XE_ENGINE_CLASS_COPY,
>  		.instance = 2,
> +		.irq_offset = ilog2(INTR_BCS(2)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = XEHPC_BCS2_RING_BASE,
>  	},
> @@ -72,6 +77,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "bcs3",
>  		.class = XE_ENGINE_CLASS_COPY,
>  		.instance = 3,
> +		.irq_offset = ilog2(INTR_BCS(3)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = XEHPC_BCS3_RING_BASE,
>  	},
> @@ -79,6 +85,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "bcs4",
>  		.class = XE_ENGINE_CLASS_COPY,
>  		.instance = 4,
> +		.irq_offset = ilog2(INTR_BCS(4)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = XEHPC_BCS4_RING_BASE,
>  	},
> @@ -86,6 +93,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "bcs5",
>  		.class = XE_ENGINE_CLASS_COPY,
>  		.instance = 5,
> +		.irq_offset = ilog2(INTR_BCS(5)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = XEHPC_BCS5_RING_BASE,
>  	},
> @@ -93,12 +101,14 @@ static const struct engine_info engine_infos[] = {
>  		.name = "bcs6",
>  		.class = XE_ENGINE_CLASS_COPY,
>  		.instance = 6,
> +		.irq_offset = ilog2(INTR_BCS(6)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = XEHPC_BCS6_RING_BASE,
>  	},
>  	[XE_HW_ENGINE_BCS7] = {
>  		.name = "bcs7",
>  		.class = XE_ENGINE_CLASS_COPY,
> +		.irq_offset = ilog2(INTR_BCS(7)),
>  		.instance = 7,
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = XEHPC_BCS7_RING_BASE,
> @@ -107,6 +117,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "bcs8",
>  		.class = XE_ENGINE_CLASS_COPY,
>  		.instance = 8,
> +		.irq_offset = ilog2(XEHPC_INTR_BCS8),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = XEHPC_BCS8_RING_BASE,
>  	},
> @@ -115,6 +126,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "vcs0",
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 0,
> +		.irq_offset = 32 + ilog2(INTR_VCS(0)),
>  		.domain = XE_FW_MEDIA_VDBOX0,
>  		.mmio_base = BSD_RING_BASE,
>  	},
> @@ -122,6 +134,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "vcs1",
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 1,
> +		.irq_offset = 32 + ilog2(INTR_VCS(1)),
>  		.domain = XE_FW_MEDIA_VDBOX1,
>  		.mmio_base = BSD2_RING_BASE,
>  	},
> @@ -129,6 +142,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "vcs2",
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 2,
> +		.irq_offset = 32 + ilog2(INTR_VCS(2)),
>  		.domain = XE_FW_MEDIA_VDBOX2,
>  		.mmio_base = BSD3_RING_BASE,
>  	},
> @@ -136,6 +150,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "vcs3",
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 3,
> +		.irq_offset = 32 + ilog2(INTR_VCS(3)),
>  		.domain = XE_FW_MEDIA_VDBOX3,
>  		.mmio_base = BSD4_RING_BASE,
>  	},
> @@ -143,6 +158,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "vcs4",
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 4,
> +		.irq_offset = 32 + ilog2(INTR_VCS(4)),
>  		.domain = XE_FW_MEDIA_VDBOX4,
>  		.mmio_base = XEHP_BSD5_RING_BASE,
>  	},
> @@ -150,6 +166,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "vcs5",
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 5,
> +		.irq_offset = 32 + ilog2(INTR_VCS(5)),
>  		.domain = XE_FW_MEDIA_VDBOX5,
>  		.mmio_base = XEHP_BSD6_RING_BASE,
>  	},
> @@ -157,6 +174,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "vcs6",
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 6,
> +		.irq_offset = 32 + ilog2(INTR_VCS(6)),
>  		.domain = XE_FW_MEDIA_VDBOX6,
>  		.mmio_base = XEHP_BSD7_RING_BASE,
>  	},
> @@ -164,6 +182,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "vcs7",
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 7,
> +		.irq_offset = 32 + ilog2(INTR_VCS(7)),
>  		.domain = XE_FW_MEDIA_VDBOX7,
>  		.mmio_base = XEHP_BSD8_RING_BASE,
>  	},
> @@ -171,6 +190,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "vecs0",
>  		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>  		.instance = 0,
> +		.irq_offset = 32 + ilog2(INTR_VECS(0)),
>  		.domain = XE_FW_MEDIA_VEBOX0,
>  		.mmio_base = VEBOX_RING_BASE,
>  	},
> @@ -178,6 +198,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "vecs1",
>  		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>  		.instance = 1,
> +		.irq_offset = 32 + ilog2(INTR_VECS(1)),
>  		.domain = XE_FW_MEDIA_VEBOX1,
>  		.mmio_base = VEBOX2_RING_BASE,
>  	},
> @@ -185,6 +206,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "vecs2",
>  		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>  		.instance = 2,
> +		.irq_offset = 32 + ilog2(INTR_VECS(2)),
>  		.domain = XE_FW_MEDIA_VEBOX2,
>  		.mmio_base = XEHP_VEBOX3_RING_BASE,
>  	},
> @@ -192,6 +214,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "vecs3",
>  		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>  		.instance = 3,
> +		.irq_offset = 32 + ilog2(INTR_VECS(3)),
>  		.domain = XE_FW_MEDIA_VEBOX3,
>  		.mmio_base = XEHP_VEBOX4_RING_BASE,
>  	},
> @@ -199,6 +222,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "ccs0",
>  		.class = XE_ENGINE_CLASS_COMPUTE,
>  		.instance = 0,
> +		.irq_offset = ilog2(INTR_CCS(0)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = COMPUTE0_RING_BASE,
>  	},
> @@ -206,6 +230,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "ccs1",
>  		.class = XE_ENGINE_CLASS_COMPUTE,
>  		.instance = 1,
> +		.irq_offset = ilog2(INTR_CCS(1)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = COMPUTE1_RING_BASE,
>  	},
> @@ -213,6 +238,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "ccs2",
>  		.class = XE_ENGINE_CLASS_COMPUTE,
>  		.instance = 2,
> +		.irq_offset = ilog2(INTR_CCS(2)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = COMPUTE2_RING_BASE,
>  	},
> @@ -220,6 +246,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "ccs3",
>  		.class = XE_ENGINE_CLASS_COMPUTE,
>  		.instance = 3,
> +		.irq_offset = ilog2(INTR_CCS(3)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = COMPUTE3_RING_BASE,
>  	},
> @@ -398,6 +425,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	hwe->class = info->class;
>  	hwe->instance = info->instance;
>  	hwe->mmio_base = info->mmio_base;
> +	hwe->irq_offset = info->irq_offset;
>  	hwe->domain = info->domain;
>  	hwe->name = info->name;
>  	hwe->fence_irq = &gt->fence_irq[info->class];
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 39908dec042a..dfeaaac08b7f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -116,6 +116,8 @@ struct xe_hw_engine {
>  	u16 instance;
>  	/** @logical_instance: logical instance of this hw engine */
>  	u16 logical_instance;
> +	/** @irq_offset: IRQ offset of this hw engine */
> +	u16 irq_offset;
>  	/** @mmio_base: MMIO base address of this hw engine*/
>  	u32 mmio_base;
>  	/**
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
