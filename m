Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C75EC52D6F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 19:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E87810E6B4;
	Wed, 21 Aug 2024 19:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKx5fkPt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B71810E6AE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 19:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724269149; x=1755805149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=040j/YrP3A676ui0cKzCLVpHepUU3kYPFVSLx1AboJI=;
 b=SKx5fkPtj5v3cTzOENJ99CS+0/m6dMp8CBh+stKY3ZwN30yZ9b+X1Ssp
 ObO0V2Oy5l2hTJ3AcqxNHxH3Zf++tPn90jOzSssbklnBV6eTIy5AZs6Iv
 5WbAZPo/kjgbyw1tsKDPWfyfOl1guvesnqMAJs5x28RbX+tnqr4aMx+HJ
 2tdw67UGSAkmmRI4ngYmUm1a8b9KxfVOxQnUQsHUjuq3lOhi/NFe+UyZh
 SFG2N8YNKGWN2BoAvU+sY8MIntv00KKEoKWcecpgZAbCxEtM+WllS2/ZC
 VyJn+vzxN8EhCaK0g/bDhgHoH5OKgZjxFhBm05Q1cIty+0p4MMnN8d+Nw A==;
X-CSE-ConnectionGUID: Lf0uGNrhRl2gBhAqv1t7ww==
X-CSE-MsgGUID: fJMwF17hShyxRvLAIEQUEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22835720"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22835720"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 12:39:09 -0700
X-CSE-ConnectionGUID: N3Bh7huTRXe8QwvSL2C7qw==
X-CSE-MsgGUID: L3IdyTLISBmHuNa18wlpCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61055379"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 12:39:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 12:39:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMWKaJXqxvIl5K8zshJOS0mBy0Kn4rgaqN1xHhBqY25VSA2/TkEIT1Hrb4ZUvI68dn6aQNHqKB3Ml20mUQhewyl1NH01xNILHgyjUqb+RXDBPCEGJ0pzROGI9Ss21wcmd7nmeq7isPMkQKfKM1LPCkQyO1Vow/e5dtRb6OmCiPguvyPjRKs2f1UzB+kNMv3mKZnGisbPf797v2ZKLkTul8TKxAux69/WqmFU+jM3wvMo67pshRm4YSNNSvUyKzPzR9cQEdNKYKp8JBES1FORod2mx9zYz3NGXHmCRVSPOxQcZLndz3e7LcTR0h4yAc6Jrrj/i0h2ZMA+ctkUW3dmWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiY8MN8TKNHhQe2ZfMFjIlFBXWPTUYZFDvvha+c6E1U=;
 b=ep3W2KO2RCxay0kUExp2mnm7YJtUXK6eM7az3HP7d7bQ0zu54DawwJW6cFSR5uILtQZaW+eK822LL9JImrWCgnd1TesuEcqNnDLcMxHTmat5R2sR0T391PQ9OxeMfC5KV4fi+h3mx1DDtQK7fmhnDwBKzaBYc7MoqVe8q0QK58oP7TTsg1HAKOj+FAOUfwIBkZRDcykof96h6a+0dgz2N6PF9wvKJIBTogiemPndKxXT1YQNoy6+Sa3ctXFqbyLJdVel1FZ/yllAMA+Kdtngqe84Rcd1gpwdTUuq86ebJA08T9JptHYY2GmhM8k1fnLJR/E/3OGP8asqn0M2eyA9sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Wed, 21 Aug
 2024 19:39:05 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 19:39:05 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: [PATCH 09/12] drm/xe: Introduce xe_ggtt_print_holes
