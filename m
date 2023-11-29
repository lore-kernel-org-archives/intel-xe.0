Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B2FC07E98
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913B810E5DD;
	Wed, 29 Nov 2023 01:18:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E8510E5E6
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220667; x=1732756667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rYEOHI8TCEQmNR56NTW6BcxgWfFlIftFS2TEbRbmBmg=;
 b=NGNvyV+01xtAsi5Pn7wrrnCeNu77sUb/yDQO10Ne84Pl0wAs9SFNUWwb
 7hfyHJdbHtNOPe6pc/XYrw+50r+atE0HXg8UHvcmi+oQzzlmpklNBvS1N
 E+hKgzQpmSFOiKMQUuXpL1vishl8g4zFSifYrUVouUlxZKZEZVWNCtquh
 nK73CF0oVvfMuH4nuloagii4t7fD2Okf+sBf0MTFmwbQu6xnAlc1/vtfp
 87XM61Zt8ttcxORWrbkF6Dq0arLqCQRxEI7+vA9UHpNJc2T+ev5izVbEW
 Kv5Mk7OTJvxAqf0hIC2zSX241KBoFbb+QJMUPm0F/4GD3XIcyJjBtGXjO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6280169"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6280169"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762113499"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="762113499"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:17:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:35 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:17:35 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8TSMPegb7nrH47Zx24WuethwOViXu5JjabJZMhlFaRucIyT/3LakEuVIXmxLdL5QBZv5zdh7UPeI1xs/0X44v0QT6ZzL9xxCsJfld5P+KCekTxAxBRdPIMFZ5rblYPigYAQu8dYKd4tXgf4ddsmdpWcnni/tJ1IYJso+TO3vToaCKm0DXCyLadzkqfqSV6DMbbiHH846/uEiDqMXINz6Liv05BnfyP7MCIBCwPmzW5Byb90oebj31njnTRUrBauS5GtdmwcvdWXDyufrQfQnR22tkNq+C+AWCzVA9JDIVaZwjos+ZizZqi1R/6zsLIqv83FN831tvOPTWx/wd2Ldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dVxUBABg2Y0dlkxy6o6gbp02FT9XEs7jH9KMOJ9PMA=;
 b=OD4xbF+NxEWrmztELkFvxCuEtEZWDO+cpp7BBeF4fdv2lS3GE3k/alz3sRcwsjUSdlt8bBtf9Jb5Gj+T+KLK+kdM0ii4PYwkmDpIFAEdxlLT+MvBE9NCL5hVEG6Kbv0CgtDJZdmYyqBQkIqOzCP4PD9H2eAQ6R/KbC1NODuz41TdO3kn0mAmPhs4PO9U8QyDTnxG1R89oMN/8jFeQoO6m+CQd12eLXRi7PevZc8Sze7iYW4Fl4lpICglx1n9w0TDHBSTJfEc1fHOQ62xTIARfS7ybNkH3NyOdRRNQayswyN1uZ6DH2WDHf4CxUHLk4D7lnkH/iLe2ukpkUP1a+df6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 01:17:34 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:17:34 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:19 +0100
