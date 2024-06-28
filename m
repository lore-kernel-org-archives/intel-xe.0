Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D02CC2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 19:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9A710ED34;
	Fri, 28 Jun 2024 19:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JexTQuxg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E3210ED3D
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 19:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719602906; x=1751138906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mD0hXPHKri0udBs/qu1Wc/tTUb6giE/WCZVWlCjiHPY=;
 b=JexTQuxgtQ5C8aIYCY2JQi58EirmPbpsbWE3USe7r51aNR6FYGmGbMEV
 HHBR6qqxr7LPwUHsUr5Ks+wWlR8i287PA1UfbqBRZ9Tm4oBuypvRQRttr
 jaEXQgSxo3Q8sMxd3NeTsr2lrh+awJqp65/ffFRXXAHxZtJDVojWYeyxS
 WzE1Cq51nhyFgx9StXbtGaltQuzcZUN2QqV9YNoFNyLbHssW+cszxNmgN
 jK3c02GxeUwSo5ByqpmJmJkHVYK2REpx+vjbO285BJ2BHXjsqQfQp52in
 PSrl1mIRAG8tkDaI27IP+AgCKe0K8yMYUptbtMBA4vSsMjbbtUEIZQpCR g==;
X-CSE-ConnectionGUID: TQQ0wSpIT+m9fxSFOxLbLg==
X-CSE-MsgGUID: ArCVaF45S+m+j0vW1+VWSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="28189805"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="28189805"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:28:26 -0700
X-CSE-ConnectionGUID: 91NnpJUfQemAdOMjjKSUaQ==
X-CSE-MsgGUID: CJoUzAT6QmGY8Z+iZE67cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="50015545"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 12:28:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 12:28:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wv6aZg3mnuyAqYY0E9iWta4ucSsYW0fR2Z4C2fr7xTI5CEyAMFcumeaMsWQSkVAa5qcwZ2X3QaZbWffKqGiYqtI4TDrctq7+5ninXiQyR96u4e/ZAWYNGzFk6ZyosmBq/NTCuRsRyYMWbAWpClxskhW7g7mg0Jw91zfs7W9Iu8EOtW/piTl3B/Ve4aIdhwnWSDYrkJqY53DLo8APteyDwqjWOX4oJkTkvWiun3e6obZqXUDjiQrcRRQotjo+RvqAKMnntTSPWt52hu2SJ2te62vveNRezmudTOlL4AKQwILF/N+ZMus6iK1ZkTZkBdsPtL9Bd5wc3PtSBB9gONlkSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDrfL6ecbnJTiQdCN4YTYOS0+X/3RqtyxmPdi9oIKBk=;
 b=KBOJ6xusX0/iS0hVnIrk1Q2Qnqm8uaf6IHfXxLJZf1f8LoC83JJxtwLD6G2+ELDw03NQZJdZnxYGCfYCVSayAwCLB3grkqmbOq0FJo0oGEEC1EKPYpz8yhlIaoVOtvB3OsG6VRjCflI2XQqZMub4xlEmiP5mJL2i1GvIcy+c1obcei9Z7LNEKk45jKUSpnrVEC+G+EPldEmXo0QiKiekbvNwuoPzdc9kFnmRfn9zADKNBVqfrdYM3i9H++uMaXJERV+BXn4SoZM7yCDoyPITdYqnn4rCGVy+PqK+IiGJPakI1J04jXRo+CXT5WUwVvixXi3Vxkjx63W5yyszY3+YZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 19:28:22 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 19:28:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: [RFC 07/12] drm/xe: Limit drm_mm_node_allocated access to xe_ggtt_node
