Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9237C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A654A10EFDA;
	Wed, 17 Apr 2024 20:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nx/STf+A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2C210F63A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 20:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713386420; x=1744922420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JZuzpbtVObFYtE4G6AwIKRwg9j9nXWdm5egmx5cUiRQ=;
 b=Nx/STf+AiPtVe2HI4StHFNzfN46ivhUvtix6dzvRmZmt1kCsIh2R/a6K
 W3GK0cqyzRUPHyyJNZjDSkS5oVnOyZMUFJG4FeV3WE61YR495NN9e1mzF
 2cb2B5N6vKUrgoCK17Pg4r773erOCxtTowN//Rn/OOcLxWqgupryjaBNx
 gpNKh6TokkUTF/Vnn+RVCKFQHzEJiL7GJRs3h63AoZLQ/GiDOkBrtamDg
 39Ie8wDxuMjdDaaIvV7Xq5mY5xfAOQQYWsjIt3P0qWS6bvuUzR6xcaoZG
 NNPHXQn1A1ALYN4KDQkVQMC6XqIpJVD3ZeqOa2x+f0+QhCiwUk53bcwhA w==;
X-CSE-ConnectionGUID: n9CEstNGRSatRfsTvgsktA==
X-CSE-MsgGUID: FvgOQs9FRUOTkzork9ZM+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8764236"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="8764236"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:40:20 -0700
X-CSE-ConnectionGUID: egoHfY+7RECrO1qwEXW+vA==
X-CSE-MsgGUID: g/pceYwsQ1yl+WsQ75r0Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="27375824"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 13:40:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 13:40:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELvqxAG7u0FqQhACayHKgWu3b4MzMsTvFNpH/YTDg7BGAUSH6AdzV3Nv8BGiqHFT3QZF8WZMqmLoOm9rpLTbHoX11pkKE/RJc53NLZh7d2PWC/A7/UCTRhs+7852DMuajfN6PRsBujibWSSKNDyk0wFlKKt8WmGf57Wtlhe+c0mtt3ZdX6EQMx3lD3T9ZPWJBnco2F4twrJW1ChH/rJ78bCVBloUHpJ+TvGlvQ2JSaQJDRVzmZY7NJKIN9ZjHzLF3h/7ALEdEYdYS+pHxMsXeb5rRBmJkQgWHx6pErLpNKoDvVyS2VjXQQ4d9NucLhM/yo8rcLUfIVH2pTenKeff8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/omO0qdTS0WK1vh8+KwH2KL4oFqGnmTqedAMHiCVWU=;
 b=eTvyMayqxXpthA7HAXIUQkCq/DX2sVNqKSemGwe15MFI0lREumDuH0qk29ybX4/2u0l/pR400rJDInlIBjJOM0CLoaKNk1WLcfDskht+5vRtlib0MBKGN8moPAvUdUfQXhBqYrm+ruL9c8mACcA/izsb+DZyv0bO3zBrxzoFQatkymr678Bv1SHfvS3APghAM9LXsOKyK93g40MJuCrZ806N8eTPVpA1Ihon0wrNLWB9L8/fP6Cks9Twf/ywMSui2xdwDt/sGA8x9W3piQ4LNHcpyNqdi1u8pidvZhWho0ScqEFFuU/i64RoRAo77XFCdYCuo2oK8o/WFoJiLm+eYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4983.namprd11.prod.outlook.com (2603:10b6:510:40::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Wed, 17 Apr
 2024 20:40:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 20:40:18 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [CI 07/10] drm/xe: Removing extra mem_access protection from runtime
 pm
Date: Wed, 17 Apr 2024 16:39:49 -0400
Message-ID: <20240417203952.25503-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417203952.25503-1-rodrigo.vivi@intel.com>
References: <20240417203952.25503-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: cc875632-9884-431d-c2ee-08dc5f1e97a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8iRnitk2goc9it2t8RW9KeRoRc4+2u/6ShK/wLQmorV4hLGiP1rXZum8vAefm6DqcTwADFAYrI0vlNzxiZEoE9M+gvmpEeQ3w7/Pt4edglOBxd9n0JCD2re6eVKMNzkWuQ0GcZZbjrZM2UqwSGtPIXsU+o6rhU385QJ2pG4f44L4GGGuoes1waXh+w7nm0r0VGH6cYt91T4RQvNvArI4uQ7m40V6oN+5WZSOVaUf2MxSLwOq4w4rwnr/6Q/XfgWT4ylWneBg3h8YTIsMVzypuQgcccLBEkLY63+AM3aHdQt13AamhmNrJB9MoT3DwT7U+g4802WBb5Y1tIot/AFJqtQk6+O07c3mvQuNkHxATGmeybg2jMNn6o/8rFy3zSa2acQkzZOZTP4LlcukRyyuoJ/Dw2VZC2IyjihUUeLv5YlMn/H1fihwHj5X8XKSiYkbIPRtqKXisXLXhvPb2cqRAgaLeHLj0P7+P5CDmvAcZmgfvtgrKYyyXXKG/lpmELek5aO1ZKi2/5YWmmsQZFcyyVOX74QMIZxY266F4lXUcQGYuYHjtAmu5GLJMzsfcZWzuTwQmy/JvKcnSUbxFdMaVsjfiHfcVMq7Pu8QwNTm1TgtAWD9GaFG9D4eULIV990wJZ9Bw/f3q+zFtKhLYyYaBgnMSuLezpRFbaR8D7HedoA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0EeFK/T7L4HItMflBbSWNYDaBE05eSInXN6nasYKf18wpuoG7uSfnwmPok0k?=
 =?us-ascii?Q?9q/gEldvelbteVBNHzv1c/tPuoMOGKDda5BhrFXkUM65FiEWczLk4JpbFJgg?=
 =?us-ascii?Q?xPmAo1Hw1bMyFT/bvCnbkgVzWJQxKsJZH7piaNmIvUB95sidBT+LQSMsZ0Xj?=
 =?us-ascii?Q?S8zVXUJ3lvYnd5Rv4VYA3BmMTt9/f9uqwfnDDaFxWfwcnMz+rpsZnMcsOf0A?=
 =?us-ascii?Q?V5N8brrX/EWJVUP193ZM4Wws9/5jQPOV2/aaxSE3CrZDJQ1XHuAnC72f5Xwl?=
 =?us-ascii?Q?9LHt5CMA4djm5Ybv6TP3MUYgy/EIGCyHmxvmZZBvheEGx1sYzh1IdHRywy5e?=
 =?us-ascii?Q?y6ZVFPI25Ohw2Ksz4UODe57s6u38St01PmIucL8CyUpfAQZ9wBE7TiSApTNY?=
 =?us-ascii?Q?6j0X5unOk+/bnlNIQdcbR+K1tVip6I0JTZvl5k4HhW0z1j/2I7GytpyJHa/B?=
 =?us-ascii?Q?DJr1ZcXEfzEwyg5rXFEy/CqGODfhddw8zC5LyOmcFmF9F8vS+fmFzfmmkyRT?=
 =?us-ascii?Q?4upg7JV8C1iPOFSzydaTXU8LOg2x8xMo0qAfyjG3qpEjotD8mEoMuW+FgeX/?=
 =?us-ascii?Q?m9/htp53veurBca1/Vg2QkJnLvvNEVcAy1ZjiXrAso3SF0LqBx0AfYRnL6Y0?=
 =?us-ascii?Q?mLGR2I2AXg8MieByfrzOewwqf4nzyOxYGjCVbxBSWPue7SKDHl9Q/wb27pgB?=
 =?us-ascii?Q?eIqHchIXNwiJpolgkkpaAsZ0430NQW09YOYpLkTAOGPpYu1Cpq9mZzI7DH+j?=
 =?us-ascii?Q?8lceXmgxEvuXgCrmdbUJ+Ck4BcheXsOLD2LAKrn8fuRjYdgHsiwCaInNN9M9?=
 =?us-ascii?Q?LIhyQQwnPiMx+RjLqwXBfkRpcWIEjq7RLRPNMGXF08iF0PPJ41TuvjODFfSi?=
 =?us-ascii?Q?CvPzoVEIVr5TOeaSgxh0bx13gthl5SKf54QlrRv712lsFtxKfMzFjMGIF9MV?=
 =?us-ascii?Q?q3fxijbASmADzsXxGuCv9+XrLJjVEtqSLKjP5yGyeA/yo9sLduRW0wNhczer?=
 =?us-ascii?Q?38M6tO0mhvhy/J1aITfFgT05CllCvbWV53sPPZ0yaTRuPq3g+H12lJyOS0TU?=
 =?us-ascii?Q?0SI4ONjoOPV/19cVTlgLO0oYN4llfHPIOn0jXBD2TnpWiWis3DOQKkQaWRVd?=
 =?us-ascii?Q?OvHmBUuLy73ZVxIzKnWcdJjf6R1egSkRHL6Mg0SHztRvUDUeR8CSs6z7akv2?=
 =?us-ascii?Q?VT3X8LzozH4GPN2iKSntmN0wZwffr6SpLA9chRM+NxzczPP0u4SHblnCwVnv?=
 =?us-ascii?Q?I0HxhC8QZqFr0rYSqMuTfPKEpP7kjyFZ+nPEnEjHNXOnwG4oZ7SdDOQDKJqc?=
 =?us-ascii?Q?iOQatRTZIUFEO8yQKgSz8P0tqTc3cG0QD3bqD0LFDv1kYckBsEQnoE4UeekL?=
 =?us-ascii?Q?UqFifY70d4oxcX+TjWXqWKYwqABrk8BTHzPEOTzWDFsuDelGNJo4P0tENZFg?=
 =?us-ascii?Q?USxvXBNKEF2AngDYseRzsY2rQ+Xy6d60DfTQIM6vwtchl3U1G4NA8P6mbOpC?=
 =?us-ascii?Q?nJIhdV9he+lyxm+Zs/UsGm4HY3gddRJGiZt1rgCAlTxVYhHwiHTbGcZa0UEr?=
 =?us-ascii?Q?NllPRS7YMyMjawcD0b1C+/nhPRFSAN9IFNZgju3gc1NbYbJ/61Zv0EcAFi+k?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc875632-9884-431d-c2ee-08dc5f1e97a2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 20:40:18.0213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLiulqtoXNzMj+veUp2Te7YPb2feguHFGB0TuoQxl3SWYJl11e9PmlEFXkpcb8Y3/0FRkzOoGeZqVlbUIuKUaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4983
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

This is not needed any longer, now that we have all the protection
in place with the runtime pm itself.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 --------
 drivers/gpu/drm/xe/xe_device.h | 1 -
 drivers/gpu/drm/xe/xe_pm.c     | 3 ---
 3 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4b38fb78adca..1f8f9018b27c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -717,14 +717,6 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 		DIV_ROUND_UP_ULL(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
 }
 
-bool xe_device_mem_access_ongoing(struct xe_device *xe)
-{
-	if (xe_pm_read_callback_task(xe) != NULL)
-		return true;
-
-	return atomic_read(&xe->mem_access.ref);
-}
-
 /**
  * xe_device_assert_mem_access - Inspect the current runtime_pm state.
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 02eda6610972..39921666e1f1 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -138,7 +138,6 @@ bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
 void xe_device_assert_mem_access(struct xe_device *xe);
-bool xe_device_mem_access_ongoing(struct xe_device *xe);
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a1a13d17aa78..0d5fbd715a25 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -306,9 +306,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	u8 id;
 	int err = 0;
 
-	if (xe->d3cold.allowed && xe_device_mem_access_ongoing(xe))
-		return -EBUSY;
-
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-- 
2.44.0

