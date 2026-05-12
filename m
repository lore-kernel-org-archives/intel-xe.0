Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C12CD4F24
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 13:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A43510EAC9;
	Tue, 12 May 2026 13:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I47F7b6j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A2B10EAC9
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 13:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778594034; x=1810130034;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tk34KNzJqwU3yk8gJWuw2ETUjFUcdH8NkHb+kTXsx20=;
 b=I47F7b6jxNkhpuBVpkNl9MszjA2EsOdJL3zMb/9mJ/NJF+cLbYgXLfj7
 BK6RapjaqpE4/HBDlmBvcKZLdR+hpWHwS177ODWCQDKZe0atFz2Q9NYUf
 qAtmg/FxV30/jdMmhiejDpuVr65VM8pkk/XYNNKBo1DkLYzRG4FmIO1CB
 1ozurMA8cLEXKLUerSdrenWXyF5ZmtQKI26wCfCahzXwd8NkUySua62QP
 lWQVSX1ywHQvibPyt7+w23r2K7DqLaN5YlAO1LngwFevJLBpIR0IDtvNA
 MCOhEdCrFEvC4ltWHMfTSjiE8zagiYVHyLviNrOLgsK14wyWhjFPZb/XS w==;
X-CSE-ConnectionGUID: LMvhYeFLRNCVrO14XNMWZA==
X-CSE-MsgGUID: aFgyJG4cQUe+7PTu2A3zIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="96927797"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="96927797"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 06:53:54 -0700
X-CSE-ConnectionGUID: AnxvweoSRiCsWbg0EHrjIA==
X-CSE-MsgGUID: TIGrWUKBS2ayXClFWs65GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="242134743"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fedora) ([10.245.245.172])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 06:53:52 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 0/2] drm/xe: Adjust the bo shrinker batch size
Date: Tue, 12 May 2026 15:53:30 +0200
Message-ID: <20260512135332.11702-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

Shamelessly stolen from i915, To avoid gpu stalls for small
shrinker request, Set the shrinker batch size to the average
size of system buffer objects. Use the number of
populated struct ttm_tts to compute the average size.

Thomas Hellström (2):
  drm/xe: Track number of populated ttm_tts in the shrinker
  drm/xe: Update shrinker batch size based on average BO size

 drivers/gpu/drm/xe/xe_bo.c       | 12 ++++++------
 drivers/gpu/drm/xe/xe_shrinker.c | 32 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_shrinker.h |  3 ++-
 3 files changed, 36 insertions(+), 11 deletions(-)

-- 
2.54.0

