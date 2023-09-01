Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6BFCA0FE1
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 13:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE9510E7C0;
	Fri,  1 Sep 2023 13:17:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id F318D10E7C0;
 Fri,  1 Sep 2023 13:17:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EF1D3A02F0;
 Fri,  1 Sep 2023 13:17:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Date: Fri, 01 Sep 2023 13:17:35 -0000
Message-ID: <169357425597.9813.16800998934227818445@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230901125950.76088-1-vinod.govindapillai@intel.com>
In-Reply-To: <20230901125950.76088-1-vinod.govindapillai@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_fbc_on_?=
 =?utf-8?q?any_plane_=28rev3=29?=
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

Series: fbc on any plane (rev3)
URL   : https://patchwork.freedesktop.org/series/122957/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
/workspace
+ pwd
+ ls -la
total 868
drwxrwxr-x 10 1003 1003   4096 Sep  1 13:17 .
drwxr-xr-x  1 root root   4096 Sep  1 13:17 ..
-rw-rw-r--  1 1003 1003 787538 Sep  1 13:17 build.log
-rw-rw-r--  1 1003 1003   1293 Sep  1 13:09 checkpatch.log
drwxrwxr-x  5 1003 1003   4096 Sep  1 13:07 ci
drwxrwxr-x  9 1003 1003   4096 Sep  1 13:07 docker
drwxrwxr-x  8 1003 1003   4096 Sep  1 13:07 .git
-rw-rw-r--  1 1003 1003    255 Sep  1 13:09 git_apply.log
drwxrwxr-x  4 1003 1003   4096 Sep  1 13:07 .github
-rw-rw-r--  1 1003 1003    233 Sep  1 13:07 .groovylintrc.json
-rw-rw-r--  1 1003 1003     78 Sep  1 13:17 hooks.log
drwxrwxr-x 31 1003 1003   4096 Sep  1 13:17 kernel
-rw-rw-r--  1 1003 1003   3646 Sep  1 13:09 kernel.mbox
-rw-rw-r--  1 1003 1003  26482 Sep  1 13:10 kunit.log
-rw-rw-r--  1 1003 1003     48 Sep  1 13:09 parent.tag
drwxrwxr-x 45 1003 1003   4096 Sep  1 13:07 pipelines
-rw-rw-r--  1 1003 1003    793 Sep  1 13:07 README.adoc
drwxrwxr-x  3 1003 1003   4096 Sep  1 13:07 scripts
drwxrwxr-x  2 1003 1003   4096 Sep  1 13:07 .vscode
+ uname -a
Linux e59fe1903ac1 5.4.0-149-generic #166-Ubuntu SMP Tue Apr 18 16:51:45 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
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
1dcfd1d78 drm/i915/lnl: possibility to enable FBC on first three planes
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


