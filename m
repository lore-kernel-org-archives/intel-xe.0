Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA8FC77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 17:06:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7092E10E2E3;
	Mon,  8 May 2023 17:06:58 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE9B10E2D8
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 17:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683565616; x=1715101616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KcuegFpdXBvr9g8VRw2BplblLtiNcgVv/QPyDYczQv0=;
 b=OgyLkfENGcwKzrDeL1grZAOtC5koT3fPmXl/6WMFOcAj+vnpZQalmFPl
 1fOI69z3ZYbkEHVK+gUXzbgKWqzskGqIoj6ZRoPs7FMM2LeKQUN/zebO/
 foebSZb/ZBZW9GsDH13A7pA4/3ul6brIgrp1sTennI5AFg5xjfbqSVv8u
 XNuVjWi7nxnGmSQI2XyUSbLJ8LKIKRow9ltgzljAJKc+ICzYV2TU44y/t
 f63JezuQ5PIqVYHcSy1pySexnhz1DoxTTInOITlRmdzd7Y0oG7yT7ImQa
 qJktIGGLdq+U2opq0M7UWhaP6UNkuX9GhLevSUovR69TYj4Ef6NSWjU6t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="412963356"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="412963356"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 10:06:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="729149508"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="729149508"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 08 May 2023 10:06:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:06:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 10:06:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 10:06:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUcDDvi0Tc6IQyD3U+i1W0RYazeTAgK+TRdvGX03FcRDZ5ILEyfsPY8ZSe0uDn6NU1wJkKFaZejHolkJL930Bitl8VcfDVCFY+KKfZidqayrmY6CqOkX8KGmUGma2Ol8ZFMjCZwXEduxsnjY15YG6H0F/ufqiTnoa0OdAykYwzNF0RMREkK7Wg3wxeMB24/aTEbM5XR2+b2syZSUmSWfZfLiW0amCH/0HvR5ITMITs7brKl2lNleuX4z+P0txEdCtRHoeK6jm6Npft+nPyhZTjbAtMM2hJ4k41rkTi4ZLq41fgw9Hu1an2WiWbDv46ZfxgQM88KFtzTwnNRbpsV1DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7q4FrfB0utRJOxzoQwJ76jp+047umToBXA7w/bU8xE=;
 b=kF/1m7UPFYeI+60/Pf9kWI30MFMTNlYAUHOwyXMBn+dy1kHHZouvw8tSwiiObja4+70lqCqs8aqDcl34zL9glIet2cOV+oMGdKNiH2tEZNhFFOsh5QeUDX9B7za6/Sc29K5H9DnuXTNuv6hNlnDP8/N+paKBVeyMXazBoMV9Dptq2z0mbakC5G5w4+mKcVT5YRllLR18UjRii7RNpqat8JPp/i2S3IE0e8iywwLu9qgZJME/dZiC19V75XVIO1Wp2ihl9zXBobOJzFukLpV0EmAomNXIEmVarUr3IXbSyQPWdu2H8QgjO8uSwGR0Tc/RcqilBNGjRg6wnC53Ty2WkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 17:06:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 17:06:43 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 13:06:09 -0400
