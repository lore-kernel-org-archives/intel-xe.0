Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5609DC4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 19:35:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207A210E651;
	Thu, 15 Feb 2024 19:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ff6IZpVF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FF110E651
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 19:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708025720; x=1739561720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PNEcRH+t7aRctaMLgJ8hHg4v8YHVUdfDJYWJpweaVSc=;
 b=ff6IZpVFGnmA/vFqFR0FxgWtixSyLmpdXrvzfJMZovKu/tBlXAqdCj0O
 btXczSnwOYCt7fs4Elvt5ECkSqmFdP3hBqgy1jw67qUX7nTKFYu5P9E2H
 P4o9wEHZxVgPeAMQvVAnFVV2b9JF9tVKs7ECcnsizaJGRfB3Xjde/HIv3
 4jfVFicl+wq5qVGAKrjvVuUYUg7Ojc7qMsiVH4RFwvLvYoHFiA5glvtdX
 Ws3s1bxQ5CvtJkHUnDU0BC61LpfUPBcJ/MdbNfwKqYsHX0c7e+BBTwUtz
 E404bNUgNtCMgV6o2/ztEtW6o32KF0gRLil2YSvvGlQipC8tKJAte/C1z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="12688111"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="12688111"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 11:35:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8230762"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 11:35:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 11:35:18 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRlSXApi36wF0o4vsnOVt5f7IQMvRo7jfbNC41Kfm2j4T3JjT/mxxWCiWMtGjEROC0uL2tl5G+jbE1ILP/E+2r7lXNOqdmDwOxLNb0NOfrBegEZOfqRAeezeQooojpNsMUzEj/Haw5+zYDcxdypqeAWLcXBAq7US7CZjAYpX4MKeLatNqN+f4uiZ+dt9vRxcb21ytCZhAbLnu0wcMhYcelpoSjBKd6TLmeGZIEW1TAg1obl1sVVQakmu6AeMVNPPTlGE2/L8atHH6hRFOaVINUXyWXdJ8EfI401pYpsPT/o5CpOFBrH/4honj6LDKBJJM4i2zfYkE7L10+n3PbVXCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8mmH3xndoyafIL/FZPi6ue5EL3NxrMysnHmq3msyWU=;
 b=dMQSuOyAq5imesRGkT8IWdi5h5FAmj8Nek++C/JLDUAZBd4SiwL4lQwyV9Fi+/u3vylAoDlZGfeXNfui0dgxzC9GZNS8k4dsLT4dpIh/WHW34KQO10Ap3vorG1/b4UVtFr5VSnLTAzsZDizjBd+bFUGvxbQQTZFteV0z1O3wEj0D8TFkwfz8ZvNF0p0hFLNl8C4U+etdv0xu5UvxGJI/8PefoqnvlSXaL4cG9YLJ8Hfy457/3yxu1bdi4SlJ4EOqQ1b9dSmqE9jntEQyMxef4CKhLALP5HU5+zpAeWCXMxXOKqOCLCSstlQFnKVIq5XAOfufJSHNGl+2BobZ2f4Jow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7707.namprd11.prod.outlook.com (2603:10b6:806:322::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40; Thu, 15 Feb
 2024 19:35:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 19:35:14 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 11/14] drm/xe: Convert gsc_work from mem_access to
 xe_pm_runtime
