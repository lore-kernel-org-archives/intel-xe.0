Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE55C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 17:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FF510E2D8;
	Mon,  8 May 2023 17:06:57 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D7710E17E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 17:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683565614; x=1715101614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7x+Vu9UzFHxanf8Pt5LSUylf/bxF6aKod/pyA1HHLmc=;
 b=Hi98bQuhsE75NtrV4boe7jMWnPyULc4EoGTq6/VBtwdnTa+4wM0kAMXp
 hkp78RifOEXNOpkckj/uc0t1XNdwOvzkYoodH3wtDMXb4qwtH82t9Qz2w
 uanIN5Dxz8jl2MDH+iaL0uDUdF26bDOR4K8+mXUHCFwQGZF45AsVK9aGT
 +0p07lQ4k0UYtPm2bw5P2R4fpUH0N9tkJYyCQ57IcxEfehA1n45C7FwUM
 jbjRmuWeP1p240nM9dD+HLzubU5PpjTWDUcf86CPuVk8GMCwsUsm465wE
 EC2jnNyWO5ap/+MO6jSuEtnyh2RIHnPBb6/iD8/BEVmg3qWvbKvV2jXk3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="377800185"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="377800185"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 10:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="1028469995"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="1028469995"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 08 May 2023 10:06:53 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:06:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 10:06:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 10:06:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGnNry9mjMgrAKkupUy+HZWU0R7bso7utYabA/mwaDt/RAZGdEZ0OmhaEhNYa1S+HlFpjp8WKNf0s6KP1gOI5awXJHvf6AUn+pEQ+WJvbXLGQP2WaZvHa/uCPV98uTrPDAGl5a267V0Zpxb73kPJgxMO+pxS3hR5cOCfkYnzuoSAC7G3q/xxC0gICVepKI3+/aUYZv2Mw4qUG45MKTBYyQkbEkKcni1bfhRtgEB1lCY2MJBzpwVqwjzb9RMGeBeOhTG86m1043rxrHikqbkkHA1DWNOaPcxhm0oR+n3d/JDTEhJi4IKYyvjjAFgUfQqlV/TIK5d0j6+FDvT0DUotOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7lNeYqwMf6WHJq3UTkQ3SoQu4muhffmLqMsVYKcATg=;
 b=XPVrJQoRK0hJb7UlXnQC6bUXxAcqgty9YUaruzRtKR+g1kBuh/AtplvtV+yYSXKpFu09IlGipGxhmeVAf4RS2VmRHxfbusJiRRGpWjDrb0Dv3HRrljFcgdX0kQXY9TakyD6PLzmOH7JoO4u9J/8ZhM9aUTvh7+1ART/fOTtNF1sTb9kaoA1FfCB69J1X9viWSk6/0eo18zrZ7U61fZVWnel3kLyfItwq39e8L5y7CqCZ5i1/zP6ItfKYdzeMACuplDFzKF8SllczM7MGEUUyRoRB+0nqvKmyag3zc6/GqCXArnszn3fRU9PiV6QoCawE3NDaYx6e83PXRCPn6CwyuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4675.namprd11.prod.outlook.com (2603:10b6:5:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 17:06:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 17:06:51 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 13:06:11 -0400
Message-ID: <20230508170616.1289914-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
References: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:217::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4675:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e3127d7-46ef-4e10-0b8c-08db4fe69dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RJcUJjaYGCNVg0mQAxyDLlrJHE60qZrZ99frr/RP7hdOB8H1SRj7633DSwIWm/ToiRwba2OkORNsAr3g3mrhOxqCpvZVJ+Wdx4JIaizSYDZo66GHr6X6xJEqKjedybRtXVG8+hLDa0JWmypc8W1eJQwwD6bFb/v3A/+7lklMStZiSAg0pvR7+KJvUMdZQuXct4KXHBG4EvfG1gXHfkUEG+AFf2BvZkQeVwgdNv4nhypQZ9jKgnlxXEKxjjSrqbO0YiIM8jaQ+DORGLxq5+tprKEmGEFaNBWrL7/bdCGrsJIEfWTh11ZrzLCRLPIkShyUvjqnx8wTInS29OHW6n1S4xQkwifmHseX5Kr0TPyJ+m2ikwvQ6I/JyZz/rrPdvvBlnGuHJ3wHeG6QzTlaA+s7dx2jFSqAnHcXn3Sy4Ol8GbiQME/+zNNSIPn8zvja/O2t3gjp/dRCFuwXXnTp5j1hJNWvBtjyEoILR3vlsYmNevEvLKmOrxB/vTtXpktN174rVW7d2oKi8CZw9gEFn1P4rqGV2UkpFOFPXBSN2nFbp8MhiJWiU3s9V+2hSGdv83NH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199021)(36756003)(38100700002)(2906002)(44832011)(316002)(5660300002)(8676002)(8936002)(86362001)(66556008)(66946007)(6916009)(82960400001)(41300700001)(66476007)(83380400001)(186003)(107886003)(26005)(6506007)(6512007)(1076003)(6486002)(478600001)(6666004)(2616005)(54906003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW9Xb3ZFaTM4K3ZNbklIeTZWanl0bDJMWlRrRnF6cUY2dWt2dUxVNDlCRGVa?=
 =?utf-8?B?MnlCbTNmZWFXSDg0OE05T002WlVhcUphb3Q4bHJRenZqNzVyTzYxYXRlU2hN?=
 =?utf-8?B?WWR3OStuejd3eFh0d1NEVGEwZHNDYXd1WG9ncDcrNnRHMjBGMUxYTkFtVkIr?=
 =?utf-8?B?OUgvb2FMRHRDQWtiREY3QnhYRUdwSDk0dEdSN25OTHhTTkhMeTJYUFgyWkhp?=
 =?utf-8?B?TXZSWDhiSHBGQXBPd1F1UC9UWVhaT1M0SGkwc0hiNWxLeTNxREFLeUVsVTJY?=
 =?utf-8?B?emk4SlNHNEllMENGWjYyUkFZTU9uYi9oMnZETXBBUzNvTkJKVTdKOUdBZUtv?=
 =?utf-8?B?MWVsd24rUXhEVVR0ODBOUlFDdTRmanBQLzdHUjNXY2IyUGN1TVExUjRjaFM0?=
 =?utf-8?B?anJJMWJHM24zYkNqNHhpelc0elUrbUdMalBkQVJWeTd2WXp1T1JoWFA2Z0tR?=
 =?utf-8?B?NWtNT20zY2RQL2lwdFJuYU5yZkhPajdwWFR2akhNOGtHM0sxNzNISnRSMHhM?=
 =?utf-8?B?T3FnUm1uZkhvU2Y4d3JXTHRZOHhZb2ttcFl5aGZ4WVhSZlZIZnQ1R2cxYll6?=
 =?utf-8?B?Mm9VNFhIVnFLWmd0ZnMxZUJCSHdJcUk5VjFjWUd2WVNQNWlOcXN0bVdpRUEy?=
 =?utf-8?B?YmpVaGZJK3pjYWdYRmx4M2hlbTE5OUVpUTM0aWVGWVFqSUd3NXJVamtFazdr?=
 =?utf-8?B?OSsyR2NiUlNIeEhSZUpLczVLWkRWUFpoUk9kVmx5U25zNmtXZDFNRjBsdmx1?=
 =?utf-8?B?VXAxSUZub2U4MUFlSEFhcndTK3ViMzNYSGNNQ25veHd5RHJyNG9zaVNhWm5L?=
 =?utf-8?B?MnhaKzJFUGM5eUVoa2M3a0UzNmZJYkppY1I2dVNFSG4xaDBFOStDc2NkbzFG?=
 =?utf-8?B?aWQwcWI5VHVzVUtqeVo4S2dST1lkZkZaV1NxbzFLbUV1RG5hRGQwY2tMSmRM?=
 =?utf-8?B?ZjcyUXoyQzJMZUdzWnBrYXp6NkdhbDh4VmxYZzhiMHJCanROU1gxMHRaU3Na?=
 =?utf-8?B?VDB0c09BTzRKZE5nRXh4YktBQTA2T1NsSGN5UUpyemIwK0tjam5rMUJTSjlZ?=
 =?utf-8?B?Wm1ZL3dHbkNjRWhrZEdEL0hPN0hadVhwT3Zpc3BOTGpsRFh1cEpVSXA0bVU4?=
 =?utf-8?B?ajdab0hPWXI0LzFpbHRyVkwrbzIvR2s0RmZVNWhZK2drR2tva1lLNmRhS2dV?=
 =?utf-8?B?clB5Wm01aW4xMlB4eUkxS21zRnUrUXBnYUFqSXNEd0NIS1FqVFhrcTFBbjF5?=
 =?utf-8?B?cHViZnBnTCtiSTFxc2RYNHFBSXV1SVpEZUl0aUthYmdnRU91ckVJcGdaa0Yy?=
 =?utf-8?B?bU9JWVgwb201WXV2ekR0WkFLZy9DcGM5VnNnZ0c3Uk9GWXJ2RGZiM0sySjBH?=
 =?utf-8?B?RFlJK2c3VkhjNVZGVytOOGt3SUllZHM5clVjcU5SUkpaeHlza1FKbHByS0RW?=
 =?utf-8?B?c3YvVWt0aUdLcmZaZGFLbEFPT1BzOVBHZngwQU5HZW5xNjFaL1dKdFB4cytW?=
 =?utf-8?B?bWhULzhaNUVlQXhiYW9NWC81bzE2QnExOXVyeURnc0IrYnY5MHRCeHNmYnNo?=
 =?utf-8?B?bVhwOCszQTdHSkFDb3hoeGN3czVEekVzalpWaWtZOXJEaWtDVFE1bHZxaUNS?=
 =?utf-8?B?ZmJvOENyK0hqMXhsWlBTRGl0Z1p4T3BWK0x4V0hCdDRrUlNlUWkwN2w4UExj?=
 =?utf-8?B?ZFRtcVYvWkthd3FPZ2FiQlUrUGRJY1U1Y2JSNXowQXdjSXF1TnNHckJSSjdX?=
 =?utf-8?B?bjA1TGtOYTBKYk5zRlZ0ZjZ1ZWJoeG1mbytlSmZ0aUdVREpFWTk0UlczUXcv?=
 =?utf-8?B?UjJxQ1dFZTNwR3BvcVQ4QnNDT1BKWFlqOXpVR2UwMFNFOFFxSWg2MjZHVzR4?=
 =?utf-8?B?aTNkWVBSWTVNb1JTaHBjU2QyOS9oWWtqNzd0OGo0eUsyLzlnRzk4R1UrSDZT?=
 =?utf-8?B?bXZxQkEvN0lybjlxQytjYWpHdERZam9CV1NkcDNoazFsUnc2TE1VckRnNDAx?=
 =?utf-8?B?RWtiMmpmMjJkcnhxU0NScUloMXNRNHBQR0t3SjMzMjBGZGtQWEdMRGU5Y3R0?=
 =?utf-8?B?Q3owdlNJMWhsbmJ6dklrQ3NqSWlOK29XamtjN3k2aFpVVlhldUUwUWNNM2xn?=
 =?utf-8?B?bXVGVkdmUll3T3ZTVllXNXV0NnkyRklTOEJWL2thdklJcVlzb0l0RmVxYUlG?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3127d7-46ef-4e10-0b8c-08db4fe69dbb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 17:06:51.2781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eaES1u3dnDFcJxpQ+qKpBFUAA9VSZLcwBJBd6uJ/YkiGLMYSe/o9dIUyB5YvfDMUdmiOlyBEjsH8NLzRcGandw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4675
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 06/11] drm/xe: Introduce guc_submit_types.h with
 relevant structs.
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

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_fwif.h         | 29 -----------
 drivers/gpu/drm/xe/xe_guc_submit.c       | 40 ++++-----------
 drivers/gpu/drm/xe/xe_guc_submit_types.h | 64 ++++++++++++++++++++++++
 3 files changed, 75 insertions(+), 58 deletions(-)
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
index 9e2950f1fd0d..168e2b0dfc5b 100644
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
@@ -594,7 +575,7 @@ static void wq_item_append(struct xe_engine *e)
 
 	XE_BUG_ON(i != wqi_size / sizeof(u32));
 
-	iosys_map_incr(&map, offsetof(struct parallel_scratch,
+	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch,
 					wq[e->guc->wqi_tail / sizeof(u32)]));
 	xe_map_memcpy_to(xe, &map, 0, wqi, wqi_size);
 	e->guc->wqi_tail += wqi_size;
@@ -1674,6 +1655,7 @@ static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
 		guc_engine_wq_print(e, p);
 
 	spin_lock(&sched->job_list_lock);
+
 	list_for_each_entry(job, &sched->pending_list, drm.list)
 		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
 			   xe_sched_job_seqno(job),
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
new file mode 100644
index 000000000000..d369ea0bad60
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: MIT
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

