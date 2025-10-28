Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC16CCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 13:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D7D10E3E1;
	Tue, 28 Oct 2025 13:23:10 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A48A10E3E1;
 Tue, 28 Oct 2025 13:23:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/madvise=3A_Add_sup?=
 =?utf-8?q?port_for_purgeable_buffer_objects?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Oct 2025 13:23:10 -0000
Message-ID: <176165779030.62904.3507624869669913754@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251028122415.1136721-1-arvind.yadav@intel.com>
In-Reply-To: <20251028122415.1136721-1-arvind.yadav@intel.com>
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

Series: drm/xe/madvise: Add support for purgeable buffer objects
URL   : https://patchwork.freedesktop.org/series/156651/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4ecc8753e3a2aeb0ab91500f04c64ba39ff5ae7d
Author: Arvind Yadav <arvind.yadav@intel.com>
Date:   Tue Oct 28 17:54:15 2025 +0530

    drm/xe: Add support for querying purgeable BO states
    
    Add support for querying purgeable buffer object states through the
    XE_VM_QUERY_MEM_RANGE_ATTRS ioctl. This allows userspace to determine
    the current purgeable state of BO:
     - WILLNEED: BO is actively needed and re-validate if purged
     - DONTNEED: BO is not currently needed and may be purged
     - PURGED: BO has been purged by the kernel due to memory pressure
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
+ /mt/dim checkpatch 5742fc7aea99a1326637a7106eeaeac383a1c76d drm-intel
e7575feffd11 drm/xe/uapi: Add UAPI support for purgeable buffer objects
327a9d63b311 drm/xe/bo: Add purgeable bo state tracking and field madv to xe_bo
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
  * XE_MADV_PURGEABLE_WILLNEED:  BO is actively needed, should not be purged

total: 0 errors, 1 warnings, 0 checks, 37 lines checked
843e92c70085 drm/xe/madvise: Implement purgeable buffer object support
-:82: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#82: FILE: drivers/gpu/drm/xe/xe_bo.c:888:
+
+			}

-:150: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#150: FILE: drivers/gpu/drm/xe/xe_vm_madvise.c:169:
+{
+

-:201: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED'
#201: FILE: drivers/gpu/drm/xe/xe_vm_madvise.c:338:
+		if (XE_IOCTL_DBG(xe, !((val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED) ||
+				       (val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED))))

-:201: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED'
#201: FILE: drivers/gpu/drm/xe/xe_vm_madvise.c:338:
+		if (XE_IOCTL_DBG(xe, !((val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED) ||
+				       (val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED))))

-:222: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#222: FILE: drivers/gpu/drm/xe/xe_vm_madvise.c:471:
+
+		}

total: 0 errors, 0 warnings, 5 checks, 186 lines checked
eab5d3ea8147 drm/xe/bo: Prevent purging of shared buffer objects
4e4b2b6e0afc drm/xe/bo: Handle CPU faults on purged buffer objects
ff911f79f2a7 drm/xe/bo: Prevent mmap of purged buffer objects
-:19: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19: 
the state is `XE_MADV_PURGEABLE_PURGED`, the ioctl now fails with `-EINVAL`.

total: 0 errors, 1 warnings, 0 checks, 21 lines checked
e6142517b5dc drm/xe/vm: Prevent binding of purged buffer objects
769db942a6f1 drm/xe/uapi: Add UAPI for purgeable bo state to madvise query response
4ecc8753e3a2 drm/xe: Add support for querying purgeable BO states


