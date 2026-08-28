Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A37C61DC6
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 09:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2589B10F304;
	Fri, 28 Aug 2026 09:06:18 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3492910F304;
 Fri, 28 Aug 2026 09:06:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Add_c?=
 =?utf-8?q?ommand_line_param_for_DC_balance?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Aug 2026 09:06:17 -0000
Message-ID: <178790797720.95188.15498720451358501657@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260828085037.1430881-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20260828085037.1430881-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: drm/i915/display: Add command line param for DC balance
URL   : https://patchwork.freedesktop.org/series/172945/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f95435b7d41b8b31dfd5a759247c169f3e00ca56
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Fri Aug 28 14:20:36 2026 +0530

    drm/i915/display: Add command line param for DC balance
    
    Add a new module parameter 'enable_dc_balance' to allow enabling or
    disabling the VRR DC balance feature at runtime. The DC balance
    computation in intel_vrr_dc_balance_compute_config() now honours this
    parameter, so the feature can be toggled without recompiling.
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch 5901f93eb5a007e8b7c21ca2b5bfae5958467832 drm-intel
f95435b7d41b drm/i915/display: Add command line param for DC balance
-:22: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#22: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:124:
+intel_display_param_named_unsafe(enable_dc_balance, int, 0400,
+	"Enable DC Balance (0=disabled, 1=enable). Default: 1 (use per-chip default)");

total: 0 errors, 0 warnings, 1 checks, 29 lines checked


