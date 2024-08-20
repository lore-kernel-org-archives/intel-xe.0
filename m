Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA88CC531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 20:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C22F10E2DE;
	Tue, 20 Aug 2024 20:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzHvWuNr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C55410E2DE
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 20:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724185574; x=1755721574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yLYqJAWrKs8ufPDgFhClF+PeGNTPjbcrbZTvXTUnGaE=;
 b=FzHvWuNrHbAfBrcPysT+rZlZ/nx/me9HfTXvo2+VrgYR5QruYfuD+7MI
 ScSb7FwnEfB8gJvUFyrqYBi3Ya8JVqzVzLXySXpu0r8U0URu2Ad9TFYdx
 flEVq1aJ/0R612rceDrdLFkCqQU9GcDQSnQc5RFcqoa8DVW/MmCXRbcUc
 qRcOM7o318Tcn1++fnWMCo0XS58QGFsqh7NZeCHmG4DOLYjyNzkYhsas4
 9c30RcZ/tdisMfdIu+lQKu0Hho2wTmheucC6i9WMOkkrLVJtXizARk5sk
 ltrx7UtkDjc4PiSYy3xzknUKt2sOIcvcTCaYYgg9fpiHhFZ8NOShDSiyr A==;
X-CSE-ConnectionGUID: 2Q5YDKxCSEGVy1AoPmTNGg==
X-CSE-MsgGUID: ffnmqxVPSrusU9Cf2+96eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="25413573"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="25413573"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:26:14 -0700
X-CSE-ConnectionGUID: H25OeMS1SAutiYkcamM8ig==
X-CSE-MsgGUID: zfabZid8RsGaBzVemqJLlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65809728"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 13:26:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 13:26:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVMvJfjdoxKPGYWQ3i19pQYJHzrxqtNOM0rbXX8SlTzL2WzUjWX6y+l8z8c0Sc8AiTzKWpsGhopVr5iG6w3OBFOtFYK47T2nK7TKPgh7EfW8I6jbfi9ZU/Fe+I1LhosBCWcyRc4OOI5VWVyFDnMB7Icxnj0+qgXqMS9IzFSAyXt8lrGWHowo+Pit4R5Xzxqo76r1letq14Wr3kXBPKB82K6+VrsAj6cQNHmBtVGMcSaRlvvMq11C6YjxCzUbRjdn45Yi7ngwAuLCnGagflmgjDYDyaro+U7Cik7KP317ENJajGVBgktwB1UuewZPtIUtLcmrXN1J8QuBPspuUhe31w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZk2YhbbAoOy0Vaz6pO3TvZtfrppic7rJaKuEw5NufY=;
 b=Psri0HjsPjSBTV5wMRU1axPbG9tlwiXTMy36LICapbbA2UMwZCZ7cKZ87BHRSEISwrL9ZM3aejPNGCCuey79Ef4QEIfFBKyFkoHfw95uMxQkH/Dc8CyyJWAFIdFDqsnqVohQZ+GF1HxJsTba7k2AbjiPsiYL5hqRmsIGg4abjFxFnklfGkyc8AvNBVw5RyMAFxgsImKGFdT1InWtPIXh9WauyPpnRLjNgmVyw0YKzZiB7Lv54QyfOZXMQjzG3cLhV+4vNyyyYwjYdmBfAAVV91V5ELrgkbZ9l4TEz8Gsi6YYhLT/Ny60lLqdLWtM3Vdt55FT7LKPcWe5ZoVJnTcyGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 20:26:09 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 20:26:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH 08/12] drm/xe: Introduce xe_ggtt_largest_hole
