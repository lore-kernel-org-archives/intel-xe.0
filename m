Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C2BC48BF8
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 13:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D3610E421;
	Mon, 19 Feb 2024 13:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPej37uf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF19C10E420
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Feb 2024 13:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708347949; x=1739883949; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=zxOtt6JMojw2j2dRez1LFzR3bCQ0ofJysBHk3/kOTP4=;
 b=LPej37ufD4l03rs5GguXf4cIjEByv+r4k/KShpMDmiMWJ0arIcvoUZq2
 yif4/9916+lwn+9TYCAR25CtloF9ptr5KctywvfW4ZLynMkkyLyfpje6n
 Z6KHLDrKTVsaXTw1VJ8OLFGd614jTcha7OQh4HzYvvfhIQMNYTXMRQ+wA
 PSes1DNGHw87pR1UBI7e8/cNdRDwQZ4N5VwvbH9Qyowak4CQUAOdTu/3z
 Xcn0MFIcibP/611x+NB0NpXVysiF7rbe5axlOcgjd5M/NA6YjozWLOGyh
 AwcXOoCpyeHM9D9fDasZbuJuriET5jCSqdkNcvlWPnKvOgz+pdZKdipAI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="19854554"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="19854554"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 05:05:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="9085757"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 05:05:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 05:05:47 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 05:05:46 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 05:05:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCKMg3NYCHn4ZksHDUbpn1ZICFCX0f1VqAYIIqE08Z0bjeYtmi2XEJXbFSBNtt5lp8xqAxPawTvwnAyUncsAeukmyezcvox3SvS9FH6tg/w7se4UepZgNhNwnDe7aEwPiLhzxDibQS4CuAy8zmQmXCBVRKPDsfTViaky+1n389K/9PmhoOfT+atmYhhTpwmMMwiNuKlcMZbP1p0oNk5YF7ACBN9yRgyrp+AoItyxJKgJXFxPY8qpEEJr0+m6GX+2bN6vcCd1tj2v1P1G0aHdnEc+XIFcgoAfE83gFhxHkhhJKMkr8YPF4es6FdojxOAKgaEtxHiJhv5neVB40mmNTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9OXo15SFakWzCi7+TPPCc/EUTdLNzPJdVbNEs1/SvU=;
 b=Vb1OFsZD2mB35e2MqyRu2RcMU/csBdFwH5yBHZVMXgeYFT5oZz76bmUc18fz3wPuXxBMx9EaK/0pHs1KdGxK2KuIH6ZXh4KogOX+s+kfEa4ry9a9MJRCUkIObeZfskaSQfrH1pNePGfATmyFr3ioY8ohHsdc6i3dIsk4PDZfGzt2mcyYjcaCeDjDxmZbR6a3zgEjx31KZcg8qo/rmuQeVtQqIoM1E4T2n4nHRnniIg4Dm1tJM2SuWH/3omzroFTl5MUwuovsWNVhEB3/fVRb68gYahedEKY75Yrt7RKlXuzJFEd7JoeGaTmqKGBBDSReIyhBndD61E8G8rrMiszz8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.27; Mon, 19 Feb 2024 13:05:37 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5067:c1f7:e269:88c7]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5067:c1f7:e269:88c7%3]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 13:05:36 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 1/4] drm/xe/guc: Allocate GuC data structures in system memory
 for initial load
