Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCADC3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 17:13:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5367710EB1F;
	Thu, 11 Jul 2024 17:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XbSxg7lp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AC210EB1E
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 17:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720717984; x=1752253984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=K3qPhAi44ApyZV9DBTZAc2bLjime37kLp2aLUhfj9x0=;
 b=XbSxg7lphvJfASZuyQH6XCRNSfghYqygGWykC6G1mqzaNunAe0wQsRT0
 6bRKPrf+hTE0WsmDilKeYLeJ703UjCMaOBDDxoOkWLVd68A+XEXzVmDr/
 nK3f+PIAbztA4F23zGhx6mhjg/ggtTtF6oEf2M9HjbE2LCrayKtxa6Lia
 jzuPIMgpWniZKLkFRsA8qUPQIVrUmn6XQxVIZj6SGBJT6Z3NMiOJ6LRwt
 bT7HNOD3pWod6UVh0buIyMgbBOY0xnHWwz7+5eNQMhVq11M70b5Gemv8U
 m3w1vkV4iA5CWsLAp+Bp4j0UozjfVYAzT+mBp4JJcOnSJhbgmDcWFfggg Q==;
X-CSE-ConnectionGUID: zKA5t95sReWwXMQh8ABKNw==
X-CSE-MsgGUID: 1kgo4G3aRV+hb970bpsKEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29518884"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="29518884"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:12:41 -0700
X-CSE-ConnectionGUID: 1beG8VZ2QJWcw8M3Wfy5Mw==
X-CSE-MsgGUID: AD+f3BuWR2mylfzMiYv1/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="53821195"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 10:12:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 10:12:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytNVyRHt4bTIZ9A2LQeUOQg5+Ey1g0UyXZIJs5+t0rAgstPatc3RvsIKo2/54e+iilUxVTyTfqNu0YPO5hoRLO7qruJ5UXHSb44v2QyUVRcIMBzpP/pmb2fgApDbNiG4sMlUeSFRpa5wK0qu6yGOj6alk+ATtxHuyyoN+KevokgB9gOIhfMRL+0G1NQsWQqEMipLSZfGz9ITvqR8m3kcoblxEYTNvs1LELUANsBszt6VxazOcjsr1dGJy3IHNxWgMcO3ivVgdr2xBqqEcUYGmf9xOxEV2DTfj0jdQbJxwpB/jRpMQOqU3wdiVr7bJE4lumWuCQW0t2gpJBtp9E2A6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUi1t/9nR7XqPS8tNhFblIkhe3zhtV9QSoH1YHfkmLI=;
 b=QCpl0hQmf9oiz+EFdsMlCIp8Gqc3f6ogao7MFDANJKP0q9z/pyAyD/p/o30PTHb6/nT4prLHofelfYuUKagOuySDXYkOFYz+FJTp0UZh6pX5tIgpahCq2XfoaCfdPGzQBap2s4oCnxRexuc5CrQgKqKp0gZ7GMNdFx9Nt7OX1UdCBcABovwKfDLR+ppHZmjefoAUWgZ3FR5CBEet9/HlfrbllfdBPT8reoWb3YH+ibjE6GQjo8gKX/382rqY3b2VphjqjwQomr5ljbmh643fO3o6EMIxoI/B/+98hbjbLcNPZKzdxGh8yeQuWbOAvwGFJeRq3i+x0fFsQu6Pl4cvWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 CY8PR11MB7107.namprd11.prod.outlook.com (2603:10b6:930:51::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.33; Thu, 11 Jul 2024 17:12:37 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 17:12:37 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: [PATCH 08/12] drm/xe: Introduce xe_ggtt_largest_hole
Date: Thu, 11 Jul 2024 13:11:51 -0400
Message-ID: <20240711171155.173717-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711171155.173717-1-rodrigo.vivi@intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|CY8PR11MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 36134e46-66ae-4b9f-cc2b-08dca1cca9ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oUDJAjgWB/GyN49lbLGOMy5RF0XNvYLvCljFiuMINEBlRnTktUJdH1jE3lgF?=
 =?us-ascii?Q?2UOEqS8sRmbgw7lPzbqE5wlgrbXsIWbsAOiRBStn3if4vTHROAaAYsaL01ZI?=
 =?us-ascii?Q?albPLPjZxB2Tn9XXPvM8jJ2fVg+0E83mMkOysUS6nq/UNEO/VkwjzQlBrwTk?=
 =?us-ascii?Q?/ajwbWL2RymEq1EvmqV30bvI4OESPZ0f32ckMh4gtEHLRllU6BZp8shAglPX?=
 =?us-ascii?Q?TnbhOZC8J01nVUQyvBR4rOL1lKX8wWodgl5fAIPP+zf0NRaJCCwYHK6+ylNp?=
 =?us-ascii?Q?zAf75mVPjlGORpqgB5FpzXzNkWbA3xNogTre4TqdmK1lWMuVBdOFpnD39fCa?=
 =?us-ascii?Q?2897rLwi79uS5q1Gm7P1A1zW+c2A9ATrYahzW2Z51QFgVgfyfAm9vAkqbqag?=
 =?us-ascii?Q?MKTeIO/clpcHFR0u4fFbjD+35sLh7y/v4E+ZZRBnMT2GpP9DTdoj9v5X96HJ?=
 =?us-ascii?Q?aSpS2qdxmSRHV0jwWtBzi+ZxviZXGGjrzFHqKAfWVIB7i6RoNhYxRaOx7eXK?=
 =?us-ascii?Q?9/qHmVf5ZBl6RQZMCKALQ/yM2NQ6IHUZj4CP0YmNEykwM3mfF4pRAfGWH26R?=
 =?us-ascii?Q?3mYWdr2XNdMZC3T/cZmpPxM96o6E9OsWOPnKEC6L64YQul/6tgOB8oq5PVq0?=
 =?us-ascii?Q?pEs1ZMsEdkmXtaBY7y6a7TpGX3Id/y/luNvknCJgt6Vg3JE5NvJ/RlunyM0F?=
 =?us-ascii?Q?ERNLf32ur+kE+OopRC4wJrCXgpO9ULiGnBydQlwvqdQ7VQFiJhrqNyyh/SXJ?=
 =?us-ascii?Q?ZnHn+3mMjwhK04XhLzWpK5LvhnM/s7bQrqA9ng4ISLHBWE603L8iIUktXckJ?=
 =?us-ascii?Q?OzBtuscBKS1Np5s7PakeCqUfDomt416q9uq11ILWoa3+Up/5oLhUsf1IyVW0?=
 =?us-ascii?Q?0os6fw8Aq+OkIwDd/FKgstbh32fhw42FOdZ0zDGqL74/BQinfwKVfEDMaNSq?=
 =?us-ascii?Q?izmhD0HOQ9roU+5/onJE8Dna8ymVfy9+2XPBg9z9P76oiVtym31GDXgqd2B+?=
 =?us-ascii?Q?pZQ7V5+N+l8i/c9D+KpA8lgafNI+pXO0iiKNGT3b8Xigt2tk5bf7fFBRX0JW?=
 =?us-ascii?Q?rbmLw5jyr4tgpk8tn9SltahcMHD8OZyRZZ0PeKYvk4xi8Uim0THa5Epc2KIo?=
 =?us-ascii?Q?h7zTrarKnYG18dNLdHaWfMhfYpUSqJ6/5MTLdV0Vbezy5B22Z2yF8ihRwqoQ?=
 =?us-ascii?Q?mxSfoxOlbu/T8JZzxx1MoVF84oWwld4xDHQYDXrBbe9fB+vb1JIaFDosWqxD?=
 =?us-ascii?Q?aEh86vOAU4HFiZdlNejyeZeeixobTybmNHcwbVonO2FYvcXqTZ4vqZ30eHOP?=
 =?us-ascii?Q?cRg1MZWdyp3S248B4/pRSYeFQ8jZU0z4hpqWAPP5J5aBUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BVJhQLhIj0X6CQnioj/YHgSPbfwXhmb2D7dhLh4EJysvl2Cyr5I8lEgAXbBc?=
 =?us-ascii?Q?BEcwEDC/U8Nw0NHTzrXijCgGVkVTClYSaql3fGRkz17WCFNkBqr2COOR0ttf?=
 =?us-ascii?Q?Cy+7OwSizlbQOe6Hf0lRDAYNMGnO2RRUDTAG2ceLkAVXOMDWFtJe2I4speBs?=
 =?us-ascii?Q?+OYY5n2f+e6eZo8pQzTns28kMq2CgJ9OAdrbmpDquwHFImd8T1Q7oxpxftM2?=
 =?us-ascii?Q?f2bSptrScziplCM88rgtNVkwSqzJkXa9U7n345Yc0HSbNCVPCibqcDgJv9pb?=
 =?us-ascii?Q?xsvDBF+wkwoL1gyEFLxXSzKR+kSZkbPNImo0NQsrETEXO6JjUJErMQ/M361t?=
 =?us-ascii?Q?aTzyOn9D/jM8hQnWZauXTGFxhzOQ0oRyaugPzuvaP7VIKXPrzWyXKppYaBd1?=
 =?us-ascii?Q?llvhVVgETw/CUjYuI+PcI1Vwg2Gcf/BFV64tQbLzXBXd37Iw7SQVh8ILZUPG?=
 =?us-ascii?Q?C6R6TeD9LpAnm9MAd3RslG0NCqfI5kTVzXAu1zuIL44lbEEamr2BcnoeKAGI?=
 =?us-ascii?Q?frMXKqa35NOG6kVZH5uR+dI+ftd3lrN2wEIGOcqGt51YlSF/Do80DqN7BcaO?=
 =?us-ascii?Q?doycRdd4C0Uoc3ufF3fe3Ubd4FHIXJiz7a5IDfX+zogZxSCWF80T6sy7+O1y?=
 =?us-ascii?Q?zd+rWCPqlVGzQi0l4mk+CUSb6bUsfvjzThxcZY4DWuSVRxTIAUZPu+1fyqhL?=
 =?us-ascii?Q?5H32VMNbcCZtBgGKKc88JzAbvFbsNEyULil029vIbbf6SFxgkN+K4kbkYCe8?=
 =?us-ascii?Q?l/SOEqBNyJ5F7AZzTmzv4c+P1N2Yx/91tU8e8ifQ1IWNwfoslvH7QxjTjWYG?=
 =?us-ascii?Q?FP1SZsUcSJvo9AaUjHKrHydSnxFtB/7Ev/iicQQG2Z3Yuo9XiUlBKkWHywav?=
 =?us-ascii?Q?PCZHUXp9YhR2Wei9aZe17JHI51e/avCcaD19Pq7DRFUgd69ZwCFGZzyD95jm?=
 =?us-ascii?Q?gjzKJQEHl5Z7ChwJYrm2l0kaAJk/815RyWODps+D7+EyW4NNF6viOq5uFLU4?=
 =?us-ascii?Q?r2BJB6reytAC0wwor/x1wAmTO5t0ewZ5Qgjak1DJFv96+9Bfl93l2UDlpk3w?=
 =?us-ascii?Q?c5KpBGgGZfrZ0C46TtE/AjsS5BsZoY61Yyxy7XyQy+J5BPQMlHOYN8veNxUH?=
 =?us-ascii?Q?/rBw71aM2UlMqqPlNoUTbXLjp+taNJIjL7cK9jt6bAo6KWjYQp3fKMhwVAkv?=
 =?us-ascii?Q?e3SiW52MOu1Os0Lh4g9C6EhsxRDepVAHiQy3hK9wLr8EJrYVcWAF1VIg8LlA?=
 =?us-ascii?Q?X7AzpYYs5aBoCC7ypihVDT7Utx9E1Ax/GM9umCpicFxpNT3IgU/op79bQFx1?=
 =?us-ascii?Q?Gy8QXGTD6XehgVqoucnEqDeSh5PnC4RComArSzOCLWBSrL32VlYE7A8i8Ty9?=
 =?us-ascii?Q?H8cp7MzkG6CU7SLJABFmnMl1TaMeChh5OaQegKg6GOgVGBxt5OWkrc84mRId?=
 =?us-ascii?Q?U4jNICAca6qHeGGUZLdSbfeo3CND0K49ndKVzaDOsGcBGhbO1xABw7c7U/XB?=
 =?us-ascii?Q?yMKrPB4JD5Ym7HxUtqn9rjQZtT52kLKQKQWn8zkcRSFOWbe+Ec7HZRUswMY5?=
 =?us-ascii?Q?+UXXIm4v7f2k2ZhPCkxya4KrHv13PMeHwPpJq9Q5pAqefr9stUGr1u79Hj8I?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36134e46-66ae-4b9f-cc2b-08dca1cca9ee
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 17:12:37.8000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOl/gQmUamB4u/FvuzcmhmSkcWGUS5BdAlolDweOTWuPu6o27mdphrAph/b082267EardkvysQlRlYIPvH4OSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7107
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
index 67337bfeb81e..dbaf1ce87fb4 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -584,6 +584,41 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
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
index efaf188290ea..1d17c34fe5a4 100644
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
2.45.2

