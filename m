Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688EEC83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 14:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF6610E833;
	Thu, 17 Jul 2025 14:25:35 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA7210E833;
 Thu, 17 Jul 2025 14:25:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Prepare_GPU_SVM_for_migra?=
 =?utf-8?q?tion_of_THP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Jul 2025 14:25:34 -0000
Message-ID: <175276233456.169589.1180116135063494469@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250717133928.526111-1-francois.dugast@intel.com>
In-Reply-To: <20250717133928.526111-1-francois.dugast@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Prepare GPU SVM for migration of THP
URL   : https://patchwork.freedesktop.org/series/151754/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a7a2cd5543581784260203c489ed17895e1acbf3
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Thu Jul 17 15:38:27 2025 +0200

    drm/pagemap: Allocate folios when possible
    
    If the order is greater than zero, allocate a folio when populating the
    RAM PFNs instead of allocating individual pages one after the other. For
    example if 2MB folios are used instead of 4KB pages, this reduces the
    number of calls to the allocation API by 512.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 32c3655fcecb4e7e7dd624bf7b201ae69eb5bb5f drm-intel
d0601960ab32 drm/pagemap: Use struct drm_pagemap_device_addr in mapping and copy functions
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
This struct embeds more information than just the DMA address. This will help

total: 0 errors, 1 warnings, 0 checks, 233 lines checked
d0c6c1d894a9 drm/xe/svm: Use struct drm_pagemap_device_addr
a99a95ba6ef6 drm/pagemap: DMA map folios when possible
-:50: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#50: FILE: drivers/gpu/drm/drm_pagemap.c:244:
+		for (j = 0; j < (0x1 << order) && i+j < npages; j++)
 		                                   ^

-:51: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#51: FILE: drivers/gpu/drm/drm_pagemap.c:245:
+			device_addr[i+j].addr = device_addr[i].addr + j * PAGE_SIZE;
 			             ^

total: 0 errors, 0 warnings, 2 checks, 52 lines checked
6c4f03df6f84 drm/xe/migrate: Use order to calculate migration length
a7a2cd554358 drm/pagemap: Allocate folios when possible


