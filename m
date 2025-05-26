Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4617C5AE59
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 23:33:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E74810E3F0;
	Mon, 26 May 2025 23:33:35 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2963D10E3B8;
 Mon, 26 May 2025 23:33:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/sbi=3A_move_unde?=
 =?utf-8?q?r_display=2C_cleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 May 2025 23:33:34 -0000
Message-ID: <174830241416.21444.14026176019532796780@1538d3639d33>
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
commit c81a55118119045a52ad3a72848b318ee66e80f2
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue May 13 15:17:07 2025 +0300

    drm/i915/sbi: clean up SBI register macro definitions and usage
    
    Use REG_BIT() and friends for defining the register macros. Switch GVT
    to use the same macros, and drop its own copies.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 3e019cc3eaffcb7022b9de66871eabdefd6e06ff drm-intel
4b38e6e827f4 drm/i915/sbi: move intel_sbi.[ch] under display/
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
rename from drivers/gpu/drm/i915/intel_sbi.c

total: 0 errors, 1 warnings, 0 checks, 28 lines checked
6ddb7a534148 drm/i915/sbi: convert intel_sbi.[ch] to struct intel_display
f67067db0db1 drm/i915/sbi: move sbi_lock under struct intel_display
f9b20534b920 drm/i915/de: rename timeout parameters timeout_ms to highlight unit
4f8ebd38f358 drm/i915: add out_value to intel_wait_for_register_fw() and intel_de_wait_fw()
59a549c1e6a2 drm/i915/sbi: convert to intel_de_*()
6e40ce890606 drm/i915/sbi: split out intel_sbi_regs.h
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 129 lines checked
c81a55118119 drm/i915/sbi: clean up SBI register macro definitions and usage


