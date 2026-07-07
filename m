Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE750C43602
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 13:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B39110ED0D;
	Tue,  7 Jul 2026 13:33:05 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61DD10ED0D;
 Tue,  7 Jul 2026 13:33:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_memory_page_offlining?=
 =?utf-8?q?_support_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Jul 2026 13:33:04 -0000
Message-ID: <178343118493.158539.8813034668068070390@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260707130617.970638-13-tejas.upadhyay@intel.com>
In-Reply-To: <20260707130617.970638-13-tejas.upadhyay@intel.com>
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

Series: Add memory page offlining support (rev12)
URL   : https://patchwork.freedesktop.org/series/161473/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 66bf39eb077f526eed026a16c074d8e7c937b8ad
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Tue Jul 7 18:36:24 2026 +0530

    drm/xe: Add soft/hard offline mode for VRAM page retirement
    
    Introduce a mode-based approach for VRAM page offlining to distinguish
    between soft (temporary) and hard (permanent) page retirement:
    
    - Add enum xe_page_offline_mode with XE_PAGE_OFFLINE_SOFT and
      XE_PAGE_OFFLINE_HARD states.
    - Add 'mode' field to struct xe_ttm_vram_offline_resource.
    
    On first fault at an address:
    - Reserve the block, add to offlined_pages with mode = SOFT.
    - Page stays out of the allocator pool but is not permanently retired.
    
    On second fault at the same address:
    - xe_ttm_vram_page_already_processed() finds the entry and promotes
      mode from SOFT to HARD.
    - Returns -EEXIST to the caller, which signals FW to permanently
      retire the page.
    
    This avoids unnecessary permanent retirement on transient single-bit
    errors while ensuring persistent faults get hard-offlined.
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch cd8abe2554ec7eba16c1d48ab508732bf93534eb drm-intel
dbea99e2d582 drm/xe: Link VRAM object with gpu buddy
aa3bf581d52e drm/gpu: Add gpu_buddy_allocated_addr_to_block helper
df3a1c96439b drm/xe: Link LRC BO and its execution Queue
33b523f10917 drm/xe: Extend BO purge to handle vram pages as well
64de0260e15d drm/xe: Handle physical memory address error
-:13: ERROR:BAD_COMMIT_SEPARATOR: Invalid commit separator - some tools may have problems applying this
#13: 
----------------------

-:20: ERROR:BAD_COMMIT_SEPARATOR: Invalid commit separator - some tools may have problems applying this
#20: 
-----------------

total: 2 errors, 0 warnings, 0 checks, 515 lines checked
3fe0602555cd drm/xe/cri: Add debugfs to inject faulty vram address
35d4f01506cb gpu/buddy: Add routine to dump allocated buddy blocks
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
[  +0.000003] xe 0000:03:00.0: [drm] 0x00000002f8000000-0x00000002f8800000: 8388608

total: 0 errors, 1 warnings, 0 checks, 62 lines checked
603b9e653c06 drm/xe/configfs: Add vram bad page reservation policy
-:187: ERROR:CODE_INDENT: code indent should use tabs where possible
#187: FILE: drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:739:
+        bool policy;$

-:187: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#187: FILE: drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:739:
+        bool policy;$

total: 1 errors, 1 warnings, 0 checks, 160 lines checked
112d14f4e6e4 drm/xe/cri: Add sysfs interface for bad gpu vram pages
-:22: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#22: 
F: unable to reserve. this gpu page can’t be reserved due to some reasons.

total: 0 errors, 1 warnings, 0 checks, 127 lines checked
a81f09f4c9e0 drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN
-:110: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#110: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:2244:
+		u64 status = guc_exec_queue_reset_status(

total: 0 errors, 0 warnings, 1 checks, 122 lines checked
66bf39eb077f drm/xe: Add soft/hard offline mode for VRAM page retirement


