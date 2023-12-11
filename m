Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CFBC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 18:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7397E10E4DC;
	Mon, 11 Dec 2023 18:25:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B309910E4DC
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 18:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702319125; x=1733855125;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AO2L1bhPsn5WYIM/cniIACnw3L+SdrbLgD38adiOzeQ=;
 b=cpd64u1fkhgOT4MTIKLwbpHAfw4GViDojZs6bJyU2eKdpLHsRYBJq6Uq
 u2f9UvtHW8xYB/Dx8Da1cPHnlSxUPkEyiDI0I0m6LK8RxkWJX64ZM6or6
 m3drI/TLikbzG/zS0ssqR+ri0h4MFSZLrW1SAkUFky/6+TwUhlUKM5NnP
 kEMSsm51cBf/dSJ5mgUmFza8l/ekBfuhAQovsqGbP/T8umtLo5ErIYMrh
 fiIaLaVn4nH4vWaQ3+INTa2uhKCGITiLqguhcWSnZs/ZokpeA8kS2PL0g
 DM9JQTgYuzg8pD8PFtfvE6tNEFH5bA7j3RPaVKK/ESuU8b+KGNuzjkJ6M Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1529396"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1529396"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 10:25:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="843597208"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="843597208"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 10:25:24 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 10:25:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 10:25:23 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 10:25:23 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 10:25:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4ZUO7k+8EY/uapoykivymAWdG51ziPiZBFTzVwWj7Tl/wMFO6kXwJEvt1B9omOBb7dHVW/fxYLedWhLCr9clp39PDUVsdnKGPpnQU2cx9rixXnhX/0ILK0k2dNW5nxGc1P0HWEOUUt0vKKx1abwF7hV+NWRbu4VA6RKvzgdHmrLgAJqyK4t0SWDRvcYOa2zHycNHTCDxndaoKWEIgqTDkPoeGdTWHm/U2WwbWs7iCBwq1axhDSQazyK53oNOf18PIxZbUgYFne7NAhRljK4XMqiqp5DEGOEdI7EFyluuB2/XhfkZuO3EkITKF/oHZF2HNx4BqIKiLNqGwfTG6G3xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WX1RDcpQoZAbONKD0UyvFUutm2o8xZutiDoykkMEnwM=;
 b=V4t4WOt5POQS82KHvzeYZ/njOhp2572qeo0ShJzPpW6KLr6Q/lhYEjsR4VNanqVDc08tVQ1K0MdFmvKzMRlc0D00UdmuiNoigSBcVwPWs5yDaV+5ozjPnNCWo2WqaP42KlA/MCPuBIFtk9FoZCOmwmznkwHzy35G5/njGL0RcT3XFmWSkqv8KFvKtA1ZUIHjjmrqo9ZqUh1Vlp2lxdznz5jvNZcGhK9L4va1f4TgcRGlacxWkcrLScp+QmLtxMDIiaiRNVLNQB9qi7oYg8t3xFiQhTgQuWpB49nLSSf+dN5iGlQaRUDb0L9orF9qO8IcrzsHZsBw3SVhFeRulCBTwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 MN6PR11MB8241.namprd11.prod.outlook.com (2603:10b6:208:473::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 18:25:20 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7068.033; Mon, 11 Dec 2023
 18:25:20 +0000
Date: Mon, 11 Dec 2023 10:25:09 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] drm/xe/pmu: Remove PMU from Xe till uapi is finalized
Message-ID: <ZXdUBXamDt5Iry/S@unerlige-ril>
References: <20231209224352.2720403-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231209224352.2720403-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR02CA0048.namprd02.prod.outlook.com
 (2603:10b6:a03:54::25) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|MN6PR11MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ff000f-df0b-4691-cee6-08dbfa768825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7lMZEWft62OwkcqJLL540j3hZYyqtgHn2oGxlzi+ZE+BlzsvE11krxiYZOGBiwNT/Eg969eJ/SxFlAv6hW7DGf5e+7970iwamLKUA4nDSniuNb0PWD4WTBOyzX64kT+sewlGIcb7D+GHzZQlN1VX+vN8Doug15DwtDdQ3mkeiM2oXZwU2lW/rSgWsueaGE70EmVC8QdR2Ey4KTr/tq7+OishgfBxtvpyNO+/RC5Sq2mZEIqX0eIJQWHAt2lyyFmbDonshgoh72n6LM59bKLDXCyOuo/9Zr6E6Fy2L1s5pBS9T/vD+PJeGW/RBUECVDfRfxQ5UhylfYONm6m9+HaeZtJBdXechhu+mS8F8vkXdaYPB8id+Lr0HvW6ax8sKX6KFYngMpggmArHnV6W5B8PUGBYkM9DIDVOzELmNk4j08KoTdb2vo8ZKGe4XG/KNJGgNKjmGU8Aa5FPpem6uGRIzFyCOI9BGsK0xh4yX/IKrpuQP9ZgEJRNISwQkp1LsZccwTuxDfMjY2+5gokrij6gJcy8xe1d8CFTeaSW06Ei+S2QAN233QoxgjCuvIxx3TyB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(346002)(136003)(366004)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(30864003)(6512007)(6506007)(6666004)(2906002)(6636002)(54906003)(66556008)(66946007)(66476007)(9686003)(38100700002)(86362001)(4326008)(6862004)(8676002)(8936002)(316002)(5660300002)(478600001)(6486002)(41300700001)(33716001)(82960400001)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME55cnFvc3ZWSXFoMVZ6N3N3OEdRMHBRSlBPTmhIOEhyRUhXTmFvMklhaUIw?=
 =?utf-8?B?OGlDbjkxcDVCa1NQWWg4ZHdoRFRTL2xnZ3hKeFBhRHBrbXJiVnZXSGNIcmZP?=
 =?utf-8?B?SjJvNkp6UUJ0ekhFY3Z5WWpZVnpxMll1KzllSDdZUXJiU3pad2M4L0JHRGYz?=
 =?utf-8?B?LzZSNzMwM3k1Q1c1WW5BZ3dyTVJTb21GVGNTL2dTWUYzMkljNURjdDdhaURP?=
 =?utf-8?B?Z0tZdE1Ob05BNzR4RWtrSDRmc3JZNDVhWCtTbklTMndialhaWExUN0Q2NlNK?=
 =?utf-8?B?cjRHRUcxWDZlS0JXRDZRSHpkaXlQakZ6bVRVcXpod1dOdE1BZjR6azA5OExI?=
 =?utf-8?B?UlVlS2dLZVlsMElWZEQ1RGZLTHJKOXR4M290cVY4NjQwZTFXYzVRVGJwLzgy?=
 =?utf-8?B?Zk84eE5GUmcwK0VZcllTSWYvbmdhL2drY3RBRm9yWlRHS3d2d0VKRitvc1R4?=
 =?utf-8?B?YTFCVWd1R3pLeVIyYUNzcUpnTGd5QWx1cE1JMG5QSzl2WlI3OEhKVXRvOUhV?=
 =?utf-8?B?SkZxZDhFQ2c3NFpsQXI3c2VySXhpTncwSzRXQmdRbndsVzFiaTlleWM1eCt0?=
 =?utf-8?B?VVdxNldaanBqaFNYeC8yRzdWNUFqbWt2c1hGRVhFUFQvWFQyMXErUUp5Y2xB?=
 =?utf-8?B?WDFxdHc0L3N6b05sclBLZS9IajltcXZZS1NCV25KVE1QeENKdkQzNmVqRXA5?=
 =?utf-8?B?L1E1Z0F5WEQyRmJiRmw1UlV6Vk05eTYrWkxYNFZ1WE8yLytsUk1hQkljQXB4?=
 =?utf-8?B?RERtMVBYdDRVME02Z3dxOEd1Z3ZkbC9GSW4vejFBSVpzbFo2dWlCV0dSRnJN?=
 =?utf-8?B?dHM4c3MxRTNPVEVtUjNFUnJpbE1OVEZPY1ZsQlVRZHBoUDVtOHR0V3JZajdG?=
 =?utf-8?B?a1RrdXhxSG5FTzJYVE0wTWUxc00wajc1dFppN3FoK3A3UWh0bTF6V2VOWUZR?=
 =?utf-8?B?eW13WmY4Ukc5M1IrdGk3V1BpY2ttMUtadG9rU3ZsQnpTRlhTYUpmdWRERkxH?=
 =?utf-8?B?eXhJTlVJenRRMTdtTjFUbE5rb2Z4blo5R2dQWWpGbjBJMmtKOHRWSy9aL250?=
 =?utf-8?B?SjZwbmY0cWl6T3FVV25ybVRtOU5NR1hqckpEVUkxMHEvYXBBT0lWTmY2Nlgr?=
 =?utf-8?B?dGoxU1JFZk5KeU1aRkVaakp4YW9kY2MvaXh6RFBDb0ZNSjRyWU1HbVk4aEYx?=
 =?utf-8?B?ZmROem00cVlkSW5NYzluci9Dd1NNQ3NMNjUxbCtEaWVLanJNQ0htWFF0SGw3?=
 =?utf-8?B?cE1nWFdKNHBIWG9UYklUaHlFbkgxYjJtOTVvajRtWHNtb1BLbEt5OE5CS0NM?=
 =?utf-8?B?MWhFS2creGFaTW0xWE9mbXFXK1VIaGlVZVA5eFhIb0s5TWEzZXZ6Sm4ralFT?=
 =?utf-8?B?MGt3ZmRTTmg3b2ZNRGlaUUw1LytsL21DQkR4bjlsOE1NMmY2bEtHelAwUExo?=
 =?utf-8?B?ZmJFRTFTbUczMmp4YlRRcW05RDZjV0U5OUJDK215OTNGeUZUdmdUdVI3Uk5W?=
 =?utf-8?B?Tzd6U2IvZ2NrS0haKzgzMVRTR3A4ZVdKNVZ4S0YyUDAvMytydHdkK1VRaU1P?=
 =?utf-8?B?LzJqNStqdFZlMERPbnJrN245N21ucTFaV2kycnNRckc5SzFKeisrb3RpSHZq?=
 =?utf-8?B?bVUvNGI2b1dURm9YaldWd3lsb1JtZ3JvWWpQK01LbVhrWmZUTXdRQXh5VjdO?=
 =?utf-8?B?cGZaQVJiRjNvcHpNeHhDOTVwR1QzN1NibFlsZE5rM1Y1TjlITnJIN09RbDdH?=
 =?utf-8?B?ZEd6L0hsaGZGeGtCUWs2N05wNGhJWGxlL3BuOFI2KzJrSGhMZ29YRVR0Y0Zs?=
 =?utf-8?B?NnNseE1vYjV1VTc5U1pWV3ZId3N5ZzMyS0hCZ2d5RkJWRXRpa3NJQlJLaHQ3?=
 =?utf-8?B?WjNpb1dEd1R4SXdLR2RkaHhidmtrVk9LSlkwL0FZZDZOQlYrZnQ1cXg3a3ZZ?=
 =?utf-8?B?Y21iWDF1dFoyRER2a2xKRFBmWFdGdFJpVWdJSzZqd3BGeStnamFtOVNnT25T?=
 =?utf-8?B?VXdwRHZLUEwyZE1pWVYxWklPeWYxeXljS2pwa1ZtWGRheVNZbzQvYnlRcmxM?=
 =?utf-8?B?eVkrK1M1STJYWHVaSkJ3ZGw3TkI5TDI2WURLQThDemlRSlkwOE5CWmE4VzB2?=
 =?utf-8?B?UEJJa1lsOTAxc3lyMnkzWm9QeGZheHI4ekJYbm93NzB5eWE2akRCYkF6Q0NI?=
 =?utf-8?Q?LYmd/5rRXP5x1kXQatzABc8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ff000f-df0b-4691-cee6-08dbfa768825
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 18:25:20.2404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VkGxzZgBxlvrXKj1v4B9tshb8uU9wY1bzFui9pIjU7qJgzStt/8xrglU35A5/3QMbca6EiUgX1Nb4bEcWvat1NHlSPxPuo+UYAjAtJwTbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8241
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
Cc: francois.dugast@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Dec 09, 2023 at 02:43:52PM -0800, Ashutosh Dixit wrote:
>PMU uapi is likely to change in the future. Till the uapi is finalized,
>remove PMU from Xe. PMU can be re-added after uapi is finalized.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