Message-ID: <20231129011624.836843-18-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0193.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 122aefc3-ec9c-4e14-3ce9-08dbf078f756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mMRu5fEpE6iSyEjO2ykLKu6L+GxnsgxixqFbEusCPLgBn7jijxBgnfKrtvHrU64V4sor8Lw3eaSCt89uUVIxMISi5y820iEPo/IISUCTVp24ezAQfg0ixEGE+3PXea74Oeuxe6VQlW/h0mREDvrp55u/9iv46ikqM0my4R8tHMoJ59nBBePBTJUKxPKHhYvUFDmHMF8LCHz8Y3DHlkIUY5MJGU4Suhsnea5AOYB8Hp1t8K7T3Ph6m/7m/HTT8xHyb6VO2WmIYA8kkqaEDjOh+WGFP78sztFN3GKzTC5d2hmCB0DypY6W+ErUaYEvbe/h6zwBKrMMjfeH5KK3sJYJgZG+Kd95wP3XpUQCoINf7UpD825sHwVIOGt6Mdb/rBr7Gu6e7vUbWsufAj9HKvE7TM0M8tUfU0/UMyieqvHUgXT4pRHq75hkMSdpBEO95GYKIvYRJBSeebYu+0MAopgq2glBtMq4PGSNKenB9Q51pAR7+2uV3DYaiIFE4AglUaPkKYkVH/cbKgBX4hoqgwKFW5aZ81RfIpXkJjy7aS1k5JIoJokC6w8rNTiRXejhixgV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6666004)(8936002)(4326008)(8676002)(6512007)(6506007)(54906003)(66556008)(66946007)(66476007)(6916009)(316002)(478600001)(6486002)(41300700001)(38100700002)(86362001)(1076003)(36756003)(2906002)(26005)(2616005)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk9vamcyRVR2ck9oWXErVzl2bWxWSTF2WEYzZ1hnNmduRWNXVEVlZld3bC8r?=
 =?utf-8?B?WVpINlRRWEpvNXBzUE4zaXIvaUhYd0V3dnF4ZGE0SGhKeGNvY2o1OTk2OTZU?=
 =?utf-8?B?UWlxbGl1VUhXdGVqTmlhMlc4OHpRZVdyQ2xQMENLbGtJSlNIZTA5M0ZkbXIw?=
 =?utf-8?B?TUNGZW9LMGFDTlhpRnR1aks2NFlhbSs1N3gwTWNJLzFORStWVDVQb0U0ajRQ?=
 =?utf-8?B?WlAxQng2MmN0Z09QZlBXc1BLQ2k0cU5zTk16R05MeVdFQ29HYWh1Z243Wng5?=
 =?utf-8?B?YkJvVStrYnlYNmNuMTFlRS9FT1pTU0IzanVrcVA0N0dtanRaZzg2VU1pdTlq?=
 =?utf-8?B?UVhTT0U2S2JRVEZaREMvdkhKaVhiSTFBSGQ3VFJZcFNoVFJUV3I3TUMzUUoz?=
 =?utf-8?B?VEtBU291VzdhYlh1aC9CUWgvdEU3SlNFRUxkY2dSMkNiQ2xQU1RzVUVROE9T?=
 =?utf-8?B?eDFmZEE5RWxtNFdiblgvdGZiam8xWHVSNlUyMmo2MmpGcmdKcXRzTVI1cVQ4?=
 =?utf-8?B?YmNpaTB3Mk5sb2VQdjNJbmoxN0NjTFRnaW9nQVlkQ0V5Q2hCc0hleWlnbUtS?=
 =?utf-8?B?TlkySlZ2MUEvNWI5YVVLWDJsQS9zWUtTQkhXcjVObnVSN0k3ZDBPNDFncWpP?=
 =?utf-8?B?Z3RwL3Rodllnbm1ZQXBsWWtqTTNVb2pxNjdoWTM4QTNteXR1RjE0ZG90M2px?=
 =?utf-8?B?dG9LRXd4UkxEOFVNUnN0a2d6TU9hUzZnOUluSVZuZHYwaTRhNk5uczFsd255?=
 =?utf-8?B?REpEalZRMVRYMjRjL2ZMb2hWbVZ5WHJhd0h3Mkt0clVVZC9ncU5ISFVUbmRm?=
 =?utf-8?B?cURScEk2L05jTU5xWFNaSTQrSjNWTG5ZVHNIanY5T1RrOThlQ1pyNEJwTjYz?=
 =?utf-8?B?eXBhT1NGOU51aW9wOUVnSmtxM2RicUQwVlFkRDd0NVJYRWp1cDVESG1PdGZJ?=
 =?utf-8?B?QlhVeDNOdVhDcENGaWhiakEwbTZSL2lBUER3WW9qUTJ6NFQzWHY0MHpyRzc1?=
 =?utf-8?B?UFVFTzBiOEpjZWVZTXMrSnRsdW1aN1Rmc0NtV1VJSTZtbnN3VlRsRGtmbVpp?=
 =?utf-8?B?VU8wWTE5SlVPSi9JSTdsalViakZocHNueHhuZThYMGdkQmEwUFYrYVJId2pG?=
 =?utf-8?B?ZFloeWJ5d2pkbUxnWXUraEdQVEN5WkJMWFJpUjVOUkYvQmk5ci9aeUJzY21x?=
 =?utf-8?B?OThXQnk0bURzdzFLMFEybWl2VEFqbml4SXI5bjhsMjRtekJDWVRGZGRIZEdi?=
 =?utf-8?B?eTIrMEM2c1VWbUh5T096NEh3ZnNGL01IZ0tuK3JjL0QrTTcvNHByZkhySTc0?=
 =?utf-8?B?cFBNRnhRbS8rSmdGT2x1NkhVSGxnU2grcGFFdkhWRjRLTFV3bTJNOFlFMTh3?=
 =?utf-8?B?VTVGaC9INGl3QVZCUXQvbUxVOHE2eGlOVkhTUW5vRWVTZmkrZmtxZXBab2hr?=
 =?utf-8?B?aTdZUjFyZnBBUHp6SVRDb1J5QzFxRGIzL0NjVUdqTW1WSjF2Tm1Zdm0zQnYz?=
 =?utf-8?B?OVQ5ajNBam1QQTVXS2VHMG9Lak1wR0dCNElsM09mbmFWeU9xR1hGOWw4clNn?=
 =?utf-8?B?V2FpQ3pIR2VZMFNvNUgyVjQ5U3MrUVF5Zit3cDhMdSsrMmNNa29nUEFiL2s1?=
 =?utf-8?B?L0M5bE5aTnlSUDRwdSt1MXllV2JBNUZTdnBsK1FrcVBpbVNzQXk1T1YyYmc2?=
 =?utf-8?B?blVSZFN6YlNtcTUzdTY0VzRkZTF3OWdQbUdXanNyc0lBOHdKTm1LZWJPOFVx?=
 =?utf-8?B?ZG5sSTQ2STJpQkdrd3lRUlF1dTRDQ2RTdGNCSmZ6RVFUNno5OWF6aXZheWtB?=
 =?utf-8?B?MUdwdm1UKzhaamMvblVoZnpFbm5kUkdGc0IvNklIUVhLOHpoNHBWMmo3cmd5?=
 =?utf-8?B?VUU3WEVkSUNLR0RBdEw5ZWVPbDVQdUF6OXBMc1dWaDJYVVg2aXdOZ2lZclJC?=
 =?utf-8?B?WGdWVTZwdk9qcUdhUU1tZ0ZHUVFVeXN6SW5aTUJ1c3VUdUdFLzIyNnMyd0xT?=
 =?utf-8?B?TFpiV1NFTTFXQzJCSlJ6eFJ6Y1g4TDY0WndZSXAxZTFUTDBsQ2dHNHFUZk1L?=
 =?utf-8?B?V09Ed3FuRkM3N1JXZUxhRTJpaVFvTWo2MWJPd1JJTnhCS09FVDJ4enlzWFNS?=
 =?utf-8?B?QUgyRGQ1NHVyeXJUM0VTalFzTHk2RG9MbTVJK1E0NzN2ZkVsdHVFZit0cmln?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 122aefc3-ec9c-4e14-3ce9-08dbf078f756
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:17:34.0336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lzjr0rDQH8PfAzWcN8ojGrMegX0kzQxeIrilgiWs0QIJnqgAgA4YlegfbfrDrn96JI3VgazMmzfBzuawcsInHlLJtLMehiU9aVBsi3sS5y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 17/22] drm/xe/uc: Extract xe_uc_sanitize_reset
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

Earlier GuC load will require more fine-grained control over reset.
Extract it outside of xe_uc_init_hw.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c |  4 ++++
 drivers/gpu/drm/xe/xe_uc.c | 14 ++++++++------
 drivers/gpu/drm/xe/xe_uc.h |  2 +-
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 7f26899bbb1b6..9eaab11cf29a6 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -537,6 +537,10 @@ static int do_gt_restart(struct xe_gt *gt)
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
index 784f53c5f282f..13e76e6805ca1 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -69,10 +69,16 @@ int xe_uc_init(struct xe_uc *uc)
  */
 int xe_uc_init_post_hwconfig(struct xe_uc *uc)
 {
+	int ret;
+
 	/* GuC submission not enabled, nothing to do */
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
+	ret = xe_uc_sanitize_reset(uc);
+	if (ret)
+		return ret;
+
 	return xe_guc_init_post_hwconfig(&uc->guc);
 }
 
@@ -90,13 +96,13 @@ static int uc_reset(struct xe_uc *uc)
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
 
@@ -136,10 +142,6 @@ int xe_uc_init_hw(struct xe_uc *uc)
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

