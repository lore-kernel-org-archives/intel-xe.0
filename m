Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487DDC4706F
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 05:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B0410E391;
	Thu,  4 Jan 2024 05:43:37 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC5C10E390;
 Thu,  4 Jan 2024 05:43:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Relay_Communica?=
 =?utf-8?q?tion_for_SR-IOV?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Thu, 04 Jan 2024 05:43:35 -0000
Message-ID: <170434701590.1841.11053145610586662235@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
In-Reply-To: <20231227235838.212-1-michal.wajdeczko@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Introduce Relay Communication for SR-IOV
URL   : https://patchwork.freedesktop.org/series/128042/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5ed55f6e30ac2cefac3949946501cab41823bc81
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Dec 28 00:58:38 2023 +0100

    drm/xe/guc: Start handling GuC Relay event messages
    
    GuC Relay infrastructure is ready, start handling relay messages
    from the GuC to unblock testing on the live system.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
868529207 drm/xe: Allocate dedicated workqueue for SR-IOV workers
38a530fd5 drm/xe: Define Virtual Function Identifier
841981526 drm/xe: Introduce GT-oriented SR-IOV logging macros
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

-:33: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt' - possible side-effects?
#33: FILE: drivers/gpu/drm/xe/xe_gt_sriov_printk.h:12:
+#define __xe_gt_sriov_printk(gt, _level, fmt, ...) \
+	xe_gt_printk((gt), _level, "%s" fmt, xe_sriov_printk_prefix(gt_to_xe(gt)), ##__VA_ARGS__)

total: 0 errors, 1 warnings, 1 checks, 34 lines checked
560790118 drm/xe/guc: Add helpers for HXG messages
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:18: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#18: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 107 lines checked
f6ef6609e drm/xe/guc: Update few GuC CTB ABI definitions
4bfd47c54 drm/xe/guc: Add Relay Communication ABI definitions
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
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

-:72: CHECK:CAMELCASE: Avoid CamelCase: <GUC_HXG_EVENT_MSG_n_DATAn>
#72: FILE: drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h:48:
+#define GUC2PF_RELAY_FROM_VF_EVENT_MSG_1_VFID		GUC_HXG_EVENT_MSG_n_DATAn

-:114: CHECK:CAMELCASE: Avoid CamelCase: <GUC_HXG_REQUEST_MSG_n_DATAn>
#114: FILE: drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h:90:
+#define PF2GUC_RELAY_TO_VF_REQUEST_MSG_1_VFID		GUC_HXG_REQUEST_MSG_n_DATAn

total: 0 errors, 1 warnings, 2 checks, 371 lines checked
01288ad3f drm/xe/guc: Introduce Relay Communication for SR-IOV
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
-:61: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#61: 
new file mode 100644

-:459: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#459: FILE: drivers/gpu/drm/xe/xe_guc_relay.c:394:
+static int relay_send_message_and_wait(struct xe_guc_relay *relay,
+					struct relay_transaction *txn,

-:655: ERROR:INITIALISED_STATIC: do not initialise statics to 0
#655: FILE: drivers/gpu/drm/xe/xe_guc_relay.c:590:
+	static ktime_t last_reply = 0;

-:782: CHECK:LINE_SPACING: Please don't use multiple blank lines
#782: FILE: drivers/gpu/drm/xe/xe_guc_relay.c:717:
+
+

total: 1 errors, 1 warnings, 2 checks, 1026 lines checked
f6dd0223f drm/xe/kunit: Allow to replace xe_guc_ct_send_recv() with stub
7e93665f6 drm/xe/kunit: Add GuC Relay kunit tests
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

-:249: WARNING:FUNCTION_ARGUMENTS: function definition argument 'struct xe_guc_relay *' should also have an identifier name
#249: FILE: drivers/gpu/drm/xe/tests/xe_guc_relay_test.c:229:
+	int (*guc2relay)(struct xe_guc_relay *, const u32 *, u32);

-:249: WARNING:FUNCTION_ARGUMENTS: function definition argument 'const u32 *' should also have an identifier name
#249: FILE: drivers/gpu/drm/xe/tests/xe_guc_relay_test.c:229:
+	int (*guc2relay)(struct xe_guc_relay *, const u32 *, u32);

-:249: WARNING:FUNCTION_ARGUMENTS: function definition argument 'u32' should also have an identifier name
#249: FILE: drivers/gpu/drm/xe/tests/xe_guc_relay_test.c:229:
+	int (*guc2relay)(struct xe_guc_relay *, const u32 *, u32);

total: 0 errors, 4 warnings, 0 checks, 573 lines checked
5ed55f6e3 drm/xe/guc: Start handling GuC Relay event messages


