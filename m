Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92ADCD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 15:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB7A113707;
	Wed,  3 Jun 2026 15:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SHsAHu/o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16305113CA7
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 15:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780498881; x=1812034881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rimv00Qiy5LsddgEVXOIzPy6FWWaYayAEyR2lxdnnCY=;
 b=SHsAHu/obAWDGgGzrcbkqSu4AwBQxV2cb7od1W4/ucluozK4tYvLoV1a
 UasgBATpGsxMjncGMBDX4K/94whwzZK1oHIMTiU3jXDwHLC7DIAYKOoZT
 nvD/fSSGIg15eGgYshEmn/XwU2km2Cuuvd902Z65ygUgGHNWoGVgLBDIP
 VV9ZDUaA83aFuz0f+VGCW98Vat84t/Ksj98xkNY+VOqd6nZAnk+bvP4qa
 h1g1tw9JVtwJuP96Sn5xa1I1tSFnI2Ih4uvHZQSLzr1NWOKdNMXDrHx5b
 /sDYnVAtH2AGyg5BETDNstRSTBpJQtZKk3zPeD3pTAqbyyzC0Lt1h5HxI g==;
X-CSE-ConnectionGUID: eL0gy4xwRGqwQQrl044n4w==
X-CSE-MsgGUID: PKMEJQY4S2y5AfwZ5ExDHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="83889315"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="83889315"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:01:20 -0700
X-CSE-ConnectionGUID: PoIRi+jYTaS0ZlP0jnOAaA==
X-CSE-MsgGUID: FxIml8dvS2uUG+tfU9RlpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="243200258"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:01:21 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 08:01:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 08:01:20 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 08:01:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/lbJse1Hq4BtJMoWIsX1fEuP1m5agOyAsByLoRkfBJ5KkhV4XITEw1hkjLXQF2vhNfbereMAYtK8s9MtlUB6DwLcRfpFH1cZAPoHrnwzsVhRsx9V8KKmu3+BHVHdSMjMa8HrZcNcTjjd28nBz5WK96TfP8YFOEkcYV8zIL0BAzGzMEhn5kbQ+wTNc28CYIso1lsl7gAVJvjqvElw8lGOXgqojylEkN2d+AXr3UPNguvz7vGOn/x7bq96UmNSeIVI2+ioJJKRUqimy7PdCgIGZM+vDrQW+Y7xDsqk+bQKaa/R3MkfwAFFwzfrELchIYozeBKuPErvfGlDqoV3ITg9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMvXwaaYJOOkYy9GUc/u5Cq9WQ6vajmL8aLzL7gNRxg=;
 b=IP64Zbh4FNs1eLwTigw59EGhSEeT9cvef0xf/oUIzVrw+a5VXbJI0NSamDVJOAfDQcs9ViSVnvtlulNYc7Vywhw7rxW1zZSlQHr70IvzNMDv58t+tI+hEkA0SeL8RLtDckGsZStLORjjccj/Cad5mrlMPBT4OvAtb2AgeqnrOsMIFUaGqNgo1x7I2S/dsA+ucrzi/aIvYVlzF5Oc4armsDOD0oqyYlKI3R0YKhtQi25G5ujTzb04XcGPIRzauoU3oIembRcRts8A4rmRYq8HDSn/+KEEKhGVxyyekpvrQAOqXHtt/cRsvlyp7G0IDA8b0LnWXdJMUIeQgaQEpHOAIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 15:01:13 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 15:01:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/3] drm/xe/lrc: remove engine_id PPHWSP stash
