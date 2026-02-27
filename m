Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3F1FD5307
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 07:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB65110EA4E;
	Fri, 27 Feb 2026 07:58:13 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7AA410EA4E;
 Fri, 27 Feb 2026 07:58:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_race_betwee?=
 =?utf-8?q?n_exec_queue_kill_and_VM_cleanup_on_file_close?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Feb 2026 07:58:12 -0000
Message-ID: <177217909286.294209.12542403745110646121@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260227064354.531306-1-x.wang@intel.com>
In-Reply-To: <20260227064354.531306-1-x.wang@intel.com>
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

Series: drm/xe: Fix race between exec queue kill and VM cleanup on file close
URL   : https://patchwork.freedesktop.org/series/162273/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d3e5bf6d0b816bec33c798fe035a8ddfb4b3771f
Author: Xin Wang <x.wang@intel.com>
Date:   Thu Feb 26 22:43:54 2026 -0800

    drm/xe: Fix race between exec queue kill and VM cleanup on file close
    
    During process exit, exec queues are killed asynchronously via GuC
    firmware. If VM page tables are released while the GuC is still
    processing the disable sequence, hardware can access freed memory
    causing CAT errors.
    
    Fix this by reordering xe_file_close() to ensure hardware has stopped
    before releasing resources:
    
    1. Kill all exec queues (existing logic, unchanged)
    2. Flush per-GT workqueues (ordered_wq, g2h_wq) to drain in-flight
       GuC messages
    3. Wait for GuC to confirm all queues are disabled via G2H feedback,
       using wait_event_timeout on guc->ct.wq with a 5s timeout
    4. Release queue references only after hardware confirms idle
    5. Close and release VMs (page table teardown) last
    
    The wait includes bail-out conditions for GuC stopped state (GT reset)
    and VF recovery, consistent with all other wait_event_timeout patterns
    in xe_guc_submit.c.
    
    Add xe_guc_exec_queue_is_idle() to check whether a queue has been
    confirmed idle by the GuC scheduler.
    
    Signed-off-by: Xin Wang <x.wang@intel.com>
+ /mt/dim checkpatch 038d33d4e44e0ca905790b64f418a9195dd5d105 drm-intel
d3e5bf6d0b81 drm/xe: Fix race between exec queue kill and VM cleanup on file close
-:55: WARNING:LINE_SPACING: Missing a blank line after declarations
#55: FILE: drivers/gpu/drm/xe/xe_device.c:171:
+		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+		if (q->gt == gt && !xe_guc_exec_queue_is_idle(primary))

-:155: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#155: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:2805:
+	uint32_t state;

-:187: ERROR:CODE_INDENT: code indent should use tabs where possible
#187: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:2837:
+^I^I^I          EXEC_QUEUE_STATE_PENDING_ENABLE));$

-:195: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#195: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:2845:
+	 * killing first, we correctly wait for pending_disable to clear.
+	*/

total: 1 errors, 2 warnings, 1 checks, 164 lines checked


