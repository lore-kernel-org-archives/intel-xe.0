Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F68C531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 20:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A1310E2D3;
	Tue, 20 Aug 2024 20:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n97Av3Zt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791AC10E2F7
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 20:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724185569; x=1755721569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0f0xGgvGDN9FAaRK0TC8lszxrTmyQz3IkOk2ZoslOEg=;
 b=n97Av3ZtQaEDUcx68LkT3fa5Wuloa0nXzziHZXtnAITj+ONOLSqJRlmR
 fdQdU4qHrASOAMToxgS3urFl3KMOYK79Nyo4QF5OooZVQZVuyc1NzUzfg
 UW+/3dXGdiiI6kb1J+JizLzzoqibCJa9gakWs9WIfeWo16yUmGx5bJSgj
 UBoTGsOamdc/wR5EoLeZzGIMn1F7lTg3rnDDWy0AxRHp4hNn5qFbqIVSo
 4NMgG8G+0hxzHDxgLD46Czozvpw115nzOZ7ftqUglwg8XneS6Z2+sA7gr
 7ZjULv8BjTwY+bPFgoBSHnrtTI9ymJ/JaWDz4cO9aR740at82UF+jcL31 g==;
X-CSE-ConnectionGUID: UmH7g2L1R0acu8j6x+JVMw==
X-CSE-MsgGUID: Di9vnHuvQl+rvNiqINYUfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="25413560"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="25413560"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:26:08 -0700
X-CSE-ConnectionGUID: oOXTklsSTJ2jIhb6dX2t8Q==
X-CSE-MsgGUID: xeC1CPwFSd2mJvIm+DKxPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65809692"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 13:26:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 13:26:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1/ILpWW40LeapHcmjeFP+R64ncSJ/IokLQj4oVDxReDCZqX1UAovy/qzy05aZnon5mnCWK3Pzv9wlcQ2k5Y3Niro0C50rMzm0gXmkvA3LCxts1f1RI6pDhH2Rgp1bjSPsoD8ZepC8MBn7Fr//9uWONEuN/U+BAI2ZSM12nTWzkbv2xKFGURBr34HrFXU0EVJbPMuwBCj7E3uKDCKCkYzK1uADeIK1twagvei7c9c/+CorYfsy14Osh4rbr9kZIJ0hPgIi1n+9qwho9/LoQ1URXlIuzmi9FDCINk1yHDxJvElzWHyTN1ReKIFqROxJmOg5BsUrWi72vYqk1uIElbGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxeDTExAiMFb0rUpW4mGKkpKdrbnR5DEJdeAX76um8I=;
 b=f1oEUtYu2ApkmPJukjqj004y9Aif5Ky0EbDPj+FY4JNmlaQiggEL7b9mK91I6UCw2S22Cun04e1f3r/Ey/PR9EoyUIf6kJFGX+LeC8ctR2om1uGWSNBPaJsyH8vB5lCmDgWaquB8g9yRym60vnmRHqe96iPOonw2e7IJS/yyz+orrBWDt3or6cm95mjpB6+7lfT+OwHX6dpIQHs/vX5b02q9uHJVx9P7DTybz5WpbdKCbSUzDELaIeCDZYG1T4o20NA7D+Jdw2CVaweDOAMboIDaMhjAop3mV+8JEFxsTA7eybI1wEYLy0ZIZ8qKAROIoQBDPFHuuMseKOoy5TWHOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 20:26:02 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 20:26:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Matthew Brost" <matthew.brost@intel.com>
