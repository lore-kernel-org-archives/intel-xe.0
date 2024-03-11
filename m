Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B095C5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 19:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CEB112C30;
	Mon, 11 Mar 2024 19:25:58 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D80D112C30;
 Mon, 11 Mar 2024 19:25:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Invalidate_user?=
 =?utf-8?q?ptr_VMA_on_page_pin_fault_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Mar 2024 19:25:58 -0000
Message-ID: <171018515851.681532.16965340828026701474@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240311192045.852975-1-matthew.brost@intel.com>
In-Reply-To: <20240311192045.852975-1-matthew.brost@intel.com>
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

Series: drm/xe: Invalidate userptr VMA on page pin fault (rev3)
URL   : https://patchwork.freedesktop.org/series/130935/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9bb2a8a17457065eb398a81e8fd9aec2b519fd6
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ff8a2566b785c2085b8f1a5a0b5ca5d5e8e795a5
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Mar 11 12:20:45 2024 -0700

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
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 61fa386186cb302cf26e29aef76d5b1a6ffe57ad drm-intel
ff8a2566b785 drm/xe: Invalidate userptr VMA on page pin fault


