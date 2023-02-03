Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7F2C61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A77E10E09C;
	Fri,  3 Feb 2023 20:25:00 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770A910E09C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455899; x=1706991899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cGdNfk6IXBOfv9RezAZh07M0EShm/7jHrUEhoL4oOR8=;
 b=ixA/2gMP7bT8SuEx1LuF2Bly+Qjhdn3bTkh95TIqnAOg2xNTUEwp9VSf
 LsNLls/9e7NAWl+5/le+z+LnBghUQq52w+WNx/KGUq3wLAOowsIaMcwvu
 k92dXHNl2pc+p8rTjyvHl2LsB521xD4TRyCYDTe9cfkdxfPcPWHT9NI20
 7QRvp/ndryzax7bdBTf/OpG5Em8w6cgqV4B5r3yA3i1mLG5rU3hC68bul
 g/wM6fbgrTqYGJ347bhcRevwhfAmMt/urlLIB2zf1glWT+3kS6dVoUOD+
 k87rC+q/cfjzOytRCoNfMxYKRn2taPLZVs+Orq7LsHEkdu4A+p5WNw6h1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312503061"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="312503061"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:24:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="754594625"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="754594625"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2023 12:24:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:24:57 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esHw2xNaRIrRBtLtIAsI6wp0luS9ZQlTb+mlPYS52Ab+1Ta7Nn7gV/eE9sBmh+BmT/H4//DvQYvCrdVxp0WW8yJZdR09abXLHRsteCjRYNJ/vSWeNrIcuQP/TsKt7sstxbhwQ37QEpp5FDhCzg3BNrp6IJZgqqSmpIt9zBvJH02xTu4i/RAte5RTDb24nsDbm2D6Jzin1BpXs0dq2ApGx9X1JeO+dzQoIYyFQGKqsS9xUG9KX/FKK9p0Iek+kb2G8bVPrMQd/IoLxsR93WvuQqFnhcc8OBv0coh6us4rBv5a6RVyiSgKzngCG9VJ5jVyTsO1xEVhcXrTr2FhRWkOIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QRnt/77iFCEicLFqEe/ekSAWTURxDEnmW44TEyBCdg=;
 b=c8r8ovQY81B3MYp7cvhQyv+Di9BnjaQ2jGi1CdJlgePzLX0PSzIm96qKX9Y2eHyyM4y5LyXmkVyoDNSNsm311oRciUqD/K7hNhQgR0wmwvAg0q4/yRbGC6WcsgELonDwMl73eGc/kxCFoOBKhwfiG6d8YoeXAxDubEkamB6HFdkHYXQRXqfTXvKXpIw7MXKgVIeti/YrGp5VppPuJbh3GTrJA5LmG+4iCfQx5JvgzHtLEWrSmyibC4fnehnqJArOnzMlypJvE9z0yB7KQKngwVGzIU8Knpcvng81v+TdwldkWqWBAU7K1k8TWRwLwo1plKbEVuFlmZLnc9Ajv4KPmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Fri, 3 Feb
 2023 20:24:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:24:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:23:58 -0500
