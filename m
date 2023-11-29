Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87239C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5568E10E5DA;
	Wed, 29 Nov 2023 01:18:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408A789C68
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220662; x=1732756662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=r1L67ZFS+YzYufCCBRFUK72qviHy87XHnbxb6EP72Gg=;
 b=fFsRVR0K5YmxmnrgLo2A2dzdzEh2DCcTnZsayuenbeAe9ZtXP29ET0xf
 to7s0pwx+6lHWC1YPHz7kuz0LGnMCncJaNh57TF80JEOa7PrrUR69Q/ht
 RcLZlX2eBx7xa3oXV3VyOGM4qGEdfK2H6Tyvk9/HltVWu4skeKaTemz2D
 x5YOaw9Vi/M3pbV/AF3vP9E/Jf5xSqhoBljuWU6Ud7k7yxtLiVVgLGMqM
 7K/+3z1U9j2CiUShokkaJx1Q/r4+RZ87ONwH2+mXQii9TcNdD8/CL2781
 RxwB9oCRvOAR45M9n//8hhAYuB9mcplNs9GaTkn7pWZS6fijudr0lHNap g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="479264106"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="479264106"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="772504427"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="772504427"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:17:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:41 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:17:39 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOyYwFehcqsXFtpGHdr6AdDDCBWtRTclKgQbZa6y9STVT00wQ4a9GZgLnsCXif8QLthxEh0qVvdXaxSWRSl0J8PgQqYHzicYxPiCOMQrPjrZq0Up7zwkFlRQX84uTYU7tO8ctkGxgeNxfHjWRNBJwjL0nRcAfymh93+4Y2iyMfI3hVjtr+LiKA0L9fXtw/Ewi+oiv39ZagGtiH8704iuRzV9AHQl6n0aPVylgyb9QrymSGRTpsDfh/c7e1EdbSbvTB7Tmjbv4vwXKOs6zc7iaWRSa4zWn+UIu0NUj2hhaLOrBfSNgK5cxOV0LsvTmc7W1+ttaTmXC/d+yrqHkb5/0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95iKbY+lYdtMjk561j+sFMXSD3WcnPDVINJDkAZUxmQ=;
 b=QY8JKnvH/4wCm8r5wYPBcEhe6VxDdkj0vpfw6sURDIKVlts5+Z9e1p4I3KXScNwK/vCG2Aaw9HalEVrygiXaUJ+7qbYjGGKuyiyJec41uMVpaZBpTvpe/TgWccwHForzqlA39Nk0sgo9brBlI8mgdlA0YG2JtCyJB3TCXYUlGvXiz5nUmP2/LzopJ23VQwOKSmYCfH+7juYLjJxJS72JxO2gZIifyhT3RwI5eOZJ5jSwaZQKQUdm67ghi7XFqIzq6ENaWjzEt/VIEB8MWIHYIY7PaNsYUPvXmhyFG8xsth3pC/gyq17cvHkhLSzXGA1uWifhCO8lM1npmZFkNnJ9eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 01:17:38 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:17:38 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:20 +0100
