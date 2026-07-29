Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18877C53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 23:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E0E10E0AB;
	Wed, 29 Jul 2026 23:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mIgFT/VV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC0B10E0AB
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 23:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785366414; x=1816902414;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dbTCBI9FNxl2K0iw4/ojmnabD/hDkoKPlpDUtcokEpM=;
 b=mIgFT/VV/0Y5eFew0z/GRln/cORDGZ49yQMTGHcSqru9Ja7VyPv8SfvF
 ydwyKXO3aOQ7uW8pJLnz1FgsjDb53pCsBzj4ei2pw5uVj5SeNfaAr8hHT
 E8AktjGyCW7zYZHjdfb1vU/T2iu03UH80DKeMbVn0Z2hG152VVs/RcyA0
 3StWj6xm2i8alTZ4JvltaHqjn4CZInBYXmsj1IVUX0DxOwQpt9LQtKrvp
 xms6kn+eEC+AXQkYIsLRTtBU+BSdUHMgol6MzBzE5WC7k3OkePOHGLU0N
 mlbxUqGQchyXKHU+A9vXRgIAZ4s9jAioj8eQIFqcfTZkOtvj3sXfryWmj A==;
X-CSE-ConnectionGUID: pZZr4IUMRdu9zwNBkyQBKA==
X-CSE-MsgGUID: WU3dJv6ESDyfa/q/RkpEkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96568377"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="96568377"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 16:06:53 -0700
X-CSE-ConnectionGUID: Q4YvVIIfS2O94T9oeRSpOw==
X-CSE-MsgGUID: MAEE0ktxR4WVHPMJg2eLpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="255824510"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 16:06:54 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/2] drm/xe: Changes for Xe3p_HPM media
Date: Wed, 29 Jul 2026 16:06:43 -0700
Message-ID: <20260729230645.3052178-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

Reference: fdce3e20dae8 ("drm/xe/xe3p: Add support for media IP versions 35.00 & 35.03")
Bspec: 67103, 77977

v2: Fix bug in Patch 1
v3: Change Patch 1 for BMG (Matt Roper)
v4: Add TODO in Patch 1 (Matt Roper)

Ashutosh Dixit (2):
  drm/xe/mcr: Take vcs1/vecs1 into account for first media slice
  drm/xe/oa: Extend OAM unit hwe assignment for new dGfx

 drivers/gpu/drm/xe/xe_gt_mcr.c | 9 +++++++--
 drivers/gpu/drm/xe/xe_oa.c     | 7 ++++---
 2 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.54.0

