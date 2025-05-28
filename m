Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A257BC5B543
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 21:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E98F10E6D6;
	Wed, 28 May 2025 21:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmGUAvdO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B0E10E6D1
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 21:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748469258; x=1780005258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6DnIwLdLmfh/FQc0zHTUICnRvuYJ3LUOTB6sbo6UTmc=;
 b=YmGUAvdOZVIjD482IVNy7lcICkiVdbLWKsM1u7FwQ8sWEBz+xcfL4hEE
 hjy6OiYx1wVsliOEtYGpFCc2hSbj3zC9ji0qWf9XLPy9OsPRo6uSLR1wO
 bl7BSigfYIold5HDyZ4gcB9JgekeJngGnOemAApJA8xwnsCi0KqDBhWlQ
 GWBbsRvgby+g4mLG9m9wQ9IZEf73tEYhdh9aXr5c7BngPi8BD7xdbBrxC
 C1Y7w89hxG31wQOY1pUPO1JC3r+kPlQS1uEszT0ARxyVbt53usrGV1zZ/
 eu/wVzSr1zqTUaWu34YBaC5eslMv7aWIzsPM7Answ9SfxFXV4cgm5V8uy w==;
X-CSE-ConnectionGUID: /6cMPK9mQ4Grv8iafrkw2Q==
X-CSE-MsgGUID: 64tK54XESQyagmB2AHjS2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="73044762"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="73044762"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:54:18 -0700
X-CSE-ConnectionGUID: YATJxJLqRnqYqO9p4Axwag==
X-CSE-MsgGUID: +3sYpItyQd+FXFgbJpPv4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143201086"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:54:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v4 5/5] drm/xe/configfs: Add internal API to documentation
Date: Wed, 28 May 2025 14:54:08 -0700
Message-ID: <20250528-engine-mask-v4-5-f4636d2a890a@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
References: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-d9694
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

Add the internal configfs API like is done with other parts of the
driver. Also ensure the correct number of '=' chars are used for the
header.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/gpu/xe/xe_configfs.rst | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/xe/xe_configfs.rst b/Documentation/gpu/xe/xe_configfs.rst
index 9b9d941eb20ed..7f8ec39dc6dd5 100644
--- a/Documentation/gpu/xe/xe_configfs.rst
+++ b/Documentation/gpu/xe/xe_configfs.rst
@@ -2,9 +2,15 @@
 
 .. _xe_configfs:
 
-============
+===========
 Xe Configfs
-============
+===========
 
 .. kernel-doc:: drivers/gpu/drm/xe/xe_configfs.c
    :doc: Xe Configfs
+
+Internal API
+============
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_configfs.c
+   :internal:

-- 
2.49.0

