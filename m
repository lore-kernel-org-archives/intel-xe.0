Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E250C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 01:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0232410E465;
	Tue,  5 Dec 2023 01:34:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B053210E465
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 01:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701740038; x=1733276038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wmJxmJfJoNNjzZ58S2NaIuQJBQFHzlP10ZMCemhzyqQ=;
 b=YivC0GRKeuStPyTjdvyQREmESh3ZHUFuiu3Qb8Um96ezf3ndK9B3uxYy
 d6VdZD89RN79UjIFUQgFT3JpOuhqYwrDErsuzZVGH0veFLg0sZ8hfFPox
 WQN+EEHa1Pnn2+d5/k7tXU6T9YMfXpz5cPTn2znfUwRz0z3XK7K2Je2Mr
 txDFogrPVEaghic8AjyAiNEJQPXaBlWfCf3Y2z1lwgA9VX1ENg9DlTpKJ
 FoyO6ZGyn6PmQm1z2MqloK+wJBEf1YJy9q9R/UGPGea9ERuFlVeUtFhas
 WA8P7AO0MwN5WrHH9oVXwWBSBNDC9fSeiRQcPZOQZE2CYnSxei7MBk0Jd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="373268870"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="373268870"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:33:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1102277744"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="1102277744"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:33:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:33:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:33:57 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJqB0cOD7wz8Gkz23pXsmhffNfW8vzah5gtWMFTC++sya5+5uTqilMV+6wl9aWM3SBN7ogDUF7oqZfAGPUiB2xPxnEWlWHGsYfx1lm2HP4uWToEv8xNhVVMNL8dq28O/hDYKmXLjLcLR2r2at7FpZCaQqASUoCt1xMsuck1TFgaEenKQYjPIDuuyeHuWJlr4JXE0f2+hdBV3HrYxOrhSAgWymuV52VayO1Q9G/ljNz6o2rtDBS5yVtY4qEK615vsvasxs/Q8xDTfcxyQiku1Vbla18gj9uA9ve+oceCJyTDW5Sz9aNF3liq9XE4BK3gpogyl3Amudiw8Z8mp/unmvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umiglcruyQPp1t34GiR6ekP3KWFAI2E48y/tzdk+AQY=;
 b=KZhAIL04bQ6znxI4m9UR6jHFpdAW7cwzH2jMlTXCGdjSnsRecSut7fcw46UTK+jV93tjmWrII09Gm4MOiXdidG8mhI6H+Tz7w+xKLnSkZKXghgzvHhhlj2oVpb12zPH6a4MbF08gSKN37CswiL21VeXVkfL8Yr+pyTmUnfs0a74/1j7MrCto7zGezOC10yUk/bWTv7ZZA3seVQ4E096GX1AR9WnULZmQnxBQo9iGYjyzDGKcvpvx32uB+q+8i3wCnFv4h+25L+FqmvsixPqPFA50Mc3hKIFarKF+y5JUC6wQE3qCkoNkcZBmedWE1RgGEKD+dFpelfVDXrJbI3T4Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 5 Dec
 2023 01:33:54 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:33:54 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 02:33:07 +0100
