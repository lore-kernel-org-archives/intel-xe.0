Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F554C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 21:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7363410E683;
	Wed, 29 Nov 2023 21:47:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF9810E688
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 21:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701294432; x=1732830432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ck+v3NUp+se1/NjetTGByhDZZhXfzZOFT0mzV5wAwOo=;
 b=WGEKZ/tlZPcd2VmQUnxc+dGNXQ2vXpyYEWpYNGCxIxTHzXZYvMQOc5tG
 CqYj6oHStbRs0rVzL5gK/jm0K2k+1OvCFsC2UBAEZX0V9/Bo7Z0JDaMtF
 TztRhiHoMKZPaP43Nep5U/WJrG/sCSGBvU8Ep9Wf8ZQMxdXzicL4bzO3s
 XzwT2rkCIylyYRfWcFrJgMbKaZMrMPqJ24D+LRb/7sywO2LlhCsB3nXXR
 9bR3D74T/vIrS2s7ETwPwYcHD57h/wZtoBAn9xRxfaXswU1xQMC7m56V0
 RQ6LRl4OWGM7OoqiKAbw6qvkdfkntnxHjkmQPCGcNdpdTQViGS9ZPmGRj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="392975279"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="392975279"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 13:47:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1100680159"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="1100680159"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 13:47:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:10 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 13:47:10 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSWz/4fuucrgIK3uy3N5bK80FwJYgmo4LgswKefbUUoClBYDd8iXC/ddJp9Ad/W0AyeaIqLUPGkd8FeU70R+BAyHI1EWyb7NZ5fQ4k+BU12IoEUWOcnZqNmFk9LN5WmXQJnPKtzFpzDsAp8tIkZA3T09tByUQH5LN+ENJtsLZZVjzY5c4Mg8hZjp46E8dCObewb1qlMjUEQzc/wog+vAtRMYz4jC3EQKOeJ37R08WPhj9QsXSXN+MFyZaMTCAL7UhgftHv9+zf7Y2/UeAaND6maowcAdezYBVafL/BqOYIxq7K8ihADFm1c2qUhIyAWjMIAdoWLn9PCIaI51iu3S7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvcuPevez3D7mKlcvBfGSPCKnNwGqpKq4/Njm3ycl0Y=;
 b=L7+jammj7wieTTRIOWE46QASlkxgZg8HxnnyFecygGy1odZK/o6LsPN9DvK+Twqie7iSULs6md5XEBqVslJ7aiNAVty272UsTl/C5sv6NreqQmn1R9MRYwbU1ksCQAs0nGFLWzlxXK8OzNyx6eUgk6IFija8QgCeiZd8bY62mqAzfNP2frtzEGwRFbeKpgzWjAHFHFdm2tZ2TzscPdQRoAEbZAUwQgZeSxjL6ac7T2NCsQ42US5QaUeLBKNoWASd9uOabzQDb5cr1mUxo9IOwaNX2Wcmv6D76A4jhLcE5hL3gempBThCHyjsV/J+8qKQG+jCir80ra6CRUu/9gNE9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4930.namprd11.prod.outlook.com (2603:10b6:303:9b::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.28; Wed, 29 Nov 2023 21:47:03 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:47:03 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 22:45:03 +0100
Message-ID: <20231129214509.1174116-8-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129214509.1174116-1-michal.winiarski@intel.com>
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4930:EE_
X-MS-Office365-Filtering-Correlation-Id: ac27dcc8-8faf-4ea8-d11f-08dbf124b988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cd85TuV/VO93eHZdr64spmLL0wQYiV/o4aOXi/50JZtcr3kTBC1rtX0CsyDhG55gARGrsk7z1X9BuIXGXO+HT1UA8GwcPZ1is+D4xzvgstSVEKY11eD5JM0wdcFHZ9c3UjVQCzftJERRWv/ZpbY0kExEsYK6UbTTznBuPEmQhKFCruET+JaIFSPbxL9P2mlQc9E5XhVE8hZ7Exw5fXdXVKQB/Gjm2SdsmZ8wQBAkJGshzwaaWZ4MxWqJcJXUnjo3l2Xdjmg3VrK+fuP+8VpyyjqUQv47Odk5kJNSJQeW1tHh5E79TMEB+drJJHvoJSNTH7cEerIj9mewPrcU+0DeukJEOXemAz7BykS+7mUTQTIp0tnhoq+9mZs9y+codcVa79P+sWjPAaG7BNdjolI4SRMVgC6wPxB1LbJOz3Kx2xzCetA2Sf9/qH0WTUN79z6PIaR6sCyehJWWpDQf4PfV0hNZNZY9KjICVM8DdhC1lX4+lmVxcANn3QS+xPpEr0N8/Xw+IJXUyn0MinjaFN39dpjiNHMsDaYv/VyJCC1zvxqCrBWCAxJ8DpYXcio+XevmZuteSrbPtzl+++tV4L3BihfnhJ/abS0Dqx2Fs2cI35zK0P7pMwQRMBhBcFoFLJt2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(136003)(366004)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(8676002)(8936002)(4326008)(6512007)(66476007)(66946007)(66556008)(54906003)(316002)(6916009)(478600001)(6486002)(2906002)(26005)(41300700001)(36756003)(38100700002)(107886003)(86362001)(6506007)(202311291699003)(1076003)(2616005)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0RXWm53KzF2T2kwRVBLQ2N3WDNwM3U2QXZoS2llL1VKdVNlTzBLR010cGZ1?=
 =?utf-8?B?TThyVXVLUEU5TWl6cGNKdjl6K1pJQnFKREFyYjdQWVVGeW1KYXRKbHBVVlQr?=
 =?utf-8?B?TXYxR3VITmhKR3c2K0tPdFhkRVFKYmZHVUxMbW43ZnRuZTNyQlhDY3VlaEJN?=
 =?utf-8?B?QURrNWxSdWtnZTVNU0U1d2JJTnJLUzU2L3Y5V05QcjgvcUkzbVpWN0Y3OTlT?=
 =?utf-8?B?TmNpUkFiYU41TGgrVXZlNGYyZXo0VUxjSlNZT0pyeWtOUG50ck4zc1k2RUI4?=
 =?utf-8?B?Uzg2UmJ3NS9rQTArK2NtU2hQU1JjeUNFTVRNMG92Zk12RGZzSi9POWxCeldj?=
 =?utf-8?B?QkxPMDViL3U4VWZRK2ZBTU1WUnZWTW1Rc1kraWM4MEtpRWI3QmhBYk9UOWh1?=
 =?utf-8?B?TExha2Rnbyszdzl5MjlTTW9DR2ZUOWY0MFR0Z2JVSk5VSVYySG5HbnJ3VkJj?=
 =?utf-8?B?b1JIRWdBTVVHVUd4cnVreGY0NFBwc3lWZ2RTMmRKRVdtUzcxbk1uRU55YU1Z?=
 =?utf-8?B?Y3oxb01JL2wyRE1lelVld3JubkRCZnRMQTVEZDFneEREZ1JCc2tYNGFmL3FX?=
 =?utf-8?B?T3UyaTdqQncralRLVFYwblM2M3U0VTdWakgweVlYWStnamtPK3VhRVNFNkI2?=
 =?utf-8?B?TGtjK0kzZ0N1VE9aMXB2TlN2SVJOekJlcDdjVXQ2OEhYMTJCeUFmV3o1TGJt?=
 =?utf-8?B?M2lDcnpydGhmMHpSTklaYUN6N1NXWXVnekZFeUVSZUVISlFtZUwyaG4yN0do?=
 =?utf-8?B?QnJDUFRRY0dZUWxqSllINXB4YWFvd2VKYnRTNUFTT1lrejVaZXNhcmNBKzRN?=
 =?utf-8?B?dTFFN0szVDBFRkZyREJtVDFDYVZSY0tQWUc5OW56d1EvSXE2OXU4UG1mSGVG?=
 =?utf-8?B?NWNGWWl1Z0dxWXQyeDhYcVRNRlNpZVNreERIc0hmZFpad2J3SEdXOU1VeURR?=
 =?utf-8?B?M2dNTC9oOEdiMXdOOWpzZlZCb0pvUlV2NHFwUU5WYm1tc25rMVFlNmdDdEMy?=
 =?utf-8?B?bVRBZTZFZWExNm0vM0ROTnhuUnJvd3Y4WTViV2dhREYzTEQvN05VK1RaUk8v?=
 =?utf-8?B?YXFtZ242Z25mTklHaFV3bVdtZW9vLzVTWUVkTjBqV3EwU00yOUxvZEs5eXNS?=
 =?utf-8?B?dWtPd2czQ0diQnpTazlLcmJoUjJyYXdndUZna0dnRzAzS0d0by9wVjVJK1BM?=
 =?utf-8?B?bU5LSWZnQWZZYmVCN0g1eU11MVo0c3BZNG5wSXFxWFBCK3hTdytvcEx2RmdJ?=
 =?utf-8?B?dTF6RjM4SWZxbmlTSFFsVmV3SEo2VlJOZ0dxNndXV3hSU3M2Y0NrYWlQNnNV?=
 =?utf-8?B?Mm1VYW5teGhxMWtMMER4L0hRYno3dmt1d2xXMlN0T2hGbWhTb2MyNk9KaG55?=
 =?utf-8?B?Y0pNQUVxbDk1Y25RN2ZhOGQ4RHBFTGpMK1k1RTJsUGRNeWF0cENYSFl2Wnh4?=
 =?utf-8?B?cjZKRnB6cm5tckJxSkUwOVpjNVRwaEtqSjJRNXZLUGFiMjVMY3E2Y21HSHZ5?=
 =?utf-8?B?eGZLd1FiR2Jrd1JiYTdJUmc3aFlRMVlSaU95RFNHdkFwaDBpY2RmcFdWb1Jj?=
 =?utf-8?B?dDc2OFhqSmVoNjJPNWVYa202MEIyVll4RzNCQzZUeHVtN1VEaDBsQ2taZDYx?=
 =?utf-8?B?TmVLRk1RcFJRYlpFcEVmeUJld3g2VmpJaXdYOG1yR3FaR1NLRldXZEJ3SlYy?=
 =?utf-8?B?MDVBbFRMK0laQUZUSVV0RnJiSDFpT3Z6eUZpcmEraG04eHVFSmtPbUErTjBl?=
 =?utf-8?B?Z2RnS3h6WGE4V1pwZ1FJMEE1d254SDEwcDdhbC9FTzlaN1hDeGVaRkJWNGx5?=
 =?utf-8?B?R05xcEZmQU5vekdRYmFIZUNHYjRxTFlXa2xxTmE1OHlucHpmYUNSNUtKdVRO?=
 =?utf-8?B?VHZOaXB2dXZJci9xK09HaHgxaFpsdm4yUkRNZjlYU1k0djFBOEIxSTdXMHM5?=
 =?utf-8?B?VEpBKzJCc3hyNytsM0MxczRuSnE5UW5halpPalVsM3NBcjVQajE1NENUY0R0?=
 =?utf-8?B?ajFVZWkveXBMcm1YQURHQWJrc05oVGVOcEs2R2V0NnRCQXFnTnpXa3FJMm5w?=
 =?utf-8?B?aUZjU0RoUnlQczBuU0pVZk5kQnZUQUZDZ3d2QnFWSmx0VVhyTlhFTlVNd0d4?=
 =?utf-8?B?aEpGOGpmbDV2N3lJbHNjM3IwZWduMHVBRmh6V1FQdXI5MXQ5aFMwWG9iOWpL?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac27dcc8-8faf-4ea8-d11f-08dbf124b988
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:47:03.7809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2zFfa0wSC7c2Tz60BwpCrlU0J8A4YrpziVhpU11GmaeMmfYoXxrTqyCyGlcIx6zu3I9A+gJ0HhRoknRft4X8AhT3X00GGVcsbFATxYrJaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4930
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 08/14] drm/xe: Introduce xe_tile_init_early and use
 at earlier point in probe
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

