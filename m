Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05C5C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 20:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBD910E29B;
	Tue, 20 Aug 2024 20:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EL+FSsE1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46D710E295
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 20:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724185557; x=1755721557;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=gCFYsp2qqbXxvLYptPRJnLIM32D6UwYueGKNjHxMqwE=;
 b=EL+FSsE1x9TIjqne/1k8lSCdQEtfS6d7KcVU/cmxxCHpxSRcL1ahrzkW
 mjyhvvCSsqaG8/UA11mvuf+YpuMMwg8M5qouOxUmN6/pWcjvlnATjbRfA
 gfjXT9lcO+Kz19Oobwc76OJ09ucVmdbvxF9onYL19LMU8Jr+Cbhw17Wzf
 o//XuBv9dlVChv0E1rHb6PE9GaNNnvjSkV/4Sk18WRNHpBd38GRQIm6dX
 +ToFUYIbJUIbrxp6Suh2QMi33BgaYaC0j5UXPA0feAfT6BOAT6tBlfvYD
 2O8HV08iEFioM21u1wRISX2qD6LgwSQmKtn0619RWSV1GBOZOdhLOuK3j w==;
X-CSE-ConnectionGUID: 1guBeamsQiSoLe8OWFKj0Q==
X-CSE-MsgGUID: cb5WZgTZRGqeLwSXdQSG2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22646493"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22646493"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:25:56 -0700
X-CSE-ConnectionGUID: Uvhtn26WSRSfHZ+7nlSZeQ==
X-CSE-MsgGUID: A60xpTDKT1GTAotd1T5BAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="61004329"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 13:25:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:25:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:25:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 13:25:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 13:25:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLP7mIwJLmxVhnJNELwqd/QYtZn6hgICKREiqrTYAX1LjZwBnb3+t1KEvWkKY/hjSpE0hWLOrAlGsdAHCwR4HdQsVLWLrJHVSljG1p3XG2RHsatRV+7S9NgCLuZv3DNUAAEV55wcx8Rw/j/FKNAWJ4HpMAxElGHoPkCJAsq7LNbx1vL8dm2wLDdRc1ucCb17CSqipSUV3ljIpOmNjTWhOHK2VGyIr2B6DgiUXK1QEaUdnyvvzbYxrsuth65WrMBSMsbenVrqZEDpBoBFHoNLEElqlRLgTldUgOeEGSuWp828OE4BkizucSUWFmqaG6jOeG6g/uNaCOUdlqYJIe2XQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QAxZwj/2AEoznHgaxxqsdAt1kQngry1cnagudkxF7o=;
 b=gXeQaC3MGA+K5OWwNUDuJ6tO2TPoI+vHSVUaKnIWzeLpGogUGUS8YD1Ljs6/BfmbhxTb7I/ykNfcGJMBpHyKTgLcqeYLWuFeqakaAeC1G6lzFFhdDDfB4q+E/HBho3mR+Bb4miHtq1PYBkplsPSkJC1pm8c4JfEW1tAgOayNdAZyuG+zpzplFxeOfZtvAxjlx64Jd+yhayG0BHdjVpN2A1Mg6Mggq9+3yJ2Q4zTPcURyxqhBRU1TnVbv3XPruDDg54WzIdsIuen6o8z8ixfarnkv9ocpXg0Z8c3oHgAfoMZkpC9cs3PqeUiIV+pYCcCco4m8evfB4AFRMoHlnACx3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 20:25:50 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 20:25:50 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 01/12] drm/xe: Removed unused xe_ggtt_printk