Date: Fri, 28 Jun 2024 15:27:48 -0400
Message-ID: <20240628192753.386137-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240628192753.386137-1-rodrigo.vivi@intel.com>
References: <20240628192753.386137-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:a03:333::33) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 5327cf21-b2ed-42df-458f-08dc97a8795a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K5m5yD/M5D/PcRCiVlWw3e1XsR+tCuNTCNcxmW6X+dAcO5IHIf0qcb0l00fu?=
 =?us-ascii?Q?euH+xoJu236QW1EohhNRzOvFW/TgQzuxIg7ho6KFwLmX+YeZvkFEe3IQaraz?=
 =?us-ascii?Q?guoryOlyBgxj+IL0DYMsmKdFE/5Leq64BjA2XzZFy1Ii/XOGEK2DrKWAWy8L?=
 =?us-ascii?Q?5H7M5sYa/0g9UX7JIjDsKm1JSuv4Kgghmy61mQo+FoqD28+FoAAWEqIseySM?=
 =?us-ascii?Q?7lgnpg6oyK0ntYdKWdHj7RvxjpVDp0NLlKNaYqUrS1FUL8/9i3wPvcQADx+C?=
 =?us-ascii?Q?UZ2p4jRojzE4KrV6jZiogWCSBBPAuy+pGqnyrTU8F5/8aE85wohxPB1SwH35?=
 =?us-ascii?Q?QbdaT/jwy5rBEPKVaYWyIKaeGAxZEf57ISP0K70BbbTDMx3/0MhWx2gWOSwO?=
 =?us-ascii?Q?abfopd+WGPk0qp6W12DPS8AjrAPX0DbM/9jq+0sNTDEdM22TR1+XXNQYSL51?=
 =?us-ascii?Q?FFaRbGZw4AyiQ3b1bGiOSbhyGJxgrDRK//0JOVs7DX+LG42FcdlWl725m/HM?=
 =?us-ascii?Q?0DSmbN3rwAvayGjFXR85v5WC1qL5iTJChxJzF4t1CpxhMc95JIzgSZynuyy0?=
 =?us-ascii?Q?xlzF5BkQlhDbLqTPiOovVwSDOtFR18Qv/1Ag0xvA920JVTSZ62cOtXdNHxF2?=
 =?us-ascii?Q?HSF2rD1zyjgcVReOF4cr6ld1lDwfG0PCA01PsKdYEsT75FVC1PZdLq2dw6ZF?=
 =?us-ascii?Q?vOexilDLt8nJBADlVGrsC5ntKLFrrz8dHX4Bu/CxnFa7x7avGAF4sHeEdI0Q?=
 =?us-ascii?Q?b8oNaKm1Gsdyiy9hrvkUC1qNM6gD/qzY7a21OOs0PXg9huURjKgAk15DebgC?=
 =?us-ascii?Q?QEao1To2jSUlEOmWl4Pt5P7EQpd6clkamhd1s5fLjHewgr7p2WURds1dgjaM?=
 =?us-ascii?Q?Ik4tx2mHr+qNXxv9704DxKwFntpSmqHC0+zYqA9uhxX0YVAMBC1H+zJGDY2v?=
 =?us-ascii?Q?zDfnWj2tzNAzOA36mzkkBLbb8bpX69HYnn7FFoxfUnl04zD4ssJTTlCy0NAn?=
 =?us-ascii?Q?qj5CNu6EUM3f1nucq7hI1SE/5Fm5LUo0WbGitBWn5WzqLIQ8DPBtlYV5Uo7J?=
 =?us-ascii?Q?Osl/WTnTU1yr+vHcF+HllUs48PCu3ObtJimD+9Yx9R526nKuWmt6GVi9wtAR?=
 =?us-ascii?Q?sRGure28tHZhtdHD2EsCgggp0mgp4IzBgChc582TiqWUBXM5Sxuj5yQbKspw?=
 =?us-ascii?Q?QCyJVCfMQbwi7N7yb5aJcjiT92hSk9nqY6xCZeA8rHAkkdRD0X7amJqhbyqD?=
 =?us-ascii?Q?0n/hcigZim9TWqstbfH6R1K5jT3mPrhxv2Wgz3ZNugrF/SUcor7u7sa3nZ+a?=
 =?us-ascii?Q?COWT0A92a28QKPFtMhJdm1UBW/nMee5hbv9OyQ+L7+FyBw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pKEcPwDOqcometiLEHfFTDS7RGL+vqtIMYhItEnX5EXSkphgI+Cts7FzHPBT?=
 =?us-ascii?Q?gMKT79fcOYH3vlnSs0NSzTTZ7J3IitYCMPAtrYQ9SgNYyYwZQdENyzln/nlT?=
 =?us-ascii?Q?kdVQJQA7k+9zabPLBC+/5lZWxpaCB4bep/qMjzBKat0WewSrO/XkgddWFoVp?=
 =?us-ascii?Q?KRMChSxg9DH3J/V1Ue84IcYCRjFIpXFG4YbafVR8lAwe3MjDDXlbOS1/iyIq?=
 =?us-ascii?Q?cQQNtn/HpuVihn14p+bvQKbE0xHcsDiOuwMTGT3b9z+tyDFX6R5U92y0KB4x?=
 =?us-ascii?Q?kZ4zeD531rQtzG+oKZX6yPMosIm2FaoRLDrTBwrItl8ms6ikUBkAVUB3OKDe?=
 =?us-ascii?Q?siworTIn+Y5FRDsvV86i0X/pcN2N8b2DNOdicDVjAH3hpYkkWHLRnVQorX6B?=
 =?us-ascii?Q?68AKOUJAVAh/hL0MCS9Hk8syjZZMCRg596ZcefY9JPTXoTb2gVxVBe2Dzefw?=
 =?us-ascii?Q?X92SpF/RQ5JkWwjB78VdGSbIYD2BT3Ofeei7q6tYW/eqYRTGwOlaq74PR5n4?=
 =?us-ascii?Q?ssrbPZkmk97RRv3au6IoZnQrhmmyI754VvIr7TzgNdolFJBGu3ob2qkZXqZs?=
 =?us-ascii?Q?NM7SGlqsgD/Bw95/LF+jb7/GckZLrpZce8wXD4CNE0y38AKU4h7vc/euT3j6?=
 =?us-ascii?Q?BPkagGYvfKnUC3e08RIzIS+0NwnDIqJz3xdPG6W1CIH9BJGP1pyDiMeiAOb8?=
 =?us-ascii?Q?9mZhycpPACJfvpL+Nm4jKkryM+SP6/98b3cTPg+lKnGq21OXid8Aie0jTXuU?=
 =?us-ascii?Q?2+CDbJvv8qDhIUE8AatkY6q35+7hoeZfonjCp01oLUpJaK1qjSLdN1QSoB9p?=
 =?us-ascii?Q?7BZ3DWwTGXy9rudPDnCIBt77EOu8kl/5qxUDgGyxl12lcf/p7r/aohafDGSr?=
 =?us-ascii?Q?9GaLunygT5obharsVDggCLMqtMZV2f6fqtrdMd8mDqbuQpFMSVoN21jGXeC+?=
 =?us-ascii?Q?7cYNAZI4PmfpbUNS4PyIYUMF2UN/MSa/r/mk3QDtUacTZwxA1O0kPHajrwX4?=
 =?us-ascii?Q?VGscIxDAf7pPXJ9gdvqVmqxi8z+PP/FJGEtEo4rgRlqWG3hrUSmiWfcImQVZ?=
 =?us-ascii?Q?2cLeMVjqCrL9MYCYUFZPzcyYJWtCEpGqQZCor0PKtz+S15xPgHhrIO8fWlZ4?=
 =?us-ascii?Q?6TBPEUgrYshUaQYqBCORKv0m3zUs9TadniD3FP4pF5TIEA7UNyOJemFUmsXi?=
 =?us-ascii?Q?bV/6pC9rXUeHnYpeukNNxaznUEhQFTHc6Zld46xdkBA6ErTSoZBSpatloD22?=
 =?us-ascii?Q?I66pU/SZWB0eqr3z6fsztjpeoXpAOuB1gZcbRQ+5SAU1s1Vu1gIBIm5M0RND?=
 =?us-ascii?Q?gfCqvhrRWvXwwu5NscTf+ooWXNYwSp+naKhQsJ4CFef41Zbei3uFnyP4Na9C?=
 =?us-ascii?Q?oWGXMQP5pA1axZxkdoPNUsbYW3Ckktcxw6mMY00CpGyrHfPlUn97KIbm5WZ+?=
 =?us-ascii?Q?9lPWnWhLSvVNDeD2WT+Gu0JwQ9Z5T2d4/Ywy0HnCO494W9Fygsht0g2C7NZO?=
 =?us-ascii?Q?SCEQhXlondL1pipm6NjDQr1qUHclz14O5aQkmPt9mJTUTzQF6U66Bu0luOLB?=
 =?us-ascii?Q?zcC8syHH4gvdZ3DDdheitXdPxJZxLuV1pYsJfXAWFTtQAOGUsHTKtdy3kejB?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5327cf21-b2ed-42df-458f-08dc97a8795a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 19:28:22.8076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXE/AasMUkswtu6J2whgeJS1cgG/EYwa6KXEAJ6cycFEfnML/T0QXZVCuVtLDZwztTMv+GjyixnPNxU/TV3Q3g==
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

