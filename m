Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1FBFA3728
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jan 2026 17:01:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29C110E13A;
	Fri,  2 Jan 2026 17:01:07 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97E710E0A9;
 Fri,  2 Jan 2026 17:01:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/sysctrl=3A_Add_sys?=
 =?utf-8?q?tem_controller_component_for_Xe3p_dGPU_platforms_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Jan 2026 17:01:06 -0000
Message-ID: <176737326668.123347.12056796060687169722@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260102165450.561614-3-anoop.c.vijay@intel.com>
In-Reply-To: <20260102165450.561614-3-anoop.c.vijay@intel.com>
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

Series: drm/xe/sysctrl: Add system controller component for Xe3p dGPU platforms (rev2)
URL   : https://patchwork.freedesktop.org/series/159554/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9f1cb6875f3f9eb0925ed50c16100322a2df513c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1778e9c2f2563b2d10d4392a78ddd987b72a3372
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Fri Jan 2 08:54:50 2026 -0800

    drm/xe/sysctrl: Add system controller component for Xe3p dGPU platforms
    
    Add a new system controller (sysctrl) component for Intel Xe3p dGPU
    platforms.
    
    This component provides the foundational infrastructure for communication
    with the System Controller firmware using MKHI protocol over a mailbox
    interface.
    
    Key features introduced:
     - Detection and initialization of System Controller interface on Xe3p
       dGPU platforms
     - Mailbox communication with System Controller firmware
     - Fragmented message transfer for large command payloads
    
    This implementation establishes the base for future System Controller
    feature enablement and firmware command handling.
    
    Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
+ /mt/dim checkpatch 56a791b474c0faeff1a2ed97660224617c2b9d2b drm-intel
1778e9c2f256 drm/xe/sysctrl: Add system controller component for Xe3p dGPU platforms
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 703 lines checked