Message-ID: <20231205013309.1497006-12-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205013309.1497006-1-michal.winiarski@intel.com>
References: <20231205013309.1497006-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 08be3009-07de-453b-11a7-08dbf5323e0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V72W3GtqAK9ufmNEFwsHsJSUiXLeH89Z+2SZT/JsjPE/wxuoOqDgmjhqy93JqaL42kWcXG26yYQ/FmiH7uBjkA+yPf9hA8U+hQN8evGv+vcHzH3zFuZI6Zq8mLO81DyexkEZXENI957nOXQGv1VSRQZq4J+EWd0qttM5vHUU9aLQrppdhyqUduDfJr53lLHlW7zS8MwXfyXbO1qqkCc4W8dOFkPYNAboV4zQ/XE+wHFQ+QXrpxmxnBwo/HV31jxARLClq4Su3Gf7G+kr0k/xqAl5/EcVghEvcx1ytUwQv1P5aNa/EGxLD4gF7NEGnbtI3739DQ566RrJh6N6JJy4oVKPkVw9Gb2YRliMl5pIP4iKKLUDFH9f8w33r6hM3Yo5+hFlLg3EyXGpQpoz09f8AjDznJP7BVJJle4m244ITrCu30X0EmYT6wFb9xHQbhoFQ0PzirjN6U650QCBTOLDArW/36q+Hcf2+6F90wjZhewDFyDJvXmSltrJY2ufj+co8VAzyUDz84pd89ekOr9HIquDZXRNvgXpRLQaZ5wONBUznzfLFZ0zoJ41yjyfMUAb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(1076003)(2616005)(107886003)(6512007)(26005)(478600001)(6666004)(6916009)(66476007)(83380400001)(6486002)(41300700001)(2906002)(5660300002)(8936002)(66946007)(54906003)(66556008)(4326008)(8676002)(316002)(6506007)(82960400001)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym9VaHdoZ1ozZ2FXRVgxODRMR3dGSmpWaFl3WDdmMEU1OFcxTXdKb1FKY3RW?=
 =?utf-8?B?MSt0TVIyYUJlN1FLZHQwbVZEUmJDNjRNMmljNEkybnJKSXU0a3lsaWY0Vlhm?=
 =?utf-8?B?NTVFK0pOYnkzTnBNZVpFUUlHRGlzNWxWOEMwRVBZazNCZlVqZkZLQ3dzWEZr?=
 =?utf-8?B?OC9IdjBVa3V3TEhoS2x2a3dwc0tUYnJZQU5zUzBtRXVqeHpBUDhiMzM0TDgy?=
 =?utf-8?B?QjlSeUo2ZytndWF3ZGU3aUxVdFRHbWdLQ2k0RkpMR3BydDhvZTZWMW4veU83?=
 =?utf-8?B?YkRRNElGa2lGSVRxTng5eHY2MmZHQms3VEtKZE5lREtLMlhueW9YdTIrQ2Rn?=
 =?utf-8?B?R3NpT3NTeVViblF3MHFSb2tYRXMzVjllWFUwWFNGK3p1ZTFNL3BiS0lHVkJ0?=
 =?utf-8?B?T1lRMHdNVjhjejl5MnJZbUhjczkyNnlibUVyRjJGa25XSnZUd2ZaekFicmgv?=
 =?utf-8?B?bGp1NlhxOFB0K29oZlZNUC9YT2p5VklZRVZWNnMveEtzMXVFQjd6UGxXSitS?=
 =?utf-8?B?QmJiUzR0WVlzZ2VXZm1OaXZQNDVBeUJYT3k4N2dnQ3lOWGY1SmpJNXNzMkJs?=
 =?utf-8?B?OVBaMDZmbGRqRDYxLzFtcCs0UGlDenMwV3RTekNNVnA0cnpOTG91OGtHaC9X?=
 =?utf-8?B?TWxnazErK0hCUXVId3ZlWlZoZzhxRWJqVkxnTWRPTUhCQjRKL0ZveGswejRT?=
 =?utf-8?B?YWoreXAzY0RkOUJSTlNRdjVJd2RMWk5CYTFEVE5DaTBKeGZuOUZvdEo5SGNR?=
 =?utf-8?B?SVhtYTZIem1ybXpKRmFncTNlcTNXNklEditGdGl6M1o4WjF6UHNNSS9WSzE5?=
 =?utf-8?B?cm0vZ1B4VnFKU1ZIM3oxLzlMdXE3emkxTHZCcHp6Q2JpeDdNZ3M2Tkd3RlVK?=
 =?utf-8?B?N0o2RzE3bkM3OUUzZnpXdDd0WWliSzNGRm96QjNrd003TTFFdlRucUlDTlJX?=
 =?utf-8?B?QXptOVY4Slk4TlRKUjFaNFozYW1STHlwTktRc2J2aUc5aG9Wc29DTWhEdmN4?=
 =?utf-8?B?S0QxYVF3WXk2cUdLNWx2N21od284bFJnakI5WXJ0NWlJcW9RN0h1djZJVWhL?=
 =?utf-8?B?aG9nS0Z1ZlNhMFJHYzgzOVFrWFo3UUozcnhQR0NiVnNuRlhtN2poWi9Ydjlk?=
 =?utf-8?B?SncxYVZ6WUQweTIrZUdsRzNPSFlPQnRub3BaL1lZbXpOVXkwdThYR1crYTJW?=
 =?utf-8?B?TS9DS1FLK1JNUWhhWTRIMUVMUmtSaWw2NmptTWREejdNMzBrSGhpNmlNM0xG?=
 =?utf-8?B?Z1lKNDB0QWh6ampGZm9wLzQ0cm1KTDJzbXNxZnhuWWNSdExHMTBWVkVxOVor?=
 =?utf-8?B?M3JNOVI2Z0ZLL1ExQ3VNbEIrMFNiN2hEL1VVbWx3R3ZrdEs4S2lQYzNZRjYy?=
 =?utf-8?B?TzFUbTNUc011ZXhOV0lJcnRxWXpLRnpNZlZCTFJiNDJNbDh1ZGFxK3NENkpE?=
 =?utf-8?B?Rk5WemZTMzI2cmhpbVQ2U1p1L1ZVNGh1RXRyK21mWDBWLzVQREFXMGtJK3lZ?=
 =?utf-8?B?ZGNLSCtkdkk4dW01RUhWcnE0NFNma0JYL3ZSUkhtaDhnc2NFZTR6T2RnSzUw?=
 =?utf-8?B?KzI2ZjFyeXZudC9FL0VxZm5TNkkwTm0xVlNxckhlRVEvVEVVU3dxbWhyZ2dh?=
 =?utf-8?B?SW1xVXlLSk5iMVFCZkxFYnE3NzNnT2VKWnptN1p2ZnBnVmJVSFpJdkJ1dExI?=
 =?utf-8?B?d0V4b0hqVDI5TjRMQ1B5ZGhZWHJoZ2RPcG1BRURwdEt2ZFZmK2pJalVCSDNE?=
 =?utf-8?B?Rjh5cGY0TTVIOWh2RDFOeHp4N2FmTmxMb2grdWw3SUp4ekJxaVk0QTgwd2c1?=
 =?utf-8?B?LytuZEhBOE5qV1FoQi9ocnlCVWdpWkpLSGViMGloMXNIeE5kT3U5MG9wN1J4?=
 =?utf-8?B?MXdCLzduVTRIVmNRQllKck5XckhOdWlJUnJtUVFOV3lmSDhhNEZIVnBSKzQ3?=
 =?utf-8?B?R2tYT3J2dmo3RGsrL29LMHQ5d2Q3KzVER2FsdXNtMUVPV1NYbXRKbFNURWlr?=
 =?utf-8?B?UWNRaXlwNHVtbithUzB4MzNVWDM3eU9PcG5Hdm9qN1NLblhJdlZmeFNPeDJ6?=
 =?utf-8?B?ejNXMno1T3IwWHEyMEFDZWhIaDFnQW1MMzViTm1wQ3c3V0tZcnArUklYYWxZ?=
 =?utf-8?B?WXNuUVJVc3Y0Mk1FWHJvdXh0Mnp1ZnNOTlpQbENNa2MrN3B3Q0ZqMnFXTmY4?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08be3009-07de-453b-11a7-08dbf5323e0c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:33:54.2218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eW0pVrDBUQX4lXcClv4vN9R1tedO47gwwV6n5fYpbGBKxt1woeEsFhEex+KiBd69NTfzh5224INvc1/ug0bmsVu/lHDE//EcuBGFnejB68A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 12/13] drm/xe/uc: Extract xe_uc_sanitize_reset
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Earlier GuC load will require more fine-grained control over reset.
Extract it outside of xe_uc_init_hw.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c |  4 ++++
 drivers/gpu/drm/xe/xe_uc.c | 12 ++++++------
 drivers/gpu/drm/xe/xe_uc.h |  2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 4db94344bbde7..a9c71da985d30 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -542,6 +542,10 @@ static int do_gt_restart(struct xe_gt *gt)
 	for_each_hw_engine(hwe, gt, id)
 		xe_hw_engine_enable_ring(hwe);
 
