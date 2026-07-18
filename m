Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B020C4451B
	for <intel-xe@archiver.kernel.org>; Sat, 18 Jul 2026 10:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4413B10E56A;
	Sat, 18 Jul 2026 10:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sms-medipool.de header.i=@sms-medipool.de header.b="nlTTYwUB";
	dkim-atps=neutral
Received: from mail.sms-medipool.de (mail.sms-medipool.de [178.63.14.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6915B10E32E;
 Sat, 18 Jul 2026 10:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sms-medipool.de;
 s=mail; t=1784371929;
 bh=IrG2R2T6jgTkwGB3VBs5ea6qqLRhQKQkhzvLQ1gG5Zo=;
 h=From:To:Cc:Subject:Date:From;
 b=nlTTYwUBotgDIU1/SJvSjV0mK47LDNY9m6bWRXuOBj5UE4lrcwDd0pFek5GKgZJFE
 WwnkFCgP5umDQ50CzugAkbQhAkRzEE8LzNUE6XkxeuM0ZCD9fywzwwf116GOpz8syi
 ahgAODmomIoDWe5vv2V9PTurFY61PDtQGeIiEqWf6A2rxaLrJWSSAtjJavD0HBMFfx
 /EnFTqdRHLigTrfM4LKLsF2IMazCbFNUUaNjdHE3dLVq2BwbfS1mEsJgIvOzbW5Rop
 UM0ZyWGuqXnmWAgo3fIX9WD/cVOFSjjFe7z3I3CX+1C3rfe1qiJwUoUNObfgP7XQVQ
 WeO+vjAItHBhA==
Received: from mail.stoss-medica.de (mail.stoss-medica.de [213.147.17.40])
 by mail.sms-medipool.de (Postfix) with ESMTPS id 752AF18C15;
 Sat, 18 Jul 2026 12:52:09 +0200 (CEST)
Received: from NUC16-Linux.sb.golima.de ([95.88.98.111])
 by mail.stoss-medica.de (Kerio Connect 10.0.8 patch 2) with ESMTP;
 Sat, 18 Jul 2026 12:52:08 +0200
From: Alexander Kaplan <alexander.kaplan@sms-medipool.de>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, alexander.kaplan@sms-medipool.de
Subject: [PATCH v2 0/2] drm/i915/dp: Fix FRL rate selection and deep color for
 HDMI sinks behind FRL PCONs
Date: Sat, 18 Jul 2026 12:52:05 +0200
Message-ID: <20260718105207.5565-1-alexander.kaplan@sms-medipool.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Sorry for the late v2, work kept me away from this longer than
planned.

HDMI 2.1 sinks behind a DP to HDMI 2.1 PCON currently train the FRL
link below what the hardware supports, because the sink's DSC max FRL
rate caps the trained FRL rate even when the PCON has no DSC encoder
and thus never produces compressed transport.
Patch 2 applies the sink's DSC max FRL rate only when the PCON
actually has a DSC 1.2 encoder (the gate intel_dp_pcon_dsc_configure()
already uses).
On a Panther Lake NUC (xe) with a Synaptics VMM7100 PCON and an LG
OLED G4 (Max_FRL_Rate 48 Gbps, DSC_Max_FRL_Rate 24 Gbps) this trains
the FRL link at 48 instead of 24 Gbps, matching Windows/macOS on the
same hardware.

Patch 1 makes the link config prefer DSC over a dithered 6 bpc
uncompressed output for HDMI sinks.
Modes which fit an FRL link uncompressed only with 6 bpc (e.g. 4k120
on a 4 lane HBR3 link) would otherwise select an RGB 6 bpc output,
which the tested Synaptics PCONs cannot display at such pixel clocks
(black screen), and which HDMI cannot carry anyway.

v1 patch 3 ("drm/i915/dp: Check FRL bandwidth limits in the HDMI bpc
computation") is dropped from this series.
Ankit's reworked PCON series covers that part of the problem, and
testing on this hardware was offered for it.

One more thing: patch 1 touches intel_dp_compute_config_limits(),
where the first part of Imre's link caps rework has landed in the
meantime, with the rest of the rework still in flight.
I rebased on top of it and see no conflict, but I don't want to get
in the way of that rework.
So it's up to you whether to take this now or let it wait for Imre's
changes and rebase it on top, either is fine with me.
Sorry Imre if this crosses paths with your series.

Changes in v2:
- Patch 1: apply the limit only to HDMI sinks behind a DFP
  (intel_dp_has_hdmi_sink()), leaving DP and eDP link config policy
  untouched, subject adjusted accordingly. (Ankit)
- Patch 2: no code changes, picked up Ankit's Reviewed-by.
- Dropped v1 patch 3 in favor of Ankit's reworked PCON series.

v1: https://lore.kernel.org/r/20260610174413.5881-1-alexander.kaplan@sms-medipool.de

Alexander Kaplan (2):
  drm/i915/dp: Prefer DSC over 6 bpc uncompressed output for HDMI sinks
  drm/i915/dp: Ignore the sink's DSC max FRL rate without a PCON DSC
    encoder

 drivers/gpu/drm/i915/display/intel_dp.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

--
2.54.0

