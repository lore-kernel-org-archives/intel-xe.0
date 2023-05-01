Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEA8C77B7C
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 19:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A584810E33D;
	Mon,  1 May 2023 19:37:43 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7283D10E33D
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 19:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682969862; x=1714505862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=koJmSKeetDkK7L9m/RgPI9lt1lbwxm/kI+VR35WLpEM=;
 b=BY475xBhO5tf/4hqPKQl5Hkks25GNh5+zG81WfbDXM8tiaFKALtYSjE6
 8Fl7AT508vQ1BNKhP77zHNJBpZBslw1wN5au5S95uaIHWdzSICmzUYh30
 g64leBThUF3g+TgvYvu90I1SCSjnDMiI/UQRwrgiHhMK1BueKhkx6dGkP
 R6zAVAG7dVc5TIxbPBXyswi6hvfyZWDuq09txcVspffSSnQUokM2pPmeH
 OBp1kLePMq5LokvNEfxTV7ftOkatlkcwcyKZxDMqSH58fVKT8dWSV71XR
 mHU1I36yCyDvvQeYCHONzuXXkKVm0lpkp5FLHHHfCXgex6ABSyutbQUuR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="337344825"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="337344825"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 12:37:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="726448889"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="726448889"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 01 May 2023 12:37:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 1 May 2023 12:37:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 1 May 2023 12:37:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 1 May 2023 12:37:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCIwTmZLthUHCbr+ZWzpRcdU5n/hrBOMNYQghs/AF1hhZ5DOErceObn/CG07oMmtnOU1dOLOMpEL1o8ZlTlK5h5rFMZbaM9YUkdpEquU/21rrKCb6LWdCXcratLSysBFX94g5Ci7F4F0diSsUhMdVsHwh8MY8TkUee8ANWbuLyc4i8RMcV58xgbm9iV2B8Z9UPqrCesrayWIgrLoY0+M8gcrx2RtECZUYbgGkqOW2iEMaa9zmGwK1doizTbF5FAh7Wqpu43Ea4OZ7qAJZATjcwxFQDb2wVjSqKREavSwjFTyGxRQH4j4BlBJ4HB6vnHAsM4m1OgHRkwzSuuM1eJl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQYTKWq0cDHTdC6TDCEKt4O5yK9JjxwgL/xklioF/hQ=;
 b=BzXkhJbN2C0St7hqoEnwL/TwLp+w/qD8tIa7AEtjW+DKYTcc3kOw4V8oDotbflZ7RDSaBMKarZzgtOOAAd7JdBtP0i68qk2Ql6JWuemH8iwkRb+Ym31SeFAuh83k5kCeBzYl5Ay8C4/3/JejU87wJttJhjlejltxuZMBGkkKW+uWRamEkRjNtmJ2PAEJ0ZUUMkwQLLiwzrctrJcJ/lnc8tbYKI/Ppps5waB5DUgtZIsQa/pNgVCnQKN9E60g08F8Wih1KMwR5pJW6W6qJOZTiD0XPW2tpB2+GKf7yoA9SPUHY3u1L5RUilphvtOs6wXRvt5E3+MDpHB8R5MVY0Ttmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6363.namprd11.prod.outlook.com (2603:10b6:208:3b6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 19:37:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 19:37:37 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 1 May 2023 15:37:13 -0400
Message-ID: <20230501193713.631375-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501190314.609261-3-rodrigo.vivi@intel.com>
References: <20230501190314.609261-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: 9154f1f0-5968-40e0-d131-08db4a7b84da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CGBHgNSrAo0CuTOTsDrEOIr3KWaCdv317WY3vHZpFop0SaDZF40OQpxm/hV+wsR0IoiDtaMSKsvE6qAastS+lbp70ZFn76d1A7gafHwLAlMhrHduK0Y43xLvPJrLJbnd0rnXVmNe8RszvHO20MLH3WreuMzve+FxXrdL+avVQi5iziSwjLXiqwigNkIC23JU/6t+UwexIOvhI5/0Dh141Uv8tWw+IjhJVFsGjPnc1dAwVvW8nasAt7E7MFhuMavoCFu3Dfl03Ox38Wz+sRVhazpr6ZUIOwfAKFtJC9TUF5+QDMEZuRCwq307+WMbzrj9SRCInkJth1Ot4UwJdq9jrDqOiAXUWiA5usvwr8Y172xLF7sYwsOoyvrot7qffCJtMh2HnFcnIztYlLkFqLOSHIXvxQ8wS+GAcSrwSIMb0X8YS8WeqBxDfvk/+bAVAuDsYdc0B3du6ol41YdRIjVuXzf8YX3eLM5TBpxY7/v+B/rTQPjRv+EO8RwrNU2y40Ll8FKZCkvV1iB62N48sSJv+mifrLKnRZ8FLqIG63ejdJ2sGzlUSPnrKmTzYLl2NalT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199021)(2616005)(38100700002)(6506007)(6512007)(30864003)(2906002)(26005)(1076003)(8936002)(41300700001)(8676002)(5660300002)(83380400001)(44832011)(82960400001)(316002)(6916009)(186003)(4326008)(66476007)(66946007)(66556008)(6666004)(86362001)(36756003)(107886003)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVAyclkrK2U2Qjh6Q3RrZk92Nkx3ZmFBcEh0MzV2OUxVb3NIcStxUW5hRW12?=
 =?utf-8?B?ckhpWkwwM29OMGVjalFoNXF5dXlrYnZCNWx6aC9ZK2UxUEJta3ZZWmM1V0tw?=
 =?utf-8?B?dytKVDAxczJIbVh6cm9Ldjc4SEM3d094UEp4QTFPRnFscW5LZHB4eE1MR1Av?=
 =?utf-8?B?YkZ3R3EwVTYyUTJwVWdEUWNZQmlmeTlVSEdISHlLY2czdHo0VGVSanUzWmpx?=
 =?utf-8?B?SVNqVVU5dFF3RGVJSWZqN3c3ZVdIdFl6UzhobFQzYTA5c2RKc1RRU0RjNDU0?=
 =?utf-8?B?Z1BIOUZtYXdSdWF3Tmhwc2E1RUVZRS9MeGNkdnlXUlFVUEltbXFHK0sxUkNG?=
 =?utf-8?B?cHc4MjI1UHNyWnIrVmZiMVFlY2J6Q3RZR3JtMldaR0ZBVXBkZWNIbDRnU1FB?=
 =?utf-8?B?RXZvWWFlVVhiNDRxOHVWNlNxUXFwaXBleGtiZW1YS3BKQ21rcTcyUkpFQi9J?=
 =?utf-8?B?YUlIRG9vTHhUWFg1L2FiRXhnL3k5UHBNdTRUNVZZWi9VRVJxZ1UrOUMvUU9C?=
 =?utf-8?B?Um9MVlkzYWRhc0NndGFzaUlFeFcyWTBWcXUrMnh5eFBvbHNjb3ZCNUJkblJN?=
 =?utf-8?B?dlJuZVpmZW1YZjZWcXVrS3FPT0dkSGVoNUFOUm5jNWE5S1NscEV1VEZZZmJ6?=
 =?utf-8?B?QkRIcEZtNzNmZnR5aEVRNzZnY1hINEhnUUpYQks2VGdBZWhESHhRS0V2UUIx?=
 =?utf-8?B?ZlFwb0toSzJUMm5CMnJoaWVkenVvbHVaRy9LcEJ3VW9ZS09VWXRhUEx5cVlN?=
 =?utf-8?B?ZnkxRVBLOXZFZlovSUV0R1ZhRW5OaC9CUEZjZkl2WkVKcnhKc2VLUGtqMXow?=
 =?utf-8?B?ODNmbkR3WklMVDljWDEvSzN1OWl1N3dRSDJhM2pvSWNVemE0d3RwTUpYN2c5?=
 =?utf-8?B?Zk1oR1dzYTRpRVZsQ1NZMFFudjE1dUpYcFA5STNDaW1sYkhZQWxGMWhYVVJy?=
 =?utf-8?B?SmhwZzNqUjEyRVQ3YWRzUlpZWW8vMkNQN2hqTk9NbnRPQkZ5NGFibzI0aTdR?=
 =?utf-8?B?RU5kMzVwVnVyNldiQkxURXlVSWJiVGlXQTh1N1ZpaVNKZFpLOC8yM3NiUHdv?=
 =?utf-8?B?Y0JCMWU4SllqNG5tM015aEFCbTdCc01WbktnaFVCUndiWE44OXhGMXNucXdZ?=
 =?utf-8?B?Smc3T3BFSlUyS0pXMUllc0grOGM1M2RKM1hwNkdNSEd1SnBzbzF6dVczcW9h?=
 =?utf-8?B?NDd5RFN6amd6ZUVlcktLcG4rUy9EMjN1M3RwSmhNUG9tUmhTU0JCMTkrVzc2?=
 =?utf-8?B?em1Wc2pjQVp0bTA1ZTM4clBYRmdidFlwcy8yYTFTeWdEU21GMWluYWtrakdN?=
 =?utf-8?B?R0xlMysxOGNKcitHOTBKaFFJaVJxeGRPc3RRNGM1a2NOdTI0dkQ4VHpNRkVq?=
 =?utf-8?B?VGFtUmM1RXMrNFhtbER6S0JxNkYyQ0Z2MTVMekFRWG5nWS9VRXJTYWhWa2pv?=
 =?utf-8?B?SlkxR1kxRHJ6cTN3VlVlNE9mWU95d1dtSVpmT0FOTis1Nk9HQlFFR0NSbVhj?=
 =?utf-8?B?U29ZSEpBeXlaVnVFdUZUdFpQcXRRL3BKNU9HUFgvTktMaEVOZ1U2MEJRdGFR?=
 =?utf-8?B?b3lub2NhVDlQZjNOR1Jla1dOenQ3N0NFTTFFa2R5TDlHRDNzRmJkSmVUc2hI?=
 =?utf-8?B?dkVWaGpuaGVueldxV08yUkcwWS9zb1Riem5VTytUd0ZxaGMzWEM3T1NtMG5T?=
 =?utf-8?B?VjYrcnhLVHFqY2RzSkt0YnFZOFFsUkV1VjA4aUQ2MGkvL21pSG4zdnk3NCtk?=
 =?utf-8?B?UmpFUFR4ZFdYS05XZDJ4cFdORmFubWRRQk45dVBTdHUyZVZCNFM0eDFJQ1hh?=
 =?utf-8?B?SlBUN0dLYzd6VWpieTh5bzRGRkJIamF2UTJSYkh6eVpNZGY5eVlsWmJuYWd1?=
 =?utf-8?B?RUFCQkVtSVdYd1JrM25aeVl3OHZib2FNZ2laVWZSTnVLcDhNQThFY1dHbkUv?=
 =?utf-8?B?OGlpdGN6bHRvUFo5b2t2TWVtaXVOQStXWHRUQzN1dThyeG1yd3h3VnE3TmQy?=
 =?utf-8?B?OVpsc0lubGtOYmZyc3QvU1BGbkdZT0pZdjBUamt5dzFYTlcwRDhXTXYyeGFE?=
 =?utf-8?B?cXpXcFF6UnFLMnl6R0xoWTFWN0lnNzIrZ1V1dG5BQzZsT0tpWlgrTjByTFhK?=
 =?utf-8?Q?GpmUS/ORh+y3D7WhggpBikv72?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9154f1f0-5968-40e0-d131-08db4a7b84da
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 19:37:37.7759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGPR+BK2dQg1PG7AF05bljqvcCgTmDjhmcPC+IlD6Y68ChUihVLDD1LNo5spbu2kuI5t4eNunOPQF1q/HqP2oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6363
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Introduce a new DRM driver for
 Intel GPUs
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

