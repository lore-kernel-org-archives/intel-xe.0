Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A97EC83F01
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 13:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D59B10E14F;
	Wed, 30 Aug 2023 13:46:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8517710E51F;
 Wed, 30 Aug 2023 13:46:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 81A7FA00CC;
 Wed, 30 Aug 2023 13:46:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Date: Wed, 30 Aug 2023 13:46:04 -0000
Message-ID: <169340316452.15233.12621142184560947989@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230825115255.1319907-1-jouni.hogander@intel.com>
In-Reply-To: <20230825115255.1319907-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_FBC_ref?=
 =?utf-8?q?actoring_=28rev2=29?=
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

Series: FBC refactoring (rev2)
URL   : https://patchwork.freedesktop.org/series/122905/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
/workspace
+ pwd
+ ls -la
total 884
drwxrwxr-x 10 1003 1003   4096 Aug 30 13:46 .
drwxr-xr-x  1 root root   4096 Aug 30 13:46 ..
-rw-rw-r--  1 1003 1003 787924 Aug 30 13:45 build.log
-rw-rw-r--  1 1003 1003    851 Aug 30 13:37 checkpatch.log
drwxrwxr-x  5 1003 1003   4096 Aug 30 13:36 ci
drwxrwxr-x  9 1003 1003   4096 Aug 30 13:36 docker
drwxrwxr-x  8 1003 1003   4096 Aug 30 13:36 .git
-rw-rw-r--  1 1003 1003    505 Aug 30 13:37 git_apply.log
drwxrwxr-x  4 1003 1003   4096 Aug 30 13:36 .github
-rw-rw-r--  1 1003 1003    233 Aug 30 13:36 .groovylintrc.json
-rw-rw-r--  1 1003 1003     78 Aug 30 13:46 hooks.log
drwxrwxr-x 31 1003 1003   4096 Aug 30 13:45 kernel
-rw-rw-r--  1 1003 1003  19226 Aug 30 13:37 kernel.mbox
-rw-rw-r--  1 1003 1003  26482 Aug 30 13:38 kunit.log
-rw-rw-r--  1 1003 1003     48 Aug 30 13:37 parent.tag
drwxrwxr-x 45 1003 1003   4096 Aug 30 13:36 pipelines
-rw-rw-r--  1 1003 1003    793 Aug 30 13:36 README.adoc
drwxrwxr-x  3 1003 1003   4096 Aug 30 13:36 scripts
drwxrwxr-x  2 1003 1003   4096 Aug 30 13:36 .vscode
+ uname -a
Linux b71fae0c0b02 5.4.0-149-generic #166-Ubuntu SMP Tue Apr 18 16:51:45 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
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
2d9d69f49 drm/xe: Add Xe implementation for fence checks used by fbc code
c57ecdf4c drm/xe: Add i915_gem.h compatibility header
d71d907d0 drm/xe: Xe stolen memory handling for fbc support
dec8f14f9 fixup! drm/i915/display: Remaining changes to make xe compile
fb8c2f496 Revert "drm/i915/display: Implement FBC support"
7af4e6595 fixup! drm/xe/pvc: Use fast copy engines as migrate engine on PVC
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


