Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040CDC30658
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 19:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE25910ED38;
	Fri, 28 Jun 2024 19:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZn3JWSq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79D210ED36
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 19:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719602914; x=1751138914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6u4YHv3+AurQG3FkejgcAjXBuoaULBzzVA+5LF45Uio=;
 b=QZn3JWSq4h2+coPPCVd8lcPFXdBoxjMqS1+dOZ4K4afi8s1tukHTZnQM
 ba3fzmFhKWcVVjLAOboqXLGVj6Y/1jlHMYGSS0whSzLdhdVQQFD6zZ6A3
 kyPijQo7QF0OO4L9x11BPUhQk+zNZwB0T9+1Gs2hQkP/eT6+xt5MoK5Iw
 nMGNJL9GJ64OOhSGLFzv8fDvtZjjUlFfkhYbDa0grnMokOgWcvo7liX+B
 AKTpmVeAwiVyr0ZEVexExutDgmCn0WytBjEu05Cn2Hs9tzmk+23yy0lIo
 oAn0VJCDlhboMzIhlZ1O3/IGynSHe/o3srpSVqAUAFZOa8xvDzKYJLInP g==;
X-CSE-ConnectionGUID: TzhJ22dAQMW97oCMIGs6Gg==
X-CSE-MsgGUID: P2N3jtRxQTOqMK19hWysPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27930990"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="27930990"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:28:33 -0700
X-CSE-ConnectionGUID: 1uQ+orL9RV27/B6MQjPSKA==
X-CSE-MsgGUID: Cc0jcCqyQoqQpasfalZpjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="45253780"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 12:28:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 12:28:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ix8PT2KayL4ALrE1Gz2dnb7aah3n0poDnvVqZl08p62Ren4xzy3TRpmcerozAol0engTMklEFhZt2kCzD4XzA1Qa0l22YfejACobQ7OBWPgrcB1xmJQ8uC+GRNCkxOepJ1jbwE0OMIJ129uYbLfExHTbj5Yu2eFq6nuOHyamT4OBEPA7vHkMpxfkLu+om/aDfvJs4kIjQ/ytOHwdDi8RnZYH26w9A5fSRizCjTaxNt4pItOxNzmAC5GaYv9TUI/GCTmZt+rC1TdiQ1xHXhHxmx7pLBrXmoClhbXY4XU2rV5fp11Jun9qxbEIEHwQZEPwLG+YoJX0PqupegFuKCQcpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMC25nexD6i9vqN3zAWDtZJ9h1D62akcpPLbDq67B/M=;
 b=d2C7g9YNehl3eOCZX1tVeo/y1Wr5vT72/1JnaBuP+ZCWtk8ST+dw3hC5TNLezu03F//kx/n4IKnCrdhG41KJXwJ6pFP1KdM3+2VJ+/v86/EVykz/u4V1g9YPFoOXqVnWRcwqGFBtzxl5r18Has4KhiOb5moiFsHiu8Ba44WSKorKpOuOjYGm3VM3cIs3W3K5VpONo6SSV3HearJvQFKlqeqR0e54Ff/egZA9VRmsZQUUf07NBPLnCa+2n18lOLlIHimkkptVxCZf2xvJXxTVdgDYZB/aRQ4mgcgh+yCy3fpItwVsz8AEIeJLG5MfZm27Y5Jc/QA88tPiQXCjvR0ifA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 19:28:26 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 19:28:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: [RFC 08/12] drm/xe: Introduce xe_ggtt_largest_hole
