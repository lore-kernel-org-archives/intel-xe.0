Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D134BC3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 11:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98ABE10EA79;
	Fri, 16 May 2025 11:38:46 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA7710EA79;
 Fri, 16 May 2025 11:38:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_CCS_save_restore_for_IGPU?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 May 2025 11:38:45 -0000
Message-ID: <174739552530.88035.3030885347318099197@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250516114832.19046-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250516114832.19046-1-satyanarayana.k.v.p@intel.com>
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

Series: CCS save restore for IGPU
URL   : https://patchwork.freedesktop.org/series/149108/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 10b0d7c7ad2e8b5b4752f1c80dd87a76dda8661b
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Fri May 16 17:18:32 2025 +0530

    drm/xe/vf: Register CCS read/write contexts with Guc
    
    Register read write contexts with newly added flags with GUC and
    enable the context immediately after registration.
    Re-register the context with Guc when resuming from runtime suspend as
    soft reset is applied to Guc during xe_pm_runtime_resume().
    Make Ring head=tail while unbinding device to avoid issues with VF pause
    after device is unbinded.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
+ /mt/dim checkpatch 6d2dd85ba4eb3df89dc816c03b5bf81a470865b2 drm-intel
111ae3496dfd drm/xe/vf: Create contexts for CCS read write
-:149: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#149: 
new file mode 100644

-:240: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id__' - possible side-effects?
#240: FILE: drivers/gpu/drm/xe/xe_sriov_vf_ccs.c:87:
+#define for_each_ccs_rw_ctx(id__) \
+       for ((id__) = 0; (id__) < XE_CCS_RW_MAX_CTXS; (id__)++)

-:241: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#241: FILE: drivers/gpu/drm/xe/xe_sriov_vf_ccs.c:88:
+       for ((id__) = 0; (id__) < XE_CCS_RW_MAX_CTXS; (id__)++)$

total: 0 errors, 2 warnings, 1 checks, 268 lines checked
8608aacab8af drm/xe/vf: Attach and detach CCS copy commands with BO.
10b0d7c7ad2e drm/xe/vf: Register CCS read/write contexts with Guc


