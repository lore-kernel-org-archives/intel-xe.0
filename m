Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010E1C7EE24
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 05:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36C610E23A;
	Tue,  9 May 2023 05:24:26 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB9610E22B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 05:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683609865; x=1715145865;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AwbOzkh3mb85xlAYBGDbnSRV/yV7ZtygHBrItFKdr7g=;
 b=Lz2S5MS/FE7IX64YLT2h1jmy7qxhzMASyJ6n08Cwolwo9+DSN0dCHDD4
 JGxngibC8GDfJl3cbFXJW6SHtD1Hra5ei2TGwJMPmTjo4IdLyTsEmxvDv
 zw73IhsvHIlsDr6gnMCj2b5L3hp68ELe4MFX+oty7/t//zw0Sf9NyQ5w8
 9DDgTSxDEjwTcCpHGPsEMHoNpCM22je72UsJQz4Fz6PMrozklH/Xnbtxd
 eaVjtubcWL7KZneXuSJtsuXitTMMMeIMIwNGktwGumDcwOCFhFNwY6cJP
 3RXHgEyw+OkFXxTzclyOdC5MK1rc+ArNGZGfc+6p7NLsvXvfvpBChfscK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="329433746"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="329433746"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="729336024"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="729336024"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:24:24 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 22:24:17 -0700
Message-Id: <20230509052419.28430-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] drm/xe: Handle -EDEADLK case during BO
 validation
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
Cc: thomas.hellstrom@intel.com, christian.koenig@amd.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With multiple active VMs, under memory pressure, it is possible that
ttm_bo_validate() run into -EDEADLK in ttm_mem_evict_wait_busy() and
return -ENOMEM.

Until ttm properly handles locking in such scenarios, best thing the
driver can do is unwind the lock and retry.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (2):
  drm/xe: Handle -EDEADLK case in preempt worker
  drm/xe: Handle -EDEADLK case in exec ioctl

 drivers/gpu/drm/xe/xe_exec.c | 27 ++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.c   | 25 ++++++++++++++++++++++---
 2 files changed, 46 insertions(+), 6 deletions(-)

-- 
2.21.0.rc0.32.g243a4c7e27

