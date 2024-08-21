Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F4DC52D6F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 19:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3829810E6A4;
	Wed, 21 Aug 2024 19:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0bbmgyi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC71C10E6A4
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 19:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724269129; x=1755805129;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=gCFYsp2qqbXxvLYptPRJnLIM32D6UwYueGKNjHxMqwE=;
 b=R0bbmgyiNRhPVWalBwTFQF3AGtaHGaMxk7HGSDRVEQE8zWDj1bSmwYGp
 10BF5fizNAyuBc46Sl0A96FqD2pmd5+pbJyCmlge8SVYmGuxY+bZPmEtm
 MZcU3C/9VLmT6sSn6OboKc7JN+OKh89w7HBz2PYF+aJPeVX7iyvePMmZC
 eLfgAOa2fUSJbQyg7v0GcfDmUQwNsLca6DK3CiowXKwOYFazCd6mmo8Ft
 ksNv5amORan5v/T8tYxDngF/c7iWWy6Bl5zG2hnNMbxsOqU8r+deJmzD4
 n7LdfDnDnqRvVkiEzlx7bB+rTQ625MoJ5ftaZITrIeZHpTBce5nQ6EXe3 w==;
X-CSE-ConnectionGUID: GfhLj2Z2SLyUAaGpiU2j/w==
X-CSE-MsgGUID: awzpsXZiRNm4Df0TmkcAVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33804460"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33804460"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 12:38:49 -0700
X-CSE-ConnectionGUID: kYfzMTs2QEaH5AdZesKMTQ==
X-CSE-MsgGUID: Oi19ELUQRf6yrfuDetc6rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61055264"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 12:38:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:38:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:38:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 12:38:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 12:38:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2HAP2mWIV8eDcdcp6+/6S9BtBHoMK8D9Cc+ETPc+VA2J1eFMtcsaa2HKz/ReGUuGkhmuxRQaICT7KfQOaRzNy0be4NxaoD9gXtat4i3AeVCUmZooe0XKvL8m3G4r3zNcENa8jawjkKWWCM93kga+8l/k62oXWiM5a8+Dg2NFesQw7gLdi+iQHNw1daE7js0JhamCRoI22AAB4VYYc1w7DcRh1X7WGNFwXG5ahN9Ki219f+U4WT2kK1+QpJoKdjaNvElzs9MC+oK9lyuApA9ymQi1P4ZfBN9ieFLKKWJ8upEA+jbqHaShYaZ4NZMRRbQdARyoltCUB7B/1S77NoxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QAxZwj/2AEoznHgaxxqsdAt1kQngry1cnagudkxF7o=;
 b=ymwaaPlMoCrwNPJjtJMUbv+Lv7hQM6I73cBL9X+iJJ5qBS9vb/6erULE2eogiH8zGO9mW32wk1birhRyvAY4bGXWW3LowWGMGl2jkHGHfuRwojscFmRicuEaLwuJ6IBoSb778bGeesSfFQhAtA7iG5sJIgY8NChhF5a6dO9GqySotNcco5IbA9XPsIisCuVBtrxgM4SqDivOOMIXrOCkponnEoBp0o8loasl0K9oT5XbYtv5ArO4xxYHuYaseSFP1Tm89qqZ1Z7WHT98NvHG8oEH3oS5cowl13aA9ThZQdaJFGa06lTZpd775Dk3kgUhiW9exC31WvOPkYKiavuVBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CO1PR11MB5041.namprd11.prod.outlook.com (2603:10b6:303:90::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 19:38:45 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 19:38:45 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 01/12] drm/xe: Removed unused xe_ggtt_printk
