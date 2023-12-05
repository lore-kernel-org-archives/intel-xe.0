Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFE2C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 01:33:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B6A10E455;
	Tue,  5 Dec 2023 01:33:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF5B10E455
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 01:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701740009; x=1733276009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5pssPaZpctAqNjIl7FK7IlG1VIIWruHfr4spaolC5h8=;
 b=d8wr7CRAxD9ejqyno+OzJceAYbKDOVxgf4Ocg3NgVHdLQTrretkJnxWC
 qVS9cBoLB+VqkNQr4HXVuCgHfg1meXj8w8upVhdZhce1aVt/h+MMHNTmG
 sF8bh3+q6SjgJIhvTtaWKuKV2jMWZfpC3e5BPyCEtGOZ4Pwy4Yw2qj+FU
 Q67v1yMONbYhfqWmywXET4qYUoTkCiH2Um/hC+QaKILczUnwODkxtxN7f
 8xqurxeFNE2tywdpFSoMHk7GVhE9IE5LmuQ60CP+H0mX8kP7Fic+nZuG0
 mWh9J+oqh/ZhCVx6AuAIBmWsWUHKibjyI1kE0ajzrLLAQG7/T1pNBSSfy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="373268779"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="373268779"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:33:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1102277568"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="1102277568"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:33:28 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:33:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Dec 2023 17:33:27 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWFfEcwqRV5Fn/3QMBmfVxeqR3HyeChFT/YRyNokX7ooaVUu4hLXNsdcv9y/U3/VoLCDjZmJkuYp3WjoTWYfIvsPNJ+R5uOzcRm5exfgNXv8DvYmzTdHsAFWarNDm3+rGnc93IcSdv+fjtGw4naXTumiYY9eLWGpRhl1nwGtjAvt6c4DjImfWICD+lB2kpI5jdQdE58IP7QU1w/gaG/jp9KS1ky2R1HQXLHmPufvU0uIJ82uw4jVf4Vd/jF77315k3yy9oefHhpz66714exfgorDxaCQkL3RX0ppgCFo3o+OEtIzMDWuEWg5MPXEYrKorK/AEi+3QI0njtdNO883tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xr12MMwk68+9dSMtI1ecl/xgb8XlFM/5dRyj53eyzX4=;
 b=Fg6pbRHUKTdPWfPpQJwAkq51Nzfd8Wm3hCPGfWIE7Hdgwrvl3xT72o98EOpcxIlvBAqsz0/5jGyMm5/f0DQ8u3BiQjqz/86dHBBnYWPSWDNSfRyUuzcOEI8zsOtatuj7h08oiYUcuCk23sktmo4cAJExK5MR69n3JTLLVPQyv3jykj3GWVWRP+KvGwRl7VTpiinYYnuP5oiWQ8mwyRqMOTV0HnvchIQ2errotxRbauE3/4ceuSQcaex931Uxc/0faGb9iLhwnZpkDoSNbzRkNmEomA2owXbhS6cIucKWONwT/zDUqfdIHefBbbljurIKoFcmG5J16fYV9Xuo4kJYTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 5 Dec
 2023 01:33:20 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:33:20 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 02:32:57 +0100
