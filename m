Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224BACD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 16:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B354910E8D4;
	Thu,  4 Apr 2024 16:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DyrWCb/q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B17A10E8D4
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 16:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712246945; x=1743782945;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PU+tic1CsLlrk+6tkBMWiC3teO9p5fo+C+7oIu3OQSE=;
 b=DyrWCb/qiC8gY0z9LYLhwse8SLD0562ctJNVX6HEpnngNVsB4JUggnNY
 UmNOGQJ5pPKNJsc4ZK9EUuDrmoIEZ17a2nwoEjRs44mmVfTApt82QoPdb
 92HFLGwIBT6afAOYLL35zbZUGGEyqXT3FVySAT9pimfzUCDMrhmE1N/zp
 dlZk2m97ZLdWMCtP90ERDI7OrBPsi/VmqZEFKJRRFthcoS4eM45jxogtY
 +61zXI86hJjKvO9xWjunz/K6zcfXgiBrq+QWRrLXHj6ekLso3aQX2S4Ua
 J9jbPncODVTFgrZhdm2iKSceqv5d0MVA+vY6G374qfQ06UZsOvDevsdLH w==;
X-CSE-ConnectionGUID: newGthXvQPOQJM21vMOQWw==
X-CSE-MsgGUID: Tcmx6FfyS4K2pgHYqfQ3kA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7406480"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7406480"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 09:06:14 -0700
X-CSE-ConnectionGUID: k/juSpCmSUmoIeyF/SiQJQ==
X-CSE-MsgGUID: cnyx2fq2Qzy7ZVHeuwBIDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18878086"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 09:06:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 09:06:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 09:06:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 09:06:12 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 09:06:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNccQd6Sc+42gP5k44/FS7Rwuc08jQrRwan1NwDvTXU9KFW93dw3l14f10Cf+Qn0+IGhy5TvAU0OZGXJP/d14Vja8bSPKyO80u8LUKTj/n+KmtrUNGmCrHZUYTJDUr8xqZAl++qVHaDDCt5uFlFAZtph1V8muT+5nd4d9slcmtDSB+h2dqQk7c2rwT75T1a6D8TD5nhMYmMez66butdgYVRdaJsrLfBTkcCrtzJOT17/bsGzVZpolADDQtl4ST5kZxKw9tmJuAs5a0DvM9mo+PEqTiTuyZKsQnc+hdzhICNOczPJesl14pG72wStGW30Yl2ZUL0Km0CpvHhjKk6a6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Jgy8+94mZdu3SvkM/ITVKhfIXtIdpvAvzM++Iwj/tg=;
 b=XQhRz2QHO3yUPnfQxXHbfCg8gFdNMePKU1+t62BtiENDXaT/fd3KSevfwS+beOPVL58satwBbBaXv80lp+U81sWOFSoCpBs3r8jVgwyv+PzUFiFrR+ABgoP6I8mL4jUqu/udhA//39eU3TTmBTRmjB9K/Orqd9uqCYUDrTylBB/SaDn2oueQWVE0gNw/vFKR5u2GH/4gEMgxAgY2CwzQvGGSJG48TOQB99vQGiQuTDHHFfj55SqyJ9Pg55p6/FliLaMBV/KkbsNUj+noNkXt6k9H9GEWBoYJ6XzV1z3tAzLfsV2Cit7zaQh0m+j8TwbrrBuXMnzlQR0dGd6Gpa7oag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7683.namprd11.prod.outlook.com (2603:10b6:8:df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 4 Apr
 2024 16:06:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 16:06:10 +0000
Date: Thu, 4 Apr 2024 11:06:06 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5 2/4] drm/xe/hwmon: Update xe_hwmon_get_reg to return
 struct xe_reg
