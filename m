Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC27C71155
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 12:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2695610EB51;
	Fri, 20 Jun 2025 12:28:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C9610E21F;
 Fri, 20 Jun 2025 12:28:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_debugfs_node_to_expos?=
 =?utf-8?q?e_G-state_and_pcie_link_state_residency_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Jun 2025 12:28:09 -0000
Message-ID: <175042248973.98212.10964765109956614201@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250620120356.3289744-1-soham.purkait@intel.com>
In-Reply-To: <20250620120356.3289744-1-soham.purkait@intel.com>
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

Series: Add debugfs node to expose G-state and pcie link state residency (rev3)
URL   : https://patchwork.freedesktop.org/series/149793/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 178a117ee35c572010bcd7584657cd8cc1025b10
Author: Soham Purkait <soham.purkait@intel.com>
Date:   Fri Jun 20 17:33:56 2025 +0530

    drm/xe/xe_debugfs: Exposure of G-State and pcie link state residency counters through debugfs
    
    Add debug nodes, "dgfx_pkg_residencies" for G-states (G2, G6, G8, G10,
    ModS) and "dgfx_pcie_link_residencies" for PCIe link states(L0, L1, L1.2)
    residency counters.
    
    V1 : Expose all G-State residency counter values under dgfx_pkg_residencies. (Anshuman)
         Included runtime_get/put and removed drm_warn. (Riana)
    
    v2 : Moved "dgfx_pkg_residencies" from "/sys/kernel/debug/gtidle/" to "/sys/kernel/debug/".
                                                                                     (Anshuman)
    
    v3 : Included debugfs node "dgfx_pcie_link_residencies" for pcie link state residency
         counter values.       (Anshuman)
    
    v4 : Included check for BMG and dgfx and helper function for repetitive code.  (Riana)
         Used drm_info_list to create the debugfs. (Karthik)
    
    v5 : Reordered commits to reflect the correct dependency hierarchy.  (Jonathan)
         Simplification of commit message and rectified register offset. (Karthik)
         Error handling and return before printing.                      (Riana)
    
    Signed-off-by: Soham Purkait <soham.purkait@intel.com>
+ /mt/dim checkpatch 1b4be188ae14a43b901f3005075fab3a22f77968 drm-intel
a3011746b82e drm/xe/regs/xe_pmt: Macros for G-State and pcie link state residency offset
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
v5 : Reordered commits to reflect the correct dependency hierarchy.  (Jonathan)

total: 0 errors, 1 warnings, 0 checks, 14 lines checked
178a117ee35c drm/xe/xe_debugfs: Exposure of G-State and pcie link state residency counters through debugfs
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
V1 : Expose all G-State residency counter values under dgfx_pkg_residencies. (Anshuman)

total: 0 errors, 1 warnings, 0 checks, 110 lines checked