Date: Mon, 19 Feb 2024 14:05:27 +0100
Message-ID: <20240219130530.1406044-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::26) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: dfffc6b7-3beb-49b6-49b9-08dc314b76ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lA45w7iJlbxGzLXc9Sm8Xvp1wabff7ZtphVWgXWvwafSbGh8qBFiLELvmX6vp7yxYfG6q4HkV8fzeMetnflqb1DWGVKChl52sB2pye0fRdbMEWC0ebsQR6LxGWRumlnNubENjbhXvD/Tr8WrgFakS43Qv8fwrYWTCAvyKCmBbOPR7807nU/r/dv/OpXBe2Pj3XNCtYxrMUvkpe9MYNfgN7pspslK3HawvIWEh0Z261pMhr/1uyv75zJBIVA572ZjazlAY4V1c9WYcyVdxtlMjDQSPyOC3TW49ttOu4hWCduDQD/yQPykShAHKg6+DVYrB5BRg+eR+t5+nsv5piPJPIGLAoS67QW/fr/dcQw7/CRO8hvGnN6NwqDFiwFYKVRD+y9CtT7e8RQOank9QTBZ+A0YhzTpWYC9KXve7mYpFxHnQ5yEppNMrVmi72eN8WRjNhNsTJc3ZJLnLebXF+9cbVW8ljQlCE1XQ/xnusFvT5l4gjagn6znc2goL3mD5oIvXuXP34BOk4Y3hW5p+E0NQISqrukeCD0UgpMjxNQigWQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG56QTJRSEZVOFpDbnprT2cvVlZxMnhUVk12VFdKN3BTSXpGM2x4czFicnkz?=
 =?utf-8?B?a0ZhZGl0OG5aUDl1VjMzbnhlc2JESFZWZjJDR0RHQ1Z4NVpTWTkrRTVaYnB3?=
 =?utf-8?B?bWJ3bmdPd1pNam5hMnFHbzY5VE10aWpjSlNWdktyUHljZVNRa0dzSnMyeTY1?=
 =?utf-8?B?YnZIckw4ZEVEWC9meWljWFNmNWNZRXp5MWFnejd4ZWhxNU8rbnVyWkVJOGlE?=
 =?utf-8?B?T1ZFVTkzOXN1S2JnaGt0dVFoRmpoQnVEcEdVZ0E0Y3o3Z3pGcklSRkZYc1JU?=
 =?utf-8?B?YTF5WktUTEJCdHBGazhQejRtV3lxZitmTlZVTGltY3VnamVGcWUrSFZUL3g1?=
 =?utf-8?B?c1gyckt6RHdoV3hMNUh2bjFSVmFDSFloM0NjZHE2OUZOeW9ZZ0s2ekJaY1Bu?=
 =?utf-8?B?eVY3OVphNWdhNEZNN3RXNHNlaGF3RjNqZ1B5VVdaUVNRNHpVR1NDQUJUZ3JJ?=
 =?utf-8?B?M3dRYjY4WkNRTmEzR24vZnFOeVNYOThuOUJPSmJpYVlOZWRDaE40QUYxN0or?=
 =?utf-8?B?WjNRdHB4SjhOYithZGdYV1NROUV2akhBdGRxNWJtc3RIenlXYmdUSkdpaVNQ?=
 =?utf-8?B?REVVTFppZDk5dXVIREpWVlBHalphWDZaK1VzMnFzOWNoaW1sQWRCOElLc3Z6?=
 =?utf-8?B?S0gwaU1hNmREakRMSkpWTk40WHhidk9UbkY3TTNtQVhYQkFLZG1aT1B4WUQ2?=
 =?utf-8?B?YjVVbWF3Mzd6K29RVDUxWFRCc2lUdDRDOHFKdmhpYmpncHBLZ3J4RUE0MnNC?=
 =?utf-8?B?U0lvdVhFYUhseWtkeWwzRUpkVzR6NFR1anpVemZPUlE5MjNyNDlzd2N2dGIw?=
 =?utf-8?B?NW10eWw4dURheHNGa2h0R3VvWnJsSjFYVks4eHlBMXpZaTBCYmRVRzJFYVJq?=
 =?utf-8?B?STJSV3dDamM2WFpFelNuZytlVXZER1R3SHE4bDRuQ29ySXJhY3lZQTBxd3Rl?=
 =?utf-8?B?ZkJ4cWs5THdEL2JkRjZucEpaZnZ4UjM3WThISEVoeUtRU3NTYkw5dDNHTFFZ?=
 =?utf-8?B?SmhVd2NBWHRNeG1SYVJCcmljczBxRU02MVVvVkdwejRGdStzUlY3dFkxVEhK?=
 =?utf-8?B?WGNNcitmL0owSjdXWVN5WmVhYlhzSmVHVGJqbVRuNEhlczZOMThlZitzL3Jj?=
 =?utf-8?B?cHo2eUJEenk0bW9vL0pqS2kxUnFOanJQdjBXdVAwdk9HR25aK3dvOTVVQnpU?=
 =?utf-8?B?RXJtbkMySkFUYUx5OENuUUxjNVFaNXBtM25ZQk9pWHoxLzlZUENYTVRMSlpr?=
 =?utf-8?B?bVB0WUtqR296MG5KSmY0RTV6QnNKUlIzdjRDcjc0Z3FjQTdNR0IrRnhkQXhw?=
 =?utf-8?B?STEyS0FzSjRuZHFaMk9Eb2dWc2dZb0pON1BONG1jbUVqcnNvZC8rcTdVeWNO?=
 =?utf-8?B?UHFiUXozcGJwVU9xcVRqRTU1Q0p1ZHQzWEdvNDBBcW9naDhDR0MrRU4rRjNH?=
 =?utf-8?B?YU9OQUZVN04rTzdZWW1FRmw2MWhveWdpZGtvRlhhamZmSVQzMlJsTVBQVnVw?=
 =?utf-8?B?U0pabUpaRlcxVHNJbGdrSG5UVnJCQXIrQXI1eUcxZ3B0Y2hlbEw4ZU9hbmZk?=
 =?utf-8?B?dG0vZ1VYNmljN2ZUUGdYSkwySHFYK1hwMzdkaHVaZGY2a2R2bkZxb2I1Smpv?=
 =?utf-8?B?T1F2N0pIMEtkci9uZEk5eG0wYWxWK3hTRGJXcUFQTTZrWnUxbVp0bzRVVW9i?=
 =?utf-8?B?ekg2QUE4dnNQT0NQd3FwMWE0eiswOUhlUnpnNHN6U2FwYm83RElKS01sUnZs?=
 =?utf-8?B?VFlYbnhvWll5L0UvOUEyZzc4QVc5aHpBaXFLSXcrelJMVmVGV3phRjk1TTgw?=
 =?utf-8?B?VDFTSFQ0NEkvSUVBVk9KeG9sNHBpUTMrZVl5ZjFBb3QwaW84OStJcFByWi8y?=
 =?utf-8?B?TTRxOFIyejZOdVh5dzFOaUxSaTBGNFIrWXk4STVzWmRkM2hQeFh3MFEwanhP?=
 =?utf-8?B?cVJFbmozTy95UGg0WWRTTEdiMjE0UysrZ2RtekVzMzhIdUVCZTYrQ3N6aHFn?=
 =?utf-8?B?Mzd4cldwVmxMTFRnQXl0eWxNSlhNUWlVOERXUjJSOENKMm80U01oQUdkYnVx?=
 =?utf-8?B?eVFkaXI2Ylp4Z0RBVkpLN1hxczJRSlpKK3JMYUJ0MUtxaGthZkRsTWR3SGIz?=
 =?utf-8?B?QmNCSFV3aWlQb1h2TmRtQUZFVVhlZnBzR0Z5Smt5UnZSYTZ6SVlTVHZHOE5G?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfffc6b7-3beb-49b6-49b9-08dc314b76ea
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 13:05:36.8586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qezwAI1+g78S8MSNGrkHAF1FTVvlgH8p2xRgzVMw/nIaVvoOhonVhAqxE3Ub00Jh7/ii42pO+9Pape6Xxmf7IKsKHAvKemm+a1H83StxYcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7651
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

