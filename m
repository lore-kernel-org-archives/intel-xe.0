Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C8AEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 20:51:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF2410E092;
	Thu, 29 Jun 2023 20:51:49 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE27F10E092
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 20:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688071907; x=1719607907;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oithRT5ovkutj+V39LNeX98h4FJgdojLkXzUZM9ayHQ=;
 b=C/rMiMQK83xtM26vp7yYWJut4rlwSB2kDb6MoXu+7j9BfYG1X+R0FA95
 9z5jfdjgZTbcdI/rkaW2ojaSO8TOR7m+7MEX2zAwECU/7LIkcLH0IdneH
 jFJa2qbWOj9MWSyH9QBgHBK+bpWjB6ci+dXlFIK6isY6scpVxAVFlR0IK
 zx5ZhZqJ5tv6+uj4NM57vU6vZStBdhSbfyqkbTCkqp3QXJXBwUzWTvCCQ
 z9UbrjFSovkS922cjjGc3kar64eL74UhjLhz9lXZOvDFXJIO6aSyaW2Zc
 XWnLwroAK5sVkOmFAif+f3uJjCRUKCv7yCNuGTS1GaSiYx5Mt+aQ42rjZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="448605244"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="448605244"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711577948"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="711577948"
Received: from sfhansen-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.200])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:51:45 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 29 Jun 2023 22:51:32 +0200
Message-Id: <20230629205134.111849-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] drm/xe: Fix two bind races
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

The first patch fixes a race where, if the default bind engine was used
for a page-table-update operation, a following operation using the same
bind-engine could attempt a CPU page-table update while the first operation
was still ongoing.

The second patch provides a coarse-granularity fix for the long standing
separate-bind-engine-same-range race. See that commit message for a
detailed discussion.


Thomas Hellström (2):
  drm/xe: Make page-table updates using the default engine happen in
    order
  drm/xe: Fix the separate bind-engine race using coarse-granularity
    dependencies

 drivers/gpu/drm/xe/xe_migrate.c  |  5 +++-
 drivers/gpu/drm/xe/xe_migrate.h  |  2 ++
 drivers/gpu/drm/xe/xe_pt.c       | 48 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c       |  1 +
 drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++++
 5 files changed, 63 insertions(+), 1 deletion(-)

-- 
2.40.1