I guess partial removal was messy. This is fine.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/Makefile          |   2 -
> drivers/gpu/drm/xe/regs/xe_gt_regs.h |   5 -
> drivers/gpu/drm/xe/xe_device.c       |   2 -
> drivers/gpu/drm/xe/xe_device_types.h |   4 -
> drivers/gpu/drm/xe/xe_gt.c           |   2 -
> drivers/gpu/drm/xe/xe_module.c       |   5 -
> drivers/gpu/drm/xe/xe_pmu.c          | 645 ---------------------------
> drivers/gpu/drm/xe/xe_pmu.h          |  25 --
> drivers/gpu/drm/xe/xe_pmu_types.h    |  68 ---
> include/uapi/drm/xe_drm.h            |  40 --
> 10 files changed, 798 deletions(-)
> delete mode 100644 drivers/gpu/drm/xe/xe_pmu.c
> delete mode 100644 drivers/gpu/drm/xe/xe_pmu.h
> delete mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index f4ae063a70053..b0cb6a9a390e8 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -267,8 +267,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
> 	i915-display/skl_universal_plane.o \
> 	i915-display/skl_watermark.o
>
>-xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>-
> ifeq ($(CONFIG_ACPI),y)
> 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
> 		i915-display/intel_acpi.o \
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 5f5a72e9d0d89..0d3d9754b7690 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -330,11 +330,6 @@
> #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
> #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>
>-#define XE_OAG_RC0_ANY_ENGINE_BUSY_FREE		XE_REG(0xdb80)
>-#define XE_OAG_ANY_MEDIA_FF_BUSY_FREE		XE_REG(0xdba0)
>-#define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
>-#define XE_OAG_RENDER_BUSY_FREE			XE_REG(0xdbdc)
>-
> #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
> #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 2e0b2e40d8f3b..346e7eec25a63 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -499,8 +499,6 @@ int xe_device_probe(struct xe_device *xe)
>
> 	xe_debugfs_register(xe);
>
>-	xe_pmu_register(&xe->pmu);
>-
> 	xe_hwmon_register(xe);
>
> 	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index d1a48456e9a31..c45ef17b34732 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -18,7 +18,6 @@
> #include "xe_lmtt_types.h"
> #include "xe_platform_types.h"
> #include "xe_pt_types.h"
>-#include "xe_pmu.h"
> #include "xe_sriov_types.h"
> #include "xe_step_types.h"
>
>@@ -427,9 +426,6 @@ struct xe_device {
> 	 */
> 	struct task_struct *pm_callback_task;
>
>-	/** @pmu: performance monitoring unit */
>-	struct xe_pmu pmu;
>-
> 	/** @hwmon: hwmon subsystem integration */
> 	struct xe_hwmon *hwmon;
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index dfd9cf01a5d58..f5d18e98f8b6c 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -709,8 +709,6 @@ int xe_gt_suspend(struct xe_gt *gt)
> 	if (err)
> 		goto err_msg;
>
>-	xe_pmu_suspend(gt);
>-
> 	err = xe_uc_suspend(&gt->uc);
> 	if (err)
> 		goto err_force_wake;
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index 51bf69b7ab222..110b698646565 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -11,7 +11,6 @@
> #include "xe_drv.h"
> #include "xe_hw_fence.h"
> #include "xe_pci.h"
>-#include "xe_pmu.h"
> #include "xe_sched_job.h"
>
> struct xe_modparam xe_modparam = {
>@@ -63,10 +62,6 @@ static const struct init_funcs init_funcs[] = {
> 		.init = xe_sched_job_module_init,
> 		.exit = xe_sched_job_module_exit,
> 	},
>-	{
>-		.init = xe_pmu_init,
>-		.exit = xe_pmu_exit,
>-	},
> 	{
> 		.init = xe_register_pci_driver,
> 		.exit = xe_unregister_pci_driver,
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>deleted file mode 100644
>index 9d0b7887cfc45..0000000000000
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ /dev/null
>@@ -1,645 +0,0 @@
>-// SPDX-License-Identifier: MIT
>-/*
>- * Copyright © 2023 Intel Corporation
>- */
>-
>-#include <drm/drm_drv.h>
>-#include <drm/drm_managed.h>
>-#include <drm/xe_drm.h>
>-
>-#include "regs/xe_gt_regs.h"
>-#include "xe_device.h"
>-#include "xe_gt_clock.h"
>-#include "xe_mmio.h"
>-
>-static cpumask_t xe_pmu_cpumask;
>-static unsigned int xe_pmu_target_cpu = -1;
>-
>-static unsigned int config_gt_id(const u64 config)
>-{
>-	return config >> __DRM_XE_PMU_GT_SHIFT;
>-}
>-
>-static u64 config_counter(const u64 config)
>-{
>-	return config & ~(~0ULL << __DRM_XE_PMU_GT_SHIFT);
>-}
>-
>-static void xe_pmu_event_destroy(struct perf_event *event)
>-{
>-	struct xe_device *xe =
>-		container_of(event->pmu, typeof(*xe), pmu.base);
>-
>-	drm_WARN_ON(&xe->drm, event->parent);
>-
>-	drm_dev_put(&xe->drm);
>-}
>-
>-static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
>-{
>-	u64 val;
>-
>-	switch (sample_type) {
>-	case __XE_SAMPLE_RENDER_GROUP_BUSY:
>-		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>-		break;
>-	case __XE_SAMPLE_COPY_GROUP_BUSY:
>-		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>-		break;
>-	case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>-		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>-		break;
>-	case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
>-		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>-		break;
>-	default:
>-		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>-	}
>-
>-	return xe_gt_clock_cycles_to_ns(gt, val * 16);
>-}
>-
>-static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
>-{
>-	int sample_type = config_counter(config);
>-	const unsigned int gt_id = gt->info.id;
>-	struct xe_device *xe = gt->tile->xe;
>-	struct xe_pmu *pmu = &xe->pmu;
>-	unsigned long flags;
>-	bool device_awake;
>-	u64 val;
>-
>-	device_awake = xe_device_mem_access_get_if_ongoing(xe);
>-	if (device_awake) {
>-		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>-		val = __engine_group_busyness_read(gt, sample_type);
>-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>-		xe_device_mem_access_put(xe);
>-	}
>-
>-	spin_lock_irqsave(&pmu->lock, flags);
>-
>-	if (device_awake)
>-		pmu->sample[gt_id][sample_type] = val;
>-	else
>-		val = pmu->sample[gt_id][sample_type];
>-
>-	spin_unlock_irqrestore(&pmu->lock, flags);
>-
>-	return val;
>-}
>-
>-static void engine_group_busyness_store(struct xe_gt *gt)
>-{
>-	struct xe_pmu *pmu = &gt->tile->xe->pmu;
>-	unsigned int gt_id = gt->info.id;
>-	unsigned long flags;
>-	int i;
>-
>-	spin_lock_irqsave(&pmu->lock, flags);
>-
>-	for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++)
>-		pmu->sample[gt_id][i] = __engine_group_busyness_read(gt, i);
>-
>-	spin_unlock_irqrestore(&pmu->lock, flags);
>-}
>-
>-static int
>-config_status(struct xe_device *xe, u64 config)
>-{
>-	unsigned int gt_id = config_gt_id(config);
>-	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>-
>-	if (gt_id >= XE_PMU_MAX_GT)
>-		return -ENOENT;
>-
>-	switch (config_counter(config)) {
>-	case DRM_XE_PMU_RENDER_GROUP_BUSY(0):
>-	case DRM_XE_PMU_COPY_GROUP_BUSY(0):
>-	case DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>-		if (gt->info.type == XE_GT_TYPE_MEDIA)
>-			return -ENOENT;
>-		break;
>-	case DRM_XE_PMU_MEDIA_GROUP_BUSY(0):
>-		if (!(gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))))
>-			return -ENOENT;
>-		break;
>-	default:
>-		return -ENOENT;
>-	}
>-
>-	return 0;
>-}
>-
>-static int xe_pmu_event_init(struct perf_event *event)
>-{
>-	struct xe_device *xe =
>-		container_of(event->pmu, typeof(*xe), pmu.base);
>-	struct xe_pmu *pmu = &xe->pmu;
>-	int ret;
>-
>-	if (pmu->closed)
>-		return -ENODEV;
>-
>-	if (event->attr.type != event->pmu->type)
>-		return -ENOENT;
>-
>-	/* unsupported modes and filters */
>-	if (event->attr.sample_period) /* no sampling */
>-		return -EINVAL;
>-
>-	if (has_branch_stack(event))
>-		return -EOPNOTSUPP;
>-
>-	if (event->cpu < 0)
>-		return -EINVAL;
>-
>-	/* only allow running on one cpu at a time */
>-	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>-		return -EINVAL;
>-
>-	ret = config_status(xe, event->attr.config);
>-	if (ret)
>-		return ret;
>-
>-	if (!event->parent) {
>-		drm_dev_get(&xe->drm);
>-		event->destroy = xe_pmu_event_destroy;
>-	}
>-
>-	return 0;
>-}
>-
>-static u64 __xe_pmu_event_read(struct perf_event *event)
>-{
>-	struct xe_device *xe =
>-		container_of(event->pmu, typeof(*xe), pmu.base);
>-	const unsigned int gt_id = config_gt_id(event->attr.config);
>-	const u64 config = event->attr.config;
>-	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>-	u64 val;
>-
>-	switch (config_counter(config)) {
>-	case DRM_XE_PMU_RENDER_GROUP_BUSY(0):
>-	case DRM_XE_PMU_COPY_GROUP_BUSY(0):
>-	case DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>-	case DRM_XE_PMU_MEDIA_GROUP_BUSY(0):
>-		val = engine_group_busyness_read(gt, config);
>-		break;
>-	default:
>-		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>-	}
>-
>-	return val;
>-}
>-
>-static void xe_pmu_event_read(struct perf_event *event)
>-{
>-	struct xe_device *xe =
>-		container_of(event->pmu, typeof(*xe), pmu.base);
>-	struct hw_perf_event *hwc = &event->hw;
>-	struct xe_pmu *pmu = &xe->pmu;
>-	u64 prev, new;
>-
>-	if (pmu->closed) {
>-		event->hw.state = PERF_HES_STOPPED;
>-		return;
>-	}
>-again:
>-	prev = local64_read(&hwc->prev_count);
>-	new = __xe_pmu_event_read(event);
>-
>-	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>-		goto again;
>-
>-	local64_add(new - prev, &event->count);
>-}
>-
>-static void xe_pmu_enable(struct perf_event *event)
>-{
>-	/*
>-	 * Store the current counter value so we can report the correct delta
>-	 * for all listeners. Even when the event was already enabled and has
>-	 * an existing non-zero value.
>-	 */
>-	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>-}
>-
>-static void xe_pmu_event_start(struct perf_event *event, int flags)
>-{
>-	struct xe_device *xe =
>-		container_of(event->pmu, typeof(*xe), pmu.base);
>-	struct xe_pmu *pmu = &xe->pmu;
>-
>-	if (pmu->closed)
>-		return;
>-
>-	xe_pmu_enable(event);
>-	event->hw.state = 0;
>-}
>-
>-static void xe_pmu_event_stop(struct perf_event *event, int flags)
>-{
>-	if (flags & PERF_EF_UPDATE)
>-		xe_pmu_event_read(event);
>-
>-	event->hw.state = PERF_HES_STOPPED;
>-}
>-
>-static int xe_pmu_event_add(struct perf_event *event, int flags)
>-{
>-	struct xe_device *xe =
>-		container_of(event->pmu, typeof(*xe), pmu.base);
>-	struct xe_pmu *pmu = &xe->pmu;
>-
>-	if (pmu->closed)
>-		return -ENODEV;
>-
>-	if (flags & PERF_EF_START)
>-		xe_pmu_event_start(event, flags);
>-
>-	return 0;
>-}
>-
>-static void xe_pmu_event_del(struct perf_event *event, int flags)
>-{
>-	xe_pmu_event_stop(event, PERF_EF_UPDATE);
>-}
>-
>-static int xe_pmu_event_event_idx(struct perf_event *event)
>-{
>-	return 0;
>-}
>-
>-struct xe_ext_attribute {
>-	struct device_attribute attr;
>-	unsigned long val;
>-};
>-
>-static ssize_t xe_pmu_event_show(struct device *dev,
>-				 struct device_attribute *attr, char *buf)
>-{
>-	struct xe_ext_attribute *eattr;
>-
>-	eattr = container_of(attr, struct xe_ext_attribute, attr);
>-	return sprintf(buf, "config=0x%lx\n", eattr->val);
>-}
>-
>-static ssize_t cpumask_show(struct device *dev,
>-			    struct device_attribute *attr, char *buf)
>-{
>-	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
>-}
>-
>-static DEVICE_ATTR_RO(cpumask);
>-
>-static struct attribute *xe_cpumask_attrs[] = {
>-	&dev_attr_cpumask.attr,
>-	NULL,
>-};
>-
>-static const struct attribute_group xe_pmu_cpumask_attr_group = {
>-	.attrs = xe_cpumask_attrs,
>-};
>-
>-#define __event(__counter, __name, __unit) \
>-{ \
>-	.counter = (__counter), \
>-	.name = (__name), \
>-	.unit = (__unit), \
>-	.global = false, \
>-}
>-
>-#define __global_event(__counter, __name, __unit) \
>-{ \
>-	.counter = (__counter), \
>-	.name = (__name), \
>-	.unit = (__unit), \
>-	.global = true, \
>-}
>-
>-static struct xe_ext_attribute *
>-add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
>-{
>-	sysfs_attr_init(&attr->attr.attr);
>-	attr->attr.attr.name = name;
>-	attr->attr.attr.mode = 0444;
>-	attr->attr.show = xe_pmu_event_show;
>-	attr->val = config;
>-
>-	return ++attr;
>-}
>-
>-static struct perf_pmu_events_attr *
>-add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
>-	     const char *str)
>-{
>-	sysfs_attr_init(&attr->attr.attr);
>-	attr->attr.attr.name = name;
>-	attr->attr.attr.mode = 0444;
>-	attr->attr.show = perf_event_sysfs_show;
>-	attr->event_str = str;
>-
>-	return ++attr;
>-}
>-
>-static struct attribute **
>-create_event_attributes(struct xe_pmu *pmu)
>-{
>-	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>-	static const struct {
>-		unsigned int counter;
>-		const char *name;
>-		const char *unit;
>-		bool global;
>-	} events[] = {
>-		__event(0, "render-group-busy", "ns"),
>-		__event(1, "copy-group-busy", "ns"),
>-		__event(2, "media-group-busy", "ns"),
>-		__event(3, "any-engine-group-busy", "ns"),
>-	};
>-
>-	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>-	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
>-	struct attribute **attr = NULL, **attr_iter;
>-	unsigned int count = 0;
>-	unsigned int i, j;
>-	struct xe_gt *gt;
>-
>-	/* Count how many counters we will be exposing. */
>-	for_each_gt(gt, xe, j) {
>-		for (i = 0; i < ARRAY_SIZE(events); i++) {
>-			u64 config = ___DRM_XE_PMU_OTHER(j, events[i].counter);
>-
>-			if (!config_status(xe, config))
>-				count++;
>-		}
>-	}
>-
>-	/* Allocate attribute objects and table. */
>-	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
>-	if (!xe_attr)
>-		goto err_alloc;
>-
>-	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
>-	if (!pmu_attr)
>-		goto err_alloc;
>-
>-	/* Max one pointer of each attribute type plus a termination entry. */
>-	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
>-	if (!attr)
>-		goto err_alloc;
>-
>-	xe_iter = xe_attr;
>-	pmu_iter = pmu_attr;
>-	attr_iter = attr;
>-
>-	for_each_gt(gt, xe, j) {
>-		for (i = 0; i < ARRAY_SIZE(events); i++) {
>-			u64 config = ___DRM_XE_PMU_OTHER(j, events[i].counter);
>-			char *str;
>-
>-			if (config_status(xe, config))
>-				continue;
>-
>-			if (events[i].global)
>-				str = kstrdup(events[i].name, GFP_KERNEL);
>-			else
>-				str = kasprintf(GFP_KERNEL, "%s-gt%u",
>-						events[i].name, j);
>-			if (!str)
>-				goto err;
>-
>-			*attr_iter++ = &xe_iter->attr.attr;
>-			xe_iter = add_xe_attr(xe_iter, str, config);
>-
>-			if (events[i].unit) {
>-				if (events[i].global)
>-					str = kasprintf(GFP_KERNEL, "%s.unit",
>-							events[i].name);
>-				else
>-					str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
>-							events[i].name, j);
>-				if (!str)
>-					goto err;
>-
>-				*attr_iter++ = &pmu_iter->attr.attr;
>-				pmu_iter = add_pmu_attr(pmu_iter, str,
>-							events[i].unit);
>-			}
>-		}
>-	}
>-
>-	pmu->xe_attr = xe_attr;
>-	pmu->pmu_attr = pmu_attr;
>-
>-	return attr;
>-
>-err:
>-	for (attr_iter = attr; *attr_iter; attr_iter++)
>-		kfree((*attr_iter)->name);
>-
>-err_alloc:
>-	kfree(attr);
>-	kfree(xe_attr);
>-	kfree(pmu_attr);
>-
>-	return NULL;
>-}
>-
>-static void free_event_attributes(struct xe_pmu *pmu)
>-{
>-	struct attribute **attr_iter = pmu->events_attr_group.attrs;
>-
>-	for (; *attr_iter; attr_iter++)
>-		kfree((*attr_iter)->name);
>-
>-	kfree(pmu->events_attr_group.attrs);
>-	kfree(pmu->xe_attr);
>-	kfree(pmu->pmu_attr);
>-
>-	pmu->events_attr_group.attrs = NULL;
>-	pmu->xe_attr = NULL;
>-	pmu->pmu_attr = NULL;
>-}
>-
>-static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>-{
>-	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>-
>-	/* Select the first online CPU as a designated reader. */
>-	if (cpumask_empty(&xe_pmu_cpumask))
>-		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>-
>-	return 0;
>-}
>-
>-static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
>-{
>-	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>-	unsigned int target = xe_pmu_target_cpu;
>-
>-	/*
>-	 * Unregistering an instance generates a CPU offline event which we must
>-	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
>-	 */
>-	if (pmu->closed)
>-		return 0;
>-
>-	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
>-		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
>-
>-		/* Migrate events if there is a valid target */
>-		if (target < nr_cpu_ids) {
>-			cpumask_set_cpu(target, &xe_pmu_cpumask);
>-			xe_pmu_target_cpu = target;
>-		}
>-	}
>-
>-	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
>-		perf_pmu_migrate_context(&pmu->base, cpu, target);
>-		pmu->cpuhp.cpu = target;
>-	}
>-
>-	return 0;
>-}
>-
>-static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
>-
>-int xe_pmu_init(void)
>-{
>-	int ret;
>-
>-	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>-				      "perf/x86/intel/xe:online",
>-				      xe_pmu_cpu_online,
>-				      xe_pmu_cpu_offline);
>-	if (ret < 0)
>-		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
>-			  ret);
>-	else
>-		cpuhp_slot = ret;
>-
>-	return 0;
>-}
>-
>-void xe_pmu_exit(void)
>-{
>-	if (cpuhp_slot != CPUHP_INVALID)
>-		cpuhp_remove_multi_state(cpuhp_slot);
>-}
>-
>-static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
>-{
>-	if (cpuhp_slot == CPUHP_INVALID)
>-		return -EINVAL;
>-
>-	return cpuhp_state_add_instance(cpuhp_slot, &pmu->cpuhp.node);
>-}
>-
>-static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>-{
>-	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
>-}
>-
>-void xe_pmu_suspend(struct xe_gt *gt)
>-{
>-	engine_group_busyness_store(gt);
>-}
>-
>-static void xe_pmu_unregister(struct drm_device *device, void *arg)
>-{
>-	struct xe_pmu *pmu = arg;
>-
>-	if (!pmu->base.event_init)
>-		return;
>-
>-	/*
>-	 * "Disconnect" the PMU callbacks - since all are atomic synchronize_rcu
>-	 * ensures all currently executing ones will have exited before we
>-	 * proceed with unregistration.
>-	 */
>-	pmu->closed = true;
>-	synchronize_rcu();
>-
>-	xe_pmu_unregister_cpuhp_state(pmu);
>-
>-	perf_pmu_unregister(&pmu->base);
>-	pmu->base.event_init = NULL;
>-	kfree(pmu->base.attr_groups);
>-	kfree(pmu->name);
>-	free_event_attributes(pmu);
>-}
>-
>-void xe_pmu_register(struct xe_pmu *pmu)
>-{
>-	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>-	const struct attribute_group *attr_groups[] = {
>-		&pmu->events_attr_group,
>-		&xe_pmu_cpumask_attr_group,
>-		NULL
>-	};
>-
>-	int ret = -ENOMEM;
>-
>-	spin_lock_init(&pmu->lock);
>-	pmu->cpuhp.cpu = -1;
>-
>-	pmu->name = kasprintf(GFP_KERNEL,
>-			      "xe_%s",
>-			      dev_name(xe->drm.dev));
>-	if (pmu->name)
>-		/* tools/perf reserves colons as special. */
>-		strreplace((char *)pmu->name, ':', '_');
>-
>-	if (!pmu->name)
>-		goto err;
>-
>-	pmu->events_attr_group.name = "events";
>-	pmu->events_attr_group.attrs = create_event_attributes(pmu);
>-	if (!pmu->events_attr_group.attrs)
>-		goto err_name;
>-
>-	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>-					GFP_KERNEL);
>-	if (!pmu->base.attr_groups)
>-		goto err_attr;
>-
>-	pmu->base.module	= THIS_MODULE;
>-	pmu->base.task_ctx_nr	= perf_invalid_context;
>-	pmu->base.event_init	= xe_pmu_event_init;
>-	pmu->base.add		= xe_pmu_event_add;
>-	pmu->base.del		= xe_pmu_event_del;
>-	pmu->base.start		= xe_pmu_event_start;
>-	pmu->base.stop		= xe_pmu_event_stop;
>-	pmu->base.read		= xe_pmu_event_read;
>-	pmu->base.event_idx	= xe_pmu_event_event_idx;
>-
>-	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
>-	if (ret)
>-		goto err_groups;
>-
>-	ret = xe_pmu_register_cpuhp_state(pmu);
>-	if (ret)
>-		goto err_unreg;
>-
>-	ret = drmm_add_action_or_reset(&xe->drm, xe_pmu_unregister, pmu);
>-	if (ret)
>-		goto err_cpuhp;
>-
>-	return;
>-
>-err_cpuhp:
>-	xe_pmu_unregister_cpuhp_state(pmu);
>-err_unreg:
>-	perf_pmu_unregister(&pmu->base);
>-err_groups:
>-	kfree(pmu->base.attr_groups);
>-err_attr:
>-	pmu->base.event_init = NULL;
>-	free_event_attributes(pmu);
>-err_name:
>-	kfree(pmu->name);
>-err:
>-	drm_notice(&xe->drm, "Failed to register PMU!\n");
>-}
>diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>deleted file mode 100644
>index a99d4ddd023e9..0000000000000
>--- a/drivers/gpu/drm/xe/xe_pmu.h
>+++ /dev/null
>@@ -1,25 +0,0 @@
>-/* SPDX-License-Identifier: MIT */
>-/*
>- * Copyright © 2023 Intel Corporation
>- */
>-
>-#ifndef _XE_PMU_H_
>-#define _XE_PMU_H_
>-
>-#include "xe_gt_types.h"
>-#include "xe_pmu_types.h"
>-
>-#if IS_ENABLED(CONFIG_PERF_EVENTS)
>-int xe_pmu_init(void);
>-void xe_pmu_exit(void);
>-void xe_pmu_register(struct xe_pmu *pmu);
>-void xe_pmu_suspend(struct xe_gt *gt);
>-#else
>-static inline int xe_pmu_init(void) { return 0; }
>-static inline void xe_pmu_exit(void) {}
>-static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>-static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>-#endif
>-
>-#endif
>-
>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>deleted file mode 100644
>index 9cadbd243f577..0000000000000
>--- a/drivers/gpu/drm/xe/xe_pmu_types.h
>+++ /dev/null
>@@ -1,68 +0,0 @@
>-/* SPDX-License-Identifier: MIT */
>-/*
>- * Copyright © 2023 Intel Corporation
>- */
>-
>-#ifndef _XE_PMU_TYPES_H_
>-#define _XE_PMU_TYPES_H_
>-
>-#include <linux/perf_event.h>
>-#include <linux/spinlock_types.h>
>-#include <uapi/drm/xe_drm.h>
>-
>-enum {
>-	__XE_SAMPLE_RENDER_GROUP_BUSY,
>-	__XE_SAMPLE_COPY_GROUP_BUSY,
>-	__XE_SAMPLE_MEDIA_GROUP_BUSY,
>-	__XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>-	__XE_NUM_PMU_SAMPLERS
>-};
>-
>-#define XE_PMU_MAX_GT 2
>-
>-struct xe_pmu {
>-	/**
>-	 * @cpuhp: Struct used for CPU hotplug handling.
>-	 */
>-	struct {
>-		struct hlist_node node;
>-		unsigned int cpu;
>-	} cpuhp;
>-	/**
>-	 * @base: PMU base.
>-	 */
>-	struct pmu base;
>-	/**
>-	 * @closed: xe is unregistering.
>-	 */
>-	bool closed;
>-	/**
>-	 * @name: Name as registered with perf core.
>-	 */
>-	const char *name;
>-	/**
>-	 * @lock: Lock protecting enable mask and ref count handling.
>-	 */
>-	spinlock_t lock;
>-	/**
>-	 * @sample: Current and previous (raw) counters.
>-	 *
>-	 * These counters are updated when the device is awake.
>-	 *
>-	 */
>-	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>-	/**
>-	 * @events_attr_group: Device events attribute group.
>-	 */
>-	struct attribute_group events_attr_group;
>-	/**
>-	 * @xe_attr: Memory block holding device attributes.
>-	 */
>-	void *xe_attr;
>-	/**
>-	 * @pmu_attr: Memory block holding device attributes.
>-	 */
>-	void *pmu_attr;
>-};
>-
>-#endif
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 0895e4d2a9815..5ba412007270a 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1080,46 +1080,6 @@ struct drm_xe_wait_user_fence {
> 	/** @reserved: Reserved */
> 	__u64 reserved[2];
> };
>-
>-/**
>- * DOC: XE PMU event config IDs
>- *
>- * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX listed in xe_drm.h
>- * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>- * particular event.
>- *
>- * For example to open the DRMXE_PMU_RENDER_GROUP_BUSY(0):
>- *
>- * .. code-block:: C
>- *
>- *	struct perf_event_attr attr;
>- *	long long count;
>- *	int cpu = 0;
>- *	int fd;
>- *
>- *	memset(&attr, 0, sizeof(struct perf_event_attr));
>- *	attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
>- *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>- *	attr.use_clockid = 1;
>- *	attr.clockid = CLOCK_MONOTONIC;
>- *	attr.config = DRM_XE_PMU_RENDER_GROUP_BUSY(0);
>- *
>- *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>- */
>-
>-/*
>- * Top bits of every counter are GT id.
>- */
>-#define __DRM_XE_PMU_GT_SHIFT (56)
>-
>-#define ___DRM_XE_PMU_OTHER(gt, x) \
>-	(((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
>-
>-#define DRM_XE_PMU_RENDER_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 0)
>-#define DRM_XE_PMU_COPY_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 1)
>-#define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 2)
>-#define DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 3)
>-
> #if defined(__cplusplus)
> }
> #endif
>-- 
>2.41.0
>
