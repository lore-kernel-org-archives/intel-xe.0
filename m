Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E119CFA448
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 04:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5100010E7E7;
	Fri, 21 Nov 2025 04:01:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74AA10E7E7;
 Fri, 21 Nov 2025 04:01:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Multi_Queue_fea?=
 =?utf-8?q?ture_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Nov 2025 04:01:13 -0000
Message-ID: <176369767367.15649.15198138520236689600@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: Multi Queue feature support (rev3)
URL   : https://patchwork.freedesktop.org/series/156865/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1281c9f7fe58cd9bd4ec167922e4a28f8843991c
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Thu Nov 20 19:51:52 2025 -0800

    drm/xe/multi_queue: Enable multi_queue on xe3p_xpc
    
    xe3p_xpc supports multi_queue, enable it.
    
    v2: Rename multi_queue_enable_mask to multi_queue_engine_class_mask
        (Matt Brost)
    
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 3d718db04a365cc44a3bc81ffa4db7bbd2e645d7 drm-intel
0df37791a4c3 drm/xe/multi_queue: Add multi_queue_enable_mask to gt information
4ba810b2f506 drm/xe/multi_queue: Add user interface for multi queue support
cf8264933995 drm/xe/multi_queue: Add GuC interface for multi queue support
44bbd9a48c98 drm/xe/multi_queue: Add multi queue priority property
30d771d318cc drm/xe/multi_queue: Handle invalid exec queue property setting
1486f2bf7345 drm/xe/multi_queue: Add exec_queue set_property ioctl support
-:109: WARNING:LONG_LINE: line length of 145 exceeds 100 columns
#109: FILE: include/uapi/drm/xe_drm.h:127:
+#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)

total: 0 errors, 1 warnings, 0 checks, 101 lines checked
3ebdd1fa8f2f drm/xe/multi_queue: Add support for multi queue dynamic priority change
14eac2a1fb37 drm/xe/multi_queue: Add multi queue information to guc_info dump
16eacd13fea1 drm/xe/multi_queue: Handle tearing down of a multi queue
426c2f93a5ef drm/xe/multi_queue: Set QUEUE_DRAIN_MODE for Multi Queue batches
63a77c5edba4 drm/xe/multi_queue: Handle CGP context error
1068c65f407b drm/xe/multi_queue: Reset GT upon CGP_SYNC failure
d3ba88601115 drm/xe/multi_queue: Tracepoint support
-:48: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#48: FILE: drivers/gpu/drm/xe/xe_trace.h:105:
+		    TP_STRUCT__entry(

-:60: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#60: FILE: drivers/gpu/drm/xe/xe_trace.h:117:
+		    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 69 lines checked
2086eceebd36 drm/xe/multi_queue: Support active group after primary is destroyed
5c67e0b327d8 drm/xe/xe3p: Disable GuC Dynamic ICS for Xe3p
6232edcd2bd6 drm/xe/doc: Add documentation for Multi Queue Group
ddc795983dbf drm/xe/doc: Add documentation for Multi Queue Group GuC interface
1281c9f7fe58 drm/xe/multi_queue: Enable multi_queue on xe3p_xpc


