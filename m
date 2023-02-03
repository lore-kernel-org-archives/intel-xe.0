Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7864C61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE63E10E8CB;
	Fri,  3 Feb 2023 20:16:29 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBDC10E08A
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455387; x=1706991387;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=gxoD1mwbtfx2V/RuYgRXRZg4n5h5KkYNKKFftD/1jms=;
 b=W/OUIfRBKVi67gYWunCldGmOilsOuEplsDCzNpXUKb9dLIx/nDC5Dxig
 rl7+776u2vw9vN+jSR7zUIlV5F0RO+EUJ2gNbktj4YypMXQEoRbYb3E62
 PqKoK5Xdav/DC4sn8lWmx+SgeMKujOgYkK+rXdFXAmsPbdLNDxuaDnsF3
 lWv51cOuVGrJ0pDyWAWuSioHV9NEYYGGrqI8+V3yjmRUeCrI3f0O3eIv3
 7iyws4JVRezDRYX9s4Nu7dG7Lv9cmZ6JjxjjzCN3Q5UbEj6e+AsSLoCvs
 4hTpGNvJPt1Q6OIHNrEUeDe56eKnPtaRlc0fDNAPpwoRAsvSDwkriXmCC w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="328861340"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="328861340"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:16:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="994629766"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="994629766"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 03 Feb 2023 12:16:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:16:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:16:24 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:16:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ID4tVLabwwa4b9c1CBk87BBwq4umDUe7lGlmbT3gfA56AZ7XCb8ctGwM360NdMWjFzjr7ANicR25zPyrbsbP7zNURXmYo80aIkriQt5YI89tzTy3uG8zxKQi6XT1/xtBxtzpcuuwCI81I4NX0dzcZy65sTyDEuYfCMMqUGV6cgZcmphCOcUB0/WrCKm9BDP1gsMw1+1N9oE2MRnGlzYdw7BZ2k/7ZkgUgIPlmnz6stJyJVhzdCdBvzh4UIjfzEeoKyf1l/TL6ED1k2SICCHXqMojHq3FWKhBzxr0gDcqGq5R01W8OmOw1PNRw7ULFoja1LZsQfw0LHqUzlk1tDiQrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxMEet2r3LP2WeUEwzYW0lKFvuYiSI7E6ukl2zk8YIk=;
 b=DUQXe4bjJHHMSRSRzZeS/kNUB3jWd4eOmNVT1t0ft3stQtKoiMOvGrjzJYem40Iw9Oi3XnjkHvrEqf+e81CeeEv8VYFcOzc37cf8WIe5N/QPncBChGkI4xvaAC/dRBC3hb1wmo5h0r0qEm+ifuRafB1iiEuHleNFt8nohR2OlkbQl/GxuZyO8JbZLUrhQMbKFTE3ghTRTfDpqeNPo2ZYi8M0YwIgcLz7xvwTSZDwcB4YcY/uDAca5FA+Bk0FwdGhKeczHQtlP5Wtk/ktVxplzNEvwPI9JxN97tv3wBixPzzp3dVkHIlA1+2iAF/wVHP4P+1EUQ80d82WVAy0Yy30/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB7905.namprd11.prod.outlook.com (2603:10b6:8:ec::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.31; Fri, 3 Feb 2023 20:16:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:16:20 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:16:14 -0500
Message-ID: <20230203201614.573470-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: 732e9fee-d256-4219-aaae-08db0623831a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dLbjgNnbcAHqThnxpaQ9DywpuqRkorLFBZFe9ZYb9MUH8zynIczzLxUz/bGQ1JEj00iiWrVp8m66Dpb4bzRR7dZ3HXZG6GXp+Cilm3of6SSZy8dePEJaeMlEIcX0RwvJKAerHHEHMGaMoOYgSobjmuAHgPlo8lvkryNkm57cqwJd8069iSYzGK+DzHzV2pZsNei6CITsdQYy8iLxNQdx8W11u7oT9T1noMe1bDpulW+gxck2zY+9ZgysCGhZwiFw6w/vNJOM4IxsZh8AY6hiibt1JzoD2pOGV+92l3W/e4WJ1SX4juK1nJSGeTWUbQyTAGaTUFpdFTIa23oDrhLPrIsvvG5xHSJnj6d3HUkI6sDfDcFuk9ClmrvRDuQplUPKpLYjILuo244vP2FNv2trM8j5n0HWEqGs++Q/CzeZmom0Kok4rjf+Nax0WxcJsN9eU0NgaP6wxOIr8VyEpcOao2UlB4bOlTF6/CaZWBy3HGk4t2LG7HVA4GZHSQFamcRMpgXjJRiKflfKU80GeHx6oyE8cfdSRXupnf3WItv7oRDRXI1/rg2VOtpxHptpi5vcNAiXlPXbkWwbXYUEEHhEUfXXqcy/ECncAXsUVQSZo9MM7qKNzOqaEByzhfqFdqTj3ME7QDGPS/mmhE0uo2KZcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199018)(36756003)(54906003)(316002)(6506007)(478600001)(6666004)(6486002)(1076003)(5660300002)(44832011)(15650500001)(8676002)(66476007)(2906002)(66946007)(66556008)(8936002)(4326008)(6916009)(38100700002)(6512007)(82960400001)(41300700001)(66574015)(2616005)(186003)(26005)(83380400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDZTUkxNc0JqZGRDN2hWQW1FZ3dmL3lCbFM5Y1ZiVWpOYTBZWDBPSHR5VTJi?=
 =?utf-8?B?UlQzNXRXcDVjTXM1M3JSYlBaMXV5ZTRUUmNYZFo2ZHpYUjViU2d3c3lGVjhy?=
 =?utf-8?B?aWhQQjFGSTRwdWVtV3crc3c1b3ZFdnZFSDFsbEZRcWtlRERNZmRGTkJrY3RM?=
 =?utf-8?B?alBXWFZ1QkxnL0hBc0JBdUgyRGpqZTYydEdlaEpUY04rR09zbmsvMVhpeFVs?=
 =?utf-8?B?WERtNGlZNEdBL0dhSllVb0hyczhyUzhJamNQTlc5V2JKVkdnR1kydExEZHBm?=
 =?utf-8?B?d3p1SnV3ODlLSkFnZXNhUXVaNnBpUDByUEpoUUR1RVlpRUYzVjQwb3RsQ0lm?=
 =?utf-8?B?OVhxL2QxTVRmY0Y1ZXdRMXVMY3dyNjREeXIyL2RHeGtHVDdMSmpDTUIwYWR4?=
 =?utf-8?B?MW1XQlE3VS9QRzg3TlVhUE1aMEZWZnhabUpqby9ac0lhQjlWSmt1ZWlKR0dH?=
 =?utf-8?B?NG5GZDVBVURldTVvcDVwQ1VjTnpuWTVSRkpEWUNyTkh3Tk5OZi9PUkhEUnFl?=
 =?utf-8?B?VnV0ZHlEL0pDMzcyOTR2N1gxM2FMcXlxdzhTU1M3M3JDTU9SZjBydnd4VDc5?=
 =?utf-8?B?TW9YUVVsVHBrRXY1Z3ZhMXJyUUswdFl2ZnBESUk2eU93NFlTcE1MbEQ1RkNL?=
 =?utf-8?B?VGU5R2xoZ1FHUUpqaEVjTkcxdDN0WU9oeHR0M3FreWd0Ym5GREpvZldEQ08v?=
 =?utf-8?B?OGNHRFg1M2R6d285Mml2Y3N1ajAwZFkzWk15MUdiZDFFejkwQU1lMnh5SnFn?=
 =?utf-8?B?Q1NwYmhaNEViam1rY1ExYnM3VldCRVBHS1lMd2JtdlcydTErZ0tXSm12V1Na?=
 =?utf-8?B?MzFnaVJrUnBtbVJvSVJuNmdsbW16eGdwNFNFc2ZwbjNTY20zRXJ6aXE1M2Yy?=
 =?utf-8?B?TWJ6cVlFaGMyamZvc1ZVeUVRdHBIK1RoL1dOUkVUZ28vYlBBUUpwWEFWYnRX?=
 =?utf-8?B?cmdMb2hySllFbmFFRG1DektXYldDU0ZlRHh0WFVMT0ZWZGhtTWxSRUU2OEth?=
 =?utf-8?B?b01sMUlPZm1GaWdMcDJwZ1pRUzNadlR4TUFhWW9DL29PN1ZUWjMwT0VPa2Nr?=
 =?utf-8?B?SlRyT0xqVDgreU9zN3Z3NVQ2TWkxeTBlcjBBK0hLeDNOWDdTeWxtVTVKaHIr?=
 =?utf-8?B?Y0psQTJrczJHM0tuQk1RWjA0TFFiVEpFRzAwOU9BN0R6QXlsQjV1M3JOR0Nx?=
 =?utf-8?B?RGtNWjIvcFhZTzExV3N6RkRyQjEzNzVmMTI5amxZRzNZdml6N3lkR3MyUVlk?=
 =?utf-8?B?UkpibVBsaEF1eTRYTlhGNW5ndUZOUW8rVEIyOTRadGZjTkZBQm90WTM1UEx4?=
 =?utf-8?B?L0NPU1ZTK1F2UnRLN2R1SlRRVGpCaDY5RDdQSzNuMTA3UG5veGM0QVJaK1RU?=
 =?utf-8?B?bTZUK2M3aXc2U3dhbkpRZnVFaDZHa3g2QkRiWC94YldjNnNKcEUrWmRUU1Zl?=
 =?utf-8?B?RkEvdEFTU2RQa1czbGFGSGdyQlJkRlNWVVJWYUloWVFVZll1aUVjcDBMSm5x?=
 =?utf-8?B?MzJiZTdhYWk1Yi9QOFJvU2hheWpoQ3o5VzZ1ODgyUStZMWlYbjVQbHM2SWJ6?=
 =?utf-8?B?SkZ3bVdZaERGeEgyc2YyU2xnWUNQYmhIRE9xOE5yeEExdXVUZ1pkcVl6aEVm?=
 =?utf-8?B?aEg3LzBlTFEwRmZKZ0lvMWVuT3J1UWNqT2dGQTlBazJjRmhKeDh5TDR5WG5H?=
 =?utf-8?B?cWhINmtaemswVEEzRmhMQjNGQVFNVVdyV09TSUdMQzZ0SjFIMURtWTVsbXZw?=
 =?utf-8?B?alZ1aXg0b25xWVEveWFYK1NXZjAzeEl5bm92enBnbWpXbmZxYXN1dnQ1UmNH?=
 =?utf-8?B?SVYxQTR0b3lDbjVHVzVZOTNCZlh1RjJUV3FFbVlqZFdKNm41Z0VrckNpcnpp?=
 =?utf-8?B?V3J2cG9qaFY0TkJuNFBQMGZUMmVPTlBGNVllYUZHVEFJb01Jc1hKcDg5WWFp?=
 =?utf-8?B?S0k2NS9nZnVOWEgrTTNuNThKKzg0OFBWU3FYdmxMU2FPOG9SQVUzdVFFQXNQ?=
 =?utf-8?B?OFF4dm44d1BpNy8wY1d4bTZlZUFSc0hZWjZDOW8vTmdZQjlJOFF2c090TXRs?=
 =?utf-8?B?NUJIRHdWUlFkbHkzWkM0Q1d5WnFVNmY3eWtFUXNDWlJuWWVtU0ZlUGlKaUhx?=
 =?utf-8?B?UDA0K3Z4R29vNWh1UXJzcjE1dWpsZ2Z5MUtycSttdytDRU1XVjArdU40TFdT?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 732e9fee-d256-4219-aaae-08db0623831a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:16:19.9379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0asf/5YRFnvFPzgUSNz3qiyP2S2E1A/L38kn7q5H+DoiGkrkMZkCMsevZfCm3YAIhxJJRqm83dRib5uLSp0slw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7905
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] drm/xe/migrate: Update emit_pte to cope with a
 size level than 4k
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