+	err = xe_uc_sanitize_reset(&gt->uc);
+	if (err)
+		return err;
+
 	err = xe_uc_init_hw(&gt->uc);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 15dcd1f91e9c4..72a7b3c2577dd 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -80,6 +80,10 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc)
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
+	err = xe_uc_sanitize_reset(uc);
+	if (err)
+		return err;
+
 	err = xe_guc_init_post_hwconfig(&uc->guc);
 	if (err)
 		return err;
@@ -101,13 +105,13 @@ static int uc_reset(struct xe_uc *uc)
 	return 0;
 }
 
-void xe_uc_sanitize(struct xe_uc *uc)
+static void xe_uc_sanitize(struct xe_uc *uc)
 {
 	xe_huc_sanitize(&uc->huc);
 	xe_guc_sanitize(&uc->guc);
 }
 
-static int xe_uc_sanitize_reset(struct xe_uc *uc)
+int xe_uc_sanitize_reset(struct xe_uc *uc)
 {
 	xe_uc_sanitize(uc);
 
@@ -147,10 +151,6 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
-	ret = xe_uc_sanitize_reset(uc);
-	if (ret)
-		return ret;
-
 	ret = xe_huc_upload(&uc->huc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 4109ae7028af5..5d5110c0c834b 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -19,6 +19,6 @@ void xe_uc_stop_prepare(struct xe_uc *uc);
 int xe_uc_stop(struct xe_uc *uc);
 int xe_uc_start(struct xe_uc *uc);
 int xe_uc_suspend(struct xe_uc *uc);
-void xe_uc_sanitize(struct xe_uc *uc);
+int xe_uc_sanitize_reset(struct xe_uc *uc);
 
 #endif
-- 
2.43.0

