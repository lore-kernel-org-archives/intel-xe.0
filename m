Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8F5C05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C594F10E09C;
	Fri,  3 Feb 2023 20:24:43 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8706410E0A4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455881; x=1706991881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tEs9nsz30/w2TMOx57lJQIY7Ai/LHZaIpAVn/TBKDBo=;
 b=O7eaMuR99fUxIVEfD/cWqXlVKF7wKFn1JODqTJhIwa+JBESoKn8LHw27
 CaNeymA56yAwggERtRLA261Qxo1FYK2y6Boc+KAg1kuIBFdRQ8aJS+uXH
 6u5qNLmIMAare8ODjMbOAsQfP4iEm/eaQ6hcSYTfQULtb9Yb1IYp3WjJq
 lERXynuG5bxuMMuTlEz3uY5V66d613d6/480IV9mReDF6wqJbwV4Ac3uo
 I+S62DYkgexnmQDm4L8lqYHfId0P1VPtqsP4CwGbGpKZ6nQ8ZqFE/UnVt
 lCy3JBHho5ARtL1giPtz+PvHnD1N428UUd02S68i11PqYDCFF7N36I93v w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330975764"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="330975764"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:24:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729376801"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="729376801"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 03 Feb 2023 12:24:40 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:24:40 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aG/Mf0q39Svrmg9Xuz3kh7ftqIfAajm7RACPYoGqtM2G+irj7vGep81qm4BGft3dcOOvrj5/UQuLIwOEuCapQQ6TwlTZf+mrCoLHA9lQRgn+hBC2klkYAQdxFjqkAMsyusx49GyOYJLn6ukVmaKdK3iH/OuOXXVnA5Reb/kbZGCLyRnuKfIDNdlZsPsj0ENrTCgrZ3iN1U3UJNaW84uL+5ySauLVDjldHlIFLygjRb5FBh9HT/ugUcljxuMvP52Nzgoin1q0yRA4H7/5y8Emd0QP30nRRNmR0PIROfbmQE87b8qsjx1dFyMLkvbvRATzLvkAGVzUbWcfmUxn7oLz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CA0L50ZujEUbph8I3b0d3hr6+wvIUi8PylkbNfzmx70=;
 b=OFmwLXU23sGUmovdf8Knns+tYhDDSBDwqoZnjAttHH4ImLlWMeNjfzlcSh7D6sal7GV1LroOrS6gRfxfpLWr2sw+1CgIUcv49ig+d181FQNh5F3Q/3ank/f7JapwksARpOerSagHDtksiEsbpx1P52VMQpdOLWQ8A4ZbUKCG2LtFr4jnymAHBuWU2HbElWo3QzX6RPC43UcZ6ousaXX0W4Qib1l62xJGrpASWe2VsoOH6M8FvnzWLFPTjbd894SylEzvxmOAxpCvZfgmvrHkpP3ZO2O3O60x2aCHtNatIPehIhr8r16D8uYbcokLBWG+0wYeOfjRNZuE1w7zrlShmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Fri, 3 Feb
 2023 20:24:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:24:36 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:23:53 -0500
