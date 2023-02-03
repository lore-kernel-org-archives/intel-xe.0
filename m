Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FFAC61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690C410E09C;
	Fri,  3 Feb 2023 20:24:30 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994D410E0A4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455868; x=1706991868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xX4EZG+4qTuAjDmLh92QEAvtyXchriY09UWdJj/pogI=;
 b=RY3BEyK5jjmlHwEfRNcdhW7B2Y5tX1iStpyYcGVSMhflUu7mQp6tqbvJ
 dMkEkAmbbv0pA0p70aR4Z66OGp0lo+GrtuJRPuh7XdkRfYHkT74RRO208
 HNiCjF/Y+DReQm96SjCyvpKpu+2j/H7psCXVdxLkuQHoyjSzoSZ6HcFa7
 RmqnYgjekVO+AgmHr2uef+CCaz/k16U+CuhYSE9LST0RyCBB1EsMeWhvQ
 ATVtXE3jaRGIbk1u1MbGO1R0/h7s8RqmVU6JRP8TePCiAn27FPOoPUMLQ
 8UHTpzPNuSdBhrbL6wKcJVeG6BNmbQRSsSH3YNvHX+lWlgDdOOQMacQeT Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330975708"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="330975708"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:24:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729376756"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="729376756"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 03 Feb 2023 12:24:27 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:24:27 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LV2ytcn5dbHS+6wcUvXgwzc0KhX5v6Jdb9a8c+k9d2YDaaaXTB83r+vvSrEDUv5IQ/h8ZPyuk6xVg7XUC9miVl+tWddsLMCsOjrqydwzfQ8oFQA/Jky6me8f+OE79CtHgg5/nOQduLqYr3nXYLboUJGDCcRKHUO2cYDhm1XFxZv4JOaoSZUMKaAvH4j71ukZyzMNa9v6Dtl30nMCx0DNJ6+8wl9zEFueyQWS4ySurFmUxGvIlz65w0TaQgc/mmBdRZGo2IKMPSNnentbZt37ix3YxWwEInwR6Ws9FYu8KtIcNYE7WIml8xoQEZd+HfeXHcDidSkQiS17Hi1D8cfrjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glCnU9Og9q4tEDoEl3M0aaMUVgKZfa8GBHJBSQG2XzE=;
 b=gJnMEqWeXSUDd1sNeBRAi6+Wch07v13Uocwkb04UBMZKcVAvfuid/snOY/Ib1kwXewySvAyFCMS4rZdcGSK3kvKguBNw3RAjmch8bAle7mDpO0GiVZcmctXdxqV2+NBs1r1R1y4nD3sXyc2u/xrmktDby5IV8kmE3K8TVlmCfT4cgzCEOeA0oDk9afWYB0yi3co0IYLJuLyy3T3zZ0iiBN5K37bQlBZSgAsn5e0pF+W7Y48VXAkl89QM7AMXPSneO2nC5z9xKiBwHhQf5eZrCVesuj6RgeQA+5vXncNixl1xJqCawwyLuEdMA+CkDNhRhemX7WwUdk+3FW8z3dn6kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Fri, 3 Feb
 2023 20:24:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:24:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:23:50 -0500
