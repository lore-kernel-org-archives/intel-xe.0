Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61E5C71153
	for <intel-xe@archiver.kernel.org>; Mon,  4 Sep 2023 14:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9492E10E35E;
	Mon,  4 Sep 2023 14:01:15 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A53610E35E;
 Mon,  4 Sep 2023 14:01:13 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 97809AADD8;
 Mon,  4 Sep 2023 14:01:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Date: Mon, 04 Sep 2023 14:01:13 -0000
Message-ID: <169383607361.21386.8848522140250126126@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230904123605.3255946-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20230904123605.3255946-1-mika.kuoppala@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_=3A_Mak?=
 =?utf-8?q?e_bind_op_extensible?=
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

Series: : Make bind op extensible
URL   : https://patchwork.freedesktop.org/series/123243/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
+ pwd
+ ls -la
/workspace
total 868
drwxrwxr-x 10 1003 1003   4096 Sep  4 14:01 .
drwxr-xr-x  1 root root   4096 Sep  4 14:01 ..
-rw-rw-r--  1 1003 1003 787538 Sep  4 14:00 build.log
-rw-rw-r--  1 1003 1003    882 Sep  4 13:52 checkpatch.log
drwxrwxr-x  5 1003 1003   4096 Sep  4 13:51 ci
drwxrwxr-x  9 1003 1003   4096 Sep  4 13:51 docker
drwxrwxr-x  8 1003 1003   4096 Sep  4 13:51 .git
-rw-rw-r--  1 1003 1003    213 Sep  4 13:52 git_apply.log
drwxrwxr-x  4 1003 1003   4096 Sep  4 13:51 .github
-rw-rw-r--  1 1003 1003    233 Sep  4 13:51 .groovylintrc.json
-rw-rw-r--  1 1003 1003     78 Sep  4 14:01 hooks.log
drwxrwxr-x 31 1003 1003   4096 Sep  4 14:00 kernel
-rw-rw-r--  1 1003 1003   1202 Sep  4 13:52 kernel.mbox
-rw-rw-r--  1 1003 1003  26482 Sep  4 13:54 kunit.log
-rw-rw-r--  1 1003 1003     48 Sep  4 13:52 parent.tag
drwxrwxr-x 45 1003 1003   4096 Sep  4 13:51 pipelines
-rw-rw-r--  1 1003 1003    793 Sep  4 13:51 README.adoc
drwxrwxr-x  3 1003 1003   4096 Sep  4 13:51 scripts
drwxrwxr-x  2 1003 1003   4096 Sep  4 13:51 .vscode
+ uname -a
Linux 40b2c93e24c5 5.4.0-149-generic #166-Ubuntu SMP Tue Apr 18 16:51:45 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
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
20b19c5d7 drm/xe: Extend drm_xe_vm_bind_op
7ec520d3a drm/xe/selftests: make eviction test tile centric
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


