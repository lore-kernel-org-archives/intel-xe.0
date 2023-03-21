Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12774C74A5B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 09:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AB110E0F4;
	Tue, 21 Mar 2023 09:10:48 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24E910E0DE
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 09:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679389845; x=1710925845;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v7Xhi3ihAZ3CYYSVsHJ9NsjdI6/wVmGJK5y8YOdVVfU=;
 b=GOfY1uhT0WPFSoFj/CYk0RJDeBOGSKSPv/dH+xUVfkkJOta70qqvs7Zc
 RjvobKrraSuK/T9lCnfX8Qft0O7fWcl/yyz52JK1YGTdDKuHuopGtUFWo
 f53Y7SKEslEQKQwaAOCiXJBrPm0o9eFt6zR4yk9teNvncEuhU1PdxivjW
 /xfFiQ53LVsjyGxGSnfHTrIqRWcz1cG+ofaQBpH3VUkzmppiWUK7Z3X9p
 GcNd4QmGY5CNcqVUWt12J7evdaISiM2Rz4Fh1FXnSM01fQjLJAWlHPlTA
 RJFsaUbqFzOoxoIEpGbva58O/698264wsXJMfjL+VbSIuSL3K8Ycsswp2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="318540537"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="318540537"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 02:10:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="791994750"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="791994750"
Received: from bbrady-mobl4.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.25.208])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 02:10:44 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Mar 2023 09:10:33 +0000
Message-Id: <20230321091035.133800-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 0/2] Some small-bar prep patches
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

Split from the small-bar series. Plus one extra patch to fix the overloaded
meaning behind xe_ttm_stolen_cpu_inaccessible(), as pointed out by Maarten.

v2: Apply s/lmem/vram/ for the entire driver
v3: Try to simplfy the stolen stuff by removing cpu_inaccessible()
v4: Rebase, plus one small fix to buddy code with missing PAGE_SHIFT, and one
    new s/lmem/vram/
v5: Merged the reviewed bits. Some fixes/improvements to the buddy code
v6: Another fix to the buddy code.

-- 
2.39.2

