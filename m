Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAA3C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5381A10E444;
	Tue, 14 Nov 2023 11:45:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24AC10E443
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962322; x=1731498322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=b9RQIdDoig6wENIvHT6fhA7rRG0afqpbKsUhn9nh/iY=;
 b=j0NIt+JMGESJsu79yNzYOOlCjAevkHWDHLQKrGg3j+zzdyASophBn/aE
 5CieK9kEwFpgKBez8vPMYiHbLkyzQA4WqIMDcs0jVAWviF1feei4TWAIW
 /q6NSaetmLR7M0xYjSyvx3tH6BhdAO+WfIYIwNFnzdsJDNuwpL7Mvgt71
 5g+GWJt/E3DhqethpTAuLBd9oENhYzC1nyDNPEIa5AGVzX16FcMgEMHc3
 UT+7b5N4oKak+df3RtlFmppmYoTVFonq1qtu0fcj4+c4arH4paDNQML61
 Vkkjdi913vcgDV2djPqh5oV3ji37sYc5EGmdrQqki/LgJ+U1E0BuAVSfi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="369982131"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="369982131"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:45:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="835008991"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="835008991"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:45:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:21 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:45:21 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvyoanJ8uidv2NUHSuRWH+0me9+BbNaJw2p4Fp9oiXiy1DLGZ+Tgoh0723JzOKkI8Om1640+pExyz3zCvNSxH4wi0r/wq3Wkw/T3F2sszhZrKUlxJvIg8I2H3O+LrXB9Y3IKmWLIX00mjLrJXbLBSsUQm+jIOrMrBwleN1RCqw4LapHuDO0KpgJeDtlO1wAU9ULKQO2066Bp01DF6zOnWaHsziW2xMneVbyiEq3vA3fgBV3zYRkJZa4Sz5Y+Y2wDcQgqv0zBQJLP5nbfVOlcfep5ET79ltoJzZ52wlBfMUt9MD6yEmcHJQZ4WE9L9xHWNyMe3NHmt2pdVUTHO3bWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjkBmu6dbQ/T/ZEauFQjOHUb6oasuZtE9jb+h/Z7UUs=;
 b=IfTYzLTm3xqqhtzl1XDqFQkunTHTf9EnFZ1IKw9C8aPOxNJjYLdnbuWt6HySf1MV/9RbfKgY4Lj5X7lS5UT7qMXhYfW/N8gvUA6bjuaiHvb1O/l3y6+awNIZd5c5SoyFDh4uW0ZKalSxSop+FB/9GiyFJmIO56JAprREyBVBu8FeR5RZ/rWDgFTAIUrcay3NnIUC643/xtlyi9wrA0c6ixAeFh1m+vfr3SNa87XwLaxO3N9SEDFLJjI/+2JwguKbuHQ8uOpfu4J1vEa9HKYvyc+dqUBoSuFppDGVo9M0Qq/MEWS6xDm5KShJD7XOBeetPf9IUG2bs7bYRcLE3RHnXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:45:18 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:45:18 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:43:54 +0100
