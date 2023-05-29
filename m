Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8AEC7EE23
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 21:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D9E10E0D2;
	Mon, 29 May 2023 21:19:36 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFA810E0D2
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 21:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685395171; x=1716931171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5j2iR+zCN+JPSnzKxbO0UtXcSiqiF6bGSQf/zP1kq/U=;
 b=lcopa0PW1iQ1wVXHjddz8lPoHz5Mxs2sAYXQkguNlOr33mQ95edvYGiC
 ASRDUtsbKlTWI5JgnUkNwcMxtRJ+wpWPznFpvjDvzANUlVpQuQKuxKazS
 MjlFfdTXHsDaKX0BPAC6azc7FYzc4gttUviYgMR+y1GaMez+AtSb/yc09
 h7w4j+6NHtJ+gZyxFWs5gOK+ZBCJrsaeISiJT3gVFWJ0T2nudxtvAAuFh
 YUvsovm1ptr/OtaKBLPiJSVf+B/2IuStOIBodULGrK9m0j7z8lLnpI/ue
 0jc9Ha3vMaMzfpxxEd15KBIJxw5O1/eRnRILxNkNxjYQTSO+CGXBhR3RO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="352271922"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="352271922"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 14:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="796031036"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="796031036"
Received: from gahowlet-mobl2.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.255.34.111])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 14:19:30 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 29 May 2023 18:19:14 -0300
Message-Id: <20230529211914.659551-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230529211914.659551-1-gustavo.sousa@intel.com>
References: <20230529211914.659551-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] fixup! drm/xe: Add support for OOB
 workarounds
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add gitignore entries for generated files from OOB workarounds build.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/.gitignore b/drivers/gpu/drm/xe/.gitignore
index 81972dce1aff..8778bf132674 100644
--- a/drivers/gpu/drm/xe/.gitignore
+++ b/drivers/gpu/drm/xe/.gitignore
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 *.hdrtest
+/generated
+/xe_gen_wa_oob
-- 
2.40.1

