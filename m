Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE8BC7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 22:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A6F10E298;
	Wed,  5 Apr 2023 22:19:36 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C3E10E298
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 22:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680733174; x=1712269174;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YV6VhWP1kOiOy51BELKzvVZIstJIjSz7lK6tu0GNVxM=;
 b=k2uxLsSPweJZpAnXb6a7tT7gVuaf/yPF/zvqegSq2Fo82nGn3wobbPrX
 hkzDxEqpdysEZVZK/kefX3qftcI8oxAKWJLSP9gfMhfvglv/7u8HM4fjm
 L/pY3CxDnMpg28GKueXRfr/elYd3AqvgjQfIGgvQ3dCYc0NBGtfcEzJAr
 /GFpduPBLxT6aDecQqHOuln0NfHnAi/iom9IabOLxZm1X2WhdI9QXUMJQ
 Y54iyWsCodFt4+k7CdKjtNVvDpmiEnxZ3h0FLShFyN1ZIMHZq6EH8EpJA
 w9tZtQX9divr+rIgvt5heq73aAi/KZPm4H0xG5uycCNU/sKCHDE+6KwqH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="344313674"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="344313674"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 15:19:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="932993693"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="932993693"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 05 Apr 2023 15:19:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 15:19:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 15:19:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 15:19:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 15:19:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEj0dCfpUAwC6SIc2j3oYbblgWkLHwvivvxQXGn+iPvOoDoEdcx6N2Quvz8cX4Vg6B7b/hp86alk8r8Bv+tA75MWFV4Lcj+uMc4ZFX2bWJa7WYxVkwHJvoMfKjHsd0ajfNDZ5qIS80wAknft6i1jh7TQolNQZiemQDz2U0V8iVg6ytt2sOmIwZtbZ9o4GBJlb5XL7FUzJKAUXj1fU8vuhWvefZ+yQW5YU7MHHyMSJRXv/Gh4GsU/eHJVsFoMpZfK/NzObQ69vASdQsR4oErTj6Dl2ZV6Pxrxv/VEDiS20BHQbHsrZCLUR1LGv/Vs84IxETqKFfDZLkm+RRqvHMC1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrQPqi+/Ae8gu3ypLy3Dkib6gKiJTLifUIAJoex+23M=;
 b=PNGIgedwALUaN+G2o1NksCmhkrE4PeOa7TLuUNTZOq0YbYJZp/jk0yvOb7aEQ+nACvgGollY5By18p6BZVmcOW/50iARkIuVA37Jwl0OQpOIehOCPDZGw+lcSPbBAiDgWvBuzjkPqsrkDgKm154VcAL7gliqNVvKoMHJ5kM+Ez6mtC4cTK/oCzoDd0U2AfO2QyrW0OwJrhlZkkuHKNZMeIEQFOdt7wNXCvTE/oK7wailX2HXx26wlN4DZhx+tPMEdiwp0bn5nmgbT3heSOAH70bQiCF44lFea0PnJURhR0KNwMoG1+eqvM73SGB4g7fmfpdbK8qB34onR46ozF14tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6346.namprd11.prod.outlook.com (2603:10b6:208:38a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Wed, 5 Apr
 2023 22:19:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Wed, 5 Apr 2023
 22:19:30 +0000
Date: Wed, 5 Apr 2023 15:19:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230405221927.b5td2bstvuyq4hdb@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
 <20230403201702.996400-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230403201702.996400-5-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::38) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: a57570d3-950e-49a0-50f6-08db3623d2fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XNundiQVXF4xfZV13601ABJ/UOhAaEuV+hz7BmdgB6EKiimYPpvcgL6D+yGJTVpc6i5c9tEJFf1W93meb9l22VrRdRTFEM3G6SnwkzwtkXuMfPJ2AM6NxEQ1mOCrYSM4v+ApnA43MnowcjU0mEzjILYkeErhmecIDVpSo8vb9/SR+xyq2C6sGSuLsp7ZmxLWtZrTtXokIuW9biTpTo629CctdQ4jV8s5wKSvEsnEUe/IBWX4OmWzsWxEmz/9julYJ11tQny38WmwdykcfqIUo4KbuPYhp1yOdQ/T29QrPKxEQ9El+aK6MpGT0d/IreyP4sOgA1dItELZxCkzL+FiwDRUSFKKqUh0FTIexhnLK7UAVzs6bmvacr3L0nSrHnWnv/lNO3bDjwG++TUAmaxZi0TV4ClMngHTQYP8cVeaoVLj6ulf+/fsP8oXyIDu3XJ086sfEqRQWXrzCODO/DqxTSMwJfNCRtGaDNEHfPrp2cUKA05ft7VZOno8fs4bRuwUDz4awH36x6u3S9Sys18p11tohC164X7ohvkYbUhCGI775OzIv8XfXYp5OEo0aJbo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199021)(1076003)(6512007)(6506007)(26005)(9686003)(6486002)(186003)(83380400001)(6862004)(6666004)(8936002)(5660300002)(8676002)(6636002)(66476007)(4326008)(478600001)(66946007)(66556008)(41300700001)(316002)(36756003)(2906002)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+cOojkccXyp6qeYRUBQqVzUigOXxfYt7KZDRxHDg+b028OdzA0RYwhEIRyTh?=
 =?us-ascii?Q?z9vghnki4T028WuD5en99j9aLtL6ti+wfGOR5V4WB/XsbFLkbH4cdoY6TuB8?=
 =?us-ascii?Q?UCmy21pqv3sltRGq2nL7Yvb7xWkTN7U0gCHyINe6MQLanA5wNM5ELJoRSVLd?=
 =?us-ascii?Q?y6SgDYyyv54yMOKEbsWlT5ubVllSUuGCRH4ltVUBEuGcRF5AXiHgH0ZZWSe+?=
 =?us-ascii?Q?ygf2efCtmqlWQnagfyN1BBf/mDkk9rJqIrgaGLFy6osO/Ba6e7IzBHGOrmnl?=
 =?us-ascii?Q?jdVjNKroVenAFAAikMplcgN+WhmqI/2aUYsvHaNG1pXkhvg0MeF5rJlMCgzr?=
 =?us-ascii?Q?F4byGrElyX8s3UN2smJpJI/+pryyOlUXBlU/tgClTSI7L0n8YBYPNydfbLCX?=
 =?us-ascii?Q?gpuQQrZt64zfC0GjLtcS/nU1bBjRjrQavf6w1jYc24FWHtlOsyQH5G5nI5y9?=
 =?us-ascii?Q?OkqPGQrVuk8HiiRa+bJGFrCP/V/pVr/IsQwziFHgfYOzIGRcdUJNfM+4XPCH?=
 =?us-ascii?Q?Vs6jZQfT/ggkNWF2DQBlxlWPdqx3753YTH6uM8RCntwjc0VBcd8CG+Xxxg5O?=
 =?us-ascii?Q?eMJjMT9f2YwobPavNM6IlF05dCUNbb5OmflcDyUcwVNMtkSGwv/eWsGAP4rQ?=
 =?us-ascii?Q?8aUCkuRR3FZ9m4r37hmaVeeZEJ7tuEqzd0Wx4fdkA4yG3x2juJvQwTlcVJKT?=
 =?us-ascii?Q?C6NUBxtqPeXfZVqDP1Do+/CS7X/ZcwTn6jSnkU6RMWynED5E+q2zLU/VggTk?=
 =?us-ascii?Q?QKZyHQfbAElRPezvqMkd1hzsnVvvHp+ZvasDZCKn1yBUhsvOfZUfUTCZDF1g?=
 =?us-ascii?Q?nKKvHNG0hVaOz2vH57pl2IgB9o/LvoMDCW3uxb6f3kHKomovlvq6u/9VqaEg?=
 =?us-ascii?Q?CkvHeDayJEpVpbktNGeDKc3eX/xDITpRowv51Td6HBq1+pxYLBFbVXY5Zduo?=
 =?us-ascii?Q?m1PO3rvIlLqRjzKumu9HdpZy8hu+7mHj2Ya8OUZwO8qjzXp4Y+0TX7IexkAg?=
 =?us-ascii?Q?pcVLLhaTWjEE1J9BfuZbzR2jZf9LTBrCSxbSiNJSuI/N3PLIWwWorCuCfeYF?=
 =?us-ascii?Q?EAWOU98V5KWDwEv2L9K/EK09mVEUbsig4MOA15hkTojIWJUePDfkDG/+N+xF?=
 =?us-ascii?Q?xCulW8Y/pD9HtxiDv4j0MdhvEwOhaQc+bAhreMd2iS5QEXCigF7i28Qgt6nh?=
 =?us-ascii?Q?o00nDJA+KwoG5WmaF6lFwbqKWp/XvFJvw6F5o/hWBBv+MbI56JX5Emw+J9TQ?=
 =?us-ascii?Q?PSM+wl7C4Ferh0TSgz7HSfDzwP4bUdqKbDK2xEkNVG/QpjvIEZneaCfocVq3?=
 =?us-ascii?Q?tdv+DrYpi0vdQEWa3YwTaRluguQ/uFvBPA3hZXfxgTXltjYHD3SSA7IQ2R9P?=
 =?us-ascii?Q?ovsOY0aRDT3JuDDVl0AL0iTXdtmHXGnSbLQ66sh5PXr8cCluRf2AQAEf1lo9?=
 =?us-ascii?Q?fYtQ7dN4ejhA6lAhdVyNkcqNM6CEWZOlp+wfXGXeed5vOXaxtM8qugJipCVp?=
 =?us-ascii?Q?6fnGnk9rUAr8IdOtcQd+MvloE+MUYal088thU88jwfmOAMw3CO7YdTPCcs91?=
 =?us-ascii?Q?3G3wpHa8F3Yl7dOqUuvhXo/tdvfdIgo/0Qe+hy4FT+LbaN8rxbWNAxjH/8Df?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a57570d3-950e-49a0-50f6-08db3623d2fe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 22:19:29.6453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwvD2lUYJC2UpNSzhdrZN/kK/rXVmVlJTF/Mx8zLC18TPpI4ZQBY714riVk6Iit9jD5Gzs2KyYsug8waa6/9k//76tQUSd9K5WKuePmW9Lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6346
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/6] drm/xe: Move engine masks into IP
 descriptor structures
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

