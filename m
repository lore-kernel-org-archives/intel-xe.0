Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014B0F8A141
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 07:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A585B10E842;
	Thu, 16 Apr 2026 07:56:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF16710E834;
 Thu, 16 Apr 2026 07:56:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_memory_page_offlining?=
 =?utf-8?q?_support_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Apr 2026 07:56:05 -0000
Message-ID: <177632616577.467519.7224790897102331175@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260416074958.3722666-12-tejas.upadhyay@intel.com>
In-Reply-To: <20260416074958.3722666-12-tejas.upadhyay@intel.com>
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

Series: Add memory page offlining support (rev8)
URL   : https://patchwork.freedesktop.org/series/161473/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cddb2434942e3dc976b828dca2b17d73fb7d6b68
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Thu Apr 16 13:19:59 2026 +0530

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
+ /mt/dim checkpatch 7e772296e93b337ca5e12fced2ac12716a159d28 drm-intel
7ad853ed2074 drm/xe: Link VRAM object with gpu buddy
9be10af07d2b gpu/buddy: Integrate lockdep for gpu buddy manager
cfbf17fee984 drm/gpu: Add gpu_buddy_allocated_addr_to_block helper
8e7bb33194ec drm/xe: Link LRC BO and its execution Queue
86665af845df drm/xe: Extend BO purge to handle vram pages as well
c6ca0861ed2a drm/xe: Handle physical memory address error
-:13: ERROR:BAD_COMMIT_SEPARATOR: Invalid commit separator - some tools may have problems applying this
#13: 
----------------------

-:20: ERROR:BAD_COMMIT_SEPARATOR: Invalid commit separator - some tools may have problems applying this
#20: 
-----------------

total: 2 errors, 0 warnings, 0 checks, 418 lines checked
0aa34b8cb1c5 drm/xe/cri: Add debugfs to inject faulty vram address
b73669f195ce gpu/buddy: Add routine to dump allocated buddy blocks
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
[  +0.000003] xe 0000:03:00.0: [drm] 0x00000002f8000000-0x00000002f8800000: 8388608

total: 0 errors, 1 warnings, 0 checks, 62 lines checked
a50fc40a0ce1 drm/xe/configfs: Add vram bad page reservation policy
cddb2434942e drm/xe/cri: Add sysfs interface for bad gpu vram pages
-:22: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#22: 
F: unable to reserve. this gpu page can’t be reserved due to some reasons.

total: 0 errors, 1 warnings, 0 checks, 127 lines checked


