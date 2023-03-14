Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CEEC6FD1C
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 13:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B3410E7E1;
	Tue, 14 Mar 2023 13:22:40 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFC210E7E1
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 13:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678800159; x=1710336159;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EamMJmmzWHdksfMOs/knCT6mbgTsOFIjRQ0NJ9CsoDQ=;
 b=aY4RTlfvuDwheQluJJBVMfVpBlwtGCC7hwvY7JD4mFvpeX35nGli3z/v
 2NiCJmd/kbLI6o27sxjuYB+HME4uJXBHpfFfIr3nLDRvrx9zJwiIkI6Jx
 f5s894I0/nchL75fO/Ap+rf/KAXaB/EQbncautADahThuryC26lKqDAWe
 YCPLTiJczff7trHk8cIfFvpF0RU9cZLPXK2mOvUAPuY+cv1TqZc2PbZ/j
 8EXNjhKMR23smIqSR0I/y4Eo1xezXLqvul1MqvLdktlQkDpjn+OFXPU3e
 iDz7j3/4wzdzL1jcLdA7bOH6zHCpvy0sEB7diGVIKdhVkiw8xX7pPg/Us w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317810153"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="317810153"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 06:22:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="672333545"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="672333545"
Received: from rknop-desk.igk.intel.com ([172.28.173.24])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 06:22:08 -0700
From: Ryszard Knop <ryszard.knop@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Mar 2023 14:21:57 +0100
Message-Id: <20230314132157.1521532-1-ryszard.knop@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] CI test commit, please ignore
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

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 README | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/README b/README
index 669ac7c32..4b61e5f8d 100644
--- a/README
+++ b/README
@@ -1,3 +1,5 @@
+# This is a CI test commit. Please don't merge it!
+
 Linux kernel
 ============
 
-- 
2.39.2

