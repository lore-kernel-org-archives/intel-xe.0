Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B46C6FD1D
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 08:13:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01E710E23D;
	Mon, 20 Mar 2023 08:13:19 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCB310E23D
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 08:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679299994; x=1710835994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zkVNNarmQCaFVv+OYtJjN5koWTqKWxaysY0yB8BnZMI=;
 b=Ag9UEE9Pq5kutnViS1phN0XYhl63XbZKXxSKbQfXWDe7PR+APaQ9rucw
 ruGZB3obLxhSTTysAeNvpuwIgHWHxdfikxQaKaj9A36co+/OKW7q2y3HL
 iYh0Sbe3XZZduQ6m4n/k24EjMB6RImFQyK89fYFGbuH2ili1efEIs6u3t
 A1ckJB6dyO+PDg5DKCmisa4zQrTjG5Tu0bpo2adG56PDtFnfk9/ciAY3c
 PtIdajWDyNi82Pay3/vFpnH4dw5HwpVOeQXEpgUP//e/ZMzRSItMAWADK
 jxIQ1XKuGw/F008+t5EqnnkM6EvLDpyLjQPr5GlnWpPVHb35Q6cQ+IEU7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="366317456"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="366317456"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 01:13:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="804821121"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="804821121"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 20 Mar 2023 01:13:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 01:13:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 01:13:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 01:13:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 01:13:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpkcIUvtzpTTqOKjXbdCpbxdPm8Qd9yTbe92ckCibr1ZljFZpoCyFGlAHdi2SncM4+lQBYSY9oEok8GrYJZR1ygW+WsUDiVu9KbWMuzcFsK68Iv65RMRcUOta5rretsXBf/8/H3ZIOLYNZbLpKWJICIalQwTBN2ElFKm2QS8SEyeNB4G4gpgTo3CyYdPzQKI8WkbYK9GvK31TVb9e3tuvR8HthyRQtzKnz0G6SNsgmw9ldoIfVniYysxfAPWPB+mmV4tWF/hSyL448MVLpxp3tpHaSfw5N5clpMErjeTgLuloT2wyoH1iA7MgyvDE2MnCfG1EwqEnkip6MPhyLKsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjeTgrOjT3fuBliyhqs/7gtNdxaVms8kbpfJdSOwSz0=;
 b=f2DWX+QCAnZ418Usw9Yx45j0eJMsubPGXVJcXvHjQfWIRbJHfYUk+dD3/CSgs9FsmGAdWSsEunSlUTf4lE/VvOdQ5X+qALGbkCwHx8/ehUa9CQiyzv23AOz0WtmN3Q54U0qTcUdez3LvvcdHnGNMDlwHzI197+KXm9ZReeDq1EaUx+h4e9XAsGCpnHbsSpfyOxz+zKIAjsHLKmn091Haj97tfprRiKDgfYJw70FCovxGhD5j9Vu7nksrmk6ywymYrQKO7JC7YdL+RcrMhJfpwd25cEWVQHbWhZLDyJwAML26IGw0bMU4WRCcmT2cEpcfbHVU/KGkLsNt1orU50oROQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by SN7PR11MB7601.namprd11.prod.outlook.com (2603:10b6:806:34a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 08:13:12 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 08:13:12 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 20 Mar 2023 09:12:56 +0100
Message-ID: <20230320081257.1788039-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320081257.1788039-1-francois.dugast@intel.com>
References: <20230320081257.1788039-1-francois.dugast@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::8) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|SN7PR11MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a40c5d4-95da-4733-7e52-08db291af29d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QKyiCILQjFrumpM3sxqZgUzwTCaOfW+bAthoTR+A6mc+3eY06jaD7VyHaxAid7GQfqmIkcOzOkQngea0vXo//Xqj2mjF3zgWIOHrfGolNZFB6jTp/d1YG+lRs1QMFa4LyX9fWHy8+Qu2kMgg9az/DUOFlNBVKMjvoZo3REWT510t072IEiWmNBcoF0Q51ct+xefMQ4VoakwXnjwj8CqUokaYmgXtPCGeOgPiNlU86TbzqZahjGTkkjRRWijn+fcqLQ0QH1Yzc7582mqVsISdrbmY1Tcx/dFN6ZmhKc357pzXx9bd4ZmSAuhU+ZZhrnYTw61Xka8ARZZ/Q94nvqNwjmRwE/dGa3VWYgQkpLNIgT3gSezSDGeJ2voM2ILoOwZJYxasp0fCnXDHJxLumrGqJLmI6FlJxy4Du3Oe7PJefQlT7R08Ys5l8guiqfHzHHh1rJc8LJ2TWcWuIoGeoXXpuIqo1T6bifyUmKGZ2DLSpjJ4gkat+Qf8KYedvHKlCCnP4WgDtHmvmNPQbSZghRt31XD8iTT/TCV9Cnb5Fv2jdX7XQyCi+iuCoZ+GasVlq1bzTn+UI8a/s7PNH6Bt3eNGcVYOHTt1S/5CdSORCUIdHWgZaBbyr09a/Aufg4i0OCEypTy3VLB4vtoTjGbXBm2mpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199018)(478600001)(6486002)(107886003)(316002)(66476007)(66556008)(6666004)(6916009)(4326008)(8676002)(66946007)(8936002)(186003)(26005)(1076003)(6512007)(6506007)(41300700001)(5660300002)(44832011)(2616005)(2906002)(83380400001)(36756003)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9vgC/1NXefJiAx4uUFTsiiLkLRE9tuS685RFjBCd23BGtqrZRx8BtibXpKjI?=
 =?us-ascii?Q?iUeOb0HSjLeCTJDoMNszwH1Hpe0Db6EylqavAnfr+Zs1knkr05q3oXGoj7cz?=
 =?us-ascii?Q?6VYVYMxZsuAL9wMA3lULpgxSu6+7SYzoOC2pC/ghphc0GMD7OQoNyqipoeb4?=
 =?us-ascii?Q?65bvxI6n4S0yVMJMC/wBvTtHWGJpzTQwWcNFb1TYydSesauLRhwfm4UW+PGM?=
 =?us-ascii?Q?VMFoNb+RX82JFgFif26eFihBFhP1TqyvzJNMRuOZ9RaE+RJvxHLieGHk0BEJ?=
 =?us-ascii?Q?H0z7RFWCeKhQISBGk8CzLJbaC8JFfMZ4XWP/cE7xV0nCLP4MbfcUo/xVQzqW?=
 =?us-ascii?Q?7gHNbdCriMSJWkx6qaW5k0imHM5dZOA7C6nwbmxjpwmPvv4FfHg53ObHXrbr?=
 =?us-ascii?Q?MNJ+PO+gmn9jusxrCVHq5c087SFEYv30LEMStNZ6hTp09DFobxb95XR+PTlX?=
 =?us-ascii?Q?JodxWLM6HLB4ddxxdy8hSsgF2tsDipQLiPSPILMD+fD/SIBt4lL5Nfq96VXX?=
 =?us-ascii?Q?03HLcOCqFsyHlsYNzeR1kXB552Pz75loXSdn78s/xx2DL1hr+ecRa8Xh1xj4?=
 =?us-ascii?Q?W6xg52glPYXsJ6U7OTNLjAKJymSwHJ53dsUa+hAw58TuVec6YBzE39spGd78?=
 =?us-ascii?Q?3qZS1s4UfdpSp5lURTYSj+s+sUJ6VE3utGxrJ82/CzMW6VYuWrIs7Ujy8vKJ?=
 =?us-ascii?Q?2UPh2G9xXx5oBF61bpnsBFp6FzKXt5bPC2lnij9McP1RnWOtTmAqJU8yGs00?=
 =?us-ascii?Q?OpR3tSWx1TwFS4GzQqKADE2sGvkkEcc9VcXz4WttN+5UC0o46LC7cPfETyP4?=
 =?us-ascii?Q?uh5jnBaBsT53hOCwWykgrAj9wIH46AzVoaO6tCSLksmzRTGSmdK0FLI1hGxk?=
 =?us-ascii?Q?b0oaq2G2Aj+1imlHe/bydhCI59RqKncn4l1SswPLhPn7Gfr5cux9nxoFfGja?=
 =?us-ascii?Q?Hup9IiPNCmrs9R7wSvDSYmhKs8Y0zmQh1U6sdxjKV+hY9CfSbMwhFtL2851t?=
 =?us-ascii?Q?DoPCL5aQuq594XYdj26h9W5PM2452qAvt5zqF8Ee2w8ZSELw/un0LQ62u56I?=
 =?us-ascii?Q?X+jBiGw7EVxfovUXAkya6JwBQKbtycHfMfZjvaobVNaADLFmXNUDC4sLY0Cl?=
 =?us-ascii?Q?WYK1mEXxzZkAtgdCa17AA+xezSj1GsBlAwsBhGakpjKNCMkdtfAGK6egJCTA?=
 =?us-ascii?Q?LGXoKN9tRGgCBoN8cN1m+1U8pOJo/sHqolKOpSeqCSa0dwMI73bZPO0hTZe0?=
 =?us-ascii?Q?8O6pmJUkBqOFqNqXS5T9Zr2EqwwO6VJI5KUDMRtAzCsaW5nBfIujxEvB+67T?=
 =?us-ascii?Q?4/+j19BgYY8mJa2Qxr4hLHGFfxp9M/H03vbqssNm0sbZiqb5iQOt4732b+7c?=
 =?us-ascii?Q?vaK3HF7HqE6H21fIZ3YOal+XvlKmk7VVwTbXCphKNFbYD7/mXqkPkYXBgxh/?=
 =?us-ascii?Q?4ezgYDAPInUcouQ903dXey+1Egmnz8FMGFVT6IueHJ6CHiZu7tJIy/hIg8hZ?=
 =?us-ascii?Q?T2kGscM4O2oFx1nOgVYu9g7GPw/6vkgez9e+g0Zqe0CbQy8OgRYTIS5u2qaB?=
 =?us-ascii?Q?j6qp1CKG0Rx/iFtYYwebG6iAcF7Rkd/bTHUlFM+XmpJ+Hu06n/xxOyOt0EVw?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a40c5d4-95da-4733-7e52-08db291af29d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 08:13:12.1384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/v0yI2hNsN3Y6MkBSoE6Djsk2mwtajbpCjtEqR2KxG/okB+RAnZ8M6fTtj+PSbV9Q9Av7mxaPYHVZSJ0JKs4GZRvfS1zc8fJeUhHWVVbmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7601
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH v3 2/3] drm/xe: Introduce function pointers
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
 drivers/gpu/drm/xe/xe_guc_pc.c       | 51 +++++++++++++++++++++++-----
 2 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7d72fb3ff08d..f4b007bd0ee0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -314,6 +314,7 @@ struct xe_device {
 	} params;
 #endif
 	const struct xe_gt_platform_funcs *gt_funcs;
