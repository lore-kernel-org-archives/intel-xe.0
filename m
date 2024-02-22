Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306F6C48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35A110E9BA;
	Thu, 22 Feb 2024 16:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nd5ruFmu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D110610E9B7
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 16:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708620030; x=1740156030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PUbLG0zqE3zugEodu9HvLw3qaZG7kNPYELWKyq7VKY4=;
 b=nd5ruFmu3DDMHyKm5Pm8hgRli5zneNHXDYIs/wjPEaNm4q7cdMbpzKaK
 1o3n9PR5RarAPG15mXs6u/vY3D2A3Q93r96wYJ6zAcSHXUqClinG3x/hA
 sYGtSi0zUqcSUHfp6laiXFZURwr9f+nNihnu68weIB8K4xt7Lpz8AnWxd
 fIie7t9IQm8zdlHVjeCMPxcNUT8uiVtnWCfNyLB7biaVq/yc01SGp9eC5
 P6z5qZ/MGdllMWZeyquW7raC5o52/sssKP7MVvxfeyg2uz3KIwIK7sk1i
 cklJe//MqWwlAYjCuvrtwWS7eYvCK5CoHav25ssvqARIAiDqjjy9Usf6m A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="28296345"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="28296345"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:40:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5490404"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 08:40:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:29 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 08:40:29 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUpjWf4/BBwSGxwrRvby/REK63ny++ABMvCu2LoSBCup0ShC3P5uRy/p2kk6hbQ+sUM378H8iK7CIm6qB9u0Kl3amH997+/KdJy3fm/hms2F2kqcfbM8stbGxu5l6yDrXgx7Eskh5XaWcU1rKQBHibqkXc0I2fW18a6lFXuixNuZ/TeS3QTc37WLWn9xHsCX/Y2f5M9rQ4+K16iWVH1eEWxRt/Lmm0gPb8wp8jHVUsxDgZwRfjxo/XpVriAj7R2QSBxk5+36aD900kDaY/0JKPGi81/j9ls9v2+HBM+cRsgLPC/aVA7S4JkUmj/z6r1ld0UQy99mES/NA//ukWEn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBuoNqN6wVcLA6GyjFE4i9FTh0gS11mw2RxJ0/+xiOc=;
 b=C4TqzHulJI8SPo4zUVS1wRxf3sLf4oKogsGO1DvDtsYyWXw3pfZXk8x+8Yli37SKUWtqQC840KRtmHeQQuAr3OAVDR7+m07u6Ha4qx80B+xyNun7IxaYu43BboqFmeJkd5bpKY1jJ8XLopi61GpaTlvZvJDLrZNMLD1yBR2g5TYqp1AerKL5+acTUTeo9g/uPKzfcAheRk4zd6AT3uQCDTrfotURrpW9kYI+ZmamE6B9Fi6QWWbvXwwmtQ2uAC2idPu6qAG/6eBaDkperJ8WBE06dGrS6NZVG7oVU+BOof0eYREl7rxr0J6oJH+G7dW9Zt8Ozxja2vA61/GJGvDrqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8764.namprd11.prod.outlook.com (2603:10b6:8:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Thu, 22 Feb
 2024 16:40:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 16:40:26 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 14/14] drm/xe: Remove useless mem_access on PAT dumps
