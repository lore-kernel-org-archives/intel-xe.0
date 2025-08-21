Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1569CA0EFA
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 17:15:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6799D10E389;
	Thu, 21 Aug 2025 17:15:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0768510E049;
 Thu, 21 Aug 2025 17:15:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_psmi_suppor?=
 =?utf-8?q?t_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Aug 2025 17:15:42 -0000
Message-ID: <175579654202.258357.16262327720966035817@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
In-Reply-To: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
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

Series: drm/xe: Add psmi support (rev5)
URL   : https://patchwork.freedesktop.org/series/151729/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
553439844b6500767ce8aef522cfe9fbb7ece541
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 95a061730bdd463437456a92d1da7bfad9006d72
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Aug 21 09:18:07 2025 -0700

    drm/xe/configfs: Dump custom settings when binding
    
    Device configuration using configfs could be prepared long time prior
    the driver load. Currently all the xe configfs entries are for things
    that are important to have in the log if a non-default value is being
    used. Add a info-level message about that with the individual entries
    that are different than the default.
    
    Based on previous patch by Michal Wajdeczko.
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 633a37934680cad76b742422d1b955d4cdde5189 drm-intel
52a993d0356f drm/xe/psmi: Add GuC flag to enable PSMI
f2918bbe7b94 drm/xe/psmi: Add debugfs interface for PSMI
-:111: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#111: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 373 lines checked
9f963ae3fa56 drm/xe/rtp: Add match for psmi
5be7b6fa0487 drm/xe/psmi: Add Wa_14020001231
-:35: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#35: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:364:
+				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);

total: 0 errors, 1 warnings, 0 checks, 27 lines checked
098893b9e171 drm/xe/psmi: Add Wa_16023683509
16807a63f0fe drm/xe/configfs: Simplify kernel doc
3aa01d4e16d5 drm/xe/configfs: Allow to enable PSMI
8e870b16e895 drm/xe/configfs: Use guard() for dev->lock
e212dafea394 drm/xe/configfs: Use tree-like output in documentation
46b64520b9f1 drm/xe/configfs: Improve documentation steps
3489982f9831 drm/xe/configfs: Minor fixes to documentation
95a061730bdd drm/xe/configfs: Dump custom settings when binding
-:30: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'attr_' - possible side-effects?
#30: FILE: drivers/gpu/drm/xe/xe_configfs.c:448:
+#define PRI_CUSTOM_ATTR(fmt_, attr_) do { \
+		if (dev->config.attr_ != device_defaults.attr_) \
+			pci_info(pdev, "configfs: " __stringify(attr_) " = " fmt_ "\n", \
+				 dev->config.attr_); \
+	} while (0)

-:30: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'attr_' may be better as '(attr_)' to avoid precedence issues
#30: FILE: drivers/gpu/drm/xe/xe_configfs.c:448:
+#define PRI_CUSTOM_ATTR(fmt_, attr_) do { \
+		if (dev->config.attr_ != device_defaults.attr_) \
+			pci_info(pdev, "configfs: " __stringify(attr_) " = " fmt_ "\n", \
+				 dev->config.attr_); \
+	} while (0)

total: 0 errors, 0 warnings, 2 checks, 74 lines checked


