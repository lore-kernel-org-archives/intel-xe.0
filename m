Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDCCC5320D
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 22:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E79610E49B;
	Thu, 15 Aug 2024 22:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y9REZl+y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055B810E43B
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 22:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723759682; x=1755295682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZfD1C0WX9+MnqypyO+eLcUOuwlX18MApOz6+4KQALmU=;
 b=Y9REZl+yqHwFLZR+cBWpWis8rSQElLcTl23E/wTqf21HmyAxYz2jp0Sf
 vqol8WxQ4cSmGxwPcP7BfzImBu8xxqaQWZYHoj5NLRbEZvt4JVh7C6w66
 gRyES6qIjVnNeZyZHfqG+8LglUdxrnGb7MBoHn9kjtbASgF0N24KR5QkD
 /3BJ3TDT1nW6Jy6lTS1NCVqB5vGESbwzkN6VyA5MSewTcIeUbKBx3ZMUj
 V+d8tDLjLx306R0KgSv7eTwfsbCMqG8uDJMferNKNEMdUJbh7YT1+vVZd
 hUPB2nU6Bs/EiWjPViuZHguElktNIZQlJ3BFt7oG7e/tfGM+18EJIxIqZ Q==;
X-CSE-ConnectionGUID: Go5bF1XnSoaN1nfD3IOpZw==
X-CSE-MsgGUID: bFDAEcGeSHi9sMDAM4rdsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="33455515"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="33455515"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 15:07:59 -0700
X-CSE-ConnectionGUID: ONlKTWEdRy+nGpVVVgampA==
X-CSE-MsgGUID: +ZsdZ+VqRYWOhsKkynRM3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="64375317"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 15:07:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 15:07:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpL7+QmtlG4WQBU+acEeaRVxRHHVGNRgrwrcllMm1kGymWH0UhfbWOkmdIThB+RLvyEBAzOZ1T+SdHSqA7f3WJ2u8WG1hIEFXxB7dwRHJVC4F4+33JgkVVFV2zL0+vOWEqHs99Yg1Maje2OkjobkNrJHOcBxGqkI3EKrq4dOc6Po4AOS3dpNt+KNVS1mu3+Ks4cN5shHsHxx/XQvvgdkcHOpAK/duIITPzCt2XGJIlpyhQe5G/FXYbcf53sLy/mqPTG9tMfl9pOMwVZeSqgbCQw+VcTj63iJwIEHvuN2YU3vU2VJuWFMU63gqR25xPiDUXbvEoia27YIEEBWorGSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EfAlWoakTBA9yRH8/XmchVVj9XyRInHPV/hJSpXTTs=;
 b=thTD3LjIfla88Siw6DPl2yOlsSovlszgiq+ljSoFW/WAPaaRekXifJzRKPd4Y6jjZyH/v6ImJwoiazmNkdN4PyBaLvGCoW3odZuosrWwoZczqbnAhGz9cCiWt1CJuq2rPREbK3eoxeqyxu8ixCkdIwHeQdVSuOicW6Jybzm4tVWSnEdh7Yc+6GmDnptTmTRoVxWp14YBpnkBuSn8LX8k7+foKvrV9aaka3Vk3VsS7lS7F5PJdsgobkRDrG6sbUXbea/NV86Eheei6WSJeyHYYMBRn1NMo8c74VR7sPS4BJ0T2mR1BN/pNQyusFWvMwZK/NiB5zxCPazAthLhji9DeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7133.namprd11.prod.outlook.com (2603:10b6:930:63::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 22:07:55 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Thu, 15 Aug 2024
 22:07:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 08/12] drm/xe: Introduce xe_ggtt_largest_hole
