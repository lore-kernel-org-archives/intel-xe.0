Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD66DC71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 19:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934D510E066;
	Tue, 17 Jun 2025 19:51:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E3110E066;
 Tue, 17 Jun 2025 19:51:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_debugfs_node_to_expos?=
 =?utf-8?q?e_G-state_and_pcie_link_state_residency_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Jun 2025 19:51:06 -0000
Message-ID: <175018986636.88665.11631712533162124695@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250617171600.2905682-1-soham.purkait@intel.com>
In-Reply-To: <20250617171600.2905682-1-soham.purkait@intel.com>
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

Series: Add debugfs node to expose G-state and pcie link state residency (rev2)
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
commit 02f313218ad9835c8f72dfe32f50672b1609771c
Author: Soham Purkait <soham.purkait@intel.com>
Date:   Tue Jun 17 22:46:00 2025 +0530

    drm/xe/regs/xe_pmt: Macros for G-State and pcie link state residency offset
    
    Add G-State residency and pcie link state residency
    offset macros for G2, G6, G8, G10, ModS and L0, L1, L1.2
    respectively.
    
    v1 : Moved offset macros to drm/xe/regs/xe_pmt. (Riana)
    
    Signed-off-by: Soham Purkait <soham.purkait@intel.com>
+ /mt/dim checkpatch ec86132a383e84e0acd73092030b8d1b51c70060 drm-intel
d2275a9d4f5f drm/xe/xe_debugfs: Exposure of G-State and pcie link state residency counters through debugfs
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
Add two debugfs node named dgfx_pkg_residencies and dgfx_link_state_residencys

total: 0 errors, 1 warnings, 0 checks, 110 lines checked
02f313218ad9 drm/xe/regs/xe_pmt: Macros for G-State and pcie link state residency offset