---
 drivers/gpu/drm/xe/Makefile      |   1 +
 drivers/gpu/drm/xe/xe_pt.c       | 110 ++++++++++-----------
 drivers/gpu/drm/xe/xe_pt_types.h |   4 +-
 drivers/gpu/drm/xe/xe_pt_walk.c  | 160 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pt_walk.h  | 161 +++++++++++++++++++++++++++++++
 5 files changed, 377 insertions(+), 59 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pt_walk.c
 create mode 100644 drivers/gpu/drm/xe/xe_pt_walk.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 74a84080f242..b84e191ba14f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -73,6 +73,7 @@ xe-y += xe_bb.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
 	xe_pt.o \
+	xe_pt_walk.o \
 	xe_query.o \
 	xe_reg_sr.o \
 	xe_reg_whitelist.o \
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 4ee5ea2cabc9..f15282996c3b 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -5,14 +5,13 @@
 
 #include "xe_pt.h"
 
-#include <drm/drm_pt_walk.h>
-
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_pt_types.h"
+#include "xe_pt_walk.h"
 #include "xe_res_cursor.h"
 #include "xe_trace.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -20,8 +19,8 @@
 
 struct xe_pt_dir {
 	struct xe_pt pt;
-	/** @dir: Directory structure for the drm_pt_walk functionality */
-	struct drm_pt_dir dir;
+	/** @dir: Directory structure for the xe_pt_walk functionality */
+	struct xe_ptw_dir dir;
 };
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
@@ -44,7 +43,7 @@ static struct xe_pt_dir *as_xe_pt_dir(struct xe_pt *pt)
 
 static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
 {
-	return container_of(pt_dir->dir.entries[index], struct xe_pt, drm);
+	return container_of(pt_dir->dir.entries[index], struct xe_pt, base);
 }
 
 /**
@@ -211,7 +210,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_gt *gt,
 	int err;
 
 	size = !level ?  sizeof(struct xe_pt) : sizeof(struct xe_pt_dir) +
-		XE_PDES * sizeof(struct drm_pt *);
+		XE_PDES * sizeof(struct xe_ptw *);
 	pt = kzalloc(size, GFP_KERNEL);
 	if (!pt)
 		return ERR_PTR(-ENOMEM);
@@ -227,7 +226,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_gt *gt,
 	}
 	pt->bo = bo;
 	pt->level = level;
-	pt->drm.dir = level ? &as_xe_pt_dir(pt)->dir : NULL;
+	pt->base.dir = level ? &as_xe_pt_dir(pt)->dir : NULL;
 
 	XE_BUG_ON(level > XE_VM_MAX_LEVEL);
 
@@ -404,8 +403,8 @@ struct xe_pt_update {
 };
 
 struct xe_pt_stage_bind_walk {
-	/** drm: The base class. */
-	struct drm_pt_walk drm;
+	/** base: The base class. */
+	struct xe_pt_walk base;
 
 	/* Input parameters for the walk */
 	/** @vm: The vm we're building for. */