Date: Thu, 15 Aug 2024 18:07:28 -0400
Message-ID: <20240815220732.49675-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815220732.49675-1-rodrigo.vivi@intel.com>
References: <20240815220732.49675-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: d13dc375-90b8-4d47-b0c0-08dcbd76b6e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MGWnACw4v3ot5ZVeJWY8icMomthwFzS1CLfWoyFlfs4ToZH6Hdsl8lJqvlL1?=
 =?us-ascii?Q?IxKszr5sbiOHbCvr0d0eM0bS8nrqhZfiBwE/lYMQMVVrl1j669RNCTERQufv?=
 =?us-ascii?Q?b3uJXM+wfFh0cvt/9ECQWIW1DkMdC2IYgXbe5VScIeNMeApSyT6MKPxFWphq?=
 =?us-ascii?Q?l3Quj+w3YS4ZTda2ey/LF7CdFAFlRdHHJPhe7ngGsKDvN0D2eeQCV1XISnVP?=
 =?us-ascii?Q?vNuSYmCuFaIj+dW5WMfsMel/cQjTjqZovyGs4iEorG3E5g2xuA3zgyOaS+N9?=
 =?us-ascii?Q?ntUch5XqUSoM2xIa9uLk9LzxNv9TCc2orClVBLr8Ca9y1ckDaDKyRM8te8op?=
 =?us-ascii?Q?msc2aL2gMpur9irUjIPv3thbkjsp7pxzNpGtyQFj8NCCH7BgQZY5OEmx7e6k?=
 =?us-ascii?Q?dT7rIb2LBgFhnIS336eQzmyWMutbj+LgxcQbe7EiBUlgQ/TpGNdUTc39MV4s?=
 =?us-ascii?Q?M4K4m6xtkhlLZCuzFXoI8hgCf6vSkJKmx4BCfzIUjpO++ne6uxgnrPIPJrqs?=
 =?us-ascii?Q?K7Hv7Q/q7Uo7xxlD7Inw7Ilmg54rCXb3Rz9YVNi+F6FYMaW5xZQsY5jC0yWX?=
 =?us-ascii?Q?FCTe0r8YIFailQkGftJh2c7OBH0EuZ3WOi6njX0mpDSE4dLBi+SZW8V3pjfQ?=
 =?us-ascii?Q?vXnny+rwv+gwvewNPNKlcYl5pDZWFZiTta6PAMTYOCQTUBe63eRohAUXvO4K?=
 =?us-ascii?Q?RF+kYcr1z5i+ycUo+ry3GHIZBHigIdOBxESWaoawM6HWzITKWO6BzO4CivjU?=
 =?us-ascii?Q?wXPeAgfW6r28+HuNjmw6tfX/m/zQ7l4TelE0hua4x+eO/vVK/6jMvCVJiIro?=
 =?us-ascii?Q?66pKTC0ogG9tpdpJf7mjPAYyYsukT5EgH5pqNpYRdOE47myARdNeYyy320aH?=
 =?us-ascii?Q?YOcSVuEP6OuQc/3Xe2oGS5RN2SIZVnJZWmP290Gr/sNCHrDCD76Fszb1Cstz?=
 =?us-ascii?Q?lMKmzgXvTrfj/xfxDq64ArWyspTOXc+ZKYLMt+yCpQXe2UAhsqhQozH4j7GK?=
 =?us-ascii?Q?4YTBIlqewAN/d9wVPwSSFddbapCK/7R9TOxK8/mU7e7R+qD1ic7TC8su9x9L?=
 =?us-ascii?Q?KsJB1uMu+RuuWb8QYvAGDptooU5qEcVpOHD/DXMfI4m/G2xsgy+NzfqvQohw?=
 =?us-ascii?Q?rRU2lUh2ZylxvznfU4cuyAx5m95+E1C5zOsXVcU7Xse2RLPKOwJmc8T3PwF3?=
 =?us-ascii?Q?X4+RWwUMQ/yPkUunfpyaxiygPTJct8U/1zscKeLofyYEIwETjO/oGun889ty?=
 =?us-ascii?Q?7tm/ZZQ/Wlt0dA0HEQSMhseKdi54MbJQd1wiLFaor1GHTqErZD5QMP9pq7VG?=
 =?us-ascii?Q?HNfLpmt5vpMDeeyp7Ddm9Lj27JlmLYkDKeZUqNCqmPrFAQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Ulbs1bcxpLJB77OihbXkZlZnLngvjz0NOHVO+5utmBZDF56lTceBcEsC0fp?=
 =?us-ascii?Q?aVcIVSekVgwN1nj5ciSiS4qOHdDMVlAQPOAefXzhcF4oiJy+QOcb73hH9YGN?=
 =?us-ascii?Q?Zbd6HTtiPyO+Kf/8EF+z+l0W++7+3VGZ6OKCu30gw/jHHpxrxfUWc+ju88Bu?=
 =?us-ascii?Q?Qs95LGESqVSiuQtiiFi0KHTehswQAmjsHvoYpYX/Nm/tgo6TWyBPBcITcI8c?=
 =?us-ascii?Q?v/30RreCF7XvHAZDNZ2q31M+2uOQaLMOW60YuGb898QiEmrqXUibOXNqPeRN?=
 =?us-ascii?Q?aclF3IoKaNqHlGxTmsyXXHLRqJHHt3uSq1Unt3f+2f8TyP7XvHk/C01cfX9G?=
 =?us-ascii?Q?X3UeCtsDz9uUvmgdSzf14iiIjkt/Mro8rh/8FASr84hodIGwMeK8mH0eglxJ?=
 =?us-ascii?Q?cg/WHzgNhEpKCLiZiqHg+3JTyw1RCQnXxInNP/5BpBdJ3UL0ixf/I0yBnpkK?=
 =?us-ascii?Q?pup1AhUI+/GUqUYHYPpBZGSK1A3msfDZmF1U++6UYOsIuJUZ2wmYLWcknjvj?=
 =?us-ascii?Q?CfZdqrzRmj4IWQUutEO1cUvBVpSLI2pFKVO8Tofo3QFSSWFAes0g88QF2zE0?=
 =?us-ascii?Q?/dLoaq/jxKTPQc6qA+vnSjimI0ShrrI4vYNnG48W7pNI51MbN8NIAnpmUQWT?=
 =?us-ascii?Q?EyJeYgTULnnu2W3sTkI7HjiQEI3r/M8cIkTQiRw7kt2P9WZ0IQ0jrcnCiFey?=
 =?us-ascii?Q?n0LYzJmkAePyE0gaBS3kC8tMn/VNsvb1dcHUqXAiEubzsR3MuNspyQjK1Qx+?=
 =?us-ascii?Q?c6CVM1m3wEbWJ+UdNF+kHnL2RRdvficcWYDwcTuyKo+PCUix2mtc51uC85p8?=
 =?us-ascii?Q?RW5x8wWkVg8VREai4fq7F8TUVaRN7EAupl4HyBQlB+bhwu1z/L8EhKMOhgiz?=
 =?us-ascii?Q?CoIOfx4y+/NgBqvhEkSd0eYfXGPa9Rgzaq/swO6rz1VtXcgx6dQMXBePOpCn?=
 =?us-ascii?Q?bRMKDc99emy9OidvZYbNP6/7gCq2AT202DbzqX9RAbLUOOZgy4i52lJoRKF/?=
 =?us-ascii?Q?jHeiUDLAceiggjPxeSHJ9QwwZre2t2H1mf+oORAdHrXFnlky5rCHUzr2+fj9?=
 =?us-ascii?Q?yfBYgSAQ+H96eN6IQZeVo8eRNapC4TYlFGRVfxxoNncvnYYALagtqfu1Q7hW?=
 =?us-ascii?Q?uQTwP29BG4PXsaLf7T5jrYgpQMNm6GN3f7XJWWIpDbjTgtb72LIopCyW7yVW?=
 =?us-ascii?Q?ausS7HDprmSEJgwpveHplJDoM97RfLu2w6DOo0F0vsWzIRhE6aANamgTcdfA?=
 =?us-ascii?Q?BKnAR0bqc/kxhA2xa+gEzSfV71V82jkbHo4ISGm62lCXHrqqY3m+6UCL0bvL?=
 =?us-ascii?Q?u3hru/l+RCiJX3l1DdE9MbweTOJqkyqTw5ZbBZ0s5MVG+27xp8cAcWG8WwHc?=
 =?us-ascii?Q?oI+BTYGFm3O9fwEtn/wO5OUAIJwemLcn+ufki6AauCForU3YDNqzMtV6Bs9o?=
 =?us-ascii?Q?geKz9g0oetcUUOah6NR2CCP88sV5bFqZzlsnrhTAHqPs0IplaSH2VC67z3ow?=
 =?us-ascii?Q?yHfkCp23OYzWE/HkRF+5edcr44+EWjC+Zu4/Cqdrn7ltXaTuE254Qeqx7oHk?=
 =?us-ascii?Q?Hqb54ZSng4iV2shT8bq8kYox6iFPf0cp1liTGtK1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d13dc375-90b8-4d47-b0c0-08dcbd76b6e2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 22:07:55.3572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7I7YmABd5CtuzeYzXa2pEm0ws24fqFh5+CRli+hicq7UHf/woRlpGZhGt3q3hQjeNhcg5PtlPk8DFzbS4vwtJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7133
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

