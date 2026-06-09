Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C357CD8CAA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 14:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A1E10E3AA;
	Tue,  9 Jun 2026 14:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YPw7yUD9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E291810E3AA
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 14:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781016267; x=1812552267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=owk+mbIGjS0SKVmEmg8bL5nHcINdTmzInofPlUij8cY=;
 b=YPw7yUD9LZY7Ay0tcClMZareNBu7KHwQC0Y22RUy2HU2WldqfHJbhVke
 AQH8rYXIT6pka3px66s+JaLBFT4DmkvqO0CKAaT2o4ET/MUP0aqB/k3l7
 IZjEc5HFH5JxYOFwcGLIIaNFiDnwoUK64vL/HJzb5aR0Lwk+mh5yTY5ef
 qYbSaAiEwSxvJgy4U6OMlOtVGLVz5x+lN1peQn7kt4z9LCk8ZumGRB4vv
 OXF4Xrm/xeDFMPziDb5AhuSP0iEAv0Ii4HaQ6vBKuiTSMuyHBna94FeUZ
 JYnLiYTV8/kxkYy3Q4CtprFoAwbDFYMFYuB2M90i1nW+tK/R85AdlJSsu g==;
X-CSE-ConnectionGUID: wLwoLkDhTCaswJ4zXeK9Tw==
X-CSE-MsgGUID: I54fMUsVQvibENN61a6GZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85401772"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="85401772"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:44:27 -0700
X-CSE-ConnectionGUID: eWa29h7KRLC/l1vz/+rToA==
X-CSE-MsgGUID: 4E7wyhoxRxGrJzFUHGk1OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="249805532"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:44:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:44:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 07:44:25 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:44:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JruE5QiHycI6cq0kFOmsWP+5EA/4sS7KaswBhe82n9dwi+g6hJhHQ37GjpteE7EaXYVn0fnZgpLH2UBAI5Sn4ifbRy6c8uAhjg0omQIYoce9jLmcxwTmvoGOpI12xmjhatghXL7dqf06dOb0zBKYvzDUnTsqJlCvUVjR3zN4VXmNxim+pfSGSd185g/Ft53OFtgRi95YWSEseexHeOnfBm1oy+pZWYOR7Wa6mFmsklrM57AKoCpJ1uhqEIviOg0jGo2dtjIKcsbeGPLKLaUYug9FyEaW0owd6wX6mwHFC91oF6EKMRc5O2mqHmsXcMaVK0W69oF+jVvYUlWSCDR6xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VodBt6ynwQmY8TrnMiOICsCwvCYDXEqG8QQyU3S4otg=;
 b=tko/kEWuYxENSRnGGpGbx+zh1Ujt7vhGV0xhiYeh74AeW2DsXUYvaVzYovbzVtz8hFgbLJNS3yMekgXrxgs9YbDeJBkxxRbo+UnoPv42jQ82sfkGA3Upyy6jDzcV5ada6QPJAA8eLo0B6ONrCyzOKGA487fVLO0PjHE2MWuz9NrrVkHz53fMMTSExCwzIgSL9Q1CUb4UmBfNKy7Wr6yOBUyCwtHKiIrkMwtIkDSHPAMVTtHSo3hQ792qm9VnE8CKLIqa35C/fV1OHQ396PtY2+u0IYhFEdRgoY8zQBGez58VS7NONjrXDnSZF9G3wBmKG5Wt2tEZ0g2Z3Qwmr2nYhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DS0PR11MB7214.namprd11.prod.outlook.com (2603:10b6:8:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 14:44:22 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 14:44:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Sanjay
 Yadav" <sanjay.kumar.yadav@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 2/2] drm/xe/lrc: fix spurious warning when reading context
 timestamp
Date: Tue, 9 Jun 2026 10:44:14 -0400
Message-ID: <20260609144412.244678-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609144412.244678-3-rodrigo.vivi@intel.com>
References: <20260609144412.244678-3-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0145.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::30) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DS0PR11MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: d7da39e5-65ae-499e-bcb3-08dec63597f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: RYrXMJKXv+LFw2w8oioYMa6oMBLLtYFse1JfFpJOGDJImK3c6VoGtZ/0x+whAR7AzGcmMm3FoDQx4eOj4o546KRRawJCokgrTOr+6gCfr2iLTUrd8Ax98ThrWgnWd2vf5nJR7rMDbETElpCgwJIMvMqt8Wk5q8HQR49eoJA5OwJGmRU/RI4FzMl5n/Zocj5n4SNAivzD/EFq83y81sft2iC5DDKVwjU0gqOFqb1HlQ062gwW6PoTv9Hk1L2D0rkWayF15kuuaoMYPjs45TOpMMlQZQrhoSeL2MonBRxLfO2oUPR4QnJVoQiqzcXEvaW/HPZBTxmlyn3dxjdJ9TqQ9F3zf9y9zojyQJxEhZ0HPdBtOpF/FLQMV+l0cWr3vFrkmwgAh6U6HRIaR3kGeXMYf2AnacyX1wELXeX2jsFoEmigsOwd+yUk5uHjQZUAQRSlTTTbY8cvdSIZL1UR5xrCTw9PjG1BlYTnp7YFKtgMhnEDrdksp6aJbOBjTb1gD59RUih6BQEZE4cc3v0RHepikhBqHep7bQQ8UfMx+Rsi6EyVmXxdt4fDNiwmDZBkzZoepUki7Ew2FE/tY4Ygr5xibkKOCoE3YPR5s6nTZsn6lGB5ctY5VYVvstF+aSTJ5oFt3NvPoGqq4z6rDOL3yiH9wZe1eMMl+t3XdK5WpdxmleHxAbQ+fx7XP7E/RMaecy3u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dgjw/Dg5rVdu2KadywxXHUOizXfIMzs0KPRXD0+LD9ocvnU1JNQnHpSLkord?=
 =?us-ascii?Q?gxmZIfVfZiGvFAVbRcJrn2Hys4rLGJXab2aXw4T2oT+6Cv6PhtB4dZFAYaZX?=
 =?us-ascii?Q?M+pjgrE3uCiImFCKnAMR6m2ZI4YQuJ4Kq/96nVrIVhRCOC2NBIqyRd4ql6A/?=
 =?us-ascii?Q?XFvIZTUkL6siozcRQmo65JHgKJ1GNPmKASkkH1zEo+vhWXf7XFOLIcEPEwMY?=
 =?us-ascii?Q?MoobXSC3eytuWq6Mc3mHvbF1NA7FfCYUhtGafHhkQSXR6zOdZskfJRDsNT61?=
 =?us-ascii?Q?5D1WV7/2b4xsjM1UAfNr4b2m/p9gN35VA1zBDDRvvetBjYhc5kEP7Yb2BX5V?=
 =?us-ascii?Q?F3Qu+m7Vba79B0/SsICsqT9qYY7PnOh5TD4SHoIEqm+VxGuoS2mSCCiJ6AzX?=
 =?us-ascii?Q?yMnujceLr4r6Y2LA8HOFOxpqiR4Awn4DN2Z+I2HGp9o3/PheFIpQLxNr1Ssq?=
 =?us-ascii?Q?X2qioYkHcWo+fL0gDpDrqyfX1IlDxSUNVYq7TKJ290IfTH3bzuHmZYER3uNo?=
 =?us-ascii?Q?FcgUCQO/WrOQjRnOGndG9SlIMMUMkMdHX+9hFiehQ76aKKSHl5KVpUS5jGUu?=
 =?us-ascii?Q?XHjXZNW4N7dg4QwGiTxVn9dbOO7+OoxHlY8MMEj+V8grcgSoIzdvgHdOFrcK?=
 =?us-ascii?Q?GFPgrQedQrt4FCwIze+yem5E37B4RSvEclmJ/GuI7EirC425I8L7zvKq2fSb?=
 =?us-ascii?Q?k3HbfnGCH72y3F6hKHL1OJXCQK5JvsU6NdAAyjx8u4kW+ta8bOej+FRJVTjA?=
 =?us-ascii?Q?Xs9MqzHCfAFwNB6fLSlCLNhZGvR1m9tPWk5Ib6q1p14g5rfK4BGj//O+aJye?=
 =?us-ascii?Q?l/vRjpL3wZsUmTT11fRty2+FHChHpVwc0kEcr7DzJI+lwuI9wn4XO3u4YfKN?=
 =?us-ascii?Q?XNZ2nHjVOX81kaViRIOvwbpLC9VWtwhC80FLFXJsJAv/febvTUNVa54iCA5M?=
 =?us-ascii?Q?Pj2KHdSptMOcJA8azUBLJXkhoCLcMFro1TlQgy6BTnOca2s3pqWJz+GNX+ij?=
 =?us-ascii?Q?3Md/At7U4nLCXKoo9/LWkKPJ7XtP9RIOp7ivKeSHjfaMDNRUyXQzJ9bR0ZbT?=
 =?us-ascii?Q?i3knLDhtjRYRe2DL3ltidbFK/1s956kDhaDdPaFFYNhpgBeDRgc9EQXIx8oF?=
 =?us-ascii?Q?LeNWmt1RLbXVO/2n2KkPUaGIiCBKDXzQ5SXCZyAkKML2qOCC0es0f2r1ig+R?=
 =?us-ascii?Q?q2V1mLwAe0IBx8dmM9g4gUwj9RUqkNZXVU8JO+zUiyoU7J2irr9OfFGKEB12?=
 =?us-ascii?Q?4V4BxRXG7bfiVdyO/YYGgcs6fnnJUH+y+HXE/sTN73MlwIngbHBIsXRyCS8Z?=
 =?us-ascii?Q?KcAKVZ1WvVo9opdc2spI86VytMekUTnZdU/jPdB/Wkhz0v7hXPSZc3lboFba?=
 =?us-ascii?Q?h/9FjYDs2wDOGiveupUBKf1tywTt8S96S87ZJfCodp4a36AqUX+dpkoXb96D?=
 =?us-ascii?Q?7uLh69OF31OLsh+5DJwP4U3ZgrnA9vaDN1fqu42mknaWTAdTjGSBJ1o6aNTU?=
 =?us-ascii?Q?oFyhCUNzW681RmZyNBGp7AbslEBN9uDZnSrV+FVoBPB6uqqS4H9THCMxMfFk?=
 =?us-ascii?Q?q7XU3ZiyyU9uxiIVYab3c4DmlMqWHq2o+ks73FN+TrdSHsbOozIF8HlPnyl3?=
 =?us-ascii?Q?VjOqyDZeFYDzd+m83mDpwBQ+5HjDlZTu5jpHbRaTsTjS1fkGQoUhmMoDw3IG?=
 =?us-ascii?Q?kkFeJyiiX2kiEbEQ26xcxZZm0vQgJYDnTzc2V9IrGsGSsMbmFXz1mXKq/KqO?=
 =?us-ascii?Q?qZmRGGPkCw=3D=3D?=
