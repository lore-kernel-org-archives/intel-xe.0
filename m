Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2BE606A322
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 17:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C95310F0F0;
	Mon, 16 Nov 2026 17:44:38 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE59910E3B1;
 Mon, 16 Nov 2026 17:44:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/backlight=3A_Kee?=
 =?utf-8?q?p_ACPI_brightness_requests_while_the_display_is_off?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexis Calin via B4 Relay" <devnull+alexiscalin.protonmail.com@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Nov 2026 17:44:37 -0000
Message-ID: <179485107770.33750.13145549790709520093@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261114-i915-acpi-backlight-display-off-v1-1-9306f19d605a@protonmail.com>
In-Reply-To: <20261114-i915-acpi-backlight-display-off-v1-1-9306f19d605a@protonmail.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/i915/backlight: Keep ACPI brightness requests while the display is off
URL   : https://patchwork.freedesktop.org/series/178713/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit deffe690be69d631c7cd7f9b108c57e2b6f6dc64
Author: Alexis Calin <alexiscalin@protonmail.com>
Date:   Sat Nov 14 16:06:32 2026 +0100

    drm/i915/backlight: Keep ACPI brightness requests while the display is off
    
    intel_backlight_set_acpi() returns early when the connector has no
    crtc. This is meant for requests that the BIOS sends during driver init,
    but the connector also has no crtc while the display is turned off, e.g.
    when the desktop blanks the screen. A brightness request received then
    is dropped, while asle_set_backlight() still reports it as done in CBLV.
    When the display is turned on again, the backlight is enabled with the
    old level.
    
    With the ACPI video backlight interface, this happens on the GNOME idle
    path: the screen is dimmed, then blanked, and on wake-up GNOME restores
    the previous level while the display is still off. The panel then comes
    back at the dimmed level, while the backlight class device and CBLV
    report the restored one.
    
    The crtc is only needed to program the hardware, as vlv_set_backlight()
    gets the pipe from it. Store the new level in all cases, like
    intel_panel_set_backlight() does for the native backlight interface, and
    only program it when the backlight is enabled and there is a crtc. The
    next backlight enable then uses the new level.
    
    Fixes: 752aa88a1e78 ("drm/i915: make backlight functions take a connector")
    Assisted-by: LLM
    Signed-off-by: Alexis Calin <alexiscalin@protonmail.com>
+ /mt/dim checkpatch d5a6e2921e68b0cc42812376ca6c8095b6c941a2 drm-intel
deffe690be69 drm/i915/backlight: Keep ACPI brightness requests while the display is off
-:28: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#28: 
Assisted-by: LLM

-:28: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#28: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 30 lines checked


