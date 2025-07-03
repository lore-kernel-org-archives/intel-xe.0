Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04425C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 07:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FF410E7DA;
	Thu,  3 Jul 2025 07:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXQUnczW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646F810E7DA
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 07:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751528542; x=1783064542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GU3f0O/4Ph20z3BO+zSgHrvQj76IWjF6sshuwQTAG/Y=;
 b=DXQUnczWzknfO34rLuEyowl9LYSyT9H9spYwJBUEl2FhdyLqw9WZRNfC
 c2i37AFzBlhpQ63er1PcZF8Ws47uGUfqOpPa7vvDn+715YeEsLmgMT377
 Ajkp4LnfgPLN/oWQd+OChlm9WMXUJUHDlCDUpPxj3IctjpbclBWBl9FoX
 xTLvXGdGTllUYkBcJxbuExql7bJwxVCbusWeGxm1DwAltzcE/RomsV7AN
 GzFPkCOFpRrRY8CpZ6UhMCIAxfyC2PhLqVlgR8EC0YaTMdKvZ2FC1T8Xc
 qQhoipuV6VEPvoGKVQQJzNpWbJkKCnw1pBRirisXoMog7hQMEPM2puBNg w==;
X-CSE-ConnectionGUID: /wx4NYm7TPiLUhiMqruZxw==
X-CSE-MsgGUID: CCvr8OHRR321Rvv6RVVlkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53938205"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="53938205"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:42:22 -0700
X-CSE-ConnectionGUID: zaQhUPKoQNGZXtzN2PS4lg==
X-CSE-MsgGUID: spPV7jSIRtuVYLRyrhWhZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="155043677"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa010.fm.intel.com with ESMTP; 03 Jul 2025 00:42:21 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v2 0/2] Remove unused code in devcoredump_snapshot()
Date: Thu,  3 Jul 2025 07:41:06 +0000
Message-ID: <20250703074105.3461107-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703062024.3441918-4-shuicheng.lin@intel.com>
References: <20250703062024.3441918-4-shuicheng.lin@intel.com>
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

