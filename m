Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5070EC83F29
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 05:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FF810E151;
	Thu, 31 Aug 2023 05:58:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D03910E151;
 Thu, 31 Aug 2023 05:58:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9AD73AADF2;
 Thu, 31 Aug 2023 05:58:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Date: Thu, 31 Aug 2023 05:58:32 -0000
Message-ID: <169346151263.12507.11291850150893459556@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230825093904.1230143-1-jouni.hogander@intel.com>
In-Reply-To: <20230825093904.1230143-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_Frontbu?=
 =?utf-8?q?ffer_tracking_refactoring_=28rev3=29?=
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

Series: Frontbuffer tracking refactoring (rev3)
URL   : https://patchwork.freedesktop.org/series/122899/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
/workspace
+ pwd
+ ls -la
total 884
drwxrwxr-x 10 1003 1003   4096 Aug 31 05:58 .
drwxr-xr-x  1 root root   4096 Aug 31 05:58 ..
-rw-rw-r--  1 1003 1003 787664 Aug 31 05:58 build.log
-rw-rw-r--  1 1003 1003    809 Aug 31 05:50 checkpatch.log
drwxrwxr-x  5 1003 1003   4096 Aug 31 05:48 ci
drwxrwxr-x  9 1003 1003   4096 Aug 31 05:48 docker
drwxrwxr-x  8 1003 1003   4096 Aug 31 05:48 .git
-rw-rw-r--  1 1003 1003    910 Aug 31 05:49 git_apply.log
drwxrwxr-x  4 1003 1003   4096 Aug 31 05:48 .github
-rw-rw-r--  1 1003 1003    233 Aug 31 05:48 .groovylintrc.json
-rw-rw-r--  1 1003 1003     78 Aug 31 05:58 hooks.log
drwxrwxr-x 31 1003 1003   4096 Aug 31 05:58 kernel
-rw-rw-r--  1 1003 1003  17982 Aug 31 05:49 kernel.mbox
-rw-rw-r--  1 1003 1003  26482 Aug 31 05:51 kunit.log
-rw-rw-r--  1 1003 1003     48 Aug 31 05:49 parent.tag
drwxrwxr-x 45 1003 1003   4096 Aug 31 05:48 pipelines
-rw-rw-r--  1 1003 1003    793 Aug 31 05:48 README.adoc
drwxrwxr-x  3 1003 1003   4096 Aug 31 05:48 scripts
drwxrwxr-x  2 1003 1003   4096 Aug 31 05:48 .vscode
+ uname -a
Linux 22dfa9c5398f 5.4.0-149-generic #166-Ubuntu SMP Tue Apr 18 16:51:45 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
+ export
+ grep -Ei '(^|\W)CI_'
declare -x CI_KERNEL_BUILD_DIR="/workspace/kernel/build64"
declare -x CI_KERNEL_IMAGES_DIR="/workspace/kernel/archive/boot"
declare -x CI_KERNEL_MODULES_DIR="/workspace/kernel/archive"
declare -x CI_KERNEL_SRC_DIR="/workspace/kernel"
declare -x CI_SRC_DIR="/workspace/kernel"
declare -x CI_TOOLS_SRC_DIR="/workspace/ci"
declare -x CI_WORKSPACE_DIR="/workspace"
+ '[' -n /workspace ']'
+ git_args='-C /workspace/kernel'
+ git_log_args=
+ git --no-pager -C /workspace/kernel log --format=oneline --abbrev-commit
bc746453c drm/i915/display: Use drm_gem_object_get/put
7d099f917 fixup! drm/i915/display: Remaining changes to make xe compile
ade212e03 drm/xe: Add empty define for i915_ggtt_clear_scanout
4917732a2 fixup! drm/i915/display: Remaining changes to make xe compile
574ac557c drm/xe: Add struct i915_active for Xe
d3cc8ce27 drm/xe/display: Include i916_active header
685c7b9ff drm/xe: Add i915_active.h compatibility header
a1f5c7ddc fixup! drm/i915/display: Remaining changes to make xe compile
e73716a6e drm/xe: Add frontbuffer setter/getter for xe_bo
77861b981 fixup! drm/i915/display: Remaining changes to make xe compile
1c04e348b drm/xe: Add macro to get i915 device from xe_bo
432300b6d fixup! drm/i915/display: Remaining changes to make xe compile
72da4b45f drm/xe: Prevent return with locked vm
run-parts: executing /workspace/ci/hooks/10-build-W1
+ SRC_DIR=/workspace/kernel
+ RESTORE_DISPLAY_CONFIG=0
+ '[' -n /workspace/kernel/build64 ']'
+ BUILD_DIR=/workspace/kernel/build64
+ cd /workspace/kernel
+ grep -q -e '^CONFIG_DRM_XE_DISPLAY=[yY]' /workspace/kernel/build64/.config
grep: /workspace/kernel/build64/.config: No such file or directory
+ trap cleanup EXIT
+ ./scripts/config --file /workspace/kernel/build64/.config --disable CONFIG_DRM_XE_DISPLAY
grep: /workspace/kernel/build64/.config: No such file or directory
./scripts/config: line 116: /workspace/kernel/build64/.config: No such file or directory
+ cleanup
+ '[' 0 -eq 1 ']'
run-parts: /workspace/ci/hooks/10-build-W1 exited with return code 1