Message-ID: <20230203202409.577032-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:180::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c578b4-f4a7-43f2-7d0f-08db0624b688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nBgg0d0gZcHK4HizOgImmeKfIctt6qJZrkiz13hVaoMOj1/a4nTahcPjMGkfldWlqcIco8pGkKnt99QozALIDdcOWvEbO98k8ZuoHC9AIHqMsQVX9Ac4ieqXHFe1kFk/VVxLDoTmCRGQVMXLzMBE/xxkJ5UqDwNvxVkhi21tHaQnmQ2hsf1JgBYgh7/C8Uq2edgVqpoo/IZGoyD9BbZFqCEg8ECQp4nvL41fIvQWCx4CrGSRpRRagEoyc4GhgzInrTMNyvm8pOHBOhNYxYFXljJYXow3QqvMVpS0cZfH/SGzQyn2h2MFU3UacJW5o5UXlyQZ9dpHzlmlGxtoqOexoDSRZdE4VcWJsxHdaUFn083/trN1RbM5y+HqdYe+spyZKsuovoLgLIf+9/tmEQf8CRUY1WzQV79heFPHva+DtKxi/JgOBdJSv+fgz3UCxuXKpU0dNZ7ie4EUyApKtch+9ovQy3N+ey2rBAxPtpio1GOSucLOyPgRfEEvpCyxIShgi4bPrkA6iQ/9tMsVOHFMWzO7mx4JRaWerYKtwWB4dtVB1sWLQmDt8XjTKAL/nkCug6d1igj2ib4VwygP7kouP3kVqChwEMtFBKd06RoV3IZyx8IwRsj0VQk77rz6TI6/ii5ht+ULjgeCUlOUVrf0oQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199018)(82960400001)(2906002)(186003)(6486002)(107886003)(6916009)(26005)(478600001)(6512007)(66946007)(316002)(1076003)(6506007)(54906003)(66476007)(8676002)(66556008)(4326008)(41300700001)(44832011)(5660300002)(38100700002)(8936002)(2616005)(36756003)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tci0WPz3KcXuYu4tTJGI8cVU+io+hR8zqe1XGsoDIdHN1onK6kb2iFN1eZpZ?=
 =?us-ascii?Q?xAXDjGh4XOc9dL3chhSp1nwPmnA3TYpYMPzfiZqc9OvHO2sTglmthpTmyO9B?=
 =?us-ascii?Q?+p4Sy+V5wxYsTpV5IAqo2zvS5fg061rhKvCV3+ZXwY7G3QsbCcn1Ab/ZNY2r?=
 =?us-ascii?Q?oPcmv/iZf8A2b9XG4HAJXFowvsG2VYU6Y1J6BsGm0AcFdKWcXhsstbExwq4i?=
 =?us-ascii?Q?+ajZoc6sye+Bj2kfFZvcCJGEBUcsaLfUpONLwnnf4I97SlNHt+m6dxtOVQxN?=
 =?us-ascii?Q?EaW3tz/9mx2uOylr+E4Sc/hcPZat1YxcubRAtBi9l1pK76APgh/OAGiUTdy6?=
 =?us-ascii?Q?Jbs3OC0m67+fU61h2tBCOiBMVzhq1EP//ejD9F6fGYrD0QN8h05POueYHDnK?=
 =?us-ascii?Q?SUHn7mvA2o0cHhZ1mxovRANkccEKGLCaRjlpRpxwqYKBwB1l0no/mKfpooqV?=
 =?us-ascii?Q?Rry91I13y44JvGfgqutHeU7WO4OIzbMM7eqzlxxaAHilIAjnmiV7sF7xrFN+?=
 =?us-ascii?Q?ol65oOuotXtC/EUOpNEdHKKHlMPAY3ds+K/rY36qCeL+Av0X6/HUhWJ6mpZp?=
 =?us-ascii?Q?/co1iZAz+wLDc0wIPkVmIsJPUxiWtSwulR3dkZsEfZXZ2FWhWq4o4TcKjrBi?=
 =?us-ascii?Q?D3rPBMBaWmfljs5k7Ewi5K+qnXA2z66zuNPSms5mmM+cchodfRYVSDTZfbjb?=
 =?us-ascii?Q?JUCZcc6yD/oBwZzdaDKP44wZgGUFDcB4BQ44TmwG7aVMD+sQpKhzmLQtTGov?=
 =?us-ascii?Q?RnZFdfALOKd48H+2ngbyJ5+4Z1aVRWf2jZeRJw5CaK7tP+jL1FI92lgbTSQB?=
 =?us-ascii?Q?kgGPuz7B8+sjrT/LiHiFZ+GuTXKJYnLrWsOCEJ0FCe8Zw/lO1iaSFxC3Sy4D?=
 =?us-ascii?Q?bXDijttOp5ioxfM0Q+Bt8Xstcs2XV5yxWGpXnvzs6/79schvGvMVZyFcX6hY?=
 =?us-ascii?Q?+LMp6OMjvaHBUf5RoLBaGy8pKmQtNFGYTJd8KaA5JY5lOAklQUU1G/OAbrBg?=
 =?us-ascii?Q?K46+EQK1DmoeDQVzfADooQgWMwEdneol7yXQjWge5RYo6C+7/bbl5OIrMMcc?=
 =?us-ascii?Q?nbWgHBa+fAy4WxoMHTXxPCoU7eGo8UYhAsSvx/118tlSUvBI7JLYHUi8qZHz?=
 =?us-ascii?Q?l2ia+AwCAH6qyQLR7UVMP7fgJHtrnekLWTCxnlejJJqumbymCf32jrZa7xlJ?=
 =?us-ascii?Q?JwhKO9D2IJDFfQIpFIlRcvg/XEIU0ztUmwypWiul2wBK69pLmcTq/iGnG9ld?=
 =?us-ascii?Q?hlw39L7TxuixNaqTg97HpDdVGaIOEfvJAAZCCRiGnMdTiSBhIO3lpjlq7mgZ?=
 =?us-ascii?Q?THfy/uLQ/QoFPnN0txONgn5dgjr3+zCKGlgiDl1zL8kIsaFCaxdnu0Un5jzW?=
 =?us-ascii?Q?UP5NhbVzRHFwgeopX9RYhzQwyJQXYuMH5k412Oa0RoBTMz6G65m6TarL3GD7?=
 =?us-ascii?Q?t1ECNxZrfgmhSI4Oo33CJfGJja+5v4DwIv8F4VbAhZio8elXxwM7srbducvC?=
 =?us-ascii?Q?6ukZkSbHzIR0Jswr+OjJGn/B+DwF4df57O8HzELtu48NRkaYHw7GTIypK3JU?=
 =?us-ascii?Q?mGY5/dWlMrDOQCcmMVDSj1fv9lU8nJR79RB1bEAtOly9pMwqpCGDuxL9WF/5?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c578b4-f4a7-43f2-7d0f-08db0624b688
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:24:55.6009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeOIEywGe4iUHodyolaB8VLGq7K5/dKjglsKnFtsSBMfufrfyLSeE4zKNc0KF23xuuvg4FIropFcwVIMr72EsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 11/22] drm/xe: Delete debugfs entry to issue TLB
 invalidation
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

