Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553E8C74A44
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 08:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2154410E16B;
	Tue, 14 Mar 2023 08:59:09 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7013910E16B
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 08:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678784346; x=1710320346;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XV+UNrixIbVWJ2wSqj7wi0clr7lWYnXbWdvMjncL7Jg=;
 b=BvUMbmdxu8VgBbzEE1z1KY2iGrhX7hVX61bTt0HHrqVqrXumYmHCbi0B
 EjmCmuxy/RLFiqT/KeyiosqYqPfKpnUjHX7YajnltSlXt5zQ39nNS1hrf
 0a6MhU1OKUiLxEwduBgKhtHakWCv/noTcXqIFHtr9XVzy8B39wWdXp79x
 lY2lEg1iUfc9B6WB4XBc9WC8QAHm46CFl37wzvm/GyCIQC3McYDP/uDzn
 QaSGjdCh45DDz2QOU1upACqKGcX3DFDB524/ZCJbovzqh1Iz5l0KuZA2Y
 4eMBFygzhP9nhxyZTcGCLaqJb/x9rScynC9lUrVakF0YcQM2/Q19njifC g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317756227"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="317756227"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 01:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="747922666"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="747922666"
Received: from tlambe-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.14.230])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 01:59:05 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Mar 2023 08:58:36 +0000
Message-Id: <20230314085842.134239-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/6] Some small-bar prep patches
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

-- 
2.39.2

