Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AD9C77B75
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 14:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D49610E261;
	Tue, 16 May 2023 14:54:49 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0120F10E248
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 14:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684248886; x=1715784886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pJlWUl16gKLR+2zyd6YbUJOmWoZfNxU6CBFZywrlQLY=;
 b=HBu80vh7mieSnkEz6k/8kjCy9ZQ9hstsevBVBWQ+0Chyb+YH1SUqkUYH
 c9fggEobowafZT+bkBKiXAByA7udnD+EBl+qlvsnCkxZxKy7W1MKZIuwv
 QHzsqcC8PCBjiAdp/QPFu12vstebuVlSfUw/hK9F8Z7uVUdsfvTTkCs+k
 NjybwPkrYY1r7QuoE/dmRFOPyqARi7JbNYl7OutuEBeqGwdpeEBus2j7G
 bv2cDtvcVaNavmXa19RG6Vy6fDwokJcTHRCTdi60a84jcEkuax33Z+8FU
 rPrRWan/qmrEs8Rj+rPHn3sQZCv5UwobApe3QTUTFUArz/Og4zq4TLCf6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="340867060"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="340867060"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:54:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="1031316295"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="1031316295"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 16 May 2023 07:54:45 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 07:54:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 07:54:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 07:54:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SM10jAZ+1eKQTOhIsmOp2Ov45RaYkbbugJXs84tDwU7cG286PZ8Y8wcCgJKfoUbdP5Qa0KH1boeyuUVCvKIckYiFH9VnZhKYAWCl8j1s+L3v3RjnlAmdltSOfXWRjwIcWBahIcIaby2ZRZdKIOsBHXdddCk/bz7CJmEubAUzc4jIKkepBhUVRuBeo8CVd15g+xlk9ocHBWBJ52HshW53pxfOv8HXQYJ/gUkQN6GqIjeZPbWjdpv1OhX2WyGe1i0O9DEuade4u3OSce+NjSq0YvcINsQO6wSFnhMcCUGQDwOti3m/5WqlTUQcE9yt0tzsjmoyw3PW9WjoXv40a7vRtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSWLJbd9WqAlL15HhQj1YtqPqwHXYv2QB34ZYCSDyO4=;
 b=PYS99b6ttzXcWrwvGUD1eqt3kJI52F4gCa5dV6D8KeBSzSzq7uAEImPUud2rcOGBYP55iM/6zJRyjla4zMQMBE2Ud6gxBwuGyyKocHVyufZwY5sF7ycvAbeoDBqFvns7h490sMI+j8bzgLVa18/PbKHqd5y3nYNLEoHnCeIaX/sWOMm/r1PYxLHMa6z7UmVpilVtzPDdgkp69fOh5oFwveW4+vaJPIaYeFIxTuvEFM4WMQQpGOCglzNZLl3pio/7WZA0foRv2WR9i6sihWhH8yTJ3Ges+sCjhMgAywZ7gamdGZmLxqSzPDjJAPNty9Hd2c7xfG08S8v0x88AiIM01Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 14:54:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 14:54:43 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 16 May 2023 10:54:11 -0400
