Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31CFCD98C5
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 18:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8D710E5E8;
	Mon, 15 Jun 2026 18:18:07 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE87F10E5CF;
 Mon, 15 Jun 2026 18:18:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Vswing_/_Pre-emphasis_Ove?=
 =?utf-8?q?rride_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Jun 2026 18:18:06 -0000
Message-ID: <178154748670.79171.1549225670967554747@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260615181207.1033389-1-michal.grzelak@intel.com>
In-Reply-To: <20260615181207.1033389-1-michal.grzelak@intel.com>
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

Series: Vswing / Pre-emphasis Override (rev3)
URL   : https://patchwork.freedesktop.org/series/167570/
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
commit 19f7b19c7658758c214a8778e1b3001a091814d1
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Mon Jun 15 20:12:07 2026 +0200

    drm/i915/bios: remove VS/PE-O warning
    
    There is not much use of warning when port asks to override default
    VS/PE since it is already logged. Remove drm_WARN() and child_device
    from print_ddi_port() since drm_WARN() was the only user of it.
    
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 0984dfdee2a4f9e1922fe919a6b469e115e23360 drm-intel
dfbd4c2d8fc3 drm/i915/bios: search for VBT #57 by default
6f21da446673 drm/i915/bios: store VBT #57's metadata in intel_vbt_data
90fd0085ea06 drm/i915/bios: print VS/PE-O port info
359f6833e0e9 drm/i915/bios: de/allocate VS/PE-O buffer for each port
d23a7da5a925 drm/i915: override Snps's VS/PE when requested
1486432a93e3 drm/i915: override Combo's VS/PE when requested
-:195: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#195: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1879:
+								   has_edp && use_edp_low_vswing(encoder));

-:197: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#197: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1881:
+			buf_trans = intel_bios_get_ehl_combo_vspeo(devdata, has_dp, port_clock, has_edp);

total: 0 errors, 2 warnings, 0 checks, 128 lines checked
19f7b19c7658 drm/i915/bios: remove VS/PE-O warning


