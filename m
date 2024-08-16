Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C0CC5320D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 15:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F217A10E7E6;
	Fri, 16 Aug 2024 15:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKmCLasf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1671F10E7E5
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723820592; x=1755356592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=I0k8XJC6xssSUQJ2pLMQxB+z46DGpNqs2OPZeRqoDQM=;
 b=bKmCLasf3SKHLz9vJod5f0q6NPKdgWm3P9uUU4DEDfUrQw8cbGxM9KJU
 Yhp/x/GcmsJDD/QZ7oPo3azGD0IEjaJ//oQD9YjO0P2KRaMesbDlopEsS
 LWJ1SYxd+U2DkxE/eXET0gQyv9Z+qEJAo2xdy90Ny4ZStHXlnyG4f2qob
 ssbBYTRwy6ch1U/GaDTFIu858whNOW/lgwpctzH9Ka+nY2Pi8HUuTJBPn
 OUszx8bvkFdk8qR4rkQjXEV0Vf68HkyROwuSBqXg43MYurLwiAIowPbTo
 ndOy7QJ4kxqfUcTOYBo9rtp1nWsaF4KJx1WUPslZrzCHv2PbwQLYaYFjH Q==;
X-CSE-ConnectionGUID: s5nBaBWcS/ShOsD+T1jQHA==
X-CSE-MsgGUID: SnFgbsTyQ5WQGdbkOcYwRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33528385"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="33528385"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 08:03:11 -0700
X-CSE-ConnectionGUID: qicNJufsTcCQ5aKMPBrEjg==
X-CSE-MsgGUID: SfTqNVvsQ22P+Gb7OUSaVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="97210457"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 08:03:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 08:03:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMYY92LlLeGZKXu80051J7dUQM05WYtflE44FH2SXrnhDrAD0EDE3xoWa1YkqydDqEmB8oMrUvCfZdExV9v4BzPctZ/Jo08yFlZRm3Hv8pHlEmfgEQZSiStIFNM7uRjRKqlwQ/cziQOnqvMswQ7aAFyYFJLmq6ED/FA2iMYx3YlvCf3ofgameeKvT5Vhr/NhXLMtcrURijtBnV+vEr5DGyykUu7UlQcXP2s0dTTaFLVqGi/ZSwTZAiBOPmnxGVPshFQuGtUbclQUzCPkAm5oxjTNshZAF0zCz5uNR2GtH5STNDeExwKIigLG/TtBa2U01L8rCbkuc/1qB86J+7ppQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gpu52xo7uZLNR4XVR56Ntg7G3RAYeL/ewVb3peA6Pj0=;
 b=vEzUv2BCm0lVhETuiNBoQGKSRMZcXkGykeOsEGT+I+ed72ZTlIuiL2CqTtcMGVgW+bsM4hwhBf3fSsTEjBHZieMkHnlO2jwFMPoaGU4WcGLoTiMbqgCoQd9IoBWwSg0ZowbjF0RqiGPtb+/W8QQfXqaHvV3aXHsMN1LA22cZ90QZpgHr4euB9mZDlKwBtVtuPsByWrLoN23a6NwxDMCPdlG0Pa+o8N39mouK0qulcBaDfxdGwf5mJmuhTQg0Cudf84Jd9lk3keBgwyYr9wawTcJEuUt+atpld3WHA3wy/3qhQJuGLOEoeSQdI0dLikzax5g5mfwaHkW/thSp7cV+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Fri, 16 Aug
 2024 15:03:05 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Fri, 16 Aug 2024
 15:03:04 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 07/12] drm/xe: Limit drm_mm_node_allocated access to
 xe_ggtt_node
