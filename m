Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D672C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 19:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFAE10ED34;
	Fri, 28 Jun 2024 19:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBog//PF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0386210ED35
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 19:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719602894; x=1751138894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iI1ZtOgDDwvVAL+ZHrb+4NOTIx1FtwBk0yHn8l1DF+o=;
 b=aBog//PFE2vbDfREtZj563EBSCVDhKIf4ZQFM3/nNPWNZMNPabB8ZLI9
 2wxcMrn1Ue3YHokWfE5lKkuvDi4IntznmnLbA9E7i8LHAQ2t7sCWVWr4C
 k0DGMFH+Dh18nSHFcJrNGQD9yYlurFtjGhJeM4FQjlXKpMUixgiKjQ3yt
 WmbyYbumC4HnBzXQHhQdHbpaycVYejreo8CCf1FFLnVahc5isJWvW3EEP
 C2Rs/l4kSXaEF87adfg3zx2X7izweFQBfbqYSMBAt8BIOj2iXeSplanqC
 KHg8oc3wAkhQMtGBcKqNAJ3IRb+owAvpnkdN+C3zuJvuRBlZRcjelaFzX Q==;
X-CSE-ConnectionGUID: k5VgVyD6TYOpctoHTV4e3g==
X-CSE-MsgGUID: ss4qbtq+RZihaLtsByBP8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27930962"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="27930962"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:28:13 -0700
X-CSE-ConnectionGUID: VNGtWXeDSm6PycLIZj0SpA==
X-CSE-MsgGUID: Kmn5dZdvT8SXR8q8qmE8Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="45253685"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 12:28:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 12:28:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHMe4JGE7uAdKoEGY/lqBGbwOrcMS6lCwYiu75GT2ZTRL59iVZpAzW2LS4ZTKBqRH/xNfnKc0LWSVPnDU+uhRTkT1fVym1aKAYmvKx/x7gvRuaspq0XxnSUXlkjR2S0O771hsBDTjL7rChg9C2MSZZjqXILvEsdocszUoidaL0ivwagNmBvx7Vqk7tM1oLrI+pY4hSrCbQ9Dl9Hzp4sbiq/9ybtJjpjr4/lw9Rdw5uBLc6u+tYlDLlfs9DP0IABjJ59Pk/613uBwak46otVGBP1EhpEFZF7OJRPkoPhjd+0n8L6qQojzkP72ShoOHg/IzHjPYbz51VdjrQ8ehUVkVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEy08rXIweH8tPMOzMyNmRFCwuArP0LFpgadE7RdwSo=;
 b=BIhgGyBH4Vt+DzxM9ULN+jA9DGQqy/oyV0r6txO6PMEHWic+xVrFZmuSavmrWE3ZCnXreAHLhpyswurVecFsDHGpow/lkqr7v7tvW2a6Ti4gKaLQ8jaKSr+2dYFKJNxA3gMTBSxzUf7Xs4D2FNzKDXzV9huAWJN4qWsc9pCzP6ihr1myuFPaZZPiHtyiWMIdT+kqJXA5KRcVrig+W75Ur7Og3lH8rKW5Owj4Bqi7VAlfCSwyPTsJaVhzASspUg6e/xUGniVTMitSa4oUrssbHI7osUd6rJARdim6nZwhzG6lnf6+zS4oQzGUKc9MiiMdZL9zM7P7sKm6/FJLygZ3DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 19:28:05 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 19:28:05 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [RFC 01/12] drm/xe: Removed unused xe_ggtt_printk
