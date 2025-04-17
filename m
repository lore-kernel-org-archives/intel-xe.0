Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544F1C369C9
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 20:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA25410E3C1;
	Thu, 17 Apr 2025 20:30:45 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076F210E3C1;
 Thu, 17 Apr 2025 20:30:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fixes_for_steered_registe?=
 =?utf-8?q?r_capture?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.c.harrison@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Apr 2025 20:30:45 -0000
Message-ID: <174492184502.16212.6648855712026550195@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250417195215.3002210-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250417195215.3002210-1-John.C.Harrison@Intel.com>
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

Series: Fixes for steered register capture
URL   : https://patchwork.freedesktop.org/series/147940/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 596d95f781127181fca780372dde690c05812e9f
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Thu Apr 17 12:52:14 2025 -0700

    drm/xe/guc: Cache DSS info when creating capture register list
    
    Calculating the DSS id (index of a steered register) currently
    requires reading state from the hwconfig table and that currently
    requires dynamically allocating memory. The GuC based register capture
    (for dev core dumps) includes this index as part of the register name
    in the dump. However, it was calculating said index at the time of the
    dump for every dump. That is wasteful. It also breaks anyone trying to
    do the dump at a time when memory allocations are not allowed.
    
    So rather than calculating on every print, just calculate at start of
    day when creating the register list in the first place.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 5cd835ef6352a207fa4177184b397dfd82989e5d drm-intel
4ee80c9b370b drm/xe/guc: Fix capture of steering registers
2413924f6082 drm/xe/guc: Use the steering flag when printing registers
596d95f78112 drm/xe/guc: Cache DSS info when creating capture register list
-:71: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#71: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:124:
+	{ INDIRECT_RING_STATE(0),	REG_32BIT,	0,	0,	0,	"INDIRECT_RING_STATE"}, \

-:81: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#81: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:134:
+	{ RING_EXECLIST_STATUS_HI(0),	REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXECLIST_STATUS"}, \

-:83: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#83: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:136:
+	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXECLIST_SQ_CONTENTS"}

-:94: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#94: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:143:
+	{ SC_INSTDONE_EXTRA,		REG_32BIT,	0,	0,	0,	"SC_INSTDONE_EXTRA"}, \

-:95: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#95: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:144:
+	{ SC_INSTDONE_EXTRA2,		REG_32BIT,	0,	0,	0,	"SC_INSTDONE_EXTRA2"}

total: 0 errors, 5 warnings, 0 checks, 144 lines checked


