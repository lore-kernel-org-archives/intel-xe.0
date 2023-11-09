Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689B6C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:56:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CB110E8C4;
	Thu,  9 Nov 2023 14:56:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C120610E8CB
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541706; x=1731077706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RzFm/4VqsQ8W4K3YjDuIeXm7zQPsd1dZ/qO+sUdTGSA=;
 b=cOvknHJltKKyaSKM5zGyC2U/gtJyjNzqRXQWjQ/5BUwk1uFRGfp5GC6c
 YzmuOOfr/zJLkmos8fU+CjUF2+aVnb97s4jq2xvv4Nn2Jzs3x0DN2ppO7
 MI/4+YUlu2uHMBH3CRImxBCVJ+5jqmn9qiICor0hjBp6PyotQbrY4S4TK
 dgTiXA+MsK0c2np1S1wAzeCn0Q7QabHMwKiArn7+u92S+e35sCkfxSEo1
 Kh9E0fwZVFoYS/JHoiVosIVx/JWLYZdqO9gw1BEF9exoNL73sQn6SAB3M
 Nu9BqMw1PyFb+ajBgmnhLdPbpNSI4UDgt/oGxrVQd7SuwdoXDCErvsUH0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11545178"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11545178"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:55:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4734891"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:55:05 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:55:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:55:05 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:55:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnV6f8PByetkMaCB3clFdR56fxRogcVLwehIavl3fTq3mQaWUiv1WSSanKCHnu8br2YgJznsKTgquNg4Ggbaq3uAY9cYbU2qa7u27AC7Zwfx6Zcpk91oMWueVykJTZ50ShTTsGJIBA8SMmbAqhlwuDeo3odQy/fg0kmdvCIGj2agwvPO3UIgUnLV6TEC/v0bZcFxkWNjvNTsQl4WBAqoQjcdKZhz34woMC9CEbwK65/92RnReFtgg34Jba5jiUskiIWSeoENrN0/yizN2a4Gs018/CgBOakE7GEnCIR/mGfeJJ8G2lUgpvPwvsJtnmqwa9A4gE6vhCkHFMbc5i33qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4FfbOiqkI9CRwoi3ChdB1XDpnrVRwKJ8Vo6ZYyhwdE=;
 b=Ax8tIkHC+ku814UTTMJbIFAeZNJwrxbJBvW7upvyLBkhTpEoLNEWKGqfGFmZ4Pi9kiyAozCZcazuIpc5eh8YEcd9MlZaIGwwI2HmzigsxvvQVMAvleuNRVzrwSblyRDZHVPvU4P5lj51IUHLuG7xzSgmT/tS0YiiN9k0Ib+FBni6k1AAiBdt3/YjLCTrgQIoBC7nnqMTiUnGCk6+b5Dq7s6mtx+ycLapPJ1RCnTup77rc+liDtUTTyrh0YtaRjDxGbF2p4jOpjm/K2cxAeNbd4yV5jifPbPpJ27ut20uKsaNV7XgTSMpWR8pa/u3nyqh7SbJsg8MZ7s2VDRucqSZYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5788.namprd11.prod.outlook.com (2603:10b6:303:198::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:55:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:55:01 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:36 -0500
Message-ID: <20231109145347.345120-19-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWH0EPF00056D05.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:e) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: 171d88b2-929b-4580-fae5-08dbe133d939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pwm6NDVBohR2TpupmZQTRXun9ItWZ93gbopV42avqSq4wpJJkU+Q3DZCVnRlQc5vfCRNSxAAKfaNV7d0FoWG/QkCsY006MAbkrEEQbzTOKej6rAuVAuq5jJZ8Dz2X/ZwKVo+b8LdcFZ8WOA460agaC+uUC4n6MEW4A+rZ7FEVKjqg2jPWGAzRr4tqScjZ6HYOX7AXxD5A6YrkII1332z06rPQX5XFZ+t27uBOLnsnSImhMmFKPTL1gTHPX7l5nfU0n2tLUU3KU4EefSAy9tg8nMNT3Xurx4jm2HAaW+V6S9LngufXaK5Mtcn4lTtuUY0DSujGTjQvG1wFERKXJVXEBTIsDxL+Gk4v/5rcI19Cup5Zra3x5AAu4HA1V1lLS2uQRS3FsqR30dIBiswwuDCAsiUUowu+gqKJprzlcOqk+Tvs0OQ1qDQUsjCsQAZtJqsJN21r1wtohwiwRLXVK+v70KQTpWqVt+5/iu/MpWsCphqwk5BA2MqPXaSVG9/KOV8S5qVo7myRIofCrJhp328maq9AV59uCYXUlcTVUqV1w/bGfq39Re9Yxia2McDRCKJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(478600001)(6486002)(2616005)(107886003)(44832011)(6666004)(5660300002)(36756003)(38100700002)(6512007)(82960400001)(86362001)(83380400001)(66556008)(66946007)(41300700001)(2906002)(26005)(1076003)(30864003)(66476007)(6916009)(316002)(8676002)(8936002)(4326008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGpEcFJQaXdtMWcxbHNkZTYvYjVEckZnYXdpcXNjVTNnbjBjOFJZNjFOd2x2?=
 =?utf-8?B?ZTY1QkNEZzQ2NGRmdUwxeERNcmFMTVM4ZWlMcjNrSzBhakplMUVYcEhZTFBk?=
 =?utf-8?B?YTZNN2wvQW9IZzl5Lzh5NlFGZStFYmQxMDl0TkRtcDdqQjQ5RXh4bmZyR0h5?=
 =?utf-8?B?Y3ZsYzhxdndnbzIzM0VZQVhyZnhQVVRjRE1iaStHOFZQSmx1RzFlenlrY1Q3?=
 =?utf-8?B?WFgwNlJQSHpiUXd3U0FaVXlJTURZb2NPKy9qbTdKWXB4cFVhRGtjRkZXNUFZ?=
 =?utf-8?B?WEFrQ2lJZmZ5MHp5dDllRHZXR0RFUnI3ZXVYVHd0eFQzN2wrK0VhT1lLdzJu?=
 =?utf-8?B?aEthTk9PT2E4d0tZL1VIblZQZjZTRENsRjhGZmZzblUwUTJLTWRrSVBpNHE3?=
 =?utf-8?B?Y1FlWHBodndZbEdWNVJxZm1qelFNMnRyaHpYdFZXOUtPRFN3Z3BPY0xyRjFo?=
 =?utf-8?B?N0pXY3RoMjZxYlIxRWdMRDJhVXlzUnY2VHRTSk1ycnQ0Y3lKcUgvVi9UYWs3?=
 =?utf-8?B?MnA5cDlmNTkrbkU3UE1hR0VFMjhzWEl0cTl1aHJlRUNzZWNRcGZyYnRIQURZ?=
 =?utf-8?B?Sk84T2dwREFyU3dTWE5LbmxqcElFYmx1ek1rMkdJUTVGSm02bEJZZVFTNDRC?=
 =?utf-8?B?ZGhVMW5xNnZtNThTeEczNUFuZVVBSXo5ZXVRQzdOek1UeFFNc2FLd2l4MGZ5?=
 =?utf-8?B?d2FScnMwdzNqL2hhU1BVQm9IWjUrZCszdStlTExxdHc0QTRmODV4T21YeTVt?=
 =?utf-8?B?SDBGaDlLVkJsTkRCVzRvUnNsWnBSbkZwWmxCUnNDVU9GVUxCOUNpWDdXdnov?=
 =?utf-8?B?M2o5eWRFakhCeHdORHBTR1M3WlVCU0JKTVowV2lFVVgyN3p0K3pMWDR3ZGZ4?=
 =?utf-8?B?RUtYUFJDSUZZT2pGUnN2eVJpYVlITE82RUpVTURUb3QxaFc4WnNEM01pZ3Zv?=
 =?utf-8?B?Z2M4clBkMUxEeC9yN29TV0tQbGl5WVEvR2tiMis1VkwwaTlydmhVeUxrYkpM?=
 =?utf-8?B?cWZaUTByN1JrRUl1b2wxeUpMTGQ2KzRtQTFaVjlPOVhiL3J6RHJDdnRTYi9o?=
 =?utf-8?B?QkJnNElOdXgyeDFtNDZINkpsRE94L0NUN1lnbmUvSGV1Zlc4ZnYwTTFHbVc0?=
 =?utf-8?B?QUN2K2tIYzYyK1RjTmoxemx4TWZhVzY0Um41M0ZtQVY3UC9rbSt3Z2ZJTjJt?=
 =?utf-8?B?L01NY0R4aVJQUmJ6aFV4YU8wYW1wNHN2ZUxOR3NmK043azZJdDRibWYvU29h?=
 =?utf-8?B?WlNMRytKdnRsU052OXRtUTV1MnBEQ3JReE9PRXN4S3FpYlIwSGE2emdxSkta?=
 =?utf-8?B?RmtGRVNOMWlBeXp4YjNyemRXUkEvcnhuL0hEKzRCa3Vvd3BaQlNCaktCcDMr?=
 =?utf-8?B?WlBoQU9mTkNxWWdIUFoySTUxSi9TNkI3WUxyelh5MWtEMkFvUGJiOTZJMHJy?=
 =?utf-8?B?R0xWVDNBQ2kwWXZ2M2IzaGpEYVN1Ym8vc0JYOXA0ZzMyTndXL21ER0VXMFRy?=
 =?utf-8?B?Zmd3VmhBQ2l3ajQ4MjlYMTA2bVhMdFQreUpQdFcyd1FTRFFXOVNrQnlGME1y?=
 =?utf-8?B?a1MrT1ZqV2FRcHhzeGttT1J0TEswZXF3dWVIVUlka21uT2w3bkhLQmdzSWhU?=
 =?utf-8?B?c1I1UXluSkQzdHpuUEMzbHRXdUdFbi9Kd0c0anhadUhMOUdqVWx5b0dUbU1X?=
 =?utf-8?B?UnRGajZnTVNOYzZ4YUNjbytOYjVPTmRIdFI0VTA5c2Q0VitZV2pTQ2p6SDla?=
 =?utf-8?B?QUVYL3BiUEdVcVVQcE9VQWZrN1I5LzhOYndvTWhzMzExZngveVE3QUczYlhC?=
 =?utf-8?B?ajhKbngvNllGc2JUUnRVQ1c2Z2JvelZDRTVYamlSZnIyT24yUmxyQ1ZzS3Q2?=
 =?utf-8?B?eHkxUTRpNHYzbVJZZ1RUSy9PNGNCRzhPY2Myall2WUZ2c1JWcFNnMkVmdlZv?=
 =?utf-8?B?NWJjam9ha3F5b1FUYmJFendiOFJkbXowbXZNTzJqNkI5QTZDalFYZ0gvbExS?=
 =?utf-8?B?NWNjTVlJN0hmeEJZdzFsMWlkUWNBQzRJNG8yM2gzSzhFdGwzd3lNSG9OYmhQ?=
 =?utf-8?B?T1FFcnN1anhaTHhsVnhFOHFzWktPOXh5OE9JRFVUcHNXN2xpZXdkdmUvbU9B?=
 =?utf-8?Q?KuMZ3HS3GUe0qPOXuLqYnxMIX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 171d88b2-929b-4580-fae5-08dbe133d939
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:55:01.0832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KR9hS6d72u1OqJWPRDm+UQOpkse4ffX0MecOerZBTpLV+ukTDVisqJwwYdQZ0T1e+AcMroHI/CizWiZ3QSDgZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5788
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 18/20] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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

