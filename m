Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A960C001E0
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 11:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E54010E1B8;
	Mon, 23 Oct 2023 11:17:53 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0ED710E1B1
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 11:17:36 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 23 Oct 2023 13:17:14 +0200
Message-Id: <20231023111729.696496-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 00/15] sound/for-next: Cherry pick patches from
 sound/for-next
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

Sound patches have been merged to the sound tree, rebase Xe on top of the new patches.

Maarten Lankhorst (13):
  Revert "sound/soc/sof: Remove deferred probe for SOF"
  Revert "sound/hda: Allow XE as i915 replacement for sound"
  ASoC: SOF: core: Ensure sof_ops_free() is still called when probe
    never ran.
  ASoC: SOF: Intel: Fix error handling in hda_init()
  ALSA: hda: Intel: Fix error handling in azx_probe()
  ALSA: hda: i915: Allow override of gpu binding.
  ALSA: hda: i915: Add an allow_modprobe argument to snd_hdac_i915_init
  ALSA: hda: i915: Allow xe as match for i915_component_master_match
  ASoC: Intel: avs: Move snd_hdac_i915_init to before probe_work.
  ALSA: hda: Intel: Move snd_hdac_i915_init to before probe_work.
  ASoC: Intel: Skylake: Move snd_hdac_i915_init to before probe_work.
  ASoC: SOF: Intel: Move binding to display driver outside of deferred
    probe
  ALSA: hda: i915: Remove extra argument from snd_hdac_i915_init

Pierre-Louis Bossart (2):
  ASoC: SOF: core: Add probe_early and remove_late callbacks
  ASoC: SOF: Intel: hda: start splitting the probe

 sound/hda/hdac_i915.c                | 19 ++++++--
 sound/pci/hda/hda_intel.c            | 64 ++++++++++++-------------
 sound/soc/intel/avs/core.c           |  4 +-
 sound/soc/intel/skylake/skl.c        | 31 ++++--------
 sound/soc/sof/Kconfig                | 19 ++++++++
 sound/soc/sof/core.c                 | 53 ++++++++++++++++++++-
 sound/soc/sof/intel/hda-common-ops.c |  2 +
 sound/soc/sof/intel/hda.c            | 70 +++++++++++++++-------------
 sound/soc/sof/intel/hda.h            |  2 +
 sound/soc/sof/ops.h                  | 16 +++++++
 sound/soc/sof/sof-pci-dev.c          |  3 +-
 sound/soc/sof/sof-priv.h             |  7 +++
 12 files changed, 193 insertions(+), 97 deletions(-)

-- 
2.39.2

