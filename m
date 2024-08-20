Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9204C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 20:26:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB8610E2F7;
	Tue, 20 Aug 2024 20:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IS6z42Mo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E3210E2DE
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 20:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724185575; x=1755721575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=040j/YrP3A676ui0cKzCLVpHepUU3kYPFVSLx1AboJI=;
 b=IS6z42Mow/6e2BYxJ/0Yv8yG78xPnm+n4inA1VuSZKqTs9vpuymtKqcD
 Ahu9OkSEg+SKdiHV1KC/EZbsNsgVvCurMibqgEmRwSZohDRsyLi+tsNl8
 7jZnNzJZ59Bu6uRh8lDwT/yMk5bmjcXxcEXCBC78KHu9qIHaLwLRUZChJ
 nSljcF1bl/eE/3epcKUqLoOTYHay0QPR8ACczLHRfYL+yWtgXpNUhsiLh
 gaBOJ1Bf1WqJCyBisMrSU39cNKrivUfJOhK+P5xio6p1I1NwXNMVoDUc9
 TD1x8YX7Qmkm5q3JXPnnu8gP4ffrOVdXSycgQ4ZruhTpl7pIWRzsWQFrc Q==;
X-CSE-ConnectionGUID: bZ2Lz192SZaVyVy57Y93fQ==
X-CSE-MsgGUID: QkXc6f/EQe2R3Q42n4EB1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22646516"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22646516"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:26:15 -0700
X-CSE-ConnectionGUID: nvoINzcjQCqK6MicbENVCA==
X-CSE-MsgGUID: dT2v5KEgR1S7Fw4IfzM1iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="61004377"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 13:26:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 13:26:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WifKGO1bd29xmUoqzfTAWQabVjWKQeYZzIv1CEmE1+ITYW/96hHQNFlFzgSQuQhon5yIRFyung4mVG0qnDLz3ce8GwQlABqubpgHGYnmJQGi0nPpWHreZXgtLPmO+60k9FjwgBllUmfTTe7SOLakey6lDgUBCj4fVrQtefDJXF91oQXiqNsjAzjdjyU2I0lVm3VXxTboAd77mnEhfcdWeRqecvzTSLCrrg7JaHCj2O6jFYogVHkCYzhFOEPfNrqNpvAGMjZcRXRpClZzpi7cXKCFRNRcET2iYCwP48ve+GgZf9v8FhZRFMonhmFc+F8vQqEjNeUAXXXvCuaYOYMlAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiY8MN8TKNHhQe2ZfMFjIlFBXWPTUYZFDvvha+c6E1U=;
 b=JY+dr8UwQtEOS+bC91NZTSBxwFvx5eQ3Jwl6PiAwM1TjhW0R14jk0AdWwlHIZyx2yXsOL/a/Zz9CkTLSDvCdCPTDTYUQBJv+gylYCim983T12GJ2ACrhuuU8mClDADZDwghMl5HiEO7Vwo3H/1shQNEFgxHWtrBujlrDF3NSB8qSBTIdDvI78E9qCC8KwOGI8uxk2ssYoFLXVc0YWUlgTZx44mnP5dFvc0JMUfrEhthBB+IPr5FZFkiL2c+mt1l5J9Nk+I7dIT2D0aFkcClVj0q5kWiPn25OnsJJOJ/bbZUqb9YSVnX+gVpvvx4UPlpHuAG1xW+YXZwm3dCaXLS4CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 20:26:10 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 20:26:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: [PATCH 09/12] drm/xe: Introduce xe_ggtt_print_holes
