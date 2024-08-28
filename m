Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7838C61DB8
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 15:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807CE10E0B6;
	Wed, 28 Aug 2024 15:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKV0J/Sc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1184210E0B6
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 15:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724860563; x=1756396563;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7KkkHbs4AndixdD+3/9jvNCawbPY3UfQD+Q/x1Q4gLk=;
 b=PKV0J/Scxjk48LFVkLZ2lm5Dr3FLVAdr1prTtGe6aU6zf0WaCsdjrnzS
 HlTZVXwnUYnb9P104s41kdqovtF9rzZIRcNXdJg9htCzsulplwTJYvysL
 l6U/Ofy26EIFT2ExG8k2BEk1vaHk9aeBBS6PdWkCeEGZk8/zVF2t6rM+O
 X1D1pN+S7Nlw5EcJRuXxFDR4ol46KzeOrTVIrIw/kco7oUYEv+OyZUnIU
 utimUo38T2RIl8f6LR1WuMduVzNUX+cGZWYOEtPO8sfdZksto9kp7RW0a
 yNfWykOOPCrcOx73zQRpnYOrkymVLsr2xQFq7JuQgeatls9aG847KZsvv Q==;
X-CSE-ConnectionGUID: CrutZr/KQOCivEaxdEM2mw==
X-CSE-MsgGUID: zR/2GKk0Qu+BaCp5ccziiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23285295"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="23285295"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 08:56:03 -0700
X-CSE-ConnectionGUID: IAbYxntKTLuTRJvSeD/qAg==
X-CSE-MsgGUID: nIh2PffARJCtipQUzkf0hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="62909860"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 08:56:02 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/oa: Insert wmb/sfence before enabling OA
Date: Wed, 28 Aug 2024 08:55:52 -0700
Message-ID: <20240828155552.1917844-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

In some simulation environments, we occasionally see warnings such as "OAG
Buffer register is not programmed (has value 0). Register offset db08".
This means OA has been enabled before it has been fully configured. Or, the
register write enabling OA has overtaken previous OA configuration register
writes.

Therefore, insert a wmb/sfence to preserve OA register write ordering
before enabling OA.

v2: s/wmb()/xe_device_wmb()/

Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
Reported-by: Guy Zadicario <guy.zadicario@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 4d4541e0b24c0..b02e92c27871e 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -440,6 +440,9 @@ static void xe_oa_enable(struct xe_oa_stream *stream)
 	val = __format_to_oactrl(format, regs->oa_ctrl_counter_select_mask) |
 		__oa_ccs_select(stream) | OAG_OACONTROL_OA_COUNTER_ENABLE;
 
+	/* Flush previous writes to HW before enabling OA */
+	xe_device_wmb(stream->oa->xe);
+
 	xe_mmio_write32(stream->gt, regs->oa_ctrl, val);
 }
 
-- 
2.41.0

