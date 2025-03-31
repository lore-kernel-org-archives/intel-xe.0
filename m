Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F59DC3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 14:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BFF10E401;
	Mon, 31 Mar 2025 14:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OINkPiPD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D943D10E401
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 14:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743431089; x=1774967089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=418SvXn4ao+nu8cayHlTU673NXVB0SMyyrRlHIU/cHE=;
 b=OINkPiPDN8qzZZQaAgkJmEY6QBqUZ0JqEMMD+dsjeS4qCvFHO1iZtD/T
 0eqggF/c81jYnm1Rij2Zfzj7jGZybyPya7EZJ1fmKmfAs1yTrPqrbJOPb
 W6mbKa/pI09S2zQs3Gfoktga9mL5Pz4EGwB5YAYX1jP8iuucO2R/1p3k7
 bFqzAaPKzvSt/l/RQ2yaWsjceFMzdokOhf9J7qrNqWke1p58bYkHaElAH
 RfZ92aXDL8lSifvQAtnKKfI7V55aoBj6+3wElY5aGaydPeoUrLXfqnPnf
 H5Ux+BqvizEy4+qGb7mqlNQpdZMjVhEeClD7kkUCNYCaWkrN64OpMTM7c w==;
X-CSE-ConnectionGUID: 7+tpFenUSUm8sVQELAYi1g==
X-CSE-MsgGUID: Wa7Gwl0STIWRL3c8NOrz1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44606210"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="44606210"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 07:24:49 -0700
X-CSE-ConnectionGUID: oY+UI0AHQrGXJmD9gUP3UA==
X-CSE-MsgGUID: 4fq8XWkmRX+AXxKSq9lqOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="130808260"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 31 Mar 2025 07:24:47 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 2/2] drm/xe/doc: Wire up PCIe Gen5 update limitations
Date: Mon, 31 Mar 2025 19:53:36 +0530
Message-Id: <20250331142336.640226-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250331142336.640226-1-raag.jadav@intel.com>
References: <20250331142336.640226-1-raag.jadav@intel.com>
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

Append PCIe Gen5 update limitations to xe_firmware document.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 Documentation/gpu/xe/xe_firmware.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
index afcb561cd37d..0c3f93e920fe 100644
--- a/Documentation/gpu/xe/xe_firmware.rst
+++ b/Documentation/gpu/xe/xe_firmware.rst
@@ -31,6 +31,12 @@ GuC Power Conservation (PC)
 .. kernel-doc:: drivers/gpu/drm/xe/xe_guc_pc.c
    :doc: GuC Power Conservation (PC)
 
+PCIe Gen5 Update Limitations
+============================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_debugfs.c
+   :doc: PCIe Gen5 Update Limitations
+
 Internal API
 ============
 
-- 
2.34.1

