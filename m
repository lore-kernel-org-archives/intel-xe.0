Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8770C4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 19:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D1D10EA33;
	Thu, 15 Feb 2024 19:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLznAMF4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9D910EA35
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 19:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708025710; x=1739561710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CwN7CNEg/l97uSCYCzEBDgbwLQeg+mmNCJ+HxkB5LVQ=;
 b=GLznAMF4Uiq0tvixybJGqQOdxanoFUgTSITEURnIGxc9fRKsY0gLeapG
 N0DyV8wm7uBLsDmlQZz2cBQ5EO6nrS3koZ9/4UYVkCyBlINqi/QUUcWXX
 ZNHzx41IVl7xmo5LhQo0c6OB2n8slKuukoRRJ9ZjO6cpRl7gXbowOxxFW
 1U5eevkWiIqnim1vlDXxjNNKm076jiWrmUd2HYpALm6LqGFBjs3zHPxuJ
 lHUvPeVkxlTXPBNSXfis5BnMZM1rkiAZ5dH6uHE4jIYvA+/tPA35fjK7Z
 bMOkARCof8nNeGHst0djAeQEI+abisnGZzYK0qdgMnyfAIztq23jyZHhf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="12688085"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="12688085"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 11:35:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8230653"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 11:35:09 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 11:35:08 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6Ae2Q9gI8WHluLGio/xE89Izg8XBnsbJRKFDHXIXO0CcdtRyXrJuVtDizLvcqrUqFvXLU8DPPSMpUdHN3mmR2l3W04lqmObMRxQpK9ccsJ0Si+i8EaeQdKWbdkXsl2e41MNaIa6k17WxS2DXS4wPB2NfG+5cvWzZIjHZa4J/hZSdMZTFrs5guTsJG1a0bcShrBueY0D9XThvrTaynRyF8ALMVK/ItdHrRseETWJB5JpLR/yIuqWGyomatdpRwdBBayrDL3eexOKZJbl0llFfXcCL4IKRFDE0UNsrTRzfMjt0yqxGdZOUmE06c3b9/CA5zsNHeekvQtWyo/Cz6CTtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyrrGp3D5OJOqByAQu7XZfiKgyJM3ZJb+8y+wrb+UEk=;
 b=WeN6q/Z/0lFex+WxrTxSAFa5Jii8R57kM2CCL2jtzO+/bXIY4kpUH+1DUC0C0MwVlAaCPMglE3CGGoH/JykLlW0l0VLPfv6eocD9P1zZDnVfCHzGjj8wT+AB3FmfpJb++KE952Aaedh7l6/RcM+jAxfKLg/LyOmTdrT3dvoWtvQnO5UtwvDbV/QIpDTYeIOdrll/Tr+Jzc0RhZNorbvmMcqEpLxhG1eW6MEYz/FcDvBoBCm/+ib4sGwbxImHTLULhTnO/tklHlMd+vLoS9gpnkEF3TOhiMUEsrot/CnUM8Z08/nni7SsyFAawNtCqmU9PYVA+gGe+kEiVEE3jEhMgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 19:35:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 19:35:05 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 08/14] drm/xe: Replace dma_buf mem_access per direct
 xe_pm_runtime calls
