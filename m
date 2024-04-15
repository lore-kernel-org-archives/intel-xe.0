Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B4CC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 22:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D6110EA77;
	Mon, 15 Apr 2024 22:33:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C57010EA77;
 Mon, 15 Apr 2024 22:33:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PF=3A_Add_support_to_conf?=
 =?utf-8?q?igure_SR-IOV_VFs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 22:33:05 -0000
Message-ID: <171322038517.1424088.17207876142363677051@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240415173937.1287-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240415173937.1287-1-michal.wajdeczko@intel.com>
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

Series: PF: Add support to configure SR-IOV VFs (rev2)
URL   : https://patchwork.freedesktop.org/series/132416/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35057f376b5337039b258ae4c66ed9218f4b3fb8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2b59c14740509332ccd5f352389dd5edbf3f34ba
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Apr 15 19:39:37 2024 +0200

    drm/xe/pf: Add support to configure SR-IOV VFs
    
    To run correctly, each Virtual Function must be provisioned with
    some chunk of shared hardware or firmware resources (like GGTT,
    device memory, GuC doorbell IDs, GuC context IDs) and scheduling
    parameters (execution quantum or preemption timeout).
    
    All resources assigned to VFs must be excluded from the PF driver
    use and may require some additional preparation steps (like setup
    of the LMTT or update of the GGTT PTE). Those provisioning details
    must be then sent to the GuC firmware as most of those details
    will be shared later with the VF drivers during their boot.
    
    Add basic functions to provision VFs with all hardware resources
    or scheduling parameters. We will use them shortly in upcoming
    patches either in manual provisioning over debugfs, exposed to the
    advanced users, or automatic provisioning done by PF driver during
    VFs enabling.
    
    Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 7bc330055f5c2924b42e389887691fea3f401a45 drm-intel
9951429c7d3f drm/xe: Add helper to format SR-IOV function name
b64ef8f7f5c0 drm/xe: Allow to assign GGTT region to the VF
a19177d885e2 drm/xe: Add xe_ttm_vram_get_avail
0fc3063462d0 drm/xe/guc: Add PF2GUC_UPDATE_VF_CFG to ABI
-:74: CHECK:CAMELCASE: Avoid CamelCase: <GUC_HXG_REQUEST_MSG_n_DATAn>
#74: FILE: drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h:310:
+#define PF2GUC_UPDATE_VF_CFG_REQUEST_MSG_1_VFID		GUC_HXG_REQUEST_MSG_n_DATAn

total: 0 errors, 0 warnings, 1 checks, 61 lines checked
495c7f61e3c7 drm/xe/pf: Add SR-IOV PF specific early GT initialization
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 119 lines checked
2b59c1474050 drm/xe/pf: Add support to configure SR-IOV VFs
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:42: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#42: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 2117 lines checked


