Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA25DCD343B
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 14:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BE210EDBC;
	Wed,  6 May 2026 14:18:10 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF91B10EDBC;
 Wed,  6 May 2026 14:18:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_memory_page_offlining?=
 =?utf-8?q?_support_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 May 2026 14:18:08 -0000
Message-ID: <177807708891.43382.9404355565514255414@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260506141143.4033299-12-tejas.upadhyay@intel.com>
In-Reply-To: <20260506141143.4033299-12-tejas.upadhyay@intel.com>
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

Series: Add memory page offlining support (rev9)
URL   : https://patchwork.freedesktop.org/series/161473/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0ff1b2b1d8adf0d10697566a14fd6dda4dfb9d09
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Wed May 6 19:41:51 2026 +0530

    drm/xe/cri: Add sysfs interface for bad gpu vram pages
    
    Starting CRI, Include a sysfs interface designed to expose information
    about bad VRAM pages—those identified as having hardware faults
    (e.g., ECC errors). This interface allows userspace tools and
    administrators to monitor the health of the GPU's local memory and
    track the status of page retirement.To get details on bad gpu vram
    pages can be found under /sys/bus/pci/devices/bdf/vram_bad_pages.
    
    Where The format is, pfn : gpu page size : flags
    
    flags:
    R: reserved, this gpu page is reserved.
    P: pending for reserve, this gpu page is marked as bad, will be reserved
       in next window of page_reserve.
    F: unable to reserve. this gpu page can’t be reserved due to some reasons.
    
    For example if you read using cat /sys/bus/pci/devices/bdf/vram_bad_pages,
    max_pages : 10000
    0x00000000 : 0x00001000 : R
    0x00001234 : 0x00001000 : P
    
    v3:
    - Move FW communication in RAS code
    v2:
    - Add max_pages info as per updated design doc
    - Rebase
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 2c4b906cd135bbb44855287d0d0eff0ee0b47afe drm-intel
0fffa45c255b drm/xe: Link VRAM object with gpu buddy
9a9bc92f36db gpu/buddy: Integrate lockdep for gpu buddy manager
518db955b68c drm/gpu: Add gpu_buddy_allocated_addr_to_block helper
48227899582b drm/xe: Link LRC BO and its execution Queue
14359be3be53 drm/xe: Extend BO purge to handle vram pages as well
535a153e7cf8 drm/xe: Handle physical memory address error
-:13: ERROR:BAD_COMMIT_SEPARATOR: Invalid commit separator - some tools may have problems applying this
#13: 
----------------------

-:20: ERROR:BAD_COMMIT_SEPARATOR: Invalid commit separator - some tools may have problems applying this
#20: 
-----------------

total: 2 errors, 0 warnings, 0 checks, 515 lines checked
4c306d99e661 drm/xe/cri: Add debugfs to inject faulty vram address
ac0c3e5f5270 gpu/buddy: Add routine to dump allocated buddy blocks
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
[  +0.000003] xe 0000:03:00.0: [drm] 0x00000002f8000000-0x00000002f8800000: 8388608

total: 0 errors, 1 warnings, 0 checks, 62 lines checked
26a8a96c702b drm/xe/configfs: Add vram bad page reservation policy
-:187: ERROR:CODE_INDENT: code indent should use tabs where possible
#187: FILE: drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:742:
+        bool policy;$

-:187: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#187: FILE: drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:742:
+        bool policy;$

total: 1 errors, 1 warnings, 0 checks, 160 lines checked
0ff1b2b1d8ad drm/xe/cri: Add sysfs interface for bad gpu vram pages
-:22: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#22: 
F: unable to reserve. this gpu page can’t be reserved due to some reasons.

total: 0 errors, 1 warnings, 0 checks, 127 lines checked


