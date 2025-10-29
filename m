Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDB5CCF9E9
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 11:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C28410E1CD;
	Wed, 29 Oct 2025 11:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlLOLcXq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D9810E134
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 11:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761737088; x=1793273088;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hCD0qvxUZ0ADecRbl/oljVjI2jd+24gEQDy4+o14oWw=;
 b=mlLOLcXq6Ivr22jOEKCZKn3H7BjIstEHof7ev1+JCFDOQnQF5bk0sMEI
 hgTAaH5vYw8PHvS8lTe84iOvktGdCtwgud+Q2EftB73Q4Ao+1410Vn3/6
 Jwnxf5b9QKJS7C+WD7Ba/vNXv1eGfSe4zAjkeDxz0tmf9f/cfNVpUPKLv
 DpaNwBihRUW7Cvn29vcIFDlBJW2TTgrGdnx7oG78gNNHuUgSZXmbksyC2
 x43vya8bJxOZ1Uu861TvigrHAvXdhu0nG4YVfmre0PKxzlQIrS8aRyPBK
 XhlfESaq5XZUklQ5UwS0vVXn4u1pYbPJR1AEP3fXO+sjQCTo4m0LpNruP g==;
X-CSE-ConnectionGUID: 85XIzKdJSaCDwUUA+Lgs3w==
X-CSE-MsgGUID: ZOGne2VzTCGy2roBUuzMfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63784482"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63784482"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 04:24:47 -0700
X-CSE-ConnectionGUID: Qlu/WL2rTo2LLRuCnxvG7Q==
X-CSE-MsgGUID: d5y4qpe2TBu3QEo31m6pHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185710448"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 04:24:44 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 rodrigo.vivi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v5 0/2] drm/xe/guc: Remove cached frequency values for GuC SLPC
Date: Wed, 29 Oct 2025 16:50:15 +0530
Message-ID: <20251029112014.3747915-4-sk.anirban@intel.com>
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

Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Sk Anirban (2):
  drm/xe/guc: Eliminate RPe caching for SLPC parameter handling
  drm/xe/guc: Eliminate RPa frequency caching

 drivers/gpu/drm/xe/xe_guc_pc.c       | 114 ++++++++++++++-------------
 drivers/gpu/drm/xe/xe_guc_pc_types.h |   4 -
 2 files changed, 60 insertions(+), 58 deletions(-)

-- 
2.43.0

