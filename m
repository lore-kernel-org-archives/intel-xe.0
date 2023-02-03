Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4F3C61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E25610E09C;
	Fri,  3 Feb 2023 20:25:43 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D28C10E189
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455941; x=1706991941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xDP0oh7jTFRyqmIKcWBcih8TQCJcXx4CtJX1mmrGkjk=;
 b=Cnvrc36CC2ryFqVXvpYEzGkkkDihzGChvJ6HMF5T8VJkeLgW3kzFC1z+
 Hak668NDKHmsK297bZGMAYpJ6YZegAArrP2SS9Ln408RYnPPJbKqXP7z4
 uc5d/hg1zsQrojSrqrgEJRfJsz8gGq5a+44KCzZN7Hz6vhKQpDiw8Ucu5
 0zntE8hqw7ZmW5E4YioWtH36IlfqqT6PkNJ311l5jdj/H28zU8ZlrQ4Gs
 8KnSYmcWW3dCWXwiwHLx9hrBTLCSr8pmzbDER9dr94gq3QJzB9qPCqxDX
 yruqvttcGIkYI9pipbvOKiKV3w/gYe9c6HAkgDdrcTyNDoX6UpFVMFrOp w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312503175"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="312503175"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:25:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="789809160"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="789809160"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 03 Feb 2023 12:25:38 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:25:34 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVDMnx9wKNXk0a4js1gNgBKoSWg8V2dNhaujU8kEbFKbE+xdYqljrC7igkafuKDuIaiwlU20DAUc+TFKiprx4R+dHczLneEblCpjwRcflhk1oUdng/+xS+Q5SdjhxT4X/1PsesOzvnGQDqirvixyV5BJ6bQK+Z1oPr0pJMy8ooTHBHfWOuQIs/aIqkRwbb4OtkHy8mk0EvLmrZSI+z+LnuVJN8LDcimp2SufARlr9AkcrNPRO/CR08iYw3aXNlYrXRKz4TG5XKaUW7u5mdZe2v5IzCTvxdMbL299OtCvAlJ7894nJtLnokc1vngFQu9BnxMzQGyks6ao9etgxBum1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h18y/zhxFxNwMff9iUcTuUEfs2u+1YavatEzPjdvY0Q=;
 b=aO4luDp6iHfFnUj+uBD6l2hnQV+nNGZIK/Yh2TvJbowVYp3ea6YYmmdFNfAAkV5smQRRWBZn5r7/fM2XpWQQUOykROqdiDqhWAZu62DEentMjsrVovfL6yNcCStHaSkcyN9Lnv/QD18wHcc6MktixwGF0D8Of16Y0oouL80zoaXen1CGsXOoX7asUdy9WTvtUgGAr5jBw6qcQNwoCJfHRi4iu8+ChqXz+jmk5E7IfhN5cVpVhStdJGiM6D8G2ZnhU41lhiDywd+EY/RWhVvyDTujS8wIdXVO+w6UQZWeiWxb1wou4Ix7c/QsS+7wjt/xQ+GM7aVveQv7RvMZ0yPo7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Fri, 3 Feb
 2023 20:25:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:25:32 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:24:07 -0500
