Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC597C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 19:29:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B59F112C3A;
	Mon, 11 Mar 2024 19:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MvTlwOyV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CA6112C3A
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 19:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710185395; x=1741721395;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=zlu1RWDfn/nNMQBT7TscusInSrYqBmN4s0Nwr2cYktA=;
 b=MvTlwOyVvcFVlYr/8gQgdMXBqd3oXy+r9PNuSoqPjikFWABVZ5fYa88+
 3s17s0AYt69JEHUGhqNQCx5GRkmZv32U1dWU0oRrpGds0+GjNUUbN0hlM
 rdIbkLdHl9TLEfgvGanE7rSb3ClNxnLk09mxb5xZYfPDfDwtB6nmf1XWN
 2ZeKhjoWmr9LkyHewGZqrrI5km5mFMi5r6vA2n0C+nTQj6yuGZb6iRI+r
 NHljSY2Y5pAJPmkX7sJAJpBPDsYgwk03z5PU0lcRizsbJwoifSDu14Dkq
 jJQC7j6DFssrQHU0Sc58eWVdhOBZP/C6c+OvFRF8uDt6pE7aAd5TKLgSN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4726688"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="4726688"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 12:29:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11712215"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 12:29:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 12:29:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfBcr8B9zFcEggrMhvuDYpLFjvkbaaIEvWQwLrAh5S0sYADvCtEC7oOdxkvYYgT8huUZ/p4OYifgAr+QBVP6fVEg7+bijmo2hPVKTp4qSQlDIhxq4mmhDYDMqf3hQf2jIH1ZuyI4jBiL8tSS47pW7fopH6BACVW14O0x2coRPjzZFR8kPtW4iLJqrJXFAMb73kX4kHRW/CxNoTgJoILyl8Jo1lu/N88zoYjn5pl8VzGW2dSlHyEyVpwEo/ygEm8Ygmewt611sc1O/8N569Y/h8yXg+tm2pR/e+0EqovYFZSkBirbWxGhwyztDwj9NWUk19aRKpGQFOhq/vQhgE1RPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuNcwmGliE5s4pR8T2OX5oSKXcK4n/S8N9PD+v73ang=;
 b=BXShX+/T14HmdWcdRE1kyLa65MjLDCwJuwv3BiPGZHn2TsI4bF0q02WbfoUBKNW4Ot6FHWb1XNup7dgKAwwGbozOUzGa8Feb8XriiHBhqTysdLLhxXdUOEzD87MWYX/ucSi5gYFJsSuWBNZDGtopmvYzuYAKYF/sjxGDfGYEFBqnyp/BL+5rEnYCt6C2uYquIEJ15o9zBW79adTQ0zAGUd26ckm5HDKxkN63TfF8sHQkbHE3b88LjOmygXHtbMrTziXhxq4l3Vn24LinXdFMZhuSevRdxusxH+8pIlhUx20PqIpmb56JY+XZINgfqRUyamqnS6x99h5hD2pmFyydSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4822.namprd11.prod.outlook.com (2603:10b6:510:39::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.14; Mon, 11 Mar
 2024 19:29:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 19:29:49 +0000
Resent-From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Resent-Date: Mon, 11 Mar 2024 15:29:46 -0400
Resent-Message-ID: <Ze9bqrsWYwmjwVRK@intel.com>
Resent-To: <intel-xe@lists.freedesktop.org>
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 08/11] drm/xe: Removing extra mem_access protection from
 runtime pm
