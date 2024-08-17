Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1129C52D7D
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 10:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9A310E06F;
	Sat, 17 Aug 2024 10:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnNoqwk1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84FC10E05D
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 10:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723890982; x=1755426982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=040j/YrP3A676ui0cKzCLVpHepUU3kYPFVSLx1AboJI=;
 b=GnNoqwk1sYQPlsE3bTpcTJOoLGjk7DKCfWtQaSKiht/t9q+aGEiw/sdk
 dmA8b3Yc3ueuI6tH0eEhcfgNXVeZUF+EXYcywL/Qs7PIx82Rr8n6E4k6k
 HKs4eqMQaItM73bQWl+muuMW+kOPAWUIb3cF5i4e6/zxO2v5pgpx6ihlT
 f+hCeJHhAgbPDHNCN0yzFWSAuWvOlTVnTjQrjomHyJyob6m+y7b+YKzBE
 kTRv6BbgVdR6fTpXTBWiTg85Q2bOYJZLIXgMiMnahg8lJdcrk3ImEjPt0
 sQaMcudDZNgVTQ+lETblfbHHfmf7Vyrk51gBxkesIem36rMifWFnrmWy9 Q==;
X-CSE-ConnectionGUID: YfGLYAZGTA698QLwZlw3yg==
X-CSE-MsgGUID: Gb82rzgcTwu/4R2wFRUm3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22352965"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="22352965"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 03:36:21 -0700
X-CSE-ConnectionGUID: elAsgK0fQ1qgM9uo9vtDxA==
X-CSE-MsgGUID: 4PTay4GsQyWEMzrwVcBjCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="60077777"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Aug 2024 03:36:22 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 17 Aug 2024 03:36:20 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPjGRyi+fITebzT8tyB8AVWp2GU+uqSunp2kSeUiXZ5Br+7GRKXs/d4uxSUxg0JXwmCi4Hdug0wijbqGCfdxRUl2jBPN/5IoFPwAxk3B0tQ4st+BCccVk2sq9aBqimjHGUdRjL4VhYdmHVAvuzqNzNAbGRqi/84UuL8/1v5R+hVNK6eTsTAurDVvFoF9+WK1jeSKoLSjz0oGJN2hEEcLkSe1mDRZ3PEYJazkq++SsCrSE9HqfLEd3gX6T1fCKiJ5h8fYDHcNfCL/QX6m2oQEuHwxYnukCQ6j1dDcELMC2SDWUPgB15QvYuI1mrXep+DPN9vn5tPnYbZj7yjz7Xvmdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiY8MN8TKNHhQe2ZfMFjIlFBXWPTUYZFDvvha+c6E1U=;
 b=c3ycVO/RkxO5eA8TUQz+AZdoYYse0sRJYJb/5QwcLCqNBPTsDRjI4VKb2+eQHYf6hDtlM9cmd/R3hzsXMdX/u8+5gjTbBguAQQaJMfw2OVwtGLbI6LsS3XTB6N24UYLsqRAYBkbcHjwM4y1Wkyru7pkR3tSV0KkxVGqeH2YCaxDOoKY0Z08tQqpoMFbm1LwI2qlnZ7SUTRvgM9bt3+PGX+cP+UrNPXbIc4qYe6IDXyFku5CwTIXnc0VrkgoRdBHPO9NQcxsoFVadr5qfIqG8GUZeG3GVY1IZLS+toLsPPMrcmZ1EEwhF70MxBB1q9u3WB2Z4pozLUkK62eCfN1c57A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Sat, 17 Aug
 2024 10:36:18 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 10:36:18 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 09/12] drm/xe: Introduce xe_ggtt_print_holes
