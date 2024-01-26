Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E69C48285
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15C610FE66;
	Fri, 26 Jan 2024 20:32:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1631410E2B6
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301127; x=1737837127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Cvj7imivTewiAG7VKFcgbDgAtE4qoSKt51gnjFmM+Yo=;
 b=Gta4DUcEIPhJiEFg9f17uhSS4vtmRsRdpae8EET4zVSNrrRhCXKMTMv5
 T9uiGVBB8sqzA4J5Dn/kepyuJgngoJSOWPjNXyM5UnG8ec/45hkYSCNex
 y8RCtVWlQcAPC3FMCJpNyirWdXYlO4IVJnRd8IejC7b6x/0AIWPcaVZh2
 tzi6DTlR1N039U1cZWvIH6WfaGIZepvwQI2OZsSAw3QxE6GHKMRHLIa5T
 bUtzgBuFC7hWUbdVA+HRez2hfg56Ane3FPvZHysLYGc6pmdN37t4GzSrZ
 n2nZN0ZE63apn0aucDkdh/LDMzxNbniAg31TV4Qef4X33XyP6rWM4SDpD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1494431"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1494431"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:32:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="821245423"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="821245423"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:32:06 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:32:05 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUxW++Y4jmoMe5s8sYt0+OkUd7CrkiA1BKbmEoSrDGhwYtflBKOnBzsyJsXQ3o5AxUu/v0AA3TWIUuF5qgg+mE1/ABE4Vz/vMPxJAWcmJUBYAyDv35x2eAjIxjhDFh39OioYcORoK15CkUYprp/coNsQ62sZ4+rq4weZHBSEgXsLXBd6vc/NqxitvoPew9FaxfBG8fPLh/ZAZ+MPUuykLPsbGw3zH4i2N2yv7t+gKClSbPhqpdyuk40JXMyMgDZJJeEW3hmEYc75Bmje8LY5liNGlh/gl5gABHIgaDegBfcRG+CTlSJ7Iv0lCForGvjXXJiXKM9kpAz90XieALiHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4ZdcvZ4iCKwVgaXKbRmZF2cezjUMQV7AHNAVOnM4lc=;
 b=RLvO4uonUVydBRam1THviv2fSllnzGQUxXxW5NeVzsWoywQBwAVLXmXVvcrPMzCEMGlLYiAiAK/9mfZZ4z8XbIP5Fcc93Lz+b4oRuKnhCdNokjSj3Mt4ebVhzvZ+mAwoGXiIkI8Ct+rO/m9c/7XCcntTqUgSroUj5lLOz1Pn1ueLlSqjjdpvacVOtmElpCkBbGtScNmdnj2YIVgZiF6Jcw8zt70MyjhftGLOEPL8sX1aKhNUXRtMgQWwK65hN1ZMppcb9mxaxGkKKqD3WG2qUHgmbMOYEVHRKZ+55rXPx93/7v7TYtXr+PwloIKfnMcvNMFANHl/1z7zRTR0KigjzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 20:32:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:32:00 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 23/34] drm/xe: Ensure D0 on TLB invalidation
