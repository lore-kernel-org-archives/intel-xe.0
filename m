Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D931E75452
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 12:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EB110E284;
	Tue,  3 Oct 2023 12:03:00 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2205210E284
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 12:02:59 +0000 (UTC)
From: maarten.lankhorst@linux.intel.com
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 14:00:30 +0200
Message-Id: <20231003120033.3505-12-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003120033.3505-1-maarten.lankhorst@linux.intel.com>
References: <20231003120033.3505-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 11/14] ALSA: hda/intel: Move snd_hdac_i915_init
 to before probe_work.
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Now that we can use -EPROBE_DEFER, it's no longer required to spin off
the snd_hdac_i915_init into a workqueue.

Use the -EPROBE_DEFER mechanism instead, which must be returned in the
probe function.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 sound/pci/hda/hda_intel.c | 54 +++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index e42ad0e816e1..9dad3607596a 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2135,6 +2135,33 @@ static int azx_probe(struct pci_dev *pci,
 
 	pci_set_drvdata(pci, card);
 
+#ifdef CONFIG_SND_HDA_I915
+	/* bind with i915 if needed */
+	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
+		err = snd_hdac_i915_init(azx_bus(chip), false);
+		if (err < 0) {
+			/* if the controller is bound only with HDMI/DP
+			 * (for HSW and BDW), we need to abort the probe;
+			 * for other chips, still continue probing as other
+			 * codecs can be on the same link.
+			 */
+			if (HDA_CONTROLLER_IN_GPU(pci)) {
+				goto out_free;
+			} else {
+				/* don't bother any longer */
+				chip->driver_caps &= ~AZX_DCAPS_I915_COMPONENT;
+			}
+		}
+
+		/* HSW/BDW controllers need this power */
+		if (HDA_CONTROLLER_IN_GPU(pci))
+			hda->need_i915_power = true;
+	}
+#else
+	if (HDA_CONTROLLER_IN_GPU(pci))
+		dev_err(card->dev, "Haswell/Broadwell HDMI/DP must build in CONFIG_SND_HDA_I915\n");
+#endif
+
 	err = register_vga_switcheroo(chip);
 	if (err < 0) {
 		dev_err(card->dev, "Error registering vga_switcheroo client\n");
@@ -2162,11 +2189,6 @@ static int azx_probe(struct pci_dev *pci,
 	}
 #endif /* CONFIG_SND_HDA_PATCH_LOADER */
 
-#ifndef CONFIG_SND_HDA_I915
-	if (HDA_CONTROLLER_IN_GPU(pci))
-		dev_err(card->dev, "Haswell/Broadwell HDMI/DP must build in CONFIG_SND_HDA_I915\n");
-#endif
-
 	if (schedule_probe)
 		schedule_delayed_work(&hda->probe_work, 0);
 
@@ -2264,28 +2286,6 @@ static int azx_probe_continue(struct azx *chip)
 	to_hda_bus(bus)->bus_probing = 1;
 	hda->probe_continued = 1;
 
-	/* bind with i915 if needed */
-	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
-		err = snd_hdac_i915_init(bus, true);
-		if (err < 0) {
-			/* if the controller is bound only with HDMI/DP
-			 * (for HSW and BDW), we need to abort the probe;
-			 * for other chips, still continue probing as other
-			 * codecs can be on the same link.
-			 */
-			if (HDA_CONTROLLER_IN_GPU(pci)) {
-				goto out_free;
-			} else {
-				/* don't bother any longer */
-				chip->driver_caps &= ~AZX_DCAPS_I915_COMPONENT;
-			}
-		}
-
-		/* HSW/BDW controllers need this power */
-		if (HDA_CONTROLLER_IN_GPU(pci))
-			hda->need_i915_power = true;
-	}
-
 	/* Request display power well for the HDA controller or codec. For
 	 * Haswell/Broadwell, both the display HDA controller and codec need
 	 * this power. For other platforms, like Baytrail/Braswell, only the
-- 
2.40.1

