Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39C6C52D7D
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 10:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B75B10E004;
	Sat, 17 Aug 2024 10:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmoJ2Okb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E3010E004
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 10:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723890966; x=1755426966;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=gCFYsp2qqbXxvLYptPRJnLIM32D6UwYueGKNjHxMqwE=;
 b=dmoJ2OkbQtIzJKUXI4caTJpqdxOboj/hVMLSiXp+iOarnQtEKVeMHZ9t
 LHKXtJIqp1u3j/Ajofcz95DubWb/yZZtjlJ941vfvNnB2f4fuRQj2V3dj
 yb4BkiLgTyDVPKeCgqcCK6VFwLFmDO4Zi8N9rJaR6eL8rY0TAgfaRdViZ
 XnS6BJAov7PgNMCbyVlrewrJPwk8vZKKdhsupOfs439ptoh+14AEseURz
 YTZRNJpRUvGs1FnP4I6Tib5+uEzGYDJRfJCjFjs+NtfZpecdl/AllhDf0
 eaHaAeOFqOXqeBWERPi60BbKqR2QluyKXWNE/c28LL5ytMAfGUnDGa5aM w==;
X-CSE-ConnectionGUID: F3YL6JaMSZyt6k5Kg7OIGQ==
X-CSE-MsgGUID: bYxEaET0QMugzb2Q1Iv66w==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="26049105"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="26049105"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 03:36:05 -0700
X-CSE-ConnectionGUID: YEnkC/53QU6yy9R2I9Glaw==
X-CSE-MsgGUID: CVX9lAvDSn618wv+HsCUUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="64866572"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Aug 2024 03:36:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 17 Aug 2024 03:36:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdD1AIK4YBvLWfHIGn0C6b8louUPAjTf/byIaD0fel7wlnO/jOJptbhu3MyqwZugEiaMbsY2i2D2CIMfKUM3jZscl/RT2hNJW/k91rIWTi6ebvWs9NTprFwkuL2L+rLSAJwpVWyTPQvjOhyu7hpUL+FbuI0KCoSR1Pz7SjOp2LBUboxZMjl9W23PD484hhuGSCvcciMhPMGsigcqp0ZGC/pToS45UKOAEg+A4gmd98J1pUf9CADMi8c0BAoOpR3dI+0qYvJFX+gVjbRB0Ny6FA3r3ms1zK5/4xacz9mgZQNA3eDt7cLrxh+Orf+MPVJdwp5mgK4d06CF5ahOy/6QMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QAxZwj/2AEoznHgaxxqsdAt1kQngry1cnagudkxF7o=;
 b=d7qYVj1t5F6w29dnNRIIwGLIslfbCLAA5Z7etxCpA25BXSSIX+tStpUwr31QD5thnlGOI8jfwPhCcC6evOPbLUUzsJYrv6g+g45jfN5sg+oVGU1tCs3zzNpHMwKL7zwj1ayuGDull7N20hxxmfPDV8KFNBxs13WFVbcQp1pRvtWXnxoZ18H7UhiDosaOhNyJtBZwOxA2wW664cJRxDYGL/Yw+vn549Hg7L0oNNHX+qF0xPTmcNKOJ+aABvlTQjgazU1E1byu9f3O/5NMeXGo808RxZd5TX4j1Goxf34dDVrLA7/PGsnDqIeqnPLUVQ4k5ybURq0xGZpIXXJmuNotRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Sat, 17 Aug
 2024 10:35:59 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 10:35:59 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 01/12] drm/xe: Removed unused xe_ggtt_printk
