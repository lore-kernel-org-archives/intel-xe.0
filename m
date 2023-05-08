Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1395C7EE25
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:08:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B299D10E046;
	Mon,  8 May 2023 21:08:46 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30ED710E038
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683580124; x=1715116124;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=gl6lqM2C1UihlTrAAHOfwPeDOPNBQ9zhTEJT/auJINo=;
 b=NXsvX9tS8jrCGY9La71M3hH9vSghsbSqu8JsKkO9zVfRIoLnUuPt5+zw
 yMM6QygEyMLUsPI8wOb6XXh5o2Sbx+TFBg3SYXi2BVw2CHfQCOf8u47qL
 5/nHqJvhR7FFuyZ+UHdoo6C6SRqbNQvAsIkAOMS00DTSaX+UJZOp84Erg
 2LV9FAvcrQyzQDAWSri3LSoVSwOfa/9izf8fOLdjiF39jwf2Fcl7mpKEB
 PL6OqtlgVnEH2rwZDVdPM37nwCIHw4dae7ZanKF42hbHM70i2ul0n98Jj
 lwXS/fjZLxGCfTNdtNFnIsGsRVHBpSb+F4OJFfRjMolYutVSfnqyeMelS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="415319274"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="415319274"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:08:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="649029207"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="649029207"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 08 May 2023 14:08:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:08:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 14:08:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 14:08:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/hnxJKFxLXj8Xvnb4iZR8JybXlykSPOzmxmPsHNW+vW4NYX6+fIed2xPtdPxw+T1ZCZU9N0yixQTqmRGGqrdJwBxENolsD1a7LiiPYcdOs8cLIF3WsBwMtFiKofyGcUattxCyww3V50hecbjybV7IK6GpePd8wZYQNMdTjSlO9f6nukRIAqFt9i2YrtDdLnpt428GxuAU/ev2TWNuNISBuhtKgnfLpV1EaBS8fG+zO91j3y99ORzaBUdwuNoP/0WpOmurBQrT8wkC61amiLsADx8HfsmUOACiXl+/wngveqFypVf8ga+Ey6nn3a0o+N9E46K4vLywO8JMWoIJUZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6ylVQuxjTHptSTilOOepUp44ryLc3sLpViwpAfg7IA=;
 b=XeLIGo1Uud97CotEoSeai90TYpbuBDEQqEK4VGVHx1lLh/HECCXliGCw/rK0B3MAEqmU/i03syVJ+z5TaRwxltGVCH2nAMLcFbg2YCcmQ8VU8omeWscnb9NzoctFyIf6a1ew3uykTCVcRd4ET8duwKRV6cy07oFbtjsVQ+np6z7SZAqNYHjuN9GqEWqp8HbHQ8eF4E1FIg4oQqWrxZX2rMUghGb0QnI+8YeJ2kdrbPnL3+jSQh+Y8+hTYWnDyG9+x3QJhxVvV7x7jtYNtxQsdN2WMrZk9kwpFjtc74nB009Flq4FWsg+c2b2r61PHo4FrQfqMpfd40+llZ4tf7HhyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5883.namprd11.prod.outlook.com (2603:10b6:303:19f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 21:08:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:08:33 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 17:08:15 -0400
Message-ID: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0237.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cffee6e-4ac2-42f1-e1fa-08db50086110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o0fL/X+UXonn1JmFERlEZIy7tIA7f1PEDLM+6h8QW/Ooc78VTBUfikNh0ZwhHmoiFpjHlLIigJU+YHjMo0nqpOtvT7J4uARfb1QUdfIO3MEthdgc9MmQmLSLgKfF0HFc/emu9CPJUna5rd91yziKuxx14Tz/qfagzFAvLe+qOzIKZH8I4iNOwPoxVyV+z8lN1X+9SFSi8crKTWx0wHHG+OM/akoRfKPicVs2Z67yYv5zfaeBjFrGTgDMBUSU/ShfVYbPcJSE3AOL0Elu95mpCcRhPewnWhC+HqOdAABafITlc3F1oODrRJTNafyrzYf9i1LPOgObQ2AyDbKEEQWpp4/Gz/RVD7VGGnkym6MGWXwGUiRW13IHaF1DUuFE7EBGe4Sq0Kl80AESAgKe+cSXSpc1w8kVeT5qkaFyNOLgiWv21GjEAHQnW9opLBngQBuLowNh/leDa6YY0JxKnKhKaAH5NWpQdTy6gSNkNe1nw4fc71k7kl6YoBtj23OK2ihRn7CPiHmZ5aewI9PubzdCu5B/18lgwo7cUxi68XjlfVQmPD+7R7MPA4wT9Wu2mSsn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(66574015)(478600001)(6666004)(54906003)(6486002)(2616005)(6512007)(26005)(186003)(6506007)(1076003)(4326008)(2906002)(30864003)(44832011)(36756003)(38100700002)(6916009)(66946007)(66476007)(82960400001)(41300700001)(66556008)(86362001)(8936002)(316002)(5660300002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEVyaXEwZHMxdDkyeU5NOFY4YThvdHJlVy9xWGFyNzU4UldlZHp6d3pyUnQ3?=
 =?utf-8?B?Z3c0VC9wNm9aTm5LV2ZUOTA2VzhuNXA2RjlGR09PWC9UbzF1WktvVHRlUmMw?=
 =?utf-8?B?UFhJKzdjUkhsYjJmR0dDSmRUNmNNRkZ2MXFXWWVqN0hOQjhFbFpCajkyUVY2?=
 =?utf-8?B?aHVMYldWOFVmRDAyWThkK3lCUURidXY1K0Z1NkhxMEE1TlY5TnljaTlJeWIr?=
 =?utf-8?B?RzhwMW1MMHlyR3hQV2ZncVhuOEZDK1RWUVhETWZ0b2Z6OUg2NjZnVXYrWWdt?=
 =?utf-8?B?VXJtMW9BZUd0clhTM0dMaHFGb2RNK1owQmxGajNadFE2dWY3V1R0YzVCaVdP?=
 =?utf-8?B?bVhHNktZRVZFeWtUZzJTeEZJY21tM1M1elNienk5ZUUxTDBDbTE0MUZtOHNj?=
 =?utf-8?B?TmY0OUY1eFRYYXliWFdpMEM2RWU2MTNKY2tiMm9YQnJCZHZvcXd2T0JIbnZu?=
 =?utf-8?B?NktDZTZTVjBPQTI4VVdwdENrbTBLN1dIVllMYUVsd0l3aXdGT2g1RTN4blJM?=
 =?utf-8?B?N21EL3BMVU1KSUt6dWo4UUtRaHBXVXlNZnNrWi9VeFprZzZPcXgvQUcrVjh2?=
 =?utf-8?B?L2pEYUlHRlUxT2NyTTE1TElqT0pCNEhpTFFEK2NobHFQbFNuWlFsNzFxVmlV?=
 =?utf-8?B?R2xaeGp5WjJFaE80SUdsVnR4ejNaOWVVb1RDT0VpYmFJdXJ3aUFRa1IwVGVE?=
 =?utf-8?B?Zng3TW1zUW9pOE5ReDJ6aEJoemRkSzRxOWtzN3hhNGxNRnZyZU5RVlQ2WjVt?=
 =?utf-8?B?NERkeHErVklGdENBWmpYVmtLdG9ycER1SFpESGpRcEVGZDNHSjFVUGRoVjdp?=
 =?utf-8?B?di9mM0FVdGpWNUhhSUFDNUFBcVd1QmxXRVhOTmdQeUV1cWcrTE1JSWViRnY0?=
 =?utf-8?B?YVV3TElSdExjUGpSSjFxdm1ncnZQcHRiT3ZNbHYvM3dDWHlnei9rTnA2NUd6?=
 =?utf-8?B?UFhyYWREcVlTNWhOOFdLZitYMjVIbmtmR3JjdFBqbTBQT2dFb3ZrbVFabzF2?=
 =?utf-8?B?ZnBsYzFNWkFFV1k1SUI2Q1dMS3FPK0Z3d3c2MW0zWVJLQlJlNzY3UXlyRGhn?=
 =?utf-8?B?L2p6L1QrUkZOd2tJOFNyaTNYaU5VUzVNeE1ZcldPU3RsaWZiR3hqNVdmcXRp?=
 =?utf-8?B?UUQvbEt5MW9oUHBUaDZTZDZpS1BGVjNRdTAwQ1N5dDdZUnNaN0pKTlJNR3JI?=
 =?utf-8?B?RWo0Zm9zNitZNGlrUmZvL0puRHhpR2xGdC9wRlU5aUZTR3luZi83Wk1rL1BB?=
 =?utf-8?B?VldZd0RRWXpHNjQ4SFNKeFRWbDEzZm5DVjNWM2tRTmxsVmJ1RDdsQ29xWDRU?=
 =?utf-8?B?TWJBcDBybWlTejEzSFFrR1o1SDRxQ3VFcEw3ZWRaelZZT1ZQUE9RVG42dWhi?=
 =?utf-8?B?NmdxOWtJVkZZMWZuM1lCbnhIUVVCUWNMSmFHSzZkS1JUcVUvakQ2S0RWazNX?=
 =?utf-8?B?Qk5ZRGhMY256cWVGZzFPZHpZYXBmSXF2RUh3MFJwT2VDcER5SzE2czM3SWFj?=
 =?utf-8?B?TXRhaklud25xM051aWtPdW9TSGFzcGFDQjBzQmRlSHpiQkVDYU8xY0k5bm5N?=
 =?utf-8?B?c1c2Qm9DaS9BWDUwZUZTdDBXUmE3SGxUVU9iWENBeVM4VzB0UFhHR0FDckwx?=
 =?utf-8?B?TGFHdHFJRDVBUngvcXZKQmEyQWJxM0w5eWlFWTJKVml3WUd0NFZEMGlBRXRi?=
 =?utf-8?B?TitpWGtvZzhlWHZBMFBOanlpdW9QVFlnb3N1Sm5iQ2lwUE5kb1VXMllsRTVu?=
 =?utf-8?B?RlIvZGoya1cxTEl5NXlkYTZsNkdRdmVWaDltZDFVOC8vWlVzNnV6VjZOMHN5?=
 =?utf-8?B?bHlielF6WHhqejdpWmNmSDNGcTYvTDN1dURraDk3UDR3c2xIQ3dYWFRyQXpU?=
 =?utf-8?B?M0lGczdVSmQwS1hhM1dLV2dZdlNyVGNOdWNobXJmLzYzUGNrOG5HUGU0K3Jp?=
 =?utf-8?B?dFRrS3lhVERhNlErTWVCbkcrRGRDOE9odUQ1eFNwcVFja1dybTN0ZlI1TVRi?=
 =?utf-8?B?RlkvRkhzSkNSR3ZNTVJyMmN1T1FERnlCL0JXenNJR3RHdFUyWmtBaXEvaUo1?=
 =?utf-8?B?aWszeUFVamtPNVRraVdGeWVWaWNGL3NBd0lUWGJqV0VxVDE3V0FvVG8zK1p5?=
 =?utf-8?Q?D/O20Vg6vPS+AAQdmmnIqU6PC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cffee6e-4ac2-42f1-e1fa-08db50086110
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:08:32.5036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVA5y3HXCbRrQq8KA3DBr9PLbZpLv6qDXgqJnCNapjWm7rKrypWv45T4hufU07VmglrU9r2+rZZBkqsGbGVrag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5883
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 01/11] drm/xe: Introduce the dev_coredump
 infrastructure.
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The goal is to use devcoredump infrastructure to report error states
captured at the crash time.

The error state will contain useful information for GPU hang debug, such
as INSTDONE registers and the current buffers getting executed, as well
as any other information that helps user space and allow later replays of
the error.

The proposal here is to avoid a Xe only error_state like i915 and use
a standard dev_coredump infrastructure to expose the error state.

For our own case, the data is only useful if it is a snapshot of the
time when the GPU crash has happened, since we reset the GPU immediately
after and the registers might have changed. So the proposal here is to
have an internal snapshot to be printed out later.

Also, usually a subsequent GPU hang can be only a cause of the initial
one. So we only save the 'first' hang. The dev_coredump has a delayed
work queue where it remove the coredump and free all the data within a
few moments of the error. When that happens we also reset our capture
state and allow further snapshots.

Right now this infra only print out the time of the hang. More information
will be migrated here on subsequent work. Also, in order to organize the
dump better, the goal is to propose dev_coredump changes itself to allow
multiple files and different controls. But for now we start Xe usage of
it without any dependency on dev_coredump core changes.

v2: Add dma_fence annotation for capture that might happen during long
    running. (Thomas and Matt)
    Use xe->drm.primary->index on drm_info msg. (Jani)
v3: checkpatch fixes

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig                |   1 +
 drivers/gpu/drm/xe/Makefile               |   1 +
 drivers/gpu/drm/xe/xe_devcoredump.c       | 150 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump.h       |  22 ++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  47 +++++++
 drivers/gpu/drm/xe/xe_device_types.h      |   4 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |   2 +
 drivers/gpu/drm/xe/xe_pci.c               |   2 +
 8 files changed, 229 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.c
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.h
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump_types.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index f6f3b491d162..d44794f99338 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -35,6 +35,7 @@ config DRM_XE
 	select DRM_TTM_HELPER
 	select DRM_SCHED
 	select MMU_NOTIFIER
+	select WANT_DEV_COREDUMP
 	help
 	  Experimental driver for Intel Xe series GPUs
 
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b6c41cd7dbe3..678c9d84e50e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -34,6 +34,7 @@ xe-y += xe_bb.o \
 	xe_bo.o \
 	xe_bo_evict.o \
 	xe_debugfs.o \
+	xe_devcoredump.o \
 	xe_device.o \
 	xe_dma_buf.o \
 	xe_engine.o \
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
new file mode 100644
index 000000000000..b1b4d2f10c7a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_devcoredump.h"
+#include "xe_devcoredump_types.h"
+
+#include <linux/devcoredump.h>
+#include <generated/utsrelease.h>
+
+#include "xe_engine.h"
+#include "xe_gt.h"
+
+/**
+ * DOC: Xe device coredump
+ *
+ * Devices overview:
+ * Xe uses dev_coredump infrastructure for exposing the crash errors in a
+ * standardized way.
+ * devcoredump exposes a temporary device under /sys/class/devcoredump/
+ * which is linked with our card device directly.
+ * The core dump can be accessed either from
+ * /sys/class/drm/card<n>/device/devcoredump/ or from
+ * /sys/class/devcoredump/devcd<m> where
+ * /sys/class/devcoredump/devcd<m>/failing_device is a link to
+ * /sys/class/drm/card<n>/device/.
+ *
+ * Snapshot at hang:
+ * The 'data' file is printed with a drm_printer pointer at devcoredump read
+ * time. For this reason, we need to take snapshots from when the hang has
+ * happened, and not only when the user is reading the file. Otherwise the
+ * information is outdated since the resets might have happened in between.
+ *
+ * 'First' failure snapshot:
+ * In general, the first hang is the most critical one since the following hangs
+ * can be a consequence of the initial hang. For this reason we only take the
+ * snapshot of the 'first' failure and ignore subsequent calls of this function,
+ * at least while the coredump device is alive. Dev_coredump has a delayed work
+ * queue that will eventually delete the device and free all the dump
+ * information. At this time we also clear the faulty_engine and allow the next
+ * hang capture.
+ */
+
+static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
+				   size_t count, void *data, size_t datalen)
+{
+	struct xe_devcoredump *coredump = data;
+	struct xe_devcoredump_snapshot *ss;
+	struct drm_printer p;
+	struct drm_print_iterator iter;
+	struct timespec64 ts;
+
+	iter.data = buffer;
+	iter.offset = 0;
+	iter.start = offset;
+	iter.remain = count;
+
+	mutex_lock(&coredump->lock);
+
+	ss = &coredump->snapshot;
+	p = drm_coredump_printer(&iter);
+
+	drm_printf(&p, "**** Xe Device Coredump ****\n");
+	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
+	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
+
+	ts = ktime_to_timespec64(ss->snapshot_time);
+	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
+	ts = ktime_to_timespec64(ss->boot_time);
+	drm_printf(&p, "Boot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
+	ts = ktime_to_timespec64(ktime_sub(ss->snapshot_time, ss->boot_time));
+	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
+
+	mutex_unlock(&coredump->lock);
+
+	return count - iter.remain;
+}
+
+static void xe_devcoredump_free(void *data)
+{
+	struct xe_devcoredump *coredump = data;
+	struct xe_device *xe = container_of(coredump, struct xe_device,
+					    devcoredump);
+	mutex_lock(&coredump->lock);
+
+	coredump->faulty_engine = NULL;
+	drm_info(&xe->drm, "Xe device coredump has been deleted.\n");
+
+	mutex_unlock(&coredump->lock);
+}
+
+static void devcoredump_snapshot(struct xe_devcoredump *coredump)
+{
+	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
+
+	lockdep_assert_held(&coredump->lock);
+	ss->snapshot_time = ktime_get_real();
+	ss->boot_time = ktime_get_boottime();
+}
+
+/**
+ * xe_devcoredump - Take the required snapshots and initialize coredump device.
+ * @e: The faulty xe_engine, where the issue was detected.
+ *
+ * This function should be called at the crash time. It is skipped if we still
+ * have the core dump device available with the information of the 'first'
+ * snapshot.
+ */
+void xe_devcoredump(struct xe_engine *e)
+{
+	struct xe_device *xe = gt_to_xe(e->gt);
+	struct xe_devcoredump *coredump = &xe->devcoredump;
+	bool cookie;
+
+	cookie = dma_fence_begin_signalling();
+	mutex_lock(&coredump->lock);
+
+	if (coredump->faulty_engine) {
+		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
+		mutex_unlock(&coredump->lock);
+		return;
+	}
+	coredump->faulty_engine = e;
+	devcoredump_snapshot(coredump);
+
+	mutex_unlock(&coredump->lock);
+	dma_fence_end_signalling(cookie);
+
+	drm_info(&xe->drm, "Xe device coredump has been created\n");
+	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
+		 xe->drm.primary->index);
+
+	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
+		      xe_devcoredump_read, xe_devcoredump_free);
+}
+
+/**
+ * xe_devcoredump_init - Initialize xe_devcoredump.
+ * @xe: Xe device.
+ *
+ * This function should be called at the probe so the mutex lock can be
+ * initialized.
+ */
+void xe_devcoredump_init(struct xe_device *xe)
+{
+	struct xe_devcoredump *coredump = &xe->devcoredump;
+
+	mutex_init(&coredump->lock);
+}
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
new file mode 100644
index 000000000000..30941d2e554b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_DEVCOREDUMP_H_
+#define _XE_DEVCOREDUMP_H_
+
+struct xe_device;
+struct xe_engine;
+
+void xe_devcoredump_init(struct xe_device *xe);
+
+#ifdef CONFIG_DEV_COREDUMP
+void xe_devcoredump(struct xe_engine *e);
+#else
+static inline void xe_devcoredump(struct xe_engine *e)
+{
+}
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
new file mode 100644
index 000000000000..3f395fa9104e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_DEVCOREDUMP_TYPES_H_
+#define _XE_DEVCOREDUMP_TYPES_H_
+
+#include <linux/ktime.h>
+#include <linux/mutex.h>
+
+struct xe_device;
+
+/**
+ * struct xe_devcoredump_snapshot - Crash snapshot
+ *
+ * This struct contains all the useful information quickly captured at the time
+ * of the crash. So, any subsequent reads of the coredump points to a data that
+ * shows the state of the GPU of when the issue has happened.
+ */
+struct xe_devcoredump_snapshot {
+	/** @snapshot_time:  Time of this capture. */
+	ktime_t snapshot_time;
+	/** @boot_time:  Relative boot time so the uptime can be calculated. */
+	ktime_t boot_time;
+};
+
+/**
+ * struct xe_devcoredump - Xe devcoredump main structure
+ *
+ * This struct represents the live and active dev_coredump node.
+ * It is created/populated at the time of a crash/error. Then it
+ * is read later when user access the device coredump data file
+ * for reading the information.
+ */
+struct xe_devcoredump {
+	/** @xe: Xe device. */
+	struct xe_device *xe;
+	/** @falty_engine: Engine where the crash/error happened. */
+	struct xe_engine *faulty_engine;
+	/** @lock: Protects data from races between capture and read out. */
+	struct mutex lock;
+	/** @snapshot: Snapshot is captured at time of the first crash */
+	struct xe_devcoredump_snapshot snapshot;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6490a04614ce..197ee4090fed 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -12,6 +12,7 @@
 #include <drm/drm_file.h>
 #include <drm/ttm/ttm_device.h>
 
+#include "xe_devcoredump_types.h"
 #include "xe_gt_types.h"
 #include "xe_platform_types.h"
 #include "xe_step_types.h"
@@ -55,6 +56,9 @@ struct xe_device {
 	/** @drm: drm device */
 	struct drm_device drm;
 
+	/** @devcoredump: device coredump */
+	struct xe_devcoredump devcoredump;
+
 	/** @info: device info */
 	struct intel_device_info {
 		/** @graphics_name: graphics IP name */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e857013070b9..231fb4145297 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -14,6 +14,7 @@
 #include <drm/drm_managed.h>
 
 #include "regs/xe_lrc_layout.h"
+#include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_engine.h"
 #include "xe_force_wake.h"
@@ -800,6 +801,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
 		drm_warn(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
 			 xe_sched_job_seqno(job), e->guc->id, e->flags);
 		simple_error_capture(e);
+		xe_devcoredump(e);
 	} else {
 		drm_dbg(&xe->drm, "Timedout signaled job: seqno=%u, guc_id=%d, flags=0x%lx",
 			 xe_sched_job_seqno(job), e->guc->id, e->flags);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 855cf8557056..dd8bc3490ef8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -16,6 +16,7 @@
 
 #include "regs/xe_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_display.h"
 #include "xe_drv.h"
@@ -655,6 +656,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return err;
 	}
 
+	xe_devcoredump_init(xe);
 	xe_pm_runtime_init(xe);
 
 	return 0;
-- 
2.39.2

