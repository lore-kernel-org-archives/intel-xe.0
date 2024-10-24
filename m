Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B65CE8E93
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 16:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB3F10E978;
	Thu, 24 Oct 2024 16:20:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55FC10E38E;
 Thu, 24 Oct 2024 16:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_mm/migrate=3A_Add_migrate?=
 =?utf-8?q?=5Fdevice=5Fpfns?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 16:20:06 -0000
Message-ID: <172978680673.1328167.2688840910527133796@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023233944.1798835-1-matthew.brost@intel.com>
In-Reply-To: <20241023233944.1798835-1-matthew.brost@intel.com>
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

Series: mm/migrate: Add migrate_device_pfns
URL   : https://patchwork.freedesktop.org/series/140403/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8e817c7b155114a12705549a37d69356b9de6a33
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Oct 23 16:39:44 2024 -0700

    mm/migrate: Add migrate_device_pfns
    
    Implement migrate_device_pfns to prepare an array of PFNs for migration.
    Handles non-contiguous ranges of device pages that require migration.
    
    v2:
     - s/migrate_device_vma_range/migrate_device_prepopulated_range
     - Drop extra mmu invalidation (Vetter)
    v3:
     - s/migrate_device_prepopulated_range/migrate_device_pfns (Alistair)
     - Use helper to lock device pages (Alistair)
    
    Cc: Cc: Alistair Popple <apopple@nvidia.com>
    Cc: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 121cd95da591284c97d6f9ac1c58c7a79d27b201 drm-intel
8e817c7b1551 mm/migrate: Add migrate_device_pfns