Message-ID: <20230516145416.1851984-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::39) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7253d4-509f-4971-de29-08db561d7bb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5obbeVVIREHKcEhnUf6wxmY0cLxT+mvD5p2iLoXhot+tACahR/W6B3BSVYPU0YsPMsU8GkfAjrL6bzh72OFRlnegYLjAc4TbO8X6l6/4AThLk2y/LVd2D6GisaKCr0pdbiWP5pPXYD+T9xa/zOQpdwzQBihf0D7papg8U7xmy+2Hh5IXneFW/RbEqSbEIsMFqVJj0wHHjP9UEOpoaw9Ext/zIxkXbDfWQtjauNgNHKr7uoiWNVxT/jJHMhQ5gz3U316KnamFd0awvibbfg3xR7e8CbVEUSzhwEvYxBOgHnFhjIsk3b6LK8iookZAFHxUe7g9UAxrS+/1FFCsyiOttGYgAEjqPqhrO4Whdp4QxizIMtnkk3WfJ0/wWKP07UgleqDYggpGnk3zO7/wZikf/uL0LEomsKkXcUqziTTO+57hHDSs+d+SrGj1Uc/j5ZzUb6C8AKlPxDkTepLvMtLAmA9f6lEDu1ZKMOi1KimMbMK+KVXhErx4PbWKKZjk3sfBAKnNfAhhpCX6NDmdzIMNrcSAe3t9RJgw+203COEvTrreqAo5jHTf11TIW6vGHLWI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199021)(44832011)(478600001)(8676002)(86362001)(8936002)(5660300002)(36756003)(2906002)(6916009)(66556008)(4326008)(82960400001)(66476007)(66946007)(316002)(41300700001)(38100700002)(186003)(2616005)(107886003)(1076003)(26005)(6512007)(83380400001)(6506007)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0R5MFByOGtCK1VpVHdyL2l1bTFDakNza1pDQnEwYVIxZnlDNDRVam50V3NF?=
 =?utf-8?B?L1ZoekJJYXFZelhVclZGM0w1Nm5JMmlhc1FHNzJGQkNMTERVTlBBQndxTlB2?=
 =?utf-8?B?TWFCTjNjdFNVS0tYNGlxWEtvNWRqN24vTFpQMjBsaFhQU0o4Q3JIM1dzTWFD?=
 =?utf-8?B?dExpRkl5VisrZUJTWm51WFJCcm42M3lYR1lCSGwyNkpxc0Nxb1R3cmtRR1Y4?=
 =?utf-8?B?L2JLN1IyU2RIa1FmaWpOdzljeEJ6SGNERk1seFJxaE5Kc20zaEMxa3UwOTZS?=
 =?utf-8?B?QjNtbTdzTXBtNmhWbzhMVkFLRFBVT2UydXpOZUZIL2IwbEQ5dzBFNXZIRDRv?=
 =?utf-8?B?SGNpcnZOMTVYZ3g1S29RMkZrQ011T3lTZUE5YS9md2NZVXBjL3JvOG9mWWtm?=
 =?utf-8?B?TFpRUUNtdk41VEUzaUF2SnNGOU8rbm1xQU91OC8wME9JNjlHTnNGYVFoUUxr?=
 =?utf-8?B?RVJMc1VGSXVZSzY5NFlrNXM1VU80b3dUNzg3QWxlWjRsSDJTa1JZbXlWSlp1?=
 =?utf-8?B?ZEY3QjlFRG4xcmVmdGZLZVhLVWE3dFRtVXhoRitZc3hjVkhQcDZsbjhYWlp6?=
 =?utf-8?B?RDk3Q242Q3FMS2paY01FMzRUbUQxVUpyZXI4R05mSm5HQUtKMFJGOStZRXpL?=
 =?utf-8?B?RmIzUklDejBuWXl5dGRDc0gxTy9qT1NKNUFJOXJTRTBqdHpEQU1YaU14cG9R?=
 =?utf-8?B?N3JVUVV6TEJ0RVd6NUZCL3VSSTFNMFUva01GYjVDdlc1QWNPOUpPYnNBdS9t?=
 =?utf-8?B?OVc1aHAzdXEvbHJzWTBJa1haeDJEdjNFVk14RStZU2FBV3lMc3BaQXJpRDFQ?=
 =?utf-8?B?ZEphMUk3dTh2WHVMVzJLU1grNHlocmNDeWo2NXdwWjk2SE11MjQzWXBTalJC?=
 =?utf-8?B?R0FwREE5OThXKzF3YlBJYkVtSWJIdjFaYy9EQXJoVmF4V0lyamt6UTM0c1Zx?=
 =?utf-8?B?N0Z6NEdIZSttQWcwd0c2UVhMMHhLQ1FyT2I1TmxYUVEveVhHY3NzbzZkY0JO?=
 =?utf-8?B?dThUaFRDTjM0ekR1RU5JOXJ5cXhKd3ZpRDBRUHJxSU9nNTBpTEswMU1yakVh?=
 =?utf-8?B?bDVuN3J2YWRBS0JHRm5LUFhpYjBrbVVZZk9GRFFJSFRNelI2R2MwS0JROWl0?=
 =?utf-8?B?QWoya0YvUlVyZm5QNnJVVm1yc0I4OU9qODJUbi9aWFoxb0xCaVBjeWN4M1pO?=
 =?utf-8?B?ZlAzWVpzNTkzRzVVaWFmSnBWdkdEWVdTRStWYUdKS1BiZEtOQ3pvNU1PMnpy?=
 =?utf-8?B?Wmpwd0wvMHJhMjBmaThHMldzbUwySWM5eHZDY1p3NVN0dWJOYkRIanNsSUVG?=
 =?utf-8?B?ZW9RMjdpdVc1eC9GSmtsVkI3ZVg5ckFzRnNGRzcyY2llMVZaTU5wNUJ0Ulc1?=
 =?utf-8?B?OEJGK0pEUWdueXdiK1dneUVJWXZNMGtlRS9Jdk9BblFIaTZCbGhiWndOVGw0?=
 =?utf-8?B?cEViaTZFdkN3a1VWd1ZxUjVsUFM2OHlDR3hKeVNaeXZYSW1TMDk0b0VYelFx?=
 =?utf-8?B?WWlmYnZaejE5NGpFWDArbFdsU0ZvRGtGOGFHem41d1RVRWdxMFU1U0VKZVFC?=
 =?utf-8?B?UFJwZUJQcWNYZTF5WEpLRlZZVVp5b25xSjRRZ3VvQ3ZHT0FSUGdLeE9tUWNH?=
 =?utf-8?B?K3pDUlJrQ3djVFFGeDB4WVhjeEFlSUZ6YVNtSGZqcG9LamdjMXhEY1JLL0Rk?=
 =?utf-8?B?SUhkN0NPZ3FHczJ0eWRSdEM5RmdiY0VlK2ZPTytRYUw0V1RMZGN0VTFOR0tV?=
 =?utf-8?B?QmxJSzVvWEsyVEp4NUFuMkszMXpSeFZ3bGM1WkZ0Ulp6dFNjYTBiSnpwZDgv?=
 =?utf-8?B?dFgycHM3d2dKd2tBTEJTc0hJQ3ZWRWhSVithV2FGdWxXdTZoRUg4WmYzT2tT?=
 =?utf-8?B?Snk2b2ZMa2ZsSG8yUnpUb0VYbXpUSUlTVzlxNjEwWlcwWm1TdXMxTm9aWjl1?=
 =?utf-8?B?NW5tU09WZnBjNEJWVDN2TSs4UzU1d3lnZGMwblRmNnpQcCt4MnRIaElpMlcr?=
 =?utf-8?B?QVFzL1JTVlUzNVg0dHV2dkNLMk90UFpLTUpiSnFMTjZwSTNlLzROTTlzaUIr?=
 =?utf-8?B?Ri9wUXpNWm52dFpFS0Z1d2ZFaHd3RmdIYkJZdktFaWpuMjFEa1pYdytha29t?=
 =?utf-8?Q?IpRA57gAut9Yq6a5eA7aG/jQY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7253d4-509f-4971-de29-08db561d7bb3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 14:54:43.5301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j49H1nnS3oFVPIabEHW49hDDcjyH8hBHajcH0fNTcvpGA9a1PjftG5cI8p7ZPyznOEeXLOyitLKDlPVvREwvgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 06/11] drm/xe: Introduce guc_submit_types.h
 with relevant structs.
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

