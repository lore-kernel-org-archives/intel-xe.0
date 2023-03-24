Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D557C6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 21:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3B110E1A3;
	Fri, 24 Mar 2023 21:06:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 02BBC10E1A3;
 Fri, 24 Mar 2023 21:06:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EDD3BA7DFB;
 Fri, 24 Mar 2023 21:06:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Fri, 24 Mar 2023 21:06:22 -0000
Message-ID: <167969198296.30854.13100027479701666832@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230324210415.2434992-1-matthew.d.roper@intel.com>
In-Reply-To: <20230324210415.2434992-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_PAT_fixes?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: PAT fixes
URL   : https://patchwork.freedesktop.org/series/115620/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit ee68b79f9359f91cb98b5465848541045ea0c854
Author:     Matthew Brost <matthew.brost@intel.com>
AuthorDate: Fri Mar 24 09:33:36 2023 -0700
Commit:     Matthew Brost <matthew.brost@intel.com>
CommitDate: Fri Mar 24 09:33:36 2023 -0700

    drm/xe: Decrement fault mode counts in xe_vm_close_and_put
    
    Rather waiting for the VM to be destroyed (all refs to VM go to zero),
    drop the fault mode counts when the VM is closed in xe_vm_close_and_put.
    This avoids a window where user space can create a faulting VM, close
    it, and a subsequent creation of a non-faulting VM fails.
    
    v2 (Lucas): Drop VLK reference in commit message
    
    Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Suggested-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
=== git am output follows ===
Applying: drm/xe/pat: Move PAT setup to a dedicated file
Applying: drm/xe/pat: Use table-based programming of PAT settings
Applying: drm/xe/pat: Handle unicast vs MCR PAT registers
Applying: drm/xe/pat: Clean up PAT register definitions
Applying: drm/xe/mtl: Fix PAT table coherency settings
Applying: drm/xe/mtl: Handle PAT_INDEX offset jump


