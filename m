Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333D0C88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 07:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43BD10E613;
	Thu, 17 Sep 2026 07:58:54 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897E410E613;
 Thu, 17 Sep 2026 07:58:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/vrr=3A_Disable_D?=
 =?utf-8?q?C_balance_by_default?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Sep 2026 07:58:53 -0000
Message-ID: <178963193355.176297.10233952306167731123@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260917074322.2606738-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20260917074322.2606738-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: drm/i915/vrr: Disable DC balance by default
URL   : https://patchwork.freedesktop.org/series/174390/
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
commit f3b9c71042db1b6385c52a61b3e3db3bfca6141c
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Thu Sep 17 13:13:22 2026 +0530

    drm/i915/vrr: Disable DC balance by default
    
    Disable VRR DC balance by default due to timing issues observed on some
    panel/TCON combinations.
    
    Keep the module parameter to enable DC balance during debugging and to
    isolate DC balance effects from underlying VRR/display timing issues.
    
    --v2:
    - Make enable_dc_balance a bool and keep it disabled by default; fix the
      parameter type/value mismatch and correct the description (Chaitanya
      Kumar Borah, Jani Nikula)
    - Explain in the commit message why the feature is gated and why a
      module parameter is used (Jani Nikula)
    
    --v3:
    - Commit message update (Jani Nikula)
    
    Fixes: 555819270707 ("drm/i915/vrr: Enable DC Balance")
    Cc: <stable@vger.kernel.org> # v7.0+
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 64bd7b911b1d456cd3d373099cde71f4806d9858 drm-intel
f3b9c71042db drm/i915/vrr: Disable DC balance by default
-:36: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#36: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:124:
+intel_display_param_named_unsafe(enable_dc_balance, bool, 0400,
+	"Enable VRR DC balance (0=disabled, 1=enabled). "

total: 0 errors, 0 warnings, 1 checks, 30 lines checked