Date: Tue, 20 Aug 2024 16:25:44 -0400
Message-ID: <20240820202547.300257-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820202547.300257-1-rodrigo.vivi@intel.com>
References: <20240820202547.300257-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0102.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::43) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: d632a9bd-e36e-4ca0-033b-08dcc1565338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RwkaD4aToghjYR6I2KrIfuo/Ibo7zWQgmL7A9J5AU0oD10MMWQmN5yCLwPEW?=
 =?us-ascii?Q?4IojF/9wqAlyYJi3EgGDf53lOOsql7iGQwJW632m/XqeizvhwCFlICHJBCnu?=
 =?us-ascii?Q?nahzgOB2OGgco3I06n5Gzw2JpB2xARDB5MXFZsRp0yczRmqHUGXDjM9qXvOP?=
 =?us-ascii?Q?Z39ipmXoqBVNdDZfbDtdUXj81kBRjfzkGISCySYcMPpG1JfxD+bgrNaAJSz0?=
 =?us-ascii?Q?8jVtX+PRJe2UO6tGLFj+zh5rObETtOIZiStFlwU8BaF0aVADHgC9DBdBPfPc?=
 =?us-ascii?Q?BiggRh/H39pLiL6xEro+xFF3XbKHjPPNaRb+69TgLo+mOXFBCFhyFtqN0B/d?=
 =?us-ascii?Q?w4yy0iF52bhp0nqXb/nVHmo78j+u7uElobobg9USabf0khSwvYaGbi1GheAz?=
 =?us-ascii?Q?3FPraHcSTDb4nAUZEaZ6yMrNA1Ci3Azd/6UFirMzjxxfacpd3zJ/YqvhG1R8?=
 =?us-ascii?Q?GHTpf7aQigStttdAXJm4TtCzp/dj0z7al1oMPo53SqEmXU4aEy95jcdKRnwX?=
 =?us-ascii?Q?+QqAJ2MWugzQvY8eSAQ/7WK0NQyqTqtU/aGlqp1Ff7ajeM/OZQIhEBkwVuv/?=
 =?us-ascii?Q?/di26ZHcAVfLO/WuM93z0sDf/WbfTD9R0pIiCiY8DxKAusu/M2vQKHmzmLDZ?=
 =?us-ascii?Q?PuRsxG6GXz2ahphk725YsEupNd+DgfcVAYZ6rUfJHfYJhu14VCXDHV1X0UVB?=
 =?us-ascii?Q?/pkfz85IVsANA4Im1GJrK5n6wX8iw971W6MDVxFtiZmBRHG9V0+ZGflmPhUF?=
 =?us-ascii?Q?y+xBTPe18ESJXBShkROAD+wulk/kh3jsL7vxQgQZ6QWIxAkfa9ZsRS18Zr8R?=
 =?us-ascii?Q?nLH/abKhShIkVue7dfFEazfPe29EVtvfI2pBfaD8aH+Q1YOeIm02HPRpeNt4?=
 =?us-ascii?Q?TQWJKPI0F2PTfevX5LppNZB2FWdH8a/qu3J7wngZIyErM+wvhS9FpoSpAzpB?=
 =?us-ascii?Q?GEuxWKfXN1qhfRDpRknq0tcbiq2stIvMVHLP5Y2sj8Vscd7VLKDk6W2EGQRl?=
 =?us-ascii?Q?/s0WxGOdv1QSmLqUfmzTxxvZbEWJOVuSpZXW5ImoisCCJJXBmImSzZJxDlHW?=
 =?us-ascii?Q?QUwLHM9mIasiwVZ2RnZ+TpQ3w+8cxzW/Bf0ypbdhgStvpkcynParUDkSgcwW?=
 =?us-ascii?Q?K45ceVTUtDtmQuAlN/bd2U1RusmGqhO3YquYB0mD0FNBQ+Nwl/w2c3IfzX8N?=
 =?us-ascii?Q?It/kSvvOflr2QUZBYx0R0iidOcrwLA8AMybKbeVGUXmcm/slQ2OqDuX833ZS?=
 =?us-ascii?Q?tHDQQQbQFPsuT/pW40fYyN5QVpPufNsHMpDN74EjqCToKShvMgKTnFWKfnjo?=
 =?us-ascii?Q?r5lcQIoxiYthrdcn/lBiZ4U4Z6uQQ+HdZkBl6wCKbTgE1Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AbbvGl0hlj8TaEBRbp3CLmkPDZaMrecrR5YK9jp75nLapRRPZU6Bjsnjc+SB?=
 =?us-ascii?Q?EMyDNEtpzmaA5wCmCc11N+MNEj2SkwTtW5SGP83f9q+DS5Ly3TQl903xplvi?=
 =?us-ascii?Q?I4rA5NltFXasgd9rjouvkvCOaYBgT9W/f4j/1YFP/bfO1dMFQxZZ8mkbpkGF?=
 =?us-ascii?Q?MyUbGzdI0/jl2rfnDS3qSDZGiWsf/b8nOrFGabKbSQFmqur+wCSknZHZoXIB?=
 =?us-ascii?Q?3N/AKwSbOi76nhR1/AgxGiYXAVIWmRrYZUnHykjTNTTVkqJw+WokmwV9msHa?=
 =?us-ascii?Q?6FKEqHUHyJWqv7J5bHBgMS0mGmSSD5rK+AEwzzWeIpJ414OXY/6qo+eAnVVJ?=
 =?us-ascii?Q?iYRpOk/HW0Ae23gCfLWdXuADD9fk5AO83xk2TlM6MLQbijeeBh7p5a6sZBta?=
 =?us-ascii?Q?meKUe21p5APg0CU99LHL1d/nZhkp6tU0UhMUsjpx7X7421tpdJo2lr7+22Ml?=
 =?us-ascii?Q?H7RM4vyhYsAWv4mBoR8FwQ8LK5TxwwWsY3gnJG4Izc5US79hAauwK764XtSP?=
 =?us-ascii?Q?TC0QVdhi2uRwGiunOhehLiVfNuulMfDdn0jIhATop04KgaIBLa8P++OZ4xQt?=
 =?us-ascii?Q?wLL4JzC06eShZskYFZc2UQTHM6sPhtaMrsl10oBh2HpmNlFcnYPJNqDxGNx0?=
 =?us-ascii?Q?V/u+xp6rPWgGUCexjqau5Li/8K7nrxCiI7ov38KJXG7ZdsVFZndHNB+Sk+4x?=
 =?us-ascii?Q?8TEaHUXXUz48LODx2fXGZvX1qtEKoOCNtUsZ+LH+fTTpMhOBTrcVrXGHyyZg?=
 =?us-ascii?Q?qk7oP0hZv5bT/1FKb73D7uF9t10Wqek30JYRtPwkd/+4s2zq3TKp1RCp1Ku2?=
 =?us-ascii?Q?SFqaPgQKFyBKndlMC0bbZ9NTrxRT6YyGcKUWzM/Qcj0CqQoQx7z4ghpTd7lR?=
 =?us-ascii?Q?XYvFOAjIpauqz3UZPZKyjcl1gse390Q5XJdhg3MMCW8STLn1qCHhYc4PnApn?=
 =?us-ascii?Q?YbITo6BletyKKAXTu5HHw4LOGGl/sDXlOh6OZz6WoZVblQXq/2gMYZgwSeqD?=
 =?us-ascii?Q?gq0TkPy7gvHaevC8Zy+fpzP+q/wIvE5YV0ld9YVJzonPAAJaa60cu80o5YVw?=
 =?us-ascii?Q?OohJ4AcutBHbG9BbHaDvAYrbjhEJjVWS1y2wCvN+FA3RTj0yElTfAVwmamMH?=
 =?us-ascii?Q?u8sfLjHlJOZ7W4W2XD2FCjfcAO8KG06xbwpFPSFfD/dNUwcWVjVWII/Px1dj?=
 =?us-ascii?Q?9djz1VbPH/NxttuU2eXFHXMtepz4LwE2TTM50blzAznTed4lzVrlGYpTxW7u?=
 =?us-ascii?Q?nxtNX8GusRyU/U47W6Pn2FexPgoE/DvpxRxXJi7g2avH3H97RC4TbHJP1pG6?=
 =?us-ascii?Q?BKKOvXNkhvMOGS5kvC+Ct9236TNA8hCqjW6kt20EQRrf84FWhUUBy8vEfmrw?=
 =?us-ascii?Q?f+mg/dF/Gl5hAbAZzGJ77Y7yPZj1qS6kVX+GqZFP0aIF1+qUk3nPrg35D+88?=
 =?us-ascii?Q?FZpBbZRemYCoGXKZQt3QYz2V/Xn8oRIUYt5D07cGoHU+nJ3WBi4qal5oHxRi?=
 =?us-ascii?Q?YittbNqNzp2JZ+orywUVJEKPRF81aNM+L+/x1+6IxYQyscMK0z3hVjnYgx0x?=
 =?us-ascii?Q?ozUYhx1SjxqKyFvXOwx9JaYUTMTDpwBfKaJcfjmSJ7nyLteOgvF4DqrxnCvp?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d632a9bd-e36e-4ca0-033b-08dcc1565338
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 20:26:08.8968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkBw9ahfDyVZLvc4Wn6Ua1fWNt4qTJnRcqCABMtyZGVdSQdWf1X6x10qkMJbOg0PyP4p0zLE+3Gc68UxL5i/4g==
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

