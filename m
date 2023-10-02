Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDD1E7490C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 19:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127B510E080;
	Mon,  2 Oct 2023 19:38:56 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EC010E080
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 19:38:54 +0000 (UTC)
From: maarten.lankhorst@linux.intel.com
To: intel-xe@lists.freedesktop.org
Date: Mon,  2 Oct 2023 21:38:34 +0200
Message-Id: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 01/14] Revert "sound/soc/sof: Remove deferred
 probe for SOF"
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

This reverts commit 53bccb72d202d8fa8575e81d1c78adc4e6a6ea1f.
---
 sound/hda/hdac_i915.c       |  2 +-
 sound/soc/sof/Kconfig       | 19 +++++++++++++++++++
 sound/soc/sof/core.c        | 38 +++++++++++++++++++++++++++++++++++--
 sound/soc/sof/intel/hda.c   | 25 +++++++++++-------------
 sound/soc/sof/sof-pci-dev.c |  3 ++-
 sound/soc/sof/sof-priv.h    |  5 +++++
 6 files changed, 74 insertions(+), 18 deletions(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 3ae973e7995c..227b33028b56 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -185,7 +185,7 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 		return err;
 	acomp = bus->audio_component;
 	if (!acomp || !acomp->ops) {
-		dev_dbg(bus->dev, "couldn't bind with audio component\n");
+		dev_info(bus->dev, "couldn't bind with audio component\n");
 		snd_hdac_acomp_exit(bus);
 		return -EPROBE_DEFER;
 	}
diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 8ee39e555806..80361139a49a 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -82,6 +82,17 @@ config SND_SOC_SOF_DEVELOPER_SUPPORT
 
 if SND_SOC_SOF_DEVELOPER_SUPPORT
 
+config SND_SOC_SOF_FORCE_PROBE_WORKQUEUE
+	bool "SOF force probe workqueue"
+	select SND_SOC_SOF_PROBE_WORK_QUEUE
+	help
+	  This option forces the use of a probe workqueue, which is only used
+	  when HDaudio is enabled due to module dependencies. Forcing this
+	  option is intended for debug only, but this should not add any
+	  functional issues in nominal cases.
+	  Say Y if you are involved in SOF development and need this option.
+	  If not, select N.
+
 config SND_SOC_SOF_NOCODEC
 	tristate
 
@@ -260,6 +271,14 @@ config SND_SOC_SOF
 	  module dependencies but since the module or built-in type is decided
 	  at the top level it doesn't matter.
 
+config SND_SOC_SOF_PROBE_WORK_QUEUE
+	bool
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level.
+	  When selected, the probe is handled in two steps, for example to
+	  avoid lockdeps if request_module is used in the probe.
+
 # Supported IPC versions
 config SND_SOC_SOF_IPC3
 	bool
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 78938dbffdad..2d1616b81485 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -191,8 +191,7 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	/* probe the DSP hardware */
 	ret = snd_sof_probe(sdev);
 	if (ret < 0) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(sdev->dev, "error: failed to probe DSP %d\n", ret);
+		dev_err(sdev->dev, "error: failed to probe DSP %d\n", ret);
 		goto probe_err;
 	}
 
@@ -310,6 +309,8 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	if (plat_data->sof_probe_complete)
 		plat_data->sof_probe_complete(sdev->dev);
 
+	sdev->probe_completed = true;
+
 	return 0;
 
 sof_machine_err:
@@ -335,6 +336,19 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	return ret;
 }
 
+static void sof_probe_work(struct work_struct *work)
+{
+	struct snd_sof_dev *sdev =
+		container_of(work, struct snd_sof_dev, probe_work);
+	int ret;
+
+	ret = sof_probe_continue(sdev);
+	if (ret < 0) {
+		/* errors cannot be propagated, log */
+		dev_err(sdev->dev, "error: %s failed err: %d\n", __func__, ret);
+	}
+}
+
 int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 {
 	struct snd_sof_dev *sdev;
@@ -422,16 +436,33 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 
 	sof_set_fw_state(sdev, SOF_FW_BOOT_NOT_STARTED);
 
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)) {
+		INIT_WORK(&sdev->probe_work, sof_probe_work);
+		schedule_work(&sdev->probe_work);
+		return 0;
+	}
+
 	return sof_probe_continue(sdev);
 }
 EXPORT_SYMBOL(snd_sof_device_probe);
 
