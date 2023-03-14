Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254EDC6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 15:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021ED10E81A;
	Tue, 14 Mar 2023 15:51:56 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D05410E81A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 15:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678809114; x=1710345114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NG50IY3U59kyqnJz/raj0wltrHa50+12cwt9yZUs/SM=;
 b=SSEuoIs0lOSUaQH0/2GhGtzCDwVhDusPzWHtbrGk/ETKFc47TajwIYqw
 13wYK12bT9V7wxVLHBHfFrtaeoVrsKnsuG3VjMlPUfiBK1FNQNH8+qS8b
 LY3Ak2dPjUHPDZUXtPpguJoOUqGSaqFIk+XfrJZGB8DqSdUh4wkN6yu3Q
 xy32OS+Pe6pom3kTeAKSNRGUJXvVi7I2ivMCZgEpBT02ZQXGPi+V+ebws
 R0xnh1OB3WKQqyJ/j1o8i6XIHVVy633aPGjOF109ioNhakaVr1DVYKtEu
 DagmyVk7DM/Nv8aW9mTgYgb30zYOGp51Il7sTyPcLQ2V6+8X7K20Skjqc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="339007843"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="339007843"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 08:51:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="709332789"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="709332789"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 14 Mar 2023 08:51:53 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 08:51:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 08:51:53 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 08:51:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2nbieCWwWXx1iq7R2vnv+VfjIi9wYCvnclRWjqvwi6MLpJ8NB6ko0mapO1qvhAtwptGWbKuBnUJPACu/Xm2jpfEL4dhQXrpyWqhpXbfBA6z2h/QJ2f++Iafx9119gzaaygheCZPbpN2ReAtMnI3xfUGxXIBlsFJk8Syr8NKemVbclhF9twgJd8xoSCxFNMtrG4B1chO/+cL8udpALvHCCSCOq/viAbC6xOJ2Fmz4jbHpcERVWSPhKnteCg3Ba89VpdtHBwXoH/0uk+vD1u+DI7WdL5xRJgIqTpHER2dvtzNp8JD4G1CjMJrnUJca41wR/pnbgIUmtOxtwSy3mE/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6wf1ZKtf0AGhXJK06iJd4n9thFd2syBWrZ/uYs7ffk=;
 b=JJyCeveKhgt0YakNEWNm8THjVwJD+fAKuLUTWGHABszkJLvLyXBfAkUkHO+qd89p8WsPPejx2AddgWCmDMGqv3HiZBFMteevqL8CmJWOGJc6BwcbzBiLPg+e2sDh1LedXp+hxxLBuJyMce0gWEBIDQV97154Njv3F0rVzthbvtS3Nud68RlYsOGBxCrHMxhBWHNWaBfSF+aj8QGMVvZkvwaUY58fSZzZCZibvHB03ysenSa3XcibGFDzrtLR45cb5IsfA//81axGRPbe8OR+v+fbD751XSiM4rHHFEe+0mQVgRm9jqNPDovOnElXhrZogN50Ohwax2y1H3gaweY2JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by BY1PR11MB8127.namprd11.prod.outlook.com (2603:10b6:a03:531::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 15:51:51 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831%6]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 15:51:51 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Mar 2023 16:51:10 +0100
