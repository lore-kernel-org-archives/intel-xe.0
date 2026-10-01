Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E821CA5FB3
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 09:45:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD37D10E057;
	Thu,  1 Oct 2026 09:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ChzcXcso";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E280410E057
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 09:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790847941; x=1822383941;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5TueaHV+EGb2YS8QD9im5Wq527uUbDh5VxdyMFUvHWQ=;
 b=ChzcXcsocEFUREG9zO3OZ0g3VlcnTUhRAYhozIEAU1W9K9qV8vmNgrwF
 NIHU4BzLZHhtdjkgoAWTqbrZpj8Q7DnDCWl5pPJH6kjhteyfNlTibbcTH
 RtkY5VKzoWMJfLqFuxNaK6+x+zlTw+0ieHfuYd7H3QhGLLD02SgAl2DXP
 FUC6v6bCGsGBlyyc2mRAQtD6WjeE7akrvYMFVrx6ZGjQw9rvp6b/MUSb5
 c9N3wt8Ewh1YoNXHz2hcysZ04BN8ICav2FwkWsUfjk5wucIfyrRaZ05vw
 vK6zuxedthJLqqb4w5RhMOFqFbjxJAYNUhRumiRaZNAtGVR92zJwf/Qpf Q==;
X-CSE-ConnectionGUID: miLzv8T0SyuLPGf8R1drwg==
X-CSE-MsgGUID: iWwaQC8VR4mo39ELB8SZpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102124025"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="102124025"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 02:45:40 -0700
X-CSE-ConnectionGUID: dxnOaROBR36suWs/biEL4g==
X-CSE-MsgGUID: zj3r1xa+SsKUfTEtBKqFHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="3772"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 02:45:39 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 0/4] Followup fixes for memory page offline
Date: Thu,  1 Oct 2026 15:15:19 +0530
Message-ID: <20261001094518.1493651-6-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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

Fix earlier Sashiko comments about RCU lock and external pinning as 
well as VRAM lookup for fault injection and some kernel-doc nits

Tejas Upadhyay (4):
  drm/xe: Clean up kernel-doc typos in VRAM manager
  drm/xe: Re-validate external pin under resv lock before VRAM purge
  drm/xe: Drop RCU list handling for VRAM bad-page tracking, use
    mgr->lock
  drm/xe: Keep VRAM fault injection within the usable range

 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 59 +++++++++++++++-------
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  4 +-
 2 files changed, 41 insertions(+), 22 deletions(-)

-- 
2.52.0

