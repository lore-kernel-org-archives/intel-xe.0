Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC02AC07CA9
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7770E10E5E6;
	Wed, 29 Nov 2023 01:18:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411D110E5E6
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220675; x=1732756675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=T/lYXTRx2JIEzAH3GPMai1UkGpFjwddHc7YbityYV7w=;
 b=SfH0OUX5qw39q5AZp2ZwZM9I3WVHDG4ZF7DOlOUrYDoZ0SGHOFmLY0zk
 pbmgiwA1Y9+hi6LBlB/0baHQoILuQ5A1rtYuVXHb4HuAg11HviblS6BRY
 EHY/onO9q6MHT84nBLRYqQzzlv1L88mWj/GWkr3s1dualrbgUfKamxYR9
 aL4ITxalfA9hXWEPbI/Xwf0tPiKs0EIFfjzccvJoLP/CuSA4FsiZubDI+
 LmxtX0bvDU35ymr6nF7Q8QnOVexwy1oMABrGOtqinFLjNsWFOU1YdFI+t
 pu3xm0mgEEka0Nmv5jD/PKmcYGCScarpgG80eKQ5fhPfKo1sH5xxT3DXS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372436706"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372436706"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892272927"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892272927"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:17:54 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:17:54 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6Dq0shXP87Nz35vhi4Roq5I9YHU9sSE8rmDWKewdro/Pu5A24MiyX9LSQzwvKFdkYhWwamEA/T7eBCzKo0GOXtRB/ox7xND/P3q6XvbTreMG9t1Yx60zJAEtzFRnobnvgSc2WbjlirjViZSchQOSba0BEEJHHhaT83YkGH0QbLSWzWtlXwlgfdfYk1U8qaD6FA6vHJ6M+2kMGsxMcDLzAg5e9MVIc1aVfcqcw1r1hfNKO7zFSLj2jwESop083Sk/tRslzu5fJQQzV3OO/Uk0s0+srznqDtPDg418l2AUkbj6xpp67yjwx3+Kwji7WH5KqmbjNX2K/w+V3zwyQjRvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dw119g18NJkJay/oQbB2b1vdjZyNx1eZxIZpCmugAQw=;
 b=gPkcofLbjJiHzcwBu7C3CD+YOMx7movjGzoeNR+ENLyOfu5lHAX5KuteWz/yiUrxcL3WC8L1eOUXqWkqVhypqpyweumj86AvdoDSaCc8EQkKTWHphXSRFQEY0+J20xWmdD4GTByT+fxG6OLuJEdCv/byJptn+leuXHm9RXXbXyO5gXi+nxDXbvQ7LA9DSBOj0C4PbD82R6RqIbESmHkbkbq1GDKIHFd1ANmHFp0ml+s5n1zoaJWKJfMI5jeWB0vQ98wlpLHTt2w7c/82icAkkqWyAQSKXQq296mEjPZlYZJIVSAY6zjDLWSaG9ciktTeUD0NuOYKSKd5Qgmo8aDRkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 01:17:50 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:17:50 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:23 +0100
