Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B89C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C615110FE68;
	Fri, 26 Jan 2024 20:32:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5050F10FE68
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301150; x=1737837150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8AtAFi6tJ5uCOAF9KhjbWnXTDKQoXTt5wqpTt4gjM60=;
 b=SHMbCPMdRAiojCbrryy266IEeIky12yP943BRNtgDZoxZHctjLYa43nD
 yTCZJnTi/DyT7QKGnFiCeOGd3QIhoLEJrU/jcXHCYdxZfaNx2jbI35pG/
 OEvlzgcS+oVygK8ph4ao2EbLA1PJynCpcvMSS+wfQod18DVXeW/kbH7/n
 8uxK7pQ29choTnmSboC92Yg5nUWQJtGd6EtQYZgFO7h1Ey6+r9GBmlpij
 RIooRzzDSBJ6Enln8C1RAxBrb9j8XBasyF2ozaDy/KM64VL2mXBTCHGSb
 vwp0VZurLuU0jRDHDB6lCH1BSD0UakZPf97CgwJCu4py/echeggcFW/Km Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9948828"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9948828"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:32:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877482398"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877482398"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:32:29 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:32:28 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZq3UJq9KPR/94as916lafMFt3sHntDARd5qzk3dXkJxx2MBZKHBMjeQhl2SZVxXC/0LMhWg2uAWLcbZ+FDtiSlrcgZX2KwAUV32w/vfvK1fPAXcyuBqdh9H0GmJjRryTlzS8jWZp3unoDbLPqW2LzU7e4395ch2nsYRGUsewcy28RXdkN7E5QxXz3MCHQOKYWdVNPhQa7uLPGjlnUbfkV0yyiA3yOpswfYSex0YzRc32WlEOKNgaHgZ5gvRE6cRR79g9GwmhNJ072zeUcdTJKZWQ4XbFMdPyrt4lPPrEYyOxfevEdktAvzg2hLAsl+XIbn6Yyi8SYLtGBBfFZGV5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdF5AJxVUHVA2r6SSgTlEXgilAQ+vhys3pG5Ku8p9/I=;
 b=b1sdl57G2liIMNeM4GvH06XXxZpso1qGqIpj591GgGXT8wcFqz6IigRF8ldf5n3R0HVwVejDwStWZjmDwnvn+eGxUQcphq8oMS8iwPB6XFG7rbNSqIvqLpYDq+uCulHWEtpGOnAtJMYspM9uR3htARtyzr9DZ3whVogEpYDAXBY+OdvBKOQbEOoThvjubiWtQfK324eiwJKrSLjL9XuIxTGJQY0ARnUwmzD9i2wmcdtqlxZbi2uj546hKVnYw6oDa1C9xR62X6Z/kYzIe2jFqqs+1xj94T7XuvKycgmcnN/ZIY1+Q85HXu97ck7l2ZPjvr44sfPFaXUDEeStGdx0Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 20:32:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:32:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 31/34] drm/xe: Remove inner mem_access protections