From: Matthew Brost <matthew.brost@intel.com>

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   3 +
 drivers/gpu/drm/xe/xe_execlist.c             |  20 +--
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        | 101 +++++++++++++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |  73 +++++++++
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  58 ++++++++
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   8 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 147 +++++++++----------
 drivers/gpu/drm/xe/xe_trace.h                |  13 +-
 9 files changed, 330 insertions(+), 94 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler.c
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler.h
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a1a8847e2ba3..cb41b4fead08 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -57,6 +57,7 @@ xe-y += xe_bb.o \
 	xe_exec_queue.o \
 	xe_force_wake.o \
 	xe_ggtt.o \
+	xe_gpu_scheduler.o \
 	xe_gt.o \
 	xe_gt_clock.o \
 	xe_gt_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index ecd761177567..5ba47a5cfdbd 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -10,6 +10,7 @@
 
 #include <drm/gpu_scheduler.h>
 
+#include "xe_gpu_scheduler_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
 #include "xe_lrc_types.h"
@@ -41,6 +42,8 @@ struct xe_exec_queue {
 	struct xe_vm *vm;
 	/** @class: class of this exec queue */
 	enum xe_engine_class class;
+	/** @priority: priority of this exec queue */
+	enum xe_sched_priority priority;
 	/**
 	 * @logical_mask: logical mask of where job submitted to exec queue can run
 	 */
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 9451272b448c..b4406fbdf99f 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -33,6 +33,8 @@
 #define XEHP_SW_CTX_ID_SHIFT  39
 #define XEHP_SW_CTX_ID_WIDTH  16
 
+#define XE_SCHED_PRIORITY_UNSET -2
+
 #define GEN11_SW_CTX_ID \
 	GENMASK_ULL(GEN11_SW_CTX_ID_WIDTH + GEN11_SW_CTX_ID_SHIFT - 1, \
 		    GEN11_SW_CTX_ID_SHIFT)
@@ -152,7 +154,7 @@ static void __xe_execlist_port_start_next_active(struct xe_execlist_port *port)
 			list_del(&exl->active_link);
 
 			if (xe_execlist_is_idle(exl)) {
-				exl->active_priority = DRM_SCHED_PRIORITY_UNSET;
+				exl->active_priority = XE_SCHED_PRIORITY_UNSET;
 				continue;
 			}
 
@@ -215,20 +217,20 @@ static void xe_execlist_make_active(struct xe_execlist_exec_queue *exl)
 	struct xe_execlist_port *port = exl->port;
 	enum drm_sched_priority priority = exl->entity.priority;
 
-	XE_WARN_ON(priority == DRM_SCHED_PRIORITY_UNSET);
+	XE_WARN_ON(priority == XE_SCHED_PRIORITY_UNSET);
 	XE_WARN_ON(priority < 0);
 	XE_WARN_ON(priority >= ARRAY_SIZE(exl->port->active));
 
 	spin_lock_irq(&port->lock);
 
 	if (exl->active_priority != priority &&
-	    exl->active_priority != DRM_SCHED_PRIORITY_UNSET) {
+	    exl->active_priority != XE_SCHED_PRIORITY_UNSET) {
 		/* Priority changed, move it to the right list */
 		list_del(&exl->active_link);
-		exl->active_priority = DRM_SCHED_PRIORITY_UNSET;
+		exl->active_priority = XE_SCHED_PRIORITY_UNSET;
 	}
 
-	if (exl->active_priority == DRM_SCHED_PRIORITY_UNSET) {
+	if (exl->active_priority == XE_SCHED_PRIORITY_UNSET) {
 		exl->active_priority = priority;
 		list_add_tail(&exl->active_link, &port->active[priority]);
 	}
@@ -333,7 +335,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 
 	exl->q = q;
 
-	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL,
+	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL, 1,
 			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
 			     NULL, NULL, q->hwe->name,
@@ -342,14 +344,14 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 		goto err_free;
 
 	sched = &exl->sched;
-	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_NORMAL,
+	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_MIN,
 				    &sched, 1, NULL);
 	if (err)
 		goto err_sched;
 
 	exl->port = q->hwe->exl_port;
 	exl->has_run = false;
-	exl->active_priority = DRM_SCHED_PRIORITY_UNSET;
+	exl->active_priority = XE_SCHED_PRIORITY_UNSET;
 	q->execlist = exl;
 	q->entity = &exl->entity;
 
@@ -376,7 +378,7 @@ static void execlist_exec_queue_fini_async(struct work_struct *w)
 	xe_assert(xe, !xe_device_uc_enabled(xe));
 
 	spin_lock_irqsave(&exl->port->lock, flags);
-	if (WARN_ON(exl->active_priority != DRM_SCHED_PRIORITY_UNSET))
+	if (WARN_ON(exl->active_priority != XE_SCHED_PRIORITY_UNSET))
 		list_del(&exl->active_link);
 	spin_unlock_irqrestore(&exl->port->lock, flags);
 
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
new file mode 100644
index 000000000000..e4ad1d6ce1d5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_gpu_scheduler.h"
+
+static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
+{
+	if (!READ_ONCE(sched->base.pause_submit))
+		queue_work(sched->base.submit_wq, &sched->work_process_msg);
+}
+
+static void xe_sched_process_msg_queue_if_ready(struct xe_gpu_scheduler *sched)
+{
+	struct xe_sched_msg *msg;
+
+	spin_lock(&sched->base.job_list_lock);
+	msg = list_first_entry_or_null(&sched->msgs, struct xe_sched_msg, link);
+	if (msg)
+		xe_sched_process_msg_queue(sched);
+	spin_unlock(&sched->base.job_list_lock);
+}
+
+static struct xe_sched_msg *
+xe_sched_get_msg(struct xe_gpu_scheduler *sched)
+{
+	struct xe_sched_msg *msg;
+
+	spin_lock(&sched->base.job_list_lock);
+	msg = list_first_entry_or_null(&sched->msgs,
+				       struct xe_sched_msg, link);
+	if (msg)
+		list_del(&msg->link);
+	spin_unlock(&sched->base.job_list_lock);
+
+	return msg;
+}
+
+static void xe_sched_process_msg_work(struct work_struct *w)
+{
+	struct xe_gpu_scheduler *sched =
+		container_of(w, struct xe_gpu_scheduler, work_process_msg);
+	struct xe_sched_msg *msg;
+
+	if (READ_ONCE(sched->base.pause_submit))
+		return;
+
+	msg = xe_sched_get_msg(sched);
+	if (msg) {
+		sched->ops->process_msg(msg);
+
+		xe_sched_process_msg_queue_if_ready(sched);
+	}
+}
+
+int xe_sched_init(struct xe_gpu_scheduler *sched,
+		  const struct drm_sched_backend_ops *ops,
+		  const struct xe_sched_backend_ops *xe_ops,
+		  struct workqueue_struct *submit_wq,
+		  uint32_t hw_submission, unsigned hang_limit,
+		  long timeout, struct workqueue_struct *timeout_wq,
+		  atomic_t *score, const char *name,
+		  struct device *dev)
+{
+	sched->ops = xe_ops;
+	INIT_LIST_HEAD(&sched->msgs);
+	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
+
+	return drm_sched_init(&sched->base, ops, submit_wq, 1, hw_submission,
+			      hang_limit, timeout, timeout_wq, score, name,
+			      dev);
+}
+
+void xe_sched_fini(struct xe_gpu_scheduler *sched)
+{
+	xe_sched_submission_stop(sched);
+	drm_sched_fini(&sched->base);
+}
+
+void xe_sched_submission_start(struct xe_gpu_scheduler *sched)
+{
+	drm_sched_wqueue_start(&sched->base);
+	queue_work(sched->base.submit_wq, &sched->work_process_msg);
+}
+
+void xe_sched_submission_stop(struct xe_gpu_scheduler *sched)
+{
+	drm_sched_wqueue_stop(&sched->base);
+	cancel_work_sync(&sched->work_process_msg);
+}
+
+void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
+		      struct xe_sched_msg *msg)
+{
+	spin_lock(&sched->base.job_list_lock);
+	list_add_tail(&msg->link, &sched->msgs);
+	spin_unlock(&sched->base.job_list_lock);
+
+	xe_sched_process_msg_queue(sched);
+}
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
new file mode 100644
index 000000000000..ea785bcd3eb2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GPU_SCHEDULER_H_
+#define _XE_GPU_SCHEDULER_H_
+
+#include "xe_gpu_scheduler_types.h"
+#include "xe_sched_job_types.h"
+
+int xe_sched_init(struct xe_gpu_scheduler *sched,
+		  const struct drm_sched_backend_ops *ops,
+		  const struct xe_sched_backend_ops *xe_ops,
+		  struct workqueue_struct *submit_wq,
+		  uint32_t hw_submission, unsigned hang_limit,
+		  long timeout, struct workqueue_struct *timeout_wq,
+		  atomic_t *score, const char *name,
+		  struct device *dev);
+void xe_sched_fini(struct xe_gpu_scheduler *sched);
+
+void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
+void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
+
+void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
+		      struct xe_sched_msg *msg);
+
+static inline void xe_sched_stop(struct xe_gpu_scheduler *sched)
+{
+	drm_sched_stop(&sched->base, NULL);
+}
+
+static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
+{
+	drm_sched_tdr_queue_imm(&sched->base);
+}
+
+static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
+{
+	drm_sched_resubmit_jobs(&sched->base);
+}
+
+static inline bool
+xe_sched_invalidate_job(struct xe_sched_job *job, int threshold)
+{
+	return drm_sched_invalidate_job(&job->drm, threshold);
+}
+
+static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
+					    struct xe_sched_job *job)
+{
+	list_add(&job->drm.list, &sched->base.pending_list);
+}
+
+static inline
+struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
+{
+	return list_first_entry_or_null(&sched->base.pending_list,
+					struct xe_sched_job, drm.list);
+}
+
+static inline int
+xe_sched_entity_init(struct xe_sched_entity *entity,
+		     struct xe_gpu_scheduler *sched)
+{
+	return drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_MIN,
+				     (struct drm_gpu_scheduler **)&sched,
+				     1, NULL);
+}
+
+#define xe_sched_entity_fini drm_sched_entity_fini
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
new file mode 100644
index 000000000000..86133835d4d1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GPU_SCHEDULER_TYPES_H_
+#define _XE_GPU_SCHEDULER_TYPES_H_
+
+#include <drm/gpu_scheduler.h>
+
+/**
+ * struct xe_sched_msg - an in-band (relative to GPU scheduler run queue)
+ * message
+ *
+ * Generic enough for backend defined messages, backend can expand if needed.
+ */
+struct xe_sched_msg {
+	/** @link: list link into the gpu scheduler list of messages */
+	struct list_head		link;
+	/**
+	 * @private_data: opaque pointer to message private data (backend defined)
+	 */
+	void				*private_data;
+	/** @opcode: opcode of message (backend defined) */
+	unsigned int			opcode;
+};
+
+/**
+ * struct xe_sched_backend_ops - Define the backend operations called by the
+ * scheduler
+ */
+struct xe_sched_backend_ops {
+	/**
+	 * @process_msg: Process a message. Allowed to block, it is this
+	 * function's responsibility to free message if dynamically allocated.
+	 */
+	void (*process_msg)(struct xe_sched_msg *msg);
+};
+
+/**
+ * struct xe_gpu_scheduler - Xe GPU scheduler
+ */
+struct xe_gpu_scheduler {
+	/** @base: DRM GPU scheduler */
+	struct drm_gpu_scheduler		base;
+	/** @ops: Xe scheduler ops */
+	const struct xe_sched_backend_ops	*ops;
+	/** @msgs: list of messages to be processed in @work_process_msg */
+	struct list_head			msgs;
+	/** @work_process_msg: processes messages */
+	struct work_struct		work_process_msg;
+};
+
+#define xe_sched_entity		drm_sched_entity
+#define xe_sched_policy		drm_sched_policy
+#define xe_sched_priority	drm_sched_priority
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index d95ef0021a1f..4c39f01e4f52 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -9,7 +9,7 @@
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 
-#include <drm/gpu_scheduler.h>
+#include "xe_gpu_scheduler_types.h"
 
 struct dma_fence;
 struct xe_exec_queue;
