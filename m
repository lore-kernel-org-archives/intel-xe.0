Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221FACD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 18:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B0C1133E9;
	Thu,  4 Apr 2024 18:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNNTpyKe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88B51133E9
 for <Intel-Xe@lists.freedesktop.org>; Thu,  4 Apr 2024 18:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712255416; x=1743791416;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ewSM5hlANDDLb3/WZBaTtYdAXYvXvNSuQc7VrWK6my0=;
 b=HNNTpyKe+uaH0JWy/V+IWcc6jheX9uewYBlf/P2uohJEBwJ4mDSNKesC
 ON31aWcxUQAfB3iSD6Ul7Wq5uzCE/5LiXGygBFJi1iE+6u22FvLBPFO/H
 f4m7JPxusA0m+t01AomBIBdF+GlEGjLmdCz+hk+dU7/Vx5Nd+bDkTGkgW
 sSLHzubuL+uSgQp0kYqQasEB5Iwg8uGY67YnUmkwHH5IsCrGNEGO0ZzCX
 mmhN3jSstHl96WaYKrD8NR6UZSnKk0zKp4UOTU1hhDn6toGj4Y8QvFP6a
 VXXrgFEw+npqkQs97+ocPsrD4Ya7lLQFFCGX7D0neXivy37aT0WI5bAIx A==;
X-CSE-ConnectionGUID: 7T4KVgphREGUyJpCs0xycw==
X-CSE-MsgGUID: LMSQBwgASCStke4gP4HOaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="32961362"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="32961362"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 11:30:15 -0700
X-CSE-ConnectionGUID: OzEyIVJWRDS3pSmsIE5icg==
X-CSE-MsgGUID: /lH0EfCeStihb0y183YjDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18813465"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 11:30:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 11:30:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 11:30:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 11:30:14 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 11:30:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDpdv454gHZx7Cjao2D30HFM09xzJJPoAZij5ueUc8lSi8gyLTctSve96NtyFaCpInol+QQJSiFEu7yl0I2dw75wCyBIX2/7ggLS+hjetLmo8Kk1SmaPpsdfBxu8H9FVjsJ+AomQfi+4kFQoAtRqMNnucr1u7EQdPM7nLYpQiYAYuixWJ6L154fX1lHnqB1bLXG3qrLKiOhLTMJHW7Clya2bLonA0wrBajaKcKWttSHRXKUZnzYHudX2mkb1mu3UpklJS7dMWATLniSDBIlbtNcs+aTNd4J2DesZiSdXqUwovxCR+jxwHoWKXeIgCngKqBqVlZG+uuyvSC6T0npVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91JZUsNtKxnf5Dmn+3E1Dj92QKUshsjJU8Wa7pFFw6Y=;
 b=R7HclyKnaHlwx3feTpv2EgttL64CMBY/wwlFmy70l7rurEGvE08pv3B6m/Z5hRnzpvq5FXhY378p3ONGa/3NhKcyKBhGwZkzcrbQ2A3SETCOW1ya9YtCAqjjnd50v6WExmrCu/qbwynK1XhSKQEDHN9whLMJkLljI3WEFIW7Rzvb02xUTQkhkyKwjHfNZgAv4Ireik5EFWVTgBhUc0/eI8I8hrxetkG4diLL4i8aqR0dqm7wI6YqWSqh958U0RTC6ZkspdXwXs1bDKeHX+AWda9j9h3DSMFZUPpKBAwEUKDIUbyUdNh1OAs5h9PnqbgoW/8XsbMkoifBL0Qtg+UYiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5308.namprd11.prod.outlook.com (2603:10b6:408:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 4 Apr
 2024 18:30:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 18:30:11 +0000
Date: Thu, 4 Apr 2024 13:30:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/2] drm/xe: Make read_perf_limit_reasons globally
 accessible
