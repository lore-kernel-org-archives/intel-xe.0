Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3E0D0E6C8
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 08:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FF810E444;
	Mon, 21 Oct 2024 08:26:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68C010E444;
 Mon, 21 Oct 2024 08:26:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_separate_Kc?=
 =?utf-8?q?onfig_file_for_SR-IOV_options?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 08:26:07 -0000
Message-ID: <172949916787.1303506.14929304559215927283@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021081242.1727-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241021081242.1727-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Add separate Kconfig file for SR-IOV options
URL   : https://patchwork.freedesktop.org/series/140234/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7aa26e31c1a86225189942b7f407a6425f7c231e
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Oct 21 10:12:42 2024 +0200

    drm/xe: Add separate Kconfig file for SR-IOV options
    
    There are few SR-IOV config options that we want to define:
    
     - DRM_XE_SRIOV_VF to allow compile-out support for the SR-IOV
       Virtual Function (VF)
     - DRM_XE_SRIOV_PF to allow compile-out support for the SR-IOV
       Physical Function (PF)
    
    and for use by PF only:
    
     - DRM_XE_SRIOV_DEFAULT_SCHEDULING_[FLEXIBLE|FIXED|CUSTOM]
       to select preferred scheduling method using either predefined
       parameter values, or custom values
     - DRM_XE_SRIOV_DEFAULT_PF_[EXEC_QUANTUM_MS|PREEMPT_TIMEOUT_US]
       to define default execution quantum/preempt timeout for the PF
     - DRM_XE_SRIOV_DEFAULT_VF_[EXEC_QUANTUM_MS|PREEMPT_TIMEOUT_US]
       to define default execution quantum/preempt timeout for the VF
     - DRM_XE_SRIOV_DEFAULT_POLICY_[SCHED_IF_IDLE|RESET_ENGINE]
       to define default values for advanced scheduling policies
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 72809739ab370346afe6744018411b96468c50e5 drm-intel
7aa26e31c1a8 drm/xe: Add separate Kconfig file for SR-IOV options
-:40: WARNING:EMBEDDED_FILENAME: It's generally not useful to have the filename in the file
#40: FILE: drivers/gpu/drm/xe/Kconfig:92:
+source "drivers/gpu/drm/xe/Kconfig.sriov"

-:47: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#47: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 151 lines checked


