Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22908C48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 22:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C796710E73B;
	Wed, 21 Feb 2024 22:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LckrzDDm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2790810E73B
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 22:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708556222; x=1740092222;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zTfAp9wdB132vsb2a/G9KFiWiaZ0yPzg82HKpw3xp0E=;
 b=LckrzDDmFK6V44ifTrkGoNPUUAvrtN8ScxGZg3kBHbh9f8DmEBhu6aa4
 /M9kyD1nKT7ZCnIW+yl2Lz5QRTWmpsoGJth9uVZsg8m97RRTDQKzE4Mob
 pjJP9tWcsqx635C7TJaizN1JADOPWTCccvyB14AVP2V2SkLOG5DTq+fbJ
 BmmdRVE4JgFW18MYUwSCIKEpKL6+5p9DoeBSeLqDy6kZE4UHv2kJxkiP3
 kGo8c+TAY4uc6vB9bJZbmzs9UfL792vWUXj+tAXxSK1nK4Ida8Sxa4FAM
 Y0bgCVDnjVIGRyEAlGwKM1nEbnFSIrs24gI1UJLdCouVGN33K500UaSRm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13366650"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="13366650"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 14:57:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="9956726"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 14:57:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 14:57:00 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 14:57:00 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 14:56:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+7+WdkQ1J+dtKcDiIgbu9r16x9/kUjzq0G4XcIZSQ1YXvpPqUst6DzkqJhzzctmFXltYuJOMLQXHG1zaASmCI15NK8bcCKttk6/NzqYtOgPP/D2RR7qr852FlKPoAxRsQOEAdQI4kNdTjZ+Gw+MwYeb+iVuY3GdhxlO8TEJ+d5Tj5JqGfESiTTWnQNsw3z9XNVUPavG39Xz78U4IbapV/NGgv6afi/KUnAlQBxplP7kxb5YTo6URpONItoVA1H9xXC1w9CNaDoKCGO17XjbAC3BSGqHxyIaU+IcY8+yE6zPBPTjDzT8ypE9wlABS2UsaOOq6zx93mWyivfmk093lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7O+VHjte9R1QSkjFtu+ah9hgODZFkE53A/QHcnYpuo=;
 b=JfGf55Uf8yR1L3RiORl07TvHr3n6HcHqLD56BRIaFm/BCziJwH+7bNAqibHCON1M+f5QAlKJQx3LAO8dmR3vqtVX4nucxz2lkiCiDRNzYT8lria/Ck8qkkzP+OGmBYDh16uMIvi4a2zMjT+G5thfFn0vHPSKyxyZN7+nUAfv6oKumC7kjyF5iprO5tONuv4PnbmsLm7j3qmsHT3Dd1AGN4Ik7BzQzGSH8Wa8SCLQKfgoALmXYN6ENCLEUDYSzSEGYp0nAtGnOzSg6vfhRS/9HgHuLtdoIoGjtOJPFrI4Yw/KKJxsfE5tuQ4gtK1EGn0cXHHsKR1fztWz5DFv3Og8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH0PR11MB7448.namprd11.prod.outlook.com (2603:10b6:510:26c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.29; Wed, 21 Feb
 2024 22:56:54 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e%7]) with mapi id 15.20.7292.042; Wed, 21 Feb 2024
 22:56:53 +0000
