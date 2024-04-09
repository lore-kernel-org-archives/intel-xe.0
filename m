Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6007CD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 22:19:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451B7112FBD;
	Tue,  9 Apr 2024 22:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DaR6fpxl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FE1112FB8;
 Tue,  9 Apr 2024 22:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712701162; x=1744237162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4cQGh2dr5xnPeIBEbPqHzbUs+SmPu6ijoVXZDH/qICc=;
 b=DaR6fpxlYdzaiiHTRXnAeUp35ahqZ0CN6A+KIMHDh/SEj9Xu5sBxdctK
 t4MrTb7Ui3UerShvjKmwUQNwpbQIRjms5plEN9ah3jbtzYKO+1g0wC8Hb
 sH6t5ClHga4FIMl32gS/hf72GHzIYkAIUDrOkuuvLKXWdajtd0GzgJIxX
 WStOqEcRLRtENSzuAe20/zu3UYayLnIGG70PNs25pNi2HqS/XZFUuPyvO
 kn/2zvE4DEB4RiDuU3rz/pmpe7zJ+aoJO7dM7i5qPU7OywJKseTfuBKqO
 wZ63MW07CyIlcff/7hBRCD7TIZZil4OXbH80Ig1otsBxP3WPmeD5QUnjK A==;
X-CSE-ConnectionGUID: Dcrw96xkTjGKTl/cweoy0A==
X-CSE-MsgGUID: LevhyGYuQJCAc7+fugsazQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8614784"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8614784"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 15:19:22 -0700
X-CSE-ConnectionGUID: ixK6WWvYQFSovwWR1Qqo4Q==
X-CSE-MsgGUID: vASd19EIRUC7he7xiHFhyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="51563122"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 15:19:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 15:19:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 15:19:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 15:19:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 15:19:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPA+0poNIyat8dHw1rK+iqof+HiiF6CkoksGJSTPpwEj38EyNnikdqJDlQrr1/6ChvS0rZe7Mf08p2CBj8kyzCzj2XhFF1Na34x0+1cpFUTqHChiyPi0qoWv80I6T2575lw9MIncXph6qkbY3Wn9w95hRnT4ws0Uudq/k9VBK3XXLDFe3LRdkIXiOsD/96gXHvaQal1XPYrO/bYq7GFRcYiX0aOKFEtf7ga/cIbLwqCe07YpnGW/RXrTe24BuVFqPClikJHYBtqD+9Zb39kbETHq4f/KdXOEr07y2haBdaabGQqe3BbtKnp72pYZLcL5rzGZ+D+mdPiPiykTBMARyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mz9BfNgZVscj4YbtcbPR1GWOF++fUq46Cgg5QtbS3rk=;
 b=M8JER1dm7Px2XwKomeobTefzKvefmfroETmZeyN/2ZoheLAbVQPD9W66PFOF+Lv/7KWH8H10lErAycWH2RiQh37hTGwHnGigtST3scjRmWEIc89+hmVnpdqcCAlLdIszm0ULMRECgMplvKqgGN/ULquHbbfLsA19E+1X8xDAUp8QoQGrer0C0Swi8NqAvtQQC0qfbfay7Iypo9+WMKyxzrvoC5kAak1tUEoJQQQJpy08SGfPzC1wCR68twnUeE8trMq/Hyxo6ObNSzT03YyzKhlmr7mFAHe0WN4Rj7gsyz2J9DN8tbCqa+FvNNRpCN/DUo3KCQcGXyp9oV3t+DGVzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6959.namprd11.prod.outlook.com (2603:10b6:303:228::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 9 Apr
 2024 22:19:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 22:19:18 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/xe_wedged: Also add a simple exec to
 confirm GPU health
Date: Tue, 9 Apr 2024 18:19:05 -0400
Message-ID: <20240409221908.1077893-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409221908.1077893-1-rodrigo.vivi@intel.com>
References: <20240409221908.1077893-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6959:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jdDC3Jvo0W8GH1Rvzm9R3LYqLLRqHgRcBIuVJK/MQkynMTJ487va+bjztoNybMKepYzISvliG6KViUN8ySDI9o4xRztZkxNd+Cunt/KyY/ubx6NozqIP+32nmZ8JfTYdmF9lCExwuwY5VtvPR51a4b5v84cnQ2YEt4vufU3xhb6HOyXNzlKtjqsTHyWQr+pBLv5iKDibv4t29mawITGUokANJAZJEpKn+7/RPBCSSkVlTb+sNVzjNX4yNrHVd0p3x3KoWYPuu39gx/D3GWn8oquaMEuHx/eYR+1Hw4GeOfLgQz6la9Dhw1xC0793lCi0VoofqNNvN5CBVvm/1cZX3N0x7iYRo115ZCZuBvn5b66IP/HCR1OkxjpHeo5bgIapT3sVIC2nD6AkR6siUThCsYwl/wjgPi4xKbERDcFRaKzf/Xmt2Z7VmUCWGJEkHLORu0tPROgQzsd2o3PVOwWoAJejjtwNMaH2jeVCZHv18XBiQLY41HuSLjotpT0wLuQFQfYqsrlSbru5GJUZbGC2QkAuiVfqKX8s7n1rX02+7Sd446VACce1ek8IaSF4lfi0Ae5iOIQuyV1E61x1xUn3wieEN4cVAZiPmf1FtOQGcHIt8UXqlUTm/EhDunLNg0fkR+s+fjVk1Dk0K/Z/3CnClWdR7/4XwE3/LqpLn4X+GfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QnR7MJnRDGCjBl4shBAQkww0qDFJFPsG85+Eglr0+ZjbbDmC3pxZTaLGnn2f?=
 =?us-ascii?Q?iaQev0CSU6K1o+l3lSMHik41Wz4Dkc41zQFD3XUZz7vCxYlXoSwRgsalQdPO?=
 =?us-ascii?Q?j3HH2O7y3W0r8Rm2EkbDgn4qcAWqzXMm2rDvXyn0nDpFKzXTeIdXV/SQtsap?=
 =?us-ascii?Q?VZmNCbcpVLimXqt7xQrpgzTMd+AduqA8RJfK+J6X7YqC7xG+/6b2x6n83kIC?=
 =?us-ascii?Q?4roohe5JPtF7MeFzzucN8Ju58TY97Prbe3CzBSx9YaykKWO+5y16bfWAPRnN?=
 =?us-ascii?Q?DfN377QHzL1PoUecZIqQ8cTe/WkDt4WZ5/qTcDKuUgVTE7RiK2yMwbKhwfzT?=
 =?us-ascii?Q?h+gbIYOx9lrv8UT2r7DtYOTEyWrOIYrhXHdmvRw2Za88dyZOvgTp4SXFUWVR?=
 =?us-ascii?Q?WGM5EzA0zMrjmHSrp4L/EOL4P15dLDPJpcG3BllJjiIJSUcEjHbs5RLKXo4M?=
 =?us-ascii?Q?Jpu3fuW53K9e63yqCey6mjtpmHViAe1OrNTx9X0mrRDeFWzaUnQpZt7XxaZg?=
 =?us-ascii?Q?D0vsqOz4EDuCphkbR1fv2t8oI5eyNp6sdcHeslr4pg5sGTXQ7RxDAeC752sd?=
 =?us-ascii?Q?qr8sPfdJ5pAM2svdwDmIK2zZJN7qyYQDpp6wBlafk94dETipBod2pdAS1k3L?=
 =?us-ascii?Q?qUQ1BWaw8vwUfNeV66XIh8U7fUzTZNYioh0lXdxvy+9VtiIfFKiP6pnEYJWH?=
 =?us-ascii?Q?almoZprbkXNup67kJDsskr7zysKOkShnYaTUMwuUqcFk0nrSjaNuHUTjEgTp?=
 =?us-ascii?Q?dAuh/yLmvobolx/ouMMYmyu3irHbv7eMA9eAcG7iBb4W0T6a4M/88M0PphUF?=
 =?us-ascii?Q?nAb469UkwwkGynCzQYmSHivgkjBeO7vIvyCk1wOipEbmWstf7TVFI7MlG7nn?=
 =?us-ascii?Q?vCNBSJLtKDEQvovHOCUuVRy+8fC4WsLbGjj60H03pcN1P4RyKEfQFcnDeIVj?=
 =?us-ascii?Q?BNnKAaFx/hBwaBxrXpR7hIm+Au3CRALHVP+XbNSONzfErDxNHo9HreADzG/t?=
 =?us-ascii?Q?Rzf6L+RpNZC4dY9rRYlAxw2loYMJ5cE5z1xlkmPmRhxeLjliiv3rQUs8Fuvk?=
 =?us-ascii?Q?lFprzfAEWbqvMXVJ0+Ec02PQRr/gMtdEzA1/g/OOOXjQ7UnSOHJ0FG7I+i6T?=
 =?us-ascii?Q?D8WJ0tlzNO98lAlSxJagQDEucsLR7rt51Vj9plsHz2Z7J/9ksfIybzBl5+WE?=
 =?us-ascii?Q?3YH1+ZMs9HxTorTUmlg2d66/gcI3NCcmSvfBLUzQjAXt2bdRe/dYCZEjdrtV?=
 =?us-ascii?Q?AmvrhzcNB+XYZYepgADqngR9F48SIcornKsVB83vOx7avDTSKOs0A7HeOOtM?=
 =?us-ascii?Q?zqNK+KBw3dLEs1kAi/QLYrP0f0Hj8oEzmrD7Um6ISBGF2GgHPCfHT0u/gGxh?=
 =?us-ascii?Q?wKEWi73fYP/9ruXGXhtpiei+GtwP19+aNXsWw0rC+HpSMSn5OH7hzQSFaeAt?=
 =?us-ascii?Q?hRXQsJzoM+k84CB/7noyL8ASRE4kA54RjDOnqwDNqS5xZpyX3a3H7fOjoIWg?=
 =?us-ascii?Q?r7lqomhN3gRmsD5LVSrT/2w8NOjFBHEX2G78ScOJG9FfPDPxJ5ZOfeteWixF?=
 =?us-ascii?Q?aEn5HhDcqUKFKJ1erfsdXhf/oLsyMqXzTki+aG8ZUtG8kRw4Yrq8up2UcEvk?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 292cbef9-afc0-4206-8527-08dc58e3190c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 22:19:18.2860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DrUtF2ab2kNwTnT948UMv6x4HxuGDo1s2bIt/sc7BUFazo8ijiG90+b8wv/4SzBdIxPyYmLmuOqQwNs4aqOAMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6959
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

Besides confirming that the rebind puts the device in a state
where we can send IOCTLs, let's also ensure it can really
perform some basic exec functions.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_wedged.c | 90 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index f2587cc43..ab9bf23d5 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -17,9 +17,13 @@
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_kmod.h"
+#include "igt_syncobj.h"
 #include "igt_sysfs.h"
 
+#include "xe_drm.h"
 #include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
 
 static void force_wedged(int fd)
 {
@@ -75,12 +79,96 @@ static int simple_ioctl(int fd)
 	return ret;
 }
 
+static void
+simple_exec(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	uint64_t batch_offset, batch_addr, sdi_offset, sdi_addr;
+	uint32_t exec_queue;
+	uint32_t syncobjs;
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int b;
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	bo_size = sizeof(*data) * 2;
+	bo_size = xe_bb_size(fd, bo_size);
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	data = xe_bo_map(fd, bo, bo_size);
+
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+
+	syncobjs = syncobj_create(fd, 0);
+	sync[0].handle = syncobj_create(fd, 0);
+
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr,
+			 bo_size, sync, 1);
+
+	batch_offset = (char *)&data[0].batch - (char *)data;
+	batch_addr = addr + batch_offset;
+	sdi_offset = (char *)&data[0].data - (char *)data;
+	sdi_addr = addr + sdi_offset;
+
+	b = 0;
+	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	data[0].batch[b++] = sdi_addr;
+	data[0].batch[b++] = sdi_addr >> 32;
+	data[0].batch[b++] = 0xc0ffee;
+	data[0].batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(data[0].batch));
+
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].handle = syncobjs;
+
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+
+	syncobj_reset(fd, &syncobjs, 1);
+
+	xe_exec(fd, &exec);
+
+	igt_assert(syncobj_wait(fd, &syncobjs, 1, INT64_MAX, 0, NULL));
+	igt_assert_eq(data[0].data, 0xc0ffee);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	igt_assert_eq(data[0].data, 0xc0ffee);
+
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, syncobjs);
+	xe_exec_queue_destroy(fd, exec_queue);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: basic-wedged
  * Description: Force Xe device wedged after injecting a failure in GT reset
  */
 igt_main
 {
+	struct drm_xe_engine_class_instance *hwe;
 	int fd;
 
 	igt_fixture {
@@ -96,6 +184,8 @@ igt_main
 		igt_assert_neq(simple_ioctl(fd), 0);
 		fd = rebind_xe(fd);
 		igt_assert_eq(simple_ioctl(fd), 0);
+		xe_for_each_engine(fd, hwe)
+			simple_exec(fd, hwe);
 	}
 
 	igt_fixture {
-- 
2.44.0

