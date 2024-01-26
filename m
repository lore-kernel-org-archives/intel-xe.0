Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE38C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:31:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A89F10FE64;
	Fri, 26 Jan 2024 20:31:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8E510FE65
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301096; x=1737837096;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=utc1s3Z5V18oyBBxW/x+87qPn4NfN5uD23fu2XVm2X4=;
 b=DblldM1pZ82dqSY4HL4Zdcbs0vL8m5y5cXTR99CVXh2fDOoMjTnlN4bv
 hoNzUwcUgS0dIuF3KHSl0xVIxGxoKca0Esir88kM+RTiDUSC65DOWhb0H
 gfOIa+AUGj2Jk8VECF01aukpWanws8HCgFunvNlO8E8xO+v8FOhHyzSAf
 pVjvHHUGeXIIuoOfb76FRrM5E/djIW4doavQmV8bre9EoPmXLeLTlWfAI
 idcrGjqY8CXuWzfOJKdWukHRqh56wen4VaUHjRG/LB+6nd2inp9YbXx5O
 qfLXvAMf/VPMyB7LEdkzoPrMld3oP1fvS6XTVo3nFgaMStMqCGFONwdbc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9948586"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9948586"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:31:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877481982"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877481982"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:35 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:35 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ar+UP3qYJuw7pTTrzg7Jf9m4E1FrQUQ5kwvePYMcZzyjFx0a+N8xZ2BD5QcFyNtEHNYa6PlgpeHqHelkoy532GHsShE1icIB54Mv+w4kRzkBQxkj8DcAJbxOrwwyp4W997ftpWmT3Rz1hb9GFN/sy8dEY1/9OthuekZMsbe//dq2OO123p1rHXfhZCnp9uPdETvpVsSfrXftraUllfC6dj5A7X5ApVGaHkOAQRHAIiMe07KCufULsbxWOPxkj/DyzClT9mIZpbcQfi4/Eja0bx9U0v3dAT4BHMkvaAT6/yfl3ooN7HmVOEQP+VQ/NeA5GKv+vDHz0V6yYMcO/MtG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPz5wc5XMDlxa6JmvW4E3Bw4mYOiheSD5O0Ere9jAxo=;
 b=Pf6e9VRz2NxU4J1kYV60WT0voD33NglRrJfTEm919ebGg7//pxx5BvFtV6SI1b2U5yJC2W/KdXMLBxfJQtQxmCasMTevXLGsDWj4omjn9NrqVMGe67ePUdGyWhei5PDvzkKaZH1Ocr4qDgufoMKWzzK9C+LFfMNY1PcDiuY+5p8/K5KP1tYUrVnZxtEEkt2/5S71MCV305MIDgjt6vTbW3jTlsTiU5fKAR5R8gaTkd76MlcAUsYKkdhb+zzz+vItEqqMl1rGbZ0Y1nOsYoWSADxuGw9CYc1QwYeCUAZnedncRQXHmtVFXVkniuIjeilUKM4ddn6ptEg5ujCT21H5uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 20:31:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:27 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 13/34] drm/xe: Remove mem_access from guc_pc calls
