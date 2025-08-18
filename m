Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3779FCA0EE4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 19:50:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02D510E4BF;
	Mon, 18 Aug 2025 19:50:32 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2A010E4BD;
 Mon, 18 Aug 2025 19:50:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_psmi_suppor?=
 =?utf-8?q?t_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Aug 2025 19:50:31 -0000
Message-ID: <175554663117.245368.12945517454120001327@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
In-Reply-To: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
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

Series: drm/xe: Add psmi support (rev4)
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
commit 937127c1b58598a82248b50d2959270871f6c92c
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Aug 18 10:37:38 2025 -0700

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
+ /mt/dim checkpatch c3cf4289245819615518b536cd16ebe6612694f9 drm-intel
da9241f9da35 drm/xe/psmi: Add GuC flag to enable PSMI
a52d96accd7b drm/xe/psmi: Add debugfs interface for PSMI
-:111: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#111: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 373 lines checked
199d10e98df6 drm/xe/rtp: Add match for psmi
36b3e80fa866 drm/xe/psmi: Add Wa_14020001231
-:34: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#34: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:364:
+				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);

total: 0 errors, 1 warnings, 0 checks, 27 lines checked
65c980a147d9 drm/xe/psmi: Add Wa_16023683509
209855037caf drm/xe/configfs: Simplify kernel doc
c482811d90b1 drm/xe/configfs: Allow to enable PSMI
ffdb2ff05c91 drm/xe/configfs: Use guard() for dev->lock
0c8a81b8619d drm/xe/configfs: Block runtime attribute changes
ad48f73972da drm/xe/configfs: Use tree-like output in documentation
86234c489fb9 drm/xe/configfs: Improve documentation steps
a9c615ce10e0 drm/xe/configfs: Minor fixes to documentation
937127c1b585 drm/xe/configfs: Dump custom settings when binding
-:30: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'attr_' - possible side-effects?
#30: FILE: drivers/gpu/drm/xe/xe_configfs.c:489:
+#define PRI_CUSTOM_ATTR(fmt_, attr_) do { \
+		if (dev->config.attr_ != device_defaults.attr_) \
+			pci_info(pdev, "configfs: " __stringify(attr_) " = " fmt_ "\n", \
+				 dev->config.attr_); \
+	} while (0)

-:30: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'attr_' may be better as '(attr_)' to avoid precedence issues
#30: FILE: drivers/gpu/drm/xe/xe_configfs.c:489:
+#define PRI_CUSTOM_ATTR(fmt_, attr_) do { \
+		if (dev->config.attr_ != device_defaults.attr_) \
+			pci_info(pdev, "configfs: " __stringify(attr_) " = " fmt_ "\n", \
+				 dev->config.attr_); \
+	} while (0)

total: 0 errors, 0 warnings, 2 checks, 74 lines checked


