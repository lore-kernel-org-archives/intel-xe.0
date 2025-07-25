Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5020CC83F26
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 05:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4DA10E12F;
	Fri, 25 Jul 2025 05:21:25 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F2A10E12F;
 Fri, 25 Jul 2025 05:21:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_Pipe_writeback?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Jul 2025 05:21:24 -0000
Message-ID: <175342088443.189031.2021331185656948070@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
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

Series: Enable Pipe writeback
URL   : https://patchwork.freedesktop.org/series/152105/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63535c743231a7497a612c53f6edbb8a7d14412d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1fb4f8161de9b31305371c52661bf9de1c5f5104
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Jul 25 10:34:09 2025 +0530

    drm/i915/writeback: Modify state verify function
    
    Modify the state verify functions to take into account the fact
    that writeback does not need all the timings for it to be set.
    Moreover there is no need for dpll state nor do we need to set
    any sort of flags for it.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 6c63a61ce876bbee2a1d29f7656ec077b11760b7 drm-intel
332d0ffd7b14 drm/writeback: Add function that takes preallocated connector
55b4cf6e7ad5 drm/writeback: Add a helper function to get writeback connector
900c309cd070 drm/writeback: Define function to get drm_connector from writeback
098b6f4427d7 drm/i915/writeback: Add writeback registers
-:11: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#11: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 136 lines checked
7bc9c802dd7f drm/i915/writeback: Add some preliminary writeback definitions
e212d89d0f53 drm/i915/writeback: Init writeback connector
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 153 lines checked
ebe981069e97 drm/i915/writeback: Add function for get_writeback_connector
6e480f2a566b drm/i915/writeback: Define the get_connector_from_writeback hook
456e1b71e7a8 drm/i915/writeback: Add function to get modes
d344460f6d67 drm/i915/writeback: Add hook to check modes
1debd4f17115 drm/i915/writeback: Define encoder->get_hw_state
73558fba1da7 drm/i915/writeback: Fill encoder->get_config
214cd890157b drm/i915/writeback: Add private structure for writeback job
d270a1759266 drm/i915/writeback: Define function for prepare and cleanup hooks
749e46ebe48b drm/i915/writeback: Define compute_config for writeback
4e613f643841 drm/i915/writeback: Define function for connector function detect
85343ed88a2c drm/i915/writeback: Define function to destroy writeback connector
554a97f32327 drm/i915/writeback: Add connector atomic check
d2bbdca09222 drm/i915/writeback: Add the enable sequence from writeback
649d8ae4c566 drm/i915/writeback: Add writeback to xe Makefile
690eddf48dc7 drm/i915/writeback: Define writeback frame capture function
e90256052a3b drm/i915/writeback: Configure WD_STRIDE reg
35bb2e88b510 drm/i915/writeback: Configure WD_SURF register
c4a40784042b drm/i915/writeback: Enable writeback interrupts
deb40c427547 drm/i915/writeback: Initialize writeback encoder.
2b11b0aa09ce drm/i915/writeback: Define the disable sequence for writeback
755a1f30d6c8 drm/i915/writeback: Make exception for writeback connector
1fb4f8161de9 drm/i915/writeback: Modify state verify function