Message-ID: <k4kawsiv63glv32fnbdaokm7e3mxcv7pshp4zcv6q5d3nwusi7@alyh4sxjriya>
X-Patchwork-Hint: comment
References: <20240228011002.2454419-1-John.C.Harrison@Intel.com>
 <20240228011002.2454419-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240228011002.2454419-2-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR13CA0144.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5308:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: opkIXeVk5XDEiXOseURlwIaN6dbN/f7TF4NhAtCkelpEIpXpxWFTy6JswcPYaXOxQQEx6AI8I7LVEDlI5CU9KjXYK4dyDbuE5iSe5k7ELal6/E8OVICcAVyx2evNWBRreXG3UTwHi0DLU4U/Jj6Pc3gnJ+fS6gb8SjQG6y6bKBdzEQQVCLPlPlO0ngud9lSXs/k95EULHy29T/3jAhxGWqd01Fj53f4P7qh6jsfq5PBYq4y2eK+1msthPPYkqQ0FdH8wro3KJsxkOrT1XqZde6P4+oTUP5oiHsytc4PxWNMFNhj5kqhj3rChUCscV6Mb1UO2la6yzs0SVoTTk0hK2lfrlZ4GI0XyqSM9n5z6QYLqxr0U6BF00Lqq1Hjg0KIfID1R/olBvgxpKhthiqBFtza6VgqqjSfIUTr7ujLVLNYtP5hDG05k36KtUMOtdo+sFvDMNhelO57Ptcwcii1gCk3HXMn56/oTDFD+FZ0K+zX2mn5FTofryinkROzLUpk9MKQuysgg7+wgpgw9DYJX74P6B0NGm7lvo3Lr4Un55xCzC8HKOV7n3ODypA8lTMndNyftsPgH/1KnO8kSNr+Dxznyg8Z2fvMvPxJFyONAucAO2leYdaOksYwXrS1DXaqFJh80RSZ1+oRW/DkZmZWWaEKIwBcSBlErEz4AnMkIRmY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uw7Cl2/h01Q+dZ0asKOTfPwbTUlh0qcaAKWRO15sH89d7Z9H6uPYkGoWoK?=
 =?iso-8859-1?Q?evxvkqKE/LADGWFPzyxStr82fnV3+VQaNlik2VVEWXWjQip1zFYNsL0gJG?=
 =?iso-8859-1?Q?WQZp0lmdUj0qRZJmx3j7zZv8uHvt1LpC6sh9hD4nMHgFcDFbR803aTCfiu?=
 =?iso-8859-1?Q?4uEo9Ba66t2TZIU/K9afHvzjwbR5mAMcqvLNKUDlHD4JDfvUnV8ZTOfcOy?=
 =?iso-8859-1?Q?/E+6JQmEQhJ/CSFt15EB0nMD+C1wSXSdxNxaitm1NkHlWRgm6SOLYjLtDn?=
 =?iso-8859-1?Q?5jHDzTsTLssO8/eLas7wqlFe12UGgnfV8k0OQJytEzIvRMgk6TJ2Ke+YPV?=
 =?iso-8859-1?Q?VnZWLmzW54nff6vVWxjtTbQuRqtpND49rdJvwIAzFNlVui4vVrzap/8n8L?=
 =?iso-8859-1?Q?HzmxiEtU9Rt3pO2c7a5ExXsL4yUeg6gt9iK+IjflR9bZ3HQlykvQFdy+k8?=
 =?iso-8859-1?Q?wSL8JvcnF3S3zlilEnDYRQT7LACO7fKLymh8s6gSWlvBPE8T5NX2c9qKEN?=
 =?iso-8859-1?Q?lMrVJOU6mKL/XRdJlHtsi+12gBLevkxQO9MfooupHe5Ymfsy00FOBdSA+t?=
 =?iso-8859-1?Q?bcMeYs3D8V2i5Y5unxQjWwFO93dcCUkPCJw9qbfGQU/P1MAYWyjNmG15rW?=
 =?iso-8859-1?Q?znbnCVsMKnL8iehCL94xMKWuLdOFVYDUFM7Gu8u2UL2dC9K2xi/ZfpIZSf?=
 =?iso-8859-1?Q?R8vLyaBfBlsgF3dhNnhP8ZvdAfb7M3EZFF1l63OkTlgKYGTPFH5ZjMx0iE?=
 =?iso-8859-1?Q?Tj5nUYGcTkF5soCT0ZO8ykKMZgKEY/WEROmZ5ercd1wJwyBHCjt5MAAgK+?=
 =?iso-8859-1?Q?S+msIrF+0awafoUtaXgEZOrjRjCuM9qKvKc9kKlxS7yFVPAQk0XhSyuGEw?=
 =?iso-8859-1?Q?C2fwFlA75R4pAaZ+yMdTg1DWDnKM+3n5uRKtMBjyRIcMP54CvGRvOjln0l?=
 =?iso-8859-1?Q?gKLrVDEgwsLYk9oVKbqibnoB829DSagKGSFMOhiq2RKcEcZ4jswNJlZOAB?=
 =?iso-8859-1?Q?hOBHfOJ02kEhOJt/qI3tdtJr2LLy/LV3MvwoMmYmCptan2CQMFHn03Ca1k?=
 =?iso-8859-1?Q?QtQscHyX9dBgXxavcB2gxqv1AH2p+MCMxVExDCybFUVD6fmka6yocCplGj?=
 =?iso-8859-1?Q?EMa99uoyFAp38RKsbWl9hBPrKqNwvpI2ij+UNIGivKrqcZG2VBnCI6E+6D?=
 =?iso-8859-1?Q?lrgBlwP/ISB8vWmm+TvkuYspMGi2ut2u+SFVhtmbT8g1fXRRCGaeZSGFIg?=
 =?iso-8859-1?Q?Ki63r2LnBdQAxh0qJm9Qsc27/LOiE5MDpmp3pMs5QhfNXqp3QK3J5EzaIo?=
 =?iso-8859-1?Q?yKqzv9TLu5z+CNRsuh8cDr66OaH5TyZDo8yOLL8RFOTWxeB4Auc/6JNpMY?=
 =?iso-8859-1?Q?HTj9eSoWXjFulGAhhcqgeTq6ccHilUchYh9XaPlIy/JmY7ONizviog+2np?=
 =?iso-8859-1?Q?5akklxP9zpMsmjPsl6xuXvhhcTo8WPj05frCbbpGONWUvpbkhGhjf2MrAH?=
 =?iso-8859-1?Q?N+uWFjY5XTjmd11Po5UsBQzGgqD416usP0FuLHjoOcVndNAF3G3P3AWF8z?=
 =?iso-8859-1?Q?rqfNPv7eVQxE4rzBXmFG8z4kqoeA73dDlpvEAmXtqoP1iznDS1bvCQTzSd?=
 =?iso-8859-1?Q?mRHKbdW/t/B1OS0mdLqy41wH5Idzu/twtqzDia4brkx2haqv5PbMxI5A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b78690c3-1078-43e1-ad5c-08dc54d54379
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 18:30:11.9231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exZXn9S9fsLbkBHSQ5pgnA267aURnBjPAyvqBD8Eb56pURZUo6jhU1uNTDHeccmOeHwMlhUG5JGnp7XKcO/YuUeU8h0YZh71FgIXm3CMYcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5308
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