Date: Tue, 20 Aug 2024 16:25:43 -0400
Message-ID: <20240820202547.300257-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820202547.300257-1-rodrigo.vivi@intel.com>
References: <20240820202547.300257-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0095.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::36) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: b9cfd552-b8b8-4ceb-9220-08dcc1565205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p/7U3eTaIQh5PUg95TuZlnmRRgK59U8wexDoP4dQDYkOZuYCnQH1PfnvoIR7?=
 =?us-ascii?Q?IZ9cQXTuZOfAvnp3swGTiEbUU+0374fDRujyaDJ8wwKrLr4kYQFiY/MD9/C7?=
 =?us-ascii?Q?I1EWoWjqpmgIKhbec68Mm5i7cXw9L8qThFtoWrS6HQzyBzr+Kp5zbFW178a9?=
 =?us-ascii?Q?+FKAiIJlu1zN+Fxa4rbil0dkTLNxL1/N9dp760DGelwE6esvWY/pxgDNJlSv?=
 =?us-ascii?Q?IO3GY0dCwFi4/Y2TJ7dD5U5LLhBATOi3yLMPFG/bfy33/ytJPRxqOfXmX2xl?=
 =?us-ascii?Q?5MncfmBVHgi6acSOx5nMFWVyh43WgFJViF+wUuQgb0Dl3utfnV2U0BKi0Puv?=
 =?us-ascii?Q?WcGCIHlR716tRJ0LqM8L1FO0ptNGApzWPtDjhl0sYB9WlN7MJp47sCn/6qEl?=
 =?us-ascii?Q?wIO5aAMRG4/oUdEeKmDPG90ExtOFlOaGEmINoD1g5mGs1wGy0n9FPUfZ9Syy?=
 =?us-ascii?Q?WH5gWptM7vX7aLTLWiv0KuiFIRJq1N91zibLUoKm5DMLHm0+u4R3cNY8z3yF?=
 =?us-ascii?Q?cmP4yBccVkXckWzoI/KhPQBNTxVLaJydK1oXh6N0GdiqfrYJwc6f7cI3Hhrn?=
 =?us-ascii?Q?thbCCD2xo9AQO/eVB7OmBnB7xSqsAX4T19auSK2T5whij4Qslt416TiAnROn?=
 =?us-ascii?Q?4+jPoKASqhRGzsBjkpJnGe+wnn+UuGuQXpfZws8em8cE32DcCANabFbq4clx?=
 =?us-ascii?Q?h2TKoPKzUlKliPAVs/BuQXj5sgnHAftx1TITqGtjlIuVUW9+bgGXQ00aiZFi?=
 =?us-ascii?Q?VZuipoFfB8m8t/f3poh09PCmAMJr6VIXGjeSD1NXL2LEn8Vsd2nqLWiIOYNh?=
 =?us-ascii?Q?UpGqXd5ki2MTgbcROuWYcT+rlt1ZrgyeEA4h2aeTFDqXeW8/vcy6cs/OrOwe?=
 =?us-ascii?Q?Tadr3Fe6t4dnTcgXlPk8/+ye5ne9v3li9XVOAMX2jXbGD578vlej6cfBLJbs?=
 =?us-ascii?Q?pyF5xrrXE4daMgN7fPHwXQmMK6DboFzX5LGACT5tmnos5Fez103PmfmCCgNT?=
 =?us-ascii?Q?0pckWaFC3m7J3B3+0NEcULKAWD5Fy4uD85jlCSTfbC5boqOjyPOoGo+qACKB?=
 =?us-ascii?Q?qo4fa01Po48LXbNuKrepRvA2fDv+78q0fgbc17dTk5RbZNCf+MMULtLRWZlO?=
 =?us-ascii?Q?V0swEx2wu5JD+KhhY9h1INj3mt3lE5kYE8m2RQGlRGzCyHrMZ1F5JPcJTge6?=
 =?us-ascii?Q?OV7cazbrx2Hra3iUfVaCEdRYZdhME3fat0h48rNPggHM03Gslv5cqdwU75Mq?=
 =?us-ascii?Q?CGOx2j4KIuFSj9vg77JzrdDSS92u9LsyII5IGRNW37C+OorURkTPoQ/cTBYt?=
 =?us-ascii?Q?X4Xf63kirSqP9cM3mPEMgLBGlUcYLRaSVS7yBToJN+4Xcg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?53v3PYk7GOGAN51A3XQ/f7FLmrY9YrT2vj+QAF3P3n1FKSRXsf+30jG2LpoA?=
 =?us-ascii?Q?wQGL3XcgemhPy+Sg/bXJx1jXHvGLY3fForJNrIs0uPBn6TsWYcwIADL90cye?=
 =?us-ascii?Q?SWNIyqxo5MCL/nqYajeYdZv7VYtB1aI5MwyqFM2CTCKa54GX4TVklu3fB8Nm?=
 =?us-ascii?Q?Fv48AsZXYG6vnMOWV1qKiIor8T0w8nzCWdIJVxyFSQ40S+JpdI5KhMZR9sJv?=
 =?us-ascii?Q?rn1KBkAANhZRLdgEX6cto3UMN4JbbnUxUgy4EBMiZZCuEvvURhinBSWFt65V?=
 =?us-ascii?Q?YSxRSXBNsHP3HJFyVND10kyb1YzGuIasC39P16YeN3RqHZm/U2OoUsFegh8w?=
 =?us-ascii?Q?BiRyAcCVOohBJLyWC/yGK7iHYFl2LTf5rpcb2x/ujFy8BY0E+L0vBOnbomRK?=
 =?us-ascii?Q?rty/sL18QkfXmpEUSd4vQd3M3wjPRfx4lS8tvfpsN9ND/OkAkFLLNq86XxIL?=
 =?us-ascii?Q?e1Pdm5Acbgf09wkgZ/kHLFYOZrLV1rX/llUftfbxV8c5TGWkvjuVV76UxMMS?=
 =?us-ascii?Q?XBSRInNCnAenPooPoPF0nt2OalbJdGhR13xrR8JrCqitYnAUxjrEV48QmKlQ?=
 =?us-ascii?Q?vxDWixHx0qFFBX56rjNYQWoPD5UZGSco/8O68eT8f7tETWY0puiK0ruOUkVH?=
 =?us-ascii?Q?y440xgcohPYBTTCpOxwtJkdu1m7knbtrq/938ppRkkqMq7TRr8FS3hd0nU3N?=
 =?us-ascii?Q?oRnR/S6hOlrb2ZiIvzrBHcoY4FlhgfuC5XGrVhhBCUbEe7ngaLxvD5l9ovqf?=
 =?us-ascii?Q?Ko4qQDfDb+92nUVmTqzCo2MEclpv8DTk9zGI5c9cmDGskAR2AcRhCrxXHmbE?=
 =?us-ascii?Q?kqnJ3ihowLiClH5Xpgvv5BDlqbzEfrw+QakGN8XQ9IbQrWCCh1Le+W2ox9yg?=
 =?us-ascii?Q?ZY9Z2m0cLlxuu5FscLiI5uL3Jz/Z+/hcnpMa+jk/05iAqWhwot9514f9NfYr?=
 =?us-ascii?Q?LYAacPHHszaGaevz9y/ZSDyP3Uez5qBkBTiTcauC7dBVdK4r6qn+MQuJO3Nb?=
 =?us-ascii?Q?ndE7xXfBtmn0vxnfpjPG02ANdWYKag6Cg1ehKMSbG0Ts8TTkjj2JB+SoBWZ6?=
 =?us-ascii?Q?LS2MSD7u89A1sXcO6jv5mmXZvFpbcgUsYckKeIQBXJggSD2LMhXTHQ0/n5ap?=
 =?us-ascii?Q?R1dBOtkADcIOlVPgvsGUspP+Nck8R4FDdE9Lxm4w5QlMhckMDtTOcPtY4Jlh?=
 =?us-ascii?Q?EppmnDkQ71jusRZfx6/xscz0kMcEAUqSTbZ2wxL+Kp5F8hdBHQ/rxYCdyJnF?=
 =?us-ascii?Q?gsmtGlCSOvbcH5UUF5MIC4A1D5+4vW4zAMAPQ5sStchsFO7ofG+DVnCwj+6b?=
 =?us-ascii?Q?b3Cv3NKVQ9MR1F9Eu6hhptMIjdQ9fBSycKncGkW28AWvHVabq2zk9v+kJYrt?=
 =?us-ascii?Q?R3v4WKTXlECZ9f97FIpMxPSRodS5QJ+7MD6HXpkbGAt3Nx6oPVtWVki+8Fps?=
 =?us-ascii?Q?J3q4jQPZhcDv17dayT2JCFCf30gUHabCi5YoMNAOPS9if5LgWk96nju3wuaU?=
 =?us-ascii?Q?nZbV6QHSU0sZZZGvStN/LqcvFZ+lSt+yz9pnvmQofB2ILoE53t7PEMCirPX+?=
 =?us-ascii?Q?yIqsZhHzGQy0LL5/gIUa8M3QmCY9YRWfwnW0Sd3hTpsA1u3qzVEw8cs72h5g?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9cfd552-b8b8-4ceb-9220-08dcc1565205
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 20:26:06.8805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wqFyw+l3box5G3IFLz0GquJdGX7V/vC/seTtNlmlV4Ime8ZfsAIFcLu+Z7/TLKKmVJm5puDywtDmCq5E2SgtnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6029
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