Date: Wed, 3 Jun 2026 11:01:02 -0400
Message-ID: <20260603150059.157355-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603150059.157355-4-rodrigo.vivi@intel.com>
References: <20260603150059.157355-4-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0095.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::10) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|IA0PR11MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 326b227f-33dd-4e38-0e59-08dec180f443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: wRTtD3tkO5H+srL7eSl9P+198kbI00zxHBLJtpzurUX1fytNqqTN2St/rrb45DmK3gX1GV993pa6uYlRL7Pw4FypxyLziokUyPXkMlh7OjkIsd/MZQZ9beho3zRIDDEoxQ3ykIr8Yb62/TIl/wc0NTIDrzFdmK3nUSWiw9KSdYXZLtzrnm/PPqpYdFmoBdMRWPjNloS2lSwHiX2S52hqmosgtwTTRvaVQtH+5lTXE7EP7vgi9KMZCZy17FbOyZuaV9l+Lg8HIBmms7djq7QDJBIYdlRF2ogEIXUQE2bHG6gxFPvoucOlNmyjhCRP6uf3bVBnVt1GsCGR4M6Y2z2a16+CIR2huYZJbiOEnVfDR7aFFr1dzu1eXScQPC6DL8iVjdQntwL8s6pgxH13PGx1tnVN2yNYkXjFSZVIR3dBF6MwJR9SY+DLv9+YHeSHlhlJJ8PYwN4b6qH/peT2VZogmWXW7Q9ZxD9gzymqAHhUYBaavVug6j7wHRs6APht6Dcdakyc4OAQlHkMoVOP1RhMEKbMooNiX6WI2++jAWiD9e3KHg5Uuf7I1BW0384Rtp1z0jf1CLnSTzwNmUOjMVtVuQCWcTxPmCQILbut66gD7a3ZFU3gLbTFNDYZD/t4a1VcxG3EyTOTeV3Vnd/xxB6SYBJGjCP9+7pSWYDGSdyRgOu2T3YEXmUMZWLYfJB/RFdo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rwue1auXfftp5HavJ+j2erJhre0CMlMvCHrDm/3E7tgO95Hn+5fTCnTn0xV3?=
 =?us-ascii?Q?ehhK2UzhH4RbPH/2tp9unfaSKiT4X/J5KviN2SZQF0ne1gSNbI3PSQ4bxaZ2?=
 =?us-ascii?Q?Iu/Cyh/Jqk0j3rbGY7vSlqiAtLsLVjBnnDHA78iI5rhQLEsbA2/11kJD2J7N?=
 =?us-ascii?Q?MnRtmcoo1KReHhUw/aMe6jGlahyPBI73Gp3FhrLukQv75JkLc0zcVJ5JHQpb?=
 =?us-ascii?Q?aMtlSS62kshR6+ZmymoRuZ3FGoH6mD05rRA7JDkqiehBzbYBW2UaCyDWYP81?=
 =?us-ascii?Q?4FAnm3i/Esad4wxsC9ztb7UWHLWvNINz+pmz1GL5D7Ad5BfPdY47Rq/RPlEF?=
 =?us-ascii?Q?mLsfzAg5h+D51vYWqONxEht7/ZHkzIrYLoBUbZrQhD4l0y/hG4aG268WL1WC?=
 =?us-ascii?Q?sb85bFHh6qyiP61E+8BqJAKq1yPg38TL7oKMl3hF2kVwGuWfB38G1G3/PWqI?=
 =?us-ascii?Q?849oLrXXekOchy3dg3UgFAh2vyl9FKaQw7K6rWOIv6Gx8seb+3wH71+79e+P?=
 =?us-ascii?Q?eViyJfRgJdeNeEAFdBth5iTnjsd6KzzTHkVLYfw165piR+GXcO0NvFMsZvsY?=
 =?us-ascii?Q?v0+9vQNBQjzU3M4YTBwE2VS3qmI8JpGJXvPjdQjEYTo2cu1x4S8X7hkNFvRc?=
 =?us-ascii?Q?GOmWwRVkg5k8li4zPYL3ntcpvMPPR9vKQfcXRzIfMligHmG/NGnGVbf0bJ0Y?=
 =?us-ascii?Q?oPpgo9WIOxAODjlEhMH/yO9QOzDgR4/uGKbg5XYxAgfCTOOcZclacUiEr1sS?=
 =?us-ascii?Q?z434SKqEK6gHwbG5d8TAQujiT1TmrhP5d9fsszKWCB9tOKxKGbq9nRTQkXi2?=
 =?us-ascii?Q?I1mkW3nJlhepJ3gSfmGLADuenmAtndYfCHbSYIL41UX/cefMGoP8QgnvI/j+?=
 =?us-ascii?Q?K7ZmSdZeO6Mdt1ew6UBMu5Wv7CEcq/stJpCGa08Sk5OcV8wnn3z/t3VpJzMW?=
 =?us-ascii?Q?oJD4V1eFlcWz6eY7omuOaX/m9wIzMXdeN4OwEKJU+XZIfq2zoYuAHxUUwiUs?=
 =?us-ascii?Q?X7QRjQ/NbKjmEw7GG8Dun/d30S+p0Z4VpZJmW7EX3KLkjrvr6AWMPF8o9VM2?=
 =?us-ascii?Q?rxv0NtS3fz7BdNcCZrZVOcSjayHPwW9/dhNUmhd+I+9hMGMe/PqooYx6j756?=
 =?us-ascii?Q?vwbgIrlAtzl9kwtGGeFAul+yso4eXfRlAr4iFFq9v7VVIk+bQO7+paGJCos7?=
 =?us-ascii?Q?VXvRVtmtVhg9ThMYwdDWbwZyh27gU4JlW3QptfuF9R+1M9eXizGUgGGORRAd?=
 =?us-ascii?Q?NLWacPvov7g9o8UKfbEvO/ao8nJy5fcT49asOWCh/H843Rqx1Sb9vKcV2DkQ?=
 =?us-ascii?Q?DHBM4Zxe7/Q1TWraY0a6BCtDawPl2Yj7FDcf64HxIZKiMlKeNgpmbYq3Gxz6?=
 =?us-ascii?Q?7NxU31zq3pVuQVpcv0SMGlXRT1T4vR+hzElROAZ+00HZ/HfVeDwdpDVWnkmx?=
 =?us-ascii?Q?9pIIHf8kCfsURfJIaTmlnqUsR8kO3Kw0UZmoi4nJ1upR2wKcuPhJ8n6obCRz?=
 =?us-ascii?Q?eWh0LtpZ6Kj5sSI/LfyYADvD8upuR6NwJv5GEtn4t64jJZ40Sex1OZ/VuasR?=
 =?us-ascii?Q?knnbV2lN+949gSnW9wdNRJdyAuyeUNKkbUtWfAHLapN1qYdlFhHp5nonExdk?=
 =?us-ascii?Q?hZHVaCsAhMJPnNB+0ULJh2cVv1fdbDE/zg3kQLZ9JfssMnvL5v+avMUBjK5m?=
 =?us-ascii?Q?lN1+KNjYKeOPVWP5dflquI2kB5/z14ukR2SZt82NNpqrq7Wkf2BnNkJsjll6?=
 =?us-ascii?Q?qubRBlScOw=3D=3D?=