Message-ID: <20230508170616.1289914-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
References: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0060.namprd02.prod.outlook.com
 (2603:10b6:a03:54::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: 802f9135-e816-4c83-ca91-08db4fe698f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ab4ezK13ZQB7hEhISwdh4jb5CL98i3Zx9mRpBGlEgP3meFJBBXJxyXnLm9VC6CTwdR36FjvMo418h9nrL3cGygLFFS/5YWe8kZUbkiNAI5Dl6nChXyRRnTS0yRf7keI1ibe7MCjZuzKvLs64d7XgViAbN071yIKVNe6lsDcf9XyQabjAWSlaUNM11HgMMgUcZNA/lVIMZ1co2pYeTBha5cUC4j693slXBzv+XXnhCmGG0iRaZkLUuGH1QBtzhGOBmgTfhvcPhKvz9shLmJOB7IEGA0mwYtxtxtC104xgpOzNYhkxhGUpnJpSvv8MqSwJO0GHF3X07nGSn73RBr3vzJ2vrL+H1boFKY1FCMN8jc6RqePQEXg+x+7K7nebR+n86rM8fz+5y7fy5ZwYKo7h+iI/gwsrjnU5Brie4n259Ku18m6ElV+Xhobow+6X416XWziamBsHK1t0PbdGW7UXlw5B+IGBjuMKC6fnsTDCanBeRFE/JMJVJGDKVrvP50Nzecw+GH/Ksui1iU4ykGCTIrAZ23yr1PTf950VEsFec1sDXh4lYERnlyqcbWrz5e8Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199021)(30864003)(54906003)(2906002)(8936002)(316002)(478600001)(8676002)(4326008)(66476007)(6916009)(5660300002)(66556008)(41300700001)(6666004)(44832011)(66946007)(6486002)(1076003)(6512007)(26005)(6506007)(107886003)(186003)(82960400001)(2616005)(36756003)(83380400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hr+BN94kFzHovC02bgUiLZ84gb3whxEsv8pNOhz0WvLR/D9FgqOTktcE0orm?=
 =?us-ascii?Q?5WyBZvJnI2/oMSmgoQxYA03ae9mUQ62ggGfw3U2yb05gZCQ4T6m1h+a/JBb2?=
 =?us-ascii?Q?tfzl2OPHBJg46vmDliaEWPEltT+CQIZ1rTLOYhjJgQBqJ59b7YQeLQpJ7d5j?=
 =?us-ascii?Q?dvJNn9M35kgmgJx2AHYRlBx6F0DtRbHcwZ43vJQIKGgeZYbbgjXIxNP6v8ga?=
 =?us-ascii?Q?Jjrfrrt4vijTc2SGAGw6TMF/JvqiI2vAcgqP7+mMaFzGZmL3XonLEx9axWr5?=
 =?us-ascii?Q?Rk7XoLXHR/YUnlbFqbmE98VVi3OD1M+q+fP+3jcHqUen/xv5zurTl7uWuldY?=
 =?us-ascii?Q?Qk3SvEtS72WaoAohguXpNgmTaDoNFOE7H8xmr3iRWRjPpP1lYl7nqoYc6lzQ?=
 =?us-ascii?Q?OiZgf/LiVkctDIsvJExdRd3SeINH/mnWEleh/Fovi3xkKFOM5zlSMV5afTK6?=
 =?us-ascii?Q?Ls50Jjl1Q6fAky/CviD1kQRkpsU0oWOzyEKYCWT4C6WeWkocDFAguZ47MfEv?=
 =?us-ascii?Q?hAMyediXtrWqBJmdPL1WKqotFiYq2DuCO60xZiIxdHe31HS5KGipWnNBXtff?=
 =?us-ascii?Q?Kbm6Abb6sI+am8crr9yHq8tdwwENRTkYUiUrfIsWL/SvuHq5+sOTeTXEm9Ki?=
 =?us-ascii?Q?i7rvyAzMMJBIyoUZS+ZzwSVAUrGO5abylkaaQ0nZcmWCyPfFlGyTHNAbrAa3?=
 =?us-ascii?Q?2PVNY5L920W+mmvvOCSzZjW23TOXjrnJxsN47IRwVn2wsyJk6LFImiOyw+9C?=
 =?us-ascii?Q?JLA42S2bHXS4q7i/yQL0VlF5gzPkVfA2ulwTjKfjYOlQsYHJyZmq6scd/sug?=
 =?us-ascii?Q?4VCXFwwlhr9F6ZNUETQjycY0KDj65ou8teruxBkSqgRDevwxTEeR+sIhTpOO?=
 =?us-ascii?Q?uOHUKdV+tza3qMPUzb2KGq3mHqrnWhMlRupcWMKJ1IaSyLBKfK7bBXYKnfho?=
 =?us-ascii?Q?QepVylaYwnRUZ83qiwN/ig0LfcjFa8dAaPHQ9FWDr+03E2Qfo0y6qS0xjCLB?=
 =?us-ascii?Q?29SOpNPm1mNAAteb958CQCQ6WFr5tqEBKMJ8vz73NtEzJ3hTfdWgcQm+qWKP?=
 =?us-ascii?Q?oDKCMOKa7AdqwNk6ij1Yxg650yTNvO1EE4K3M6sU9etUD4+94Xuq+d8VUZji?=
 =?us-ascii?Q?hdNTZdnYgSuY3solrH+w1n8y+y/Fwp2pQXYDgYEtI26vZVUFDNukXyZUPfCG?=
 =?us-ascii?Q?GlN3Qzk1ATJoVF5s1HrLMg6X/2gZHGO+8YSM4HZZ6Z0i9KD4Ayr9cc7T+pm+?=
 =?us-ascii?Q?L37T0IiLM4EERGHNBfpWa80iTtBWv9DQQ3iJpEfXUqv/KAYGUlgzYKMQ+mm7?=
 =?us-ascii?Q?KErsMBht/aHxXGfXuHubQYhjm+vVuW/TWKcPIvQC8noccaAF2Oi5OrOcMMRT?=
 =?us-ascii?Q?D+BfEQHnl9EFl1YIKdaCqiSvax+BfJGgeFVyPD6sFaJfjNv5eS1bUY/wYuOU?=
 =?us-ascii?Q?/Gj7+hrX9uGrmLZXeBQhjgdpP1O+GpuTy3e1xih+YztGaHp1g7aGOFwUR0J2?=
 =?us-ascii?Q?FBhEy3lIw22k6TuH/xVXMzGr5yrOlmoUCPZtWRoM08tyf3oMH1D3TDnXqy2R?=
 =?us-ascii?Q?Y5HacySq6+QiFZgMmHVJOvdysnY78PRgfgZGXxtU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 802f9135-e816-4c83-ca91-08db4fe698f1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 17:06:43.2722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Djo0zdxWG9VSzwjtOJqPlutYXWgIDEq7n//ajyyGk13ofKBezPNbM/mLNnWk44q3ajkeJ+MpW9skKZTT9/4FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 04/11] drm/xe: Convert GuC CT print to snapshot
 capture and print.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The goal is to allow for a snapshot capture to be taken at the time
of the crash, while the print out can happen at a later time through
the exposed devcoredump virtual device.

v2: Handle memory allocation failures. (Matthew)
    Do not use GFP_ATOMIC on cases like debugfs prints. (Matthew)

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c          |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 167 +++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_ct.h       |   8 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  26 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c   |   2 +-
 5 files changed, 180 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 62b4fcf84acf..985f6e901ee4 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -856,6 +856,6 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 
-	xe_guc_ct_print(&guc->ct, p);
+	xe_guc_ct_print(&guc->ct, p, false);
 	xe_guc_submit_print(guc, p);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index e16e5fe37ed4..c70a34acb395 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -595,7 +595,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 broken:
 	drm_err(drm, "No forward process on H2G, reset required");
-	xe_guc_ct_print(ct, &p);
+	xe_guc_ct_print(ct, &p, true);
 	ct->ctbs.h2g.info.broken = true;
 
 	return -EDEADLK;
@@ -1088,38 +1088,40 @@ static void g2h_worker_func(struct work_struct *w)
 			struct drm_device *drm = &ct_to_xe(ct)->drm;
 			struct drm_printer p = drm_info_printer(drm->dev);
 
-			xe_guc_ct_print(ct, &p);
+			xe_guc_ct_print(ct, &p, true);
 			kick_reset(ct);
 		}
 	} while (ret == 1);
 	xe_device_mem_access_put(ct_to_xe(ct));
 }
 
