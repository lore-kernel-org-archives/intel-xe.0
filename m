Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08184D2A53F
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 18:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4DF10E754;
	Wed, 16 Oct 2024 18:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XIAwI0XO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DB310E181
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 18:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729104825; x=1760640825;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TY0J2pc+0gVv8FtDKN+ZAgOLBNCimfvfRcw4WAY33kU=;
 b=XIAwI0XOpQUZz8GRUNpXhpTjpPE3835bXl6b2tY6kqaEzHbpuREFJqix
 jOlXw6sO1rmn3RlJvDj4jtkOBXrh5ipCNYjO6chLIUgyHoLSyvRXvgjDk
 uvn+UT2CPQwrA1jvht6A6hpYqUWmZDHGniMMh9vj3Bgzyz9aDTj8ZRHdg
 6x9x6dPmuwGwzv9vY+61gmdhSzCMXxRg1GYEleVTIGgKoenRLKadnwrPA
 +AwPlTanciiJiFpYsnEpz86+wUo/YqQjCWerpmAI6GP3xNh3jwULfyYof
 +ain0HlwEW/TXqHaGaD6lHLW6A3Vf7tPxrfsFhU2BW/whU5SwEDkm6h9u Q==;
X-CSE-ConnectionGUID: KUPVgQvERz6z2ulH5Oistw==
X-CSE-MsgGUID: uUS02P7VQSa8iX61fIu9JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="28660709"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="28660709"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 11:53:45 -0700
X-CSE-ConnectionGUID: Qj//HNyKRgC2jmROVizr+Q==
X-CSE-MsgGUID: Gy9uAzjOQWmEduOE0ZYh+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="77971664"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 11:53:43 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 Fei Yang <fei.yang@intel.com>, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/1] drm/xe: enable lite restore
Date: Wed, 16 Oct 2024 11:57:25 -0700
Message-Id: <20241016185726.907844-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Fei Yang <fei.yang@intel.com>

The lite restore is a performance improvement feature which avoids
unnecessary full context save and restore if the task been switched
in is the same as the one been switched out. This is supposed to be
enabled by default.

Signed-off-by: Fei Yang <fei.yang@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>

Fei Yang (1):
  drm/xe: enable lite restore

 drivers/gpu/drm/xe/xe_guc.c      | 2 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1

