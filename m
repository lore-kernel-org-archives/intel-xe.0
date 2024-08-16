Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCAEC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 15:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0935010E7FB;
	Fri, 16 Aug 2024 15:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+nBpgPT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EA910E7EA
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 15:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723820579; x=1755356579;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=oY7GikP4VB+7mGkDQRJzLMSucMowzbrqy3TrcLBI+TM=;
 b=b+nBpgPTaTQbxDWze/8pX8vDVGIelQvUeEVxdv+64yVS+ZJRH6lfCFN+
 T7wh99oeFwVfpnnwa3T7+3I3immyMqS5bqBcK/WCpi3hZP0zSJNkIeMBM
 iEYbfhkOCfYg6wbYunqVZKh4OKPMB6kk+HsGfeQojDFVGX9NX2pqp7ie2
 B7xEabtm/azI1kgbXZtNqsRqH/s2RgbkapR3ppCqwGyqxjW1RI1fELL6f
 maNcJq+plA3p1uVZeZNrI6avBOo0Q/4y8lcxgBG99T7qpUJM42G/5790D
 dPgneEEJuWQegOWZuFJBXuiY3BJQHmeuQlFh1LVrR7B5ZJytL6uq3Ed6B A==;
X-CSE-ConnectionGUID: jeuTLRoyTQWgVmSnXdbqtg==
X-CSE-MsgGUID: PTIe/T6+QjeSCe6hl9NIlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="13054359"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="13054359"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 08:02:58 -0700
X-CSE-ConnectionGUID: 7/7+rzeITyiF7nvzMIC6DA==
X-CSE-MsgGUID: WQY1O8PTR12Er1SYjMNZjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59384058"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 08:02:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:02:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:02:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 08:02:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 08:02:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nK860rxZtRiQFPa2x/vTXLAS8Uhdu67YWIk94RyzdMuqgu2dV0yLArDKVZJ5nXipXJrfkNh2Dj+0py7gWtZncUi4GdGLT2iYn/AiCszv2989OQg27scae8Mq9kLJ0lqINGvF0eNRlaTysumZG70XGasCWzPZGG/lzXfxGjP4S72KB3nCS3O8ggL0cgxKGkcoR+F5OZvna4Dhg8GXIfUV31zUDGHzg1+kIUskwgZ38edHG2THkEcuRtRZQ2fTKsWISLM7qSZhOS2lzchcs3zR6zEYOzOmarNs/vKLkjSCXQwkeOrx390xStAYVYwJdmoOZSI/U0Zy3EknxqBfc1hR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTPH5dK8I3jM9O3uMkkTsyiDpR9IEQb2qCEtodyYhr8=;
 b=bNs/7sq9od6HvhPCTDc3DqaGDsY/tc2Lo9IUwOqaqkFaZ2wn28gHDVX5q7fkqNnEbG/WJw11qbxjJ75KoaJo/nf9v4eG3w8NSwRYlowRuUNRpmqAgG4KKFEynf06whSqpOqjXrCVM1RU4EVtkNUzc6jjKKJVrQIs9Bo2aD8GKprtSlS/Lcj77jiPJJuSRCp10obzc6LdvtP4boThm3JH/vWpc6v/WAo01uNNM/d+oxF1hU/4j35RYV0JTMBSw1At9BJDQ+WVCw8HqKW8Hw+E6aFhOYvBU3aDJSXI49xOLjdapvVbjVMwoKDmdCcacZaPeBE8+9A94uTi76s0k9JRaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6355.namprd11.prod.outlook.com (2603:10b6:510:1fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 15:02:51 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Fri, 16 Aug 2024
 15:02:50 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 01/12] drm/xe: Removed unused xe_ggtt_printk
