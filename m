Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1974C52D7F
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 10:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9C710E065;
	Sat, 17 Aug 2024 10:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AKUmZ6lc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96CA10E065
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 10:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723890976; x=1755426976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=I0k8XJC6xssSUQJ2pLMQxB+z46DGpNqs2OPZeRqoDQM=;
 b=AKUmZ6lcGPRqJk5c0kjGdPtu41NJJ0E8F5PGuspN9tV+jEssasyidCSP
 5Yw2e+ZfJk9UE+/XqB5Eie27VtaXAnTS7wP6RWeUZ3+sJl+L/00xn+7UT
 P3+p5uE3RgbxKQ8xSs4sabOWrtzOaA3o12BE4ix7l6mDUMKAjYiJ9yxYb
 t1vlIoeaQZfvLTYp4ghOmn1n/E/TjO0GhnzxeLsZZsNoE9ywNeq8dGPq3
 oHuAyHmjIyFk03Ue+Y6oBSbiACQI6nvIGTUrla+NRhChBqpB1ww91tKb9
 iNw+xqH2KTTKw6qm/pCI6yKn+xKc/pP7eAOSB4/wlPfaFQnp+xHA/FqOm w==;
X-CSE-ConnectionGUID: 6MkoZo1zRsm/3DLnBJ+QVw==
X-CSE-MsgGUID: 5aZY0TpnRcysBwjIJsTXoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33594996"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="33594996"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 03:36:15 -0700
X-CSE-ConnectionGUID: XRQpA5uoR+i0j6tLhBtADw==
X-CSE-MsgGUID: laif+isoQ6qSiAwPaD9ycg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="60464097"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Aug 2024 03:36:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 17 Aug 2024 03:36:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JV3jd8xkWnWOZ1Dc4bHmv2FMpkvFmAQDoiYmRbXC+0uaP+sF8K5nXjjHY07DSxtHAb50jOLVoePCVZl2xFh8Mo4rNIwCoq5FcK8piW069shK9O5RcX8FGXNDiWQ8rP81v1Apokwva7iOSbUhBKbI0vI7od+RH2d6eHpWh75eaOK65eRDdGnzZ3HBmB0n1twLFyHEWXWR5kNp4D8r1H2NaM3FA7zhv02619YlF1E49x/xrKEfkeiXRKKbUGULpynOeg5YwGgLaXfGOqISdjkoGhr4Xafn/wpZuDnxmjKXY91UH5QaHJhpg7W2a5eocVP1U+m2wSiY14Cy1dFk9A6y3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gpu52xo7uZLNR4XVR56Ntg7G3RAYeL/ewVb3peA6Pj0=;
 b=j6gZ2GQjSsFTg65cEG5mWQa82dnv3CP+0TZ1MG3gIMHpKxB6dnUqJBLIGzm0SVKMFYCPVT8hKU8QziOs0uF/cndt2IDMSmIE2hzE2O9pXFYZdLaEhbhBvt43ufv5+HDCHMWxSWI/gsRSqZfiwbHY6ISMRJ9M2OzR9xnSN8e8X1wn+lfZyN+iBDl+EhEC3K16+i19WFkHD49l70qywX0jqDtZirK8d2QplhYk69KgkyLwVMtklsn6F29+1UXtwPR7P2F+PVS8Q2VVbk25gvlFpJG1hiQe/gLs7z5S+YO0sC0ujsAQxo0pGo1MHGKFpvhtG/Dv/H/7+W+o4ydo0BCdZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Sat, 17 Aug
 2024 10:36:13 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 10:36:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 07/12] drm/xe: Limit drm_mm_node_allocated access to
 xe_ggtt_node
