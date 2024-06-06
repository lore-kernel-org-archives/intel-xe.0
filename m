Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFC4C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 13:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E477E10E94A;
	Thu,  6 Jun 2024 13:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f1Vt376q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D12A10E94A
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 13:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717679221; x=1749215221;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E9u9nZtnrK95PwGSs4ebwhpZ5Uvp0B/bk0AUQXow7dM=;
 b=f1Vt376qxajDWblo05MKD0g8Tq2YBA4cSEcgi6GoplhHKtWPxL+QMcxZ
 +4Xf8g+BP0y2236sqIdYaKenuhjc8NOga2tIXhi0AUhgXsUv/4fe1pXQH
 nZ58mmRV18y7/BuZtdHmAjMCQhM4aV2K/eF+/JZGHXR4dkdpogSBdIJI0
 m4U+FoCx2SISxlxJonXGh2feJW88RY6AmJEaRWjQsZ2cJri2bGuq+Y4pV
 h5MWk/47uImtwQY85xxs6m2NcDVzVKcsCVqsjG9/OH+iA2GqPxsNNj3st
 7Bx1VyM6+N/5yMA9oXGKq7Nb8sXTY8fiRX/fFO6qQNS/4bVMmi5ulh7CR w==;
X-CSE-ConnectionGUID: BSTkTJ9MTjaPUQKUSAGHKg==
X-CSE-MsgGUID: qCz7rTc3QRuP8o7B70DAjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14464240"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14464240"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 06:07:01 -0700
X-CSE-ConnectionGUID: PIKkh/d0RLa+65lwKrQmRQ==
X-CSE-MsgGUID: nRFLxxgJRPKJvt/uCKxsuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38519326"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 06:07:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/2] Allow CTB G2H processing without G2H IRQ
Date: Thu,  6 Jun 2024 15:06:37 +0200
Message-Id: <20240606130639.1504-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

v1: https://patchwork.freedesktop.org/series/134523/#rev1
v2: use code from g2h worker instead of g2h irq handler (Matt)

Michal Wajdeczko (2):
  drm/xe/guc: Split g2h worker function
  drm/xe/guc: Allow CTB G2H processing without G2H IRQ

 drivers/gpu/drm/xe/xe_guc_ct.c       | 53 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  2 ++
 2 files changed, 53 insertions(+), 2 deletions(-)

-- 
2.43.0

