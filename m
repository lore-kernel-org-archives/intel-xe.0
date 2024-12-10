Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF08E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 16:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9250810E923;
	Tue, 10 Dec 2024 16:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fKcDzCcC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0AE10E923
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 16:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733848800; x=1765384800;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=59RTjz9II8mYwKK1U6RTFjSYXz3qUvbXaSvhG30bjJo=;
 b=fKcDzCcCRzRqr0jDrAyG+Iw9uRoDGpqZYaJcc+rf7/wsYi2rEadbWL48
 RAGij+MVF63KjbsprYePXSNrAgR4fZ6kovkxpwNuAB949AomJnerZIDUt
 4yawFBx5cVzYgmW2EEDNo9UkWtIlakHL+rylboEQcZAn4fz2Exmgx3R2z
 59Puiz3QARp4U6U8quzdGFe+tnwLpWW1KGEEkq+MSxyPq9I54lxh8ZFTv
 nsssJWvJ4F8CELaxTOqxN/9qry1c0oaBViPVNZrFtNie+9ca8Sfk0ayB9
 EBiZAYvueod67hUZPvMImbYyFI+bIRzr91As3ExHznXCbkzC/KVGTkFV1 w==;
X-CSE-ConnectionGUID: eFTsU9j8T+amZBdvHIteWw==
X-CSE-MsgGUID: /6mfriU2To6M8r3kyW5e6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44674071"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="44674071"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 08:40:00 -0800
X-CSE-ConnectionGUID: vewMOPu+QsSgJCSWtQtzuQ==
X-CSE-MsgGUID: o+4i0UEHSfi9En2CiKIZNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="96276216"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:39:59 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH 0/1] Expose dsc sink max slice count via debugfs
Date: Tue, 10 Dec 2024 22:12:51 +0530
Message-Id: <20241210164252.2118155-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Expose dsc sink max slice count via i915_dsc_fec_support debugfs.
This debugfs entry is required in cases, where sink doesn't support
minimum of 8 slices in case of ultrajoiner and minimum of 4 slices
in case of big joiner.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3387
Test-with: 20241210135322.2117541-1-swati2.sharma@intel.com

Swati Sharma (1):
  drm/i915/dsc: Expose dsc sink max slice count via debugfs

 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.25.1