Message-ID: <20231129011624.836843-19-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0291.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 6047c13c-a7ea-4409-638b-08dbf078f965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mSza4Ty9X1/3GLF8AekwDETpzRERL8OQvCSVnmBGD6zykVHh9LXVN6qQAewQJFtZGff72d2FbZm1EbIdIk0FIAM99kXum9KEmxvHzHhMdBKHGwg8dJL02ernILpm42KLYrQ6NTh4e5k3nw1pIAikzc5fGQPRhUsL34GatdRZIlD2zR7iBZj1ziyhkyQ3x6TFIH9vwfSg2h6ZiR0aHsXLp25H5VaUecm28LgnWCdIyv7SIuZslhyqqWBpQOF8idS3um98VS6OVWbia/KezoJBSitQ0fixOaiKMZj4Z4b9WBAtiFZohPvQw4DX2sW6Bh1Y3kM2LoTNCKLiTADfBSPLnEbsFAJgj6NZy44naz2NqLZq/TQLphL5XN7AETpTpYBtl4OltUJJcKm72996xdNiHHCXyDzFLiQz29TgWQI3/wGT5ke/yKICj4kKjHLAVZd2hhZ9BOuCPRmo5rHMv/SkIQB+HGdYlb+Wbt/QZoDVA5yph1aqLxLKicYdN9ZGYbQn4ZOaPSn8MWauqSCq9+TXHrLCi6dhHgRsTys3M9JGJZojxvJ5hf0PV7dRDnq7+63E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6666004)(8936002)(4326008)(8676002)(6512007)(6506007)(54906003)(66556008)(66946007)(66476007)(6916009)(316002)(478600001)(6486002)(41300700001)(38100700002)(86362001)(1076003)(36756003)(2906002)(26005)(2616005)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0U3VS9oWEZRVXZQeUdYTFk1amNVcTEwYW1yRlVIMjk4aStXOTg3VVRpMkZO?=
 =?utf-8?B?T1p3U25wSTI0VE5HbnRkVUoybGhCaDYzdVNIR25yMHJtMlc0RnA4dUlraFAv?=
 =?utf-8?B?cStaeXhWVFEyMzdOMWtiaEFITzk0VFoxLzg1bEV0OXVGeWw2TzRuRGRNR0Vs?=
 =?utf-8?B?QU5tT0xZa2JrY3B4bEpIK3lCMlZqaW5xNjZrR0VETmZIcEk2V3dNQVFCcWIz?=
 =?utf-8?B?djhUNVIrTkVrZlprbnJBOGt5WGgyS3dFRXpIYm82WEtGc21ISkc5Z1M1R3kv?=
 =?utf-8?B?TWV3MUlHd1VENFQ0SFZpOTdEdmhkSUxMd3pTU0lWQXpsMnVUbE5Fd2x3bTVO?=
 =?utf-8?B?VU9uU2VteWd6T2xSWDNRbnZyaXBQUGhYazFYNHFKc3VxVHNoMW1yaXhMWEh5?=
 =?utf-8?B?R0RaLzJXbHJuYTg1RFUvVHB0cXBGMEtxbFZjK2VPQlpSL3dkL2xSTktGbFdz?=
 =?utf-8?B?ZXlaOUFzVS9wa1ZtZ29IUG1YMGZGUFVDLzFMQmNRQy96dHp5OHNaRElhOWJB?=
 =?utf-8?B?Ym1RMXc2dnFtWGJxUnErMkU0RWgvTU9lRjNHZjY3c1VtTWNTYkFwdTRlVkZR?=
 =?utf-8?B?ektoaDQ2Mm8ydVpPZkpiSi9kTHFMNnRpTTg4bDNoenkzYWt1YjlMNkZBc2Nh?=
 =?utf-8?B?bnNmeW5Ib3RlY1dLWjJ1QWl1ZXMvZFc3UTJWcjR2UDdQRkZpSm5WRUFTNWxY?=
 =?utf-8?B?aUxTYVNxZG12OTM0cnRkRzlwSkkvcmtYMG1zL3FBY05aMWlPbmpJOGgzZTd5?=
 =?utf-8?B?TFNWNWx2WkdXQUhZZDVCdW4xeVpBL3hjZjluRkZhd1diQzViankxa2E4UEl5?=
 =?utf-8?B?VTRlZ2RLK09ubzE1OUp6Mml0WjJNTW1jcFJFQnVBYk1lbXUwajQ1NGRndWJh?=
 =?utf-8?B?a2crWnNGQ2Fqejc5QWdQT0x5byt5Ui81Tnppd25WcGg5aVhOWFg3YXFhYk9E?=
 =?utf-8?B?ZVZha1NoOXAxWUo1VVRVQ1dkQUpTZGgrRUJEeUVvVUdac0lxRWhPRXFoSzlS?=
 =?utf-8?B?ZlE4cndSZ091NkgybjB3SHduZXptRmFqaytaVitnTGRoemFYSGRkYXF6SGdG?=
 =?utf-8?B?ZmRhdjFoUjFsMlRvaksyd2hrenRuMGJVaVBPY254TzlTTnJwOGo1Z2ZRaklp?=
 =?utf-8?B?TDlrVFU0RHRKUUp2ek1IUFc0cElZOGZNSlBlNEFKUXh1aVlkTGw1YnRaQzRl?=
 =?utf-8?B?MWtzRDJxSEVvS3p2dDl4U2U0eEFmMVZ1ajk4VkxwVzhrVlhNSzNvbzBPaDN1?=
 =?utf-8?B?V21McUsvNUlwd1oyQ3pYcHBXamNtSmFaemdOeVBzd2VFVE9qaDV5N0IvaU5H?=
 =?utf-8?B?TmJZaFo2SnltbzlwTDd5cHpDOWVNSFEvSzB1OVhEN201dGhEak90ekV4VURL?=
 =?utf-8?B?NGRsQ3lhTkRLaWRlcksyS2d1Zk5vNnY2NDFmOGZvRDMxQ2FzYXpseU1NYTZt?=
 =?utf-8?B?aTV1Z1pvMmxJNFdxVU91SmFCL3NGc05Vd3ZTUHdHUm1rOUFFLzBDQnZjeUNK?=
 =?utf-8?B?azN4ZHQyNGJHSVptaytPRlZXWHUzVjBneHpBU2hldWdkYXZvVjhudEM3VVBQ?=
 =?utf-8?B?SFBROC9ZcVA3VE5ad1Uxdko3MnN2b3B5S1RTY3k3TUl4NHJnT3FZZG55ZG1p?=
 =?utf-8?B?alM1UHF3TXQzeU05WXl6aFYya2lqaXV2YndwRFNqMzU5bENsSllsTENYVmtv?=
 =?utf-8?B?b0JzRlRnTUdtalc2YUpQQjRpeWZXUGxaNmpEUmpWNEh3NlBITk5BSGowN3Zw?=
 =?utf-8?B?MmlTOWVsT1FkVHZFalRxYkJpREc5aWV6VzVzVklqUlVEYVZNaks2eWNVcHla?=
 =?utf-8?B?bEpEU2xDU2xpVVlFNjZ2UFpVZURtLzhwbUt2YUUrVnQzNk96THdWZFNvTGU5?=
 =?utf-8?B?OHlKcS93Zkxyeld4MGRacndINVFFRFE1VGZiK2RnMGx4dkpUODk1YWxhY2pk?=
 =?utf-8?B?YTlZTHdrTHVOOTFOS2IxdTNtNWtuMkhRT2daWlZoMmtXYlJBN2U2NGQ5MFJq?=
 =?utf-8?B?RDVDazRYcitDQUJzb1FXVCt4NzNGZTB2YU9BbU1nR1RYUUE4eDlFV0VSV3Vs?=
 =?utf-8?B?bnZKR004M2d0WG9iRUVETUxITHdwblU1V1MvMzJ0S2ZpTDBieXdlbXFHQ0E1?=
 =?utf-8?B?cW02WkNCc2R4TUxpS1FrY013ZHFwbUl4Mm1pTXN6R3AvdWtMSEtjMy9kMnpl?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6047c13c-a7ea-4409-638b-08dbf078f965
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:17:38.2224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CewuBc/dGCowcysyFhFAKWD+jSirn8jS5lwqi8UsI3HABzYMumP0PHMIGERdTkbc/h3HJiZP5Vify1xA2ywLbWAhpZPx7nd8MhnOJVuDkxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 18/22] drm/xe/guc: Split GuC params used for
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 08142d8ee0523..fd3396ebd3edf 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -180,6 +180,26 @@ static void guc_init_params(struct xe_guc *guc)
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
@@ -277,6 +297,8 @@ int xe_guc_init(struct xe_guc *guc)
  */
 int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 {
+	guc_init_params_post_hwconfig(guc);
+
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
 }
 
-- 
2.43.0

