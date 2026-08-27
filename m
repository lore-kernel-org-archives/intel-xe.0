Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85254C61DC4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 15:50:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338BC10F0CF;
	Thu, 27 Aug 2026 15:50:19 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CA610F07A;
 Thu, 27 Aug 2026 15:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Add_Common_drm=5Fu?=
 =?utf-8?q?ser=5Ffence_helper_and_Convert_XE_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Srinivasan Shanmugam" <srinivasan.shanmugam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Aug 2026 15:50:18 -0000
Message-ID: <178784581827.92696.11260646023563522367@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260827151950.4080674-1-srinivasan.shanmugam@amd.com>
In-Reply-To: <20260827151950.4080674-1-srinivasan.shanmugam@amd.com>
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

Series: drm: Add Common drm_user_fence helper and Convert XE (rev2)
URL   : https://patchwork.freedesktop.org/series/172833/
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
commit 028e53acf31d7f303586bf861b67ca17f2316548
Author: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Date:   Thu Aug 27 20:49:50 2026 +0530

    drm/xe: Convert xe_user_fence to drm_user_fence
    
    Replace the open-coded user fence implementation in xe_sync.c with the
    new common drm_user_fence helper.
    
    struct xe_user_fence now embeds struct drm_user_fence as its base.
    XE-specific fields (xe_device pointer for the ufence_wq wake-up,
    userspace VA, expected value, signalled flag) remain in the wrapper.
    
    The local user_fence_destroy/get/put/worker/kick_ufence/user_fence_cb
    functions are removed. Their logic moves to xe_ufence_ops.worker and
    xe_ufence_ops.destroy, which are called by drm_user_fence_work().
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
    Cc: David Airlie <airlied@gmail.com>
    Cc: Simona Vetter <simona@ffwll.ch>
    Cc: Sumit Semwal <sumit.semwal@linaro.org>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Alex Deucher <alexander.deucher@amd.com>
    Cc: intel-xe@lists.freedesktop.org
    Cc: dri-devel@lists.freedesktop.org
    Cc: linux-media@vger.kernel.org
    Cc: linaro-mm-sig@lists.linaro.org
    Cc: linux-kernel@vger.kernel.org
    Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
+ /mt/dim checkpatch 98ac27fc649cf3f3f07a56c0d3df839be8bfa95d drm-intel
28720c6be0e2 drm: Add common drm_user_fence helper
-:61: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#61: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 291 lines checked
028e53acf31d drm/xe: Convert xe_user_fence to drm_user_fence


