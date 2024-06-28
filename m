Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2324C3065A
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 19:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B236C10ED35;
	Fri, 28 Jun 2024 19:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T39BEuZ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD7510ED36
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 19:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719602915; x=1751138915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NJv42ZeA4VDVWCsGDipw47JyomSd0lusRWqPcf7kP7o=;
 b=T39BEuZ2NUjFvzSLinuPz/0DpLuBAz50jzaqXrb4agJ3bLZu2DMinBLV
 pJLEFefcB5X2Db2viyJa29+1W1eTqAQeTB/ykRUgEEXZW2s+zsSYTPKc6
 sLLg3DRxZR0Q+CVIJ43Cx1gwwVMPX74ni0xrSgPp7KB0AhfNb4kvE4Ydg
 yXFKM6Wnc8QpJckDwAfMkSLnL4ZVTni6uZq9P1MUeRHGJjSvykfQQevJy
 sn2cHNH48t4AUEuEQuSJDQDjCMD31tPcxXBQmeayyLJ3w1vL7D28D6WNK
 3bg8gZAh/paWnMZhAqABHfZ/ig5FWXufE0LBqLc685r9hfYBThsOc40te Q==;
X-CSE-ConnectionGUID: YqDOeCqUR7mzdjqtYnfQhw==
X-CSE-MsgGUID: UInzVL6aT3GuTiuWhL21vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27931002"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="27931002"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:28:35 -0700
X-CSE-ConnectionGUID: 7O5er0WeRw28WlEmMBtN3A==
X-CSE-MsgGUID: RwNuUfMgREquyD36gbJ8wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="45253787"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 12:28:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 12:28:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0grTuHjKgFSwShU6DtedyEnEBR6G64+AhEoGYmNgZRlMcypT4WuaF0UKLsgCWuMFNdtl2Ef6d3+isIwl5p59tHp8lMz0ITR7/MP4SvG9hWVnL/ad+sZLFBk1sFzG/yEqSgf8sVBcNebC+KUi24GNFP+Xn72z8YvbtZTrJRo6zG6TxOhZxD1MkT5jbDQcq5RgsqEczpvVBo1Hd9ee97O5dtgDz79vLM7IilBffEHz/qK6eLwVKxBsiuv8qUoRkQh3Mkb8dTg3mFIwGdgcwwn8KY5b9dyw7+nwRotHDrRJw1gv/r+oddxfZJTUTxLy/i62pKArJbziDp68ISoiw6CQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8CtwIjcZTv8iKS3ZXZiD0hjqk/ChzySEpmiOZOKafY=;
 b=QBTDAwDnuUH56wXVnvElWr2hFudjwFtIOR+iJPhX6Z534pWuJpLGT5tWrSR1JKibtrPX+mwzPjPg2TL4RY/rCfdfCITDrTfFNrsJJiOYD9lT0CvtHXQGhzvtPxnXLOgISsWa9MOW7MpkDuFr562q4zR1jYWVb530K1jVVKk5XIV6+R4QpkiqMBZdx1P36hDFpPE3lFAXfPCfCfxFTox4ZEM7Zln+GTMBDY7hRuwJc5y0duNrBPiptLD2VRegGmVUYBEtH81LqSjK4u6bsVlVtbIqc8WD6/cvEBMV9xFjXBTYZNGfHvq1lxr4DMornMWSQmUNJgxa9toAYiQ8sUv8Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 19:28:28 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 19:28:28 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: [RFC 09/12] drm/xe: Introduce xe_ggtt_print_holes
