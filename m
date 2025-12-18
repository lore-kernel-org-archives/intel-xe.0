Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E66D6ACDE
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 10:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF73A10E3F3;
	Thu, 18 Dec 2025 10:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNcaIxj+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7EC10E3F3
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 10:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766053354; x=1797589354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I/j6IvvDG8d+fJpfKNj/1ofnnset5v2z+Rmx40eTAYg=;
 b=SNcaIxj+whQ3rgY2Y7giD8P4rUKDQRJDQSXWCx0oM/8IeZM/Xgvks647
 aEi/rUDcfGBU6APfd6OfQVw37MFL+DkYHTcB671fuG8qkff96/yX/d4jU
 qRELvhvppDN94eWhZ65+PPPL1BZEHyu2owKn0J2QzDfnG7HG//E1E9sSm
 4kgJAXvuAZHtTa2Tjygci98cOZ2XSpH384OtiPsd+Hhj3speeR3Lrd8wn
 M4nZhLeJzZEGtHlwAjgp7NLgMS6ir5eFzMwWzIl3iP8vN/KlVMuwlBNkt
 vzq7xp2t3gzBkIOk7tEeScMoVQoilI/Vckp3kWG1QcP1EmtQw9xhLfk8k g==;
X-CSE-ConnectionGUID: 6wJEuprUQKWfdSzlyJQdGw==
X-CSE-MsgGUID: oIp/arsyTv6ccQNFNWQ4IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78641279"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="78641279"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:22:33 -0800
X-CSE-ConnectionGUID: +qQYplbFQM6fIpLuqYL7wA==
X-CSE-MsgGUID: T1mvstfMRzm5+ITjBX0/aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198617755"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:22:31 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com
Subject: [PATCH v2 0/2] Survivability Mode Fixes
Date: Thu, 18 Dec 2025 16:21:52 +0530
Message-ID: <20251218105151.586575-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Fix unused index and static analysis tool reported errors.

Riana Tauro (2):
  drm/xe/xe_survivability: Remove unused index
  drm/xe/xe_survivability: Fix static analysis tool reported issues

 drivers/gpu/drm/xe/xe_survivability_mode.c | 38 +++++++++-------------
 1 file changed, 16 insertions(+), 22 deletions(-)

-- 
2.47.1

