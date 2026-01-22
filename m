Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137F7C44536
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 04:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD60810E08A;
	Thu, 22 Jan 2026 04:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLbufNEo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F7410E08A;
 Thu, 22 Jan 2026 04:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769057350; x=1800593350;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qeB/QCyT4u013hVqhmYrhYD/NkEStXkzaAN860qBYI0=;
 b=CLbufNEoSIRe4kxCcziQA7mLoCSBNLpmDMWWyZNS3EIqM/S2fFu4Lv6Z
 ycbgLwTUsRBYDxhu77UIiE1dsUJAxbBoNEfzc3U3bK3b33uP4I9FUbNSZ
 BWDBsVYpY7MQtDJY7wMUDvYcWCa2ypAx6ppV2h6zqUvaFjvlP1Ae4zImp
 Re6ielOI8sku6D89DwfHamqNfMxQJGc750uwmeeddVUO5arkSTlF8MNmf
 sXsz/M76cKYsBsj4BeGnmqarKiNeUwF6inVhequhRUJiWk0derAgMaQhI
 ZR4CbwYur6gYpow3aTIUJztQo4Q70g7c0+/ak+SD8W0cPWwg7fa1QNOkm A==;
X-CSE-ConnectionGUID: KBDG1S0QQoSSDZzM+FXPZA==
X-CSE-MsgGUID: Q9AwTmYbSaat/iEAFHgLAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70200384"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="70200384"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 20:49:09 -0800
X-CSE-ConnectionGUID: SzAL/zzvQJyiraHAkNW5YA==
X-CSE-MsgGUID: 2seWnDwjRA6T2ZkWaDegtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="211077435"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 21 Jan 2026 20:49:07 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH 1/2] drm/i915/cx0: Clear response ready & error bit
Date: Thu, 22 Jan 2026 10:18:58 +0530
Message-Id: <20260122044859.753682-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Clear the response ready and error bit of PORT_P2M_MESSAGE_BUS_STATUS
before writing the transaction pending bit of
PORT_M2P_MSGBUS_CTL as that is a hard requirement. If not done
we find that the PHY hangs since it ends up in a weird state if left
idle for more than 1 hour.

Bspec: 65101
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index 4f56a370102d..ff74f64eb970 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -223,6 +223,8 @@ static int __intel_cx0_read_once(struct intel_encoder *encoder,
 		return -ETIMEDOUT;
 	}
 
+	intel_clear_response_ready_flag(encoder, lane);
+
 	intel_de_write(display, XELPDP_PORT_M2P_MSGBUS_CTL(display, port, lane),
 		       XELPDP_PORT_M2P_TRANSACTION_PENDING |
 		       XELPDP_PORT_M2P_COMMAND_READ |
@@ -294,6 +296,8 @@ static int __intel_cx0_write_once(struct intel_encoder *encoder,
 		return -ETIMEDOUT;
 	}
 
+	intel_clear_response_ready_flag(encoder, lane);
+
 	intel_de_write(display, XELPDP_PORT_M2P_MSGBUS_CTL(display, port, lane),
 		       XELPDP_PORT_M2P_TRANSACTION_PENDING |
 		       (committed ? XELPDP_PORT_M2P_COMMAND_WRITE_COMMITTED :
-- 
2.34.1

