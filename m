Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2353C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 01:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8053510E37C;
	Tue,  5 Dec 2023 01:33:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4B510E462
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 01:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701740028; x=1733276028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+QAGZ3T9Yo9n7TTDWFQPHSHB55hiPkPcbAjx/JYDgNM=;
 b=VayTqbpUu5KOfsyKBwbR2r4dj1xvaDRS6sCmE28GyWcJ3TxPkXjGt8Vt
 zFJ4sslh0CTBagF06N4k20uuCWNGcPj5d2cFKECm68AU40x7jN/3zBUPh
 YkoaiBHi8wNkTpCzn0u32qPXIoe+dpf5thi4ZvVQ3EBp+MvCeK2j0jqTH
 0YaWj36RuiktWqbhMhUsHbUVI644ZNz/qdUYlDBR41kCuZgpdq8+59Oz1
 BxubjGa4SBrZD2/QAgOjZhXHPj+ZWmkxV7aVBKRaKuY10kZI12MfH1d8p
 AxzSX6HkHBg6ZoLeAAwUcoxZPP0sWrFdMcIGsZglkui9Cniy+e5DjvdJT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="397723618"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="397723618"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:33:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="747035970"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="747035970"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:33:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:33:47 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:46 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:33:46 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfoLd+1/1vwQl9+le62nIe0Gkw2mvgXXv7ZjKOOCjO0A1Z9iNhvqSezsohaufuKK+vqNyXTp2N2dJois8vr69jh775G1c0G/FCqgEM4VIl4qtirZmb8nkZlqxBRciJsEeQzrE0qsvIPJmYF0SJxWdDAWlyjnMi15Ygb/Aw9SmK1xCv7aMgrrsJ6N3LwEnLA0ZeQSmHo4agXauxiaH3+pLh0m21+LP0RDaYNelTS0xRc9B+bs6O6UfNO/Z1PxZLpGdRo6ipNPezisIyciNH2kFHDHv/o6l8NNT70WZbc/nkuxuEz56kbHrKl0UNVS/Mvh3+jvdiIpAcntVKotOXiukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqbdl4BuVsgEm1K1dRDii8fWF4Hz6LL0vFEHQRara+w=;
 b=lBMcOHRVK7e3NoF+tk5BHAw7pwpdi4dRFEYKZpT0QJ7kXsA56a8LwB+f8Kz7kT2afMDoecXSYqezMdmABYTfXOs8/rezYLE4QegrF318rqiuTU/Ap/bBIALTldLxTOVf41XCIzlXvCQWxuftF3uMj+ByaArcGRvwz/7K2VVNIUyTxMydTiebVsBc835J1E3A/KLFH+J9+Fc87oCZwn0IFQUPcawzrJw8aXUiKWAaUSdQvDDsO98GnXG85vUIgWuSvjUsnED9dyRFOjThf8rUMnhkGN1wN+XyQ5111w9/57Up+wJjwkCejQYr7mDcqPnoLQZbI12ck3kK9ktDkhNU6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 5 Dec
 2023 01:33:44 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:33:44 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 02:33:04 +0100
