Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0600BC79F83
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 08:25:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D9110F957;
	Fri,  4 Sep 2026 08:25:19 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240C710F952;
 Fri,  4 Sep 2026 08:25:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Guard_page-?=
 =?utf-8?q?fault_ack_with_runtime_PM_check_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Sep 2026 08:25:18 -0000
Message-ID: <178851031811.122453.3472829691422388392@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260904080505.4159219-2-varun.gupta@intel.com>
In-Reply-To: <20260904080505.4159219-2-varun.gupta@intel.com>
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

Series: drm/xe/guc: Guard page-fault ack with runtime PM check (rev2)
URL   : https://patchwork.freedesktop.org/series/173248/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 010a5c586cf94fc0f6e41df77d3a26fdd2e38343
Author: Varun Gupta <varun.gupta@intel.com>
Date:   Fri Sep 4 13:35:06 2026 +0530

    drm/xe/guc: Guard page-fault ack with runtime PM check
    
    During VM teardown, the VM's runtime PM reference is dropped
    asynchronously, allowing the device to autosuspend while stale page
    faults belonging to the now-dead VM are still queued. When the
    page-fault worker later tries to ack one of these, it calls into
    guc_ct_send_locked() on an already-suspended device, tripping:
    
      Assertion `!xe_pm_runtime_suspended(xe)` failed!
      WARNING at xe_device.c:1267 xe_device_assert_mem_access+0x11c/0x140 [xe]
    
    A live VM/exec queue always holds a PM reference while it has
    outstanding work, so if the device is suspended at ack time, the
    owning context is already gone and the fault is stale.
    
    Take a runtime PM reference across the entire page-fault ack batch
    preventing mid-batch suspends.
    
    v2:
     - Hold PM ref across the entire batch (begin/end) instead of per-ack.
       This prevents the device from autosuspending mid-batch, which would
       leave write_only acks written but the end flush skipped, and skip
       counter++, desyncing the cadence check.(Himal)
     - Add a comment explaining stale faults.(Himal)
    
    Fixes: f289f7807119 ("drm/xe: Add xe_guc_pagefault layer")
    Reported-by: Szymon Markiewicz <szymon.markiewicz@intel.com>
    Signed-off-by: Varun Gupta <varun.gupta@intel.com>
+ /mt/dim checkpatch 7de170dcd16c97c918da24d86639b6fb05e2527d drm-intel
010a5c586cf9 drm/xe/guc: Guard page-fault ack with runtime PM check
-:33: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#33: 
Reported-by: Szymon Markiewicz <szymon.markiewicz@intel.com>
Signed-off-by: Varun Gupta <varun.gupta@intel.com>

total: 0 errors, 1 warnings, 0 checks, 34 lines checked


