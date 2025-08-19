Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064A8CA0EEB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 16:35:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADFE10E207;
	Tue, 19 Aug 2025 16:35:23 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4CA10E0C5;
 Tue, 19 Aug 2025 16:35:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_cgroups=3A_Add_support_fo?=
 =?utf-8?q?r_pinned_device_memory?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Aug 2025 16:35:22 -0000
Message-ID: <175562132236.248501.15687113419943793198@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250819114932.597600-5-dev@lankhorst.se>
In-Reply-To: <20250819114932.597600-5-dev@lankhorst.se>
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

Series: cgroups: Add support for pinned device memory
URL   : https://patchwork.freedesktop.org/series/153134/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
553439844b6500767ce8aef522cfe9fbb7ece541
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6adbd62f5794fdbd7fcbd26b53705d8e75f5b88b
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Tue Aug 19 13:49:36 2025 +0200

    drm/xe: Add DRM_XE_GEM_CREATE_FLAG_PINNED flag and implementation
    
    Add an option to pin memory through the science of cgroup accounting.
    A bo will be pinned for its entire lifetime, and this allows buffers
    that are pinned for dma-buf export without requiring the pinning to be
    done at the dma-buf layer for all devices.
    
    For now only implement VRAM pinning. Dave Airlie has a series to implement
    memcg accounting for the GPU but that is not ready yet.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 8093b67375779a975c13b9a23c8fcc25cb1e9c83 drm-intel
d77dfce28451 page_counter: Allow for pinning some amount of memory
-:77: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#77: FILE: mm/page_counter.c:208:
+bool page_counter_try_pin(struct page_counter *counter,
+			     unsigned long nr_pages)

-:107: WARNING:DATA_RACE: data_race without comment
#107: FILE: mm/page_counter.c:238:
+				data_race(c->failcnt++);

total: 0 errors, 1 warnings, 1 checks, 152 lines checked
33d0ce53c33f cgroup/dmem: Implement pinning device memory
-:97: WARNING:TYPO_SPELLING: 'succesfully' may be misspelled - perhaps 'successfully'?
#97: FILE: kernel/cgroup/dmem.c:674:
+ * If the function succeeds, the memory is succesfully accounted as being pinned.
                                            ^^^^^^^^^^^

-:106: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#106: FILE: kernel/cgroup/dmem.c:683:
+
+}

total: 0 errors, 1 warnings, 1 checks, 109 lines checked
6adbd62f5794 drm/xe: Add DRM_XE_GEM_CREATE_FLAG_PINNED flag and implementation
-:76: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#76: FILE: drivers/gpu/drm/xe/xe_bo.c:2151:
+			if (bo->flags & XE_BO_FLAG_SYSTEM) {
[...]
+			} else {
[...]

-:77: WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#77: FILE: drivers/gpu/drm/xe/xe_bo.c:2152:
+				ret = -ENOSYS; // TODO

-:110: WARNING:LONG_LINE_COMMENT: line length of 105 exceeds 100 columns
#110: FILE: drivers/gpu/drm/xe/xe_bo.c:2793:
+		/* Similarly, force fail at creation time for now. We may relax this requirement later */

-:111: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#111: FILE: drivers/gpu/drm/xe/xe_bo.c:2794:
+		if (XE_IOCTL_DBG(xe, pinned_flag && args->flags & DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING))

-:115: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#115: FILE: drivers/gpu/drm/xe/xe_bo.c:2798:
+		if (XE_IOCTL_DBG(xe, pinned_flag && !IS_ENABLED(CONFIG_CGROUP_DMEM) && bo_flags & XE_BO_FLAG_VRAM_MASK) ||

-:116: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#116: FILE: drivers/gpu/drm/xe/xe_bo.c:2799:
+		    XE_IOCTL_DBG(xe, pinned_flag && !IS_ENABLED(CONFIG_MEMCG) && bo_flags & XE_BO_FLAG_SYSTEM))

-:182: WARNING:TYPO_SPELLING: 'withing' may be misspelled - perhaps 'within'?
#182: FILE: include/uapi/drm/xe_drm.h:776:
+ *    on allocation, if withing cgroups limits.
                         ^^^^^^^

total: 0 errors, 7 warnings, 0 checks, 164 lines checked