X-Exchange-RoutingPolicyChecked: nWwc2R2pxJtNYebIm7oCy2SBH/heKJaK6qzTOjo5FWTpRm3uH3HQF13v1Blc3KnmDrx/rX/I4AgsI3Q9MWUfNcDDAKieuhHpx/cMY8PkzLqwZHiq/t3ihf81jI/c6bcPEq1RXDd7S45/7pHUXMcUmiY16+naLct+8axd06IcuHW/fAC4jhjs5hqavjwpJRETaIEc3tox/0BMk05aJ0VOJaBBvThLjz2ghHp2ElcSwHctf5J/0i44U/bVTOf+GAOafdmApdqh17g0NMK74vtFxPJjYzXlGs/khqd8pv9zBu/6x0tXj9L+weNOAsxMT+aT3Z7jSxgTo4L+wv5ooiE3YQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 326b227f-33dd-4e38-0e59-08dec180f443
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:01:13.2838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iaaoFUe4N759VJohTPGbAybO2R5DNOdbsKcfEN2s8LrCFEdbSH36ZgAaFMRcnZEf/vQpEwqxlUs5OPZFjD0zsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7955
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

Now that the hw engine pointer is stored directly in the lrc, the
workaround that stored ENGINE_ID into the PPHWSP at context restore
time has no consumers. Remove the stash and all supporting
infrastructure.

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 48 ++-----------------------------------
 1 file changed, 2 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 9b58ba19d511..15a76f001ee1 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -704,7 +704,6 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 #define __xe_lrc_regs_offset xe_lrc_regs_offset
 
 #define LRC_CTX_JOB_TIMESTAMP_OFFSET 512
