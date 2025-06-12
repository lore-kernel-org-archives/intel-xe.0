Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44093C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 18:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEED510E116;
	Thu, 12 Jun 2025 18:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J94OzBCX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BEC10E101
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 18:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749751566; x=1781287566;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UW29+3dsQAKec37wreQLzT+3kCR0zFaz8xkjBtiy9mM=;
 b=J94OzBCXCISFQo2XQb4l2r9GHJptDsF/9JoM2oVmRQfCj5AootgFTsD8
 h1hYGushBRVo3FSry3SICGVCDYu8JySy06OrCeSCpZVIyWM0j/jX/MwxN
 UEvDdZ8RiVelIfYzf9XPf6O1kNOnNkzgY49eJ4nPwaUhsvL8L6aNWwJTt
 MAGPg2myP5QqQrPsAKsaqutg4KAw8zwvKxzR8ZSITzRr3M+TNDHqzwLIx
 +b1yyQ0MQwJcXgBOseDJepZaZAAlS283/xQSTCWp4zk27j4Ri+7eKWl/b
 ODMy/HuHZByx/7zS5if7wsrUFghl6Xvvgt9FpwwW3dApYO78iT8zF0pZE A==;
X-CSE-ConnectionGUID: tMc9AFGfSMWleJ3db8I6Mg==
X-CSE-MsgGUID: KCWoUhIfT6qxb00z9fgV7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51174705"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="51174705"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:06:03 -0700
X-CSE-ConnectionGUID: 1s6QZ9IoS+KKoDN7+BqGuA==
X-CSE-MsgGUID: 8bx7h0YsQaOiuslzpisSbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="151416878"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:06:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/2] drm/xe: Tweak default GuC log level
Date: Thu, 12 Jun 2025 11:05:31 -0700
Message-ID: <20250612-guc-log-level-v1-0-51f124a3be6d@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250612-guc-log-level-79f87ca03396
X-Mailer: b4 0.15-dev-7a402
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Lucas De Marchi (2):
      drm/xe/guc: Default log level to non-verbose
      drm/xe: Annotate default for guc_log_level param

 drivers/gpu/drm/xe/xe_module.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

base-commit: b2fb41cb73fc88b8908b3085a2df8b81db9f460d
change-id: 20250612-guc-log-level-79f87ca03396

Lucas De Marchi