@@ -21,16 +21,16 @@ struct xe_guc_exec_queue {
 	/** @q: Backpointer to parent xe_exec_queue */
 	struct xe_exec_queue *q;
 	/** @sched: GPU scheduler for this xe_exec_queue */
-	struct drm_gpu_scheduler sched;
+	struct xe_gpu_scheduler sched;
 	/** @entity: Scheduler entity for this xe_exec_queue */
-	struct drm_sched_entity entity;
+	struct xe_sched_entity entity;
 	/**
 	 * @static_msgs: Static messages for this xe_exec_queue, used when
 	 * a message needs to sent through the GPU scheduler but memory
 	 * allocations are not allowed.
 	 */
 #define MAX_STATIC_MSG_TYPE	3
-	struct drm_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
+	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
 	/** @lr_tdr: long running TDR worker */
 	struct work_struct lr_tdr;
 	/** @fini_async: do final fini async from this worker */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8ca364b5b1b1..8ae1a49186e5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -19,6 +19,7 @@
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
+#include "xe_gpu_scheduler.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
@@ -360,7 +361,7 @@ MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
 MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
 #undef MAKE_EXEC_QUEUE_POLICY_ADD
 
-static const int drm_sched_prio_to_guc[] = {
+static const int xe_sched_prio_to_guc[] = {
 	[DRM_SCHED_PRIORITY_MIN] = GUC_CLIENT_PRIORITY_NORMAL,
 	[DRM_SCHED_PRIORITY_NORMAL] = GUC_CLIENT_PRIORITY_KMD_NORMAL,
 	[DRM_SCHED_PRIORITY_HIGH] = GUC_CLIENT_PRIORITY_HIGH,
@@ -371,14 +372,14 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	struct exec_queue_policy policy;
 	struct xe_device *xe = guc_to_xe(guc);
-	enum drm_sched_priority prio = q->entity->priority;
+	enum xe_sched_priority prio = q->priority;
 	u32 timeslice_us = q->sched_props.timeslice_us;
 	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
 
 	xe_assert(xe, exec_queue_registered(q));
 
 	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
-	__guc_exec_queue_policy_add_priority(&policy, drm_sched_prio_to_guc[prio]);
+	__guc_exec_queue_policy_add_priority(&policy, xe_sched_prio_to_guc[prio]);
 	__guc_exec_queue_policy_add_execution_quantum(&policy, timeslice_us);
 	__guc_exec_queue_policy_add_preemption_timeout(&policy, preempt_timeout_us);
 
@@ -719,7 +720,6 @@ static int guc_read_stopped(struct xe_guc *guc)
 		q->guc->id,						\
 		GUC_CONTEXT_##enable_disable,				\
 	}
-#define MIN_SCHED_TIMEOUT	1
 
 static void disable_scheduling_deregister(struct xe_guc *guc,
 					  struct xe_exec_queue *q)
@@ -733,12 +733,12 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 	ret = wait_event_timeout(guc->ct.wq, !exec_queue_pending_enable(q) ||
 				 guc_read_stopped(guc), HZ * 5);
 	if (!ret) {
-		struct drm_gpu_scheduler *sched = &q->guc->sched;
+		struct xe_gpu_scheduler *sched = &q->guc->sched;
 
 		drm_warn(&xe->drm, "Pending enable failed to respond");
-		sched->timeout = MIN_SCHED_TIMEOUT;
-		drm_sched_run_wq_start(sched);
+		xe_sched_submission_start(sched);
 		xe_gt_reset_async(q->gt);
+		xe_sched_tdr_queue_imm(sched);
 		return;
 	}
 
@@ -809,7 +809,7 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 	if (xe_exec_queue_is_lr(q))
 		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
 	else
-		drm_sched_set_timeout(&q->guc->sched, MIN_SCHED_TIMEOUT);
+		xe_sched_tdr_queue_imm(&q->guc->sched);
 }
 
 static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
@@ -819,13 +819,13 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	struct xe_exec_queue *q = ge->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
-	struct drm_gpu_scheduler *sched = &ge->sched;
+	struct xe_gpu_scheduler *sched = &ge->sched;
 
 	xe_assert(xe, xe_exec_queue_is_lr(q));
 	trace_xe_exec_queue_lr_cleanup(q);
 
 	/* Kill the run_job / process_msg entry points */
-	drm_sched_run_wq_stop(sched);
+	xe_sched_submission_stop(sched);
 
 	/*
 	 * Engine state now mostly stable, disable scheduling / deregister if
@@ -854,13 +854,13 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 					 guc_read_stopped(guc), HZ * 5);
 		if (!ret) {
 			drm_warn(&xe->drm, "Schedule disable failed to respond");
-			drm_sched_run_wq_start(sched);
+			xe_sched_submission_start(sched);
 			xe_gt_reset_async(q->gt);
 			return;
 		}
 	}
 
-	drm_sched_run_wq_start(sched);
+	xe_sched_submission_start(sched);
 }
 
 static enum drm_gpu_sched_stat
@@ -869,7 +869,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 	struct xe_sched_job *tmp_job;
 	struct xe_exec_queue *q = job->q;
-	struct drm_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
 	int err = -ETIME;
 	int i = 0;
@@ -889,7 +889,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	trace_xe_sched_job_timedout(job);
 
 	/* Kill the run_job entry point */
-	drm_sched_run_wq_stop(sched);
+	xe_sched_submission_stop(sched);
 
 	/*
 	 * Kernel jobs should never fail, nor should VM jobs if they do
@@ -897,9 +897,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 */
 	if (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
 	    (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q))) {
-		if (!drm_sched_invalidate_job(drm_job, 2)) {
-			list_add(&drm_job->list, &sched->pending_list);
-			drm_sched_run_wq_start(sched);
+		if (!xe_sched_invalidate_job(job, 2)) {
+			xe_sched_add_pending_job(sched, job);
+			xe_sched_submission_start(sched);
 			xe_gt_reset_async(q->gt);
 			goto out;
 		}
@@ -932,10 +932,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 					 guc_read_stopped(guc), HZ * 5);
 		if (!ret || guc_read_stopped(guc)) {
 			drm_warn(&xe->drm, "Schedule disable failed to respond");
-			sched->timeout = MIN_SCHED_TIMEOUT;
-			list_add(&drm_job->list, &sched->pending_list);
-			drm_sched_run_wq_start(sched);
+			xe_sched_add_pending_job(sched, job);
+			xe_sched_submission_start(sched);
 			xe_gt_reset_async(q->gt);
+			xe_sched_tdr_queue_imm(sched);
 			goto out;
 		}
 	}