Date: Fri, 26 Jan 2024 15:30:40 -0500
Message-ID: <20240126203044.1104705-32-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0096.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d4e6e3-f951-4abb-d056-08dc1eade86f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: imd2NXu1n4YlPWz9vaQqGWsaxYT0P0xY0X3lw70EuSCBtVWUSjcSrXHnWW1Y7Rr8iUg/Rjp7ji+aAgzIVD0c6YSuyS/oSgH7AQxX99BEhmt2qtDUG0cBKH9rayUivMgUbJQROvfYMl7RQPXCPhSSwfYZC0g6qsp5G1kCSICYxWhMNuL/243kV2LPl3crPKaTvyTeVpC4rIDTF2hHIxLXR/7Ps9Z5aP8uColL7g/pyuPlzcc3DGWW/1C2H02Fe2FOPSsztBx22zLp9346un2lkTuXfxKkT3uCGM+I7zLdzpTyqJDglaPq+Js4w+bqo449VQx6ZJGc0UU3W4Td7kaVUHuuUXDXicyZa53WP4qYar1WeZo+PWFdAvv6mNFl4kovCrWmvTzqR9h06VoySjikEgHAFZkTqbj7mDC8RqaEkvKojWVhiJi2mgVa0/6yPIT0Dtf+MyLRby3nNIZlzPeODfEkMEaIl7by6nD+s56FFEZ4JgQmtDxnqUyjkyGU+Nw/Odqoh0H2AxZb/6XbRONZfBekDLMxP5/uPh6JQjCJw0Y+3zPh4RW4RXyKv1yLmRnt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(41300700001)(66556008)(6512007)(2616005)(107886003)(26005)(38100700002)(8936002)(6506007)(1076003)(5660300002)(4326008)(8676002)(66946007)(44832011)(66476007)(2906002)(6486002)(478600001)(6666004)(316002)(6916009)(36756003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MxFzqlWkYhNPfvCl92DBQ+JKlaIIWEhUDMr+umposNlfmgUFfjRNQOhYxKwC?=
 =?us-ascii?Q?Iha8xiKrRJrORprO0IK9QR2YnAbbwgTXzwRBjbmdu8RMcUQ0/kEnttho5Jq+?=
 =?us-ascii?Q?0LNf1VkGeDzAg63qPB5ygOPMfn/hiaCPrLrSBLwfq/pB4rhUWhz3LYEsrEFS?=
 =?us-ascii?Q?oPSeXyS51QCHSCsIqvD6v7GHnHA2kmA6L18BjN5S/YQ6/NadxBhT7QCHb3VC?=
 =?us-ascii?Q?ZMo04Q8L4bfNCeFjvOe4cQPhadSrK7OK6Z3zSydugEWaR9pmKq/qXaIpcX7p?=
 =?us-ascii?Q?S/FMn2Zym6XrMKmFAMGJ90RK62dItW0awz680rpkL69PbDvIalgmfuYHTkAV?=
 =?us-ascii?Q?ufNrK97GPTJHCYDXp727Q68cHhnmtWCgzbdrQi1UfNa+S+KpbQ7n0UdAGU8B?=
 =?us-ascii?Q?b13NIwtq9v6H4j8tfhd7/Bfw4fLmdvbTYk/0dItvi7YB1GBS4wayGaBE5n2C?=
 =?us-ascii?Q?wSKreR5LrBM8vgDiQ5XWvmtArbm0XgnvuznV3n+AN1XrsdMbSklnT8oqNTlE?=
 =?us-ascii?Q?hXRxTyvmtKQ0sfmkbCEr0HwOGunxO6Ft/3suQq48Qybd5FzK3CQTMu+9d0u0?=
 =?us-ascii?Q?Lk14NOA/NDW7mYohH0l3LO1HiRGVJEn51upufY7Kix0pkzdwujHPzdCJVA2Q?=
 =?us-ascii?Q?I//ISJvlJJpImLVkdYAO4F3geDZHs1CnKdfhrd1cTxZn+lPxucUlc2zL4qYn?=
 =?us-ascii?Q?iLI7FGoUBdYpZ618IsFgk1RF1NXeeHGYOLiK/8oXJXPqxR61eDAI0GZQasVp?=
 =?us-ascii?Q?iC5EpO2VGvOz9t965tGUtMditIkmaH05sF27Y+9jF4AYrxWdgCxChGcr5DMN?=
 =?us-ascii?Q?xy3k793+c0h8HBZCv5Zqdy1q7gUsB718JHEevCDXQMBnxe07n42UadEwwmPZ?=
 =?us-ascii?Q?LhjNSbhl83dxOA6VppZWb0PsKdU/U96gTKO3ydoQu/2hawPqAQzpgKm9mPSV?=
 =?us-ascii?Q?GUdQTWZQfW2d59nM5hPCWtXtMd93tlA2rTQ9uXTDMjrXdO6g7JnQk3mB7f30?=
 =?us-ascii?Q?iX9TzlxAhacU+bCOs/PMaw45V+qUw/uSCSEksAxQOGgB77NMAsQPicGe3/tY?=
 =?us-ascii?Q?vNOZ+ESGUw0dgGvBJC4TMMawS3Il7/28fJw3urGHXmcSVeiUmqPGYrbxNPvO?=
 =?us-ascii?Q?QjXAnzjXGmGvfTtpDzMjDBD2sY4iY+QWcMu0o5n3SAZIHDbcpKuvTxAS2iut?=
 =?us-ascii?Q?ixwW2y4ZPCyNbMDqG4Ff79lvE3+N0Ukh1W2PLnw4a91k5J1X1K2MBIxpdwqK?=
 =?us-ascii?Q?MIz3C+p9KPjzmDDShfN5cdc87VTvfbkr8TjT1zgoD7P9fpeEtRGJlrWRV8a3?=
 =?us-ascii?Q?3HQGsDhZiUFkBIXO2q6a6WShyoiW35gqJpwqY5REitF3+/tHO+2Xnb3RB/i+?=
 =?us-ascii?Q?Gm+mOmTXRqODUiR4y78jhv1rXEBJwyqQSLUuq409ces1XG35wFnPWNSbRnio?=
 =?us-ascii?Q?b4goMDjg/soqo7j01J/4NttIK10BbY80X3VsR3+R1la8StWuq35Z6+XhH5ad?=
 =?us-ascii?Q?K9W8FXpJJkv5+yZKOrCGIQXpZbqZcsmqERq866kBJ4vo/fp6FKl5w4AjhMSg?=
 =?us-ascii?Q?fk2OVXSMN/3b0k5uhFhjPcbcdt1wyqn9dqkpWlfZJg43Gd0J+4HYeNLJN/A8?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d4e6e3-f951-4abb-d056-08dc1eade86f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:32:25.9369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCpPWeLRLHlAADdhzSX1MoTXO2YxkCsD0XoYOAGl0I3LImq0ajRVU9GIv7fuShIBku7LbsQHF+AH9ug2keMeiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

At this point, all the outer bounds callers of direct
xe_pm_runtime_{get,put}, should already be ensuring that
device is in D0 at these points of BO creation and
manipulation. So, time to remove the very last users
of the xe_device_mem_access_{get,put}.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 7 ++-----
 drivers/gpu/drm/xe/xe_bo.c             | 5 -----
 drivers/gpu/drm/xe/xe_ggtt.c           | 4 ----
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 722c84a56607..077294ec50ec 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -190,10 +190,9 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 	/* TODO: Consider sharing framebuffer mapping?
 	 * embed i915_vma inside intel_framebuffer
 	 */
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	ret = mutex_lock_interruptible(&ggtt->lock);
 	if (ret)
-		goto out;
+		return ret;
 
 	align = XE_PAGE_SIZE;
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
@@ -241,8 +240,6 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 	xe_ggtt_invalidate(ggtt);
 out_unlock:
 	mutex_unlock(&ggtt->lock);
-out:
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 	return ret;
 }
 
