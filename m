Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932D2CCFA13
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 18:01:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5877F10E2DE;
	Mon, 10 Nov 2025 18:01:25 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB63410E2DE;
 Mon, 10 Nov 2025 18:01:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/de=3A_Register_p?=
 =?utf-8?q?olling_cleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Nov 2025 18:01:24 -0000
Message-ID: <176279768469.35467.5421934184670884660@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251110172756.2132-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251110172756.2132-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/de: Register polling cleanup
URL   : https://patchwork.freedesktop.org/series/157343/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2114070788a38f8429aedc1faf23438d9f086675
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon Nov 10 19:27:55 2025 +0200

    drm/i915/dpio: Use the intel_de_wait_ms() out value
    
    Utilize the 'out_value' output parameter of intel_de_wait_ms()
    isntead of re-readiong the DPLL/DPIO_PHY_STATUS register after
    polling has finished.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch a9792b1ab75123e4aceaba953a89809e745919c6 drm-intel
658731ac3077 drm/i915/de: Implement register waits one way
a3268024d19e drm/i915/de: Have intel_de_wait() hand out the final register value
86c29acd092f drm/i915/de: Include units in intel_de_wait*() function names
-:294: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#294: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2816:
+		if (intel_de_wait_for_clear_ms(display, XELPDP_PORT_M2P_MSGBUS_CTL(display, port, lane),

total: 0 errors, 1 warnings, 0 checks, 1017 lines checked
2594223826a6 drm/i915/de: Introduce intel_de_wait_us()
138ef48fe0ea drm/i915/de: Use intel_de_wait_us()
e18c22634610 drm/i915/de: Use intel_de_wait_ms() for the obvious cases
f58340e52a2a drm/i915/de: Nuke intel_de_wait_custom()
d4a79f50146d drm/i915/de: Introduce intel_de_wait_for_{set, clear}_us()
feddee473752 drm/i915/de: Use intel_de_wait_for_{set,clear}_us()
f45394511c0c drm/i915/de: Use intel_de_wait_for_{set,clear}_ms()
09f85f89e247 drm/1915/dpio: Stop using intel_de_wait_fw_ms()
0af77b721ede drm/u195/de: Replace __intel_de_rmw_nowl() with intel_de_rmw_fw()
40260f0cac20 drm/i915/de: Nuke wakelocks from intel_de_wait_fw_ms()
c951edddd49b drm/i915/de: Replace __intel_de_wait_for_register_nowl() with intel_de_wait_fw_us_atomic()
702e16883d67 drm/i915/power: Use the intel_de_wait_ms() out value
2114070788a3 drm/i915/dpio: Use the intel_de_wait_ms() out value


