Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40723C636D4
	for <intel-xe@archiver.kernel.org>; Mon, 13 Feb 2023 06:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36C110E050;
	Mon, 13 Feb 2023 06:35:44 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207CE8825B
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Feb 2023 06:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676270142; x=1707806142;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qCeK+SM/46VW6CHIEZe1p+7liU/hhPhEVjtwwJpfuSA=;
 b=fvoakCKEoEBeAqgNDscm7cAZ/9UllqxU4ZA1Z5IuO5/CAqqaJGZ765ik
 k1RzlJkHshN4HAR4bKvMUw8nGHT4MnYO4CTBBVjUlt0/SXPxyOGrJRk2Q
 dgRxxtGroK49LqoHBWgWQ8Bzwc0id2lQ6YaHPTOvfhfQubh/gMgChp6oy
 GhUOL0N1sIsXPCYM/TSTTV0UhDqVPuDfDGi4NaAN1uBeQKYaA7zXXpRXc
 5pSb9I7miyVrKKUAnjBhc7S30dVb4EdclWVlPwJfiMMrEpQ3Ovkw2FTC4
 0YTd/VB/76C+vSdzmxxi9fPyDW/GoLhE08VO4JatICM0cQxRVvPbYogo1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="332126950"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="332126950"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2023 22:35:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="699072850"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="699072850"
Received: from karolkro-desk.igk.intel.com ([10.102.42.209])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2023 22:35:40 -0800
From: Karol Krol <karol.krol@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Feb 2023 07:25:20 +0100
Message-Id: <20230213062520.2928488-1-karol.krol@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] test:test
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

---
 README | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/README b/README
index 669ac7c32292..5933dcfdd50e 100644
--- a/README
+++ b/README
@@ -1,10 +1,6 @@
 Linux kernel
 ============
 
-There are several guides for kernel developers and users. These guides can
-be rendered in a number of formats, like HTML and PDF. Please read
-Documentation/admin-guide/README.rst first.
-
 In order to build the documentation, use ``make htmldocs`` or
 ``make pdfdocs``.  The formatted documentation can also be read online at:
 
-- 
2.25.1