Message-ID: <20230203202409.577032-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 302d2aba-e924-49fb-ce2c-08db0624a487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HYFyoqY362itM0hbhzzya86pZqeX8rceo/6HSKRuMJZz/DKTbRSL42c/QnoD2qFVGVPUxG/AGlyVrUt39deiD2hnxssWxBzgAQ9owu930nOWXNnbFIeLzDv/fvTwQDj6A0EwkFa0G6EpD6ofbKKCqBgIQoDU6DeO4d/wup8zrNCZVJpcrHu4Trld9N37Ebp5drS6FLYBUMjjdC51JMKwotHR+8EOsNmrxuv2x7i3PS9IvHAcalPzUoG35gJnJ4IAVs/1UGciMa39TypNLWTNQh0xcKY8iM6QBb/IWNtTwGfsSU/HT8sO+xjHxniJnbGE60Sl7Oe6AY220Y7LO6gnbHOhWz1MqQPamOMdaC22iX6gCX5e4s4riXV7299cHZOcYHHW34pkVWmGqWzcAkQWAmUe9p23OIotB/fgoXQLaRVnzBEDiSQIkuBLWBU4ocEE5hBhIQJS/U1r/ITZBebxQMdLkAxA/T39ms/2u5Gv82VcD/Xe47KG7iU/WA5ulv9wYOT+1rxY0qocPVtoeVxb3gReQIJlzyGQG+jGK6GFrvozCuoZyvfFKcGc7gn7VJXR05yP67dypfIFOewneimAmJtto21UtfSK1yNbz5FFffpFJhosg24Ra0iJWxbhVJ5ZrLIK5TswQMs4z/cHrkU7Tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(6666004)(316002)(4326008)(36756003)(6916009)(66556008)(54906003)(8936002)(66476007)(8676002)(5660300002)(82960400001)(66946007)(38100700002)(86362001)(107886003)(26005)(186003)(1076003)(6512007)(41300700001)(6506007)(2906002)(44832011)(478600001)(2616005)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eMJW2B4crtH+w/GI280Ptxp0agee2Vvf0HpD8v0wLmUp6ZN3k5+VIeWwqF/3?=
 =?us-ascii?Q?f2MIUW+mEdTKIPq7dt6ZrMgfLCuJxNVimToHuU+uP7vl/VDL3V5u6j3tLeaa?=
 =?us-ascii?Q?SQkSXQQcHEq0J5YZuFV4N1/bGu59hHpat3AmNpMofX/9yytJ8FoSi9L8n2MS?=
 =?us-ascii?Q?vu+QOUqgiiuPVUDsui/+WkV4IGn9bxRcZqfm0AfimBfnaMg+eTdg4pNqs2vu?=
 =?us-ascii?Q?Db79nPIo/RoRPe6iyVkntqBkIjUsHe/pwUfnTQ6uS0dBNRyYzLA9Z225TIbS?=
 =?us-ascii?Q?bxJErbmeUo4EB21z+pNECRHGgoMrdM9uE56eBBv5c5Em3IvSl49ZPC2goWj8?=
 =?us-ascii?Q?0QgKAdn/uI8nHVTcLRtIfstsOHgEP3kwpnSNB3PZZRkFInLPuL92prB5anmH?=
 =?us-ascii?Q?gqbLZ/AbEPQJJxxzMYmL0GYcZpEu+ypSFIq6qnlQFpmsPW/J9bdpRV1+V0bA?=
 =?us-ascii?Q?9i34CBMGyu4Bz+kfVDa+DAnB1kKWwAjgX9RRklG1iOT/GfSFO71lgaunIHD2?=
 =?us-ascii?Q?cZL8JfOw/GAlD/XIrAZGyOmMf3WRHScj6t5kCRTUhRV5+qnz7sWKhmx/cDAs?=
 =?us-ascii?Q?iZYhVXlqEI4RBixiJfEtpdbCKOg4F4ELPrxrwmkVJAuhYU2YwvuyrWzPyYhv?=
 =?us-ascii?Q?T6T6k7rGYOXOgp4uw4Ywk3i3QrlXGGWSzEb+XQI0FiPsj+R/FVVjsoHOGi2p?=
 =?us-ascii?Q?Yy+xd036HFjmFfT/J8u3/i0Co714KbACIivTqhFQR0/kcGPwCSeh68TWXBmv?=
 =?us-ascii?Q?JUWjZiM72qT4sOo4jg/MuaKmCb7pgQkA4S62L7MI3leZFQ/H9y2wycZr4x2L?=
 =?us-ascii?Q?sAQbGP0Zb0LGowW+FNfoLyBDHQRlb4xxWYqjo/3i9MmN9CN3IWDaqQmOi0oP?=
 =?us-ascii?Q?i+L93fblmin4U0otJN6eDAWL+D60ScsczuSQmH2uaZ83dFRMEW5aCSwwtBD3?=
 =?us-ascii?Q?yY3Oj7gjaejQttj1l7cchS8sCZGPVkqAUyK/s9Sf5WZgkw8SESh5pH24kTms?=
 =?us-ascii?Q?V721DWrXhqrpV5BDELdBKr71GfFt61vGuMeRlnfjaoY5P93ew8VbIdwLEdVm?=
 =?us-ascii?Q?kf1SQkVNQmQFtrNYE+2i4/BGmZOzreQLTv1iqABD4Bw8gRcrS6XppDdbaAHD?=
 =?us-ascii?Q?zOTGJlQV2Hd54WjDQ40//goLj3QIPenQdYNO0oVPzo2D/xUkfIWz01Ei+9OQ?=
 =?us-ascii?Q?dD7BsxqahggGXIOfPAfnAqlVp98XonM6thW8KOy1TzO4+xl339CVUV0D2b7G?=
 =?us-ascii?Q?5vpX3P/wW453issu5iPI6QY9qJwNZojR6jun99tDWjqWhBymQZEqwEi3fBK0?=
 =?us-ascii?Q?W7jVSLhvqeNBKV175+RL6FuBUyDl1IbIur1scJD73th5mtEtxX0X3C5H9ou1?=
 =?us-ascii?Q?bRH/YAc44ZrDLKX1Fd82PnXW7oJsm/LglUYuBooU6Iw/A1bidRmZbfE4bTK7?=
 =?us-ascii?Q?kt8ozClFWaZvf5yTuPthnDfr+Avak5AY9Sy7b/VVTcDeZiZ33AHiIsIdFDNo?=
 =?us-ascii?Q?j8P/nQseBhzPAwcwfwqxNHgoAB1tWgiYRX4h0hC5C4OGyp/H/he3/RcJCmL/?=
 =?us-ascii?Q?hNoJWVcRajCMAAF97NEHdoQ3nWfcCbdODbBbLyHAMuYCY0y3NThp9FsmVv8G?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 302d2aba-e924-49fb-ce2c-08db0624a487
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:24:25.4663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8FPyR8mDSSBxw3MDneG12IxFyhu5HL89CSQtO2L8+I2kB+9NhVDeE4yxpDtpIUU5uwCM8G9TfDuq1etWjOM1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 03/22] drm/xe: Move TLB invalidation variable to
 own sub-structure in GT
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
Cc: niranjana.vishwanathapura@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

