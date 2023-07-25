Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C83EB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 20:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF0010E39E;
	Tue, 25 Jul 2023 20:28:27 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E2810E39E
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 20:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690316905; x=1721852905;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y/RQxLdLQNrtfixPaWEaBMo/G/IPPS7SCNZZfVTH+Pc=;
 b=ALBvsEEcDu7Dz3qwhIQS1nixM1KCKhSSkxvijK/T4EhS+xbqwn10c4j0
 VjBzoPoG4f5uD/efuYxa+T5CrNUC7CAbXtfeU+uqzaj2tp5Uf8Ib7jQLu
 W6lRz6hEmV9iTGw0QC6R4pVSmKo+eWwutp0A8DlwAHePyor+9ZB6QUQnG
 dSVrOUw9l6s6pidyJ4mr2j0J6qHs0O6gf6hCOUSdNEFXZxnHHs2sSFmb9
 awmp2BL5gdw86z4t+QPu1Qh+8Vye4Db515RIE40LdlxjGol0RePbBGjkH
 n2D28/V9KidpJ59GBlLWLXNYSg0bceQd6uoOghmnrU7z/aMZAj17bgGEz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="366717417"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="366717417"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 13:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="726220305"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="726220305"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 13:28:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 13:28:32 -0700
Message-Id: <20230725202836.3854908-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] Fix stolen setup for MTL+
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With this we don't get pipe faults anymore and console is usable.

Lucas De Marchi (4):
  drm/xe: Fix MTL+ stolen memory mapping
  drm/xe: Carve out top of DSM as reserved
  fixup! fixup! drm/xe/display: Implement display support
  drm/xe: Sort xe_regs.h

 drivers/gpu/drm/xe/regs/xe_regs.h      | 72 +++++++++++---------------
 drivers/gpu/drm/xe/xe_bo.c             |  3 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 23 ++++++--
 3 files changed, 51 insertions(+), 47 deletions(-)

-- 
2.40.1