Message-ID: <20231129011624.836843-22-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 67bfc670-6190-4ed9-8c29-08dbf0790134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HXO4aJbDXVsDW3mtZRHaR3/ehn0C5NXJAGB7fq6DPhphMQiSJu/peB7q01+K2liEefgloZ3n0qlKQUqvRrm7JS2IOv6Sqrpgd94N7hh0nNoidVuk9FP4Bb5Ld2p031ry/5yKufwJq7IjxnWgmXHYqiK1Ccaie497Fj4qfAEXP9ibQnudgUXuncYR2kqIYwEH9uIzjmNpLrhPyAhud5rFqpqqWEpF7/KUWsHT39srak1TDkSesGFGiNZknvcPzWh5KWnFMGWIr3VeHrbXyJywY3B/b6ZxF8Ayr/3DBmbyd2v0+PJToFN1b23J5k6f6olY3HJvRsj8Xmfem8XoY6B9/PmSEItleUatfjcI4HefnfpR/hPuC9nR/k5M+5RhbVSa5WXU3zNmUi9cidtH99QmUSv2J6QcUyB1SUBh8m7VthbrC/88BoEPKTuOoM8LBQzKl4CfO952Fo2GM8cHbqTER008KPRVcuL4p7LALnRzc4LvduWLzWpskkGCh0MU/T1a60LXlwU7uXF5kl7Nb8UDCRk26+oRqPBIVxzIgErhXr1TRgEHoHH0IGAaniO/4WKa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6666004)(8936002)(4326008)(8676002)(6512007)(6506007)(54906003)(66556008)(66946007)(66476007)(6916009)(316002)(478600001)(6486002)(41300700001)(38100700002)(86362001)(1076003)(36756003)(2906002)(26005)(2616005)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFBKNCtsMFBPdkllMkFUdjFtaFdjTzg1a0ZNZXMwajVjMVMzYmlOdUtqaEtF?=
 =?utf-8?B?NEx6NXBWRWhqR09MaFhEYmhHZ0s0VUp6VExJM01vMmlrNjBtRmtTK21XOUlu?=
 =?utf-8?B?ajU4NDBZVTJJU1dDU2t0K3pjNEFoQjBJTDRMcDJwelRCOHJIaXhrS0JEOHBX?=
 =?utf-8?B?QnhNaG55UEhrSU1CcnI5WExjTXpCcTNNcXZuZHYyY0NsT1YraG9zb1hZVm9V?=
 =?utf-8?B?bDEvTjcxNk5QTkl5Uzdza3JVMEJkMXN4Zm5kRytkNTlqbExtSDgxSUFxT2FS?=
 =?utf-8?B?amxQempVWStBbnhlNTc1Yzc0M0NuZnYwN0NJNlFlZ1dsNUpmVnluNGp1ZnNs?=
 =?utf-8?B?anhVQWdRYndCOXJqc2g1aWlDNW8rTENVSGJuK21JcVFIb0IydU1sUHFSOFFw?=
 =?utf-8?B?RXIyTklCcVpCeTliSzVueGJIME5NUmMzQU1YSjJkZVczYkNWaGRtekc2YWlE?=
 =?utf-8?B?SU5CenF4NVlLVzRNNndXcExITjdsdUV5RStuOW91bXdVdVVHTTZXcnN0NEVU?=
 =?utf-8?B?YU14VXIxUDFHY2Z3cnR0Q1hUNlZCTG04c3NabjBqcnpUaGNSOFljNEQ2OVk0?=
 =?utf-8?B?a0piYzc0TVUwUnEwM1lESDN5VHVqN1h4d20vQmhFMUg1VWt4L0UzL1ZPeGVW?=
 =?utf-8?B?MlQ4NHRoT2Y0blF3SXJ2aXJYcFNHclR1ZU1ETXhKdGxxSWFNKzRibWJybVhQ?=
 =?utf-8?B?SEFnWmlvU1hNOGNDMTBGcHkvSHZFcWp1Z1BHTjM1czg2MGt4M3Q4VkhMMCs1?=
 =?utf-8?B?MFRTVVoxR2puamFvcDQ2aU1vZ0RCS2I2Q3EyTEtNWFNjOVV2eHlQWExiYVBa?=
 =?utf-8?B?VjJPWDluVnpBWVdFL3htbDF0RjVmRkd0Zy9lR3E4VHUzekxFZjRFelN3Mmdx?=
 =?utf-8?B?SVhDYnN6aWc5SXJxL080Nm90cThEdFBaWDdKRnAxKzNTdmZDMEVSY1JtS284?=
 =?utf-8?B?WXVleUxuckVmeGYxUzVpZTAvL2JFY0lFWFdxUmVPZFVUUzcvWlEvSTVQNExI?=
 =?utf-8?B?M1M4c3NxN0pkU2lUS1ZGNkVNUlJLb2U4ajVkeFFZUEZ2WGdJT2Q3Yk1GRFFN?=
 =?utf-8?B?U0l1OHptcTNqM2k1TzNna1VaUW5rT1lZQ3B1UEFXc0VRWXR4ZTNIZWs3cldY?=
 =?utf-8?B?WGdWKzlrTlZ0NG1wYXgveWxaQ0xRRDdpY25UV2c5cHFkOFhyQnhCNW80R3Rk?=
 =?utf-8?B?b0hUdGJhQTBoM2h4OENpVitkdUVhUGxhVlJhMHhyMzhLa2dFQTVUTnhYZFNS?=
 =?utf-8?B?VzBjL3FyVW1tZ0VhcXhCQVh2bFdvWDFLakN1UWVlRXB2NlFwaXVhSjc3Sm5t?=
 =?utf-8?B?V0NuTlRxOHQ5aWNZQzFHSFFvMjUwdkY1TDErL3AwSWYvTDF5Znc0RW9sRDNL?=
 =?utf-8?B?RmJxWWJtM20xKzhTMWdRMWlCbmEvcnZEM2NMRkpla1RRSmdYUk9KWGYyc0xE?=
 =?utf-8?B?MGxwblJQb1FjV1kxRlBuUVlmUTZVWE5WNGdjbjJEc0hza0lZM0E2TDZFbnBJ?=
 =?utf-8?B?Z2NMRUtWVU02dzFxaGJHdW85OUpsekFsN1phRE44Q2xwL3RWdFlFc0NGV1ND?=
 =?utf-8?B?MHpVVE1zeGRTdWlMOVl6VG5rL2t4dG5xcCtUN2NNMDJTSGNEWDhDTmVwYlJk?=
 =?utf-8?B?SDlKYnIrYmhsN00rVzlpeW55T0ZjVEJvbXFLZkl2OWR3eGNvUnNwVnhEcUNk?=
 =?utf-8?B?MXBmOEl3eC94a2R3M2Y0TFVJWEZpWGFqTUlvRXRhbldKSmFOLzdlR252NW1I?=
 =?utf-8?B?cUVHRGN5N2pRc25pVDF1NUxReEFRY0J3UUpGaGlEakZMQ2V6bHdqSzlYbkhW?=
 =?utf-8?B?VThxNWFqeU5oZUNsbmVodWFGc1FQTUtjOXMxL0xxOXZxaFhvbU05VjNsekdG?=
 =?utf-8?B?NVIzMnJoeTVhWnZVQzhTRmo3c1FOWlFnOXQzTUFCT2dwS0pBT0k1dElEbDJy?=
 =?utf-8?B?MWxDcjRNWjR5WFdieUJKc0tUcXBrOSt0SjVKTTZQVUhrVXRRaklRNGh2Y3lJ?=
 =?utf-8?B?VnBZYkU3QW1SaFlncndFUUltMmRjUnVvTEppVHI1N0l6ajFGR1ozSloyVDli?=
 =?utf-8?B?UUxCVlVnWENrc0FSZzBES01KQUZPbUQ0YXhnRWZYUkthMXozUURORU1XR2Vs?=
 =?utf-8?B?MnowTW91K2g3VjNZS0JEVkhjU0RuZ2wyZnN6UmFMaDgvakd3NVJ5UUU0YnZi?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bfc670-6190-4ed9-8c29-08dbf0790134
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:17:50.5946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SV6CBU+/o8MWF0PO2gUJfcr+REtELB0xHffduSHFxXRwBOw83IDBnLBsKibFLS9qEqIPJQ22Zp0K89mC3RXr2D5kXASzvdG/FVTqcZ17bQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 21/22] drm/xe/guc: Move GuC power control init
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_pc.c | 17 ++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_pc.h |  1 -
 4 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 9eaab11cf29a6..964e76f931a28 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -348,9 +348,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	/* Raise GT freq to speed up HuC/GuC load */