Date: Wed, 21 Feb 2024 14:56:52 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 05/16] drm/xe/oa/uapi: Add/remove OA config perf ops
Message-ID: <ZdZ/tGqETXCcrIPr@unerlige-ril>
References: <20240213064423.131601-1-ashutosh.dixit@intel.com>
 <20240213064423.131601-6-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240213064423.131601-6-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0270.namprd04.prod.outlook.com
 (2603:10b6:303:88::35) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH0PR11MB7448:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3e6c8e-9bb1-4067-e5cf-08dc333065a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u/30X7JRcl7/NW5zFvHk+yp+o+ZJPUBdpdK49+tWqjwgKwlCPhjhJRUQ43f5cA8SYjs8IsytxRWyJ65rk/o7RUSdXe91rkSp88WcPDFpVFUbTp9van+8sNwIgWv6ouPkXuqmVW2kDD7ovMxIAfnL8cHDSxfxXczxcU7mun1Zw50C7AiMeApqEocwFVhpe67BtYz/EKh6OEAiYOWol+nS76DlrVSpXrzB9xIt3j2srBKHtQ0UODElinmpsHBJPXuWGhkQKUOelwaRCooX8cvpRYoKk8TdLgWiJTwSpJlmH4+8AoOv48u0zQhYAUFwoJmvBiD8wRPrA0eQOKS/A4VzRU9G/OBafVYdjLKciXWFJsC0U+1cgnxC5WGumVFM84LN9sOLegEfJEhawXaalfYgM6hbGXcOT8zFh9F8fMnJkPmx3tZ/rUfDnG9UchrmfXKW0LmOqPagHv7WO0tR+i/iE8+OWVDqdqI43DyMA47G06kVwT9QUheJDtptPe9IU0SFaK8WLZH0qW5YPoW8t4bKoNRHYxKba2N9a2lQlflTpFg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1ZMcnBHVUF2WkhoR1ZwT3VsZmVBa3kzQXJkMkVTL0l4SnhjWkFGZHdQL0px?=
 =?utf-8?B?NWFsTUdxTEw2R0pORmdtUFhmNm9iMFJCTGgxV0FnbmE1ZkZMWXJON0Y0UUNk?=
 =?utf-8?B?WUl5VmxLSURydnA0NHFJSUxIVEtTdXFJcmtqVERjb1N1WTFEelNlcHZrajMy?=
 =?utf-8?B?T3c3cTNEbnltNmJreFk0aVdad2NneVdKTE1zcGorYXBKYU9JSWhDdnBlNkha?=
 =?utf-8?B?Vk5LQXRFLzVzMTBXKzRKQWZlK1ovbUsrOE9pWlhhRXZ3SisweHB5ZFdmVkVz?=
 =?utf-8?B?NHNJYThaMVBaY0drZ3VRSEFrblB5Z1I5eVlWTDU1RVhIanVSTFlqS1J6d3lO?=
 =?utf-8?B?VnFRejFGWkQ1QkpZK2piRmxlNDRpbzh6U09UOEZYd1RkVkt6eFJySWtUZXJ0?=
 =?utf-8?B?eUNOM0QwazZ4WDkrTjY5VXpYM0pkc0RwL3JacnpJc3B6R3EvTzM2WDI0RHZx?=
 =?utf-8?B?bm1OR0kwZUdNV2h0Qi85bXJiS2x5cjc3TkljR05qc3VkL1FBZzM4eTFCUysx?=
 =?utf-8?B?SENZQUZWRmZEZjNjaTFCZzFNZG4xdHdDZCtrTjdvOXlYREw1NUFoUTZZR0Jr?=
 =?utf-8?B?VDFFUUZlQWZCaVpvckVIOStsQUNkbW5rU3I4ZUh5Rm1lMnBYSVlJZFJERDFV?=
 =?utf-8?B?djZDeW15M3p2VWJjL3VaQ2JidS9YMXBZN3BoaFJxV1c0c2xzMXhtVDU0V3BX?=
 =?utf-8?B?VlhvTVRuVElvQWhna3BNUk9TSXl3SEhCK0tZMU1kdnltWlliQXo3TGZCak5B?=
 =?utf-8?B?bStnOEdmUXRlWjdNd1duSW9zdmJGWld4ZDlaT2RUNnNCRkJjdHVoT3RHaDhr?=
 =?utf-8?B?SzBBR0M3dnVyVFRsRHdYN2JYYkV0THBaNkZGdVAvNnRlcE1IZUt1N1F6b0wy?=
 =?utf-8?B?OExGbmRwdytuMnYwSWpzVTFJaTNvNFpyOXhDL1dTemVjOFNxcFgyTDNXaVRv?=
 =?utf-8?B?NzBCcmcybmlUU0NXQThaa2QyckNNT3k1aGV2VjFPYkFxZi9kSFV5N1JsUjB4?=
 =?utf-8?B?ZmJ6aXIrWTBrZEM2dXR4NExiV1dsa2hrWlRVbDRxR2ZVNEJqL0t2eVBNWCtE?=
 =?utf-8?B?Zkg3REN3bVEvK2FiS1JUYjRsQWFZcVlMaDlNbmpwdjRqMVp3WVVQeFJ6NHlD?=
 =?utf-8?B?blVvSTZSb2plbzVXZUZSdEEvRVRhYy9CRXRIemh4TVdUdUtBZEpibzNYY2hD?=
 =?utf-8?B?ZldiNlhFYW5icFV0bkVVWHVMdzlkT2phdWtVaU94R1U5NldudkJpNW5nZG1Y?=
 =?utf-8?B?NjgrRmwwcmxWbjZLWXM0bTBvQlJ0NTViUHdLVTNXM09oOEFXanJQdmVZMlNH?=
 =?utf-8?B?UGVqTG91aVRpQnIvMlc1dmRoK2NkbzVoUU1nOGRwOFpEZXZQMThKQmFadTdM?=
 =?utf-8?B?OWRnUzF4ZmI1d1JTVTBNRW9MSzdveXlTMGJ5emhBRnJHRVFwVDVSZkt2ZVBu?=
 =?utf-8?B?YjFJUGN6eGRBU0RPb2lub21wckZkZFpRK0JDSFJINzNkL0VaS29GYUNta21O?=
 =?utf-8?B?ZFg3UHNpR1lYRFVWNmovOW5ZMGU5L2JIOXo4K3BmN0ViTTM2KzVRYkR6dzZh?=
 =?utf-8?B?ZVpoZ3pLc09aclZvamJ0bytZY2VHRHE2THN0V1NHN0VPNkhyYVV0SG5xYVVE?=
 =?utf-8?B?enRtZGlQM3hlVjN2YnNQQVI1U1NJbnd3UkY1NW5CQlZXMVBEU1ZtLzU1aXFO?=
 =?utf-8?B?cll2dXNBOFcxZVNBL3hLZzhycm1aTUpUVVZCdDhTV1htVEtPWGhwc1ovbGsv?=
 =?utf-8?B?TjhNblBndHltTGxoTmhvT3E1WU45dlJYTXREL0lsT0RFU3dJNzZQMmhmcW1h?=
 =?utf-8?B?V3BRZlVRODFWSmIrYlZPZ04wZWVPUVRVY09Vc0Z0VTRVajdMYkhvdXFGRk9R?=
 =?utf-8?B?Wi9TcFB6V0tFZlVsOTVVK3c5WHhwVTl3K0RuYVdPZzNOYmtMUERkZkU5RUtH?=
 =?utf-8?B?N1h0RFJub2pleE1wQ1d2cDAvRHFqRDF5RktXNXFpNkZLOWh5aGZob3lRS0to?=
 =?utf-8?B?S1o2UFJOT2tad0lMMmFRSmFCOUcwTVJheFQySjVMNWF3c2ErRy9XS1lLaWJN?=
 =?utf-8?B?K2ZYRE5Tam1uNkt2T3lGMXdhZVZHNVhaQnI2TnRKYzIvbmw5YXdlZng2VUJ3?=
 =?utf-8?B?SWlsclZwY3RHUXdxemVOSGJyV2NMeGZJbkY1QzYrdTIwV2VDZElSZU8yV1Fr?=
 =?utf-8?Q?dV/8ch5T3DAv25LJJjB0TcQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3e6c8e-9bb1-4067-e5cf-08dc333065a0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 22:56:53.8274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bghK35X3a+lpUxk/wzb01YLLNy98d+Z9dRwPTkFzWVrQEcfWCm1UMaXghBvLIUhjo+Y7Xi4sPB4QDzgNagAk3dMe53YOGQ37hwEPyXw/0JU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7448
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

