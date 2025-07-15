Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AC4C83F2D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 13:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A24B10E5CC;
	Tue, 15 Jul 2025 13:42:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1453C10E5CA;
 Tue, 15 Jul 2025 13:42:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable=5Fpsr_kernel_param?=
 =?utf-8?q?eter_changes_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Jul 2025 13:42:17 -0000
Message-ID: <175258693707.163104.17813710223025414664@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250715105509.4146806-1-jouni.hogander@intel.com>
In-Reply-To: <20250715105509.4146806-1-jouni.hogander@intel.com>
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

Series: Enable_psr kernel parameter changes (rev4)
URL   : https://patchwork.freedesktop.org/series/151261/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5a2091933c47f4dad7803cd6abc5a31c560eaacc
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Tue Jul 15 13:55:09 2025 +0300

    drm/i915/psr: Add enable_panel_replay module parameter
    
    Add new module parameter enable_panel_replay. This can be used to
    enable/disable Panel Replay. 0=disabled, 1=enabled. -1=use per-chip default
    (default).
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 64f56ca0926a30d50bcc0c215b262f5149c7e5cd drm-intel
76763052a6de drm/i915/psr: Do not disable Early Transport when enable_psr is set
cca10bd9c99e drm/i915/psr: Ignore enable_psr parameter on Panel Replay
5a2091933c47 drm/i915/psr: Add enable_panel_replay module parameter
-:24: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#24: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:124:
+intel_display_param_named_unsafe(enable_panel_replay, int, 0400,
+	"Enable Panel Replay (0=disabled, 1=enabled). Default: -1 (use per-chip default)");

total: 0 errors, 0 warnings, 1 checks, 27 lines checked