Date: Thu, 15 Feb 2024 14:34:24 -0500
Message-ID: <20240215193430.130106-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215193430.130106-1-rodrigo.vivi@intel.com>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:40::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e88b414-b3fc-4cbb-c826-08dc2e5d35fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tjMM/5XAulwqu9a0d1yjQsOaRHLP6RSZzbJx8r8l8y/i0A980ScWnrGgN4EW3vrnfQBBMteFconOnCtracLoe7R06NfWclsHGQ6Fciqtt+ExmsA4kzXcppNU4MIMk5ci3VDV8BKLNINLIFFz/h3nRx6hnU1718/QpeJBtPrBrebCjX7xM6yKC4WUgt51KSmvMroVDPURYPfkFqBVNyDZEmSSFchNWxB2wD4IRFdg7KK/WcHiCmv0L3l2mTMhXOyxSP2wZaCfDB43AdAacw2P/RJxS1nRuyUdaaq4+7h2B+81JRpU508HfuVcBeKAq6TD6gTgHu8jTEALazzHIRJqDg+18ZLeAk6ayyg69ng6KjV6SQjeKms0VXVefk40e3T9NqG00Uiz72fgXD6SqgVWemasKI+ZmNGnVe/9vaR7VDpFY1YnI3kAWxjSqU88El9NO5mCl2t3CCIVjwnA+nXAsweXUSLUWtD6XmbYjN2dzC3F244/n5PhYXcgkuaO8oG7sXBfyTyf5S68CN4ZcKmBdu/29RwPcOoUBI7snLEOgNVSpFp63LruPlQaT/qNqPWg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(44832011)(36756003)(8936002)(6916009)(66476007)(38100700002)(4326008)(66556008)(8676002)(66946007)(5660300002)(82960400001)(316002)(107886003)(41300700001)(83380400001)(1076003)(6506007)(86362001)(6486002)(6666004)(2616005)(26005)(54906003)(478600001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N6QRPwI2j0Zers4csD6nwtFLr1ZL/+uj6pAK/Oy1pP4JSfVvXL6OFiRs0aeB?=
 =?us-ascii?Q?s5ruGpFAt75wLrksdeqYZxNdYGIZbqdRYntjp3rSVGXFMBidezdr4OoygHAF?=
 =?us-ascii?Q?vklEAZNgU7tYRDGrNEUlX9XP4hj1j4S2Ms/lPl/8xuWAkBMobN04NnLy9ysD?=
 =?us-ascii?Q?v4VXOM21/gUqu88cxsbScKjiWNh7K9CLs0gG8EBInRveNAuV9n4dURf5KDkZ?=
 =?us-ascii?Q?v5i9ZSijuP5D2+KCsSNqXanX6BanRhjiKMP6K46UZJw6im4hnnGKRImCdQhA?=
 =?us-ascii?Q?oJqaqmoFrAtt/dHyfnTUbYN9X+QztVvZZKpPOM9NpQlGn80dxIZbjWSjmdxv?=
 =?us-ascii?Q?asHi+syRZXP7VYv8Ljdz7t9W/XrQK9lb7ALUdewuGDsvyLbJAjEe9hpMBiF/?=
 =?us-ascii?Q?dNv2vQutIlkci0H96PaImAEBkz/B9Rvr9B1yW6Q5yxwQotdl1QVgIEFToACX?=
 =?us-ascii?Q?zpKLbAN8u5218tVVeeCqSXerQXAqJCvQZhrw/x4aH51QeFWWdFNbjSC7jjLk?=
 =?us-ascii?Q?v7sMXG40LGASisn+7BpDhF/Y1ct4XgeJDKvUE7ppvn9XmvQzr7opMC/VSq2F?=
 =?us-ascii?Q?cIHZRIsQSnmvDS2+/Vow9RiVAo8gIMzpRMpiPedz6XYVZkojc2EgMnDmxFNI?=
 =?us-ascii?Q?y5Cobd4JdEXWFW79MZGMBvB71i1RC7dMoojElFpYEEUJNnz16vQFqfWQlLPU?=
 =?us-ascii?Q?UVMW/n+C+/3Cq1LwmSjIeHpkRoJj7bbRJQYad8jwmW+Lp/gHOKnwg7R23KE0?=
 =?us-ascii?Q?t0Psn5nJ4DZPuOmPFr7xY/8YJo3ObvzVgEfS9i+Cfb5EeYOFrpGgAKdrLUmA?=
 =?us-ascii?Q?6l2Xem1YNh/wW9jC60NQkh8uOLNoeNiZHFLU2oM4yRtBlwpNxzN0y4NUNqUZ?=
 =?us-ascii?Q?JMS1oSCI1YLSTI8sVcK1A8jRJLZaiylFSABZNy+K2dhNJqz1eVo7NuJtpTNU?=
 =?us-ascii?Q?+3cka3WHqp0yykZbON2suqX24wj9JhygCVoyTVi/D9cw7ILBHYkHhu7Fq81G?=
 =?us-ascii?Q?PMWxRE1hbsOtTySOinGFspm3uT9PFrWIXexa7suIF+J/160QM8FbDtUuTphl?=
 =?us-ascii?Q?f/aRb4y/BEFqDrKuTV2gsfAS9djMVNCiROzi5GbKA3pzYdvOqMAQHH6S2L2o?=
 =?us-ascii?Q?PlaLh819qOEQWiKKwQy3VltzpWqJcC9kxZz6LtrMLGPvBN5oAMxg8WCdHBzg?=
 =?us-ascii?Q?+qBltjHdCtFPFW1S8Tz3tPUsA8WA+l4sxYF9HjAzltViPeh7EPQqFjLNrxh+?=
 =?us-ascii?Q?9BYfzelvD4ep4b6EXvT8YEAVm1LYAN97iAOJWDhYLLZQJ/9Bup9djjK80YBG?=
 =?us-ascii?Q?1kkJClF6mRIsdU6OguTD5UzhDEyrqBrejl1pcsR4CLtS9nuHCelyZnK06vs6?=
 =?us-ascii?Q?RM7roQie1Krbpi+Tcc1agVfQ85keOwF8aKESy7Gz9bNpnMV/3qeTqFntHqou?=
 =?us-ascii?Q?ckqFmKcLz9QGdpx8DfhXtH4mHvz7kr524WQjbm0DrLN//yhInPPCAtm3hLv6?=
 =?us-ascii?Q?KSpWDX7YjZBVPnjAUHG/0OmlSrbBdCn640DYlc4dv4CX7oKdtLY99LRFJkUr?=
 =?us-ascii?Q?H7k+ry2MmfRmSzwbGxdUIf3ahOsuJWQasOaSKdCZCLmbxTM/FNrfKcxwRbiI?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e88b414-b3fc-4cbb-c826-08dc2e5d35fd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 19:35:05.4688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hr6dejyvFiqLKYfkMxsRe3OH9c5MXQ9VfIohCFZZKW1FmPL+SEx38SLlFmqzlLjuQcIIZ8jaHSGah/4911SMfQ==
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

Continue on the path to entirely remove mem_access helpers in
favour of the direct xe_pm_runtime calls. This item is one of
the direct outer bounds of the protection.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index da2627ed6ae7..5b26af21e029 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -16,6 +16,7 @@
 #include "tests/xe_test.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_pm.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 
@@ -33,7 +34,7 @@ static int xe_dma_buf_attach(struct dma_buf *dmabuf,
 	if (!attach->peer2peer && !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_TT))
 		return -EOPNOTSUPP;
 
-	xe_device_mem_access_get(to_xe_device(obj->dev));
+	xe_pm_runtime_get(to_xe_device(obj->dev));
 	return 0;
 }
 
@@ -42,7 +43,7 @@ static void xe_dma_buf_detach(struct dma_buf *dmabuf,
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 
-	xe_device_mem_access_put(to_xe_device(obj->dev));
+	xe_pm_runtime_put(to_xe_device(obj->dev));
 }
 
 static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
-- 
2.43.0

