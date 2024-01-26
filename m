Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36B9C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8486410E2AD;
	Fri, 26 Jan 2024 20:31:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F39C10E2AD
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301110; x=1737837110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5R3pEYIwH591PFsjPSM2r2Pw/TNU72snOTa6rjOUquA=;
 b=gwedE8i63q79JNmbL5xSxK0uVJQLzV2EWtLhJz+MjMlNaU71bsacuA8j
 3akFRS120ZELE0ID2sGFy+tOhzczeTU3OKbRbSz+D9WrQpykPJlKC0zqM
 dLwykRhtttvtGHWtsocW28CnKiBBVBIPsSzQLKvVftnU/HK9pECHUBqn3
 X/xvUH30xVLSsswmFK9aNQNN7vy91YaPOHPy+Wl6Z7kqyeCtQS5m/DOk5
 FOh6RVDRHjfAaW7rPvfCFBhjMMNThk4vYMy0FYDcZDxYQrUGr7JuXmSp5
 IRvx0WTwQ/yJLoAJefHFs6Cf3r6AHIqWj0TLCfZXip6/eicUfBo0P043H g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2406249"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2406249"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:31:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="930456219"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="930456219"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:49 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:49 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:49 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:49 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOd0EmgnbYYsLKiuDVW6szaB169c9IzMA6fZh0Tdnh8JD3I/M1MvSah4U2fvTpiFaZbtf53Gu/YsklVdQIRSoa6TAIwH7Vq5i3t6FGJ5Eyi8FTtlYD4Vil/8NmRrY9FmcIXXzpqCK5gsTNC16fZMKgZVu7r1pD2KzCOo7+XG3SBcNob/YxA+8xDrfwwFzA8aTwU06ugd+lJGbZwCaB1A285E2WXaQFLkMbOlX6AiAk4MQuAEg6eldv2Ye5Ya+zHY/2tJPGiaXjIMkLu5L0ZDFeKNFbWis0GUC8tW1c9BO9pcIpGejNuZ3HGm/pua6qtqc2Iu+c9pIyidZ8riuoazww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbTscIFyyPPwZL5I1WZjx9DDDLuV/rbyaHZ1/TDJp+g=;
 b=FtpjBxDG5wy/srOYure68+bqkLiNzWKPdOtVO0FqXyN9JSvoeXI46fm4S5Hi2Ngrsv9sVYYexMBGsi+KNrEMjALa/LjaaToWW91Xbs4lT1qWYAuGbpFZf1O3yfioGLdaA12ujUbZobmLPCx8+unLOiPO80Gz9BAZxsF5VSuuNxe7G3JN0kcneFryhH3SxhGRPYJlqARBCaSuYrQPSG7jgmAc9zVLfJYAcs00K3aWitc72+R5bzjoUbhlwcXstBH1EguM9bR+8lyDZwidUvZ70RvrbJ3z5lkJQmr3EsIuVGWXmO57FJ42dkCAJA+xL5afppsV0T6b8t60fylfnhQZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 20:31:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:33 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 15/34] drm/xe: Replace dma_buf mem_access per direct
 xe_pm_runtime calls