@@ -947,15 +947,15 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * Fence state now stable, stop / start scheduler which cleans up any
 	 * fences that are complete
 	 */
-	list_add(&drm_job->list, &sched->pending_list);
-	drm_sched_run_wq_start(sched);
+	xe_sched_add_pending_job(sched, job);
+	xe_sched_submission_start(sched);
 	xe_guc_exec_queue_trigger_cleanup(q);
 
 	/* Mark all outstanding jobs as bad, thus completing them */
-	spin_lock(&sched->job_list_lock);
-	list_for_each_entry(tmp_job, &sched->pending_list, drm.list)
+	spin_lock(&sched->base.job_list_lock);
+	list_for_each_entry(tmp_job, &sched->base.pending_list, drm.list)
 		xe_sched_job_set_error(tmp_job, !i++ ? err : -ECANCELED);
-	spin_unlock(&sched->job_list_lock);
+	spin_unlock(&sched->base.job_list_lock);
 
 	/* Start fence signaling */
 	xe_hw_fence_irq_start(q->fence_irq);
@@ -978,8 +978,8 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 	if (q->flags & EXEC_QUEUE_FLAG_PERSISTENT)
 		xe_device_remove_persistent_exec_queues(gt_to_xe(q->gt), q);
 	release_guc_id(guc, q);
