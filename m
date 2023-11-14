Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23DFC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8217910E1B5;
	Tue, 14 Nov 2023 13:03:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296D110E1B5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967012; x=1731503012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Ati2mheFZGf+nMw+ImTSRiEo4xlr0wSWTb8s6QBE8Gg=;
 b=S9yR3yOmMapy5bmF6Wdo0ppjs5wc8rMPkqFA/ubo95cFNsI036wfEcAX
 s9FrSvUqZendp17HK90qAtAUrvrc5VvIIkQUHvc4emRHePTO71KgqTSDI
 Bf98thryfolYZIPEvphHeQUItYpvECCKyvq5yjujcDc5y5JMFFz8s5of+
 apsT8zFttQUWiCxj8NV0erkwOcsFmtoB40tX4+Em1tiJmbGEET5PrEZDZ
 d6IRSUM9rvajAP+eB0CW4JP570N+Rja0zJ1+mOPtqTdvZHSY4zhb+CsnL
 qilGh2XnjfWOJ/pxDsTBecUhOGzdIdioX1IbrP5hF6tDKkoRpdSLHwu/f w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="12195195"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="12195195"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:03:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="908354016"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="908354016"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:03:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:30 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:03:30 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcTlP4AHsV8HO4B27SsPuf8TEMz+k90TxLdaetBLvD1yNPQI6kTnSjouL9sjvnOEKBFQm/WGhGU1wjciaedTn3LpLC2vFaquEJZ0GkbpOZEU5SXXl3c9Xzh0zDc3nDvEApjjobxrzf1y5xQs1D1t9wMTmljwsp5e8zwkdsfi2AFrqHd1SvgVTKdwZLM6/CofvI+JO1SFSY5EKDQiDdFOJr3j9BozFhFwGbXMJMlSfRi1hq4Ev4U38wtwwhb7zzA2QqM4WB2e5dfXZGYWJvGUHW5j+JyjbHg2iQEUtsH5YzDc0K7pn1S8p4jqapJxSp3RSnPRouujP24z+QJyLPCkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSdjTC6FQNADb4FAi5pgQH4zEHZSKUmPBMN8uOFzbo8=;
 b=RQ5rPYdeisd0EzF7vzHiDeOaPw+aZfUVHITriONJhZ8VPHjhEtSjuOVBLpC5AVCoBLxoV98OJR9hkea+ePBkzpVhnW1XfH7I7zwVEs1WUppTXZFSYWxaKAGsjbQ/AdzwkXpJ37AllRMA/IyLLjWNbGhY3qVT6SSEUfs5Q3QacfaYEaBvaZKHRY3bPWLpCilzYyuY2hRakp0AyZq8/MiKSwozmbSPOLCBN/h4ydSR2gwMryS0YOQqQmPntUxYE2yltdotPsCiRtm++cKPqD535BJPIS2bWF9LIorRL5aqVd1D4/FBU/1i8kXGQ/lcTxiFtFqgC1guN+TPgnc9/bvUqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB7040.namprd11.prod.outlook.com (2603:10b6:806:2b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 13:03:25 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:03:24 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:16 +0100
Message-ID: <20231114130231.2299661-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 61970d22-8318-4dfc-7f51-08dbe51215fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y/PPzaJKOOS5sBLb+/rw+/mW5QdTBolL5ICvQ4lEfVD5exn2/I7CqqR8yjXpvHFBF6fiyeMiBFBVNwfEWlxtHzXMrTq+ymVHq1R20qf8OP+8SnUaou8kf7HsDouQ+JpLwNsnR55iK8hxIkIR7xULNmIUsRi/NsY0UHutnmP1K1eUJ3Blv+QUmO59CmVHpxw+QI8twvAUgkU9bpTdzt2nlXHP8RercNgSkzdUWBY1ibafpWGO0HubteVv6fMaHT67r/Ypi2TAmP0jXyXg4a7cQ4LDWoDsJj5VRWCMo0J0xZclUZ6zmCq7bDjaaaWi7ZziNladDSrkdkpphLtOPizSJ9F2DfUOgT6dAxSSqvPqpTlI/PC9MQ68CFGupliFdfxYvRxMX05ZovPaSjHQtN7PhZVLm6EB4i/v5NfGNAjUy8wjd5vVTVG0O8yTOXWJqR3kSQ+fEzvL69QqKkAPgwNNj4UDSSUC4gPJLZKou50EZWi6Krt5zoW3+KUsmgPaiInVjh+3+bkNrWf5QINSPep5nuy7EH3U8vIB1g1RjRwxKVhnZWGgAr23pYjvItU5jAOK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(66476007)(54906003)(66946007)(6916009)(66556008)(86362001)(36756003)(82960400001)(38100700002)(6512007)(83380400001)(26005)(6506007)(6666004)(1076003)(2616005)(2906002)(478600001)(41300700001)(6486002)(316002)(8676002)(4326008)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlpyeWRqZnd6cXNnd0xOQkZWY29UcnRDd1M4Y3BDamNiTjFUU3doWmxoY2pt?=
 =?utf-8?B?Z3ZuWmk5c1J1TjhoSnF4Z28vNklpTE5MNnhla2FGZjRYM29GSU5DUlJ3aTBL?=
 =?utf-8?B?Y0YvdXNaSjdFV1lUWlNYcXJiaWVVWWIra0NjNzZzN2JobWR2VWcwcUg1MW1i?=
 =?utf-8?B?WjVxTUVBeUZaeDBNV3RVTTJ6WGUvV1R5Nm11aGpSZUNxNnh4aTlJdlhleC9r?=
 =?utf-8?B?OVgwODdHckl2bnVHSkhvRUtkd1FhTkJ2YWlGQ2RVajdCdkdjZFNLVHFjVGpk?=
 =?utf-8?B?dHJLRzdQSndkQ0tiNzZ4NkZZb05SSzRqcnVNUEdxS1lpRGJaUlVMUHZNUWMv?=
 =?utf-8?B?aU1oZE4yK2owZ1phcmtkWFJ1UjBUaHEvaVBaQlVnd3MvWC9zQzhkcituclNw?=
 =?utf-8?B?YURjdXRUQzlrRXhWNGYrOVhBNTJSWlVsSldOVEhucDhOMmtVQXFIZFZDRVNR?=
 =?utf-8?B?YUsveVcweU5RclVZTWp3bDlCS0toYzB2SU8zRUl0TzBrTXo4aFF6NFlLMmJQ?=
 =?utf-8?B?S3dCNmc4QlozOGJybFJRcmFrQUFkWGlkZGZRNFU3bE0zRmNnWFd5TmtMSFk4?=
 =?utf-8?B?NGFuMDc4dmZZVU52bGQ4c3lTZ1h6ejYwU2VydFhxby83UU1ZTGEwTFJkV21B?=
 =?utf-8?B?YkQxUzVwMHQvbTBKM3pRdi9UN3pmcFBBK3M1cVo4UURuK1hQekJaVHpjNS9q?=
 =?utf-8?B?OCtQNWhqcnpGclRkMEVwVWpnK1VPdld5bDR6SVJpd1lSVW4yemxBbzdiMHZo?=
 =?utf-8?B?dHJSQUsxY1RaUDY2RjBkSnZkczNEQW9TeE1EYUVyUUVGRjE0ODMvc2FMcm55?=
 =?utf-8?B?Wno5RzJCMVNuNnErVGpFcXQ3VUdld2xpZ01rcmxUbWZqdU1zTkhhZWlxanR0?=
 =?utf-8?B?bnU0UTJHTTYvblg5eTREbi9oR09NZS9SK2s2NFFJc2QyekZRbStCN1IzNTR4?=
 =?utf-8?B?aDcwN3FMS1ZWSEhmZjBmTWRkUktVd2dEMk5hS1NKWDUrajIzcUJSa2drdEZF?=
 =?utf-8?B?eW5oRDM0LzJPV1U5T25PaHFhWk5vd3doZjJ1YW4rNzhQb3RDMzVIUTBIU0Fk?=
 =?utf-8?B?SVRlZ29OMUNEOENSTHE5eTVnYTNOUXBtRVY4Sm1abVJneE1LZjgvZDBpeUla?=
 =?utf-8?B?eDJtQzRBM1pjMUdpNGxTR2ZVbXYrOERpQTFjQ0E5QmVSSVExVUdpQkh4QytU?=
 =?utf-8?B?V0M0UXBSZEpocGhKdDFNVjE1MkplOEZJWWd1RE5VSXJoTzFYdmRHaGVjMmhP?=
 =?utf-8?B?dEJwRGZIbGtDTlYzbVVqTzkxUFpZQ0VkUUg0MHpEd3cxWWpCcDlaaXFpanRW?=
 =?utf-8?B?U2Npb1hnNndiaytkOVE1ZU1IbEJjYm9EY3AyQ3VhakhWTTJMK3loa245STYy?=
 =?utf-8?B?ZWxhNnhLbUx3bVhsdmtQNXBncUllUHBhc2JCVUhGenRxRFlPczkyWGpTMHow?=
 =?utf-8?B?cWorOVFuWlpGSDVneWk4QkJJWnRUK210aHZNdTVGY3FsdUk2WEV5bVhwQW1J?=
 =?utf-8?B?bWhTdlhXazFXQ2ZIb3Nmc0tPM0k2azlra29tSXFmNUtUQ2NuZjRQYUFQY3Zr?=
 =?utf-8?B?ckh0T2c3ZlliSlJLK1UrUHJDMzVPaVRLeThTbGRPZ2JXNm9yNzBMekdhZjUz?=
 =?utf-8?B?K09UaEp0bFpHenlISitac0ZrM1d6clFMVS9scE9JYXR0R3JwMW1sWkh5ZjVW?=
 =?utf-8?B?bms3S085ekNORGVvbkYvRktlM2xLVTNEaFlKV0JoZkgvc1V1TVhvcExOMkc3?=
 =?utf-8?B?UzljTWpLMUlubWdINVFFWU9IQkxHdzZEdjVLOUVSTkhxcXk4a21QTEU1b3g5?=
 =?utf-8?B?VlBhakN1eUdGNjh4Nk9ZSHJvaHY3Z1BET0hwUDFYaFVQRDR3R01la3NKVnJ1?=
 =?utf-8?B?cC9yNVZJTkc0ZnNkT2FYd1VwYVRjVXpZQVc5N1dnYnR0WDR3Y1M3eGd2WlpF?=
 =?utf-8?B?bWU4YkNzeHM2QzNPQk52LzVIZ3oyV0VBazhNc0pQekY5WnA3V0g4THJYcmVm?=
 =?utf-8?B?eGlzSXpjUmN3Y1FYWldJdndNUUs4N1RNK2ROZE9MUTYwTjVyaEZoWlIyTVZW?=
 =?utf-8?B?VVNtZ0FncFR0Ulc2T2lrRitHYlpDa05nUFJNMHp1djhuOFdTZjJLMGMwRVJy?=
 =?utf-8?B?WmthT3lCNzZwWlpnY0toVTF1K2RXYXFKbHR4eG5qTld6ME5zd1M3NlByNkNF?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61970d22-8318-4dfc-7f51-08dbe51215fc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:03:24.6646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQJYSUtxDqwa1sdcS950GQvJBzYIDmSnebT9iVArDMPB2LXLJnVqZ69S+ceH9aEu75RJNSeeD05ujrPdpp/WJ5FANYZkhfwGIXqi/is083s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7040
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 05/20] drm/xe: Move xe_mmio_probe_tiles
 outside of MMIO setup
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

MMIO is going to be setup earlier during probe. Move xe_mmio_probe_tiles
outside of MMIO setup.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 ++
 drivers/gpu/drm/xe/xe_mmio.c   | 4 +---
 drivers/gpu/drm/xe/xe_mmio.h   | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ef5099eabde0a..e9dfbf44f7534 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -392,6 +392,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_mmio_probe_tiles(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 1076ffdb3f92b..5a6053a61f301 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -294,7 +294,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	return 0;
 }
 
-static void xe_mmio_probe_tiles(struct xe_device *xe)
+void xe_mmio_probe_tiles(struct xe_device *xe)
 {
 	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
 	u8 id, tile_count = xe->info.tile_count;
@@ -408,8 +408,6 @@ int xe_mmio_init(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe_mmio_probe_tiles(xe);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index ae09f777d711d..9f1a25cfd2cf0 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -21,6 +21,7 @@ struct xe_device;
 #define GEN12_LMEM_BAR		2
 
 int xe_mmio_init(struct xe_device *xe);
+void xe_mmio_probe_tiles(struct xe_device *xe);
 
 static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 {
-- 
2.42.1

