Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E726CD343F
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 18:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD5210E1C8;
	Wed, 12 Nov 2025 18:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UtmtTeU0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78FC10E1C8
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 18:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762973838; x=1794509838;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BOSKVXq9vsR+bOWN/4aNX/+7COyGS5cIGMS8GdFyYk0=;
 b=UtmtTeU0oNzuhYY/R1hSzT1o6MLBniDM3A/M2yEDvB7iMLBDjkA45HiG
 9ZdK51C8W6qku8sYW0Cn2CCKNO4UG10FGS6oi0rey1aKRchLjFtXrDwe0
 mjWpMfiDAPg3RQgpsmoDY3P3QGhdQmlVQH5WPOq4I/b7l65+y5Qh5XJ/L
 9J0BUMFncun0E3EiWWSkn0r8YM4j6x3vzQcmMrnWg8blirRlRNqJSfoYH
 ruoshtfmz2yWlpejZ5xBHL9Oz7xACPASPIYa4NeGwHFZpRDHPMHpdF7NH
 CtI3VlDqDLIQQcNjS23xj/G+Rdo6LRcbZmG2KX97IpULjWzsvM8WuMkwN Q==;
X-CSE-ConnectionGUID: JGSYZd03Rp+148zTkOxwCw==
X-CSE-MsgGUID: zov26wEDRcayfpooKZRKJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65084756"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="65084756"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:57:17 -0800
X-CSE-ConnectionGUID: sWkJmRV9Q72ywd1LycWFow==
X-CSE-MsgGUID: 5ylQ+nWRRWSWYuAJB/5xcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="194487625"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:57:14 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 rodrigo.vivi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v6 0/2] drm/xe/guc: Remove cached frequency values for GuC SLPC
Date: Thu, 13 Nov 2025 00:21:54 +0530
Message-ID: <20251112185153.3593145-4-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series eliminates cached frequency values that were causing stale
data in GuC SLPC parameter handling. Both RPe and RPa frequencies are
now read live from hardware registers on each request.

Sk Anirban (2):
  drm/xe/guc: Eliminate RPe caching for SLPC parameter handling
  drm/xe/guc: Eliminate RPa frequency caching

 drivers/gpu/drm/xe/xe_guc_pc.c       | 100 +++++++++++++--------------
 drivers/gpu/drm/xe/xe_guc_pc_types.h |   4 --
 2 files changed, 50 insertions(+), 54 deletions(-)

-- 
2.43.0

