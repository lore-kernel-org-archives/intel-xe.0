Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEF9C48291
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 12:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6537710E726;
	Fri,  2 Feb 2024 12:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDvBzYz+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E09E10E5CB
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 12:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706875762; x=1738411762;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=8sstbO/2a8wow6ey/0W98TFyhg3uoSkOLQA4fuRqVK8=;
 b=WDvBzYz+CDY4WjLd+3uiqz+8Dl8XkZSfZsPVP6FAKjWK0oYb2/zuNqRy
 Hooa9xSCij8sCscRELMeBIMLKOu8WB/8pSS4W+2F03nyEIFsmBXcfWoer
 BKMtL0pEjlLsr6ITH2pRqUozIRIERVMp3Mht7TXRhutsRPX2eoZVxNAzd
 izgN855iY+eWF+HNduEbS46QioGNT0JVnvOKdn+pP/2g+Yh55Y7Ei1eka
 t85ewzkCVBtf1P08RE/gbBcsM03FnuZioif4PzdCBqQPXO2fS7QmXjefU
 xnB942csUIq/x3KFHzlp4rZlB11ounpaPrfajakVp4b9FdV2Y95lWadpr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11243989"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="11243989"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 04:09:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4681070"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 04:09:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 04:09:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 04:09:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 04:09:19 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 04:09:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVfGYladUpdZehYNSP6Xr80XDo3RA8UewuF1KpHQXRCoq5R0FpdCyefqDA8nTXvLUfyicVJp5A1f5upuj6VMnNGqh71x8/Ipnoe/YVBkVU3v9CqLV6Hfiguij7QN94w8SsvhPFDT1PXRIDl/rOwWo9Z9KkIFnW7eJwzprWsv0S/vqkDyAydketZfQxp/WqGmEJEoBozKTlBPyTkPxvnjY/lLPj1XYGIu25oQzDKjEokvkzpaG3mewkNJPpxHPKa35GMr8sbUQ8xBYrZfAkfHurqdPvPsHw+Fueb7FLqPrz7KFv/5C43YHKurqppYqYJwMWdxqesMRw5ysz1BrUpElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myUD0N56esnIFmGETxxn5s/n7Rndm8zDkomWiOecWN4=;
 b=J6+KW+0psI6EvwOYEI5FBCbImsvRcSBQOOHTTvpITAohjV5IO8AG5OJyEeLZHXWjAgcPa2ovuRM85cBI4MOf23dJTU475sO3zf1MW7S9sWmeaYU5OWg4QFaCrYdPiKPBSyVr0icyayN29407FLI1uTR59lOWYyKn7NgrFfc5tSHIQN4muhpgzKvJ+7UusBX3osQYroSsqFn2q/4sS9bkejJoqP/10xMjVKuuKEkvJMymfvLN3l4JWqfbs0OuA/n6uo16OyPN8X/5jccVL3dVBFauTrDWgq4vIJSK2szBL1jERj59W5AD/bHuR881MhxiXAyagp7HyNe6CWY8XeMlKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8493.namprd11.prod.outlook.com (2603:10b6:610:1bc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.26; Fri, 2 Feb 2024 12:08:50 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::a818:a5e:b1b1:511]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::a818:a5e:b1b1:511%4]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 12:08:50 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 3/4] drm/xe/guc: Move GuC power control init to "post-hwconfig"
