Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65FDE9270D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:31:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A901E10E433;
	Thu,  5 Oct 2023 15:31:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDB710E430;
 Thu,  5 Oct 2023 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696519912; x=1728055912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y4e+Sk7Eim++BmFXW5OmpaxGtXQA95ZihVRSY+CZL00=;
 b=SfTXLG+sH4TQ6je9OnDJXqlgk/dtQZjdeeul3Ed9/PdwxihGE3xWN3em
 vFbvSu6wSt+OqnNKg7SptSksMVtEFMqeQpja95SKEHNnyLvzfVYj4iV8D
 xl52Yadzz7LCQOlu0ORPImAkORkQvIB8Zgxb5Trq211LNZWM/6M2Lnoud
 PaimecOUlDATjqX7vg4RqZ5HwEel/qKaDFhRP0ktQuXlAZkvKYvOaD9vO
 uBoXdAWhMol4w/1i/hAGffsUv0nAHera0w3bGPkTqdZH5ul90/B8zKQBQ
 BPJnWzkoDC2Fw4CV+zd7Xz7VShiqPPQR26P99t97TFY/PXBLPRqSi7zqA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363810947"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363810947"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925631346"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="925631346"
Received: from ssshahap-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.30.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 16:31:16 +0100
Message-ID: <20231005153116.452319-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005153116.452319-1-matthew.auld@intel.com>
References: <20231005153116.452319-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 12/12] tests/intel-ci/xe: add pat and
 caching related tests
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add the various pat_index, coh_mode and cpu_caching related tests to
BAT.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 610cc958c..c41be52a6 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -138,6 +138,7 @@ igt@xe_intel_bb@simple-bb-ctx
 igt@xe_mmap@bad-extensions
 igt@xe_mmap@bad-flags
 igt@xe_mmap@bad-object
+igt@xe_mmap@cpu-caching-coh
 igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
@@ -180,6 +181,10 @@ igt@xe_vm@munmap-style-unbind-userptr-end
 igt@xe_vm@munmap-style-unbind-userptr-front
 igt@xe_vm@munmap-style-unbind-userptr-inval-end
 igt@xe_vm@munmap-style-unbind-userptr-inval-front
+igt@xe_pat@pat-index-all
+igt@xe_pat@pat-index-common-blt
+igt@xe_pat@pat-index-common-render
+igt@xe_pat@userptr-coh-none
 igt@xe_waitfence@abstime
 igt@xe_waitfence@reltime
 igt@kms_addfb_basic@addfb25-4-tiled
-- 
2.41.0

