Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C18CD98F2
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 11:31:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46F010F28A;
	Thu, 18 Jun 2026 11:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D0LAbbO/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A379D10F28A
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 11:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781782296; x=1813318296;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WW3Y8mgQ1jyeDNwFx47FuYQQo3Lmk/c+3knc/W31hXg=;
 b=D0LAbbO/VwpEpHSgu1A7oNvPukT0bPmmP7UfXrRU5t4/AOJ3Eb12BRps
 m6H179Rzh2eAvTpap8xauITWY97iw6Dk9jPNdWZuX9bGCUQPZhBySoQ5z
 fe3wNwOhxfE0MAUdmbvjYy6LFDxOfftMRNvEOEu4N4JnhVFHwN6BR3cM+
 vIQ/sPdFgRvYBUv6/vPZ387sCIuH1sSlSDYBMPZbcal27wIw3+KpLIpz/
 5DSRzIdHSyBlYQnktRyNc/3Vl07x4uByjtRzWZ0J+iTWWL6lA6MuoaGiD
 8xro78YKOX+589cVUVRK98PKPpvZgHSuD/ZWSjnG4xskOB67kmdu3/cf6 g==;
X-CSE-ConnectionGUID: Bk/PZUozQh6+HQD1DtmnLw==
X-CSE-MsgGUID: /Xt6q6JvSkOWSqISA6j48g==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86457057"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="86457057"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 04:31:35 -0700
X-CSE-ConnectionGUID: +3ZNKU0GR6+/j+kiarmGIg==
X-CSE-MsgGUID: urHMPAY/SvqXu60q9kmaZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="252661892"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 04:31:32 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 0/2] drm/xe/guc: distinguish wedged from recoverable
 cancellation
Date: Thu, 18 Jun 2026 16:55:29 +0530
Message-ID: <20260618112528.2354371-4-sk.anirban@intel.com>
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

The CT layer returns -ECANCELED regardless of whether cancellation
is due to a GT reset or a wedged device. Return -ENOTRECOVERABLE
on wedge so callers don't need xe_device_wedged() checks
to suppress spurious error logs.
Also document the return codes of xe_guc_ct_send() in kernel-doc form.

Sk Anirban (2):
  drm/xe/guc: distinguish wedged from recoverable cancellation
  drm/xe/guc: fix activity stats error message format

 drivers/gpu/drm/xe/xe_guc_ct.c              | 38 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_engine_activity.c |  2 +-
 2 files changed, 38 insertions(+), 2 deletions(-)

-- 
2.43.0