Date: Sat, 17 Aug 2024 06:35:52 -0400
Message-ID: <20240817103556.163783-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817103556.163783-1-rodrigo.vivi@intel.com>
References: <20240817103556.163783-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae97d0a-7f93-4e2f-4bdc-08dcbea86da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/cU1oa1TGaQrNnAUMh+OzWcV2hQjvKs8/TREc81i54/byJ++oCYpfxKAr4xy?=
 =?us-ascii?Q?4u+DUP8nd7/anamUaE3sH5q65IWRbJagT2nkeHWFUT6+n7mM/L6RxMJHvS4H?=
 =?us-ascii?Q?m8oE16VLIPCrqAUKhjzCTHeIVFCowIj72y2Tyjo/1p1VSQH4LYsWXElsvNuo?=
 =?us-ascii?Q?stVIdKv+U5EnLWqjjwCFW2TJofU1BnTL8cuYclLtMESMes5r9vc9prqa/QE/?=
 =?us-ascii?Q?XJsf5upADddGBG7S8kpe0PTYPlOkpFocJ45De/CJtQ6eMn1UBlkH3ihirjKd?=
 =?us-ascii?Q?DAZdRB4wfI4XTYDkCKZ2ImQHzYuO1lhogRZTX8RJog66K07xeSYt1sgx603r?=
 =?us-ascii?Q?m/LgRcWCsi2nt49kymQLa3EuKhnNczswKUfRCq0MfyvRGWPmqwgNholrmhnH?=
 =?us-ascii?Q?9GTz1I/IQZgirprqrgIT/Fnv+htGp6+E7j3h3GiGwGmXZn33vf1igOF62JZG?=
 =?us-ascii?Q?OQK2vwgSX4LaJUWAf6HX/p0ONe1epR1TET7pKPIstzIrVWA5cjLi73fpASGa?=
 =?us-ascii?Q?W78kXQBTasGag8awtLczbM5HH3CyphFCMoH+qmV0iTXMvs1wsBq+OaNpwOIm?=
 =?us-ascii?Q?QX6lVuVBG3f5sh0sWLn65UuBAU3NGccByls9OktF1SuifWHr8029KDBbpVlM?=
 =?us-ascii?Q?sfD1n487gs+fJPstxfC34cFFVUBtkmu/SvU3/blTFXtIJ34fcv8bQHc3fFV8?=
 =?us-ascii?Q?pZGFshkdkZE1WMM4woGDpIQDzkv6onl785BX/i/KiNemYASkGN/5WM1S3/7b?=
 =?us-ascii?Q?pAsrRRPgYMOh7pyy8OY/2J2uCB69833pMiZqADg5ZRfY6AJFCH+tV5zbedIb?=
 =?us-ascii?Q?/NQDBGwqiCP3PxDcIkR1DY9dfyAh+cg7v+/SadWFGQlau+jxcM7FnFZQIL7u?=
 =?us-ascii?Q?06k5AFFrNfsPr40rGHBgvDaHXJLQRLHp5/Yv7iWGKn/bV0Z5/CxUxjqxDP3U?=
 =?us-ascii?Q?zZrrv+v4AFIsm8OMciXXYO8LyDy6jjn367l2T+HuPb/1kA+gOF8X7taoPWm+?=
 =?us-ascii?Q?G1446J+Pi/Qyg0oZawCpeW3j+HySv/lMPeb9XDk1YsKzDKvNGwgh7LY05XRT?=
 =?us-ascii?Q?03kNiqxOF2z8gz1xm/MsYtbYL+JptIO5krhoZkuH37mYbkHNcXqBuujCubt0?=
 =?us-ascii?Q?zotedS1F3UR+oQwDmJ9c/wbPCXvofuqt1w6qIkJoU64LCghcgDfyautjBJiQ?=
 =?us-ascii?Q?mVBhUP63MBIAUetod+U8h9pb3Yhm68lH9U0KldEgUJjJb9TvmdoIQLspWcEg?=
 =?us-ascii?Q?O38E/s6y+lkeYZh+11drTenc5y8nkTASxuJHk7selQc2zTdOm4CJhyJMoIL9?=
 =?us-ascii?Q?/Tfd5Z3x0qAtIFO331lpoxB/CBRi6dAW21occw0o7nXgrg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F4YYjOPluit2u5COyzZm6T+Ocq/GkyO0O+YrfmDaE0WQasSkhMWcvwmuN8ey?=
 =?us-ascii?Q?eu1vP3Hc5fSyjUut7AU93Bk7tbo/ZQWd4qzRdEvmQwmnjBHIUEreqJgCYnjD?=
 =?us-ascii?Q?CLz6TRAsw3FqpgjCoZVp2H2vQ9Yw5ILVrCpACcNqE4MWfafSo/n5nYzaSUNs?=
 =?us-ascii?Q?9xY0/1PntcInBtc2fHyB6/FUDh3ZXLYGKpqdJiquU03ue940iW2fg2eL0inW?=
 =?us-ascii?Q?3r66KRAFjDV5Ez9Ihf/WDdq2SeUX4BiOg1POWH7RiMzqukh1iGRNPEBCz9XW?=
 =?us-ascii?Q?J8uTDVpOe93nlGnVjiXhUxCuvCjBEZAF0RME0ZB76kxty4bzqGsumVgHqZyo?=
 =?us-ascii?Q?Akpfo/c1odBepEbJMBNwlmgNMJdQTD5brcKzsTwvoWiLZvrnk5Af6zlUl/Xr?=
 =?us-ascii?Q?LXo2jfttRQuzYVcFKgCJGqLT8/qcrSf571E5G4VYj+htDWxLMHWx/Pg/veXe?=
 =?us-ascii?Q?g7/WTyVm3TVO9v1Mi57OHUfVK97sUnmCvwnkK/uQXc7incA4JeUmEfN+EvvR?=
 =?us-ascii?Q?6Ritb0VYA5K3E1sXU8qRe0QQLn3VwRscjcHZ2E0B8Oc2csBsfFpfhbX3Tw8F?=
 =?us-ascii?Q?5Uc9BgAVcDg1hv4AXU4v58OZJU5vhnKJ0AFbAfTspGO/evgNIdELe7C3+sF+?=
 =?us-ascii?Q?CAXSpgw33osyL3RsiSfMz03bWw4j/u1sfaUW9LFCkunpgyapJFKhcqDTapkh?=
 =?us-ascii?Q?VpQc4R2vyGOa31/pCdJmvW0Ic+aD5pvu1jqoTp6Swo9L3m7vTy87X6TCdW3W?=
 =?us-ascii?Q?inTCoi4uq47fVqeUodjmCTBfhwRokhMKrskjcw/kCWXizGoiVSiJJ8N6WvdE?=
 =?us-ascii?Q?QjWgS4rmPoRjz3vIaJtCZ02/+e9Yc+KYxHj3ZwgifSRI9gTfevcCUYFkF6cK?=
 =?us-ascii?Q?KCfJ8RIIalF/jhb270CriWv4M3/6si/2y7K3gReZBCtfA9v6RueagcZYD2RZ?=
 =?us-ascii?Q?uWR4PgdzysbExv9rOWWVjTErg9r0VbcF2TkrGWeB9Lw5FKa1UeQkxf9oYe9Q?=
 =?us-ascii?Q?Clc1Y7CpJ4TdXMQ/HTDor8SsIZQYdGbYJ3vBsrMyM3kRH+nXXQ6PX+xa+6QA?=
 =?us-ascii?Q?7hyYvCL2eAvd1yJLDmrw4Weq3l5HP0zmrqH/ffp9LRU4UaS0JgFcfa0UVmDR?=
 =?us-ascii?Q?HSJqxMJ7bLdiRKvzuWYB8kGghZ+2C8w8hjkBRRcInke2Pa7Zf03ePQHNKK/S?=
 =?us-ascii?Q?6kcXqo9Esm+0yS4+cPfZ7HDJJ/8dth4OyTTvrZ2EO5M1IX/KB6DdI2QF2Wqm?=
 =?us-ascii?Q?ucfUQIWzP0hLMEgqbvmacnOf0vqoURM94NDq3gTelpYhikSMwvLlQpbopabv?=
 =?us-ascii?Q?zaFPwRMLQHiY1YzwcFuX9/pkOZm6ZAJt0kiLKd3wYB8XWtE7quEIAzye6mWg?=
 =?us-ascii?Q?B3LhrFBcm/C+KAHfHHIyT65ypW/6Mg9PI0D0IluJ/7n5lKoXHXV1ejmhE5tb?=
 =?us-ascii?Q?iluywLx7hyrA7l/d4qJHvrAe2KnljP+mcbp1OaSKjdqPiy/GTmrdBY6Mf2Zy?=
 =?us-ascii?Q?p/AreUSuMrBt0/k1nbl58BHajy3Pz/0IBGC73cGE7Qnt6/GrHV/YkiB8chcf?=
 =?us-ascii?Q?m0aAiGM9RqrzySfVAE0bXQaIiSgJyqS9SUG9qQIeWlrJxTj17jKqQNrirKYw?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae97d0a-7f93-4e2f-4bdc-08dcbea86da4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 10:36:18.6516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMcW7dq5LxB65xn56JcYOr8IPHxB+jkj1UaJ5ZxCidLp9pwEV/Ka/X7B4QCaR12QNsGXYrGm1Mjcz6aIv0k1rQ==
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

