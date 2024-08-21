Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9B4C54722
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 19:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72ABD10E6B6;
	Wed, 21 Aug 2024 19:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZNxg5kQw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D9010E6AE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 19:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724269143; x=1755805143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0f0xGgvGDN9FAaRK0TC8lszxrTmyQz3IkOk2ZoslOEg=;
 b=ZNxg5kQwKDlDUgr0aDvrTNaZWyAdGPDCOfoEuwE2+swh2sUC4TGE6+yz
 O6obAP44jQBS8FzpvyS509HhkKOt623y+CFTwDJeXgC4NjhfmDcUEAiVt
 /syoQdU0MvH+Muh8xqUaMui/x5+i1BwrcoaiMX+R0UpZ5IIVhzctTGHf9
 UDQ3DpK42vMAD8Sjiqu+MaRa8D40YDOM0PUvQ3zxGCHyxeLqEh+Voj3sl
 Jmhwnw2F87TiBmvvpaM06Klfz/Qbe0NkVUAlmyP4cT9SzWak5sMD6YG71
 xnN8DU5u3Gwl9s92GWtweM2K4vesTnwiLwDt8lrJp9/pS2sURVXaQGNqG g==;
X-CSE-ConnectionGUID: omhRl4CORYuScykSVONNNg==
X-CSE-MsgGUID: iB0bor9tSwaI74fouhYl/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26448925"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="26448925"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 12:39:02 -0700
X-CSE-ConnectionGUID: 27JO3espQ8K2zoXIjFz1Yw==
X-CSE-MsgGUID: V8eueoMUSoKF+xGGmpqsBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61191321"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 12:39:02 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 12:39:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zs4+pIprL8O7nQCV/SWhGZHUR2HjInsfl55RvQzflkIvPDPIeT2GekXpyklorkkJJ9QxG9QJK0ohIQQOLhSef9Gi4JMjxHAO8sio2nUdqmqyK+yzfDA7Q2cWtJuLGyJUGSzeorXhJ8ZCMxBuAUU2DG9Ojn9FbdDzOWsqQ0CXN3TE7R5w3LZgl1pAK4+KaiTMIE3b/4uPcy1quG9D1G+gkg7sjWl9zJV8+JjVYihC6iryUocly59auRW3KydnlRPI9MyePKg+C6Fz6hfCmX6J+d7xByI/Xh7+ZJEHeMNvrii6myNbKjVIbe/W5ya6HyuONkhGCc09bC85JcJRpn9muA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxeDTExAiMFb0rUpW4mGKkpKdrbnR5DEJdeAX76um8I=;
 b=xiKUQDkfEjGEBCJGqPKbvvBWY+XcU5ccXsHMvdchmwcyUwh1dwtkkAxBD62MK2zO9aEIu3k1Axbxyj77aJ7iQ0Bamr6YzTuKmo4fvNurriMH7pTPjBHFN3IL/wUv9IO0oYLumZWNg5FKYZCGXOMjkRxcZbOh9u35zym9zUir2xUREm06TWaQ9ENepRUO8achSrrAAfUl+iMWRVBsZ72KPmJLhRwHLUdIkXonUv5UdAnO0W5ToDqKj7WYu6kyUCiahyeiYrUPeGgjp0gIZoJyV5Wx1CKoMNMutC3XKEpJAsAGiV4t+nlATBx5KJIMaGgECApMpGpNLajl+q6/OwFYOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CO1PR11MB5041.namprd11.prod.outlook.com (2603:10b6:303:90::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 19:38:57 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 19:38:57 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Matthew Brost" <matthew.brost@intel.com>
Subject: [PATCH 06/12] drm/xe: Rename xe_ggtt_node related functions
Date: Wed, 21 Aug 2024 15:38:36 -0400
Message-ID: <20240821193842.352557-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821193842.352557-1-rodrigo.vivi@intel.com>
References: <20240821193842.352557-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0034.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::47) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CO1PR11MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: 42fcccea-51de-4327-222a-08dcc218e603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AT9Qo7siewz5ZwK/uQqFLihfEVQMMa/MPgkl+GHla8mH0gsA2jGvya2Ug6Zu?=
 =?us-ascii?Q?M8a5Rxz7ZI2P2T72GfLfeoFogwjDe098fTgPFWlpif/qIG9+7/4qQPxel9+Z?=
 =?us-ascii?Q?wqyWI88Kn0b1ssKLj8EW7Pwer7xECxx7OXT4fkhYRtKLCF66UeHL+2pNDhpQ?=
 =?us-ascii?Q?iQXc1gL23japyJa4e98KYihc5D+nQaxhExvhCmfYqPNEhz7rIbuteUET/vFO?=
 =?us-ascii?Q?M2dhX+DDWJi0sTLNa+dTWwJkEYVvuqY7HmfNZ9HOdIjt3b6gR+s0UKd72gWE?=
 =?us-ascii?Q?NckrxQFY1Q2mZP+YWaEjFvGJJNmLf3Z/38yJEE3lIxcTrs/rA4fr/hKUUoZ8?=
 =?us-ascii?Q?y73+H0PF0eJ+QO48XYw+EpTPA4ZoJbfTWJLFgvQCxhp+A66gjDI48C4qIAgB?=
 =?us-ascii?Q?kPe9WrkUTiRD6EZlqiz1h99MdXpNYvZit1c6nnGJXJBc+yAxMkDThqzerTzc?=
 =?us-ascii?Q?qLpLD/8OL5X757moOGkEE2fUSba2NStNutYY8Jg7q0K7miQJRchaux+6SL88?=
 =?us-ascii?Q?nYhVBGdQUIad7xNJ/F3GWTYvXnLhK8SceUeVfdTJQqEHEV/2Vf5q2LsV+lNY?=
 =?us-ascii?Q?xVMO/9GmTvAbbF4uQTQy+rEf2+Jdf1jfJcLt0lVdJSI9LsfPvZLo19DVJpwY?=
 =?us-ascii?Q?gHIA9W+L6TmHDoLk+x7n6rJo9ynjaA2IQFNy7nd3OzAfctkj8aBlCz4Ny/pF?=
 =?us-ascii?Q?jEU66ZnxZHHnsCmQQxJeZReXkqVkk8/x9GSpGnAx3QTv85IatGr1r/ZQz1eD?=
 =?us-ascii?Q?qiOGiz9CM58PofBPMl5MoF5KT4RhrgZ9Mr4aVSA/k3nhuaARlsSarJdl906R?=
 =?us-ascii?Q?scPgV2V1brC8tjry9BrREfhcVowrQczCdkI14oXgnZiNB2SUWuuVYOwUKbCO?=
 =?us-ascii?Q?CxWpxzl2ESp3yN+JrGvLEBNjKvkk7U90T822C90inzdOq7fROAIllfA/BPIJ?=
 =?us-ascii?Q?C6icq+X5HSEnsFmxD7J05aBHrmQsVS+iNO+QoeF42VLtJkswW4ZfbtPhOW4n?=
 =?us-ascii?Q?nkjldvm2A9jsWin+x+URWK7oZoSZ2kSmV/0BgbdHwmtoQMlw2ERMZZlY7woK?=
 =?us-ascii?Q?5/syy5GKyOTQ4opv1fq4GUaPukcR2FOp1cnOLntzQQ56FL521tC8Gaa3R+pj?=
 =?us-ascii?Q?jn+n33sb6kN0edpWD9K5V1MZbyAbcVdBUOP7iGEvwfHAe3NoM+qbCuNvtl6/?=
 =?us-ascii?Q?jibulkCC9wIXJvHWdx2GD0P2gPhfoe3P+ib8IkItI1Az6ANIb4r+qprTwDJF?=
 =?us-ascii?Q?2wZOuzZwT1Q0q1L81oPxzM0KloxhnW7CxlKFI863bYQqawVnEVd5bogpgkbY?=
 =?us-ascii?Q?v0SOIzaT38ILNeBqDRTsk4n5sLWQuIfJKdLyJz3DkjS3Ew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RL9+RsEcTz0giFGM65BTY99KNF2nIGnc9Kvmrt3ad7t4ahfA4DuaOCHqNIKw?=
 =?us-ascii?Q?vRKTHAl+1NT6Qoc5ifkMcV0AwJBSt6CIT5m98B9/F2QEflU2ACjkzt8Pn5my?=
 =?us-ascii?Q?jnVyZBYM33ngRRVkzTLBrUrUASiNyaQBEewui1U9tQ0x9IkoEN5nrpdwRj/+?=
 =?us-ascii?Q?xOSiN5bCIyun4U8K9XLCthUh6Jjyo3/E2TYQ0ZnSho6AdtwduNXcCex68C0b?=
 =?us-ascii?Q?wzluwvrSxfOFOMV18bAPCYy3VId2Vi5pCjiUq5nWQIuquWT2TI3EwHtU8/9L?=
 =?us-ascii?Q?hMNJHOM0C+Rhg/WyFYd+FaxnHrZ1OSM/N8oO/PrAXt1SkAB9qnHnGOFOkucU?=
 =?us-ascii?Q?rD921/uZprLoslkL6w5Eic3SW37j/AkrcmgBKqOrqUfHDXqG+crqugTc7efB?=
 =?us-ascii?Q?loLgtNm9VJDGGd89j46K+mXaoOV+ARGstcPuqos0cX+4A5++l3Fcbwr/xNjo?=
 =?us-ascii?Q?So+dxqRqdxS6JRGwtwaadNW4lHm57cuF7V1pJyRrDo+S7is/3ceceX+1S7Jl?=
 =?us-ascii?Q?RG4nea7cKvIujv3UfEXR/hQWpGamOsouW6LlUkUaxPG3+JD2CUkQEcoEUeMd?=
 =?us-ascii?Q?2Kxpd7jG+pQOOUiA1yXVBz7r9ukPRKT/KEDbTOgqrG3AwXAoM9KISMBau7E7?=
 =?us-ascii?Q?4A4wb0yKq1/MHUiIXxW6F9x4secErIDZaC03gC8zIwC1QyY+NzVp9NJ0z7YB?=
 =?us-ascii?Q?mSFmyP/kSNX8HItPba4W3FEb1Y9ux6VTwWgQXCogTT9Gzy6x3ajiAhV68tws?=
 =?us-ascii?Q?N1WsM1a5wWE/Ea2RX6NfAWhrtQwoLNNlaCYlIlssebo2z3h7niAt3dBmCjN+?=
 =?us-ascii?Q?EYrLZ7iIhctmY2Ogow6KeXjT1HsCjwg88J4hTzlSac25YziUtNr8xcFyDNsD?=
 =?us-ascii?Q?R5MIFhkN7yjhpFOZx4kXgzEq4KRi7KaJ+ixZrqbcENXhjBFfgaKkhjIQHHYb?=
 =?us-ascii?Q?UZYmhxHYx/Vggb8fO5mhgpYX+H7JCmQp3wzfSHpnDTQtJZHjM/rsjSY8+dhp?=
 =?us-ascii?Q?h/1ouikH1gDcTj97zRv6Y3WJAaIvrWyRb4qYhXnNdPuka/aPJIrV3Ol/Knmu?=
 =?us-ascii?Q?wBlfjeBLvHbXRVQucTuhWrbDC6r+mLAWsDS8FoPLMhJTCnNzii9JdnUE5QlU?=
 =?us-ascii?Q?MWIcnt9+vKpwNJxolyT2JaAoRzj3+OrMBtxjum4ic6lqBrsrlsZsfXkOTxfc?=
 =?us-ascii?Q?OY1iYdiuKSq20D319pDAEoFyepUOT11QUmy2UOuDdyj5u/9OKQDbnLHaCwu0?=
 =?us-ascii?Q?vw40HwBkXjf5I5Yty+5q34+vba5VbyklecYFa3+d5PdGTRlEFGAl/UHcjOLZ?=
 =?us-ascii?Q?H8VsvWZ2GfTBDSjCgZJnQj6iTgWF5A1H1Oju17DypS1pOVSTC6cZ0mhWV2mG?=
 =?us-ascii?Q?8GXMZ4aHPWmAapuBjM0EjWZe6XnNObmYp17dLWUWxAYJsXANQUoPEcTVKScc?=
 =?us-ascii?Q?kLQiNQiRyb0WH4k8If9n8gmFIWltnp2Sg6bR0CKOlIvRsTyf0G7loCrYZRmW?=
 =?us-ascii?Q?i3xD0SamgnA3XxAAZNs6UoAW6YzxRnp4Z6P4rzcserOBYsJECp5SQsxz1d01?=
 =?us-ascii?Q?KsOcQSpklh8Ds0ypHIZSE+zK5+ltzh2jJ14dVgE429fWbe6xaczxRIwCKdWh?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fcccea-51de-4327-222a-08dcc218e603
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 19:38:57.6303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wqw1Tmq+Dv2hGwCmpfcjVHe5ySMpkMcoVWGI1FuclTCDNu3iyIonHc4D7lR4blhQDBd2Dsu5cig2+Y0RtEL/lg==
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

