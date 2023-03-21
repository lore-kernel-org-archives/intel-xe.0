Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2169C7618D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 10:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B26310E74C;
	Tue, 21 Mar 2023 10:45:48 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067CE10E17C
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 10:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679395546; x=1710931546;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pDh1O3Z7AXZR+lQ760YWwV/r3xBGrU8knyVpY0YHsHs=;
 b=QLLXJ7UAWSxMi58yGkHF2as1yQ9LIHS9jk4SiUrWx55d5Z6OQU2OKxF+
 jRYUyz6ZOM1+NJg2v5Ee3tm8RCTZlQvS0nPNImBj6ZPzwWlMB8HrmP9qj
 k8OU2prl7SrSck1kTRrnbzJsjyU/OAeXQVnjr9M7TYRv8KqxMbPI2klE+
 Oit19CTj5ynFNeuuObKRRA3b77dvFSrPOTnardtx7G2gw/+G11EPcuQXo
 +3JwOxFO8XJVPbU5R4YdM5JxKKT53y/Tv3Ym726Urx/vR/r5dajLHSuzY
 qawoSuzmeHVMmjS136wi8BGTAzx6zN8lZ7TFcl+vRCAd6eYaTDUSF+4ul Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="341267431"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="341267431"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 03:45:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="658719526"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="658719526"
Received: from bbrady-mobl4.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.25.208])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 03:45:44 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Mar 2023 10:45:27 +0000
Message-Id: <20230321104529.157616-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v7 0/2] Some small-bar prep patches
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
v7: Move check to more sensible spot in buddy code.

-- 
2.39.2

