Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96D1C3DA7F
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 15:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1ECD10E21B;
	Mon,  5 Aug 2024 15:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bM00KmvA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DE210E21B
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 15:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722870166; x=1754406166;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V8c4Pn9urDbG1h5XhBmU6AxlgLSzOLweTIm5p0KEU6I=;
 b=bM00KmvATOrktsrXjQ45XVdPlIfGjN1wzbpNgp3q7S/Hjc1xg7u8kYoR
 M7eem4K7rd/HAjvMANFVHUy7wR/OCzB2vBYvimMWSf1G5po18pRrHL2Xw
 0OZWIz/rXmgtInYLu+8O9WNa9Bc7kaoOy5Kc1cYuZKO67YGVDDbKjvX3C
 RnLwJIXu+xX7ikxiW7vlvSNQFGNPlDDApa50wLDTW67XYuVZ7AVRpLgCM
 QmDyKozMQwGOVHX6SCAY2Okqvx8S3+XqFIgQXemWxLRxGUwjv5er6t7BH
 NsqBWqg7gvuZS0rjTvCnL3CSzpBF+rY1i3PilKDorGuSCFEp7T8OYzImf Q==;
X-CSE-ConnectionGUID: NSWvSiFHQ4yeV4mdtljxmw==
X-CSE-MsgGUID: VxBgUc49RMq7Zq//VLxNaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20653137"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="20653137"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 08:02:43 -0700
X-CSE-ConnectionGUID: NQxmq16gQtyO9xhEYSTaag==
X-CSE-MsgGUID: GqaLfqp0R+C1/bMbjuImyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="60811035"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.245.245.243])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 08:02:40 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.saarinen@intel.com
Subject: [RFT] usb: typec: ucsi: Fix a potential deadlock in
 ucsi_send_command_common()
Date: Mon,  5 Aug 2024 18:02:30 +0300
Message-Id: <20240805150230.258618-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
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

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

The function returns with the ppm_lock held if there's an
error or the PPM reports BUSY condition.

Reported-by: Luciano Coelho <luciano.coelho@intel.com>
Fixes: 5e9c1662a89b ("usb: typec: ucsi: rework command execution functions")
Cc: stable@vger.kernel.org
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---

Hi,

I'm sending this here just for testing, I hope it's not a problem.
This is the only way we found out how to trigger a CI run for Xe.
This patch should fix a regression in typec-ucsi so we should get more
Xe CI results with it.

Cheers,
Luca.


drivers/usb/typec/ucsi/ucsi.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index dcd3765cc1f5..432a2d6266d7 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -238,13 +238,10 @@ static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
 	mutex_lock(&ucsi->ppm_lock);
 
 	ret = ucsi_run_command(ucsi, cmd, &cci, data, size, conn_ack);
-	if (cci & UCSI_CCI_BUSY) {
-		ret = ucsi_run_command(ucsi, UCSI_CANCEL, &cci, NULL, 0, false);
-		return ret ? ret : -EBUSY;
-	}
-
-	if (cci & UCSI_CCI_ERROR)
-		return ucsi_read_error(ucsi, connector_num);
+	if (cci & UCSI_CCI_BUSY)
+		ret = ucsi_run_command(ucsi, UCSI_CANCEL, &cci, NULL, 0, false) ?: -EBUSY;
+	else if (cci & UCSI_CCI_ERROR)
+		ret = ucsi_read_error(ucsi, connector_num);
 
 	mutex_unlock(&ucsi->ppm_lock);
 	return ret;
-- 
2.39.2