Introduce a new xe_ggtt_print_holes helper that attends the SRIOV
demand and finishes the goal of limiting drm_mm access to xe_ggtt.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 40 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 25 +-------------
 3 files changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 2d055f489879..960f5a28b7ed 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -682,3 +682,43 @@ int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
 	mutex_unlock(&ggtt->lock);
 	return err;
 }
+
+/**
+ * xe_ggtt_print_holes - Print holes
+ * @ggtt: the &xe_ggtt to be inspected
+ * @alignment: min alignment
+ * @p: the &drm_printer
+ *
+ * Print GGTT ranges that are available and return total size available.
+ *
+ * Return: Total available size.
+ */
+u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
+{
+	const struct drm_mm *mm = &ggtt->mm;
+	const struct drm_mm_node *entry;
+	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
+	u64 hole_start, hole_end, hole_size;
+	u64 total;
+	char buf[10];
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
+		total += hole_size;
+
+		string_get_size(hole_size, 1, STRING_UNITS_2, buf, sizeof(buf));
+		drm_printf(p, "range:\t%#llx-%#llx\t(%s)\n",
+			   hole_start, hole_end - 1, buf);
+	}
+
+	mutex_unlock(&ggtt->lock);
+
+	return total;
+}
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 31060fe7644b..67ae5f1602a3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -32,6 +32,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
 
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
+u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
 void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct xe_ggtt_node *node, u16 vfid);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 1852ff45bea4..e133594cc6bd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -6,9 +6,6 @@
 #include <linux/string_choices.h>
 #include <linux/wordpart.h>
 
