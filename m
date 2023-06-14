Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84109EB64D8
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 20:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3724610E462;
	Wed, 14 Jun 2023 20:52:13 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3357810E462
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 20:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686775932; x=1718311932;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ONp0yxaMAGr4xXDPUlgzcLqu6VTVQHJ/SuKui7O/hAg=;
 b=fSHpgTHU/4kMBvtZG0QTpaYwBEpTUUYwMkUvn4yuJ+jlIQcgIMTT3y9r
 fz88N2cwKphwN6mhGFH21nAHvZX6QB5LqIGaCsAmKERpIYmkh4zJosih6
 C+ZGlSdT12g8GNvELwWI7fDaOhsrOA50jiPVRhwMh7MoQ2+4tfo6qV3Pn
 QjzUrR2Z5KuXzB+c0YT0D9+Xbzafg0KI2GSjGZ7T7YqdExKBCXcIoZpRe
 3BkRxmqAefvCfZCq33uA6RbhHaNXlELnDltvOtzw8sz3f+MDC4XQ/IMWC
 8c5ifXcenzF6rFKQ+v8vqSJ1q5dzK1DwtQFcAWwwc2ZNK0NJdD+d8TQi9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343431996"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="343431996"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 13:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="712206064"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="712206064"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 13:52:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 14 Jun 2023 13:51:58 -0700
Message-Id: <20230614205202.3376752-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] GMD_ID fixes
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

A few minor fixes to GMD_ID handling at driver initialization.

Matt Roper (4):
  drm/xe: Return GMD_ID revid properly
  drm/xe: Don't raise error on fused-off media
  drm/xe: Print proper revid value for unknown media revision
  drm/xe: Enable PCI device earlier

 drivers/gpu/drm/xe/xe_pci.c  | 49 ++++++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_step.c |  2 +-
 2 files changed, 29 insertions(+), 22 deletions(-)

-- 
2.40.1