Date: Fri, 26 Jan 2024 15:30:22 -0500
Message-ID: <20240126203044.1104705-14-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:180::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: 90831ac3-023b-47f8-600b-08dc1eadc5c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BLcuiovk+lDyTcfCeuBLL9Ws7yMbkGW2L89J2Wt4a3uI3qm5O6lYNukF1mA3cOZr/EHsDUn92Q5IK9+9uS+MDkl1xMPPoFwVSnQDwlDG/rYdtc0RHNeLWUTVF/fXvNJGgEmoM6vVxKAaluY9q7USHdIk4H5wlPmnwj/i7BYBC1MKa1dE+VjAkK49GYWG3YHv/7zJ1jP695nEoFH2LfcDCXRY/E8dhvUF7d2vD26WXnWQ24RZ/aPmtEUMwtwavWlglxArenvZ1EL++z0tfL8aCVM9Mq7Bf3nfVjIRuyysMwQrA11pwLQOS0hQipAzzlLbgJXHseCLw5qxQ2TfeccgaxblwRD6qidv60qYGfH0bC/MvpXqF/Dy0enEiOXnG7q+NpahOIzBi83Oz4d3khWj1hkBMq9UhjQ0R8i1EzhPLhH7Cwv4xKqFYy/RDIxqmtA6ZwBbweSiHWx2WebhPaCP8n2xNHHNDwy06qdTbEQqVmxLR0fRgy4dvqRMloIc/l3zpShlTsh5HKRcDSvPR7BGCDZPnBC6So40sTRGiVXYaNcu9WpEj8BhaZO95KCcqkAg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(82960400001)(6666004)(41300700001)(6486002)(478600001)(26005)(44832011)(2616005)(83380400001)(6512007)(6506007)(316002)(2906002)(4326008)(36756003)(8676002)(66556008)(5660300002)(6916009)(66946007)(66476007)(8936002)(86362001)(107886003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QefTYfbpwuAzAAAd193G8YbWcMfeheL85+8BAgVoDCtBPsWYv3U3xzPYUtvj?=
 =?us-ascii?Q?BTd3vZqyUAmunreYbVxXOxPOghRiUJ/JaEBJOSIHI2LJ51kjNmMVJjLmhDHM?=
 =?us-ascii?Q?k3NlpWOcqKjIdW0WNGR/peMCNJvK2ELoNXD+SyWxp0EZ3C+CIcGGshFyZ9Tp?=
 =?us-ascii?Q?p88+iuO+FJf6dACXbo5+KWLGVBPq+n+NSOoNdPY8mFb3HmCSgu330bGWoN94?=
 =?us-ascii?Q?zMtSDmhsI8QNMR+6Q+EQ2Ss/Pm1tsuyQvN1GFu1O/0sz5viQJfjxI1n/q51N?=
 =?us-ascii?Q?/A9s+EgPdSB4yL1Q7cMoTbpRepkUfrrMhhARxTVwxBQP4RpjZNXViztKsuPr?=
 =?us-ascii?Q?s31vnOdVN9X2Y2jbposeBfkJBvo7W7PiToahNONjMwCSqPcXgA1yuH55ziaA?=
 =?us-ascii?Q?OMf8qAUwZqNq4psVMCn8Mzs9SirXGigDKUDpFuY9MWFl8w197We6uoBHPI5a?=
 =?us-ascii?Q?PKBdzp+pD7vxJ3LSh/bH//2PvJVA5qicwzUSIbDb9Lp0qs4cOtlaMuBe0y9j?=
 =?us-ascii?Q?Er/iXW6PobOvBivpuiNs99+zLGcK4GIFwjswo4S++oG0g9c7A8uUH6UX4pU8?=
 =?us-ascii?Q?3fnqTj1yJ36HlAO5Zx4UTbArlYVSra83xeS67mKI6ytpz+1/6mdigZp+2xS9?=
 =?us-ascii?Q?lmXoc8flbMiIhMXmaxNZjxpJ3XvuyF18QE7Y5F0ebg1diVQSNTv/z8DcXOlM?=
 =?us-ascii?Q?5i+mfWBhp3bZOnL/E65nRePGlHV2d44mUpTMBvLEpRk5oKCKdMB+8mR+IM7W?=
 =?us-ascii?Q?DsxBOD+ziVuPOFiHAZRAQgSTpOEw5X0k0blOAk/lebT2AqEmbvzc2fmCqeHF?=
 =?us-ascii?Q?lFpm4yW//Dl+wANy4LDaJ/h07DLA/neOuoqF7gbSnroWf76OmLFeWVPN+nRJ?=
 =?us-ascii?Q?Ng7drsQoX5MKZdi2yrd6NiZE3l+UridfJAV6DXrqlDA7jVZ6THokP5l2I4bC?=
 =?us-ascii?Q?FMyVJq6YhC7+VVvXzamAoxSFhBfIenHLuj74Ybs4KfEeqLonZh3APa/9b5oQ?=
 =?us-ascii?Q?dqR7SuM+DCHUqqtIOHSPNhlUm6dLCdYPnT9g7lsChihlssIJsSCPV4nkbkdB?=
 =?us-ascii?Q?He1Sx036WDHE4uWt6HH3M2UxLKRTkGCQbMEVF2Mr61izoAC6i1Q/UbLIG1tm?=
 =?us-ascii?Q?PFoUiC94yxJipsGCKZt8UsdMRFZ36QcqTtdVymwPbk3ZJC/wSyZnc/jsmrlq?=
 =?us-ascii?Q?+EtFO1NEg60Mgi1yra3KZe62OOnt+hNV0EsodVPiwq/mGwJFXlpO1m/p02yU?=
 =?us-ascii?Q?g0PGaXuScBXDewN+cbsSLhDVoglbN+sQKeYNOQHreMiAGLHl2XQk2vgHTbVh?=
 =?us-ascii?Q?MLXhvAPiAXOTFVKrus8yineHfXa7MHyVyPlY5v1wC+x3PD7woC0Y6YcT/uT8?=
 =?us-ascii?Q?/pTU+l2+UhdcGpXPSn+6Mo+BZqzdIbRu+dpc8gf3s3dHcVfdJzrja5L+V1VG?=
 =?us-ascii?Q?R9M9FRM/aUFk747ZXs7oSOUxZdPLIOhOqYDWoUW+U/68g1g1Yd21xysu+me3?=
 =?us-ascii?Q?awoNe52vUhFzFszYwVJmuEc94ML/D09NWyak9Ha+/5kEShQR3BzHrBtbywiJ?=
 =?us-ascii?Q?BFqqgG5x7hD8eQSvNw8TcHY5HC4yUDpVYz4aeJYRzOWIk0k/0N7HhYDpaht7?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90831ac3-023b-47f8-600b-08dc1eadc5c3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:27.9168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+cCyoQxf4f+Cyii/3eZRYnDGwPC4K6g1xjvkF+K/8HQ2mD1mdaK4+wPiBBW9F/ZWYvzEDnTLJV/aoHgeyzxCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
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

We are now protected by init, sysfs, or removal and don't
need these mem_access protections around GuC_PC anymore.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 62 ++++++----------------------------
 1 file changed, 10 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index f71085228cb3..ce39eac7c8f5 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -381,8 +381,6 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 freq;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
-
 	/* When in RC6, actual frequency reported will be 0. */
 	if (GRAPHICS_VERx100(xe) >= 1270) {
 		freq = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
@@ -394,8 +392,6 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
 
 	freq = decode_freq(freq);
 
-	xe_device_mem_access_put(gt_to_xe(gt));
-
 	return freq;
 }
 
@@ -412,14 +408,13 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 	struct xe_gt *gt = pc_to_gt(pc);
 	int ret;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	/*
 	 * GuC SLPC plays with cur freq request when GuCRC is enabled
 	 * Block RC6 for a more reliable read.
 	 */
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
-		goto out;
+		return ret;
 
 	*freq = xe_mmio_read32(gt, RPNSWREQ);
 
@@ -427,9 +422,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 	*freq = decode_freq(*freq);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-out:
-	xe_device_mem_access_put(gt_to_xe(gt));
-	return ret;
+	return 0;
 }
 
 /**
@@ -451,12 +444,7 @@ u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc)
  */
 u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
 {
-	struct xe_gt *gt = pc_to_gt(pc);
-	struct xe_device *xe = gt_to_xe(gt);
-
-	xe_device_mem_access_get(xe);
 	pc_update_rp_values(pc);
-	xe_device_mem_access_put(xe);
 
 	return pc->rpe_freq;
 }
