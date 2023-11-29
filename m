Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A21C10DC1
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2C410E6A3;
	Wed, 29 Nov 2023 22:36:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F160A10E6A6
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297407; x=1732833407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Qe/FANk0IP1DpHOCQcrXNS9kCWfDkDrvJeZjYxvOlnQ=;
 b=nzddgYouNeOlhR3RJjFlt5a/02analNMKtl8GHQt/6OOGqOmhj2WkObN
 oG3xq4cWyh8llZX1VKLpT7eQO8F/PLC6npxpN68/7kPdaRDRgvDTxj0e0
 q4jDP5ukUxKz22sNYGXNxRWinDYbwbvM10rQzFlWAf2pjIPP2yuB/GnL/
 PMXPJY0pxtp6SaDbbFI5Tl1ohq1WhHTllC+fknaToOrntchhkif/XsyMS
 H/gCeLyOrIIwnu6Rf55HYjroXPnFrTLkK/HfUnUEZ/94L8v3/N39mjsSF
 iSRkEJDwwuy4IUkj1a057pptC+0ne7tu+3PkxM9Vz4QpOOYDdbhl+/JuP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="219838"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="219838"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:36:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745418370"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="745418370"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:36:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:36:46 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtMDNRiTdmB8afrkquxqx+i7uueX+bGrj5V20Dy4R/xLcao8x+l9wQgwsIjEX40Q9KOznSDkj+R4ZXmKNZ99b3eNdsMUlXZm8eAJF8+vjGpLk97wnA6dY7Q6ZDHTk4+niB1IhqB2Z/YltEQ85LUMk4+/cT3+JSc1lVZP56M4ZGQC6uBk09MST9i9DUy+rsqq6Ecvs2x7SGJBJCZu2n/nlYLeP9DJs7orAanziP6X5ZYXjDW2d69Y+hOUQQ1uhZF6z6S4PsJGxKGBlEznt7+9NGhDnb+rbMyrxrrlcjprpex96nLpsFCbTGAKW+Og2sBJjFLQKuBB/oJA8RUHibNBYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVIc9/56a4QUHUyOuP2ZqGbBdjAadsZMJHk68jpbZR0=;
 b=ckl68N6JA9i8A87mEXmmwBxboQ9L7Wf22funGUEOekYR1LyqFbwzmp7zkMmE/a75/LuuPAZIxlaC0JYMrLIJj9E16Q1ZNdRl8WgLUUQQLMVAIY2M5/ZVk8UFv/pNVr+XF1W6gMsvDR8NfTQg4k84r84OsjFyTGgl+PMmMyl5ShzaPyEu3MXX4k1TTaC4fplcqHoVsRZxCXrTOUz2rtXH+ReyLlwmMewHdNTYb3Rd4dnKF6bH2i2M7K9drq4a/J5wMyDKgDn9kLPSqR1axvSnz9QjCI0Kid2JzXoeqgQWW+kGImQ18FbZmXB9plg8zS/0w2XpxEVwYRFo/Fqn0ZLXYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB6883.namprd11.prod.outlook.com (2603:10b6:510:202::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 22:36:42 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:36:42 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:35:07 +0100
Message-ID: <20231129223508.1189461-23-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c3c5605-4dd8-4612-d136-08dbf12ba8b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3gjIf0hMWaRy8IwWRG4QxLXUjtmligxlAyvy1/X0s8jQtGgQP//YQ02K2y4eChWxbl9X50SKaroHTcLuAvHBoBxNt9LyRviqHslJ4LobtQYRP+X6/yq6HDy5CzaUvLEvTu6H0Io4OhTKPcmTwGYNnP/RQDCWE3PXbB5NCNPr+CPjraAeAXBjGiLfv6lG5f/cFGRUvQvCwPPVPK9jiigWFc+1v/hqXTnHGxzxDteYA3hiAmjHlJM7NiuouspImuKZkbH5Ejo84h6ymCFTJY34OUw0syo43jWW1qTzCo0rwbuLk7Yi1ss6egqstJ8O/nyNNn3R4GEoUx29Fe7sUe1tSIKc8jzwg6uAT+FaZ+eUSEN9xFllok1O4zT+CGUJvB79pcgIy7JLZsXiXJoKQh+coC9r8y8raSnO5zy4HaXGd2BfOb/vGH1LxR7/+GpuRIaPcblRawTMJSLhXLs+T9ue+qdHJAkMyUxQMzb11DBMDJIHjT1vfxuoScwHDr5yJZsbCIaq1aHCbenSMDOsmNvbiL8v4VMySxpjG5DvrokIbqKNXDfL2zpN9T0gLqbm6cJDq70mBAFHZbJiMfGUeN7UkKdphkH66pi1tF8rRQaa8yUFS7ov8uWa0rnF3rDyhr25
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(86362001)(2906002)(6666004)(5660300002)(1076003)(316002)(6506007)(26005)(2616005)(66476007)(6486002)(4326008)(54906003)(66946007)(6916009)(8936002)(36756003)(6512007)(66556008)(478600001)(38100700002)(82960400001)(83380400001)(8676002)(202311291699003)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUVSRyt5czVCRmVYaSthWGluT3NLSFJEYWE0ZnRXY3hBWmE3S2luQXlablZG?=
 =?utf-8?B?cmpsaE5mdzh4aSt1RURnaWxyaTVyblJhNG50cCt6cXhSL2NDYUNLdU43bmRI?=
 =?utf-8?B?bmRtVjcxZlp6WDFaQ1hjRDRJT3VQaklzMzhJMlBlTStDdnlkOHQzcEpCNVFX?=
 =?utf-8?B?M3c0U1hCa21GSFl5TlA0VXRtaUVFSDcycEQzVTFkN3JUQnJhVm5lcldINVI0?=
 =?utf-8?B?OFFFd1E4RjlZVm43MHk3L3NoWXQxR0RNd25tSmNSck5kWFpHTXBxd1dxNmRq?=
 =?utf-8?B?aTNsUmM0a3c3UVE2VkI1bUhMZlNraEJQbHYzSWtkend6SVRlT281SFJaU0hY?=
 =?utf-8?B?VVRZeVdiTGpCUUNjOFBTSzg0bnI1SmpST1BUQUFlM0x0ajlYeU5QbXJWVVpu?=
 =?utf-8?B?VnVGU0MzeFNNcjZnVCsya3ZxWEQ0RXMxc0NpQmluREMvZHE1aGIxc2VFZ2xU?=
 =?utf-8?B?dHlOeTVCZFkvQnNxQ09ZTVNESzVqTkp4SzV2SFpzaTA1YkFvSm8wdTF2Q0RW?=
 =?utf-8?B?TXo0ZkYyQmdDUlZIOTJ6UDFKei8zZUZtL0FyaVJOU3BuY0ZrUlNvSXora0Nr?=
 =?utf-8?B?Kzh0bVpSN0FKTVBzMEVPMVRYWkRZTE5tVUtFbVljWjYxU2JnM0hQTklPZFps?=
 =?utf-8?B?WHFhWTBUV2JZQ0N2eGlyL1pxcEhuN2ZmRk4zR0R0dW1qeW5TVmJtbWRFZm5X?=
 =?utf-8?B?cC9uQW5lNk1MMjFCdmhzck1Ldkkra213czlxTW05OXU1MU1CWDVIRHF1N0lr?=
 =?utf-8?B?d3B5aThKVFFqVVdMNU1WSlhDdHMwK0xpS3R6bFdFT2pWWklYL3p6WTR2K2hR?=
 =?utf-8?B?YkxIVjZOeUtjTmZNRWo2Njlncm16eW1nM2dCWTRlaE9GY0E1YlZrN1ZkbzQx?=
 =?utf-8?B?WVUzOHlwNEJuL21lS2RjT2tzNzNhOVRleTFsTW1HUzd5KzhlK201dHN0dFZo?=
 =?utf-8?B?NHgwRjlvbmhpZVAzaG9HS2JYRWh1YmF0cnVYZDVNZHBRdTRNSytFUUdBQWdm?=
 =?utf-8?B?MFZKdldVM0lHQlJiMHcxNlU0eEh0aEd5aXlPcmExcTdNTW81WXJ3YlFpazRK?=
 =?utf-8?B?VkR5WHVXSC8vSTZQdE5ZOXJ4Y0tlZkFpNnA3T1gvTUUvZXhDVS9aRWZZUUVh?=
 =?utf-8?B?czZPbzl3YjJ4eGRiWGxPNUsrcFduNTMvUytCbVJWTURZaStCVEpLc2YwSkhr?=
 =?utf-8?B?dWQyYTBlMFZEdWxSUGJlTmIyTVJuK0d0MVBDTG85QWRJR2dzUnVuVWJueWRY?=
 =?utf-8?B?QkVtOG4zNmttTU1zMWR3cDFPMTFpUmRibkhXRm9WV0JVREU1REt4VytxUnpp?=
 =?utf-8?B?T0lIVzBOTGhaS1BRMy9BMGoxOFR3ZC92UDl1QXllb203OUozWHJ0RzZpL0xi?=
 =?utf-8?B?VEQ0S25QUEZJa1l4NFQ4cFpPT3kzWE9aV3FNUk4ydnplaXF4NEM0cE9xZXhP?=
 =?utf-8?B?ZTA2RytBajBTd0RyZm9Fb29RRFZCUUNGVDBtQWhTNk5BR0hDbmZIRTVJZ2po?=
 =?utf-8?B?NFJ4YmVGRnFjb0N2TUxRT1kvQnE3N0Rob3k3U1hjNnJueHJGcmlQZXNZcTZF?=
 =?utf-8?B?TTZMdExERlB6UU5qWjNscGV1VzRPTmhVU0Zqa3NZVzZ5Z1BjbkRtRGtjM1Nu?=
 =?utf-8?B?RXFieHJqZXM2Tmk3N3NUMHo0SlQweHBrVldPWFRPSXA1MEFRcUg2RHV3Y3Bq?=
 =?utf-8?B?NS9nQWx4amNsclhtSXFjalNqemRpTDJSbUhJeVBLamtkZHJ2WFdyQjlxdmZK?=
 =?utf-8?B?RFZGbTZLQ0VpTE51STJOL3NmVi9kanBLbzBwYjk4dFVZWnMzRFQ0Mm85dXp1?=
 =?utf-8?B?UkExZm01N3JpUFJ3ejZyYm9kd1hsTlU0Q3AwOGZVdDRkSkM2dWZqdlY0Zm5E?=
 =?utf-8?B?ZzBRcGJBVTFWSkY2dDA0Y0ViUVY4dGZLYkpsU1JheDkwZFdVc1pVRUQ1eUI0?=
 =?utf-8?B?WVIrN0FDSDdCRjV5bFllTnJtWVNjZWNFblJpM3I1OUlwVGVKQkpEdGZicVJD?=
 =?utf-8?B?ci95NnFaZXJveFIvdGNsSW1mV1dBcUp5SGtjbDV0YTVtQ1VJQ2dpNno4eGU4?=
 =?utf-8?B?dTNEbjlMNlpscExNUk90NnpnQ2pMTWFiNTU4SGNJTm9KSUhnREs2Q042bDFZ?=
 =?utf-8?B?OCs0SVFWV3dYc0IwWjdGVXFQd2hoZjN2eXRqb05va3habUttNFZ0Q29ETVVM?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3c5605-4dd8-4612-d136-08dbf12ba8b9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:36:42.0901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dhD1XmHVWpnICYFBO1Qy9/QLPd/TR+e7nl0VTFZDmYewaVb1EOBudgY0mzcPhuPIfx4v88mk720ADeuDlSa1vLLGq/hEGqSbSlXPtUfMoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6883
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 22/23] drm/xe/guc: Move GuC power control init
 to "post-hwconfig"
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