Date: Fri, 28 Jun 2024 15:27:49 -0400
Message-ID: <20240628192753.386137-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240628192753.386137-1-rodrigo.vivi@intel.com>
References: <20240628192753.386137-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0084.namprd03.prod.outlook.com
 (2603:10b6:a03:331::29) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3db99f-c2c9-42ab-e627-08dc97a87b35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yJroBrBZSPD0BcXRVlJoosE7uh9XCjMSptslSG46UEVqA6IryYoFd4/lEWAq?=
 =?us-ascii?Q?1Nt8qw67fJ3y5t1rEIR0HcX4xUZEqxTehH4jPVC/Ir1cC89MoXVyuTN2yLOh?=
 =?us-ascii?Q?B/1MHm0GbgkGfkLhNQ5PmjSLT697ZvcC7drFyHUf860uQIQeZyOyipU4pR7j?=
 =?us-ascii?Q?B7XhuRECY99857S7x48u5D0fFBcirtyeiWzf7Un5cMARTqN6CjVGVikxzHdr?=
 =?us-ascii?Q?kz+FxdvdhMTm5R6wqcaQQdQx0U5iJwtzmxgBmUDV4iH0MjpAGYj18QYXt6eO?=
 =?us-ascii?Q?OjAyfLtthVHlLQv4AKaaGS9/XqxFoWQ1LJO4c/0nQSIv43Hl+K1Hrj5dg6aQ?=
 =?us-ascii?Q?5T1la3Sq991qqtdsFfOsrOyAMVnlBIFiVeEVk/+tMoenaPtRUk8BgLcGTzbt?=
 =?us-ascii?Q?c5gCsrDtMme9ftL0+rWBSH60iEx75i/JvsfIdxWQCFH6GJTqfNLsEebUXBNP?=
 =?us-ascii?Q?yTqnh/CDYgWJXmfTGKXZHuft3FcZ5TBMGodhTlAq4FzynqZuHCTkC6f+v4g9?=
 =?us-ascii?Q?RJNYF+Dbge1jeVvneiHADT8BojH/hSBJHQW7aFs4/4V9Dt7eeZEHECd/qza1?=
 =?us-ascii?Q?pAXH/CBIMwvnR5O/vhqvRfA8QQWOsxAajn+5kcHIvEvk2p1/Kid1ObadyCpZ?=
 =?us-ascii?Q?Bh1VMu3QAikJOHQHrdmHi9O5veaLiko1b0Rn81qTBkEIMGYhmJ2bT+MbLgo4?=
 =?us-ascii?Q?q2ATc9TsgNs+pU58ATDftPSRBDcmnlKeU24KwPU2oDisVShBld/D9Fvey1WI?=
 =?us-ascii?Q?K/FtoI0UftJh1p7hZ+caXaHLLQJe82ZwnJ5K/lgham9UGVGQX6sP7sCH2U7x?=
 =?us-ascii?Q?AtwuqwmdsuJ2w+bjUrC5CkCyNHdq/XpikU2YvQ/gidYJb7N6yM1lcwP2064e?=
 =?us-ascii?Q?9sgv3lHtV+ZfpN/nS2iheZVrU0Vzz+EG5i85TNT8BfmR1jAOtngXXgio9PzE?=
 =?us-ascii?Q?H4cXhMzESoa4s8QPd0icmJK35eym8WPejmFWwo0w0t+VOYdym8b/Cvt+09hy?=
 =?us-ascii?Q?VGdesMQSYqjaxzBoxlKsQAneL+Wazts2Nj8ZfGMa1UyS5QPakJOQCfoHDf0u?=
 =?us-ascii?Q?PQMO3urdxV4yrBoAu22Vct3PwDy64AyGMoIhfH94tIvcWZPA4z2T80S3hssO?=
 =?us-ascii?Q?fZmf0yOe/DkqYFDdW2cF78wKM8+r/FI0K4Bs7Am64ojeVAkdzwYPpeHAoBsu?=
 =?us-ascii?Q?0nTbRzJWJ/GKRcThgp0Z/c5sHBdDkVv9vvsJ8XIN2aUfGVH+zCjsmGAJxwR0?=
 =?us-ascii?Q?DXiX2F43WUkNl2zGI+GBVcciHhf0bfZ4Ye1Uc0o5ZYp3aYdy6IVJitHqSs1+?=
 =?us-ascii?Q?jxQ9Hol629UReqPSvZ+WCBP5NUu0CUOtLJ/ba5BDPE5YXw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GC1yYjgalin1X2M2WQEJlTi3LyYfpmcTqZL0aZJW81WkZ1/ak5rgPaYgJP/l?=
 =?us-ascii?Q?Izc6oNfZiEY0sFUF/6sM+VMpokuSSSD5ojh2XMWrJ72kT32w1FVed8eDJlVN?=
 =?us-ascii?Q?VP+LzbLI7+2Ptu3dJ/q86251MkK5T71i+I7Va+fP67BS7xZZHDC6a0Q/OYWS?=
 =?us-ascii?Q?InNqf8I7TKRI4MBFxh4gRHIsTZhS8Ja2MQQFIOH/DxHQuPFybotg+BbMd+nx?=
 =?us-ascii?Q?yV+yQf5sAr3gCblpAQPV72DFyjcP3LJXvAwgG4JXdPUN0llB9fcAs3l9KnqX?=
 =?us-ascii?Q?hpwvDVBKL5OgjM4fm3KrUnKkXK9h+J3SiAinxoogqvndyDMh6LMticgvAs2W?=
 =?us-ascii?Q?GvV1SQNXGwxO3yOZAcUdP44T1IopAr0d7BbJE/80wfAhxLJojkkIFpgURJED?=
 =?us-ascii?Q?4cPaO5MQPu15jyxDIBaRXmFCnZM8WAOHK5J5I3Xd2WdovIo555u0hzpZLW16?=
 =?us-ascii?Q?CzR/ZgV5LbSSy3dcW1DSk6E5BKXPTkbGHX3ra/rNvusdqBTpKgGQ3QDa4MUu?=
 =?us-ascii?Q?LMrpMBZJA1nhHRIEntPg+YkHf3rtp0wPMT2NiQHEPQ2EQnPauAWGqo2hAhpX?=
 =?us-ascii?Q?kmdIq4NdlnC//K22f5YLdhyfpi+BEHYq8xfBXs8/xyFsnvhEE3nhgJ+X5gPH?=
 =?us-ascii?Q?JeTYcg9yhXvlYOwqE6l3g5E7a892D/wUnqhyQQQj8HmV7kdx5Lv71tnwWfmP?=
 =?us-ascii?Q?mj9Hbh4FYxqOC02XuqsPFK4m0JfZWNCLDorNnWl+tuBgumIFBZnAo50B9hL7?=
 =?us-ascii?Q?tPRJudyjBwQJsBVI1Cfas/yIJokVsYOo3Sl+snwssDUa1u7G2aZkPHq3YQs4?=
 =?us-ascii?Q?syXamQE/8XMDpHL1ZCT7v3iZApUoUk4nK2RjP0q2KCQVgQrBFqGBC/9JdcLa?=
 =?us-ascii?Q?vmmv+Bo1dOaRlSgYjpWwnMnMNxP2cluqWfxrP0Z1rbf8PTbO2Kxf04wU2GkK?=
 =?us-ascii?Q?vRF488FXPogln94+TYpFJhiSzPAPTBqgfrduGnHE63dXz+89Q0CRddOjzNDL?=
 =?us-ascii?Q?g9+owGBbrQT5mCmpLJ/Hdxksk10eSBwqyuxctkuYzXWPMrHiDt+gkGG7i9TC?=
 =?us-ascii?Q?wXKjg2LiB58qqVZwe24zXEQO5f/ta19Yg5PUoRND0TPJhCOfimdlMcGYLEbx?=
 =?us-ascii?Q?ZYZgQ9UU6YTizSzg/eeIGH0izft/mBT4kAZbygjPkNNwOB7lpkpWn6lB4g7b?=
 =?us-ascii?Q?+bZjwmi1X6Yj2WrjgamiBn7wO1D/eutHFKGQhRqCaNjQhQFOWA95ji1sEidB?=
 =?us-ascii?Q?6bYN8wJZlWdIdlayhW92yPARl9LTjFGXI5cCwr6Y+nakq1S2iDx/g4OTrYHP?=
 =?us-ascii?Q?Idll0PeAoN3BqxbqKsWwpo38JtmC4koY4VGo0pEl0162bts96A1dJfmaeEUt?=
 =?us-ascii?Q?jBTmn3ruu/FPJmz67ngblQiuxt7AvnhVT9kOWmbRD0zBrcA4L/R+zdOg8/Mr?=
 =?us-ascii?Q?uXyq5diuRpN72D6fqNo52vuhTk5F5zYovJps+KjiIAbk58hA3CiqKSL/FbHS?=
 =?us-ascii?Q?2LhmMoZbEIr0pv6Kvx9uTzRUgDZtoL4A70CTQD4E6JQ0e5oO2FfQf12om6XY?=
 =?us-ascii?Q?sik7Z++GiE4uMEeZEnqGmqZIM7Jk9vlerliJRowZMYqR2cdkWJUlDrhYD36V?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3db99f-c2c9-42ab-e627-08dc97a87b35
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 19:28:25.9013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWQ10cjLlzg7gq5aqFQ1fn3deeO1AVTVhFHfnrbzuNRPAcaQt7WY/9zdarzaLCnm1QxK5JEllbXmSa2xOWspxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7483
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

