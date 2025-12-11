Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F59D3E784
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFB910E6CC;
	Thu, 11 Dec 2025 01:11:26 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86A510E6C3;
 Thu, 11 Dec 2025 01:11:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Multi_Queue_fea?=
 =?utf-8?q?ture_support_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Dec 2025 01:11:25 -0000
Message-ID: <176541548587.75792.11527315452041949685@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: Multi Queue feature support (rev6)
URL   : https://patchwork.freedesktop.org/series/156865/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d8b436d34ddb4892ba86b178fc1ab96876f1d8a2
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Wed Dec 10 17:03:05 2025 -0800

    drm/xe/doc: Add documentation for Multi Queue Group GuC interface
    
    Add kernel documentation for Multi Queue group GuC interface.
    
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b drm-intel
2f87fda5ee05 drm/xe/multi_queue: Add multi_queue_enable_mask to gt information
444552b1cfd0 drm/xe/multi_queue: Add user interface for multi queue support
d52a89aba46c drm/xe/multi_queue: Add GuC interface for multi queue support
54409c414623 drm/xe/multi_queue: Add multi queue priority property
7dcf5201f460 drm/xe/multi_queue: Handle invalid exec queue property setting
af628674e34e drm/xe/multi_queue: Add exec_queue set_property ioctl support
-:109: WARNING:LONG_LINE: line length of 145 exceeds 100 columns
#109: FILE: include/uapi/drm/xe_drm.h:127:
+#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)

total: 0 errors, 1 warnings, 0 checks, 101 lines checked
d81ad991045e drm/xe/multi_queue: Add support for multi queue dynamic priority change
305a1652c487 drm/xe/multi_queue: Add multi queue information to guc_info dump
24dc18392be3 drm/xe/multi_queue: Handle tearing down of a multi queue
6ac5d9836685 drm/xe/multi_queue: Set QUEUE_DRAIN_MODE for Multi Queue batches
9487d6d7c8d8 drm/xe/multi_queue: Handle CGP context error
ba9b6090795f drm/xe/multi_queue: Reset GT upon CGP_SYNC failure
4151a82f5c1d drm/xe/multi_queue: Teardown group upon job timeout
16784b35a7da drm/xe/multi_queue: Tracepoint support
-:48: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#48: FILE: drivers/gpu/drm/xe/xe_trace.h:105:
+		    TP_STRUCT__entry(

-:60: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#60: FILE: drivers/gpu/drm/xe/xe_trace.h:117:
+		    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 69 lines checked
8946fa220a03 drm/xe/multi_queue: Support active group after primary is destroyed
c1b04380947d drm/xe/doc: Add documentation for Multi Queue Group
d8b436d34ddb drm/xe/doc: Add documentation for Multi Queue Group GuC interface