Date: Fri, 28 Jun 2024 15:27:50 -0400
Message-ID: <20240628192753.386137-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240628192753.386137-1-rodrigo.vivi@intel.com>
References: <20240628192753.386137-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0048.namprd08.prod.outlook.com
 (2603:10b6:a03:117::25) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: f748d268-2705-49d1-1a8f-08dc97a87cd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JS+Xha7lU+Zsm559Xcr01duBo4skji6lpeLmjM/SvY7kuQVi804QQcJRyMPe?=
 =?us-ascii?Q?G1QX5Y8ZmYRvtQOxx8pLFiVyun6dKAKgc/higb+J6pJ+/7u7UQr+0QREzI7A?=
 =?us-ascii?Q?o12Ol3HNlkRQtV2ThBSEh7lC+ecXK1CWF6yd8K25MXwsgZ0Wr7no0LsfOGYc?=
 =?us-ascii?Q?xbCkX3fTCsCdWih4SeeQbwKcqr9PXulz/6+jmGXEuQ9hyjP+G55G5HVUukTg?=
 =?us-ascii?Q?V7oThuES412Qp2prITS0HXqeOO/M2CA3Vcf8GK00xjL716LvKuOUEWcfk2Y3?=
 =?us-ascii?Q?0BTPiY68r7RQ9wlIg0+SQOhdk+uzCMI2OfjLF09MkI/ccaRVOXu843n677A6?=
 =?us-ascii?Q?KsjKpm4bFFHB698KPo6zOLOcdgBSiGu59UiBJ3nGuuosQ/3+xh1QzYuM/JBa?=
 =?us-ascii?Q?ypoeLwXt8U6GaKplUuNrzICnam9vtEY/fNFn/HAPIpxm0m/Fz99ZEZZpqUT8?=
 =?us-ascii?Q?U6KaZ78SbmJEsw7mEMWckEeHn0tBj5X7vNiMN5c0IXlq509PSr1WaN99GsGu?=
 =?us-ascii?Q?Gs7lAKbD0woTmWTZddL3dV0j53ZvZ36baCTBWFLzxqExhiFOm0AmB6KeVsxp?=
 =?us-ascii?Q?l56ij9mgFWB5cpxSfNOrgrbHBce3EbVHjW45trF7TZFZRe1ZTnRHke0r2JE2?=
 =?us-ascii?Q?S6jEdZf1FhhThtBIx7g1mENEBgsqIYlJtVbm1B+EP+5BiV94pNMWqKaNTjZ4?=
 =?us-ascii?Q?JVTzWNkT+0YDZsERS8rEqLe3F3x7EURpQYXKyncHq9jSExynn3nuhXWKwiJV?=
 =?us-ascii?Q?n9+jT7HdCpqBu0XG7inITgbxbWm53n3t0T1N3SqiVRa80Z3TdSjDzcOXJ8VA?=
 =?us-ascii?Q?yV2myZ2tstXgqRTJwo2MG4ceAcso1N8sUFppy1HMu8Hjc0X6ez3phahEqLNb?=
 =?us-ascii?Q?HIzYER+7W5hmem1f8yPm3TgTbMGhc+85+wCwmo3IngmtDkcKUaYLJM0ZfZH+?=
 =?us-ascii?Q?2SvVe42dsA5pJIMHQ3kGs55k/ZAsiHE7e5IcSV0kcMlWyXerrsh3PW2WwQgQ?=
 =?us-ascii?Q?61y1LgfR8zMGxn/9ea1jz/jXfFxqbVorD4xGdm0vUori2ctJJaOHnL0SVB66?=
 =?us-ascii?Q?5JyThMeDoiEjvZj+axHypliGb/PNmTdGT6Ty+lOx+o/bYs3Bcx6TqiP/ypb3?=
 =?us-ascii?Q?f5xe8j4s/R3KOqbPglxtJRyfHpDBIDfRN6cJ8WQMMbMQb+y+cIkeAPWhyPXi?=
 =?us-ascii?Q?2pNBjkJ4ZguRsnRSYO393q8I5y8VY3EuDJ6JsXXFeR0vUaeS8dbtEcCfCgkN?=
 =?us-ascii?Q?RZzyNnk5CWS1pTO8uWY0JUeQ8UN9q+VQ+gDCGfS/XzCq0qb9VcomSu3YyOBy?=
 =?us-ascii?Q?QiUI0HaVisee9FYjol1ndNV7T9W/cI8+uDR5XFWvHFMN0Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V2e3tSh1qvQgHhnZTE3/V2fDCBWeZJKxYPIGe1BIVqAvQGUvwUD4rgn+8Sab?=
 =?us-ascii?Q?09qArGRFZtaBKG0nQ+EugrMtcOIx+pxj1BrRRNSkegbex3OK+TAHeVzjN3iP?=
 =?us-ascii?Q?9K6lYu4SoDAqxyDiPIwY7UX4YxmNgnIbo1/6Elsr4mAl5g3pMdXKdt2u2Tm6?=
 =?us-ascii?Q?FKVC7tkqm6fyjhLeLPvEi67ZKRLpIfirwivo43hNg0f0+tEpUeJt8KyM+I5z?=
 =?us-ascii?Q?o7x8iQBqAAOQ4fG1ycXhT4ibdpPCTrxJbdY1LGUjlRX5X6goQRiJZ+zNgui4?=
 =?us-ascii?Q?JXwhE48kaQvt4SdPHD2AUQa/iYkfo+PasTY2iT1lj20u5FGbF7P5fgSNlmma?=
 =?us-ascii?Q?BeKYW3IuPVABBDxNDLqfaB4T7PQbSlk9Z7pf2Oa2czFzxW+IaPVb2L+ghZl2?=
 =?us-ascii?Q?mN3V7NBwy95K0AlN9ZROIz/adoBXk0Pptc3IIraehQRMaptygFBBNY2IYbY7?=
 =?us-ascii?Q?wvKUrjy807/LaG8Ed99wnCUOlX8TZ37O/FSW4c7xAz/sfyjrLvrcZx8OxrAd?=
 =?us-ascii?Q?wxyfQ1jgdu8uda1EoOG+BrqzSlem66WQFMxFZpgKkskqaIIxhG4w91I7VoE2?=
 =?us-ascii?Q?PaGOuBYOHKN43m7DnoKI8fWyYQUmh5jz1kGWJOKnvvaUGlcyxYB5QtHI/FAJ?=
 =?us-ascii?Q?kbEMgxekOrQRbuTx3L4rpTbIWri9rjiXQfk+f3huB5KL4VSEgaIkbGWekl26?=
 =?us-ascii?Q?j0VvA1qXzBFFkrBmE8yh8F2/v6AvBu9IquQ0xih7pT3Cp5+A1jMqBFRdJl0V?=
 =?us-ascii?Q?Ltt/KhfabvUReiWsbz0PZFS1aGcxHIGya0kFKL0UCNdLGLQ0GctOXvGWKJmH?=
 =?us-ascii?Q?1vDgD9DX44WFdPkex9ukznoQfd7hxvsmLERiw8l7JdkheG9oR9WBjlBJkpGN?=
 =?us-ascii?Q?LsC1Ya5mzuXkzJlrz9ojYFhaz1KFwb+y3Xn3pWe7/Gj2J+YVzmh4bSaHWVDw?=
 =?us-ascii?Q?Y3ZNJWWPrronjS6/ULKWIgeEtaUmnEq+v4gRcO6i2vu82UozeCznM3n/oR/2?=
 =?us-ascii?Q?mdscKG9FV/J9sHjgikiWQlGQAgI1rMGlqoj8JbM3GBbFEDR6MQuOvJzy5lL4?=
 =?us-ascii?Q?lj7zPJjm0tAE2v73kI4BcbJvOk81HSjpdNAk6x+T2KbmpQE4IyWpkbG4/p5c?=
 =?us-ascii?Q?GlXfw+jTsJMImnsDv7mX2YstD1RqpDDMGhXyN46mr1hL8/Gc111LyuDQxIVr?=
 =?us-ascii?Q?cAYS/hohJJj12nxCZn+TyzDkTRJrjBqWUgTT7Tzbu20MDuhY13A5MCsTesUG?=
 =?us-ascii?Q?YinjaEE/vzmLKvX9uxPbkloJ08pvzVlPnyWNQT1DM5yrKsBDX+75QMpv4YIe?=
 =?us-ascii?Q?RGi3P3G1nHpSwcXhJoB2aICLjtOTL5PSjTa3XnmJ09xfcJhlGGHMTsBFUJrW?=
 =?us-ascii?Q?toLrPRDeQ1s3TQxxxa1QYe+tLmch0IEvrBVgCOOiLzXnMSVvBeekyiElWZcB?=
 =?us-ascii?Q?aKajI/6U2oUzvaeWoXV9TUwYKZPmbiPhEXTG4WERtcm/QGKM22/l5srhAc2e?=
 =?us-ascii?Q?phT2TMp5pr3HgFmAhtjf8HbDaCl+yRym1oiTY883ClCsb8Kyzqu+S6RyB25V?=
 =?us-ascii?Q?4uDzFmZXqUWMT2zhiDJmaB8/HP79hT/j6vqnby0U2hcZX5OHUb4+e3Oe2R8x?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f748d268-2705-49d1-1a8f-08dc97a87cd4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 19:28:28.6100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2NBL5RJGDGGFnw2C6ZqfbeWgNhatoUaQghUgz4BfNN+yqhEARZPCiWqLwO/R60yoY/UmKwAIbEZtO6kRLHycbQ==
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

Introduce a new xe_ggtt_print_holes helper that attends the SRIOV
demand and finishes the goal of limiting drm_mm access to xe_ggtt.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 40 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 25 +-------------
 3 files changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5b9f72bff7a1..490d7a4a5324 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -677,3 +677,43 @@ int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
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
index 05cc3e12a75e..6e235f305831 100644
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
 
@@ -2018,11 +2015,7 @@ int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *gt, struct drm_printer *p)
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
 
@@ -2031,24 +2024,8 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
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
2.45.1

