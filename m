Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0053C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A44310E202;
	Tue, 14 Nov 2023 13:03:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9955410E214
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967031; x=1731503031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+je0YN6WmMjG587JKLEMZqJ9+09hmIIsPMJHVlXomvE=;
 b=eJBRmqPgGb4AL7ajOk/FXxUu+o1IrAUfauvBeFY3LiNsNmiTqcy/t9MW
 +UjpQ9lq2ylw24IdIaDzfLN4CqHxkPSdoGRn1IIQfR0LtVhltw68TKqUD
 OGHBzwoKXeV4IOzId0XJO+TmrsiDELeDHF7QEitfdzq7rNIdRpY4I4BQV
 SDDdW8W2zMkJysT4HtDxi0UXTHBntD02nzdwFbpaBHf0TC88x4nQHAo0Z
 /Kxdx3PoAiDHRfWMr/7wu1/rgHlU7Wv7nyl2Lvdndx/kDAQcnoDqhWlkW
 ALp+VPTpdwBvaCGP7woQiyDvN8BgN78Cr96HQRKPEJt4rqOsK2IpAwXgK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375692050"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="375692050"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:03:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="882046080"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="882046080"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:03:51 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:50 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:03:50 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvM+IgA9ZEVt3id9OYWJQgzNHGWxpKh4AlTOlc9NNbAZT+5onbJerQX0PdCkTuiD2C4DPbBNsAb9feoJFy/TB1n5O2Y/APjDbrbdSacSBrz6+jjDaLonoA5uf3FKgsYutwaaiJp6uX25H2P0AalY9sUj2SMmEfs7LGnHNqaDI1dzP1YTGCvq77p2KBAJ/GbOgK/PB+K+us/xb/qa91yQToEMVG5l3iroKYLHTKsLvOFg2vOzAsn1l+C5l7XxxxYEQX3ba3MaeeAJCLjmVOtZalv7uo0mgndZ25Kg17u0DSq0DrnjZ4am/053UmjjY26kBcyPBy7mwl3Dtmx/KaJWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8FY2/BM9vj8NKqDvRHoVnBVmoIw6VgmbP5K1EuHmn4=;
 b=LLmq0LjzX3EFIX2AqurrS5z5lFbZtZDY8ojE7063nU2Lh1STJFPh5ygXr1/K7vD45ScI80F2V15kPT4fgh3FCEyDxY8hDXdtbljLlY8xIm2mm/ghUG0LUMpkKZ9LluoqqmM1l4WlcPwSiAJqAe2DxqxBb6QSibevL2Zl/KcAkhJrkVnkzIhRra/7FfHniYHOoEzKAf9q/tjf3Wu9ZfNI8ssFWJ/FhvkHydw7Cli4oXdfTH233xZke1sqYl5cBLej2ouAXyzNBp75jGxt407UMGAoMRUXe+sHJM1bPya+B0D3QO/q6ujCggmy8pGFZ1IC3cChsM2xmuK8tinig0wbuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 13:03:48 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:03:48 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:20 +0100