These structs and definitions are only used for the guc_submit
and they were added specifically for the parallel submission.

While doing that also delete the unused struct guc_wq_item.

v2: checkpatch fixes.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_fwif.h         | 29 -----------
 drivers/gpu/drm/xe/xe_guc_submit.c       | 42 +++++-----------
 drivers/gpu/drm/xe/xe_guc_submit_types.h | 64 ++++++++++++++++++++++++
 3 files changed, 76 insertions(+), 59 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_submit_types.h

diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 20155ba4ef07..27d132ce2087 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -46,35 +46,6 @@
 #define GUC_MAX_ENGINE_CLASSES		16
 #define GUC_MAX_INSTANCES_PER_CLASS	32
 
-/* Work item for submitting workloads into work queue of GuC. */
-#define WQ_STATUS_ACTIVE		1
-#define WQ_STATUS_SUSPENDED		2
-#define WQ_STATUS_CMD_ERROR		3
-#define WQ_STATUS_ENGINE_ID_NOT_USED	4
-#define WQ_STATUS_SUSPENDED_FROM_RESET	5
-#define WQ_TYPE_NOOP			0x4
-#define WQ_TYPE_MULTI_LRC		0x5
-#define WQ_TYPE_MASK			GENMASK(7, 0)
-#define WQ_LEN_MASK			GENMASK(26, 16)
-
-#define WQ_GUC_ID_MASK			GENMASK(15, 0)
-#define WQ_RING_TAIL_MASK		GENMASK(28, 18)
-
-struct guc_wq_item {
-	u32 header;
-	u32 context_desc;
-	u32 submit_element_info;
-	u32 fence_id;
-} __packed;
-
-struct guc_sched_wq_desc {
-	u32 head;
-	u32 tail;
-	u32 error_offset;
-	u32 wq_status;
-	u32 reserved[28];
-} __packed;
-
 /* Helper for context registration H2G */
 struct guc_ctxt_registration_info {
 	u32 flags;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9e2950f1fd0d..250e56ee2e75 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -22,6 +22,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_engine_types.h"
+#include "xe_guc_submit_types.h"
 #include "xe_hw_engine.h"
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
@@ -378,32 +379,12 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_engine *e)
 		       __guc_engine_policy_action_size(&policy), 0, 0);
 }
 
