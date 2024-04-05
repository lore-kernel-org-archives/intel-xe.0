Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBB5C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 17:11:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B0B10EBE3;
	Fri,  5 Apr 2024 17:11:30 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C871910ECDC;
 Fri,  5 Apr 2024 17:11:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/3=5D_drm/xe/xe=5Fguc=5Fsubmit=3A_Fix_exec_queue_stop_race_c?=
 =?utf-8?q?ondition?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Apr 2024 17:11:27 -0000
Message-ID: <171233708782.1239316.17342073950430494161@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405135100.967990-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240405135100.967990-1-jonathan.cavitt@intel.com>
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

Series: series starting with [v3,1/3] drm/xe/xe_guc_submit: Fix exec queue stop race condition
URL   : https://patchwork.freedesktop.org/series/132081/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1f3fe4cfad873ed7d6c5a6122acd01db404642a4
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Fri Apr 5 06:51:00 2024 -0700

    drm/xe/xe_guc_submit: Declare reset if banned or killed
    
    Add an additional condition to the reset_status guc_exec_queue_op that
    returns true if the exec queue has been banned or killed.  The
    reset_status op is only used for exiting any xe_wait_user_fence_ioctl
    that waits on an exec queue without timing out, so doing this will exit
    the ioctl early in cases where the exec queue can no longer function,
    such as after a GuC stop during a reset.
    
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 8cb1ee178ef7e504e233814ef50c1f18f42dac72 drm-intel
b4a6a304abd7 drm/xe/xe_guc_submit: Fix exec queue stop race condition
41e462090b81 drm/xe/xe_guc_submit: Allow lr exec queues to be banned
-:43: ERROR:TRAILING_WHITESPACE: trailing whitespace
#43: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:1440:
+^I^I$

total: 1 errors, 0 warnings, 0 checks, 25 lines checked
1f3fe4cfad87 drm/xe/xe_guc_submit: Declare reset if banned or killed