Message-ID: <20231205013309.1497006-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205013309.1497006-1-michal.winiarski@intel.com>
References: <20231205013309.1497006-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c7134db-512c-4528-6778-08dbf53229d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DQwHpS/R7EQR0HAgZ+z2RhFS0htovElSlsHpaKZfb+NN3O/X/1JJGTlp1IvuGEsaKmAa2PpKIncpDyRUfB1+Lz4yDIdrdCVoHyF4oC/fNyaUf4TR0T/5WCkbyYxKdTKhjy9qWPyx6ggfgoFsgOV5r4V7cgBvrxYr/niHlJJSwyh5s1xn6pKwV2pAyjJeknJZkdqRrSkPmRdRvghkAWkIcbeeZ/PhECT3bw706cdfHmCD/nEIfnost6OXeOD24uZI+Cgi6CafBL/jcZ6y1cAuuXQ+is+nlx4WX56mVvF9jbWLGLIQl0bVE6c6sSD6Xq7ecIjKNKn0xrwCf8Y30daGJmlZv+q5x0Vra/JRRboV/a2J8PCIoA2USpSefcExWzAiPdEc8cufHASnxywpPiD3A6XNmrysQklg21lGCC0XBu5AU/bsu4FNi11gnzg8p+rngMVL5+fgiS5W3Re1k9EU46HWchfTtOeDbuWzLFQcXrfYq0SZtd11lwXnr2zgohMzwzWdnZMLTRq5uvFsirEFIDd0xNje1m8A+I6sbJuRroWekAGLtxFDtMwd/AKh9DAF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(1076003)(2616005)(107886003)(6512007)(26005)(478600001)(6666004)(6916009)(66476007)(83380400001)(6486002)(41300700001)(2906002)(5660300002)(8936002)(66946007)(54906003)(66556008)(4326008)(8676002)(316002)(6506007)(82960400001)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkhwMGtLM2c3MzJ4ODkwYjBJZndSQWtSbjFRRHVLUVZHaWJJNlFRVHZJdG12?=
 =?utf-8?B?N2dGS0tmNlRuUEpLNEViSWlvSCszSWVLVTZBYTNpVmhpZ2VpMEtQaG9nS1VJ?=
 =?utf-8?B?a0RTRy9GUzF0TmRlSjVheVlXempBczZmZHM5NGJla2V3ajVZMWhRVk0xeWdX?=
 =?utf-8?B?V1daMitrLzF5MzM0VWYvOFBFNWRYQnB1cm9TcllVWGZqSU9jYkJ1cXVpTDRo?=
 =?utf-8?B?YnFQVElsTS9zSEJxT05KVWM2MkhqTE5BYS8vUTlMKzJxRmlZVmdjaVppRkl2?=
 =?utf-8?B?bVlLdU4vN3lOb0hKQzRjbmZPNWNBalpYc29BT3V3d211ck9PdTVRRmJjZ3hJ?=
 =?utf-8?B?R1VTWWpHRVFkRFBJTjVIejY4NGp5WDZkSkw3OXVPdHB5TW40Vm5oUTZHMTFs?=
 =?utf-8?B?R1hDOWY2eGcvNkZkcTlrMGFoSEszQmtMQjNUcWZ2Q3FqNGdvTjFraWtuZXR1?=
 =?utf-8?B?bEhBTFZKWDdyZkUwTXo4M0I5WHdaeEJOdG92Vyt5aDlqSmxsdUJmK2ZHOHRa?=
 =?utf-8?B?MCsyWWNSVGhOdk90MTBoU0tDd3V5S0RMSWhSQm9odzM3ZGM2Z1dNQWdSZWdu?=
 =?utf-8?B?clBFZVFQY3Y2ZkFMaHJEbE5oNkhqVUJyL3ZmK0ZZSjMya3JlS2xKQ3VFTUJp?=
 =?utf-8?B?OWhzTUpFVE5KaW1vN0x1RTZvTWRMZVpwcDV6Kys0N0lBbHZDeGVlU1dWWm82?=
 =?utf-8?B?dWtEVFRJUUQzRCtQTlNsVCs4RmlXZ2Jqd3djWVk5NWxhMXl6dzh1M3hqZ1d3?=
 =?utf-8?B?TDcyRUNiaUhFK3pJQ1BISVdRbEQ2b05OeldKNWxQTGExTXhsV0NXcXZNZTgv?=
 =?utf-8?B?ZWdsNUl2QklqN3dHZnZKL0pTTUxmWkUvMDFQVmVpTkw0MHQxY1NnYTAyODZi?=
 =?utf-8?B?K1ZWOEcybm11Wks4MGtTSC9EbzUvdjFWS3BKR0RaWURwaTJkN3hxaTVZbFdE?=
 =?utf-8?B?QW53V0FzNWRhQ3hxeWFYaExCUUdxUHQxNjNURWdpNUtKRXloL2dKMkUyZ2Z4?=
 =?utf-8?B?ejU5WC96ejNHeHYyb24zUktzWnRMcElBbzgxUWt2bmczUzlvNWlZWnYrWVc2?=
 =?utf-8?B?UGZBaGVCbmM0dWw2RUovTjNPc21YRzJudldSaEhOYXpzbUxVQlpLbE5rU0xL?=
 =?utf-8?B?ZmZ0Q2g4M0JqMDZleUhxVitPZHZHcFpYcXJzUjFPcHR5QXMyK3dGeDh3VVVz?=
 =?utf-8?B?ZFpxM2t4NmE4ZXdzTC9ocUdZRU1SMWoyQy9xeUh1L2hreVJWVkY2S2JEMUI4?=
 =?utf-8?B?bWpuaXQ0d0VQZkk0aW5sRUVsZ1JJQnlDT3dtZEE0b3NTQjBPQTErVE56eW1s?=
 =?utf-8?B?TFRDZzVjcWxHTEJVMU15Mkc4aUJHRUFYUURpdDJ1ZjM1MDcrdU01S2NQa2U1?=
 =?utf-8?B?K2t2dm5sajJicXMrK1VpcDFLZjVWVHNmYk9JOHFSRjFzVXRKSTRwTElPekVv?=
 =?utf-8?B?NkNMSWhNa3poR2Vtb1dtSGcwMXFPaHhCVzl1MFdlSDlHdXNkdzJsdEFvc3hX?=
 =?utf-8?B?YVdrOUFuZDZ0eXpubTd1L2tWTVdBUm05LzNMTURzbHBPazl0cjdwdUE2d1pQ?=
 =?utf-8?B?aFprQjUrSTJ2RjFlcjZLcnNPOVF1dTdrOEp6d01DdU9ibEZNYkNQSFRKSFV4?=
 =?utf-8?B?RUVJM3VQOEZJd2RDdGphczZ4a0lyaTVzUTF2THdCajA2YUhab0lRR3o4bTlT?=
 =?utf-8?B?VVhoM3ZIMHJiaFBtL1pnT0llUERNZTNzL0VQMW5UVjhlVkRMTEVkWFRkTHFo?=
 =?utf-8?B?ZWo2OTF5S2hoUlFzTEVCeXVrRXl3TjY5akdVU3VJanJwcTB1TjhCUmpUL3p0?=
 =?utf-8?B?WXBZRWsxS1JTcm0yRit1YlpSUVFPT3Y4bDZJdHZxMkNWOWNId0RsZ2E0eXRo?=
 =?utf-8?B?K3JuanRsNnp0RUlnTzkvYTJwMm1jeE5Iay9aNXF3N3pCV2FRT1JwQXM5eHAr?=
 =?utf-8?B?cGVJQWpqR05UZUR0T1E2MGJGaVp5VmtBYy9OMExEK3VJWkdDMjlMcjhJRFcx?=
 =?utf-8?B?dGdpazdxUDZVZlc1VXF1ZHpMWE1xSUZLamwvTUg4allad2x1MEh0SDY3Vysz?=
 =?utf-8?B?V1czc3NUZUxrNVJuYUFXR1A0cllCT1Q2WFpxbFl2L0NRVU9IUXRxTW1PS3BF?=
 =?utf-8?B?ZXZyeUlUQzQ3VDg1c3JLelNGakZ1VGxieTJiYm1kdEk4cmZ2QVkxd1RVRjZV?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7134db-512c-4528-6778-08dbf53229d8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:33:20.3319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJ/PVMsDIby8QgnX+9h+U/Hm6eQdIMPLMWx9meTV5NR6bve4V/PdyS4n6wQUkD+MMGm9Bd1hd/KiyWk3KM4YqmxC0/L9BHZiUSz1KNts/zQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 02/13] drm/xe: Introduce xe_tile_init_early and use
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
index 10c150627cf4a..19d1cdd3963ae 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -26,6 +26,7 @@
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_step.h"
+#include "xe_tile.h"
 
 enum toggle_d3cold {
 	D3COLD_DISABLE,
@@ -624,12 +625,11 @@ static int xe_info_init(struct xe_device *xe,
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
index 131752a57f652..c74a4f840d846 100644
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
+ * Initializes per-tile resources that don't require any interactions with the
+ * hardware or any knowledge about the Graphics/Media IP version.
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

