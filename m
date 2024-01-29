Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87F2C47DDB
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 13:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F451127B3;
	Mon, 29 Jan 2024 13:03:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC07C1127B3
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 13:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706533426; x=1738069426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=T99bOoLHZtg3TZ4I2WO74LnJquCuerQ+o4XYA2d2KzA=;
 b=JjnBGSmEyC58i5K1uQ0CY3e1TvCyqtB7QDoiqMPGL0hy+kKi6MRKzILU
 fZlkKDOj9ZwioFcpXLrbggs8lSi5ugg7xDTrumavdItt3xbl60dmldvis
 jDRV2fOPjZjMn06fx5s4zFCE4W10ilGCSWK/fp6RXcl+iXCPlrl8RNLPn
 GKxflXqq8Trtd2e3JkGkcDCJn+9h46iYGYuXMaP+LO5FKT+0NI71KIN0a
 kyd4VJeMMInuszEld9TubXRxV6/HILYNze4FEkPDIyudJpLaoeQelcvn6
 POOrgF95yPMM6akJB3CTczlrFZw88mcZ822+qm9YAWUI0UBkEKK2SeI97 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="10326445"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="10326445"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:03:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="858091490"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="858091490"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 05:03:40 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 05:03:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 05:03:39 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 05:03:39 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 05:03:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijSRD0cAD9JCKSmFXSgKbv85DZKTuWxgQVZr5VUULr63YNor6e5mgJ3WDNIpx+R49vjLu25Kma2krAYE4+wwbyzFjKfILwuMYQkiL+xa8+bFyFSSNEsCBw75lFC7+0D/Nh7zu4NfxkqX14O0SHaCt5Bz5qaYeRHuAZFOiZL+vYUGizpq+hu/DEaFe72LM5rLwOMcwLotsiFggu0y3k/capOILfW91YiN9eoPBvhFNao3bUGnXFeNzTZq0j0G1jNIM6nDYL7W2oV5XmX6+4dzfNd1E9z+AX55kiz2HKmgvCZZGmxHRL2AKgUlF3c6zY/60LdeCb1RqeRHxXGgmQ2aHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSRY+bmpGSn5925GB/dxDg+7bQqg3lvegMXh+Oqpxec=;
 b=G5TdFwHl+BR6JzfBTVyWfywSIOw7wKUoiYabfwNalhV6vhPfCfy8dK/1zG+mu4lY2WUHUa0wWJe26ytBShgHBpQT0oJHm+J5+cLhBNdXPMei5ayc7iaurDNwOLNyl1H/tZWCoX0gUtKFXbwC4LA55dNLRrD3E2VW9MeHb6oxmSny1b2Q0IigMJHiiLWpXNSjRakqc8i2CKujlLnH7c6saltcfK2+r8mdWpMLZekHSixswW7UympesIPYdE1OdszPiLiSQqLqU29ljgvP3yNQrW+CAQB0/u4gTNV+QBXCFD2z2aszcThm1KQHkyMpXDzn4dxPbNabksfORtb4AsYfHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH0PR11MB5235.namprd11.prod.outlook.com (2603:10b6:610:e2::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.32; Mon, 29 Jan 2024 13:03:37 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 13:03:37 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/xe/guc: Move GuC power control init to "post-hwconfig"
Date: Mon, 29 Jan 2024 14:03:07 +0100
Message-ID: <20240129130308.3544466-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129130308.3544466-1-michal.winiarski@intel.com>
References: <20240129130308.3544466-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0429.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH0PR11MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: 361f4e42-a102-4d30-223a-08dc20cab540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ugZndkxU8nBpVIHUDVJOIKKsgR9SfBrU44bzmCNQpVyTYlaMj3MplRH7UbXDoz9qGZ4mPq4TRwC8pM8s5IJ5NbhBds090HR6axV+x97zOjYnll8FeYhY1TJ4MUbcnGu6pQ+61Ku4GbftDeEDdqS2U52RIZwEpoqxqFJFNiHoy7lFMwzR8lBKiyjYKZ4srMxQc2dWjiBbYctyNI9wFx1ZCr4r0khfwfUxx7LGuAi0BXKYnHGWAv5oU+rdg0UjhF4BRMyOJoXqhfr7f+e9mf58smE7LQ/7vLoRhqDP1JnV9AZqqBMjVyO0cxCCnIovdpiIy2aFqtuuo5WPmy62KkbWfRJXZ8CsFPqfvaZy4ymGWXPWfMx4lIx/CMgdZ8wjNZDFJDtbGbNV8Ufj9pVelSuTcFEnJb2TS2jMCPwxZ0mdY3feaSlcqSlXQaeTsskRbH9MAGcBrOqDoSkCcD8eRFJtIyrnagPoLkUTmV7OgfO6EDkSxgoEoGRoiPkoDOVNM6u65Pz1rmXgZ3lVH2NUdRzUs7arIl+sfNxc8sHkPX2+X84ZdnXUHS0Yi+xhcc2mjOvV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(39860400002)(346002)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(54906003)(4326008)(2906002)(6512007)(6506007)(5660300002)(6666004)(66946007)(66556008)(316002)(6916009)(26005)(2616005)(1076003)(66476007)(8676002)(38100700002)(83380400001)(6486002)(8936002)(478600001)(86362001)(41300700001)(82960400001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEhFQ3RrVzlGN0gzQUlpVCtvQ1RTRHdSZENGL2lXSkExWDJpN1VDRjlWVDRV?=
 =?utf-8?B?eDFvYmgybUY5OFZkSld4dU1CYjcySjNnL1JVckhHVE9uMlhlNk1sb2tRcSt2?=
 =?utf-8?B?ODBPeGg2eFFLRStjK2dKcEM2dVZmL1dVeTdvays2YmhWOXFpV3Z0bGZBVHhh?=
 =?utf-8?B?b25pY0wxRTdjNHZLbWc0Vm1LVFNGZUVVSTBFT2RTMnlSbWdnSXZYSy90T3hF?=
 =?utf-8?B?M0ZOT2VRWXl4MDV5VkdpNmxSVUNjL3RJL1cvT3FxdldmYUF1QS9kdTE3WXB3?=
 =?utf-8?B?MXFMVDB4ajFpSUdJSXp4dEZiakEzWTFNOWtuZTVISEhLbXNFbUovMDJEOC9y?=
 =?utf-8?B?Y09BRHN6Mlk4VTc3cWduaTR0SFEzT1ZScCtxbFZXM2hlZHpmYUxnM1k1NjNt?=
 =?utf-8?B?a1ZQVVN1ek5wWVdYV3JHQzhGUkczQmsvcnZST08vSy9NWWxUZ3BRMEFsdDBs?=
 =?utf-8?B?dEVWWWNlamRWKzY4N012MnZZdzNSOFlHNi80bFlxbnE0TzNpS2RocU9Ba2s2?=
 =?utf-8?B?VGUrVkQ2TTF5M1NjRDRjWllLYWFxSnV1U1M5N2pXdWxPVjRTUUZEV1hoZ25q?=
 =?utf-8?B?bzFJQ2tBajNaK2xuT0ZSNXRKMW9JTG80ZitiTXN1RkdqYWZDOW50TFJBZkEy?=
 =?utf-8?B?WHVPbTAyUDFieFJNbEJpcWdFSFgydFdpZFlscWdNSkdxaDE0UlRORWUrN1Nz?=
 =?utf-8?B?RHVxTlpHanp0NGczMG5tWUw3ZGowdDExTHQzcnBScGllNXF5ajljcXdBM3dl?=
 =?utf-8?B?ZGw5MVkxSDMwenJ4Z3pkQ2swMzkrc3hUQnNYQWlFQXVUUWtKNnY3U0pkTlFD?=
 =?utf-8?B?Y2FYVldmU1lrK0lYSkZkNmptQVNjOHhJWEw5ZFAxMU5MSDJ4Q2Nlam9DVlJM?=
 =?utf-8?B?UWZIcXF1a3lTUW44VnFpcysvYlVNZU93VGtMbDJVMlhiZ2Y5bE02eHVSVVFT?=
 =?utf-8?B?S2VxcVZobTNwNjUzMFc5MXRnUXNhK05TdTkvdFdIanhZNTQwaUpKYVJqZkVC?=
 =?utf-8?B?eXhZa1JPSUJBdTZOUUVPMjhRV0dPZ3Y1U2xtNVkrb0dIRWlyRTF1RWs2YW02?=
 =?utf-8?B?cjdnUTlHSWl6SFdnNVBhQzVWUTNvRlNjU2NZdGwyYXA3WmlCNXlHT3ZNTEdz?=
 =?utf-8?B?SzA1WkFYUTkrVXdSS3FZVGRaQTRzM1RlTXRRTEFQdTNteUZEUWR4bkJpS0JV?=
 =?utf-8?B?aHFiS2NrQW96MmFPemlGMzRKQlN4aS9TN3dFVFNhWUJkVzc2NlhOdTdlZUs2?=
 =?utf-8?B?UDhmYmR4MlJQank3eVk0OXVQREpRc1JNWDZCRHR0N0JEN3ljejU0a1RCMlll?=
 =?utf-8?B?dDdGZkQ4VkhySzM5RGFldTQ1a0lBbVhEc1VxTHc1ZE94eTlQNDJ5TVZZQ0tZ?=
 =?utf-8?B?THFhaDhMMGgrNTFOYlFYMXJaM1NrdWpoK1ZTWTNwTVJpUVRmN1BOZXRVcTBr?=
 =?utf-8?B?TUlDSklXZmlQbHZ0MTdnVHFiTUJNSVBZSFpOT3VKenFIdUdDWFZFWHROVWRX?=
 =?utf-8?B?bDV0VkRXRHAzTFlSWHdyWnVyeHltSTVkbHd3RldJeisrSTRadXVnMlorLytS?=
 =?utf-8?B?dlpDM2E2VlhTU3BCQ2d4RHR3YWVvYkRxUHFQN0RhUVFlcUVyL3FGV2pzZ012?=
 =?utf-8?B?Z1c3TUNmYU1MQ0R1ckUrRFdLMlFEMDFjWW9HL1hSQlU5TEtGRDNIUHNUYzMv?=
 =?utf-8?B?Q1d6Q2NublNOVlpUZmpnd0FOc0tBM1BsU1htOEU5NkpFYkhOT21jenp4UTR1?=
 =?utf-8?B?Mk0vdzdWckkvL0cveS9aMlhMK3lWdkYxNDN2dXRMS051RFRzc0VqU0JqZUdY?=
 =?utf-8?B?VzFFNEZ4NG9NV3N3MmtDL0RFU3RBMWE0SlJHTEFSY0dsZFNEZUdWSXduOUdI?=
 =?utf-8?B?d1pHVldiUnBqWWtDRXFabG1sNEF5WGgyTWxNWXZqOXV0MXNwTXY3YTE4SWo0?=
 =?utf-8?B?emhUbXRzU2lBdEFUTjJuR2szNW10ZkdqMUpWOHZocGZSREVwNlI0TG5FY0o5?=
 =?utf-8?B?bitvMlJVdmUzaytFdFNPTXk1YjBwQm0xdlZiWkh3K2RVZkVBNGRDTmtBd1M3?=
 =?utf-8?B?eU1QTWcrdFE2ZEFzN0g3TzRkRjdFYlZjOUp0NnF6UGY2NlArcklSR1FWY29t?=
 =?utf-8?B?dTVuaTdYaHRpSU05dlp2WGRiVm1FWWt0Vk5VditiMG1lZ2FiV3JVQ0prSjVC?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 361f4e42-a102-4d30-223a-08dc20cab540
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 13:03:37.7936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGIcbt4vt2Ku8EAwyYZ67bTbZgTcUWkv2kMT90cvSWXphW0MMdTsfS9lnyZdwpGPCwaDuymrg5MMWTCZNBfO+5G+oCBXFgF8TIs0cDAjjjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5235
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c     |  3 ---
 drivers/gpu/drm/xe/xe_guc.c    | 12 +++++++-----
 drivers/gpu/drm/xe/xe_guc_pc.c | 16 +++++++++++++---
 drivers/gpu/drm/xe/xe_guc_pc.h |  1 -
 4 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 675a2927a19ef..0bc59a4dbb496 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -368,9 +368,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	/* Raise GT freq to speed up HuC/GuC load */
-	xe_guc_pc_init_early(&gt->uc.guc.pc);
-
 	err = xe_uc_init_hwconfig(&gt->uc);
 	if (err)
 		goto err_force_wake;
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 9b9a1252f3090..8cb546c56bd71 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -251,7 +251,6 @@ static void guc_fini(struct drm_device *drm, void *arg)
 	struct xe_guc *guc = arg;
 
 	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
-	xe_guc_pc_fini(&guc->pc);
 	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
 	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
 }
@@ -330,10 +329,6 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
-	ret = xe_guc_pc_init(&guc->pc);
-	if (ret)
-		goto out;
-
 	ret = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, guc_fini, guc);
 	if (ret)
 		goto out;
