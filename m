Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62E0C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA6810E447;
	Tue, 14 Nov 2023 11:45:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A8B10E448
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962354; x=1731498354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pXaTziMeON+JOB3K2LYqkkDfzbLW0eAL8ZODDW1IkG4=;
 b=HqCeeGdlLnAMq2RT4pbwiE2gaiXKq67yYup7hbTB8gxoHTUP4cDCQRYD
 j5x90GETa7Wsp5rXUmSme7HvDXYTZBJhN/NRJtyPmcEpl0ba4nZTa7Osb
 A41X4X466cOPtzPactpt9wJpywfVvKmdM9qZs//FQG9+l/UjyLWjmQ9un
 JaIoOpyY27EXcNvZOlk4gN/vRcOqPIMtDr7A/8IH8NgslT6+F7qoWKFNo
 TdJrNLeDW+xuYPjQ+Z86ASoAMkfHfd/d0PXbR8ZCjF4jDp2h5I05tb5Hu
 Pr0SdARKHqkQo+qyfFAaAr5hG6Az2YJYwcmQZ1ETqqNHqRPOgPDr8YGOm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="476849823"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="476849823"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:45:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="741070959"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="741070959"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:45:53 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:52 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:52 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:45:52 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYagHnn6MnQhlFTQ10DqtkTqapJt/j5Kcsnanrr3WN/7iqvVqySNc1zQpX8E0i99/ApZIrUvb4wk6bsyAWDCzfSDUddMYey3BddFCMmTYs4DJNX1EZ+q6jWW53X9WzDnbHyRteuZ1Uc/qdWgshe2TANC6ewiZ6DDEfE0YuHM1rgoGwejoQ6JxjpCviL5q5p0EMFsBAWj3lY6kvQAgPv0K6d1kSUNyqWPNR0qy7KCeC9k06c9NDirOe4Qd/efXAAIaVjSpMieoi1jMox5tHOffKJIRTnU21PsUSn/7qFgcWTobspmdiCffdfubScg7p7yHI0QnXaGCp0pYl8vW1scVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CI77XWZV29r6RPLZKOmW+rCm18XXYp6I8+YQvkK8AKo=;
 b=InfgbFIkPiPK803CzFmzOEi/wQOq1qerOQl/Lwy4XSFN7vhXteSdGcTSrNAjzEv+4pVwswYjReoxzCIbW8wPOAjSe9/ylWhmq6oQBcwTmaHViM2+oYT/IOPzG4ahLFSAkiX//qTwD3OsmyXCg0TnyYIOgm1sYIvf0Hz6Lg6RZfZr9HBMaMBlJmvn0873i7ZkdIxUuVIHWS1EkRXU8Pakx39KM67Nr332LtOY9ZzUo3z16K9o9Y+zAgz/6fo/QglY/CZPPheU87BufoSy4Pwq5Qzc/QGTEurO4L+HkHTeTNIXvwg4eZZcBuqF/653IBlBizut4pHqZ/wn1jj5CBfDPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH0PR11MB5563.namprd11.prod.outlook.com (2603:10b6:610:d6::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.17; Tue, 14 Nov 2023 11:45:50 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:45:50 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:44:02 +0100