@@ -532,7 +531,7 @@ xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk, struct xe_pt *parent,
 		struct iosys_map *map = &parent->bo->vmap;
 
 		if (unlikely(xe_child))
-			parent->drm.dir->entries[offset] = &xe_child->drm;
+			parent->base.dir->entries[offset] = &xe_child->base;
 
 		xe_pt_write(xe_walk->vm->xe, map, offset, pte);
 		parent->num_live++;
@@ -556,7 +555,7 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
 	u64 size, dma;
 
 	/* Does the virtual range requested cover a huge pte? */
-	if (!drm_pt_covers(addr, next, level, &xe_walk->drm))
+	if (!xe_pt_covers(addr, next, level, &xe_walk->base))
 		return false;
 
 	/* Does the DMA segment cover the whole pte? */
@@ -618,15 +617,15 @@ xe_pt_is_pte_ps64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
 }
 
 static int
-xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
+xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		       unsigned int level, u64 addr, u64 next,
-		       struct drm_pt **child,
+		       struct xe_ptw **child,
 		       enum page_walk_action *action,
-		       struct drm_pt_walk *walk)
+		       struct xe_pt_walk *walk)
 {
 	struct xe_pt_stage_bind_walk *xe_walk =
-		container_of(walk, typeof(*xe_walk), drm);
-	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), drm);
+		container_of(walk, typeof(*xe_walk), base);
+	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), base);
 	struct xe_pt *xe_child;
 	bool covers;
 	int ret = 0;
