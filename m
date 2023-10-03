Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96026E7544F
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 12:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B43510E0CB;
	Tue,  3 Oct 2023 12:00:52 +0000 (UTC)
X-Greylist: delayed 58916 seconds by postgrey-1.36 at gabe;
 Tue, 03 Oct 2023 12:00:48 UTC
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CB310E0CB
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 12:00:48 +0000 (UTC)
From: maarten.lankhorst@linux.intel.com
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 14:00:19 +0200
Message-Id: <20231003120033.3505-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 00/14] Update sound patches to upstreamable
 versions.
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

From: Maarten Lankhorst <dev@lankhorst.se>

The versions inside xe are old, and I've made several iterations since.
Posting as series on the mailing list so we get CI results before
merging it.

Maarten Lankhorst (12):
  Revert "sound/soc/sof: Remove deferred probe for SOF"
  Revert "sound/hda: Allow XE as i915 replacement for sound"
  ASoC/SOF/core: Ensure sof_ops_free() is still called when probe never
    ran.
  ALSA: hda/intel: Fix error handling in azx_probe()
  ALSA: hda/i915: Allow override of gpu binding.
  ALSA: hda/i915: Add an allow_modprobe argument to snd_hdac_i915_init
  ALSA: hda/i915: Allow xe as match for i915_component_master_match
  ASoC: Intel: avs: Move snd_hdac_i915_init to before probe_work.
  ALSA: hda/intel: Move snd_hdac_i915_init to before probe_work.
  ASoC: Intel: Skylake: Move snd_hdac_i915_init to before probe_work.
  ASoC: SOF: Intel: Move binding to display driver outside of deferred
    probe
  ALSA: hda/i915: Remove extra argument from snd_hdac_i915_init

Pierre-Louis Bossart (2):
  ASoC: SOF: core: Add probe_early and remove_late callbacks
  ASoC: SOF: Intel: hda: start splitting the probe

 sound/hda/hdac_i915.c                | 19 +++++++--
 sound/pci/hda/hda_intel.c            | 64 +++++++++++++---------------
 sound/soc/intel/avs/core.c           |  4 +-
 sound/soc/intel/skylake/skl.c        | 31 ++++----------
 sound/soc/sof/Kconfig                | 19 +++++++++
 sound/soc/sof/core.c                 | 53 ++++++++++++++++++++++-
 sound/soc/sof/intel/hda-common-ops.c |  2 +
 sound/soc/sof/intel/hda.c            | 60 +++++++++++++-------------
 sound/soc/sof/intel/hda.h            |  2 +
 sound/soc/sof/ops.h                  | 16 +++++++
 sound/soc/sof/sof-pci-dev.c          |  3 +-
 sound/soc/sof/sof-priv.h             |  7 +++
 12 files changed, 186 insertions(+), 94 deletions(-)

-- 
2.40.1

