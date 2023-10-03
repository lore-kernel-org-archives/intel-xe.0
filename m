Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0B8E7544F
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 12:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7E810E0CB;
	Tue,  3 Oct 2023 12:02:28 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D8110E26F
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 12:02:25 +0000 (UTC)
From: maarten.lankhorst@linux.intel.com
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 14:00:21 +0200
Message-Id: <20231003120033.3505-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003120033.3505-1-maarten.lankhorst@linux.intel.com>
References: <20231003120033.3505-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 02/14] Revert "sound/hda: Allow XE as i915
 replacement for sound"
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

This reverts commit 3cfcbd459fdcb8387b29869f96540654acc833ab.
---
 sound/hda/hdac_i915.c      | 17 +++++++++---
 sound/pci/hda/hda_intel.c  | 53 +++++++++++++++++---------------------
 sound/soc/intel/avs/core.c | 13 +++-------
 sound/soc/sof/intel/hda.c  |  7 ++---
 4 files changed, 43 insertions(+), 47 deletions(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 227b33028b56..ac10c4feb49c 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -109,8 +109,7 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
 	hdac_pci = to_pci_dev(bus->dev);
 	i915_pci = to_pci_dev(dev);
 
-	if ((!strcmp(dev->driver->name, "i915") ||
-	     !strcmp(dev->driver->name, "xe")) &&
+	if (!strcmp(dev->driver->name, "i915") &&
 	    subcomponent == I915_COMPONENT_AUDIO &&
 	    connectivity_check(i915_pci, hdac_pci))
 		return 1;
@@ -184,10 +183,20 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 	if (err < 0)
 		return err;
 	acomp = bus->audio_component;
-	if (!acomp || !acomp->ops) {
+	if (!acomp)
+		return -ENODEV;
+	if (!acomp->ops) {
+		if (!IS_ENABLED(CONFIG_MODULES) ||
+		    !request_module("i915")) {
+			/* 60s timeout */
+			wait_for_completion_killable_timeout(&acomp->master_bind_complete,
+							     msecs_to_jiffies(60 * 1000));
+		}
+	}
+	if (!acomp->ops) {
 		dev_info(bus->dev, "couldn't bind with audio component\n");
 		snd_hdac_acomp_exit(bus);
-		return -EPROBE_DEFER;
+		return -ENODEV;
 	}
 	return 0;
 }
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 4622e308baf6..7382e5833b3b 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -213,7 +213,6 @@ MODULE_DESCRIPTION("Intel HDA driver");
 #endif
 #endif
 
-static DECLARE_BITMAP(probed_devs, SNDRV_CARDS);
 
 /*
  */
@@ -1840,34 +1839,6 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 	/* continue probing in work context as may trigger request module */
 	INIT_DELAYED_WORK(&hda->probe_work, azx_probe_work);
 
-
-
-
-	/* bind with i915 if needed */
-	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
-		err = snd_hdac_i915_init(azx_bus(chip));
-		if (err < 0) {
-			/* if the controller is bound only with HDMI/DP
-			 * (for HSW and BDW), we need to abort the probe;
-			 * for other chips, still continue probing as other
-			 * codecs can be on the same link.
-			 */
-			if (HDA_CONTROLLER_IN_GPU(pci)) {
-				clear_bit(chip->dev_index, probed_devs);
-				pci_set_drvdata(pci, NULL);
-				snd_device_free(card, chip);
-				return err;
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
 	*rchip = chip;
 
 	return 0;
@@ -2111,6 +2082,8 @@ static const struct hda_controller_ops pci_hda_ops = {
 	.position_check = azx_position_check,
 };
 
+static DECLARE_BITMAP(probed_devs, SNDRV_CARDS);
+
 static int azx_probe(struct pci_dev *pci,
 		     const struct pci_device_id *pci_id)
 {
@@ -2290,6 +2263,28 @@ static int azx_probe_continue(struct azx *chip)
 	to_hda_bus(bus)->bus_probing = 1;
 	hda->probe_continued = 1;
 
+	/* bind with i915 if needed */
+	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
+		err = snd_hdac_i915_init(bus);
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
+
 	/* Request display power well for the HDA controller or codec. For
 	 * Haswell/Broadwell, both the display HDA controller and codec need
 	 * this power. For other platforms, like Baytrail/Braswell, only the
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 7982be89a9b7..859b217fc761 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -191,6 +191,10 @@ static void avs_hda_probe_work(struct work_struct *work)
 
 	pm_runtime_set_active(bus->dev); /* clear runtime_error flag */
 
+	ret = snd_hdac_i915_init(bus);
+	if (ret < 0)
+		dev_info(bus->dev, "i915 init unsuccessful: %d\n", ret);
+
 	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, true);
 	avs_hdac_bus_init_chip(bus, true);
 	avs_hdac_bus_probe_codecs(bus);
@@ -461,19 +465,10 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	pci_set_drvdata(pci, bus);
 	device_disable_async_suspend(dev);
 
-	ret = snd_hdac_i915_init(bus);
-	if (ret == -EPROBE_DEFER)
-		goto err_unmaster;
-	else if (ret < 0)
-		dev_info(bus->dev, "i915 init unsuccessful: %d\n", ret);
-
 	schedule_work(&adev->probe_work);
 
 	return 0;
 
-err_unmaster:
-	pci_clear_master(pci);
-	pci_set_drvdata(pci, NULL);
 err_acquire_irq:
 	snd_hdac_bus_free_stream_pages(bus);
 	snd_hdac_ext_stream_free_all(bus);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 5f65fb8e82e6..15e6779efaa3 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -848,11 +848,8 @@ static int hda_init(struct snd_sof_dev *sdev)
 
 	/* init i915 and HDMI codecs */
 	ret = hda_codec_i915_init(sdev);
-	if (ret < 0) {
-		if (ret != -EPROBE_DEFER)
-			dev_warn(sdev->dev, "init of i915 and HDMI codec failed: %i\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		dev_warn(sdev->dev, "init of i915 and HDMI codec failed\n");
 
 	/* get controller capabilities */
 	ret = hda_dsp_ctrl_get_caps(sdev);
-- 
2.40.1