-	drm_sched_entity_fini(&ge->entity);
-	drm_sched_fini(&ge->sched);
+	xe_sched_entity_fini(&ge->entity);
+	xe_sched_fini(&ge->sched);
 
 	kfree(ge);
 	xe_exec_queue_fini(q);
@@ -1008,7 +1008,7 @@ static void __guc_exec_queue_fini(struct xe_guc *guc, struct xe_exec_queue *q)
 	guc_exec_queue_fini_async(q);
 }
 
-static void __guc_exec_queue_process_msg_cleanup(struct drm_sched_msg *msg)
+static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1028,7 +1028,7 @@ static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
 	return !exec_queue_killed_or_banned(q) && exec_queue_registered(q);
 }
 
-static void __guc_exec_queue_process_msg_set_sched_props(struct drm_sched_msg *msg)
+static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1052,7 +1052,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
 	wake_up(&q->guc->suspend_wait);
 }
 
-static void __guc_exec_queue_process_msg_suspend(struct drm_sched_msg *msg)
+static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1087,7 +1087,7 @@ static void __guc_exec_queue_process_msg_suspend(struct drm_sched_msg *msg)
 	}
 }
 
-static void __guc_exec_queue_process_msg_resume(struct drm_sched_msg *msg)
+static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1113,9 +1113,9 @@ static void __guc_exec_queue_process_msg_resume(struct drm_sched_msg *msg)
 #define SUSPEND		3
 #define RESUME		4
 
