Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8A3D31A0E
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 03:43:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7EB10E5C7;
	Wed, 14 Jan 2026 03:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCas8Wj+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DEE10E5C3;
 Wed, 14 Jan 2026 03:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768362189; x=1799898189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a/+6gFeZrRXEO/Fs31a8bDXekTx1JPY70Y9mpDpGJ3g=;
 b=YCas8Wj+IL46qDBmDisMTMk7em09E6639+I68XC5jjaNa1EuEMzz13Wb
 wli31/eEmz899Zmk2v6BcGEZlj76PnhiYCKYiSmosbEuNwhlRR7DaZ9zh
 k/cPA9qnicCGXf3zBONBhLZ/0euHOtzOCh78b7v+ji1KSNG7cXHwPNsM4
 fKhN6feEl2I3NKaNWi6caOsn3rwgpTYh9ldCMBUTxPtSD4bzOVPN2NGCV
 lO/+mKqcE8ugfqKagW+8FaToeqXjsYsdHM3ePhwp6slguuABnFQdugPcA
 92Gdv0sMkEyLsTAVQY8iGYBoRB1cPRSIegkE4AglGVp+PVIO6NIdpwalp Q==;
X-CSE-ConnectionGUID: 2wGWwn7ATCG/rESMLo2Teg==
X-CSE-MsgGUID: GfQZ48n3TNaOOXohZDO36A==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68664594"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="68664594"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 19:43:09 -0800
X-CSE-ConnectionGUID: zJtZckN3Q9ifHaU3A0ESTw==
X-CSE-MsgGUID: QqFvMgBkQxGDKS0PEPYyVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204833753"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa008.fm.intel.com with ESMTP; 13 Jan 2026 19:43:07 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 2/3] drm/i915/cx0: Clear response ready & error bit
Date: Wed, 14 Jan 2026 09:12:58 +0530
Message-Id: <20260114034259.466605-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114034259.466605-1-suraj.kandpal@intel.com>
References: <20260114034259.466605-1-suraj.kandpal@intel.com>
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
index 3418a3ed28fd..00c7fa9040ee 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -222,6 +222,8 @@ static int __intel_cx0_read_once(struct intel_encoder *encoder,
 		return -ETIMEDOUT;
 	}
 
+	intel_clear_response_ready_flag(encoder, lane);
+
 	intel_de_write(display, XELPDP_PORT_M2P_MSGBUS_CTL(display, port, lane),
 		       XELPDP_PORT_M2P_TRANSACTION_PENDING |
 		       XELPDP_PORT_M2P_COMMAND_READ |
@@ -293,6 +295,8 @@ static int __intel_cx0_write_once(struct intel_encoder *encoder,
 		return -ETIMEDOUT;
 	}
 
+	intel_clear_response_ready_flag(encoder, lane);
+
 	intel_de_write(display, XELPDP_PORT_M2P_MSGBUS_CTL(display, port, lane),
 		       XELPDP_PORT_M2P_TRANSACTION_PENDING |
 		       (committed ? XELPDP_PORT_M2P_COMMAND_WRITE_COMMITTED :
-- 
2.34.1