Message-ID: <20231114130231.2299661-10-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW4PR11MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: ba81154d-2396-4503-2fc6-08dbe512243a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z9oqNsvsW3H1TMdnOXxVASVGx4VMiQxbMUipOOiS4sqynOWyHyYZYNH8KyDnqrwUpAAApLJYussTjCtRttIRxlDMCAe49K9ZP99aHvUexN1MJvd4kRpoxNbzHff7wzMFV1pYbW7ziyPItLwgMYlB961UmebtO3ks0ZOgTYW/mCgr/E2VLKoFtgGfgnLsM0Hq0NEpZwSW+T1mFwXPrwvvTYNQfZZat5wAqnXj99Osw8d2Syc/R0HJtR7PUNqhBOnJMwsmPhtblrVlKh2Hglui8bwObun+2EYxEYuVk3CCMNfWs47YhUFMgbkCZpA2mOgKeWEH1tpS/tNDqOO9WWnuhkwwAzdcUmdG1uLK2e66jlwRlNUNfkVXboGG8F3N7BIEFLzYOvs3k2xySd9Gc0HZ9KUTKKm6ZmzH76zwlhjJidhTAK60cuhnuyJ0uAOKjT1j2Bynaz1CTIztWhq2wi1LRSzJaTz8+yRGGCSeLBxsBmyY6olVEk7Da4aBWpgqfcSbS+B9CcXxAZb/pI17cxVFqQ8Lqi5aCCeU2581DWqqFKtMJNRXfWQ6qdn1J8qZ2KSr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(346002)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(1076003)(26005)(6506007)(6666004)(2616005)(6512007)(83380400001)(5660300002)(4326008)(8676002)(8936002)(2906002)(41300700001)(6486002)(478600001)(316002)(6916009)(66476007)(66556008)(54906003)(66946007)(36756003)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3lmY3NBUVlYN1pQZjhleVN1bTZ3V3U0RFBieFFzWTNPSHNDempSMXBERkYz?=
 =?utf-8?B?cUd2alFBb2Zld1pPWk1tUlZOcVBrcFg0TVpQOFhUWng0ckx3bitFQmpPWFpJ?=
 =?utf-8?B?ZUxCUEVEa2tZNExPNWhGK3hDcnlTcnFzS3JWUnZNMzN1aWo1VnFSZHNPTVVC?=
 =?utf-8?B?eW1sOStmdk1vcmt0RmRqM2hMSHJjMzRhZlo4aUJDeU4rMk5aY0NLV2c1dzB5?=
 =?utf-8?B?U25tZWs3MXlERWVuOW5iVG8zZGszdVpoZmdJamwwWW1wSlh5cTg2bVViZTFR?=
 =?utf-8?B?dTBDdFRjU0x4THJvR2pXcFpxMGRkSmhVdUpyblR2NldFUDZhbURteE1NaUE1?=
 =?utf-8?B?U2lKWGQxTWJNVXRjaWNsbGhUYzhUZzlQUG5uOVVJeW9QMWpLYkVHdTNCWFlU?=
 =?utf-8?B?aml6NnhQTnBuVHVEYkdZSUMvQ0lCRkN4Qk5VWFhKR1VxYlhvU0lCb0FHOHps?=
 =?utf-8?B?L2Z3UGd4a1JYZVBkaDBpWllGRHA4SW5LVDJiRWtwbkZUSEdrK0VRSmNFcU5Y?=
 =?utf-8?B?eTVtRHlBOGtiRlNQNEpIQWo2Sm1EL2ptVm92dFhFRWVDMCtZSnRZMXNrdmtu?=
 =?utf-8?B?MzVReEd0N00vRlFqcHJkUTJPQU5KNUhzdjVpWUwwaUhxcmk2cnN6UVhRdXlN?=
 =?utf-8?B?VTVuUlUxYjdTT3UrZ3k2bEVwUkhEcnZOTFF4K01kMkhBa0FlMzR1bmFIS0Fi?=
 =?utf-8?B?QVN4SDd2U1JUS3ZaL2RxZzNiNzJUWnJtWW12Q0p2ZXZNdTZYazJudVVvU3pT?=
 =?utf-8?B?eHRBN0tOVyttK2xCT2Npa2ZjNmZGS2hwV2FROS83aldyWWZjdzJBQUJRZ0tD?=
 =?utf-8?B?dEdIYWs1UkFZeWpaNHZ6bWtSdVJZa25Ob2dLdGtkT0dpZDM4Ym04dHhmdW5C?=
 =?utf-8?B?aDBVL1pFUWVmQU13UWlmUUJYSzEwd3lpeHdEZ1NtZ3JEMkRCYTNNWThxbm5T?=
 =?utf-8?B?aGxHdFpQMnhxajhYVXRJSzNUdkZ6dTBoUUorclRUSUh3UnA2ZWhIbG10Z1Rp?=
 =?utf-8?B?bHNqSllNRU0xQ283c1B6ZUp6aDBXNzhBVGJWdjkrdnVoZG9USzlMdytFSUVy?=
 =?utf-8?B?M1ZRUFBndDFqMklGcGRWaXJVTzJNNFV6ZDhUVzJPK2VFRjltdVh2THFzZXVT?=
 =?utf-8?B?VVJvOEJlNThYdDFWUi9rUWJCeDdlTUdxMGJIcnBxUnFNTGhqcFpVTmVvZjJH?=
 =?utf-8?B?V3hPSCs4NnVlY2xhdUI4dGdqSG4yMDQzQkVVUHpCOGIvcGphRSt0VDcrdHlq?=
 =?utf-8?B?M3N0bEhnd3MyaGlzdlFrVm1ESVk1TkZ3MEJ6c1VLMWtaVHZ4TXlxWGNud3d1?=
 =?utf-8?B?S0pEQWIxVUlhdnJRVEJqRUs1NWRiVVk1a2hTZzBOcDlyaG5yZUZITzFuMDZU?=
 =?utf-8?B?L2o0VDl6QU5KY25nZ25Wd0pmZlBhQmFFUEE3M0tRVE5VSmNGVFB0ZHU4eDh6?=
 =?utf-8?B?ZUExbE5UZmhkOHllOEg1MlU4OVI3cDlzdHZnMnorbkxXQ29oYUZiaDVETU1S?=
 =?utf-8?B?MUh0a0t2bkljYWZOV29rYUVZM0c4b1JJQUxtblFvaGJKYWJQNzVQdDV0VVlC?=
 =?utf-8?B?d0h5ZmVZQ0FHTlhnTmFSNjBsNm04MHAyeVlMa3ZiVExBclVGTE9vQ3hWN2xi?=
 =?utf-8?B?OUpqMzhmbWxJcSswdTdEdEozUTltd1JXM2toWDlxTklXamFydnNRTk1ic01o?=
 =?utf-8?B?VDM1ZnYrTlBKeDYwTjZvTTBiTHUrTXppZ09ZTStpYTZ6b3ViTy94Q2ZlUGZv?=
 =?utf-8?B?eEZ6M3Q5NzJtbXMyZ3k3UE5PeEs4NXdYWU5jdmRJK2hRN0lEMFVlWVJ3Rmdz?=
 =?utf-8?B?MkhkeUE2ZFJaT1lEYThDTnBYdGtpNFBVOWxPc242ODhNc0JjbmUwTTJGM0ly?=
 =?utf-8?B?alFHaHRBNWV0OTR0cDlXTjRLTk93MUdxcHpCYW5EZFhrQUQ1cFBFbTVsQ0VK?=
 =?utf-8?B?Y0NUOWF2V2xDREYxVXNLelc0VExpQjNsOUIwcWF0YlRuMGxTRFVROWJSZyti?=
 =?utf-8?B?MXErVXJudW9JaHluekJRL21uaWVNMmZJTjIxQnVpK09wYkZCa0hmODV5d0Fu?=
 =?utf-8?B?Z3dKTDdMdXhVejVIK1hPOTB0V0V3V1JGVWxnUG96a28zcnRUcXRxOTZad0pU?=
 =?utf-8?B?VkJPbXpRY2RIL3dEWGgyYThWWVhTMDd4S3NTUDhENUxWcG01Wk82bi9GWW1l?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba81154d-2396-4503-2fc6-08dbe512243a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:03:48.4375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /RFXB5E1jfCdvISyEEKjwMyB6JaN6bafXb7XP+Zhoid67DeANGYdLrvDVvl2Voqf+/P3ka0Njt+R0guUkQgDPIwELvB9G+krVHxkLphn5aE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5933
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 09/20] drm/xe/device: Introduce
 xe_device_probe_early
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

