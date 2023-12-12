Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C04C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA9310E53E;
	Tue, 12 Dec 2023 00:11:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C03F10E53C
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 00:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702339893; x=1733875893;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=WjLkP7atTkU/tNivNKxEGii7tXHJE0x5wahkpSjwrws=;
 b=fQMcm33xMicgFVxa/RO1gELLtwaGfDKCOI+5VByF8SWG98XUapM+/5iH
 atSL4Z2b4X4Z9Q55Sw0UtU09XZnNOSlN0l4wn+peqqEFCOB9yc8yOrQNu
 VJZfBH7HIS59Co31SLd3dW8wCoJCHc3vSgIs3c/BU/WDPzQH2VSCOQWd/
 M217ET5fRZgRPEeJsuK9RlYT7nXQ9kX79WikMzec3rRwyv8dTJy3Svagv
 7L9LEk4Tkc4hxNC0As7SCuMeQ0wvP6eUGqMuLGcAq+CBg/j2NIy1EXcI3
 BT3WXq87MMcQCTbxPIbWl2RdKAxEPYNm5mZStpvkVD+/ZPF+T0n1NmV2p Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8093377"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="8093377"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 16:11:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="766586551"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="766586551"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 16:11:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:09 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 16:11:09 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 16:10:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0xB55cLsyHVoOnXWo0K7iFrb7oGiry6Hz/MTplvkyd8c+Esyuxvpy065AJj7r8u8PficZrcBDum3L01KUFIV5Lazjxfb4YngAgek1J/fKCAEyZAfD7vAtWQyAdoMCFl5Huubi8quw7xUUgAuP3pfGzpXV637p11UlFvRK1YVcTOBbOvEc3UHH7skewahu1wotLTCu6Jb4URN1pL7UwivvHrf+idnknB4ekRfdbou+GedgWa+xrDyxvsQubFN2C/+XLRXTHFqWnnG5SACqk59LHuYW9Ic449VYN23X/+ze5dv7KXdgd3Map/t5RpcKQXKSx74XlGe12/qxBueKvObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhmJ02PXM63xt1LeTyFdQLsRIOfM0fxfK5xNYxjCyUM=;
 b=k2lPOAYDQ96pHvEoTihaJp6HFqAH7cBd0aaJWmAJ6IdarHw7IVUzudbso7g+2kZAS68P/U0wJ1ROXNLy/+TEBdmaWF3IumWmXpdJZTL1S+pFLmoqbr9G7n9NinqfZpWmRyYolN7ywOqb7jOSoid2gB2BgOdD7/tVJZjCaT1EkXhZ1D0X+g9jO7Bf3ECPiVUKNOtsy7J8bOKxpTXqUTmXz2ykQ4+prurrHf5bI+lszAyIxfNAH4lEwlcE1qZMR6q3EFoHGH93PdMUI5XP9q+pti7OGx2csfd/VgOVcARC3qA8c6zPV1Ujb6Zyiy7K4zf8aSosIRj4seaPUafbRT8jJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 00:10:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 00:10:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 03/13] drm/sched: Rename drm_sched_free_job_queue to be more
 descriptive
