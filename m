Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CD5C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E9710E43F;
	Tue, 14 Nov 2023 11:45:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AABA10E43F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962349; x=1731498349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HNxdMsi17GRG428JCDNlmjDq2ZbWQby+FC0NCWi9emU=;
 b=aMz07tRQ3524WXp6omOLk+Krhrmpcf3LKl0qgRHkEzhe08cv/5TSunlQ
 BI8QrEQsh4MYpzsOH1ZOlmqGx8Fp2P3LaqvUjddjRqLxJjoyRChce212F
 lX/LNBikyRQUMzA8um8HXSvlqpkc8C3a/QvwdEu3Ra65wBHK/+iiyMqCu
 v1f9eLNRhot6ynBmht9MVcAZbDRRXiX0Hk0hEQMRzIM2AwpXnW6SzJIoS
 UuB/TxnClFPq0PZHlWUwZpjl4uK5PybIgvnokmMdGM0K8K6VmtJ5dg7tG
 OZhD5cASK9j9VAhKzuZDeGigywpJheVtvIK6AZthn4Joj45n7ZemAvPb+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="369982214"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="369982214"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:45:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="835009124"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="835009124"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:45:49 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:45:47 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8TuZWIrhtCcHXnKOcmTXZXPquKY0k2Rszf7lReF0G8BkMhDkZD0pX8Bh20bqYpfeUBMvGkEL/bp7k+EzTHK1HCwD6/6z218VDtTCbTo0ouhkueaHsEPcGrkSkaKAW065yey0oR/CEnt10PXR1E5pG7VB4OCLTPMZVuzCpJfTxsxMa2T3c9qmVNThlyWAGZoS4MfLXJkjTR1umdqFf0tU1H5HZuGZGQcQmFuCX4Bu725i2qL+4pyBsmbOhQVK0Ft93JBF3NfGXArVjPtJfKHrM4VaTG4mf22U56hfmpFkiPeemO727g6Bcr2b1PSmUZlmpS5wM8GqyqW12R9pz0OYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LetcXs1nehC81yeSmLaEqM0a2QnHAJC2tRDzhRb3/l0=;
 b=HlRPV6QzQR3Omuaf0PsvTwDJ2vWnGTT+qCoWu7Fmo/4cvI7RHGBxPIMv2nlOzNk2n8VMt4rMmy4WjVSXLRE0AxMqvwb2XENVw3A76kRrdZoDLcVukk89H1ULeKLDfPFdMVa7sFi9+cAE+AYZAUx1ZJPb6Cyfdwh4CK3IeVV3wyOlJVGqFs1Qa9TnPN72OfVYUyfbb25o66+Ol1b3mVFmCtfoW+p6kdJDx9IIsxC7dH0TVXFSJq6kDpzN1nuc1Oa5+v+nCJY58EIRH+bpYvJXOqiL6h0feZaIus2dxSDs2yY2+GVgbpdeBuKXkmQx3nfPCy23dTbrFIx388ubxE4Fuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:45:46 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:45:46 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:44:01 +0100
