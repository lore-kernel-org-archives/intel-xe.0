Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D29C4167D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C36510E1B5;
	Tue, 14 Nov 2023 13:04:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470B810E0E5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967064; x=1731503064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HNxdMsi17GRG428JCDNlmjDq2ZbWQby+FC0NCWi9emU=;
 b=azjW7oTuMHZ2uwAzNAE6+N1zeImKD+auY75dPFRty269ODcHABt5Mui5
 zLj/sPg67St2ZKYFZOoMVKNp6VbmmBnsLeQkDv28acHVU3cGxFktnQJdb
 tX+ypXo6HNUfLNn+QIs32uqB7MCvTaIxkoTGdp4jkEJuQ+mFAmxlr1VJt
 OxxYQY4jPWwDn200mnk8XpHpy9VIHDOde74NVtYE4H8mNIcJaZhzRCWjA
 f2mrZOqpUMuhK4v1y/U8zXgUHu0ehM/oNBLuUyHLRayc5BRpXL9bJqeiN
 bF8S4XaAP+1xOkOZQQEnys1gyl0ULC/e78OloSQesE58VE9ZfRnLZk3jD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375692165"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="375692165"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:04:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="882046166"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="882046166"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:04:17 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:17 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:04:16 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BToB1XsfUU6Rn1B7HdPIxj1vPNpl4g28lh6Puq6ozxUsxO9l0LIHxms3TfamuHyoawfZxC3OjbF1InZaF6XHLBV5rQgIsLbhwXxzEtJfkZNiEF7uzZOIHT++R0S5PtgaIcZVlGmSXV2ZpkrnICAoO2cBDDVun4cfLc2hPKTQMOiO/nNuvtJI3kEHKWeCmzumUgOF4U49guBDsW736NUFlG+Vx7ELbHsmA5FG8K0g7ex9Lc3GAMG50c1GVnBWz9P3nc+jJKlkgqryziyQS1Q5Q361vv50NRVrFjbguV2CFm8lmYVLaLIwiHPIsqjHdUdo+C85FD0qHAtlyI7mDtOpKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LetcXs1nehC81yeSmLaEqM0a2QnHAJC2tRDzhRb3/l0=;
 b=anokiA1bAE47EqY59yiwb54r6vKw13DLpgcvrLRDPS6zOHLrcq+pF1HQnjjVmjBXC4ym1g7SztnZidWFg+lyBTJzniODP6JFj+XQgwxfjIZzRzBGshMy5ZSYaekhQVN5XvuBA6hzCBM4jYTn9IEHLj7QolMmGIMFkoU91xJ9cf9GT9Bxp6pt2PF7uBCTPEm52h0+7uXdG9p6aH8Q7vYS2xep8YJBxwT1wKLxJ7tR5YO31QGfGTxhgWZWBEMNTE5JAZD7gUzJ+jqu8S3NqrOjwYVpeewAwv0vpMJYvMlmYsms9+yRjwnIGe6jsOu//Ft6ASuUCrTBNAGN2h02u84w1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Tue, 14 Nov 2023 13:04:14 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:04:14 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:27 +0100
