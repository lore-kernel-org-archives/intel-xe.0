Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB58C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 06:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA08410E149;
	Thu,  3 Jul 2025 06:29:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A312810E149;
 Thu,  3 Jul 2025 06:29:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Remove_unused_code_in_dev?=
 =?utf-8?q?coredump=5Fsnapshot?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Jul 2025 06:29:49 -0000
Message-ID: <175152418966.130398.3937873735757850259@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250703062024.3441918-4-shuicheng.lin@intel.com>
In-Reply-To: <20250703062024.3441918-4-shuicheng.lin@intel.com>
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

Series: Remove unused code in devcoredump_snapshot
URL   : https://patchwork.freedesktop.org/series/151105/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8cb62854892d0347ee3c3dbafa85635dd5211bec
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Thu Jul 3 06:20:27 2025 +0000

    drm/xe: Release runtime pm for error path of xe_devcoredump_read()
    
    xe_pm_runtime_put() is missed to be called for the error path in
    xe_devcoredump_read().
    Add function description comments for xe_devcoredump_read() to help
    understand it.
    
    Fixes: c4a2e5f865b7 ("drm/xe: Add devcoredump chunking")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch d04a54cd3b99001adbc4cd3305b44f9f3e658407 drm-intel
a8f3d02d7b02 drm/xe: Remove unused code in devcoredump_snapshot()
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
The deleted code is no longer needed bacause patch ecb633646391("drm/xe/guc: Plumb GuC-capture

-:6: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit ecb633646391 ("drm/xe/guc: Plumb GuC-capture into dev coredump")'
#6: 
The deleted code is no longer needed bacause patch ecb633646391("drm/xe/guc: Plumb GuC-capture

total: 1 errors, 1 warnings, 0 checks, 27 lines checked
8cb62854892d drm/xe: Release runtime pm for error path of xe_devcoredump_read()


