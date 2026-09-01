Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46029C624D7
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 21:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C2C10EF33;
	Tue,  1 Sep 2026 21:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UOlStckq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B067110EF2C
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 21:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788297132; x=1819833132;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rNom7rY25YVuhnuDRjSqTKD7s5kQh5SfjqqRRFixFhM=;
 b=UOlStckqqGlPG2ccoRBuLqV4FCtuI43l9lMvkaFNi1N6VJKdR5FyJsht
 gUAV70v+IftsFCqBQWpr3dAJY5RWDkcsl/a68MC5BI7ALKED9MfvvAk4c
 aoQi5FPlQqqKpgqKeY18umFmOS3XeSEf81BtefGdaWDKe72ELq7PJGvC1
 y9LjCwiXMEYdBga9Ti7T0mvWYkQ/6CNbAMo6JFmMMhKfPByhXevQK3gtJ
 gIqlx5pXD2N9Nb1PK4Z5SkYZ8p9skyPrwZR+EGliD+U/oX2HjwZ8ArvRp
 MFio8tSNMfyJpsA80Wtx1IzrqZhiDq7u9sMoCjdsmXvL1k/klCISCCAwj A==;
X-CSE-ConnectionGUID: hQ97yNgQSy6matuJcIZD8A==
X-CSE-MsgGUID: l1gucgWaQJahe56fPyfwzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="92562326"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="92562326"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 14:12:12 -0700
X-CSE-ConnectionGUID: jPJBM2hVTaCzrVmi1wfsyw==
X-CSE-MsgGUID: dbAF+ZNIQPCIy+EazkQVAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="272988123"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 14:12:12 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v2 0/5] Use SIG_ID logs for GuC component
Date: Tue,  1 Sep 2026 14:12:05 -0700
Message-ID: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
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

Add SIG ID logging support for some parts of the GuC interface code.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Daniele Ceraolo Spurio (4):
  drm/xe/guc: Use different error codes for GuC load errors
  drm/xe/uc: Report DMA failure using SIGID
  drm/xe/guc: Report major GuC failures using SIGID
  drm/xe/guc: Report errors that cause a CT shutdown using SIGID

Umesh Nerlige Ramappa (1):
  drm/xe/guc: Use different error codes for CT errors

 drivers/gpu/drm/xe/xe_guc.c    |  41 +++++-----
 drivers/gpu/drm/xe/xe_guc_ct.c | 135 ++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_uc_fw.c  |  13 +++-
 3 files changed, 122 insertions(+), 67 deletions(-)

-- 
2.55.0

