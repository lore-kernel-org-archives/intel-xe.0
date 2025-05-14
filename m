Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DEDC3ABCC
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 10:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D7210E009;
	Wed, 14 May 2025 10:37:41 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CD310E009;
 Wed, 14 May 2025 10:37:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/sbi=3A_move_unde?=
 =?utf-8?q?r_display=2C_cleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 10:37:40 -0000
Message-ID: <174721906026.78050.10679044887423414084@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1747138550.git.jani.nikula@intel.com>
In-Reply-To: <cover.1747138550.git.jani.nikula@intel.com>
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

Series: drm/i915/sbi: move under display, cleanup
URL   : https://patchwork.freedesktop.org/series/148960/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b1d8c4fd66ed4bb98ce1c1f00ed7f1138db7479f
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue May 13 15:17:07 2025 +0300

    drm/i915/sbi: clean up SBI register macro definitions and usage
    
    Use REG_BIT() and friends for defining the register macros. Switch GVT
    to use the same macros, and drop its own copies.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 2e72fd09b4fb0823282977f0717159e47328a533 drm-intel
909d488e5fa3 drm/i915/sbi: move intel_sbi.[ch] under display/
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
rename from drivers/gpu/drm/i915/intel_sbi.c

total: 0 errors, 1 warnings, 0 checks, 28 lines checked
17ca796cc31d drm/i915/sbi: convert intel_sbi.[ch] to struct intel_display
969a737962b1 drm/i915/sbi: move sbi_lock under struct intel_display
3161522676be drm/i915/de: rename timeout parameters timeout_ms to highlight unit
b25f3a177fb1 drm/i915: add out_value to intel_wait_for_register_fw() and intel_de_wait_fw()
8f1533ed0b30 drm/i915/sbi: convert to intel_de_*()
d5644473cacf drm/i915/sbi: split out intel_sbi_regs.h
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 129 lines checked
b1d8c4fd66ed drm/i915/sbi: clean up SBI register macro definitions and usage