Date: Fri, 26 Jan 2024 15:30:24 -0500
Message-ID: <20240126203044.1104705-16-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0389.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d878162-5036-4acb-eeb8-08dc1eadc96d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NA6fe7LNNqu54xnYy4ZFtAyRYuS9WyzBysVctXnfNSG4oN9kXYndt54IhmuLmesOtQxv13HoPposPD5km7ko/iZSaGZvp0buQ4a5Ta2n0zfZL01g13Go5yG4mpAWKYZ8GRftCM3MofhT35YRhzdUizhzR7odLmxtVY0S0P9WozhD7gOlBYOz6oI/Elyp5WXfgyHUb2Do1zlifJAp8b7N2qf1aICofxOO24LJ4AJW/gCTFLAJFHyrqbGRo/Z1MRpRJPK6QdHoR6E8/h3aywKcNWHbbMjHq3Vq01zC5WW2y5irtSM/6x3SM7XcYoY7H2GI7nE2rAYIjelBBIvNwC72bapbV13vaK/zZrhmEbpfR5Xemb1qwj8gcHd7ArhiF8478BAo19WcLygvD28/KeMLPyr1uJAgwZRjtCwf1Fnb6Xj4If8jbeJ4XUvsj0hWRgi2l3sxc3Gz1kBojs1HeTbj4ZI1A9mAM4ERwgvqxoy7D9n1SCPepY8h3FnlKlQhl6hlt3UO/OGYnsTjLgluUVCWzSuC8leUNh7HZwruq1dueeerrteegTzAkGxLmNvumPic
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(82960400001)(6666004)(41300700001)(6486002)(478600001)(26005)(44832011)(2616005)(83380400001)(6512007)(6506007)(316002)(2906002)(4326008)(36756003)(8676002)(66556008)(5660300002)(6916009)(66946007)(66476007)(8936002)(86362001)(107886003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iX6DfIgKlpP7wSXAYjx1rVX9rs2vGGMdn/rdhAkhUpwWZxLevXiCHWR8WBB3?=
 =?us-ascii?Q?ZTvFHRsn3sYdtgt3h222oNz6Tb9741WX/n4QtiDIodtITLesBp1xhPK36M1+?=
 =?us-ascii?Q?Zl/DJ9sH+PDeBHpvuOdCu6cnyodkJ3MVsJ2hJPog2Not5cfQmVWAnPu0A3od?=
 =?us-ascii?Q?eSyI32KcW08LWfxGODdrZQLDCv2tYVOxmNdTePxNBRIHC9jeeMnNpiz8CUhU?=
 =?us-ascii?Q?I9cEiSCybORY0zOfHwD8ANcr/SkR1Ye5jgWnQg06d8CRAvDBB9GiK9loO63W?=
 =?us-ascii?Q?/SQ7dFzTdbRzibyiu+xmKwvBXaNaAHYZCDv20CUtAl0x2f3yGlvsV+ywBGgz?=
 =?us-ascii?Q?2S3yDzX7ESUll0wfFLOjM36R5x0MvYUZS2xq7RBNDHdhKp6erq/+PWeBROFe?=
 =?us-ascii?Q?dvZfxgCuuxU4Jc/Q+vN1ezkPht3byila1u3Q1gwmE06NgE+x9bsvsHF08VzP?=
 =?us-ascii?Q?OgOLQkUKAhXxtYJypLc8OoQWQUxgAqA1a2ZpDknslFh4TWTquoRc3bS57rAH?=
 =?us-ascii?Q?C3k2BR7QrCWYUo+8+EHbn35z3LSxIqBDu5xqND7s5NzDBz+jWLkvO+ANLBJu?=
 =?us-ascii?Q?Ko5YZWIipNn9q8sOCCzH6QK7HfxMME30sbZBe7ZrWVsD9MhAxdi4gDyTZ/VR?=
 =?us-ascii?Q?f2DJNl8cBtq4msL89E5LpMpVVJhLkhWfjHhpYi9CkW7RTY7L2ImrS0kXnrAW?=
 =?us-ascii?Q?na3C/755kIlMYdr8C7X+foKo8MDgOUNefMM6CSFZI9Q6J385PykHF8FNgzCO?=
 =?us-ascii?Q?rtrsob28ndJz+5htBYW48Dr7xAnMxrGwXu1GdqXayJFpTNpYWS3f00k0qKqJ?=
 =?us-ascii?Q?jsGzWPD6FCjbliplBK7F2IuVg9DRXEz+pR25A9ttf8F8zEFZMApeegELG7Bn?=
 =?us-ascii?Q?mduJ5zY854R0KP/dz+YkEjsKls399+jMHJOcoHI4Dmn2CyB5CylCQnwdfaBt?=
 =?us-ascii?Q?mi5N0Q+zclAnqlr79o/kQtEFRpAdqfqUgbEN7oize/GK9xUkERKC+Q2lth+u?=
 =?us-ascii?Q?Ao8Z/I3aeIZ+6T0oiXL4leqLdYsI5veOuyLJB6tAN6GAmwj7CEVHK4sy/u7S?=
 =?us-ascii?Q?fBfJpthYpd/bhl4C96Nv/58oF2PTVpMoMpkN9V0ZXOu9YsiNAr8L08sjP3Dp?=
 =?us-ascii?Q?CyrIdEgmHMes7UbqVDTI4H3ooYDKNJQLaprOLQrXEud6q6vWwqDH6OtW6Iev?=
 =?us-ascii?Q?/Aym7k+SmaZ9K4RCtV/37V9YpXD5uPjDq7SOofOsfOgwkDgMNqLdMnndIHcx?=
 =?us-ascii?Q?hIrpbtmW2BbVAHA4xEUXgqTVtyYsbmQLZFdGRjrH99SkbHueeD1J6NZGqtf+?=
 =?us-ascii?Q?crmY3vxPik5szDNSbtHyccAm07naEZ3VtcS/gsHMai0pSmf4LPzZfUlLQnNf?=
 =?us-ascii?Q?Z+jQPOPCZDdJ4cK7ze7CLGXFXTGldra+OiIuHqp14cNlElEwpqdkNle2hcUy?=
 =?us-ascii?Q?78IlzDsk6ciZ1N3qmgrPthP9BR0NE0MSM2glnM7pFCnq8u7dvG/PUhrA2bP1?=
 =?us-ascii?Q?jCXu+lVuGQDDZrTi8M3VRw13Y0Dk3MGb4Re8acCnwcjWKJ1TpRvU5fX2kOzV?=
 =?us-ascii?Q?cJdu5/HjoWA3hP7FSLmCnZqVbO8QiyO+SnXPkIbfB9j5Bmgjj6ZR+CismEDU?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d878162-5036-4acb-eeb8-08dc1eadc96d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:33.9602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2k7XZXfD9ehpaJd97k20aECeNjh8VFBLFC4FRLiiQ8PIbzFXSClG8EBtd5f6zxHjdwKQbRtmp346cE7wFOJMg==
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

Continue on the path to entirely remove mem_access helpers in
favor of the direct xe_pm_runtime calls. This item is one of
the direct outer bounds of the protection.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

