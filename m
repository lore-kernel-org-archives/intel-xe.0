Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DADD3ABC3
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 23:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F24D10E095;
	Fri,  5 Dec 2025 23:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MAWMiWif";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928B310E095
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 23:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764978588; x=1796514588;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X4YxyAJY14AwuB3n+2ZbIyZB7AGlLEo/VTCm7PqSjs4=;
 b=MAWMiWif/yWE01i0qp0poBu6PGGrJZoQqfBvRaQJ9x9nEVXCIF5c5PHe
 71lp2e9dPE8jaMU3F+18S3m5YvbC1Lj8b20K8It6oVJpUdz9HwT3eZRS+
 C/bt//6tXldU/8F7m5WCSLCEKVvrgeZMsw8Rn/m0QXSwF4dSt7Gc2jLoC
 dE0U86auuM1+thsG3IFh25dXdKrxh37+JWSnJbJXQgYhavpCDrgL2zMEf
 DifExZDME03bqH6WOCYggSzwScZje+edzrHVPoHepWZp3A8szvzS+BFZR
 YFp76aJDqebj6ZA8rE9lcXHcXn3QMlmrb6E9nat395yN1SYIHnmlWR4Ym Q==;
X-CSE-ConnectionGUID: EtTbrLgkSR6MLbQKoNq9fQ==
X-CSE-MsgGUID: 7vi7c326QIW9SuZ7QeuUCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67056119"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="67056119"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 15:49:48 -0800
X-CSE-ConnectionGUID: soKk6JOTRp2QrkjKG8dUWQ==
X-CSE-MsgGUID: fPj2FQwKR1+KSG0ZNZvY/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="199853763"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa005.fm.intel.com with ESMTP; 05 Dec 2025 15:49:47 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v3 0/2] Limit num_syncs to prevent oversized allocations
Date: Fri,  5 Dec 2025 23:47:16 +0000
Message-ID: <20251205234715.2476561-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Limit num_syncs to prevent oversized allocations

Shuicheng Lin (2):
  drm/xe: Limit num_syncs to prevent oversized allocations
  drm/xe/oa: Limit num_syncs to prevent oversized allocations

 drivers/gpu/drm/xe/xe_exec.c | 3 ++-
 drivers/gpu/drm/xe/xe_oa.c   | 3 +++
 drivers/gpu/drm/xe/xe_vm.c   | 3 +++
 include/uapi/drm/xe_drm.h    | 1 +
 4 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.50.1

