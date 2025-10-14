Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB0CCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 04:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E17C10E52C;
	Tue, 14 Oct 2025 04:28:05 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B5A10E535;
 Tue, 14 Oct 2025 04:28:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Destroy_LR_?=
 =?utf-8?q?exec_queue_directly_if_GuC_is_not_running?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Oct 2025 04:28:04 -0000
Message-ID: <176041608420.9061.16871550552342977423@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251014033646.1619865-2-shuicheng.lin@intel.com>
In-Reply-To: <20251014033646.1619865-2-shuicheng.lin@intel.com>
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

Series: drm/xe/guc: Destroy LR exec queue directly if GuC is not running
URL   : https://patchwork.freedesktop.org/series/155867/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4ea3fd31ee1e3dd4c70d67f90b7fc36e748ff4a7
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Tue Oct 14 03:36:47 2025 +0000

    drm/xe/guc: Destroy LR exec queue directly if GuC is not running
    
    During LR exec queue cleanup, if the GuC firmware is not running,
    the driver cannot communicate with the GuC to properly deregister
    the exec queue. In this case, directly destroy the exec queue
    instead of attempting deregistration.
    
    This prevents schedule disable failure and GuC ID resource leaks as
    below dmesg log:
    "
    [   50.242564] pci 0000:03:00.0: [drm] GT0: Schedule disable failed to respond, guc_id=2
    [   50.242568] ------------[ cut here ]------------
    [   50.242584] pci 0000:03:00.0: [drm] Assertion `ret` failed!
    ...
    [   50.244942] pci 0000:03:00.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
    [   50.244970] pci 0000:03:00.0: [drm] GT0:     total 65535
    [   50.245002] pci 0000:03:00.0: [drm] GT0:     used 1
    [   50.245032] pci 0000:03:00.0: [drm] GT0:     range 2..2 (1)
    "
    
    Fixes: 8ae8a2e8dd21 ("drm/xe: Long running job update")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch c917f7d11493984be9f381ca0a7667bd3e587ada drm-intel
4ea3fd31ee1e drm/xe/guc: Destroy LR exec queue directly if GuC is not running
-:50: WARNING:LONG_LINE_COMMENT: line length of 104 exceeds 100 columns
#50: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:1068:
+		/* If GuC is not running, just destroy the exec queue as we can't communicate with it */

total: 0 errors, 1 warnings, 0 checks, 31 lines checked


