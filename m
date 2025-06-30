Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E81C83030
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 22:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B85810E07A;
	Mon, 30 Jun 2025 22:43:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D48110E07A;
 Mon, 30 Jun 2025 22:43:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_helper_for_disp?=
 =?utf-8?q?lay_workarounds_and_add_Wa=5F16025573575?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Jun 2025 22:43:40 -0000
Message-ID: <175132342057.121988.11802361118423675028@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250630054918.2823537-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250630054918.2823537-1-ankit.k.nautiyal@intel.com>
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

Series: Introduce helper for display workarounds and add Wa_16025573575
URL   : https://patchwork.freedesktop.org/series/150935/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 37c14fdc8239f3ef00c4603413ee6af1120d1177
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Jun 30 11:19:18 2025 +0530

    drm/i915/gmbus: Add Wa_16025573575 for PTL for bit-bashing
    
    As per Wa_16025573575 for PTL, set the GPIO masks bit before starting
    bit-bashing and maintain value through the bit-bashing sequence.
    After bit-bashing sequence is done, clear the GPIO masks bits.
    
    v2:
    -Use new helper for display workarounds. (Jani)
    -Use a separate if-block for the workaround. (Gustavo)
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch d9007d535ea106181346f9988c97aa73a9cdfb86 drm-intel
164179ba682e drm/i915/display_wa: Add helpers to check wa
-:58: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#58: FILE: drivers/gpu/drm/i915/display/intel_display_wa.h:32:
+#define intel_display_wa(__display, __wa) __intel_display_wa((__display), _intel_display_wa_expand(__wa))

total: 0 errors, 1 warnings, 0 checks, 43 lines checked
37c14fdc8239 drm/i915/gmbus: Add Wa_16025573575 for PTL for bit-bashing