SLPC is not used at "hwconfig" stage. Move the initialization of data
structures used for SLPC to a later point in probe.
Also - move the xe_guc_pc_init_early to happen just prior to initial
"hwconfig" load.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
v3 -> v4:
- Convert xe_guc_pc_fini to act as drm-managed release function

 drivers/gpu/drm/xe/xe_gt.c     |  3 ---
 drivers/gpu/drm/xe/xe_guc.c    | 14 ++++++++------
 drivers/gpu/drm/xe/xe_guc_pc.c | 16 +++++++++++++---
 drivers/gpu/drm/xe/xe_guc_pc.h |  1 -
 4 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index a9c71da985d30..7498d36a97e44 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -349,9 +349,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	/* Raise GT freq to speed up HuC/GuC load */
-	xe_guc_pc_init_early(&gt->uc.guc.pc);
-
 	err = xe_uc_init_hwconfig(&gt->uc);
 	if (err)
 		goto err_force_wake;
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b85defa941e85..7dcc438b38436 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -236,7 +236,6 @@ static void guc_fini(struct drm_device *drm, void *arg)
 	struct xe_guc *guc = arg;
 
 	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
-	xe_guc_pc_fini(&guc->pc);
 	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
 	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
 }
@@ -309,11 +308,7 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
-	ret = xe_guc_pc_init(&guc->pc);
-	if (ret)
-		goto out;
-
-	ret = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, guc_fini, guc);
+	ret = drmm_add_action_or_reset(&xe->drm, guc_fini, guc);
 	if (ret)
 		goto out;
 