-	xe_guc_pc_init_early(&gt->uc.guc.pc);
-
 	err = xe_uc_init_hwconfig(&gt->uc);
 	if (err)
 		goto err_force_wake;
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 36457477616a6..6777269f6a9bb 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -234,7 +234,6 @@ static void guc_fini(struct drm_device *drm, void *arg)
 	struct xe_guc *guc = arg;
 
 	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
-	xe_guc_pc_fini(&guc->pc);
 	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
 	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
 }
@@ -307,11 +306,7 @@ int xe_guc_init(struct xe_guc *guc)
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
 
@@ -347,6 +342,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
+	ret = xe_guc_pc_init(&guc->pc);
+	if (ret)
+		return ret;
+
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
 }
 
@@ -557,6 +556,9 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
 
 	xe_guc_ads_populate_minimal(&guc->ads);
 
+	/* Raise GT freq to speed up HuC/GuC load */
+	xe_guc_pc_init_early(&guc->pc);
+
 	ret = __xe_guc_upload(guc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index f5009a7968afa..4dbc89e91bbd4 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -931,12 +931,15 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 	return ret;
 }
 
-void xe_guc_pc_fini(struct xe_guc_pc *pc)
+static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
 {
+	struct xe_guc_pc *pc = arg;
+
+	xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
-	mutex_destroy(&pc->freq_lock);
+	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
 }
 
 /**
@@ -952,7 +955,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	int err;
 
-	mutex_init(&pc->freq_lock);
+	err = drmm_mutex_init(&xe->drm, &pc->freq_lock);
+	if (err)
+		return err;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
 					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
@@ -966,5 +971,11 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
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

