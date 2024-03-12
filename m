Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF304C54E58
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 18:43:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B257A10E06A;
	Tue, 12 Mar 2024 18:43:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A6310E06A;
 Tue, 12 Mar 2024 18:43:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Invalidate_user?=
 =?utf-8?q?ptr_VMA_on_page_pin_fault_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 Mar 2024 18:43:47 -0000
Message-ID: <171026902782.714564.6774758766368970261@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240312183907.933835-1-matthew.brost@intel.com>
In-Reply-To: <20240312183907.933835-1-matthew.brost@intel.com>
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

Series: drm/xe: Invalidate userptr VMA on page pin fault (rev4)
URL   : https://patchwork.freedesktop.org/series/130935/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 487248d5a9e21f6a7122a246db5f146aac0313b7
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Mar 12 11:39:07 2024 -0700

    drm/xe: Invalidate userptr VMA on page pin fault
    
    Rather than return an error to the user or ban the VM when userptr VMA
    page pin fails with -EFAULT, invalidate VMA mappings. This supports the
    UMD use case of freeing userptr while still having bindings.
    
    Now that non-faulting VMs can invalidate VMAs, drop the usm prefix for
    the tile_invalidated member.
    
    v2:
     - Fix build error (CI)
    v3:
     - Don't invalidate VMA if in fault mode, rather kill VM (Thomas)
     - Update commit message with tile_invalidated name chagne (Thomas)
     - Wait VM bookkeep slots with VM resv lock (Thomas)
    v4:
     - Move list_del_init(&userptr.repin_link) after error check (Thomas)
     - Assert not in fault mode (Matthew)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 1dfbf3ced62236dd318c701e3f21f5a33c226d0d drm-intel
487248d5a9e2 drm/xe: Invalidate userptr VMA on page pin fault


