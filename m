Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FF0C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FC110E6A0;
	Wed, 29 Nov 2023 22:36:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E42310E69E
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297354; x=1732833354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ck+v3NUp+se1/NjetTGByhDZZhXfzZOFT0mzV5wAwOo=;
 b=jRf5Ll4k+PQXzMMe6z2PjjAIsy/VtnAQkTukz8Z3FDe9X4GLcVFDe3eq
 B2gS1LtV4R9v2YUEmwKoNN6vt6gAxiGiqIzlHXuakLj/O5SXxe/7S3Ph5
 IbU6FWQSfxJ9W0sixTGdkpDybvg+tVTnD69iQ3t9p9E5uXc0esyeFNgNN
 dIaSGJG+yZzEVYAYG30lI8OONORIKsZrIYHwkyjRkL8N85x4vZgL7aWqO
 iQpUbwOrnpC13EbICGTkLPDddp0pw9MxhlQ/36OMC57Rv+kbwg7MhVkUG
 tajxRnTqpvoenBN7wvfsEViP9AhZPF/57R1sCNAxiCUYe5z1pAoIyS6gs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="219730"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="219730"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:35:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745418038"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="745418038"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:35:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:35:53 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RN8kEcGghKQ3UL93MASFzYKOrMmODqQumE1kRVmxSJP/MOeTjOX8jcBL5EUmjgaTnwiqFCTB8ndN+Ep1hR3B0dLiC2+GY9Rb3Mq7Vm4/jrolHRiYo5oPito2Rbz/AWqIy97bBJKfgzXkUA118XlqwlUtok9+BwviGLYQRZBPkS9i8LaCWSSbcPGiMasUSWndjWZYaH2habl8tFg2SHqzIhAfN0doLr4ypQSlpqIkyDoqqIjp/OmvFomrKTS5N2GnDA4yi8dJWPBahafGlbrdWoMAvB67LqkQ/77lvIIhHwjozY/yGxXhLOYYYpqBXwd+9seYEgre2DAZnhEdVgpsHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvcuPevez3D7mKlcvBfGSPCKnNwGqpKq4/Njm3ycl0Y=;
 b=DQF6JJ40/FQAO1SxutabQxjV46mbJY7x5aa2Ga+R76vOk/8dU34q0o1yzqmX2gkBf8eDfliSUvz1FxWozoqaylU4iImq0Ta+BWvUQaSuUP1u/ORWWhEdfX3bULBXCCDkHlE0dHY5mSQhIZi4dnbzczCBI7fTVuBjRgNTabHxM3s8yjV5INk3pIv5wVr5zGDBzuny3jYOcoROpUwGW3htQdR4S6L6LLd7Izkf62YWzG7HyUwGrW5GapjvXubxRn1rs4rtYbM41Ine0k5s9NQUX24n7ofMlr1FiP/1g8z4wsIqg88R1X9Z+ooVBnT7lfJ7E8wjFLT0J8Ikq3lU5wj/Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB8318.namprd11.prod.outlook.com (2603:10b6:806:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 22:35:51 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:35:51 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:34:52 +0100
Message-ID: <20231129223508.1189461-8-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 23ecab4d-f656-44ec-701b-08dbf12b8ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aAqcQExDqykHy4opBsNZci0XVrWhsQuEuICV+hoqOn+89ByOEJ0FF+tvTbuUGsrt/tKEmCatxC0NVm9NgSr4AHzpE4wmxl+pOB5qcfvjN0tvIJzWHcM25f0/uMcVP86hFEBc+1JTvLUtxmBmAFjPRe0NNiCeBGKsRQMmN5DHdwZGSGihak2/9sJ/7H4olYNR9Hp4qkdfqhZxOdO5VOovH8OfsoaeL7ic+sz8K2iBooehLU63+OntBnHSqx//eN3cDWVQB533/f7uZ6O8n0yO96u+56efxk7MOh10oWZ1BdZrav+w4loAkxmkoG+gmwFeDLlns16sBrrUryLc3u2QTVBlvmfTEmqw+H7vSDluhXKA5ziSpeQ/R/yZLtbC3C/FWxhdA3b4+Pi0xqjjB46h1/ht714XS6iM8UPzE0JxSYq/Y0SGLhBD9+cSlPh+V/e7ygYGVJpAxFURTAkwtFj3gf8OLusxZti5H/46Q0khsHotcQ50UwsdRyVR/B65Rky5IdLLkrUVJm34wtsCsB4l2oj0XwbdE40eFfuggOJqqPxGAEesAQtHN3HMbgNyrQVVlbkn1NxmYI+JvILawXdd+iYNAjEZ9fUGg42jlktEkzhOKqDMu5PBM51wVLyARff2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(366004)(136003)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(82960400001)(83380400001)(478600001)(2906002)(6486002)(6512007)(36756003)(6506007)(8936002)(4326008)(8676002)(6916009)(41300700001)(38100700002)(316002)(5660300002)(66946007)(66556008)(54906003)(66476007)(86362001)(202311291699003)(26005)(1076003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sk56S2NTOXpXNlAxUTRHZXpvNXZDWXZJNE5lc1VER2J4cVQ1Q0ZmU09HeFJm?=
 =?utf-8?B?K243Uy9uTEtHbXczekRybGlKSVdtdVpYb2ZwK3ZGWlJKMC9rRE81MXJKYWZk?=
 =?utf-8?B?ZER0VGFYZ3VqREJxZHpKSXlrb2tzR2hlSkwvTUEvbE10R3BwdGNrOUpZQm5J?=
 =?utf-8?B?Ujl6Wml4QXpBR0F1L2VCZUxmdExaekFqajVoUURKTDgzWGRONnhkZjdPRTQ5?=
 =?utf-8?B?aHFrdFk0ZWdxYktDeDVtVitseS8yTU5BU2VYS2RlTzdiZmkyZGFrM2ltWGtN?=
 =?utf-8?B?cGIyYnh2ZFBlSFFHQlplOWwvTGtPTVRyckVQOUZzbElGWE5yQWNMZU5UMXN6?=
 =?utf-8?B?a3ZPWng2Y3p4THczdThkMzBtMXRGY3Jrby9yWmhVNy8vaTlESFYxeXM1VU1w?=
 =?utf-8?B?N3NJNFlBakJCQWZQNzc1clFsRGVJYUZEa1c0K2JEUnFvanlQOExYZ0xOWHR6?=
 =?utf-8?B?UncrYWtzVGJwOWVvZlVHeS9iWVJ4MUlVdkVPVzBYcEdPNkxyMFhXMWJXT2tO?=
 =?utf-8?B?b1NzbkJPMUJTY2l5QzBFTnR4dDlnalFINk1maFg1UWR2cHYwbWluTTN4eStt?=
 =?utf-8?B?K0s3T2tJaWZsUXJRQ09kdzQ0SGZVR28rN2lXUTB3YzdlOXhYMlhNeGIyYldS?=
 =?utf-8?B?ZUVidEh4SHdDTkQvMHZGZDMvb0Y0NXovSHNsbVpnWlNqLzJsZ3ZTMVBwTzlq?=
 =?utf-8?B?dVVyOXBNVHVvUXV6bU94eU90TGxBS3RRa29Wd0lKZ3VDMENDZGhGMmtCL0dj?=
 =?utf-8?B?d293Mnk5UGxWNGd0Nm4vYzlJdThFVHh2YzdLOE0yVnlhS01JZGpLcEUwajdH?=
 =?utf-8?B?ZFVHaHNhd2wzM2VKQUhNcUhHZHJaRkVvUE1qM0lieXhOSzRmRk00dCtiZXRR?=
 =?utf-8?B?a1E3SnQrMnRaNnZRL0d6UUt4ZDZWdW1HejZlMVh2MVJjNno3a3E2K0NwR1ZP?=
 =?utf-8?B?Y25wZ2x5dENiMVNUY2N1NlAwUHd5bUxZRXl6VmYydk4zMEtEbjJTY2YzTHBa?=
 =?utf-8?B?YkI3VDh0cDFQaDZ0aHNiSGI0dUNEVnBBL0x1YmdhaDlSc215YkVQTHdPcktp?=
 =?utf-8?B?Nnd0WkJqMHBOSW1UN0QwL29kZEJMZndVQXVjRThwbURFN0RoKzVhZ3VlYmFh?=
 =?utf-8?B?SlovTG44aTRIUnNxNTJIdVRDYk5yNnFNNVhUWUpaZzM0a2tDS1hYai95VTNK?=
 =?utf-8?B?SXgrNHpHUkZKU0JxMGV2bjVUa0tlbEtmcXliWCt4K3JKRUJoVWF1Z0c4RkhR?=
 =?utf-8?B?MkJvck4rTzBiQ0thYmNrTWgwa0JqZi96V2J4b3ozVncwS3lWZE0rd3dpMUtM?=
 =?utf-8?B?NTJWeDNNRTBVNVJ3SzJhajlwT1RFWkFiNzg3YmxHNWJqOFY3cGw4WXBIcUha?=
 =?utf-8?B?T3RBV3FKcllkU1cwSkR6OEN6YnZzekF6U3ZqVi9WOUkwVDRwM2lQc3RwL2dw?=
 =?utf-8?B?QUtEM2doZTFocEd1WGdlMUtFbTFBdUhpWUdaU0lwbWNBbzVpd3cwUW5Lamxl?=
 =?utf-8?B?UUdFMDBKdk5UcHR6MXNPUUswQjVsN1FHL1E5Zk12dTFYV2pGM2ZVbUNqYm5Q?=
 =?utf-8?B?M290cFpVclQvMEQ5UG4vczkzOFI3OUszQzBUc3VDc1JyZHJrTnJZUEZURGRh?=
 =?utf-8?B?VXVFallMOHFyNzVBbVJmMlZlbG9CVG50dHY2MEpOZnV5Si9KeFErSVlRKzB1?=
 =?utf-8?B?SXdSblgwRFlXcC9mOEhmYnFHeFVMejR4YUZTakN1eEpmVWVycUtMS21TbWRj?=
 =?utf-8?B?aTZhbEtNblliai93ckE2OXlJTUs0UTVLUmVaUVo5a05uQ1dmMkRudHo3MG5x?=
 =?utf-8?B?Y01aTFJKV0dadFowSkxYSFVDM0hJb0liVkhRMGQ2cjFqWTRjK0lYVHpaVmFX?=
 =?utf-8?B?RGh5ZjhHWFdpdjNPT1FNNWM1MVRmby9MSnZJcmVjd0JKcWFGaSttQUd0VnN5?=
 =?utf-8?B?cEd6OGcxQ0gzbm90UWlGZG11eW1yNTdBZ3ZDMVhaOVNtUnd1RDM4ek16dmdx?=
 =?utf-8?B?ZkdPa1BUTnpJRHN0MlZmd1JRZFRRajZmYkhiUW1BSFordXJ1UjZYcDljSDd3?=
 =?utf-8?B?U01tblBkWmo5bkJuUnpzVzU4a1pxOHpEdHp6OWg0MXFRdHJFNXVIUHVlS1Z0?=
 =?utf-8?B?SVJXQ0JHYWNZZWRJOXhlTmZieENjUGhEQTVmUDJqdUNVNmZpbk5GWFc1L096?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ecab4d-f656-44ec-701b-08dbf12b8ab5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:35:51.7226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRAq6SeZxiCu3swYxB2MGaA9KaOUSpkKNm72PFlUyp0MR4zVP0mb/QqRmnwn6qWag5fA4Y6pH3mGG1mJrCod4i1PIBwWT6gOnGN9uoar5nE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8318
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 07/23] drm/xe: Introduce xe_tile_init_early
 and use at earlier point in probe
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
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

