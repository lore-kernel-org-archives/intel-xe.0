Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254C5CA0FE1
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 14:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57A810E7F3;
	Fri,  1 Sep 2023 14:42:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 14BA010E7F3;
 Fri,  1 Sep 2023 14:42:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0F87EA02F0;
 Fri,  1 Sep 2023 14:42:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 01 Sep 2023 14:42:51 -0000
Message-ID: <169357937106.9814.3654936809973902740@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230901142629.4125-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230901142629.4125-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_drm/xe?=
 =?utf-8?q?=3A_Convert_to_drm=5Fexec_=28rev3=29?=
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

Series: drm/xe: Convert to drm_exec (rev3)
URL   : https://patchwork.freedesktop.org/series/123100/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
+ pwd
+ ls -la
/workspace
total 928
drwxrwxr-x 10 1003 1003   4096 Sep  1 14:42 .
drwxr-xr-x  1 root root   4096 Sep  1 14:42 ..
-rw-rw-r--  1 1003 1003 787538 Sep  1 14:42 build.log
-rw-rw-r--  1 1003 1003   1155 Sep  1 14:34 checkpatch.log
drwxrwxr-x  5 1003 1003   4096 Sep  1 14:32 ci
drwxrwxr-x  9 1003 1003   4096 Sep  1 14:32 docker
drwxrwxr-x  8 1003 1003   4096 Sep  1 14:32 .git
-rw-rw-r--  1 1003 1003    581 Sep  1 14:34 git_apply.log
drwxrwxr-x  4 1003 1003   4096 Sep  1 14:32 .github
-rw-rw-r--  1 1003 1003    233 Sep  1 14:32 .groovylintrc.json
-rw-rw-r--  1 1003 1003     78 Sep  1 14:42 hooks.log
drwxrwxr-x 31 1003 1003   4096 Sep  1 14:42 kernel
-rw-rw-r--  1 1003 1003  65111 Sep  1 14:34 kernel.mbox
-rw-rw-r--  1 1003 1003  26482 Sep  1 14:35 kunit.log
-rw-rw-r--  1 1003 1003     48 Sep  1 14:34 parent.tag
drwxrwxr-x 45 1003 1003   4096 Sep  1 14:32 pipelines
-rw-rw-r--  1 1003 1003    793 Sep  1 14:32 README.adoc
drwxrwxr-x  3 1003 1003   4096 Sep  1 14:32 scripts
drwxrwxr-x  2 1003 1003   4096 Sep  1 14:32 .vscode
+ uname -a
Linux 7c0ff3079d78 5.4.0-149-generic #166-Ubuntu SMP Tue Apr 18 16:51:45 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
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
33a727582 drm/xe: Convert remaining instances of ttm_eu_reserve_buffers to drm_exec
352aeb1fc drm/xe: Convert pagefaulting code to use drm_exec
15ebc8466 drm/xe: Rework xe_exec and the VM rebind worker to use the drm_exec helper
7119b96f1 drm/xe/bo: Remove the lock_no_vm()/unlock_no_vm() interface
fa5988bdd drm/xe/vm: Simplify and document xe_vm_lock()
a6689c9b6 drm/xe/bo: Simplify xe_bo_lock()
e4a038763 fixup! drm/xe: Add min/max cap for engine scheduler properties
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


