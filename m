Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6E6C369C2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 21:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A55210E13D;
	Fri, 25 Apr 2025 21:50:26 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C51B10E9D8;
 Fri, 25 Apr 2025 21:50:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_WA_BB_to_ca?=
 =?utf-8?q?pture_active_context_utilization?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Apr 2025 21:50:26 -0000
Message-ID: <174561782605.13289.16052460165338401049@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250425191039.1551559-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20250425191039.1551559-1-umesh.nerlige.ramappa@intel.com>
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

Series: drm/xe: Add WA BB to capture active context utilization
URL   : https://patchwork.freedesktop.org/series/148289/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a4e5d9a86fb800922bd3d60ed6e256f49ace5ecc
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Fri Apr 25 12:10:39 2025 -0700

    drm/xe: Add WA BB to capture active context utilization
    
    Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks
    of the context, but only gets updated when the context switches out. In
    order to check how long a context has been active before it switches
    out, two things are required:
    
    (1) Determine if the context is running:
    
    To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP
    in the lrc. The value chosen is 1 since 0 is the initial value when the
    lrc is initialized. During a query, we just check for this value to
    determine if the context is active. If the context switched out, it
    would overwrite this location with the actual CTX_TIMESTAMP MMIO value.
    Note that wa bb will run after the context has been restored, so reusing
    this lrc location will not clobber anything.
    
    (2) Calculate the time that the context has been active for:
    
    The CTX_TIMESTAMP ticks only when the context is active. If a context is
    active, we just use the CTX_TIMESTAMP MMIO as the new value of
    utilization. While doing so, we need to read the CTX_TIMESTAMP MMIO
    for the specific engine instance. Since we do not know which instance
    the context is running on until it is scheduled, we also read the
    ENGINE_ID MMIO in the wa bb and store it in the PPHSWP.
    
    Using the above 2 instructions in a WA BB, capture active context
    utilization.
    
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 6e67a7af43567bb9f23fe156fde7efa3d214fd20 drm-intel
a4e5d9a86fb8 drm/xe: Add WA BB to capture active context utilization
-:174: ERROR:CODE_INDENT: code indent should use tabs where possible
#174: FILE: drivers/gpu/drm/xe/xe_lrc.c:939:
+        *cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);$

-:174: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#174: FILE: drivers/gpu/drm/xe/xe_lrc.c:939:
+        *cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);$

-:175: ERROR:CODE_INDENT: code indent should use tabs where possible
#175: FILE: drivers/gpu/drm/xe/xe_lrc.c:940:
+        *cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);$

-:175: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#175: FILE: drivers/gpu/drm/xe/xe_lrc.c:940:
+        *cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);$

-:176: ERROR:CODE_INDENT: code indent should use tabs where possible
#176: FILE: drivers/gpu/drm/xe/xe_lrc.c:941:
+        *cmd++ = 0;$

-:176: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#176: FILE: drivers/gpu/drm/xe/xe_lrc.c:941:
+        *cmd++ = 0;$

-:177: ERROR:CODE_INDENT: code indent should use tabs where possible
#177: FILE: drivers/gpu/drm/xe/xe_lrc.c:942:
+        *cmd++ = 1;$

-:177: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#177: FILE: drivers/gpu/drm/xe/xe_lrc.c:942:
+        *cmd++ = 1;$

total: 4 errors, 4 warnings, 0 checks, 291 lines checked


