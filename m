Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80709C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 07:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3565010EB50;
	Tue, 30 Jun 2026 07:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0PlFGYpQ";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010053.outbound.protection.outlook.com [52.101.46.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8584910EB50
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 07:41:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pB6ZFWDMTiLPFn6lmghINVTZL3zV+jL/F5Up5RmxcZvvxyHOu0Sugza8B+UrCXTN3W+hEJuqFOPk9o4lIfhxWj6qkVnGKyO/TgRkd6eerSNgKskgVGIsEpaUD3yP5hvMYMH9xvNhzxvexG8AT5jbLaIGDkpl2DwcCDJAxqEL1n4Mt3L0qXpPLQKVTXkhkD/i62ooS4MzVPpC+O0GPJuClao+sdlAhOJKDgsukZGDAdEJPriDjroFmqtogXvIivNhJVOtxKYSLGAELsqd/Ne11BVDDCbYnrNglzZOoPHmr8Q1pr2qwJmARwFeblIaGtNtHWCUOrMrKk1KvmnxFrYIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8UzLPdfLg/i5VdsBuBuCDxwyyoyFvEjBUwP9m/GlBE=;
 b=WjQVOsTin2zjmpzpYYMy+zmdGiH8v7tKqSktQKAnW8AzZi8+d+5AaACihz8TK4YmWMdkzcopNJW6x/ppM5ECwUeBy1SXtVDnrj2z3cxVkx20j1zjjJQEnlJrikbS2xsyY2aCITrIQ4jXfgFxaAyAabSu4wq/11st5vb1j4Uz9zEHtcO6gNNno1QlKN7XjfSbUhYBxQROvAxnCjHaUU20IhT6Vec6F7w33B4oBnXThP3Vp76c/eLsZlOwsa1c9eKnVHLLFAKvxu7wtLc1//ZNHssmy2hM1AQ2UCQRZmsYgRNqCk0MzQUBknmzkALidmNX457DAXSvfvbwXFySxpPazQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8UzLPdfLg/i5VdsBuBuCDxwyyoyFvEjBUwP9m/GlBE=;
 b=0PlFGYpQ3MJi91/2wjFdQT4Y6x5rNvyO2NF0uOq9f4KXFYfpPFbsiKJYn/yJedqURexzWAo64wmxQOb/dvwWEw3juspcMbaPDMeAOGBVgeflsZ9DDmU2gHYTfRREh/kt9HPR9SUlhBqvrWubpgQq30PHEi12m+hGXjcOKFBy25M=
Received: from SA0PR11CA0162.namprd11.prod.outlook.com (2603:10b6:806:1bb::17)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 07:41:05 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::33) by SA0PR11CA0162.outlook.office365.com
 (2603:10b6:806:1bb::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 07:41:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 07:41:04 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 02:41:02 -0500
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 00:35:04 -0700
From: Honglei Huang <honghuan@amd.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v9 0/5] drm/gpusvm: split MM and device state across
 gpusvm/range/pages