Date: Sat, 17 Aug 2024 06:35:50 -0400
Message-ID: <20240817103556.163783-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817103556.163783-1-rodrigo.vivi@intel.com>
References: <20240817103556.163783-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::9) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2b107c-3b99-42a5-740f-08dcbea86a38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LPgWBPjP3kXQYS7xI+BwOY/2q5ZCCz3+IPSRXgxt1XulWZi4/7qllzaN5vdv?=
 =?us-ascii?Q?vrz3X8qQipkNbZZp8wnvy4nTsm3/e4iQZ6d4iwr+XOVILaFhjZgKkSvzmJx9?=
 =?us-ascii?Q?nvF3kutQ/FkQS9xM0BlaTdIPT4zrwzw8SEMMEwhMbI3Y3Q6F9W77uIhTAwnR?=
 =?us-ascii?Q?J6UwaFNQwj9mDf78694wDsMTps7+MJhFX/JTowCZGn04lpq6i6Vko6slSJI1?=
 =?us-ascii?Q?SmPSdhBXGlLsmlN5vIADZEVD6J4mDErT1Z0MidT+GfOzu5RisZ4iFdQ20Osp?=
 =?us-ascii?Q?qIAVXtSsybaGLXsquJ9MoKEdK/Xw4HeiqU3ED7I5fRZq4YtCJMU5SH4MMnbA?=
 =?us-ascii?Q?9vudeZcGLWIfN/S37a+y3i0fr7zHaNaXHiRxFnWzxMaXdFy+9lQLYAova3Uu?=
 =?us-ascii?Q?Ap7Lacq9/zxO9gr0spZWRD8yD2S1J0ZGJRQYB1kgVScoXe6BX51FFUoQ/gQi?=
 =?us-ascii?Q?Zs6kEjh0PEQ4vysVeRelv71bFK+iqJe2RgIcDoMU8pST2d2eJEPaf7ovYSmU?=
 =?us-ascii?Q?zNaUcFb9osyMk/XFz0JLSzKRzK0MQsWRoeanGxEH/+kfndhagdLGUMTjwDRg?=
 =?us-ascii?Q?wxYQqm/WNoTJbh5WIr1wNzxpQsqnSPXWQgbFk+twGb+YpR5OUW4C3/WH+wOe?=
 =?us-ascii?Q?plJGiTy+uFAHyVFcg7C1IribxPzGtdEa837dLozrDR2nzmV+Fr6WGvg3WYbW?=
 =?us-ascii?Q?B5vjue6oNRgN2+wrb1Pwf10V1lbUuME7DaOp7WwG3BVKQRCxiCJBj8XOyZEj?=
 =?us-ascii?Q?N2SW/xhCAvgqXWM0bC0q0Dem3XC/ZX3TVVXSZYoCHmcGAHJNNyx0hHkRXBsF?=
 =?us-ascii?Q?YAimIFfgyvmdSDQkz8/KbwxBin3ren1Ohg8MQyKCCD1r2y6oTPNoYj1vqbrX?=
 =?us-ascii?Q?Ou7UQZ9Ahg2o0/e2tlJQ+H7gyUaG0nOoti5zAVhxacAFdva8TPHiFQuu/KwF?=
 =?us-ascii?Q?HnmncJN876lFzMFnZK7NCQgxVhMthwwwDFGcWZe1ZStiS4Oh1gy+4vQ1p+fx?=
 =?us-ascii?Q?LmASfN3W+DCIdsss9iSS/7+aAW6OAPu05KdPJoI8IfJzQrkfbxRo3QAiU5r1?=
 =?us-ascii?Q?r/dYXV6r1hLOUb96CXFCIXspPhM+zqpLaeCqwLMSbKvHf16BpURtC+w211LC?=
 =?us-ascii?Q?ndRT/8kTM1kqTIrzUMx6IsWu/EXOWX3EG1iUbM/GxMJPhduSOS6g2Mnpgl+F?=
 =?us-ascii?Q?OkuVK3h3V5yS+sTnCsPK+/dwV2xLju2yFHCVeXnTIhZCR1hmF14MiAFSUV9T?=
 =?us-ascii?Q?wNFZAkRjAAOoulg3PRY11mfN0iPw2RtXkMvU6REI8qr5s7JNUtlIDf6+KoTt?=
 =?us-ascii?Q?X9OUYKmenj37wkm2UYMyib/DXpcq71rQcCsUOS4Havdf+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BFZqQXPYl58iGHOWJfUmssxXYrqijxhkoeNPia9OtM0xMCpVC0fGpKXyAohb?=
 =?us-ascii?Q?QoOIleNWXaooZN8vtsXEzMPih3MlTH1Hlc0JKP9Yc5LpO7KnyimIyCJcYrPM?=
 =?us-ascii?Q?L7XrVj/8qWsa9+bQcl2HHxpfAdfgaczQfvw/ZxgSGmtkVLaKdbYDJeRw7wFB?=
 =?us-ascii?Q?jV4FqCUqe02bTRpVNNZvl0m4H89ZSLjvEhi/jT70efDe4c8AcUIAt/xFMnIk?=
 =?us-ascii?Q?8GnaK5d1SqEnUrkGcTGbfLETunIS/zfU+/bLUxppwWUaIHXP8iVdBT4DVHSs?=
 =?us-ascii?Q?pXAL+KmZ4Q1TGcwHC8jmtplEmy7dZrKmLFqyz9AmcbgRNVwpmmtCydnhoRcd?=
 =?us-ascii?Q?RJMxFjamA4WOrjoQwkMoq6/s6RIP/aoN6ddQLHWHC5d2mayU/qmodIA8yZWA?=
 =?us-ascii?Q?sPl/UTHVpMLUYUtmJvRWTfIv5I5TznffZpy+5h+cWR/dPfqNdWa3aqZGmF7P?=
 =?us-ascii?Q?jctHmrItNESYInTqHC2m7j0paA+3X76Tv2+iyBGL2H43Gs4JHC/aVGc4giQJ?=
 =?us-ascii?Q?tIZw/VUC/3rDofcD/gixqGEkpP5X1IRDThO7+ZOW+/klcOhLRYBGTcohhJph?=
 =?us-ascii?Q?0qi12Q0IZQw1D0J4UH9jGmUOAO0m4inVes8RvGu877+DZRgojKONGMo5I4xW?=
 =?us-ascii?Q?fcv/KbX6ZGeBCIbWtm6U13A0GLHdfa/qIXYZUI5vSQlj9SxnqGRWqKqD/hTP?=
 =?us-ascii?Q?mWVye/mEtiXpa67KiHGvqycxRlDxSpAf6o6jKtN5LCwdSAqMZMv6evuSkzjo?=
 =?us-ascii?Q?wBRdL41dcRCqX7ztAX5rgAU7d5qWhvtyCLDMn5JLpaIVBeWKfxCMrGhVK5lw?=
 =?us-ascii?Q?ir8EDLa+9M296WKaQ6SqOrp2PtJbVv+iItDGaF1bG0vro36FAPJ7xM3upH49?=
 =?us-ascii?Q?Cdg0BDpj89E5iqLwophiCmyY74ZzrhCVOvztIjAkpVwBSJOGy3c0IaKAnUTW?=
 =?us-ascii?Q?TtnrmemBV/6dc3Ybn2rs43kSr2am4U3QTph4o24q5KsVQfvo8M3nhuU8f/Yl?=
 =?us-ascii?Q?w+ynmYWe6zDhH7Ts12mZBZ7VeUe/qkEKvA3pAe5i99/zz7jeFkeQjwmBFAsJ?=
 =?us-ascii?Q?xDxn8qbnori9YD399cjKVD9v2fQS3HLfz6X0FzUcPDEX6Ty1D90eYQ2P78n6?=
 =?us-ascii?Q?1YVO4jNNwOMD2nhdDpcOvXRmQcolrff45CREBBmxNl4Zn+eHx7x5KfY6Kn/9?=
 =?us-ascii?Q?KTVEdukmbDR9ihbo0jYEO9ZcSh3doG2rxjhZI1GX7PZ3tnG7TVlFgExoybrP?=
 =?us-ascii?Q?U2k5MHQ3WnlzdDd2bIGZQjhiXBjW1AxaGz8yQGkS5l0E3vs/v7U2H8OLpT2T?=
 =?us-ascii?Q?9wHj/S/BB+xrl6mwqYoL76HKmxRn7aXpvvJNSXf96dvQL6Q9y6bPF8rnenrg?=
 =?us-ascii?Q?3earTOnIzWBXVNzI6WHbeIEttCTlR/8TbtHu5R2k/rVsgJiNnx0huLsnI0yU?=
 =?us-ascii?Q?it1XWlI41En9H2HMmI/zYt8k1vk3mOZoDeb30RK+xgHFIf5zg313P5+72pdI?=
 =?us-ascii?Q?szET7P+VDr6wtx/3ZTBoU6ZuJhhEB/RbpTjSrRcm1M3ry4RBCHnxv7qWgZC9?=
 =?us-ascii?Q?r9lSn3i/LmJD11yCqV4b9DVIJ1sL0jPXbqWJQDhvo7XVY09qZ2zky4XZI1H6?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2b107c-3b99-42a5-740f-08dcbea86a38
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 10:36:13.1186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSre3j7jhz8Ws9cqqg2MLZS+DcRJny7HRSlX4S6h+NesCzIL1xWLPs1YWgC+r8cRwCSpYa761SPmz9BnCpLDnQ==
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