Message-ID: <20230203202409.577032-21-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: de7b995e-c457-405e-6b11-08db0624cc6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hArHSDgDx1DszyCymZNa3wSLXvFKhFPMPl9M1X7F/pCpEpsq0QBh5nG6eeOzszdNV9e7LrcnF6dgBsGccYuUAz+r/rGKPZrgVqLXfi9UnEg26qFF+rN5mJ/2FZbym7Mec2KcXKU7UzcEo/SZ7nDzsYDsV9KVanqnfMTPJI9yD7X194Ztr3CjepoTggTI5Fziy3zueTewIQJLHUm8ylgVRLiyMblFqrE0AkznmNkGL5D//LSPowURzDvsxnBD8LMPuJC7IhGB+alD+zGlk+NPP6xG6cZX3x4F0qnPV4w4ITaXlUlsX5u3A0p53iBZbK4QU4Pc6iFksv860C+uKc1v6Q4upRves1hQMV/SYm9RgC4H+5rbqz7SqFgN1+Lb2stFDNxkXMCWF4stzNPK3PpE284TzUbutZmYm7sYueMsqnEV+LEQN8FZSRpxO9pQOpQLunNPZx3/A4q0vtjFn7c28fHGxrevPlJBcazw2DrpraVU4k9By1mikPc9MAJ26calt6tvTpeKaRnZTm2DdA/ncMIDfWtaqFGTxpXMudIZ4SY+FfE2IwcoAMyI1X/tz1UwoIKHNSrbi7EmAuTDvAPI7INyXzrn9cWoH1Ma8rr2VQJpH/IAtPYwfk3ULEhxnphCtB65C9TnTegmv1MkrMz5dA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199018)(82960400001)(2906002)(186003)(6666004)(6486002)(107886003)(6916009)(26005)(478600001)(6512007)(66946007)(316002)(1076003)(6506007)(54906003)(66476007)(8676002)(66556008)(4326008)(41300700001)(44832011)(5660300002)(38100700002)(8936002)(2616005)(36756003)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EkjgNKsO4VnRmrYbcPboMF0+UIgAgc9/nusRqzAcXupNmaSiFl0OMrzT3E9e?=
 =?us-ascii?Q?Jfp4DVpwRVSJc1fMmkaNWx/AFf8VhSRFIjskVw9FwLYW8dz+VT6sMIOyFd86?=
 =?us-ascii?Q?umq2BX4NT5wlfgW8ZKBJpC7kXFYop94dUcXcSdYRx4uMw49LSX0sxg+qadVT?=
 =?us-ascii?Q?DazAQNTVCgzDe7NYNHsixnKHQayFskJJQVPLXjfbOruOxOEK9LRtFUwxmZ0i?=
 =?us-ascii?Q?35eUOnpgm8V2ZztdbykHIaM0OJnPzK2/zOd8w7hZgjWl3mA1lriaO3+B85pq?=
 =?us-ascii?Q?b5KoiMunr0z3Pwb8HSZIkbuOZuBu/FoJrTVSgBbRDise/f2uMp5QhpzmUCp5?=
 =?us-ascii?Q?Gy5I+K3R6CTOZEmsrbqKFWILNZAo7wgItMsGs5Zzos+ZdFNWoVjxLC8Zasd4?=
 =?us-ascii?Q?mAh78YDHkdXBslji9iY1vPIK7Hqj+EjzD+zjMeFWWrbawvs+t0CGrktDyv7E?=
 =?us-ascii?Q?1kwDEQoucvVBmkgdMk7e2eRgUMMUJeMLZq5dxAKUKvnIyOvAMezrLH50gOAB?=
 =?us-ascii?Q?jhlUTd9XFBCKUUDuKxyvivEys+HdJMF7uEj48p+E9oWTI1HJRDgRhIHM5zdT?=
 =?us-ascii?Q?uRrnpHc8+7z9eE9aejsXnWu1DETVFJupkJkqFvQiPzDVEN5JYvhVP5K07H7+?=
 =?us-ascii?Q?aqfe9aSR7Mi00sxHkA9kLc5J7dzFtMKtX+QkI9mY0eyikp2vE/BE1RwIUnP4?=
 =?us-ascii?Q?cMCgJrWlWLwvfj7A43gRQ0QXqESIu6C2PKLzZqnL6sk+6W1LUOsbUqEFDRcV?=
 =?us-ascii?Q?YfAar4oybqE/EfxRY7C7BPx8PJl//wDnQNyxdiDq8tCccnxlSp58jnLDpZjs?=
 =?us-ascii?Q?ZdgYR4i0fdXojbojcIvESBUfV5taG6q64oB7X4QKXSMqonjDmjEP4rHsh6sd?=
 =?us-ascii?Q?eMaTQ7h0Tl2QhOF660OE+EMNoRutrLoVTLpcWOXRscTaW2eYWCWlXj8/dAU8?=
 =?us-ascii?Q?ItImMqL4x+FRxEYmNRRWi5XQWjkLXzUEffcKHRnDpJf1LfwXMNndwJgxOlEw?=
 =?us-ascii?Q?dl0qxm1zt6LD2Pe6yUbbQSvC+X2/GWmz4h/IkaMzySHZvXFNYqKbbSphFbqM?=
 =?us-ascii?Q?fty8oeXYDEWfULcJC0HAydOLd3JFXMuCwoE9vOrnZf7yiGDjwz0I2C4arqi+?=
 =?us-ascii?Q?4LdUwNi7o9goRE9QQPTCX0HoY9tYTkFL3VmfrPqCOKXwGbv8NhNn72AEgyAD?=
 =?us-ascii?Q?RgBiUnXaOe4xbLoQ9v8rWIv4ygAun7NxBd2LWznZNHRhTSteppRXw7qpk0MJ?=
 =?us-ascii?Q?4QVYuq2fpI8VJd1GRFCQ991LjPfBSNVFzjjiXOj6ih8Tebxv+EIRF7H/bdwY?=
 =?us-ascii?Q?8qZbjrXO9G5upiO5K5IRKqsnskACU8nt/KXYNktEFIbL5S1kUsiDGbCeQMo1?=
 =?us-ascii?Q?MUOlSFVGrKbFW1rvzWxhwsM8GUdGM02B1Q+hExagiz2L26ww5VycQPnuvTAr?=
 =?us-ascii?Q?tehgWo6mxlHEZDK46YpjGUnsX98i4YreOuC+krt20VkGxxo0xUsLOdzfkiHU?=
 =?us-ascii?Q?0moTg1RQE2Y9nnsC+TdH/jLf/w+LkLkqWzj0H+OSLs6yhRo+u6Nm8A3dSh9j?=
 =?us-ascii?Q?5WC+qkAAZ/4tc7fGk9o1FAqjQfK858B1Kmq0UO4GVJfBaeXSDMK1Iw22FC68?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de7b995e-c457-405e-6b11-08db0624cc6f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:25:32.4013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9w2Qc6AbXD+8rABDKyX/FRvQAirDKMDp0zZJJRCij81DQOfEfIjwZnbU0yC7XrnX7J8406yGg58ORwA8OSVEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 20/22] drm/xe: Add has_asid to device info
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
Cc: niranjana.vishwanathapura@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Rather than alias supports_usm to ASIS support, add an explicit
variable to indicate ASID support.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_lrc.c          | 4 ++--
 drivers/gpu/drm/xe/xe_pci.c          | 3 +++
 drivers/gpu/drm/xe/xe_vm.c           | 4 ++--
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6d13587bfa7b..a8d48987b2d8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -86,6 +86,8 @@ struct xe_device {
 		u8 media_ver;
 		/** @supports_usm: Supports unified shared memory */
 		bool supports_usm;
+		/** @has_asid: Has address space ID */
+		bool has_asid;
 		/** @enable_guc: GuC submission enabled */
 		bool enable_guc;
 		/** @has_flat_ccs: Whether flat CCS metadata is used */
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 056c2c5a0b81..347ff9b34494 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -682,14 +682,14 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_CTL,
 			     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
-	if (xe->info.supports_usm && vm) {
+	if (xe->info.has_asid && vm)
 		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID,
 				     (e->usm.acc_granularity <<
 				      ACC_GRANULARITY_S) | vm->usm.asid);
+	if (xe->info.supports_usm && vm)
 		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ACC_CTR_THOLD,
 				     (e->usm.acc_notify << ACC_NOTIFY_S) |
 				     e->usm.acc_trigger);
