Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C080C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 11:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D5910E0F8;
	Thu,  5 Jun 2025 11:48:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C94110E870;
 Thu,  5 Jun 2025 11:48:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Add_n?=
 =?utf-8?q?o=5Fpsr=5Freason_to_PSR_debugfs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 11:48:21 -0000
Message-ID: <174912410130.51837.2916017139396088398@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605091300.3739436-1-michal.grzelak@intel.com>
In-Reply-To: <20250605091300.3739436-1-michal.grzelak@intel.com>
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

Series: drm/i915/display: Add no_psr_reason to PSR debugfs (rev2)
URL   : https://patchwork.freedesktop.org/series/148957/
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
commit d290b5678d447cee11926a4e39ab88569569cddc
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Thu Jun 5 11:12:58 2025 +0200

    drm/i915/display: Add no_psr_reason to PSR debugfs
    
    There is no reason in debugfs why PSR has been disabled. Add
    no_psr_reason field into struct intel_psr. Write the reason,
    e.g. PSR setup timing not met, into proper PSR debugfs file.
    Clean it when PSR is activated.
    
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
+ /mt/dim checkpatch cbceb1c61ee3a50472a3155eb8166b36929541d8 drm-intel
d290b5678d44 drm/i915/display: Add no_psr_reason to PSR debugfs
-:63: ERROR:CODE_INDENT: code indent should use tabs where possible
#63: FILE: drivers/gpu/drm/i915/display/intel_psr.c:2925:
+^I^I                psr->no_psr_reason = "PSR disabled in new state";$

-:65: ERROR:CODE_INDENT: code indent should use tabs where possible
#65: FILE: drivers/gpu/drm/i915/display/intel_psr.c:2927:
+^I^I                psr->no_psr_reason = "All planes will go inactive";$

-:69: ERROR:CODE_INDENT: code indent should use tabs where possible
#69: FILE: drivers/gpu/drm/i915/display/intel_psr.c:2931:
+^I^I                psr->no_psr_reason = "Region Early Transport changing";$

-:73: ERROR:CODE_INDENT: code indent should use tabs where possible
#73: FILE: drivers/gpu/drm/i915/display/intel_psr.c:2935:
+^I^I^I        psr->no_psr_reason = "Bspec #21664 Display WA #1136: skl, bxt";$

total: 4 errors, 0 warnings, 0 checks, 76 lines checked