+bool snd_sof_device_probe_completed(struct device *dev)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+
+	return sdev->probe_completed;
+}
+EXPORT_SYMBOL(snd_sof_device_probe_completed);
+
 int snd_sof_device_remove(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	int ret;
 
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
+		cancel_work_sync(&sdev->probe_work);
+
 	/*
 	 * Unregister any registered client device first before IPC and debugfs
 	 * to allow client drivers to be removed cleanly
@@ -469,6 +500,9 @@ int snd_sof_device_shutdown(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
+		cancel_work_sync(&sdev->probe_work);
+
 	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE) {
 		sof_fw_trace_free(sdev);
 		return snd_sof_shutdown(sdev);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 1249dd694c4c..5f65fb8e82e6 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1165,6 +1165,14 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	sdev->pdata->hw_pdata = hdev;
 	hdev->desc = chip;
 
+	hdev->dmic_dev = platform_device_register_data(sdev->dev, "dmic-codec",
+						       PLATFORM_DEVID_NONE,
+						       NULL, 0);
+	if (IS_ERR(hdev->dmic_dev)) {
+		dev_err(sdev->dev, "error: failed to create DMIC device\n");
+		return PTR_ERR(hdev->dmic_dev);
+	}
+
 	/*
 	 * use position update IPC if either it is forced
 	 * or we don't have other choice
@@ -1184,15 +1192,6 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		goto hdac_bus_unmap;
 
-	hdev->dmic_dev = platform_device_register_data(sdev->dev, "dmic-codec",
-						       PLATFORM_DEVID_NONE,
-						       NULL, 0);
-	if (IS_ERR(hdev->dmic_dev)) {
-		dev_err(sdev->dev, "error: failed to create DMIC device\n");
-		ret = PTR_ERR(hdev->dmic_dev);
-		goto hdac_exit;
-	}
-
 	if (sdev->dspless_mode_selected)
 		goto skip_dsp_setup;
 
@@ -1201,7 +1200,7 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	if (!sdev->bar[HDA_DSP_BAR]) {
 		dev_err(sdev->dev, "error: ioremap error\n");
 		ret = -ENXIO;
-		goto platform_unreg;
+		goto hdac_bus_unmap;
 	}
 
 	sdev->mmio_bar = HDA_DSP_BAR;
@@ -1299,12 +1298,10 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 /* dsp_unmap: not currently used */
 	if (!sdev->dspless_mode_selected)
 		iounmap(sdev->bar[HDA_DSP_BAR]);
-platform_unreg:
-	platform_device_unregister(hdev->dmic_dev);
-hdac_exit:
-	hda_codec_i915_exit(sdev);
 hdac_bus_unmap:
+	platform_device_unregister(hdev->dmic_dev);
 	iounmap(bus->remap_addr);
+	hda_codec_i915_exit(sdev);
 err:
 	return ret;
 }
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 0fa424613082..f5ece43d0ec2 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -339,7 +339,8 @@ void sof_pci_remove(struct pci_dev *pci)
 	snd_sof_device_remove(&pci->dev);
 
 	/* follow recommendation in pci-driver.c to increment usage counter */
-	if (!(sof_pci_debug & SOF_PCI_DISABLE_PM_RUNTIME))
+	if (snd_sof_device_probe_completed(&pci->dev) &&
+	    !(sof_pci_debug & SOF_PCI_DISABLE_PM_RUNTIME))
 		pm_runtime_get_noresume(&pci->dev);
 
 	/* release pci regions and disable device */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 71db636cfdcc..d4f6702e93dc 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -564,6 +564,10 @@ struct snd_sof_dev {
 	enum sof_fw_state fw_state;
 	bool first_boot;
 
+	/* work queue in case the probe is implemented in two steps */
+	struct work_struct probe_work;
+	bool probe_completed;
+
 	/* DSP HW differentiation */
 	struct snd_sof_pdata *pdata;
 
@@ -671,6 +675,7 @@ struct snd_sof_dev {
 int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data);
 int snd_sof_device_remove(struct device *dev);
 int snd_sof_device_shutdown(struct device *dev);
+bool snd_sof_device_probe_completed(struct device *dev);
 
 int snd_sof_runtime_suspend(struct device *dev);
 int snd_sof_runtime_resume(struct device *dev);
-- 
2.40.1