Message-ID: <20231205013309.1497006-9-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205013309.1497006-1-michal.winiarski@intel.com>
References: <20231205013309.1497006-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 895d634d-f7d5-4f2a-ebe8-08dbf532384c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IFanSG2UzWL+yP0Gh2i99pCltEetQb1sDj2AD6m5cFcIVU/Qdw8009lj6YNtDoho9b3ebu2cwwvXe5aJK8ARSWE6X/QhYt/+95hP6f2Nv2uCjVGX5owSsJ80QZzxWAEzXoVemjY/a0YqpdFvCnYlTpAj8Q4OFipbgoGYoWlxbRnhNFZ7rXBF5sancT7wASbc9wjJy0t+eDlrZGvRtxNtWNbs7V+vAjU7Rpw7OlmdMwMthzTiERWaex7HrubB6NsKRjf4Oki9OHLxYT9DF+EnW0UPaI5mFdJF0NJvOLsUCQk06q6K5pgmi30Mp9KjbBfxBTIedsyHx0++Rq0m3Zki0U2dMf0Em7FiSr/oqgxgqmVA8faSTtJiz8oFEezVBTzImJtnD8boghd52F3FOZkElEQ+mhG36BpzzzCXGN6urGyA8D1q1GFFgRx34WqJmcSezctWEgE/DKfMkHVJrhioNsqQRa0aYoAn4eIGdKWcD/AWpU4Uj3X1Pu7HfAYjQtVq4zJV2M+xJHvv5HDq3F1kywinvXTMJ43T2O5mQYD3nCMNvhxg2tjKDXAfWn0o0lDtsai4URSkl06fQwO27+vISBQ0y/+33qPX8o9g0NHYrbU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(1076003)(2616005)(107886003)(6512007)(26005)(478600001)(6666004)(6916009)(66476007)(30864003)(83380400001)(6486002)(41300700001)(2906002)(5660300002)(8936002)(66946007)(54906003)(66556008)(4326008)(8676002)(316002)(6506007)(82960400001)(36756003)(86362001)(38100700002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXV6WFI1cDhaSkRwS2JMcVdtSTYrQXo2NElDVTlNeXMxY09TbHdTU1pXU3Ro?=
 =?utf-8?B?WitZSXdtV0hvMG81dTkwSk41ZHZmT1RLKy9YZjJsTDErakdMUmNsWDFSWFNm?=
 =?utf-8?B?T2hQVzdIcTQwUlVMbUtRQW5jZ2RWWWlaQVZNcFM4cVhSVUlKcUtCSlExVTVD?=
 =?utf-8?B?MHIrcjUzLzNvWEhqOXZJUnZ4K1JPMkZ2NVgrWmZKMEpFR0FqaDI3dktjaGZV?=
 =?utf-8?B?SHk0OEthWjJsbDNNQzBaTjRReFo3M0V4SkRpM29lWi84cjdtaFZua3Jkb2Zi?=
 =?utf-8?B?T0pXeWRWYlBCcDJuS1RIeVBKbVdIaTNWUWt4WUdzdC9CSlhmd1hGazBKTkhP?=
 =?utf-8?B?QnpFekNYTncrQXQvam45bG9iQzU0MWJiWnF6bVNSRWlEUUhBcmNleW5BZ0Iw?=
 =?utf-8?B?dkRSelJ2WXo1bFE3Z29lVDdac3pXYjJ1WjBpMGgxQ0w5YlN3NFBNeDIrYld6?=
 =?utf-8?B?MnhVUWN3bk9rWGliV2Z5MEVHOTZDRE1nR3J5U3JDdnFHSlR0WWxNbkxNdmFj?=
 =?utf-8?B?dGxueE5qQjdTdzFOb0QzZGU2SEJFdkZvRElRZnhLK1NXVUpKVU9CV0IwQkRY?=
 =?utf-8?B?TDVMNjFRMk9QdFlJTCt2MmF6Y0QxdmZSUkFOUlpEbHZxbzNkYktDdjYxMExh?=
 =?utf-8?B?VTVsdDRZaGorVVFXVEUrdTJ0ZFkvanhBL0E5Q0E0Q3NxQ2dFT2N2RzJuSWtO?=
 =?utf-8?B?b09aSEZTdzNrZTA1eWZDQUFFVUpMcUJTd0ExUkUvR3g3RTd1bVVOb05EcnlK?=
 =?utf-8?B?WUZVOUNzZ25DVUtueVdGaFhXU0pFbDZPYklNNGFZOG9jZThFSEJQQi9XcjU1?=
 =?utf-8?B?U3NoTGhGUXVYQnJDNXNqWWZrbHlON3JtcUUxR2RZNFJjdVJObFduTGpoWmJ4?=
 =?utf-8?B?c3RiQ3dFK25paDJzWFBDN25velBuZDdldUpzYkQyM2dOZkpGVEdiemRoLzll?=
 =?utf-8?B?aXpacXNqalJvd1FwVUVJaWFGSUlTWk1xMUNiRVg2TzVIc3d3MmNoUitraG95?=
 =?utf-8?B?NzF1Y3QyOFpBUkgzYWFBL0FBUTVURUR1dmtIU1V1NTRxZzhkb1EzeTh4cFFN?=
 =?utf-8?B?Rm9OVXZ3M2VHUVlOOFZSQTFWZnVBdHU5SWVPWEN4WEdkb25TYVN6ajRDT201?=
 =?utf-8?B?NFJ1bDNpL2I5MEFlc0xZcHYwSWxCakRwT21VUkI4UWFXclg1eFRNR3Q1M3Qw?=
 =?utf-8?B?QUtDVDRyTWJ1dDBvZHJaZW14Sk5DamZ1bXQ1VnFxQVAvOEhRV2NJTDduSFFW?=
 =?utf-8?B?TW9jZTh3Z29IVXJkMHZzL0VOWHhRVHlwaWR1VzR6RmVDc3BhWktDMWkxUThI?=
 =?utf-8?B?YWp5a1p6c1dMNUVGQi9oaTJqcHBhb0tmT0F5ZXJNS3gva3NVTmdTZHl5ekZB?=
 =?utf-8?B?ZUI5UnE2cWRyWlBLNXFqUE1leFlGN1k4S2RNaWhJcFVwcDRDb0grRUMxclUv?=
 =?utf-8?B?amVOdll0NEVwT1pycGJUaC9RNExnMEF1eVBJYmhCME9ZTEJzcGhDQ3IwK3FZ?=
 =?utf-8?B?MFl4VWxqNUx6TjJPNDZ3NEUrMUNVaUhtOHlSODlNRTdvT29QSm51OXorc3FR?=
 =?utf-8?B?SjVlWlNYclYyNUc4cnFxV1NDeHFBdXBacEFBSkcvL3hoSDc4bmZ6cXRZeGxG?=
 =?utf-8?B?REpSLzRiNkNaeDhhMER5bmRsdzQwaGtraDFLYTk2MkFhZmhjZ2NtQU9Hd21t?=
 =?utf-8?B?Rm1FRnArNjhBOEZyeW5zY045OFNwSnR3ZTRSWERyWVlSM1ZSdFpxWUVpN3Uw?=
 =?utf-8?B?ZDl0OGt3QUMwSC80YTVUbnBvQXU4VWRrSlQ4VG9XQzE4VFcrRWMzZ3UvR0dS?=
 =?utf-8?B?Z0I4R1AvNm0xNmVPanJ2MjkzMStRb0JtN2pFb1cvaHNZUjNZUG9VK2JXMmNM?=
 =?utf-8?B?TW8veFc4N2wxODczNzAyK1BmaEVsc2M1QkhmODNTZ084T2NDTDFXcHdaVmJT?=
 =?utf-8?B?SmZ0QTB0S3Q2VEljY3ExN1ZjbXpaaW56OGFlUkJDWjRCU2pGaUg4MW91VjdY?=
 =?utf-8?B?ejd3aUNTMDlUS3FTUHRDTk1VSWJ0aDk0cHU1YTdYNTk3S0RMM2VyMjBTWEEw?=
 =?utf-8?B?Rk9NZHppNE9CaDVqN0tJQ0pxdTRKc3B3dHdteldkOVFEWjdPTWx0TTRyYTNB?=
 =?utf-8?B?Y21JMDF2ekxrblgwZ3VlQXQ2ZVRTVXpFdTZJOGdNeGNGd0JjWEFuSXJKNENm?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 895d634d-f7d5-4f2a-ebe8-08dbf532384c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:33:44.5932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4zOik16NSxqtOtSJ02ZxDHVc+SIDuCVZdMz3oU4Z6NtweP9R/wFfeLepN0iOIsWu3Tv11LWB4sTOHQZHeYSJ/Oeg49FsvYowAw25cWFdNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 09/13] drm/xe: Add a helper for DRM device-lifetime
 BO create
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

