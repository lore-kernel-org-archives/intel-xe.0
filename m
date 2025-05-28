Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACA5C5AE59
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 08:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E7710E599;
	Wed, 28 May 2025 08:23:43 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE39F10E1CB;
 Wed, 28 May 2025 08:23:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/sbi=3A_move_unde?=
 =?utf-8?q?r_display=2C_cleanup_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 08:23:41 -0000
Message-ID: <174842062190.27115.11455031920644249303@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1748343520.git.jani.nikula@intel.com>
In-Reply-To: <cover.1748343520.git.jani.nikula@intel.com>
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

Series: drm/i915/sbi: move under display, cleanup (rev3)
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
commit c48ee4f16f7932b51b9bd489c9e554c2b519d743
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue May 27 13:59:14 2025 +0300

    drm/i915/sbi: clean up SBI register macro definitions and usage
    
    Use REG_BIT() and friends for defining the register macros. Switch GVT
    to use the same macros, and drop its own copies.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 07b6736f75df3e60d5e20eda53ecb97f6d9a66c0 drm-intel
e0afafae0858 drm/i915/sbi: move intel_sbi.[ch] under display/
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
rename from drivers/gpu/drm/i915/intel_sbi.c

total: 0 errors, 1 warnings, 0 checks, 28 lines checked
b674565b2534 drm/i915/sbi: convert intel_sbi.[ch] to struct intel_display
5650b48b706f drm/i915/sbi: move sbi_lock under struct intel_display
3cc992bf84d9 drm/i915/de: rename timeout parameters timeout_ms to highlight unit
e1342eb28756 drm/i915: add out_value to intel_wait_for_register_fw() and intel_de_wait_fw()
941535baac24 drm/i915/sbi: convert to intel_de_*()
6ed37c6964b5 drm/i915/sbi: split out intel_sbi_regs.h
-:40: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#40: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 130 lines checked
c48ee4f16f79 drm/i915/sbi: clean up SBI register macro definitions and usage