Date: Fri, 28 Jun 2024 15:27:42 -0400
Message-ID: <20240628192753.386137-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240628192753.386137-1-rodrigo.vivi@intel.com>
References: <20240628192753.386137-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0060.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::37) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d03909-d1fd-4198-2719-08dc97a86f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mTY8+zfHxWnTOfURtRTYB4ipQjEy/6ghuQlL34sPF5593zOjFVWmlUW6dOdQ?=
 =?us-ascii?Q?puljMxI8wWXFAeX+D9FvVKxwxHZ5IG9x5WXEIf1Cp6GG5RolZdPRaD0skxei?=
 =?us-ascii?Q?M/dF1CQEW215LklHCMupUHKWHUtiP59rEPx13oM8bgMqJR4iw4bTSwZRyOK8?=
 =?us-ascii?Q?dKI+sfhgIDrAd3XPWg4Gq0rxlYzZPzQYqzg829NKsaVq2C3yOMOm2YlWXvJ1?=
 =?us-ascii?Q?PiVoCET0NgC4/G2vBw4COpgDOpI02bLo0LHP0DMQihRq5yEMLX43593laGKA?=
 =?us-ascii?Q?ROgVhJZWtJu/1vXSeCLTsNGDTNvJ13w7rBt649p97R+Iek3Tyz+GcQhHYXuC?=
 =?us-ascii?Q?zpQWd/TzQ9G6YKkgTTHAKNC7bq66ffpV0PSmmS9GQlnZ1hYol61I/rwnhBG6?=
 =?us-ascii?Q?RoiSr+DSHGM1+N6J5rWTVG1VDxk6DUTXjLrlLBSxRiFYdMhO/z910UZot9of?=
 =?us-ascii?Q?X+iOp1kGJI1e5xM5Xyztn71PfmCqtr7jXvrnbejGFvw4ZTwWGKkd1Fzl7iy2?=
 =?us-ascii?Q?2EsotGht+LfYQ9HWsg6H7cMr9DJ5GUGMPxMFd4S0yM93tFCs1+fPafIUy4cX?=
 =?us-ascii?Q?OPJinEHTli9jO8TBAd9WL/u/dTpxeKnSXCh0dBZVVgpXcrcoL98yUAziDTVt?=
 =?us-ascii?Q?sT+KJNd6V+DTnEZll1FMmwvFqQZq8qsxxPZ8qUcT7ikTKpDLwY71oPzgRLmn?=
 =?us-ascii?Q?mZPPz5FZzfstcffZadxXXhmBiQnBaDTqGr6Mo7+xWcu/lQPguk5MYBJgKqhh?=
 =?us-ascii?Q?7XQUYqNRyoo/PXzbghpl3lNqvJCXDa3Svi2LEj8REZZNc+XC98nlYEdp2hvu?=
 =?us-ascii?Q?6IaXBsZ2ruNMyBNOmpwZjOh2gNvGizbBh60xnzm+MoJP7UwGjnCaDSmPIel2?=
 =?us-ascii?Q?GXLIVY4su9RN2OdWN0Ghs7R3AhldylntfMJuGlnHhfYXF3KuT4SBXIEjiZLB?=
 =?us-ascii?Q?LcxxHkaOBAtT09srJir807NkQ6tdGW2YVcXIpazjpDwlTlaFp60ehQyw788k?=
 =?us-ascii?Q?15L7psfqTWLeQI930apekjUjP+eva9CIBlv0zVtaO8b56UNyMkEt2EsHSOXk?=
 =?us-ascii?Q?R9uNlQX9S1CeCCAi78Wye3/LwK0L4y6HNiIbyEWchJ47x8+2mF3Auct222ye?=
 =?us-ascii?Q?H3976D68husNJXPFL1JCUstLkblUxl5RUO59bx54mVIyps4KQSSlOLlgGTCV?=
 =?us-ascii?Q?0UXmz2KpAOA5W3tEAvGEQyAY5MlC5EDW6AhljKCruld4+1b1BquCA6nvQ3YH?=
 =?us-ascii?Q?qeI8f2zOudiPWn2EpdhRXcnOgRcKm8xnmbOSH0Yl39Tj95uRx2HBChTp77WJ?=
 =?us-ascii?Q?eGb6VD+hCrGVa+IFNeVrSNP4IY2roMT1pKDI/9IhMVnPHA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cyVFccuw/sjKMgnJcXAL7K1COdwLIvGbBOl5uztBKNPha3JuAhYdcLzOyUJt?=
 =?us-ascii?Q?6NESSk13rBl6L9sXIwy26QLRq06CslyZT8UwT/HBjzaBcD4H9GnfoMshoYF5?=
 =?us-ascii?Q?3kM3/md7+zKW/Ic5FHPvPNVexHK51WEyOgWMGqZ8XGpfbiOmJxu0AAsCUkC1?=
 =?us-ascii?Q?Nuy5fKx0WEjG7iBaRb8BVnZZENn0u59PPGdgljTFg9nb7+Swo9rcXdSdCHj0?=
 =?us-ascii?Q?4FceuezFSaGBZHt+bn1vxBPGj3D4lsKqHcRQPCEs6uoskXQvs1JHnlS5XtQs?=
 =?us-ascii?Q?DIWhIl3FWahlkI8wERZUX1tTT/wQKZ7WKr+TVLgZbdRLg3DQwwB9uNyBEk9N?=
 =?us-ascii?Q?k2XKWElnW9RoRj/7k0tzCSZHPga+aW7HjahNledWM5I6vLoaUtFKKsr26ZRy?=
 =?us-ascii?Q?4KCLbtZRe0LLl+gRQCFarB81BN7XhjeumfLuCzmdOnpjwP0pK3XoD370kQQQ?=
 =?us-ascii?Q?/kowFljPCRTw7k7NR4CbgrfOKODxQm/q9+MU7mJ6YqK61dfKD6fa29RMi1Rx?=
 =?us-ascii?Q?2BpicrIuH3WHWWAZcUPLMxChxaaS/CNqi1pmBEZWvy7ZSXhTWOioHR+IMEqX?=
 =?us-ascii?Q?1+9IogZLRRPZZfjFxi+KmDutyNKXNzQaPFVnn2TORnybp2vudNg4Iyo9W0eH?=
 =?us-ascii?Q?MCNJ8WobhaSfPRZ7q7iGezl8NDy75Dz4ouZM0FpBf2GLDT2UticoLGhqcrPW?=
 =?us-ascii?Q?9QcWPtSLsLtiWFI6t4DfpD7DEBq+2Fp8I53Pi/JeBK96Hu6LZ+vTms50Gieg?=
 =?us-ascii?Q?xVTdgmq/qCvMMkMLxrTl55D2iUBeuyJ1QQiTQwmEx6rn0gjTEo5tG4kkQq3a?=
 =?us-ascii?Q?HmzQKonIho2GupKKmwEkAxFXpV3tZ1LPTAosfhSTgyTpjWjepYEF39DkDnyG?=
 =?us-ascii?Q?9XHl9yX6KvaEgNuJ+PyX8zZX34Sy3VOQBXEE0gklPSTbofWFYeJfoPP6dQzm?=
 =?us-ascii?Q?LVSIc/CoWN2YRAeqCOEy5b8NT5lqZvmFghPqZD8MYDojqO3HDdtoyyA9qTaa?=
 =?us-ascii?Q?j5M+/1vageoJ+gqcnpeGmu4g/sLC8jmikqFawMNGzVBQPvpnT96YbapZGVWW?=
 =?us-ascii?Q?CaIGRpZsAPganyA3vLPZUAT9sV9Lg+MTO3gbiLg10MJpYbY62InfESabVJRV?=
 =?us-ascii?Q?EVPvFUf7CvsQNH+GpMvwBns7Jid6Mh1bbOSBmsEKOTTL5YM91RRNisAemkTu?=
 =?us-ascii?Q?AvIcVfJZU6/zq9Ihg3RBkaBezU5xXqyr60RDFXmpa1loOBioh0bvQJlDtS3h?=
 =?us-ascii?Q?hJCq/551dWcyUQUDTsIYskMUbFGKdIuYomOCJl07DcuVKwgqS1gAA/FkN7ey?=
 =?us-ascii?Q?REZvIURPxrL3I2dRjtBG+ItE8QHM6hhJyipcDaZ/CElu1ksJq6N7OTf/R6zn?=
 =?us-ascii?Q?K5AN6W6qMfAlfj5tCYHKalYb+v94+5Gs5Ya+WSefS5YStLc6CdoAEBH+RdfS?=
 =?us-ascii?Q?LJhRVqy7X34hMZQEsg642+nNrxSmUdfPo+m8uXz5tVdON0drDc8vGepeCL/w?=
 =?us-ascii?Q?VqVgfLo5HoVB/mPZ6zlE9i9F04U8jqKqDUYdIDGJtTeI+T/aQkkikbQ32qdr?=
 =?us-ascii?Q?Xclhetk9QnqQInM+5d3EVSkgYys/t/D1rHAITMBc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d03909-d1fd-4198-2719-08dc97a86f3b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 19:28:05.8181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZ/FoaA6nXdDlFz03Rqopt0C/aV/M0+Ng/nvtHriefMwrkNqper5p9ghyMt2YLrHNvJwkincMSoe/h0r0wpiEg==
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

Apparently this was only useful when enabling ggtt support
for the very first time and never used again.
It is also not useful now that we have the ggtt_dump available
through debugfs.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 20 --------------------
 drivers/gpu/drm/xe/xe_ggtt.h |  1 -
 2 files changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 883cfc7f98a8..e68e74fc44c0 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -309,26 +309,6 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
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
2.45.1

