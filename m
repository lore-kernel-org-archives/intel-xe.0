Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A42EC25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 08:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED3D10E29A;
	Mon, 13 May 2024 08:09:12 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC8510E29A;
 Mon, 13 May 2024 08:09:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_VF_to_que?=
 =?utf-8?q?ry_its_configuration?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 May 2024 08:09:11 -0000
Message-ID: <171558775106.2094284.15157212332782035002@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240512154915.2040-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240512154915.2040-1-michal.wajdeczko@intel.com>
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

Series: Add support for VF to query its configuration
URL   : https://patchwork.freedesktop.org/series/133509/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
57b97a66dd129aea93991dc66cd10477f7a05cf8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5b8e768fa8792fe05ff7ccf67a8d70f478a9ec5c
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Sun May 12 17:49:15 2024 +0200

    drm/xe/vf: Expose SR-IOV VF attributes to GT debugfs
    
    For debug purposes we might want to view actual VF configuration
    (including GGTT range, LMEM size, number of GuC contexts IDs or
    doorbells) and the negotiated ABI versions (with GuC and PF).
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch b5f09c51c3bb7cf14cac3e484880efdb405c098c drm-intel
e83e1f2f6eff drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
5e14957bfba1 drm/xe/guc: Add VF2GUC_VF_RESET to ABI
ab63085bc576 drm/xe/guc: Add VF2GUC_QUERY_SINGLE_KLV to ABI
-:72: CHECK:CAMELCASE: Avoid CamelCase: <GUC_HXG_REQUEST_MSG_n_DATAn>
#72: FILE: drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h:526:
+#define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_1_VALUE32	GUC_HXG_REQUEST_MSG_n_DATAn

total: 0 errors, 0 warnings, 1 checks, 60 lines checked
0204d6425300 drm/xe/vf: Add support for VF to query its configuration
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
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 874 lines checked
25738f7adfce drm/xe/vf: Custom hardware config load step if VF
5b8e768fa879 drm/xe/vf: Expose SR-IOV VF attributes to GT debugfs
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:44: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 106 lines checked


