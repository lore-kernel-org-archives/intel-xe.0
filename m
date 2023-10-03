Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AE7E7544F
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 12:02:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A899610E1DB;
	Tue,  3 Oct 2023 12:02:38 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5319D10E1DB
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 12:02:37 +0000 (UTC)
From: maarten.lankhorst@linux.intel.com
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 14:00:23 +0200
Message-Id: <20231003120033.3505-5-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003120033.3505-1-maarten.lankhorst@linux.intel.com>
References: <20231003120033.3505-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 04/14] ASoC: SOF: core: Add probe_early and
 remove_late callbacks
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The existing DSP probe may be handled in a workqueue to allow for
extra time, typically for the i915 request_module and HDAudio codec
handling.

With the upcoming changes for i915/Xe driver relying on the
-EPROBE_DEFER mechanism, we need to have a first pass of the probe
which cannot be pushed to a workqueue. Introduce 2 new optional
callbacks.

probe_early is called before the workqueue runs. remove_late may be
called from the workqueue if load is unsuccesful, but will otherwise
be called on module unload.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/core.c     | 11 +++++++++++
 sound/soc/sof/ops.h      | 16 ++++++++++++++++
 sound/soc/sof/sof-priv.h |  2 ++
 3 files changed, 29 insertions(+)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 0938b259f703..d7b090224f1b 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -327,6 +327,7 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 dsp_err:
 	snd_sof_remove(sdev);
 probe_err:
+	snd_sof_remove_late(sdev);
 	sof_ops_free(sdev);
 
 	/* all resources freed, update state to match */
@@ -436,6 +437,14 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 
 	sof_set_fw_state(sdev, SOF_FW_BOOT_NOT_STARTED);
 
+	/*
+	 * first pass of probe which isn't allowed to run in a work-queue,
+	 * typically to rely on -EPROBE_DEFER dependencies
+	 */
+	ret = snd_sof_probe_early(sdev);
+	if (ret < 0)
+		return ret;
+
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)) {
 		INIT_WORK(&sdev->probe_work, sof_probe_work);
 		schedule_work(&sdev->probe_work);
@@ -487,9 +496,11 @@ int snd_sof_device_remove(struct device *dev)
 		snd_sof_ipc_free(sdev);
 		snd_sof_free_debug(sdev);
 		snd_sof_remove(sdev);
+		snd_sof_remove_late(sdev);
 		sof_ops_free(sdev);
 	} else if (aborted) {
 		/* probe_work never ran */
+		snd_sof_remove_late(sdev);
 		sof_ops_free(sdev);
 	}
 
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 9ab7b9be765b..3ebcfc237385 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -38,6 +38,14 @@ static inline void sof_ops_free(struct snd_sof_dev *sdev)
 /* Mandatory operations are verified during probing */
 
 /* init */
+static inline int snd_sof_probe_early(struct snd_sof_dev *sdev)
+{
+	if (sof_ops(sdev)->probe_early)
+		return sof_ops(sdev)->probe_early(sdev);
+
+	return 0;
+}
+
 static inline int snd_sof_probe(struct snd_sof_dev *sdev)
 {
 	return sof_ops(sdev)->probe(sdev);
@@ -51,6 +59,14 @@ static inline int snd_sof_remove(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static inline int snd_sof_remove_late(struct snd_sof_dev *sdev)
+{
+	if (sof_ops(sdev)->remove_late)
+		return sof_ops(sdev)->remove_late(sdev);
+
+	return 0;
+}
+
 static inline int snd_sof_shutdown(struct snd_sof_dev *sdev)
 {
 	if (sof_ops(sdev)->shutdown)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index d4f6702e93dc..e73a92189fe1 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -165,8 +165,10 @@ struct sof_firmware {
 struct snd_sof_dsp_ops {
 
 	/* probe/remove/shutdown */
+	int (*probe_early)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*probe)(struct snd_sof_dev *sof_dev); /* mandatory */
 	int (*remove)(struct snd_sof_dev *sof_dev); /* optional */
+	int (*remove_late)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*shutdown)(struct snd_sof_dev *sof_dev); /* optional */
 
 	/* DSP core boot / reset */
-- 
2.40.1

