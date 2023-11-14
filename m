Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C51DC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EB310E43F;
	Tue, 14 Nov 2023 11:46:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A75A10E43F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962365; x=1731498365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Kd3J2jHr9ph69GaqiKtMdxSIRfyE/AWauB9QZjOVRJI=;
 b=IAGxPV6dcw3xEOb3RLmHI3Y1w7VolcGCgrWmwInlQwwarGD292IC8yLP
 eEQWNVvEqD125sdMeSrdvr5bv3Z6f5X5+OmV3Lb8ZaF7pQ+foN6MP2bRz
 f+gXxc0WsDBZJ02pc+sT9+y/PbmhEG5tMasSjAKhOhORiAS5/F4Kwqz+T
 gWwKqPLxfwsm3iISkXPlPNWkKOuX+/M73FZ1qQfhxuGrHmf44Vi0a8//p
 5QrnGOnaSQ8quCTKPBgIrnWypHPfIPkX6afiOE9z94qLU/1KTx/mrj82i
 X1tn+jQFTyVAly119mgemDflTJ8FDdgAtx9DbjnmG8TE2lzT/yM82nnB1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="389495631"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="389495631"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:46:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="12782317"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:46:03 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:46:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:46:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:46:02 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:46:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eG2W+q3eVV1ZfkQXNL6snEeipLM8IEteW/0mLgPKwy8xKFyZUmv7r7JvuLlPGooXBHAguWsnC2wBfJlHGyVfs/z4t6I2f+xNQph/oJu+6N0q1/O277OR0GsfAOD6eRxCkCLVpBC25JK1EPXA8IrX1yPiKmvyDD6wmC6uNT9nf+FwVQdoxAf8sjbGdy0GGl8BjCMXgrXf3WoXS9b1aOqnShlXqzGCPLT6Exy8WM8rAFiqjCxpZQSgAZr1sD4mhVCmlBAWDhn8TaIFCm8bUQ4NqiBUJWX9KX2HxCzaVGf9zX30a4Hi6owS99mtJsYcEg3eZlZcCeofCmtdVwceTdnTFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xwbvU9qwh9uOkcCkiXiYtflH8Fegu1zGGXnxQbYMT8=;
 b=Ipu9TTmRaGp4lihSAaMsKCcN2t7TuP3yxWf9XLDQrVvEMmQJRzZtE7H4FiDlt4F8EWhM0DMron9Vz7+tI0tSJptnnSvc2vIpkYFrAO65A/e8K/WL4T7D1+9pBXDEmgs5pTl1CNlL4cArpHBKZoY8aYiROEO6rJNiQbigL/dfzk2xB6jqsNux/bLWHJu72SLnQ9EVefxcDZQa/yA8Gtxf0skVq9/kPuIk3niSd2b1RHKx3JGSyJNgLE54T7k9erCBO7cLw8b0tLYPayZB2pVSbw9xEv+tUA5vGlaJu/JcBA3JJYnM0g87++kSuT8mZMFe3lRYPgcwQxzyg4DisGTEvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH0PR11MB5563.namprd11.prod.outlook.com (2603:10b6:610:d6::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.17; Tue, 14 Nov 2023 11:46:00 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:46:00 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:44:05 +0100
Message-ID: <20231114114405.2207747-21-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0047.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH0PR11MB5563:EE_
X-MS-Office365-Filtering-Correlation-Id: 530c85cd-2632-4d98-a45e-08dbe5074616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /kLZolmKg7/mjpGo72TF8m7KlVL1bZYZNP2rZXbRstO8EAmUQywF5kcenBVSM/um/SbKTNWbpxko+uECiAUMcjth2a2lzKNLhUGiQ2ZR+AD3FDEd0rkYoNLbA3k8gHDgAOxCwtnr2fdPnkOBDW40GjV5kVg4wkfT5nl+VadzI/r9KHsZu/CcJYjXeE1RDm1Ts2NPj0DATjqHzu8cnb4msqcLZVnU9kvUsYt1HkitKE/jn8RRjPa3YbVcye4Zvysun4ndWkrRxOmSNeoGnZgYArwkyh13E/zhZYGeFYtd9RwQxfqMkXUeohAe/TGRLHaw2FhN80zTrimVHJ0wurMy8+k4ug3JZwiKGtl8vj7Hqxf+p+7AxxKqCL8fRmtmfAvGDl+YpGS1OpIBaWWI6f1JPCpj0TsjrChUFV/51PXh4fe+DhPTPgQRJszfMGE5fItXQYzitqyR26HIFlQx7r9FNhqAW/PkmU3e57hnjvV2ITJw1fw++sh2o8xYLcwirdrnfzCnuprnT48eEBp8hQrnXL4+y27CGLtrVimJULE/gVx5ErdseCz0M0phVDQ4hqGMV+qDKQrdh2vDQhoVCnsx7JctPRcSne0j9dfby7s8lbA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(396003)(346002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(1076003)(6506007)(2616005)(6512007)(83380400001)(5660300002)(4326008)(8936002)(8676002)(41300700001)(2906002)(6486002)(478600001)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(86362001)(36756003)(82960400001)(38100700002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3dZZG02RDdtazUvQXZyVjV6a0ZxNXN0TmNmYWN5bzBtZHFnM29vNVVnMTFT?=
 =?utf-8?B?WmZiVUtGeVNSVkl2MSttUWlUNVI4NFNrbnZGb1pJaklQY09QV0NZTTBBbHpI?=
 =?utf-8?B?Y09FWWpJeW1zUkw3dGNkMERGQk1mQld1SDd5Y0U1QiszOTJ3by91NE5SR25j?=
 =?utf-8?B?NzhPcndnZ1oxZG9HR2NFV2huWVoyUjNkQTc1eVc0ZHpmUDArbkE5MVBZSWFO?=
 =?utf-8?B?Q2FaUWt3bmpzQzJmNmowTG9OeEtwZmQ1STBkeXo0TzBmZVQyc2RxNkZwSTFi?=
 =?utf-8?B?akw0TGxzTmszYjZoNU81b2xidEhMcnBqSHhrbVk2NjF2cEJMUTNiVVZmQXND?=
 =?utf-8?B?V1Y4b0RQWlVQVXhjcnNkU1JqU1pzRFdVRGFtTlpnSXUxWlMyYUZrQk54R2Fr?=
 =?utf-8?B?aTMrai8va253akhGeWNFdW84d21Zb0tycE9PMlIwVEo5bFZ1MXBrYXVxM05C?=
 =?utf-8?B?eEJ1aC9sVGtBYjhjbXJSV25mR3NwSklsbXd1ODVKRlk1M2VVc3VlNFRiaEZU?=
 =?utf-8?B?cTJsMFk5U0o3NEovNXM0MXhGUmdtei9jZVBFaGsvaFVyeXk0M1F6ZjY5eTBk?=
 =?utf-8?B?OHA3eEZmb0NZaUxBNFZ2cVN1UUtKMlFvbXNQcEFDY3FRcldyTUVYMnJwQlp0?=
 =?utf-8?B?OHJZRVBObVV0cXVPa0p2eDFNcFZ0aHNXTXR1MkljRzVUUUx6Tjd6QnVzQjRK?=
 =?utf-8?B?YmJ3enhiMlRHTUFRVTh1YlYyM2hWMCtHU0pTVWNUamUyMmlEUVJpV2xsdFpE?=
 =?utf-8?B?dThaTkVxTFNFalRJQzAvUlpWeFVPOG5qVzlmeDlFWTBRNnVDR21DOEpSREw0?=
 =?utf-8?B?d1RVTEsrcGdNQ2pkcDZ0MU9tdVQyRHVONXdSVFdSWjMybElDN015YTlCc0pZ?=
 =?utf-8?B?U2d3UzBrUmt0aXJnNTRVaEtnT0pHOFlvK3hVWUpQemlIYmNwM2YzME4xNllV?=
 =?utf-8?B?NDJtRDBWMUEzUDJkV1NUdHZISDVQdmdPNEN0V3NXaS9Xa1dTZnBnMkZJdzlp?=
 =?utf-8?B?d0N2QVQ4blRRWHN5bEE4ckgrOUtyNDYvZXhUZm12UjVWdHhoRjdLNWtIc0RQ?=
 =?utf-8?B?cFFGS1Y5QjZ3QXBmbjc4QmhzVlFGcUZOLy83a0xzRkxGUlBkekxFMGhVRGcv?=
 =?utf-8?B?MVhOck1vWU5LRUhXZ0phS3ByR1J0R1R1a3REa015cXArTzJXZWNoUm9FdE0r?=
 =?utf-8?B?Q0VQdHZuayt6UWZSaDJEMEc5Q3h3MjRYNUZLenI3SjhVRWNSK0pwV09QUTRU?=
 =?utf-8?B?OXE0MWt6cXZJZzdoUnZFN2tVaDhnNkhLY0g0d0lJM00zZTdldUtkTmhqUmxy?=
 =?utf-8?B?dHhkL3F1M28xYnRoTWl3ODBHR003QmgyOU5HVXdpTU1DY0d6S2R5Y3VXZmgw?=
 =?utf-8?B?Z01jYUt6SU1LaUo0TmJnRjZvcVp1MTF1SFV5WWFHUlJWeGF2VHBwRkVTMjlG?=
 =?utf-8?B?QWY0ZFR6bzhSZ0FJSXp4Q1VWNXJyMEtYQnZYL2cvODZ2MTRZWGdXRkg4aTd1?=
 =?utf-8?B?UjlURDFabnNLbkNoWFdrTjRSZzV1UjFvb3BEVDdqTGFMVUEzdnlUaVlwQ2Fj?=
 =?utf-8?B?RFF5T3lKTktFT1M3N1R1eW5sM2UwOE1hMk0xQjRMMXVwcHNrTGlKZ3JhbDVp?=
 =?utf-8?B?NXRhSHZid3RNZFI4R1NiNkowTEdjMi9Ea3FuUlZ3TDJmMmY3dXNvT1BrSjBR?=
 =?utf-8?B?cmlOaUVPTDduWTBRc0VQMUVRa2xxcXkyMURJTHU5Q2V5WDIyMzJLblN1QTdj?=
 =?utf-8?B?bVVmSzRaYTNSR09HVVZ1eEdDVzlOMmNxWGhPVjdXNVlFNys5TTg5aGhsUUtF?=
 =?utf-8?B?THBYN1RrWTlUdFh2QmhvYVZDYXF6bUhvYlR2c0dBemtRSGtKcVJUL2xwK3Vl?=
 =?utf-8?B?YnROKzBrV0ZqcGNRMTMyWUZGMHJTVEEwU2QyQW5rV1lMY1R3WDJSenV0Sm8z?=
 =?utf-8?B?ZEVzeDlxbi9LempuYm83Tk8vUmlKRHF3QTZMa0NPRDBOcjdYaVB5a3BiUFky?=
 =?utf-8?B?OG5KN2dEODFqdlFPYUE5dTdHWUJVQW9YdFVwSzBreEdGM3dqb1J0cnMzSHBW?=
 =?utf-8?B?R0c0UTVFRXFkZnhUQy8zbDdzdEVWcHI5TUprTDBGeEJNRTBCelVYSTFPMzNM?=
 =?utf-8?B?VlZoR0V2RW1BeG1SL3c1T3h5eTJVV1QzRDdkMFhuemlrTE9oMkJzY1hFRm5S?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 530c85cd-2632-4d98-a45e-08dbe5074616
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:46:00.7959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7kxpgz53EqOsApmucdhA2LfFiVXdhFiKG26DhNdeNauiEFj67mQcAuihSIJwjBg26MBwOznSZLtK22uBa6x2jqdpdvJCeNn09cInrbaCt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5563
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 20/20] drm/xe: Initialize GuC earlier during
 probe
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

SR-IOV VF has limited access to MMIO registers. Fortunately, it is able
to access a curated subset that is needed to initialize the driver by
communicating with SR-IOV PF using GuC CT.
Initialize GuC earlier in order to keep the unified probe ordering
between VF and PF modes.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_gt.c     | 16 ++++------------
 drivers/gpu/drm/xe/xe_guc.c    | 15 ++++++++++-----
 drivers/gpu/drm/xe/xe_uc.c     | 35 ++++++++++++++++++++++++++--------
 4 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 531aca74e8eb4..ecbf1effecc41 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -32,6 +32,7 @@
 #include "xe_pat.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
+#include "xe_uc.h"
 #include "xe_query.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -414,6 +415,16 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	for_each_gt(gt, xe, id) {
+		err = xe_uc_init(&gt->uc);
+		if (err)
+			return err;
+
+		err = xe_uc_init_hwconfig(&gt->uc);
+		if (err)
+			return err;
+	}
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 73665e4e66f22..bee661e1f164a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -344,14 +344,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 			goto err_force_wake;
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
 
 	/* XXX: Fake that we pull the engine mask from hwconfig blob */
@@ -415,10 +407,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	err = xe_uc_init_post_hwconfig(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
 	if (!xe_gt_is_media_type(gt)) {
 		/*
 		 * USM has its only SA pool to non-block behind user operations
@@ -442,6 +430,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		}
 	}
 
+	err = xe_uc_init_post_hwconfig(&gt->uc);
+	if (err)
+		goto err_force_wake;
+
 	err = xe_uc_init_hw(&gt->uc);
 	if (err)
 		goto err_force_wake;
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e04b04be32b7d..895bcc24ae2c8 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -572,26 +572,31 @@ static int __xe_guc_upload(struct xe_guc *guc)
  */
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
 {
+	struct xe_gt *gt = guc_to_gt(guc);
 	int ret;
 
 	xe_guc_ads_populate_minimal(&guc->ads);
 
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (ret)
+		return ret;
+
 	/* Raise GT freq to speed up HuC/GuC load */
 	xe_guc_pc_init_early(&guc->pc);
 
 	ret = __xe_guc_upload(guc);
 	if (ret)
-		return ret;
+		goto out;
 
 	ret = xe_guc_hwconfig_init(guc);
 	if (ret)
-		return ret;
+		goto out;
 
 	ret = xe_guc_enable_communication(guc);
-	if (ret)
-		return ret;
+out:
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 
-	return 0;
+	return ret;
 }
 
 int xe_guc_upload(struct xe_guc *guc)
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 13e76e6805ca1..069207a7f2f21 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -29,8 +29,16 @@ uc_to_xe(struct xe_uc *uc)
 /* Should be called once at driver load only */
 int xe_uc_init(struct xe_uc *uc)
 {
+	struct xe_device *xe = uc_to_xe(uc);
+	struct xe_gt *gt = uc_to_gt(uc);
 	int ret;
 
+	xe_device_mem_access_get(xe);
+
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (ret)
+		goto err;
+
 	/*
 	 * We call the GuC/HuC init functions even if GuC submission is off to
 	 * correctly move our tracking of the FW state to "disabled".
@@ -38,26 +46,36 @@ int xe_uc_init(struct xe_uc *uc)
 
 	ret = xe_guc_init(&uc->guc);
 	if (ret)
-		goto err;
+		goto err_fw;
 
 	ret = xe_huc_init(&uc->huc);
 	if (ret)
-		goto err;
+		goto err_fw;
 
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
-		return 0;
+		goto out;
+
 
 	ret = xe_wopcm_init(&uc->wopcm);
 	if (ret)
-		goto err;
+		goto err_fw;
 
 	ret = xe_guc_submit_init(&uc->guc);
 	if (ret)
-		goto err;
+		goto err_fw;
+
+out:
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+
+	xe_device_mem_access_put(xe);
 
 	return 0;
 
+err_fw:
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err:
+	xe_device_mem_access_put(xe);
+
 	return ret;
 }
 
@@ -117,17 +135,18 @@ int xe_uc_sanitize_reset(struct xe_uc *uc)
  */
 int xe_uc_init_hwconfig(struct xe_uc *uc)
 {
+	struct xe_device *xe = uc_to_xe(uc);
 	int ret;
 
 	/* GuC submission not enabled, nothing to do */
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
+	xe_device_mem_access_get(xe);
 	ret = xe_guc_min_load_for_hwconfig(&uc->guc);
-	if (ret)
-		return ret;
+	xe_device_mem_access_put(xe);
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.42.1