Date: Mon, 11 Mar 2024 15:23:00 -0400
Message-ID: <20240311192303.33961-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240311192303.33961-1-rodrigo.vivi@intel.com>
References: <20240311192303.33961-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0012.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8253:EE_|MN0PR11MB6059:EE_|PH0PR11MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: 57eb59dc-8cb2-4add-0aaf-08dc42019e14
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a59d53b-f09f-4678-f93c-08dc4200bcb9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:23:31.6290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dneVBUi0mAicTineUFwmbg7fDZDSQCLT6yboukDvyzQZh5gI/HfhmEX/GkTQEjZiT+4Fxt8GMMwoYNi94uP6Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8253
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.7484840
X-MS-Exchange-Processed-By-BccFoldering: 15.20.7386.010
X-Microsoft-Antispam-Mailbox-Delivery: rwl:1; ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910001)(944506478)(944626604)(920097)(815096)(255002)(410001)(930097)(140003);
X-Microsoft-Antispam-Message-Info: vrsPcz5fnLrczFcJcXZ8YjqDgXwjPGgxPsBfQnGvLdPecDmfiE/g8YYiy7C7mPhHTDdgB6laBIaht9PzMDqs2ZfR1u/O8j/rFnjviu6Tvz0NTR/NmXC562KCWEfxgdj4RuXW1aMBv4oPGzUnyTAKvvFAKX0P0GvggU13pdzJTMDZyV96wgvg+ibVHxUlnMF6NsE/vREPR8HkG77ig5q/jWu2Q0Z/r99ptBsZRkB3HseOlcZu6iTBIt2Cn46ENM/kR1NTYGRLur/MFFq/Fr1vDJlF7jHgka0nqZzqeOTDWe0ZHxCn2s1kbtk1JCrXviYfG/7TtHQDii5Y6aDMHRAuJINazbts33e33Y8tr35/Ua57VV/XZx+thCoV+hvts5ddXwWs8CBAU3ok8oaNeDNi7qCUQDWg86H+xe6Tf7eXzMn4gVh1KsGbw8vBSL7Fi+j52PD00ymUQ9V9trrX/CuHVjJVRjqYxxo2ExCC+Lpp6esm+2jnReYLjrUcOb/SE+bZzXVU7cwYkMq2lvkTaTQVhsg9UYBRplT+Yx5IQw6kFLEeEi1upXx7IuHSDZPsrs6hUTWRbc0OV3X6eAD25Ctj4M9R9BbsL8+h9bdzpZrjv2R1VwoUnyK4GCpfuBWtaXtxW8VjCodnN/3ggaZnHIzv3h5TDsXbPASiP8eLB9nJWCc=
X-TUID: hgWLGQZfe74B
X-ClientProxiedBy: BYAPR08CA0065.namprd08.prod.outlook.com
 (2603:10b6:a03:117::42) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7a59d53b-f09f-4678-f93c-08dc4200bcb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2DANqVMXih8TnsUzFqb8JhvtoauRGQ+HoEED8g6NkoZr/4zfrwHMdYDznv4K?=
 =?us-ascii?Q?ghOadFXpxiskplzk94u4s6pkIThXZyx0KK96mbShZlEPQ9Gm7Xn8WBvs0XP8?=
 =?us-ascii?Q?3iVpNnJO4e6YIjSvIDvG//wKjARubZUIbyCB20Z9YNo8Mxyp/g3XvnAqMIp9?=
 =?us-ascii?Q?TwYj8nBYFZ1QYmR4K5MsDv1zQMQ7Dki3dywVH4AV2j55a8XzTfVe7y7l2trr?=
 =?us-ascii?Q?21VJxm5V96YcuCC43jKiHvN9lVGBX5NxMuvbltstFeXaHChdrFoVnmnHNm/O?=
 =?us-ascii?Q?BA5ce3kctIwsH32WMpgsxqEj9146Yd9Rg/jx82teStsLarRR49r23OsGsTK9?=
 =?us-ascii?Q?j3C+rCK2BkNTb9A8De9uNPuQAtEjfptn++BVVcY+PWXCs71GishDpCDOIv/v?=
 =?us-ascii?Q?WdeL7JObBLELYqrER2euz1gVFmOVkZgPDVSuqo9sBXB2OfLv2GZetVCATPnG?=
 =?us-ascii?Q?AR1d6cun9MzeSh82zxGXfbHFRWjBZixtE/kcMcCDDrtUbF5JP56mO53jQWlU?=
 =?us-ascii?Q?c1RzNwTF6IfKg3SwmwfD06dHnhUvdSue0LKw/8ok3jk9sk7sem6VvyfKxrTe?=
 =?us-ascii?Q?vn8Xrrx+1cn6s/Xou7stVZM2firhHoLID6reE7I6Eij8D1yBfk40zu42yl2l?=
 =?us-ascii?Q?hcAbyEJDeXbKJr6bHZ7PBpBfIl55/5rk+5KnLMM3OQsJvWvP6vZn9jBVQc8p?=
 =?us-ascii?Q?kW3JRbzU4krJyrJCOi+lFmD1bzrwbtA82wxRUgYtMn/UrJpzQ/2+LsRyYEOw?=
 =?us-ascii?Q?u9WRO2O3Crd0o/CA0Dm/+8sn6rM7DhXE/kW4I/sjg56Q0iX9D8c3BXVLRZ4h?=
 =?us-ascii?Q?JowRaV/bKCHQcFG65epWR456N2iwNH2Gk242fVumZPFx35OYQV3A6gJDCvBL?=
 =?us-ascii?Q?gacyV0Qw54lVJBZL/xUaObA0PCE2Rqn/z4yIpcY4v31UB7WbLMu2RkX1MpQJ?=
 =?us-ascii?Q?PhVjwumKFY23/YeugQmVs1Trpc3JMTLxjvnlN/gWzKL/n8YYLZjvY/q3FKPB?=
 =?us-ascii?Q?UOM4VfOUDOZqr31ucUgKt8J5ycdiQSRd8y6Kzw5SXlcNEio8LjydaDoNBa3h?=
 =?us-ascii?Q?ylDjxxE0wL0eObA+CcQGN3C8xsYwS/RrPpeUtwmKcoEXhey2sA4UMpOfWTDE?=
 =?us-ascii?Q?ywnZcw9wGHyw5KSB41qsTN63T/JV/FOR3XShFMGVeh0hPSTJ/JIjaWnq3Vdb?=
 =?us-ascii?Q?mNtH7gYLDdDLd+yAk+U8Ld8VboSwlYER8ZovtLTu/jRQ+CiTzflNiKOV5/A2?=
 =?us-ascii?Q?9qJo3KNYkXHkk8dGW0D/f1Z2Ap689AIhFnE0D7ddTUjaxF4DD/OT48qDxQ2+?=
 =?us-ascii?Q?T8vxTtK4hqpKW1MpBlcwBdM2FSyJGHVIYEaKm58FAP0Y+47ojfvuT41o4fzz?=
 =?us-ascii?Q?CeoXDy5alQtvt6pdaH5m3HBsAvav/GGpe2fptG7lcCOYNL8HyTZXfk/ShvwF?=
 =?us-ascii?Q?BGiacBbGJXuJyO2FNWqhAmM/nzHGKBE+jV5vQBtbAMl6W57v9+4trpdpxEyY?=
 =?us-ascii?Q?4wms/+ZZ929zqttNE7djPaPX6A5kQmzGrwkg3ZK+jrVfQ+mFUVHJTHfZA4cq?=
 =?us-ascii?Q?WirB+hSBNsER6fKyGC2gmhbKgCTEkud1IZUIVctP8MfecRHMHzNSAa//+zWp?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57eb59dc-8cb2-4add-0aaf-08dc42019e14
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:29:49.6329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABGgFfVitBb0dzZBR9103mWYduwqTweG8BeS2NCboZvEmEHU5QKyLpg7fm0W41Dl6jBi4Z5/dvRRFi6wy2uwqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
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

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 --------
 drivers/gpu/drm/xe/xe_device.h | 1 -
 drivers/gpu/drm/xe/xe_pm.c     | 3 ---
 3 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 49a413725c8f..a9128bde85c1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -639,14 +639,6 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
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
index 2653f53bee4e..2327b6c0ae6a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -138,7 +138,6 @@ bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
 void xe_device_assert_mem_access(struct xe_device *xe);
-bool xe_device_mem_access_ongoing(struct xe_device *xe);
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 393f14411ae0..3e92f09b8d83 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -296,9 +296,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	u8 id;
 	int err = 0;
 
-	if (xe->d3cold.allowed && xe_device_mem_access_ongoing(xe))
-		return -EBUSY;
-
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-- 
2.44.0

