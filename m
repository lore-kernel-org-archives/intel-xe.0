Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78318C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 00:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1629F112911;
	Tue, 16 Apr 2024 00:58:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6498112914;
 Tue, 16 Apr 2024 00:58:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?6=2C1/4=5D_drm/xe/lrc=3A_Add_xe_lrc_ring_tail_function_definition?=
 =?utf-8?q?s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 00:58:49 -0000
Message-ID: <171322912994.1424598.2677874798352642383@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240415215012.2978778-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240415215012.2978778-1-jonathan.cavitt@intel.com>
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

Series: series starting with [v6,1/4] drm/xe/lrc: Add xe lrc ring tail function definitions
URL   : https://patchwork.freedesktop.org/series/132471/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35057f376b5337039b258ae4c66ed9218f4b3fb8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 329026de69e530098bd9314128c25d97f3520028
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Mon Apr 15 14:50:12 2024 -0700

    drm/xe/xe_guc_submit: Declare reset if banned or killed
    
    Add an additional condition to the reset_status guc_exec_queue_op that
    returns true if the exec queue has been banned or killed.  The
    reset_status op is only used for exiting any xe_wait_user_fence_ioctl
    that waits on an exec queue without timing out, so doing this will exit
    the ioctl early in cases where the exec queue can no longer function,
    such as after a GuC stop during a reset.
    
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Reviewed-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch 7bc330055f5c2924b42e389887691fea3f401a45 drm-intel
cc68bc39c5e3 drm/xe/lrc: Add xe lrc ring tail function definitions
-:6: WARNING:TYPO_SPELLING: 'defintions' may be misspelled - perhaps 'definitions'?
#6: 
Add defintions for the functions xe_lrc_set_ring_tail and
    ^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
2e83ae748610 drm/xe/xe_guc_submit: Fix exec queue stop race condition
6ea0a257c08d drm/xe/xe_guc_submit: Allow lr exec queues to be banned
329026de69e5 drm/xe/xe_guc_submit: Declare reset if banned or killed