-static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
-			     struct drm_printer *p)
+static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
+				     struct guc_ctb_snapshot *snapshot,
+				     bool atomic)
 {
 	u32 head, tail;
 
-	drm_printf(p, "\tsize: %d\n", ctb->info.size);
-	drm_printf(p, "\tresv_space: %d\n", ctb->info.resv_space);
-	drm_printf(p, "\thead: %d\n", ctb->info.head);
-	drm_printf(p, "\ttail: %d\n", ctb->info.tail);
-	drm_printf(p, "\tspace: %d\n", ctb->info.space);
-	drm_printf(p, "\tbroken: %d\n", ctb->info.broken);
+	xe_map_memcpy_from(xe, &snapshot->desc, &ctb->desc, 0,
+			   sizeof(struct guc_ct_buffer_desc));
+	memcpy(&snapshot->info, &ctb->info, sizeof(struct guc_ctb_info));
 
-	head = desc_read(xe, ctb, head);
-	tail = desc_read(xe, ctb, tail);
-	drm_printf(p, "\thead (memory): %d\n", head);
-	drm_printf(p, "\ttail (memory): %d\n", tail);
-	drm_printf(p, "\tstatus (memory): 0x%x\n", desc_read(xe, ctb, status));
+	snapshot->cmds = kmalloc_array(ctb->info.size, sizeof(u32),
+				       atomic ? GFP_ATOMIC : GFP_KERNEL);
+
+	if (!snapshot->cmds) {
+		drm_err(&xe->drm, "Failed to allocate memory for CTB snapshot commands. Only CTB info will be available.\n");
+		return;
+	}
+
+	head = snapshot->desc.head;
+	tail = snapshot->desc.tail;
 
 	if (head != tail) {
 		struct iosys_map map =
 			IOSYS_MAP_INIT_OFFSET(&ctb->cmds, head * sizeof(u32));
 
 		while (head != tail) {
-			drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
-				   xe_map_rd(xe, &map, 0, u32));
+			snapshot->cmds[head] = xe_map_rd(xe, &map, 0, u32);
 			++head;
 			if (head == ctb->info.size) {
 				head = 0;
@@ -1131,20 +1133,141 @@ static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
 	}
 }
 
-void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p)
+static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
+				   struct drm_printer *p)
+{
+	u32 head, tail;
+
+	drm_printf(p, "\tsize: %d\n", snapshot->info.size);
+	drm_printf(p, "\tresv_space: %d\n", snapshot->info.space);
+	drm_printf(p, "\thead: %d\n", snapshot->info.head);
+	drm_printf(p, "\ttail: %d\n", snapshot->info.tail);
+	drm_printf(p, "\tspace: %d\n", snapshot->info.space);
+	drm_printf(p, "\tbroken: %d\n", snapshot->info.broken);
+	drm_printf(p, "\thead (memory): %d\n", snapshot->desc.head);
+	drm_printf(p, "\ttail (memory): %d\n", snapshot->desc.tail);
+	drm_printf(p, "\tstatus (memory): 0x%x\n", snapshot->desc.status);
+
+	if (!snapshot->cmds)
+		return;
+
+	head = snapshot->desc.head;
+	tail = snapshot->desc.tail;
+
+	while (head != tail) {
+		drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
+			   snapshot->cmds[head]);
+		++head;
+		if (head == snapshot->info.size)
+			head = 0;
+	}
+}
+
+static void guc_ctb_snapshot_free(struct guc_ctb_snapshot *snapshot)
 {
+	if (snapshot->cmds)
+		kfree(snapshot->cmds);
+}
+
+/**
+ * xe_guc_ct_snapshot_capture - Take a quick snapshot of the CT state.
+ * @ct: GuC CT object.
+ * @atomic: Boolean to indicate if this is called from atomic context like
+ * 	    TDR or CTB handler or from some regular path like debugfs.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: a GuC CT snapshot object that must be freed by the caller
+ * 	    by using `xe_guc_ct_snapshot_free`.
+ */
+struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
+						      bool atomic)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	struct xe_guc_ct_snapshot *snapshot;
+
+	snapshot = kzalloc(sizeof(struct xe_guc_ct_snapshot),
+			   atomic ? GFP_ATOMIC : GFP_KERNEL);
+
+	if (!snapshot) {
+		drm_err(&xe->drm, "Failed to allocate memory for CTB snapshot info ror commands.\n");
+		return NULL;
+	}
+
 	if (ct->enabled) {
+		snapshot->ct_enabled = true;
+		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
+					 &snapshot->h2g, atomic);
+		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h,
+					 &snapshot->g2h, atomic);
+	}
+
+	return snapshot;
+}
+
+/**
+ * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
+ * @snapshot: GuC CT snapshot object.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function prints out a given GuC CT snapshot object.
+ */
+void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
+			      struct drm_printer *p)
+{
+	if (!snapshot)
+		return;
+
+	if (snapshot->ct_enabled) {
 		drm_puts(p, "\nH2G CTB (all sizes in DW):\n");
-		guc_ct_ctb_print(ct_to_xe(ct), &ct->ctbs.h2g, p);
+		guc_ctb_snapshot_print(&snapshot->h2g, p);
 
 		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
-		guc_ct_ctb_print(ct_to_xe(ct), &ct->ctbs.g2h, p);
-		drm_printf(p, "\tg2h outstanding: %d\n", ct->g2h_outstanding);
+		guc_ctb_snapshot_print(&snapshot->g2h, p);
+
+		drm_printf(p, "\tg2h outstanding: %d\n",
+			   snapshot->g2h_outstanding);
 	} else {
 		drm_puts(p, "\nCT disabled\n");
 	}
 }
 