Message-ID: <20230203202409.577032-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f6f4ec7-2503-4692-5e8d-08db0624ab27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DYc9JjDjQLtlRQbzKIPi4iT+ziIH9leOStVSO2arTlNS0oc+Xb5YlKQ9+pmtV4x644ZOVi4Aiz1WSA2SSEBKkef7yOHQYS2+ne56FUmNcvOUjqg7BAKLZKrCnamz3RVwpCSb5ZKn8TsBpTXf/xay9tInoe5hq0e0uVgGZm7AUiBK9xtNEaMG4b61Y8vQynXPRBwDtOR01Z7hnghBhr/bRjHlOxhvA6YVLSqf0JHfEkKU+dBqYrp3bruS6tSpWRLgQU2R2xgc8O7mrdIOylat/OHF7+sJ3y3auVxbICNB/JQEbw+DXby1Ripq6IPNLqMvoTRLYcmlWOMYlhTI4MOt/YqVnGXDMtKYvnaKTnaxY3/yBHgUEmUe3LyZKcLqb3fmcNJ6GTgQjLyNIHLdezHtvkB6DDIBxGTBPmuPohaT5Hnj63MopEwsrBkU885YkUh3KkkO88Nfo5lBOAd3Fc+euTMgNWlX+vbGTIDc1ZuSkwv4+kLPbe2sKOX8FgtTV+Tn5VtaFXpv+MI53txTHeFPGWqt2V77yzC96fqVvsQIO5Vnnkx3vdcNpYc79tRVQsRRqY9alkAzSPI8LkpGjthf5WRWy9XvblNhimZVhTACfRLhVssJj7Zi0kZZGnKYeD47ygYYxHybpua4BCPsdzH5hQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(6666004)(316002)(4326008)(36756003)(6916009)(66556008)(54906003)(8936002)(66476007)(8676002)(5660300002)(82960400001)(66946007)(38100700002)(86362001)(107886003)(26005)(186003)(1076003)(6512007)(41300700001)(6506007)(2906002)(44832011)(478600001)(2616005)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nYDT6HnvwmN47+k+K6i1DYq3TTRHF6JCkAsxU50a4q9BpgIxgYRc+7D0D/ei?=
 =?us-ascii?Q?hrdYkbIB0EMZAUZnfXkEwQGYVv0qxCHGudXQ96NC1FnYWaUuQrWWAQm3wx+Q?=
 =?us-ascii?Q?7Jz8g47RXLSKbL5TNgnMFrxTo8k6U/mw2mndHcDf3zb94qPahrQdPGt7v482?=
 =?us-ascii?Q?Fl+tfMW9t5se+a055iUkaZNP22CrBZegeicwoXq1r8Tu5jaBdA1CiwaAinW0?=
 =?us-ascii?Q?9JXKFFj+67GYehtbmq+yMl3pf4Y1Y1ho5QfYsyoTXoY0VQKQcNeeeML+3a8j?=
 =?us-ascii?Q?UgYBP5iOizxkVjf4xj2YVZtMwckw4DfFKJD9RLP4fIHSbuvJG2oIMQ1GmjVg?=
 =?us-ascii?Q?Uu+YM2OwYHNzAte3QfrMgX1b0UJbM3BiZ0ocZZF3v39E45Z52FB5qCbjsKTn?=
 =?us-ascii?Q?9vgRoG9DSawQuYOVAGPZhnnrZ6Z9IOn6wkK/KsP2avU6MGSY1hDaMKMAQBNL?=
 =?us-ascii?Q?c60HrCJ6qrxsePjacd2J59fBP3xn4StHYBsMWPGQs75ZtI2luYQxrThJ7ZYU?=
 =?us-ascii?Q?Qbmxb4J5N+P1NOIXrqsC2n3PUTwaMx+gCO0874rqZAeGrIIIZ6o54eVTDc/R?=
 =?us-ascii?Q?FLhr6SRaTl6L0edtU+Ma4itWQCbOai7rN+V9FH9jxdeWunxqs5YSK9fWgxTs?=
 =?us-ascii?Q?WMuPqZpDrz5OkDpW3bRFFY/t7y2mFvbn8eOFoRuMoVTsL/C0aWSLF2+Ni6eJ?=
 =?us-ascii?Q?Y1ACsLdT84EIX+fmf//Sa+kTOEjUXr0811ZSJQgWr8y7FRLnJhIMs3o0GgCP?=
 =?us-ascii?Q?MKDOWWu14x+kFc+sv5auWlCPijAh2sH4mgd+DTScnnu9iE6NvyrKS/GnElen?=
 =?us-ascii?Q?PNealNMv1x7f2Gg7ywbsg6AYsEtZ9YrXjraXAwNc3N/G72i9Ar0dOYLgUVeR?=
 =?us-ascii?Q?S0FOfigXkw0cvv615FmDYiinaw0G1ETj+03PJw4z+BrTZlTK8SfrHiw085I8?=
 =?us-ascii?Q?5DYnyNHpIPMmMxfRX9Cv+F1vJ1tsrjMSlNnFbJRhrPNGkQDKCAmdVATVIvd0?=
 =?us-ascii?Q?Q+nwFDkl54A5Aj3IUU/Of7wpm9W1aDUzoIxQX8kIi8V9hlR/QYr0Bzk4HRnV?=
 =?us-ascii?Q?hzGYfDxLpP7EpcYKv0ZTVO0GFsKB0PtjqiUeuFuli9AGMC55EXtFcdvxjJkG?=
 =?us-ascii?Q?dLkHJGHRKjqOU/W8fpG7tHKT/EkVOZafL8ndxY4njqU0FIdXSlLaW0vFy9/1?=
 =?us-ascii?Q?lVVahhWG6cWUcjFspC9gYkdKveSI98gCiVR6KPht9msvkLaDneYaiMVHCi/C?=
 =?us-ascii?Q?DXFJsapWDdlqxMZ9wxy67MeVRyWBXqqYGhnS5+ORBz3ornoHkHXOZyxl4R8Z?=
 =?us-ascii?Q?J+RiT1kPY0iG45hOtMmZ20laVqMuNJ3E9nvgeFXxeyoRN3fV7aGcKv20HDNF?=
 =?us-ascii?Q?kcKJQFdjyB+aHO08Oee7+b+2QCO/UzmJx3yuYUS0JdSfolTVlhLDcXyrJ511?=
 =?us-ascii?Q?3IUcBevSKbhGZs/gTkWIOtVcCFI/uwcX0tbGlbol4yLw+1j9FRBEcKwyVW2I?=
 =?us-ascii?Q?AY92v5JxGq/4ryJe0AeeW0aFCtQC37fpzd7URX1nmFP93gEF8NXpalxE6yhh?=
 =?us-ascii?Q?ipb48hPyzHrj/8WHlSA74m3bMzakkvQXQQ5tebn8rYygfHHFMhyE5udbYb/i?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6f4ec7-2503-4692-5e8d-08db0624ab27
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:24:36.6254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53bR63JQ/A0jPRlbqEXIg1/fk4vT/aSmw1b0pXWVQ93KFIQi49WTNYVh5bZ+cUx2zWh4l/mKqUy73vKWfyMVVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 06/22] drm/xe: Kernel doc GT TLB invalidations
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