Date: Sat, 17 Aug 2024 06:35:44 -0400
Message-ID: <20240817103556.163783-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: b411c5c4-d421-4203-59b7-08dcbea86231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?02+irqie+Jg2/sSJZT4gtKoH8i9uFppxadWM65xzPPxs2BxqFa/pAoHr+asY?=
 =?us-ascii?Q?k8r3EUwaPbWuqmaBZ31ChgYsRr38QRuhjvJqKOYA21aQM/bR1M4Jb9mH0iiq?=
 =?us-ascii?Q?EXe8P2In3OZKlvWC5KAE/1A1d/Bj3+0UQNuibTHKSwsa66Jbgqp6/R+gOWcb?=
 =?us-ascii?Q?YHmkJ2j5IhxVxap+KP26TBCw7M2FC4HUB6u/kwdJbipwDaOW/W+3S5UT4jEX?=
 =?us-ascii?Q?TGcIBYjalIi48fd/js7IfIuMp4fK1gU568q4b424bhhEACF9CwvaQRGhxz3j?=
 =?us-ascii?Q?YANTlc9bJrPPumRk2Og5lbgy2f+rkHAWqtJ4p5tJnTvUwqEu+SgLJl8ohuIx?=
 =?us-ascii?Q?zaEMccRC37ou/YyjHoEkaVpFI7YKINWj6u4ZNklVRsb6f5ygtNxPWfc6141g?=
 =?us-ascii?Q?p4UGpjV9fN8fSvJnq/EIEQllugkS/2YE6Tgik0VDN0JAGcGZeZ2TWZ47YuHB?=
 =?us-ascii?Q?yTXwPEmc1LUg/jGyxrqJcleyaHFZweS7Q9E9T3ox62Z5q7/kqMbmivlN7W0j?=
 =?us-ascii?Q?zZHk3xMByOMSedyAAiJZgWI5iToc5T0Y9ZtpTEFaiLIz1tbfzUeghUbaWzEf?=
 =?us-ascii?Q?MwxuSA2GCB+kDH4II8IGAXddINiP2ux4MAgNXmi5HdIYIWMGm8yoD+xVrAUs?=
 =?us-ascii?Q?IG4WyW1o2a5c22d6dYvsaQI1wosZjrXKVooIyWh/1VI6GQP/PecheUPVSgmb?=
 =?us-ascii?Q?AFGuW67x8b9TgWWLJpp8mW04uZYU4RvAJnsPCFsbGGIOV+jdXl9Q+u15CtZS?=
 =?us-ascii?Q?QJcSlLBGkoGQFa+uH5MECwSBQU5W4gJhsEEyvda99rEFQBzjVW6ig9RjOi2j?=
 =?us-ascii?Q?gjYaoXSFC9k2woqrYPcSXCUZaf+fysgi1bDzyCGuruPyNrTbC2tkEN6987Gg?=
 =?us-ascii?Q?06GOxTIA5X6PDCXBI/SgkB4iYIhF9bGVB+1jnkl2csshXkyYgRmoY84QRO/U?=
 =?us-ascii?Q?afvH7vcQ9gz6t/1xOAnO5wOZanAwb4a6k9I0O+VwoAJXkJex06aEy7bbIapj?=
 =?us-ascii?Q?jU5wOMEzXOwZOO/t95c9z5dByLvh/x7l+1K/BQ8KdqflsG/Sp3cceb2Ig8lU?=
 =?us-ascii?Q?eV3pUwLLSxuX+2eTKRotB697TW7MiPHj1kH4sJxDCVEVCBYdMQJlFICK7XwC?=
 =?us-ascii?Q?GqIyDqmJ1zkAKq46iCIjjGEnceScvu/r8kw6bcKAFhs+Jt90O/nN6gBpWQuF?=
 =?us-ascii?Q?eST+lnfiiDatssI0zpf03ATjFLVBCcCfW4cVMscxIWVZ2G4IQkatM3l1yfxo?=
 =?us-ascii?Q?gP/6BlAuBqZg9Mr29NS2CM40Gw4NX4cG7wMyrdaBoRfQtGJph28Y+9UflgbR?=
 =?us-ascii?Q?AaI38M7iyERl8RRHU8Q7YOgiw6O7JILTZxCjG53brt/HOQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LxD49Hl4sn3QxSAtcXeBt/qVZ7/USAfYWG41qIf8hSLrl79VMGVy0aVZOKpC?=
 =?us-ascii?Q?KUQjG7vO7Mm+OxT1LBcxryixW+9P9iCPFewzi02fgYGSrEqGvnqwxAlZ2s7N?=
 =?us-ascii?Q?WB3JRgt8zSIIiXmGGedR+qjpmjxOKiTbp9Xp71iuIi0ZR46Modh9DQx567wW?=
 =?us-ascii?Q?s9lvWbUlzA+fU46X9oPUcYFwYPhy4TazuVlxGBvdLmy/n61hx/s3LDs8vzxR?=
 =?us-ascii?Q?qUCTvyKneqCM/F4vT1MC9b1tzWg6JS7eUKAYZSYANMNZm1eMJ6bn1lr9x1A4?=
 =?us-ascii?Q?AqSJwUcnmn0nLrKp5AP8hNHvcUbWdwbd3CxAJVQ9M758v9G5y9sEqUcoRzxz?=
 =?us-ascii?Q?Q/3lWN0v9QkSenl/uRba81GrJVNoZxTB31yOdg2wI2oBOyHhRwy2IhZjzyT+?=
 =?us-ascii?Q?7noy/KpMAeju059E2Rc4iGjriorT6sDqRW6JL59w82eh3fgoqvSInh01eGXN?=
 =?us-ascii?Q?YeQlI67rlgesSytVnJHiK1mgouyaa5Hf9JPAAW1izu742qhnEhKwy4RX8VIe?=
 =?us-ascii?Q?stve6DtKKoxETo7JCn7KxfTAx1iZrHuw4lF1KjyAYPqACZdjGu5KQBs2TFOi?=
 =?us-ascii?Q?hyttG3cWnufjnbiNP89neCKUyKZpw/+AMu9oZ7KzaIOrBM86dbsgM/cgfqBp?=
 =?us-ascii?Q?88L5W7wU71u5hmdfP3eB4ykhYCgEPb6BnzXSFMu8Y6N1ihE8TJ4aaCMW2goq?=
 =?us-ascii?Q?zM/ImxH/Em6lkD//D3JdUgZV78w4r+aDxRPjha5Lq65EAo1h9tBjbaclZ+WV?=
 =?us-ascii?Q?RJAqr0HDiNabYZHnXWvAJOUG/DSK9fcAxLlj56M6TSHMhx4Xpm9pT0gvdJvF?=
 =?us-ascii?Q?BvRx26Pn8XzGsZEzY9YlLXt5sugU0kO3U1kF1dDzHFKGK7BuE78Ugbybvrke?=
 =?us-ascii?Q?fyP47Z9CotT2Da+zT9SgRSCrXXgKWnzwHsA4NV3Ojf3OWenAx3+n054OtqGS?=
 =?us-ascii?Q?w/ZZii5GgLnl1HgDNjFhVD221UKR/vkrqFVkE+QvvBP0QhB12UTnsiVTEpx3?=
 =?us-ascii?Q?4YGTrgVKE5hZi0Yd3f4Ik0nEoaGlCV2SNCxxbIUSOXm4GSdqJTVDmULtK/2a?=
 =?us-ascii?Q?hpKDpgh2gDrPL3PDcqAM6edtGY5ByjSdFipOspcq1E8I9+KyICQDZ5Pl3Dk8?=
 =?us-ascii?Q?F9vs7YGVL47KMy+Jng/OKNif+4cXypZxAWwgz2rFRThpsLTSEOirgBlWbu0j?=
 =?us-ascii?Q?kCMISrCg50qvXZ1H54iHn689KmAACC/v2IqZWeFThjpRaSPKYRXdIGPtbTxD?=
 =?us-ascii?Q?rc6IQcFviMNjm5gFkn/fzys6idbnuSiLS63O/+lLpBBUwaihQ0bP4Jlr0iDE?=
 =?us-ascii?Q?i5utiS95p7MFBCnp/UR5BtZci6TDyVoXR6hNuU+G/PZldUIDmqJfidAURMOd?=
 =?us-ascii?Q?nC4YCrCwhQP+Cc8VcNEt2BxNCvZsob0KFRYlTiA46l9XRmqhS90P0gBlvfO2?=
 =?us-ascii?Q?Gba37a13Ben5aolBX2Ik7QhfqIYiR4pL0PdAA/yi7mYJD7Ducf3v6gydPslo?=
 =?us-ascii?Q?IiFaNbLiAtFEXrQCxFuT1p5UAXt8PDFsHCUat6g6lBiuUtK60QV8UFbLAov3?=
 =?us-ascii?Q?IqLdVrxzX+9FXnQrdi1mk/KvDcWb1b3kb8HI9764tfvOnOw+mumjgtO3kUX0?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b411c5c4-d421-4203-59b7-08dcbea86231
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 10:35:59.4175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58HN8G1uKrzEiAxHM/ChrO3H8V1/bk8AhMciiyKYuD7bGl02fZfsGnIDzAIsW3HFvDEyc/PALSP2qTqJG6rxJA==
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

