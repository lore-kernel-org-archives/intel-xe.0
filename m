Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9768EC04FEE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD6410E544;
	Wed, 20 Sep 2023 19:30:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D3010E53F
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238219; x=1726774219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ul1LShvQZiX9ZuDmfb2iV1KNSD/7eyfmuIU8b9EXz0Q=;
 b=KDMN5cTNa4whSyAKGWkwKXFIYcZzxpe0oTVJ21MSqr1vHcSGXMyoL9QW
 QJ+1Ex4ge2byjoRTBcPbhOE4+8sJ8iFrPM9I5I0nhwT/e7v/+Z62eN546
 lLBMvn20x1DP4pleeHLFu74GtdfcgZ7LVszUYPxQhoo5p2YVHrP9WnsOy
 aY1UX9viHCg9ZASOJRPpSXVOfStnX1fbmD2PyhqGOyepQJMEeWnf7x+IJ
 MNSj6MQrbaU1bfFla13BXq1Vulm2R+iGejp5GslW//Faoxks8gR/btyse
 Bf+TF3Z0zIj26/9YVVUHY8KUHph4ieBN4Js7H5V5oLHH1hKhw9UwARk/m A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359701231"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="359701231"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:30:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870498615"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="870498615"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:30:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:30:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqXVJwc57ULXNFXNoeIOLp9PqmMn5+V2qoCOJuz8zdCKPkIGFbAFu+7fR47H7/wrKldZGSTOXdGNjgejzSfoEPRaKf7/khV3tFeRjuz52zKy48sKiiBcyYVX+5usyvnNOIwI0Yj33IW/K9Dj2j60R+kacYjOKt4dzEjiL4PpG6R+IiXHQ7LwucH6cOAyx3hVgBixbWKXkDgrQin+5bb7JW7TX1RKNbq7wb7zYzuhYC0nkIkNk8yKmgFcUFcvmMqeiMlf81L2WhR0tVab3vfdfiC2fvPj6nywLUaWRwfHd+LLA3QBgMnOYuwOIUXrhzaUas9ps5Tf629V9Cd5UCwgTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNF7ewGsFUKXklwN/MOnFQE5eRvIt6hb2D8qc7wUrWA=;
 b=dhXCNiHbuYeJGlsyCSBTHsAIgCPG80u0R7idtOs93JBxFvD5jaAonYUvQSU1QMx0V8V1yA6iZDk8G2sBcD7c1M/wAEwESaDDS+M40mZefrc1ePT9Ha5yS6M6y3aHlEBc2ZUjJKLhlABLeRbEwH2O8FA2r1sTbybdfLjR+RKIE2OXRVy9cxwi78b4FmnMlKnmJIihtvZuDYMzEM7Es3kLldcErNipQe5dj7wYtz1VHvT0xgaoyQCCQxUo/tH5GThxSuVA5yLEGqU3UpnbWhKop6MvYDDK+V8UOHZed2shJBcKwjqI0BrmT5ly5KD6kuNp3NYATct+QgWDCLEB1efATw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8431.namprd11.prod.outlook.com (2603:10b6:930:c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 19:30:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:30:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:27 -0400
Message-ID: <20230920192940.135004-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d80199d-8585-4ac2-1aaa-08dbba1001a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l8XaR4pMAStOsMEyj6oHKMiT1EnXYleUs89qufkQfaPZbnZZomv3AT6HF8jMdXx+WfY293hN/JtKuJbtNQgsLJo6bAYnv39Ij1GtMeMuYQr0pLNV12gfR8aGps6e3s+psMJooAoBJ6zQ+PxQZ0bLU+2RsBjSyohb4tvbzzQimamyWQkeWSLnZ8Rqkk6kq/D1yBv5Gza94qyggOTE+p1W8S1zCd8vLCqBDRToYc9ovpx8nPO1N+XuMuOXU87MzhEwBhKQuRsjZ17VkUamteX3eL/ytZqRWXvvgPjEJ63WPYICH6JI6Y8ynCQnXSdT8nrNJ8uTxCV76Kw1ABgo1q10aWBVBF+TaLA+GvHWYp4Wr2i7xP8uzjX/D4HoziHHY2wNqLzNejKIn0UCFSCaynLj3lmr0o4Ajp5enBez1aaoqQeZoBHxzn0iwMNUDHzzMFp0O0GyqKnqn/FwHEq2SlYKvO6lghGr0aw4ChPrSC9shOGBJqMpzWMchk/t4ES2MN+VZuagw3RKwMn+XJ2XdzCetREAF1aEvJ5P19mdmDd+J4z+jlKdJuD/nQ5qzB4WNvgn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(136003)(396003)(376002)(186009)(451199024)(1800799009)(41300700001)(107886003)(4326008)(8676002)(2616005)(8936002)(82960400001)(38100700002)(6916009)(316002)(66476007)(54906003)(66946007)(66556008)(6512007)(83380400001)(478600001)(44832011)(5660300002)(26005)(6486002)(6506007)(6666004)(1076003)(2906002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wNQdK4nDfRz6zBqdJMVcQh7amMn+0bndZTkRimhLKT2B+YxkQpfJ6+GB+u2j?=
 =?us-ascii?Q?GSQSA6QaEzXVIfSnP691BlpoVSaT/Bjxv0upEbA1Poy9sGBjQXQl4iXQuvBS?=
 =?us-ascii?Q?G3Eqzho8Lpidc1223eUiGMUilkAzMAS/G1urtQwAlEyHgcNrGn5dyl4ateFZ?=
 =?us-ascii?Q?XMoHECcE80mEyIDnrXlgxvX7okXaJ6KemQccZCft+cBRKUpUHSktmnWX38k+?=
 =?us-ascii?Q?MqnXERYjzRK28KmxXyl1K3MBrESgekp7NkHb3zzRw9BH/u2WYOSWS9S66FKE?=
 =?us-ascii?Q?I7uepSjgBpaB0WZog5OZWGy+LgnlZgl2F/WcyiQXmKbc4STkdWO7l6jP4Qt0?=
 =?us-ascii?Q?xSvPgmOm7jZMldk2mdy+mEwJlVFQXn7s8BSIKIFnBlsEqpOpMZlU/OFLGABn?=
 =?us-ascii?Q?WJzjTOu89GvQgI74hvnuGUGAOkO+0D94SPK08tb5g6Rah07JmrGsDRAQFYeA?=
 =?us-ascii?Q?VacijBSUW9POUJLH8GSsWtNxBSXnlGap/sNI+vEDwqh6qcUzMT0FzYEfYTGU?=
 =?us-ascii?Q?UQy7a5obqfporxS/S8uDEIBAPc3SdTqlnFfxi+cHjVvubcthpkZEek/8FnL5?=
 =?us-ascii?Q?Cf3oDKrWAeWh6NY55iuVovSm4n+iZ6ePerfc11OMnDajBkxbbCKrj6kYPAV+?=
 =?us-ascii?Q?tWvUf4oYnX+by1vSsUvNP5I2UxfS639Ap40FiQAGCw4FE0+xEm6xsBtzdVxl?=
 =?us-ascii?Q?3i20vA9Q37bx4wtgW25VthQ6oMhu5Ya4RsHNnJx9IMUP9CdWYoO+sqgWjCFu?=
 =?us-ascii?Q?sV3B5Rm6gwh/oEtvZHLhE4AtsAmcmCw13IVLwQcS5EAESY6oIw1TutgsrR3F?=
 =?us-ascii?Q?UasfOHDVfJF0O6JwpRfXv25b2VqnLxZKLQO8hY73BBdcTg3spyIYmw/IWMTH?=
 =?us-ascii?Q?df39vgVVozRtoKh2u8anefm0RxsNk4D+Ne/4LCA9uVxhoQSw0gwM+XhcyD/i?=
 =?us-ascii?Q?ftC2PURG2+Tm+G4tUtFgFnplmsdA2YFUYDgH/+iTFjBHw6HR5umzHHbsFuUL?=
 =?us-ascii?Q?ynzFEwhkCEwr80X39c6DATpjAGTiytfxJ9g1LVInoFqQWMSQv+O/tucw+ZeB?=
 =?us-ascii?Q?6OEfOmDUq6f0Cw12gtB6yHx7F0jGTRqh1iAD4Dx3mZObilBeEeQQsRu2fDqu?=
 =?us-ascii?Q?hW2LqxFwK9Czmr9j7nnQaMJt9iPbm64XfhkpyZKNQfFUiJkrPxqre8nqATTP?=
 =?us-ascii?Q?JBhT8e/1bJLOGcu77bHON7vkS6MsWi+x1Y6riyD3Fp1SedSlCWFe65XHbAae?=
 =?us-ascii?Q?DfrMAcWpEKVr7SYJmKZgInMb6rwVvzTQCVaG01SckiBaSF0Z9j5fI2WNV7GC?=
 =?us-ascii?Q?dnLnaj3+v/ik/kqRc6cVy+5wEaerBAosyqZIs5A1tv/A/2SQsBvp5piaiwJU?=
 =?us-ascii?Q?8ZI6XGFq9KuFJTvkL7U75KaZDTgyIqxVK00Deq0koUYwwV8+SFuk3aSFY8pm?=
 =?us-ascii?Q?CclfTaXpx2eQMWgXaMiwExpv8InFRybmKwQ/RjIroYS757sB+4SY/dwjHdNj?=
 =?us-ascii?Q?naWEioC9HOF0bSZXAooOcoVCXtS1NZ/8Tpnq5mBl2nWJqefGAzcYfiFNVw3T?=
 =?us-ascii?Q?8Vz7EKWW/J1NhDulIuAY0ZW2muaqpTjV5DhsmEeUwg8VoVevN/1MMKV5GNL8?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d80199d-8585-4ac2-1aaa-08dbba1001a4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:30:11.5122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yojuI0zoJ8Ax9R8QpPLr+VJKJY10UbFhOgqbDvbS2AFTcNN0kW+ZkLRjgAguSpdL6goxZIGODPzEJnMSCqCopA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8431
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 07/20] drm/xe: Fix xe_exec_queue_is_idle for
 parallel exec queues
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

Last little piece to support parallel exec queue is compute mode.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 744be293fe37..6f1e64896a2d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -867,8 +867,17 @@ bool xe_exec_queue_ring_full(struct xe_exec_queue *q)
  */
 bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
 {
-	if (XE_WARN_ON(xe_exec_queue_is_parallel(q)))
-		return false;
+	if (xe_exec_queue_is_parallel(q)) {
+		int i;
+
+		for (i = 0; i < q->width; ++i) {
+			if (xe_lrc_seqno(&q->lrc[i]) !=
+			    q->lrc[i].fence_ctx.next_seqno - 1)
+				return false;
+		}
+
+		return true;
+	}
 
 	return xe_lrc_seqno(&q->lrc[0]) ==
 		q->lrc[0].fence_ctx.next_seqno - 1;
-- 
2.41.0