Message-ID: <20231114114405.2207747-10-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 37007a46-456a-47cd-e31e-08dbe5072cb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0me2k+sahVpGLs4KipFAAKuxK1VJGjl2R4oycm5CH6dSQT52nNUZ2YAw+BBuKIIqOx3QUx6vGPacoAm04YQfEZAyp392mjy5wxO+VZS4Wezm+GcHekVDRWrnHF8PJ3l+wMRgVxCekvSmvPXxQoqr3Dy+ekyrW4ZKTSkb0efaVFSd+ZOjlJI8fDTDZruI8n/v/g07+Wfkqg2Ga3eEWPOj6IHUHEClkAjuy898j5iUQnScNb7XC8Dgz2zbLDCUCItptY/8f0arhtwQdzf57qMPZqaUxegpMwuLoo1u75Gf1xft0Rx/MTXWBS0StBIf6BKCZI2gdjlDdxON9VD+SMT7WZ35mrjYRu6McuFbBVI4nxl0AgpFT3hLQd/hguIsg+x/Krn2nknbarC/1GH/6pIJ8Wy9IR65R1svwy4xXIL9Oe6PRUmO599xf2rPwkIP5lCTyFBLPJq8x7WwV7dINsHdlirUvoSfVMIXsll1p/2I/bK9fNWZQc7T9qQDzv6Z9tBxLoLL2JArHV1CuXi2cmmn0qIZR+OGVZGhfXq0TPRWHS1MfpGCwyGjE3Dcx3/gQVlc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6666004)(83380400001)(6506007)(38100700002)(2616005)(6512007)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(2906002)(316002)(26005)(6486002)(1076003)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjdkQ2toVUEyeFB1M1NzSE1QcHRqQVIwT2NrUi9IcnE5Uk14Wnk0NWhJVTc5?=
 =?utf-8?B?T0pLYlJDNUFLczhiNmErWjl3RGlTUDh4YUNVdXdsK2QxbFBZdUovclZNNVd0?=
 =?utf-8?B?cm41S3BGcGwwR0dWZWViUk9lSjdxNVV2NjlWeGRTZURLejhKeHhaUmNveG9S?=
 =?utf-8?B?eU1DKzRUSEpuRGNhSVNnZ0hhNVBQS0NFbDk0OWdBdHpGRkJNSHh4R3c5NjdK?=
 =?utf-8?B?YTBtWE9XV2NpdlpNVE5TOWlEMXhqbCttYnNTZXQxOUZjanRFUU1NdVc1Tzhk?=
 =?utf-8?B?cng0bm5zaDJINmJwNUFYeWRuT29zbmRuRGtDMzBxZEttaWVYeHZYTnN2cXM3?=
 =?utf-8?B?UTNQb3AyT2hYV09URWJ5ZmppNit2SERsN1JVdjFyWDllczIyVUM4QWdIb2VB?=
 =?utf-8?B?R3BSQnVYVjEzT1lRbVNMeEplVmU4ck03TWJnZkgyckhYZldyZXpIcytXTXQr?=
 =?utf-8?B?NHlKVzlQNlpSWklxaEEra3kyeG9MTldJMytDOWZrUzFERWZ6M204MG1US05S?=
 =?utf-8?B?V29IeDIrcGZ4V0xCL3djTklKZDNsUEUvVUxobVJJL1Q5eFFGcE5mQitZNThx?=
 =?utf-8?B?Y0JXZ3RRNGc1cFdOZGhoR1l2WHNnZEh3SElwMHd6dkdrWWRtSStEQmQ1amx1?=
 =?utf-8?B?RlM5VjlPc3AzaW1rTVNXYTViY0hKb2lMUGJEYnNkL0dGbDhLQ015ZlRKMGhW?=
 =?utf-8?B?dm5zdGdFMldWRTFmK3JkOFFDRjltNnQvUFBCTTJKZFpUaXg5Y1lqbnlhVkhl?=
 =?utf-8?B?T0U0MjVwV1RaVlA5UjRBK1lYYndzRFBac3ZIUlVqSUQ4MEhpQXFZdkdBUnEr?=
 =?utf-8?B?WWd5WDdFQlpIZURiRkd5S25nM1RoYTkrQUlHN3FGdXNEb1R1VDA0VU5aRGlz?=
 =?utf-8?B?SVcxRktpaFBkdWlYUHJsc2thTWNacjNTbUVpc1JXWFVwbWpBbHNqMTNDWDdh?=
 =?utf-8?B?bVg2WnJlMk9WKzE4ZmNDY3MyeDhDUDEvdEMrakxoRG9GdnFteVcybDR2UVZN?=
 =?utf-8?B?TmlDSU51M00rZURLbng4TlorRVZrR1hBaHZkUHBXL3loOFB4YlFPM1ByaHNL?=
 =?utf-8?B?OWxwVGVtRnJqZ21QRVdtR21sb0g0aWtyUHllRzNDaHZCaURDTXF4WGZoMG5x?=
 =?utf-8?B?RENzQTJ1M0tHUDZ5UDBoREtGQ0FRT09pL3JkZ0Z5Z3RiTUpMYTZrdXZwWkly?=
 =?utf-8?B?bWo1TEVaVVRYYnZ1dGY0bTVjRWRDVXczaXp3R1h0VG53d0NiKzBjTFRnVUVj?=
 =?utf-8?B?ZWdPc09ROGJwOVJMOXE4VGVnRGxuTnFEWHNyTHZBZ2MzZENvZUtwZGQzd1N5?=
 =?utf-8?B?czVGamZEMWhIbmtUaDZ2eVhaOHg0MGxwR2VrQWNESUlVdTMrQlp2NFdydllW?=
 =?utf-8?B?S0NhMk0vK3h3dHZHVWdlM3Q0ZzFoRzVmVk9zdkY5bEN5UTVkUG9ONFh2QUdM?=
 =?utf-8?B?VnBOZmU5Tm5jc3BrNjBEMVNXRjFzKzQxYk8yZklOL08yb05FbFRPcm4xT0NQ?=
 =?utf-8?B?Uk5qajJCQjd2d2dTVXdEdmhMQkNiTXJMWXZHMFBodUtrZnlQWUpTZlhuamZU?=
 =?utf-8?B?QU9oTUVzY0ljWnlMR1dCTm9aUTAvQW0wT3J6bFNVM0c0QzIxQUQ3bEt3clRm?=
 =?utf-8?B?K3hFdGRLTFJHUlBBSXU3aXR0alVlamVqaDV6SDJUNFIzVnF2WmVJMkJ3NExQ?=
 =?utf-8?B?UnY1ODJyZGxnRWdQdnJ3dUZoQU1tcWszL0NWNGlZc20vVjQ3N2lRVGxPc28r?=
 =?utf-8?B?akN4WlJ0WG9SVExReW5EaUZ3TGlIWFpsQlBtVElmS2l0VnpXWTI3Zk52OHdw?=
 =?utf-8?B?MDRUUUNTR1lSR3VnckU1SXpZc3dNL2lCa0tEWDNiQ0RYSUl5N2x6Q0tkanM0?=
 =?utf-8?B?RnVzUk5QWE16MVlwL1Iya1RHdEZmcG81RCtXdStiemtHS21hUUFZUEp6NjZ4?=
 =?utf-8?B?OFpTbHZaMUViMzB6NktvNXFoeHpMWk9LTHdya0w0a0NjQ25vbEtRNnNwRmU2?=
 =?utf-8?B?UVZvb0tsYUZabjAvejJldWlDeHlnSXJTbFBRNXZsTTZVbHdMdzhSSjMvYTcv?=
 =?utf-8?B?aUxEU1FIZ0JWekNtSEhCRFdsVTVvQTNrbEprK2k5aVplMTlHdEhWYkpraUNv?=
 =?utf-8?B?OTVKbi9rczJmZXV2SnFBNXg5Y1dXUm5iRjhHaVhEaDNBRFhOWGw1bzZkOVdW?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37007a46-456a-47cd-e31e-08dbe5072cb2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:45:18.2233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqZgDDE6/n4/6WYLPS5mi4QSQyMOjjSdNkdNCnzyfz4nzKVWwxLUoiCMIAKq0dfBzJeOv9WCPQD8L84ye5WMyKBNa7okz2V2UVYMA7nc4Rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 09/20] drm/xe/device: Introduce
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
index 89072a0a6bbed..5b330d12d87a6 100644
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

