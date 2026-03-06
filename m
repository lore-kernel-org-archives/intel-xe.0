Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABCBF513E9
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 02:53:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CCC10E2F4;
	Fri,  6 Mar 2026 02:53:46 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E80810E2F3;
 Fri,  6 Mar 2026 02:53:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/lnl+/tc=3A_Fix_f?=
 =?utf-8?q?alse_disconnect_of_active_DP-alt_TC_port_during_long_HPD_pulse?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Mar 2026 02:53:46 -0000
Message-ID: <177276562617.323631.1203579004298382136@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260305075857.40077-1-acelan.kao@canonical.com>
In-Reply-To: <20260305075857.40077-1-acelan.kao@canonical.com>
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

Series: drm/i915/lnl+/tc: Fix false disconnect of active DP-alt TC port during long HPD pulse
URL   : https://patchwork.freedesktop.org/series/162631/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f5320795c9dd526be697a90939847365c940a2ae
Author: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
Date:   Thu Mar 5 15:58:57 2026 +0800

    drm/i915/lnl+/tc: Fix false disconnect of active DP-alt TC port during long HPD pulse
    
    On platforms using XELPDP+ (Lunar Lake and later), tc_phy_hpd_live_status()
    reads the PICAINTERRUPT_ISR register to determine DP-alt live status. The
    XELPDP_DP_ALT_HOTPLUG_MASK bit in this register reflects the live HPD signal,
    which deasserts (goes low) during a long HPD pulse from the sink.
    
    When an LTTPR dongle (e.g. HP Type-C to HDMI, 03f0:8a4a) fires a long HPD
    pulse after link training, intel_tc_port_connected() reads PICAINTERRUPT_ISR
    and returns false even though the PHY is still owned and the link is active.
    Since intel_tc_port_handles_hpd_glitches() returns true for TC dp-alt ports,
    the 4ms glitch-filter retry loop in intel_digital_port_connected_locked() is
    bypassed immediately, giving no protection against this transient deassertion.
    
    The AUX abort logic then fires (-ENXIO), the hotplug handler marks DP-1 as
    disconnected, and the compositor responds by disabling eDP-1, causing the
    internal display to disappear.
    
    Fix this by trusting the PHY ownership register
    (XELPDP_PORT_BUF_CTL1 & XELPDP_TC_PHY_OWNERSHIP) over the transient HPD
    live status in intel_tc_port_connected() when the port has an active link
    (link_refcount > 0). The ownership register is stable and does not toggle
    during HPD pulses.
    
    The TC cold power domain is guaranteed to be held when link_refcount > 0,
    as __intel_tc_port_lock() already asserts and verifies this via tc_phy_is_owned()
    before we reach intel_tc_port_connected().
    
    Without this fix, triggering mirror mode via hotkey on HP ZBook with HP Type-C
    to HDMI dongle (03f0:8a4a) causes:
    
      [drm:intel_dp_hpd_pulse] got hpd irq on [ENCODER:270:DDI TC1/PHY TC1] - long
      [drm:intel_tc_port_update_mode] Port D/TC#1: TC port mode reset (disconnected -> tbt-alt)
      [drm:intel_dp_hpd_pulse] got hpd irq on [ENCODER:270:DDI TC1/PHY TC1] - long
      [drm:intel_hotplug_detect_connector] [CONNECTOR:271:DP-1] status updated from connected to disconnected
    
    With this fix, the port correctly stays in DP-alt mode:
    
      [drm:intel_tc_port_update_mode] Port D/TC#1: TC port mode reset (dp-alt -> disconnected)
      [drm:intel_tc_port_update_mode] Port D/TC#1: TC port mode reset (disconnected -> dp-alt)
    
    Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
+ /mt/dim checkpatch 79792a2fc5d37b5446e543f1de05158ab0f551c9 drm-intel
f5320795c9dd drm/i915/lnl+/tc: Fix false disconnect of active DP-alt TC port during long HPD pulse
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
XELPDP_DP_ALT_HOTPLUG_MASK bit in this register reflects the live HPD signal,

total: 0 errors, 1 warnings, 0 checks, 11 lines checked