On Tue, Feb 27, 2024 at 05:09:55PM -0800, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>Other driver code beyond the sysfs interface wants to know about
>throttling. So make the query function globally accessible.
>
>v2: Revert include order change (review feedback from Lucas)
>v3: Remove '_sysfs' from throttle file names and keep limit query in
>the same file rather than moving elsewhere (review feedback from
>Rodrigo).
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>---
> drivers/gpu/drm/xe/Makefile                   |  2 +-
> drivers/gpu/drm/xe/xe_gt_freq.c               |  4 +--
> ...e_gt_throttle_sysfs.c => xe_gt_throttle.c} | 26 +++++++++----------
> drivers/gpu/drm/xe/xe_gt_throttle.h           | 17 ++++++++++++
> drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     | 16 ------------
> 5 files changed, 33 insertions(+), 32 deletions(-)
> rename drivers/gpu/drm/xe/{xe_gt_throttle_sysfs.c => xe_gt_throttle.c} (86%)
> create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle.h
> delete mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index c531210695db..82b6a3a6a987 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -87,7 +87,7 @@ xe-y += xe_bb.o \
> 	xe_gt_mcr.o \
> 	xe_gt_pagefault.o \
> 	xe_gt_sysfs.o \
>-	xe_gt_throttle_sysfs.o \
>+	xe_gt_throttle.o \
> 	xe_gt_tlb_invalidation.o \
> 	xe_gt_topology.o \
> 	xe_guc.o \
>diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>index 32b9a743629c..d2e035671820 100644
>--- a/drivers/gpu/drm/xe/xe_gt_freq.c
>+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>@@ -13,7 +13,7 @@
>
> #include "xe_device_types.h"
> #include "xe_gt_sysfs.h"
>-#include "xe_gt_throttle_sysfs.h"
>+#include "xe_gt_throttle.h"
> #include "xe_guc_pc.h"
> #include "xe_pm.h"
>
>@@ -250,5 +250,5 @@ void xe_gt_freq_init(struct xe_gt *gt)
> 		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
> 			 kobject_name(gt->freq), err);
>
>-	xe_gt_throttle_sysfs_init(gt);
>+	xe_gt_throttle_init(gt);
> }
>diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
>similarity index 86%
>rename from drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>rename to drivers/gpu/drm/xe/xe_gt_throttle.c
>index 9c33045ff1ef..e5113cca41f2 100644
>--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
>@@ -9,14 +9,14 @@
> #include "xe_device.h"
> #include "xe_gt.h"
> #include "xe_gt_sysfs.h"
>-#include "xe_gt_throttle_sysfs.h"
>+#include "xe_gt_throttle.h"
> #include "xe_mmio.h"
> #include "xe_pm.h"
>
> /**
>  * DOC: Xe GT Throttle
>  *
>- * Provides sysfs entries for frequency throttle reasons in GT
>+ * Provides sysfs entries and other helpers for frequency throttle reasons in GT
>  *
>  * device/gt#/freq0/throttle/status - Overall status
>  * device/gt#/freq0/throttle/reason_pl1 - Frequency throttle due to PL1
>@@ -35,7 +35,7 @@ dev_to_gt(struct device *dev)
> 	return kobj_to_gt(dev->kobj.parent);
> }
>
>-static u32 read_perf_limit_reasons(struct xe_gt *gt)
>+u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
> {
> 	u32 reg;
>
>@@ -51,63 +51,63 @@ static u32 read_perf_limit_reasons(struct xe_gt *gt)
>
> static u32 read_status(struct xe_gt *gt)
> {
>-	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>+	u32 status = xe_gt_throttle_get_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>
> 	return status;
> }
>
> static u32 read_reason_pl1(struct xe_gt *gt)
> {
>-	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>+	u32 pl1 = xe_gt_throttle_get_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>
> 	return pl1;
> }
>
> static u32 read_reason_pl2(struct xe_gt *gt)
> {
>-	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>+	u32 pl2 = xe_gt_throttle_get_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>
> 	return pl2;
> }
>
> static u32 read_reason_pl4(struct xe_gt *gt)
> {
>-	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>+	u32 pl4 = xe_gt_throttle_get_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>
> 	return pl4;
> }
>
> static u32 read_reason_thermal(struct xe_gt *gt)
> {
>-	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>+	u32 thermal = xe_gt_throttle_get_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>
> 	return thermal;
> }
>
> static u32 read_reason_prochot(struct xe_gt *gt)
> {
>-	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
>+	u32 prochot = xe_gt_throttle_get_limit_reasons(gt) & PROCHOT_MASK;
>
> 	return prochot;
> }
>
> static u32 read_reason_ratl(struct xe_gt *gt)
> {
>-	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
>+	u32 ratl = xe_gt_throttle_get_limit_reasons(gt) & RATL_MASK;
>
> 	return ratl;
> }
>
> static u32 read_reason_vr_thermalert(struct xe_gt *gt)
> {
>-	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>+	u32 thermalert = xe_gt_throttle_get_limit_reasons(gt) & VR_THERMALERT_MASK;
>
> 	return thermalert;
> }
>
> static u32 read_reason_vr_tdc(struct xe_gt *gt)
> {
>-	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
>+	u32 tdc = xe_gt_throttle_get_limit_reasons(gt) & VR_TDC_MASK;
>
> 	return tdc;
> }
>@@ -236,7 +236,7 @@ static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
> 	sysfs_remove_group(gt->freq, &throttle_group_attrs);
> }
>
>-void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
>+void xe_gt_throttle_init(struct xe_gt *gt)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
> 	int err;
>diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.h b/drivers/gpu/drm/xe/xe_gt_throttle.h
>new file mode 100644
>index 000000000000..03c20c837e67
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_gt_throttle.h
>@@ -0,0 +1,17 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_GT_THROTTLE_H_
>+#define _XE_GT_THROTTLE_H_
>+
>+#include <drm/drm_managed.h>

we could remove this include either on this patch or as a follow up
as we don't need it.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+
>+struct xe_gt;
>+
>+void xe_gt_throttle_init(struct xe_gt *gt);
>+
>+u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt);
>+
>+#endif /* _XE_GT_THROTTLE_H_ */
>diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>deleted file mode 100644
>index 3ecfd4beffe1..000000000000
>--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>+++ /dev/null
>@@ -1,16 +0,0 @@
>-/* SPDX-License-Identifier: MIT */
>-/*
>- * Copyright © 2023 Intel Corporation
>- */
>-
>-#ifndef _XE_GT_THROTTLE_SYSFS_H_
>-#define _XE_GT_THROTTLE_SYSFS_H_
>-
>-#include <drm/drm_managed.h>
>-
>-struct xe_gt;
>-
>-void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
>-
>-#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
>-
>-- 
>2.43.0
>
