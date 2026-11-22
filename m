Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52D3606A339
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 15:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ESMHZB4b
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFAF10E19B;
	Sun, 22 Nov 2026 15:30:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAF410E19B
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795361437; x=1826897437;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gcOqFzvfKphC6pJPMvKOg3pWUuCi4XAk5qTG1swITq4=;
 b=ESMHZB4b5z8brSSSMgOmO/kEFKkNNb8RdUCbV7Ad4byuXdo3Oj5XBKSu
 s8+5ZkvGz6DLxx/F42QTVqcl9YnsnLihg8cwXAaAn6twGIyjH9e3jdTyQ
 jt9WTmlpvMyo+d7MsLWXGzVjEtaysnyBT6m7bnUfQ28b9A1ut2gNRTIaP
 wGqtmKzWZc/vtYJPtLQZqjg8qvfyr3/hBOTbrKqFdJyIx88/geuXd+QJi
 GBCCvMlxzpaPnGFP1vfrfpeUsgrvN5F+R/xlWxrK/bCiXxxDVWHnztNJW
 g/iE/cMFCXyH5i2WPFAqQpXvUK/MxKW6iQ0OjUCjkw7YwRBqQv+chU6ab w==;
X-CSE-ConnectionGUID: DkBytE3TTG2uA1hKd9thRw==
X-CSE-MsgGUID: 8yr4EUPyQeO5IwLXUwNjGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4088508"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4088508"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 07:30:36 -0800
X-CSE-ConnectionGUID: mOl9crJESWe3SvSilHHG1w==
X-CSE-MsgGUID: 3EPuWqibQHqfU8Iu5JOoJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="13093147"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 07:30:33 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v2 0/2] Drop repeated SIGID logging
Date: Sun, 22 Nov 2026 21:00:16 +0530
Message-ID: <20261122153015.877434-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A single page offline error currently logs through multiple SIGID
messages, generating multiple CPERs. Drop the SIGID logging in the page
offline and sysctrl error paths and use plain xe_err()/xe_dbg() instead.

Rev 2:
- Log -ENOMEM and include the error code in the message
- Demote non-failure messages to debug
- Use consistent log prefixes
- Split sysctrl error logging into a separate change
- Fix commit message

Riana Tauro (2):
  drm/xe/ras: Drop SIGID logging in page offline flow
  drm/xe/ras: Drop SIGID logging for sysctrl errors

 drivers/gpu/drm/xe/xe_ras.c | 68 ++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 43 deletions(-)

-- 
2.47.1

