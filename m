Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D1AC74A5B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 11:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4E210E71C;
	Tue, 21 Mar 2023 11:44:22 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1B010E71C
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 11:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679399060; x=1710935060;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hgoEWlzTesi3qSVilaitWFPgWhZ/a69sy2MPDIh8Bfc=;
 b=WJMLCe7NkKbrLNyJWRRffYPsXltui0P+efopQUzfyTsNwKIFtcCv6Esc
 o5Ux+rsOUz7881f5ja2kutuB04Q93BZ7IWEMD+QDgEA4H/kKniTU0xb6v
 IDRTqC6NT5Ye3AD+FjP5g+OLysQiTZSBV5pYUDwUlDz4Jkb9XjEJdldPJ
 GXemmySDpeUAVOhvqzmS0zoeVWaMoJkR7JTLVCuaz0AbfNw4D8mQk+i4J
 Xi9NhGze+zjzk5Bm0qS6i/qxTMKTuOFkC0TqqZ4g3zxWQa8ojXll5SqWz
 +eelZ3fUsgHOqpAJNTra6GOAjT5REa/IWuzX+cvTbL9TN91pmVFmy+2wH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="327291623"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="327291623"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 04:44:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="770593545"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="770593545"
Received: from bbrady-mobl4.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.25.208])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 04:44:18 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Mar 2023 11:44:05 +0000
Message-Id: <20230321114407.169334-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v8 0/2] Some small-bar prep patches
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

Split from the small-bar series.

v2: Apply s/lmem/vram/ for the entire driver
v3: Try to simplfy the stolen stuff by removing cpu_inaccessible()
v4: Rebase, plus one small fix to buddy code with missing PAGE_SHIFT, and one
    new s/lmem/vram/
v5: Merged the reviewed bits. Some fixes/improvements to the buddy code
v6: Another fix to the buddy code.
v7: Move check to more sensible spot in buddy code.
v8: Stop abusing BUG_ON().

-- 
2.39.2

