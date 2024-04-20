Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A33C4345F
	for <intel-xe@archiver.kernel.org>; Sat, 20 Apr 2024 02:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A26B10EA6D;
	Sat, 20 Apr 2024 02:04:28 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67C910EA6D;
 Sat, 20 Apr 2024 02:04:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_SR-IOV_GuC_Relay_PF_s?=
 =?utf-8?q?ervices_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 20 Apr 2024 02:04:26 -0000
Message-ID: <171357866681.1536851.3725546781308428723@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240418152802.182-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240418152802.182-1-michal.wajdeczko@intel.com>
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

Series: Add SR-IOV GuC Relay PF services (rev2)
URL   : https://patchwork.freedesktop.org/series/132612/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bb62ba9fbae73132ef94628d5ac8b2546b63a89b
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Apr 18 17:28:02 2024 +0200

    drm/xe/kunit: Add PF service tests
    
    Start with basic tests for VF/PF ABI version negotiation. As we
    treat all platforms in the same way, we can run the tests on one
    platform. More tests will likely come later.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 5b8f5c906246fb3ddf35b775a3b6ac9ea5fdcdd5 drm-intel
618a9887fc77 drm/xe/guc: Add GuC Relay ABI version 1.0 definitions
-:159: CHECK:CAMELCASE: Avoid CamelCase: <GUC_HXG_REQUEST_MSG_n_DATAn>
#159: FILE: drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h:141:
+#define VF2PF_QUERY_RUNTIME_REQUEST_MSG_1_START		GUC_HXG_REQUEST_MSG_n_DATAn

-:168: CHECK:CAMELCASE: Avoid CamelCase: <GUC_HXG_RESPONSE_MSG_n_DATAn>
#168: FILE: drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h:150:
+#define VF2PF_QUERY_RUNTIME_RESPONSE_MSG_1_REMAINING	GUC_HXG_RESPONSE_MSG_n_DATAn

total: 0 errors, 0 warnings, 2 checks, 157 lines checked
654f052e8bbe drm/xe: Add helper to calculate adjusted register offset
b96a6ade155b drm/xe: Add few more GT register definitions
9e2e5da32d31 drm/xe/pf: Add SR-IOV GuC Relay PF services
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
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 696 lines checked
bb62ba9fbae7 drm/xe/kunit: Add PF service tests
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 239 lines checked


