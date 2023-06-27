Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31184EB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 11:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E3410E0B5;
	Tue, 27 Jun 2023 11:17:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4B4F510E0B5;
 Tue, 27 Jun 2023 11:17:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 48814AADE1;
 Tue, 27 Jun 2023 11:17:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Tue, 27 Jun 2023 11:17:27 -0000
Message-ID: <168786464729.2458.14673010586439245365@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230627102223.260893-1-jani.nikula@intel.com>
In-Reply-To: <20230627102223.260893-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe?=
 =?utf-8?q?_=26_i915_display_integration=2C_display_irqs?=
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

Series: xe & i915 display integration, display irqs
URL   : https://patchwork.freedesktop.org/series/119909/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d7170dc8bd99be6e8ac5643becb1127beff68790
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Jun 27 13:22:23 2023 +0300

    fixup! drm/xe/display: Implement display support
    
    Use display/intel_display_irq.[ch] from i915. Remove lots of duplicated
    code from display/ext/i915_irq.[ch].
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch f135580b567158b23349db5544259730dfb91e78 drm-intel
c3a936378 drm/i915/uncore: add intel_uncore_regs() helper
5692fd8e8 fixup! drm/xe/display: Implement display support
2e33df2a0 fixup! drm/xe/display: Implement display support
67061fddb fixup! drm/xe/display: Implement display support
-:37: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'base' may be better as '(base)' to avoid precedence issues
#37: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h:162:
+#define raw_reg_read(base, reg) \
+	readl(base + i915_mmio_reg_offset(reg))

-:39: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'base' may be better as '(base)' to avoid precedence issues
#39: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h:164:
+#define raw_reg_write(base, reg, value) \
+	writel(value, base + i915_mmio_reg_offset(reg))

total: 0 errors, 0 warnings, 2 checks, 57 lines checked
d7170dc8b fixup! drm/xe/display: Implement display support
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1119 lines checked