-/* FIXME: remove this after encapsulating all drm_mm_node access into xe_ggtt */
-#include <drm/drm_mm.h>
-
 #include "abi/guc_actions_sriov_abi.h"
 #include "abi/guc_klvs_abi.h"
 
@@ -2103,11 +2100,7 @@ int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *gt, struct drm_printer *p)
 int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
-	const struct drm_mm *mm = &ggtt->mm;
-	const struct drm_mm_node *entry;
 	u64 alignment = pf_get_ggtt_alignment(gt);
-	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
-	u64 hole_start, hole_end, hole_size;
 	u64 spare, avail, total = 0;
 	char buf[10];
 
@@ -2116,24 +2109,8 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 
 	spare = pf_get_spare_ggtt(gt);
+	total = xe_ggtt_print_holes(ggtt, alignment, p);
 
-	mutex_lock(&ggtt->lock);
-
-	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, hole_min_start);
-		hole_start = ALIGN(hole_start, alignment);
-		hole_end = ALIGN_DOWN(hole_end, alignment);
-		if (hole_start >= hole_end)
-			continue;
-		hole_size = hole_end - hole_start;
-		total += hole_size;
-
-		string_get_size(hole_size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		drm_printf(p, "range:\t%#llx-%#llx\t(%s)\n",
-			   hole_start, hole_end - 1, buf);
-	}
-
-	mutex_unlock(&ggtt->lock);
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	string_get_size(total, 1, STRING_UNITS_2, buf, sizeof(buf));
-- 
2.46.0