-static void guc_exec_queue_process_msg(struct drm_sched_msg *msg)
+static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 {
-	trace_drm_sched_msg_recv(msg);
+	trace_xe_sched_msg_recv(msg);
 
 	switch (msg->opcode) {
 	case CLEANUP:
@@ -1139,12 +1139,15 @@ static const struct drm_sched_backend_ops drm_sched_ops = {
 	.run_job = guc_exec_queue_run_job,
 	.free_job = guc_exec_queue_free_job,
 	.timedout_job = guc_exec_queue_timedout_job,
+};
+
+static const struct xe_sched_backend_ops xe_sched_ops = {
 	.process_msg = guc_exec_queue_process_msg,
 };
 
 static int guc_exec_queue_init(struct xe_exec_queue *q)
 {
-	struct drm_gpu_scheduler *sched;
+	struct xe_gpu_scheduler *sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_guc_exec_queue *ge;
@@ -1163,7 +1166,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	timeout = (q->vm && xe_vm_no_dma_fences(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  q->hwe->eclass->sched_props.job_timeout_ms;
-	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
+	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops, NULL,
 			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			     q->name, gt_to_xe(q->gt)->drm.dev);
@@ -1171,10 +1174,10 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 		goto err_free;
 
 	sched = &ge->sched;
-	err = drm_sched_entity_init(&ge->entity, DRM_SCHED_PRIORITY_NORMAL,
-				    &sched, 1, NULL);
+	err = xe_sched_entity_init(&ge->entity, sched);
 	if (err)
 		goto err_sched;
+	q->priority = DRM_SCHED_PRIORITY_NORMAL;
 
 	if (xe_exec_queue_is_lr(q))
 		INIT_WORK(&q->guc->lr_tdr, xe_guc_exec_queue_lr_cleanup);
@@ -1188,7 +1191,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	q->entity = &ge->entity;
 
 	if (guc_read_stopped(guc))
-		drm_sched_stop(sched, NULL);
+		xe_sched_stop(sched);
 
 	mutex_unlock(&guc->submission_state.lock);
 
@@ -1199,9 +1202,9 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	return 0;
 
 err_entity:
-	drm_sched_entity_fini(&ge->entity);
+	xe_sched_entity_fini(&ge->entity);
 err_sched:
-	drm_sched_fini(&ge->sched);
+	xe_sched_fini(&ge->sched);
 err_free:
 	kfree(ge);
 
@@ -1215,15 +1218,15 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
 	xe_guc_exec_queue_trigger_cleanup(q);
 }
 
-static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct drm_sched_msg *msg,
+static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
 				   u32 opcode)
 {
 	INIT_LIST_HEAD(&msg->link);
 	msg->opcode = opcode;
 	msg->private_data = q;
 
-	trace_drm_sched_msg_add(msg);
-	drm_sched_add_msg(&q->guc->sched, msg);
+	trace_xe_sched_msg_add(msg);
+	xe_sched_add_msg(&q->guc->sched, msg);
 }
 
 #define STATIC_MSG_CLEANUP	0
@@ -1231,7 +1234,7 @@ static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct drm_sched_msg
 #define STATIC_MSG_RESUME	2
 static void guc_exec_queue_fini(struct xe_exec_queue *q)
 {
-	struct drm_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
+	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
 
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT))
 		guc_exec_queue_add_msg(q, msg, CLEANUP);
@@ -1240,27 +1243,26 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 }
 
 static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
