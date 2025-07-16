Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF15C83F1B
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 10:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E34A10E791;
	Wed, 16 Jul 2025 10:56:41 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0165410E6DB
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 10:56:39 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/5] accel/ivpu: Remove lockdep_assert_irqs_disabled()
Date: Wed, 16 Jul 2025 12:56:36 +0200
Message-ID: <20250716105634.177676-8-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250716105634.177676-7-dev@lankhorst.se>
References: <20250716105634.177676-7-dev@lankhorst.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This breaks on PREEMPT_RT, and should be unneeded since
lockdep can track irq disabled status itself.

Link: https://lore.kernel.org/r/20250715165919.33754-1-dev@lankhorst.se
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/accel/ivpu/ivpu_ipc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index 39f83225c1815..5f00809d448af 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -141,7 +141,6 @@ ivpu_ipc_rx_msg_add(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 	struct ivpu_ipc_rx_msg *rx_msg;
 
 	lockdep_assert_held(&ipc->cons_lock);
-	lockdep_assert_irqs_disabled();
 
 	rx_msg = kzalloc(sizeof(*rx_msg), GFP_ATOMIC);
 	if (!rx_msg) {
-- 
2.45.2