@@ -349,6 +344,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
+	ret = xe_guc_pc_init(&guc->pc);
+	if (ret)
+		return ret;
+
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
 }
 
@@ -559,6 +558,9 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
 
 	xe_guc_ads_populate_minimal(&guc->ads);
 
+	/* Raise GT freq to speed up HuC/GuC load */
+	xe_guc_pc_init_early(&guc->pc);
+
 	ret = __xe_guc_upload(guc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d2605a684b1c5..69fa7a533b75d 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -952,8 +952,9 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 	return ret;
 }
 
-void xe_guc_pc_fini(struct xe_guc_pc *pc)
+static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
 {
+	struct xe_guc_pc *pc = arg;
 	struct xe_device *xe = pc_to_xe(pc);
 
 	if (xe->info.skip_guc_pc) {
@@ -961,10 +962,11 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
 		return;
 	}
 
+	xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
-	mutex_destroy(&pc->freq_lock);
+	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
 }
 
 /**
@@ -983,7 +985,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	if (xe->info.skip_guc_pc)
 		return 0;
 
-	mutex_init(&pc->freq_lock);
+	err = drmm_mutex_init(&xe->drm, &pc->freq_lock);
+	if (err)
+		return err;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
 					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
@@ -997,5 +1001,11 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	if (err)
 		return err;
 
+	err = drmm_add_action_or_reset(&xe->drm, xe_guc_pc_fini, pc);
+	if (err) {
+		sysfs_remove_files(gt->sysfs, pc_attrs);
+		return err;
+	}
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 054788e006f32..4cd023d9e8bec 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -9,7 +9,6 @@
 #include "xe_guc_pc_types.h"
 
 int xe_guc_pc_init(struct xe_guc_pc *pc);
-void xe_guc_pc_fini(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
 int xe_guc_pc_stop(struct xe_guc_pc *pc);
 int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
-- 
2.43.0