SR-IOV VF doesn't have access to MMIO registers used to determine
graphics/media ID. It can however communicate with GuC.
Introduce xe_device_probe_early, which initializes enough HW to use
MMIO GuC communication.
This will allow both VF and PF/native driver to have unified probe
ordering.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
v1 -> v2:
- Add comment to "early" variant (Lucas)

 drivers/gpu/drm/xe/xe_device.c | 22 ++++++++++++++++++----
 drivers/gpu/drm/xe/xe_device.h |  5 +++++
 drivers/gpu/drm/xe/xe_mmio.c   | 16 ++++++++++------
 drivers/gpu/drm/xe/xe_mmio.h   |  1 +
 drivers/gpu/drm/xe/xe_pci.c    | 22 +++++++++++++++++++---
 5 files changed, 53 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3a98e7b502190..6fe669fdf1c0a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -364,6 +364,24 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
+/*
+ * Initialize MMIO resources that don't require any knowledge about tile count.
+ */
+int xe_device_probe_early(struct xe_device *xe)
+{
+	int err;
+
+	err = xe_mmio_init(xe);
+	if (err)
+		return err;
+
+	err = xe_mmio_root_tile_init(xe);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -382,10 +400,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = xe_mmio_init(xe);
-	if (err)
-		return err;
-
 	xe_mmio_probe_tiles(xe);
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index c4232de40ae08..b80230c631068 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -37,6 +37,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
 
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent);
+int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
@@ -123,6 +124,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
 	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
 		for_each_if((tile__) = &(xe__)->tiles[(id__)])
 