Message-ID: <20230314155111.1546283-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314155111.1546283-1-francois.dugast@intel.com>
References: <20230314155111.1546283-1-francois.dugast@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0318.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::17) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|BY1PR11MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 993372f0-70fb-42da-24b7-08db24a406b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nmYg+hVtUeGNGT0lR+DqbGxAZegLmYriqC0B+4NxJgYUW64QgFG+AMJ2Wo7tsNU/ipB2DCP5qliZ6CIiXUguXQuUZcYTTTq2OstMk1RqKCw2TdhtoYWd9GGmk3A6ssbFyZSLbOZogcsFAbTe2qaGp0cp+zl8aZpodV6Gli3dweMiLkZGoX0lZar1sMaTXZsKQqmdUGrhVJcExV4ysOKdNkLP3zQRJO6kFm/S3jKW5S9Us9p9F3A1fs3hZfmAwO+0cdSMarJcZG1cqtEGOGJRaTWcWb5tem8IHADeqCI+QJGlDIMrBUMVY+eWQMuH+jMrNJ/PcBbbv2s93LArYa6eTyJqJzvTNB1jRhqTmEiHRRvk8vQpJcky9yo+xqfAy3n3+i1FhxHb9DbDCJj5j5YDwWgOzIT0uC1B4kiVbiOchnI8yEzvPzs/u/BIAfx5iemrSJAm5/wgvvsq8/mU/zYDEN/geZOqrDV2jUQhra7hK95Cz1pq69nJRIBhj6CBHTtFIPZYnpEsYMjn/8cZO6oqGVq6dEB6LjfhyB+8B2R21+gOMCdgtjQuNrAIOzNx7WV1MUi2G1A1sofjywHe35MUYJeY7LmGaufjs/7w2Ln8/Ppt0Xr53UPqC4s/aDUgACkRGu5egBqx9gZO7hp/8bRg+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199018)(86362001)(36756003)(82960400001)(38100700002)(41300700001)(66476007)(8676002)(66556008)(6916009)(66946007)(4326008)(8936002)(478600001)(316002)(44832011)(2906002)(2616005)(5660300002)(83380400001)(6666004)(6486002)(186003)(107886003)(6512007)(1076003)(26005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aJp6cofNR2vvofZg+Vz09IVPPukLgkCUY1Sasrg05fFD5ui4jG6feerZzp8M?=
 =?us-ascii?Q?inxVnh4/A207/HI72pp2DIZi7Ue5lE6pgayATc8Aejgbc7L6/q3Ix/C4bbZ9?=
 =?us-ascii?Q?eyfcuvJ61s8bHLF03YUb0iw2zYwpczGVNE7K78h4eyArY+sE2UQRMqPnDHoj?=
 =?us-ascii?Q?1k0dzl0Lqz/bfdadstuNMTYS831KQm1hqjViERFQVOTyedNjUhEgeOz9pKLp?=
 =?us-ascii?Q?mFL47hD9FcCe6IzORiPqVAuQFPIv0OoGlaMl3fVelghPZO3l9zTS6FRf6kqw?=
 =?us-ascii?Q?UVrmOfMVAsbuyTPKuOILYbttaIegkCa08cRqWIYXFlHtlixGJgTGas+aeH60?=
 =?us-ascii?Q?XAP0hJ8VkVPUYV+S3XZY97v6iqVyRjM72I6uebhion8rSMOEonK1SSaBNoYA?=
 =?us-ascii?Q?dmZgC7/FyKG/SvsxuecwqbTENi6qiFTyDF4zLNasJ4nn1bpurapHqhEyPoGr?=
 =?us-ascii?Q?W0OPFRqVI53riWUZ5zNx5RcHCIDKRbfxdXdkYg5z+kD0hhAMOm8/xIhUFc+7?=
 =?us-ascii?Q?Oeqf3AafbxwGoAKwLDsHOd80eqcsB8s0T09Ozx8mMyCcGjoy6e5ui54Se6pv?=
 =?us-ascii?Q?PBEtZojOFVHbBIzyXkojjSjKicRWFQqSctTjizaX3nhbW5WV49Xdjg+Xcgwm?=
 =?us-ascii?Q?U9aiuWK1XvVonwgAnwK22HyeCYRHG8Wd9sDOfNj0fjGUoOJQlohzcapi2gK9?=
 =?us-ascii?Q?5Mr5oOd9shlSXD8FydqSr4svmPmRww6vtQMZHS/XmlIzG7MAO3PA8AzTQExk?=
 =?us-ascii?Q?g5Dps58+VFzJyL7iTln1lOMdhHXNvb0thEoJtB5H8qLcW5DcXhS65TV6PQl9?=
 =?us-ascii?Q?3vpefAZhPbWKEEWj3C65HLvLtq7ESx/CrEUZxa7t4kTmA+ktiXl/Zi1IFTWu?=
 =?us-ascii?Q?fRucUR5ZS0B/SJidcp1eO30diIgSJMEy4bUXEUQl3v05KcQ8cyliwIyqvijV?=
 =?us-ascii?Q?KMd/Hht622zG+4zwmOk5awrpkrA6afzGhFVIO9bz5JWzOA/jJ4vHjiZhbeNF?=
 =?us-ascii?Q?ev6FuRpmriDNifbInyaJVPQIssKP27PjYxfSHcszS/N849683U2S8lKDTbGR?=
 =?us-ascii?Q?TvG1ENhE4jqBnX4TU1TG5vyYe797ZDJtQIymztq++SGDQAm3dyyr8QaZUCOl?=
 =?us-ascii?Q?dxKjd/dS0p+2VpdIg5gh1tnMpTQix260Uc6QvcNIQpeAL6PJbKRAbYGKddgq?=
 =?us-ascii?Q?Vcj+qnJPHxNsKYp4ZpWXHEOmaBFN/XbTVxPnvlbHZaQmNgVJwXq01TPBv84+?=
 =?us-ascii?Q?GTH+F11u+ruMht1b8KGCypj2lk6kdJVpxqRflzutcJUMt2/yIclCM1z/RhTO?=
 =?us-ascii?Q?JKQ64XcYqW+4hzHy/jZeFVQqrE2S6y10ZvsygXfNRu69ULXwYZtRwRAPa0Zp?=
 =?us-ascii?Q?KwNPS0IzGYZfuGtXClEdOLYJThVOWmxThRdvAsYjqsO7iEnk/oDhaMwKpTQo?=
 =?us-ascii?Q?7JrETSwrvs508J1qnpNdboxk1aOnAbXi+o7Pz5k4mvULkx3AbvsuMi5ppI1q?=
 =?us-ascii?Q?IU0JCUdDxBD5ILIbqC197ttyl25bMb1sfx0/1RkuNHvlRAMRZNEBcsEXCfNb?=
 =?us-ascii?Q?klDAw6xCdGhczZrSIIRy5m8ZZ3xwGjBBNZ5dYspGvmD3Rrc+Pe4wF3eGdtSo?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 993372f0-70fb-42da-24b7-08db24a406b0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 15:51:51.0843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yflxiJbO200VAswjoB93mDXPbMKeo1lfmYkThHsC3aQkBNPCRLH7ebk/lfqQyhvN7jnWq/6aRULi8O8Rq5rfA2tSpulKKZjtb3Ord7Th5I4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8127
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH v2 2/3] drm/xe: Introduce function pointers
 in xe_guc_pc.c with local structure
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