Date: Fri, 26 Jan 2024 15:30:32 -0500
Message-ID: <20240126203044.1104705-24-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0376.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: 334a37b0-6da2-4573-106c-08dc1eadd940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3piwdc6R+mvkPgULxLGpvXtAgQ/wjfFUiGgfpHmiZtQa15ohCW8hi4QkkeDec4DK4o6nrh/tgNOdBc27koChsv0lcbhBTOG1/e7rc90FWcqnGjQJhanjajqmHQ8vUMYxxfcw0QRTBGRMmfZrAAtVoupKLWrp8dvYgYh4dykRKo/K4l3fuJ8c1fexDTt7TW9VKOX9Zabv8nYjFOuyfnJZTh+G8UY4IJR7715hAOT4yDfAWCmr9TueOZqK7fLsS1O2IS3pS7mnUv2jSbM2Pbddp0ebqg7vSUogG2rnUaHn4+mQKvKsqJ12005MOrS/LToxUQwxY2JJ9iWfH3Ral0fXCWJWaB4w349e+KTtFx2MK+cR4L5ac2REVjggFy6LWudRMO/jH49TtzN4276dD3bt+M7HVBDfm8xRmdHXsLqTYCDRsZjL1e2RtpOY8/DGPN7EFPWo9+nMbqZ1Y42OuMuwLiJHc0mPMMVtHXz6HrXfseV4GmZ6yh3JicMmXm0Jmnr2iU8CO3kA5xLYEZMCto/OHGH6jNQMtHYp6//1U95UZxhQhqyAwOsQSK7Xk4zx8k6f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(82960400001)(6666004)(41300700001)(6486002)(478600001)(26005)(44832011)(2616005)(83380400001)(6512007)(6506007)(316002)(54906003)(2906002)(4326008)(36756003)(8676002)(66556008)(5660300002)(6916009)(66946007)(66476007)(8936002)(86362001)(107886003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AJH5evyRc14pH5scrs3V64hO2wKvV5JzaYl95XqyAk9jAcYdeaIKtlmPByPb?=
 =?us-ascii?Q?Uy/ZtJxqlukDyfwk2oT2c5hTJputXP5fpfNd27sbTEZWwVKnGTMVk4e+LB3g?=
 =?us-ascii?Q?W8bnqIxPH9bibvV1P/YkMpViFA6L0iQNV9K3a2iCSgbuYlgYi2z/Q1orVixZ?=
 =?us-ascii?Q?mUQG2i1/WCQZGoz7ceVrnwcG3JIfYbannTbWVu065rQQD1Xxbm1rlpFH8vR+?=
 =?us-ascii?Q?li3Z5gkACSiMFKx1lxapwHXoRDFSyKxXNZv9sGsS6Nu2WtQ6ZxVgElfRozBo?=
 =?us-ascii?Q?/vPJxIqOYQDYLtfHjVVZ/51oPYFF3v8Agx91xLWRcaNmhlvbqPFCUOH3PvJ7?=
 =?us-ascii?Q?b8uQogEykfmbzYRNV9ooi2Cxun6nEMS3C6wRqD717b3pUHcEeQU7ZNqWTycj?=
 =?us-ascii?Q?KwCHmHQHReqO26Wedl8CvktawbUuQSPXjl8YKncB1fuDKszbuQO7jTNE3aZb?=
 =?us-ascii?Q?b0G6kiBAqvoJS+34q9hvww12i8Rb73/AwpItlEaFE9QMHIA/5rha0rHaEyCg?=
 =?us-ascii?Q?6MYSGO6uurMi3DyDrOp88ieeuCCN5/ZAd0GXGJiX1I08j8yZBvI3y0jODhL1?=
 =?us-ascii?Q?6mKFZ5OA7Q8Da+tlrvVyeFqhgEAcy2e4M2SPyq0EDNWeQxzZVPtyDyKu2Snh?=
 =?us-ascii?Q?22jVhoJO+8dZAXgf0vDhTwYntww77XImPLWqaQ/FagPXkiRjIn+tSkvpEvTl?=
 =?us-ascii?Q?OYuKweN6BiOEPUkHNX8stnrzMKDQwCqCGa54wefzHrG5bVlB6pwE5lifAfOi?=
 =?us-ascii?Q?qqNBNDbk1bvhhHY5XfhsINto7eLwzCRNbLhS+esl+PFnrWYcNvZTm6TgslR+?=
 =?us-ascii?Q?EoxGikiyONqt3XkcoI9oLTJcKJvcTyL5qGTpZLatql2fPQ1JngFlyoXCmPU1?=
 =?us-ascii?Q?CwVEJKIfnGqkdkuRBbTS7l2eleLlbkCaeHq30vBGLMnM5VALQWRGNHGgGA53?=
 =?us-ascii?Q?5C25WKjutHJYFdfkbpkKIFAR4/t2iATJmGI3UAeSwACmKHFxemnxCrjE7W4d?=
 =?us-ascii?Q?6iXBG2bt1A7hdw5qMMvDChMaiqoicOhhBpNwrTkT2BLnevCumxT6RVX/iIi8?=
 =?us-ascii?Q?Z2ZuKkGRFgMKGHjzHT/Sm789z9zzExrdlv7OtknPtWoykN+GbpRXH4K7RiUP?=
 =?us-ascii?Q?tSMG9zVtlcLZ7/waN8zhYiH2+Ppf3rPuPBt+cNjX8Ez4kBOS3vznAXJNtTX1?=
 =?us-ascii?Q?DfAIQnqqcRjyuktHT3YmeGpzyTOY7WnJFQSW7ocqebVOcAvo+HO4RytqO1WI?=
 =?us-ascii?Q?zGegaMkBA+GE394EWDYaLP/hGbQFSI/CfN15UQIurng94yTOV93qtmvfu0jo?=
 =?us-ascii?Q?A62ObyDCzVw4qtCpOfzyCcxyQOqK48YhkBL+dyTzK6I6Ly1pOtjqrXOZIJKk?=
 =?us-ascii?Q?IZ0ETgAEljdXLACzsmvt/IkPS+e906Efd/6CsWxlefjh8RMsKOSzw3SQjfL0?=
 =?us-ascii?Q?OqhfYte7Bu+tAVfy40dWzFRP5XiZYEVbn/0bJU5mJbabnqJeDWR5fOT+k6SS?=
 =?us-ascii?Q?ZaqzQmq0FP9TYav8LbiwCwW9P15vOvOSJWA1P7HDbsNmCI7CAQI4tQYE82tx?=
 =?us-ascii?Q?UXTQZDZDoULET/7NBhCMjzgiTeGIfpmAvNQQYneBcp5SvswUIEcSfq/lxBEB?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 334a37b0-6da2-4573-106c-08dc1eadd940
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:32:00.4475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tiaHiaGg0JQni6ZGEGylJleYsl28mDwM69g8Y2m9Wm5XblO1HmoNbAg4WCH26SFsW2kAoMR1BVTHZ/HGEq72Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Let's grab the runtime references around TLB invalidation
to ensure that hardware is awake in D0.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +++--
 drivers/gpu/drm/xe/xe_pt.c | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 686d716c5581..17d3b7f69580 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -22,6 +22,7 @@
 #include "xe_gt.h"
 #include "xe_map.h"
 #include "xe_migrate.h"