Message-ID: <20231114130231.2299661-17-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA0PR11MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: bf2c7c56-a4b6-43c7-d4fc-08dbe51233eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +zfiCy2opEv1nf2YsXvJdFv+MDpE83XNfrgAzjiE2kzxK66avkAT/IvAKFwt+mPJVc4lHFtQJo8B1N/t3jrgxK+V203Gq6EtbGiuem0itMxdSJacCOP1rUtpyQBX9uemQAdPSp9ONtBkx7RpwXNFeDK5cArUr9CTcJyB7Rln9gkK/Eqcwy6iwwXqt/uQs6LSKEuMgWiJ414CwkBwcvNBbavLsXiJH56Z/79pB5vE8CJtsRDNKkm8ZTyNcy6U0Djf1++ZDzGM8Ba1JCDHzV0am3cn0kOnZSXZUIrMlMWQAGpT/eULJAGDLcQVRu6ja04NNWeoforCxNtwaNt1ScDWXYFKZBXjUzdgn93C55SCVMtohdd+mFCsJNNJeXFNtPNJVHXo+bJLk5V2zl5q84O53eX6zUH14VyXBaSGg+x1dOW+t6ZuIapIGz4QA/BiIK5n0LKWa7knhLULntLa5v5KJb4235VuKiDO9jkgtkzYgPRUkH0U585vo/zyai3+9mjYF6Ir1yotuHunx8iI+DlALxLbL/N0kae3pBmCUF1lUc1WxdYS44ua+5TcNlON9pdU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(1076003)(82960400001)(38100700002)(83380400001)(86362001)(5660300002)(2616005)(6512007)(6506007)(478600001)(6486002)(36756003)(6666004)(66946007)(316002)(54906003)(66556008)(6916009)(66476007)(2906002)(8676002)(8936002)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3BTSWd3bk5VM0lzeElwa285cDB2WGQyRkJOYlFTVFJoMHpXcEhxYlZFTmk0?=
 =?utf-8?B?SE51QzFVcnQwWnFjNDI5WG1XNE9BWTJCZWxKMHgzdXBVbDErbVlyUWdVbHB5?=
 =?utf-8?B?RHExdGxpZTJPZkN0U3IvNEpwak12aERwTXNDQ1JISUE5WlA5THp6Z1ovMkdR?=
 =?utf-8?B?L0ZXWjlMMlpvKzI1M1QwQ2Jmbmd2R1o1SG9yWE9hZTByVDZlMVcrS3BOc2wr?=
 =?utf-8?B?dG9kMHJjN1Z2Lzh4aVlKdXVXWmFObjdLOVlNM3ErSHhEaXFGWlVhUmUyZllq?=
 =?utf-8?B?ZFkyMjJHYWxFRlhsVHlPUGVjZVdwRStlUTlvbExYNXhSUVc4dENjS2tPWEZp?=
 =?utf-8?B?dUlUTnVsbjFjY0hNVU9DQnRYZDR1NkxjTXJ3RzhBTTB1ZnlHc2RGSlFDc29q?=
 =?utf-8?B?NU9NRUZ0T3lSN1k3ME1LbHlVZWRtaW84S1pWRHYwUjBCZjcydXNBRGRzY0p2?=
 =?utf-8?B?NGRDdmJ2elFOVFd1cmtUNnNoZWs3OU9lOWIxY3B6Y2kvME9NZEhKNGxXWHZo?=
 =?utf-8?B?WTlOVFZnYlFOS290bkZTNHo0T04vT0ZLSkxIYUorcEVxZ2NuMTZpaXVqcmFa?=
 =?utf-8?B?SUpGM0k4UFhPa2s5dkw4Vk0rZUhDY2lzU3V1R3U4TEhtUjdrdXhTTWZ6WWdz?=
 =?utf-8?B?c1ZwajViL3hOV3pmTTVzY09neXZXTEhGRHRYS0psRnV0WGFWSlFCTGl6Ykl0?=
 =?utf-8?B?bTJIZVV2ZGM1QUtSL3dxdHV0TXFpNlIwSWdGU3B6WGFyMHFydjNlbmZzQThj?=
 =?utf-8?B?UFhtenEvRit4Q24rMHFQOWJLWGVtTSs0MFEvSklBTThqemFYYWtlbmhxbFc4?=
 =?utf-8?B?QVNXRzlFZE1zTlZRRjBKK1BPUXdjUmV2Z0NVSmZmZTlrcERuSXBZN0pDSDV2?=
 =?utf-8?B?d2JDRFNEaEJqMmUzeVB0K1A3REwvcDd1VXZVc0puU0NpRndSKzFpdDkzZEJG?=
 =?utf-8?B?TTczNkhLanI3bG40eEN4Vkp4TXhLMk5QOGtGR2tHZVRMYnBaTkswMFZSZ3RB?=
 =?utf-8?B?a3dlTlZzbEhtc1BYTjhTbk1nSUFnamFvZ3IxMTg2bE1tbUdEdTlpdmd3dkRN?=
 =?utf-8?B?ZitjdDUyVU82b2swWWgxaGt2Y2Q5Q0JCSnV5Z0lDQUYyaEVYdGNiSDFid0x3?=
 =?utf-8?B?ckhoOUwvY2ExRFN4UFgzakdKUVpuTERMRmFoOENPeE1US2p6SlRkdkNhTWFY?=
 =?utf-8?B?dS9hclRqdFFTazkwSHVWWGhubFcxR2ZteVVHZjhCMVZSOFhhYk9BN29PbTRR?=
 =?utf-8?B?cUdlKzV2eHc0NXdNL2J1R2hTMjFqNFNXTXZyLzNHN0c3Q3dZZlVqSXoxMFZi?=
 =?utf-8?B?UnhFNG8vZW9VMU5VNEN3WXNvK3FOamcrL2Z5aVVZV3F2M1lMUlJjd2V3V0Np?=
 =?utf-8?B?SWQ3Sm02QjJpYmMvaGtUUEVkTjhzZEVnc0EyZmNKOWhoenIrUTdpb2Vsa3ZB?=
 =?utf-8?B?SGNBVnFJU1MveDBNYjRFNVZMOTZkMXlGRHBOU1Z5QXFWLzBXM25iZGUxZUM3?=
 =?utf-8?B?elRrMVBCdmczZUpuZG5KY0MxbFRGaHFXMXFiSXJGNmYvd2NlbkYwa0tFNWlQ?=
 =?utf-8?B?RzBvTGxEWi80SDVuTzBpT3FVejAyVnZzQVgwVnpBTGNkcnVaZFpSbS9LVk1s?=
 =?utf-8?B?VUcxazQ2VUZmV21jdVhMS2k4K3RJanl3RHZPd3h1aUFVeGNENW5VenJXNjRp?=
 =?utf-8?B?SnlIZ0xxYXVkbERsTXdPeHZHVENqU2RwblpnNTI1SDhmUzFlTkRHUStZS1pV?=
 =?utf-8?B?RERRTVp2Tzk5WUw2ck5ucVVJbjZEcmpzdVMxZXpiTUd1TVE5UlBsd1owUm1a?=
 =?utf-8?B?RmEyNVYvWjhOUUN3dGJlZXpraWlnUkRRanVZTUtKbUNZQVJCMkFpdE80b1A5?=
 =?utf-8?B?YVpET0s5dFdzTzI3cjhVUnp0MU9MeC93RXIwaUJ6dkxKcTkrbW54RFd4djVZ?=
 =?utf-8?B?c29jMCs1eTdFMjJVN2RhQk5UYjNvZVRiVWZYNWZmeE5VUU12Zm9ya3ZBVlBs?=
 =?utf-8?B?cFVHMmhVUFZQT3QzWDl2NVNDTkF2MThzZFFNM3Z3UEhTUUN6K2k4a284eWNQ?=
 =?utf-8?B?MStac3p5TjRTdTJGNzE1T0V2QmUwdGpUc3lFM0Y0NHF1N3FIMmt5S1hFOTVZ?=
 =?utf-8?B?RCtGdk9JaTVYdTZCR202Y0RNUUVoR0lHNnBiUi9OTUNyYWRFMWNWK2tObDla?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2c7c56-a4b6-43c7-d4fc-08dbe51233eb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:04:14.7572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TcuYGaZC/ISby0VMBoqXnlih8+fMkMW7k6vMsQ4MN9Xga85p9w24DRot5j5nkPqyWrU8QmCwwm0cBqBd8FuXf0p1zAtLsOcj9yWCmANy0Ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 16/20] drm/xe/uc: Extract xe_uc_sanitize_reset
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
---
 drivers/gpu/drm/xe/xe_gt.c |  4 ++++
 drivers/gpu/drm/xe/xe_uc.c | 14 ++++++++------
 drivers/gpu/drm/xe/xe_uc.h |  2 +-
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c8e2689873c37..d0962e0cc27e9 100644
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
2.42.1

