Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B03FEFB6C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 16:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DE210E1AD;
	Fri, 27 Feb 2026 16:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDuGSVnQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0006A10E1AD;
 Fri, 27 Feb 2026 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772208046; x=1803744046;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pUu9oJ+sRISpRQKVPUIG38QfS86s5N7QoC4hMppDx5g=;
 b=ZDuGSVnQcovdTa1dFNe+vUIFly/k9HkCQylDJN8WnpcJ70+adYFOSavO
 XlHTqwao40bVdD34fjBL3lD43vkG2jSNWS6vKnIEaC2NhiA12HL7Gxx5b
 5ExHASqDpGJeB93pGtY8ieWlh1oDq/JvWiCdFcST+5FpoFDRX6DizAd7O
 chwVF5dvkaObU8J9ln45V5fCVeZqnmuTW7CnHxRd3Ql2aqCrM6TH3dlph
 WkLmYZuMutWBrniAKBmQowxIbmkNiUELvSDOPSTJCREBJ9+r+rKLyPt58
 GrIREbdRyGyixQQZEJw/9Sp7NzZ9Z8GkkcsZLkf2BcyWdOEM9o0KUHPox g==;
X-CSE-ConnectionGUID: l2CdkDAoRryM3K95DOHzKw==
X-CSE-MsgGUID: SiE8kHtyTAK2KaFlQ/ET3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="75895465"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="75895465"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:00:45 -0800
X-CSE-ConnectionGUID: MIC7Yg1NQoqG0pfFmd1bxw==
X-CSE-MsgGUID: 7LszxI9vRdiM1v4epPLVMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="213791065"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.106])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:00:44 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/ttm: Improve the TTM operation context
 gfp_retry_mayfail behaviour 
Date: Fri, 27 Feb 2026 17:00:10 +0100
Message-ID: <20260227160012.82309-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

Two small patches around the gfp_retry_mayfail behaviour:

Patch 1 ensures we don't spam the kernel log on allocation failures.

Patch 2 extends the gfp_retry_mayfail to swap readback.

Thomas Hellström (2):
  drm/ttm: Don't spam the log on buffer object backing store allocation
    failure
  drm/ttm: Avoid invoking the OOM killer when reading back swapped
    content

 drivers/gpu/drm/ttm/ttm_backup.c | 6 ++++--
 drivers/gpu/drm/ttm/ttm_pool.c   | 7 +++++--
 include/drm/ttm/ttm_backup.h     | 2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.53.0

