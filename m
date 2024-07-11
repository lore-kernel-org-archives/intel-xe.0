Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4875C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 17:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52ED10EB07;
	Thu, 11 Jul 2024 17:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VIawdPuh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD86F10EB1D
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 17:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720717941; x=1752253941;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Pp1/TWC/Q1vBD/OhiAH9Q7L2frUgY2HjHje2vZ09/NA=;
 b=VIawdPuhXHUk2zcL4WnUc043xRD2f+RmysUXX6+WK4iXBTVTbt4rqV2C
 4L1L4ntZzfhifyvfUPoo7almtdbMqPmg5J/X8zFbCz94/KIS0KzzUUvXZ
 pSRLtD6F/58B+PnffUD51YVmVk3HvxumAbG423ycQLqZRNupqcyBsv+hg
 DaILRwUpHycaYNiSa6z9TXv2S87L87HpQvjYBVD/7WFA9gxufitEMKjH6
 hCOWjWeQqJCKqh9G3xuAi0SXI1jI0D2jIR4YuqPH9DgOqB155o+8Wh14X
 H8HQdpNP8MaTBaY6qwXhG4rX38nhQNgEZqM8csLrwPLLNXlhAqP5kfxT1 Q==;
X-CSE-ConnectionGUID: /O52U6LvSfCsLCQ/9BroVA==
X-CSE-MsgGUID: RfSNsFApRrSlDjCxTA3ucA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29518679"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="29518679"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:12:13 -0700
X-CSE-ConnectionGUID: F8XDLTa5QguoLo1AdyvPWA==
X-CSE-MsgGUID: /k/fts4tQVyYNR2NhY0tLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="53820967"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 10:12:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 10:12:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szI/B5wJ49aXMS7dCXcx+fELlFZ//ZDk4EXiMBHgtVSbuJQHudsPuoj4ZF0FrDjhqEG/twoQ4/Db/TqOd7gQ28aWuUvO/yItPsPRGtAtpRp2uMirIduJtHADy+bb7UC89GokF2252KCs/mxwHlj2z4QyC64DRw08KaRkXCaCFHw0rJEHCmv/Ez2LYL6WEOsG/87a+j8aWSTHytUk+QXXk9qans/MeldPh0PoriiTLXfqzWooC1xpvBfMcb4v7qw9a70FGZ9JUOc/KKJqsyRG95NtOywo150bsdlAAfwXgHWwWmRgu7OB/k1qvGX+ixcEEOJZz0H3SEDyMHBrR/r3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2ogaV6ROAeFVa9cL0QdM1L73qVRNkPDcLKM6DeZLWg=;
 b=yttGtt9ntzKixawJBde2PNf9hKRVoiZSxB0tujclsYTZOK/9AW2SEeFqO6e4qdRMqn5gJmQUDFxBcyGQ7DvtOVIO2uadcjjrh0asLet4jRrL5nBxfq3H7x+xqVSilbOKJIQSvt1NvmbZDBJvB8rX6gVf4bbZZBxWlX+uDp16bzQng/YIDdqMgBca4X9SX8dMRDXYa4qDF49sAkVcUl0Z2bByMwewb5hQzjuQj06eGT6o6OpkAtM8gSqfm9vQAsUUMGqxI757I63BcdmQB0ONHUFRbGKiTwtaa0+5KIrKrCrbwVD0sFBYCiybciBdHV6UofWeIgSaCK+AwF2T68FKCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 CY8PR11MB7107.namprd11.prod.outlook.com (2603:10b6:930:51::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.33; Thu, 11 Jul 2024 17:12:04 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 17:12:04 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 01/12] drm/xe: Removed unused xe_ggtt_printk