Continue with the encapsulation of drm_mm_node inside xe_ggtt.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c     |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c               | 11 +++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 12 ++++++------
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 0ae1a635e30d..b1532fcfdfb6 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -320,7 +320,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node.base) ||
+	else if (!xe_ggtt_node_allocated(&vma->bo->ggtt_node) ||
 		 vma->bo->ggtt_node.base.start != vma->node.base.start)
 		xe_ggtt_node_remove(ggtt, &vma->node, false);
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0c350f367427..1c823919dabc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -472,6 +472,17 @@ void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 	drm_dev_exit(idx);
 }
 
+/**
+ * xe_ggtt_node_allocated - Check if node is allocated
+ * @node: the &xe_ggtt_node to be inspected
+ *
+ * Return: True if allocated, False otherwise.
+ */
+bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
+{
+	return drm_mm_node_allocated(&node->base);
+}
+
 /**
  * xe_ggtt_map_bo - Map the BO into GGTT
  * @ggtt: the &xe_ggtt where node will be mapped
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 5147930357de..f816b3c0732b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -23,6 +23,7 @@ int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt,
 			       u32 size, u32 align, u32 mm_flags);
 void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			 bool invalidate);
+bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 5e20b0114c66..1b334fa01b07 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -235,7 +235,7 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config)
 {
 	u32 n = 0;
 
-	if (drm_mm_node_allocated(&config->ggtt_region.base)) {
+	if (xe_ggtt_node_allocated(&config->ggtt_region)) {
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
 		cfg[n++] = lower_32_bits(config->ggtt_region.base.start);
 		cfg[n++] = upper_32_bits(config->ggtt_region.base.start);
@@ -376,7 +376,7 @@ static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
 {
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 
-	if (drm_mm_node_allocated(&node->base)) {
+	if (xe_ggtt_node_allocated(node)) {
 		/*
 		 * explicit GGTT PTE assignment to the PF using xe_ggtt_assign()
 		 * is redundant, as PTE will be implicitly re-assigned to PF by
@@ -406,14 +406,14 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 
 	size = round_up(size, alignment);
 
-	if (drm_mm_node_allocated(&node->base)) {
+	if (xe_ggtt_node_allocated(node)) {
 		err = pf_distribute_config_ggtt(tile, vfid, 0, 0);
 		if (unlikely(err))
 			return err;
 
 		pf_release_ggtt(tile, node);
 	}
-	xe_gt_assert(gt, !drm_mm_node_allocated(&node->base));
+	xe_gt_assert(gt, !xe_ggtt_node_allocated(node));
 
 	if (!size)
 		return 0;
@@ -439,7 +439,7 @@ static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
 	struct xe_ggtt_node *node = &config->ggtt_region;
 
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
-	return drm_mm_node_allocated(&node->base) ? node->base.size : 0;
+	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
 }
 
 /**
@@ -1943,7 +1943,7 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
 
 	for (n = 1; n <= total_vfs; n++) {
 		config = &gt->sriov.pf.vfs[n].config;
-		if (!drm_mm_node_allocated(&config->ggtt_region.base))
+		if (!xe_ggtt_node_allocated(&config->ggtt_region))
 			continue;
 
 		string_get_size(config->ggtt_region.base.size, 1, STRING_UNITS_2, buf, sizeof(buf));
-- 
2.45.1

