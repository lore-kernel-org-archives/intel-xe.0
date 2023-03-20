Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719A6C7618D
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 15:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D49410E2D9;
	Mon, 20 Mar 2023 15:13:59 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2BB910E5CC
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 15:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679325236; x=1710861236;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lp0qamKFJCTZC0AfJy9ctM9EsHQUNTptEdtfCnVK0IE=;
 b=c6b1wvYzWNy6Z8AGJxfq5tMopLl5D0bwLivnH1SiKgI8RvHEGeQ+ghiV
 9KHo3ptpgPAvtNYisrnZu9amHRhPGLOLugCi6xOmkhukelvQIgc9M+eCH
 DGZBMjKXYRzmyZMQP+S0hH6Rza0msdgpV9qSnFdRcO/Be6zNUBHG9XWGj
 CHBYwwLKOmMg96uMySpnKZ2aKbr+GCiNCv9FZbdQqnm2Uk/2V49yXcFto
 pr1yR2lQlj5OxP3S2VBlJ71s5uNp9OHpUzso1EcsI0yAS5oJWTWCc/tkk
 StSi4nvbuM37zIdxJ8tqa/4m9/uE9EjjJH2h0jlMEykN4NbFjZlPe1O8U g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="327061352"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="327061352"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 08:13:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="713610186"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="713610186"
Received: from vmiceli-mobl.amr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.135])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 08:13:55 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Mar 2023 15:13:32 +0000
Message-Id: <20230320151334.60302-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/2] Some small-bar prep patches
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

-- 
2.39.2

