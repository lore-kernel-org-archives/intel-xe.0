Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705BBCD4F3C
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 13:00:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D746F10E132;
	Wed, 20 May 2026 13:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=elitecode.cz header.i=@elitecode.cz header.b="Z7MewCmN";
	dkim-atps=neutral
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA1110E132
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 13:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elitecode.cz;
 s=protonmail; t=1779281753; x=1779540953;
 bh=e2fcIk6vbMLyHzZitairxpCkqEdZgCdT5SJo2A/rGkw=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=Z7MewCmNurU+/oWAZdRTMlyc/cwvkFby10OTC9ZY+w5yGVTBnHfcv9uy7blvr2kqE
 QZgXA8+c30dau+9cvChwsz/3hAjtNA+Z0O8VhC43vQ9qRj9EN7DqR/EWvsB1a0vI1d
 39epyjgoGjRlCwgXsEbAMYFl0YK5eQtD4JSSNewQ3hGud1e171W4ih8FnxvSqo36HS
 HIwTgsvME+lmfqdYQB3dde7Zl9xYbp99X4lT5PAC9l5guKHBRnTiV6usd1a2ZV+oJk
 jw8qNCFCZpmmjkisAivd5r3UojiaZzXqS7drWHuLb7M6OAYxLa1s/iS3xJ06S2zieY
 jkn8+XLC13rCA==
Date: Wed, 20 May 2026 12:55:48 +0000
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
From: Jakub Bystron <jb@elitecode.cz>
Subject: [BUG] xe: Meteor Lake 7d55 eDP PHY A/DPLL state mismatch,
 flip_done timeout
Message-ID: <pqne8IzoDMDIqi1_8iCtI-YGeB7j4hczgaNPp2JUSJbsF9ovVC3KUo9t4va0uxxDTa376ZG26AwIoltpFV41C9w-Rxf9j-CYQroVaPJZvN0=@elitecode.cz>
Feedback-ID: 63222119:user:proton
X-Pm-Message-ID: 7cbef20f438610a5ee6692c959319b21a145c414
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

I hit a display-side xe failure on a Lenovo ThinkPad P1 Gen 7 with
Meteor Lake / Core Ultra 7 165H integrated graphics.

Hardware:
Manufacturer: LENOVO
Product:      21KV001UCK
BIOS:         N48ET33W (1.20)
GPU:          Intel Meteor Lake iGPU, PCI ID 8086:7d55

Kernel:
Linux 7.0.9_1, Void Linux

Environment:
Xorg
Internal eDP panel

Kernel command line:
i915.force_probe=3D!7d55 xe.force_probe=3D7d55 i915.enable_psr=3D0 xe.enabl=
e_psr=3D0

The kernel is tainted due to force_probe. i915 is explicitly blocked and xe=
 is used for 8086:7d55.

Symptom:
After some uptime, the internal display pipeline appears to wedge. This loo=
ks display/modeset/eDP related, not a Mesa/3D workload issue. PSR was alrea=
dy disabled.

Relevant dmesg excerpt:

[10513.839237] xe 0000:00:02.0: [drm] *ERROR* Failed to bring PHY A to idle=
.
[10513.844179] xe 0000:00:02.0: [drm] *ERROR* PHY A Read 0c70 failed after =
3 retries.
[10513.851165] xe 0000:00:02.0: [drm] *ERROR* PHY A Write 0c70 failed after=
 3 retries.
[10514.042599] xe 0000:00:02.0: [drm] *ERROR* Timeout waiting for DDI BUF A=
 to get active
[10515.226516] xe 0000:00:02.0: [drm] *ERROR* Timed out waiting for DP idle=
 patterns
[10525.710458] xe 0000:00:02.0: [drm] *ERROR* [CRTC:149:pipe A] flip_done t=
imed out
[10525.890816] xe 0000:00:02.0: [drm] *ERROR* [CRTC:149:pipe A] mismatch in=
 pixel_rate (expected 154130, found 38971)
[10525.890823] xe 0000:00:02.0: [drm] *ERROR* [CRTC:149:pipe A] mismatch in=
 dpll_hw_state
[10525.890847] xe 0000:00:02.0: [drm] *ERROR* [CRTC:149:pipe A] mismatch in=
 hw.pipe_mode.crtc_clock (expected 154130, found 38971)
[10525.890849] xe 0000:00:02.0: [drm] *ERROR* [CRTC:149:pipe A] mismatch in=
 hw.adjusted_mode.crtc_clock (expected 154130, found 38971)
[10525.890849] xe 0000:00:02.0: [drm] *ERROR* [CRTC:149:pipe A] mismatch in=
 port_clock (expected 243000, found 61440)
[10525.890853] ------------[ cut here ]------------
[10525.890853] xe 0000:00:02.0: [drm] pipe state doesn't match!
[10525.890854] WARNING: drivers/gpu/drm/i915/display/intel_modeset_verify.c=
:225 at intel_modeset_verify_crtc+0x325/0x550 [xe], CPU#3: Xorg/1485
[10526.070073] ------------[ cut here ]------------
[10526.070074] xe 0000:00:02.0: [drm] DPLL 0: pll hw state mismatch
[10526.070076] WARNING: drivers/gpu/drm/i915/display/intel_dpll_mgr.c:4945 =
at verify_single_dpll_state+0x199/0x540 [xe], CPU#3: Xorg/1485
[10536.462596] xe 0000:00:02.0: [drm] *ERROR* flip_done timed out
[10536.462615] xe 0000:00:02.0: [drm] *ERROR* [CRTC:149:pipe A] commit wait=
 timed out
[10546.702509] xe 0000:00:02.0: [drm] *ERROR* flip_done timed out
[10546.702526] xe 0000:00:02.0: [drm] *ERROR* [CONNECTOR:506:eDP-1] commit =
wait timed out
[10556.942486] xe 0000:00:02.0: [drm] *ERROR* flip_done timed out
[10556.942505] xe 0000:00:02.0: [drm] *ERROR* [PLANE:33:plane 1A] commit wa=
it timed out
[10557.966373] ------------[ cut here ]------------
[10557.966382] xe 0000:00:02.0: [drm] vblank wait timed out on crtc 0
[10557.966388] WARNING: drivers/gpu/drm/drm_vblank.c:1320 at drm_crtc_wait_=
one_vblank+0x183/0x1f0 [drm], CPU#12: kworker/12:0/17806
[10558.421946] xe 0000:00:02.0: [drm] PHY A failed to change powerdown stat=
e

I can reproduce this on this machine with the kernel and command line above=
. In this configuration, xe is not usable for a normal Xorg desktop session=
 on this Meteor Lake 8086:7d55 system, so I currently have to fall back to =
i915 for stability.

Regards,
Jakub