Not used, let's remove this.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 946398f08bb5..daae42d3ab3b 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -16,10 +16,6 @@
 #include "xe_macros.h"
 #include "xe_uc_debugfs.h"
 
-#ifdef CONFIG_DRM_XE_DEBUG
-#include "xe_gt_tlb_invalidation.h"
-#endif
-
 static struct xe_gt *node_to_gt(struct drm_info_node *node)
 {
 	return node->info_ent->data;
@@ -92,32 +88,12 @@ static int steering(struct seq_file *m, void *data)
 	return 0;
 }
 
-#ifdef CONFIG_DRM_XE_DEBUG
-static int invalidate_tlb(struct seq_file *m, void *data)
-{
-	struct xe_gt *gt = node_to_gt(m->private);
-	int seqno;
-	int ret = 0;
-
-	seqno = xe_gt_tlb_invalidation(gt, NULL);
-	XE_WARN_ON(seqno < 0);
-	if (seqno > 0)
-		ret = xe_gt_tlb_invalidation_wait(gt, seqno);
-	XE_WARN_ON(ret < 0);
-
-	return 0;
-}
-#endif
-
 static const struct drm_info_list debugfs_list[] = {
 	{"hw_engines", hw_engines, 0},
 	{"force_reset", force_reset, 0},
 	{"sa_info", sa_info, 0},
 	{"topology", topology, 0},
 	{"steering", steering, 0},
-#ifdef CONFIG_DRM_XE_DEBUG
-	{"invalidate_tlb", invalidate_tlb, 0},
-#endif
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
-- 
2.39.1

