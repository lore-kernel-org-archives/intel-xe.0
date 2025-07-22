Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC97C83F27
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 11:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E79C10E667;
	Tue, 22 Jul 2025 11:59:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D84610E667;
 Tue, 22 Jul 2025 11:59:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_CCS_save_restore_for_IGPU?=
 =?utf-8?q?_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Jul 2025 11:59:07 -0000
Message-ID: <175318554718.179883.14538207898096269648@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250722120506.6483-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250722120506.6483-1-satyanarayana.k.v.p@intel.com>
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

Series: CCS save restore for IGPU (rev12)
URL   : https://patchwork.freedesktop.org/series/149108/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63535c743231a7497a612c53f6edbb8a7d14412d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1bdb2534115f9836b8012d6c05c96804ae6ab2da
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Tue Jul 22 17:35:06 2025 +0530

    drm/xe/vf: Register CCS read/write contexts with Guc
    
    Register read write contexts with newly added flags with GUC and
    enable the context immediately after registration.
    Re-register the context with Guc when resuming from runtime suspend as
    soft reset is applied to Guc during xe_pm_runtime_resume().
    Make Ring head=tail while unbinding device to avoid issues with VF pause
    after device is unbinded.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 807088b0ca072462044a30230dd5426c7f55ad2f drm-intel
df8b91c95d43 drm/xe/vf: Create contexts for CCS read write
-:185: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#185: 
new file mode 100644

-:431: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id__' - possible side-effects?
#431: FILE: drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h:9:
+#define for_each_ccs_rw_ctx(id__) \
+	for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_CTX_COUNT; (id__)++)

total: 0 errors, 1 warnings, 1 checks, 403 lines checked
d54be73cd84a drm/xe/vf: Attach and detach CCS copy commands with BO
1bdb2534115f drm/xe/vf: Register CCS read/write contexts with Guc


