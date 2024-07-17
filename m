Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5E6C3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 05:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511BA10E941;
	Wed, 17 Jul 2024 05:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dEtBq7fV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2B410E93F
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 05:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721194981; x=1752730981;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v6s+GXCrlnPt9DWjaZCjiJ5cEQnXw3yeptmf7FA3+Uo=;
 b=dEtBq7fVElVoLrGb+C46/KD6zKaGLMMszU8q8hOxdUBP+aHb7qv6W0ID
 OiqY6f9rwoY4v4DKZCxOLV9BpJDIflUPW4s72TOnO3qtMVazLOHmlAcOE
 qaJJKhtmpVuajWgumI0DFK3sb8fAq6Mk1Wxr8TOLdSwpWHSapVx6yS730
 11tF8paT3s88y0lkXJ+C4wVhHofJpBWcjnykJ+u9zwVQ3L0VwjU5+t5gt
 us90kYi+0XT5bVzt9nfuEj/0pYqAsvXy7q+Fbdce0gTklwsb7aA7scWrT
 Cs2+UhgQxc6Ohn0q1A5K58yMCkHlQnlhdJjrbkpdK+1Epy1d7pLgWgHnC g==;
X-CSE-ConnectionGUID: vZ8zg0N6Qo2jqLkUoJ5qJw==
X-CSE-MsgGUID: vZPctz7jQHCZtQ2L9l00sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="22534444"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="22534444"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:43:00 -0700
X-CSE-ConnectionGUID: +vcejycxQ/eN0mYf09rQOQ==
X-CSE-MsgGUID: mQvv1px7T2Wf05qDWYmpDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="54589615"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:42:57 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, karthik.poosa@intel.com
Subject: [PATCH v4 0/2] drm/xe: remove GuC reload in D3Hot path
Date: Wed, 17 Jul 2024 11:25:56 +0530
Message-Id: <20240717055558.4169407-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

Power is not lost when only D3hot is allowed so remove GuC reload in
runtime suspend D3Hot path.

Rev2: Rebase
Rev3: fix review comments
Rev4: fix commit message and kernel-doc
      split patches

Riana Tauro (2):
  drm/xe: modify GuC CTB enable communication
  drm/xe: remove GuC reload in D3Hot path

 drivers/gpu/drm/xe/xe_gt.c     | 33 ++++++++++++++--
 drivers/gpu/drm/xe/xe_gt.h     |  4 +-
 drivers/gpu/drm/xe/xe_guc.c    | 69 +++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc.h    |  4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c |  3 +-
 drivers/gpu/drm/xe/xe_guc_ct.h |  2 +
 drivers/gpu/drm/xe/xe_pm.c     |  8 ++--
 drivers/gpu/drm/xe/xe_uc.c     | 32 +++++++++++++++-
 drivers/gpu/drm/xe/xe_uc.h     |  2 +
 9 files changed, 136 insertions(+), 21 deletions(-)

-- 
2.40.0

