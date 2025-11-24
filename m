Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AC5CFD362
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 22:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1CE10E31E;
	Mon, 24 Nov 2025 22:25:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5237010E276;
 Mon, 24 Nov 2025 22:25:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_System_Cont?=
 =?utf-8?q?roller_support_for_Xe3p_dGPU_platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Nov 2025 22:25:36 -0000
Message-ID: <176402313633.23084.10135367988725216391@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
In-Reply-To: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
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

Series: drm/xe: Add System Controller support for Xe3p dGPU platforms
URL   : https://patchwork.freedesktop.org/series/157937/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e173e4fea32a54e3f86631f3b89d04be659286ca
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Fri Nov 21 20:58:07 2025 -0800

    drm/xe/sc: Add system controller component for Xe3p dGPU platforms
    
    Add a new system controller (SC) component for Intel Xe3p dGPU platforms.
    
    This component provides the foundational infrastructure for communication
    with the SC firmware using the MKHI protocol over a mailbox interface.
    
    Key features introduced:
    - Detection and initialization of the SC interface on Xe3p dGPU platforms
    - Mailbox communication with SC firmware
    - Fragmented message transfer for large command payloads
    
    This implementation establishes the base for future SC feature
    enablement and firmware command handling.
    
    Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
+ /mt/dim checkpatch ed157ca0caebebe3af6d38ca0fb64a403c84ce77 drm-intel
772b3260eca8 drm/xe/soc_remapper: Initialize SoC remapper during Xe probe
-:64: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#64: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
42aa9b58ef4e drm/xe/soc_remapper: Use SoC remapper herlper from VSEC code
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 70 lines checked
ef0e4c3abd43 drm/xe/soc_remapper: Add system controller config for SoC remapper
ccb35d3c011f drm/xe/remapper: Reprogram remapper index on PM resume events
e173e4fea32a drm/xe/sc: Add system controller component for Xe3p dGPU platforms
-:37: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#37: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 666 lines checked