+#define for_each_remote_tile(tile__, xe__, id__) \
+	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
+		for_each_if((tile__) = &(xe__)->tiles[(id__)])
+
 /*
  * FIXME: This only works for now since multi-tile and standalone media
  * happen to be mutually exclusive.  Future platforms may change this...
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index acf6dfca0bc46..8eb19a4bca9c6 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -15,10 +15,12 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_macros.h"
 #include "xe_module.h"
+#include "xe_tile.h"
 
 #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
 #define TILE_COUNT		REG_GENMASK(15, 8)
@@ -375,10 +377,8 @@ static int xe_verify_lmem_ready(struct xe_device *xe)
 
 int xe_mmio_init(struct xe_device *xe)
 {
-	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	const int mmio_bar = 0;
-	int err;
 
 	/*
 	 * Map the entire BAR.
@@ -392,12 +392,16 @@ int xe_mmio_init(struct xe_device *xe)
 		return -EIO;
 	}
 
-	err = drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
-	if (err)
-		return err;
+	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
+}
+
+int xe_mmio_root_tile_init(struct xe_device *xe)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	int err;
 
 	/* Setup first tile; other tiles (if present) will be setup later. */
-	root_tile->mmio.size = xe->mmio.size;
+	root_tile->mmio.size = SZ_16M;
 	root_tile->mmio.regs = xe->mmio.regs;
 
 	err = xe_verify_lmem_ready(xe);
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 9f1a25cfd2cf0..74976af15ea60 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -21,6 +21,7 @@ struct xe_device;
 #define GEN12_LMEM_BAR		2
 
 int xe_mmio_init(struct xe_device *xe);
+int xe_mmio_root_tile_init(struct xe_device *xe);
 void xe_mmio_probe_tiles(struct xe_device *xe);
 
 static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c50cc3f7cbe06..a1026b7ee4727 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -537,10 +537,12 @@ static void handle_gmdid(struct xe_device *xe,
  * Initialize device info content that only depends on static driver_data passed to the driver at
  * probe time from PCI ID table.
  */
-static void xe_info_init_early(struct xe_device *xe,
+static int xe_info_init_early(struct xe_device *xe,
 			       const struct xe_device_desc *desc,
 			       const struct xe_subplatform_desc *subplatform_desc)
 {
+	int err;
+
 	xe->info.platform = desc->platform;
 	xe->info.subplatform = subplatform_desc ?
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
@@ -554,6 +556,12 @@ static void xe_info_init_early(struct xe_device *xe,
 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				  enable_display &&
 				  desc->has_display;
+
+	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
+	if (err)
+		return err;
+
+	return 0;
 }
 
 /*
@@ -621,13 +629,15 @@ static int xe_info_init(struct xe_device *xe,
 	 */
 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
 
-	for_each_tile(tile, xe, id) {
+	for_each_remote_tile(tile, xe, id) {
 		int err;
 
 		err = xe_tile_init_early(tile, xe, id);
 		if (err)
 			return err;
+	}
 
+	for_each_tile(tile, xe, id) {
 		gt = tile->primary_gt;
 		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
@@ -727,7 +737,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_master(pdev);
 	devm_add_action(&pdev->dev, xe_pci_clear_master, pdev);
 
-	xe_info_init_early(xe, desc, subplatform_desc);
+	err = xe_info_init_early(xe, desc, subplatform_desc);
+	if (err)
+		return err;
+
+	err = xe_device_probe_early(xe);
+	if (err)
+		return err;
 
 	err = xe_info_init(xe, desc, subplatform_desc);
 	if (err)
-- 
2.42.1