Date: Tue, 30 Jun 2026 15:34:47 +0800
Message-ID: <20260630073452.379071-1-honghuan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: a84dac0a-17ca-47de-3a9a-08ded67af0df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|36860700016|1800799024|22122799003|376014|3023799007|56012099006|11063799006|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: qu07Skt1edhZOYZvJ+uk9MFWFDh2I3NQm926sBXweUQGf1pyHOOziSQdZmHNEM5LqvX1Z0lCOEK+/KeGpZE/8dQ49uPrNn9E/SwMVNDLkkBjlsNScXVR+94tkB/hz69tb7kKPCDT13rc78V1XBP2ot+sqxIBwtkmkWH1t3Rygy3BBFI/fEr0El2cF7CIM8EgOOkx00FOwnv4H0l5ciUbOpYQxg+Xfp0KMJTLikeNcCr2WSwaUh3lwpdFXSXpxrVqRlwMP6YxwmTrulvc+s7lhsnktkEGcYc0tuj0Dpr2IGz1q5Paqh0apQf9iT7gUSs96+kGofMINxAlC1/l6mjGtU/EiZsgThdhCtMFhm06ya0a5CkXIAh9c4Mvug6lCpU+VykB2/Q5SLa+9lIhBSajJI62ToP+La6k4CIWY0BbQaXRW/hTCasIgYmvvZnIGgbz/8ok2aE8qwtPbv6jW4nMPcL5FlsCMmnasizyMvktzC3y+k6+ILw40oL8zyCcRyPfSp92T2IfPqt5PYqzCP4R/2RLmb2hwbt6CenEn2g98WzmjLmTCmW7ys2uzpQ7zRWvEHGw/bbUO77+HytcLF29ApbNbuSWXvedpapOj8/sZAYTTjMF1f0vp+bBqJV5tE8QaTmtYmTgyC4le8KWZMFQ2Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(22122799003)(376014)(3023799007)(56012099006)(11063799006)(13003099007)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BsuJvHK50+W91xH8HFiX24lc/wIdEnH5GCZar2TfffJg2oznV7teBV5AQ57Rm1184k1Jg60w3Y9gapuyxEiTPklVwqbI2gMPlJsKpB3DljOSrGzHsrZyBcPDsFCbbnN6LMwQKCClwSAM4Nfa3I+QikwlA66JxuJttcwu/3xetBjjACSd4ql8UBF2aAhWpb3JiGpV/mipWsNa1YWAyV9SFqeoyoOSaK7ZSdpvGe3JKncokd9lHAqxO3+BPcTf7+heu9gLt9FSdr+6SZjiXR7YDuOj6lpS8mC8eZK/1uQIRrksHKDYFGtymVXB+D0yPiUmc2ynnMze0wN+7XEJGDAsdEIGhH0qRO/Ys8Fw/nZy+yb1yePnNg6i93xXbFaZc3dG0YNQWHgY3R5a7dpqfEVGhIYxf+1lqw2p6c+bOsdnv3IJTSHqVVZHH4etx82V2C9Y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 07:41:04.8358 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a84dac0a-17ca-47de-3a9a-08ded67af0df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163
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

The intent of this series is to make drm_gpusvm more flexible and give
drivers more freedom over how they assemble the MM related and device
side operations. It implements the direction Matt suggested in [1]:
Mirror MR in gitlab: [4]

  - Move struct drm_gpusvm_pages out of struct drm_gpusvm_range.
  - Embed a struct drm_device in struct drm_gpusvm_pages and drive all
    DMA through it.
  - Drop struct drm_device from struct drm_gpusvm.
  - Have the driver's range structure embed one or more struct
    drm_gpusvm_pages in addition to struct drm_gpusvm_range.
  - Drop the range-based helpers (drm_gpusvm_range_pages_valid,
    drm_gpusvm_range_get_pages, drm_gpusvm_range_unmap_pages) and update
    drivers to use the drm_gpusvm_pages helpers instead.

In essence the series does only two abstractions, plus the xe
adaptation that follows from them:

  - range vs pages: split drm_gpusvm_range (MM / VA range state) from
    drm_gpusvm_pages (device physical related), so the two sides can
    have independent lifetimes and ownership.
  - drm_gpusvm vs drm_device: make drm_gpusvm pure MM level and push
    the device side down onto drm_gpusvm_pages, which is where DMA
    actually happens.
  - xe is updated to fit the modifications, no functional change
    intended.

V9:
  - patch 3: fix the build with CONFIG_DRM_XE_GPUSVM disabled: move
    pages out of the nested base struct in the stub xe_svm_range and
    route has_dma_mapping through range->pages. No functional change.

V8:
  - patch 4: add reviewed-by for Matt's review.

V7:
  - patch 1: split MM state flags: the AI review found a KCSAN / memory
    model cleanliness issue. Address it for consistency with
    drm_gpusvm_pages_flags, set the range flags with WRITE_ONCE() on
    __flags and read them with READ_ONCE().

V6:
  - The AI review flagged a potential DMA free issue: the DMA unmap
    step was moved into the range_free callback, but on the invalidate
    path a range can be removed from the MMU interval tree while its DMA
    mappings are still live, so a concurrent unmap event can miss it.
  - patch 3: have xe_svm_range embed one drm_gpusvm_pages: explicitly
    call drm_gpusvm_unmap_pages() before drm_gpusvm_range_remove() in the
    garbage collector, so a range is never off the tree while still DMA
    mapped, and document this caller contract in drm_gpusvm_range_remove()
    kernel-doc.
  - patch 4: move struct drm_gpusvm_pages out: document the
    unmap before remove contract in the garbage collector example and
    note that range_free()'s drm_gpusvm_free_pages() as a final fallback.
  - patch 1: split MM state flags: return -EACCES directly.
  - Fold in the pre existing IOVA/DMA unmap fixes the AI review found
    previously sent separately: the uninitialized dma_addr[0].dir on
    the get_pages() error path, the whole reservation IOVA free for
    mixed ranges, and the device mapping leak on the get_pages() error
    path. [6]

