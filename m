Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C7BC00A8F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 10:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0862410E341;
	Tue, 24 Oct 2023 10:55:00 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685E610E342
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Oct 2023 10:54:48 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 24 Oct 2023 12:54:26 +0200
Message-Id: <20231024105433.715843-8-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231024105433.715843-1-maarten.lankhorst@linux.intel.com>
References: <20231024105433.715843-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 08/15] ALSA: hda: i915: Allow override of gpu
 binding.
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

Selecting CONFIG_DRM selects CONFIG_VIDEO_NOMODESET, which exports
video_firmware_drivers_only(). This can be used as a first
approximation on whether i915 will be available. It's safe to use as
this is only built when CONFIG_SND_HDA_I915 is selected by CONFIG_I915.

It's not completely fool proof, as you can boot with "nomodeset
i915.modeset=1" to make i915 load regardless, or use
"i915.force_probe=!*" to never load i915, but the common case of
booting with nomodeset to disable all GPU drivers this will work as
intended.

Because of this, we add an extra module parameter,
snd_hda_core.gpu_bind that can be used to signal users intent.
-1 follows nomodeset, 0 disables binding, 1 forces wait/-EPROBE_DEFER
on binding.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20231009115437.99976-7-maarten.lankhorst@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
(cherry picked from commit 2e8c90386db48e425997ca644fa40876b2058b30)
---
 sound/hda/hdac_i915.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index ac10c4feb49c9..961d99422bc5a 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -10,6 +10,12 @@
 #include <sound/hdaudio.h>
 #include <sound/hda_i915.h>
 #include <sound/hda_register.h>
+#include <video/nomodeset.h>
+
+static int gpu_bind = -1;
+module_param(gpu_bind, int, 0644);
+MODULE_PARM_DESC(gpu_bind, "Whether to bind sound component to GPU "
+			   "(1=always, 0=never, -1=on nomodeset(default))");
 
 /**
  * snd_hdac_i915_set_bclk - Reprogram BCLK for HSW/BDW
@@ -122,6 +128,9 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
 {
 	struct pci_dev *display_dev = NULL;
 
+	if (!gpu_bind || (gpu_bind < 0 && video_firmware_drivers_only()))
+		return false;
+
 	for_each_pci_dev(display_dev) {
 		if (display_dev->vendor == PCI_VENDOR_ID_INTEL &&
 		    (display_dev->class >> 16) == PCI_BASE_CLASS_DISPLAY &&
-- 
2.39.2

