Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C88CD1284
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 13:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE5510FD2C;
	Tue,  2 Apr 2024 13:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8B5EDG5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAE110FD2C
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 13:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712064435; x=1743600435;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ULtmJmswHT/kOQdXyVOwNqvJVIYwnA43ftZ/bnCvlDo=;
 b=i8B5EDG5GP/0a66uC3HELo4iyq57rUWTqjOu8Ns7uXyKX1qKE9ujJVk9
 gzlQpGoaQaMb4sGoUM7X4pPwDmOfazSNsQ+BBJXpoVe4VnXAcFbSYAQ4e
 GdYOW1DCp/lz47zG4nUstSL6RvKtVNzfSpcRp3QSImGygQ2f7VHJI5D0X
 pA+kQh9n1qgTKDqtDAhX1c0jY8qQcj9V5Cz/3HYWNuPbQkJGkQ4nUM1Cp
 Idgf2S9oqqq7n8yjQiLV5OD6Gja6XbtkQ0tmNfsHFlxCb3Fy8jJ0IqcIm
 0TK5RXUlzowmv4Xoeqy3KDNjOsPML11chICND4MP7H4xnY892+luiepjx A==;
X-CSE-ConnectionGUID: Z/XkmNeKT4CDyk0ZzrIrNw==
X-CSE-MsgGUID: diYTAJcYSj2aLMQ6VNqOdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="11053152"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="11053152"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 06:27:14 -0700
X-CSE-ConnectionGUID: EbmetItBTIOju2wZMfnDDQ==
X-CSE-MsgGUID: EDADVQ7dRAOqJQAXyBysrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="22517894"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 06:27:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 06:27:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 06:27:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 06:27:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzWeuYkqb52Q96CNsaxsALriLH4T7Z2gI6hPSYu6ExNBfP/d/GUDmYx+aORAti9NnGHuOjRgNc3607KEHELjawyqYD6hvrkNEW7oZ+tFoZRj82O3KmYXzLp9aYoTd1nxoQEYfGE7iuNk8QRpDJP2xDhhNmBzTzebkFOceJVevFDdh0PwymvX5jMbdO2LEJiNvOJ9nezK70BlyAPP4unB7tHVuEBdvNNnCHeQZANkXJGN+Yk6i8VMFVDgjZx/gcgvAn97UKGhBnc5yzxAI7SE5TQFAt7NvDtaToaM9wAqdBKdkuzykp7YyWOsuPUFjdq2nHBTjpi7ZbW4Cg+4G7RVGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBFq+WlTzTDQwQa6hg/VbDFuGCw4U+T9STw6bKn3IHc=;
 b=Ka1kz6kQhSg73jDTMlaPNfPL+axih7JOkHX8zEK8PWzEPzTgqOaSui6pVQllNe3VMyT1JAL3tTVHj4qKJBCTY/yXZtJEvW6z2UBSiBaRM3kcND6x6a66MreSXefT1ZJvpCTi1zTdfWPtvHH2S72bpAkU19BliElC/yrBINJ+hOwdzCfLE0AHOFx1dcLaIPTjHAV8xfuZVG2IXO+QRerapObX2tVwKXPeXqJthXdUq/ujBtPGQt0Nn2nJwzcUOZLXb1pnGkq1u/Liw45p2Uno2z+dKrI2TIBm7AkAy06CGhBBqXz+KdClmELFR5cej4MIhzyLuHiXGxmuxeGRTt25OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4753.namprd11.prod.outlook.com (2603:10b6:5:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 2 Apr
 2024 13:27:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 13:27:11 +0000
Date: Tue, 2 Apr 2024 08:26:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 03/11] drm/xe/bmg: Add BMG platform definition
Message-ID: <lgrb55zjh5ylbxa743xjzjyyrsvd5m3v6j6uddylpyobnzf52s@mtfwapfxordy>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
 <20240402124724.1238122-4-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240402124724.1238122-4-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4753:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ol8PdtE95c3NsRmFmc1vf6/25s543+3TeKLWpNXyzrMuh6g/jQcqJ1vJT1sAbCqX92aOXy/ahrhAjhK0XiWTegZjnPvv5mGm0HlxPqcggkcdbIjax4CEbYpcXJ1Q3JTvOvPAdFAzn9omsQ44UvSFG4cCIdHf8TU1hJq0h23Qx66cMIRVWUe/lnblV9spEFeiqHjzsW2Yh8XwZiJRmpNH7H8m7FytEHtmK8+lS9xVoBzQc1kVOrEuYj0lJ5lEHRjC0tALamJ8f8LjsZkXDEr+22jf+6itKT7EIHosGsNrwqM4Obw3K2S0d0v2kQqTfGPNFlXxDPoFmuU6RReIMmDBLX6igdnxtM0SuA/eF1VvoIvHnGFr/LH5KbQcuaAJrFvOOlitZeHMVYt5FDuFfgkHH+72cVf0sv0FxDwUX5AFMjQnAhlnvYb5nURLXyMC2VMFEL394xJZriJcAAye9d0gwFupjwEZNhpEuII2dcjreXZvH+W6DDJbKu3aMmSkHB2AkstH3yhm9dkkCT37j30R7hIu3TIImJ4+prX8ot//K9W7Kn15iF+csq75nCt7KgZf4u6hgsb/GgJrWKMhF3ajQpHIRstiFs8kI8/kOdxYFzUKgbuiBNn2SGoGJqrulwCFESx3bhKc1pEBg2KGe7D8T3DuRwz0yQUZcZtg2Li40ftCsWhTVrXDJx2rTaCcvzDPPNqIqqspDq+17GP4TcW3LA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(27256008); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CBSIkJ2PfN3f+vdyRPa6gX31jgOjdPjb/VzvUkFjRAMmiAipGGJTDeoGI9MD?=
 =?us-ascii?Q?LgjqYnD1hN0cZIlePp4g2xpjtFlEw3OK/nftJwPG6ap7CXPlMi05jcU+BwqB?=
 =?us-ascii?Q?8Y/XRx5vpMx1PDpdkyFc5sE0/kvVUzMOJK4YLb76WiRgENMsY8c+oITe8waO?=
 =?us-ascii?Q?m0zI2UffcA9LjslSpfXAt6+XSSgzCaquTOK054UHzFriivdYh2M0U8ktkhV/?=
 =?us-ascii?Q?JMzsgV6l2PI6drTxhdAK8x9azU5fmrDgVDK9SQp8+x9af8aAfI3cAb8UCpxE?=
 =?us-ascii?Q?coeWzJDW/QXGh7DJE8iHtRr+/HPZziizB5QmPNP/NxIE2xsLbK8nD0WFOZbZ?=
 =?us-ascii?Q?cQUvJmYWVTZ4d0z73VRL/Z5upIi69z+gTDwC9gHc1fRiC0BgOUBvryuFiFBp?=
 =?us-ascii?Q?56lu779f6TA71j7AlO/2ygoNBmCzkkPDyF+eRmdUz+rJG/PA9Y0A7cdM0ehc?=
 =?us-ascii?Q?ll3S1aZEkkr6P2vmK2jlJ0Pnj1kpUtU+HZRWQvunIwlIdRCb5DfZ2u4Cn87E?=
 =?us-ascii?Q?7zMMmrBmQpeQCR1iex8XpyKluyVkEDMnBRk51kLGDJvE0i0gO5BsmA49kRq4?=
 =?us-ascii?Q?TbkFux68QlZ76uoMDZNkEm/kU82afhjxVqSXNZcNIV3kryYrWMemLT8dkv5n?=
 =?us-ascii?Q?9yPLzjlqNf8zhLPzNKl2QH2bURXGaFrmYeZmK0XF5koxLhxzlBmE2RQYUWX7?=
 =?us-ascii?Q?HzyNPiPEIDqdl2wyvI+tXRyx8787OCEgYGsC/ch8BPuDK9uc8lYyomE+2kyz?=
 =?us-ascii?Q?NLLOhaLyfDji32n9OCu2l3B4uVce/h9UDpBblSYk5VNpg9/o3rtfmD38YZTr?=
 =?us-ascii?Q?X4R8JqVpCoXpF8R34pfBqSWswGvMPs2LqQfcazeFnRPR7TGNWRM2w6/WnG6Z?=
 =?us-ascii?Q?a4Rx0YGch60oYaE4LqWfrqXazO3hCR0mHjwuc7GpqiRkLtUibHyFYGo1qlvQ?=
 =?us-ascii?Q?qkzNnHpzoK9QIXTZXMQqkTzB6JvlOkazQGEYB1RRn3Eo+/e/VdPLRzhaQUTy?=
 =?us-ascii?Q?CPUHjGHrmFG3tcaRbfquycO3DT/7ine3SGMws7dsfyEOZIh0P1mo8v/6nAQs?=
 =?us-ascii?Q?FYhbUdEBSZOiFKnifgmgalFrBLuzeyyKPo2go8sv9sbspodZL8Dm5xJQGLg9?=
 =?us-ascii?Q?/1sCJq8s7i/vol44jfg56v61sfAokaRwEuc9uOobkleYvKHiF5YiI7n5Czjs?=
 =?us-ascii?Q?RQud5ZE+N/cp/eeh8wEWLhcn6TWbpFH5SndtzqxbdfI4ytWiCTscjSY3jdA3?=
 =?us-ascii?Q?lJ2dS6eoUAkBASoAN76VPYnFTuXGsoR0H+3513ID75+BcH1W+LVOEOhTtHVl?=
 =?us-ascii?Q?py0nwHU6ODmSFyZQpDcQOTJX6MgUrWHEmJjlvyDE1ura28xsh6VWzV6JkIPx?=
 =?us-ascii?Q?f3yYi4+Y9FAhEd/GkTI8E2/kkKwLCFa6UL5+IIIA/z9msuM5ePo6cW/yjC/k?=
 =?us-ascii?Q?l8c8sOeBs2Y0rHKEQyXg8p6fkdfop9PFdesTjmhS2wjrRJHbKpwx227EENL0?=
 =?us-ascii?Q?vXYomCOZZq90d++QEtlDqMBR2ziNIw+P+dNBPCWHYuBfNrTlTbFR2DkQZlMs?=
 =?us-ascii?Q?QJo/EdGfpdIsmFK6f3IKuBSxbey3YBcOoBw0bvGoMckATEf52B8iLvoDt8As?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 366c5702-091e-4e75-b2bc-08dc53189a38
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 13:27:11.3009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SmKn7PptMM0UZtj7cFzxCBUPdEFPXx8vipK8OBg3VODXoNk9MMrpzZZ/1XhvR05UWFbwkz/DCBQ8W2yOtDb6nPA5GBpJI5Cf1AHwvyu4lUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4753
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 02, 2024 at 06:17:16PM +0530, Balasubramani Vivekanandan wrote:
>From: Matt Roper <matthew.d.roper@intel.com>
>
>BMG is a discrete GPU based on the Xe2 architecture.
>
>Bspec: 68090
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c            | 7 +++++++
> drivers/gpu/drm/xe/xe_platform_types.h | 1 +
> include/drm/xe_pciids.h                | 7 +++++++
> 3 files changed, 15 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 2d3b18d6404e..1e3a81a19e9d 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -337,6 +337,12 @@ static const struct xe_device_desc lnl_desc = {
> 	.require_force_probe = true,
> };
>
>+static const struct xe_device_desc bmg_desc = {
>+	DGFX_FEATURES,
>+	PLATFORM(XE_BATTLEMAGE),
>+	.require_force_probe = true,
>+};
>+
> #undef PLATFORM
> __diag_pop();
>
>@@ -381,6 +387,7 @@ static const struct pci_device_id pciidlist[] = {
> 	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
> 	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
> 	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
>+	XE_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
> 	{ }
> };
> MODULE_DEVICE_TABLE(pci, pciidlist);
>diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
>index 553f53dbd093..79b7042c4534 100644
>--- a/drivers/gpu/drm/xe/xe_platform_types.h
>+++ b/drivers/gpu/drm/xe/xe_platform_types.h
>@@ -22,6 +22,7 @@ enum xe_platform {
> 	XE_PVC,
> 	XE_METEORLAKE,
> 	XE_LUNARLAKE,
>+	XE_BATTLEMAGE,
> };
>
> enum xe_subplatform {
>diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
>index c7fc288dacee..73d972a8aca1 100644
>--- a/include/drm/xe_pciids.h
>+++ b/include/drm/xe_pciids.h
>@@ -208,4 +208,11 @@
> 	MACRO__(0x64A0, ## __VA_ARGS__), \
> 	MACRO__(0x64B0, ## __VA_ARGS__)
>
>+#define XE_BMG_IDS(MACRO__, ...) \
>+	MACRO__(0xE202, ## __VA_ARGS__), \
>+	MACRO__(0xE20B, ## __VA_ARGS__), \
>+	MACRO__(0xE20C, ## __VA_ARGS__), \
>+	MACRO__(0xE20D, ## __VA_ARGS__), \
>+	MACRO__(0xE212, ## __VA_ARGS__)

I see that in LNL we tied together the PCI ID addition with the platform
addition.... but I wonder if it wouldn't be better to stop doing that,
so we first add the platform and keep it not binding to the driver until
it's more or less in working condition.

Lucas De Marchi
