Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995BDC02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 21:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CD010E4A1;
	Fri, 14 Feb 2025 21:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YFzcyU30";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CBF10E4A1
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 21:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739568224; x=1771104224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jHPD0lJPnVIjdAPi4wn3GXTnsbBmbZMx6d3fJcNVn7s=;
 b=YFzcyU30wzIpETmgX7Fe5TfI1UuFlyVylnz7hS7lTTWs3s+cKcyYVanm
 oS7ad8DnjuiONsbaPyyI2kKszhCM5h438dywoeDF3twQZ7rXsQMKN2D/F
 5PiAXBduAXYSz89vvp3a1nLb1AEN8Ply0dPcs/qwgI6z9nCGmSpjzoJlK
 /LrluCu0/7Yq8QqY+naoRR1O0BAVn+gBBXtWjhZvVx5tpfDEuvj3SnnRI
 w9Z3Sk9noWYZ0Q9vBp2C7OxFt1e0LCp/DlcA10ql8aZlRy7ZBk2vBq6lA
 4qZG52h10p3t4ECNYZ9ee3aMcKf/sDFPgsbHcXITYcaqVldGDH6WPwHMY w==;
X-CSE-ConnectionGUID: TbFxJhm0RR68oTt8q8QImg==
X-CSE-MsgGUID: 4DNGfY5zT9eksFTnAcjzgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40447016"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40447016"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:23:43 -0800
X-CSE-ConnectionGUID: s19Ezt4gRJ6m7h7HkiGAdg==
X-CSE-MsgGUID: OJBqcq9HQ8aDpu6iXJIi/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="113757020"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:23:43 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/9] FOR-CI-ONLY: devres
Date: Fri, 14 Feb 2025 13:23:05 -0800
Message-ID: <20250214212313.1767562-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214212313.1767562-1-lucas.demarchi@intel.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
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

See https://lore.kernel.org/all/20250212200542.515493-1-lucas.demarchi@intel.com/

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/base/devres.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 93e7779ef21e8..b955a2f9520bf 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -687,6 +687,13 @@ int devres_release_group(struct device *dev, void *id)
 		spin_unlock_irqrestore(&dev->devres_lock, flags);
 
 		release_nodes(dev, &todo);
+	} else if (list_empty(&dev->devres_head)) {
+		/*
+		 * dev is probably dying via devres_release_all(): groups
+		 * have already been removed and are on the process of
+		 * being released - don't touch and don't warn.
+		 */
+		spin_unlock_irqrestore(&dev->devres_lock, flags);
 	} else {
 		WARN_ON(1);
 		spin_unlock_irqrestore(&dev->devres_lock, flags);
-- 
2.48.1

