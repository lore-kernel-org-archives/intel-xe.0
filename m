Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D26C48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C259D10E9B9;
	Thu, 22 Feb 2024 16:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nnzz1OEO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEE810E9B5
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 16:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708620020; x=1740156020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=c/EvbETwyv7kZWS+5Y4jNxT062rsLQJIO9L2qWLJMSk=;
 b=nnzz1OEOFNzXPcDkMU9e4g2DVmsHDazLZrSq7v1EqDTM1YBcyAL6ZJXy
 qd2qy600PcZIVPqbJdj40Q3NjUNcET0s4XAevAFeUgJznkEDFgkdxFR0E
 t+EFnleI5kGyfFCH5InepEIlhmCfOmAEsJA4Ho1GPrdkWPYr/cWZ/2znO
 avu51R6gGeFqfwAmrNcF6x6Xi820GJE22Gu2gVhPUk6pmYl8iDCbVo/Hn
 Jo9Q96TzaQGdHP8fG9pusgcwtjzYxE/ba6IT3l/86E9U6C0oXFCOXZwdq
 pAhC3u92RAgj7yUqV3PanueY34E3zEBxEcve8f6tB7Irusk5ZVePmomXr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="28296305"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="28296305"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:40:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5490380"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 08:40:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 08:40:19 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSkYOI/86MALlbG+3NeiFnze5lDDgiJVNwhxmtV6h+rwMykD/9FP9sIPK4Mhg1By4qLa5ScrKzINPIaFnpPn2W1/fEVa2XyH4TLCsJZCZ3LSI2TIBbE+ByVaaPMWdrmVcfmYqABloF5RT/p1x+QtT2s5BYK+bbs0RgmQpdT+G5DgvXs/Yxz7uaTqrs6yWdkwfQd8AhBzkj0YBGzIxIBW/u3C1FlGsbamYk6vaZbWlcu1XDiEa5ns7egtb/cX6CIJ8CfKQ5fHb6lZbkD0mHftRw1gq6+/61lt55CF6s5DyndZ8cTTmBc4l+Dw0Khu6/6FTLh4kvVVn5PflBqerGM9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCMysdyrDpyKog+6YmYQgFtVY+aarjzRODnvRfI4Euk=;
 b=jTCNxmEWnScnURSDQjdCneki7g0TuF8rX8sbK+fT2gEEzyOBXGko0IwoK0z+sKGGfpcV0tIE+P8x/jBNIuk8hfof2YRwESVFP8ZR9EvGGIwq/cKxPzclrMUCCKvBSH7HPGtdTAMTqb9dcARU2RDQnLbKlKyeOh8r6N5Fy9d7GTLtRc+sQAoNC6B9G+Oj4upY/jYTwzz0zakBlEwyc1WyUSLJf5iHD9ov4rgZJJdsLpn1NfEB1tHSGO8X5jj6UwQf8Njb4KZH+N8k5thddtO75iC1e4AoflnSftOb/HWc3o+l2e2pRRJ4uKbDaspZ60CQUwVA2tnP3DHtulyZarjYAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8764.namprd11.prod.outlook.com (2603:10b6:8:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Thu, 22 Feb
 2024 16:40:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 16:40:16 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 11/14] drm/xe: Convert gsc_work from mem_access to
 xe_pm_runtime
