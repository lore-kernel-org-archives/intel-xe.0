Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB624F45A15
	for <intel-xe@archiver.kernel.org>; Sat, 11 Apr 2026 00:48:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862B710E0F0;
	Sat, 11 Apr 2026 00:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3ocuw30";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BAB10E0F0
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Apr 2026 00:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775868496; x=1807404496;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6M7IQeDbND2RKOKy/uVMtf+BlLKNaIMrguRTuLlD/8I=;
 b=X3ocuw30HUhc2Fc6LpRzSFZeP9H7ct9sZ0NZRt5e4fgPs5Phwsn0aWJl
 3/QTz63b8lFECHbAJX3mhYgZjth+C/YakJrdqkwZh3hUgy3q4zjTPXB97
 niDOxbbX19Z7Hzg6kwOb+eE2bq8FlS9CL/jkLClh4NNDulP9JaiO/QVhs
 bJWvWKmMGvNZ8h3d6lAZcYv99WrGC7Vixg16I/WMPmaCKxNrPXECSJFlW
 MfbaOHioVmk6KjCQcLBZDaJdfRegzNZkEldqX9q3wPXA3bdtIBBHY19vq
 AdEizr1gnlMj3r60DkuA4J2Pr94TPnJzyj2bKq2MnS7mw+QFNQFN0e46d w==;
X-CSE-ConnectionGUID: u0zzrwNORxiBPo6CZtBScA==
X-CSE-MsgGUID: IpBvw0rmRpazViEgVvHduw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87522099"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="87522099"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 17:48:15 -0700
X-CSE-ConnectionGUID: z0aAYipaTrKFsBpra7wWkg==
X-CSE-MsgGUID: IlQ6x9erSsSFwNBD+7keIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="226079384"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 17:48:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v3 0/3] drm/xe/oa: Wa_14026633728
Date: Fri, 10 Apr 2026 17:48:06 -0700
Message-ID: <20260411004809.570098-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

v3: Change to Patch 1 again (see changelog in Patch 1)
v2: Change to Patch 1

Ashutosh Dixit (3):
  drm/xe/oa: Use xe_map layer
  drm/xe/oa: Use drm_gem_mmap_obj for OA buffer mmap
  drm/xe/oa: Implement Wa_14026633728

 drivers/gpu/drm/xe/xe_map.h        |  14 ++++
 drivers/gpu/drm/xe/xe_oa.c         | 109 ++++++++++++++---------------
 drivers/gpu/drm/xe/xe_oa_types.h   |   3 -
 drivers/gpu/drm/xe/xe_wa_oob.rules |   1 +
 4 files changed, 68 insertions(+), 59 deletions(-)

-- 
2.48.1

