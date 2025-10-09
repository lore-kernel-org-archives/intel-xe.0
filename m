Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FF9CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 21:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE4F10E24B;
	Thu,  9 Oct 2025 21:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iV5WWK6r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D35010E24B
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 21:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760047071; x=1791583071;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zR2EU9mB7DLVecmx1NRNcDR8M3Ix0fil9mE6OI0yvrk=;
 b=iV5WWK6rMMlf4OI5Xz0yvs2MdZdRM6JWb9o1kv0OzDlA8GkgoB5/8s9t
 RQnKqTlAgARSfL6glxsdcS3mmd50kNzciH2amC4oAJLTYPMZjldlMC/Ea
 Q7Qmu8qaDjelt95qg5sPoOHePA2hg4wqJB+ENKvTAEZ5Z66wzOY2fy7Ra
 bhzNjNKxOQm9ruB64BNXZJEfZcfMvPOnLWS5kLkqviX4quRJrVxiy0o7n
 mURR02ONkzHz9dRc/eUh12xkxUtbF4QNLzv2RS+9r0SP2tTPzp8ji4Tbo
 lLnH26aRIlVoOQ0+SC5BdTeWO1BSy8IadOxwHIFQS16qlfTp8aBUN8l07 Q==;
X-CSE-ConnectionGUID: JXslosIPTNCau5MpPqX22g==
X-CSE-MsgGUID: V5jqvwa1T1G9tItWfpzU0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="64889885"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="64889885"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 14:57:51 -0700
X-CSE-ConnectionGUID: 77xqd4rWQNeVK+wYHr5+UQ==
X-CSE-MsgGUID: /PICHzhwRtOgvEiI1rg9Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="185199879"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2025 14:57:51 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, Zhanjun Dong <zhanjun.dong@intel.com>,
 michal.wajdeczko@intel.com
Subject: [PATCH v5 0/2] drm/xe/guc: Cleanup GuC log buffer macros and helpers
Date: Thu,  9 Oct 2025 17:57:47 -0400
Message-Id: <20251009215749.378905-1-zhanjun.dong@intel.com>
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

Cleanup GuC log buffer macros and helpers, add Xe style macro prefix.
Update buffer type values to align with the GuC specification
---
Cc: michal.wajdeczko@intel.com
---
Change list:
v5: Change patch order
    Sync macro names across buffer type, size and GUC_CTL_LOG_PARAMS
    Replace guc_log_size with macro
    Update log buffer layout comments
v4: Replace helper functions with macros
    Rename log type xxx_DEBUG to xxx_EVENT_LOG
v3: Update comments
v2: Use SZ_4K, instead of PAGE_SIZE
    Expand for loop with switch and fallthrough

Zhanjun Dong (2):
  drm/xe/guc: Update GuC log buffer type value
  drm/xe/guc: Add prefix to guc log buffer macros

 drivers/gpu/drm/xe/abi/guc_log_abi.h |   4 +-
 drivers/gpu/drm/xe/xe_guc.c          |  23 ++---
 drivers/gpu/drm/xe/xe_guc_capture.c  |  16 ++--
 drivers/gpu/drm/xe/xe_guc_fwif.h     |   6 +-
 drivers/gpu/drm/xe/xe_guc_log.c      | 126 +++++++++++----------------
 drivers/gpu/drm/xe/xe_guc_log.h      |  14 ++-
 6 files changed, 80 insertions(+), 109 deletions(-)

-- 
2.34.1