Bring some consistency and prepare for more xe_ggtt_node related
functions to be introduced.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c     |  8 +-
 drivers/gpu/drm/xe/xe_ggtt.c               | 86 +++++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt.h               | 12 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  4 +-
 4 files changed, 54 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index a93923fb8721..db74c3395ef8 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -209,8 +209,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
 
-		ret = xe_ggtt_insert_special_node_locked(ggtt, &vma->node, size,
-							 align, 0);
+		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
 		if (ret)
 			goto out_unlock;
 
@@ -227,8 +226,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		/* display seems to use tiles instead of bytes here, so convert it back.. */
 		u32 size = intel_rotation_info_size(rot_info) * XE_PAGE_SIZE;
 
-		ret = xe_ggtt_insert_special_node_locked(ggtt, &vma->node, size,
-							 align, 0);
+		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
 		if (ret)
 			goto out_unlock;
 
@@ -327,7 +325,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 		xe_bo_unpin_map_no_vm(vma->dpt);
 	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node.base) ||
 		 vma->bo->ggtt_node.base.start != vma->node.base.start)
-		xe_ggtt_remove_node(ggtt, &vma->node, false);
+		xe_ggtt_node_remove(ggtt, &vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
 	ttm_bo_unpin(&vma->bo->ttm);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 1cf682d15253..e0da24bb5774 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -403,7 +403,7 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
 }
 
 /**
- * xe_ggtt_insert_special_node_locked - Locked version to insert a &xe_ggtt_node into the GGTT
+ * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt where node will be inserted
  * @node: the &xe_ggtt_node to be inserted
  * @size: size of the node
@@ -414,15 +414,15 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-				       u32 size, u32 align, u32 mm_flags)
+int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			       u32 size, u32 align, u32 mm_flags)
 {
 	return drm_mm_insert_node_generic(&ggtt->mm, &node->base, size, align, 0,
 					  mm_flags);
 }
 
 /**
- * xe_ggtt_insert_special_node - Insert a &xe_ggtt_node into the GGTT
+ * xe_ggtt_node_insert - Insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt where node will be inserted
  * @node: the &xe_ggtt_node to be inserted
  * @size: size of the node
@@ -430,19 +430,53 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-				u32 size, u32 align)
+int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			u32 size, u32 align)
 {
 	int ret;
 
 	mutex_lock(&ggtt->lock);
-	ret = xe_ggtt_insert_special_node_locked(ggtt, node, size,
-						 align, DRM_MM_INSERT_HIGH);
+	ret = xe_ggtt_node_insert_locked(ggtt, node, size,
+					 align, DRM_MM_INSERT_HIGH);
 	mutex_unlock(&ggtt->lock);
 
 	return ret;
 }
 
+/**
+ * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @node: the &xe_ggtt_node to be removed
+ * @invalidate: if node needs invalidation upon removal
+ */
+void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			 bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	bool bound;
+	int idx;
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+	if (bound)
+		xe_pm_runtime_get_noresume(xe);
+
+	mutex_lock(&ggtt->lock);
+	if (bound)
+		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
+	drm_mm_remove_node(&node->base);
+	node->base.size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	if (!bound)
+		return;
+
+	if (invalidate)
+		xe_ggtt_invalidate(ggtt);
+
+	xe_pm_runtime_put(xe);
+	drm_dev_exit(idx);
+}
+
 /**
  * xe_ggtt_map_bo - Map the BO into GGTT
  * @ggtt: the &xe_ggtt where node will be mapped
@@ -522,40 +556,6 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
-/**
- * xe_ggtt_remove_node - Remove a &xe_ggtt_node from the GGTT
- * @ggtt: the &xe_ggtt where node will be removed
- * @node: the &xe_ggtt_node to be removed
- * @invalidate: if node needs invalidation upon removal
- */
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-			 bool invalidate)
-{
-	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	bool bound;
-	int idx;
-
-	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
-
-	mutex_lock(&ggtt->lock);
-	if (bound)
-		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
-	drm_mm_remove_node(&node->base);
-	node->base.size = 0;
-	mutex_unlock(&ggtt->lock);
-
-	if (!bound)
-		return;
-
-	if (invalidate)
-		xe_ggtt_invalidate(ggtt);
-
-	xe_pm_runtime_put(xe);
-	drm_dev_exit(idx);
-}
-
 /**
  * xe_ggtt_remove_bo - Remove a BO from the GGTT
  * @ggtt: the &xe_ggtt where node will be removed
@@ -569,7 +569,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	/* This BO is not currently in the GGTT */
 	xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
 
-	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
+	xe_ggtt_node_remove(ggtt, &bo->ggtt_node,
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 30a521f7b075..5147930357de 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -16,12 +16,12 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
 int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
 void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
 
-int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-				u32 size, u32 align);
-int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,
-				       struct xe_ggtt_node *node,
-				       u32 size, u32 align, u32 mm_flags);
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			u32 size, u32 align);
+int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt,
+			       struct xe_ggtt_node *node,
+			       u32 size, u32 align, u32 mm_flags);
+void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			 bool invalidate);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index f107ae550c0f..3ca98f8a0eae 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -382,7 +382,7 @@ static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
 		 * is redundant, as PTE will be implicitly re-assigned to PF by
 		 * the xe_ggtt_clear() called by below xe_ggtt_remove_node().
 		 */
-		xe_ggtt_remove_node(ggtt, node, false);
+		xe_ggtt_node_remove(ggtt, node, false);
 	}
 }
 
@@ -418,7 +418,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	if (!size)
 		return 0;
 
-	err = xe_ggtt_insert_special_node(ggtt, node, size, alignment);
+	err = xe_ggtt_node_insert(ggtt, node, size, alignment);
 	if (unlikely(err))
 		return err;
 
-- 
2.46.0