Date: Fri, 2 Feb 2024 13:08:33 +0100
Message-ID: <20240202120834.1187656-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202120834.1187656-1-michal.winiarski@intel.com>
References: <20240202120834.1187656-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0240.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: 8933e80c-8d87-49c6-153d-08dc23e7b77c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2AdB9TM6eMPkAc/bGLA1NCP8LzWNlsQ+Wk7n4XQDNygzQuwlX19tezzvAGIH7/YXwHelbU9LxjtbXNkaPnoRsVUXH4IoLDxiQ/MpqH4YkHV/W04mWBlsbxj9ilXKWYwedjn49lBayG/gyjoTVeP7vleUgQO06dGQB9Ey+x21FT7KO6zlDOiHbqWRc5QT9PSMS4ZRI98nphi+evMM5mDav+hjCFZzHRkcBUbmD8VPB3o3QZdUrZOS6qCp6PkP+w1NkjQaiQC+O3TqyZMn88gOLx53gLnMtJ37QZ3MxcNlme/W2/FwX5/R7oU8lNaph5JgKxHtqhOQNso4+rixiuQVzZ6ogBGQOgUmLD+35PFysdkS2nmDC6h5hNnCpCuog/50f8Q2DdIoxNf8RuIyPDJho6Lu+XO1jddKAW4z0zFPPkk2W3QGd3GYIo/ktOaYLQ98A3ecjeobsEq68tZgcIZxpecEwNwcZC/7CCWVHyEFQD+z35K8A8aFW74Jr3zTxv2kyIkVL7K3MPj0sOb8VLpA7lDvSq9ar9OYCXDyYptW1LN+cMfqq9Lcm6XyIZWcnDS8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(66946007)(2906002)(5660300002)(66556008)(6666004)(316002)(66476007)(8936002)(8676002)(6916009)(82960400001)(41300700001)(478600001)(36756003)(38100700002)(86362001)(6486002)(6512007)(26005)(2616005)(83380400001)(1076003)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnZJenI3Wll2SzdtOGFKRnlFSDdoZzhDM1dFeUhWYmlZMUx2S1dYYXU1TU1E?=
 =?utf-8?B?MGlRSFJBZ3pvNklqYlh5ZFFwN2NUYTlWK0xyQzFPUjdhMGprZldaS0ZzUzlS?=
 =?utf-8?B?bVNxcDVYZFFVMDF2NmVXUjZYR0oyTnUxNFhDSlRpK0hPVDVuK1djQUR6QllZ?=
 =?utf-8?B?NlllMFhIUDFMT0ZYbU1SREJsK2tRTk9udUg3VEhXQ241UTRhNXFkQ2YvalRK?=
 =?utf-8?B?WWdDbWlCRlFueDNSbE1DNHpSS2pic0p6S1hhaytMeVZOSnRBakhpRE5XYzdl?=
 =?utf-8?B?V09qZXlRcTE5eDU3Z0NFa1BtbHNCMldzckNCZHJXNWgvcDZFcXVmN2Q0MXpt?=
 =?utf-8?B?K3RuMGZEL3BFQkRVR0VDWmZwTDJSRldWbHgwemNSckdpa2dNdXB5NVdpR1lT?=
 =?utf-8?B?WGdkN1d3cnU1UkhidnFQeFkzcSs0dXk1bk03S056RWhoejdlNEM2YWR6bUlU?=
 =?utf-8?B?dHpSL2JPRDBaQzgyYmRUYVdrMkdDOU90Nks0V2pCSWIrM3orSVJmYzBMVnhB?=
 =?utf-8?B?ZnAyTHdpbGhPN013S2ZLVXhvcmpDMTZjNzFPMHNVZVVYaUpaNVdPSVR4OGx2?=
 =?utf-8?B?UERsTVUzV1Z2a0Vob3NTclpZaDU4aHgwK2k2NnY1S1gvQ2YzM0d3MG4zcDNR?=
 =?utf-8?B?RzlhK2VnSmZ2bHVjM2lHb2ROREdUWTZNVXliM0NpOGtzNEQrenIyKzFwditJ?=
 =?utf-8?B?eklPb3lMYjhJNHVuK2Npa2FQZysyanIrVnFET0k4WVY5RDJGUkJFQzZQS1ZI?=
 =?utf-8?B?czlpYmlQdjMwMXJzZUpRek45VitFUTk5YUh1RCtDVGxxd2tFYU41MVB4Tk8r?=
 =?utf-8?B?VmwyNnF1bTVta28ybUJPYXluVExkMU0xc2N2NWMwZWUvY3YwN1RhWE1SRVdk?=
 =?utf-8?B?dlczSUorcTZERVF6N0RtZ3RtNE9hMlhPenJyQVkxUlZFZW5ONHZ3RGNUNTZt?=
 =?utf-8?B?Rk1sNkUvclk5R245YzVHb3FTUVRSZXM2VFF1bHhDdFIya2FFeHZnNWxDakgv?=
 =?utf-8?B?aXh0aDR6ay9jbC84aEs4OTlhWCtIZ1llTUFONkhTNmNYZksrYXBlQWhqZjhq?=
 =?utf-8?B?QUJGV3F0YUdSQWIyVDN0UGJsRkswMG1VRSs0R0NRa2dvVXhDdThHWE1wbnZ3?=
 =?utf-8?B?VFNWck9oSWdPaDJiWm5PeHFZQjIveG1nMmp1R1BqTm9tV3pEb0NiQ2QyYk9y?=
 =?utf-8?B?eUhYMmhqcElGR1gzY0NOTVBkZy85MzR5YzZtT0tWRndHR280ZFJuYnRsbVhF?=
 =?utf-8?B?aFo0Q2xoejhoK2RyWTZjN1pqUmhUdlgybVhneFNIWlNBNU4yYnNhOUFkM3hu?=
 =?utf-8?B?eit2TExKK2I1L0FQelkxWUR2cGdkYmI3emVrTVQ4RnFGS1ZYVS91NmRmdmhO?=
 =?utf-8?B?NjNnRjlRK28vMkYvUTN1bjlYUWV1cFI5dktFai9GaFFNOW50RXFpcVhDdzdZ?=
 =?utf-8?B?Nk5tYTJ2RnZVdk5ZWWZ6ZERIaEpQSy90em9yNDZZK3pFUyttTkhJT1BGSUVC?=
 =?utf-8?B?ZklMdHJVNWdNU3ZFZmpZVEN5cUVwT0lmT3ErSnQrcSt4WnJJbEZHTE9VTkE3?=
 =?utf-8?B?OXJuK00xcy9OQ2RvRjRMVVE2ZXpOaWtFK3ZrbDYwRjN1bUNub1BReFZaUnZT?=
 =?utf-8?B?RDJZbUZ2a0ZXRzRiNlN6R3AxUC9PZ2xwR3Q4STJ0N3BFZkNzMlkzTGhwNHNo?=
 =?utf-8?B?OTJxSWV2Und1MDJsSSs4UklQdzNBWk9hQ0RiYUloRHlibjl1bno1T1JTdWVi?=
 =?utf-8?B?dnVFU3ZuYnphU0h6cVRoVno0amNFck9Tek1PUm5HVlpNTERReHkwTTBtdFQ4?=
 =?utf-8?B?eno1TkFMNVQzU3N3OFhhTmx2d2wwWE1tWEkzdTdwTEtLeDZ5eU45dVR1ZFRY?=
 =?utf-8?B?S2VodlJmY281ZlhneXhpUzJuejZSTVZySlpMV1A1amVSdWo0aG1Jd25KcDMw?=
 =?utf-8?B?WW5ZQUlZcnp2dEt3RVVSUXYxa1hBajR6OVVFcXJndFd5Z1lQb2tBNUJmZTk4?=
 =?utf-8?B?VW5CbUJ1azFsbXQ1aWM4RnFuZDFjeDVSK2dOVzdiWml5UkVrZENoVTJGV0xK?=
 =?utf-8?B?ZTUvcUI5RUkxVy9DK09Qc0RIUEJGdFREckVSeFQ0RktuSEZYMFo2TDNZTFNR?=
 =?utf-8?B?eE1wV0NVbW9lRy90dURFZG1GUE5CMjF1a2lDSTlibjdNMjZwb3lnN29EYStQ?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8933e80c-8d87-49c6-153d-08dc23e7b77c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 12:08:50.5499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfkY1OVtwBd8dBPbHzxyvtbJuQrc6CLdoeeJIugwstpbwf0EVZe7ZRUKBFRUV/+QSNAXzIIJn1h9ehff5QVi4jLDRd4/u+hAJbQAq6ic6a0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8493
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

