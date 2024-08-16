Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8452CC5320D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 15:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415C110E7E7;
	Fri, 16 Aug 2024 15:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lxy23UQ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC22B10E7E4
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 15:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723820592; x=1755356592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZfD1C0WX9+MnqypyO+eLcUOuwlX18MApOz6+4KQALmU=;
 b=Lxy23UQ/Rs9qro/pd5l7heKlFyF+wuOKfTaiEFkk/MhOgZ2PaZSIAk+3
 1LnNW/vdC5Wg3Iilx9WNI6hbxPgAFiaJyMe+FKvZq/y1t3f3g/K6rTjeB
 +pu3nYO8t9eN2TlVRy0Ub4oFRVR1S+rgBwaHxnicKv/X0fzj/0BiB83xW
 EIbFJgrmLcWDHQAlsx5ozyeKvA3XtI+fu6BfaeNkCf1A+vj60s3lbb25x
 cm0/SJbTugUTdyFkbhXTrrASG80cDuxZppHVkTcQ4kUimIz8rdr0p6TNJ
 8/+YmoslCMOGfI6czqnft2WMogA7H0FzmKBZrJMuLJ6f4nOG4nzzc3rWy A==;
X-CSE-ConnectionGUID: oz5ZZMiWSkWWKzmsz3LE6Q==
X-CSE-MsgGUID: 3+IVwTISSnKkA/8UFHvNEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33528384"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="33528384"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 08:03:10 -0700
X-CSE-ConnectionGUID: +ynvR3I5ToOwDUlcwvNO9Q==
X-CSE-MsgGUID: CRk5EmJcSu2BdJHgL58bJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="97210449"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 08:03:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 08:03:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvQbKmfh1zBqqHs/ql/nKg/Gs6Qb17TStjOKuZV4TpibGG4VW/ZGItxRgluXFjOTTqx2MPyMv6YC9+dhO090SIzmxygMogbAP8cNd8al+Rc3pZUvX0pwccPK4L4iL9AfMds/Ko10rTEjtmo+xh9UH5TsyOkn0Mg3LvWrHIK5UN0XLlTbEjVtbqTvH1H/QqqVrFIRG7OE0uWMBFug7zGMDc83Rdhqb148C0DW2dPwArI79Db1C1ziDLF4vrV00Q3jYJK5Ghj8/utshrgJ5clSUZQ+xrnf7scGwxHMGiipXlPmFUfOk1uedylYsrS5kZC/uMJWesK+ds0V2bGUiyxcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EfAlWoakTBA9yRH8/XmchVVj9XyRInHPV/hJSpXTTs=;
 b=u/J9mCkw6d+tVT0xr0mWtR4O28NeuO0CZK/4DL/W0cQnYLuDuW9QWfS7e/C4w7w2M5+aeU/NXOtOpTyUIAun5FKChC7uN1BJW5XA5tZqtMzx4VOzHxBteStdtuwzJFeh0mM1o+Dk6ikp6Nl4Jg1PlZHuLfEGLd8x1MBLvdBacVnNaJxT4QAU2apYleUUTlyYiWXV0PmkBagw2nAJQmr9p6/a4duLVLYfhDhIMIgcCG6Y5mCJI9xn5mwX4ilpCv1cCbWc1X3FBOqExiZandhRE+z2pl6W1EHLREyIRaoGHCTbJHjXP+z/UGahRR4MBpq9s+hQJN9waz7J0KYy8BpqdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 15:03:07 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Fri, 16 Aug 2024
 15:03:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 08/12] drm/xe: Introduce xe_ggtt_largest_hole