Introduce a new xe_ggtt_largest_hole helper that attends the SRIOV
demand and continue with the goal of limiting drm_mm access to xe_ggtt.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 35 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 23 ++------------
 3 files changed, 38 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 1c823919dabc..5b9f72bff7a1 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -579,6 +579,41 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
+/**
+ * xe_ggtt_largest_hole - Largest GGTT hole
+ * @ggtt: the &xe_ggtt that will be inspected
+ * @alignment: mininum alignment
+ * @spare: If not NULL: in: desired memory size to be spared / out: Adjusted possible spare
+ *
+ * Return: size of the largest continuous GGTT region
+ */
+u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
+{
+	const struct drm_mm *mm = &ggtt->mm;
+	const struct drm_mm_node *entry;
+	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
+	u64 hole_start, hole_end, hole_size;
+	u64 max_hole = 0;
+
+	mutex_lock(&ggtt->lock);
+
+	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
+		hole_start = max(hole_start, hole_min_start);
+		hole_start = ALIGN(hole_start, alignment);
+		hole_end = ALIGN_DOWN(hole_end, alignment);
+		if (hole_start >= hole_end)
+			continue;
+		hole_size = hole_end - hole_start;
+		if (spare)
+			*spare -= min3(*spare, hole_size, max_hole);
+		max_hole = max(max_hole, hole_size);
+	}
+
+	mutex_unlock(&ggtt->lock);
+
+	return max_hole;
+}
+
 #ifdef CONFIG_PCI_IOV
 static u64 xe_encode_vfid_pte(u16 vfid)
 {
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index f816b3c0732b..31060fe7644b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -29,6 +29,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end);
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
+u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
 
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 1b334fa01b07..05cc3e12a75e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -590,30 +590,11 @@ int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt, unsigned int vfid,
 static u64 pf_get_max_ggtt(struct xe_gt *gt)
 {
 	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
-	const struct drm_mm *mm = &ggtt->mm;
-	const struct drm_mm_node *entry;
 	u64 alignment = pf_get_ggtt_alignment(gt);
 	u64 spare = pf_get_spare_ggtt(gt);
-	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
-	u64 hole_start, hole_end, hole_size;
-	u64 max_hole = 0;
-
-	mutex_lock(&ggtt->lock);
-
-	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, hole_min_start);
-		hole_start = ALIGN(hole_start, alignment);
-		hole_end = ALIGN_DOWN(hole_end, alignment);
-		if (hole_start >= hole_end)
-			continue;
-		hole_size = hole_end - hole_start;
-		xe_gt_sriov_dbg_verbose(gt, "HOLE start %llx size %lluK\n",
-					hole_start, hole_size / SZ_1K);
-		spare -= min3(spare, hole_size, max_hole);
-		max_hole = max(max_hole, hole_size);
-	}
+	u64 max_hole;
 
-	mutex_unlock(&ggtt->lock);
+	max_hole = xe_ggtt_largest_hole(ggtt, alignment, &spare);
 
 	xe_gt_sriov_dbg_verbose(gt, "HOLE max %lluK reserved %lluK\n",
 				max_hole / SZ_1K, spare / SZ_1K);
-- 
2.45.1