-				       enum drm_sched_priority priority)
+				       enum xe_sched_priority priority)
 {
-	struct drm_sched_msg *msg;
+	struct xe_sched_msg *msg;
 
-	if (q->entity->priority == priority || exec_queue_killed_or_banned(q))
+	if (q->priority == priority || exec_queue_killed_or_banned(q))
 		return 0;
 
 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
-
-	drm_sched_entity_set_priority(q->entity, priority);
 	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
+	q->priority = priority;
 
 	return 0;
 }
 
 static int guc_exec_queue_set_timeslice(struct xe_exec_queue *q, u32 timeslice_us)
 {
-	struct drm_sched_msg *msg;
+	struct xe_sched_msg *msg;
 
 	if (q->sched_props.timeslice_us == timeslice_us ||
 	    exec_queue_killed_or_banned(q))
@@ -1279,7 +1281,7 @@ static int guc_exec_queue_set_timeslice(struct xe_exec_queue *q, u32 timeslice_u
 static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
 					      u32 preempt_timeout_us)
 {
-	struct drm_sched_msg *msg;
+	struct xe_sched_msg *msg;
 
 	if (q->sched_props.preempt_timeout_us == preempt_timeout_us ||
 	    exec_queue_killed_or_banned(q))
@@ -1297,7 +1299,7 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
 
 static int guc_exec_queue_set_job_timeout(struct xe_exec_queue *q, u32 job_timeout_ms)
 {
-	struct drm_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 
@@ -1305,14 +1307,14 @@ static int guc_exec_queue_set_job_timeout(struct xe_exec_queue *q, u32 job_timeo
 	xe_assert(xe, !exec_queue_banned(q));
 	xe_assert(xe, !exec_queue_killed(q));
 
-	sched->timeout = job_timeout_ms;
+	sched->base.timeout = job_timeout_ms;
 
 	return 0;
 }
 
 static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 {
-	struct drm_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
+	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
 
 	if (exec_queue_killed_or_banned(q) || q->guc->suspend_pending)
 		return -EINVAL;
@@ -1333,7 +1335,7 @@ static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 
 static void guc_exec_queue_resume(struct xe_exec_queue *q)
 {
-	struct drm_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
+	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 
@@ -1363,10 +1365,10 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 
 static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 {
-	struct drm_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
 
 	/* Stop scheduling + flush any DRM scheduler operations */
-	drm_sched_run_wq_stop(sched);
+	xe_sched_submission_stop(sched);
 
 	/* Clean up lost G2H + reset engine state */
 	if (exec_queue_registered(q)) {
@@ -1391,18 +1393,14 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 	 * more than twice.
 	 */
 	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
-		struct drm_sched_job *drm_job =
-			list_first_entry_or_null(&sched->pending_list,
-						 struct drm_sched_job, list);
-
-		if (drm_job) {
-			struct xe_sched_job *job = to_xe_sched_job(drm_job);
+		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
 
+		if (job) {
 			if ((xe_sched_job_started(job) &&
 			    !xe_sched_job_completed(job)) ||
-			    drm_sched_invalidate_job(drm_job, 2)) {
+			    xe_sched_invalidate_job(job, 2)) {
 				trace_xe_sched_job_ban(job);
-				sched->timeout = MIN_SCHED_TIMEOUT;
+				xe_sched_tdr_queue_imm(&q->guc->sched);
 				set_exec_queue_banned(q);
 			}
 		}
@@ -1457,7 +1455,7 @@ int xe_guc_submit_stop(struct xe_guc *guc)
 
 static void guc_exec_queue_start(struct xe_exec_queue *q)
 {
-	struct drm_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
 
 	if (!exec_queue_killed_or_banned(q)) {
 		int i;
@@ -1465,11 +1463,10 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
 		trace_xe_exec_queue_resubmit(q);
 		for (i = 0; i < q->width; ++i)
 			xe_lrc_set_ring_head(q->lrc + i, q->lrc[i].ring.tail);
-		drm_sched_resubmit_jobs(sched);
+		xe_sched_resubmit_jobs(sched);
 	}
 
-	drm_sched_run_wq_start(sched);
-	drm_sched_set_timeout(sched, sched->timeout);
+	xe_sched_submission_start(sched);
 }
 
 int xe_guc_submit_start(struct xe_guc *guc)
@@ -1753,7 +1750,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
-	struct drm_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_sched_job *job;
 	struct xe_guc_submit_exec_queue_snapshot *snapshot;
 	int i;
@@ -1771,7 +1768,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 	snapshot->logical_mask = q->logical_mask;
 	snapshot->width = q->width;
 	snapshot->refcount = kref_read(&q->refcount);
-	snapshot->sched_timeout = sched->timeout;
+	snapshot->sched_timeout = sched->base.timeout;
 	snapshot->sched_props.timeslice_us = q->sched_props.timeslice_us;
 	snapshot->sched_props.preempt_timeout_us =
 		q->sched_props.preempt_timeout_us;
@@ -1803,8 +1800,8 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 	if (snapshot->parallel_execution)
 		guc_exec_queue_wq_snapshot_capture(q, snapshot);
 
-	spin_lock(&sched->job_list_lock);
-	snapshot->pending_list_size = list_count_nodes(&sched->pending_list);
+	spin_lock(&sched->base.job_list_lock);
+	snapshot->pending_list_size = list_count_nodes(&sched->base.pending_list);
 	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
 					       sizeof(struct pending_list_snapshot),
 					       GFP_ATOMIC);
@@ -1813,7 +1810,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 		drm_err(&xe->drm, "Skipping GuC Engine pending_list snapshot.\n");
 	} else {
 		i = 0;
-		list_for_each_entry(job, &sched->pending_list, drm.list) {
+		list_for_each_entry(job, &sched->base.pending_list, drm.list) {
 			snapshot->pending_list[i].seqno =
 				xe_sched_job_seqno(job);
 			snapshot->pending_list[i].fence =
@@ -1825,7 +1822,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 		}
 	}
 
-	spin_unlock(&sched->job_list_lock);
+	spin_unlock(&sched->base.job_list_lock);
 
 	return snapshot;
 }
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 1536130e56f6..95163c303f3e 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -14,6 +14,7 @@
 
 #include "xe_bo_types.h"
 #include "xe_exec_queue_types.h"
+#include "xe_gpu_scheduler_types.h"
 #include "xe_gt_tlb_invalidation_types.h"
 #include "xe_gt_types.h"
 #include "xe_guc_exec_queue_types.h"
@@ -290,8 +291,8 @@ DEFINE_EVENT(xe_sched_job, xe_sched_job_ban,
 	     TP_ARGS(job)
 );
 
-DECLARE_EVENT_CLASS(drm_sched_msg,
-		    TP_PROTO(struct drm_sched_msg *msg),
+DECLARE_EVENT_CLASS(xe_sched_msg,
+		    TP_PROTO(struct xe_sched_msg *msg),
 		    TP_ARGS(msg),
 
 		    TP_STRUCT__entry(
@@ -309,13 +310,13 @@ DECLARE_EVENT_CLASS(drm_sched_msg,
 			      __entry->opcode)
 );
 
-DEFINE_EVENT(drm_sched_msg, drm_sched_msg_add,
-	     TP_PROTO(struct drm_sched_msg *msg),
+DEFINE_EVENT(xe_sched_msg, xe_sched_msg_add,
+	     TP_PROTO(struct xe_sched_msg *msg),
 	     TP_ARGS(msg)
 );
 
-DEFINE_EVENT(drm_sched_msg, drm_sched_msg_recv,
-	     TP_PROTO(struct drm_sched_msg *msg),
+DEFINE_EVENT(xe_sched_msg, xe_sched_msg_recv,
+	     TP_PROTO(struct xe_sched_msg *msg),
 	     TP_ARGS(msg)
 );
 
-- 
2.41.0

