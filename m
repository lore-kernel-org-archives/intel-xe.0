Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F583C48BF6
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 16:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9747510E33E;
	Mon, 26 Feb 2024 16:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gD3+5oxV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E307110E33E
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 16:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708965909; x=1740501909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j+vBKnhH5AiO++DDt5LuQI4oS+U/7QAPYHGyVKw60ko=;
 b=gD3+5oxVM4szBIZOZYNfARsK7/7djP1lVrUEmgSArETYIyVQEff5EJW3
 kXJw4wvz36P3QnRRPxSUe6nMS220olc2hKBfH5DcEie5cEJkb9XvXMofP
 6FReKBtlquSbGjPEapLlebqoKE56WaIdz8qnp3sBMfR6yrZF5QX/PYYmC
 Rojr2r0oU6EFHtzO+D+tvFwl3WVpuseIgZw1iDg7pUi7OiHTBJbNngnSm
 FUEI4NyLPq6t9h4aTZedUv81KCdwnpj1rSn9uXaS0CCebgJV9f35CCztj
 PLPfQY/tItMZh9Ymsy+JrSz6v09ho+Sq7SrNlITX/UqN7eRO7wFHiU5u9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25730047"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; d="scan'208";a="25730047"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 08:45:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="6751875"
Received: from shunter1-mobl.ger.corp.intel.com (HELO fedora..) ([10.252.3.88])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 08:45:06 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH 0/3] drm/xe: VM Overcommit handling fixes
Date: Mon, 26 Feb 2024 17:44:52 +0100
Message-ID: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

We were not allowing eviction / shrinking of completely unbound
local objects. Since unbinding is the UMD primary means of
freeing up memory on local VM overcommit situations, fix this.

While on it, also reinstate the migration of local objects from
VRAM to TT if the placement list allows it.

Also open up the possibility to evict purgeable local objects with
upcoming changes.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>

Thomas Hellström (3):
  drm/xe/bo: Forward the decision to evict local objects during
    validation
  drm/xe/bo: Allow eviction of unbound local bos
  drm/xe/bo: Allow migrating local bos to TT to make room in VRAM

 drivers/gpu/drm/xe/xe_bo.c       | 41 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec.c     |  2 ++
 drivers/gpu/drm/xe/xe_vm.c       |  8 +++++--
 drivers/gpu/drm/xe/xe_vm_types.h |  7 ++++++
 4 files changed, 55 insertions(+), 3 deletions(-)

-- 
2.43.0



Thomas Hellström (3):
  drm/xe/bo: Forward the decision to evict local objects during
    validation
  drm/xe/bo: Allow eviction of unbound local bos
  drm/xe/bo: Allow migrating local bos to TT to make room in VRAM

 drivers/gpu/drm/xe/xe_bo.c       | 41 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec.c     |  2 ++
 drivers/gpu/drm/xe/xe_vm.c       |  8 +++++--
 drivers/gpu/drm/xe/xe_vm_types.h | 10 ++++++++
 4 files changed, 58 insertions(+), 3 deletions(-)

-- 
2.43.0

