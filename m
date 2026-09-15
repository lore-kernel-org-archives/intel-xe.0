Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746F8C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 04:15:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225CE10F922;
	Tue, 15 Sep 2026 04:15:42 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB86A10F922;
 Tue, 15 Sep 2026 04:15:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Add_c?=
 =?utf-8?q?ommand_line_param_for_DC_balance_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Sep 2026 04:15:40 -0000
Message-ID: <178944574082.162217.3744122274651536400@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260915040015.2451786-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20260915040015.2451786-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: drm/i915/display: Add command line param for DC balance (rev2)
URL   : https://patchwork.freedesktop.org/series/172945/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 55af9f7f4672157555d97c112d1b20315f6c8111
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Tue Sep 15 09:30:15 2026 +0530

    drm/i915/display: Add command line param for DC balance
    
    Add an 'enable_dc_balance' display module parameter, disabled by
    default, so the feature can be explicitly opted in at driver
    initialization on configurations where it is known to be beneficial,
    while preserving existing behaviour everywhere else.
    intel_vrr_dc_balance_compute_config() honours the parameter, so no
    recompilation is needed to try the feature.
    
    --v2:
    - Make enable_dc_balance a bool and keep it disabled by default; fix the
      parameter type/value mismatch and correct the description (Chaitanya
      Kumar Borah, Jani Nikula)
    - Explain in the commit message why the feature is gated and why a
      module parameter is used (Jani Nikula)
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch 19d79b860b8d526661d2697b4abc21e262f614d0 drm-intel
55af9f7f4672 drm/i915/display: Add command line param for DC balance
-:31: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#31: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:124:
+intel_display_param_named_unsafe(enable_dc_balance, bool, 0400,
+	"Enable VRR DC balance (0=disabled, 1=enabled). "

total: 0 errors, 0 warnings, 1 checks, 30 lines checked