Subject: [PATCH 06/12] drm/xe: Rename xe_ggtt_node related functions
Date: Tue, 20 Aug 2024 16:25:41 -0400
Message-ID: <20240820202547.300257-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820202547.300257-1-rodrigo.vivi@intel.com>
References: <20240820202547.300257-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0038.namprd02.prod.outlook.com
 (2603:10b6:a03:54::15) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 08bed7ae-58ca-48ab-26cf-08dcc1564f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YbAQvjqPJfjbrPZ3vOxoB5xfXpINPRAzXrooNv6ZPRKiizQZJEq1psamtMUz?=
 =?us-ascii?Q?KJ3UUzzV52UqqhraSfuoD9ovvQ0Fut+wbrTiheSmqHmbxN1SCs/ZWo1vALSY?=
 =?us-ascii?Q?GYBRybEw666SSlb7Uf/0BgzXgkolu8BRQaEruIa4Jpq045pIVKJLFbvd3PM+?=
 =?us-ascii?Q?mRwKw//Je/C3hwNzZFY0GP+XmSKYxRi4TH8qhgZ/jJL+t4FuuvFFHhq7X39Q?=
 =?us-ascii?Q?pEuzsOHxgA79LLiooWC5c7BP23XS5yFw+/k/dOBsqgCUrSLzPhiyPuyde6jF?=
 =?us-ascii?Q?BjU9cn0GsY/MCfiav8lpT3PMg3TLQhBnSI+z4WKaX9b+jlzUuiuMCHjeR7Dq?=
 =?us-ascii?Q?6jyOvci1SpFiwTSLD2RGrlm3zEp8X2AY3duy0ZRItqJZ6lGW97HtiC8Y6Pv2?=
 =?us-ascii?Q?MdNNxFa2phqPYCB3Q3d2sOMTyYNJJaczqWh8+wV8qMpSejBv/SVDW+qUmY9E?=
 =?us-ascii?Q?aUpYyQDjn0L9ZbAraYmir3CNpca0HKZAZowgtJOxa7hBd3ZvArSrONvmD/Uz?=
 =?us-ascii?Q?f86ze4XzbO/bSjxnfBM8ZR+nhcv7l3Er4uxto6p+FmC1JdIUXWGJW/pXOLG+?=
 =?us-ascii?Q?PS9cLTM7zTahIHqtecU2xRAR+B5nhHz3NvP7Z8xZXlGQoUfaGDp1dAI++Z1r?=
 =?us-ascii?Q?huxfcWdJKhEIjZtVvrB3ou/DiWuNcKNhcac4oNIGKRe1Wn+6Y4DHzm91ATBV?=
 =?us-ascii?Q?Mix2e9RMhYc5SOH2/9UOrKwvkva1NQeEvMetesVpWZVZfeXmJdNlI//xSIDO?=
 =?us-ascii?Q?ZdU0knsaw4YZrsEJph1wlxCXPr111zDcttgo/WvkMK/U5qtJza9DYhpkP85t?=
 =?us-ascii?Q?+FN2HRTFGlDom+zqKAbqx5eZTczcGC58CHxqD3qoRI2SGiyx3pM9+WQI5/Pr?=
 =?us-ascii?Q?9Dxvsv2l4EwBmDa092TV6A4GzAvUKvwEsFarYCz7MI+BBOU+jXGsVB/LFtzt?=
 =?us-ascii?Q?kb29njpB5JAOdiyJDFXBUyKTgPAk+3PMY1uCLwUVbZ8L5Kk6S2GKWS2Wzd+m?=
 =?us-ascii?Q?2A+5nme/8MC8borXDTKYgXyAYM0s+HJg39OZahXzOuIEzZq8aLQ4ajawBwlP?=
 =?us-ascii?Q?OtW6jhaNTkfWi5BttdDF8ID1u603cT7iRU1pwM0+DY0j5SlG0NAzYkYk8XgB?=
 =?us-ascii?Q?xKXb3fj9eD3mOb5Li5b+6aTh9bYP+P2EwugsuZ8qkMhY+4kMCR7ordekPKjG?=
 =?us-ascii?Q?j42JBYlA2I7qJwRv+H4VCtxqY0E52NGGEH72PrxSbL04rlKbNrg1wAXIbVLq?=
 =?us-ascii?Q?goCdYwmCRrDBZT3xHeB4MwBOVajzIIKkFrk/qgAZ3YaKYLoCJk95KVmodZeS?=
 =?us-ascii?Q?59m2P4VRvUAPz8fzMw66EtAEyc7Qdz0nPVDNdH7xv2mifw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?25IzhAznuLtB8810R0feQI5SPFfRH6SsWkqL30fiWG0Wz+kIuGG3bR9GU38V?=
 =?us-ascii?Q?neUgu6JcZt7DTbf4uOorDGHRILxoRIgnhikTi/AEMhc0Ivoddvl3TIEODUcv?=
 =?us-ascii?Q?20dE+Oc5XlIuMt6q6v2jpjEJjKJa+0AtAy96Shs4gG8Wxe3Rz/xVV6GIzvhi?=
 =?us-ascii?Q?kPyRa2s3GFYbtmXLo98R2xxJnJiGYPEnFiavXnrhYQEOZuepZ8rrc2quaNOV?=
 =?us-ascii?Q?gxVffq2fHBKdKjPtkwNa8h8u1wYLnrUEVogbCVvNb2FzHnr0aF30WFyvhw8G?=
 =?us-ascii?Q?e+aVz7tCVEd+0b/b9KJAbTIdl2XabFeW985QO7lx9uGz59Owtja24DipBk/Q?=
 =?us-ascii?Q?4FR776d4kHuCLdrXNuM6uxkIqhHN4clWp//HZxyoJkKg10m1QFHuD2CvFCuu?=
 =?us-ascii?Q?XMYElAtP2pRUHf9mMzfzB+kyULrzXMtWD3sgnWresQLgaQb8AjSDrdHpTmx9?=
 =?us-ascii?Q?edP1PBdDUrx0+GeiQMQUbfPZCoZW4d2a31JoMko87TIAS0sIbzKmGOFmsfDn?=
 =?us-ascii?Q?jdqipQ3EU1DFMawkqoI2AXtXnhzgF9tPVechlGUTyGPbgF6bxUYnO8Iw4Ct7?=
 =?us-ascii?Q?COh8xTpF54OsaIoNqGUsK8rodzdt/UJvW2r8rTahIUn/KI3/uJ+sgdNNeDdf?=
 =?us-ascii?Q?NzNy+L9HgGazHV6nD0kPr0wjmkzeyYTu+DjZRM+rwJZq69b2sSDfWy+J2Muk?=
 =?us-ascii?Q?5VN+51A0xCzuXBz3Lfe08WTeeCTIvPqySUdSbnaOMIVK/vI9GYJOn2Jq5mQD?=
 =?us-ascii?Q?PJbVXF6CiEtNn5Eqa8lLoxNmr9l0j4YU0F0N3kHAoQhZFB8RGkmdYR+7cQyC?=
 =?us-ascii?Q?77oKpww6mrSwII/gtIHjn64vQXZ866nf739fLtFt6L/0L7jld0Y4YXr5MOdb?=
 =?us-ascii?Q?g22aSdIvkO6OfauDYkp4rjpV3RZ28Ap+G8P+BRGFsbikLIfxDyVl0yX+BJXr?=
 =?us-ascii?Q?0reYIucLdBbdnPkk/R13roY8yWJvjyCScUPH76CmynwVUDrcDuvjR3vEbX2u?=
 =?us-ascii?Q?WKfgB19fiVCW6Jv5loiFZptZ5cfPIOa1sIQVW+5J3HYqntFuJBYnYIp+P/1Q?=
 =?us-ascii?Q?hISahCRkoJDseonC8mM1pgmduSmflsYOhCKlzoUy2n5sW0Vf2CdZWSmSoiQy?=
 =?us-ascii?Q?x2xXDGDwp1gXNj65AWKnvuaOFyQ5iDQZ7j8EufxxaU44gkiaimE6rStZ424t?=
 =?us-ascii?Q?sPG+BIIwZ8aQhMm6e9dZNii5FPV536sFsk/0a/FStXuu4Bytr0hxVBcbixXT?=
 =?us-ascii?Q?KYG0Hg3fltrFa1gxS9pXzW6ora0tSahzU8BpCAcVHinFspklH6lIugpGiAGw?=
 =?us-ascii?Q?ZblS/l3p4HGOQjHwbU3fw+jQ55Jz0jicnPtXu/QhEjJn08RQAODOGOwnOsal?=
 =?us-ascii?Q?MZshzMA3tdHnHa4409/tPRhO71ruIgFePkagzOXhtJuwlds1I/jtkXtNlup7?=
 =?us-ascii?Q?hIfdfslbSfO528DGfPz7meEj3lC4P7yDC61+dZ1FMr8xlEkNMZkFdSr22aaV?=
 =?us-ascii?Q?Un5cyGmyXp01D5D6pUZWmjb87snm4uEBfFGx0mdIoJeprQefIRrmn0SR8dRv?=
 =?us-ascii?Q?95YbLyn+rHN0qZKKoiccVpuIowGYUpoDrF4nfKqb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08bed7ae-58ca-48ab-26cf-08dcc1564f60
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 20:26:02.5135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jn1c2Qr4+FUm+i6ps8D3Jl8tWLRp4fl6ZKv8Z4pgpdRrKQD6io8v0zWJIUa6X+kF/tu1T8OP2t1igQkNHZ76Qg==
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

