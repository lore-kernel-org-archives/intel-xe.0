Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3ACD3B7EA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 11:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11D810E1CE;
	Tue,  9 Dec 2025 11:17:13 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F5210E1CE;
 Tue,  9 Dec 2025 11:17:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/pc8=3A_Add_paren?=
 =?utf-8?q?t_interface_for_PC8_forcewake_tricks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Dec 2025 11:17:12 -0000
Message-ID: <176527903295.68390.10977282094759264527@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251209111150.16853-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251209111150.16853-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/pc8: Add parent interface for PC8 forcewake tricks
URL   : https://patchwork.freedesktop.org/series/158685/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9714537f4df7e222e81391b01f7cac6be0425d87
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Dec 9 13:11:50 2025 +0200

    drm/i915/pc8: Add parent interface for PC8 forcewake tricks
    
    We use forcewake to prevent the SoC from actually entering
    PC8 while performing the PC8 disable sequence. Hide that
    behind a new parent interface to eliminate the naked
    forcewake/uncore usage from the display power code.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 48deab361d3b570e2210875fdc8ffb29627d054f drm-intel
9714537f4df7 drm/i915/pc8: Add parent interface for PC8 forcewake tricks
-:91: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#91: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 126 lines checked


