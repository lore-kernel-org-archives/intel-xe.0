Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F6DC83F07
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 00:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9740710E3E3;
	Mon,  7 Jul 2025 00:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fD4mwXIP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2177810E3E3
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 00:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751849425; x=1783385425;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GVI21zbGp3wdsVnrTPOCogF+DpyR6rHbilHG0Z5TmlM=;
 b=fD4mwXIPFu6BYz8OjRKZF8OphrQ2xsqdAVEp+2/HG/rIIHcmKSnnWDDX
 GWtctGPk4h8Ko6RET1pP8qZ5F3GBsuP/3opD6pH9YtPhZKXlrY4KNZUqk
 eoyJzrsD+z0Od38JSmqj6HstWti/GuhSZHtXQCVt+P6y6japIamJeOApc
 +4jJVRixrUgtZEy8hZrfge4q1ke6ph1CVmbugGLmj0sa9acxOZdH7ka7Z
 E9cAZExUxEKiZjcSziRWt8Wu1WHDedEdefS07jVRNbK5JkEHmVFEHjwM4
 iPfGAzJE2ydBCahtIGtbP+apYi/1T66lchxqVnJTkhqzbjzFoiSAV3MRA g==;
X-CSE-ConnectionGUID: W4PVNTx/Ri2FTNSzlWHlSg==
X-CSE-MsgGUID: sbTsV+4bRqCONQsmgvUZ9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="54204984"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="54204984"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 17:50:24 -0700
X-CSE-ConnectionGUID: gyDGFbWwSEivqV4H1RT7FA==
X-CSE-MsgGUID: w7yWV6p1SdSqBlXuZvhTkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="155564843"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa008.jf.intel.com with ESMTP; 06 Jul 2025 17:50:23 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v3 0/2] drm/xe: Remove unused code in devcoredump_snapshot()
Date: Mon,  7 Jul 2025 00:49:12 +0000
Message-ID: <20250707004911.3502904-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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

Shuicheng Lin (2):
  drm/xe: Remove unused code in devcoredump_snapshot()
  drm/xe: Release runtime pm for error path of xe_devcoredump_read()

 drivers/gpu/drm/xe/xe_devcoredump.c | 50 ++++++++++++++++-------------
 1 file changed, 28 insertions(+), 22 deletions(-)

-- 
2.49.0