@@ -381,4 +378,4 @@ struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 void intel_dpt_destroy(struct i915_address_space *vm)
 {
 	return;
-}
\ No newline at end of file
+}
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 17d3b7f69580..99c6c5452f84 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -730,7 +730,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	xe_assert(xe, migrate);
 
 	trace_xe_bo_move(bo);
-	xe_device_mem_access_get(xe);
 
 	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
 		/*
@@ -754,7 +753,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
 					ret = -EINVAL;
-					xe_device_mem_access_put(xe);
 					goto out;
 				}
 
@@ -772,7 +770,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 						new_mem, handle_system_ccs);
 		if (IS_ERR(fence)) {
 			ret = PTR_ERR(fence);
-			xe_device_mem_access_put(xe);
 			goto out;
 		}
 		if (!move_lacks_source) {
@@ -797,8 +794,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		dma_fence_put(fence);
 	}
 
-	xe_device_mem_access_put(xe);
-
 out:
 	return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 7faf02523b03..1bbc5250f363 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -435,14 +435,12 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (err)
 		return err;
 
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
 					  alignment, 0, start, end, 0);
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
 	mutex_unlock(&ggtt->lock);
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 
 	return err;
 }
@@ -460,7 +458,6 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 {
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 
 	xe_ggtt_clear(ggtt, node->start, node->size);
@@ -470,7 +467,6 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 	xe_ggtt_invalidate(ggtt);
 
 	mutex_unlock(&ggtt->lock);
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 }
 
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
-- 
2.43.0

