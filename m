Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F39EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 17:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AAA10E2F8;
	Tue, 27 Jun 2023 17:20:24 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1221C10E2F8
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 17:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687886423; x=1719422423;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C0CpTez4lNggGq1pgNUVYthyULdT+zRq/+SfzhRUZD8=;
 b=ZesRJlOtH9AiYspTfjmPKCT2XewnDlx3ePriETenKaR/FTV2Wz6YeFA5
 hx5uGA+Th93CqOEbixbwa0kafktn6QbqspYX8C9L+idXXpbTiiWiEb0eb
 q3RoGVVepJJUOLoaU5smZUkm4CdYmxepRFf5Nl+CP5Xu+JAV9FAK4pq0W
 fjtX83eL95lsjOzKkfE/oUmvLWMoCqrZZjgGQ9xlurMofvIJkcnkxvlzM
 6imNyDnoIv72K4kfXJ9xH5ylKlwTJ3FPFEkdKYzBR2s4M7tkV6p8+MMUY
 gfa7+Z79iQPMGWue7Vdn/ef2+8pZyIlU2XhBZd2L8PNW9+oPESqdQidPc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="427637933"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="427637933"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 10:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="829747533"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="829747533"
Received: from lzygo-mobl.ger.corp.intel.com (HELO localhost) ([10.213.0.164])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 10:20:17 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 27 Jun 2023 19:16:25 +0200
Message-Id: <20230627171626.356893-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 0/1] User fence wait uAPI change to nanoseconds
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

Fix negative timeout issue which lead to premature timer expiration
on signal delivery.

Cc: Filip Hazubski <filip.hazubski@intel.com>
Cc: Jose Souza <jose.souza@intel.com>
Cc: Effie Yu <effie.yu@intel.com>
Cc: Carl Zhang <carl.zhang@intel.com>

Zbigniew Kempczyński (1):
  drm/xe: Use nanoseconds instead of jiffies in uapi for user fence

 drivers/gpu/drm/xe/xe_wait_user_fence.c | 47 +++++++++++++++++++------
 include/uapi/drm/xe_drm.h               | 15 ++++++--
 2 files changed, 50 insertions(+), 12 deletions(-)

-- 
2.34.1

