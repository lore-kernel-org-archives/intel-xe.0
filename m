Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AF4D68B17
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 13:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539A110E2AC;
	Thu, 14 Nov 2024 13:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nuyHM9/1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478FA10E2AC
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 13:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731591474; x=1763127474;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n1qxbuJQ7lRmPJw6pWZ08JfV3+kaXAeeHjLqpfdCjHg=;
 b=nuyHM9/1Z8HsFuGOQlDaY12qR4iiB6wzKHrzAZ3KhKNIPtfCSfitvCYi
 3BU+LxDlLjRBL4Lx3IgJymU55KViNfz4fDoDhH+aQ8TgKCABJkizJKmaM
 QHCFQNvT6xZgTUgchlh3o3c3V6XMRfyG7ne1l9e7YRTC73jnpJOrZDG4N
 mn+l8n/8fMx7bKfrYa3GlHvepzZdnEm/gtXgGGmozSIYhMeo783DrSBPR
 H8Q986evi/xcsbDT4bq9OSLEjzYXmoQ/axMOWH20fgLucyOONNJsnCRvt
 o1nHZvJ49xT5Iof1mvLpXUenF/+ZcLHDMCNJqrs+2OWe/1/u00Y2/4IG/ w==;
X-CSE-ConnectionGUID: eLzttmleRTChPpaHf0kN2g==
X-CSE-MsgGUID: cf4ZSOyAQrO1IsI7aKyl3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="56926731"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="56926731"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 05:37:53 -0800
X-CSE-ConnectionGUID: MG3M2X1PQfuzxy5G1zbbFQ==
X-CSE-MsgGUID: cnZmmjH1R2SWhEeH99j+Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93155491"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 05:37:51 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 0/2] Ensure GT reset is complete during ccs_mode change
Date: Thu, 14 Nov 2024 19:07:36 +0530
Message-Id: <20241114133738.2125717-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
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

Balasubramani Vivekanandan (2):
  drm/xe/gt: Add a synchronous GT reset function
  drm/xe: Ensure GT reset is complete during ccs_mode change

 drivers/gpu/drm/xe/tests/xe_bo.c    | 3 +--
 drivers/gpu/drm/xe/tests/xe_mocs.c  | 3 +--
 drivers/gpu/drm/xe/xe_gt.c          | 6 ++++++
 drivers/gpu/drm/xe/xe_gt.h          | 1 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
 5 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.34.1