Document all exported functions.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 52 ++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 23094d364583..1cb4d3a6bc57 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -14,6 +14,15 @@ guc_to_gt(struct xe_guc *guc)
 	return container_of(guc, struct xe_gt, uc.guc);
 }
 
+/**
+ * xe_gt_tlb_invalidation_init - Initialize GT TLB invalidation state
+ * @gt: graphics tile
+ *
+ * Initialize GT TLB invalidation state, purely software initialization, should
+ * be called once during driver load.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
 int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 {
 	gt->tlb_invalidation.seqno = 1;
@@ -24,7 +33,13 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 	return 0;
 }
 
-void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
+/**
+ * xe_gt_tlb_invalidation_reset - Initialize GT TLB invalidation reset
+ * @gt: graphics tile
+ *
+ * Signal any pending invalidation fences, should be called during a GT reset
+ */
+ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 {
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
 
@@ -82,6 +97,19 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	return ret;
 }
 
+/**
+ * xe_gt_tlb_invalidation - Issue a TLB invalidation on this GT
+ * @gt: graphics tile
+ * @fence: invalidation fence which will be signal on TLB invalidation
+ * completion, can be NULL
+ *
+ * Issue a full TLB invalidation on the GT. Completion of TLB is asynchronous
+ * and caller can either use the invalidation fence or seqno +
+ * xe_gt_tlb_invalidation_wait to wait for completion.
+ *
+ * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
+ * negative error code on error.
+ */
 int xe_gt_tlb_invalidation(struct xe_gt *gt,
 			   struct xe_gt_tlb_invalidation_fence *fence)
 {
@@ -100,6 +128,16 @@ static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
 	return false;
 }
 
+/**
+ * xe_gt_tlb_invalidation_wait - Wait for TLB to complete
+ * @gt: graphics tile
+ * @seqno: seqno to wait which was returned from xe_gt_tlb_invalidation
+ *
+ * Wait for 200ms for a TLB invalidation to complete, in practice we always
+ * should receive the TLB invalidation within 200ms.
+ *
+ * Return: 0 on success, -ETIME on TLB invalidation timeout
+ */
 int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -122,6 +160,18 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 	return 0;
 }
 
+/**
+ * xe_guc_tlb_invalidation_done_handler - TLB invalidation done handler
+ * @guc: guc
+ * @msg: message indicating TLB invalidation done
+ * @len: length of message
+ *
+ * Parse seqno of TLB invalidation, wake any waiters for seqno, and signal any
+ * invalidation fences for seqno. Algorithm for this depends on seqno being
+ * received in-order and asserts this assumption.
+ *
+ * Return: 0 on success, -EPROTO for malformed messages.
+ */
 int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
-- 
2.39.1

