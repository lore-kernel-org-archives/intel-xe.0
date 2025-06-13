Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BECC71135
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 05:23:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6066C10E1AA;
	Fri, 13 Jun 2025 05:23:15 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DD210E1AA;
 Fri, 13 Jun 2025 05:23:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Improve_handling_of_abort?=
 =?utf-8?q?ed_probe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Jun 2025 05:23:14 -0000
Message-ID: <174979219467.74714.10598026518736694527@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250612220937.857-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250612220937.857-1-michal.wajdeczko@intel.com>
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

Series: Improve handling of aborted probe
URL   : https://patchwork.freedesktop.org/series/150190/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bc8c21860f79f357076c40cd0b4d195bd432938d
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Jun 13 00:09:37 2025 +0200

    drm/xe/guc: Explicitly exit CT safe mode on unwind
    
    During driver probe we might be briefly using CT safe mode, which
    is based on a delayed work, but usually we are able to stop this
    once we have IRQ fully operational.  However, if we abort the probe
    quite early then during unwind we might try to destroy the workqueue
    while there is still a pending delayed work that attempts to restart
    itself which triggers a WARN.
    
    This was recently observed during unsuccessful VF initialization:
    
     [ ] xe 0000:00:02.1: probe with driver xe failed with error -62
     [ ] ------------[ cut here ]------------
     [ ] workqueue: cannot queue safe_mode_worker_func [xe] on wq xe-g2h-wq
     [ ] WARNING: CPU: 9 PID: 0 at kernel/workqueue.c:2257 __queue_work+0x287/0x710
     [ ] RIP: 0010:__queue_work+0x287/0x710
     [ ] Call Trace:
     [ ]  delayed_work_timer_fn+0x19/0x30
     [ ]  call_timer_fn+0xa1/0x2a0
    
    Exit the CT safe mode on unwind to avoid that warning.
    
    Fixes: 09b286950f29 ("drm/xe/guc: Allow CTB G2H processing without G2H IRQ")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 07cb1c19ef8056f2f964909c9273b3c45049760e drm-intel
7a42e794b090 drm/xe: Process deferred GGTT node removals on device unwind
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
 [ ] xe 0000:00:02.1: DEVRES REL ffff88811e747340 __xe_bo_unpin_map_no_vm (16 bytes)

total: 0 errors, 1 warnings, 0 checks, 23 lines checked
bc8c21860f79 drm/xe/guc: Explicitly exit CT safe mode on unwind
-:18: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#18: 
 [ ] WARNING: CPU: 9 PID: 0 at kernel/workqueue.c:2257 __queue_work+0x287/0x710

total: 0 errors, 1 warnings, 0 checks, 26 lines checked