Date: Mon, 11 Dec 2023 19:10:35 -0500
Message-ID: <20231212001045.1099517-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
References: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e6420d3-f409-4831-902a-08dbfaa6cf48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pY+UNBRI0EGX4GduLTpGrKMOrttnrwTEqtkwtgtdDvqN61UMNmmNRrM2Lelp6Zt3eyQWOkEXvCATjLOhuykxcf8La/y/Yvkv2MPNqlGA4FTgaUGCJ0X8woR51xOTKeIN+plVhB7/7mAmRWJAzulk+HBVe+F2hBPGEt7s7va5FrYY9YGDlkxz0kzAHd7aY/zM97sLRzu33g8NdeNu6BmT/0oNrz+iJq6uA5mABzHbz4jN37rIRAzQVSE9H59oalYxNzQSwRL1SUpPHwoG3gdwe+zUjeB1uwkU86CPKGX4uyVQxkLS1ORed90aIBJAZwdT6tYJ3g+zp6QlrHd72pPBVS2pQgxg16s/2Cz03YXRX4lC/cWYh+lu4f7GyILoQTvnQtjKJMAzNpTb7hEtNRqSOvYiP3rApthIo5KFF+bVL0ngY/K9LTq3N8pMD2iRav1QsFjqQCKc/VLDbpoBdcA2gScRB5QfBKjZeiVIP0rtv0o8T13aW0KXhlr53wfPjSJSCzyCzkWsAwmy8kTAuJ4xijPrmqIDARcsYMBz+ymj2Vk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(346002)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(6636002)(66946007)(66556008)(66476007)(82960400001)(36756003)(86362001)(83380400001)(26005)(2616005)(6512007)(6506007)(1076003)(6486002)(966005)(2906002)(316002)(6666004)(478600001)(5660300002)(8676002)(44832011)(8936002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RCe1I/PC/T3oUZrkdYGgC4L8faBuPIAmRKu6gVM8oi3uvIqOFE2fEyi0W+mt?=
 =?us-ascii?Q?fidZ9SyT8bx44IQpt6of2qKaznltOTTR+IvlhO0p9LEf6kI74Mie9aCtCsVz?=
 =?us-ascii?Q?1zMnnOkRVWV//kn70xBM4yPEXapR8LlopTseDzD58Mjkzmo+BybuKs10P0+k?=
 =?us-ascii?Q?MOYbOBEB78AkoXQpAoCl5QIec8/6/8uDqSq7E0A8JurkZKiqyH60DIBpZk7u?=
 =?us-ascii?Q?p0y5DN+apiY+9qT2uUnM5vsIat/h84KKZtkSe4bA4s8nf9JoMY4j0+QqUT5o?=
 =?us-ascii?Q?Y9/pRT1hYlzR43wbgAeW5Hr3+rvApogSjZoz7CpyTirnsWQZ3q0Sa9LiVciq?=
 =?us-ascii?Q?CQPwDanUWFIOhxhyLUsgXTISiH2Bfnt2Pxpi3yg4Zsam02M26whKOvUyrtP0?=
 =?us-ascii?Q?DEMMpXbzacGhHQuFhv/3v+daq6T3JZEcx3eQ4VfTA/ivRGUgB7jPycHrm/cj?=
 =?us-ascii?Q?3ib7kLLxOLfT292+RiEiuVINS5WPHG+Bz1cdJBEOVX9zjiA0zqJIW0uHIe6M?=
 =?us-ascii?Q?yy6jSkB2xVOrPy7O9tpLLAJZzWu1ntaeZQFzJSR3wkPd8g1ev7GyVLssyUpK?=
 =?us-ascii?Q?OsvOcUGmNUytOMvKTNhcVtL6XwOS3g2EqRhthXWZVCbFai+UG5huOu0JhUxC?=
 =?us-ascii?Q?blHmyOnQBCBQhWtCvxxebP02v4ZxihU6oYUM5BYH4QvJzkj3tsg59yptaCdk?=
 =?us-ascii?Q?o4jKYK3wf91PZL07rBhcuVHKfSvTBnAYKVAkyMrH9wMYMg+lRb2HOwQlijWH?=
 =?us-ascii?Q?FpEppFfcesrf3gbpw9AzzvQ2/7mgbmbJl6k2ZMNncjf6JUFKuBSc3CAZyMpp?=
 =?us-ascii?Q?CHq+pv25V5Q/QeZb1auVEDYx3D+zF44VxY+jHSGnT6BDzd7R5bzvI2UqOZEw?=
 =?us-ascii?Q?Kuv7Bkzda4lTTOCvRCBRIyqYdfrU8piRRW3goFue3l3VtD4iaSI2iV1qQMET?=
 =?us-ascii?Q?leS08mEG1doqsG+q1TB74gzHzYEpHNjK5fiO2R4LHfDlR7wY+RFsPGOlnpnj?=
 =?us-ascii?Q?Yeph+VIBs2gScP/GD/5QrloOtCLhZW+ftZFTdgZvFQBXWGjVt/zyd1uIUgUX?=
 =?us-ascii?Q?IZqhW6uDYbFNB13NuVKbMeRVqyrWTf8zGle7j837I5cpxit/3BN6W1Yz59Hn?=
 =?us-ascii?Q?qKEBZszuS+OcGBH8hSWgro94Gy73E3nBZ3r3Lley4/IxJR5fJZw6w8YTbnXR?=
 =?us-ascii?Q?Ooe0POxmXzYUsLxdsk25y6k8rltICrDNu6hJqPQfulB/qsl/0BuND4igGWzj?=
 =?us-ascii?Q?OlSbsLQPcvees0B5M6aBgs7TFKqOUDUbRSxvTiXSaPYbTZIMnzvK8ZwZVMfP?=
 =?us-ascii?Q?sfywHSKbrwXMTgt95aGvuB3HzKI37KGxiEYYqpmvqKcPLH65r7cru6h1OJ3U?=
 =?us-ascii?Q?IUa/zeY08SekqTnlTLz1GMVi3W+OfjFyEPP4ZtYMk0ibkdheb9MEzV2+cjiP?=
 =?us-ascii?Q?95xtXdtMV9YIURVf2oUlo+eowWnDANsHAGzI0Iod3wta3uTJ8OXvIESlCCJd?=
 =?us-ascii?Q?YLZCmHBDaSnfMZB/rGPkUs5OOUYmbOLptd/QDsiX2VRSTez6ewR1PXi9d2HJ?=
 =?us-ascii?Q?F9XGfv8pcGlsfuoRNHjppNGjvqEfPHOhuIQCuohWmddXLcIzT3dLJY2CaC4c?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6420d3-f409-4831-902a-08dbfaa6cf48
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 00:10:55.3895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: De3af1yEastNlJiIyx4awioytq+JsIjT9vKFkldwZTH7wRguX9gaPJWtbfADkumtc++Pternn15qNmbjZalojw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8706
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

The current name makes it sound like helper will free a queue, while what
it does is it enqueues the free job worker.

Rename it to drm_sched_run_free_queue to align with existing
drm_sched_run_job_queue.

Despite that creating an illusion there are two queues, while in reality
there is only one, at least it creates a consistent naming for the two
enqueuing helpers.

At the same time simplify the "if done" helper by dropping the suffix and
adding a double underscore prefix to the one which just enqueues.

(cherry picked from commit 67dd1d8c9f6543661720b9a89e28a25488cb8753)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231102105538.391648-4-tvrtko.ursulin@linux.intel.com
Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e1658030613f..f9baca20b438 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -266,20 +266,20 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 }
 
 /**
- * drm_sched_free_job_queue - enqueue free-job work
+ * __drm_sched_run_free_queue - enqueue free-job work
  * @sched: scheduler instance
  */