-#define LRC_ENGINE_ID_PPHWSP_OFFSET 1024
 #define LRC_PARALLEL_PPHWSP_OFFSET 2048
 
 #define LRC_SEQNO_OFFSET 0
@@ -763,11 +762,6 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
 	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
 }
 
-static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
-{
-	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
-}
-
 static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
 {
 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
@@ -836,7 +830,6 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp, lrc->bo)
 DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
 DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
 DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
-DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
 DECL_MAP_ADDR_HELPERS(queue_timestamp, lrc->bo)
 DECL_MAP_ADDR_HELPERS(queue_timestamp_udw, lrc->bo)
 
@@ -1091,10 +1084,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
  * (2) Calculate the time that the context has been active for:
  * The CTX_TIMESTAMP ticks only when the context is active. If a context is
  * active, we just use the CTX_TIMESTAMP MMIO as the new value of utilization.
- * While doing so, we need to read the CTX_TIMESTAMP MMIO for the specific
- * engine instance. Since we do not know which instance the context is running
- * on until it is scheduled, we also read the ENGINE_ID MMIO in the WA BB and
- * store it in the PPHSWP.
+ * The engine instance is known from lrc->hwe, so no PPHWSP engine_id is needed.
  */
 #define CONTEXT_ACTIVE 1ULL
 static ssize_t setup_utilization_wa(struct xe_lrc *lrc,
@@ -1107,14 +1097,9 @@ static ssize_t setup_utilization_wa(struct xe_lrc *lrc,
 	if (IS_SRIOV_VF(gt_to_xe(lrc->gt)))
 		return 0;
 
-	if (xe_gt_WARN_ON(lrc->gt, max_len < 12))
+	if (xe_gt_WARN_ON(lrc->gt, max_len < 8))
 		return -ENOSPC;
 
-	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
-	*cmd++ = ENGINE_ID(0).addr;
-	*cmd++ = __xe_lrc_engine_id_ggtt_addr(lrc);
-	*cmd++ = 0;
-
 	*cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
 	*cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
 	*cmd++ = 0;
@@ -1930,21 +1915,6 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
 	return __xe_lrc_parallel_map(lrc);
 }
 
-/**
- * xe_lrc_engine_id() - Read engine id value
- * @lrc: Pointer to the lrc.
- *
- * Returns: context id value
- */
-static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
-{
-	struct xe_device *xe = lrc_to_xe(lrc);
-	struct iosys_map map;
-
-	map = __xe_lrc_engine_id_map(lrc);
-	return xe_map_read32(xe, &map);
-}
-
 static int instr_dw(u32 cmd_header)
 {
 	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
@@ -2619,20 +2589,6 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
 	kfree(snapshot);
 }
 
-static struct xe_hw_engine *engine_id_to_hwe(struct xe_gt *gt, u32 engine_id)
-{
-	u16 class = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
-	u16 instance = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
-	struct xe_hw_engine *hwe = xe_gt_hw_engine(gt, class, instance, false);
-
-	if (xe_gt_WARN_ONCE(gt, !hwe || xe_hw_engine_is_reserved(hwe),
-			    "Unexpected engine class:instance %d:%d for utilization\n",
-			    class, instance))
-		return NULL;
-
-	return hwe;
-}
-
 static int get_ctx_timestamp(struct xe_lrc *lrc, u64 *reg_ctx_ts)
 {
 	struct xe_hw_engine *hwe = lrc->hwe;
-- 
2.54.0

