Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D31C77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 08:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0E010E5AC;
	Fri,  5 May 2023 08:30:57 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEC710E5AE
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 08:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683275456; x=1714811456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ouf93saP0karimptJtrOQ2zPrQFM0MjBeObktWDoKkQ=;
 b=cMwbMLq3VHiQLoygzgp6laiWpaqbnkrpdxbFi3RrnDz3Eria1wKB0Cof
 sX4+NscauxawvkXjdQZ3hxmwpQwyscyFO3ufg4yJZpgAaJoHgJ2aNCfAa
 EAe2mM4bLkrdPjZWq2wGtaGDZplgT6XDcl/T+90/u8L/BlhHZUl0u8O5w
 b1Z1gL71RCiJHXsHUpD8O7y36AYKA9JG/h2NlUzbjRw9aVnFqJVBzUI+0
 qEPQ+mWqDhb4oVFHYlJAoJyA3zyVh/9GVhFYtQ3UVTQSoTX/ync7ye9EX
 ueMIR/Ezz1FtulIixcN4hGr7QIX1OjvSgZ3K+/AF8usUWGiJTyEWb2BMO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328783259"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="328783259"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:30:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943749284"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943749284"
Received: from pklosowski.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.36.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:30:53 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 11:29:44 +0300
Message-Id: <20230505082956.2247875-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505082956.2247875-1-jouni.hogander@intel.com>
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 08/20] drm/xe: Add intel_bo_flush_if_display
 define for Xe
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
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add empty intel_bo_flush_if_display for Xe. This is targeting to get
rid of need for #ifdef I195 when doing
i915_gem_object_flush_if_display during dirtyfb call back.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index d456d913eac9..229fedc8ea72 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -73,4 +73,6 @@ struct xe_bo {
 #define intel_bo_to_drm_bo(bo) ((bo)->ttm.base)
 #define intel_bo_to_i915(bo) to_i915(intel_bo_to_drm_bo(bo).dev)
 
+#define intel_bo_flush_if_display(bo) do { } while (0)
+
 #endif
-- 
2.34.1

