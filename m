Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1600CC25B10
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 19:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D025710F090;
	Thu,  9 May 2024 19:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GzRqDyS6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C30A10F0A5
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 19:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715282244; x=1746818244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EPIE4oYYxpYF6oC3DXBuQNIJ6G8gs24k8aoMr87J6SY=;
 b=GzRqDyS6RnCGR9s60l3T99kJAh+pWW7wBVxhtZ/05t1zBbzmfD/RQkXR
 IE6qFzHjUbjgZgkBGOsUiTH5kZtg6xsC+m7WRgkaNW6VSE0cwX4Gn9b4B
 s4wLyqdvt/cGGQHSEXXFYWtKkShBlx3z6/g03HFrSp+UdLnFIu83ATQub
 fd1UzVnPUIW0K1f5yLd+Bn7TgrfZULJ4vz+lgLFlGxjBHA1vprXtoxxoT
 AmCRhYZs5FQNaqhaS8O0/ZKTEayxQKcTT5ZRyrQ+hUnlz/ifJANtGZ+jK
 XVMnRU+AtBOPjJ+tARAocOGi2S7FaElWUpqFsbpEyZZoO6aDENhdJGnBX Q==;
X-CSE-ConnectionGUID: LYUAyJEXSsiywHFXwSI1lw==
X-CSE-MsgGUID: YZS5tzlVQSyzKgMGDnQUPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15038478"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="15038478"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:17:24 -0700
X-CSE-ConnectionGUID: CdQPvd81TgiaS62EZI+ifw==
X-CSE-MsgGUID: AJNiWBfWTVeYhXx3gV0tbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="33879289"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 12:17:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:17:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:17:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 12:17:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 12:17:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3byar8Lzcxlx+UDR87MyaIXTN1BVRcmzoRWIpp++78h+4IVEcFXXp4nv1V5uhcnBd/DJcmLi3vI2p26C08f0kf+sb/E3JzffLzzt/qK07PJHXvOm2NVyUzAtT8xYDwQLMpxp+yU9KUT8SOOuslpzpcjPSy8sFLN8VvTfxJmrxlCBBlXHjEGnuOuVFKmLjJJGTUY05FY5+uY9otbK9X7KZWCTeBC0LXY55xUNNMtmj2/eyoNG3Zb7pHhBfB2PSEy8OvJU2knCLrP9TzWRyMBjxG5uzlB6jHCL0uISMkcCnoNSHgOIerRVwMagerxcMeK2vIxo4ipAYoqR3sKvBbiXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2J4yXWx9kSs6UFj4SMsi8El6VtMj2WSf3g92Gi2Wt4=;
 b=EWMziJr5JnfbShSzhL/4UMT7ojmC1jXSbkSVsse/zVVB3YAOs0pn/D4zyNVRNUtC7vXrlEkG/mrlOrNYTL+a8NWT9fL2UYzaWtx6HoWovylpdXhqXnvZnvBU3W2tOYdwcgknu7W53PGe2qqNovuxWDoJZY/9Ha2nGD1ZHfJE6D+/CVdIHXGwPeD3VCnde+lvTcH4urUNt024sXGX5/StxHflFP3GUgkAJk92pVDo6FNjmuYUvX1C+V0kZzgYAl4gpc+PBKuzOUg3VSMAAzegFe9RukYWpKAfVVHmbemmorHvwckEQRZWFRVKDyLxPfZlk6Z62uLAKIXEIt1tFyEvrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5294.namprd11.prod.outlook.com (2603:10b6:5:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Thu, 9 May
 2024 19:17:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 19:17:15 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Uma Shankar <uma.shankar@intel.com>, "Francois
 Dugast" <francois.dugast@intel.com>
Subject: [PATCH 5/7] drm/xe: Prepare display for D3Cold
Date: Thu, 9 May 2024 15:16:55 -0400
Message-ID: <20240509191657.504300-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509191657.504300-1-rodrigo.vivi@intel.com>
References: <20240509191657.504300-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0202.namprd04.prod.outlook.com
 (2603:10b6:303:86::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5294:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c4767a-cefb-4312-b30a-08dc705ca2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KpCeVhgyujN8+1aFfFI5hg7GhKoulDVRrOqwEV3JyGucUSRVpB1wAFEXwCrO?=
 =?us-ascii?Q?boqqLGamuLCy8KYQresHEBKNhVOYbqalEc5Mph5bVLpOLgg9EKsLHetptoaJ?=
 =?us-ascii?Q?AB72GYVL0ybZUNaxchLSsmK718wEx70DEu3o8h3RO69/6UtWwuoZoAu3mCMg?=
 =?us-ascii?Q?3s+jhRKB1V1bC/LfSKClrRRsl2l8tBVDn5890jauOYxCEdt5KCwJZioYTpAz?=
 =?us-ascii?Q?ThQvZRyaK3BBpEZwdb26edRv2gvXAX7LhNp/qsqCwheBPUOduyzU62Tqm/f0?=
 =?us-ascii?Q?7GNQPSziPjKB2zd9fIRtLmsnfOGHAaUXhtnKOu3ELjahGiyGh3XObh1eowPP?=
 =?us-ascii?Q?Pu2tTFYTsX7sZFpsnlQAO2duzKHa6oygddlp76VpF40e0cIcJYn4rvTJ00Xg?=
 =?us-ascii?Q?xjK23aMiD3eV8nkL6aQY7fYTYIGKmgrFr775Pd5L8kc8YsT1atE9ODJmRvSw?=
 =?us-ascii?Q?+gjpRLEi9f+pEY35kE2F3lLGECtTNj3ftuI9e8cAq9C+WAsHA7uStlZ5NiEl?=
 =?us-ascii?Q?xmfzGUqYvD5AiSs3RNQOF0a6gfuFYNB392PsF+AGonNH1qWYqXeb6jxgLqDW?=
 =?us-ascii?Q?mcplGo2tJfNwAsrB8ullfff8miVFLOvSbx4vkLe/R2i8F6m4lnnsdEDyqcf+?=
 =?us-ascii?Q?5VSNPxJ2mrkX6H7c5Ij/4L0lW9+A0HgrJxL6Q2/OKUtegNrelmhosrPTaOyU?=
 =?us-ascii?Q?0UM7aD+66viuMyON57VrhQ2n7L/gFYNDXHQRgyHJ7oyJSg00DXjv5oIL4jY3?=
 =?us-ascii?Q?8beQUSUjdvnrXdUB/mTAa1WJ3pS+JvZ21e3T36s3G3pWfQwRoWlcwTebPYjA?=
 =?us-ascii?Q?QGyM0Ue6RGaO2yTWtkxXz6D7nNrbd/pCOg1mv7E3pZmchoEss4RaCbVIsF7k?=
 =?us-ascii?Q?7a+gLluYKR0GuL+CWjw9ES+CNjB/ENIz+7fth6m1C36sNOvgNW/Fx/a4d4Rf?=
 =?us-ascii?Q?B3lqo2MUyXkoV84MLTLy3PDjpOOZxrLTiBXZ0NmSpSwdr2wce2545AZmJ7yh?=
 =?us-ascii?Q?K81jzSE/mkwRTtRotQwy1xXAtyEGlhuuS6f38M2/enCAj5CXFzK63OGUCJU4?=
 =?us-ascii?Q?FkjemyUzxD6IVluEXZpXZe1gVvk7Dg9c3jbDBazSOcWHaiaHeyv4SZnqe0SW?=
 =?us-ascii?Q?t9zBlzZfBmPBbaX7rT8rzIjSKJ25lAH+V2Q+7I5G+DYTP34mlnzzbnAmftfz?=
 =?us-ascii?Q?xAvANTHHnVaWbQSoKZu3/LEQPf3km1Iwz3BIgK/wLj4J/9gf22rDNeu0fg9s?=
 =?us-ascii?Q?wgSV7ct94TDkIVBfrx8MQB5wwOA9RqDUe4cwzopQCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FfnuexIKS12DNDC4bJ3r0SLinWKvWGWsgguyymlazTeyH/vV+i3cos8jXrYu?=
 =?us-ascii?Q?Vmh3uc7eln3DXXZKbimD+SLPco1kIedqdC+A/m+HEljN8Td9wa5goW6pxWh3?=
 =?us-ascii?Q?a2NphWCghe9kbMgs0z0BrL3U8vpGSSTGvGU16WfiA3lN8EymCP8BE7FPjKzp?=
 =?us-ascii?Q?iK7hRJk9eLCGESVewDQYBkHDTbhvGEKrOvmcyodtWRdPQJzuXbWzWbLPiDHl?=
 =?us-ascii?Q?1z6gBNBCRdHM+tP10d1eAnXjQ/+zcu9nt7y47M/GnRJ+VqAF3YeNo/t/W4SN?=
 =?us-ascii?Q?Hj/OYdG2mTNGTASH3SHt5ccV8lpTI5ZbGt3qBR/DqsgFfF2MDrhLhGCeOoa9?=
 =?us-ascii?Q?3vfA/5yMHG2bONo8RvykPedXgEdHyNqJNo9IHK5bzd8daU9PsGkxgGip/5x2?=
 =?us-ascii?Q?MljmElw3EClGpTrMXXuPwTojl9hNcDXRhtMc6m2BH/TmxIfoB1fDRwXLKWEG?=
 =?us-ascii?Q?k7wQiO+oTZN4u0/gYPXe+nar5L0PPbwK5UIBBP5q41CtcRDQu9RgTrFps3Im?=
 =?us-ascii?Q?UdVCpWEEXAZ3X8vYyjdI4EiSq+PCgFEnelWG0KPH2ksqcngaKuF8WJXb/CnU?=
 =?us-ascii?Q?5vLz2pWckVjDBRT6OzqER+3IZ9VGlrfeHFcNqTH/M/hSRwgGYKHkaD/Vh0Te?=
 =?us-ascii?Q?dhB+o3T5t5g0Pch9QbqqueVz3tBlETiLrweDzRbcTNSGMt+k4Zt1INB7X9Ca?=
 =?us-ascii?Q?Mx2kujdJcFpV5iwFY97dPK3IzgSHakO80pzuqoXLv0U+Z1yla4/hO7IQKIRD?=
 =?us-ascii?Q?4wiui9JPordRKNKOL6Lse1GzJBIijPmwa3Xt24xxHdImXE4K4r3+Z/M3O8Af?=
 =?us-ascii?Q?HDZUQOhcdhD9al3gUEUrACCA0NtO1Oak6NeBU5WODV0sYqxOHTBd/QEK01cn?=
 =?us-ascii?Q?mDUrviIZ0ivsgqk583OBUGt5dQX+WtEMT6d0pC+SIqsIYFanX791l6YrvRTO?=
 =?us-ascii?Q?EY3lJeIryAChfBm6MqmcX/X6DKTPUcmSm78Ggad+bLbkSIaMcu4ufBW7Gvn4?=
 =?us-ascii?Q?eg4UjPL6AOWRBhryE57TNq3SMgo58ne2MJ3UtRZdBQL4/B8rxGCsiDa7NMb6?=
 =?us-ascii?Q?2mZb+KNximeRphpIAwmSGNWBJnmmrdBebeHZ5iVKEUBogC5E7tkefSrcVSgw?=
 =?us-ascii?Q?uLw/DpGnxGqH03Z4tcE4Lw5Pxr1ZOQ/D1aoer/IhtNCBI25QbqCoLkot69sp?=
 =?us-ascii?Q?kaU95kIb5VQXyqyspMGhF+VHg8Iy4Xu9w1N87rifNxrcoIxhqVV14Cg5EDeM?=
 =?us-ascii?Q?tKmMCutrkKLzLYtvwpZpmVbxEZrf6kfypPHLG6njXv3Z2OpIT3oR4fhZdem7?=
 =?us-ascii?Q?cCIfRv67JqnwcOO7G4i+NCbF8XInMOPX9xPxSt9HS6fJA39kq1bUBR+OtdjQ?=
 =?us-ascii?Q?MtoZ2GkvUaz/TZhnSmwV97fx5oFnGmVUqIbKhdu2afp3l4WDq1yZnqY56PZ7?=
 =?us-ascii?Q?gggrJP1NFskcJ84v45CmTvZ25oAhWwWWM4U50npXdej+mB9NDhn0empuirTC?=
 =?us-ascii?Q?/r1sL1j4DWsMQEEpDYenVdPFZforgCMZKDaFGdj4dp1E9WhTFPPklb5tydQW?=
 =?us-ascii?Q?KX4RUOEFF8pXKEboR2U1OPr/G2uDeRogQ4jgOLEoWY3KYzMpyhHzRAaXul1n?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c4767a-cefb-4312-b30a-08dc705ca2b1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 19:17:15.4612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yi6eeMT0mmWnWNEjq4u3pH5xHzM6bDwz69MgQnXEJFQ3L7k8+nO/ERzRdjKE8l34WaBTogQx9hXuHWlkGz2lHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5294
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

Prepare power-well and DC handling for a full power
lost during D3Cold, then sanitize it upon D3->D0.
Otherwise we get a bunch of state mismatch.

Ideally we could leave DC9 enabled and wouldn't need
to move DC9->DC0 on every runtime resume, however,
the disable_DC is part of the power-well checks and
intrinsic to the dc_off power well. In the future that
can be detangled so we can have even bigger power savings.
But for now, let's focus on getting a D3Cold, which saves
much more power by itself.

v2: create new functions to avoid full-suspend-resume path,
which would result in a deadlock between xe_gem_fault and the
modeset-ioctl.

v3: Only avoid the full modeset to avoid the race, for a more
robust suspend-resume.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Tested-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 10 ++++++----
 drivers/gpu/drm/xe/display/xe_display.h |  8 ++++----
 drivers/gpu/drm/xe/xe_pm.c              | 15 ++++++++++++---
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 0de0566e5b39..4b3fae8b4893 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -300,7 +300,7 @@ static bool suspend_to_idle(void)
 	return false;
 }
 
-void xe_display_pm_suspend(struct xe_device *xe)
+void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 {
 	bool s2idle = suspend_to_idle();
 	if (!xe->info.enable_display)
@@ -314,7 +314,8 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	if (has_display(xe))
 		drm_kms_helper_poll_disable(&xe->drm);
 
-	intel_display_driver_suspend(xe);
+	if (!runtime)
+		intel_display_driver_suspend(xe);
 
 	intel_dp_mst_suspend(xe);
 
@@ -350,7 +351,7 @@ void xe_display_pm_resume_early(struct xe_device *xe)
 	intel_power_domains_resume(xe);
 }
 
-void xe_display_pm_resume(struct xe_device *xe)
+void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 {
 	if (!xe->info.enable_display)
 		return;
@@ -365,7 +366,8 @@ void xe_display_pm_resume(struct xe_device *xe)
 
 	/* MST sideband requires HPD interrupts enabled */
 	intel_dp_mst_resume(xe);
-	intel_display_driver_resume(xe);
+	if (!runtime)
+		intel_display_driver_resume(xe);
 
 	intel_hpd_poll_disable(xe);
 	if (has_display(xe))
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 710e56180b52..93d1f779b978 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -34,10 +34,10 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
 void xe_display_irq_reset(struct xe_device *xe);
 void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
 
-void xe_display_pm_suspend(struct xe_device *xe);
+void xe_display_pm_suspend(struct xe_device *xe, bool runtime);
 void xe_display_pm_suspend_late(struct xe_device *xe);
 void xe_display_pm_resume_early(struct xe_device *xe);
-void xe_display_pm_resume(struct xe_device *xe);
+void xe_display_pm_resume(struct xe_device *xe, bool runtime);
 
 #else
 
@@ -63,10 +63,10 @@ static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
 static inline void xe_display_irq_reset(struct xe_device *xe) {}
 static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {}
 
-static inline void xe_display_pm_suspend(struct xe_device *xe) {}
+static inline void xe_display_pm_suspend(struct xe_device *xe, bool runtime) {}
 static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
 static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
-static inline void xe_display_pm_resume(struct xe_device *xe) {}
+static inline void xe_display_pm_resume(struct xe_device *xe, bool runtime) {}
 
 #endif /* CONFIG_DRM_XE_DISPLAY */
 #endif /* _XE_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c3ef2283770f..a2f5a1b11cbf 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -96,12 +96,12 @@ int xe_pm_suspend(struct xe_device *xe)
 	if (err)
 		goto err;
 
-	xe_display_pm_suspend(xe);
+	xe_display_pm_suspend(xe, false);
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_suspend(gt);
 		if (err) {
-			xe_display_pm_resume(xe);
+			xe_display_pm_resume(xe, false);
 			goto err;
 		}
 	}
@@ -151,7 +151,7 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_irq_resume(xe);
 
-	xe_display_pm_resume(xe);
+	xe_display_pm_resume(xe, false);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
@@ -366,6 +366,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 		err = xe_bo_evict_all(xe);
 		if (err)
 			goto out;
+		xe_display_pm_suspend(xe, true);
 	}
 
 	for_each_gt(gt, xe, id) {
@@ -375,7 +376,12 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	}
 
 	xe_irq_suspend(xe);
+
+	if (xe->d3cold.allowed)
+		xe_display_pm_suspend_late(xe);
 out:
+	if (err)
+		xe_display_pm_resume(xe, true);
 	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
@@ -411,6 +417,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		if (err)
 			goto out;
 
+		xe_display_pm_resume_early(xe);
+
 		/*
 		 * This only restores pinned memory which is the memory
 		 * required for the GT(s) to resume.
@@ -426,6 +434,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		xe_gt_resume(gt);
 
 	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
+		xe_display_pm_resume(xe, true);
 		err = xe_bo_restore_user(xe);
 		if (err)
 			goto out;
-- 
2.44.0

