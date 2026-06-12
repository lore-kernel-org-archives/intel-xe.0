Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A04CD98CC
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 04:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527D110E097;
	Fri, 12 Jun 2026 04:53:42 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A854B10E097;
 Fri, 12 Jun 2026 04:53:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Disable_schedul?=
 =?utf-8?q?ing_early_on_FD_close_to_avoid_CAT_error_cascade?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jun 2026 04:53:40 -0000
Message-ID: <178124002069.71849.603128067087986944@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260612042548.3740605-1-matthew.brost@intel.com>
In-Reply-To: <20260612042548.3740605-1-matthew.brost@intel.com>
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

Series: drm/xe: Disable scheduling early on FD close to avoid CAT error cascade
URL   : https://patchwork.freedesktop.org/series/168398/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5c6de7ca1fcf861249eb818f1a9ab242e859ec13
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jun 11 21:25:48 2026 -0700

    drm/xe: Disable scheduling early on FD close to avoid CAT error cascade
    
    When an FD is closed with many exec queues, teardown relies on the TDR
    path to clean up scheduling. However, the TDR handling is serialized
    (i.e., only one exec queue is processed at a time), which can make it
    too slow compared to GuC scheduling activity.
    
    In this window, GuC may continue to schedule contexts backed by
    invalid page tables, leading to a cascade of CAT errors and repeated
    engine resets. This significantly increases recovery time and can
    degrade system stability.
    
    To mitigate this, eagerly disable scheduling by sending a self-message
    outside of the TDR path. This prevents further scheduling of invalid
    contexts and avoids the CAT error/reset cascade.
    
    This change improves robustness and reduces recovery latency in
    multiple queue teardown scenarios.
    
    Cc: Wang Xin <x.wang@intel.com>
    Cc: Jia Yao <jia.yao@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 9ce63e3d9903982c053b125686abcb7a84357ed4 drm-intel
5c6de7ca1fcf drm/xe: Disable scheduling early on FD close to avoid CAT error cascade
-:70: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#70: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:2032:
 }
+static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,

total: 0 errors, 0 warnings, 1 checks, 61 lines checked


