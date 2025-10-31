Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4583FCCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 21:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EF310E325;
	Fri, 31 Oct 2025 21:15:36 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECAB10E325;
 Fri, 31 Oct 2025 21:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Multi_Queue_fea?=
 =?utf-8?q?ture_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Oct 2025 21:15:35 -0000
Message-ID: <176194533590.7657.10406112056726750743@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: Multi Queue feature support
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
commit 7f2c4e4148978379ac7e7be3e30795e3b675272d
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Fri Oct 31 11:29:36 2025 -0700

    drm/xe/multi_queue: Enable multi_queue on xe3p_xpc
    
    xe3p_xpc supports multi_queue, enable it.
    
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch d122adb64f56e02d1d9aa432f1a609864e3c33cb drm-intel
b7db5f92a064 drm/xe/multi_queue: Add multi_queue_enable_mask to gt information
380cdbcabd2c drm/xe/multi_queue: Add user interface for multi queue support
54808a2f7616 drm/xe/multi_queue: Add GuC interface for multi queue support
69a64d11a631 drm/xe/multi_queue: Add multi queue priority property
ad9a31d47fb6 drm/xe/multi_queue: Handle invalid exec queue property setting
90af65670a6e drm/xe/multi_queue: Add exec_queue set_property ioctl support
-:98: WARNING:LONG_LINE: line length of 145 exceeds 100 columns
#98: FILE: include/uapi/drm/xe_drm.h:127:
+#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)

total: 0 errors, 1 warnings, 0 checks, 95 lines checked
c07ef2959dcc drm/xe/multi_queue: Add support for multi queue dynamic priority change
0210f9e5e3e5 drm/xe/multi_queue: Add multi queue information to guc_info dump
f72ebca322ec drm/xe/multi_queue: Handle tearing down of a multi queue
752c4f175994 drm/xe/multi_queue: Set QUEUE_DRAIN_MODE for Multi Queue batches
b1bf0dbb43e6 drm/xe/multi_queue: Handle CGP context error
35c5f77f5a51 drm/xe/multi_queue: Tracepoint support
-:47: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#47: FILE: drivers/gpu/drm/xe/xe_trace.h:105:
+		    TP_STRUCT__entry(

-:59: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#59: FILE: drivers/gpu/drm/xe/xe_trace.h:117:
+		    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 69 lines checked
569444bcfa7c drm/xe/multi_queue: Support active group after primary is destroyed
a63f41633cd2 drm/xe/doc: Add documentation for Multi Queue Group
aafec7acf6ba drm/xe/doc: Add documentation for Multi Queue Group GuC interface
7f2c4e414897 drm/xe/multi_queue: Enable multi_queue on xe3p_xpc


