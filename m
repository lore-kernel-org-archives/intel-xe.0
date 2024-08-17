Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60A4C531DF
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 10:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E61A10E032;
	Sat, 17 Aug 2024 10:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXrAYTPU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734D510E004
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 10:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723890980; x=1755426980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yLYqJAWrKs8ufPDgFhClF+PeGNTPjbcrbZTvXTUnGaE=;
 b=WXrAYTPURqqzIKbBVRZpIj7Lv2CwI1zAjJl704jeYBmS6wtUelAIX3nn
 TdBwmXPms01InEzbwX0pN+35Pk0PLvqKLRjtwBujEWZCQke/3kBBR8TQv
 4rzaLwiR5qv98oRGmixQ5UyExpzQzBxAKr9MLrFOBOdW3jRSdytIUXZaA
 dPYikjGscc5npjAz/rVZQ1ZduY7/9gmk6vJ3/NMLcEMpINK7zik5f7Bih
 h9jjVuV/I77ni/D9zrsvuOj95Y2w2BxrabB23qMDYZjHuqNBLCxkO4A8w
 /15/LmjuFMO6qBzsS7iLCLnhYl9lcJhPjD1pdkhEAA7LcQH79gDH3OKeA Q==;
X-CSE-ConnectionGUID: BN9nERFbSlezIBwByH3Emg==
X-CSE-MsgGUID: OCpPc1A3Qyuq6FZIZUMqww==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33594998"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="33594998"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 03:36:19 -0700
X-CSE-ConnectionGUID: eSGbha2eR46RrAG1bbKXow==
X-CSE-MsgGUID: 0A+MKNsSSjWz5RXVqsPa6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="60464113"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Aug 2024 03:36:19 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 17 Aug 2024 03:36:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPkxBHzAWrp9EnrNnacPPeUcvLaXWX0yz/dgv0j3SheM5KI/32Q2S87MNFcLYZ1EfII/Qv7iaS+Hjil1YlOPcHV1VBEpUAFcfDFOgZW1PmIQqx1LZs3L580pwuNQNPGRVuubV4dPVgwtPkDag6jNkv31FqRaD7eOSzkBW/v+Cxxqymbo+zQSb3RjFj5vZS2scEfu4vkxpattvVxQvotFOUu+ASyTGRvfJmWqbvn/kz2vRDKv3CzlLxNQKSeBpnHIRHpXfFI1cDgyxAjHy3Z7WE4k5CedV0CGPGXIJIVWlEva5IcsmKts7RN/J9atowab7GnaYdOGys6Kzkzj7H3hiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZk2YhbbAoOy0Vaz6pO3TvZtfrppic7rJaKuEw5NufY=;
 b=qHoSgXJ0qPGt5UKHesTcWtc3nS/iF7cbsQpCxrf3Pj8k5q2/rvms24A2fYl+NarHIq8OeVwvMiVzh96r8rHmLiMwEpdnmnigVkZzB4IGDmd1cSg0dTgCt+KHE0cX9aKXI++fB9bnhbDL/n+WkLwUJrFl8Qr39Hj9Yr3cgHc1uH3QOa6HgF8mRABxYGkOu2gRGVANQB+6AgsBFnKUTVLv5h3Cbanu22vjacvNr2e22fvyAae7Ts41+iBdNQZhRrTGmyAY2rNF1EbcI3osi+vVg5+CleaanOpmbzv/ccAC+Vl6Y1XWmiT6+fIDqV0U3Ihi6lO553z3PxfSnjU072lPDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Sat, 17 Aug
 2024 10:36:16 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 10:36:16 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 08/12] drm/xe: Introduce xe_ggtt_largest_hole