-	}
 
 	lrc->desc = GEN8_CTX_VALID;
 	lrc->desc |= INTEL_LEGACY_64B_CONTEXT << GEN8_CTX_ADDRESSING_MODE_SHIFT;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 53e87b27fcde..927a050f3b8f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -78,6 +78,7 @@ struct xe_device_desc {
 	bool has_flat_ccs;
 	bool has_4tile;
 	bool has_range_tlb_invalidation;
+	bool has_asid;
 };
 
 #define PLATFORM(x)		\
@@ -302,6 +303,7 @@ static const struct xe_device_desc pvc_desc = {
 	.max_tiles = 2,
 	.vm_max_level = 4,
 	.supports_usm = true,
+	.has_asid = true,
 };
 
 #define MTL_MEDIA_ENGINES \
@@ -496,6 +498,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	xe->info.vm_max_level = desc->vm_max_level;
 	xe->info.media_ver = desc->media_ver;
 	xe->info.supports_usm = desc->supports_usm;
+	xe->info.has_asid = desc->has_asid;
 	xe->info.has_flat_ccs = desc->has_flat_ccs;
 	xe->info.has_4tile = desc->has_4tile;
 	xe->info.display = desc->display;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 541629293683..7276a375e2e0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1371,7 +1371,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 		xe_device_mem_access_put(xe);
 		xe_pm_runtime_put(xe);
 
-		if (xe->info.supports_usm) {
+		if (xe->info.has_asid) {
 			mutex_lock(&xe->usm.lock);
 			lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
 			XE_WARN_ON(lookup != vm);
@@ -1868,7 +1868,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		return err;
 	}
 
-	if (xe->info.supports_usm) {
+	if (xe->info.has_asid) {
 		mutex_lock(&xe->usm.lock);
 		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
 				      XA_LIMIT(0, XE_MAX_ASID - 1),
-- 
2.39.1