+#include "xe_pm.h"
 #include "xe_preempt_fence.h"
 #include "xe_res_cursor.h"
 #include "xe_trace.h"
@@ -1136,7 +1137,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	int idx, r = 0;
 
 	if (needs_rpm)
-		xe_device_mem_access_get(xe);
+		xe_pm_runtime_get(xe);
 
 	ret = ttm_bo_vm_reserve(tbo, vmf);
 	if (ret)
@@ -1176,7 +1177,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	dma_resv_unlock(tbo->base.resv);
 out:
 	if (needs_rpm)
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index de1030a47588..8d1d4bea7323 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -11,6 +11,7 @@
 #include "xe_gt.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
+#include "xe_pm.h"
 #include "xe_pt_types.h"
 #include "xe_pt_walk.h"
 #include "xe_res_cursor.h"
@@ -1104,8 +1105,10 @@ static void invalidation_fence_work_func(struct work_struct *w)
 	struct invalidation_fence *ifence =
 		container_of(w, struct invalidation_fence, work);
 
+	xe_pm_runtime_get(gt_to_xe(ifence->gt));
 	trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
 	xe_gt_tlb_invalidation_vma(ifence->gt, &ifence->base, ifence->vma);
+	xe_pm_runtime_put(gt_to_xe(ifence->gt));
 }
 
 static int invalidation_fence_init(struct xe_gt *gt,
-- 
2.43.0