-static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
+static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 {
 	if (!READ_ONCE(sched->pause_submit))
 		queue_work(sched->submit_wq, &sched->work_free_job);
 }
 
 /**
- * drm_sched_free_job_queue_if_done - enqueue free-job work if ready
+ * drm_sched_run_free_queue - enqueue free-job work if ready
  * @sched: scheduler instance
  */
-static void drm_sched_free_job_queue_if_done(struct drm_gpu_scheduler *sched)
+static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_job *job;
 
@@ -287,7 +287,7 @@ static void drm_sched_free_job_queue_if_done(struct drm_gpu_scheduler *sched)
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
 	if (job && dma_fence_is_signaled(&job->s_fence->finished))
-		drm_sched_free_job_queue(sched);
+		__drm_sched_run_free_queue(sched);
 	spin_unlock(&sched->job_list_lock);
 }
 
@@ -310,7 +310,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence, result);
 	dma_fence_put(&s_fence->finished);
-	drm_sched_free_job_queue(sched);
+	__drm_sched_run_free_queue(sched);
 }
 
 /**
@@ -1068,7 +1068,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
 	if (job)
 		sched->ops->free_job(job);
 
-	drm_sched_free_job_queue_if_done(sched);
+	drm_sched_run_free_queue(sched);
 	drm_sched_run_job_queue_if_ready(sched);
 }
 
-- 
2.43.0

