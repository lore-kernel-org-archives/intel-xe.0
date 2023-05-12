Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42857C7EE25
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 07:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5C310E622;
	Fri, 12 May 2023 07:53:36 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACEE10E61C
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 07:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683878013; x=1715414013;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zjv7GyHHxUZHLBtyOfGHrRUiX7ekbxI7We7HVf4WzUE=;
 b=B7EqlPqnS/BS3VqjjW4W0rA1EA3WRpzUNY8rYHseVlXU0qGQqTEYRo38
 yHnHrlVt5Fgt7vpI9iCCHNsZCCVlH2gVVwBpk09+LNMssmikpVFr7ev9p
 x283m5QVELPnmwJl602JavuZZD8c0aPuQ2CEXMKu8uDr5hrCBMnLXNt7P
 bzJSRlhw+xGk+Ux9M2duT/TKWVXfeq9ZP0J0M75YuhOXfQXwfERJS9Yex
 q4OgHOOj/GQcaRf6VDYSNXVb/WJNGyKpATPzqA05/C2GyLKUdKOy0o8N1
 wJ2fmyLkLG/HM4kDXTAuNtTrGapKdzRwOzkt4E8DZZsZrQA2UNavQ2UHp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="414098339"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="414098339"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 00:53:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="789713090"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="789713090"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.161])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 00:53:04 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 12 May 2023 09:52:41 +0200
Message-Id: <20230512075243.447305-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] drm/xe: Fix unprotected rebind_list
 accesses
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

Each VM has two rebind lists, one protected by the VM resv, the other
one protected essentially by the VM notifier.list_lock. This series
intends to fix two points of illegal access.

Patch 1 fixes an access of VM rebind_lists' link without the VM resv held.
Patch 2 fixes an issue where the VMA may not be removed from the
VM notifier.rebind_list on VMA destruction.

v2:
- Remove a code comment. (Matthew Brost)

Thomas Hellström (2):
  drm/xe: Fix unlocked access of the vma::rebind_link
  drm/xe: Properly remove the vma from the vm::notifer::rebind_list when
    destroyed

 drivers/gpu/drm/xe/xe_vm.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

-- 
2.39.2