It also merges the GT (which is part of tile) initialization happening
at xe_info_init with allocating other per-tile data structures into a
common helper function.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  6 ------
 drivers/gpu/drm/xe/xe_pci.c    | 10 +++++-----
 drivers/gpu/drm/xe/xe_tile.c   | 32 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_tile.h   |  2 +-
 4 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 785bf2e610b7c..5e1f73c8c77ad 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -393,12 +393,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	for_each_tile(tile, xe, id) {
-		err = xe_tile_alloc(tile);
-		if (err)
-			return err;
-	}
-
 	err = xe_mmio_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e5f1fefcee120..d9a3b20179cc2 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -26,6 +26,7 @@
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_step.h"
+#include "xe_tile.h"
 
 enum toggle_d3cold {
 	D3COLD_DISABLE,
@@ -626,12 +627,11 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
 
 	for_each_tile(tile, xe, id) {
-		tile->xe = xe;
-		tile->id = id;
+		int err;
 
-		tile->primary_gt = xe_gt_alloc(tile);
-		if (IS_ERR(tile->primary_gt))
-			return PTR_ERR(tile->primary_gt);
+		err = xe_tile_init_early(tile, xe, id);
+		if (err)
+			return err;
 
 		gt = tile->primary_gt;
 		gt->info.id = xe->info.gt_count++;
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 131752a57f652..daf1ac39dcbb1 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -7,6 +7,7 @@
 
 #include "xe_device.h"
 #include "xe_ggtt.h"
+#include "xe_gt.h"
 #include "xe_migrate.h"
 #include "xe_sa.h"
 #include "xe_tile.h"
@@ -80,7 +81,7 @@
  *
  * Returns -ENOMEM if allocations fail, otherwise 0.
  */
-int xe_tile_alloc(struct xe_tile *tile)
+static int xe_tile_alloc(struct xe_tile *tile)
 {
 	struct drm_device *drm = &tile_to_xe(tile)->drm;
 
@@ -97,6 +98,35 @@ int xe_tile_alloc(struct xe_tile *tile)
 	return 0;
 }
 
+/**
+ * xe_tile_init_early - Initialize the tile and primary GT
+ * @tile: Tile to initialize
+ * @xe: Parent Xe device
+ * @id: Tile ID
+ *
+ * Initializes per-tile resources that don't require any interactions with the hardware or any
+ * knowledge about the Graphics/Media IP version.
+ *
+ * Returns: 0 on success, negative error code on error.
+ */
+int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
+{
+	int err;
+
+	tile->xe = xe;
+	tile->id = id;
+
+	err = xe_tile_alloc(tile);
+	if (err)
+		return err;
+
+	tile->primary_gt = xe_gt_alloc(tile);
+	if (IS_ERR(tile->primary_gt))
+		return PTR_ERR(tile->primary_gt);
+
+	return 0;
+}
+
 static int tile_ttm_mgr_init(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 782c47f8bd450..1c9e42ade6b05 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -10,7 +10,7 @@
 
 struct xe_tile;
 
-int xe_tile_alloc(struct xe_tile *tile);
+int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 
 void xe_tile_migrate_wait(struct xe_tile *tile);
-- 
2.43.0

