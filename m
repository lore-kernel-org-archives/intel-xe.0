Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16E6E75426
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 12:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8403710E2AD;
	Tue,  3 Oct 2023 12:03:09 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D027810E2C0
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 12:03:06 +0000 (UTC)
From: maarten.lankhorst@linux.intel.com
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 14:00:33 +0200
Message-Id: <20231003120033.3505-15-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003120033.3505-1-maarten.lankhorst@linux.intel.com>
References: <20231003120033.3505-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 14/14] ALSA: hda/i915: Remove extra argument from
 snd_hdac_i915_init
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

Now that all drivers have moved from modprobe loading to
handling -EPROBE_DEFER, we can remove the argument again.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 include/sound/hda_i915.h        |  4 ++--
 sound/hda/hdac_i915.c           | 14 +++-----------
 sound/pci/hda/hda_intel.c       |  2 +-
 sound/soc/intel/avs/core.c      |  2 +-
 sound/soc/intel/skylake/skl.c   |  2 +-
 sound/soc/sof/intel/hda-codec.c |  2 +-
 6 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/include/sound/hda_i915.h b/include/sound/hda_i915.h
index f91bd6636086..6b79614a893b 100644
--- a/include/sound/hda_i915.h
+++ b/include/sound/hda_i915.h
@@ -9,12 +9,12 @@
 
 #ifdef CONFIG_SND_HDA_I915
 void snd_hdac_i915_set_bclk(struct hdac_bus *bus);
-int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe);
+int snd_hdac_i915_init(struct hdac_bus *bus);
 #else
 static inline void snd_hdac_i915_set_bclk(struct hdac_bus *bus)
 {
 }
-static inline int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe)
+static inline int snd_hdac_i915_init(struct hdac_bus *bus)
 {
 	return -ENODEV;
 }
diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index a984e7935ce7..862997beea1b 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -176,7 +176,7 @@ static bool dg1_gfx_present(void)
  *
  * Returns zero for success or a negative error code.
  */
-int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe)
+int snd_hdac_i915_init(struct hdac_bus *bus)
 {
 	struct drm_audio_component *acomp;
 	int err;
@@ -195,18 +195,10 @@ int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe)
 	acomp = bus->audio_component;
 	if (!acomp)
 		return -ENODEV;
-	if (allow_modprobe && !acomp->ops) {
-		if (!IS_ENABLED(CONFIG_MODULES) ||
-		    !request_module("i915")) {
-			/* 60s timeout */
-			wait_for_completion_killable_timeout(&acomp->master_bind_complete,
-							     msecs_to_jiffies(60 * 1000));
-		}
-	}
 	if (!acomp->ops) {
-		int err = allow_modprobe ? -ENODEV : -EPROBE_DEFER;
 		snd_hdac_acomp_exit(bus);
-		return dev_err_probe(bus->dev, err, "couldn't bind with audio component\n");
+		return dev_err_probe(bus->dev, -EPROBE_DEFER,
+				     "couldn't bind with audio component\n");
 	}
 	return 0;
 }
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 9dad3607596a..058f6e6491f9 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2138,7 +2138,7 @@ static int azx_probe(struct pci_dev *pci,
 #ifdef CONFIG_SND_HDA_I915
 	/* bind with i915 if needed */
 	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
-		err = snd_hdac_i915_init(azx_bus(chip), false);
+		err = snd_hdac_i915_init(azx_bus(chip));
 		if (err < 0) {
 			/* if the controller is bound only with HDMI/DP
 			 * (for HSW and BDW), we need to abort the probe;
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 8a2063958248..33044f353575 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -461,7 +461,7 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	pci_set_drvdata(pci, bus);
 	device_disable_async_suspend(dev);
 
-	ret = snd_hdac_i915_init(bus, false);
+	ret = snd_hdac_i915_init(bus);
 	if (ret == -EPROBE_DEFER)
 		goto err_i915_init;
 	else if (ret < 0)
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 24bdbe2a53be..f46f109d5856 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -1056,7 +1056,7 @@ static int skl_probe(struct pci_dev *pci,
 	}
 
 	if (IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)) {
-		err = snd_hdac_i915_init(bus, false);
+		err = snd_hdac_i915_init(bus);
 		if (err < 0)
 			goto out_dmic_unregister;
 	}
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index f1fd5b44aaac..8a5e99a898ec 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -415,7 +415,7 @@ int hda_codec_i915_init(struct snd_sof_dev *sdev)
 		return 0;
 
 	/* i915 exposes a HDA codec for HDMI audio */
-	ret = snd_hdac_i915_init(bus, true);
+	ret = snd_hdac_i915_init(bus);
 	if (ret < 0)
 		return ret;
 
-- 
2.40.1