Message-ID: <20231114114405.2207747-17-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::28) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ccd5388-d9e7-41a0-42a7-08dbe5073d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DrCvLMZXk0PbVlB9OlhVLFgmkdIJ1bE4H2mlm20TIo+lG17vj2vR/KLiyGDUgGh111SAtxuy0gtVu7D9E34TJrey3ISCIi1w16O+YWZw+KNiimP2DelJer6vTlA2v/T1Iat75IPs1c+jVmXJ0LBs6izHeSnnrw+Ca9WweU9tYpELccCK7yDPIN5wSzqiD6thLDRlBI49YHIrnQTUS6Zjs5ht0+rwONOofI1v75CwF3gxd0uJJPDRsTicn1rp13fQvmTnQLxpCzkoRSSU9aw692XIiSKNGDxm25K73nQraS3ivZ8Kdspb/vPZIoRkC2JDTaRCZfoMdKUhjvgGTjOEhtYJKYji6uDkP7i8GcZqpeY0rr0tBcrdYd7rWmLqQrbOpdd3M/cwO+amrfNX6RQgsJeTFTa0p4bnXrE++TWPx7zxOVvS3Qa3kbliJdVoNCSLwo497guHatp+1nUmpD9S/5DOf5RB4mXRbTe3SdQ7nvWaddik6C99y9hOmTUETxoJyC3CscT64OgjCSJMWi9m7Nsc8gzUB3jKPLqx/dbqQx68tvVXzRVEUb6wl8AI38zN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6666004)(83380400001)(6506007)(38100700002)(2616005)(6512007)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(2906002)(316002)(26005)(6486002)(1076003)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1F5Z3FZZU84SUllUnhKdXNKQVdPTFljeldiaFprYjEzOFl4eC9IaFh3ejFQ?=
 =?utf-8?B?M0h5VW1MVUFWMmIvUGtyZ1FPV2FxK3l5L3g5L08vT2crdVpBZ1poUmZBZWYv?=
 =?utf-8?B?UDU5VjBqa3FoeWdZd1dLM3FkWHU3M2JFa25ZMVFXK0hraW10WGtYalNnVUNw?=
 =?utf-8?B?SEZEWEFkUWlBN3lhYVBRU0FQeXdNTGl4U1F3bWI4SXpGY3dVNk02SENWWkxu?=
 =?utf-8?B?TTNyKzRTWEhvT3RJQmFNbUdFbmQxZFZTNVFnaHFqR29STkNZaC9qTUt3cXhT?=
 =?utf-8?B?WWVXY0Vhdi9YZjNLeEdha3NVSm1JZ0hZbUhRamZXZElJQmljOVFvZ1p2Rmg4?=
 =?utf-8?B?cXFVUHFTckZCV09ZZXBuN2Q5UFVHUDN6dHlQYzRYZWM0cm9LNnduVVdWbDBh?=
 =?utf-8?B?U0M5S3hVMDdkWmczWDhDbHg3b0RSOUZaVXBGVy9QcE1Pa1RkZVRiaWZOODJI?=
 =?utf-8?B?OWFFSHdWelhxdDFEUTIzMWV4R1REeUhxUGhEZnFmWlh5ZGI0ZXljeVFXUm5G?=
 =?utf-8?B?RGdMYmtpRkd0aldBVmNLNGZxeTFNa1ZWMTJFUVlRNXZONzM0d3ArdUpwdHlU?=
 =?utf-8?B?eHRrTE13N2k5UUVtUlQxTFRTQkVLZDBldHYyUHNSZ24rc0FmQVo0ekJ5Nkw4?=
 =?utf-8?B?MGN6bndGYWlSOGhuY25EbmhOaUZkYk90NzR6ZG1MUDlQbm1YUzNFdjlFUisv?=
 =?utf-8?B?c3orTkRlak91L1U0K2NZTVBadlZ2czNSVzdZRGEyVG1SZDF2YzhsZGFXZU80?=
 =?utf-8?B?WmdLdU9COXI0OHJwRVBpTGlhWlQyQ1FUenFiWUxzY3UrblNZZFh4Q1dDMFBL?=
 =?utf-8?B?Z0JEbHNYZnUzMnYxLzRnbTh1dUNxYzdaazdWaG1rWFhybFJvdHU5S1hJNUxv?=
 =?utf-8?B?U2FydmtlTHJFaXE2ckJyVzhldXNuUWc2NGNvUXZJa3k0QTd6L3g1QkRSbHE1?=
 =?utf-8?B?dmgrdjBHWUt0eDNQMVdabGVHaW5CUjE3OHJhVmNycVlRRGRMWm9PL1dGL2xE?=
 =?utf-8?B?bFJLalBZVEswS2JObE9pQTN2K2xPR2VmUHFrbStoNUQ3aEFhYVo2Y1JleHVR?=
 =?utf-8?B?NjhCWVViYXBnTTJaVzhPY1JUMXlOK3NEOEVpNkRreVZaMUlMTHZPTkJEREJV?=
 =?utf-8?B?UWZwY0dFUEpUaHlXOTNkZjQ5dXdIMmRpazVCREVkQWhHOUNVb2N1ZitWZVg2?=
 =?utf-8?B?YWNsOG9hNGU2M1VJM0JBb2VEazNjN2l3TDNmanc1NnRCWXR6OXRmdlA3ZDdn?=
 =?utf-8?B?aWhrK0pNN3VsVThyT3IyOWJkVDUwaG8rMGtQcTErdnI3V25Hb0paVVIyTDF3?=
 =?utf-8?B?VUhEd3lpRXFWM0RPcjB1WGFuaFZDNk5FT3o0SXVPU2l3bFNweHZTekQ4OFI1?=
 =?utf-8?B?RHQyY1QxWThiaVEyVkc5eWFyTVpFaEVHT3h4MHJpWU0weHFubndjM0VIY0NW?=
 =?utf-8?B?d1dEMUtCdzJTM0xlTDQ3Ny9hNHJleFByM1RpSHZpNWxCUlNGVGd5N2xJVGsz?=
 =?utf-8?B?ZU9hbVpQMDhnWGFNZ09PSE1tak5zNFhNYzNVWXgycmxzbm5QQzhQSlZoRW1P?=
 =?utf-8?B?RzFTK2F5ZEs0NVhqYjN1TnU4MmNEUCs3cXlSSFNWMkY5b2lacm9oakIwK0lR?=
 =?utf-8?B?VXV4dnJpQlpxSmkxSGt1V0I5ZzZ0Y2ZEZ0hyTjcxZjBjaDZxTkE5RXd4SDgx?=
 =?utf-8?B?NjZ2SXNPRWtlcDNiTGFTUCtBK0laR2hoNzR3SldmZ0NpL1VCbkJnVFE5U3BE?=
 =?utf-8?B?cG5QcE4yenBHTi9FUERCRkgxbHFtdGpNWVhsQkswTnEyaGFzdjhaL1M5Rmty?=
 =?utf-8?B?Uk1qU3RqODZiQjZjbVFPOGl1TjJPWTZCa1BPandDbGhCajJZV0VpYk5US3JS?=
 =?utf-8?B?RkQ0TytFSVpac21FRG9pSDVBTW0zQkYxbGNmcWFnSjFhWkN2RGwvdUNhUW0y?=
 =?utf-8?B?SVhMb2djNFEwYnpkd0lhMHFGZlJVZGhZVGZ2aHBYZTFmL3oxempCMnFWclBk?=
 =?utf-8?B?dHExSVBjZ3FBYjlKbFhLZXU1aXpndEhta3lCRTBtY1dQbjNabWp4OGE0bFM2?=
 =?utf-8?B?VE5lMm4vRTY2V3ZKWnY3OVRFSjZpa0pZVHI0aTJwai9EN1dOa1ByNzI5MVlU?=
 =?utf-8?B?dllVN1lZMXJ0dmpSMGlRZkdPbi9QWk9nc0Z1ODNZNmEzMW9TK0IvVzJESm5I?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ccd5388-d9e7-41a0-42a7-08dbe5073d9f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:45:46.5420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRlNBtSTseprsOnPFXGEzNzp+elzKvZVhLNWneF+FsmoJTmJRQ4lSkeGFoGAmp2iDn/x60DbrZOZutv9AJu5PxmEqTzYv314GgNwHImmJ8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 16/20] drm/xe/uc: Extract xe_uc_sanitize_reset
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