Message-ID: <j6cj2mg3z2b7fod7phglka6y4oebrrjelq2d7rcl4pdyz2ybkl@m3hoipg6aq6r>
References: <20240404035441.965590-1-karthik.poosa@intel.com>
 <20240404035441.965590-3-karthik.poosa@intel.com>
 <87plv5cy7r.fsf@intel.com>
 <c652b81a-fd71-4d15-abb9-a598118676bd@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <c652b81a-fd71-4d15-abb9-a598118676bd@intel.com>
X-ClientProxiedBy: SJ0PR13CA0161.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7683:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 26I75BlsNjbv90xalke6/YBbT6sgnbV7uzkwy26AluC9TkgQ43uIV6fI0PjlbSpyPt7/GHiVJJv0vUAqqwgFBcbRHV7VD2LTWQhnTeS9o8am4YFn9Ah/o8EEW1kfd4ZJdWH5BG1lQ7uvTv3wnNRl2uDdflEX/s+X4TLrfxYCJAgsrkD4kvEmQdWIJVHl67SLDGXmVsSdkLqgkE+Xy9MPSh5HoM2PpoVsJEBskiozcSYnuHUxakqHCKfXH71WMyMrcq5iw3juZ40pweAFgS0ja2z+DuU3UsTajkOq9OSEuyBA8+W6ryI+P4JqmrJQY369TSBCIUgNlfaGYsxI3QTFN9IVClGcjxRZsdUNvEiunOaAnIzAYno8RaDApIkYlCQWf9PX5hBpjc4zoWLVsOvJWjteRkCHJ6+pBMG3CdrGOovDKqOJp9bdD0UoAWYH5tcxt2lz8AhIPB/Gnvx7wtPWytQUPAc3GNIvI8mW8JgkoW2kToa1M1Tz6DhMCbNsKzNZJFuzuOfTBoLByHWALw8yZi7HgebGgP1juBPKKdihNCzf+IPKl+scEeY6R1o1sUyN5kZF4hg455j0wjcwS5s4e6fkrKNiGU66XTFYt22TJ1TZ5T1HRw5W8H8Qa1zzGfsriWSKMUPmRGnFq1fynsiX209640w5DO5QbbIB+YsAuLM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lTEyKfUyJShVT2hnfPnzczAuTbx0SsiPs018aGL+HjetD5gsB+ZEo10DfZri?=
 =?us-ascii?Q?KIKLt1D0/qn8w4AuF4Infxgj/ZDp0QMNlKLFXaFjapaZplXTciLjqVpyK6lE?=
 =?us-ascii?Q?hXvPLQCL92UMYdKu3OBBt4jl9+LqhOS+B1JVbv5/tVHIArfqE0ZIolxgkLpq?=
 =?us-ascii?Q?+PavpYKREgl7xR8JxuwXqTGA4md3DnioSaK03dy315wshhGpAhqOlEBFa//k?=
 =?us-ascii?Q?+OjI3+LltDt2y+B3EwnuCq1kKMQtfrIbDGugqFo5Oftm5hCnZ57HRFkk5jF/?=
 =?us-ascii?Q?xnE0JjnbPagtDxcdXpPLkxM9rrnlbton9N2JQa17T3u7XBIspDHdU7APtVnz?=
 =?us-ascii?Q?4l6AQaWbKQjyIKbPm4c3km20dbdD8wwRhpiRVxHGJc++wLQlkTbDo2bDjCjG?=
 =?us-ascii?Q?8VM/lVGB1f0myvKUpNc18bPiQyP6fFs9WredJtbVimVIsR0I7dEkf6BKhg2J?=
 =?us-ascii?Q?4KTEGxYmsZtqmXTdsusvWC8oo7goz00rXRjgh8o8fx4oj3wL1M06dGo2YJIT?=
 =?us-ascii?Q?uWAaECtP7OqJvG3riyRkxGi2Cj2Si4T7hA2zj2E2CFA02o4PtrI9AN4emfQU?=
 =?us-ascii?Q?WAh5M2GkM5wAeNk78h+5aUAEQj2aOTgcEModVO6lgWck60+RPPd9NZw98Smx?=
 =?us-ascii?Q?3yWITFRedhHUir5GAznJuDWLUutcBFzrwrmdaYiPnbxgcJ/etG4v+RGHNduA?=
 =?us-ascii?Q?3J55byIlwod5DawtKh+goVvKtDW5C0FXAmlg64NLS5CUe4/6vcVws0gezNNW?=
 =?us-ascii?Q?ktjMkBheEgtDsgPBFumf0RX7T51kB+egvsgdgBUKZWHqTGwoVj8KIgKdRscb?=
 =?us-ascii?Q?dOXZesuh65XS3qkWrrSe7BxWf8ImOBQYbdn0M2fzrLKTPJDSucTcZlRZNJKa?=
 =?us-ascii?Q?+hFcusMHe1kIpVTrgJ8XPfaL8Ep80Njvv2wq1ls9vhRV8lSSKhTf3a2AK9yi?=
 =?us-ascii?Q?cds7NvFsRd9PtcIg5ral14Iz1XC1gFWlO6TX4Q30vYSB/QILUJz740DvJ+if?=
 =?us-ascii?Q?+KwNdqlE0pcc18uHSySJ2egDKnOt0lSU0LNA0rSviHMaLZlaxcAQGHGd2q/z?=
 =?us-ascii?Q?Lug+ysvZRUdsRtfScOwXwN/RWuhdzNBXK6M/HKXrIONznXOiwRHF/nO+lGNa?=
 =?us-ascii?Q?pN5/P/oV+wpBncSdO3pTYFluY7BmNabwV7t9JLA/QiKuX+EV+kVCU3jXk83H?=
 =?us-ascii?Q?y4FKb8xdUjgqEM3qm6llmFgEYAiSFVGAQM8gVtTvQGj3xonF182lWVWevkJS?=
 =?us-ascii?Q?gq2x7PkdCwYCJBncjtdYsaqIg/Ph6VhYG0CVw3ymXDv0uKCU5u5F4zD6ezKq?=
 =?us-ascii?Q?+NGeIySyZB23AQ9JEQZVn3hAJtYIRWQs+NrsIvYDudsCgRESSamh8zb3MZRU?=
 =?us-ascii?Q?gl7X0PKbIq6CalY6MkjqgAi5hxw3SlVMurayo1z2DYYQbEJ2sAYv02iVr4mQ?=
 =?us-ascii?Q?4XpVE6ji3o9S2/EAgqSEzhYPkZpVzebl5Gk17I2ufsbUBiWe455rg1blpxZ2?=
 =?us-ascii?Q?gVJ+FQR3uzvQgkRRVE9vrcWkDC+2h045gND24rdBvh32HDpKW1t5V2RAyLcf?=
 =?us-ascii?Q?YmSbso1UrLEPRHaRCoeDame/Hvu0djgJCyiJiMJEDVZCgsTJoy1fQNx3Yv5t?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e6961a-7a87-4710-45f6-08dc54c124a9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 16:06:10.2190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6cRJS1yylT+KA2NDqmah+lAdoJqWEegSyjpNXW5epjGj2uZWhNNUuS2XgI1SgtieI1udGKdh14cPkcJD+LD7TjyrGpgcuJVBZaeb9DXRv10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7683
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