SLPC is not used at "hwconfig" stage. Move the initialization of data
structures used for SLPC to a later point in probe.
Also - move the xe_guc_pc_init_early to happen just prior to initial
"hwconfig" load.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c     |  3 ---
 drivers/gpu/drm/xe/xe_guc.c    | 12 +++++++-----
 drivers/gpu/drm/xe/xe_guc_pc.c | 19 +++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_pc.h |  1 -
 4 files changed, 22 insertions(+), 13 deletions(-)

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
index 8c10546e387df..68089556c1409 100644
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
index d91702592520a..2839d685631bc 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -956,10 +956,12 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 
 /**
  * xe_guc_pc_fini - Finalize GuC's Power Conservation component
- * @pc: Xe_GuC_PC instance
+ * @drm: DRM device
+ * @arg: opaque pointer that should point to Xe_GuC_PC instance
  */
-void xe_guc_pc_fini(struct xe_guc_pc *pc)
+static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
 {
+	struct xe_guc_pc *pc = arg;
 	struct xe_device *xe = pc_to_xe(pc);
 
 	if (xe->info.skip_guc_pc) {
@@ -969,9 +971,10 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
 		return;
 	}
 
+	xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
-	mutex_destroy(&pc->freq_lock);
+	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
 }
 
 /**
@@ -985,11 +988,14 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
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
@@ -998,5 +1004,10 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
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

