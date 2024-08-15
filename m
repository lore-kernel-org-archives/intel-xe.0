Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED782C5320E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 22:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5F010E43B;
	Thu, 15 Aug 2024 22:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G5Kor16M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F7810E479
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 22:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723759682; x=1755295682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=I0k8XJC6xssSUQJ2pLMQxB+z46DGpNqs2OPZeRqoDQM=;
 b=G5Kor16M1Tgde29mhKQY6aXiZXZ5IOWO3y6qs377ZT5Mf+kvdgQPg/UW
 LRJvNGaNedAj0HHFn8EI5VUdjVG36dggozy0BReAtdXtxRxYfrbKqCnmZ
 7pMsnnyD7Cb643iBEWxk8X3cgpy458XGvYQzhr3TVuKYGoTmoDYIC5tMg
 Eg3CDVe+DjtUL9FpaIhaHTAY1iAE8TUZNBWyS6PabeG8FO+Pxfft1PiSl
 aYopOVSSksmx9Zzm98B1o9QI4ayGxp7npjYwvlQ1RgJWvJpJWZPw7QZj0
 rWamPfbJx7Oxo8hIdvVj/hQjPOGXAHpNsv3pT2NcxhFiZw/1dT9CvHb02 w==;
X-CSE-ConnectionGUID: sV5/y+QbSc2KY68gzC9u4Q==
X-CSE-MsgGUID: dZVerAFASguYMrdtn+4VKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="33455514"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="33455514"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 15:07:59 -0700
X-CSE-ConnectionGUID: roCKzJXaRF+/SZO7z4fBTQ==
X-CSE-MsgGUID: Dns/OaNaQs2Zjp9Z1CPCIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="64375314"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 15:07:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 15:07:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xu3l+gACXbXyB1u2tlTwLKcKFuLfVqttDnrzSmv3mzyNiLkS0huw0CzBADSV9TI4NYQpJBzlhjbhfZr69JhQHy03bKQwTTfNmmHsPpuW7oktNbBVJ3a31Df3OaFpJ65wvfEsbN1fLMIQ4rnWdCVDdMmYCYu+jOIcP6c7P/O+a4/jKUpsKqKtQEokzuja1BiSmQUQ6Ca1ClhH8f+SRyCXSHPBcS8Dg+Ge9fkBi07mzjTMytoBSrPJ1vLbvnHwqYeRZsAfRxkouyBcR18FtQLIzUoiufBHqc0TdX0hn6Sk1tFEsqjjtvg5mc+undCSdhuPUx9PhZPb2wtcstfMY0PL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gpu52xo7uZLNR4XVR56Ntg7G3RAYeL/ewVb3peA6Pj0=;
 b=X6hWwA7F1NusA8J4KqJdcUyQhNNQ8omF71bBPhDpzyLXXN+2iPJ+LwOddxqd3aZjXhUpJm21m8cjyJF3eeDoD/deri1H318gbDwjr+8BzXG4P3rMXOx6j5Z/zgGO8zCHu2WLeEWrVrsAZ8pMa17Z7WNgyJEWsH7Ss+ijnJv3NcdXmLMMiBvINeUbtAw4b4O+twh/t3ypt8yEObPFRemWNLrxLTOC2syThlBdBEfNl/qrRZTwR9pWYs9MZ6joa3/ORu1HyKZV8r1H97iTykjmw3qGQQmG9Cr+5ThjZVVhY85bCjcFobk36NP2CRUMVaa37Cx3YZdiSg8yZvW5hv5f8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7133.namprd11.prod.outlook.com (2603:10b6:930:63::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 22:07:53 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Thu, 15 Aug 2024
 22:07:53 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 07/12] drm/xe: Limit drm_mm_node_allocated access to
 xe_ggtt_node