On Thu, Apr 04, 2024 at 03:24:53PM +0530, Poosa, Karthik wrote:
>
>On 04-04-2024 14:16, Jani Nikula wrote:
>>On Thu, 04 Apr 2024, Karthik Poosa <karthik.poosa@intel.com> wrote:
>>>Return register address as struct xe_reg from xe_hwmon_get_reg
>>>instead of u32. (Lucas)
>>>Use XE_REG_IS_VALID() from caller to check returned xe_reg. (Badal)
>>>These changes are done to have abstracted usage of struct xe_reg.
>>>
>>>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>>---
>>>  drivers/gpu/drm/xe/xe_hwmon.c | 47 +++++++++++++++++++----------------
>>>  1 file changed, 26 insertions(+), 21 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>>>index 7e8caac838e0..2385f05d9504 100644
>>>--- a/drivers/gpu/drm/xe/xe_hwmon.c
>>>+++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>>@@ -79,46 +79,46 @@ struct xe_hwmon {
>>>  	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>>>  };
>>>-static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, int channel)
>>>+static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
>>>+				      int channel)
>>>  {
>>>  	struct xe_device *xe = gt_to_xe(hwmon->gt);
>>>-	struct xe_reg reg = XE_REG(0);
>>>  	switch (hwmon_reg) {
>>>  	case REG_PKG_RAPL_LIMIT:
>>>  		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>>>-			reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
>>>+			return PVC_GT0_PACKAGE_RAPL_LIMIT;
>>>  		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>>>-			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
>>>+			return PCU_CR_PACKAGE_RAPL_LIMIT;
>>>  		break;
>>>  	case REG_PKG_POWER_SKU:
>>>  		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>>>-			reg = PVC_GT0_PACKAGE_POWER_SKU;
>>>+			return PVC_GT0_PACKAGE_POWER_SKU;
>>>  		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>>>-			reg = PCU_CR_PACKAGE_POWER_SKU;
>>>+			return PCU_CR_PACKAGE_POWER_SKU;
>>>  		break;
>>>  	case REG_PKG_POWER_SKU_UNIT:
>>>  		if (xe->info.platform == XE_PVC)
>>>-			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
>>>+			return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
>>>  		else if (xe->info.platform == XE_DG2)
>>>-			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
>>>+			return PCU_CR_PACKAGE_POWER_SKU_UNIT;
>>>  		break;
>>>  	case REG_GT_PERF_STATUS:
>>>  		if (xe->info.platform == XE_DG2 && channel == CHANNEL_PKG)
>>>-			reg = GT_PERF_STATUS;
>>>+			return GT_PERF_STATUS;
>>>  		break;
>>>  	case REG_PKG_ENERGY_STATUS:
>>>  		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>>>-			reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
>>>+			return PVC_GT0_PLATFORM_ENERGY_STATUS;
>>>  		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>>>-			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
>>>+			return PCU_CR_PACKAGE_ENERGY_STATUS;
>>>  		break;
>>>  	default:
>>>  		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
>>>  		break;
>>>  	}
>>>-	return reg.raw;
>>>+	return XE_REG(0);
>>You might want to look at i915_reg_defs.h, which abstracts away the
>>magic 0 as the invalid address, and provides type safety for the reg
>>validity checks via _Generic:
>>
>>#define INVALID_MMIO_REG _MMIO(0)
>>
>>#define i915_mmio_reg_offset(r) \
>>	_Generic((r), i915_reg_t: (r).reg, i915_mcr_reg_t: (r).reg)
>>#define i915_mmio_reg_equal(a, b) (i915_mmio_reg_offset(a) == i915_mmio_reg_offset(b))
>>#define i915_mmio_reg_valid(r) (!i915_mmio_reg_equal(r, INVALID_MMIO_REG))
>>
>>BR,
>>Jani.
>Lucas, do we need similar abstraction here ?

we can add that later, but we will may need to be more careful in xe as it's
the _addr_ that shows if a register is valid or not. In i915
i915_reg_t is just a struct wrapping the address. In xe it's wrapping a
union that contains the address.

XE_REG(0) is _a_ invalid register, not _the_ invalid register.
XE_REG(0, XE_REG_OPTION_MASKED) is invalid as well. Defining INVALID_XE_REG
could be misleading.

Yeah, having XE_REG(0) in the middle of the code may not be pretty,
but I think we can live with that for now.

Ditto for the equality check. In same places we want a equality with the
.raw, not the .addr to make sure we are not mixing variants of the
register for different platforms. We check this e.g. in the reg_sr
infra.

Lucas De Marchi
