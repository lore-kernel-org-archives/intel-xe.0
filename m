Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B472C7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 20:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFF310E239;
	Wed, 25 Jun 2025 20:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqCD+lSQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9DE10E121
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 20:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750882076; x=1782418076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2bEfFrK6Dc5QFNNeFbUhl/Y81879OXdd+wHDx2/cj2M=;
 b=dqCD+lSQvNb4MSDlaJEQCM/M21ZHBfquKzqnQI+eIPqpeFbmFCiz1odm
 urcUcfszI6iqztjaOn+nEEjKO/O70quTDJDVUeauGnG37Fm8eBuctH1h7
 Mj0LBhf/xRer7KtnBASGXE626Eel3u0BD/gRrv58HEhdBpujpAvF540Kt
 8T1b84dUNHm1YTheGKW7jh3GfCyHcxCU2gMSSPhEJ1bgnDG696GO9Fcbn
 7bQ3ScXejFxTyQXQDezYCjgDBTw7yCzuZpOcBL0u/0Ixe7oAuo8gYhxxZ
 XIxYaWE1N25iTmajhpEJfa3Lg2rkx2SYe4pp8+11QWOSdxshzbDEp0vG3 A==;
X-CSE-ConnectionGUID: Vn3qpbffRVWO08xSg4LofA==
X-CSE-MsgGUID: 76C7jWfqQw2+tEsoIHfugg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52283729"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="52283729"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:07:56 -0700
X-CSE-ConnectionGUID: HSU3HHYaSk2ptiv66f/e8A==
X-CSE-MsgGUID: dHcYaC1ZRrSAE7KngpeWTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="158076102"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:07:57 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v4 4/5] drm/xe: extend Wa_15015404425 to apply to PTL
Date: Wed, 25 Jun 2025 13:07:49 -0700
Message-ID: <20250625200751.205166-5-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625200751.205166-1-matthew.s.atwood@intel.com>
References: <20250625200751.205166-1-matthew.s.atwood@intel.com>
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

Wa_15015404425 needs to be applied to PTL A0 to B0, a subsequent patch
will address the complexity required to do this. For now apply to PTL as
a whole.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index b7d12ea4d65c..3a0c4ccc4224 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -1 +1,2 @@
 15015404425     PLATFORM(LUNARLAKE)
+		PLATFORM(PANTHERLAKE)
-- 
2.49.0