@@ -675,7 +674,7 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
 		xe_walk->l0_end_addr = next;
 	}
 
-	covers = drm_pt_covers(addr, next, level, &xe_walk->drm);
+	covers = xe_pt_covers(addr, next, level, &xe_walk->base);
 	if (covers || !*child) {
 		u64 flags = 0;
 
@@ -689,7 +688,7 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
 		if (!covers)
 			xe_pt_populate_empty(xe_walk->gt, xe_walk->vm, xe_child);
 
-		*child = &xe_child->drm;
+		*child = &xe_child->base;
 
 		/*
 		 * Prefer the compact pagetable layout for L0 if possible.
@@ -712,7 +711,7 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
 	return ret;
 }
 
-static const struct drm_pt_walk_ops xe_pt_stage_bind_ops = {
+static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
 	.pt_entry = xe_pt_stage_bind_entry,
 };
 
@@ -742,7 +741,7 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 	bool is_vram = !xe_vma_is_userptr(vma) && bo && xe_bo_is_vram(bo);
 	struct xe_res_cursor curs;
 	struct xe_pt_stage_bind_walk xe_walk = {
-		.drm = {
+		.base = {
 			.ops = &xe_pt_stage_bind_ops,
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
@@ -787,8 +786,8 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 		xe_res_first_sg(xe_bo_get_sg(bo), vma->bo_offset,
 				vma->end - vma->start + 1, &curs);
 
-	ret = drm_pt_walk_range(&pt->drm, pt->level, vma->start, vma->end + 1,
-				&xe_walk.drm);
+	ret = xe_pt_walk_range(&pt->base, pt->level, vma->start, vma->end + 1,
+				&xe_walk.base);
 
 	*num_entries = xe_walk.wupd.num_used_entries;
 	return ret;
@@ -814,20 +813,17 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
  * be shared page tables also at lower levels, so it adjusts the walk action
  * accordingly.
  *
- * Note that the function is not device-specific so could be made a drm
- * pagewalk helper.
- *
  * Return: true if there were non-shared entries, false otherwise.
  */
 static bool xe_pt_nonshared_offsets(u64 addr, u64 end, unsigned int level,
-				    struct drm_pt_walk *walk,
+				    struct xe_pt_walk *walk,
 				    enum page_walk_action *action,
 				    pgoff_t *offset, pgoff_t *end_offset)
 {
 	u64 size = 1ull << walk->shifts[level];
 
-	*offset = drm_pt_offset(addr, level, walk);
-	*end_offset = drm_pt_num_entries(addr, end, level, walk) + *offset;
+	*offset = xe_pt_offset(addr, level, walk);
+	*end_offset = xe_pt_num_entries(addr, end, level, walk) + *offset;
 
 	if (!level)
 		return true;
@@ -851,8 +847,8 @@ static bool xe_pt_nonshared_offsets(u64 addr, u64 end, unsigned int level,
 }
 
 struct xe_pt_zap_ptes_walk {
-	/** @drm: The walk base-class */
-	struct drm_pt_walk drm;
+	/** @base: The walk base-class */
+	struct xe_pt_walk base;
 
 	/* Input parameters for the walk */
 	/** @gt: The gt we're building for */
@@ -863,15 +859,15 @@ struct xe_pt_zap_ptes_walk {
 	bool needs_invalidate;
 };
 
-static int xe_pt_zap_ptes_entry(struct drm_pt *parent, pgoff_t offset,
+static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
 				unsigned int level, u64 addr, u64 next,
-				struct drm_pt **child,
+				struct xe_ptw **child,
 				enum page_walk_action *action,
-				struct drm_pt_walk *walk)
+				struct xe_pt_walk *walk)
 {
 	struct xe_pt_zap_ptes_walk *xe_walk =
-		container_of(walk, typeof(*xe_walk), drm);
-	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), drm);
+		container_of(walk, typeof(*xe_walk), base);
+	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
 	pgoff_t end_offset;
 
 	XE_BUG_ON(!*child);
@@ -893,7 +889,7 @@ static int xe_pt_zap_ptes_entry(struct drm_pt *parent, pgoff_t offset,
 	return 0;
 }
 
-static const struct drm_pt_walk_ops xe_pt_zap_ptes_ops = {
+static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
 	.pt_entry = xe_pt_zap_ptes_entry,
 };
 
@@ -916,7 +912,7 @@ static const struct drm_pt_walk_ops xe_pt_zap_ptes_ops = {
 bool xe_pt_zap_ptes(struct xe_gt *gt, struct xe_vma *vma)
 {
 	struct xe_pt_zap_ptes_walk xe_walk = {
-		.drm = {
+		.base = {
 			.ops = &xe_pt_zap_ptes_ops,
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
@@ -928,8 +924,8 @@ bool xe_pt_zap_ptes(struct xe_gt *gt, struct xe_vma *vma)
 	if (!(vma->gt_present & BIT(gt->info.id)))
 		return false;
 
-	(void)drm_pt_walk_shared(&pt->drm, pt->level, vma->start, vma->end + 1,
-				 &xe_walk.drm);
+	(void)xe_pt_walk_shared(&pt->base, pt->level, vma->start, vma->end + 1,
+				 &xe_walk.base);
 
 	return xe_walk.needs_invalidate;
 }
@@ -1015,7 +1011,7 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
 				xe_pt_destroy(xe_pt_entry(pt_dir, j_),
 					      vma->vm->flags, deferred);
 
-			pt_dir->dir.entries[j_] = &newpte->drm;
+			pt_dir->dir.entries[j_] = &newpte->base;
 		}
 		kfree(entries[i].pt_entries);
 	}
@@ -1375,8 +1371,8 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 }
 
 struct xe_pt_stage_unbind_walk {
-	/** @drm: The pagewalk base-class. */
-	struct drm_pt_walk drm;
+	/** @base: The pagewalk base-class. */
+	struct xe_pt_walk base;
 
 	/* Input parameters for the walk */
 	/** @gt: The gt we're unbinding from. */
@@ -1404,10 +1400,10 @@ struct xe_pt_stage_unbind_walk {
 static bool xe_pt_check_kill(u64 addr, u64 next, unsigned int level,
 			     const struct xe_pt *child,
 			     enum page_walk_action *action,
-			     struct drm_pt_walk *walk)
+			     struct xe_pt_walk *walk)
 {
 	struct xe_pt_stage_unbind_walk *xe_walk =
-		container_of(walk, typeof(*xe_walk), drm);
+		container_of(walk, typeof(*xe_walk), base);
 	unsigned int shift = walk->shifts[level];
 	u64 size = 1ull << shift;
 
@@ -1428,13 +1424,13 @@ static bool xe_pt_check_kill(u64 addr, u64 next, unsigned int level,
 	return false;
 }
 
-static int xe_pt_stage_unbind_entry(struct drm_pt *parent, pgoff_t offset,
+static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 				    unsigned int level, u64 addr, u64 next,
-				    struct drm_pt **child,
+				    struct xe_ptw **child,
 				    enum page_walk_action *action,
-				    struct drm_pt_walk *walk)
+				    struct xe_pt_walk *walk)
 {
-	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), drm);
+	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
 
 	XE_BUG_ON(!*child);
 	XE_BUG_ON(!level && xe_child->is_compact);
@@ -1445,15 +1441,15 @@ static int xe_pt_stage_unbind_entry(struct drm_pt *parent, pgoff_t offset,
 }
 
 static int
-xe_pt_stage_unbind_post_descend(struct drm_pt *parent, pgoff_t offset,
+xe_pt_stage_unbind_post_descend(struct xe_ptw *parent, pgoff_t offset,
 				unsigned int level, u64 addr, u64 next,
-				struct drm_pt **child,
+				struct xe_ptw **child,
 				enum page_walk_action *action,
-				struct drm_pt_walk *walk)
+				struct xe_pt_walk *walk)
 {
 	struct xe_pt_stage_unbind_walk *xe_walk =
-		container_of(walk, typeof(*xe_walk), drm);
-	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), drm);
+		container_of(walk, typeof(*xe_walk), base);
+	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
 	pgoff_t end_offset;
 	u64 size = 1ull << walk->shifts[--level];
 
@@ -1477,7 +1473,7 @@ xe_pt_stage_unbind_post_descend(struct drm_pt *parent, pgoff_t offset,
 	return 0;
 }
 
-static const struct drm_pt_walk_ops xe_pt_stage_unbind_ops = {
+static const struct xe_pt_walk_ops xe_pt_stage_unbind_ops = {
 	.pt_entry = xe_pt_stage_unbind_entry,
 	.pt_post_descend = xe_pt_stage_unbind_post_descend,
 };
@@ -1500,7 +1496,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_gt *gt, struct xe_vma *vma,
 				       struct xe_vm_pgtable_update *entries)
 {
 	struct xe_pt_stage_unbind_walk xe_walk = {
-		.drm = {
+		.base = {
 			.ops = &xe_pt_stage_unbind_ops,
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
@@ -1512,8 +1508,8 @@ static unsigned int xe_pt_stage_unbind(struct xe_gt *gt, struct xe_vma *vma,
 	};
 	struct xe_pt *pt = vma->vm->pt_root[gt->info.id];
 
-	(void)drm_pt_walk_shared(&pt->drm, pt->level, vma->start, vma->end + 1,
-				 &xe_walk.drm);
+	(void)xe_pt_walk_shared(&pt->base, pt->level, vma->start, vma->end + 1,
+				 &xe_walk.base);
 
 	return xe_walk.wupd.num_used_entries;
 }
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 2bb5d0e319b7..2ed64c0a4485 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -6,7 +6,7 @@
 #ifndef _XE_PT_TYPES_H_
 #define _XE_PT_TYPES_H_
 
-#include <drm/drm_pt_walk.h>
+#include "xe_pt_walk.h"
 
 enum xe_cache_level {
 	XE_CACHE_NONE,
@@ -17,7 +17,7 @@ enum xe_cache_level {
 #define XE_VM_MAX_LEVEL 4
 
 struct xe_pt {
-	struct drm_pt drm;
+	struct xe_ptw base;
 	struct xe_bo *bo;
 	unsigned int level;
 	unsigned int num_live;
diff --git a/drivers/gpu/drm/xe/xe_pt_walk.c b/drivers/gpu/drm/xe/xe_pt_walk.c
new file mode 100644
index 000000000000..0def89af4372
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pt_walk.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+#include "xe_pt_walk.h"
+
+/**
+ * DOC: GPU page-table tree walking.
+ * The utilities in this file are similar to the CPU page-table walk
+ * utilities in mm/pagewalk.c. The main difference is that we distinguish
+ * the various levels of a page-table tree with an unsigned integer rather
+ * than by name. 0 is the lowest level, and page-tables with level 0 can
+ * not be directories pointing to lower levels, whereas all other levels
+ * can. The user of the utilities determines the highest level.
+ *
+ * Nomenclature:
+ * Each struct xe_ptw, regardless of level is referred to as a page table, and
+ * multiple page tables typically form a page table tree with page tables at
+ * intermediate levels being page directories pointing at page tables at lower
+ * levels. A shared page table for a given address range is a page-table which
+ * is neither fully within nor fully outside the address range and that can
+ * thus be shared by two or more address ranges.
+ *
+ * Please keep this code generic so that it can used as a drm-wide page-
+ * table walker should other drivers find use for it.
+ */
+static u64 xe_pt_addr_end(u64 addr, u64 end, unsigned int level,
+			  const struct xe_pt_walk *walk)
+{
+	u64 size = 1ull << walk->shifts[level];
+	u64 tmp = round_up(addr + 1, size);
+
+	return min_t(u64, tmp, end);
+}
+
+static bool xe_pt_next(pgoff_t *offset, u64 *addr, u64 next, u64 end,
+		       unsigned int level, const struct xe_pt_walk *walk)
+{
+	pgoff_t step = 1;
+
+	/* Shared pt walk skips to the last pagetable */
+	if (unlikely(walk->shared_pt_mode)) {
+		unsigned int shift = walk->shifts[level];
+		u64 skip_to = round_down(end, 1ull << shift);
+
+		if (skip_to > next) {
+			step += (skip_to - next) >> shift;
+			next = skip_to;
+		}
+	}
+
+	*addr = next;
+	*offset += step;
+
+	return next != end;
+}
+
+/**
+ * xe_pt_walk_range() - Walk a range of a gpu page table tree with callbacks
+ * for each page-table entry in all levels.
+ * @parent: The root page table for walk start.
+ * @level: The root page table level.
+ * @addr: Virtual address start.
+ * @end: Virtual address end + 1.
+ * @walk: Walk info.
+ *
+ * Similar to the CPU page-table walker, this is a helper to walk
+ * a gpu page table and call a provided callback function for each entry.
+ *
+ * Return: 0 on success, negative error code on error. The error is
+ * propagated from the callback and on error the walk is terminated.
+ */
+int xe_pt_walk_range(struct xe_ptw *parent, unsigned int level,
+		     u64 addr, u64 end, struct xe_pt_walk *walk)
+{
+	pgoff_t offset = xe_pt_offset(addr, level, walk);
+	struct xe_ptw **entries = parent->dir ? parent->dir->entries : NULL;
+	const struct xe_pt_walk_ops *ops = walk->ops;
+	enum page_walk_action action;
+	struct xe_ptw *child;
+	int err = 0;
+	u64 next;
+
+	do {
+		next = xe_pt_addr_end(addr, end, level, walk);
+		if (walk->shared_pt_mode && xe_pt_covers(addr, next, level,
+							 walk))
+			continue;
+again:
+		action = ACTION_SUBTREE;
+		child = entries ? entries[offset] : NULL;
+		err = ops->pt_entry(parent, offset, level, addr, next,
+				    &child, &action, walk);
+		if (err)
+			break;
+
+		/* Probably not needed yet for gpu pagetable walk. */
+		if (unlikely(action == ACTION_AGAIN))
+			goto again;
+
+		if (likely(!level || !child || action == ACTION_CONTINUE))
+			continue;
+
+		err = xe_pt_walk_range(child, level - 1, addr, next, walk);
+
+		if (!err && ops->pt_post_descend)
+			err = ops->pt_post_descend(parent, offset, level, addr,
+						   next, &child, &action, walk);
+		if (err)
+			break;
+
+	} while (xe_pt_next(&offset, &addr, next, end, level, walk));
+
+	return err;
+}
+
+/**
+ * xe_pt_walk_shared() - Walk shared page tables of a page-table tree.
+ * @parent: Root page table directory.
+ * @level: Level of the root.
+ * @addr: Start address.
+ * @end: Last address + 1.
+ * @walk: Walk info.
+ *
+ * This function is similar to xe_pt_walk_range() but it skips page tables
+ * that are private to the range. Since the root (or @parent) page table is
+ * typically also a shared page table this function is different in that it
+ * calls the pt_entry callback and the post_descend callback also for the
+ * root. The root can be detected in the callbacks by checking whether
+ * parent == *child.
+ * Walking only the shared page tables is common for unbind-type operations
+ * where the page-table entries for an address range are cleared or detached
+ * from the main page-table tree.
+ *
+ * Return: 0 on success, negative error code on error: If a callback
+ * returns an error, the walk will be terminated and the error returned by
+ * this function.
+ */
+int xe_pt_walk_shared(struct xe_ptw *parent, unsigned int level,
+		      u64 addr, u64 end, struct xe_pt_walk *walk)
+{
+	const struct xe_pt_walk_ops *ops = walk->ops;
+	enum page_walk_action action = ACTION_SUBTREE;
+	struct xe_ptw *child = parent;
+	int err;
+
+	walk->shared_pt_mode = true;
+	err = walk->ops->pt_entry(parent, 0, level + 1, addr, end,
+				  &child, &action, walk);
+
+	if (err || action != ACTION_SUBTREE)
+		return err;
+
+	err = xe_pt_walk_range(parent, level, addr, end, walk);
+	if (!err && ops->pt_post_descend) {
+		err = ops->pt_post_descend(parent, 0, level + 1, addr, end,
+					   &child, &action, walk);
+	}
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_pt_walk.h b/drivers/gpu/drm/xe/xe_pt_walk.h
new file mode 100644
index 000000000000..42c51fa601ec
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pt_walk.h
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+#ifndef __XE_PT_WALK__
+#define __XE_PT_WALK__
+
+#include <linux/pagewalk.h>
+#include <linux/types.h>
+
+struct xe_ptw_dir;
+
+/**
+ * struct xe_ptw - base class for driver pagetable subclassing.
+ * @dir: Pointer to an array of children if any.
+ *
+ * Drivers could subclass this, and if it's a page-directory, typically
+ * embed the xe_ptw_dir::entries array in the same allocation.
+ */
+struct xe_ptw {
+	struct xe_ptw_dir *dir;
+};
+
+/**
+ * struct xe_ptw_dir - page directory structure
+ * @entries: Array holding page directory children.
+ *
+ * It is the responsibility of the user to ensure @entries is
+ * correctly sized.
+ */
+struct xe_ptw_dir {
+	struct xe_ptw *entries[0];
+};
+
+/**
+ * struct xe_pt_walk - Embeddable struct for walk parameters
+ */
+struct xe_pt_walk {
+	/** @ops: The walk ops used for the pagewalk */
+	const struct xe_pt_walk_ops *ops;
+	/**
+	 * @shifts: Array of page-table entry shifts used for the
+	 * different levels, starting out with the leaf level 0
+	 * page-shift as the first entry. It's legal for this pointer to be
+	 * changed during the walk.
+	 */
+	const u64 *shifts;
+	/** @max_level: Highest populated level in @sizes */
+	unsigned int max_level;
+	/**
+	 * @shared_pt_mode: Whether to skip all entries that are private
+	 * to the address range and called only for entries that are
+	 * shared with other address ranges. Such entries are referred to
+	 * as shared pagetables.
+	 */
+	bool shared_pt_mode;
+};
+
+/**
+ * typedef xe_pt_entry_fn - gpu page-table-walk callback-function
+ * @parent: The parent page.table.
+ * @offset: The offset (number of entries) into the page table.
+ * @level: The level of @parent.
+ * @addr: The virtual address.
+ * @next: The virtual address for the next call, or end address.
+ * @child: Pointer to pointer to child page-table at this @offset. The
+ * function may modify the value pointed to if, for example, allocating a
+ * child page table.
+ * @action: The walk action to take upon return. See <linux/pagewalk.h>.
+ * @walk: The walk parameters.
+ */
+typedef int (*xe_pt_entry_fn)(struct xe_ptw *parent, pgoff_t offset,
+			      unsigned int level, u64 addr, u64 next,
+			      struct xe_ptw **child,
+			      enum page_walk_action *action,
+			      struct xe_pt_walk *walk);
+
+/**
+ * struct xe_pt_walk_ops - Walk callbacks.
+ */
+struct xe_pt_walk_ops {
+	/**
+	 * @pt_entry: Callback to be called for each page table entry prior
+	 * to descending to the next level. The returned value of the action
+	 * function parameter is honored.
+	 */
+	xe_pt_entry_fn pt_entry;
+	/**
+	 * @pt_post_descend: Callback to be called for each page table entry
+	 * after return from descending to the next level. The returned value
+	 * of the action function parameter is ignored.
+	 */
+	xe_pt_entry_fn pt_post_descend;
+};
+
+int xe_pt_walk_range(struct xe_ptw *parent, unsigned int level,
+		     u64 addr, u64 end, struct xe_pt_walk *walk);
+
+int xe_pt_walk_shared(struct xe_ptw *parent, unsigned int level,
+		      u64 addr, u64 end, struct xe_pt_walk *walk);
+
+/**
+ * xe_pt_covers - Whether the address range covers an entire entry in @level
+ * @addr: Start of the range.
+ * @end: End of range + 1.
+ * @level: Page table level.
+ * @walk: Page table walk info.
+ *
+ * This function is a helper to aid in determining whether a leaf page table
+ * entry can be inserted at this @level.
+ *
+ * Return: Whether the range provided covers exactly an entry at this level.
+ */
+static inline bool xe_pt_covers(u64 addr, u64 end, unsigned int level,
+				const struct xe_pt_walk *walk)
+{
+	u64 pt_size = 1ull << walk->shifts[level];
+
+	return end - addr == pt_size && IS_ALIGNED(addr, pt_size);
+}
+
+/**
+ * xe_pt_num_entries: Number of page-table entries of a given range at this
+ * level
+ * @addr: Start address.
+ * @end: End address.
+ * @level: Page table level.
+ * @walk: Walk info.
+ *
+ * Return: The number of page table entries at this level between @start and
+ * @end.
+ */
+static inline pgoff_t
+xe_pt_num_entries(u64 addr, u64 end, unsigned int level,
+		  const struct xe_pt_walk *walk)
+{
+	u64 pt_size = 1ull << walk->shifts[level];
+
+	return (round_up(end, pt_size) - round_down(addr, pt_size)) >>
+		walk->shifts[level];
+}
+
+/**
+ * xe_pt_offset: Offset of the page-table entry for a given address.
+ * @addr: The address.
+ * @level: Page table level.
+ * @walk: Walk info.
+ *
+ * Return: The page table entry offset for the given address in a
+ * page table with size indicated by @level.
+ */
+static inline pgoff_t
+xe_pt_offset(u64 addr, unsigned int level, const struct xe_pt_walk *walk)
+{
+	if (level < walk->max_level)
+		addr &= ((1ull << walk->shifts[level + 1]) - 1);
+
+	return addr >> walk->shifts[level];
+}
+
+#endif
-- 
2.39.2