A helper for managed BO allocations makes it possible to remove specific
"fini" actions and will simplify the following patches adding ability to
execute a release action for specific BO directly.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 36 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h           |  4 ++++
 drivers/gpu/drm/xe/xe_ggtt.c         |  6 +----
 drivers/gpu/drm/xe/xe_guc_ads.c      | 20 +++-------------
 drivers/gpu/drm/xe/xe_guc_ct.c       |  8 +++----
 drivers/gpu/drm/xe/xe_guc_hwconfig.c | 18 +++-----------
 drivers/gpu/drm/xe/xe_guc_log.c      | 19 +++------------
 drivers/gpu/drm/xe/xe_guc_pc.c       |  9 +++----
 drivers/gpu/drm/xe/xe_hw_engine.c    |  8 +++----
 drivers/gpu/drm/xe/xe_uc_fw.c        |  9 ++++---
 10 files changed, 63 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7f012f4c2b2de..8d739771b7d7b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -9,6 +9,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_ttm_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
@@ -1530,6 +1531,41 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 	return bo;
 }
 
+static void __xe_bo_unpin_map_no_vm(struct drm_device *drm, void *arg)
+{
+	xe_bo_unpin_map_no_vm(arg);
+}
+
+struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
+					   size_t size, u32 flags)
+{
+	struct xe_bo *bo;
+	int ret;
+
+	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel, flags);
+	if (IS_ERR(bo))
+		return bo;
+
+	ret = drmm_add_action_or_reset(&xe->drm, __xe_bo_unpin_map_no_vm, bo);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return bo;
+}
+
+struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
+					     const void *data, size_t size, u32 flags)
+{
+	struct xe_bo *bo = xe_managed_bo_create_pin_map(xe, tile, size, flags);
+
+	if (IS_ERR(bo))
+		return bo;
+
+	xe_map_memcpy_to(xe, &bo->vmap, 0, data, size);
+
+	return bo;
+}
+
 /*
  * XXX: This is in the VM bind data path, likely should calculate this once and
  * store, with a recalculation if the BO is moved.
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 77e723dd9102c..098ccab7fa1e8 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -115,6 +115,10 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile
 struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 				     const void *data, size_t size,
 				     enum ttm_bo_type type, u32 flags);
+struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
+					   size_t size, u32 flags);
+struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
+					     const void *data, size_t size, u32 flags);
 
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 			      u32 bo_flags);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index f8bdbd6010f7f..374ae4289fa09 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -108,7 +108,6 @@ static void ggtt_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
 
-	xe_bo_unpin_map_no_vm(ggtt->scratch);
 	ggtt->scratch = NULL;
 }
 
@@ -227,10 +226,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 	else
 		flags |= XE_BO_CREATE_VRAM_IF_DGFX(ggtt->tile);
 
-	ggtt->scratch = xe_bo_create_pin_map(xe, ggtt->tile, NULL, XE_PAGE_SIZE,
-					     ttm_bo_type_kernel,
-					     flags);
-
+	ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile, XE_PAGE_SIZE, flags);
 	if (IS_ERR(ggtt->scratch)) {
 		err = PTR_ERR(ggtt->scratch);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 88789826e7817..2f5ff090aa6bd 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -202,13 +202,6 @@ static size_t guc_ads_size(struct xe_guc_ads *ads)
 		guc_ads_private_data_size(ads);
 }
 
-static void guc_ads_fini(struct drm_device *drm, void *arg)
-{
-	struct xe_guc_ads *ads = arg;
-
-	xe_bo_unpin_map_no_vm(ads->bo);
-}
-
 static bool needs_wa_1607983814(struct xe_device *xe)
 {
 	return GRAPHICS_VERx100(xe) < 1250;
@@ -274,25 +267,18 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	struct xe_gt *gt = ads_to_gt(ads);
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bo *bo;
-	int err;
 
 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
 	ads->regset_size = calculate_regset_size(gt);
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ads_size(ads) +
-				  MAX_GOLDEN_LRC_SIZE,
-				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				  XE_BO_CREATE_GGTT_BIT);
+	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
+					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
 	ads->bo = bo;
 
-	err = drmm_add_action_or_reset(&xe->drm, guc_ads_fini, ads);
-	if (err)
-		return err;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 6295d916e39f6..24a33fa36496a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -114,7 +114,6 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
 	struct xe_guc_ct *ct = arg;
 
 	xa_destroy(&ct->fence_lookup);
-	xe_bo_unpin_map_no_vm(ct->bo);
 }
 
 static void g2h_worker_func(struct work_struct *w);
@@ -148,10 +147,9 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 
 	primelockdep(ct);
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ct_size(),
-				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				  XE_BO_CREATE_GGTT_BIT);
+	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
+					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index 98bb9bb307051..2a13a00917f8c 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -48,13 +48,6 @@ static int guc_hwconfig_copy(struct xe_guc *guc)
 	return 0;
 }
 
-static void guc_hwconfig_fini(struct drm_device *drm, void *arg)
-{
-	struct xe_guc *guc = arg;
-
-	xe_bo_unpin_map_no_vm(guc->hwconfig.bo);
-}
-
 int xe_guc_hwconfig_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
@@ -84,19 +77,14 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
 	if (!size)
 		return -EINVAL;
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, PAGE_ALIGN(size),
-				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				  XE_BO_CREATE_GGTT_BIT);
+	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
+					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 	guc->hwconfig.bo = bo;
 	guc->hwconfig.size = size;
 
-	err = drmm_add_action_or_reset(&xe->drm, guc_hwconfig_fini, guc);
-	if (err)
-		return err;
-
 	return guc_hwconfig_copy(guc);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 27c3827bfd054..bcd2f4d34081d 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -77,24 +77,15 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
 	}
 }
 
-static void guc_log_fini(struct drm_device *drm, void *arg)
-{
-	struct xe_guc_log *log = arg;
-
-	xe_bo_unpin_map_no_vm(log->bo);
-}
-
 int xe_guc_log_init(struct xe_guc_log *log)
 {
 	struct xe_device *xe = log_to_xe(log);
 	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
 	struct xe_bo *bo;
-	int err;
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_log_size(),
-				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				  XE_BO_CREATE_GGTT_BIT);
+	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
+					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
@@ -102,9 +93,5 @@ int xe_guc_log_init(struct xe_guc_log *log)
 	log->bo = bo;
 	log->level = xe_modparam.guc_log_level;
 
-	err = drmm_add_action_or_reset(&xe->drm, guc_log_fini, log);
-	if (err)
-		return err;
-
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 1943893a3fd7d..d2605a684b1c5 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -964,7 +964,6 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
-	xe_bo_unpin_map_no_vm(pc->bo);
 	mutex_destroy(&pc->freq_lock);
 }
 
@@ -986,11 +985,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	mutex_init(&pc->freq_lock);
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, size,
-				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				  XE_BO_CREATE_GGTT_BIT);
-
+	bo = xe_managed_bo_create_pin_map(xe, tile, size,
+					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c52c26c395a7d..108ecbfe593ee 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -239,8 +239,6 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
 		xe_execlist_port_destroy(hwe->exl_port);
 	xe_lrc_finish(&hwe->kernel_lrc);
 
-	xe_bo_unpin_map_no_vm(hwe->hwsp);
-
 	hwe->gt = NULL;
 }
 
@@ -428,9 +426,9 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
 	xe_reg_sr_apply_whitelist(hwe);
 
-	hwe->hwsp = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K, ttm_bo_type_kernel,
-					 XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-					 XE_BO_CREATE_GGTT_BIT);
+	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
+						 XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+						 XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(hwe->hwsp)) {
 		err = PTR_ERR(hwe->hwsp);
 		goto err_name;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e806e7b6ae424..8ad4bcabb8b5e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -292,7 +292,6 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
 	if (!xe_uc_fw_is_available(uc_fw))
 		return;
 
-	xe_bo_unpin_map_no_vm(uc_fw->bo);
 	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
 }
 
@@ -692,10 +691,9 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 			goto fail;
 	}
 
-	obj = xe_bo_create_from_data(xe, tile, fw->data, fw->size,
-				     ttm_bo_type_kernel,
-				     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				     XE_BO_CREATE_GGTT_BIT);
+	obj = xe_managed_bo_create_from_data(xe, tile, fw->data, fw->size,
+					     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					     XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(obj)) {
 		drm_notice(&xe->drm, "%s firmware %s: failed to create / populate bo",
 			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
@@ -726,6 +724,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 		 xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
 
 	release_firmware(fw);		/* OK even if fw is NULL */
+
 	return err;
 }
 
-- 
2.43.0

