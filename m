Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12419606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 00:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lXqrKsLX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00BF10F844;
	Wed, 21 Oct 2026 00:18:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5104110F844
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 00:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792541908; x=1824077908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ocFu9vu0gsLdQ8RAFy/cfz9xdAk1WWKyDauIn4n1Os0=;
 b=lXqrKsLXnhlUeFhJ6j4gwACiyP5XIRV7JZF117w4qTAsnbhj9/bzobya
 Ei0FyQZJ71+69R0MdMaeBQmE9oMRkRKW4bgFv9ACJqzc4DdAQXGOLeKGg
 VHPFMQtXEST3EpAgrPwK0+c7ZYJvo4w9jGpzXJsZAAAyeOOTqDIM873Co
 oAo/IzZEXjT62tPMWqFK8D4gBfDphGYgQj9TPW1pgQrP0XabdeOhxYu7o
 7qn79GDNrdpS8AeZHMI+mpEmvlzVYLZ0N4sJpTmzyQw4KObhGdbN1h4MJ
 TaJ6UA2JxzvAQA7RMtkqMtzK2LSAMLJ0WbcX6bVBzJMN9uamo+4D+biUh A==;
X-CSE-ConnectionGUID: NhJaZMEoSSyH0PjTupMWLA==
X-CSE-MsgGUID: ABNG9PWfTyGMLcfhBdARQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1132515"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1132515"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 17:18:28 -0700
X-CSE-ConnectionGUID: 45soigEiRjWGxeLbpuQPEQ==
X-CSE-MsgGUID: LofnyrtkRGurcysq1v6lZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2955631"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa004.fm.intel.com with ESMTP; 20 Oct 2026 17:18:27 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 1/3] drm/xe: Toggle the D3Cold enable flag at runtime resume
Date: Tue, 20 Oct 2026 10:39:45 -0700
Message-ID: <20261020173943.669600-6-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020173943.669600-5-vinay.belgaumkar@intel.com>
References: <20261020173943.669600-5-vinay.belgaumkar@intel.com>
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
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
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

Cc: Matthew Auld <matthew.auld@intel.com>
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

