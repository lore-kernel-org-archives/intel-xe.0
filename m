Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEC6C83F10
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 09:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3503210E5E1;
	Thu, 31 Aug 2023 09:30:10 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5B1AC10E5E1;
 Thu, 31 Aug 2023 09:30:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 358B7AADE1;
 Thu, 31 Aug 2023 09:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Thu, 31 Aug 2023 09:30:06 -0000
Message-ID: <169347420621.12506.468440141970476145@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_drm/xe?=
 =?utf-8?q?=3A_fdinfo_memory_stats?=
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

Series: drm/xe: fdinfo memory stats
URL   : https://patchwork.freedesktop.org/series/123102/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
+ pwd
+ ls -la
/workspace
total 892
drwxrwxr-x 10 1003 1003   4096 Aug 31 09:30 .
drwxr-xr-x  1 root root   4096 Aug 31 09:30 ..
-rw-rw-r--  1 1003 1003 787718 Aug 31 09:29 build.log
-rw-rw-r--  1 1003 1003   1223 Aug 31 09:21 checkpatch.log
drwxrwxr-x  5 1003 1003   4096 Aug 31 09:20 ci
drwxrwxr-x  9 1003 1003   4096 Aug 31 09:20 docker
drwxrwxr-x  8 1003 1003   4096 Aug 31 09:20 .git
-rw-rw-r--  1 1003 1003    561 Aug 31 09:21 git_apply.log
drwxrwxr-x  4 1003 1003   4096 Aug 31 09:20 .github
-rw-rw-r--  1 1003 1003    233 Aug 31 09:20 .groovylintrc.json
-rw-rw-r--  1 1003 1003     78 Aug 31 09:30 hooks.log
drwxrwxr-x 31 1003 1003   4096 Aug 31 09:29 kernel
-rw-rw-r--  1 1003 1003  24713 Aug 31 09:21 kernel.mbox
-rw-rw-r--  1 1003 1003  26482 Aug 31 09:22 kunit.log
-rw-rw-r--  1 1003 1003     48 Aug 31 09:21 parent.tag
drwxrwxr-x 45 1003 1003   4096 Aug 31 09:20 pipelines
-rw-rw-r--  1 1003 1003    793 Aug 31 09:20 README.adoc
drwxrwxr-x  3 1003 1003   4096 Aug 31 09:20 scripts
drwxrwxr-x  2 1003 1003   4096 Aug 31 09:20 .vscode
+ uname -a
Linux 04d2d3f4978f 5.4.0-149-generic #166-Ubuntu SMP Tue Apr 18 16:51:45 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
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
129e11bb3 drm/xe: Implement fdinfo memory stats printing
1749c9b82 drm/xe: Account ring buffer and context state storage
5f84f5c28 drm/xe: Track page table memory usage for client
0455e5eb5 drm/xe: Record each drm client with its VM
5820e7b5e drm/xe: Add tracking support for bos per client
a36a95b2a drm/xe: Interface xe drm client with fdinfo interface
d2f332447 drm/xe: Add drm-client infrastructure
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