TLB invalidations no longer just restricted to USM, move the variables
to own sub-structure.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 20 +++++++++----------
 drivers/gpu/drm/xe/xe_gt_types.h            | 22 ++++++++++-----------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index fea7a557d213..a39a2fb163ae 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -16,7 +16,7 @@ guc_to_gt(struct xe_guc *guc)
 
 int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 {
-	gt->usm.tlb_invalidation_seqno = 1;
+	gt->tlb_invalidation.seqno = 1;
 
 	return 0;
 }
@@ -40,12 +40,12 @@ static int send_tlb_invalidation(struct xe_guc *guc)
 	 * need to be updated.
 	 */
 	mutex_lock(&guc->ct.lock);
-	seqno = gt->usm.tlb_invalidation_seqno;
+	seqno = gt->tlb_invalidation.seqno;
 	action[1] = seqno;
-	gt->usm.tlb_invalidation_seqno = (gt->usm.tlb_invalidation_seqno + 1) %
+	gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
 		TLB_INVALIDATION_SEQNO_MAX;
-	if (!gt->usm.tlb_invalidation_seqno)
-		gt->usm.tlb_invalidation_seqno = 1;
+	if (!gt->tlb_invalidation.seqno)
+		gt->tlb_invalidation.seqno = 1;
 	ret = xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action),
 				    G2H_LEN_DW_TLB_INVALIDATE, 1);
 	if (!ret)
@@ -62,10 +62,10 @@ int xe_gt_tlb_invalidation(struct xe_gt *gt)
 
 static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
 {
-	if (gt->usm.tlb_invalidation_seqno_recv >= seqno)
+	if (gt->tlb_invalidation.seqno_recv >= seqno)
 		return true;
 
-	if (seqno - gt->usm.tlb_invalidation_seqno_recv >
+	if (seqno - gt->tlb_invalidation.seqno_recv >
 	    (TLB_INVALIDATION_SEQNO_MAX / 2))
 		return true;
 
@@ -87,7 +87,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 				 HZ / 5);
 	if (!ret) {
 		drm_err(&xe->drm, "TLB invalidation time'd out, seqno=%d, recv=%d\n",
-			seqno, gt->usm.tlb_invalidation_seqno_recv);
+			seqno, gt->tlb_invalidation.seqno_recv);
 		return -ETIME;
 	}
 
@@ -103,11 +103,11 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		return -EPROTO;
 
 	/* Sanity check on seqno */
-	expected_seqno = (gt->usm.tlb_invalidation_seqno_recv + 1) %
+	expected_seqno = (gt->tlb_invalidation.seqno_recv + 1) %
 		TLB_INVALIDATION_SEQNO_MAX;
 	XE_WARN_ON(expected_seqno != msg[0]);
 
-	gt->usm.tlb_invalidation_seqno_recv = msg[0];
+	gt->tlb_invalidation.seqno_recv = msg[0];
 	smp_wmb();
 	wake_up_all(&guc->ct.wq);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 2dbc8cedd630..3bfce7abe857 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -160,6 +160,17 @@ struct xe_gt {
 		struct work_struct worker;
 	} reset;
 
+	/** @tlb_invalidation: TLB invalidation state */
+	struct {
+		/** @seqno: TLB invalidation seqno, protected by CT lock */
+#define TLB_INVALIDATION_SEQNO_MAX	0x100000
+		int seqno;
+		/**
+		 * @seqno_recv: last received TLB invalidation seqno, protected by CT lock
+		 */
+		int seqno_recv;
+	} tlb_invalidation;
+
 	/** @usm: unified shared memory state */
 	struct {
 		/**
@@ -175,17 +186,6 @@ struct xe_gt {
 		 * operations (e.g. mmigrations, fixing page tables)
 		 */
 		u16 reserved_bcs_instance;
-		/**
-		 * @tlb_invalidation_seqno: TLB invalidation seqno, protected by
-		 * CT lock
-		 */
-#define TLB_INVALIDATION_SEQNO_MAX	0x100000
-		int tlb_invalidation_seqno;
-		/**
-		 * @tlb_invalidation_seqno_recv: last received TLB invalidation
-		 * seqno, protected by CT lock
-		 */
-		int tlb_invalidation_seqno_recv;
 		/** @pf_wq: page fault work queue, unbound, high priority */
 		struct workqueue_struct *pf_wq;
 		/** @acc_wq: access counter work queue, unbound, high priority */
-- 
2.39.1