@@ -485,7 +473,6 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
 	struct xe_gt *gt = pc_to_gt(pc);
 	int ret;
 
-	xe_device_mem_access_get(pc_to_xe(pc));
 	mutex_lock(&pc->freq_lock);
 	if (!pc->freq_ready) {
 		/* Might be in the middle of a gt reset */
@@ -511,7 +498,6 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 out:
 	mutex_unlock(&pc->freq_lock);
-	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret;
 }
 
@@ -528,7 +514,6 @@ int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 {
 	int ret;
 
-	xe_device_mem_access_get(pc_to_xe(pc));
 	mutex_lock(&pc->freq_lock);
 	if (!pc->freq_ready) {
 		/* Might be in the middle of a gt reset */
@@ -544,8 +529,6 @@ int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 
 out:
 	mutex_unlock(&pc->freq_lock);
-	xe_device_mem_access_put(pc_to_xe(pc));
-
 	return ret;
 }
 
@@ -561,7 +544,6 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
 {
 	int ret;
 
-	xe_device_mem_access_get(pc_to_xe(pc));
 	mutex_lock(&pc->freq_lock);
 	if (!pc->freq_ready) {
 		/* Might be in the middle of a gt reset */
@@ -577,7 +559,6 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
 
 out:
 	mutex_unlock(&pc->freq_lock);
-	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret;
 }
 
@@ -594,7 +575,6 @@ int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
 {
 	int ret;
 
-	xe_device_mem_access_get(pc_to_xe(pc));
 	mutex_lock(&pc->freq_lock);
 	if (!pc->freq_ready) {
 		/* Might be in the middle of a gt reset */
@@ -610,7 +590,6 @@ int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
 
 out:
 	mutex_unlock(&pc->freq_lock);
-	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret;
 }
 
@@ -623,8 +602,6 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 reg, gt_c_state;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
-
 	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
 		reg = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
 		gt_c_state = REG_FIELD_GET(MTL_CC_MASK, reg);
@@ -633,8 +610,6 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc)
 		gt_c_state = REG_FIELD_GET(RCN_MASK, reg);
 	}
 
-	xe_device_mem_access_put(gt_to_xe(gt));
-
 	switch (gt_c_state) {
 	case GT_C6:
 		return GT_IDLE_C6;
@@ -654,9 +629,7 @@ u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 reg;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	reg = xe_mmio_read32(gt, GT_GFX_RC6);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return reg;
 }
@@ -670,9 +643,7 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	u64 reg;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	reg = xe_mmio_read32(gt, MTL_MEDIA_MC6);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return reg;
 }
