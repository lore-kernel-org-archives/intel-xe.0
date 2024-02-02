Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9FAC4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 12:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7436F10E135;
	Fri,  2 Feb 2024 12:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdVPsYxv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B78910E135
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 12:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706875752; x=1738411752;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=I8D0/LMmTUt2pbwPhNahTLnsPlbs5bkLVn4GrQuAaLU=;
 b=YdVPsYxvHWf1aj7YOPAYhNo6LLvDVw84YMECsR+O5giLgk6mVqqfZbSY
 nbQPQpmROVanC/7iq1/6Xphm9oevR5UPWVkL/DpGRhOv5XYCp25gc3d2/
 87cyw7AUlhx7jOAsf7dnG89VWnFJ/AP7l2F1PMTyoaNv21A6aoLQOBJ9H
 tDci3AwHGVMGoy4Pcp3eMLkYtpE04CQxlFHgcIqdPNQcz11RdeXo1GbzG
 0ApXGByF0upnbO/GirglhvY45mYGMVbQO7T4YftdJrBA68+vzV/JES6/i
 q7WYF8vdeTNJfwEzZruPPhyOh76WhL1WQJ97R1WeoG25BPZgiTLKBzaGW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="10799081"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="10799081"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 04:09:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="395909"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 04:08:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 04:08:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 04:08:59 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 04:08:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDLXS6S7PgW6gU3PvWlC+KcKyhoPmIeGFxNYVSoECZU+WzdRHs8gtwlJtDZVCreQ5R0meY66iT7JxzDnwEkl/+T1mtf5qoqL24t+bKjjPXbeuveQa6wCG7b8sl1ZCXaNSq0mGcVMiX12Zj5+YOfVJt5dsWmQtZ3VrsCLCNbTnZxWEQ+IjadGVkPgsqLnpYt61ZfpowONp/4Ax73IioWC69reAKRgXq4RM9gsZNJjrN8e3gzfKjO3vtA040q6wBQNSKWUuenAOeSM6bteU72XyInVhHED8w9vYnfH1fIkCxheZMfOk6i5bu4LafWnmbgUMPxS1rYqbRcHpHPa9ALAGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vT2ZVCTqDVGfvSWHmL35KfE6WXpoUAJ04reSGOdiQ6o=;
 b=lhCr0/Wy8/j2CB7A6ABzbkAtmn3R6/vpf0JKNEDiYGyBLGQOg2uw7Jr7PqtpDh7+VRU8n/CEA1YgqMtxHb62LPg1zubHe2PWCF9fLh2B8S/bGasGprFKurrJd9lsWbH2ySrs0EV/ZFg50TWK/jRrPiD/I0meZOi7tg/j0ebFivqI/hYnvNmyquSLfNU6ZexE/FzyX0pH375/3b4LR3eYIVtsiS561Kvaazw6FPiHTrHSwMZOJ/RNKAMWzwyR0/08yMH7UBjQNdS+Cb/oPD5LoaeZj765QlUGCBH70sRKDfiFi+F75PBfXpv29x9DJNg43OEge0vWpad1+VSwmv/Ivg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BN0PR11MB5695.namprd11.prod.outlook.com (2603:10b6:408:163::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.31; Fri, 2 Feb 2024 12:08:56 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::a818:a5e:b1b1:511]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::a818:a5e:b1b1:511%4]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 12:08:55 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 4/4] drm/xe: Initialize GuC earlier during probe
