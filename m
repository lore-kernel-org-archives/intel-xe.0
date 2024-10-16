Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65E5D2F7D1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 22:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B5710E27F;
	Wed, 16 Oct 2024 22:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f9Rc/NR+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165EE10E068
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 22:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729118028; x=1760654028;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oCxxtfJRyuVZJs3jWKWFtpdv6rpFFDVASLFHXpdOhcg=;
 b=f9Rc/NR+kWhmv5cqxe30Dz7YoZZf9AEr88T5af7JZuRfdzmdxk9CwDSg
 l1M6mqpgzh45klAVKgDTuOvqcaqYGR6pJpaRNU3Z8S0uPqthzEJyetBEZ
 gGWqwn8gWNQr6XREL6zpVcgCwC5tWjks0+FJBxFSulTsnfOF7WoZThAgw
 q/M9QYs2MBUp6IZn26VKQ+K8SgDxYQsvOCYZvx+9+H1+PjADotfAmjykx
 noG+PuC5Tyth9ZKEd+o+nOzvIv24LSTUbupMCJJUPOSwJktQdBK7F/44E
 z1EDl/EyWsmgFWL4adp6N5ZYqONqouEh1WvRTNwLnaB4vM7xxnYiYsfpq A==;
X-CSE-ConnectionGUID: GIa5jpteQum/lX5bAMAxeA==
X-CSE-MsgGUID: 2wuiNKqjStmTl1erF3nyZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28539473"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28539473"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 15:33:47 -0700
X-CSE-ConnectionGUID: xRF3aVhBQKGI7dp2H74sPg==
X-CSE-MsgGUID: AJ+DPVSsQAu4btOaIKgArQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; d="scan'208";a="109120408"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 15:33:47 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 Fei Yang <fei.yang@intel.com>
Subject: [PATCH 0/1] drm/xe: enable lite restore
Date: Wed, 16 Oct 2024 15:37:29 -0700
Message-Id: <20241016223730.921963-1-fei.yang@intel.com>
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
unnecessary context switch (flush, save and rstore) if the incoming
context has a ContextID matching that of the outgoing context. The
scheduling is done by the Guc firmware, so on the driver side it's
just a matter of setting corresponding GuC_CTL_FEATURE flag.
This is supposed to be enabled by default, thus the flag is set
unconditionally.

Signed-off-by: Fei Yang <fei.yang@intel.com>

Fei Yang (1):
  drm/xe: enable lite restore

 drivers/gpu/drm/xe/xe_guc.c      | 2 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1

