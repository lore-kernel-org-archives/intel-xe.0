Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71508C77B73
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 15:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170C010E371;
	Tue,  6 Jun 2023 15:25:04 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24A010E371
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 15:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686065102; x=1717601102;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3F7TR473t958HkZkZC9J50NLBVuIhAifRGsTi12VZW8=;
 b=QfzbRK4dAGkCNUx+Bd1TM9StiPmz1PmePIRExXgJ4QAt6kVH7NO5/2WE
 rAbyYUPVtlLiB0MD4juusVTl69h8AevibfBvpRhaqjRQ3CXKdyEpWjLIh
 DOftwTYO/aEVY/6WICenjyXGc5uZlYw+pJV35VDwVniqDs9KKL5tXPZDv
 zJTRZlVFdlD9LbJkM5fnZCFj5IgCNM0K2EwqYgMgaCtUWDLYnaubQMIxb
 hXkiaF8TsP6qHAetiZ3sT+304nvsRV9dBHGqFs10sWcRVtjVXU8oT6w41
 8P6Fo69rF+247+03j+vUC9KxrHVolVuv+e2E7ouEMG4/qt6TqH+HW8vXA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="354205274"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="354205274"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 08:24:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="686581934"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="686581934"
Received: from akurkina-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.4.184])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 08:24:55 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 16:24:15 +0100
Message-Id: <20230606152420.172591-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/5] uAPI bits for small-bar
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

The remaining small-bar bits. Add support for requesting CPU access for VRAM
buffers. Also expose this to userspace, along with various bits of related
accounting. Finally turn on small-bar support.

v2: Various improvements suggested by José
v3: Add some kernel-doc (Gwan-gyeong)
v4: Small kernel-doc fix, also use the correct version of the struct
v5: Rebase on latest xe-next changes

-- 
2.40.1