Date: Wed, 21 Aug 2024 15:38:39 -0400
Message-ID: <20240821193842.352557-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821193842.352557-1-rodrigo.vivi@intel.com>
References: <20240821193842.352557-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:217::32) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: f00193a1-1134-46ce-0132-08dcc218eaed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b81yWoHPzRec1HpmRrxSjnna107/baSGP9tGtZlO3hbbs/XBre6yKVyaToyP?=
 =?us-ascii?Q?8UNpLMbH/YRutuRNfxE6eTsSS2/kmogO43a0WayH2XyVo/zr5vPlhXrVoCjg?=
 =?us-ascii?Q?8bL7Fq8act3/+3hPwHT4IypYwgcli6aGa1hcr4rZ0UwlUxSg5dDqA7J/GxCg?=
 =?us-ascii?Q?8cs0Io7bZEDu8vG3DVzGILWY5CczzUT+6K1JeFDBvQd5f+15qnVg35dPdSgf?=
 =?us-ascii?Q?2wrL2ty6b0r32tGJK9ORzmofH5t+GZ0g3DT2KOiAruo4wrqtA4Azf8NYI+HH?=
 =?us-ascii?Q?HNYqJxHphxrfJx3kXMM4Nn+2alMqG0MJ4kUophbA2oAHK3AI8NDXjHNSB/Qd?=
 =?us-ascii?Q?O6alT9KyIqptiUpBwUqAqOv4SOIhWGs1LgpGUISXVf2Ov9BnHJGgqJgpDGij?=
 =?us-ascii?Q?jeZoBXQbUrelYiuikfMeTddyIuxO0SHcPmQDP1HzAayWH5z9m1NehC1ErA6p?=
 =?us-ascii?Q?XPBG8HSdDuMWIc1Skn4UvEREhHCuyD/ewXiP3H4uyJ0yliqaJ/iZmqYQRs9N?=
 =?us-ascii?Q?qYERNraXzrVoTck9f8yxkeG9wh3EvRbaJiz8vSO+myHNShZdzUTM4OStEeQE?=
 =?us-ascii?Q?yCg6XYi3nZacDmjQtaEpNHb3b9QwImLX2x8He9pDQFPkDQJyUqe/cwRfttv4?=
 =?us-ascii?Q?Tak17FyQaLGj21cZesjA6NDIjPHLuA8fNxlZcCiYDyOAETd0+AgFSb+sU6OE?=
 =?us-ascii?Q?hR3Kg9d5wsXKCBAkzmMEIsrLSK6JE+Jl0lsI/q4tfWHkQwoaOSZ8/K17KOwa?=
 =?us-ascii?Q?CC7+Tx3LZsNmsCi/g7YGEFndPSb0i54cmR4litsY4YwvG0cmN+qt4GKvymxX?=
 =?us-ascii?Q?33m8LDXG2ENinu+a6Yv0St0QVvSmE4jVuae9tSL44Oy4iCLcIP1zbNYitEPV?=
 =?us-ascii?Q?0DrPkq7Ya3HfeLNDuG85G9SXPwmQ18PdRHDixJP/JifU/qNnh13/yCfcFKeY?=
 =?us-ascii?Q?sp9VJATVpYsq+sNarBX1qVryNVVbxgxtOtpdYgbx4X5OSxINepEdKIjtUaOy?=
 =?us-ascii?Q?roBsD45T/f52X6EfQ/NpykQiFQ5pm1gjRi33to3uu/GSki9zTWHrLIV+FAOG?=
 =?us-ascii?Q?AYu6PrmJb7qs6VE6YYDQZQP8jaJs+XmSkbRHi8of0kNwxHMvWZj7ef42ILxk?=
 =?us-ascii?Q?E2FdW7CRyV5xJa7jnmts9gMloIEfH97bdwHDUiQFiSSYyBjUMH7pmbPgbHwc?=
 =?us-ascii?Q?LT6MytbLTIBZSHgq/0Pn+LsQJAd711Rz5WrfVfchtUK0RRRZGTeHK+xaXPGU?=
 =?us-ascii?Q?nDrOiTXL/8+w2ILGPIXjc289kliYxwHy2GI+5X7Rlg7JOZ81bHNmfx55Mg0O?=
 =?us-ascii?Q?/RucSvy4XXqvDgnKE9m1raKTY/bQqkHj0UXZSI59SQpMeA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k2ZLzjv0ZyYu0QbiuUwsYQNHY/vFYg/VEvAIazOfRTwnTBfLx7dpnhE2G1Sv?=
 =?us-ascii?Q?4bMtbone8IQbrZdyySxEdM2OM1DL0MrOd7aqDhMFlj+E0moc6XXtPmuiw35m?=
 =?us-ascii?Q?miU0JDjEBxvOATKqJRyP4Zyb+Dmti/VDM1hkAm+jarW46tAvEAy9p81ZgFI1?=
 =?us-ascii?Q?fPGBZOxjO7Da2GP+Uacxxli+z5ccd9HzdEIbmL9d3C3og2pbfq5s+TdnBjXJ?=
 =?us-ascii?Q?Pkub8TDUc7e5Eupz+g/26wbBPIeXkYvIgShy2+qrlyE6fKyHX92vufQHnFgC?=
 =?us-ascii?Q?xBOPdTuehVlF+odVwKHyGdL1CXlaqFoLyyAJCHCsiN19gvEg4mA3LKBSOXVJ?=
 =?us-ascii?Q?quJTDZuiBcwI2hSwNVvTiy86yGZl0cFCabFE6MUhrJJaSuTEv1LCAY2pMNXW?=
 =?us-ascii?Q?e15gIWlSfabzBoyEUixRLOol5l/95VcjzU/s+pCEDH4EQE36gp4tmJd9GdIP?=
 =?us-ascii?Q?vLL1tUvtbdmmnBMbGDMNdMvbwTiFF4xd4SlKeFLoIo2O0MFppgLZXLOoyDde?=
 =?us-ascii?Q?/53wIhxcSujnxfBo7c16f1yeXjBibG0VIrPYqLNgS8Vu+diuBSMzxymZEERL?=
 =?us-ascii?Q?2vIis9um1A9H8WadmKiOGlk1BaFOqoXWPN8Y6Fzv7GGS9eX8LLJ/n4UqdHgN?=
 =?us-ascii?Q?QJspM/n4HzQLWnSSLSO1aoJAmYF9n8+Jf0gzfN3F/mmRDR0fnAiUTiLVDl04?=
 =?us-ascii?Q?RHwhsqtHBfDqELR5LTGHIEpVb/AQxkfnSEZfMzQ6sEFduNPhZtds/XuBrDu1?=
 =?us-ascii?Q?nCwcBEi8RVkNOBpB90bhmaIa084lgkEzUsBGJSn1/cPi8JpAPXP/uR12K2ez?=
 =?us-ascii?Q?bn3GxVR6mtRmzQ99P+3XWqFjo0z5an5U3S8+5/oMG2WpEa3UmxxyYPe1eH/L?=
 =?us-ascii?Q?RW6EhRqEUVJe9dGeUayKnKAHGnkMwC+sgAJ1VLOmbJfM9Ky686ETMHsFb9D3?=
 =?us-ascii?Q?Eg198zOjx3QH68aOQX0RAfCFYd8wr0HtUr0q0FIgZjqPe+IYc3Ov8BFuflgC?=
 =?us-ascii?Q?3GKeKHpq9NigrBghn4BPNgtdLLmgMsbKeWHhH6Mw9Mmb66VlV3nvd8L7nV3d?=
 =?us-ascii?Q?JiAUSA6BKYM8h/1XAH+rau6OWoaok8UWTu1/L0eOJCaH7scDSVKyPmEHKf7W?=
 =?us-ascii?Q?rfX+S+hEx/M7hStmNvfZDpgqZOhPxGHz9Ope4LcHsP6NMYUz91uCx9vXpRdz?=
 =?us-ascii?Q?/SABLgYekNVa2LRPaof7AL50c5/geec7dNypY78uiGrWvaSebac5Chlg286/?=
 =?us-ascii?Q?u9ZHU72saj/leVEByqjs9ZwHLVPQmhkFK01Bg41WPHeVcaVzCiKSLWM/nCLJ?=
 =?us-ascii?Q?mJjwCzn9DLve7i72UjnDoFB0C89k+U0uNLf8gEuc4QRETfu5juuqB1E+NcPl?=
 =?us-ascii?Q?BPZzpvoV6d4+yV441miXqNEZGlMAvn73V3+6za4UYvgAGIhIHzbXFwbJvWB3?=
 =?us-ascii?Q?lBTiG90GAzSxbOPCCIwBCHjTFKrO8D0aiWe+kZVhsdKyRBPKeOyuCgPTkqxa?=
 =?us-ascii?Q?hdq01i8ZfvLmBgIfU0iWxlo8f/uxo1hsb6YtwMOtBRNGHX+C7FwxXz2Nb5c9?=
 =?us-ascii?Q?RfTKzUp+XbOwe8a6axYP9rsyHuOzZKbPOYJ50JCkdY/E95u9X4mfzB/bX0d3?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f00193a1-1134-46ce-0132-08dcc218eaed
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 19:39:05.7969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suoXdBrXHVlq+PUh4mDMegEIlwRZmty8n9eo66LEwhP743FDwD72KumD5CMHx9DuVruRUIDX91OTBM3NbnRCig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
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