Date: Fri, 2 Feb 2024 13:08:34 +0100
Message-ID: <20240202120834.1187656-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202120834.1187656-1-michal.winiarski@intel.com>
References: <20240202120834.1187656-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::36) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|BN0PR11MB5695:EE_
X-MS-Office365-Filtering-Correlation-Id: b94825ae-3a05-4324-0aa5-08dc23e7ba9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fm5gRDKAj2mn4Gr4EDSOw3Ur7r+4xh8lO1qC8jXacza1/+WQUhj9jaHwQrEi9XIR0V/42COdLzbU6gXoPvU51R8pzVIH5cZpPPGhZS5IoqPrkh9lqVbHzDcNSwfstsNwWGvUkTKVreEdxpkGGxASEsV7FJHxQt+jQQ3O0DEBQOOiGhbQJW/pqfXTHmDyujYRpt+xTAiNQCx5BRMuncGbqGPXKDzDoj7h9Kuztf7Lat4Fjmu2j4r14xZHGbhQ4ati4vWBldH+in3LRHAMmUgV1brQbCNDuiLY/zaWR1Sx/kIPJIAgrLRf1CyX/hwWp0kR3lgGEvEjprOd1UND3x5SvVRtq04EFXwxhQVr+LJ/t88y2qDu06ip6ZSNnXr/9Sp0OhffCPwNvs7FBkT7EyZp8Qt3oNZZcrMI2dTW9emF03lrajlAMcxELvAksBVQrza1IWLfgzXyrEQefD0B2CRsvzthLnidJKBI1LjUog+MHgxqT99pJK7AzFYVSaqeehbJGsxmLlX/DTJ2wvJiq507qylpZ60USa7cLDApzUdrhUWr9KAJFNos0YTAexL7BL3l2GUm9Sb8OTjm0Nqq++NLgS3LG7Wk2/QcbHlnFkPQBKU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(346002)(396003)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(38100700002)(82960400001)(6506007)(83380400001)(2616005)(6512007)(2906002)(86362001)(5660300002)(316002)(6916009)(36756003)(8936002)(8676002)(6666004)(66946007)(66556008)(66476007)(6486002)(1076003)(26005)(478600001)(41300700001)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zml0VFFHY3B3VWkwTW5NeGFXVlNiVnlueE5udjFDQk1CZmtEQ2RWaWVrTU1N?=
 =?utf-8?B?Nmx4SUZNa096QnlGakQxOUhpUkN6TktheGRleEtEN2s2MkQ0d3dYNExWT3lG?=
 =?utf-8?B?dnJZajA5bWZ4QTNFMUlibHppWkEwV0NjMEY0bVNiL1hkOHFkRWpOVnRNSEYx?=
 =?utf-8?B?aGloN1llSSt2TjN4eFJBcktPQzZURWRHbUZlNjJZWlNkVnE4M0JseVl4MlUy?=
 =?utf-8?B?b1FJTWxMc3JVUjFpL1RKQWxoRDlVSTRVdGxNcWlFTkJpemc1NGs0eXNucDBr?=
 =?utf-8?B?Z1pyZmNDTXJwSW8xczBmUDBFTWZBMFR6NjZZclF4bG8yVmNhQTVrOWRoMFVk?=
 =?utf-8?B?MVFpejhoV1FDWXZSd1NpRldoa3h5cEdLNmo4NlFFVk9RdkxnYWR4dnBacWN0?=
 =?utf-8?B?cXRPOTBjU2kwcDBWRGpxVkRMaERaejd3VVJ0TkRFb0dqMTBINk5UZkRBdUkx?=
 =?utf-8?B?WmpYb2JkUHBxRlNlMWs0VDRJMGhaUkxiSUtKSHJFWk0rWjdEcHNCMGl4R21m?=
 =?utf-8?B?YlpFWDBhRFc4Y2grR0pFSmJkb2ViMGI3VWV0ZW5jemp5RC94cDRwMmhNaVF3?=
 =?utf-8?B?Nlo1cXo2NHRpWDNDVWNGd0xuWEhscnVSS25OdDdKeUdCZVBYUFMzOTkyVUtZ?=
 =?utf-8?B?eGtDa0M1Q2VkbXBLMWlzSmNIR1YxWkd2dGcrNVkyUFgrR0hRWXF3clZ3VmNG?=
 =?utf-8?B?d05WdHZsOUJVMGZLcTRmNG9XblptSE5JY254aGh1VlUyVk1yMGxiZWlGRER0?=
 =?utf-8?B?aFUxellHMVBYMTlWQW5RcVdvQXZkMzhsOVVJWElnOWNqbzBiWUtZWkFhV2pU?=
 =?utf-8?B?MFZVNUhGMzB6US9pSlhVR3VjTjdDd3hHZVJLVFlzMWQwOVpUWGx1ckRNT3dK?=
 =?utf-8?B?K0c3anExN2hINE15em1FU3JSOXJ4cjd3RU5YSXBlRjFWbjBTMTJUdnNTWTEw?=
 =?utf-8?B?TG9NZHpGTVpnU21vRW9wc3hCSE1aMEJWOVpHc3hQVFRXT1ZwNmN0TlpYbGhh?=
 =?utf-8?B?aFU3dVNDMlNUMWZyb25nN25jY0lOMk05Ukx5MThnUDBnaGRyakRwZzl2MTVx?=
 =?utf-8?B?T1V4cVM5MVR1akZ4ZmJXR3dkbFlrVGcrclJFRUtEUUhiOGYrd2ltT0M3ck1S?=
 =?utf-8?B?eHpRZlhYbjlBUkd3dEFUTTRseWVNT1JwTnMrOExJd2NycEk4VHNtQ2dsSzly?=
 =?utf-8?B?cmFjZEpPbVpFNGVoU24waWdXVUZwb052d2hISzB2TEwzMHdJTGNpWk8yNUxM?=
 =?utf-8?B?bWdya2VLd3Y5SnkxS2tzcm1ZZ0pYWWJjRElnMGsvUUVhS1VXU2VYZUJ4ZUYz?=
 =?utf-8?B?UEdiRjBKeGgyL0hkWXB0V1Y0aGJzWVVkZEs4cUQxcFV5TmtnajBkOEk4MkNw?=
 =?utf-8?B?eER1NXpaWVd3d0YxWUlRa2pVMWgwOU5RWSt1TVVoeW1lajVTRm91RDFMVjFz?=
 =?utf-8?B?aVRYZnk3OUxxNzlPbEdzTTZLbm83VU9aeHlBYXMxK0pFb2dTWTM0cC9BZXhD?=
 =?utf-8?B?Qk1nRTVsc21weWFzakdxcEtCZE5NQWUrbWpDaGhxWFcya0xFSGhGTk1mY0ND?=
 =?utf-8?B?NkFWaWR3ZGFVZW80RHZxVW1QVlNXS2VwdFhNWS82emlmSFpiVm1kK09JeVds?=
 =?utf-8?B?aTZpazdUbEYvRnFkalhHYk9iSGU0YlErTVQ2Ym04SVEyR1IzbUV4NU5NaVB3?=
 =?utf-8?B?bi9qSE9wZHdOM043Y2hjYWo2ejJ5dGg5TWVVUlQ0QlhKbXM0THlWT2pBT1VN?=
 =?utf-8?B?Z1pUZnV5S3pjTVc3QzNMMmE0RmhGY2pBNlZncllaSmZoRmVvbEV3VUk0MnY5?=
 =?utf-8?B?MjFTUWZ6MkN3OEN4bVpIcGdKRkRnUmdIMVZUenFqK3RSL0ttOXhKOWJtZ1la?=
 =?utf-8?B?NVFldnhLd2sxcVg0UWxtZmZMcEZjN0RhcGcvN1lpU0FoRGRLRFJYWElwekVi?=
 =?utf-8?B?NHJuR2RrV3lTTzFjbVBDZm1XUTB0bW1RYjBITCt4cUMwZmJhM0VTdmhqNXJL?=
 =?utf-8?B?cC81RUhqQUM5TWZIZ04yT3BPR2hwK2dqeUE5aEdvcC9McHExSC9uSCs0RjRz?=
 =?utf-8?B?WmlQVnZXbmlEalk4bnNZU0JYZmd6Vk0yN0ZaelA1dkhWc3lyb2VhUjNNaVZP?=
 =?utf-8?B?ME1FL2dQUlNHVTN2cTd0UncranF2Z0RTUFlueURPV1BTNU40dll3VTFsVXQ3?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b94825ae-3a05-4324-0aa5-08dc23e7ba9f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 12:08:55.6112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gulf2+/o2afCmYdX6Ovb7VDnl1CqG3MALDqVJ5PqJYNtSlzn8DY00zheN6gmcMnGayEnrhfiL2A+eXjFCE51iZS9wi2lprXir9Q//VWTapg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5695
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