@@ -367,6 +362,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
+	ret = xe_guc_pc_init(&guc->pc);
+	if (ret)
+		return ret;
+
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
 }
 
@@ -574,6 +573,9 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
 
 	xe_guc_ads_populate_minimal(&guc->ads);
 
+	/* Raise GT freq to speed up HuC/GuC load */
+	xe_guc_pc_init_early(&guc->pc);
+
 	ret = __xe_guc_upload(guc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index f71085228cb33..c511cb3bdabef 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -958,8 +958,9 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
  * xe_guc_pc_fini - Finalize GuC's Power Conservation component
  * @pc: Xe_GuC_PC instance
  */
-void xe_guc_pc_fini(struct xe_guc_pc *pc)
+static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
 {
+	struct xe_guc_pc *pc = arg;
 	struct xe_device *xe = pc_to_xe(pc);
 
 	if (xe->info.skip_guc_pc) {
@@ -967,9 +968,10 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
 		return;
 	}
 
+	xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
-	mutex_destroy(&pc->freq_lock);
+	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
 }
 
 /**
@@ -983,11 +985,14 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_bo *bo;
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
+	int err;
 
 	if (xe->info.skip_guc_pc)
 		return 0;
 
-	mutex_init(&pc->freq_lock);
+	err = drmm_mutex_init(&xe->drm, &pc->freq_lock);
+	if (err)
+		return err;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
 					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
@@ -996,5 +1001,10 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 		return PTR_ERR(bo);
 
 	pc->bo = bo;
+
+	err = drmm_add_action_or_reset(&xe->drm, xe_guc_pc_fini, pc);
+	if (err)
+		return err;
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index cecad8e9300b4..d3680d89490ee 100644
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

