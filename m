Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E37C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C82310E8C8;
	Thu,  9 Nov 2023 14:55:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9401E10E8C6
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541699; x=1731077699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hZXzSMR1p2L5NzUcCNIowMQrMdNllQqGl+nlqnM0+HI=;
 b=fBzymOhDNXqnxXMnPLfxN3GfKUvn9Ihgy8PavS8GR0G0/8nbXjPMf49e
 +aosHcV2sMB4dTPKANiD0+qYEJUgm3TBXqPPkr5yesVg2ObcERakERSF3
 ryYr0JihFACspibygCv0tiYJikIVkZUxZfaawMsCH/syhF4i4HUBUtMDP
 oScyS9j6BAhgxGgOXnBDQF3APkSW2QerVEs548Yx4BuQ4dsDNJJJvOPX2
 O/ZrLhhtMw1Ykxo8tGCa0pJo5j14fyAIdLbWRoCG00kJjMEkXX5aoZjgx
 +24lamBslqiZWOnDicrw5FVYbarZWbHhEOV0dAunUGHw6pLTeG0ERbhYR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389801459"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="389801459"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:54:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="739866790"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="739866790"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:54:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:56 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:54:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkTrI5KjSUCQYa06gRxWgLrnFXOkCjnoJYTqiBcjDKcZzogKdHmNl/dvJUvoi9hYUfXLwLqqh6TXgpIX4dXAwjB1LGKiTyw57tMKIyKT0srel1G0F34xjB/jm952M1HxISvdOYHDlS0oZGRXkofZc2rWWkKpyqx5Liw1SrjffYGsIzFRReq/6R5vEv0eICqy+/Yz794TwQel/5AxGWhAGMfs2yj/ctyPs1FsSKJXfNLrvHgfq6J4qcCZqK3mhHRwSjwQeiJJjINKuBY1tx0UWVVB40tfyNEa5oumN2iwjNkoOx49VfOc4c1Em0Vj46onD+ynAXarM75p6AWT9i0Rmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCpduaG2oJ0f6oGFx16ZGUvMbfFjDTOgC4zArVFaUy0=;
 b=c9JkOfKcSEh28+UgkF5QMczfAziu+7ksF3ENYgveT0s1nnnbXQjmas20ud/dBIBGjnln9Bu6A4v0hLjFeM+NABqYV61zC/Alvmbm1i/RhkxXKuUKnmlkLeLUCeGFnPivwx60Qrl7iz0moFGxLF5R+kczpKrtH17scu6jASg003RFcg/dNy1qIrlbp5GIfTxVDddKTodu8ktScFDPWsSvme6nOed2c8Qm71W2jCBiRqo8ytVDxuuiXiLOHpwfbPeezibnhl43Gp2FF5m+scnbHfSy1vj9+NYESYMr7Bmg1lfLvPCh7zq34QV8BCDYLcmHuJ0UxFa11LXluq1iJ6Ml4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5788.namprd11.prod.outlook.com (2603:10b6:303:198::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:54:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:54:53 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:34 -0500
Message-ID: <20231109145347.345120-17-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:303:b6::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: d257c734-d205-4606-c4d5-08dbe133d4fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lstd9gA3aTDl3HY3hVAyxzB6YXuCZwAZcQkWhQOyY293Uj/txXCOLo+paURX1mgB2ed/9TRXlss4WnELTmWcKO5qmv+aiJsbMxYX1MHWlKl5JQvtNucjGa93bc/FQ3pDYkeG/AYA1xUEJIiZ6ubeJVcgdCj1Oex8ezCKfbRCDGWdtvCDDEg2jXAepr5fi9x07PoQd+x7Lpa+NW3b2Ceg9zopR0WNGp0YbwYY0XQQIDF6cc3QTti0Ifqv9ZH2stVrLlnbR4T5s/AlycUvQQayCRYC/0jCtmztwLwu7eoVJ9pt+ixX3NnzMs5Y3sDQXNjcb+ypzVXIEAH2dEG3SA3gf277WokNZJ0AO7y4oXVdjL+AFGJFoIT7zX0s5ymblV4yrQ+ROnqMdZ4bQKhI7kByTDOs129n4OoXFrusKq7BuYu+k77dVww3LH02RsuRfdjs3rBrlbw73MtgOoN1ZBlzD96FzSBUxWZ+6hIcM2AjLXQK33utvYINYT7trPsqRRolg5KyJyammZ68vXK8yGz/v91yA9BabYjhupx5rMloOAw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(478600001)(6486002)(2616005)(107886003)(966005)(44832011)(6666004)(5660300002)(36756003)(38100700002)(6512007)(82960400001)(86362001)(83380400001)(66556008)(66946007)(41300700001)(2906002)(26005)(1076003)(66476007)(6916009)(316002)(8676002)(8936002)(4326008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Xdq3ApBvminGjeLIYNs+6xAbwN3TAAiBEOmT66cf4H2Y+3P6rmFYT0cLgo9?=
 =?us-ascii?Q?j/UUy5ZBvrk96cxsObcx2ceWIqFKEGyazGmFI23IwMs52NZFh68CMaUARC70?=
 =?us-ascii?Q?2Xo3eElp2S3OZPvaYDk9smn377aL0+fuC+wyHDUOVOKFSwTaC46D6czi7/x6?=
 =?us-ascii?Q?LB5wxNJ6E9iSOcSkuCrvxg+/R7Ow0Niy0i/F31lAwBuqz7kJGeAN+MqGt1Tv?=
 =?us-ascii?Q?55WhvqtLLUaB4jRt9Zgo7OHA6FuzqbiN5hu7OA1CIuMP7fnskSmBH9b5CBsw?=
 =?us-ascii?Q?ajteZHnP9M6s7oFPekyeXt/B51CLhmxUv7xOoQwhFkx33kgauz6RbwK/MCJT?=
 =?us-ascii?Q?72Mu7jawpBRJwJcp7ghefttcNztiv/ihcL3ZcFv8gwPv4c/v37P2jIxCFK65?=
 =?us-ascii?Q?tuxxrTQzly8qEokkpg0thhgLONmL2WsiIEb/WyR2SHJaTZcHRDiKH+VxTJHK?=
 =?us-ascii?Q?27ijKJFB+2f4ctW1fr3oaV6QN4fcBDCj+6WfudbPg24sIZK0yudRuBLwppRc?=
 =?us-ascii?Q?yrF6Z8l4KLRCtkhOeZZwN6zA/OucZS5M6M3R4hnmJfkvIhuclinr9CsK/f7o?=
 =?us-ascii?Q?yFRP0FAGNV0/uvHmKU+Oi8OEgzWSFEIDxPqJl38786mlIsSQged9jcH4s3RV?=
 =?us-ascii?Q?+t4MbpWdTQ+GW4cucvQd4qc417T/FjtgczDTDC5h8hdhKx1Uad44u11g6H4q?=
 =?us-ascii?Q?tfED16YMWXemzf2Dk0UNJPMm0lFKTTvYyehBs3MOv/gvwurFHrZNdIrg0jUq?=
 =?us-ascii?Q?9AJHwORVrUlQPmfCYmWwk084mTzDLwMR4hg66hK7umAHynoqnf8Y7TcdSIYt?=
 =?us-ascii?Q?KiisYq/dvcU89Uj179MOvhZVQuCwIYgvIrsOBexovV1d0gCBRG2rAfkNbnI4?=
 =?us-ascii?Q?pPVZxHu30Qb3dprlycGnawlqQHmKWXGCkPHQ3msfn8ou7Qw0nqKZdz/lm32C?=
 =?us-ascii?Q?5QJ+sa/WYZJd1ssxutfop2KrFCp5RPpAyG0USix5TnXRCI+T7vJRhkhC1N1h?=
 =?us-ascii?Q?6OyZwpTs7UTxA+EJPXJFT+u/d9J17U7kWLupxm/FD2pYhUtRrpVlo+iuCpk9?=
 =?us-ascii?Q?tLmGsvn/4ywa1+m3plw8tUEWcOIkXaidx4L2LWtioHPpqQOLFlHyu36dtQDM?=
 =?us-ascii?Q?YPoUMmt5x0JMRhesYr76OoUMJoMTGBV3DNOj5nQ41Z9U3+Oo3XQumZjPWeV/?=
 =?us-ascii?Q?A/lqIQ0hFXA2SXXOnUgqvmH7pgH0/zu2oD5EDMGvuw+a4vDv3MyK3ZJcprFA?=
 =?us-ascii?Q?QCCTjcdgT40aboBvJ9/niqQNOxDYxM+SzwzKy8PLZkbsoPLM4bsn2Mhdx6PV?=
 =?us-ascii?Q?fSy3joe/3cGORrCk3qFWesBGCBeV2uYKtnPIKnCNMuybdedZy95cqARQWZUh?=
 =?us-ascii?Q?fKzOcyCyz0pbH7DAxNoCbpDycA2eU+Fb3awrQcJcGOJ/qAAnfFFinSJP2Mio?=
 =?us-ascii?Q?eRsYPFM0cPqWD6v3jNBQdzDZkr29ziYOkCgaHWDXuUzlkzbxW8biD3NtgqqZ?=
 =?us-ascii?Q?CsNPIBc9SQmuvwyzHur9yhrPdnsXXAR6wxiMZa35OhbFaV94bKcv2AOpcx6/?=
 =?us-ascii?Q?5mUqdf+MiZdD+e/bUfft3x3J/aqXUPBMv23rKfFC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d257c734-d205-4606-c4d5-08dbe133d4fa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:54:53.8795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PvUiU4BN0uLXTO6yzlTaxtgAvHyAGO385TJD9r6XcHgxWBg2G3dq49QFg3n7Yym5YRVkY1Fqx6g4i5y+0fP1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5788
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 16/20] drm/sched: Add
 drm_sched_start_timeout_unlocked helper
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Also add a lockdep assert to drm_sched_start_timeout.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
Link: https://lore.kernel.org/r/20231031032439.1558703-5-matthew.brost@intel.com
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
(cherry picked from commit 7a36dcfa16a5a7a87f65e03e1a3eb2b5e2fca812)
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 3b1b2f8eafe8..fc387de5a0c7 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -334,11 +334,20 @@ static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
  */
 static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
 {
+	lockdep_assert_held(&sched->job_list_lock);
+
 	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
 	    !list_empty(&sched->pending_list))
 		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
 }
 
+static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
+{
+	spin_lock(&sched->job_list_lock);
+	drm_sched_start_timeout(sched);
+	spin_unlock(&sched->job_list_lock);
+}
+
 /**
  * drm_sched_fault - immediately start timeout handler
  *
@@ -451,11 +460,8 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		spin_unlock(&sched->job_list_lock);
 	}
 
-	if (status != DRM_GPU_SCHED_STAT_ENODEV) {
-		spin_lock(&sched->job_list_lock);
-		drm_sched_start_timeout(sched);
-		spin_unlock(&sched->job_list_lock);
-	}
+	if (status != DRM_GPU_SCHED_STAT_ENODEV)
+		drm_sched_start_timeout_unlocked(sched);
 }
 
 /**
@@ -581,11 +587,8 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 			drm_sched_job_done(s_job, -ECANCELED);
 	}
 
-	if (full_recovery) {
-		spin_lock(&sched->job_list_lock);
-		drm_sched_start_timeout(sched);
-		spin_unlock(&sched->job_list_lock);
-	}
+	if (full_recovery)
+		drm_sched_start_timeout_unlocked(sched);
 
 	drm_sched_wqueue_start(sched);
 }
-- 
2.41.0

