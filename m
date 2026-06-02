Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CB4CD6E60
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 17:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D93C10F409;
	Tue,  2 Jun 2026 17:21:22 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1278910F409;
 Tue,  2 Jun 2026 17:21:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Vswing_/_Preemphasis_Over?=
 =?utf-8?q?ride?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Jun 2026 17:21:21 -0000
Message-ID: <178042088107.36705.12205057359213358588@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260602170031.1163205-1-michal.grzelak@intel.com>
In-Reply-To: <20260602170031.1163205-1-michal.grzelak@intel.com>
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

Series: Vswing / Preemphasis Override
URL   : https://patchwork.freedesktop.org/series/167757/
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
commit b9872c03ea1d113c2de77c48456864531b3c7590
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Tue Jun 2 19:00:31 2026 +0200

    drm/i915/bios: remove VS/PE-O warning
    
    There is not much use of warning when port asks to override default
    VS/PE since it is already logged. Remove drm_WARN() and child_device
    from print_ddi_port() since drm_WARN() was the only user of it.
    
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 18f3d188fbfa0aeb37bb915df838becb9bfda446 drm-intel
bbafc3017724 drm/i915/bios: search for VBT #57 by default
49eaf6005209 drm/i915/bios: store VBT #57's metadata in intel_vbt_data
64a5382b0bf4 drm/i915/bios: print VS/PE-O port info
4343241484db drm/i915/bios: de/allocate VS/PE-O buffer for each port
d9fc3a1e9bc0 drm/i915: override LT's VS/PE when requested
a2fb2f545fcb drm/i915: override Snps's VS/PE when requested
682d45095c57 drm/i915: override Combo's VS/PE when requested
-:71: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#71: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3945:
+	for (level = 0; level < num_rows; level++) {
+

total: 0 errors, 0 warnings, 1 checks, 115 lines checked
b9872c03ea1d drm/i915/bios: remove VS/PE-O warning


