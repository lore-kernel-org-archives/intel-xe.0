Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39483C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:40:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A9210E26C;
	Thu,  3 Sep 2026 23:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="majdYknB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5483210E26C
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788478807; x=1820014807;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0ObTa/9AqcFBEJ+neBKrTi2byHf8bIzSG7PjKXvL/BI=;
 b=majdYknBwXOP/SEO2yesA1i3Fv6JPjPfejPfZOPAMEWxwL3s7xNto1Ek
 A6F+BXBiTFNdF89EUo4qimfBAuS6G3ZxMu7IxPdNFkVzQ4XTccQVUB8qu
 e053HaNdmWok/WzkDQZsrqQoPENgaLHw5733NfNRuqUHvNPxhZfIcnS7m
 ZJd+U6BtPyxvvQNhrl9etRYQFfe6QbHXwsKfe6nXmJFAqMJpNGEL3Kf3n
 AEBucUMtdMrXj9/EI74h4JLXzMEPjISypE8yeTFgJedvQcSI2bcXzS4M+
 AUzw4IXZbr+gUZsLZlundw1XzHJaZIcNs7un09E3pjXHA09zwK8q5pfsA A==;
X-CSE-ConnectionGUID: 9pu6McHWTkKHJYEN0UdVJA==
X-CSE-MsgGUID: OlecCZvkTfaY4Fu4ovDruw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="91489308"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="91489308"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:40:06 -0700
X-CSE-ConnectionGUID: hRzYsUo3Su69bHouFDkX3Q==
X-CSE-MsgGUID: h2XxspvBRZCLUsp78GBCwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="299735223"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:40:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v2 0/5] Use SIG_ID logs for GuC component
Date: Thu,  3 Sep 2026 16:39:59 -0700
Message-ID: <20260903233958.475162-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
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

Add SIG ID logging support for some parts of the GuC interface code.

v3: Add some review comments from v2. Some opens remain. will address in next
revision as discussion evolves.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Daniele Ceraolo Spurio (4):
  drm/xe/guc: Use different error codes for GuC load errors
  drm/xe/uc: Report DMA failure using SIGID
  drm/xe/guc: Report major GuC failures using SIGID
  drm/xe/guc: Report errors that cause a CT shutdown using SIGID

Umesh Nerlige Ramappa (1):
  drm/xe/guc: Use different error codes for CT errors

 drivers/gpu/drm/xe/xe_guc.c    |  41 +++++-----
 drivers/gpu/drm/xe/xe_guc_ct.c | 140 +++++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_uc_fw.c  |  13 ++-
 3 files changed, 123 insertions(+), 71 deletions(-)

-- 
2.55.0