X-Exchange-RoutingPolicyChecked: WhtlX8mjOLMxzfgM8hSs+fKQ/lWruNzTBFtfJwNXOTTCVd/zifa+SXUv/yx4zqG4+u/EwDzBMkBzthP5mpF23K7utc7y26559CyA5cxMYrVcT1jLT3BoVOcMy5VumfSJfPwwkPfQtPzWaih+fUoFzvNTtyJwbc3+AOOjGCPFDzYFQQZuWgshbPCDgLn7Bwyl4KLUCNuLynIw9tkT4puVgY5Jydkq5L/KTuu5GKwLCF59ZfX8teU8c0xjiCJGBipVVIi8eLIRf8Xdg4+p2ar/I5bEsQs7IMAKjIcmoxJE7mufXTZwCoKt38vF7BKzbi/8fujZxI8SBqkODyW+Vl7HHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d7da39e5-65ae-499e-bcb3-08dec63597f3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:44:22.1064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rhkd4nDDama8RbRmWsiz6aWsMultBFskjuEftmDx06sug0rPoFdx92fgUlaOOGsp3lQu0tAjPl2L7qs87WOl3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7214
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

Fixes the following warning that fires during timeout handling for a
context running on the USM-reserved copy engine:

  xe 0000:03:00.0: [drm] Tile0: GT0: Unexpected engine class:instance 3:8 for utilization
  WARNING: at engine_id_to_hwe+0x88/0xc0 [xe]
    xe_lrc_context_timestamp+0x61/0xb0 [xe]
    guc_exec_queue_timedout_job+0x713/0x1020 [xe]

