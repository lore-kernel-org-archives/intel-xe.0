Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7093CC83F15
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 08:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402FC10E4D4;
	Wed, 30 Aug 2023 08:06:01 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D7BB810E4D8;
 Wed, 30 Aug 2023 08:05:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D43B7A00CC;
 Wed, 30 Aug 2023 08:05:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Date: Wed, 30 Aug 2023 08:05:56 -0000
Message-ID: <169338275686.15233.6971486216426210307@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230830075419.26484-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230830075419.26484-2-janusz.krzysztofik@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_kunit?=
 =?utf-8?q?=3A_Fix_test_log_size_limit_too_low_for_some_tests?=
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

Series: kunit: Fix test log size limit too low for some tests
URL   : https://patchwork.freedesktop.org/series/123054/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
/workspace
+ pwd
+ ls -la
total 868
drwxrwxr-x 10 1003 1003   4096 Aug 30 08:05 .
drwxr-xr-x  1 root root   4096 Aug 30 08:05 ..
-rw-rw-r--  1 1003 1003 787538 Aug 30 08:05 build.log
-rw-rw-r--  1 1003 1003   1206 Aug 30 07:57 checkpatch.log
drwxrwxr-x  5 1003 1003   4096 Aug 30 07:56 ci
drwxrwxr-x  9 1003 1003   4096 Aug 30 07:55 docker
drwxrwxr-x  8 1003 1003   4096 Aug 30 07:55 .git
-rw-rw-r--  1 1003 1003    250 Aug 30 07:57 git_apply.log
drwxrwxr-x  4 1003 1003   4096 Aug 30 07:55 .github
-rw-rw-r--  1 1003 1003    233 Aug 30 07:55 .groovylintrc.json
-rw-rw-r--  1 1003 1003     78 Aug 30 08:05 hooks.log
drwxrwxr-x 31 1003 1003   4096 Aug 30 08:05 kernel
-rw-rw-r--  1 1003 1003   1653 Aug 30 07:57 kernel.mbox
-rw-rw-r--  1 1003 1003  26482 Aug 30 07:58 kunit.log
-rw-rw-r--  1 1003 1003     48 Aug 30 07:57 parent.tag
drwxrwxr-x 45 1003 1003   4096 Aug 30 07:55 pipelines
-rw-rw-r--  1 1003 1003    793 Aug 30 07:55 README.adoc
drwxrwxr-x  3 1003 1003   4096 Aug 30 07:55 scripts
drwxrwxr-x  2 1003 1003   4096 Aug 30 07:55 .vscode
+ uname -a
Linux 4d62bbfc288f 5.4.0-149-generic #166-Ubuntu SMP Tue Apr 18 16:51:45 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
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
6a30f1dac kunit: Fix test log size limit too low for some tests
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


