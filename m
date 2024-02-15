Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75692C48BC4
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 19:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F45810E22C;
	Thu, 15 Feb 2024 19:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETRw423K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E4510E22C
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 19:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708025732; x=1739561732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kZbsgUVuz107txqf5tr4/a+Y1hgOGIdF0JxYL2XdjVg=;
 b=ETRw423Ktm6IhdNZvNl7DrC5F5pbB0zhjGtAhx4IPVEgN9Nnx6Pyn19H
 8SZ0KdJAnglZ428jWn5syXdxAfkjE/jbq0iljpZrcnwcQocOBxAEQ+aAM
 LKER7+4CqT+eqH6W/W3FDtoj6dTD5ZEXLbRguFtAAWiOZ89Qr5ts+sR1G
 waccojwCkEkNHiI71KTgL6302l3frdSLGoEBkgwHzTLZUzSX6DPYyt64E
 wRWJBD2m6R/G/VhfeS+o3o7wQJZFaW8jOHy42uz7o7LM63WGZ2PdJHePO
 K96evUSQWBDMGHP1OiGXZU86RBIbXQ8lqjGaJlyZRchIS6FEDa1XC2hJA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="12688162"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="12688162"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 11:35:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8230860"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 11:35:31 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 11:35:30 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLiCRkIwxS6O4wqFYFIQhQ27krWF9jbuKqlUnfOARHDzT5OOAUd7KV7ieh0dlq9rYUfGe8h3bfjLqF7JpeGZ5CT5rct0nZ5C9WAjMTe2X0lPFRIEU/9o1pcnPkamc5nPtW2fX9qC8RaKDQVPGl5RGkgqxArc2N0Lu5REZids1xYsvNYiGBlzE85E5z9FB58GohWFdG8mn+ti/7q/XEKmk7BHn7QbxkHIuutXMy1EDK7/l9S/jGXrgdIfaNDyOhAepY+F4G4N3mbRc+1Nw1LdPZFvOdzmvfhODwqFgy3SK6jsUmRbPphIFc3aR0PFMDYuaCpS9hzJ5drDoZJtdnn9dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Amv1yoWa0EoN3kQeQkLPpvmTMYREJkHT5tn1PbWN+lA=;
 b=NoqXgAIQBTydTxBRVXifNyRlFJQDSpg3puQbXlPMl3kcmo3z2PNAq8fatvXcHr5iPxusb9JYi25YUOQj1gwK13FLwZbpCWc6ycZJT69HoQh7XWZfg+tT8v+NSFOTI27i4umqokBRdte8TgkZjcKFSNf8lnPlv5UJZ47Kt58hXFhZ0qVqKjxcCnvj+IkPQtEaUckvzM3KW3UfWZTa8O0TdUkrk+1cks7FGEkTEz+7984GjqXHtyuKuNHJbDV3NNoHtYCRT9ZvKXzX5eZ6wzqxDWiSEhG33z3aStdv4WG6LLbLsOoejWIMBwXcKcOKOc+fEW6r6GQqen/VvCxZHdHE6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 19:35:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 19:35:20 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 13/14] drm/xe: Convert gt_reset from mem_access to
 xe_pm_runtime