Bring some consistency and prepare for more xe_ggtt_node related
functions to be introduced.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c     |  8 +-
 drivers/gpu/drm/xe/xe_ggtt.c               | 86 +++++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt.h               | 12 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  4 +-
 4 files changed, 54 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index a93923fb8721..db74c3395ef8 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -209,8 +209,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
 
-		ret = xe_ggtt_insert_special_node_locked(ggtt, &vma->node, size,
-							 align, 0);
+		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
 		if (ret)
 			goto out_unlock;
 
@@ -227,8 +226,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		/* display seems to use tiles instead of bytes here, so convert it back.. */
 		u32 size = intel_rotation_info_size(rot_info) * XE_PAGE_SIZE;
 
-		ret = xe_ggtt_insert_special_node_locked(ggtt, &vma->node, size,
-							 align, 0);
+		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
 		if (ret)
 			goto out_unlock;
 
@@ -327,7 +325,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 		xe_bo_unpin_map_no_vm(vma->dpt);
 	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node.base) ||
 		 vma->bo->ggtt_node.base.start != vma->node.base.start)
-		xe_ggtt_remove_node(ggtt, &vma->node, false);
+		xe_ggtt_node_remove(ggtt, &vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
 	ttm_bo_unpin(&vma->bo->ttm);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 1cf682d15253..e0da24bb5774 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -403,7 +403,7 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
 }
 
 /**
- * xe_ggtt_insert_special_node_locked - Locked version to insert a &xe_ggtt_node into the GGTT
+ * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt where node will be inserted
  * @node: the &xe_ggtt_node to be inserted
  * @size: size of the node
@@ -414,15 +414,15 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-				       u32 size, u32 align, u32 mm_flags)
+int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			       u32 size, u32 align, u32 mm_flags)
 {
 	return drm_mm_insert_node_generic(&ggtt->mm, &node->base, size, align, 0,
 					  mm_flags);
 }
 
 /**
- * xe_ggtt_insert_special_node - Insert a &xe_ggtt_node into the GGTT
+ * xe_ggtt_node_insert - Insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt where node will be inserted
  * @node: the &xe_ggtt_node to be inserted
  * @size: size of the node
@@ -430,19 +430,53 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-				u32 size, u32 align)
+int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			u32 size, u32 align)
 {
 	int ret;
 
 	mutex_lock(&ggtt->lock);
-	ret = xe_ggtt_insert_special_node_locked(ggtt, node, size,
-						 align, DRM_MM_INSERT_HIGH);
+	ret = xe_ggtt_node_insert_locked(ggtt, node, size,
+					 align, DRM_MM_INSERT_HIGH);
 	mutex_unlock(&ggtt->lock);
 
 	return ret;
 }
 
+/**
+ * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @node: the &xe_ggtt_node to be removed
+ * @invalidate: if node needs invalidation upon removal
+ */
+void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			 bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	bool bound;
+	int idx;
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+	if (bound)
+		xe_pm_runtime_get_noresume(xe);
+
+	mutex_lock(&ggtt->lock);
+	if (bound)
+		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
+	drm_mm_remove_node(&node->base);
+	node->base.size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	if (!bound)
+		return;
+
+	if (invalidate)
+		xe_ggtt_invalidate(ggtt);
+
+	xe_pm_runtime_put(xe);
+	drm_dev_exit(idx);
+}
+
 /**
  * xe_ggtt_map_bo - Map the BO into GGTT
  * @ggtt: the &xe_ggtt where node will be mapped
@@ -522,40 +556,6 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
-/**
- * xe_ggtt_remove_node - Remove a &xe_ggtt_node from the GGTT
- * @ggtt: the &xe_ggtt where node will be removed
- * @node: the &xe_ggtt_node to be removed
- * @invalidate: if node needs invalidation upon removal
- */
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-			 bool invalidate)
-{
-	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	bool bound;
-	int idx;
-
-	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
-
-	mutex_lock(&ggtt->lock);
-	if (bound)
-		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
-	drm_mm_remove_node(&node->base);
-	node->base.size = 0;
-	mutex_unlock(&ggtt->lock);
-
-	if (!bound)
-		return;
-
-	if (invalidate)
-		xe_ggtt_invalidate(ggtt);
-
-	xe_pm_runtime_put(xe);
-	drm_dev_exit(idx);
-}
-
 /**
  * xe_ggtt_remove_bo - Remove a BO from the GGTT
  * @ggtt: the &xe_ggtt where node will be removed
@@ -569,7 +569,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	/* This BO is not currently in the GGTT */
 	xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
 
-	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
+	xe_ggtt_node_remove(ggtt, &bo->ggtt_node,
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 30a521f7b075..5147930357de 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -16,12 +16,12 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
 int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
 void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
 
-int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-				u32 size, u32 align);
-int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,
-				       struct xe_ggtt_node *node,
-				       u32 size, u32 align, u32 mm_flags);
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			u32 size, u32 align);
+int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt,
+			       struct xe_ggtt_node *node,
+			       u32 size, u32 align, u32 mm_flags);
+void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			 bool invalidate);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index f107ae550c0f..3ca98f8a0eae 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -382,7 +382,7 @@ static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
 		 * is redundant, as PTE will be implicitly re-assigned to PF by
 		 * the xe_ggtt_clear() called by below xe_ggtt_remove_node().
 		 */
-		xe_ggtt_remove_node(ggtt, node, false);
+		xe_ggtt_node_remove(ggtt, node, false);
 	}
 }
 
@@ -418,7 +418,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	if (!size)
 		return 0;
 
-	err = xe_ggtt_insert_special_node(ggtt, node, size, alignment);
+	err = xe_ggtt_node_insert(ggtt, node, size, alignment);
 	if (unlikely(err))
 		return err;
 
-- 
2.46.0

