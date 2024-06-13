Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A214BC27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 21:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F226E10EBB6;
	Thu, 13 Jun 2024 21:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+rinhrb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9168510EBBC
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 21:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718315251; x=1749851251;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=CO9uA+F1Damc3UTf/R8o1kqgdcguMMMPgHdd4xg1DHo=;
 b=K+rinhrbst0LKI82VGCFBA0yTNez40Ml+S/VZaNflfcl2BXZPnOFlI6e
 VvqLfVzFZyUxc2geAwdnlMvjGu2DM6sH4IhAZzkcsi3tavBiLBD88e1K/
 0NxaXu+AS4YZKRjerUEqKCdIaExP137otSJxzmRckegwbbWXaQLIEOX2B
 Z258yNrFSadbl2ZocXwuEaahQd0BM9W6kPTVscpv4dZ7C+aDwy8KFT13a
 ZtbiEwmtTpG70bNKEjcBrggbbUbtMuRadPpaSHVEbieKpkXHPAaBTxjfR
 sgOKbbOHtUhc5tO28b9iS4Mk1SrOY4YuoWEFWa2MDy0UNZWk2JCMVN3OT w==;
X-CSE-ConnectionGUID: GwoaNqSiR9qpUz6FsOHYYg==
X-CSE-MsgGUID: 2HLeupAoTYSHVK83QEFlrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="18101725"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="18101725"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 14:47:23 -0700
X-CSE-ConnectionGUID: tslqHnqgRLiW+/web4enRw==
X-CSE-MsgGUID: ILFdbvjRQtWsdn9+kVoWTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="45206808"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 14:47:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 14:47:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 14:47:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 14:47:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6EkjxcW9fq/lYfKMz+IJtxDwS5EZ2fk6572wkiGUdT7do/kuQxs+6rzUWSIRGfch20v4iR/sbjsuxdIk6LderPb++U22xQWI+ZtsCsZR2xN0RvhipzQOivsnaz3rXqdoteDPlmhTHkeKrdQNfXMgPRKr9rZ9OZcIH4ffFTVKp1QTJx0rf62HF/DsAB6fWbqNHov4NM12I+UqwgGPEFBOk6sSwu2+fVtt3iDqYhLVSlDm2GsfeDFzPzRMBWvaFvuJu1xoccgw964R2cqdgLnHmnxwGeWQeQxLgI0M993BubbKMoSxFbaKuyTEUKsTnMkzHycNY36srA3epaMj49SZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+TaKDbd5XAzJIK9ly1FV4gQSqElsMhLYyW6WeXbhU4=;
 b=RzidD1baLbYNGQn+FkH0RDmRs7JMj+mXGbazN/Lrlz26Y+bfzrdFpUOUkTKrWlNP0K1Arj8chnlEa11hBbzIpeoq8YLdNOjx0UlqcCXFXnKJl2iGJzhoF+93G+GySS9Fvy3TucXbudmlfhim0mqdlXrYSVgpOq4RkvLCGcn42JUtTWn/Va/ECZvlLV9mO2UlgBjzFpbsZTIYQ442Mx6ztNh+4aiTGmW8QyUPPc42MVfB6bnLF9JVyYPzu5GYb+McpmAPEZCTvUHCTjelVigshKIF11oPV9tD5QKAMS/hVnyjExnaozO3ilz3qJH/VoWB3o4HxHrSxEhQ4B1dxZJtPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA2PR11MB5003.namprd11.prod.outlook.com (2603:10b6:806:11e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21; Thu, 13 Jun
 2024 21:47:19 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 21:47:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/xe: Removed unused xe_ggtt_printk
Date: Thu, 13 Jun 2024 17:46:59 -0400
Message-ID: <20240613214700.306424-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0207.namprd05.prod.outlook.com
 (2603:10b6:a03:330::32) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA2PR11MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: fdaacec5-7d7a-4a49-c706-08dc8bf2662d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|1800799019|366011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VfaEh32ZVuNCncYundP9Xxo/qALxpv5U345XILypRVE3cModPcTS7maHMbVM?=
 =?us-ascii?Q?YOF/ht2oAIfdTpUC5RepJrI21yTKjuC26meFb05vrioMJBf4CG3+6jHgfz+V?=
 =?us-ascii?Q?nL0OC0m4w+IqCIOhL4bZWjj0jj2KA2+vDyg5zSLIx2vuuTWokIpxKNH1DcjB?=
 =?us-ascii?Q?kaAZ7J5cdTNjTiRjEZuXgfuNSfwkIhZLDiGJ8GDxAD7L7AFKfHglP279uAeu?=
 =?us-ascii?Q?vGf+Zu5qYl/f29wtYilOHsrFfxiAeeIzhSF5NgdGhfW0E4OqWkeorV61TNe/?=
 =?us-ascii?Q?AvLpteVu/oTa50uJtI3Bm8GKIEJjtfmRImawgEmYWDHv2+JCpGqSUNnRt+cH?=
 =?us-ascii?Q?CoDgJC/kf40BoskUMg7nMRW30kovl/yiWIfeX2/pwkbEVyNHUuSYO6Di5ANO?=
 =?us-ascii?Q?r22jmoLaD18r0fU7A7gAuNZw9xmDK/p/djp2xX1PfYsGsdVxNh7FD+dlou4R?=
 =?us-ascii?Q?9MY770K3z/eNZUFiZmT0ngNpPWjfCJ+FnzNDiFycForYkc36wjepJyXsVyq0?=
 =?us-ascii?Q?9xk/t2ueewizsubKBEkddEY3dLjgXOtiE5lPkFolBWtISUdfaX+rtzkCMkzp?=
 =?us-ascii?Q?AiyY6tcYzrYYdIkQYgCSXVc36o3P7uYMEF7UUMTzSaNej9A/G9P6FmhAhjcC?=
 =?us-ascii?Q?l9Z7N3j3vsu98SXGdtkVo53L3oFw+YWw8No43MnCHU2yAtNshajTxMXvcwSJ?=
 =?us-ascii?Q?yxQsP0iVG83XqzZWOzpZX7ZVlutvW/UR3tgqoOjI/UViFSuOptoRzDVNguob?=
 =?us-ascii?Q?kTXQgjAAcCC6CCkOOOmobpAgJgD2Wuj3sWEoEs7r4/3ILtyO2h22ifa4GzlQ?=
 =?us-ascii?Q?BpR+OHBfh/haU4ilTcA3gtmRfLZDOQSp//JUYnjIQe1By4norCenHjToW9sV?=
 =?us-ascii?Q?Azv5VuuVpOacpDmEhT9Ks/kh/JF4n31D2LmIHo7qObzX/7VRB39BYNCeOLGy?=
 =?us-ascii?Q?T5mQSX5Iki5jc8O9FqqWWM2JyCT8fycs7+GVSOczptDYmPc8RX3F5opNXslY?=
 =?us-ascii?Q?R84f/L4LcbczQN7BIA+oNt14MunwP7oyu643CHHOZ2Zwh8jdsi8HjctThaxj?=
 =?us-ascii?Q?4m8aQzsXOahey9Nd9XARNwLhNcnEPtDklSzjJ41uUFzmAyAlRWQx7QQC2x8n?=
 =?us-ascii?Q?oPkATEcCje11zDBkJFFP39MC8qmchNMyY/AyhDyfV8QN0nNZcVNPf5t8stBm?=
 =?us-ascii?Q?j+Eti+bhQZ+4wTwIiOX4zzlhGDrDinfAm/3WwjMmdaygrtdZz5uoyLi7wB8Z?=
 =?us-ascii?Q?A1hbrwYjxQjQwp47NI9HM0y1A+qpTQvxwuxI3lWcYpgnA+p9PDfl1YeGcCEu?=
 =?us-ascii?Q?2OfQey23/n8n65LgUT5WQjcq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(366011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qyomW6ykm7r+tMD35szwvnjEetBwvydl0iJFgYwW7djq1xP77hsgROyDauWl?=
 =?us-ascii?Q?SoiEJfjS+iUOKeI/ZlCOmxjKixnijbs58l3U+ysgVMON+89CXQfynC5550Sb?=
 =?us-ascii?Q?ipfHQMXH3wQ0g/Xs/bNtsA6N8u4njzyqGHJ9GCpwpo4TWlwdBNK1prQhWxsR?=
 =?us-ascii?Q?yioqI1ithbldLSzG6LdVpYG2spUwkSocKDcdnoV6Ub/xjK+UGHsGLlUL9LQV?=
 =?us-ascii?Q?S7gZ6Hv5i2GwdnibjEn0vqPXEVHI+seYOYI90wlgl5mPPoz4knztbHMdE/5G?=
 =?us-ascii?Q?TPNhsx6e54ahTIzOheUXfTOpnXmOWzbdnY5P0WIGS9NBEy6dDUSFvQZ1r2x/?=
 =?us-ascii?Q?Uh8PruAwq7mZW91bAGmYYpYm6qyQZVd0xhgqFB2DczUY7iqAU7RNzz4ly1os?=
 =?us-ascii?Q?ZJ8ahDaDs4eV5/MgIoxk24nnikJ649lV7WFKHvC8VaN+VC8OOTqhj2OdPeNO?=
 =?us-ascii?Q?02MqD2WnjZZxDcpHJWYn1NJxTZQ2C0l2cBBT2b2FBW/VucYS/RzFB/umL/BZ?=
 =?us-ascii?Q?rSwzFZab1M0auIJyNg732GOIpJG+Gy5g/bcxsv+UelcchM9wjRvNr6Gc3l1E?=
 =?us-ascii?Q?wO85Vycr7lJ5aTzU/QvXxG7OoYfaLcETuCcG/4k8wdyV4KVJ/L0Ao2A+RFKK?=
 =?us-ascii?Q?VYoxNfIMeDdPszY8hIvGWBK+P0A07rCxdJojmInZRM4LlFnndGL5NLYmYptt?=
 =?us-ascii?Q?jOa2H3aK0koIoEPsSr9faP4z/FJGwPbhQfwbAk+2NHh6cMJpaxNW0NrcAhcB?=
 =?us-ascii?Q?BG8P+3j5JlYEFCHA+3tnmE7feSXVVXMrZzr1Lpqfy8PhRoSNPK8Hs8TwijvB?=
 =?us-ascii?Q?oLsbr0J1m/xstZ0fzDDQ8jLx53aucTTkicKLO+ALJFZvLo3rmTEnqQp5SYlD?=
 =?us-ascii?Q?ytbg0VguME69kPTGy2J/YiuNTveR1h2VmETvauB7itA7RchxwOH0B201BM/q?=
 =?us-ascii?Q?P6XSyZHIXxAIBuu9pzNwp5ypiGDKdOyCOuTS8xB7osAeaEJ1Axq03tBIRbcm?=
 =?us-ascii?Q?ULPTgUpjILLB6D5Gf5S+lVQ/cJWrKRai9R6jDaASR8E6lWT9X9RXywuWl5Fl?=
 =?us-ascii?Q?U7Ks4/g7PhWfh2yFgcsZRKQ+6IHWsZPBa0vGlYGeK0aKZYnEcoLme0aHsek8?=
 =?us-ascii?Q?V3nDeuRjVbk9lFRPIPlXvrHsix1bvDj/KU+/jekz74G2fofSo8nwYfBGXFO7?=
 =?us-ascii?Q?/E+MOrQ0/eV6lANp+/fQGazXkpDjfmkiWnLXq5AyvKGm/WqTi1TCgGd+fq3R?=
 =?us-ascii?Q?43JqUxpyzAhGc6ARSXUAM8GQ1LVpSM+8V8EkGAI8NDTtPS0zsjsr93k1w5SN?=
 =?us-ascii?Q?Nygj7JNbwy5ThDhhELG23Zlw7+9eG/5deiYVQYdpMleKbiAtPl2BOgUFYKUi?=
 =?us-ascii?Q?Ius77JeAtouR0uQBD/4rsDq03E0D0JR5z5n9jGJFgzpYfqAvATsgJDb1Q/r/?=
 =?us-ascii?Q?y+71A5xZOs0yjrEV5eWvNqf5JZOR95ePX9ZTMPkTBM+H+h/oosz+SvsWv+QJ?=
 =?us-ascii?Q?euAR2TZj6ig5zKUzfWQTQeIsZnaBNZlVtVeQ9QFhFFT2sa5Pi1D/1uEUaPpk?=
 =?us-ascii?Q?tjzyMM5vJEHRy2zv/AC/uGT0tHH/Hi1vyOMFqpYC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdaacec5-7d7a-4a49-c706-08dc8bf2662d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 21:47:19.8957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zfd5Ix95iqLMHE46Q5W2hp9LYbMtHfRDI6Lg6mp9DO9HKN7G4iroozZyUqXt5yEGaVwtCa4TPwkdKRyr1o/hwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5003
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

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 20 --------------------
 drivers/gpu/drm/xe/xe_ggtt.h |  1 -
 2 files changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ff91fd1b7c8..2d5e802f862d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -277,26 +277,6 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
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
index 4a41a1762358..ef86ad7a079b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -13,7 +13,6 @@ struct drm_printer;
 void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
-void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
 
 int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct drm_mm_node *node);
 void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node);
-- 
2.45.1

