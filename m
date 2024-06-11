Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFBFC27C77
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 14:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0AD10E674;
	Tue, 11 Jun 2024 14:36:34 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FF410E671;
 Tue, 11 Jun 2024 14:36:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Promote_GuC_ABI_headers_t?=
 =?utf-8?q?o_shared_location?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Jun 2024 14:36:32 -0000
Message-ID: <171811659287.67160.17059536870431139988@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240611143008.1900-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240611143008.1900-1-michal.wajdeczko@intel.com>
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

Series: Promote GuC ABI headers to shared location
URL   : https://patchwork.freedesktop.org/series/134722/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 887f682166ee23a1eb2417f82c10d94585b8c202
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jun 11 16:30:08 2024 +0200

    drm/xe: Promote SR-IOV GuC ABI definitions to shared location
    
    Move SR-IOV GuC ABI definitions to shared location and include
    them in the generated GuC documentation chapter.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 46852067df1514110bfc9c514d2610447376f1b7 drm-intel
9bfd83bd710e drm/xe/guc: Promote GuC ABI headers to shared location
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
rename from drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h

total: 0 errors, 1 warnings, 0 checks, 39 lines checked
8ea593d71053 Documentation/gpu: Separate GuC ABI section
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 38 lines checked
dde271e775a5 Documentation/gpu: Switch to shared GuC ABI definitions
7a1b49bc7976 drm/intel/guc: Update CTB communication ABI
0b080df32be8 drm/intel/guc: Add new KLV definitions
1e4c1ab5d102 drm/i915: Use shared GuC ABI definitions
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
887f682166ee drm/xe: Promote SR-IOV GuC ABI definitions to shared location
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
rename from drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h

total: 0 errors, 1 warnings, 0 checks, 11 lines checked


