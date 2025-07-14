Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D02C83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 12:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B674610E485;
	Mon, 14 Jul 2025 12:33:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CBF10E485;
 Mon, 14 Jul 2025 12:33:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Support_for_mma?=
 =?utf-8?q?p-ing_mmio_regions_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Jul 2025 12:33:04 -0000
Message-ID: <175249638434.158350.16967643327901020498@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250714122658.1803-1-ilia.levi@intel.com>
In-Reply-To: <20250714122658.1803-1-ilia.levi@intel.com>
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

Series: drm/xe: Support for mmap-ing mmio regions (rev4)
URL   : https://patchwork.freedesktop.org/series/149977/
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
commit 56764b8e82746cc0ec4776590302a458fc461cec
Author: Ilia Levi <ilia.levi@intel.com>
Date:   Mon Jul 14 15:26:58 2025 +0300

    drm/xe: Support for mmap-ing mmio regions
    
    Allow the driver to expose hardware register spaces to userspace
    through GEM objects with fake mmap offsets. This can be useful
    for userspace-firmware communication, debugging, etc.
    
    v2: Minor doc fix (CI)
    v3: Enforce MAP_SHARED (Tejas)
        Add fault handler with dummy page (Tejas, Matt Auld)
        Store physical address instead of xe_mmio in the GEM object (MattB)
    v4: Separate xe_mmio_gem from xe_mmio and make it private (MattB)
    
    Signed-off-by: Ilia Levi <ilia.levi@intel.com>
+ /mt/dim checkpatch 4990310f0d4505f8a92f01012eaf433c35da7822 drm-intel
56764b8e8274 drm/xe: Support for mmap-ing mmio regions
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 253 lines checked


