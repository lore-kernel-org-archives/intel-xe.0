Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88713D6100C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 12:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FDE10E853;
	Thu, 29 Jan 2026 12:43:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF2910E853;
 Thu, 29 Jan 2026 12:43:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/sysctrl=3A_Add_sys?=
 =?utf-8?q?tem_controller_component_for_Xe3p_dGPU_platforms_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Jan 2026 12:43:46 -0000
Message-ID: <176969062644.205866.3994607079054921735@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260129121044.3670780-8-anoop.c.vijay@intel.com>
In-Reply-To: <20260129121044.3670780-8-anoop.c.vijay@intel.com>
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

Series: drm/xe/sysctrl: Add system controller component for Xe3p dGPU platforms (rev7)
URL   : https://patchwork.freedesktop.org/series/159554/
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
commit 228d9cdc4e58e7b055b380abe398a7a814c81c9c
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Thu Jan 29 04:10:47 2026 -0800

    drm/xe/sysctrl: Enable System Controller for Xe3p
    
    Add PCI device detection for System Controller capability
    and update build system to include System Controller
    components.
    
    Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
    
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 7d2c5f861ae9bbed1464e1a6aa39a9055139a4b0 drm-intel
a3f44bd2e312 drm/xe/sysctrl: Add System Controller register definitions
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 36 lines checked
83fcab22c5c2 drm/xe/sysctrl: Add System Controller types and structures
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 110 lines checked
e79b292fa817 drm/xe/sysctrl: Add System Controller mailbox implementation
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 390 lines checked
30c1efcfa37e drm/xe/sysctrl: Add System Controller initialization
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 93 lines checked
43452acf51db drm/xe/sysctrl: Integrate System Controller into device
228d9cdc4e58 drm/xe/sysctrl: Enable System Controller for Xe3p


