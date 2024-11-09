Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E17D6409C
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 02:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCDD10E326;
	Sat,  9 Nov 2024 02:05:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D62E10E339;
 Sat,  9 Nov 2024 02:05:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Support_capture?=
 =?utf-8?q?_and_dump_of_devcoredump_for_general_debug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 09 Nov 2024 02:05:40 -0000
Message-ID: <173111794035.1545706.16722603111013807094@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241109015934.2203462-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241109015934.2203462-1-John.C.Harrison@Intel.com>
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

Series: drm/xe: Support capture and dump of devcoredump for general debug
URL   : https://patchwork.freedesktop.org/series/141122/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 42952f520ad1c55ead8194e8a832f22fa00710ae
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Fri Nov 8 17:59:34 2024 -0800

    drm/xe: Support devcoredump capture from dead CT handler
    
    The dead CT handler was doing a locally rolled fake devcoredump
    capture and print. Replace that with support for calling the genuine
    devcoredump code to do the capture and print instead.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 00976833a8b163cfcad247ba2d22ea4819fd749c drm-intel
2adb260caaf4 drm/xe/devcoredump: Support coredumps without jobs
-:83: WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#83: FILE: drivers/gpu/drm/xe/xe_devcoredump.c:308:
+#if 0

total: 0 errors, 1 warnings, 0 checks, 223 lines checked
7b98877ae3db drm/xe: Trigger a devcoredump capture on a GT reset
1bb276151401 drm/xe: Disconnect coredump structure from xe_device structure
5fd241f217d6 drm/xe: Make coredump printing to in-memory cache optional
42952f520ad1 drm/xe: Support devcoredump capture from dead CT handler
-:77: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#77: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1771:
+	if (!coredump) {
+		xe_gt_err(gt, "Failed to allocate coredump for dead CT capture!\n");

total: 0 errors, 1 warnings, 0 checks, 147 lines checked