Date: Thu, 22 Feb 2024 11:39:34 -0500
Message-ID: <20240222163937.138342-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222163937.138342-1-rodrigo.vivi@intel.com>
References: <20240222163937.138342-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0089.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: b3144b2a-ef71-4f91-085c-08dc33c4f31a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bpYLmIlXTg4qu8GmiLMAuxC7l01Ksu1S5K2vGfm0UzkQb6adHf0JXDKg14vxpVBc77DAjzDlGY+1ifPVo2iUtG2d9Aa9rnwWLrpNGyL8NbAmtuUkuh9CYWTPvEs5VoiqYOeGiZuaHolC/wzqBvD0RdQZ2sfBQSUJXk7WSpkvf2Z/s2rLKpN+jNQLunfuMSo+ffPhu8ld9/yMXQlv+6VPmxlDFKZg1gkhDmse+kPxE4qmvLp6KmUsPccdByQdJDRwdO8viY8/b99FPcUhzo0ilhfxdx0j1FIkmckCmz+7u6UHU0OMJjbNwoOu0tZ2o8ZuS2VS6VxkIJYnnfAWWxb3nHsCHuXG8HD3G24HiKsXv2zUpFTg357aUAmvdC7rYWTgEGFWnDBm075hca5u3/TQm2cyweWOb4V72SZ8IIkOw3MOMcTAx+cESnxdPCZtDul/oy+86wmPmQi3iatvnZkxKkmp0xT7s4pJs5rD023IVPa1twE2CHW/Y7wGy8IUVEUk9s5WUSCSLDkvaN9yEsXt0B1NwbmNPSas0bEyuZLG4Zg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EOZUMBfCUZ6pNoj97ovIk/b8oztPtIzYrGVdY9B1nFgXDpp5/gsPOtdAeAjB?=
 =?us-ascii?Q?GJk5WuYc12/M8G29jsByFKEJ7KfG+Y8qwitvb95x6KHiwyAa5yV+7/zgL+27?=
 =?us-ascii?Q?RVLYo6HiG0wzCrW2Uk0f5Srp9sMxiHiGlvo1BzdJ7zGjzVu3YqdsBQfGkGY8?=
 =?us-ascii?Q?JDcvzsz8sfGKyLZPpAUzNR8AyjzC3jKXkovdRA8rZmA3X/p08PNs00+Z/R29?=
 =?us-ascii?Q?yPPWgp4bi8RPGkVOSVO99fR9+NKmwXcB47QLMEb8Ivyq0kBTBftysR+oSDz+?=
 =?us-ascii?Q?XJFQGzD4zJNjb50gZhhOLvdSyUM24weHyVk94S1oY7q2eJFvgYXjDh44UMrc?=
 =?us-ascii?Q?gsw0Zc+IrKQ1h4jjCoo9Zo1ocnrKFbiTsqX0a9xj4vsNjZ5/OaObUaBA6ESE?=
 =?us-ascii?Q?7NGRtXk0Xx82C6VTe5HvC5RcN52f3+EXar1wr5jqs0cbO/DOS0J4syylKYY3?=
 =?us-ascii?Q?wtMfslcCRLYISkWwRMJ2EaEICgbix4h7od3NHJs+pddGVfeCO6bEUiHdR+u8?=
 =?us-ascii?Q?REP27yIKpN7cbNH+2aAhQh2l2jVKCgwjAk2w4+TQhcLZ89TNsJHzDA9tQiLR?=
 =?us-ascii?Q?XS9LBGT3kCGuATzTFTJwl1W6JY9uDJKh1L9WSCBfeNRjzRRsyfsxu7LW/PNl?=
 =?us-ascii?Q?nvRHzsMm1N6UirGtee7EKUkXKjw3eqV6wbkC9Cg6KpcAHuG9Xn7t7VH7pi/X?=
 =?us-ascii?Q?RPIbYS5ZNfDxxqlMDnr5ORTQTumMAjSI+8EZLenJOCn47IHL0CtCTFbYuXZS?=
 =?us-ascii?Q?kgj4Jg9udpHyA+K1D5tD3aiySNOzlqhVbxNa1X8lcxYANzXBqykAZe0UrrCO?=
 =?us-ascii?Q?jE/v3GCKFQfrsxrMy/g9ljsFqBPOo/0wgi/ZmL0qDqARPlzR4eVLqUC/Jc8Y?=
 =?us-ascii?Q?hqxg9DugfAJZ+rLDrHNIFJOF0ONgUJoZXmrQ83GCZpAzAct33twczHkDXO2H?=
 =?us-ascii?Q?TtI3qL/k2omOoLfuAelkTHVom5og9ShhJfvSH7nmo0oCqVONj0PCG88k7zHj?=
 =?us-ascii?Q?A38Z16yEqWMkF5NM7+UccaU3Gr7vqp3Yr5yKOc2aUPvWoBvrhpUiYBa+tT12?=
 =?us-ascii?Q?14pnNW+L9qF2LXsKRfXdWUYfWYwbMk4G4ze3hbHB3k8puQK6USFGAZE2LJnk?=
 =?us-ascii?Q?M+VsLYSzYFYTss4eRs2fqztz1ZkwIXZ3GW57TumDn28aKUMhvURfgScda56J?=
 =?us-ascii?Q?EBiiFAPxQHT0mGl12Zdz5o3iXapi0ffym7lg8iQCrms/bgGSF7Onr49rHmdE?=
 =?us-ascii?Q?UuUVOjbgDIo/LyeCboqKqy4/1HWR7MXuLMIsiVw17I0ezbBh2DmsL+jCNMiX?=
 =?us-ascii?Q?YD/cIq105y6Nk+4B9k9iUr+1VdtJ015ED/67TSXhpczvMLTGG4er183yUArp?=
 =?us-ascii?Q?6JALA0CkV6WOH0KGH2X2JJvX1ysHR6ZynALiesb4dR1KT4km1um+32SVS3ml?=
 =?us-ascii?Q?619zTLBHeaI0bAfpvPaw/6H1ROva60l/bg7hKH23fV49xuY8XEqkM96Kl3h9?=
 =?us-ascii?Q?XDAkKkmtMK/bTQ7wx6Hczmkq8pjXWrTbE0VfVsNQK6rNJxURgaQsXZZ4y74p?=
 =?us-ascii?Q?OWCLuE2nnuOGJMB7x6VP2oAKlmReXxLCH7IM2dxgN+Ik+U/uMGR8YynGS6Vi?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3144b2a-ef71-4f91-085c-08dc33c4f31a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 16:40:16.6709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34Yhbht8lGpL6cpzC0fa99Ax3Gbchax6ftiYxVQfv9IfpgHWca7SsGtXRTysmT3IsdFX0T/rSsGNx/z5cYCpag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8764
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

Let's directly use xe_pm_runtime_{get,put} instead of the
mem_access helpers that are going away soon.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 0b90fd9ef63a..904026634991 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -20,6 +20,7 @@
 #include "xe_huc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 #include "xe_sched_job.h"
 #include "xe_uc_fw.h"
 #include "xe_wa.h"
@@ -284,7 +285,7 @@ static void gsc_work(struct work_struct *work)
 	gsc->work_actions = 0;
 	spin_unlock_irq(&gsc->lock);
 
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get(xe);
 	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
 
 	if (actions & GSC_ACTION_FW_LOAD) {
@@ -299,7 +300,7 @@ static void gsc_work(struct work_struct *work)
 		xe_gsc_proxy_request_handler(gsc);
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 }
 
 int xe_gsc_init(struct xe_gsc *gsc)
-- 
2.43.2