Date: Thu, 15 Feb 2024 14:34:29 -0500
Message-ID: <20240215193430.130106-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215193430.130106-1-rodrigo.vivi@intel.com>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:a03:331::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: 60fcafee-f606-4c01-ecce-08dc2e5d3f11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2pMrM5iOzppxkueXpOH99DkgVnV537s2HZsIQXBfTona0/a9uda04UYrSHnEBTuXXjMTx2Y2qA8IMfKGeBwC0LG10M3z4Tl+WI/5DUkyTYUZ2gp5oI5/KfbTjNC83Rq8Iwmq7dLqlKlu0SWjSz0NR0dUXYm6WOTJ6E+UAcBvVRLY8hYKfQrLFqMV/jm+xu8aZdbrc0Iv91NnsgD6jToSnO47Q0TzGCKdhwY1d5Pw8/K+thx7QDKwdDj3lhAJXbb07arXEz107wNNjRsJ0KRNr2RNYUMK2nY8lTVaPg6+kl57J49ryDlpxTgx69U1Nh0zkvxcCXNmW1xRTvCtdSlAzABGLGZL3Jj/66N0hyVm9WF6oXK0eNNHVH5X8m0W+c9ngKhqj1Wy+1b3hOW0QqN5kxWrDiZqieuuNZ+g4Uiyisw/XlQBNHW1wFIedX9ugI7cJKcsWnMElQS2hYqdPyImhcpUWlXDrnoDjuEDkhocEfpwTcBbZHb16g76uVQmuT2O5/U4LSe00p4Qwhfc4dH8/oBJJd35xs3B85QFAyuL7vAabEtKe328mTuwr0R2Sso3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(44832011)(36756003)(8936002)(6916009)(66476007)(38100700002)(4326008)(66556008)(8676002)(66946007)(5660300002)(82960400001)(316002)(107886003)(41300700001)(83380400001)(1076003)(6506007)(86362001)(6486002)(2616005)(26005)(54906003)(478600001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HNMdYFTXtPOqaWr8877DHTusv1k8CzgneDyA23TRJAx85Rr3nsjuLKJpOQwS?=
 =?us-ascii?Q?EjC6VgX0as3+jFtyTe7DepUvWb7ZWftIueNEjsuPzhLJ5Xarr0zL5JWO4ZwB?=
 =?us-ascii?Q?NLuo59TYBZtOBL+/2onYSHFLogYWXhXXHg8QNr3y6tH8kRL2tsVRndQp3RzL?=
 =?us-ascii?Q?Ep2/QleLfE9Gv3fdn+xIB3YRkadYVeWzjFnmiYwxJmDGnEjZlCCdBgGNxthl?=
 =?us-ascii?Q?Ap+z5geuT+M/Jg01+YK5FsUTZosHakNS8X4SgJNZmmzT7S47VnWivTh35K22?=
 =?us-ascii?Q?1tDwqqIoDU4uJ/VO1cRqro/CzG4QR8TpxjpBRc9XTGljrGRJfhy6gzmoO/O7?=
 =?us-ascii?Q?LJ+fjqxL6QLz3mRIuEy2zrURxilG92YegZQWPUvnV12g9yCSthTNBbObKJV4?=
 =?us-ascii?Q?iQBE7ceRtzgIn5Ob+jQSWLvtFPgJdUXjEK5ah7LVhLJX55fjaMpVbCrDiawc?=
 =?us-ascii?Q?+hLJoQstybt7zyJWFVfaTDwseSgO23BKYB8vMpdy993lBVcUH1ONbmfuHzy4?=
 =?us-ascii?Q?15gay+gJS0dHWs/RsJ6+sX93rjSFTnepYDyhNIvKvvQFsz3Pz0YMtDyvrgHS?=
 =?us-ascii?Q?svtsNpsNILjaRiv1z/iDWA3h47bnEr1l3nFMOSfutVxu7VsRoLZ2gDx2gkNd?=
 =?us-ascii?Q?brk9tetlVvlsCdnYNbfMFrskU5Qbdt34QFH1MysfCDYtXkK1yUUKSCafgg14?=
 =?us-ascii?Q?Umfb+N32PWvYvtmbK96OF7V9ZRfHkNFfmGwGkI5aNS3JvEP0y9fb9PUTvN0e?=
 =?us-ascii?Q?EVp2kZaGOzw4Spzj8JPXU7U4S2oHCRgeN9gA5f93eC/jEKK17PYIhY+QLcuM?=
 =?us-ascii?Q?lccuBYpYIZa9YBVVNVGhX8L30g16TLw1xGZ3APPDii1gO+gnE+p+pxkR2T6T?=
 =?us-ascii?Q?bzTXWPvX2yhdfp+r3dSlD83Hhw2t3md49DHYr4GSS5zSocy2Cux+T60m5EHz?=
 =?us-ascii?Q?qd48TOxAuKaDAI+CAgbKq0lDyltxVyrg2RKbwiZvu53E+5wBJ/bqNeg+J6k0?=
 =?us-ascii?Q?bNzXb1gaXyYpq8Hk/0Kba4owGF+BGZ35e/6h116kYYZ5IoAjwWxnRhCuNjMh?=
 =?us-ascii?Q?58PseUrkYHDSoaE+EE2bdeE4QyKCq/WIk8BBOZkqBqgGymu8cKaWskMYezUw?=
 =?us-ascii?Q?xZBQ3zCtIPyw88KkwWgciXKN64b81CyCGMxZvNAp6O2wfBQ6vNxpimedA4O9?=
 =?us-ascii?Q?Uba6pEuhJSEPpNjYezH1td8prpHL1gbtsULXZQ8USxTxRARxcVXoEsMqRzgn?=
 =?us-ascii?Q?9rALgJIIbqdo+pD2DZsQPHPf0xeZCvDUg4IefBEVAQrSW2A8+WeEiAJ23X1O?=
 =?us-ascii?Q?nSB2LhC1wyUSQHATJkN8618Wt0g6455x07UbLhCCLIY2FGHTgFGqjrOKi4ev?=
 =?us-ascii?Q?sIjF0p6CNp36RxDexOejaQ/jMRYJlVVmXzd6jp7kFU08rxfV4W5Hyl6P7sHe?=
 =?us-ascii?Q?tKwSy06rNXZ2S91IUN2DCl+qI0clByJmptJqhdCjNpkXXmubiQUnvbQ6E5jq?=
 =?us-ascii?Q?O9+3rWPa8FZ7a5FyfApCxz0X7NlHNRr94wb0l1Z2nTKFDTSRYDTVbYTm1ezQ?=
 =?us-ascii?Q?qtr6DlsZDo6AR2CbOSwbMFPh49Zxi7Gw1hVfOctDbUTuH3pAmG9GrIg2T6zP?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60fcafee-f606-4c01-ecce-08dc2e5d3f11
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 19:35:20.6747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1UesiI9KeO+fnVB7mNINlD42+TjCudisj721PlKgCFcDlnT9r4RTtKqbjTtWIiAayRciVjn22wU2ARc1MRc1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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

We need to ensure that device is in D0 on any kind of GT reset.
We are likely already protected by outer bounds like exec,
but if exec/sched ref gets dropped on a hang, we might transition
to D3 before we are able to perform the gt_reset and recover.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index afc62eb26071..88f9f45bf92f 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -43,6 +43,7 @@
 #include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_pat.h"
+#include "xe_pm.h"
 #include "xe_mocs.h"
 #include "xe_reg_sr.h"
 #include "xe_ring_ops.h"
@@ -626,9 +627,9 @@ static int gt_reset(struct xe_gt *gt)
 		goto err_fail;
 	}
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_gt_sanitize(gt);
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
@@ -652,8 +653,8 @@ static int gt_reset(struct xe_gt *gt)
 		goto err_out;
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(err);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	xe_gt_info(gt, "reset done\n");
 
@@ -663,7 +664,7 @@ static int gt_reset(struct xe_gt *gt)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
 	XE_WARN_ON(xe_uc_start(&gt->uc));
-	xe_device_mem_access_put(gt_to_xe(gt));
+	xe_pm_runtime_put(gt_to_xe(gt));
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
-- 
2.43.0

