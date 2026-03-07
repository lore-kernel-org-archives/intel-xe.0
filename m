Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144C6FC9EC4
	for <intel-xe@archiver.kernel.org>; Sat,  7 Mar 2026 00:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB66F10E340;
	Sat,  7 Mar 2026 00:20:17 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F3A10E16B;
 Sat,  7 Mar 2026 00:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_error_path_of_xe=5Fex?=
 =?utf-8?q?ec=5Fqueue=5Fcreate=5Fioctl=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Mar 2026 00:20:16 -0000
Message-ID: <177284281632.329708.3646324502910298187@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260306165207.176758-1-shuicheng.lin@intel.com>
In-Reply-To: <20260306165207.176758-1-shuicheng.lin@intel.com>
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

Series: Fix error path of xe_exec_queue_create_ioctl() (rev2)
URL   : https://patchwork.freedesktop.org/series/162714/
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
commit 60bfaa61213a5921fe9b9e73f9c5f447c517de25
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Fri Mar 6 16:52:07 2026 +0000

    drm/xe: Fix exec queue unwind on hw engine group add failure
    
    When xe_hw_engine_group_add_exec_queue() fails in
    xe_exec_queue_create_ioctl(), to undo xe_exec_queue_group_add()
    and xe_vm_add_compute_exec_queue(), the code should unwind through
    kill_exec_queue rather than directly dropping the queue reference.
    
    Use a new kill_exec_queue_no_del label to skip
    xe_hw_engine_group_del_exec_queue() since the queue was never
    successfully added to the group.
    
    v2: correct the jump label from delete_queue_group to kill_exec_queue (Matt)
    v3: add new label to skip unnecessary del when add failed
    
    Fixes: d9ec63474648 ("drm/xe/multi_queue: Add user interface for multi queue support")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch fce8d7fb2107068c269b868d51aba5f9cf85998a drm-intel
b1f11e528b65 drm/xe: Fix missing xe_hw_engine_group_del_exec_queue() in error path
-:14: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: 7970cb36966c ("'drm/xe/hw_engine_group: Register hw engine group's exec queues")'
#14: 
Fixes: 7970cb36966c ("drm/xe/hw_engine_group: Register hw engine group's exec queues")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
60bfaa61213a drm/xe: Fix exec queue unwind on hw engine group add failure
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
v2: correct the jump label from delete_queue_group to kill_exec_queue (Matt)

total: 0 errors, 1 warnings, 0 checks, 15 lines checked