Date: Fri, 16 Aug 2024 11:02:39 -0400
Message-ID: <20240816150243.87596-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816150243.87596-1-rodrigo.vivi@intel.com>
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::27) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB4813:EE_
X-MS-Office365-Filtering-Correlation-Id: c605190c-d6f9-4bf7-0992-08dcbe0488c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L3Co1AbCqDhMqQnF1954hqgD48Ak1sRQEezfsKBaSqvt/malGpUpO6qNIfqV?=
 =?us-ascii?Q?7ClwhsVfFuZGupKshIjI1eXdMKYv3lpDMfqYUbExYUTTyUH9+eWrPAVz4hfL?=
 =?us-ascii?Q?8tz7wO9fdDHirjmIDkDHoYKvBT5KlUznNF/iDSXrwJozuxchSakPIpdJqTy7?=
 =?us-ascii?Q?2OaI/a5EnjZROg6w1KslhNtRMbrIyBYyqZH0EdzeBrTFU+jTB262a7R+hEzw?=
 =?us-ascii?Q?yzVbxCVgI+pCSLO7EB1d0vsJYAcysZWNp+L52i1MDuUsSaQKQJUpq8eXK5iT?=
 =?us-ascii?Q?lLAaQjqB0IvnSxAj4WyqAJbAJoXtGamVKcRJIfN+ag5rwMEr/Md4SCptLOiJ?=
 =?us-ascii?Q?pec7mq0RVowQFLMTZV4hWOTkPCA/DgaC4LdhYw8cy0P7PAEku+OPMkz/H2JF?=
 =?us-ascii?Q?IJRXsZQ/KLoeOPpIDpsZmKDSdRVWZ0qUSksrmvtRHgzp4Q5eflmI6yMZ/dy0?=
 =?us-ascii?Q?UnBMOdQ3bGjpsuLONDR1RWht5iBOjpztXolNLGS9iV7Kh2rqiFzBmKKF3yOL?=
 =?us-ascii?Q?PW2YdOXmxDesc5bfCI8xCsdJ57j5xQ9AiC+UssDUw4xKURQ+WnoG3PGDBCRb?=
 =?us-ascii?Q?HEuiK/mdx2evQn3gg9AX5Xzku+qpsAzrrdkdAM2b3oAyaT0reZiVSzPsm83o?=
 =?us-ascii?Q?TsHvyCuOe9YJR+ob756+ZyDjwZqTo+WCWKVcFhPzxCcEBPhANxk9YYg1q7GE?=
 =?us-ascii?Q?MqzZQOjD5WQLvwed6uHr8BkONJytDtGtpc3SGOsfQRXGzsLF/Htv6DBZeXqj?=
 =?us-ascii?Q?LB5lU4ljREZ/94quMHVWkTZy0iup82nEI0xhLrWgFTKZKlGVmGzmiW55Pmwv?=
 =?us-ascii?Q?5y0Tsh3yBjccpwhBpj/BowKWsHSVckFM2a4IwGFeCoCxuuG7jGC/uB6Rk6D+?=
 =?us-ascii?Q?bE0sg+BOdAQzKJqH3AjDwcD8on+wHL8L7R1DehCQ/l9g7qVtOIL85229UrDG?=
 =?us-ascii?Q?Kp2HfdZOwWVPaOCdxkm+h6kpyvRgVOf2FqHet46vLLE0AHzJvhYeGIksjl+Y?=
 =?us-ascii?Q?Rt0qJLcH3tG6CFjqQmk9yNmGe0xPtgw5MiqCYj30TZ7Zb6uCUO8YVO++w/8r?=
 =?us-ascii?Q?ZI8yWGADl4BFq4Wnc1bWW9MrtW6p6KolMH4FwSy1UpziB91L+bcEKYkH+9G6?=
 =?us-ascii?Q?MXjNIOiRjGimmdipo8pIzpW3+A3w/7NyBFWFtmo/lQklZSYSiluxECp5ESMh?=
 =?us-ascii?Q?eX2LyVQ1k5P9Iu+fB/JdXqlCGqSVKrqvFkcQD91nfS/daFo4j22651URa0XD?=
 =?us-ascii?Q?BbY84s7PsRyhORofLLz4rR/ZUw48GdCIzidcAWLqK8IRdPHxD9RDLaw+J/HF?=
 =?us-ascii?Q?6YBGF3NvRkoGP/yWGHQYTD3aa4zHxFgKMsHSittYJVgKSw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3yRAu4ANYftzWdW/8t59v/EUCxMwg6VQXOFWyu98mqOVhf1aC2Zw7MdpgPRk?=
 =?us-ascii?Q?bc+GvugXmC8W2G0rRhLU/LAvNyhQHfndfpv1vPrDeuEObeXbz9BR69yYqnrq?=
 =?us-ascii?Q?Pk+Yh+4Dve2E0uTFBKAl8UGg1RYoeI9SBsI3tKKXqRdf9h3ibrcl+AXfU2YH?=
 =?us-ascii?Q?a6P7+FoZxfm7j/euXamXgi5VJe33A/AaN/F4vxOtcym4TCXJ5UsOoC9HP9mR?=
 =?us-ascii?Q?/YfPkbOpvd1jN/YDKVxZ7gJD7EazBPF4MRXLxZ8ROhmU2X+gBTioaZsw+xZf?=
 =?us-ascii?Q?eTkQYRBqtmrjJqWUo1gvhWP1UTdIEZOR2rK9G260L0C6QwacPjEFQrCT91l6?=
 =?us-ascii?Q?JQGaaw62wIZEurJwZ+mV6379SmcljISZna98PUd7I9gkiJKr7i5cKTC7lhbU?=
 =?us-ascii?Q?00g8W/rF19NW4SMOeXzUZ50CZl07fZz+HPTnkKd6pQpbNT/SSVfCBVMw8Vb6?=
 =?us-ascii?Q?95++xcFjliVClfdr/SCa6rcP/Sdz+7T8xEfDZ2jYOxCq6J/JvHbteRtDISYH?=
 =?us-ascii?Q?saYx9ow4NCkVc1auJNxCZibMcd2Zx7hOEZ4+oL3r67uQW3r+LWb+dx0mN43D?=
 =?us-ascii?Q?0DIE/Fcyxkc3aObSO0A8HHI/m8NxyxcFiN1g0bGjnXeMJAb200gcSqy+KcKl?=
 =?us-ascii?Q?Zm44E9uVyGyGxEdBEcFjtXJUpOdbdcbp1nmUQv3EJMSFgzRhwoH+XBTRcvkN?=
 =?us-ascii?Q?w+vIRdKyNO+gM8clCq+tJJuIxIUuOn30gVyS9i13j3vX2QZCcrGvH1/K6zbv?=
 =?us-ascii?Q?h6mk1H9NQ53rDrD1s/99TTEzkE8E8xvpJaylFvLQNHE7u00HHLx9wZdku3yJ?=
 =?us-ascii?Q?9Yx81KRT0SdPyVOHiRmlbRCp18tPwmVwRK+LP8sIvWrDrwzHpcncGlMtLHzb?=
 =?us-ascii?Q?JKzV9l7EEiJdHHoAiLEo1KVSZ3J22gJEoVBFM0O+PuaTuCz+U0R12SpYJBUz?=
 =?us-ascii?Q?jun95gnp42eDz6vBgQa/AH+UPEfr8dqHpUjWGYVal32E6L0lH7/xlVqWJYkt?=
 =?us-ascii?Q?dK84PEJtk/fLX9x+6gaRpNMq+qk30/j4zwMxE6if2gWVbQy6ua4jBzA4UPRg?=
 =?us-ascii?Q?D7idFyiNb3VnS3ewENF/ImPd4SIeACp8fXzZLKMHTB8xF/dKEbPA1N01Ehd0?=
 =?us-ascii?Q?ZXmsvHesPwETh5v9/qpkN8DJejwjVdQUoq+bsM5g1c8ebNgugT9a/TUt13NP?=
 =?us-ascii?Q?AIjndtU3TGS2g5GLIiZ+b/+sJmo9FuS4lvUpwbQLBVcILPTDpzdaYVo8NMvQ?=
 =?us-ascii?Q?2NcPTY2SiN8Knm3+FtfN/ffnO3pZqcc/ANrYHjamiqXJI2ADMI0vA9kCvtMn?=
 =?us-ascii?Q?JWKKiMvcsJIWGKbTIUmTil4nzYHsy368xM8W0vmhbXXucRe/4Cp8tod5F73O?=
 =?us-ascii?Q?I1Rh5FUt35MEQOkQ684n3XOa/EDEpypPtt2fJyfqAXsHiKrIYubhESUbE9Qx?=
 =?us-ascii?Q?eyXxlGO1oIl9Te3B0LgnMk0MsPcqX+eJ9CzMgEq3wle9Te9IFeiU5NXDTEnp?=
 =?us-ascii?Q?+ZmmjRxE+p35IFnn2r6z+zN1sS/LOdg9qdru6VkavyYGhD57lw04qtTTf5jy?=
 =?us-ascii?Q?qpV0/9zdq6edFpxgrwoSe4mjPdYkXM0DZOOBfxI3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c605190c-d6f9-4bf7-0992-08dcbe0488c1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 15:03:06.5018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9TfsAqEi0RssDC0PQDzND8UnkoHEtD2FKy27AjoQm99uDEXjoEMwVpfNnIYfGLg/FDBRJIkav+kIJpsipikWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
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

v2: Fix a typo (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 35 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 23 ++------------
 3 files changed, 38 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 7c8bbaa30fca..2d055f489879 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -584,6 +584,41 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
+/**
+ * xe_ggtt_largest_hole - Largest GGTT hole
+ * @ggtt: the &xe_ggtt that will be inspected
+ * @alignment: minimum alignment
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
index 947750d97d7d..1852ff45bea4 100644
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
2.46.0

