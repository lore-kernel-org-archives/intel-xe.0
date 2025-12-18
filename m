Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6FAD6ACFB
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 12:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D61810E193;
	Thu, 18 Dec 2025 12:38:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3523410E193;
 Thu, 18 Dec 2025 12:38:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/cx0=3A_Unify_nam?=
 =?utf-8?q?ing_for_C20_pll_tables_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Dec 2025 12:38:35 -0000
Message-ID: <176606151521.101158.7191720301929727464@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251218122329.2265139-1-mika.kahola@intel.com>
In-Reply-To: <20251218122329.2265139-1-mika.kahola@intel.com>
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

Series: drm/i915/cx0: Unify naming for C20 pll tables (rev2)
URL   : https://patchwork.freedesktop.org/series/158566/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5f54f403acc61a45ad2b4d68dfd74b336dce1968
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8fa0315bc22fbc5af883e84d90af066eb1857ffe
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Thu Dec 18 14:23:29 2025 +0200

    drm/i915/cx0: Unify naming for C20 pll tables
    
    To fetch pll divider tables a function name for C20
    is intel_c20_pll_tables_get() but for C10 the similar
    function is called intel_c10pll_tables_get(). Rename
    intel_c20_pll_tables_get() to intel_c20pll_tables_get()
    to be more consistent.
    
    v2: Unify naming for all intel_cx0_pll_* to
        intel_cx0pll_* functions (Krzysztof)
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch 31985bb0a701138a06a5eb0b175b2a5c850cc4ee drm-intel
8fa0315bc22f drm/i915/cx0: Unify naming for C20 pll tables
-:27: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#27: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2291:
+static void intel_c10pll_program(struct intel_display *display,
 				  struct intel_encoder *encoder,

-:36: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#36: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2462:
+intel_c20pll_tables_get(const struct intel_crtc_state *crtc_state,
 			 struct intel_encoder *encoder)

-:45: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#45: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2630:
+intel_c20pll_find_table(const struct intel_crtc_state *crtc_state,
 			 struct intel_encoder *encoder)

-:70: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#70: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2884:
+static void intel_c20pll_program(struct intel_display *display,
 				  struct intel_encoder *encoder,

total: 0 errors, 0 warnings, 4 checks, 114 lines checked


