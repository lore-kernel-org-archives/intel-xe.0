Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E247BC3DA64
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 15:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E4D10E99B;
	Thu, 18 Jul 2024 15:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pr+IItBo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D67110E99B
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721317921; x=1752853921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oRFMhQVZJ1L+APffU/J/bD0hd2NDGz8vw6nYwddfiuU=;
 b=Pr+IItBo7iJg+ufb1UpjqJLNgr0gdEuuf3+XkrJ5SSMv0Mf80RwwmsjK
 wr01PgXvFD8Cft9ON9UQHNwirI7m5LMAFJ3tLBjsPIH/fzS9LZIng66gN
 /rQQ8AwhtllfD1OwgTntf2/z34RAf31sW5OaSjhlT4eR3iyX64jLlItTp
 RkO/MWO9fUQ2n30cW8xCqiRp3VK+tlwxoiJE5NVFyZa/Fe+c8FlBPxVtT
 9Wa2zm56IuXRaSbDwlmYSxA5xb+LA59X9zJLKOTqsVWlt9VfOHBL+KGKh
 V7mGbcTZl2fg7KUQZ8DDaE2Tzb/a/WerhWiBjvc5BsJ6newHG6wbIIYlU Q==;
X-CSE-ConnectionGUID: ZxnlexMMRbG6XpTwOjmMZg==
X-CSE-MsgGUID: GlPVTcl1T/y69Hd+WI4NXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="18760895"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="18760895"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 08:52:01 -0700
X-CSE-ConnectionGUID: 8XOfJAXORUyfb4FFCL7VpQ==
X-CSE-MsgGUID: MW42KmHpTzae+qE970TSTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="51518265"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 08:52:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH v2 0/1] drm/xe: Build PM into GuC CT layer
Date: Thu, 18 Jul 2024 08:52:44 -0700
Message-Id: <20240718155245.1481788-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Take PM ref when a G2H is outstanding, drop when it is received.

To safely ensure we have PM ref when in the GuC CT layer, a PM ref needs
to be held when scheduler messages are pending too.

v2:
 - Add outer PM protections to xe_file_close (CI)

Matthew Brost (1):
  drm/xe: Build PM into GuC CT layer

 drivers/gpu/drm/xe/xe_device.c     | 4 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c     | 5 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++++
 3 files changed, 13 insertions(+)

-- 
2.34.1

