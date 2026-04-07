Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C74FEEF24
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 11:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926B110E3F1;
	Tue,  7 Apr 2026 11:34:04 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7DF10E360;
 Tue,  7 Apr 2026 11:34:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_relocate_mchb?=
 =?utf-8?q?ar_and_pci_regs_headers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Apr 2026 11:34:03 -0000
Message-ID: <177556164309.437137.17733954404838691656@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1775559414.git.jani.nikula@intel.com>
In-Reply-To: <cover.1775559414.git.jani.nikula@intel.com>
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

Series: drm/i915: relocate mchbar and pci regs headers
URL   : https://patchwork.freedesktop.org/series/164442/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f314ae59dfd94d974babfc6f26a1e8e2ebe15ecc
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Apr 7 13:57:42 2026 +0300

    drm/i915/pci: move intel_pci_config.h under include/drm/intel
    
    Since the PCI registers are used from both i915 display and core, move
    intel_pci_config.h to include/drm/intel/pci_config.h. Drop the intel_
    prefix from the name to reduce tautology.
    
    With this, we can drop the corresponding xe display compat header.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 87b52c2ff4f00eff41866d728f82d2b109c397f7 drm-intel
a250e944336e drm/i915/mchbar: include intel_mchbar_regs.h from intel_mchbar.h
eaa9728a456c drm/i915/mchbar: move intel_mchbar_regs.h under include/drm/intel
-:293: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#293: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 197 lines checked
f314ae59dfd9 drm/i915/pci: move intel_pci_config.h under include/drm/intel
-:300: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#300: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 201 lines checked