Date: Thu, 15 Feb 2024 14:34:27 -0500
Message-ID: <20240215193430.130106-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215193430.130106-1-rodrigo.vivi@intel.com>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0012.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: a912a343-1ce7-4734-22c4-08dc2e5d3b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zOpxIRaJ3piIpgFoiOyodcTQq+a81/6+UyrrmJvmsL9Kk9d3gkXyMCNd4K/W1cIL1sAFC4cRhFsuJLaO6lDZTbrgvCd/G88rexUIks13A7ZN5dH7SU/vAZrFu9lGZKa8FEa7/qMI7+px0wfleQkirOCETY+ONPoNnJd8Uc8CDapGehiXhKh1MiU8XHBykiE1LLZbmeJoA2Djtw3AEZreCzuSUUAyG1LQ3k+O396hYGuEHw15mK0YWPKDCHwAfJBOmt8A/OTKHtc2xSgg6QFxmWW3m6Rm9XtgGJ+LshDM0gh9ySmc9Ju1GKOyKfojnoeGezD7bW7guRu/7iXIYLFqRqm4q1D9BEu8piE/GwE/r2Gi+vQg6dtQKdOUVMwcoT7AZAm1In31O06SS48J8AwQW5RFkEsGyWK/MfpVgkmvxTWTq1TPb1USdG/p3X/AaRfeIklcsh06i1mJOzMAMT4n0ce0Bci3LHGilVxkETx9YHxbEKfLXLq0hz6ShSS8T9eHCZGaVgr55b3MyuO1MANKh2mg9IAKfI6aJAeffF4R2SaQlfHvsQ3zRRoTOMnbm/Ok
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(396003)(366004)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6916009)(316002)(66556008)(66946007)(54906003)(66476007)(41300700001)(8936002)(2906002)(5660300002)(86362001)(44832011)(2616005)(107886003)(26005)(6666004)(6512007)(6506007)(36756003)(82960400001)(1076003)(83380400001)(8676002)(478600001)(4326008)(38100700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vdqbVKI/nBA7xg+ke732UNvFwQWm6AEYwUbg/v8dF5pFn8mffhDb/mWz8e7X?=
 =?us-ascii?Q?IpHS5q7Jwdb6S7fEcmbziFMwDUrlfuKTsGVF9j30Glnv1bs2kEzbHlWNei1r?=
 =?us-ascii?Q?TE+sYd9gJcCbzgkVjToKpAszGiAosboynoJkQbb5k+G+GDVl0itXQ2IiPiCm?=
 =?us-ascii?Q?OiuIu4ZtysqCB4XXJFdxaFhjKo/kT5gT5U7lgeV2dDXHbkK7mtJMtGXV4z4p?=
 =?us-ascii?Q?72G0LjlY0LpQNTqeBKfVY3vr1n/1hHbva6AGd4nRJdZnDNckJBKa+71tSyIS?=
 =?us-ascii?Q?hUQ56caxQIhZcbay8ZdXUywgv5smA6HlxMXkkevpOBghD6HPX5nGp1Gql700?=
 =?us-ascii?Q?+uQbdjAQj0WpHxgUlX62C3z/ZE46pjCF7IU1mV9Ji1fTIOJaq63lRSZWSylQ?=
 =?us-ascii?Q?/I7MrCV4QxdLFkCw3d6ir8/3hBtBovDGQb8pibskxOIF9sF3Ns9nzGrOfB4R?=
 =?us-ascii?Q?0pYDCI0Ve4PvywbKD6TZLppZUCCUj6zXSYaG8/1X29+l/TCFHih3WLvGo4vr?=
 =?us-ascii?Q?OnPZHfU7djg1LsjH3Vv/ONAjOwrmAgOB/EvFgo9uYfs39pM/0H+ey62vunLO?=
 =?us-ascii?Q?WrMt4ouAHXNNIcJ8Oe1koL60teIfd8xMSQkuKFvWsZar4sXy5djBoXH7Sigc?=
 =?us-ascii?Q?ukDRdbWWznz/z1J1XL7gaoGJkCvKKcS6F/aKuo5KvZCQLwwmszQStVpIcpAt?=
 =?us-ascii?Q?MDq3AvBNXdQfklwp+HQHewnnn4t+JyXG+Ky1/A758qpdl2OGYTjuqv5oJVD+?=
 =?us-ascii?Q?OYxBtQ+TBvKf/RwGEjf9OhFq4eYyrTefQr2Y2jV+C1T9sJmXmuy1wwZ9znqA?=
 =?us-ascii?Q?ksUzucfBDJymY8WIy7nzdDfMdjv7jO3FSZjwxwWsRB2Rtb8JzycvjdOW4yr3?=
 =?us-ascii?Q?z54EW57F/FmFgUhr6vceOPcarkVIuYRkSRNFzV2AYSQ/9v5pvwmPHxRLYCQv?=
 =?us-ascii?Q?7NKzJ1r0yTO5rSy/SbFPTr6ySmd3fTrr6ELaTC7uZx6Njl+wGu45pkcT+2hi?=
 =?us-ascii?Q?Sw9N+xnKs533vdW+/gPSgJPVRDorcZX084x1SVQvwx5cjI5kZ0C+o02RS1VZ?=
 =?us-ascii?Q?jAPRBQNiSNMum//vd66zK0bLUp5yjlciH4N1TiLqsgQ9IA3UfuTfrIKGDgBV?=
 =?us-ascii?Q?B8aYHLetQifd0e5pQLOrmM2g+pFrKteqMVeuuX1A+t9JJdzTMfAKxq6kwJ7e?=
 =?us-ascii?Q?RjOZGZjok1dm7TtOrGz5aKcHBgh2Jy1NosvkAnfmuktGolcElPOPsB+9i4p8?=
 =?us-ascii?Q?Zwd25r6u1vUYOZ+TYs5OizP+JAbF8Rp4e05c7To2uluZ87cjFSk1CqnZkmGi?=
 =?us-ascii?Q?XZnRdTvCiFAnwIhA78JMWMjgAXJ57bUNTep1EUy1v9I3nPYJTbW1MzBluK5G?=
 =?us-ascii?Q?Q3r6aVf4n9CsZQpXafoLxcxz1qdUVOY1JTNb7zUMvjmRGeQVEbt2cAS8OK2P?=
 =?us-ascii?Q?bVetPwgyZv1N01a/BX+UY3JLDKo1s7Bn3G1KlIiGEO4kFy2EsldSb6elp33R?=
 =?us-ascii?Q?b0kDjQY1Pt0dnMxBdew/zk4ewEF9cKFfMp264oNff0uaVUKdBaNjAcmUkrIQ?=
 =?us-ascii?Q?7AuCQicc/Wwf8bsGAuAL6oClfHAfyVLafCEedgKUgs5XrUplMCkRHS116YQf?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a912a343-1ce7-4734-22c4-08dc2e5d3b99
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 19:35:14.8234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arQfQcPtyM9Owzk1/PD56XOWWYusULGE3FdxsmqJpx1okZShBZqGVVT2PtEdp5GhUPgTQBzxCiqM3qPFbcVOXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7707
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

Let's directly use xe_pm_runtime_{get,put} instead of the
mem_access helpers that are going away soon.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 0b90fd9ef63a..904026634991 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -20,6 +20,7 @@
 #include "xe_huc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 #include "xe_sched_job.h"
 #include "xe_uc_fw.h"
 #include "xe_wa.h"
@@ -284,7 +285,7 @@ static void gsc_work(struct work_struct *work)
 	gsc->work_actions = 0;
 	spin_unlock_irq(&gsc->lock);
 
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get(xe);
 	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
 
 	if (actions & GSC_ACTION_FW_LOAD) {
@@ -299,7 +300,7 @@ static void gsc_work(struct work_struct *work)
 		xe_gsc_proxy_request_handler(gsc);
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 }
 
 int xe_gsc_init(struct xe_gsc *gsc)
-- 
2.43.0