Date: Sat, 17 Aug 2024 06:35:51 -0400
Message-ID: <20240817103556.163783-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817103556.163783-1-rodrigo.vivi@intel.com>
References: <20240817103556.163783-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::12) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a303e2-772b-46dc-3696-08dcbea86c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G8AZ7mmVezCr2hXIiA1GizG+C0llF5MlLAqfLNPJIB+ppTyHuBzKLdvtiFtX?=
 =?us-ascii?Q?5wLBlwm10r418SYMKKlFLcrROUyFW4Rjp8EvMlAtDPBv0zWGEPYMI7He7rlV?=
 =?us-ascii?Q?zurkB+pDRbI227JCJAM7ht7wCX8Ktu/LgagZ8aZoI8K00piPTUQ6AcCcZBRF?=
 =?us-ascii?Q?aqRcJUOojBPRohN9AywtWOQei1sG+84vmUG4QgQ0PzymLJUPsbWa3J29IkZ2?=
 =?us-ascii?Q?VP8C0SGrUZ5xO5ZrYLc6NfcqXQRZ/j6PtjjQKIDuI5fIuG6GokkqYj3PUudX?=
 =?us-ascii?Q?hhLBFVhZWp6GERFnJsM/sQu+cYMiz1OrsPQw+0ygjn5V2ZWiTcbpvxT33ShG?=
 =?us-ascii?Q?sXG9NpLRqMRBhZpqEAe+9rAKPzr3yN//LbmIyIz7vrkX2YYMlsUUZFdrGiHV?=
 =?us-ascii?Q?sVjSAz0qu/VR6kzflYdfxS0mWIWRSSq7Rahq1wTF7vQ6G0Ik/eucdqkOvSEP?=
 =?us-ascii?Q?ojITbC5Gov9lR1+voY3pXwvkcASOglnmQ5fqXsLnZvCflAd1lKFcXYhZAl5j?=
 =?us-ascii?Q?s7mwbxCjsqwreDV4J3oJTjW3WWyFjvHgg1uRvhpQmHcq5gU8QDWpnAhfr9gq?=
 =?us-ascii?Q?TR8p+u4slMUPNszBIuF7cFoKT0xwF1lZigo1nTyV/JIts/N6Cgm3C0w9x6YH?=
 =?us-ascii?Q?3ladjBFSpIsyw9Y/4yCgslVzdcgLmigXBcqSkvvvXZN1yaN5Vh5qTwiHF7FO?=
 =?us-ascii?Q?xbt0ghLxKU9xjhsyGy5O/0/fUWBntn9ZRgulUqfAlk93jL67H3v5DpUJ5NEM?=
 =?us-ascii?Q?3AdwjoQu5lX7uORnKSVlPK9zm4kREgE2cttRgEHuJt+TbdXLGDxuSlQWchdo?=
 =?us-ascii?Q?Or2DAkcCpc8t5nGc9E85nf0iNxDyEbMahY6EhnTDf6MCYFTw/nUBjV6F9UB5?=
 =?us-ascii?Q?yR//BGnax4ddh0l3xr6CFjSCmUcFDzuRMV6ej3LmPN1oNghAFxjTstbbGJ0D?=
 =?us-ascii?Q?vsChNocX8djWu+DrTA9xB+27On2V8qI51KabJrmld55aBR0ZDrLEK1sVeHiJ?=
 =?us-ascii?Q?10Nfsips+sDDsAMAe/CbDXEWEZ6FIEiTS9E3gXqB1i9Gg8jLb2DOnu5ZmEL2?=
 =?us-ascii?Q?n0zwaalnBkjQASOw6NqDFAUQenonirAM+/gxxDRlOelGrtbvM860Q3TVbbdN?=
 =?us-ascii?Q?zOzlOZZv1VKqFJhUKRIgbojwAKswTkjUwVC3meqVpXaN+z2BFQgZUn4jmNM+?=
 =?us-ascii?Q?0CBssv5Ez5idihyeT8HFzyqg6lkMjizGoJjRR3EoIKIuw0p7kbZc+EzCIy+m?=
 =?us-ascii?Q?i0nEMQbv+wblnYDVqnXEVtXDdj8HBxVMEzJ0wQBb2BrGyXaAyhdGl1R45NYQ?=
 =?us-ascii?Q?6jA8wuBuVP0EEhS6V311aPGwfK9nr2PM1RSk4rPa57MG5Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7yNG1iPizz6oHcDw9IMn+ePxrqKWMvJytu7pvLdUnxL1nKa75kE6DgsV70me?=
 =?us-ascii?Q?dmreC5suKKeDr507d6TIj//5ra0IPb9f2VtpfIBDX1qDZaTkK3+qfcI094bC?=
 =?us-ascii?Q?+mI9U3WJ7K8NFs0lWB9688fRGXTCczER5pZbeKSjxIHEd7QqaB0VD8K+c/U+?=
 =?us-ascii?Q?mzX8w00pDqOKBdPk6Fwhd/3hF2PX9PF5HwD/9yIngXaExL+Gf8UeloKdJAkI?=
 =?us-ascii?Q?8rzTwdG9BQt5D1WN2XaHWAr7pAp/iXCikCmAK+aRxVIfnK3IiNyi93yHAT3l?=
 =?us-ascii?Q?25788qJafFvzx55wi6e7zW2KLrFtA6QIgZhz7/TJ/MhvDRJxePtihLtfWokF?=
 =?us-ascii?Q?AZrbnCNNL/3HSPLXlxrZPqh0NNGGdLsNOekI4xIsNQVdXFbzhobbkIeny/6L?=
 =?us-ascii?Q?8tXJuUSajsZVRkgeOoZhQZ108dFk754IwFt9uYxT6aZX0L4J0L7UbYxlzEp8?=
 =?us-ascii?Q?9Vo4TWaKJ4SPGBeLGZDgvdI+I5t7RzDfj/bqZ2U01Dj2E0hPrr90xHY8h0Ij?=
 =?us-ascii?Q?7okdEAntFC+HY3QmUP9VCrsMxYWuajDk748TP12lEoqmQJmd1qeDMg9+pMXG?=
 =?us-ascii?Q?CvXLQfLacd6kGc5LMnRb2qsl5dkw/vEUdH/kN8qAnefVo2lYB5xQdhmA2RXh?=
 =?us-ascii?Q?1IVLXCjHcPgcf0FpjkWyX/NlYmLtGu5nkjgJh0CnqGTwzcwvq9mnCVLxUM10?=
 =?us-ascii?Q?IBxL4n7jyD3+xNY0XWAJ4AYQ+wnkuBLtNv05O67YqtQFfqLhS4I0T3PQDN2J?=
 =?us-ascii?Q?6DXvMcYtfk8x3WzhjRCMrG/iHT6juIzme3xAK/m2HcepM7k/yWNXT5UviSLf?=
 =?us-ascii?Q?cDscEccA37yrmECkWXw8HwDA4UCmOAEOVSrCzhvyF/iHXXiZiNj8YXEcdKJw?=
 =?us-ascii?Q?5peDc7iIwzZKM0AdfKFqnrZ8X5c6dK+R/HJLZn9ymOleykwMX1/ErjQuij8O?=
 =?us-ascii?Q?hzFOzGFohph5jcabgyQ0eKHzwSwRcX1mvQph+psZljLA3VUzm1Ray7UMyN2g?=
 =?us-ascii?Q?Qxc6ttFVommrnowGiuDGW0cQ8zd8I9Dq5SSiUSEl9pv7uM4ZAOgfYnQKHcFf?=
 =?us-ascii?Q?5wgexGZKApH+OjFzx4oiBQd4/LJdmEDAsRuf5c2gEMfl7vv5lcfWmzXGl0ZD?=
 =?us-ascii?Q?l04jGR89ye74xIvO0OBm+ynLbGlbt/AP5BV9TL23D3VjuQa0qwXfLLGbFkF9?=
 =?us-ascii?Q?u+2iTR64vfzt6Ld56trHbmT6SiFIJtDD3wlkkl/U2KYwJ+/UHMGfofQn3caf?=
 =?us-ascii?Q?eUL9J0lpKsZa/+DKnYz9ykVOACYbMGHUtzCck6MNy61TDF/rCY/NX0c0XA6V?=
 =?us-ascii?Q?j3vRoGisewhz5BC0XyO07q6RyOPZ4a8e7BaaEOMCtCIXQl7cbsQJpQ3U01PY?=
 =?us-ascii?Q?83QymFluZxx7bSDt4YRKD2Guoy+KVmcYhyRe04ZduC1CmKMdhKrJDn9An192?=
 =?us-ascii?Q?z2I0yc0ryiYeDOUZcTXpnhoTwtPWWwn6wzu17QWu+BH/aqn3AoFsSWt/l5cU?=
 =?us-ascii?Q?cDLktiITCI/Al3e/In4kXXXH/KTWc3leC0LT2vFnn7jIy2LRfTEa+tlxwPGc?=
 =?us-ascii?Q?uW+j2nWM9jQUWaxZBPv9ENzQYebYtB2UOiHeYFJPosCoTcdPS1xychsRZQP1?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a303e2-772b-46dc-3696-08dcbea86c39
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 10:36:16.1187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5kvYldsXeg8bqrCslA4qdKpFAocO+UbUXTMNJHNMPeoxCPDMQo0efnlLB7NjLyJPpcKjS+UJ/Rz2fXvAsngGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
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
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