Date: Fri, 16 Aug 2024 11:02:32 -0400
Message-ID: <20240816150243.87596-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::10) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: 49562898-3a8a-45d2-3b00-08dcbe047f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9tyUv3/x2A8pgsgssop3L+y85K637KjV6jFpycfrC2oV2GUbXuJZ9r4r0LAu?=
 =?us-ascii?Q?BumsJxQmq/knXxoAGeoduYiY3yLUJI6FSMxXGs3e+hGcM4bl/mbhs8K5M443?=
 =?us-ascii?Q?565PF0nwhH2x4M3pAe8PH03iKb6ak5ykCPiwENe2lkyxTCgnJJ0Q7d+SARUw?=
 =?us-ascii?Q?AWxrYIALX3ceoZ0tfleZYe70r2tmcDJvhIaD5E0wq32snOXmDuJApstwoDUl?=
 =?us-ascii?Q?3pz5XG+knw+RRk+kwHClMxjgDeonALH0rIya8KWkhJ6XFz3Zd8R8tgPg0+qV?=
 =?us-ascii?Q?eMTgT13PUCYEeCdSAxQr3vGegf583bikpQ3lmghN0VhRVfJnUUlGlF7r8oiQ?=
 =?us-ascii?Q?bRbiZB0E8kmIykPcFx9f3h/Br/+7+NYkb7w2jx/HH8lfPE8ALb7+j0g38Ksv?=
 =?us-ascii?Q?AE39DmuOTEzod0+dGEGh8QAvVZirLbv5tyH/d4s0FsS/b5k9yrkqwB7xO059?=
 =?us-ascii?Q?23FgGAHJ7exsHgnETxlUfB3G5NZ2Pgm5/JiLE8U7segruzgEvNiAJz5OWCsU?=
 =?us-ascii?Q?pvWzKh4QbEzy1Ht8NU80lsF9nkwrLhKU9S4Z/GDfo4LEU7jgu3DZiWS0mb5d?=
 =?us-ascii?Q?geJLPhpoo6xCS4So+fCzdjs8iFKSZd/+XQVXp5oNICpQudlHFRGv10z2C+aa?=
 =?us-ascii?Q?VHqwnmiWqVbWUcQwbZLV6kCqiK0ndHhW+FLP+BJKKMiM98OBFH5mid1AGzEM?=
 =?us-ascii?Q?+kwPQu5GVFvtSzoAe4goicnhmJDQMatUKpCH870QVoFPQ5DLUs67eeLuNa3L?=
 =?us-ascii?Q?ZzqZJiwT/2ISc9XC4Dyw2PFt7Z5pLjkhAhuVAzveRHAYZLtKDm4SrWlk4Umt?=
 =?us-ascii?Q?UzFxyX34QA8j1LJktAHWZiIxAmWiafVingMqGGIItRl1i9/FNZBZAuDVLI2b?=
 =?us-ascii?Q?OS+CV42uTwHUWnmhW82xDur6dHKv84+OIsw3jqSXi8/LYaqXYLdO/uPgHc6P?=
 =?us-ascii?Q?kQTB8O4txq84Y5R+Z+48MEdD5nBpk+fkoCRGI8B+QyIg1kfyfgNaTQkiHptm?=
 =?us-ascii?Q?F+HPwoT8Fa53lDopSbGuGp4X5CHMoJw671EdbylB4B3RhnXzFQ1cMVM8uwcl?=
 =?us-ascii?Q?niWE+uz1Aer/RkUsJNcGX55NqBjsm62x6RZBCQeHGlmE8QeYj4WZTCEwP0vl?=
 =?us-ascii?Q?QDt0xj+jUUacw2xRKXFoxcUbLaqy4uzS5IK13UekYv1pS+mozUvzc8pey431?=
 =?us-ascii?Q?HCPPsiQ0j5W+nQHfrvIAdhEaua+Zb6nr/N5BtN5g4ZKdDuGfuPZEyzek4ACX?=
 =?us-ascii?Q?AcEpaXbzsJgrgF8qdd2oFNcE7ivqIINwe+ibr2aIGxZST9RfYK3CdbEMmI5k?=
 =?us-ascii?Q?k7isSNI60Xsg9DUjrvz69mq3zgoCIbyyRnAc/XprpJfhbA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D9wHUtMn3od4yr03Tj1fEURjmN91b1/YZ8yGIX49EQXOzUJpG+kdDxC0uiHY?=
 =?us-ascii?Q?RiNlmgqG9JyizurW7ChnOhYOiNcEMQGs0uaMMQ7/sC31XRqHh4Ya6cINtxeB?=
 =?us-ascii?Q?up2HN/eOaPeQRnXg8itHnbAQfWrANJXlPVDtWcMkOpgDCYkm7FURdQQnKn5Y?=
 =?us-ascii?Q?FDYPqM2MVm2S0osOmYDb0UWpghhfo0Vn3Bx5ZBZDNez+6Z0PBhccHp3Y/xm/?=
 =?us-ascii?Q?aoow5/QifGbjCYeOYiTy/F1Laf5yhG3WWl6c74YXV3wJNpZtm1AHHEza52a1?=
 =?us-ascii?Q?sM80MmWgj0luGS9Kzt2X2ElcLpwXhXyka28VYWF3oA5cugZOPVwynwyxDkrK?=
 =?us-ascii?Q?XmspUcGmQsD1yajgNsFsu98ce5Gl9o4T1zwkEYdKFkRshQeQk6E+txvBfMKd?=
 =?us-ascii?Q?u9QjRd+2cFVfm9xmY2DuZXVykB1/Rvrfhcctf40GAqyIm3tAjXmt1ScdgZDQ?=
 =?us-ascii?Q?tLyFfZyynQrD3oGQul4VQSrIQqAaLPdVlms8UBJrQkqhL9MyUOXr6sPKN4/s?=
 =?us-ascii?Q?YFBD6Pg08DEn9v6ODdpsWnh+y8XNaDFQL6p/l5k15OBnl932V7t+ephHW/Gu?=
 =?us-ascii?Q?hX+Mz+YMR5KbLpHFfOX1IIxHi/pY3GnDbbK6YEJ0InQygmwgswjiPrc2UI2u?=
 =?us-ascii?Q?GmdWDL0U4GzFMJ89MzCX29HGLPIgFXNfMTw0rRcwPCmNPKQfAy1TCyqRQ7jg?=
 =?us-ascii?Q?L0roca71OKjHpoN+RxxmAB8fN/oOMV53hmznUP6sMhTEWc2DMzDZ5y/utOio?=
 =?us-ascii?Q?kTzvPt8iItX0KEn+8F9nzgn3A8E0btVhdAFCCfQ7TqXt8fcZq4/yAdVG4ZS2?=
 =?us-ascii?Q?6RazWCo+lNnimarxJFHPfM5hrdwikotCrs+uwhViQ1G0Wne4DTY65asx8i27?=
 =?us-ascii?Q?e8O/Jzdntlh8FZngAh4m8gVm1j7xY1s5i/dMan1xZzpa1r1cc6jCE1iN8Sgx?=
 =?us-ascii?Q?9Q9QIstj3DIDNLAwFa2VvhTF7dtO4OkoMDpolQfsed7Gxlh3rCoofKEww7bs?=
 =?us-ascii?Q?o2R790LZiTr9LnzUjHYLpu03mCcF3HLVdqE8js5S9i94mcBQNbIBlKzx9YFu?=
 =?us-ascii?Q?unaTuXeLvWEHE5nuSZTNnJXQmCrkoaE9VRBoTRW/GF68yR4njiByAhLRWTjH?=
 =?us-ascii?Q?MQdttnH39hPWCqVY5KuetB5LoLUw39c2akyImnmkR6fIDtqGSgZTbdTXhRg5?=
 =?us-ascii?Q?V0TAAn2xVGRr6AeQLEluQvoxTFQea+Ipj+TDhVZFc9+1nF/af/BlQas5C2h/?=
 =?us-ascii?Q?wvQLZQq0uSDx7/+Wka593sYUE0zGXYKx0NOhj6l0PKYnekU8rhUT0c2kYt2e?=
 =?us-ascii?Q?7UsNwSaJq2nKffksaRQOap3/hKVFa92rV52Vk5zPzrm2k94zeti/OZ/+H2Lp?=
 =?us-ascii?Q?vIlDKadr2O+qxH+65sp1gFveGMOe3N92ZET1uMy2KxWxceXnofKMyBNeKj4g?=
 =?us-ascii?Q?xPIdfI+9mvF9zMZmVcGX8SMjhvFnXppfzgDWM/T1EQ9cHc3IVYGsxBgpnnvD?=
 =?us-ascii?Q?Yq8QDNu3dNWCNdn8/NwBCXLKUJFKXwoGOawUysliDTNpQ3sp9Uq7HNJXy7A7?=
 =?us-ascii?Q?fuj7k539f14QN7n4CSn//3L9vQe3xMGHNB7vBusY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49562898-3a8a-45d2-3b00-08dcbe047f68
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 15:02:50.8243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wd2D2C4xVRRWEkif+iFU9Rbm6Nrqn6E0KnL01plKmGIf4yibJL8E3eJGF7xTsltsbDMNE+I7kn0Pz5FtDbfExg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6355
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
2.46.0

