Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC98C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 11:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E6F10EC6F;
	Thu, 16 May 2024 11:11:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703DA10EC7B;
 Thu, 16 May 2024 11:11:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_VF_to_que?=
 =?utf-8?q?ry_its_configuration_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 May 2024 11:11:49 -0000
Message-ID: <171585790945.2120952.11604215044159993795@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240516110546.2216-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240516110546.2216-1-michal.wajdeczko@intel.com>
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

Series: Add support for VF to query its configuration (rev2)
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
commit 9cb49e1357036700e4ce7458fb590e6182d6b21f
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu May 16 13:05:46 2024 +0200

    drm/xe/vf: Expose SR-IOV VF attributes to GT debugfs
    
    For debug purposes we might want to view actual VF configuration
    (including GGTT range, LMEM size, number of GuC contexts IDs or
    doorbells) and the negotiated ABI versions (with GuC and PF).
    
    Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 3b6a503228b84c010794599203ac3e1e3d349bab drm-intel
d1377901bf25 drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
d9dcbd97858f drm/xe/guc: Add VF2GUC_VF_RESET to ABI
ec6a1b5183e3 drm/xe/guc: Add VF2GUC_QUERY_SINGLE_KLV to ABI
-:76: CHECK:CAMELCASE: Avoid CamelCase: <GUC_HXG_REQUEST_MSG_n_DATAn>
#76: FILE: drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h:526:
+#define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_1_VALUE32	GUC_HXG_REQUEST_MSG_n_DATAn

total: 0 errors, 0 warnings, 1 checks, 60 lines checked
d13e88ba7b19 drm/xe/vf: Add support for VF to query its configuration
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
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 874 lines checked
7d330abbcb54 drm/xe/vf: Custom hardware config load step if VF
9cb49e135703 drm/xe/vf: Expose SR-IOV VF attributes to GT debugfs
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:48: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#48: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 106 lines checked