Date: Fri, 16 Aug 2024 11:02:38 -0400
Message-ID: <20240816150243.87596-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816150243.87596-1-rodrigo.vivi@intel.com>
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::10) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV3PR11MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: fa044b9c-6816-4209-aa3c-08dcbe048754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2r3pexfwrD4GiUgriQlGH4BXETFCw7GnlO5pwcuCxBYZcZ2k7YqkucDjS4HU?=
 =?us-ascii?Q?O81WO4Tp2Rl39//I9uXmJ75OC0bKI0+zre41lkfkvdSmINjf7k3F5M/lu+Bt?=
 =?us-ascii?Q?csaWH8JR2RNjZEVe/He9X+euT5hN22PbBhW7DTDZtJAGYLWnv6FFC8JurxCj?=
 =?us-ascii?Q?IsLR03GeELnohaHPn4BllVP7fznPltIGo1lqvhBSYT75PCse/02zNoOf8lhu?=
 =?us-ascii?Q?FKjpjg6rx83AWQ0ZQYQTxeszdFaBcbHOYrs/eS61m025OMk6ejtOGg3fP+MT?=
 =?us-ascii?Q?C/HnuLz8kiJmQuFwkBJFty+eZUYd/n8z6NcHblJuL4Pi4YA/b7RF0upBJ/pB?=
 =?us-ascii?Q?ckkDMUw9AJjKRZ52jruV/itjspdiMRSvjO/tKbsSIqZl5xYyxwmq/Wi6o5gY?=
 =?us-ascii?Q?nECxbfG+v4rfjFlK+FRDWfPhXHl9Lx8BtgSzHqCJCDrz85b+MetBgcLicHq2?=
 =?us-ascii?Q?8Q1jHlhYaXjwFxX69v3QwS2PHnSlo1vtHri2MKNQ/H/sSqTBUa0wFIJ6jtGt?=
 =?us-ascii?Q?6QhDPyEdN+gmX3g3LVmIWtoqlMNfeYG1ghvz99vgblwOj+Bip4n+8yOs0v4u?=
 =?us-ascii?Q?hh6zDEwGijln/Gpu//RCorxXypCaBUCrT0zz89097xdaGQPgKsXt1jhQGY2n?=
 =?us-ascii?Q?sEcZeqOAA3Fs01xqaBZe1IzK6bItrkCdTGpszbB2Zru1lbBK2mTZkxHELjXh?=
 =?us-ascii?Q?vDIYPCa+LJ8+JeLp2vmQDQr924xjZiVpfgA0JOpMRXnVr4GptNho2Z/UwrhQ?=
 =?us-ascii?Q?LNPJnfM6bxZl0ZHwuIqLFemeA7lNUse/TmPxL3jA/ePIROBpjzSEfimMlJw2?=
 =?us-ascii?Q?y3S+Df9OVJxRab54K0d143eBglY3zkneOneAk5KMV19xsiMxpQmH73CV9uuS?=
 =?us-ascii?Q?sR1lkpoPIVOUpPb3Wgg97k2UkRHEMJFRpx3h6tb+Lo4JE/y+8F5NZvbYpZPd?=
 =?us-ascii?Q?ppRWm3B07+8W2J/ukqYLQzkORxb4pK0taHTDdT4AkS76/f0Rc532zNYRcgb1?=
 =?us-ascii?Q?QFM2LfaUfcmw2tQ4XvUZKZ/+N8I8elYcYrD5sxSxvaT4uUOVEd1UoV4M78zE?=
 =?us-ascii?Q?CRL8siBuPWkANNGXI+kjhmUARFbpYcJ/Kt/o/sgNBzL+je04NKo7RYLRx8uw?=
 =?us-ascii?Q?Xdkpq0r/xV6D68HPhjRVngdTn/UkLUb8EmJs6xigwGqTDZUCVVRoNznKRXQb?=
 =?us-ascii?Q?aMvXMcLdAF4zAP48+aWjIdrmENxN2/Po4QLGphiiTbYtPK5Cyn+PVKVqJEqa?=
 =?us-ascii?Q?Fu/8mgY9DrqZfPHpi+tnqrpWbZDO2nQzwZ/hgMIu/stb3yQOM5qv91S7JyCU?=
 =?us-ascii?Q?jP+n/JAFthhl/QzcZ1sr87Gqi8s8wrcvWsWQX0IcHyBB5A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dzL64wsgrYaUIZerdp7ee6WMXNxE1Hjna6HnzTDd/UTJvcQFHsaCL/hOWs44?=
 =?us-ascii?Q?ke4/hdd3XWohOVdRHsBQtiKBf6ippR2WFSbzaw+vaMKnsSL7t6cKAmJWTRwB?=
 =?us-ascii?Q?lkaMyxnoJHAHZACdgjTP2UIfzAje0Mu6B6hM5Ttw1MmbM8BsjdUjgOHo+Ldw?=
 =?us-ascii?Q?rTccLYh2CrDLUVwJNYd90IkhThZHKPYFPVaLWgeRawbVa1bZXcVRIgeRtw9Q?=
 =?us-ascii?Q?PXNl5lJ9Y+l3hgtMQMcF/yLZ9U8BdFuwB2TiN3Zy6cXTs1VlNZLbTXcosG6P?=
 =?us-ascii?Q?f4agE4YF97TDu1Ns2ER2Gzu01rDqpfZzIw4FzjEHhsN2/BWGZz1NCVbMZHVF?=
 =?us-ascii?Q?lkfC2ypF3wn5c06iBBal1biw245oFNI+aIboAdgOWJiPeVtjrOD6LVcA8h0c?=
 =?us-ascii?Q?VaapPH+2K7WHgHW5B5idjChIS5E7sJirq/eiwia1fvcOTqPWt8cLMcUXxKnS?=
 =?us-ascii?Q?f1MllsjHfeT/xzF8nHlO3kHvvMRp7rq95sPW7QeOvCmPgVT61lveHZfqV1My?=
 =?us-ascii?Q?lF1oFmrcjHQJsh4FTu5hP0wZYYCXIwKR+vAt/BX977ySbD/9hFhvS0UagiIm?=
 =?us-ascii?Q?dZc/1sciu8ffpLZRZswKIpv/CuSF00uYAY52Jqki/C1fjtQVocXQnVNk9BXp?=
 =?us-ascii?Q?h6LbHTD8kczvu2eMMjHUT8bLhybhLBK/8pDEjqCXB4j8tdMuc8B5Sy6zXEIA?=
 =?us-ascii?Q?XyyjWFlFfU1rB8wNdsmSgxEE7hFJSF9ynvkYm3l117W6R8JcRYhCjRoa6hFb?=
 =?us-ascii?Q?RQHilOjKC5K2kciCOh+zRTbVqyrcKrlCG3aKob1FgytxHlKK1ZxJS9JRw38w?=
 =?us-ascii?Q?YsjV6pNNyFqAUJrCSpvI3JwMuV232dxpHZoUCJrA9c+y+Ga/N6sHc8RSVIXn?=
 =?us-ascii?Q?XaovmJTfYsqqp2gdrncZWTqiuAPaUihHtw9Lbr36WEreKkGMTGi5bV1K70lv?=
 =?us-ascii?Q?cZdndbrylZ1klnkw8DrszZ+Pr3f7fPnLouQCzjC4qCWhDvyuIQ8LJdGuG5ME?=
 =?us-ascii?Q?1QfWDpdF5gCacte4a5qttr+xYo2/aDvTwR+5nub2RSJRXUqfQI3GZ+TINfkA?=
 =?us-ascii?Q?gn0C83pg2vcHiBAIU74x+FKx0qQBazeJ+OfCGSCxdClF8xtfQ8j3Sy1Iw6FN?=
 =?us-ascii?Q?gGX+WJzQrCCS7UltS15ZS5uH4Z5yFcSniP1W5tFxmdax/OHIiEzRdQ0mU653?=
 =?us-ascii?Q?V1PHSA5+zv06ZFUB2Lpq53UM981GikiiDZGMemNrPW/zB75DiQ5SYtP1GSoE?=
 =?us-ascii?Q?TjqUTRiNFEYmsV3XlMs199jPWAu+3eZKLHZLw5jXDqOHJJXv4q+qlzh8iY6E?=
 =?us-ascii?Q?jqhuvIzrm3JKCOqltkrm0Hi48QkRzRQRGYJkxytdwycs4JS3bzBxbuvnFxk/?=
 =?us-ascii?Q?Xl76Pv9Ty+C2fcBRSCkhShoCPXgLPlK8NJsVvBCJf79tkqnvSt+7RzLvpHys?=
 =?us-ascii?Q?gkJh8FjQrDs1CVxWKPmWWc2aNYW4hQd54WvVJfiRag4BDgj1P9vl/9yq0BrC?=
 =?us-ascii?Q?8r4xZQnufXdz+L71WfMF8tI1Oyb7revgwz7PZn77yyGR8oJ8DEqDVEIikZf/?=
 =?us-ascii?Q?AyB4qWnQkg1GwVbpmsO1DAWjUtmuwYPRKI5apd3r?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa044b9c-6816-4209-aa3c-08dcbe048754
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 15:03:04.1447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BiVEbIAookGKUyjG3BAHUU3B3Cp/JsjRaFnTp7c4dfLwE1mze0S2oxXoU3dkNsA8S+aZd/GUnM+kw66yWaUBMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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

