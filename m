Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6081DCC6B1A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 20:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDA510F9AA;
	Tue, 13 Oct 2026 20:40:25 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC4310F9B1;
 Tue, 13 Oct 2026 20:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_FD_close_cleanup_for_XE_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Charles" <daniel.charles@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Oct 2026 20:40:24 -0000
Message-ID: <179192402404.20465.10316806329730214945@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261013201508.514480-1-daniel.charles@intel.com>
In-Reply-To: <20261013201508.514480-1-daniel.charles@intel.com>
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

Series: FD close cleanup for XE (rev2)
URL   : https://patchwork.freedesktop.org/series/175996/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0ae7878889ee54500dec0720b8cfc52c38a28f60
Author: Daniel Charles <daniel.charles@intel.com>
Date:   Tue Oct 13 13:15:08 2026 -0700

    drm/xe: Synchronously wait for queue kill on FD close
    
    The early KILL message disables GuC scheduling outside the serialized
    TDR path, but xe_file_close() does not wait for it to complete before
    dropping queue references. GuC may still schedule contexts whose page
    tables are being torn down, producing CAT errors and engine resets.
    
    Split FD close teardown into two passes: first kill every queue so all
    KILL messages are queued in parallel, then call the new
    xe_exec_queue_kill_sync() and drop the reference for each queue.
    
    The GuC backend implementation waits, with a timeout, for scheduling to
    be disabled with no pending enable/disable. The wait also completes when
    GuC submission is stopped, VF recovery is in progress, or the queue is
    wedged. If GuC does not respond within the timeout, a GT reset is
    triggered to stop GuC scheduling.
    
    Wake ct.wq waiters when a scheduling-disable SCHED_DONE is processed so
    the waiter is woken as soon as scheduling is disabled.
    
    v2:
     - Bound the wait with a timeout, GT reset on timeout (Sashiko, Matt B)
     - Drop the flush_work() loop (Matt B)
     - Use xe_assert() for the killed-queue check (Matt B)
     - Merge the put loop into the kill_sync loop (Matt B)
    
    Assisted-by: LLM
    Signed-off-by: Daniel Charles <daniel.charles@intel.com>
+ /mt/dim checkpatch 83b6bc1390606facc1c0426727905f9fcd75836d drm-intel
fbd89bf89f29 drm/xe: Read scheduler message opcode under lock
-:12: WARNING:BAD_STABLE_ADDRESS_STYLE: Invalid email format for stable: 'stable <stable@kernel.org>', prefer 'stable@kernel.org'
#12: 
Cc: stable <stable@kernel.org>

total: 0 errors, 1 warnings, 0 checks, 65 lines checked
aca4836a184e drm/xe: Disable scheduling early on FD close to avoid CAT error cascade
0ae7878889ee drm/xe: Synchronously wait for queue kill on FD close


