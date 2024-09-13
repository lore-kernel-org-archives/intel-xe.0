Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E40AFA3755
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 15:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303FC10E28C;
	Fri, 13 Sep 2024 15:16:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BFD10E28C;
 Fri, 13 Sep 2024 15:16:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PF=3A_Initial_support_to_?=
 =?utf-8?q?save/restore_VF_GuC_state_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 15:16:03 -0000
Message-ID: <172624056346.997167.18322773322387452796@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912203817.1880-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240912203817.1880-1-michal.wajdeczko@intel.com>
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

Series: PF: Initial support to save/restore VF GuC state (rev2)
URL   : https://patchwork.freedesktop.org/series/138609/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9035ce7f5cb6cead030a9bfee3727b3c33fbd68c
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Sep 12 22:38:17 2024 +0200

    drm/xe/pf: Allow to trigger VF GuC state restore from debugfs
    
    For feature enabling and testing purposes, allow to restore saved
    or replaced VF GuC state from debugfs, bypassing normal migration
    flow. This is available only under strict debug config.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Michał Winiarski <michal.winiarski@intel.com>
    Cc: Tomasz Lis <tomasz.lis@intel.com>
+ /mt/dim checkpatch 8c9686621372c8cb3e1ca6154d89bffb876d3ff0 drm-intel
bc64558b1e23 drm/xe/guc: Fix GUC_{SUBMIT,FIRMWARE}_VER helper macros
22e029d5b3c7 drm/xe/guc: Add PF2GUC_SAVE_RESTORE_VF to ABI
-:77: CHECK:CAMELCASE: Avoid CamelCase: <GUC_HXG_EVENT_MSG_n_DATAn>
#77: FILE: drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h:612:
+#define PF2GUC_SAVE_RESTORE_VF_REQUEST_MSG_1_VFID	GUC_HXG_EVENT_MSG_n_DATAn

total: 0 errors, 0 warnings, 1 checks, 65 lines checked
05ab7a998df1 drm/xe/pf: Add functions to save and restore VF GuC state
-:54: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#54: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 442 lines checked
9e0025f16082 drm/xe/pf: Save VF GuC state when pausing VF
5a7fcd3f658c drm/xe/pf: Allow to view and replace VF GuC state over debugfs
9035ce7f5cb6 drm/xe/pf: Allow to trigger VF GuC state restore from debugfs


