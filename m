Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDECCCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 23:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D99E10E0CD;
	Tue,  4 Nov 2025 23:17:00 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEBD10E0CD;
 Tue,  4 Nov 2025 23:16:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Multi_Queue_fea?=
 =?utf-8?q?ture_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Nov 2025 23:16:58 -0000
Message-ID: <176229821864.17530.14552868532136569342@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: Multi Queue feature support (rev2)
URL   : https://patchwork.freedesktop.org/series/156865/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 231aa8a462e5d9f63ab458c1e294431031cfc5e6
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Tue Nov 4 10:51:50 2025 -0800

    drm/xe/multi_queue: Enable multi_queue on xe3p_xpc
    
    xe3p_xpc supports multi_queue, enable it.
    
    v2: Rename multi_queue_enable_mask to multi_queue_engine_class_mask
        (Matt Brost)
    
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 957ab9ac657700dee50f42438ed79652dad939a0 drm-intel
94a2a1b50dee drm/xe/multi_queue: Add multi_queue_enable_mask to gt information
f57cb9b50165 drm/xe/multi_queue: Add user interface for multi queue support
f149e62b42da drm/xe/multi_queue: Add GuC interface for multi queue support
d41436ff4587 drm/xe/multi_queue: Add multi queue priority property
41c623c4ff89 drm/xe/multi_queue: Handle invalid exec queue property setting
eb08c903e190 drm/xe/multi_queue: Add exec_queue set_property ioctl support
-:109: WARNING:LONG_LINE: line length of 145 exceeds 100 columns
#109: FILE: include/uapi/drm/xe_drm.h:127:
+#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)

total: 0 errors, 1 warnings, 0 checks, 101 lines checked
e6d62a872d11 drm/xe/multi_queue: Add support for multi queue dynamic priority change
0faf37506924 drm/xe/multi_queue: Add multi queue information to guc_info dump
1f1b739ce223 drm/xe/multi_queue: Handle tearing down of a multi queue
994f4a47c885 drm/xe/multi_queue: Set QUEUE_DRAIN_MODE for Multi Queue batches
42996778255d drm/xe/multi_queue: Handle CGP context error
dfe62c113ffa drm/xe/multi_queue: Tracepoint support
-:48: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#48: FILE: drivers/gpu/drm/xe/xe_trace.h:105:
+		    TP_STRUCT__entry(

-:60: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#60: FILE: drivers/gpu/drm/xe/xe_trace.h:117:
+		    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 69 lines checked
241218bb949c drm/xe/multi_queue: Support active group after primary is destroyed
4cf5b9b5a6ca drm/xe/doc: Add documentation for Multi Queue Group
3f1d6705a455 drm/xe/doc: Add documentation for Multi Queue Group GuC interface
231aa8a462e5 drm/xe/multi_queue: Enable multi_queue on xe3p_xpc


