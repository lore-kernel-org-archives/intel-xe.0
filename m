Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35815C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 08:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C3910E2CF;
	Thu, 30 Jan 2025 08:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U9SDbgyy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DACB10E2CF
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 08:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738227537; x=1769763537;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ahZP/4heFzBJwWuD5ED4dxgboVwHNBpfD+0tXiqGbDo=;
 b=U9SDbgyyryQbiAB7O90HWZ4sCKIn55dV46yiQyydyqPBaeuFcZBV+Q0y
 gb0zq7RNylrRBsGcRiZ6BaONslld00oPJJ3N7ms64N5BfJkg+/22bhHF3
 xx9cPOlIi743tvsaBRqs8JLLdJtb6u5SErzW3xiKbnKcbzn/vHWDV8PsM
 t6PAEbzWKRjdrrdMhgjO38+kdfrd3TT5Y84G8XPMaYwR5lVT+KmpdF3YR
 6IgJLNQpd5364smyf34MhBN7k6A4lZ4JG2xLSGcOqK+isT9CApWdRlMMM
 sNJqPE3OnH7/B0jV5u2nDpAFcL9JHbFi8URbdDdvbyZ7q4CsFZOvKwEpm Q==;
X-CSE-ConnectionGUID: 2U35mqyjR5uIJREGzisxHg==
X-CSE-MsgGUID: uemIdV0MQM+WLXaaa2klZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="39030175"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="39030175"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 00:58:57 -0800
X-CSE-ConnectionGUID: 9XZRX+pqR4yv53UWBfyLUw==
X-CSE-MsgGUID: Of8wye/KQquUEUIdHlIk0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109177678"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 00:58:55 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH v3 0/2] Refactor some graphics descriptor flags
Date: Thu, 30 Jan 2025 14:28:02 +0530
Message-Id: <20250130085804.4136497-1-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
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

Refactor dma_mask_size and max_remote_tiles and place them in
the platform descriptor as they are more related to the platform
than the graphics IP.

v2:
 - Rebase
v3:
 - Alter comment position (MattR)

Sai Teja Pottumuttu (2):
  drm/xe: Refactor dma_mask_size
  drm/xe: Refactor max_remote_tiles

 drivers/gpu/drm/xe/xe_pci.c       | 43 ++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_pci_types.h |  3 ---
 2 files changed, 25 insertions(+), 21 deletions(-)

-- 
2.34.1

