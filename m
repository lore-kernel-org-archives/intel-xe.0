Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E9DECE564
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 07:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034F910E093;
	Tue, 10 Sep 2024 07:34:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AA910E093;
 Tue, 10 Sep 2024 07:34:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Ensure_Proper_Unlo?=
 =?utf-8?q?ad/Reload_Order_of_MEI_Modules_for_i915/Xe_Driver_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Sep 2024 07:34:36 -0000
Message-ID: <172595367613.979482.12857025658319556535@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240909040317.17108-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240909040317.17108-1-krishnaiah.bommu@intel.com>
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

Series: drm: Ensure Proper Unload/Reload Order of MEI Modules for i915/Xe Driver (rev2)
URL   : https://patchwork.freedesktop.org/series/138099/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ca63c457e990a40bdc042dcf1be094c214aa3c10
Author: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Date:   Mon Sep 9 09:33:17 2024 +0530

    drm: Ensure Proper Unload/Reload Order of MEI Modules for i915/Xe Driver
    
    This update addresses the unload/reload sequence of MEI modules in relation to
    the i915/Xe graphics driver. On platforms where the MEI hardware is integrated
    with the graphics device (e.g., DG2/BMG), the i915/xe driver is depend on the MEI
    modules. Conversely, on newer platforms like MTL and LNL, where the MEI hardware
    is separate, this dependency does not exist.
    
    The changes introduced ensure that MEI modules are unloaded and reloaded in the
    correct order based on platform-specific dependencies. This is achieved by adding
    a MODULE_SOFTDEP directive to the i915 and Xe module code.
    
    These changes enhance the robustness of MEI module handling across different hardware
    platforms, ensuring that the i915/Xe driver can be cleanly unloaded and reloaded
    without issues.
    
    v2: updated commit message
    
    Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
    Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
    Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch bab1666fc2379a31ac48e7d61683d3edeaf29244 drm-intel
ca63c457e990 drm: Ensure Proper Unload/Reload Order of MEI Modules for i915/Xe Driver
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
This update addresses the unload/reload sequence of MEI modules in relation to

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