GuC load will need to happen at an earlier point in probe, where local
memory is not yet available. Use system memory for GuC data structures
used for initial "hwconfig" load, and realloc at a later,
"post-hwconfig" load if needed, when local memory is available.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 32 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h           |  1 +
 drivers/gpu/drm/xe/xe_guc.c          | 34 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ads.c      |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       |  2 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c      |  2 +-
 7 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d6a193060cc0b..7df87fbad0938 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1605,6 +1605,38 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
 	return bo;
 }
 
+/**
+ * xe_managed_bo_reinit_in_vram
+ * @xe: xe device
+ * @tile: Tile where the new buffer will be created
+ * @src: Managed buffer object allocated in system memory
+ *
+ * Replace a managed src buffer object allocated in system memory with a new
+ * one allocated in vram, copying the data between them.
+ * Buffer object in VRAM is not going to have the same GGTT address, the caller
+ * is responsible for making sure that any old references to it are updated.
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src)
+{
+	struct xe_bo *bo;
+
+	xe_assert(xe, IS_DGFX(xe));
+	xe_assert(xe, !(*src)->vmap.is_iomem);
+
+	bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr, (*src)->size,
+					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					    XE_BO_CREATE_GGTT_BIT);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	drmm_release_action(&xe->drm, __xe_bo_unpin_map_no_vm, *src);
+	*src = bo;
+
+	return 0;
+}
+
 /*
  * XXX: This is in the VM bind data path, likely should calculate this once and
  * store, with a recalculation if the BO is moved.
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index db4b2db6b0730..ff919a836d163 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -129,6 +129,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
 					   size_t size, u32 flags);
 struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 					     const void *data, size_t size, u32 flags);
+int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
 
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 			      u32 bo_flags);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 868208a398295..8c10546e387df 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -272,6 +272,34 @@ void xe_guc_comm_init_early(struct xe_guc *guc)
 		guc->notify_reg = GUC_HOST_INTERRUPT;
 }
 
+static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
+{
+	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
+	struct xe_device *xe = guc_to_xe(guc);
+	int ret;
+
+	if (!IS_DGFX(guc_to_xe(guc)))
+		return 0;
+
+	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->fw.bo);
+	if (ret)
+		return ret;
+
+	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->log.bo);
+	if (ret)
+		return ret;
+
+	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.bo);
+	if (ret)
+		return ret;
+
+	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 int xe_guc_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
@@ -331,6 +359,12 @@ int xe_guc_init(struct xe_guc *guc)
  */
 int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 {
+	int ret;
+
+	ret = xe_guc_realloc_post_hwconfig(guc);
+	if (ret)
+		return ret;
+
 	guc_init_params_post_hwconfig(guc);
 
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 390e6f1bf4e1c..6ad4c1a90a787 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -273,7 +273,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	ads->regset_size = calculate_regset_size(gt);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
-					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_SYSTEM_BIT |
 					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index f3d356383cedf..355edd4d758af 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -155,7 +155,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	primelockdep(ct);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
-					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_SYSTEM_BIT |
 					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index 2a13a00917f8c..ea49f3885c108 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -78,7 +78,7 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
 		return -EINVAL;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
-					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_SYSTEM_BIT |
 					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index bcd2f4d34081d..45135c3520e54 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -84,7 +84,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
 	struct xe_bo *bo;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
-					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_SYSTEM_BIT |
 					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
-- 
2.43.2