emit_pte assumes the size argument is 4k aligned, this may not be true
for the PTEs emitted for CSS as seen by below call stack:

[   56.734228] xe_migrate_copy:585: size=327680, ccs_start=327680, css_size=1280,4096
[   56.734250] xe_migrate_copy:643: size=262144
[   56.734252] emit_pte:404: ptes=64
[   56.734255] emit_pte:418: chunk=64
[   56.734257] xe_migrate_copy:650: size=1024	@ CCS emit PTE
[   56.734259] emit_pte:404: ptes=1
[   56.734261] emit_pte:418: chunk=1
[   56.734339] xe_migrate_copy:643: size=65536
[   56.734342] emit_pte:404: ptes=16
[   56.734344] emit_pte:418: chunk=16
[   56.734346] xe_migrate_copy:650: size=256	# CCS emit PTE
[   56.734348] emit_pte:404: ptes=1
[   56.734350] emit_pte:418: chunk=1
[   56.734352] xe_res_next:174: size=4096, remaining=0

Update emit_pte to handle sizes less than 4k.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index d534584e6a9b..cbcc355cd391 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -453,11 +453,8 @@ static void emit_pte(struct xe_migrate *m,
 		while (chunk--) {
 			u64 addr;
 
-			XE_BUG_ON(cur->start & (PAGE_SIZE - 1));
-
+			addr = xe_res_dma(cur) & PAGE_MASK;
 			if (is_vram) {
-				addr = cur->start;
-
 				/* Is this a 64K PTE entry? */
 				if ((m->eng->vm->flags & XE_VM_FLAGS_64K) &&
 				    !(cur_ofs & (16 * 8 - 1))) {
@@ -466,14 +463,12 @@ static void emit_pte(struct xe_migrate *m,
 				}
 
 				addr |= GEN12_PPGTT_PTE_LM;
-			} else {
-				addr = xe_res_dma(cur);
 			}
 			addr |= PPAT_CACHED | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 
-			xe_res_next(cur, PAGE_SIZE);
+			xe_res_next(cur, min(size, (u32)PAGE_SIZE));
 			cur_ofs += 8;
 		}
 	}
@@ -615,13 +610,13 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
 
 	if (!src_is_vram)
-		xe_res_first_sg(xe_bo_get_sg(bo), 0, bo->size, &src_it);
+		xe_res_first_sg(xe_bo_get_sg(bo), 0, size, &src_it);
 	else
-		xe_res_first(src, 0, bo->size, &src_it);
+		xe_res_first(src, 0, size, &src_it);
 	if (!dst_is_vram)
-		xe_res_first_sg(xe_bo_get_sg(bo), 0, bo->size, &dst_it);
+		xe_res_first_sg(xe_bo_get_sg(bo), 0, size, &dst_it);
 	else
-		xe_res_first(dst, 0, bo->size, &dst_it);
+		xe_res_first(dst, 0, size, &dst_it);
 
 	if (copy_system_ccs)
 		xe_res_first_sg(xe_bo_get_sg(bo), xe_bo_ccs_pages_start(bo),
-- 
2.39.1

