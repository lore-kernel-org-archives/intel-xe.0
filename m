Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF75C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 09:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B9910E71D;
	Tue,  8 Sep 2026 09:48:48 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAA510E709;
 Tue,  8 Sep 2026 09:48:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Extract_dma-fence-?=
 =?utf-8?q?to-workqueue_pattern_into_common_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Srinivasan Shanmugam" <srinivasan.shanmugam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Sep 2026 09:48:47 -0000
Message-ID: <178886092743.134388.13573619294392602058@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908084627.352535-1-srinivasan.shanmugam@amd.com>
In-Reply-To: <20260908084627.352535-1-srinivasan.shanmugam@amd.com>
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

Series: drm: Extract dma-fence-to-workqueue pattern into common helpers
URL   : https://patchwork.freedesktop.org/series/173580/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 97aef5fff0082733c1d863cf9429830fb790946a
Author: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Date:   Tue Sep 8 14:16:27 2026 +0530

    drm/xe: Convert xe_user_fence to drm_user_fence
    
    Replace the open-coded user fence implementation in xe_sync.c with the
    new common drm_user_fence helper.
    
    struct xe_user_fence now embeds struct drm_user_fence as its base.
    XE-specific fields (xe_device pointer for the ufence_wq wake-up,
    userspace VA, expected value, signalled flag) remain in the wrapper.
    
    The local user_fence_destroy/get/put/worker/kick_ufence/user_fence_cb
    functions are removed. Their logic moves to xe_ufence_ops.writeback and
    xe_ufence_ops.destroy, which are called by the drm_user_fence helper.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: dri-devel@lists.freedesktop.org
    Cc: intel-xe@lists.freedesktop.org
    Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
+ /mt/dim checkpatch 06602b51786b6c2a0f97e58f0e0f168be1ada27e drm-intel
bd6dc9b12133 drm: Add drm_work_fence helper
-:49: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#49: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 260 lines checked
562ae534174f drm: Add drm_user_fence helper
-:51: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#51: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 200 lines checked
97aef5fff008 drm/xe: Convert xe_user_fence to drm_user_fence