This is similar to the previous commit which was for xe_gt.c.
A local structure of function pointers is used as a minimal
hardware abstraction layer to split between common and platform
specific code. This structure is initialized once with the
functions matching the platform, then it is used in the common
code with no need for switch or if/else to detect the platform.
For now only the functions init_fused_rp_values() and
update_rpe_value() are refactored.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  1 +
 drivers/gpu/drm/xe/xe_guc_pc.c       | 43 ++++++++++++++++++++++------
 2 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 411e7a62d28a..bc26c6e050d4 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -312,6 +312,7 @@ struct xe_device {
 	} params;
 #endif
 	struct xe_gt_platform_funcs *gt_funcs;
+	struct xe_guc_pc_platform_funcs *guc_pc_funcs;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 5a8d827ba770..71d48148061c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -117,7 +117,12 @@ pc_to_maps(struct xe_guc_pc *pc)
 	return &pc->bo->vmap;
 }
 
-#define slpc_shared_data_read(pc_, field_) \
+struct xe_guc_pc_platform_funcs {
+	void (*init_fused_rp_values)(struct xe_guc_pc *pc);
+	void (*update_rpe_value)(struct xe_guc_pc *pc);
+};
+
+#define slpc_shared_data_read(pc_, field_)		   \
 	xe_map_rd_field(pc_to_xe(pc_), pc_to_maps(pc_), 0, \
 			struct slpc_shared_data, field_)
 
@@ -348,10 +353,8 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (xe->info.platform == XE_METEORLAKE)
-		mtl_update_rpe_value(pc);
-	else
-		tgl_update_rpe_value(pc);
+	if (xe->guc_pc_funcs->update_rpe_value)
+		xe->guc_pc_funcs->update_rpe_value(pc);
 
 	/*
 	 * RPe is decided at runtime by PCODE. In the rare case where that's
@@ -676,11 +679,10 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (xe->info.platform == XE_METEORLAKE)
-		mtl_init_fused_rp_values(pc);
-	else
-		tgl_init_fused_rp_values(pc);
+	if (xe->guc_pc_funcs->init_fused_rp_values)
+		xe->guc_pc_funcs->init_fused_rp_values(pc);
 }
+
 static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 {
 	int ret;
@@ -875,10 +877,12 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 static void pc_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_pc *pc = arg;
+	struct xe_device *xe = pc_to_xe(pc);
 
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
 	xe_bo_unpin_map_no_vm(pc->bo);
+	kfree(xe->guc_pc_funcs);
 }
 
 /**
@@ -893,6 +897,27 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	int err;
 
+	xe->guc_pc_funcs = kzalloc(sizeof(*xe->guc_pc_funcs), GFP_KERNEL);
+	switch (xe->info.platform) {
+	case XE_METEORLAKE:
+		xe->guc_pc_funcs->init_fused_rp_values = mtl_init_fused_rp_values;
+		xe->guc_pc_funcs->update_rpe_value = mtl_update_rpe_value;
+		break;
+	case XE_PVC:
+	case XE_ROCKETLAKE:
+	case XE_DG1:
+	case XE_DG2:
+	case XE_ALDERLAKE_S:
+	case XE_ALDERLAKE_P:
+	case XE_TIGERLAKE:
+		xe->guc_pc_funcs->init_fused_rp_values = tgl_init_fused_rp_values;
+		xe->guc_pc_funcs->update_rpe_value = tgl_update_rpe_value;
+		break;
+	default:
+		DRM_ERROR("Unsupported platform\n");
+		break;
+	}
+
 	mutex_init(&pc->freq_lock);
 
 	bo = xe_bo_create_pin_map(xe, gt, NULL, size,
-- 
2.25.1