Date: Thu, 11 Jul 2024 13:11:44 -0400
Message-ID: <20240711171155.173717-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|CY8PR11MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: fc80ff86-14d0-407b-3f6b-08dca1cc95fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZLSTcSFGPbxvf6+ezIU58dOfElm7nKyKAesnSHPmo1yBsd9SH4Ujc97UXtNz?=
 =?us-ascii?Q?tHLSKqqj09yKdzAZK+juJQA6ZyyzAdFb7vDGb7abi45hwciSJzFAVTpDamsV?=
 =?us-ascii?Q?dOxM+KMiWPYiJEHMr629JoVE5wg8MTvYg+1eaYzXAOWJ0TXN6LLhf11LbTt8?=
 =?us-ascii?Q?NsbFOI+nrI2JE9La9b9X8kXOJ5cSj+5YoZ+y69fG7Dh8F0Z1GtRQUaFDp9Ck?=
 =?us-ascii?Q?78/djiDOyVv+6/CaqcGgwZcngcQbtanbnq3StLB4fXU1nRCNPYx0w1tj912q?=
 =?us-ascii?Q?VwBtNR6q2ig6PNcQtuitGfl40qezpILeWKhhAeVeGw7yJoi0+ugHkPcLMGjP?=
 =?us-ascii?Q?vy9ACPMXgOKbQMTsMBq6RNARo1J6S16uDxnF++Bu6qFdpKT2ts6Dmw2fVgIq?=
 =?us-ascii?Q?6JXUzlxNtZBziw9bYpzSQ2qGCscrSTAKclTmvyFYwV+nAOP6Kyy38fU/jS8I?=
 =?us-ascii?Q?CN/Up1JrBiBJ7+LjIT2kwEpnTWwgAsheNg4DHRmWARlQU8z3qto13tZv97PF?=
 =?us-ascii?Q?ManAcMJSDBlD9MGLs1vv5p2Ypdy+kv7m0C1R+Y3Xltpi4Gz921IoYDYZaRdJ?=
 =?us-ascii?Q?J/I2ttGNKdPmjWWS6g6H8JDIwdrK3DTKFeKgIzHVNIZsm34eIhdCcBR/ou/w?=
 =?us-ascii?Q?KuP91qs7xlVlA28aLFKlZxhtDq3xlPFieWbQS4mPg0+4Zz5FOjTlx3D1a93w?=
 =?us-ascii?Q?fRbg6eWHtLnmT03rnufv2RDK1lB1SUHlajCwN96JHPgcl++sTqrLYEFdOI6/?=
 =?us-ascii?Q?kcNgqoJxMKlaXTHmloZUYwB0DcDx/bXzPD0js/HYSrp622Jc2PkrynWanQ4f?=
 =?us-ascii?Q?+qg21mn0MrXAPgbHz7Zf+6o+W6Sj4nuF0LZuyVvlpm5P1nXgpQl0e+QjJDER?=
 =?us-ascii?Q?ULo11mMD7DQDIzC4NmzsSFX5FchisZReHgaMrl4tDiHRAygDYDHWX9ZgW/1y?=
 =?us-ascii?Q?yrWfM3gzV3yFIKgQrCwXWbu3Leo84ycFhqmylW50Bxf1h62qbkYOAiOqzTdp?=
 =?us-ascii?Q?wJfXuK5HF79SjKB5B3i/kAdCWmfHzG8dfunPg/JWi/+qGDimy1gAtqn5cd8k?=
 =?us-ascii?Q?w6RWOkcXbhrN9qXamlypjMkp1jKrQcMVYSE5MAlLEkPQKOQSfV035Oi+fBtk?=
 =?us-ascii?Q?0nuCPvjxdC8eyTgFrNvaYx1oPlL87RvmBkft8CqAvjLftUmblsjaBP73O8UG?=
 =?us-ascii?Q?JE8O5Wj91/emdNnWKoMKQfgDl0nsTYcF4YdyPOGSxpgtal8UPO9EO760++HG?=
 =?us-ascii?Q?xo9yTTwJv+uqQMM8bfhWlyrJlUia7AfRX0VVgMOCRitGk0+nvabYv5DAUiM1?=
 =?us-ascii?Q?JU83HKLZMQ0yufzjPbYyGkgUQvjUU9AZ1dhAX/c/SFUGHA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5DMiE04BHd3mU+biMUiBixOjDyEm4qeBZG00HEHovaE/9TyB3nQXntLNcaPp?=
 =?us-ascii?Q?RXabvLTjycgkpJ9taOCHeINWAzvIbZ77+sXoH9Gr3mrXch1GolQytEba6S3t?=
 =?us-ascii?Q?/pDTGLdSnppC3/T7K44ZRIbFbbai8LmAYeNuCG2SaRn5zN6PM+oYQGHNsnut?=
 =?us-ascii?Q?s9GBYrPgN/FUlqwkynmt9oxR9GwOyek9WJM7qhXYxhJoDErKMAmJxSs1bBZh?=
 =?us-ascii?Q?aY7zm9bJQ+9tsioX6SvpNQc0kHBGSFnYSL43wGge9XLnCk6sICr/3MOpLW8x?=
 =?us-ascii?Q?L6ut+rMW34ShoOeOhEi5xkasHLTOhTods4bQQOhiH2SodwpojDjOmSxGjWip?=
 =?us-ascii?Q?X6Ft4MzzhNDgtI8gtLV9Iw4oAQybAuuxYh2tQv9kJbkkWwctQwb3nhCUBAdW?=
 =?us-ascii?Q?6Dt+8z6l1/8H2IU/USuM7HiSZF6tTGGZEl5vED7bnFOJ3Kf2hQQp1QY9ThoR?=
 =?us-ascii?Q?cvIOWQnwySZY2slPnQZfh5HJ6k1AJasZfVsmnJl2m5+SjRamQWicPQWYEcpd?=
 =?us-ascii?Q?G7hdpINaVkvWoxLR5anhF5YgvXIpeqk15fbnc0IuqHErEHZr1pa5iCegaVgo?=
 =?us-ascii?Q?7sTAQF3xdM8+I/zzkZgsDsqZqoAlZvWUXh4Aky9oAGDFdeWQW8zH2f19jBgH?=
 =?us-ascii?Q?7wMj+wsr5P/XqnZJuyke/nCrBHzMX9e5WRJ0uWM7omA+uwvBz8hYrCAAsaHd?=
 =?us-ascii?Q?F5CWnQSdgQbdgs1SqMby7v6eURvd9mTdIupHSxaQSqrRI94AZAmUseZd3THT?=
 =?us-ascii?Q?mkslfAfvWUWh/GP0KPYnYKBo+xBQiKnPSrtxtcledv8CTuwRok5RgFY8GObJ?=
 =?us-ascii?Q?VBLEluq6Lpm3aErG6fpohjWplExQtxNu/dL6+SzokqIZVWVldy0gXWx/TKBj?=
 =?us-ascii?Q?iP2v2Tk6RE9J6bKUCBXc5ackPq655tS4NKUThySQSmoR1Wr+XKPqEUkud4Uh?=
 =?us-ascii?Q?u1l7G3ErNTWLud0kYeQoXYQ6A2T1KOg+UHymfUryB60/XdLcGfb0sD0BLQZb?=
 =?us-ascii?Q?j8NZfwC1XvCoudSNMVb6qzIgbUu1Fn+usffPs2uQ/Hpc/sblxugQQAc5QhM7?=
 =?us-ascii?Q?XVcFc4kkXuCMX7Oe+DihGv50hhs+R+0uzuC5tqMcKkUXQ40KDqmnhxGQSMg4?=
 =?us-ascii?Q?Z1diGgfIYz2wP7h+SAWSzxsPiev2viywj7NbV7HFSzRjKWEz9Lj34BSQ32ba?=
 =?us-ascii?Q?5h1IPa6xMehFmYHk/6UbLSkt5rq8jn+22mKHo2rVyA2SDsbB7aIRivqvs7WF?=
 =?us-ascii?Q?At2UtTk46r5J+6B0gdkFLxqMRnJ1n1fomL3C+dQ2At+wcoc2c11sb4smig3V?=
 =?us-ascii?Q?3NA9i2GHU6c829M+HlnS2hxQASPQpPI+s07GSpFuytKDgvoH5r1ojLFbmyxz?=
 =?us-ascii?Q?nAOeMKanjNHutemtHbn9lD4wEimBgSFvo8Z3dqdgmR/DFfpPDlCBbREWuj78?=
 =?us-ascii?Q?bOHT/QWEeTRA9sVj6Av2WlP4p449uaOtoD24ahC39u3Dc4BXlA1mydFZebLn?=
 =?us-ascii?Q?kj3Cx0UWgT27gm3ymySD9mpDIroNgHNF3g4nkDOpmx2x6Przie3XJ/Q2lU9b?=
 =?us-ascii?Q?qRytzKxH5nP5TXsxdsdQExBIXePsXE/b3IbFNV9f5IdLDhbqjq1Hz4ZIryLc?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc80ff86-14d0-407b-3f6b-08dca1cc95fd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 17:12:04.3942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5T/+91Lk20ktXTko+3L0xbOKagZa8vNtx2Sq4Xvqh40Urkc3CPavoiCsREk4ZyPU5+vQQyfKdIEFa3NzpmWjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7107
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
2.45.2

