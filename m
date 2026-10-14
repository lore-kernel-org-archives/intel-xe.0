Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46835CC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 12:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D412810E8D5;
	Thu, 15 Oct 2026 12:15:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8597F10EB3C;
 Wed, 14 Oct 2026 22:26:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8F66A6022E;
 Wed, 14 Oct 2026 22:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F6CAC2BCFC;
 Wed, 14 Oct 2026 22:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1792016813;
 bh=9suYk0gIMTBRHn33AiU8+AjPNi4bTVzOV+3QLs/axXA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=NmsuYL04tiJbgl8c2QjkzRrZ6r7JRDA15iNT3eOLHc6sU19Fa4qdlEZ7PJUhVhV8H
 9LhQv/bTtBuECR3Qn+KfyOrh8/4g8V6jcqRu1AVWbRwWqXape2hAqnEhBSiRjBt79z
 Tjl8XLbsLk7aw23HTe1+LJmccrhQ340KVuKOUqwhxElxW+XfTRqx+dIYPqDhEnmSZ4
 UPUhm61oApVrLIexCoNLjXqsHTtgdkNX90MUOn9q2Vvneh5JIzOTFURrjxOHKJ7ItC
 qUGRcWF4Bwbjbmz5qVtAfa2LrWsj9nsheMinrXX24+EvrkPQBlKU9KgGWPNR7UWx1H
 XN9pHTp5QYoEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 207DACC6B2A;
 Wed, 14 Oct 2026 22:26:53 +0000 (UTC)
From: =?utf-8?q?Burak_G=C3=B6nc=C3=BC_via_B4_Relay?=
 <devnull+burakgon12.gmail.com@kernel.org>
Date: Thu, 15 Oct 2026 01:26:40 +0300
Subject: [PATCH v2 1/2] drm/i915/tc: serialize the TCSS power request mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-ptl-port-b-tcss-v2-1-e00ce882402d@gmail.com>
References: <20261015-ptl-port-b-tcss-v2-0-e00ce882402d@gmail.com>
In-Reply-To: <20261015-ptl-port-b-tcss-v2-0-e00ce882402d@gmail.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Imre Deak <imre.deak@intel.com>, 
 Mika Kahola <mika.kahola@intel.com>, 
 =?utf-8?q?Burak_G=C3=B6nc=C3=BC?= <burakgon12@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792016806; l=3572;
 i=burakgon12@gmail.com; s=20261006; h=from:subject:message-id;
 bh=HDrQGwPbeM4EaZDDv9YBRrwkXDsf8pSwnEvQsuP639Q=;
 b=hZkiOKriVZuQFgr7cGZb+Id9ihqM1SdGS/228Hl3sc7uxEyT9ijWDg2MkscroU/ZTHSlgUFfh
 g8IQ2rQ+8qxBRKBsmnRrHGEhUODmp9j7Hv9/84t6mGvQcMZfiWXrwHG
X-Developer-Key: i=burakgon12@gmail.com; a=ed25519;
 pk=qcexQajnoYGkNqFOy3eFqTzvqTOR/P++ksapi6qUbvw=
X-Endpoint-Received: by B4 Relay for burakgon12@gmail.com/20261006 with
 auth_id=1126
X-Original-From: =?utf-8?q?Burak_G=C3=B6nc=C3=BC?= <burakgon12@gmail.com>
X-Mailman-Approved-At: Thu, 15 Oct 2026 12:15:40 +0000
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
Reply-To: burakgon12@gmail.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Burak Göncü <burakgon12@gmail.com>

xelpdp_tc_power_request_wa() (Wa_14020908590) drives the TCSS mailbox,
which is shared by all ports: it waits for the mailbox to be idle,
writes TCSS_DISP_MAILBOX_IN_DATA and TCSS_DISP_MAILBOX_IN_CMD, and waits
for the command to finish. Its callers hold only their own TC port's
lock, so two TC ports enabling or disabling TCSS power at the same time
can interleave these steps and run one port's command with the other
port's data.

Serialize the sequence with a display-wide mutex. The next patch adds a
caller outside of the TC port code.

Assisted-by: LLM
Signed-off-by: Burak Göncü <burakgon12@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display_core.h   |  5 +++++
 drivers/gpu/drm/i915/display/intel_display_driver.c |  1 +
 drivers/gpu/drm/i915/display/intel_tc.c             | 12 ++++++++----
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index c80b4a2f7..dc1df97d8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -623,6 +623,11 @@ struct intel_display {
 		u32 bxt_phy_grc;
 	} state;
 
+	struct {
+		/* serializes the TCSS mailbox of Wa_14020908590 */
+		struct mutex mailbox_lock;
+	} tc;
+
 	struct {
 		unsigned int hpll_freq;
 		unsigned int czclk_freq;
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 70d112fd4..e1b445305 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -187,6 +187,7 @@ void intel_display_driver_early_probe(struct intel_display *display)
 	mutex_init(&display->wm.wm_mutex);
 	mutex_init(&display->pps.mutex);
 	mutex_init(&display->hdcp.hdcp_mutex);
+	mutex_init(&display->tc.mailbox_lock);
 
 	intel_display_irq_init(display);
 	intel_dkl_phy_init(display);
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index f2d86b29c..9285e70ef 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -1068,12 +1068,15 @@ xelpdp_tc_phy_wait_for_tcss_power(struct intel_tc_port *tc, bool enabled)
  */
 static void xelpdp_tc_power_request_wa(struct intel_display *display, bool enable)
 {
+	/* the mailbox is shared by all ports, keep their commands apart */
+	mutex_lock(&display->tc.mailbox_lock);
+
 	/* check if mailbox is running busy */
 	if (intel_de_wait_for_clear_ms(display, TCSS_DISP_MAILBOX_IN_CMD,
 				       TCSS_DISP_MAILBOX_IN_CMD_RUN_BUSY, 10)) {
 		drm_dbg_kms(display->drm,
 			    "Timeout waiting for TCSS mailbox run/busy bit to clear\n");
-		return;
+		goto out_unlock;
 	}
 
 	intel_de_write(display, TCSS_DISP_MAILBOX_IN_DATA, enable ? 1 : 0);
@@ -1083,11 +1086,12 @@ static void xelpdp_tc_power_request_wa(struct intel_display *display, bool enabl
 
 	/* wait to clear mailbox running busy bit before continuing */
 	if (intel_de_wait_for_clear_ms(display, TCSS_DISP_MAILBOX_IN_CMD,
-				       TCSS_DISP_MAILBOX_IN_CMD_RUN_BUSY, 10)) {
+				       TCSS_DISP_MAILBOX_IN_CMD_RUN_BUSY, 10))
 		drm_dbg_kms(display->drm,
 			    "Timeout after writing data to mailbox. Mailbox run/busy bit did not clear\n");
-		return;
-	}
+
+out_unlock:
+	mutex_unlock(&display->tc.mailbox_lock);
 }
 
 static void __xelpdp_tc_phy_enable_tcss_power(struct intel_tc_port *tc, bool enable)

-- 
2.56.0