Message-ID: <20231114114405.2207747-18-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0044.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH0PR11MB5563:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6e8602-f58d-4928-d09f-08dbe5073fca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yx3ofXhMLeuZMmW1ZZX+NeeuVxhayrxTXXksaZxOzIEEiB9SY7Yo7pwTGq7XTn1QHW7C7mrJiVtqQIMRgLWQk5PA0pSvoFrWT4bKcdFCVEUvdK1TSUDEO9UnNIEm7sMV2HFgHMFBi2Kla9cGDgOusOaf8ssg6yrJqFkvT0RPWl1WOYS6z6e2xjqe9C2EnZCvvb6WRilTHky3Q1kKHJS7E0lxcO/zYw3+4lRDO7phQmSfWyg/kJwr/cbAo4MwhyuB9nHd0TA3teRTpp0ZnwQOgQfRPXO/ohRzVA2UJdvAlc5nT8+tYhYSo30EDPW/+4GAylzQDEQ2g3tDosJAkLv4b7KUTTo2HrtsfOcCoswBx4i6YF9/mfpJqgXK+IyRbPHnYpCBhm6z5oLwk1bMwJX2mYfBjkL7xob4Nf86VBoXRFn9ukkM0agrsKyoZrWHS+GxvMjFsVDqLrw6Mk2kYZxR5IL4/igZsS1FbgAGL6PJpY0o1ZnZmM2TE8y1urQ7ziJWbs6BQRBjo2WJX4OgfkeBvlUkBxxKpTBwrL3VPbTSyabZA+lK+iJnexPaKd/+Vc6X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(396003)(346002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(1076003)(6506007)(6666004)(2616005)(6512007)(5660300002)(4326008)(8936002)(8676002)(41300700001)(2906002)(6486002)(478600001)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(86362001)(36756003)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2pjTjlCWUF6M0RJanRENDM3MldkaW85NDYzVzZlQ3FFU2Mya1lNZGRYZzgx?=
 =?utf-8?B?MzFGQkRxbVhwWkVoS2kxL2hlZDl3OTlXcjdpMXdXcUpxYWc0ZWVwTS9KalNl?=
 =?utf-8?B?aUJ4Z2V0TENFTHhDVlRBZUx1TzVlVDVYL1lJU0kxYlJ6ZC9QbGFscmFKSVJm?=
 =?utf-8?B?YkdFMnkwWENVY0h6SGVlbXgyOXVZRVJ2UktKT1lvdWlMenVHYTBldkEwU0Ju?=
 =?utf-8?B?NlB5bDVVM09RUTN4QkRydVhWM0lkejdyQ3k1bHpTM21wcEVEUWh0WFEyYjJI?=
 =?utf-8?B?RW5zL2xZQ2duMTZUK2dFVGxJRjlKYS9oc21jcjBLNkx0M2tncFowODlTYTN0?=
 =?utf-8?B?eWZnYmQ2cEVTYVZwTmJ5MGlJY1dyQVZxVSswQ0p0ZjVuOHhrTDFQV05FQnJF?=
 =?utf-8?B?em1ya0l0NklLUVljUzBlUE9HL3V4VlRHcXk1a2w4Y2YyNVlSTU9meTR3SGtn?=
 =?utf-8?B?anVmTGhnRmxTMUprV3lyY2FDMVhvckx5WDZoOWx3NE50QUJGNDBMRlRtblZO?=
 =?utf-8?B?L2pJL1YwZFZZQ2ZKRFMvT0l6c0VTeWhXMW5IWkxhSVpkR25pWHg0OXgrS2tY?=
 =?utf-8?B?cHk2K0dUdjVhQU1mekM2RDFueGl3L0Y5b1JiMmdSa2RSSGltZUZVREJoZWJK?=
 =?utf-8?B?UXlxY1dnSVlNeGEvWGIvZXd6ZFBaVlU1b3lIZ3k5SnVDWFZQMUdrMXVqZlFv?=
 =?utf-8?B?UHkrZ0tlTGhrTko3aU4wakVrcTd1cG0rZTBlV09SNTdjZDdQWE11YnFHeVVh?=
 =?utf-8?B?dDRTTUw0RjRRaG5oaEN5elRNSDVvUnorWHhXR0x5SnJ6MHIyc1NTVFBsaEs3?=
 =?utf-8?B?SkFSMGpMWWhHSitiT0ZRWWtBMjNoV2k5K3hNTXlQbytRcnJRUGhMUnJ1cVhS?=
 =?utf-8?B?Z1pmRzN4eENIN1lkaDBRbTJ1T1l3OTNpUjNBUTNjbVBmUzA1OUNuTTB3Ujl5?=
 =?utf-8?B?RGhKaTNlL0FFNmpMdmdnMXlCQ1hjanZNUy9lbHNMejZmcGVlUlBKcUdja0RK?=
 =?utf-8?B?YnEwVW5lODY5cEU4ajNmQ3Y3c29sUUZzY1BWd09mTzYyaHFIUkpVZmtNM3Nn?=
 =?utf-8?B?N0ZuR0k4ZVRUVUF0VTNrWW9iTTFMVmdlNzVtY1NYa09GRFVaS3pmdnVMdlNM?=
 =?utf-8?B?cGpaQ2s3RGhCWmxIQkt0YmpkaVBYcDRrM3ZzckFsQWsrbGJTWENhS0taSzhR?=
 =?utf-8?B?TklNTWtsY1VvYzl1QmFrV3dxWitucHlyaHZQdVJlZGV6bkZpazFuTEhrNW4w?=
 =?utf-8?B?WmV3ZFJRUThoVk1Lalc5aWtTNGxlcnlJd3RZSi9jY3pobGVmeVRXcHBRT2pD?=
 =?utf-8?B?TGxyVCtvV0FRczltWHRwSElkWkpoTmFkZ0Y3a2RMQmUwWE5XTEo3RjN4R0lG?=
 =?utf-8?B?WTJ4cWZ0STEwWENSQnYxQk1ablpOK1FvaEdnd2NjZnA0MHhvQmhMUkllZjdw?=
 =?utf-8?B?TEluNmE2VkFDTldvNGh0U2VBQ3JGaUdycDIybHBBMEVNQ09SMklKUU15TTRr?=
 =?utf-8?B?RUlBOFF1RWkxZVF2eVZBVHpDdFJhQWRuZHVvMTk1bngvRFVPSVg0NkE2OGVP?=
 =?utf-8?B?Y0J6b0N1cWtlZ1dYd1hrV0xEcm0wVlcvWm52MVZaS0NDOUZrMlp0NWQzR1lh?=
 =?utf-8?B?QjJPS2NDUlRBT3EzUGticXJrSXVESU0yNWF6TWpvc2RUem93Z2xLMWNzZFM2?=
 =?utf-8?B?Wk8xOHprUVBOaDRVc3hYenYzZGhHeXd3Vllob3l1R3NQdk9Md29lRXdoQXRy?=
 =?utf-8?B?TThsTkNTWC94T3Q2NHB5a3RyVG94d2cyeDRJekhOYjhQQXNNbEMxcDE4U2RN?=
 =?utf-8?B?NTI5SDlqcUd0blFabUFFM1JYZVdwb0RwYjVoNjBjY3R0UXphWXRzZVgrZkFs?=
 =?utf-8?B?S3ZRUXFKQndVYlZwUjNCdmsrOE5ydFdzNDB4YzJHemRPZ3N5Y1UxcDliYkds?=
 =?utf-8?B?cjREWlhvYldieWY4aisyOHRUKzhBQTVHTzBpTWtlekFBVUxYZmg3QkxWQ25a?=
 =?utf-8?B?MnJHMzhFMGd2Q2dtdGxkZlNMRHV5dGJKWWowbTgzbkQyQW9LcEtXUGJZRHdD?=
 =?utf-8?B?TDE1ZHVPd1h0VEQ0SkdzSWhxZDAxYmhDcnZ6LzM2c3pOaWsxS2NPNE5VM0to?=
 =?utf-8?B?YUtKVGkrdFpLTWJxMnp4TkN0MVplZ3hCTVFVNmlLMDAvZ3FaaXBrUndLa1Yy?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6e8602-f58d-4928-d09f-08dbe5073fca
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:45:50.2127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HWDVSwY3rZY8AFcbfI64haaihmBdX3+3qM7BhJrWvy1G2js0cVr4m801CfHoyYEvR8Lsla4zNQY2xTTVzfpOoWiGT5za142/j4OE/jytb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5563
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 17/20] drm/xe/guc: Split GuC params used for
 "hwconfig" and "post-hwconfig"
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

