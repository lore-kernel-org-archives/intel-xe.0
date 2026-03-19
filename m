Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8597E1075262
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 07:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4618310E8B3;
	Thu, 19 Mar 2026 07:02:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247C010E880;
 Thu, 19 Mar 2026 07:02:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_memory_page_offlining?=
 =?utf-8?q?_support_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Mar 2026 07:02:19 -0000
Message-ID: <177390373913.374819.2198393764637346187@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260319065340.2531231-9-tejas.upadhyay@intel.com>
In-Reply-To: <20260319065340.2531231-9-tejas.upadhyay@intel.com>
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

Series: Add memory page offlining support (rev5)
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
commit aef9e2c64dfcabb11e1bee916056b40d3982e8fe
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Thu Mar 19 12:23:46 2026 +0530

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
    P: pending for reserve, this gpu page is marked as bad, will be reserved in next window of page_reserve.
    F: unable to reserve. this gpu page can’t be reserved due to some reasons.
    
    For example if you read using cat /sys/bus/pci/devices/bdf/vram_bad_pages,
    max_pages : 10000
    0x00000000 : 0x00001000 : R
    0x00001234 : 0x00001000 : P
    
    v2:
    - Add max_pages info as per updated design doc
    - Rebase
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 61409ba11a36fa5aff4ce0f0086a6026a43c5bce drm-intel
530bb6eaf7bf drm/xe: Link VRAM object with gpu buddy
976a1cc06451 drm/gpu: Add gpu_buddy_addr_to_block helper
ac81c07c8e38 drm/xe: Handle physical memory address error
-:13: ERROR:BAD_COMMIT_SEPARATOR: Invalid commit separator - some tools may have problems applying this
#13: 
----------------------

-:20: ERROR:BAD_COMMIT_SEPARATOR: Invalid commit separator - some tools may have problems applying this
#20: 
-----------------

-:32: ERROR:BAD_COMMIT_SEPARATOR: Invalid commit separator - some tools may have problems applying this
#32: 
--------------

total: 3 errors, 0 warnings, 0 checks, 299 lines checked
1b9eaf9aa135 drm/xe/cri: Add debugfs to inject faulty vram address
de6200347e96 gpu/buddy: Add routine to dump allocated buddy blocks
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
[  +0.000003] xe 0000:03:00.0: [drm] 0x00000002f8000000-0x00000002f8800000: 8388608

total: 0 errors, 1 warnings, 0 checks, 62 lines checked
662bfb7c478e drm/xe/configfs: Add vram bad page reservation policy
aef9e2c64dfc drm/xe/cri: Add sysfs interface for bad gpu vram pages
-:20: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#20: 
P: pending for reserve, this gpu page is marked as bad, will be reserved in next window of page_reserve.

total: 0 errors, 1 warnings, 0 checks, 144 lines checked


