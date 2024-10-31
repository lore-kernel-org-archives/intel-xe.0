Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5FBD767F4
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 18:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C1710E430;
	Thu, 31 Oct 2024 18:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlkEx/Cq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A28910E430
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 18:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730399381; x=1761935381;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nDX+rdOWU7usHG7qAV8VTq/cH546b4hK7BVOvi75Iu0=;
 b=RlkEx/Cq7hjvRdcxFXN4IBpHBxWAN8aPI5kcD+CEuGM5cl6vjL/wDVXb
 hCWGRJRK36XvJR4yVHScnS8tMPY1JHX1t+wqM8z/Z8wL8NQh8+1gdm5ed
 T/Br0zDPIqepesb4jN0hoeWiqkULhwnM0upaBzRMgZjVq7nKzRwJlVcZJ
 KZC7cKpnQFXhG5wDqwwLwKgcIzhf2BOI6T5U87csvst9WmrvO5Q1V9YPh
 iv2805HvDi7Sb+ElrQkOYQ5QRnhgOeSR+6iROLlOkvoYmrUZIB3+SsuH5
 1hNkAEefZM47LzruSlOyYswNiLsIwDDD3bfMOK+8jvQ/+/jTDs8inSwN6 Q==;
X-CSE-ConnectionGUID: PGlFquuCQNSXGPiiHkBZkw==
X-CSE-MsgGUID: qG25lb3mSxeHgu9iPddRfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30323554"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30323554"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:29:41 -0700
X-CSE-ConnectionGUID: 8G2bHRZTSeO3sOnJcpJjjw==
X-CSE-MsgGUID: iRDqN+XlS2yZjLKSuj2ebg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="82626229"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:29:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 0/2] drm/xe: devcoredump documentation
Date: Thu, 31 Oct 2024 11:29:14 -0700
Message-ID: <20241031182916.1441987-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

Improve our kernel-doc and wire it up to the documentation.

Lucas De Marchi (2):
  drm/xe: Improve devcoredump documentation
  drm/xe: Wire up devcoredump in documentation

 Documentation/gpu/xe/index.rst          |  1 +
 Documentation/gpu/xe/xe_devcoredump.rst | 14 +++++++++
 drivers/gpu/drm/xe/xe_devcoredump.c     | 40 ++++++++++++-------------
 3 files changed, 34 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_devcoredump.rst

-- 
2.47.0