Move params that are not used for initial "hwconfig" load to
"post-hwconfig" phase.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 84f0b5488783b..d1181ddf4bdae 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -192,6 +192,26 @@ static void guc_init_params(struct xe_guc *guc)
 	BUILD_BUG_ON(sizeof(guc->params) != GUC_CTL_MAX_DWORDS * sizeof(u32));
 	BUILD_BUG_ON(GUC_CTL_MAX_DWORDS + 2 != SOFT_SCRATCH_COUNT);
 
+	params[GUC_CTL_LOG_PARAMS] = guc_ctl_log_params_flags(guc);
+	params[GUC_CTL_FEATURE] = 0;
+	params[GUC_CTL_DEBUG] = guc_ctl_debug_flags(guc);
+	params[GUC_CTL_ADS] = guc_ctl_ads_flags(guc);
+	params[GUC_CTL_WA] = 0;
+	params[GUC_CTL_DEVID] = guc_ctl_devid(guc);
+
+	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
+		drm_dbg(&xe->drm, "GuC param[%2d] = 0x%08x\n", i, params[i]);
+}
+
+static void guc_init_params_post_hwconfig(struct xe_guc *guc)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	u32 *params = guc->params;
+	int i;
+
+	BUILD_BUG_ON(sizeof(guc->params) != GUC_CTL_MAX_DWORDS * sizeof(u32));
+	BUILD_BUG_ON(GUC_CTL_MAX_DWORDS + 2 != SOFT_SCRATCH_COUNT);
+
 	params[GUC_CTL_LOG_PARAMS] = guc_ctl_log_params_flags(guc);
 	params[GUC_CTL_FEATURE] = guc_ctl_feature_flags(guc);
 	params[GUC_CTL_DEBUG] = guc_ctl_debug_flags(guc);
@@ -289,6 +309,8 @@ int xe_guc_init(struct xe_guc *guc)
  */
 int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 {
+	guc_init_params_post_hwconfig(guc);
+
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
 }
 
-- 
2.42.1