@@ -801,23 +772,19 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 	if (xe->info.skip_guc_pc)
 		return 0;
 
-	xe_device_mem_access_get(pc_to_xe(pc));
-
 	ret = pc_action_setup_gucrc(pc, XE_GUCRC_HOST_CONTROL);
 	if (ret)
-		goto out;
+		return ret;
 
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
-		goto out;
+		return ret;
 
 	xe_gt_idle_disable_c6(gt);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
-out:
-	xe_device_mem_access_put(pc_to_xe(pc));
-	return ret;
+	return 0;
 }
 
 static void pc_init_pcode_freq(struct xe_guc_pc *pc)
@@ -870,11 +837,9 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 
 	xe_gt_assert(gt, xe_device_uc_enabled(xe));
 
-	xe_device_mem_access_get(pc_to_xe(pc));
-
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
-		goto out_fail_force_wake;
+		return ret;
 
 	if (xe->info.skip_guc_pc) {
 		if (xe->info.platform != XE_PVC)
@@ -914,8 +879,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 
 out:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-out_fail_force_wake:
-	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret;
 }
 
@@ -928,12 +891,9 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 	struct xe_device *xe = pc_to_xe(pc);
 	int ret;
 
-	xe_device_mem_access_get(pc_to_xe(pc));
-
 	if (xe->info.skip_guc_pc) {
 		xe_gt_idle_disable_c6(pc_to_gt(pc));
-		ret = 0;
-		goto out;
+		return 0;
 	}
 
 	mutex_lock(&pc->freq_lock);
@@ -942,16 +902,14 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 
 	ret = pc_action_shutdown(pc);
 	if (ret)
-		goto out;
+		return ret;
 
 	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_NOT_RUNNING)) {
 		drm_err(&pc_to_xe(pc)->drm, "GuC PC Shutdown failed\n");
-		ret = -EIO;
+		return -EIO;
 	}
 
-out:
-	xe_device_mem_access_put(pc_to_xe(pc));
-	return ret;
+	return 0;
 }
 
 /**
-- 
2.43.0