+	const struct xe_guc_pc_platform_funcs *guc_pc_funcs;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 5a8d827ba770..ef3ccf83ea3a 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -117,6 +117,26 @@ pc_to_maps(struct xe_guc_pc *pc)
 	return &pc->bo->vmap;
 }
 
+struct xe_guc_pc_platform_funcs {
+	void (*init_fused_rp_values)(struct xe_guc_pc *pc);
+	void (*update_rpe_value)(struct xe_guc_pc *pc);
+};
+
+static void mtl_init_fused_rp_values(struct xe_guc_pc *pc);
+static void tgl_init_fused_rp_values(struct xe_guc_pc *pc);
+static void mtl_update_rpe_value(struct xe_guc_pc *pc);
+static void tgl_update_rpe_value(struct xe_guc_pc *pc);
+
+static const struct xe_guc_pc_platform_funcs mtl_funcs = {
+	.init_fused_rp_values = mtl_init_fused_rp_values,
+	.update_rpe_value = mtl_update_rpe_value,
+};
+
+static const struct xe_guc_pc_platform_funcs tgl_funcs = {
+	.init_fused_rp_values = tgl_init_fused_rp_values,
+	.update_rpe_value = tgl_update_rpe_value,
+};
+
 #define slpc_shared_data_read(pc_, field_) \
 	xe_map_rd_field(pc_to_xe(pc_), pc_to_maps(pc_), 0, \
 			struct slpc_shared_data, field_)
@@ -348,10 +368,8 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
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
@@ -676,11 +694,10 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
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
@@ -893,6 +910,24 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	int err;
 
+	switch (xe->info.platform) {
+	case XE_METEORLAKE:
+		xe->guc_pc_funcs = &mtl_funcs;
+		break;
+	case XE_PVC:
+	case XE_ROCKETLAKE:
+	case XE_DG1:
+	case XE_DG2:
+	case XE_ALDERLAKE_S:
+	case XE_ALDERLAKE_P:
+	case XE_TIGERLAKE:
+		xe->guc_pc_funcs = &tgl_funcs;
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