SR-IOV VF has limited access to MMIO registers. Fortunately, it is able
to access a curated subset that is needed to initialize the driver by
communicating with SR-IOV PF using GuC CT.
Initialize GuC earlier in order to keep the unified probe ordering
between VF and PF modes.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  6 ++++
 drivers/gpu/drm/xe/xe_gt.c     | 57 +++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_gt.h     |  1 +
 drivers/gpu/drm/xe/xe_uc.c     |  8 +++--
 4 files changed, 52 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5b84d73055202..3d10018957c46 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -471,6 +471,12 @@ int xe_device_probe(struct xe_device *xe)
 		}
 	}
 
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_init_hwconfig(gt);
+		if (err)
+			return err;
+	}
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0bc59a4dbb496..312469b5dcc9b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -315,7 +315,6 @@ int xe_gt_init_early(struct xe_gt *gt)
 		return err;
 
 	xe_gt_topology_init(gt);
-	xe_gt_mcr_init(gt);
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	if (err)
@@ -354,8 +353,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_hw_fence_irq;
 
-	xe_pat_init(gt);
-
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
 		if (err)
@@ -364,19 +361,8 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
 	}
 
-	err = xe_uc_init(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
-	err = xe_uc_init_hwconfig(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
 	xe_gt_idle_sysfs_init(&gt->gtidle);
 
-	/* XXX: Fake that we pull the engine mask from hwconfig blob */
-	gt->info.engine_mask = gt->info.__engine_mask;
-
 	/* Enable per hw engine IRQs */
 	xe_irq_enable_hwe(gt);
 
@@ -444,10 +430,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	err = xe_uc_init_post_hwconfig(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
 	if (!xe_gt_is_media_type(gt)) {
 		/*
 		 * USM has its only SA pool to non-block behind user operations
@@ -471,6 +453,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		}
 	}
 
+	err = xe_uc_init_post_hwconfig(&gt->uc);
+	if (err)
+		goto err_force_wake;
+
 	err = xe_uc_init_hw(&gt->uc);
 	if (err)
 		goto err_force_wake;
@@ -500,6 +486,41 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	return err;
 }
 
+/*
+ * Initialize enough GT to be able to load GuC in order to obtain hwconfig and
+ * enable CTB communication.
+ */
+int xe_gt_init_hwconfig(struct xe_gt *gt)
+{
+	int err;
+
+	xe_device_mem_access_get(gt_to_xe(gt));
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		goto out;
+
+	xe_gt_mcr_init(gt);
+	xe_pat_init(gt);
+
+	err = xe_uc_init(&gt->uc);
+	if (err)
+		goto out_fw;
+
+	err = xe_uc_init_hwconfig(&gt->uc);
+	if (err)
+		goto out_fw;
+
+	/* XXX: Fake that we pull the engine mask from hwconfig blob */
+	gt->info.engine_mask = gt->info.__engine_mask;
+
+out_fw:
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+out:
+	xe_device_mem_access_put(gt_to_xe(gt));
+
+	return err;
+}
+
 int xe_gt_init(struct xe_gt *gt)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index c1675bd44cf6d..ed6ea8057e35f 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -33,6 +33,7 @@ static inline bool xe_fault_inject_gt_reset(void)
 #endif
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
+int xe_gt_init_hwconfig(struct xe_gt *gt);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
 int xe_gt_record_default_lrcs(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index d62137306d280..9e51aa6a29604 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -32,13 +32,15 @@ uc_to_xe(struct xe_uc *uc)
 /* Should be called once at driver load only */
 int xe_uc_init(struct xe_uc *uc)
 {
+	struct xe_device *xe = uc_to_xe(uc);
 	int ret;
 
+	xe_device_mem_access_get(xe);
+
 	/*
 	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
 	 * to correctly move our tracking of the FW state to "disabled".
 	 */
-
 	ret = xe_guc_init(&uc->guc);
 	if (ret)
 		goto err;
@@ -52,7 +54,7 @@ int xe_uc_init(struct xe_uc *uc)
 		goto err;
 
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
-		return 0;
+		goto err;
 
 	ret = xe_wopcm_init(&uc->wopcm);
 	if (ret)
@@ -69,6 +71,8 @@ int xe_uc_init(struct xe_uc *uc)
 	return 0;
 
 err:
+	xe_device_mem_access_put(xe);
+
 	return ret;
 }
 
-- 
2.43.0