Date: Thu, 15 Aug 2024 18:07:27 -0400
Message-ID: <20240815220732.49675-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815220732.49675-1-rodrigo.vivi@intel.com>
References: <20240815220732.49675-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 22377327-32d8-44ba-d8aa-08dcbd76b58c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ytRQoX5iE43S8hzEoQoVPT3GxrWhBdaq8399rwGGA6xau4S8TV+I3Ionh2pk?=
 =?us-ascii?Q?tHBFDRhr6nqZpCG9n2KVd0YcevQQvKgrOUzAmD78FDW1Q9BKctTsh8C1zGiG?=
 =?us-ascii?Q?i+1dMabpTaIivzCTnFjVQkFR/Usdrw+AvBLl3qXG3nUc3tEQFNWwOpWA14IX?=
 =?us-ascii?Q?It9fnycr/xpXid3nFJV0zooN8VIl9xlz8n2mAns3UrAN8CVZMHuLKLwIemMN?=
 =?us-ascii?Q?KeTzSWv7OUiiWAh7QQxmoVLfcokcx4iMBaoCzk14C72YeEiQxTO1SqG14T09?=
 =?us-ascii?Q?ws7fZD443DjJ4cKfbwg45fh8HVSFSDJxvHB2mg8IGIp75yQzuYutuma9TAJ9?=
 =?us-ascii?Q?KzJcoipWrnW294ZQFwrd+80VpIsMORN4U+a4IM2Zz4IWGJCKx9vmPwaGaFsO?=
 =?us-ascii?Q?NiQjJeA2v1AJ+57VX+a1M1FtPZElYEBqV4lr1L9nlAHJCNB/dDVSIySWGfSo?=
 =?us-ascii?Q?F4AKOU87wfTh5Kyzf4wmo/RIdZB6R4JMFYAHsonHNqAHHKrzhWa8dbSvICmK?=
 =?us-ascii?Q?XwANvTjwqtyr4wAol/x1L9i9JtrVeDneF14RiU/gcgLb41saVORrgVM/7OPH?=
 =?us-ascii?Q?P9zYH+Fw/1L3RsLEefTS3MgaSoNuV2VTMYzn1WXId8bCEX/wyLTJB4amB/EP?=
 =?us-ascii?Q?zlsUQEJeTtN577o8QBsfv/x7HWOCBnpukzmZDgyzskNCgJj90rCiqD9d98be?=
 =?us-ascii?Q?2Iitm4KknnIp4V5sHjvNAkf9aWagJ10ETbUxSEA9vp6RvvIjY5RSiyJxkywL?=
 =?us-ascii?Q?hGSRjlbLVdgVG3RLb2tw6LKJnZOBkMowCU4TqZNCQoy34WwZF4ORosW0M9mN?=
 =?us-ascii?Q?s166xN9Nq7rumQsmw1Yr1LScHQVJUJanvhZukmvXqBJ9uyvE2vjgSTztP+Bx?=
 =?us-ascii?Q?4aQaAvEUOc4t9yE1vy1acsS2VfZvpUJcqvOZC8knZhYI8x/MFuKGPGqj73p1?=
 =?us-ascii?Q?4KGhX3up0wjFaffYSYnH1RTxce1XSfgQgmUB1CID7GzPbbvAm3l7S+x82dot?=
 =?us-ascii?Q?ROiBFEC8ziHuLrFjLuOT7uQHkR0IVECclzuNjKc7rQyOZ6vRz3RKW5e+eYuH?=
 =?us-ascii?Q?Saw/nWcXAfLdccjhfqyYlc6hJCp/p8O5kroWACbJUrfvK1gQBrYvmTaD2Mrr?=
 =?us-ascii?Q?Fnk8GyitEBMwRCSIUR0vTw/zfuSnnpdYHsMZEvMjp2lbA5ZhMTnCLwRf1FAb?=
 =?us-ascii?Q?lV0v+FDcGouKnTRfYSJhw/YVkfZSEO+gMUrcjcsvJZn0KzH9j2YR61Xo/wvJ?=
 =?us-ascii?Q?af9MRkJ1KZi5H6+ttAOV1rZoBCqaNieLdoWsmcy2QGZUmJSX4miX7bsfGkT8?=
 =?us-ascii?Q?tk6ntV0FVUiDEQCudcKE22naqs3VafG8fEdL5TpdlXFc0A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JY0b/R9/XhNMWD9AKtlnqF9wkUlk9kXlhjYVHWFHra6kyNaB8HmmeO0wcLdA?=
 =?us-ascii?Q?miVIUvg6YdkB8hjsc3vZ4lCPG2jEkakxX8KnXFBDfdK8kbmEONgtQsDhyqQ+?=
 =?us-ascii?Q?DGhF6Mh+QNKdbdBHvmcKg6EijELqLOAK1cfPo8f4OaY0Dq6Nze0JDdmwxvNq?=
 =?us-ascii?Q?8BshjQYccDHba+2mDCFesENWtnj4nTi2lm52GOKoep33ljIjKLThoJblHmTN?=
 =?us-ascii?Q?dH+E7o91dzdUtpmqPS40le/iNJJ3Syo75cuGMPIgixXOs53IPBezo9iMu3L7?=
 =?us-ascii?Q?czrXgfAHno4vThNSS54DxMNu3W62frs/pE7cxroweHPr3BhzYiDve8pgaHwA?=
 =?us-ascii?Q?t0pj8lLeLn3shQwRTAgN5vMRsUfYt6H1r6g7ENhX86rlvQoZtuXFKOv4ZwB1?=
 =?us-ascii?Q?RqIxe78HaPc4YbtqBvADIKPsMXgMufpgLIUFjq7ZZK5Bm85dc7OHHVt5plwM?=
 =?us-ascii?Q?tbcvLsvHGX1Op0CUbvNZ/VdPs6Ayji13Gex6gznQ00grcxFqpfhAg6DaT0BE?=
 =?us-ascii?Q?vvEbbWsS7k6VIIHt60RHymut4fzCYP0kiKvmuROctMtquIalUISbuzLPym0F?=
 =?us-ascii?Q?jKPdrsVH5IH9NqZvGFsPjzUtMYfOMBZOTcSg+Go0mLnCzUaLHv5k1vC/SFFh?=
 =?us-ascii?Q?cgmaBLKJz6H1Tb9STWPYMFYgc8RMtFDd0iuLegT7mSS1sFRezEERWxHIwBHi?=
 =?us-ascii?Q?dP8NPFClIW0AKU/oS5MWGXdbhIPw8UKtFG3wQj7lx+5d9njeA3ZxZDYw25KI?=
 =?us-ascii?Q?BY6SetSnnvmv6O2e3YrjYcVnOiW9D62ICyjrJW6kiPZV5+meJbYX8P70LOqR?=
 =?us-ascii?Q?yj/hjCrSaRB349IlPAIiNGJ61JRfIPYWaPwdgdU64Bc6TMWGbhGt7Ch6SVnm?=
 =?us-ascii?Q?VUNQ11vj6VuMx7NnLpYu8Va7n1bDqo9yacbMGUrdVa66JHOUKAzEp4aAiPVy?=
 =?us-ascii?Q?dF8wFexVMG6Vg0cuDi7YxptYtgbXJkKgG3q8CPQpdZaMVRNwZwT479RHFSn6?=
 =?us-ascii?Q?GhSsHJUo72NZFpv2WujDE86kcfhvhnlRFjOf0lTIA607C7fNg56p1iiN7f37?=
 =?us-ascii?Q?sGVXHDyeL7Vx2O4FIWRXkkbV6GlgDwRZd6LOu78zbbKy0qyB5Lj5Ig8tQoeN?=
 =?us-ascii?Q?80RE9vMVEXwynQ8hpblrcivAYI8YZfoxVhnEGPLpfs7/XKuDA0QHr7+cT9AP?=
 =?us-ascii?Q?81ZcAawuEQEUHLN86Ag9iYboFNga+CGZyWuHaBGwuUHmA/tAizhEUBsldbD1?=
 =?us-ascii?Q?YjBDgwqd350FatuyhlNfw/wTGFsBNK6owxlyTbQQzB4z2477FEAn1sV+/1Xu?=
 =?us-ascii?Q?l0jBnvdNxxrropuG9Wc8HmhNXF4jwiOqSmJB0Vm5WEZ5UYVKhvY6C9SWIvDu?=
 =?us-ascii?Q?N0dW7y9NG5tbTehTSG3NiaxMxA4EDDLlgtNYsHXy1CRmVXfx9LOPg4C4yf9s?=
 =?us-ascii?Q?7EZy8oZvHGddtUNHkAFbDhIAMdjbYWW6hpiKyUh/NZZVccpgsnFluZ7tZ9nN?=
 =?us-ascii?Q?RvrGPyNOW7ndYqIHXUxd13eUcWCDTZwW5iazCBagDsNgKDcK8e12lv7NkncQ?=
 =?us-ascii?Q?4TEKNf7/gkMqMSK1aEJPb3Iv2WfsoClhVVzTo7PH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22377327-32d8-44ba-d8aa-08dcbd76b58c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 22:07:53.1798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsdkTj0GenqIq/+PVvuymqu1ejqFta/feP5KNKh32vq5wong+pRjlxvX9MpMINS+AFKBVm8AYJrgOwm5n13HtA==
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

Continue with the encapsulation of drm_mm_node inside xe_ggtt.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c     |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c               | 11 +++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 12 ++++++------
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index db74c3395ef8..de4930b67a29 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -323,7 +323,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node.base) ||
+	else if (!xe_ggtt_node_allocated(&vma->bo->ggtt_node) ||
 		 vma->bo->ggtt_node.base.start != vma->node.base.start)
 		xe_ggtt_node_remove(ggtt, &vma->node, false);
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index e0da24bb5774..7c8bbaa30fca 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -477,6 +477,17 @@ void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
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
index 3ca98f8a0eae..947750d97d7d 100644
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
@@ -2028,7 +2028,7 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
 
 	for (n = 1; n <= total_vfs; n++) {
 		config = &gt->sriov.pf.vfs[n].config;
-		if (!drm_mm_node_allocated(&config->ggtt_region.base))
+		if (!xe_ggtt_node_allocated(&config->ggtt_region))
 			continue;
 
 		string_get_size(config->ggtt_region.base.size, 1, STRING_UNITS_2, buf, sizeof(buf));
-- 
2.46.0