On Mon, Apr 03, 2023 at 01:17:00PM -0700, Matt Roper wrote:
>Break the top-level platform_engine_mask field into separate
>hw_engine_mask fields in the graphics and media structures.  Since
>hardware has more flexibility to mix-and-match IP versions going
>forward, this allows each IP to list exactly which engines it provides;
>the final per-GT engine list can then be constructured from those:
>
> * On platforms without a standalone media GT (i.e., media IP versions
>   prior to 13), the primary GT's engine list is the union of the
>   graphics IP's engine list and the media IP's engine list.
> * Otherwise, GT0's engine list is the graphics IP's engine list.
> * For GT1 and beyond, the type of GT determines which IP's engine list
>   is used.

we probably want a kunit test to check we don't have unexpected engine
type in graphics/media GT?

>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c | 97 ++++++++++++++++++-------------------
> 1 file changed, 46 insertions(+), 51 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index ba56f92c3c5f..3e7e57254a6d 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -37,7 +37,6 @@ struct xe_subplatform_desc {
> struct xe_gt_desc {
> 	enum xe_gt_type type;
> 	u8 vram_id;
>-	u64 engine_mask;
> 	u32 mmio_adj_limit;
> 	u32 mmio_adj_offset;
> };
>@@ -51,6 +50,8 @@ struct xe_graphics_desc {
> 	u8 vm_max_level;
> 	u8 vram_flags;
>
>+	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
>+
> 	u8 has_asid:1;
> 	u8 has_flat_ccs:1;
> 	u8 has_link_copy_engine:1;
>@@ -61,14 +62,14 @@ struct xe_graphics_desc {
> struct xe_media_desc {
> 	u8 ver;
> 	u8 rel;
>+
>+	u64 hw_engine_mask;	/* hardware engines provided by media IP */
> };
>
> struct xe_device_desc {
> 	const struct xe_graphics_desc *graphics;
> 	const struct xe_media_desc *media;
>
>-	u64 platform_engine_mask; /* Engines supported by the HW */
>-
> 	enum xe_platform platform;
> 	const char *platform_name;
> 	const struct xe_subplatform_desc *subplatforms;
>@@ -101,6 +102,8 @@ static const struct xe_graphics_desc graphics_xelp = {
> 	.ver = 12,
> 	.rel = 0,
>
>+	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
>+
> 	.dma_mask_size = 39,
> 	.vm_max_level = 3,
> };
>@@ -109,6 +112,8 @@ static const struct xe_graphics_desc graphics_xelpp = {
> 	.ver = 12,
> 	.rel = 10,
>
>+	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
>+
> 	.dma_mask_size = 39,
> 	.vm_max_level = 3,
> };
>@@ -123,6 +128,11 @@ static const struct xe_graphics_desc graphics_xehpg = {
> 	.ver = 12,
> 	.rel = 55,
>
>+	.hw_engine_mask =
>+		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>+		BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) |
>+		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
>+
> 	XE_HP_FEATURES,
> 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
> };
>@@ -131,6 +141,15 @@ static const struct xe_graphics_desc graphics_xehpc = {
> 	.ver = 12,
> 	.rel = 60,
>
>+	.hw_engine_mask =
>+		BIT(XE_HW_ENGINE_BCS0) | BIT(XE_HW_ENGINE_BCS1) |
>+		BIT(XE_HW_ENGINE_BCS2) | BIT(XE_HW_ENGINE_BCS3) |
>+		BIT(XE_HW_ENGINE_BCS4) | BIT(XE_HW_ENGINE_BCS5) |
>+		BIT(XE_HW_ENGINE_BCS6) | BIT(XE_HW_ENGINE_BCS7) |
>+		BIT(XE_HW_ENGINE_BCS8) |

note for future: we could maybe use GENMASK()?



Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>+		BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) |
>+		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
>+
> 	XE_HP_FEATURES,
> 	.dma_mask_size = 52,
> 	.max_tiles = 2,
>@@ -147,6 +166,10 @@ static const struct xe_graphics_desc graphics_xelpg = {
> 	.ver = 12,
> 	.rel = 70,
>
>+	.hw_engine_mask =
>+		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>+		BIT(XE_HW_ENGINE_CCS0),
>+
> 	XE_HP_FEATURES,
> 	.max_tiles = 2,
>
>@@ -156,16 +179,28 @@ static const struct xe_graphics_desc graphics_xelpg = {
> static const struct xe_media_desc media_xelp = {
> 	.ver = 12,
> 	.rel = 0,
>+
>+	.hw_engine_mask =
>+		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>+		BIT(XE_HW_ENGINE_VECS0),
> };
>
> static const struct xe_media_desc media_xehpm = {
> 	.ver = 12,
> 	.rel = 55,
>+
>+	.hw_engine_mask =
>+		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>+		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VECS1),
> };
>
> static const struct xe_media_desc media_xelpmp = {
> 	.ver = 13,
> 	.rel = 0,
>+
>+	.hw_engine_mask =
>+		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>+		BIT(XE_HW_ENGINE_VECS0),	/* TODO: add GSC0 */
> };
>
> static const struct xe_device_desc tgl_desc = {
>@@ -173,10 +208,6 @@ static const struct xe_device_desc tgl_desc = {
> 	.media = &media_xelp,
> 	PLATFORM(XE_TIGERLAKE),
> 	.require_force_probe = true,
>-	.platform_engine_mask =
>-		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>-		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
>-		BIT(XE_HW_ENGINE_VCS2),
> };
>
> static const struct xe_device_desc adl_s_desc = {
>@@ -184,10 +215,6 @@ static const struct xe_device_desc adl_s_desc = {
> 	.media = &media_xelp,
> 	PLATFORM(XE_ALDERLAKE_S),
> 	.require_force_probe = true,
>-	.platform_engine_mask =
>-		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>-		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
>-		BIT(XE_HW_ENGINE_VCS2),
> };
>
> static const u16 adlp_rplu_ids[] = { XE_RPLU_IDS(NOP), 0 };
>@@ -197,10 +224,6 @@ static const struct xe_device_desc adl_p_desc = {
> 	.media = &media_xelp,
> 	PLATFORM(XE_ALDERLAKE_P),
> 	.require_force_probe = true,
>-	.platform_engine_mask =
>-		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>-		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
>-		BIT(XE_HW_ENGINE_VCS2),
> 	.subplatforms = (const struct xe_subplatform_desc[]) {
> 		{ XE_SUBPLATFORM_ADLP_RPLU, "RPLU", adlp_rplu_ids },
> 		{},
>@@ -216,10 +239,6 @@ static const struct xe_device_desc dg1_desc = {
> 	DGFX_FEATURES,
> 	PLATFORM(XE_DG1),
> 	.require_force_probe = true,
>-	.platform_engine_mask =
>-		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>-		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
>-		BIT(XE_HW_ENGINE_VCS2),
> };
>
> static const u16 dg2_g10_ids[] = { XE_DG2_G10_IDS(NOP), XE_ATS_M150_IDS(NOP), 0 };
>@@ -235,12 +254,6 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
> 		{ XE_SUBPLATFORM_DG2_G12, "G12", dg2_g12_ids }, \
> 		{ } \
> 	}, \
>-	.platform_engine_mask = \
>-		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) | \
>-		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VECS1) | \
>-		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) | \
>-		BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) | \
>-		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3), \
> 	.has_4tile = 1
>
> static const struct xe_device_desc ats_m_desc = {
>@@ -259,22 +272,10 @@ static const struct xe_device_desc dg2_desc = {
> 	DG2_FEATURES,
> };
>
>-#define PVC_ENGINES \
>-	BIT(XE_HW_ENGINE_BCS0) | BIT(XE_HW_ENGINE_BCS1) | \
>-	BIT(XE_HW_ENGINE_BCS2) | BIT(XE_HW_ENGINE_BCS3) | \
>-	BIT(XE_HW_ENGINE_BCS4) | BIT(XE_HW_ENGINE_BCS5) | \
>-	BIT(XE_HW_ENGINE_BCS6) | BIT(XE_HW_ENGINE_BCS7) | \
>-	BIT(XE_HW_ENGINE_BCS8) | \
>-	BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) | \
>-	BIT(XE_HW_ENGINE_VCS2) | \
>-	BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) | \
>-	BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3)
>-
> static const struct xe_gt_desc pvc_gts[] = {
> 	{
> 		.type = XE_GT_TYPE_REMOTE,
> 		.vram_id = 1,
>-		.engine_mask = PVC_ENGINES,
> 		.mmio_adj_limit = 0,
> 		.mmio_adj_offset = 0,
> 	},
>@@ -286,27 +287,17 @@ static const struct xe_device_desc pvc_desc = {
> 	PLATFORM(XE_PVC),
> 	.require_force_probe = true,
> 	.extra_gts = pvc_gts,
>-	.platform_engine_mask = PVC_ENGINES,
> };
>
>-#define MTL_MEDIA_ENGINES \
>-	BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) | \
>-	BIT(XE_HW_ENGINE_VECS0)	/* TODO: GSC0 */
>-
> static const struct xe_gt_desc xelpmp_gts[] = {
> 	{
> 		.type = XE_GT_TYPE_MEDIA,
> 		.vram_id = 0,
>-		.engine_mask = MTL_MEDIA_ENGINES,
> 		.mmio_adj_limit = 0x40000,
> 		.mmio_adj_offset = 0x380000,
> 	},
> };
>
>-#define MTL_MAIN_ENGINES \
>-	BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) | \
>-	BIT(XE_HW_ENGINE_CCS0)
>-
> static const struct xe_device_desc mtl_desc = {
> 	/*
> 	 * FIXME:  Real graphics/media IP will be mapped from hardware
>@@ -317,7 +308,6 @@ static const struct xe_device_desc mtl_desc = {
> 	.require_force_probe = true,
> 	PLATFORM(XE_METEORLAKE),
> 	.extra_gts = xelpmp_gts,
>-	.platform_engine_mask = MTL_MAIN_ENGINES,
> };
>
> #undef PLATFORM
>@@ -486,14 +476,19 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 		if (id == 0) {
> 			gt->info.type = XE_GT_TYPE_MAIN;
> 			gt->info.vram_id = id;
>-			gt->info.__engine_mask = desc->platform_engine_mask;
>+
>+			gt->info.__engine_mask = desc->graphics->hw_engine_mask;
>+			if (MEDIA_VER(xe) < 13 && desc->media)
>+				gt->info.__engine_mask |= desc->media->hw_engine_mask;
>+
> 			gt->mmio.adj_limit = 0;
> 			gt->mmio.adj_offset = 0;
> 		} else {
> 			gt->info.type = desc->extra_gts[id - 1].type;
> 			gt->info.vram_id = desc->extra_gts[id - 1].vram_id;
>-			gt->info.__engine_mask =
>-				desc->extra_gts[id - 1].engine_mask;
>+			gt->info.__engine_mask = (gt->info.type == XE_GT_TYPE_MEDIA) ?
>+				desc->media->hw_engine_mask :
>+				desc->graphics->hw_engine_mask;
> 			gt->mmio.adj_limit =
> 				desc->extra_gts[id - 1].mmio_adj_limit;
> 			gt->mmio.adj_offset =
>-- 
>2.39.2
>
