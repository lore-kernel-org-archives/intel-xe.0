Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738C4C6FD1D
	for <intel-xe@archiver.kernel.org>; Fri,  7 Apr 2023 04:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8BD10E14D;
	Fri,  7 Apr 2023 04:11:43 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A0110E14D
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Apr 2023 04:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680840702; x=1712376702;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+4NOfnNCKkwYHSa2W6/3bEruJoV9cfv5A4Z1HZQrHG8=;
 b=BPbs8QUkq2NsoHtmfidzCbhvD/cRcnhRslqyhhhIqgf6Qnat0VG7d1xv
 PIOBjDmagP+0TFIGoCHXPdEev6c+kdyg7EOlaGxVj4L1l8XwNdB3kGscZ
 S4nJxt8/cg5DFrBjzm4FKyUzU6qqqPtexB1891ML4zAYnCWipQO8GhUME
 TvAoRkJ/u/70tBEb3E76RpOx39G8hT3GepSmnXQiy/z4Sghhm7s1JRRaU
 Wx5W0p5Y4mzQeJySCFCTtzwO3j0EIbEiZ30NzEQObrCO+PGW5BZWxNpkH
 ecGaeXSnjHeukpOlABVwXX4z7eUI21IxvB6S1tDy9gLF87VD7nar4WQmM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="326993813"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="326993813"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 21:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776725002"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="776725002"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Apr 2023 21:11:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 21:11:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 21:11:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 21:11:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U49J1tJlYXKbBJ423o9Dd/LjH102IgIy7M2iJZiseAkbKlJKSPPW2pjhW+blpmeL2onuB9jJCZoh5fYiU1mhX7eYG/DYet2Bg0eHhOu7zPJOR1ESNtgsPBLnuHGAc2mMt+qfF4lQcwzdWrdaORClhB1ZAyFvz2uCSJL80gdr0zIKCz+7Qg9eHB93jXbfmOH08F9+xEEe7z5LNC+wOpCuRTHlnam+eJtg8bc+DyvQa3a8cmDmzMKtGVI/u0YwVTtPxg1pcjsSboOT3AZ0gV5v1x7D2oUsfO8x51wO1AsuJtA+3lI6JW7ED6tiIpwtubcvFc/lJPN8PfQ6d3nCOGyx1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMi8uMJdt2qXzdtCv3yhLZez8ezpF0L6uOK6pMIR6zs=;
 b=M7zmIIdELQpj4XGuOac2eZrxN3edvC7jKTaz/sptV4X1MGrvXDndFm1WORzIUT5M0y66hgFiRqDTg0djTiq44pK+Jc6PYKvou+28U4TxjPfzHgPWtK2UEWTXanUctV7yxIMUanTTngWami3a7LBUqs6TlRsl099+ejpqoznYaVtQny28m6Ypf7AQF5K9M1UfRb3ldJRmLUcroGS/g/R6vWhKkRP00AXOAxxvGhV6W7YSUyVR6eC/kNTLB6Z9HhpFdxdPU6pOMDTgfDfkcYn4l8KsMztJR4O+l0jvgJuwSm+ZX52dSmEzTIxQhGyC0Ib3TD5J17nU2fUCEZiFvKnBsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5767.namprd11.prod.outlook.com (2603:10b6:510:13a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Fri, 7 Apr
 2023 04:11:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Fri, 7 Apr 2023
 04:11:38 +0000
Date: Thu, 6 Apr 2023 21:11:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230407041136.j6dxbyyeds6a37ps@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230406235621.1914492-1-matthew.d.roper@intel.com>
 <20230406235621.1914492-7-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230406235621.1914492-7-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR11CA0086.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5767:EE_
X-MS-Office365-Filtering-Correlation-Id: 33bf3fef-a4c2-47f0-9632-08db371e2f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kKsoE/BcKTqjI/PtKqnRkhvJqrJuGXGz/H+m6+qmhi32JUdgSKMeXr1LnDxHFl7eaMTcTuYdZnVDGs2lj34v6rdI5pPNL6V5iJqDy6oCey0oHVRlgZY4pn3V7Ms3bLsGcTHmvgAm8GRop+UmH3E9+NXjQGYtedNfwJlWbTE32ckoPJ4FFbYXlNu7np51sICZhFOEwojnbXTr7yO0kIJRL2X7DFmKjY8tzF+Jh8lPoLYXZL8G+lLjjfrocCVS5imzhDX8qrzJiLytWkwJkHSR9MyOlIdumwqjtaEUj5Tb5zclsUIRwT+QF6q9nnTXmHx9LHeV6eQsUaW2s617ihZfF2O31YiG7NT3m4YlV53GVMqpaoshzZdidAnDmQlC9+bgpLELSPg3SIQYC22UCCDq04Wp6nevMg6qgG292AOi+7RxybQye6sz2mLlDYLGTRg1s6Lv/+3dHGYVl2LhVQegjacbzhKMBs7Y0gAis/Q6oEh46OevbL/LEPhGnNnOx0fkDEjqpMSFOHaT6qrgteFSF+WOiL0jFVYGru56TtGwRu/WI4v+Px6xq4jjwcheyfY1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(346002)(136003)(366004)(451199021)(38100700002)(6862004)(82960400001)(8676002)(66476007)(41300700001)(66556008)(66946007)(5660300002)(8936002)(316002)(4326008)(478600001)(26005)(2906002)(86362001)(6636002)(83380400001)(186003)(1076003)(36756003)(9686003)(6506007)(6512007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LeOU3Qzw3mT+KroeYCN5+Ux9cGqI6SEZrCX7fLjVDKMwPtDlcwKgnx/QFYm/?=
 =?us-ascii?Q?wvrbw4QmeisOHfwtBRnxZHFW/LPHhVAl7kpRSQAOjJDJX8P0PhDhGxmsvU4y?=
 =?us-ascii?Q?cRGqu1lX4z2C4GfDUebaWzG9DMvYL4UzcQIQ6jpIyNw5tY8RSiaQ/AJHyQCU?=
 =?us-ascii?Q?U4u2L/WPg6333+S6qV9QQDi/xG3SJDIGqGqnJkCifNON/LBd2e2Dwim/vXqg?=
 =?us-ascii?Q?jGk59soCGP2HGKIm4r9CcMq1fn6jkmZoADhxEVmJozq3h3AoEwZ+jhCY/SVs?=
 =?us-ascii?Q?r1026/TUFAlTYt3Ff3RiR1ZEW980mLCGW597Trh7slJJSV33JBobtTMKhJ31?=
 =?us-ascii?Q?Bbp330BbShqDJeSP+1svcotbWNvQ5uDc9piPmd4cISXvYss0ye4pQfdnoChz?=
 =?us-ascii?Q?k9xshtGia3qSxlYXr21Y6D/Kprpm4142AvkDDHhXjQ+PA9IMd8YXT9JP41ko?=
 =?us-ascii?Q?fSYaGaH3ZhC7PEw0ctJrsIh6SectokJ5lXsSG0ZM0t1JATaziuugTQKWSTX/?=
 =?us-ascii?Q?jBpBYPeDb3ujjAYbZSBDmZ+oscqRIibg0yU13VPG0r3PehN/qXHRQAZ4i8kR?=
 =?us-ascii?Q?Uz5tKZWNDop/W4c84DVVy9qBrYmBo7ehq9+4fyiUI1xlVZZWtYIRm9GorPOU?=
 =?us-ascii?Q?c6nZNp74sKMDWYWFmacABojbjat0VC/DaJ9I26NF7sB/P1pRCVjdYzB4QPGv?=
 =?us-ascii?Q?wxQ6ErOLaV3sAarU32/20e0uImLC+iu6s3+IiuoLdGPPh6smquSmbqeNfsEC?=
 =?us-ascii?Q?NzM9KHKcUJxWna/ENNn8AbwjfJuPUdAEuaJZyUc8d/N7BQsugg9QX2TLJfBf?=
 =?us-ascii?Q?VG/Obva7s4NsTkIXaf1yHuoiLW5u4i7OTcW/ynCzq2qgsQZ9l26c3WXFghq9?=
 =?us-ascii?Q?We71BFaTJ1N3qjUpWPVWQ01c3CuuYeRjZJjWdmEdfIYmX7omyXnO0ncZHhfQ?=
 =?us-ascii?Q?+ktec4vGQx9dYxsoSqAe/0D1F6IX8flJkLy6VBYf6GswkegiWRcUATsvhgS7?=
 =?us-ascii?Q?81xl2OC9HvCDiw52vTt+t7ovgM23y5a05BqmSEMqMA0HSuKELcbt77eltkho?=
 =?us-ascii?Q?cyOWGoxyDZ/EE2DQLb2YzTk6aYML26c3yDHQSVFdmX/Vgr3yNtke+Mf6VAIY?=
 =?us-ascii?Q?UQ42/2SmC+Ta8/3awHphFTdS8TtDxsVlBgVyilYWf2jRMHiXDzIl4GP5vwbg?=
 =?us-ascii?Q?xjNizS3cVYVQh4wF/Vp/bGDisjPNRTxEfWddjwZ6C2/w5P3fcbsOpbH05eLT?=
 =?us-ascii?Q?jHE4OyIn4x6DlmplmUKZGuuNV9s+F+lBNyLr9bRo5UhEoxjKzRp76mFsHYcd?=
 =?us-ascii?Q?hq9gF/heUgHjXO626J7Z+yksU278rADizSl4aQ//ogARKFSNUDPhi+odfmff?=
 =?us-ascii?Q?p2fyUYmmcdunN6/O8Mv3mtMSzaitrhg5r8Q1QSzcLOKzBuyi/MfjkqHfh4/8?=
 =?us-ascii?Q?6YK4dDw9WQo46zLhsLtwbbC97ex2V0LqcIlWczY8dXCRM/45CghEMOY1l+WO?=
 =?us-ascii?Q?16ERDhgDowLIE9B42W58lXKWAQDYI8bMfp915nSM8pu3EZDX/fVYJlwIdQhq?=
 =?us-ascii?Q?4AX0sNO2paj0Om83M794575oj+xyqG9v9nGctqK1dLrFOo/us5YaxjKFMTyS?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33bf3fef-a4c2-47f0-9632-08db371e2f4b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 04:11:38.7015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKbU5Xj5MB0jJ6Ac/9YqHU2nroYPIw+v9EJJdSepefcn4aNzLX38SEyxE8FftRUG10kOCmR9UfgPUvWghA7Xl38NGVN8a9ePSnVAH3C3rXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5767
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 6/9] drm/xe: Add printable name to IP
 descriptors
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

On Thu, Apr 06, 2023 at 04:56:18PM -0700, Matt Roper wrote:
>Printing the name, along with the IP version number, will help reduce
>confusion about which IP is present on a platform.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
> drivers/gpu/drm/xe/xe_pci.c          | 21 ++++++++++++++++++---
> drivers/gpu/drm/xe/xe_pci_types.h    |  2 ++
> 3 files changed, 24 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 6fb53a54913f..f5399b284e3b 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -57,6 +57,10 @@ struct xe_device {
>
> 	/** @info: device info */
> 	struct intel_device_info {
>+		/** @graphics_name: graphics IP name */
>+		const char *graphics_name;
>+		/** @media_name: media IP name */
>+		const char *media_name;
> 		/** @graphics_verx100: graphics IP version */
> 		u32 graphics_verx100;
> 		/** @media_verx100: media IP version */
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index a5456788bca9..4442fb58202e 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -75,6 +75,7 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> #define NOP(x)	x
>
> static const struct xe_graphics_desc graphics_xelp = {
>+	.name = "Xe_LP",
> 	.ver = 12,
> 	.rel = 0,
>
>@@ -85,6 +86,7 @@ static const struct xe_graphics_desc graphics_xelp = {
> };
>
> static const struct xe_graphics_desc graphics_xelpp = {
>+	.name = "Xe_LP+",
> 	.ver = 12,
> 	.rel = 10,
>
>@@ -101,6 +103,7 @@ static const struct xe_graphics_desc graphics_xelpp = {
> 	.vm_max_level = 3
>
> static const struct xe_graphics_desc graphics_xehpg = {
>+	.name = "Xe_HPG",
> 	.ver = 12,
> 	.rel = 55,
>
>@@ -114,6 +117,7 @@ static const struct xe_graphics_desc graphics_xehpg = {
> };
>
> static const struct xe_graphics_desc graphics_xehpc = {
>+	.name = "Xe_HPC",
> 	.ver = 12,
> 	.rel = 60,
>
>@@ -139,6 +143,7 @@ static const struct xe_graphics_desc graphics_xehpc = {
> };
>
> static const struct xe_graphics_desc graphics_xelpg = {
>+	.name = "Xe_LPG",
> 	.ver = 12,
> 	.rel = 70,
>
>@@ -151,6 +156,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
> };
>
> static const struct xe_media_desc media_xem = {
>+	.name = "Xe_M",
> 	.ver = 12,
> 	.rel = 0,
>
>@@ -160,6 +166,7 @@ static const struct xe_media_desc media_xem = {
> };
>
> static const struct xe_media_desc media_xehpm = {
>+	.name = "Xe_HPM",
> 	.ver = 12,
> 	.rel = 55,
>
>@@ -169,6 +176,7 @@ static const struct xe_media_desc media_xehpm = {
> };
>
> static const struct xe_media_desc media_xelpmp = {
>+	.name = "Xe_LPM+",
> 	.ver = 13,
> 	.rel = 0,
>
>@@ -390,6 +398,8 @@ static void xe_info_init(struct xe_device *xe,
> 					 desc->media->rel;
> 	xe->info.is_dgfx = desc->is_dgfx;
> 	xe->info.platform = desc->platform;
>+	xe->info.graphics_name = desc->graphics->name;
>+	xe->info.media_name = desc->media ? desc->media->name : "none";
> 	xe->info.dma_mask_size = desc->graphics->dma_mask_size;
> 	xe->info.vram_flags = desc->graphics->vram_flags;
> 	xe->info.vm_max_level = desc->graphics->vm_max_level;
>@@ -493,12 +503,17 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	xe_info_init(xe, desc, subplatform_desc);
> 	xe_display_info_init(xe);
>
>-	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx100:%d media100:%d dma_m_s:%d tc:%d",
>+	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) dma_m_s:%d tc:%d",
> 		desc->platform_name,
> 		subplatform_desc ? subplatform_desc->name : "",
> 		xe->info.devid, xe->info.revid,
>-		xe->info.is_dgfx, xe->info.graphics_verx100,
>-		xe->info.media_verx100,
>+		xe->info.is_dgfx,
>+		xe->info.graphics_name,
>+		xe->info.graphics_verx100 / 100,
>+		xe->info.graphics_verx100 % 100,
>+		xe->info.media_name,
>+		xe->info.media_verx100 / 100,
>+		xe->info.media_verx100 % 100,
> 		xe->info.dma_mask_size, xe->info.tile_count);
>
> 	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
>diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>index f4bc5ef1bce3..e479c1c4ed30 100644
>--- a/drivers/gpu/drm/xe/xe_pci_types.h
>+++ b/drivers/gpu/drm/xe/xe_pci_types.h
>@@ -9,6 +9,7 @@
> #include <linux/types.h>
>
> struct xe_graphics_desc {
>+	const char *name;
> 	u8 ver;
> 	u8 rel;
>
>@@ -28,6 +29,7 @@ struct xe_graphics_desc {
> };
>
> struct xe_media_desc {
>+	const char *name;
> 	u8 ver;
> 	u8 rel;
>
>-- 
>2.39.2
>
