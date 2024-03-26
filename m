Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC89C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 19:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A813710F1B2;
	Tue, 26 Mar 2024 19:21:30 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE45110F1B2;
 Tue, 26 Mar 2024 19:21:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Minimal_support_for_VF_st?=
 =?utf-8?q?ate_management?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Mar 2024 19:21:29 -0000
Message-ID: <171148088997.1053735.3457572102275096554@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240326191518.363-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240326191518.363-1-michal.wajdeczko@intel.com>
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

Series: Minimal support for VF state management
URL   : https://patchwork.freedesktop.org/series/131656/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9300ad8393c3933de696232b27ffebcf3501f87c
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Mar 26 20:15:18 2024 +0100

    drm/xe/pf: Add minimal support for VF_STATE_NOTIFY events
    
    GuC will use VF_STATE_NOTIFY events to notify the PF about changes
    of the VF state, in particular when a VF FLR was requested.  Add
    very minimal support for such events to avoid reporting errors due
    to unexpected G2H. We will improve handling of these messages later.
    
    While around also add few basic functions to control the VF state
    (pause, resume, stop) as we will also exercise them soon.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 79a0d94585cad50ad2446ebdf3f1317b7d18157c drm-intel
9e63ddb0cac3 drm/xe/guc: Add VF_STATE_NOTIFY and VF_CONTROL to ABI
-:54: CHECK:CAMELCASE: Avoid CamelCase: <GUC_HXG_EVENT_MSG_n_DATAn>
#54: FILE: drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h:208:
+#define GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_1_VFID		GUC_HXG_EVENT_MSG_n_DATAn

total: 0 errors, 0 warnings, 1 checks, 98 lines checked
9300ad8393c3 drm/xe/pf: Add minimal support for VF_STATE_NOTIFY events
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 314 lines checked