Date: Tue, 20 Aug 2024 16:25:36 -0400
Message-ID: <20240820202547.300257-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::13) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 90dcbff7-5701-48f1-2be8-08dcc1564829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JWcud7bptJhTWfoYFJskN9sPn3NizH4hDIIfDGlC1bMXhhBqhJtueVN+pGbZ?=
 =?us-ascii?Q?KPdzTry7k03jLsVy0BJ3mzeJ29KL0sGMydlEA5r+iDi7daArVUi5ZPpA5nKl?=
 =?us-ascii?Q?vV19VEs4NqfzZN3st1N+wdBcBj+pNPFbRLysYdfy/tNNrDg+ZVGiiAP3waof?=
 =?us-ascii?Q?EbgbBtSdAz1wLIRIAWScBFBCXB6bh6qw5mkmhDvMD3QcL/QV//9awjmvAmKc?=
 =?us-ascii?Q?rjtvfQyt2IHaB57zMNibPofHsRdGwcvGn+291iTX/k5k96T/7N2mgRrRdGfP?=
 =?us-ascii?Q?QoGBAWNHP/0NPRJ6kp66T+KaU5y34Eg6wo/dJ35amPlyQa6x5lTQ4Za4F4j/?=
 =?us-ascii?Q?h0Iw46Nq8uJmLaC4sQBkXBPNZsG7wOl3qMaXji7kKuBr+uJVTGYl/ZwHTsby?=
 =?us-ascii?Q?xzU/lrBzqz0GJAx+59su6Dmh9JKBhz+uasjYEOrhxM18IMCYEWMn/t3Zxmnv?=
 =?us-ascii?Q?yxuuqA3bQkUplyjUX5M1Q0RMqvdotDQnJBY4U9lGSbAH4E6rT+hYeSilZdh3?=
 =?us-ascii?Q?6WiPlmmPy6eNxDTW3Yii9Pd4BODKOXiJrSWaEuY63B5OQS2x/eaa3DacNqTW?=
 =?us-ascii?Q?DxffIBtLIr/9q1c20QdFnXUlCkNTzfkXKifj5Wfa0LR14R00eo0vjV6Nw9Iw?=
 =?us-ascii?Q?0K3IhO+nnTWd1rU1OOlaVqOT1uVDbauKXzFp9jQqlUf8JtGHz8fe8AUyBnWH?=
 =?us-ascii?Q?hGGtBUHo8e1TF+M5lMsdLb/PqmyzCgFxF6nVhUV3LMJ9sEvpDLXzmLclyuge?=
 =?us-ascii?Q?1UZ9jUInNrKg+hYTiEmTnT3Ly4ktee4SUQgzCBMfpxqdZuhTcqgGkAl2vE8w?=
 =?us-ascii?Q?h0cvFvsWeyBOnq1PX9axzYTJ+UymD+jkvfpfsiLL/rc7gDdiCUIo/+64b60o?=
 =?us-ascii?Q?t6NJ38TuGsNha1nmJZBoZcslkdSNeSk45ZAHDC8rSnkAjTYeZg+wDeZpyuN3?=
 =?us-ascii?Q?o0nmjUqWvADkJrlh+Q8mwgjknAkcEHeXEHZ+EWZOvtcqAq0WT/bPPNBZoSip?=
 =?us-ascii?Q?Rs0TdRjzVq9n70hOcviO2bDr5iMDq4JlFu7S9p8sKBuHi5O5WPCF7nozbH80?=
 =?us-ascii?Q?NW+LtL5GgSkSHu6iXRrxHuBD2+eZF7WioS89uMdx5n8IV54m9I39eozH4Yzo?=
 =?us-ascii?Q?+65k5jC6e2iJ20jTN28INSqG+zxwbQabiIYWoYRdh04c9V5EZ9vp++rNUcox?=
 =?us-ascii?Q?ns2tlqLKklajcD/Suj33ZDShmhAwZjXwng3OHwSlBXT/qbSz81gQmO3wifq2?=
 =?us-ascii?Q?lKeUA96NX1/AO6fDe4GzASqt4Xekuz606g2m3/GC5DTcuAWzB6mHRdBVb3st?=
 =?us-ascii?Q?4Bhdw3RJ+cqkbYjiYcibm87Y7/jbFMfC3r4XGZAneclD9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PohajrQcnzOgFxbhLK57sViSazvuSbD3CgHAxODYrIHaF17QOzbydgj56mPa?=
 =?us-ascii?Q?5SVKvB9+05xBRRKVcjbX0XvWGMA/BZ80whJnTs7P75ii12ZB36ExTZMm8VAl?=
 =?us-ascii?Q?XvSqLod3nKZ4IfFh6YYVqUfNxEYEVP2v0AgZwAYzXUoM30Fbq8ki008A8x96?=
 =?us-ascii?Q?j0880YP7EIHMVI4XyIH+Ta/VSUZqnKuHrejTl7nvnYdUMK/7ySSSAN6AQgXk?=
 =?us-ascii?Q?tpvjdOKDVEnnUSEXPN2EuNFh92sgMC57vlOheb+01rZHElQihIpHoL8jNLTe?=
 =?us-ascii?Q?WOhEPF5xpt/CFSzgYZ8njlFi1PtruxfouCB76FbTe6YoX8GFRXQaGhdug87B?=
 =?us-ascii?Q?I37HL58WFn9MyseTcUmpqMxvEgSSNJx+g6zgUFkUgD9OCaq1nT7tzNzQwqt7?=
 =?us-ascii?Q?GIPe0rJqIuJvDkL1vGYpntCD5aHwSVy8bQRifrDfO4T0ErN15SavL4QHA1QX?=
 =?us-ascii?Q?iNr+/cdQGLwfxuuY3FlTw9vflw1UWKzl+93KFH68hYpN0fx/yD/uGP0xjt3i?=
 =?us-ascii?Q?Ij+rqVWeTK7uze4RZ8Z+8migGH4Gl2DgsjtRJ4SktjpwzQ1PK/gmN3GuFzxs?=
 =?us-ascii?Q?RcA4xQs39qfIUnamdexAn16WrJj/kt9BILv1oC/R78ye8icaionytTGsHOA3?=
 =?us-ascii?Q?g7GfRoCwZ5zvn0J6JFrMNhANBjjDtHl4H7XcEI1LLvhhAdBFNXz5rx5MXhF8?=
 =?us-ascii?Q?NCoZBtpsgT5FeitpWxWRLGCC7FRXnnKxibhZxcRa13nf7ccDdgHif6Uv+TC1?=
 =?us-ascii?Q?V64oEeCxfIVcEriuIdkh8HYK/ohvW5YJj6R5UBPFvK8FZuVx2BVqqDdMm8eE?=
 =?us-ascii?Q?BfuXm6NL3PTBLZvSsEMLqnnTyGnhxF6+etUN8wFt9OOAfricmZnrBq1xCz3v?=
 =?us-ascii?Q?7Z2OjgJ5OTz7tE7WPcV2SGKuyoecZ0lJ5Fj5ulWjRaOjJr2ov/oyduF62sct?=
 =?us-ascii?Q?OicNT/QGlQhvWK4QfzX2JP8xLiSUGkTzxefSEdfBe/U4rVSXZtBNSX7jNezI?=
 =?us-ascii?Q?Kba09FRymWJATFMoRqTIRPUTaJnJkBtCRnlBmwf8HMjXfgN6Cpix1G1VofIY?=
 =?us-ascii?Q?o0Akwty7QKwFy01G6mZuSpG7/UlUBm5bCqiQFeNArGKHPKeeenVJTy5iW7X/?=
 =?us-ascii?Q?GrRCXFKur19BIqhp39iDdfKl8dSTPiiWUejyuwRBINSuMzQ0zfRbOq5EUM7C?=
 =?us-ascii?Q?VBz6I2662k1u905sR2O22BsyNTAjmYYFRFxBVGVOchjZRl4X78+JzqfexTmI?=
 =?us-ascii?Q?XcQht2XZKM+LQLM2LC0ylzmS/kpGSLofxJwC3sWrNIXV69BzvRyTkHYvxWpK?=
 =?us-ascii?Q?c98Rd7RgX2jNPr36xWLIh+Dyz2kr0Zg2wdiYdBE5Zac6R1NVYrgfxThyyt11?=
 =?us-ascii?Q?caYVMfs0+cGzngjCWtW/SVLOg2GaTC2qd3IcYqXjOm+t95BjSGHLx+sqCj8z?=
 =?us-ascii?Q?vtnYOJW6vfh0pRXla5a3APubBUqoFWLI+jLdS3XJTirSP8FrtjsLF4CrKSdE?=
 =?us-ascii?Q?Uj3xa9YJ+MU7VI0MTdwAssR9SVkX01coqZuvwhk29ZEkeSU0rJseSHbxqQpN?=
 =?us-ascii?Q?+5Wh4LQXUVatFghgGGuPOLAxSeU71HeTjX2iDBpS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90dcbff7-5701-48f1-2be8-08dcc1564829
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 20:25:50.3645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGBOdPhKB4TW61aLF8WQ3OQdT/IqDCcZECperdmbSOb8ELhn19feq1VtVZ6dDWzMzaHyuahlQtK8941Npv44GQ==
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

Apparently this was only useful when enabling ggtt support
for the very first time and never used again.
It is also not useful now that we have the ggtt_dump available
through debugfs.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 20 --------------------
 drivers/gpu/drm/xe/xe_ggtt.h |  1 -
 2 files changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0cdbc1296e88..add14f3dea1f 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -314,26 +314,6 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
 }
 
-void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
-{
-	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
-	u64 addr, scratch_pte;
-
-	scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0, pat_index);
-
-	printk("%sGlobal GTT:", prefix);
-	for (addr = 0; addr < ggtt->size; addr += XE_PAGE_SIZE) {
-		unsigned int i = addr / XE_PAGE_SIZE;
-
-		xe_tile_assert(ggtt->tile, addr <= U32_MAX);
-		if (ggtt->gsm[i] == scratch_pte)
-			continue;
-
-		printk("%s    ggtt[0x%08x] = 0x%016llx",
-		       prefix, (u32)addr, ggtt->gsm[i]);
-	}
-}
-
 static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
 			      const struct drm_mm_node *node, const char *description)
 {
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 6a96fd54bf60..2546bab97507 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -12,7 +12,6 @@ struct drm_printer;
 
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
-void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
 
 int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct drm_mm_node *node);
 void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node);
-- 
2.46.0

