Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FE1D3B7EA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 03:30:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B35410E1AB;
	Tue,  9 Dec 2025 03:30:28 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFC010E1AB;
 Tue,  9 Dec 2025 03:30:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Multi_Queue_fea?=
 =?utf-8?q?ture_support_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Dec 2025 03:30:26 -0000
Message-ID: <176525102663.68301.14487903598139368429@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251209032055.1539229-20-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251209032055.1539229-20-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: Multi Queue feature support (rev4)
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
commit f40f5be9d4ec0765ba49eb47edc0723cca86de40
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Mon Dec 8 19:21:08 2025 -0800

    drm/xe/multi_queue: Enable multi_queue on xe3p_xpc
    
    xe3p_xpc supports multi_queue, enable it.
    
    v2: Rename multi_queue_enable_mask to multi_queue_engine_class_mask
        (Matt Brost)
    
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 48deab361d3b570e2210875fdc8ffb29627d054f drm-intel
913def12f51a drm/xe/multi_queue: Add multi_queue_enable_mask to gt information
c85265cabbde drm/xe/multi_queue: Add user interface for multi queue support
4bcfe6a801e4 drm/xe/multi_queue: Add GuC interface for multi queue support
0a3946fb666f drm/xe/multi_queue: Add multi queue priority property
fa1b1f49b985 drm/xe/multi_queue: Handle invalid exec queue property setting
42b43d8ab9ef drm/xe/multi_queue: Add exec_queue set_property ioctl support
-:109: WARNING:LONG_LINE: line length of 145 exceeds 100 columns
#109: FILE: include/uapi/drm/xe_drm.h:127:
+#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)

total: 0 errors, 1 warnings, 0 checks, 101 lines checked
66e59a1fa8da drm/xe/multi_queue: Add support for multi queue dynamic priority change
6f362fe1c032 drm/xe/multi_queue: Add multi queue information to guc_info dump
01a137cc4fe9 drm/xe/multi_queue: Handle tearing down of a multi queue
67a502c060fa drm/xe/multi_queue: Set QUEUE_DRAIN_MODE for Multi Queue batches
535c811ff00d drm/xe/multi_queue: Handle CGP context error
b507bc0ae103 drm/xe/multi_queue: Reset GT upon CGP_SYNC failure
58838a3d6b6f drm/xe/multi_queue: Teardown group upon job timeout
0b4f93a747e4 drm/xe/multi_queue: Tracepoint support
-:48: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#48: FILE: drivers/gpu/drm/xe/xe_trace.h:105:
+		    TP_STRUCT__entry(

-:60: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#60: FILE: drivers/gpu/drm/xe/xe_trace.h:117:
+		    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 69 lines checked
f63b46aa3bbc drm/xe/multi_queue: Support active group after primary is destroyed
993ae5d8fcfb drm/xe/doc: Add documentation for Multi Queue Group
3de7e3a5fbd3 drm/xe/doc: Add documentation for Multi Queue Group GuC interface
f40f5be9d4ec drm/xe/multi_queue: Enable multi_queue on xe3p_xpc