-#define PARALLEL_SCRATCH_SIZE	2048
-#define WQ_SIZE			(PARALLEL_SCRATCH_SIZE / 2)
-#define WQ_OFFSET		(PARALLEL_SCRATCH_SIZE - WQ_SIZE)
-#define CACHELINE_BYTES		64
-
-struct sync_semaphore {
-	u32 semaphore;
-	u8 unused[CACHELINE_BYTES - sizeof(u32)];
-};
-
-struct parallel_scratch {
-	struct guc_sched_wq_desc wq_desc;
-
-	struct sync_semaphore go;
-	struct sync_semaphore join[XE_HW_ENGINE_MAX_INSTANCE];
-
-	u8 unused[WQ_OFFSET - sizeof(struct guc_sched_wq_desc) -
-		sizeof(struct sync_semaphore) * (XE_HW_ENGINE_MAX_INSTANCE + 1)];
-
-	u32 wq[WQ_SIZE / sizeof(u32)];
-};
-
 #define parallel_read(xe_, map_, field_) \
-	xe_map_rd_field(xe_, &map_, 0, struct parallel_scratch, field_)
+	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
+			field_)
 #define parallel_write(xe_, map_, field_, val_) \
-	xe_map_wr_field(xe_, &map_, 0, struct parallel_scratch, field_, val_)
+	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
+			field_, val_)
 
 static void __register_mlrc_engine(struct xe_guc *guc,
 				   struct xe_engine *e,
@@ -486,13 +467,13 @@ static void register_engine(struct xe_engine *e)
 		struct iosys_map map = xe_lrc_parallel_map(lrc);
 
 		info.wq_desc_lo = lower_32_bits(ggtt_addr +
-			offsetof(struct parallel_scratch, wq_desc));
+			offsetof(struct guc_submit_parallel_scratch, wq_desc));
 		info.wq_desc_hi = upper_32_bits(ggtt_addr +
-			offsetof(struct parallel_scratch, wq_desc));
+			offsetof(struct guc_submit_parallel_scratch, wq_desc));
 		info.wq_base_lo = lower_32_bits(ggtt_addr +
-			offsetof(struct parallel_scratch, wq[0]));
+			offsetof(struct guc_submit_parallel_scratch, wq[0]));
 		info.wq_base_hi = upper_32_bits(ggtt_addr +
-			offsetof(struct parallel_scratch, wq[0]));
+			offsetof(struct guc_submit_parallel_scratch, wq[0]));
 		info.wq_size = WQ_SIZE;
 
 		e->guc->wqi_head = 0;