On Mon, Feb 12, 2024 at 10:44:12PM -0800, Ashutosh Dixit wrote:
>Introduce add/remove config perf ops for OA. OA configurations consist of a
>set of event/counter select register address/value pairs. The add_config
>perf op validates and stores such configurations and also exposes them in
>the metrics sysfs. These configurations will be programmed to OA unit HW
>when an OA stream using a configuration is opened. The OA stream can also
>switch to other stored configurations.
>
>v2: Start config id's from 1 and other minor review comments (Umesh)
>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c   |   4 +
> drivers/gpu/drm/xe/xe_oa.c       | 405 +++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_oa.h       |   8 +
> drivers/gpu/drm/xe/xe_oa_types.h |  10 +
> drivers/gpu/drm/xe/xe_perf.c     |  16 ++
> include/uapi/drm/xe_drm.h        |  25 ++
> 6 files changed, 468 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index e5529d584eeb3..8bbcf9b1ab89b 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -549,6 +549,8 @@ int xe_device_probe(struct xe_device *xe)
>
> 	xe_display_register(xe);
>
>+	xe_oa_register(xe);
>+
> 	xe_debugfs_register(xe);
>
> 	xe_hwmon_register(xe);
>@@ -593,6 +595,8 @@ void xe_device_remove(struct xe_device *xe)
> 	struct xe_gt *gt;
> 	u8 id;
>
>+	xe_oa_unregister(xe);
>+
> 	xe_device_remove_display(xe);
>
> 	xe_display_fini(xe);
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index c6cb3bd9ff68b..a62f71244ec15 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -10,9 +10,32 @@
> #include "xe_gt.h"
> #include "xe_mmio.h"
> #include "xe_oa.h"
>+#include "xe_perf.h"
>
> #define XE_OA_UNIT_INVALID U32_MAX
>
>+struct xe_oa_reg {
>+	struct xe_reg addr;
>+	u32 value;
>+};
>+
>+struct xe_oa_config {
>+	struct xe_oa *oa;
>+
>+	char uuid[UUID_STRING_LEN + 1];
>+	int id;
>+
>+	const struct xe_oa_reg *regs;
>+	u32 regs_len;
>+
>+	struct attribute_group sysfs_metric;
>+	struct attribute *attrs[2];
>+	struct kobj_attribute sysfs_metric_id;
>+
>+	struct kref ref;
>+	struct rcu_head rcu;
>+};
>+
> #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
>
> static const struct xe_oa_format oa_formats[] = {
>@@ -37,6 +60,376 @@ static const struct xe_oa_format oa_formats[] = {
> 	[XE_OA_FORMAT_PEC36u64_G1_4_G2_32]	= { 4, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
> };
>
>+static void xe_oa_config_release(struct kref *ref)
>+{
>+	struct xe_oa_config *oa_config =
>+		container_of(ref, typeof(*oa_config), ref);
>+
>+	kfree(oa_config->regs);
>+
>+	kfree_rcu(oa_config, rcu);
>+}
>+
>+static void xe_oa_config_put(struct xe_oa_config *oa_config)
>+{
>+	if (!oa_config)
>+		return;
>+
>+	kref_put(&oa_config->ref, xe_oa_config_release);
>+}
>+
>+static bool xe_oa_is_valid_flex_addr(struct xe_oa *oa, u32 addr)
>+{
>+	static const struct xe_reg flex_eu_regs[] = {
>+		EU_PERF_CNTL0,
>+		EU_PERF_CNTL1,
>+		EU_PERF_CNTL2,
>+		EU_PERF_CNTL3,
>+		EU_PERF_CNTL4,
>+		EU_PERF_CNTL5,
>+		EU_PERF_CNTL6,
>+	};
>+	int i;
>+
>+	for (i = 0; i < ARRAY_SIZE(flex_eu_regs); i++) {
>+		if (flex_eu_regs[i].addr == addr)
>+			return true;
>+	}
>+	return false;
>+}
>+
>+static bool xe_oa_reg_in_range_table(u32 addr, const struct xe_mmio_range *table)
>+{
>+	while (table->start && table->end) {
>+		if (addr >= table->start && addr <= table->end)
>+			return true;
>+
>+		table++;
>+	}
>+
>+	return false;
>+}
>+
>+static const struct xe_mmio_range xehp_oa_b_counters[] = {
>+	{ .start = 0xdc48, .end = 0xdc48 },	/* OAA_ENABLE_REG */
>+	{ .start = 0xdd00, .end = 0xdd48 },	/* OAG_LCE0_0 - OAA_LENABLE_REG */
>+	{}
>+};
>+
>+static const struct xe_mmio_range gen12_oa_b_counters[] = {
>+	{ .start = 0x2b2c, .end = 0x2b2c },	/* OAG_OA_PESS */
>+	{ .start = 0xd900, .end = 0xd91c },	/* OAG_OASTARTTRIG[1-8] */
>+	{ .start = 0xd920, .end = 0xd93c },	/* OAG_OAREPORTTRIG1[1-8] */
>+	{ .start = 0xd940, .end = 0xd97c },	/* OAG_CEC[0-7][0-1] */
>+	{ .start = 0xdc00, .end = 0xdc3c },	/* OAG_SCEC[0-7][0-1] */
>+	{ .start = 0xdc40, .end = 0xdc40 },	/* OAG_SPCTR_CNF */
>+	{ .start = 0xdc44, .end = 0xdc44 },	/* OAA_DBG_REG */
>+	{}
>+};
>+
>+static const struct xe_mmio_range mtl_oam_b_counters[] = {
>+	{ .start = 0x393000, .end = 0x39301c },	/* OAM_STARTTRIG1[1-8] */
>+	{ .start = 0x393020, .end = 0x39303c },	/* OAM_REPORTTRIG1[1-8] */
>+	{ .start = 0x393040, .end = 0x39307c },	/* OAM_CEC[0-7][0-1] */
>+	{ .start = 0x393200, .end = 0x39323C },	/* MPES[0-7] */
>+	{}
>+};
>+
>+static const struct xe_mmio_range xe2_oa_b_counters[] = {
>+	{ .start = 0x393200, .end = 0x39323C },	/* MPES_0_MPES_SAG - MPES_7_UPPER_MPES_SAG */
>+	{ .start = 0x394200, .end = 0x39423C },	/* MPES_0_MPES_SCMI0 - MPES_7_UPPER_MPES_SCMI0 */
>+	{ .start = 0x394A00, .end = 0x394A3C },	/* MPES_0_MPES_SCMI1 - MPES_7_UPPER_MPES_SCMI1 */
>+	{},
>+};

Looking at xe rtp code, I am guessing these tables can be converted to 
use the RTP pattern. (xe_rtp.c). Anyways, this does not impact uApi, so 
can be done later if possible.

Thanks,
Umesh


>+
>+static bool xe_oa_is_valid_b_counter_addr(struct xe_oa *oa, u32 addr)
>+{
>+	return xe_oa_reg_in_range_table(addr, xehp_oa_b_counters) ||
>+		xe_oa_reg_in_range_table(addr, gen12_oa_b_counters) ||
>+		xe_oa_reg_in_range_table(addr, mtl_oam_b_counters) ||
>+		(GRAPHICS_VER(oa->xe) >= 20 &&
>+		 xe_oa_reg_in_range_table(addr, xe2_oa_b_counters));
>+}
>+
>+static const struct xe_mmio_range mtl_oa_mux_regs[] = {
>+	{ .start = 0x0d00, .end = 0x0d04 },	/* RPM_CONFIG[0-1] */
>+	{ .start = 0x0d0c, .end = 0x0d2c },	/* NOA_CONFIG[0-8] */
>+	{ .start = 0x9840, .end = 0x9840 },	/* GDT_CHICKEN_BITS */
>+	{ .start = 0x9884, .end = 0x9888 },	/* NOA_WRITE */
>+	{ .start = 0x38d100, .end = 0x38d114},	/* VISACTL */
>+	{}
>+};
>+
>+static const struct xe_mmio_range gen12_oa_mux_regs[] = {
>+	{ .start = 0x0d00, .end = 0x0d04 },     /* RPM_CONFIG[0-1] */
>+	{ .start = 0x0d0c, .end = 0x0d2c },     /* NOA_CONFIG[0-8] */
>+	{ .start = 0x9840, .end = 0x9840 },	/* GDT_CHICKEN_BITS */
>+	{ .start = 0x9884, .end = 0x9888 },	/* NOA_WRITE */
>+	{ .start = 0x20cc, .end = 0x20cc },	/* WAIT_FOR_RC6_EXIT */
>+	{}
>+};
>+
>+static const struct xe_mmio_range xe2_oa_mux_regs[] = {
>+	{ .start = 0x13000,  .end = 0x137FC },	/* PES_0_PESL0 - PES_63_UPPER_PESL3 */
>+	{},
>+};
>+
>+static bool xe_oa_is_valid_mux_addr(struct xe_oa *oa, u32 addr)
>+{
>+	if (GRAPHICS_VER(oa->xe) >= 20)
>+		return xe_oa_reg_in_range_table(addr, xe2_oa_mux_regs);
>+	else if (GRAPHICS_VERx100(oa->xe) >= 1270)
>+		return xe_oa_reg_in_range_table(addr, mtl_oa_mux_regs);
>+	else
>+		return xe_oa_reg_in_range_table(addr, gen12_oa_mux_regs);
>+}
>+
>+static bool xe_oa_is_valid_config_reg_addr(struct xe_oa *oa, u32 addr)
>+{
>+	return xe_oa_is_valid_flex_addr(oa, addr) ||
>+		xe_oa_is_valid_b_counter_addr(oa, addr) ||
>+		xe_oa_is_valid_mux_addr(oa, addr);
>+}
>+
>+static struct xe_oa_reg *
>+xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
>+		 u32 __user *regs, u32 n_regs)
>+{
>+	struct xe_oa_reg *oa_regs;
>+	int err;
>+	u32 i;
>+
>+	oa_regs = kmalloc_array(n_regs, sizeof(*oa_regs), GFP_KERNEL);
>+	if (!oa_regs)
>+		return ERR_PTR(-ENOMEM);
>+
>+	for (i = 0; i < n_regs; i++) {
>+		u32 addr, value;
>+
>+		err = get_user(addr, regs);
>+		if (err)
>+			goto addr_err;
>+
>+		if (!is_valid(oa, addr)) {
>+			drm_dbg(&oa->xe->drm, "Invalid oa_reg address: %X\n", addr);
>+			err = -EINVAL;
>+			goto addr_err;
>+		}
>+
>+		err = get_user(value, regs + 1);
>+		if (err)
>+			goto addr_err;
>+
>+		oa_regs[i].addr = XE_REG(addr);
>+		oa_regs[i].value = value;
>+
>+		regs += 2;
>+	}
>+
>+	return oa_regs;
>+
>+addr_err:
>+	kfree(oa_regs);
>+	return ERR_PTR(err);
>+}
>+
>+static ssize_t show_dynamic_id(struct kobject *kobj,
>+			       struct kobj_attribute *attr,
>+			       char *buf)
>+{
>+	struct xe_oa_config *oa_config =
>+		container_of(attr, typeof(*oa_config), sysfs_metric_id);
>+
>+	return sprintf(buf, "%d\n", oa_config->id);
>+}
>+
>+static int create_dynamic_oa_sysfs_entry(struct xe_oa *oa,
>+					 struct xe_oa_config *oa_config)
>+{
>+	sysfs_attr_init(&oa_config->sysfs_metric_id.attr);
>+	oa_config->sysfs_metric_id.attr.name = "id";
>+	oa_config->sysfs_metric_id.attr.mode = 0444;
>+	oa_config->sysfs_metric_id.show = show_dynamic_id;
>+	oa_config->sysfs_metric_id.store = NULL;
>+
>+	oa_config->attrs[0] = &oa_config->sysfs_metric_id.attr;
>+	oa_config->attrs[1] = NULL;
>+
>+	oa_config->sysfs_metric.name = oa_config->uuid;
>+	oa_config->sysfs_metric.attrs = oa_config->attrs;
>+
>+	return sysfs_create_group(oa->metrics_kobj, &oa_config->sysfs_metric);
>+}
>+
>+int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
>+			   struct drm_file *file)
>+{
>+	struct xe_oa *oa = &to_xe_device(dev)->oa;
>+	struct drm_xe_oa_config param;
>+	struct drm_xe_oa_config *arg = &param;
>+	struct xe_oa_config *oa_config, *tmp;
>+	struct xe_oa_reg *regs;
>+	int err, id;
>+
>+	if (!oa->xe) {
>+		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
>+		return -ENODEV;
>+	}
>+
>+	if (xe_perf_stream_paranoid && !perfmon_capable()) {
>+		drm_dbg(&oa->xe->drm, "Insufficient privileges to add xe OA config\n");
>+		return -EACCES;
>+	}
>+
>+	err = __copy_from_user(&param, data, sizeof(param));
>+	if (XE_IOCTL_DBG(oa->xe, err))
>+		return -EFAULT;
>+
>+	if (XE_IOCTL_DBG(oa->xe, arg->extensions) ||
>+	    XE_IOCTL_DBG(oa->xe, !arg->regs_ptr) ||
>+	    XE_IOCTL_DBG(oa->xe, !arg->n_regs))
>+		return -EINVAL;
>+
>+	oa_config = kzalloc(sizeof(*oa_config), GFP_KERNEL);
>+	if (!oa_config)
>+		return -ENOMEM;
>+
>+	oa_config->oa = oa;
>+	kref_init(&oa_config->ref);
>+
>+	if (!uuid_is_valid(arg->uuid)) {
>+		drm_dbg(&oa->xe->drm, "Invalid uuid format for OA config\n");
>+		err = -EINVAL;
>+		goto reg_err;
>+	}
>+
>+	/* Last character in oa_config->uuid will be 0 because oa_config is kzalloc */
>+	memcpy(oa_config->uuid, arg->uuid, sizeof(arg->uuid));
>+
>+	oa_config->regs_len = arg->n_regs;
>+	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_config_reg_addr,
>+				u64_to_user_ptr(arg->regs_ptr),
>+				arg->n_regs);
>+	if (IS_ERR(regs)) {
>+		drm_dbg(&oa->xe->drm, "Failed to create OA config for mux_regs\n");
>+		err = PTR_ERR(regs);
>+		goto reg_err;
>+	}
>+	oa_config->regs = regs;
>+
>+	err = mutex_lock_interruptible(&oa->metrics_lock);
>+	if (err)
>+		goto reg_err;
>+
>+	/* We shouldn't have too many configs, so this iteration shouldn't be too costly */
>+	idr_for_each_entry(&oa->metrics_idr, tmp, id) {
>+		if (!strcmp(tmp->uuid, oa_config->uuid)) {
>+			drm_dbg(&oa->xe->drm, "OA config already exists with this uuid\n");
>+			err = -EADDRINUSE;
>+			goto sysfs_err;
>+		}
>+	}
>+
>+	err = create_dynamic_oa_sysfs_entry(oa, oa_config);
>+	if (err) {
>+		drm_dbg(&oa->xe->drm, "Failed to create sysfs entry for OA config\n");
>+		goto sysfs_err;
>+	}
>+
>+	oa_config->id = idr_alloc(&oa->metrics_idr, oa_config, 1, 0, GFP_KERNEL);
>+	if (oa_config->id < 0) {
>+		drm_dbg(&oa->xe->drm, "Failed to create sysfs entry for OA config\n");
>+		err = oa_config->id;
>+		goto sysfs_err;
>+	}
>+
>+	mutex_unlock(&oa->metrics_lock);
>+
>+	drm_dbg(&oa->xe->drm, "Added config %s id=%i\n", oa_config->uuid, oa_config->id);
>+
>+	return oa_config->id;
>+
>+sysfs_err:
>+	mutex_unlock(&oa->metrics_lock);
>+reg_err:
>+	xe_oa_config_put(oa_config);
>+	drm_dbg(&oa->xe->drm, "Failed to add new OA config\n");
>+	return err;
>+}
>+
>+int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
>+			      struct drm_file *file)
>+{
>+	struct xe_oa *oa = &to_xe_device(dev)->oa;
>+	struct xe_oa_config *oa_config;
>+	u64 arg, *ptr = data;
>+	int ret;
>+
>+	if (!oa->xe) {
>+		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
>+		return -ENODEV;
>+	}
>+
>+	if (xe_perf_stream_paranoid && !perfmon_capable()) {
>+		drm_dbg(&oa->xe->drm, "Insufficient privileges to remove xe OA config\n");
>+		return -EACCES;
>+	}
>+
>+	ret = get_user(arg, ptr);
>+	if (XE_IOCTL_DBG(oa->xe, ret))
>+		return ret;
>+
>+	ret = mutex_lock_interruptible(&oa->metrics_lock);
>+	if (ret)
>+		return ret;
>+
>+	oa_config = idr_find(&oa->metrics_idr, arg);
>+	if (!oa_config) {
>+		drm_dbg(&oa->xe->drm, "Failed to remove unknown OA config\n");
>+		ret = -ENOENT;
>+		goto err_unlock;
>+	}
>+
>+	WARN_ON(arg != oa_config->id);
>+
>+	sysfs_remove_group(oa->metrics_kobj, &oa_config->sysfs_metric);
>+	idr_remove(&oa->metrics_idr, arg);
>+
>+	mutex_unlock(&oa->metrics_lock);
>+
>+	drm_dbg(&oa->xe->drm, "Removed config %s id=%i\n", oa_config->uuid, oa_config->id);
>+
>+	xe_oa_config_put(oa_config);
>+
>+	return 0;
>+
>+err_unlock:
>+	mutex_unlock(&oa->metrics_lock);
>+	return ret;
>+}
>+
>+void xe_oa_register(struct xe_device *xe)
>+{
>+	struct xe_oa *oa = &xe->oa;
>+
>+	if (!oa->xe)
>+		return;
>+
>+	oa->metrics_kobj = kobject_create_and_add("metrics",
>+						  &xe->drm.primary->kdev->kobj);
>+}
>+
>+void xe_oa_unregister(struct xe_device *xe)
>+{
>+	struct xe_oa *oa = &xe->oa;
>+
>+	if (!oa->metrics_kobj)
>+		return;
>+
>+	kobject_put(oa->metrics_kobj);
>+	oa->metrics_kobj = NULL;
>+}
>+
> static u32 num_oa_units_per_gt(struct xe_gt *gt)
> {
> 	return 1;
>@@ -232,6 +625,9 @@ int xe_oa_init(struct xe_device *xe)
> 	for_each_gt(gt, xe, i)
> 		mutex_init(&gt->oa.gt_lock);
>
>+	mutex_init(&oa->metrics_lock);
>+	idr_init_base(&oa->metrics_idr, 1);
>+
> 	ret = xe_oa_init_oa_units(oa);
> 	if (ret) {
> 		drm_err(&xe->drm, "OA initialization failed %d\n", ret);
>@@ -245,6 +641,12 @@ int xe_oa_init(struct xe_device *xe)
> 	return ret;
> }
>
>+static int destroy_config(int id, void *p, void *data)
>+{
>+	xe_oa_config_put(p);
>+	return 0;
>+}
>+
> void xe_oa_fini(struct xe_device *xe)
> {
> 	struct xe_oa *oa = &xe->oa;
>@@ -257,5 +659,8 @@ void xe_oa_fini(struct xe_device *xe)
> 	for_each_gt(gt, xe, i)
> 		kfree(gt->oa.oa_unit);
>
>+	idr_for_each(&oa->metrics_idr, destroy_config, oa);
>+	idr_destroy(&oa->metrics_idr);
>+
> 	oa->xe = NULL;
> }
>diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
>index a2f301e2be57b..4a4e3b2b70fcd 100644
>--- a/drivers/gpu/drm/xe/xe_oa.h
>+++ b/drivers/gpu/drm/xe/xe_oa.h
>@@ -8,9 +8,17 @@
>
> #include "xe_oa_types.h"
>
>+struct drm_device;
>+struct drm_file;
> struct xe_device;
>
> int xe_oa_init(struct xe_device *xe);
> void xe_oa_fini(struct xe_device *xe);
>+void xe_oa_register(struct xe_device *xe);
>+void xe_oa_unregister(struct xe_device *xe);
>+int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
>+			   struct drm_file *file);
>+int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
>+			      struct drm_file *file);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index aecb501474d89..ea1ca969a04f1 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -6,6 +6,7 @@
> #ifndef _XE_OA_TYPES_H_
> #define _XE_OA_TYPES_H__
>
>+#include <linux/idr.h>
> #include <linux/math.h>
> #include <linux/types.h>
> #include <linux/mutex.h>
>@@ -116,6 +117,15 @@ struct xe_oa {
> 	/** @xe: back pointer to xe device */
> 	struct xe_device *xe;
>
>+	/** @metrics_kobj: kobj for metrics sysfs */
>+	struct kobject *metrics_kobj;
>+
>+	/** @metrics_lock: lock protecting add/remove configs */
>+	struct mutex metrics_lock;
>+
>+	/** @metrics_idr: List of dynamic configurations (struct xe_oa_config) */
>+	struct idr metrics_idr;
>+
> 	/** @oa_formats: tracks all OA formats across platforms */
> 	const struct xe_oa_format *oa_formats;
>
>diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
>index 37538e98dcc04..2aee4c7989486 100644
>--- a/drivers/gpu/drm/xe/xe_perf.c
>+++ b/drivers/gpu/drm/xe/xe_perf.c
>@@ -6,11 +6,25 @@
> #include <linux/errno.h>
> #include <linux/sysctl.h>
>
>+#include "xe_oa.h"
> #include "xe_perf.h"
>
> u32 xe_perf_stream_paranoid = true;
> static struct ctl_table_header *sysctl_header;
>
>+static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg,
>+		       struct drm_file *file)
>+{
>+	switch (arg->perf_op) {
>+	case DRM_XE_PERF_OP_ADD_CONFIG:
>+		return xe_oa_add_config_ioctl(dev, (void *)arg->param, file);
>+	case DRM_XE_PERF_OP_REMOVE_CONFIG:
>+		return xe_oa_remove_config_ioctl(dev, (void *)arg->param, file);
>+	default:
>+		return -EINVAL;
>+	}
>+}
>+
> int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> {
> 	struct drm_xe_perf_param *arg = data;
>@@ -19,6 +33,8 @@ int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> 		return -EINVAL;
>
> 	switch (arg->perf_type) {
>+	case DRM_XE_PERF_TYPE_OA:
>+		return xe_oa_ioctl(dev, arg, file);
> 	default:
> 		return -EINVAL;
> 	}
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 46465a3c7dc62..9dd77edf49010 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1344,6 +1344,7 @@ struct drm_xe_wait_user_fence {
>
> /** enum drm_xe_perf_type - Perf stream types */
> enum drm_xe_perf_type {
>+	DRM_XE_PERF_TYPE_OA,
> 	DRM_XE_PERF_TYPE_MAX,
> };
>
>@@ -1424,6 +1425,30 @@ enum drm_xe_oa_format_type {
> 	DRM_XE_OA_FMT_TYPE_PEC,
> };
>
>+/**
>+ * struct drm_xe_oa_config - OA metric configuration
>+ *
>+ * Multiple OA configs can be added using @DRM_XE_PERF_OP_ADD_CONFIG. A
>+ * particular config can be specified when opening an OA stream using
>+ * @DRM_XE_OA_PROPERTY_OA_METRIC_SET property.
>+ */
>+struct drm_xe_oa_config {
>+	/** @extensions: Pointer to the first extension struct, if any */
>+	__u64 extensions;
>+
>+	/** @uuid: String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x" */
>+	char uuid[36];
>+
>+	/** @n_regs: Number of regs in @regs_ptr */
>+	__u32 n_regs;
>+
>+	/**
>+	 * @regs_ptr: Pointer to (register address, value) pairs for OA config
>+	 * registers. Expected length of buffer is: (2 * sizeof(u32) * @n_regs).
>+	 */
>+	__u64 regs_ptr;
>+};
>+
> #if defined(__cplusplus)
> }
> #endif
>-- 
>2.41.0
>
