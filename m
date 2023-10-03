Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12050E75454
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 12:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC07D10E0CB;
	Tue,  3 Oct 2023 12:02:46 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B62D10E2A9
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 12:02:45 +0000 (UTC)
From: maarten.lankhorst@linux.intel.com
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 14:00:27 +0200
Message-Id: <20231003120033.3505-9-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003120033.3505-1-maarten.lankhorst@linux.intel.com>
References: <20231003120033.3505-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 08/14] ALSA: hda/i915: Add an allow_modprobe
 argument to snd_hdac_i915_init
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

Xe is a new GPU driver that re-uses the display (and sound) code from
i915. It's no longer possible to load i915, as the GPU can be driven
by the xe driver instead.

The new behavior will return -EPROBE_DEFER, and wait for a compatible
driver to be loaded instead of modprobing i915.

Converting all drivers at the same time is a lot of work, instead we
will convert each user one by one.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/hda_i915.h        | 4 ++--
 sound/hda/hdac_i915.c           | 8 ++++----
 sound/pci/hda/hda_intel.c       | 2 +-
 sound/soc/intel/avs/core.c      | 2 +-
 sound/soc/intel/skylake/skl.c   | 2 +-
 sound/soc/sof/intel/hda-codec.c | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/sound/hda_i915.h b/include/sound/hda_i915.h
index 6b79614a893b..f91bd6636086 100644
--- a/include/sound/hda_i915.h
+++ b/include/sound/hda_i915.h
@@ -9,12 +9,12 @@
 
 #ifdef CONFIG_SND_HDA_I915
 void snd_hdac_i915_set_bclk(struct hdac_bus *bus);
-int snd_hdac_i915_init(struct hdac_bus *bus);
+int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe);
 #else
 static inline void snd_hdac_i915_set_bclk(struct hdac_bus *bus)
 {
 }
-static inline int snd_hdac_i915_init(struct hdac_bus *bus)
+static inline int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe)
 {
 	return -ENODEV;
 }
diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 961d99422bc5..9f77cec65a21 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -175,7 +175,7 @@ static bool dg1_gfx_present(void)
  *
  * Returns zero for success or a negative error code.
  */
-int snd_hdac_i915_init(struct hdac_bus *bus)
+int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe)
 {
 	struct drm_audio_component *acomp;
 	int err;
@@ -194,7 +194,7 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 	acomp = bus->audio_component;
 	if (!acomp)
 		return -ENODEV;
-	if (!acomp->ops) {
+	if (allow_modprobe && !acomp->ops) {
 		if (!IS_ENABLED(CONFIG_MODULES) ||
 		    !request_module("i915")) {
 			/* 60s timeout */
@@ -203,9 +203,9 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 		}
 	}
 	if (!acomp->ops) {
-		dev_info(bus->dev, "couldn't bind with audio component\n");
+		int err = allow_modprobe ? -ENODEV : -EPROBE_DEFER;
 		snd_hdac_acomp_exit(bus);
-		return -ENODEV;
+		return dev_err_probe(bus->dev, err, "couldn't bind with audio component\n");
 	}
 	return 0;
 }
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 12caabf54c63..e42ad0e816e1 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2266,7 +2266,7 @@ static int azx_probe_continue(struct azx *chip)
 
 	/* bind with i915 if needed */
 	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
-		err = snd_hdac_i915_init(bus);
+		err = snd_hdac_i915_init(bus, true);
 		if (err < 0) {
 			/* if the controller is bound only with HDMI/DP
 			 * (for HSW and BDW), we need to abort the probe;
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 859b217fc761..bbb40339c75f 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -191,7 +191,7 @@ static void avs_hda_probe_work(struct work_struct *work)
 
 	pm_runtime_set_active(bus->dev); /* clear runtime_error flag */
 
-	ret = snd_hdac_i915_init(bus);
+	ret = snd_hdac_i915_init(bus, true);
 	if (ret < 0)
 		dev_info(bus->dev, "i915 init unsuccessful: %d\n", ret);
 
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 77408a981b97..4f7acb4f6680 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -791,7 +791,7 @@ static int skl_i915_init(struct hdac_bus *bus)
 	 * The HDMI codec is in GPU so we need to ensure that it is powered
 	 * up and ready for probe
 	 */
-	err = snd_hdac_i915_init(bus);
+	err = snd_hdac_i915_init(bus, true);
 	if (err < 0)
 		return err;
 
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 8a5e99a898ec..f1fd5b44aaac 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -415,7 +415,7 @@ int hda_codec_i915_init(struct snd_sof_dev *sdev)
 		return 0;
 
 	/* i915 exposes a HDA codec for HDMI audio */
-	ret = snd_hdac_i915_init(bus);
+	ret = snd_hdac_i915_init(bus, true);
 	if (ret < 0)
 		return ret;
 
-- 
2.40.1

