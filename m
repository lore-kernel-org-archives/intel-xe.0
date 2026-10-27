Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C21606A31D
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 00:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HXXAqAJz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325FA10E4F2;
	Wed, 28 Oct 2026 00:21:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F4110E4F2
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 00:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793146862; x=1824682862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=asR5ERArw3Skdb1NzEh+F46vPWOCwRd0NTgtGJU7ijM=;
 b=HXXAqAJzRSFFHIBMLnZDRr/FKdUfRiAAitDBxwmZeXa+Mx9tGc+maQlv
 cQTb87k8X+TZxO9yC+OJtCcY98tWq+qqiqTiImL9MhuTaevEAsTIunWLb
 JVXUMuiLPBloOjQC9GT1ScOb3zVCv7AK2ToGGZr8f2k6OXydh37QRqHI/
 pG6QCLpP31LMZ/Rg8/eMjSqtD7uuwgacMnPBp3ZfMWK42eGoyQ1vZHtrn
 JRQo0jU/2XBt7hFqrIbQ6sMVHBRXdQcw6CaPex8Q01C1TKSUwUrwBRJUa
 vt4dIyaYKwQYFfK4uMiBw2NLEvoKYZbx8ZZO/q6WQ7l92soEBfnMo2rP5 g==;
X-CSE-ConnectionGUID: eQhL84Y6QMm6q435ymY9nQ==
X-CSE-MsgGUID: Lfynp3OURcmcUckLZElN2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1860078"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1860078"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 17:21:01 -0700
X-CSE-ConnectionGUID: PND12zD6QgC6XwX4RGQSzw==
X-CSE-MsgGUID: 6lWB6TfsTWeWVULwUvfX3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6454371"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa012.fm.intel.com with ESMTP; 27 Oct 2026 17:21:01 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 1/3] drm/xe: Toggle the D3Cold enable flag at runtime resume
Date: Tue, 27 Oct 2026 10:43:53 -0700
Message-ID: <20261027174351.619929-6-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027174351.619929-5-vinay.belgaumkar@intel.com>
References: <20261027174351.619929-5-vinay.belgaumkar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We enable this flag during runtime suspend, need to set it back to
false early during resume to maintain consistency in pci driver's
internal state. d3cold_toggle() updates the root port's ability
to go into d3cold via the dev->no_d3cold flag. With this patch, we
are ensuring this internal state remains consistent with that of
the endpoint.

v2: Clarify the commit message (Matt Auld)
v3: Add fixes (Karthik Poosa)

Fixes: f026520367be ("drm/xe: Only set PCI d3cold_allowed when we are really allowing.")
Cc: Matthew Auld <matthew.auld@intel.com>
Acked-by: Karthik Poosa <karthik.poosa@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 0c13eb901aa7..d13599d79ae9 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1456,6 +1456,9 @@ static int xe_pci_runtime_resume(struct device *dev)
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	int err;
 
+	if (xe->d3cold.allowed)
+		d3cold_toggle(pdev, D3COLD_DISABLE);
+
 	err = pci_set_power_state(pdev, PCI_D0);
 	if (err)
 		return err;
-- 
2.53.0