+/**
+ * xe_guc_ct_snapshot_free - Free all allocated objects for a given snapshot.
+ * @snapshot: GuC CT snapshot object.
+ *
+ * This function free all the memory that needed to be allocated at capture
+ * time.
+ */
+void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
+{
+	if (!snapshot)
+		return;
+
+	guc_ctb_snapshot_free(&snapshot->h2g);
+	guc_ctb_snapshot_free(&snapshot->g2h);
+	kfree(snapshot);
+}
+
+/**
+ * xe_guc_ct_print - GuC CT Print.
+ * @ct: GuC CT.
+ * @p: drm_printer where it will be printed out.
+ * @atomic: Boolean to indicate if this is called from atomic context like
+ * 	    TDR or CTB handler or from some regular path like debugfs.
+ *
+ * This function quickly capture a snapshot and immediately print it out.
+ */
+void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic)
+{
+	struct xe_guc_ct_snapshot *snapshot;
+
+	snapshot = xe_guc_ct_snapshot_capture(ct, atomic);
+	xe_guc_ct_snapshot_print(snapshot, p);
+	xe_guc_ct_snapshot_free(snapshot);
+}
+
 #ifdef XE_GUC_CT_SELFTEST
 /*
  * Disable G2H processing in IRQ handler to force xe_guc_ct_send to enter flow
@@ -1166,7 +1289,7 @@ void xe_guc_ct_selftest(struct xe_guc_ct *ct, struct drm_printer *p)
 		ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 4, 1);
 		if (ret) {
 			drm_printf(p, "Aborted pass %d, ret %d\n", i, ret);
-			xe_guc_ct_print(ct, p);
+			xe_guc_ct_print(ct, p, true);
 			break;
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 49fb74f91e4d..3e04ee64652c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -13,9 +13,15 @@ struct drm_printer;
 int xe_guc_ct_init(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
-void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
+struct xe_guc_ct_snapshot *
+xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
+void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
+			      struct drm_printer *p);
+void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
+void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
+
 static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
 {
 	wake_up_all(&ct->wq);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 64e3dd14d4b2..93046d95b009 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -48,6 +48,32 @@ struct guc_ctb {
 	struct guc_ctb_info info;
 };
 
+/**
+ * struct guc_ctb_snapshot - GuC command transport buffer (CTB) snapshot
+ */
+struct guc_ctb_snapshot {
+	/** @desc: snapshot of the CTB descriptor */
+	struct guc_ct_buffer_desc desc;
+	/** @cmds: snapshot of the CTB commands */
+	u32 *cmds;
+	/** @info: snapshot of the CTB info */
+	struct guc_ctb_info info;
+};
+
+/**
+ * struct xe_guc_ct_snapshot - GuC command transport (CT) snapshot
+ */
+struct xe_guc_ct_snapshot {
+	/** @ct_enabled: CT enabled info at capture time. */
+	bool ct_enabled;
+	/** @g2h_outstanding: G2H outstanding info at the capture time */
+	u32 g2h_outstanding;
+	/** @g2h: G2H CTB snapshot */
+	struct guc_ctb_snapshot g2h;
+	/** @h2g: H2G CTB snapshot */
+	struct guc_ctb_snapshot h2g;
+};
+
 /**
  * struct xe_guc_ct - GuC command transport (CT) layer
  *
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 231fb4145297..9e2950f1fd0d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -764,7 +764,7 @@ static void simple_error_capture(struct xe_engine *e)
 		}
 
 		xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
-		xe_guc_ct_print(&guc->ct, &p);
+		xe_guc_ct_print(&guc->ct, &p, true);
 		guc_engine_print(e, &p);
 		for_each_hw_engine(hwe, guc_to_gt(guc), id) {
 			if (hwe->class != e->hwe->class ||
-- 
2.39.2