Date: Wed, 21 Aug 2024 15:38:31 -0400
Message-ID: <20240821193842.352557-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::27) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CO1PR11MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b2a2479-e3d7-4e0a-ffcc-08dcc218dec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lYXUOSkDafaIPoUuWouPxyyIVwgKqsgxT1DhdVl5ASo45tftNvc+5lcSy59B?=
 =?us-ascii?Q?veOz4TVfQSFk507ZzxJ/oOPMtg9g9W2I8n8yA/7uC/yZFPHXPl1WQ/EKWbYI?=
 =?us-ascii?Q?PKtEdkVle25n8UXssvnSP2fDG4illo1XSfiSTqK9rKm2NHa2maYevJ1gYpKf?=
 =?us-ascii?Q?N6S2vpcpK79gwujNtdP+zj8tbM4+KhO3GLxi9qNTshQd9U26BgvTgR80/by+?=
 =?us-ascii?Q?nUwJEm8LxgANx6XcmpOLYP+QWinKYhJvs7WRMudGw/dnkEuQqIM2vfSbvv3g?=
 =?us-ascii?Q?sQuXZhfJUZMyxbMdTH6Nk3sOrZ2YE6NKqL+K+vV22DpPj3oGltEtDr+2enJx?=
 =?us-ascii?Q?U6zClaUIh011VoGeuvJd4Tlz7Coit69fluhIwVcAaKvCUsyQhNc5KaK94EYY?=
 =?us-ascii?Q?1ibnJ19nmIvNvj3LAlw1xuf7jAg/DZi+APR957miRRpvBjItYD1d7Ej/Xi0n?=
 =?us-ascii?Q?dH7FnGv+vSpDI9Wby5eqQbM7jGDTfKkGwn1N/9fgGwYTn04ENmrWYlCamey5?=
 =?us-ascii?Q?B1t7JAHdnKFQeP4dGKBEFY3pugIF0VjY6NzoV2xrFTmljJFo9X49SFd4+wTf?=
 =?us-ascii?Q?l7sGllDoZkZkXO4azAVl9Nd7iIrIv2BJOCXgdz6cXu0qPeWmnJz2iWqkFudX?=
 =?us-ascii?Q?htt1gQ2jntXAJyrQW8qXBZ1ppaAwnrBgPo+rn13z+4odQIB3Vky7CjykQAft?=
 =?us-ascii?Q?DblIENHgT75ZyRQyjQno/qsEOo/Du1xdoMM6Eje1xwAoxT698rH+hlR8ood0?=
 =?us-ascii?Q?J/tZ2FtqKlII9EMcBPpPBqZJ2ZHDSA4lV0WLCwHKBdnkIkl/7Y3edGbSHnFp?=
 =?us-ascii?Q?ASarro2p0+rdT8c8wivuk8I4mJ39JxlCIhY2Gt5Ms8C2m8KXFNGsgZqhF3vb?=
 =?us-ascii?Q?k9GWyI6IckhOV2g7DMaCvdt1CUclpU426e6/oXxQpvK5COEmlbqhn4VyS4pi?=
 =?us-ascii?Q?u9gjv2RR0NJx7tRsKJ8XCy7L2VFZUyKZQvACaMDW1fMf0o1aC4u8Z0ejP/YR?=
 =?us-ascii?Q?v+gIlwTOt6p2YwSr0fSKSDmdKfAlzHp77VzavnSiMl69nYvdEd19rqqffAh0?=
 =?us-ascii?Q?oYK4sm9dKKWyw61SEY7MkONZH92xQZZY9/WwHSqzhYpCHbt+LtC+34p7Iwyw?=
 =?us-ascii?Q?cr5HxNyNlZOgOZs+NyjtQ7yfdT9bo8MUGOAXMyLCL8iSsHo1be1Ymvs42Ohc?=
 =?us-ascii?Q?RMrIzB9p5OMj9k9H8rlmFtycQJiuL0sgJnLE5iwjcDmZ4S0kzWLNHVxPD/we?=
 =?us-ascii?Q?i5oqSfuiSw+V5VSUHZg00ziG7u6JxfzMZKA9NIaNbn952t1/3uhpkKEeSP0J?=
 =?us-ascii?Q?+w0tnk5wY2XkNmBwpyUUOmMf/UnUk9o7lFNIOz9CHunHVQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?19rvmSGpb0EXggpIjUmGbSl/BRo27FznBrrbtqWv+0wox726vjqQdaa7rj6S?=
 =?us-ascii?Q?r5MK8qV9kNig7HRIS1N35iFVX50+pEjOTesKRd9YjHco3r5o3WfIDlueB4kM?=
 =?us-ascii?Q?IyRw4wacusKWwb1+lhMnS+XQaHf1B1sKy14k2Q/Jz2TwNr7gEZ39e5nT+Uo2?=
 =?us-ascii?Q?WDE/oXA6t3hJqv9GLWFTPUMOPCM+KCesJuvVgyTLhnI8pREDB6yeNOpG1hup?=
 =?us-ascii?Q?wyA3pohurz3bkT2PmeS504pcIok0eSmCJSnWoeCZ7GM509ZedA/dL96p5raF?=
 =?us-ascii?Q?eZxolYngn1RrgoWWYuMT8QMrLbYCNm+n4Sz3uIrMNXKLy9lksQH1BB5pzjE9?=
 =?us-ascii?Q?E5JetLiC3P88bmKFdysp1jUSTVaQcvVw36Atv7MZU30Wxxj2ywX9z7SVfNWA?=
 =?us-ascii?Q?3dWOssP6mEfmITLlf/JWQ9iEkYy9Zrt676R3KPhnMZqmI5x/fee9HBgrO9T+?=
 =?us-ascii?Q?1PNlZ5EOsNz0GWt/kDahf8Bxq7SMZnwGwPsgCD0SPxr923pJlCGyk63izp9b?=
 =?us-ascii?Q?Xwjr/SJ7Z/2VjFX0tLiEP/fq1+4wRsEHNaPE2z6P3cTxTSoPRFRxsgfTUnyr?=
 =?us-ascii?Q?E2Q7XPXc07akw59W0fGbCNYE3asg8fGFyTXFAH9QAj5vwiE0se8uNjbY6vs/?=
 =?us-ascii?Q?5ZYER4wVCvy1S4OVdwaz6HBZ36GNbdMlb5axoofpeQNk3HOYHtJYgC3vgpPI?=
 =?us-ascii?Q?I6rcIjW9mndT2nxqFkzuXlzj02McvMZUyRBq5KRiX/hXMn86EAqCDlmOlyFa?=
 =?us-ascii?Q?E5WMqUJnnJ310gpzXo/awBdPeV+n9Bb4pSUrDOdMxcVq1BeJkEh/YkZCp7LW?=
 =?us-ascii?Q?76lKkSoeVn/eJxgOddwsDEGQawXgEuU8hSzPMhuekO+9aLObX1PVSxnRBCLw?=
 =?us-ascii?Q?4wb+yUTY9u08X5KnHbVrPCrhDFHgsr5UoCL5uKwHIe7BqY+BbIOCZmTupZqZ?=
 =?us-ascii?Q?J4eEBvIOeWfck3surjHTqcNGHS2Pn/22XiEanazwQgGUMfSeCQKSvIcWKDyU?=
 =?us-ascii?Q?6RjPnYywMRtg62nEEPVOOy2xUGnYGhYbdhsA1d8xjpFqHraTwd3lrsKcV9tu?=
 =?us-ascii?Q?2Y10bkDCeTIVVtWISrSoJwsz83psT/HlFHo7t0UdP/xUguEWy9RtfQARWjE/?=
 =?us-ascii?Q?vov590PKiov1AqXfK9+zK8JsG6xwCth82qVC/cU4x1ThxcxMJ1L3JnallQbh?=
 =?us-ascii?Q?agToAUVzp7Ns5gP2hBn1EZGgwAe2YApEsWI8UwSVJdZXqypc93Ns4pcdzNi+?=
 =?us-ascii?Q?7Z627tLqyA0V0VanqP2KlCYTCwN6jFVh7K2accoWi1Y4ywPl0kuRrlUzWJf1?=
 =?us-ascii?Q?60X1XE8NkVKs/UvSz4u3B8rcsAbwhBGuZquJ8ljyXnCq8UWdlLZ9KS008jgn?=
 =?us-ascii?Q?zj19fKAO8MDL5zYZGPley4wkbyoygR1ql9XJwPkEegJO5VcNMNYzjFMznFcS?=
 =?us-ascii?Q?CSmAVuqjkFKHjkARGVeDeAtCRNAL2MvaDN5t9lN7hqq3ULTxkC0Ko/jOMG1G?=
 =?us-ascii?Q?Lj57iJ+D03egEAHLz5Fvgr+TInllL1+AWmFWPVQpLfkPYDhmcPwbZU5P92Kt?=
 =?us-ascii?Q?lNc6wT3PPlBonO758IiViQfJAtuKTujW3SPzoY7g?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2a2479-e3d7-4e0a-ffcc-08dcc218dec9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 19:38:45.5110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2bo3FQ9buxCan2xkx86S/3+Dff2G2AjGJhg2BU9cgmpDM/L1jdzzrcbsL6JAecJOK5AtIzmEYk6R7D6lvl4yjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5041
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