class:instance 3:8 is XE_ENGINE_CLASS_COPY on the highest BCS instance,
which xe_hw_engine.c reserves for USM (gt->usm.reserved_bcs_instance) and
on which the migrate engine runs kernel contexts. When such a context's
utilization is read - e.g. from the TDR path - engine_id_to_hwe()
rejected it because xe_hw_engine_is_reserved() is true, firing WARN_ONCE
and returning NULL, which made the timestamp read silently fall back to
stale data.

The reserved-engine guard was added defensively with the original WA BB
utilization support and simply overlooked that the migrate engine is a
valid, present engine whose CTX_TIMESTAMP can legitimately be read.

Allow the USM-reserved copy engine specifically (xe_gt_is_usm_hwe()),
while still rejecting the other reserved cases (GSCCS / XE_ENGINE_CLASS_
OTHER and ccs_mode-disabled compute engines), which would indeed be
unexpected on this path. The dynamic engine resolution via the ENGINE_ID
stashed in the PPHWSP by the WA BB is kept intact, so utilization for
load-balanced/virtual exec queues still resolves the engine the context
is actually running on.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Assisted-by: GitHub-Copilot:claude-opus-4.8
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index a4292a11391d..3e7c995085d0 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2618,13 +2618,19 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
 	kfree(snapshot);
 }
 
+static bool engine_valid_for_utilization(struct xe_gt *gt, struct xe_hw_engine *hwe)
+{
+	/* The USM-reserved copy engine runs kernel migrate contexts queried here */
+	return hwe && (!xe_hw_engine_is_reserved(hwe) || xe_gt_is_usm_hwe(gt, hwe));
+}
+
 static struct xe_hw_engine *engine_id_to_hwe(struct xe_gt *gt, u32 engine_id)
 {
 	u16 class = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
 	u16 instance = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
 	struct xe_hw_engine *hwe = xe_gt_hw_engine(gt, class, instance, false);
 
-	if (xe_gt_WARN_ONCE(gt, !hwe || xe_hw_engine_is_reserved(hwe),
+	if (xe_gt_WARN_ONCE(gt, !engine_valid_for_utilization(gt, hwe),
 			    "Unexpected engine class:instance %d:%d for utilization\n",
 			    class, instance))
 		return NULL;
-- 
2.54.0