V5:
  - add reviewed-by in patches 1, 2, 3, 5 for Matt's review.

V4:
  - drm_gpusvm_init_pages(): memset() the pages to zero before recording
    the owning drm_device.
  - DOC: overview: recommend a zeroing allocator: kcalloc() for the
    N:1 pages array.
  - Rebased onto the latest drm-xe.
  - The AI review of this series flagged two preexisting issues in the
    IOVA unmap path that are not introduced by this series; they are
    fixed in a separate series [5].

V3:
  - Fix a kernel-doc/Sphinx warning from the kernel test robot: use
    ".. code-block:: c" for the drm_gpusvm_pages example in DOC: overview.
  - drm_gpusvm_range_set_unmapped(): use WRITE_ONCE() on the whole
    pages[i].flags.__flags word to pair with the lockless READ_ONCE()
    readers and avoid a data race.
  - xe_userptr_setup(): call drm_gpusvm_init_pages() before
    mmu_interval_notifier_insert() to avoid exposing uninitialized
    pages.drm to invalidation callbacks.
  - Fix per commit build of the set_unmapped() pages.

V2:
  - Followed in Matt's v0 review fixups [2]:
     - keep unmapped flag in pages structures.
     - add pages_count to drm_gpusvm_range_set_unmapped() to set the pages
       unmapped flag, so the framework can check unmapped status in
       drm_gpusvm_get_pages().
  - Add drm_gpusvm_init_pages to init the drm_device and sequence number.
  - Remove drm_device from drm_gpusvm_get_pages() parameters.
  - Reworked the DOC: overview and usage examples to describe the new
    model: struct drm_gpusvm_pages, the 1:1 / N:1 driver layouts, and
    examples that operate on a driver embedded pages object by the
    drm_gpusvm_pages helpers and etc.
  - remove WARN_ON_ONCE in __drm_gpusvm_unmap_pages.
  - Dropped RFC.

Follow-up (not in this series):

  - modify drm_gpusvm_get_pages() to support one time hmm range fault
    and multi drm device dma mapping.
  - Add no dma device support for drm_gpusvm_get_pages().

tests:
AMDGPU:
  based on amdgpu adaptation patch in [3], but still SVM:DRM = 1:1,
  1:n is on going needs many modifications and testings.

  Tested on gfx943 (MI300X) and gfx906 (MI60) with XNACK on/off:
  - KFD test: 95%+ passed.
  - ROCR test: all passed.
  - HIP catch test: gfx943 (MI300X): 99% passed.
                    gfx906 (MI60): 99% passed.
INTEL XE:
  Waiting for the xe driver git lab CI result: [4]

links:
[1] https://lore.kernel.org/amd-gfx/acRgr7QwdULsn6G2@gsse-cloud1/#:~:text=I%20think%20roughly,drm_gpusvm_pages%0A%20%20helpers%20instead.
[2] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svn-perf-6-15-2025/-/commit/623f6a50c037d9e44f6c9fbe6859a0ba7ad50177
[3] https://lore.kernel.org/amd-gfx/20260603065030.2554403-1-honglei1.huang@amd.com/
[4] https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/360
[5] https://lore.kernel.org/all/20260627033325.3795298-1-honglei1.huang@amd.com/
[6] https://lore.kernel.org/all/20260628061757.4093701-1-honglei1.huang@amd.com/

Honglei Huang (5):
  drm/gpusvm: split MM state flags out of drm_gpusvm_pages_flags
  drm/gpusvm: embed struct drm_device into drm_gpusvm_pages
  drm/xe: have xe_svm_range embed one drm_gpusvm_pages
  drm/gpusvm: move struct drm_gpusvm_pages out of struct
    drm_gpusvm_range
  drm/gpusvm: let the drm_gpusvm core context purely MM level

 drivers/gpu/drm/drm_gpusvm.c    | 243 +++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_pt.c      |   2 +-
 drivers/gpu/drm/xe/xe_svm.c     |  49 +++++--
 drivers/gpu/drm/xe/xe_svm.h     |  14 +-
 drivers/gpu/drm/xe/xe_userptr.c |   5 +-
 include/drm/drm_gpusvm.h        |  67 ++++++---
 6 files changed, 238 insertions(+), 142 deletions(-)

-- 
2.34.1

