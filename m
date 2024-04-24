Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28254C04FFE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 03:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FD010FB00;
	Wed, 24 Apr 2024 03:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GAV0+S0+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F2810FB00
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 03:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713930238; x=1745466238;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4oLj0Ga5umGvPvsTofkjsTorVhdPbvpgig3vbB2hUKk=;
 b=GAV0+S0+qUI0HQgHg6JWfeRXMQbz4YRrO3OL1qxRKtrR7VqAKPmtfqgk
 7Qn4Nw7haarSenhEWpZHcXR8TYaD/V5OdnulDS5R7bzrF9xSnoMhpOAww
 ZzG2e4gTw+mWRxqZJeqcmJjfDRgx+Onnx3fLj8N7lqxIx/l2bIIUkyNJz
 saM7UD83L3IS6SzuI+98bB3QHZ8lJkAhYM/BySudZt3Pe+/riaKoUOc7K
 gd35xBYDQ2aupsbc+g8nHG0PCwFNU9XZVg9k9k3dsUGqODntUv4JEmJLV
 yBjt+mhyTW8pqdmKmpJp050mRwPjsIRZtzZKHuk+7ymueI561cw/IIfNY A==;
X-CSE-ConnectionGUID: CwnbGYQMQVWl1tp3O1E7eg==
X-CSE-MsgGUID: kkKlLfIgQLi1/MYr6lvilg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9371045"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9371045"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 20:43:57 -0700
X-CSE-ConnectionGUID: qrb7ZF7WQeGT4Sfd4pLh+A==
X-CSE-MsgGUID: tJtjHTBETHK4adAQLfDFbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="25089178"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa007.jf.intel.com with ESMTP; 23 Apr 2024 20:43:56 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 0/2] Use the helpers for locking/unlocking resv object
Date: Wed, 24 Apr 2024 09:27:54 +0530
Message-Id: <20240424035756.2169209-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

Use the helpers for locking/unlocking resv object

Himal Prasad Ghimiray (2):
  drm/xe/vm: Use xe_vm_lock()/xe_vm_unlock() helpers
  drm/xe: Use xe_bo_lock()/xe_bo_unlock() helpers

 drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
 drivers/gpu/drm/xe/xe_vm.c  | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1

