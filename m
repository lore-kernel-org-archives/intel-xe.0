Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BF5F53D86
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 18:38:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE52B10E313;
	Mon, 16 Mar 2026 18:38:13 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C0010E30F;
 Mon, 16 Mar 2026 18:38:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_mismatched_?=
 =?utf-8?q?include_guards_in_header_files?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Mar 2026 18:38:12 -0000
Message-ID: <177368629291.361947.18251475545425362955@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260316160451.1688247-2-shuicheng.lin@intel.com>
In-Reply-To: <20260316160451.1688247-2-shuicheng.lin@intel.com>
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

Series: drm/xe: Fix mismatched include guards in header files
URL   : https://patchwork.freedesktop.org/series/163295/
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
commit f30b3fce1b41349de0410d99193808505d72cb05
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Mon Mar 16 16:04:45 2026 +0000

    drm/xe: Fix mismatched include guards in header files
    
    Fix include guard macros that don't match their respective file names:
    
    - xe_gt_idle_types.h: _XE_GT_IDLE_SYSFS_TYPES_H_ -> _XE_GT_IDLE_TYPES_H_
    - xe_guc_exec_queue_types.h: _XE_GUC_ENGINE_TYPES_H_ -> _XE_GUC_EXEC_QUEUE_TYPES_H_
    - xe_heci_gsc.h: __XE_HECI_GSC_DEV_H__ -> _XE_HECI_GSC_H_
    - xe_hw_engine_class_sysfs.h: _XE_ENGINE_CLASS_SYSFS_H_ -> _XE_HW_ENGINE_CLASS_SYSFS_H_
    - xe_late_bind_fw_types.h: _XE_LATE_BIND_TYPES_H_ -> _XE_LATE_BIND_FW_TYPES_H_
    - xe_platform_types.h: _XE_PLATFORM_INFO_TYPES_H_ -> _XE_PLATFORM_TYPES_H_
    - xe_tile_printk.h: _xe_tile_printk_H_ -> _XE_TILE_PRINTK_H_
    
    These guards appear to be leftovers from file renames or copy-paste
    errors. Correcting them to follow the standard convention of matching
    the file name prevents potential include guard collisions.
    
    No functional change expected.
    
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 973a56bafac086c4d99d530b6896875c96120e78 drm-intel
f30b3fce1b41 drm/xe: Fix mismatched include guards in header files
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
- xe_guc_exec_queue_types.h: _XE_GUC_ENGINE_TYPES_H_ -> _XE_GUC_EXEC_QUEUE_TYPES_H_

total: 0 errors, 1 warnings, 0 checks, 80 lines checked