Date: Thu, 22 Feb 2024 11:39:37 -0500
Message-ID: <20240222163937.138342-14-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222163937.138342-1-rodrigo.vivi@intel.com>
References: <20240222163937.138342-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: 16feb07a-ebdd-4066-01ab-08dc33c4f8d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PFnp7pnK7TTTyibbMuEMVsZIVgz4CVh/13Yl3hcWxZ1xqyQdNVGStHDd/yMpCMB+bL8jP7kgG0HBEOAWRfwmBK6ZthLGD+tqDwXm3gsXmrAhh4t0ROF/UtAqb+e47PwhoxDocCP20azC+l8XtjPDytovJlE5gzvRtlHHOnJL1R3X3EplQQcsDCweJKIn3cI0EUbRMwuuJmEghXU182KPVG8USEVLUBbSHqZmpMk2lKYl+8glklkDsnxIj+9a8m4I1YkXLk4z0rwem7FT2MIiCRDX225qqWIuk8TSk/mEgWNCzbav/rzue912UnsnmlLucb8QZBULQLSIIS1tAyoDHPcPvt1o8tS4ZIXyM3udCES5aznHymvz8+4RPDQVdZoX/tkl0DGOM8Vc95T41XUYzhB3VTU7+ZFoVwjgCyLk3VBtit6xyXZzoPZ+PjphRkCz085mcXvxkOh5bDmffi0WdNBGw65qui4QsJmiOGz152h+XgPeEnk/H8mxJsyI83fN6sDLHz0FU3an3DxHdzhppG2qARQcZx8pXiD98ZZIjLw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K/tekJe72n9M5IKL0851XE7S+y/I+ivU1rNjlh6NGzM9cIVy9RP4PT+LoImS?=
 =?us-ascii?Q?nOIkk9RP0gp3wNUfEtiCKqkHMqQisfpc+Hxgc3r4pyWEKlJbHOc7Y9KqgQ2f?=
 =?us-ascii?Q?gb3ds8gO2Z7OzPa51RiS035tAX8wwd/dIMmEFVwG4RWuYBEvrv79KcJ9Kwgy?=
 =?us-ascii?Q?NC8K0Q2X8nriZv4o77+o+8KnVU+XJLKZKClnhC62QZMJCEVu4LB7+qzI1XkN?=
 =?us-ascii?Q?P0yyEJutQOBmZQrV1oW6hze3GVDVHZ6P8nrtpGA0kjr282kQJxUKak+Dli9L?=
 =?us-ascii?Q?HSXt0OFH3Vmu1+SPkDd56tgsqzG4Eu7r9gfAv+uJHzXp0zdYRPLRW4kl187s?=
 =?us-ascii?Q?EWxUhXpMT55OU/a/+8pp9oUD3Pjci/ruvv4D3GJtbCybwAZZONBfCSOWgklT?=
 =?us-ascii?Q?+HRKbBrlFW6vMgOZCUAGGVuXEOlQFZJUwkrySpg10KyFVIQJZla/qnp6uGqY?=
 =?us-ascii?Q?IdqkbQJeAKYHd/ieDh75vkaBGtZcX74T4o8XvIjuoZrvcTjAJCjHIBYwnVHe?=
 =?us-ascii?Q?Ya74Om51qt/l1sh2MQ/8ww/W9S8dTXpI5dD+ZNnLWxajrA1isSim0Rkp3Q+L?=
 =?us-ascii?Q?1T0nNRE0hxJgg7ikJNX4bRaVToj+UPPkWR3PP1c118kPFcbGF/HuQa60GRO8?=
 =?us-ascii?Q?yYd2QcdAw85d69nLiPI7zJdYCP5Ws/v8J14Cs5yZ9aA80y+DPRXoPXjo4a6i?=
 =?us-ascii?Q?2efjifV/r2E5re19e+XgGCOS5YqmY4XMievi5DrSPsJIie7uGgRCaED1Ui56?=
 =?us-ascii?Q?Q4kv48gFdjmp+BmNQMUP2bMBDqc8MqURH+nltkWQYWjlSkQamlHkGyvOkx6M?=
 =?us-ascii?Q?sP8ehK+hvmRZeU1xSrXruAfiAmvuxoW3+MFt3CHI3Q2ub1sHDcrnz/jc1onl?=
 =?us-ascii?Q?dwSlJBSCTXWE3Naw8YPDqTEm1oxbZWA7yxDAG1YZUeYlqVkQOzMCPNMvZU7S?=
 =?us-ascii?Q?21ZU76h3KIGIgTrLpsCRsoqd3HdqblVrrZehFBsVXO+ljkIsuM6wLYVKDU94?=
 =?us-ascii?Q?7xzNu0HxhdfwPtVqB+TH5NMsLSAFReT6nUqsE0yj2LY17CSeyzV1AGmXHN0C?=
 =?us-ascii?Q?U80pkrnqY1sL7TxITgUge4TX6J29TNbc2s95KWpm79hg2iSjCqgrAm3p086l?=
 =?us-ascii?Q?bqpqnf8A4ecmqBmrm8pxKIDhDJYcKFjns+ssWBCscrhmjSpTGIGqFftNpB2n?=
 =?us-ascii?Q?i83TR2e/l6Tne5HroKMSMYlM7EUebKisCvjskHNaYFxU2xVhM1tN3QjZRFYs?=
 =?us-ascii?Q?pmv8ZjXojwvjQ83kTgPAsc6Uh/5nOmCB2MUz5gI1nWfl+IJ9gIog2tWExqhK?=
 =?us-ascii?Q?Rn4bba6u3tV8oSd3GkroL9rk/mngrNDGjAoS3WdbkYBbN2W9acWXRn4RrZo2?=
 =?us-ascii?Q?Hu9a5mZvmqzHnsYEyUirOTWHvMMpGRsbm0PEd2Nxy4Gkg05y+T/wkTubygLP?=
 =?us-ascii?Q?sBKinJhtzZgqHF0lEDDblWX/syh4NNuw4No+SA779ecGiCzz5TvxH6hwe7A+?=
 =?us-ascii?Q?qIJnlSZTouOAjAzM6g0wwTcF4KzZNLickTxIlLmY5g/xeRYPw49JNZRzoCb0?=
 =?us-ascii?Q?aTAtwH95E8gAw6J4tFCQCoUpW4sTp6CeEzhtBVzWv/Y81/A5qmRO81YtxtVz?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16feb07a-ebdd-4066-01ab-08dc33c4f8d0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 16:40:26.3742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqgVmn8rl+23l/BVM9+IixWWoRTPJhd0cVqVJWuWzdSfn173vOqeZZ3mSIdrtX3AQGzB4T5vKyc9rLvxXQ+PVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8764
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

PAT dumps are already protected by the xe_pm_runtime_{get,put}
around the debugfs call. So, these can be removed.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index e148934d554b..66d8e3dd8237 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -174,7 +174,6 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i, err;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -192,7 +191,6 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 static const struct xe_pat_ops xelp_pat_ops = {
@@ -205,7 +203,6 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i, err;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -225,7 +222,6 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 static const struct xe_pat_ops xehp_pat_ops = {
@@ -238,7 +234,6 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i, err;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -256,7 +251,6 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 static const struct xe_pat_ops xehpc_pat_ops = {
@@ -269,7 +263,6 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i, err;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -292,7 +285,6 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 /*
@@ -325,7 +317,6 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 	int i, err;
 	u32 pat;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -370,7 +361,6 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 static const struct xe_pat_ops xe2_pat_ops = {
-- 
2.43.2