@@ -594,8 +575,8 @@ static void wq_item_append(struct xe_engine *e)
 
 	XE_BUG_ON(i != wqi_size / sizeof(u32));
 
-	iosys_map_incr(&map, offsetof(struct parallel_scratch,
-					wq[e->guc->wqi_tail / sizeof(u32)]));
+	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch,
+				      wq[e->guc->wqi_tail / sizeof(u32)]));
 	xe_map_memcpy_to(xe, &map, 0, wqi, wqi_size);
 	e->guc->wqi_tail += wqi_size;
 	XE_BUG_ON(e->guc->wqi_tail > WQ_SIZE);
@@ -1674,6 +1655,7 @@ static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
 		guc_engine_wq_print(e, p);
 
 	spin_lock(&sched->job_list_lock);
+
 	list_for_each_entry(job, &sched->pending_list, drm.list)
 		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
 			   xe_sched_job_seqno(job),
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
new file mode 100644
index 000000000000..d23759959be9
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GUC_SUBMIT_TYPES_H_
+#define _XE_GUC_SUBMIT_TYPES_H_
+
+#include "xe_hw_engine_types.h"
+
+/* Work item for submitting workloads into work queue of GuC. */
+#define WQ_STATUS_ACTIVE		1
+#define WQ_STATUS_SUSPENDED		2
+#define WQ_STATUS_CMD_ERROR		3
+#define WQ_STATUS_ENGINE_ID_NOT_USED	4
+#define WQ_STATUS_SUSPENDED_FROM_RESET	5
+#define WQ_TYPE_NOOP			0x4
+#define WQ_TYPE_MULTI_LRC		0x5
+#define WQ_TYPE_MASK			GENMASK(7, 0)
+#define WQ_LEN_MASK			GENMASK(26, 16)
+
+#define WQ_GUC_ID_MASK			GENMASK(15, 0)
+#define WQ_RING_TAIL_MASK		GENMASK(28, 18)
+
+#define PARALLEL_SCRATCH_SIZE	2048
+#define WQ_SIZE			(PARALLEL_SCRATCH_SIZE / 2)
+#define WQ_OFFSET		(PARALLEL_SCRATCH_SIZE - WQ_SIZE)
+#define CACHELINE_BYTES		64
+
+struct guc_sched_wq_desc {
+	u32 head;
+	u32 tail;
+	u32 error_offset;
+	u32 wq_status;
+	u32 reserved[28];
+} __packed;
+
+struct sync_semaphore {
+	u32 semaphore;
+	u8 unused[CACHELINE_BYTES - sizeof(u32)];
+};
+
+/**
+ * Struct guc_submit_parallel_scratch - A scratch shared mapped buffer.
+ */
+struct guc_submit_parallel_scratch {
+	/** @wq_desc: Guc scheduler workqueue descriptor */
+	struct guc_sched_wq_desc wq_desc;
+
+	/** @go: Go Semaphore */
+	struct sync_semaphore go;
+	/** @join: Joined semaphore for the relevant hw engine instances */
+	struct sync_semaphore join[XE_HW_ENGINE_MAX_INSTANCE];
+
+	/** @unused: Unused/Reserved memory space */
+	u8 unused[WQ_OFFSET - sizeof(struct guc_sched_wq_desc) -
+		  sizeof(struct sync_semaphore) *
+		  (XE_HW_ENGINE_MAX_INSTANCE + 1)];
+
+	/** @wq: Workqueue info */
+	u32 wq[WQ_SIZE / sizeof(u32)];
+};
+
+#endif
-- 
2.39.2

